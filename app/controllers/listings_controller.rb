class ListingsController < ApplicationController
  
  def index
    @listings = Listing.all
  end
  
  def create
    @listing = Listing.new(listing_params)
    
    if @listing.save
      flash[:success] = "Your ToDo was added."
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def new
    @listing = Listing.new
  end
  
  private
    def listing_params
      params.require(:listing).permit(:description)
    end
end