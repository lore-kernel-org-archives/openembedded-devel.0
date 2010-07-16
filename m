Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OZlHB-0000zh-DH
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 15:48:31 +0200
Received: from gandalf.denix.org ([unknown] [71.251.56.71])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L5N00448L0ARFS6@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	16 Jul 2010 08:48:10 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EE15E14AF60; Fri,
	16 Jul 2010 09:48:09 -0400 (EDT)
Date: Fri, 16 Jul 2010 09:48:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100716134809.GD13471@denix.org>
References: <1279286660-32423-1-git-send-email-chase.maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1279286660-32423-1-git-send-email-chase.maupin@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>
Subject: Re: [PATCH 1/2] dm3730-am3715-evm: split machine type into two
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
X-List-Received-Date: Fri, 16 Jul 2010 13:48:31 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Jul 16, 2010 at 08:24:19AM -0500, Chase Maupin wrote:
> * Split the dm3730-am3715-evm machine type into two separate
>   machines.  These are dm37x-evm and am37x-evm.
> * This split will allow for being able to distiguish different
>   MACHINE_FEATURES in the future such as whether the machine has
>   a DSP or not.  This will allow for cleaner task creation.
> * In order to be able to choose the proper collateral and software
>   such as documentation and codecs we need machine types that
>   differentiate product lines (i.e. AM vs DM) and product
>   families (i.e. 37x vs 35x).  This change allows enough
>   differentiation to chose proper collateral without
>   requiring a machine type for every derivative chip.
> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  conf/machine/am37x-evm.conf         |   53 +++++++++++++++++++++++++++++++++++
>  conf/machine/dm3730-am3715-evm.conf |   53 -----------------------------------
>  conf/machine/dm37x-evm.conf         |   53 +++++++++++++++++++++++++++++++++++
>  3 files changed, 106 insertions(+), 53 deletions(-)
>  create mode 100644 conf/machine/am37x-evm.conf
>  delete mode 100644 conf/machine/dm3730-am3715-evm.conf
>  create mode 100644 conf/machine/dm37x-evm.conf
> 
> diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
> new file mode 100644
> index 0000000..fb10efd
> --- /dev/null
> +++ b/conf/machine/am37x-evm.conf
> @@ -0,0 +1,53 @@
> +#@TYPE: Machine
> +#@NAME: AM37x EVM
> +#@DESCRIPTION: Machine configuration for the TI AM37x EVM
> +TARGET_ARCH = "arm"
> +
> +PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
> +XSERVER = "xserver-xorg \
> +           xf86-input-evdev \
> +           xf86-input-mouse \
> +           xf86-input-tslib \
> +           xf86-video-omapfb \
> +           xf86-input-keyboard"
> +
> +GUI_MACHINE_CLASS = "smallscreen"
> +
> +require conf/machine/include/omap3.inc
> +
> +# Ship all kernel modules
> +
> +IMAGE_FSTYPES ?= "jffs2 tar.bz2"
> +EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
> +
> +SERIAL_CONSOLE = "115200 ttyS0"
> +USE_VT = "0"
> +
> +PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
> +
> +PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
> +PREFERRED_VERSION_u-boot = "git"
> +
> +UBOOT_ARCH = "arm"
> +UBOOT_MACHINE = "omap3_evm_config"
> +XLOAD_MACHINE = "omap3evm_config"
> +
> +MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen"
> +
> +# NOTE: there are NAND and OneNAND versions of this board...
> +
> +# do ubiattach /dev/ubi_ctrl -m 4
> +# From dmesg:
> +# UBI: smallest flash I/O unit:    2048
> +# UBI: logical eraseblock size:    129024 bytes
> +# from ubiattach stdout:
> +# UBI device number 0, total 1996 LEBs
> +MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"
> +
> +# do ubiattach /dev/ubi_ctrl -m 4
> +# from dmesg:
> +# UBI: smallest flash I/O unit:    2048
> +# UBI: physical eraseblock size:   131072 bytes (128 KiB)
> +# UBI: sub-page size:              512
> +UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
> +
> diff --git a/conf/machine/dm3730-am3715-evm.conf b/conf/machine/dm3730-am3715-evm.conf
> deleted file mode 100644
> index 32aa65a..0000000
> --- a/conf/machine/dm3730-am3715-evm.conf
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: DM37x/AM37x EVM
> -#@DESCRIPTION: Machine configuration for the TI DM37x/AM37x EVM
> -TARGET_ARCH = "arm"
> -
> -PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
> -XSERVER = "xserver-xorg \
> -           xf86-input-evdev \
> -           xf86-input-mouse \
> -           xf86-input-tslib \
> -           xf86-video-omapfb \
> -           xf86-input-keyboard"
> -
> -GUI_MACHINE_CLASS = "smallscreen"
> -
> -require conf/machine/include/omap3.inc
> -
> -# Ship all kernel modules
> -
> -IMAGE_FSTYPES ?= "jffs2 tar.bz2"
> -EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
> -
> -SERIAL_CONSOLE = "115200 ttyS0"
> -USE_VT = "0"
> -
> -PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
> -
> -PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
> -PREFERRED_VERSION_u-boot = "git"
> -
> -UBOOT_ARCH = "arm"
> -UBOOT_MACHINE = "omap3_evm_config"
> -XLOAD_MACHINE = "omap3evm_config"
> -
> -MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen"
> -
> -# NOTE: there are NAND and OneNAND versions of this board...
> -
> -# do ubiattach /dev/ubi_ctrl -m 4
> -# From dmesg:
> -# UBI: smallest flash I/O unit:    2048
> -# UBI: logical eraseblock size:    129024 bytes
> -# from ubiattach stdout:
> -# UBI device number 0, total 1996 LEBs
> -MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"
> -
> -# do ubiattach /dev/ubi_ctrl -m 4
> -# from dmesg:
> -# UBI: smallest flash I/O unit:    2048
> -# UBI: physical eraseblock size:   131072 bytes (128 KiB)
> -# UBI: sub-page size:              512
> -UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
> -
> diff --git a/conf/machine/dm37x-evm.conf b/conf/machine/dm37x-evm.conf
> new file mode 100644
> index 0000000..c9b9ca2
> --- /dev/null
> +++ b/conf/machine/dm37x-evm.conf
> @@ -0,0 +1,53 @@
> +#@TYPE: Machine
> +#@NAME: DM37x EVM
> +#@DESCRIPTION: Machine configuration for the TI DM37x EVM
> +TARGET_ARCH = "arm"
> +
> +PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
> +XSERVER = "xserver-xorg \
> +           xf86-input-evdev \
> +           xf86-input-mouse \
> +           xf86-input-tslib \
> +           xf86-video-omapfb \
> +           xf86-input-keyboard"
> +
> +GUI_MACHINE_CLASS = "smallscreen"
> +
> +require conf/machine/include/omap3.inc
> +
> +# Ship all kernel modules
> +
> +IMAGE_FSTYPES ?= "jffs2 tar.bz2"
> +EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
> +
> +SERIAL_CONSOLE = "115200 ttyS0"
> +USE_VT = "0"
> +
> +PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
> +
> +PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
> +PREFERRED_VERSION_u-boot = "git"
> +
> +UBOOT_ARCH = "arm"
> +UBOOT_MACHINE = "omap3_evm_config"
> +XLOAD_MACHINE = "omap3evm_config"
> +
> +MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen"
> +
> +# NOTE: there are NAND and OneNAND versions of this board...
> +
> +# do ubiattach /dev/ubi_ctrl -m 4
> +# From dmesg:
> +# UBI: smallest flash I/O unit:    2048
> +# UBI: logical eraseblock size:    129024 bytes
> +# from ubiattach stdout:
> +# UBI device number 0, total 1996 LEBs
> +MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"
> +
> +# do ubiattach /dev/ubi_ctrl -m 4
> +# from dmesg:
> +# UBI: smallest flash I/O unit:    2048
> +# UBI: physical eraseblock size:   131072 bytes (128 KiB)
> +# UBI: sub-page size:              512
> +UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
> +
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


