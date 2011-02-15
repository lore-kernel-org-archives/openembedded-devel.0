Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PpRyV-0004Ap-Mk
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 21:58:19 +0100
Received: from gandalf.denix.org ([unknown] [71.251.49.88])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LGO00J81CQF70L8@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	15 Feb 2011 13:56:47 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 31DC314AF6D; Tue,
	15 Feb 2011 14:56:39 -0500 (EST)
Date: Tue, 15 Feb 2011 14:56:39 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110215195639.GA13938@denix.org>
References: <1297786836-18313-1-git-send-email-m-watkins@ti.com>
MIME-version: 1.0
In-reply-to: <1297786836-18313-1-git-send-email-m-watkins@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Melissa Watkins <m-watkins@ti.com>
Subject: Re: [PATCH] ti-pru-sw: Update SRC_REV to 24
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
X-List-Received-Date: Tue, 15 Feb 2011 20:58:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Feb 15, 2011 at 10:20:36AM -0600, Melissa Watkins wrote:
> For the ti-pru-sw-examples, ti-pru-sw-app-loader, ti-pru-sw-edma-driver,
> ti-pru-sw-edma-library:
> 
> * Update SRC_REV to 24
> 
> Signed-off-by: Melissa Watkins <m-watkins@ti.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  recipes/ti/ti-pru-sw-app-loader_1.00.00.bb   |    2 +-
>  recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb  |    2 +-
>  recipes/ti/ti-pru-sw-edma-library_1.00.00.bb |    2 +-
>  recipes/ti/ti-pru-sw-examples_1.00.00.bb     |    2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb b/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb
> index 142c1bc..394c3ab 100644
> --- a/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb
> +++ b/recipes/ti/ti-pru-sw-app-loader_1.00.00.bb
> @@ -7,7 +7,7 @@ COMPATIBLE_MACHINE = "omapl138"
>  
>  SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;proto=https;user=anonymous;pswd=''"
>  
> -SRCREV = "23"
> +SRCREV = "24"
>  S = "${WORKDIR}/trunk/app_loader"
>  
>  TARGET_CC_ARCH += "${LDFLAGS}"
> diff --git a/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb b/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb
> index 1d3676f..bb8fca2 100644
> --- a/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb
> +++ b/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb
> @@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "omapl138"
>  
>  SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;proto=https;user=anonymous;pswd=''"
>  
> -SRCREV = "23"
> +SRCREV = "24"
>  S = "${WORKDIR}/trunk/peripheral_lib/edma_driver/module"
>  
>  PACKAGE_STRIP = "no"
> diff --git a/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb b/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb
> index 02961c7..1a03597 100644
> --- a/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb
> +++ b/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb
> @@ -10,7 +10,7 @@ COMPATIBLE_MACHINE = "omapl138"
>  
>  SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;proto=https;user=anonymous;pswd=''"
>  
> -SRCREV = "23"
> +SRCREV = "24"
>  S = "${WORKDIR}/trunk/peripheral_lib/edma_driver/interface"
>  
>  do_compile () {
> diff --git a/recipes/ti/ti-pru-sw-examples_1.00.00.bb b/recipes/ti/ti-pru-sw-examples_1.00.00.bb
> index d53a288..f5fa8d5 100644
> --- a/recipes/ti/ti-pru-sw-examples_1.00.00.bb
> +++ b/recipes/ti/ti-pru-sw-examples_1.00.00.bb
> @@ -9,7 +9,7 @@ COMPATIBLE_MACHINE = "omapl138"
>  
>  SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;proto=https;user=anonymous;pswd=''"
>  
> -SRCREV = "23"
> +SRCREV = "24"
>  S = "${WORKDIR}/trunk"
>  
>  do_compile () {
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


