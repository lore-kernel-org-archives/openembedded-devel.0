Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OZlIA-000168-IE
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 15:49:34 +0200
Received: from gandalf.denix.org ([unknown] [71.251.56.71])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L5N00ERYL1MYWI5@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	16 Jul 2010 08:48:58 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DE98D14AF60; Fri,
	16 Jul 2010 09:48:57 -0400 (EDT)
Date: Fri, 16 Jul 2010 09:48:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100716134857.GE13471@denix.org>
References: <1279286660-32423-1-git-send-email-chase.maupin@ti.com>
	<1279286660-32423-2-git-send-email-chase.maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1279286660-32423-2-git-send-email-chase.maupin@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>
Subject: Re: [PATCH 2/2] remove dm3730-am3715-evm machine type	references
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
X-List-Received-Date: Fri, 16 Jul 2010 13:49:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Jul 16, 2010 at 08:24:20AM -0500, Chase Maupin wrote:
> * Removed references to the dm3730-am3715-evm machine type
>   and replaced with dm37x-evm and am37x-evm machine types.
> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  contrib/angstrom/sort.sh                           |    2 +-
>  recipes/clutter/clutter.inc                        |    2 +-
>  .../{dm3730-am3715-evm => am37x-evm}/defconfig     |    0
>  .../{dm3730-am3715-evm => dm37x-evm}/defconfig     |    0
>  recipes/linux/linux-omap-psp_2.6.32.bb             |    2 +-
>  recipes/powervr-drivers/libgles-omap3.inc          |    2 +-
>  recipes/ti/ti-dmai_2.05.00.14.bb                   |    2 +-
>  recipes/u-boot/u-boot_git.bb                       |   11 ++++++++---
>  recipes/x-load/x-load_git.bb                       |   11 ++++++++---
>  .../{dm3730-am3715-evm => am37x-evm}/xorg.conf     |    0
>  .../{am3517-evm => dm37x-evm}/xorg.conf            |    0
>  11 files changed, 21 insertions(+), 11 deletions(-)
>  copy recipes/linux/linux-omap-psp-2.6.32/{dm3730-am3715-evm => am37x-evm}/defconfig (100%)
>  rename recipes/linux/linux-omap-psp-2.6.32/{dm3730-am3715-evm => dm37x-evm}/defconfig (100%)
>  rename recipes/xorg-xserver/xserver-xorg-conf/{dm3730-am3715-evm => am37x-evm}/xorg.conf (100%)
>  copy recipes/xorg-xserver/xserver-xorg-conf/{am3517-evm => dm37x-evm}/xorg.conf (100%)
> 
> diff --git a/contrib/angstrom/sort.sh b/contrib/angstrom/sort.sh
> index 9a7615e..eed899d 100755
> --- a/contrib/angstrom/sort.sh
> +++ b/contrib/angstrom/sort.sh
> @@ -60,7 +60,7 @@ case "$arch" in
>  	"armv6-novfp")
>  			machines="htcblackstone htcdiamond htcdream htckaiser htcnike htcpolaris htcraphael htctitan htcvogue" ;;
>  	"armv7a")
> -			machines="am3517-evm archos5 archos5it beagleboard bug20 cm-t35 dm3730-am3715-evm htcleo igep0020 nokia900 omap3517-evm omap3evm omap3-pandora omap3-touchbook omap4430-sdp omapzoom omapzoom2 omapzoom36x overo palmpre omap4430-panda" ;;
> +			machines="am3517-evm archos5 archos5it beagleboard bug20 cm-t35 dm37x-evm am37x-evm htcleo igep0020 nokia900 omap3517-evm omap3evm omap3-pandora omap3-touchbook omap4430-sdp omapzoom omapzoom2 omapzoom36x overo palmpre omap4430-panda" ;;
>  	"avr32")
>  			machines="at32stk1000 atngw100" ;;
>  	"bfin")
> diff --git a/recipes/clutter/clutter.inc b/recipes/clutter/clutter.inc
> index fce3236..3bcf895 100644
> --- a/recipes/clutter/clutter.inc
> +++ b/recipes/clutter/clutter.inc
> @@ -2,7 +2,7 @@ DESCRIPTION = "Clutter graphics library"
>  HOMEPAGE = "http://www.clutter-project.org/"
>  LICENSE = "LGPL"
>  
> -COMPATIBLE_MACHINE = "(zylonite|mx31litekit|omap-3430ldp|omap-3430sdp|mx31ads|qemuarm|qemux86|ipodtouch|am3517-evm|dm3730-am3715-evm|beagleboard|overo|omap3evm|omap5912osk)"
> +COMPATIBLE_MACHINE = "(zylonite|mx31litekit|omap-3430ldp|omap-3430sdp|mx31ads|qemuarm|qemux86|ipodtouch|am3517-evm|dm37x-evm|am37x-evm|beagleboard|overo|omap3evm|omap5912osk)"
>  
>  STDDEPENDS = "virtual/libx11 gtk-doc-native pango glib-2.0 libxfixes gtk+"
>  BASE_CONF = "--disable-gtk-doc ${@get_clutter_fpu_setting(bb, d)}"
> diff --git a/recipes/linux/linux-omap-psp-2.6.32/dm3730-am3715-evm/defconfig b/recipes/linux/linux-omap-psp-2.6.32/am37x-evm/defconfig
> similarity index 100%
> copy from recipes/linux/linux-omap-psp-2.6.32/dm3730-am3715-evm/defconfig
> copy to recipes/linux/linux-omap-psp-2.6.32/am37x-evm/defconfig
> diff --git a/recipes/linux/linux-omap-psp-2.6.32/dm3730-am3715-evm/defconfig b/recipes/linux/linux-omap-psp-2.6.32/dm37x-evm/defconfig
> similarity index 100%
> rename from recipes/linux/linux-omap-psp-2.6.32/dm3730-am3715-evm/defconfig
> rename to recipes/linux/linux-omap-psp-2.6.32/dm37x-evm/defconfig
> diff --git a/recipes/linux/linux-omap-psp_2.6.32.bb b/recipes/linux/linux-omap-psp_2.6.32.bb
> index 1e1562b..ae7429f 100644
> --- a/recipes/linux/linux-omap-psp_2.6.32.bb
> +++ b/recipes/linux/linux-omap-psp_2.6.32.bb
> @@ -3,7 +3,7 @@ require multi-kernel.inc
>  DESCRIPTION = "Linux kernel for OMAP processors"
>  KERNEL_IMAGETYPE = "uImage"
>  
> -COMPATIBLE_MACHINE = "beagleboard|omap3evm|am3517-evm|dm3730-am3715-evm|omap3-touchbook|overo"
> +COMPATIBLE_MACHINE = "beagleboard|omap3evm|am3517-evm|dm37x-evm|am37x-evm|omap3-touchbook|overo"
>  
>  # This is the v2.6.32_OMAPPSP_03.00.01.06 branch
>  SRCREV = "a6bad4464f985fdd3bed72e1b82dcbfc004d7869"
> diff --git a/recipes/powervr-drivers/libgles-omap3.inc b/recipes/powervr-drivers/libgles-omap3.inc
> index f250de0..a570435 100644
> --- a/recipes/powervr-drivers/libgles-omap3.inc
> +++ b/recipes/powervr-drivers/libgles-omap3.inc
> @@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
>  
>  PR = "r5"
>  
> -COMPATIBLE_MACHINE = "(dm3730-am3715-evm|am3517-evm|beagleboard|cm-t35|igep0020|omap3-pandora|omap3-touchbook|omap3evm|omapzoom|omapzoom2|overo|palmpre)"
> +COMPATIBLE_MACHINE = "(dm37x-evm|am37x-evm|am3517-evm|beagleboard|cm-t35|igep0020|omap3-pandora|omap3-touchbook|omap3evm|omapzoom|omapzoom2|overo|palmpre)"
>  
>  DEPENDS = "virtual/libx11 libxau libxdmcp"
>  
> diff --git a/recipes/ti/ti-dmai_2.05.00.14.bb b/recipes/ti/ti-dmai_2.05.00.14.bb
> index 1d49ba7..586ad47 100644
> --- a/recipes/ti/ti-dmai_2.05.00.14.bb
> +++ b/recipes/ti/ti-dmai_2.05.00.14.bb
> @@ -3,7 +3,7 @@ require ti-dmai.inc
>  PV = "2_05_00_14"
>  PR = "r0"
>   
> -COMPATIBLE_MACHINE = "(omap3evm|dm3730-am3715-evm)"
> +COMPATIBLE_MACHINE = "(omap3evm|dm37x-evm|am37x-evm)"
>  
>  SRC_URI_append = " \
>  	file://doxygen_templates.tar.gz \
> diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
> index d67e787..e96b7d2 100644
> --- a/recipes/u-boot/u-boot_git.bb
> +++ b/recipes/u-boot/u-boot_git.bb
> @@ -110,9 +110,14 @@ SRCREV_omap3evm = "c0a8fb217fdca7888d89f9a3dee74a4cec865620"
>  PV_omap3evm = "2009.11+${PR}+gitr${SRCREV}"
>  
>  # ~ TI PSP v2009.11_OMAPPSP_03.00.01.06 (+ couple of commits)
> -SRC_URI_dm3730-am3715-evm = "git://arago-project.org/git/projects/u-boot-omap3.git;protocol=git"
> -SRCREV_dm3730-am3715-evm = "c0a8fb217fdca7888d89f9a3dee74a4cec865620"
> -PV_dm3730-am3715-evm = "2009.11+${PR}+gitr${SRCREV}"
> +SRC_URI_dm37x-evm = "git://arago-project.org/git/projects/u-boot-omap3.git;protocol=git"
> +SRCREV_dm37x-evm = "c0a8fb217fdca7888d89f9a3dee74a4cec865620"
> +PV_dm37x-evm = "2009.11+${PR}+gitr${SRCREV}"
> +
> +# ~ TI PSP v2009.11_OMAPPSP_03.00.01.06 (+ couple of commits)
> +SRC_URI_am37x-evm = "git://arago-project.org/git/projects/u-boot-omap3.git;protocol=git"
> +SRCREV_am37x-evm = "c0a8fb217fdca7888d89f9a3dee74a4cec865620"
> +PV_am37x-evm = "2009.11+${PR}+gitr${SRCREV}"
>  
>  # ~ TI PSP v2009.11_OMAPPSP_03.00.01.06 (+ couple of commits)
>  SRC_URI_am3517-evm = "git://arago-project.org/git/projects/u-boot-omap3.git;protocol=git"
> diff --git a/recipes/x-load/x-load_git.bb b/recipes/x-load/x-load_git.bb
> index c7bb451..9f8c77d 100644
> --- a/recipes/x-load/x-load_git.bb
> +++ b/recipes/x-load/x-load_git.bb
> @@ -30,9 +30,14 @@ SRCREV_omap3evm = "fc6d5be15c703d21aef0ae0b8c02177721f0445f"
>  PV_omap3evm = "1.46+${PR}+gitr${SRCREV}"
>  
>  # TI PSP v1.46_OMAPPSP_03.00.01.06 (Tag is one commit different)
> -SRC_URI_dm3730-am3715-evm = "git://arago-project.org/git/projects/x-load-omap3.git;protocol=git"
> -SRCREV_dm3730-am3715-evm = "fc6d5be15c703d21aef0ae0b8c02177721f0445f"
> -PV_dm3730-am3715-evm = "1.46+${PR}+gitr${SRCREV}"
> +SRC_URI_dm37x-evm = "git://arago-project.org/git/projects/x-load-omap3.git;protocol=git"
> +SRCREV_dm37x-evm = "fc6d5be15c703d21aef0ae0b8c02177721f0445f"
> +PV_dm37x-evm = "1.46+${PR}+gitr${SRCREV}"
> +
> +# TI PSP v1.46_OMAPPSP_03.00.01.06 (Tag is one commit different)
> +SRC_URI_am37x-evm = "git://arago-project.org/git/projects/x-load-omap3.git;protocol=git"
> +SRCREV_am37x-evm = "fc6d5be15c703d21aef0ae0b8c02177721f0445f"
> +PV_am37x-evm = "1.46+${PR}+gitr${SRCREV}"
>  
>  # TI PSP v1.46_OMAPPSP_03.00.01.06 (Tag is one commit different)
>  SRC_URI_am3517-evm = "git://arago-project.org/git/projects/x-load-omap3.git;protocol=git"
> diff --git a/recipes/xorg-xserver/xserver-xorg-conf/dm3730-am3715-evm/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/am37x-evm/xorg.conf
> similarity index 100%
> rename from recipes/xorg-xserver/xserver-xorg-conf/dm3730-am3715-evm/xorg.conf
> rename to recipes/xorg-xserver/xserver-xorg-conf/am37x-evm/xorg.conf
> diff --git a/recipes/xorg-xserver/xserver-xorg-conf/am3517-evm/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/dm37x-evm/xorg.conf
> similarity index 100%
> copy from recipes/xorg-xserver/xserver-xorg-conf/am3517-evm/xorg.conf
> copy to recipes/xorg-xserver/xserver-xorg-conf/dm37x-evm/xorg.conf
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


