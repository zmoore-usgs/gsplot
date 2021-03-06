#' gsplot points
#'
#' Creates points on gsplot.   See \code{\link[graphics]{points}} for more details.
#' 
#' @details Additional graphical parameter inputs:
#' \itemize{
#'  \item{\code{x}} {vector indicating the x-coordinate(s) of the plot point(s)}
#'  \item{\code{y}} {vector indicating the y-coordinate(s) of the plot point(s)}
#'  \item{\code{xlim}} {vector containing the lower and upper limit for the x-axis}
#'  \item{\code{ylim}} {vector containing the lower and upper limit for the y-axis}
#'  \item{\code{col, pch}} {parameters describing the color and type of point, respectively}
#'  \item{\code{legend.name}} {name that appears in the legend, see \code{\link{legend}} for more legend parameters}
#'  \item{\code{error_bar}} {add error bars to the defined points, see \code{\link{error_bar}} 
#'  for arguments, must add arguments as a list}
#'  \item{\code{callouts}} {add callouts and text to the defined points, see \code{\link{callouts}} 
#'  for arguments, must add arguments as a list}
#'   }
#' 
#' @param object gsplot object
#' @param \dots Further graphical parameters may also be supplied as arguments. See 'Details'.
#' @seealso \code{\link[graphics]{points}}
#' @examples
#' gs <- gsplot()
#' gsNew <- points(gs, y=1, x=2, col="blue", pch=18,frame.plot=FALSE)
#' gsNew <- points(gsNew, c(3,4,3), c(2,4,6), ylim=c(0,10))
#' gsNew
#' 
#' gs <- gsplot() %>% 
#'          points(x=1:5, y=1:5, xlim=c(0,10), ylim=c(0,10), 
#'                callouts(labels=c(rep(NA, 4), "oh")), 
#'                error_bar(offset.up=1))
#' gs
#' 
#' gs2 <- gsplot() %>%
#'          points(1:5, c(1,10,100,1000,10000), log="y", las=1) %>%
#'          axis(side=c(2,4), labels=FALSE, n.minor=4)
#'          
#' gs2
#' 
#' gs <- points(gsplot(), c(0,3), c(2,4), callouts(labels=c('dogs','cats')))
#' gs
#' @importFrom lazyeval lazy_dots lazy_eval
#' @export
points <- function(object, ...) {
  override("graphics", "points", object, ...)
}

points.gsplot <- function(object, ..., legend.name=NULL, side=c(1,2)){
  fun.name <- 'points'
  object <- gather_function_info(object, fun.name, ..., legend.name=legend.name, side=side)
  return(object)
}
