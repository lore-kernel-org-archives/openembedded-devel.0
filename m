Received: from vms173015pub.verizon.net ([206.46.173.15])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OytUL-0006Nv-Mv
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 23:37:59 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L9700AFUYQFBGV3@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	23 Sep 2010 16:37:40 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3E22214AF64; Thu,
	23 Sep 2010 17:37:27 -0400 (EDT)
Date: Thu, 23 Sep 2010 17:37:27 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100923213727.GA17898@denix.org>
References: <1285247687-25731-1-git-send-email-chase.maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1285247687-25731-1-git-send-email-chase.maupin@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.15
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] matrix-gui-common: update to latest sources
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
X-List-Received-Date: Thu, 23 Sep 2010 21:37:59 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Sep 23, 2010 at 08:14:45AM -0500, Chase Maupin wrote:
> From: Jeff Lance <j-lance1@ti.com>
> 
> * Updated to use repository revision 131
>     * This includes platform support
> * Removed the browser binary
> * Copy files based on PLATFORM
> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> Signed-off-by: Jeff Lance <j-lance1@ti.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/ti/matrix-gui-common/browser |   20 ----------------
>  recipes/ti/matrix-gui-common_svn.bb  |   42 +++++++++++++---------------------
>  2 files changed, 16 insertions(+), 46 deletions(-)
>  delete mode 100644 recipes/ti/matrix-gui-common/browser
> 
> diff --git a/recipes/ti/matrix-gui-common/browser b/recipes/ti/matrix-gui-common/browser
> deleted file mode 100644
> index b5202d5..0000000
> --- a/recipes/ti/matrix-gui-common/browser
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -#!/bin/sh
> -
> -BROWSERDIR=""
> -BROWSERAPP="browser"
> -
> -#Check if DISPLAY is set.  If so we assume we are running in X11
> -#and will call the X11 version of the browser if it exists.
> -if [ "$DISPLAY" == "" ]
> -then
> -    BROWSERDIR="/usr/bin/qtopia/demos/browser"
> -else
> -    BROWSERDIR="/usr/bin/qt4/demos/browser"
> -fi
> -
> -if [ -e "$BROWSERDIR/$BROWSERAPP" ]
> -then
> -    cd $BROWSERDIR
> -    ./$BROWSERAPP
> -fi
> -
> diff --git a/recipes/ti/matrix-gui-common_svn.bb b/recipes/ti/matrix-gui-common_svn.bb
> index 43d6b0c..6452e15 100644
> --- a/recipes/ti/matrix-gui-common_svn.bb
> +++ b/recipes/ti/matrix-gui-common_svn.bb
> @@ -4,44 +4,34 @@ LICENSE = "BSD"
>  SECTION = "multimedia"
>  PRIORITY = "optional"
>  
> -SRCREV = "58"
> -PV = "1.0"
> -PR = "r1+svnr${SRCPV}"
> +SRCREV = "131"
> +PV = "1.1"
> +PR = "r2+svnr${SRCPV}"
> +
> +PLATFORM_dm365 = "dm365"
> +PLATFORM_da850-omapl138-evm = "omapl138"
> +PLATFORM_omap3evm = "omap3530"
> +PLATFORM_dm37x-evm = "dm3730"
> +PLATFORM_am37x-evm = "am3715"
> +PLATFORM_beagleboard = "am3715"
> +PLATFORM ?= "<UNDEFINED>"
>  
>  #Checkout the project repository to get access to the scripts and data
>  #files.
> -SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd='' \
> -    file://browser \
> -"
> +SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd='' "
>  
>  S = "${WORKDIR}/trunk"
>  
> -MATRIX_EXTRA_BINS = " \
> -    memInfo \
> -    networkSettings \
> -    runOGLES2Coverflow \
> -    runOGLES2Shaders \
> -    runOGLESChameleonMan \
> -    runOGLESVase \
> -    setopp1 \
> -    setopp2 \
> -    setopp3 \
> -    setopp4 \
> -    standby \
> -    sysSettings \
> -    taskInfo \
> -"
> +PACKAGE_ARCH = ${MACHINE_ARCH}
>  
>  do_install() {
>      install -d ${D}/${bindir}
> -    for i in ${MATRIX_EXTRA_BINS}; do
> -        install -m 0755 ${S}/bin/${i} ${D}/${bindir}
> -    done
> -    install -m 0755 ${WORKDIR}/browser ${D}/${bindir}
> +    install -m 0755 ${S}/${PLATFORM}/bin/* ${D}/${bindir}/
>      install -d ${D}/${datadir}/matrix/html
> -    install -m 0644 ${S}/*.html ${D}/${datadir}/matrix/html/
> +    install -m 0644 ${S}/${PLATFORM}/html/* ${D}/${datadir}/matrix/html
>      install -d ${D}/${datadir}/matrix/images
>      install -m 0644 ${S}/images/*.png ${D}/${datadir}/matrix/images/
> +
>  }
>  
>  FILES_${PN} += "${datadir}/matrix/*"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


