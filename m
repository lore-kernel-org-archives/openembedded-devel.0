Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QZVhH-0006jB-K8
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 00:14:55 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LN7000TOMUN9NB1@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	22 Jun 2011 16:11:12 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4C88614AF5D; Wed,
	22 Jun 2011 17:11:11 -0400 (EDT)
Date: Wed, 22 Jun 2011 17:11:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110622211111.GH1324@denix.org>
References: <1308769321-26192-1-git-send-email-j-lance1@ti.com>
MIME-version: 1.0
In-reply-to: <1308769321-26192-1-git-send-email-j-lance1@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Jeff Lance <j-lance1@ti.com>
Subject: Re: [PATCH 1/1] matrix-tui: Update to arago toolchain
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
X-List-Received-Date: Wed, 22 Jun 2011 22:14:55 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jun 22, 2011 at 02:02:01PM -0500, Jeff Lance wrote:
> * Modify to use arago MACHINE name for platforms
> * Add all Sitara platforms
> * Update SRCREV to 41
> 
> Signed-off-by: Jeff Lance <j-lance1@ti.com>

Jeff,

See my coments below.


> ---
>  recipes/ti/matrix-tui.inc    |   12 +++---------
>  recipes/ti/matrix-tui_1.1.bb |    4 ++--
>  2 files changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/recipes/ti/matrix-tui.inc b/recipes/ti/matrix-tui.inc
> index 1ad8aa8..a3793d3 100644
> --- a/recipes/ti/matrix-tui.inc
> +++ b/recipes/ti/matrix-tui.inc
> @@ -9,13 +9,6 @@ INC_PR = "r7"
>  
>  COMPATIBLE_MACHINE = "(omapl138|omap3)"
>  
> -PLATFORM_am37x-evm = "am3715"
> -PLATFORM_beagleboard = "am3715"
> -PLATFORM_am3517-evm = "am3517"
> -PLATFORM_am180x-evm = "am180x"
> -PLATFORM_am181x-evm = "am181x"
> -PLATFORM_da850-omapl138-evm = "am180x"
> -
>  SRC_URI = "svn://gforge.ti.com/svn/matrix_tui/;module=trunk;proto=https;user=anonymous;pswd='' \
>  	file://init \
>  "
> @@ -28,7 +21,7 @@ S = "${WORKDIR}/trunk"
>  #INITSCRIPT_PARAMS = "defaults 99"
>  
>  do_configure() {
> -	sed -i -e 's:PATH=${LINUX_DEVKIT_PATH}/arm-none-linux-gnueabi:PATH ?= ${LINUX_DEVKIT_PATH}/arm-none-linux-gnueabi:' makefile.init
> +	sed -i -e 's:PATH=${LINUX_DEVKIT_PATH}/arm-arago-linux-gnueabi:PATH ?= ${LINUX_DEVKIT_PATH}/arm-arago-linux-gnueabi:' makefile.init

I don't think this is needed. The whole point of that sed magic I put in 
there, is to make assignments of TUI_INCLUDE_PATH, XML_INCLUDE_PATH and 
TUI_LIB_PATH conditionally, so they can be overwritten below in the 
do_compile() task...


>  	sed -i -e 's|LIBS :=|LIBS := ${LDFLAGS} |' Release/objects.mk
>  }
>  
> @@ -39,11 +32,12 @@ do_compile() {
>  	export TUI_INCLUDE_PATH=${STAGING_INCDIR}
>  	export XML_INCLUDE_PATH=${STAGING_INCDIR}/libxml2
>  	export TUI_LIB_PATH=${STAGING_LIBDIR}
> +	export PLATFORM=${MACHINE}
>  	make release
>  }
>  
>  do_install() {
> -	export PLATFORM=${PLATFORM}
> +	export PLATFORM=${MACHINE}
>  	make DESTDIR=${D} install
>  	install -d ${D}${sysconfdir}/init.d/
>  	install -c -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/matrix-tui
> diff --git a/recipes/ti/matrix-tui_1.1.bb b/recipes/ti/matrix-tui_1.1.bb
> index 9814d5f..7e95d62 100644
> --- a/recipes/ti/matrix-tui_1.1.bb
> +++ b/recipes/ti/matrix-tui_1.1.bb
> @@ -1,4 +1,4 @@
>  require matrix-tui.inc
>  
> -SRCREV = "37"
> -PR = "${INC_PR}.4"
> +SRCREV = "41"
> +PR = "${INC_PR}.5"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


