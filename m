Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1N5vQ5-00025p-TA
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 07:02:09 +0100
Received: from gandalf.denix.org ([71.251.63.147]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KSM00F9AGP0OWWB@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	05 Nov 2009 00:00:37 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4C96614AF60; Thu,
	05 Nov 2009 01:00:36 -0500 (EST)
Date: Thu, 05 Nov 2009 01:00:36 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091105060036.GF30116@denix.org>
References: <1257337925-46801-1-git-send-email-koen@dominion.thruhere.net>
	<1257337925-46801-2-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1257337925-46801-2-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.7
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Koen Kooi <koen@openembedded.org>, Koen Kooi <k-kooi@ti.com>
Subject: Re: [STABLE][PATCH 2/3] xserver-xorg-conf: add omap3517-evm	support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Nov 2009 06:02:09 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Nov 04, 2009 at 01:32:04PM +0100, Koen Kooi wrote:
> From: Koen Kooi <koen@openembedded.org>
> 
> * This fixes the "blank screen" problem Frank Walzer reported
> 
> Signed-off-by: Koen Kooi <k-kooi@ti.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  .../xserver-xorg-conf/omap3517-evm/xorg.conf       |   29 ++++++++++++++++++++
>  recipes/xorg-xserver/xserver-xorg-conf_0.1.bb      |    2 +-
>  2 files changed, 30 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/xorg-xserver/xserver-xorg-conf/omap3517-evm/xorg.conf
> 
> diff --git a/recipes/xorg-xserver/xserver-xorg-conf/omap3517-evm/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/omap3517-evm/xorg.conf
> new file mode 100644
> index 0000000..983bb08
> --- /dev/null
> +++ b/recipes/xorg-xserver/xserver-xorg-conf/omap3517-evm/xorg.conf
> @@ -0,0 +1,29 @@
> +Section "Module"                                       
> +        Load    "extmod"                                
> +        Load    "dbe"                           
> +        Load    "glx"                                           
> +        Load    "freetype"                             
> +        Load    "type1"                        
> +        Load    "record"                    
> +        Load    "dri"                       
> +EndSection                            
> +
> +Section "Monitor"                                                                    
> +        Identifier      "Builtin Default Monitor"
> +EndSection                                       
> +
> +Section "Device"                                  
> +        Identifier      "Builtin Default fbdev Device 0"
> +        Driver  "omapfb"
> +EndSection                                                
> +
> +Section "Screen"                                        
> +        Identifier      "Builtin Default fbdev Screen 0"     
> +        Device  "Builtin Default fbdev Device 0"            
> +        Monitor "Builtin Default Monitor"               
> +EndSection                                              
> +
> +Section "ServerLayout"                                 
> +        Identifier      "Builtin Default Layout"                                     
> +        Screen  "Builtin Default fbdev Screen 0"        
> +EndSection                                              
> diff --git a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
> index 95aa82b..67fc683 100644
> --- a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
> +++ b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "Machine specific xorg.conf files"
> -PR = "r4"
> +PR = "r5"
>  
>  SRC_URI = "file://xorg.conf"
>  
> -- 
> 1.6.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


