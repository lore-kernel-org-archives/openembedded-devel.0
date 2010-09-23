Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OytUc-0006OF-Vv
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 23:38:17 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L9700D7OYQYCD0F@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	23 Sep 2010 16:37:51 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C6FE714AF64; Thu,
	23 Sep 2010 17:37:45 -0400 (EDT)
Date: Thu, 23 Sep 2010 17:37:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100923213745.GB17898@denix.org>
References: <1285247687-25731-1-git-send-email-chase.maupin@ti.com>
	<1285247687-25731-2-git-send-email-chase.maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1285247687-25731-2-git-send-email-chase.maupin@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] matrix-gui-e: updating to latest source	revision
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
X-List-Received-Date: Thu, 23 Sep 2010 21:38:17 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Sep 23, 2010 at 08:14:46AM -0500, Chase Maupin wrote:
> From: Jeff Lance <j-lance1@ti.com>
> 
> * Updated recipe to use the latest source revision 131
> * Included platform support
> * Removed init files from OE repository since they are now part
>   of the matrix repository.
> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> Signed-off-by: Jeff Lance <j-lance1@ti.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/ti/matrix-gui-e/dm365-evm/init |   29 --------------------------
>  recipes/ti/matrix-gui-e/init           |   35 --------------------------------
>  recipes/ti/matrix-gui-e_svn.bb         |   25 ++++++++++++++++------
>  3 files changed, 18 insertions(+), 71 deletions(-)
>  delete mode 100755 recipes/ti/matrix-gui-e/dm365-evm/init
>  delete mode 100755 recipes/ti/matrix-gui-e/init
> 
> diff --git a/recipes/ti/matrix-gui-e/dm365-evm/init b/recipes/ti/matrix-gui-e/dm365-evm/init
> deleted file mode 100755
> index d860ad9..0000000
> --- a/recipes/ti/matrix-gui-e/dm365-evm/init
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -#! /bin/sh
> -matrixgui="/usr/bin/matrix_guiE"
> -GUI_OPTS="-qws -geometry 720x480+0+10 -display transformed:Rot0 /usr/share/matrix/html/menu_main.html"
> -
> -test -x "$matrixgui" || exit 0
> -
> -case "$1" in
> -  start)
> -
> -    chvt 4
> -
> -    # switch to component 480p mode
> -    echo 480P-60 > /sys/class/davinci_display/ch0/mode
> -    echo COMPONENT > /sys/class/davinci_display/ch0/output
> -    echo -n "Starting Matrix GUI application"
> -    start-stop-daemon --start --quiet --background --pidfile /var/run/matrix-gui-e.pid --exec $matrixgui -- $GUI_OPTS
> -    echo "."
> -    ;;
> -  stop)
> -    echo -n "Stopping Matrix GUI application"
> -    start-stop-daemon --stop --quiet --pidfile /var/run/matrix-gui-e.pid
> -    echo "."
> -    ;;
> -  *)
> -    echo "Usage: /etc/init.d/matrix-gui-e {start|stop}"
> -    exit 1
> -esac
> -
> -exit 0
> diff --git a/recipes/ti/matrix-gui-e/init b/recipes/ti/matrix-gui-e/init
> deleted file mode 100755
> index 266fdca..0000000
> --- a/recipes/ti/matrix-gui-e/init
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -#! /bin/sh
> -
> -matrixgui="/usr/bin/matrix_guiE"
> -GUI_OPTS="-qws -display transformed:Rot90 /usr/share/matrix/html/menu_main.html"
> -
> -test -x "$matrixgui" || exit 0
> -
> -export TSLIB_TSDEVICE=/dev/input/touchscreen0
> -export QWS_MOUSE_PROTO=Tslib:/dev/input/touchscreen0
> -
> -case "$1" in
> -  start)
> -
> -    chvt 4
> -
> -    if [ ! -f /etc/pointercal ] ; then
> -        echo -n "Calibrating touchscreen (first time only)"
> -        ts_calibrate
> -        echo "."
> -    fi
> -    echo -n "Starting Matrix GUI application"
> -    start-stop-daemon --start --quiet --background --pidfile /var/run/matrix-gui-e.pid --exec $matrixgui -- $GUI_OPTS
> -    echo "."
> -    ;;
> -  stop)
> -    echo -n "Stopping Matrix GUI application"
> -    start-stop-daemon --stop --quiet --pidfile /var/run/matrix-gui-e.pid
> -    echo "."
> -    ;;
> -  *)
> -    echo "Usage: /etc/init.d/matrix-gui-e {start|stop}"
> -    exit 1
> -esac
> -
> -exit 0
> diff --git a/recipes/ti/matrix-gui-e_svn.bb b/recipes/ti/matrix-gui-e_svn.bb
> index 35abd25..3e0a171 100644
> --- a/recipes/ti/matrix-gui-e_svn.bb
> +++ b/recipes/ti/matrix-gui-e_svn.bb
> @@ -4,13 +4,19 @@ LICENSE = "BSD"
>  SECTION = "multimedia"
>  PRIORITY = "optional"
>  
> -SRCREV = "58"
> -PV = "1.0"
> -PR = "r16+svnr${SRCPV}"
> +SRCREV = "131"
> +PV = "1.1"
> +PR = "r17+svnr${SRCPV}"
>  
> -SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd='' \
> -	file://init \
> -"
> +PLATFORM_dm365 = "dm365"
> +PLATFORM_da850-omapl138-evm = "omapl138"
> +PLATFORM_omap3evm = "omap3530"
> +PLATFORM_dm37x-evm = "dm3730"
> +PLATFORM_am37x-evm = "am3715"
> +PLATFORM_beagleboard = "am3715"
> +PLATFORM ?= "<UNDEFINED>"
> +
> +SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd='' "
>  
>  S = "${WORKDIR}/trunk"
>  
> @@ -18,13 +24,18 @@ INITSCRIPT_NAME = "matrix-gui-e"
>  INITSCRIPT_PARAMS = "defaults 99"
>  #INITSCRIPT_PARAMS = "start 99 3 . stop 99 3 ."
>  
> +CXXFLAGS_da850-omapl138-evm_append = " -DPlatform_omapl138 "
> +CXXFLAGS_dm365_append = " -DPlatform_dm365 "
> +PACKAGE_ARCH = ${MACHINE_ARCH}
> +
>  inherit qt4e update-rc.d
>  
>  do_install() {
>  	install -d ${D}/${bindir}
>  	install -m 0755 ${S}/matrix_gui ${D}/${bindir}/matrix_guiE
>  	install -d ${D}${sysconfdir}/init.d/
> -	install -c -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/matrix-gui-e
> +	install -c -m 0755 ${S}/${PLATFORM}/etc/init ${D}${sysconfdir}/init.d/matrix-gui-e
> +
>  }
>  
>  RRECOMMENDS_${PN} = "qt4-embedded-plugin-mousedriver-tslib qt4-embedded-fonts"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


