Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OGvKh-0006vk-Tb
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 16:42:18 +0200
Received: by pxi14 with SMTP id 14so1792861pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 May 2010 07:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Slv0cyL0K9PcWwmX8suzKSPWYxlbauAtqavGDy5Th7k=;
	b=B7YUT7oh4FcnpMjNTF2ZmcUBCvSjoVAJyk5H9e7eN5V047qjSoUb5wbMLdLTTcNtGE
	nljdzWdtTeCgEATCPfDYwSHG6VOYcUhcYTmR1B/W1EFIO957Da1KoDyRLPo9WgpvkE2d
	HtENN02Hv99zIZEvkqfhB5d/MIzmSoO18NKpM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=TSutstEBZkT++Hwdh3KyC4MW2HLQF/dkEP5xyH+5MKZG4uHYU/w02kpvOmJGfpg2Sp
	eGaRpLLcWQtn4bn623SwDGcDVCBYQTeD1ZRWIZG4Ze5KoBR1QwNLvqzUEMXDtgpR6auI
	pgEM7y0ERDwIskwLA442QyPVdr1r9dWPBFAAY=
Received: by 10.141.100.11 with SMTP id c11mr5331019rvm.106.1274798285761;
	Tue, 25 May 2010 07:38:05 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id l29sm4214973rvb.4.2010.05.25.07.38.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 May 2010 07:38:04 -0700 (PDT)
Date: Tue, 25 May 2010 07:37:57 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100525143757.GC26493@gmail.com>
References: <1274794225-16222-1-git-send-email-Martin.Jansa@gmail.com>
	<1274794225-16222-4-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1274794225-16222-4-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/3] linux-openmoko: rename recipes to common PN_PV scheme and adjust om-gta* machine configs
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
X-List-Received-Date: Tue, 25 May 2010 14:42:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (25/05/10 15:30), Martin Jansa wrote:
> * unify preferred provider and version for om-gta02
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  conf/distro/openmoko.conf                          |    8 -
>  conf/machine/om-3d7k.conf                          |    3 +-
>  conf/machine/om-gta01.conf                         |   12 +--
>  conf/machine/om-gta02.conf                         |   10 +-
>  recipes/linux/linux-openmoko-2.6.24_git.bb         |   28 ----
>  recipes/linux/linux-openmoko-2.6.28_git.bb         |   28 ----
>  .../0007-Enable-UBI-UBIFS.patch                    |  149 ++++++++++++++++++++
>  .../linux/linux-openmoko-2.6.29/fix-install.patch  |   23 +++
>  recipes/linux/linux-openmoko-2.6.32_git.bb         |   46 ------
>  recipes/linux/linux-openmoko-2.6.34_git.bb         |   39 -----
>  .../0007-Enable-UBI-UBIFS.patch                    |  149 --------------------
>  .../linux-openmoko-shr-devel/fix-install.patch     |   23 ---
>  recipes/linux/linux-openmoko-shr-devel_git.bb      |   26 ----
>  recipes/linux/linux-openmoko_2.6.24.bb             |   28 ++++
>  recipes/linux/linux-openmoko_2.6.28.bb             |   28 ++++
>  recipes/linux/linux-openmoko_2.6.29.bb             |   26 ++++
>  recipes/linux/linux-openmoko_2.6.32.bb             |   46 ++++++
>  recipes/linux/linux-openmoko_2.6.34_git            |   39 +++++
>  18 files changed, 347 insertions(+), 364 deletions(-)
>  delete mode 100644 recipes/linux/linux-openmoko-2.6.24_git.bb
>  delete mode 100644 recipes/linux/linux-openmoko-2.6.28_git.bb
>  create mode 100644 recipes/linux/linux-openmoko-2.6.29/0007-Enable-UBI-UBIFS.patch
>  create mode 100644 recipes/linux/linux-openmoko-2.6.29/fix-install.patch
>  delete mode 100644 recipes/linux/linux-openmoko-2.6.32_git.bb
>  delete mode 100644 recipes/linux/linux-openmoko-2.6.34_git.bb
>  delete mode 100644 recipes/linux/linux-openmoko-shr-devel/0007-Enable-UBI-UBIFS.patch
>  delete mode 100644 recipes/linux/linux-openmoko-shr-devel/fix-install.patch
>  delete mode 100644 recipes/linux/linux-openmoko-shr-devel_git.bb
>  create mode 100644 recipes/linux/linux-openmoko_2.6.24.bb
>  create mode 100644 recipes/linux/linux-openmoko_2.6.28.bb
>  create mode 100644 recipes/linux/linux-openmoko_2.6.29.bb
>  create mode 100644 recipes/linux/linux-openmoko_2.6.32.bb
>  create mode 100644 recipes/linux/linux-openmoko_2.6.34_git
> 
> diff --git a/conf/distro/openmoko.conf b/conf/distro/openmoko.conf
> index 81d7075..2b34c40 100644
> --- a/conf/distro/openmoko.conf
> +++ b/conf/distro/openmoko.conf
> @@ -53,14 +53,6 @@ PREFERRED_VERSION_binutils-cross ?= "2.17.50.0.12"
>  # require conf/distro/include/fso-autorev.inc
>  
>  # override the PACKAGE_ARCH of certain packages for openmoko distro
> -#
> -# Same kernel used to run on both these machines...
> -# Currently not used but left here in case someone wants to switch on
> -# quickly
> -#PACKAGE_ARCH_pn-linux-openmoko_om-gta01 = "armv4t"
> -#PACKAGE_ARCH_pn-linux-openmoko_om-gta02 = "armv4t"
> -#PACKAGE_ARCH_pn-linux-openmoko-devel_om-gta01 = "armv4t"
> -#PACKAGE_ARCH_pn-linux-openmoko-devel_om-gta02 = "armv4t"
>  
>  # Same kernel so same usb
>  PACKAGE_ARCH_pn-usb-gadget-mode_om-gta01 = "armv4t"
> diff --git a/conf/machine/om-3d7k.conf b/conf/machine/om-3d7k.conf
> index 95bfd40..229f34c 100644
> --- a/conf/machine/om-3d7k.conf
> +++ b/conf/machine/om-3d7k.conf
> @@ -6,8 +6,9 @@
>  
>  TARGET_ARCH = "arm"
>  
> -PREFERRED_PROVIDER_virtual/kernel ?= "linux-openmoko-devel"
> +PREFERRED_PROVIDER_virtual/kernel ?= "linux-openmoko"
>  PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
> +PREFERRED_VERSION_linux-openmoko ?= "2.6.29"
>  
>  MACHINE_FEATURES = "kernel26 apm alsa bluetooth usbgadget usbhost phone vfat ext2"
>  MACHINE_DISPLAY_WIDTH_PIXELS = "480"
> diff --git a/conf/machine/om-gta01.conf b/conf/machine/om-gta01.conf
> index ede2a20..fddb653 100644
> --- a/conf/machine/om-gta01.conf
> +++ b/conf/machine/om-gta01.conf
> @@ -6,16 +6,10 @@
>  
>  TARGET_ARCH = "arm"
>  
> -PREFERRED_PROVIDER_virtual/kernel ?= "linux-openmoko-2.6.24"
> +PREFERRED_PROVIDER_virtual/kernel ?= "linux-openmoko"
>  PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
> -
> -# If you want to have KMS enabled in default kernel, uncomment linux-openmoko-shr-drm-devel
> -PREFERRED_PROVIDER_virtual/kernel_shr = "linux-openmoko-shr-devel"
> -#PREFERRED_PROVIDER_virtual/kernel_shr = "linux-openmoko-shr-drm-devel"
> -#PREFERRED_PROVIDER_virtual/kernel_shr = "linux-openmoko-2.6.31"
> -#PREFERRED_PROVIDER_virtual/kernel_shr = "linux-openmoko-2.6.32"
> -
> -PREFERRED_PROVIDER_virtual/libgl_shr = "mesa-dri"
> +PREFERRED_VERSION_linux-openmoko ?= "2.6.29"
> +PREFERRED_PROVIDER_virtual/libgl = "mesa-dri"
>  
>  UBOOT_ENTRYPOINT = "30008000"
>  
> diff --git a/conf/machine/om-gta02.conf b/conf/machine/om-gta02.conf
> index 9733269..ae1aa93 100644
> --- a/conf/machine/om-gta02.conf
> +++ b/conf/machine/om-gta02.conf
> @@ -6,15 +6,11 @@
>  
>  TARGET_ARCH = "arm"
>  
> -PREFERRED_PROVIDER_virtual/kernel ?= "linux-openmoko-2.6.28"
> +PREFERRED_PROVIDER_virtual/kernel ?= "linux-openmoko"
>  PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
> +PREFERRED_VERSION_linux-openmoko ?= "2.6.29"
>  
> -# If you want to have KMS enabled in default kernel, uncomment linux-openmoko-shr-drm-devel
> -PREFERRED_PROVIDER_virtual/kernel_shr = "linux-openmoko-shr-devel"
> -#PREFERRED_PROVIDER_virtual/kernel_shr = "linux-openmoko-shr-drm-devel"
> -#PREFERRED_PROVIDER_virtual/kernel_shr = "linux-openmoko-2.6.31"
> -
> -PREFERRED_PROVIDER_virtual/libgl_shr = "mesa-dri"
> +PREFERRED_PROVIDER_virtual/libgl = "mesa-dri"
>  # Override only for shr as it needs mesa-dri_git and ie angstrom has preferred_version set to 7.6
>  MACHINE_DRI_MODULES_shr = "glamo"
>  
> diff --git a/recipes/linux/linux-openmoko-2.6.24_git.bb b/recipes/linux/linux-openmoko-2.6.24_git.bb
> deleted file mode 100644
> index f7f7e32..0000000
> --- a/recipes/linux/linux-openmoko-2.6.24_git.bb
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -require linux.inc
> -require linux-openmoko.inc
> -
> -DESCRIPTION = "The Linux kernel for the Openmoko devices GTA01 (Neo1973) and GTA02 (Neo FreeRunner)"
> -
> -KERNEL_RELEASE = "2.6.24"
> -KERNEL_VERSION = "${KERNEL_RELEASE}"
> -
> -SRCREV = "fb42ce6724576fc173faf8abfb04aa2c36d213b7"
> -OEV = "oe5"
> -PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCPV}"
> -PR = "r1"
> -
> -SRC_URI = "\
> -  git://git.openmoko.org/git/kernel.git;protocol=git;branch=stable \
> -  \
> -  file://0001-squashfs-with-lzma.patch;patch=1 \
> -  file://0002-squashfs-initrd.patch;patch=1 \
> -  file://0003-squashfs-force-O2.patch;patch=1 \
> -  file://0004-squashfs-Kconfig.patch;patch=1 \
> -  file://0005-squashfs-Makefile.patch;patch=1 \
> -  \
> -  file://openwrt-ledtrig-netdev.patch;patch=1 \
> -  file://gta01-fix-battery-class-name.patch;patch=1 \
> -  \
> -  file://defconfig-oe \
> -"
> -S = "${WORKDIR}/git"
> diff --git a/recipes/linux/linux-openmoko-2.6.28_git.bb b/recipes/linux/linux-openmoko-2.6.28_git.bb
> deleted file mode 100644
> index cc5ab90..0000000
> --- a/recipes/linux/linux-openmoko-2.6.28_git.bb
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -require linux.inc
> -require linux-openmoko.inc
> -
> -DESCRIPTION_${PN} = "Linux ${KERNEL_RELEASE} kernel for the Openmoko Neo GSM Smartphones"
> -
> -KERNEL_RELEASE = "2.6.28"
> -KERNEL_VERSION = "${KERNEL_RELEASE}"
> -
> -SRCREV = "8c65792a5c83c76d662a617a7c4e1ae8104bb6a5"
> -OEV = "oe2"
> -PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCPV}"
> -PR = "r0"
> -
> -SRC_URI = "\
> -  git://git.openmoko.org/git/kernel.git;protocol=git;branch=stable \
> -  file://defconfig-oe.patch \
> -"
> -S = "${WORKDIR}/git"
> -
> -CONFIG_NAME_om-gta01 = "gta01_moredrivers_defconfig"
> -CONFIG_NAME_om-gta02 = "gta02_packaging_defconfig"
> -
> -do_configure_prepend() {
> -	install -m 644 ./arch/arm/configs/${CONFIG_NAME} ${WORKDIR}/defconfig-oe
> -	cat ${WORKDIR}/defconfig-oe.patch | patch -p0 -d ${WORKDIR}
> -}
> -
> -
> diff --git a/recipes/linux/linux-openmoko-2.6.29/0007-Enable-UBI-UBIFS.patch b/recipes/linux/linux-openmoko-2.6.29/0007-Enable-UBI-UBIFS.patch
> new file mode 100644
> index 0000000..dd40bc8
> --- /dev/null
> +++ b/recipes/linux/linux-openmoko-2.6.29/0007-Enable-UBI-UBIFS.patch
> @@ -0,0 +1,149 @@
> +From 8f907c17c068beb94264a4a6d40314658a0c1393 Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Sun, 8 Nov 2009 10:58:28 +0100
> +Subject: [PATCH 7/7] Enable UBI/UBIFS
> +
> +---
> + arch/arm/configs/gta02_packaging_defconfig |   39 ++++++++++++++++++++++++++++++---
> + 1 files changed, 35 insertions(+), 4 deletions(-)
> +
> +diff --git a/arch/arm/configs/gta02_packaging_defconfig b/arch/arm/configs/gta02_packaging_defconfig
> +index e17ddc3..7506963 100644
> +--- a/arch/arm/configs/gta02_packaging_defconfig
> ++++ b/arch/arm/configs/gta02_packaging_defconfig
> +@@ -806,7 +806,30 @@ CONFIG_MTD_NAND_S3C2410_HWECC=y
> + #
> + # UBI - Unsorted block images
> + #
> +-# CONFIG_MTD_UBI is not set
> ++CONFIG_MTD_UBI=y
> ++CONFIG_MTD_UBI_WL_THRESHOLD=4096
> ++CONFIG_MTD_UBI_BEB_RESERVE=1
> ++CONFIG_MTD_UBI_GLUEBI=y
> ++
> ++#
> ++# UBI debugging options
> ++#
> ++CONFIG_MTD_UBI_DEBUG=y
> ++# CONFIG_MTD_UBI_DEBUG_MSG is not set
> ++# CONFIG_MTD_UBI_DEBUG_PARANOID is not set
> ++CONFIG_MTD_UBI_DEBUG_DISABLE_BGT=y
> ++# CONFIG_MTD_UBI_DEBUG_USERSPACE_IO is not set
> ++# CONFIG_MTD_UBI_DEBUG_EMULATE_BITFLIPS is not set
> ++# CONFIG_MTD_UBI_DEBUG_EMULATE_WRITE_FAILURES is not set
> ++# CONFIG_MTD_UBI_DEBUG_EMULATE_ERASE_FAILURES is not set
> ++
> ++#
> ++# Additional UBI debugging messages
> ++#
> ++# CONFIG_MTD_UBI_DEBUG_MSG_BLD is not set
> ++# CONFIG_MTD_UBI_DEBUG_MSG_EBA is not set
> ++# CONFIG_MTD_UBI_DEBUG_MSG_WL is not set
> ++# CONFIG_MTD_UBI_DEBUG_MSG_IO is not set
> + # CONFIG_PARPORT is not set
> + CONFIG_BLK_DEV=y
> + # CONFIG_BLK_DEV_COW_COMMON is not set
> +@@ -1877,6 +1900,12 @@ CONFIG_JFFS2_ZLIB=y
> + # CONFIG_JFFS2_LZO is not set
> + CONFIG_JFFS2_RTIME=y
> + # CONFIG_JFFS2_RUBIN is not set
> ++CONFIG_UBIFS_FS=y
> ++# CONFIG_UBIFS_FS_XATTR is not set
> ++# CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
> ++CONFIG_UBIFS_FS_LZO=y
> ++CONFIG_UBIFS_FS_ZLIB=y
> ++# CONFIG_UBIFS_FS_DEBUG is not set
> + CONFIG_CRAMFS=y
> + CONFIG_SQUASHFS=m
> + # CONFIG_SQUASHFS_EMBEDDED is not set
> +@@ -2151,8 +2180,8 @@ CONFIG_CRYPTO_TWOFISH_COMMON=m
> + #
> + # Compression
> + #
> +-CONFIG_CRYPTO_DEFLATE=m
> +-# CONFIG_CRYPTO_LZO is not set
> ++CONFIG_CRYPTO_DEFLATE=y
> ++CONFIG_CRYPTO_LZO=y
> + 
> + #
> + # Random Number Generation
> +@@ -2174,6 +2203,8 @@ CONFIG_CRC32=y
> + CONFIG_LIBCRC32C=m
> + CONFIG_ZLIB_INFLATE=y
> + CONFIG_ZLIB_DEFLATE=y
> ++CONFIG_LZO_COMPRESS=y
> ++CONFIG_LZO_DECOMPRESS=y
> + CONFIG_TEXTSEARCH=y
> + CONFIG_TEXTSEARCH_KMP=m
> + CONFIG_TEXTSEARCH_BM=m
> +diff --git a/arch/arm/configs/gta01_moredrivers_defconfig b/arch/arm/configs/gta01_moredrivers_defconfig
> +index e17ddc3..7506963 100644
> +--- a/arch/arm/configs/gta01_moredrivers_defconfig
> ++++ b/arch/arm/configs/gta01_moredrivers_defconfig
> +@@ -806,7 +806,30 @@ CONFIG_MTD_NAND_S3C2410_HWECC=y
> + #
> + # UBI - Unsorted block images
> + #
> +-# CONFIG_MTD_UBI is not set
> ++CONFIG_MTD_UBI=y
> ++CONFIG_MTD_UBI_WL_THRESHOLD=4096
> ++CONFIG_MTD_UBI_BEB_RESERVE=1
> ++CONFIG_MTD_UBI_GLUEBI=y
> ++
> ++#
> ++# UBI debugging options
> ++#
> ++CONFIG_MTD_UBI_DEBUG=y
> ++# CONFIG_MTD_UBI_DEBUG_MSG is not set
> ++# CONFIG_MTD_UBI_DEBUG_PARANOID is not set
> ++CONFIG_MTD_UBI_DEBUG_DISABLE_BGT=y
> ++# CONFIG_MTD_UBI_DEBUG_USERSPACE_IO is not set
> ++# CONFIG_MTD_UBI_DEBUG_EMULATE_BITFLIPS is not set
> ++# CONFIG_MTD_UBI_DEBUG_EMULATE_WRITE_FAILURES is not set
> ++# CONFIG_MTD_UBI_DEBUG_EMULATE_ERASE_FAILURES is not set
> ++
> ++#
> ++# Additional UBI debugging messages
> ++#
> ++# CONFIG_MTD_UBI_DEBUG_MSG_BLD is not set
> ++# CONFIG_MTD_UBI_DEBUG_MSG_EBA is not set
> ++# CONFIG_MTD_UBI_DEBUG_MSG_WL is not set
> ++# CONFIG_MTD_UBI_DEBUG_MSG_IO is not set
> + # CONFIG_PARPORT is not set
> + CONFIG_BLK_DEV=y
> + # CONFIG_BLK_DEV_COW_COMMON is not set
> +@@ -1877,6 +1900,12 @@ CONFIG_JFFS2_ZLIB=y
> + # CONFIG_JFFS2_LZO is not set
> + CONFIG_JFFS2_RTIME=y
> + # CONFIG_JFFS2_RUBIN is not set
> ++CONFIG_UBIFS_FS=y
> ++# CONFIG_UBIFS_FS_XATTR is not set
> ++# CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
> ++CONFIG_UBIFS_FS_LZO=y
> ++CONFIG_UBIFS_FS_ZLIB=y
> ++# CONFIG_UBIFS_FS_DEBUG is not set
> + CONFIG_CRAMFS=y
> + CONFIG_SQUASHFS=m
> + # CONFIG_SQUASHFS_EMBEDDED is not set
> +@@ -2151,8 +2180,8 @@ CONFIG_CRYPTO_TWOFISH_COMMON=m
> + #
> + # Compression
> + #
> +-CONFIG_CRYPTO_DEFLATE=m
> +-# CONFIG_CRYPTO_LZO is not set
> ++CONFIG_CRYPTO_DEFLATE=y
> ++CONFIG_CRYPTO_LZO=y
> + 
> + #
> + # Random Number Generation
> +@@ -2174,6 +2203,8 @@ CONFIG_CRC32=y
> + CONFIG_LIBCRC32C=m
> + CONFIG_ZLIB_INFLATE=y
> + CONFIG_ZLIB_DEFLATE=y
> ++CONFIG_LZO_COMPRESS=y
> ++CONFIG_LZO_DECOMPRESS=y
> + CONFIG_TEXTSEARCH=y
> + CONFIG_TEXTSEARCH_KMP=m
> + CONFIG_TEXTSEARCH_BM=m
> +-- 
> +1.6.5.2
> diff --git a/recipes/linux/linux-openmoko-2.6.29/fix-install.patch b/recipes/linux/linux-openmoko-2.6.29/fix-install.patch
> new file mode 100644
> index 0000000..b14ca7d
> --- /dev/null
> +++ b/recipes/linux/linux-openmoko-2.6.29/fix-install.patch
> @@ -0,0 +1,23 @@
> +From: Steve Sakoman <steve@sakoman.com>
> +Date: Mon, 18 Aug 2008 16:07:31 +0000 (-0700)
> +Subject: scripts/Makefile.fwinst: add missing space when setting mode in cmd_install
> +X-Git-Url: http://www.sakoman.net/cgi-bin/gitweb.cgi?p=linux-omap-2.6.git;a=commitdiff_plain;h=f039944bdd491cde7327133e9976881d3133ae70
> +
> +scripts/Makefile.fwinst: add missing space when setting mode in cmd_install
> +
> +This was causing build failures on some machines
> +---
> +
> +diff --git a/scripts/Makefile.fwinst b/scripts/Makefile.fwinst
> +index 6bf8e87..fb20532 100644
> +--- a/scripts/Makefile.fwinst
> ++++ b/scripts/Makefile.fwinst
> +@@ -37,7 +37,7 @@
> +        @true
> +
> + quiet_cmd_install = INSTALL $(subst $(srctree)/,,$@)
> +-      cmd_install = $(INSTALL) -m0644 $< $@
> ++      cmd_install = $(INSTALL) -m 0644 $< $@
> +
> + $(installed-fw-dirs):
> +        $(call cmd,mkdir)
> diff --git a/recipes/linux/linux-openmoko-2.6.32_git.bb b/recipes/linux/linux-openmoko-2.6.32_git.bb
> deleted file mode 100644
> index 133e5af..0000000
> --- a/recipes/linux/linux-openmoko-2.6.32_git.bb
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -require linux.inc
> -require linux-openmoko.inc
> -
> -DESCRIPTION_${PN} = "Linux ${KERNEL_RELEASE} kernel for the Openmoko Neo GSM Smartphones"
> -
> -KERNEL_RELEASE="2.6.32.13"
> -
> -SRCREV = "a9254be10ac2294ea20165a87c09ea6afcf66d94"
> -OEV = "oe2"
> -PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCPV}"
> -
> -SRC_URI = "\
> -  git://git.openmoko.org/git/kernel.git;protocol=git;branch=om-gta02-2.6.32 \
> -  file://0001-Revert-s3cmci-initialize-default-platform-data-no_wp.patch;patch=1 \
> -# latest stable patch for ubi fix 943e167cb3e8fb191894bde8a4a75db78531a7c8
> -  ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${KERNEL_RELEASE}.bz2;patch=1;name=stablepatch \
> -# build fix
> -  file://0001-wm8753-fix-build-with-gcc-4.4.2-which-works-ok-with-.patch;patch=1 \
> -# patches from Radek Polak used in qtmoko
> -  file://0002-accels.patch.patch;patch=1 \
> -  file://0003-usbhost.patch.patch;patch=1 \
> -  file://0004-ar6000_delay.patch.patch;patch=1 \
> -  file://0005-save_regs.patch.patch;patch=1 \
> -# defconfig updates
> -  file://0006-gta02-defconfigs-enable-LEDS_S3C24XX-and-dummy-batte.patch;patch=1 \
> -# patches from Weiss's gdrm-for-merging branch
> -  file://0007-DRM-for-platform-devices.patch;patch=1 \
> -  file://0008-Glamo-DRM-and-KMS-driver.patch;patch=1 \
> -  file://0009-Work-on-Glamo-core-for-DRM.patch;patch=1 \
> -  file://0010-JBT6k74-work-for-KMS.patch;patch=1 \
> -  file://0011-Fix-crash-when-reading-Glamo-registers-via-sysfs.patch;patch=1 \
> -  file://0012-Fix-dynamic-command-queue-allocation.patch;patch=1 \
> -  file://0013-Debug-statements-for-testing.patch;patch=1 \
> -  file://0014-Fix-claim-of-2D-register-resource.patch;patch=1 \
> -"
> -
> -SRC_URI[stablepatch.md5sum] = "ba6abb1ffee513a1d4f831599ddae490"
> -SRC_URI[stablepatch.sha256sum] = "baf6dff5d1c478e65decf2e8b704c60e546ea37c4de59ee8eb6af9dd3d63f145"
> -
> -S = "${WORKDIR}/git"
> -
> -CONFIG_NAME_om-gta02 = "gta02_drm_defconfig"
> -
> -do_configure_prepend() {
> -        install -m 644 ./arch/arm/configs/${CONFIG_NAME} ${WORKDIR}/defconfig-oe
> -}
> diff --git a/recipes/linux/linux-openmoko-2.6.34_git.bb b/recipes/linux/linux-openmoko-2.6.34_git.bb
> deleted file mode 100644
> index 6d3b52b..0000000
> --- a/recipes/linux/linux-openmoko-2.6.34_git.bb
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -require linux.inc
> -require linux-openmoko.inc
> -
> -DESCRIPTION_${PN} = "Linux ${KERNEL_RELEASE} kernel for the Openmoko Neo GSM Smartphones"
> -
> -KERNEL_RELEASE="2.6.34"
> -
> -SRCREV = "dd1225cc08c3375bf80289ac1965c724881b149a"
> -OEV = "oe2"
> -PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCPV}"
> -
> -SRC_URI = "\
> -  git://git.openmoko.org/git/kernel.git;protocol=git;branch=om-gta02-2.6.34 \
> -# build fix
> -  file://wm8753-fix-build-with-gcc-4.4.2-which-works-ok-with-.patch;patch=1 \
> -# patches from Thomas White's gdrm-for-merging branch
> -  file://0001-DRM-for-platform-devices.patch;patch=1 \
> -  file://0002-Glamo-DRM-and-KMS-driver.patch;patch=1 \
> -  file://0003-Work-on-Glamo-core-for-DRM.patch;patch=1 \
> -  file://0004-JBT6k74-work-for-KMS.patch;patch=1 \
> -  file://0005-Fix-crash-when-reading-Glamo-registers-via-sysfs.patch;patch=1 \
> -  file://0006-Fix-dynamic-command-queue-allocation.patch;patch=1 \
> -  file://0007-Debug-statements-for-testing.patch;patch=1 \
> -  file://0008-Fix-claim-of-2D-register-resource.patch;patch=1 \
> -  file://0009-Use-unlocked_ioctl-rather-than-ioctl.patch;patch=1 \
> -# patches from Radek Polak used in qtmoko
> -  file://0001-accels.patch.patch;patch=1 \
> -  file://0002-usbhost.patch.patch;patch=1 \
> -  file://0003-ar6000_delay.patch.patch;patch=1 \
> -  file://0004-save_regs.patch.patch;patch=1 \
> -"
> -
> -S = "${WORKDIR}/git"
> -
> -CONFIG_NAME_om-gta02 = "gta02_drm_defconfig"
> -
> -do_configure_prepend() {
> -        install -m 644 ./arch/arm/configs/${CONFIG_NAME} ${WORKDIR}/defconfig-oe
> -}
> diff --git a/recipes/linux/linux-openmoko-shr-devel/0007-Enable-UBI-UBIFS.patch b/recipes/linux/linux-openmoko-shr-devel/0007-Enable-UBI-UBIFS.patch
> deleted file mode 100644
> index dd40bc8..0000000
> --- a/recipes/linux/linux-openmoko-shr-devel/0007-Enable-UBI-UBIFS.patch
> +++ /dev/null
> @@ -1,149 +0,0 @@
> -From 8f907c17c068beb94264a4a6d40314658a0c1393 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Sun, 8 Nov 2009 10:58:28 +0100
> -Subject: [PATCH 7/7] Enable UBI/UBIFS
> -
> ----
> - arch/arm/configs/gta02_packaging_defconfig |   39 ++++++++++++++++++++++++++++++---
> - 1 files changed, 35 insertions(+), 4 deletions(-)
> -
> -diff --git a/arch/arm/configs/gta02_packaging_defconfig b/arch/arm/configs/gta02_packaging_defconfig
> -index e17ddc3..7506963 100644
> ---- a/arch/arm/configs/gta02_packaging_defconfig
> -+++ b/arch/arm/configs/gta02_packaging_defconfig
> -@@ -806,7 +806,30 @@ CONFIG_MTD_NAND_S3C2410_HWECC=y
> - #
> - # UBI - Unsorted block images
> - #
> --# CONFIG_MTD_UBI is not set
> -+CONFIG_MTD_UBI=y
> -+CONFIG_MTD_UBI_WL_THRESHOLD=4096
> -+CONFIG_MTD_UBI_BEB_RESERVE=1
> -+CONFIG_MTD_UBI_GLUEBI=y
> -+
> -+#
> -+# UBI debugging options
> -+#
> -+CONFIG_MTD_UBI_DEBUG=y
> -+# CONFIG_MTD_UBI_DEBUG_MSG is not set
> -+# CONFIG_MTD_UBI_DEBUG_PARANOID is not set
> -+CONFIG_MTD_UBI_DEBUG_DISABLE_BGT=y
> -+# CONFIG_MTD_UBI_DEBUG_USERSPACE_IO is not set
> -+# CONFIG_MTD_UBI_DEBUG_EMULATE_BITFLIPS is not set
> -+# CONFIG_MTD_UBI_DEBUG_EMULATE_WRITE_FAILURES is not set
> -+# CONFIG_MTD_UBI_DEBUG_EMULATE_ERASE_FAILURES is not set
> -+
> -+#
> -+# Additional UBI debugging messages
> -+#
> -+# CONFIG_MTD_UBI_DEBUG_MSG_BLD is not set
> -+# CONFIG_MTD_UBI_DEBUG_MSG_EBA is not set
> -+# CONFIG_MTD_UBI_DEBUG_MSG_WL is not set
> -+# CONFIG_MTD_UBI_DEBUG_MSG_IO is not set
> - # CONFIG_PARPORT is not set
> - CONFIG_BLK_DEV=y
> - # CONFIG_BLK_DEV_COW_COMMON is not set
> -@@ -1877,6 +1900,12 @@ CONFIG_JFFS2_ZLIB=y
> - # CONFIG_JFFS2_LZO is not set
> - CONFIG_JFFS2_RTIME=y
> - # CONFIG_JFFS2_RUBIN is not set
> -+CONFIG_UBIFS_FS=y
> -+# CONFIG_UBIFS_FS_XATTR is not set
> -+# CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
> -+CONFIG_UBIFS_FS_LZO=y
> -+CONFIG_UBIFS_FS_ZLIB=y
> -+# CONFIG_UBIFS_FS_DEBUG is not set
> - CONFIG_CRAMFS=y
> - CONFIG_SQUASHFS=m
> - # CONFIG_SQUASHFS_EMBEDDED is not set
> -@@ -2151,8 +2180,8 @@ CONFIG_CRYPTO_TWOFISH_COMMON=m
> - #
> - # Compression
> - #
> --CONFIG_CRYPTO_DEFLATE=m
> --# CONFIG_CRYPTO_LZO is not set
> -+CONFIG_CRYPTO_DEFLATE=y
> -+CONFIG_CRYPTO_LZO=y
> - 
> - #
> - # Random Number Generation
> -@@ -2174,6 +2203,8 @@ CONFIG_CRC32=y
> - CONFIG_LIBCRC32C=m
> - CONFIG_ZLIB_INFLATE=y
> - CONFIG_ZLIB_DEFLATE=y
> -+CONFIG_LZO_COMPRESS=y
> -+CONFIG_LZO_DECOMPRESS=y
> - CONFIG_TEXTSEARCH=y
> - CONFIG_TEXTSEARCH_KMP=m
> - CONFIG_TEXTSEARCH_BM=m
> -diff --git a/arch/arm/configs/gta01_moredrivers_defconfig b/arch/arm/configs/gta01_moredrivers_defconfig
> -index e17ddc3..7506963 100644
> ---- a/arch/arm/configs/gta01_moredrivers_defconfig
> -+++ b/arch/arm/configs/gta01_moredrivers_defconfig
> -@@ -806,7 +806,30 @@ CONFIG_MTD_NAND_S3C2410_HWECC=y
> - #
> - # UBI - Unsorted block images
> - #
> --# CONFIG_MTD_UBI is not set
> -+CONFIG_MTD_UBI=y
> -+CONFIG_MTD_UBI_WL_THRESHOLD=4096
> -+CONFIG_MTD_UBI_BEB_RESERVE=1
> -+CONFIG_MTD_UBI_GLUEBI=y
> -+
> -+#
> -+# UBI debugging options
> -+#
> -+CONFIG_MTD_UBI_DEBUG=y
> -+# CONFIG_MTD_UBI_DEBUG_MSG is not set
> -+# CONFIG_MTD_UBI_DEBUG_PARANOID is not set
> -+CONFIG_MTD_UBI_DEBUG_DISABLE_BGT=y
> -+# CONFIG_MTD_UBI_DEBUG_USERSPACE_IO is not set
> -+# CONFIG_MTD_UBI_DEBUG_EMULATE_BITFLIPS is not set
> -+# CONFIG_MTD_UBI_DEBUG_EMULATE_WRITE_FAILURES is not set
> -+# CONFIG_MTD_UBI_DEBUG_EMULATE_ERASE_FAILURES is not set
> -+
> -+#
> -+# Additional UBI debugging messages
> -+#
> -+# CONFIG_MTD_UBI_DEBUG_MSG_BLD is not set
> -+# CONFIG_MTD_UBI_DEBUG_MSG_EBA is not set
> -+# CONFIG_MTD_UBI_DEBUG_MSG_WL is not set
> -+# CONFIG_MTD_UBI_DEBUG_MSG_IO is not set
> - # CONFIG_PARPORT is not set
> - CONFIG_BLK_DEV=y
> - # CONFIG_BLK_DEV_COW_COMMON is not set
> -@@ -1877,6 +1900,12 @@ CONFIG_JFFS2_ZLIB=y
> - # CONFIG_JFFS2_LZO is not set
> - CONFIG_JFFS2_RTIME=y
> - # CONFIG_JFFS2_RUBIN is not set
> -+CONFIG_UBIFS_FS=y
> -+# CONFIG_UBIFS_FS_XATTR is not set
> -+# CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
> -+CONFIG_UBIFS_FS_LZO=y
> -+CONFIG_UBIFS_FS_ZLIB=y
> -+# CONFIG_UBIFS_FS_DEBUG is not set
> - CONFIG_CRAMFS=y
> - CONFIG_SQUASHFS=m
> - # CONFIG_SQUASHFS_EMBEDDED is not set
> -@@ -2151,8 +2180,8 @@ CONFIG_CRYPTO_TWOFISH_COMMON=m
> - #
> - # Compression
> - #
> --CONFIG_CRYPTO_DEFLATE=m
> --# CONFIG_CRYPTO_LZO is not set
> -+CONFIG_CRYPTO_DEFLATE=y
> -+CONFIG_CRYPTO_LZO=y
> - 
> - #
> - # Random Number Generation
> -@@ -2174,6 +2203,8 @@ CONFIG_CRC32=y
> - CONFIG_LIBCRC32C=m
> - CONFIG_ZLIB_INFLATE=y
> - CONFIG_ZLIB_DEFLATE=y
> -+CONFIG_LZO_COMPRESS=y
> -+CONFIG_LZO_DECOMPRESS=y
> - CONFIG_TEXTSEARCH=y
> - CONFIG_TEXTSEARCH_KMP=m
> - CONFIG_TEXTSEARCH_BM=m
> --- 
> -1.6.5.2
> diff --git a/recipes/linux/linux-openmoko-shr-devel/fix-install.patch b/recipes/linux/linux-openmoko-shr-devel/fix-install.patch
> deleted file mode 100644
> index b14ca7d..0000000
> --- a/recipes/linux/linux-openmoko-shr-devel/fix-install.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -From: Steve Sakoman <steve@sakoman.com>
> -Date: Mon, 18 Aug 2008 16:07:31 +0000 (-0700)
> -Subject: scripts/Makefile.fwinst: add missing space when setting mode in cmd_install
> -X-Git-Url: http://www.sakoman.net/cgi-bin/gitweb.cgi?p=linux-omap-2.6.git;a=commitdiff_plain;h=f039944bdd491cde7327133e9976881d3133ae70
> -
> -scripts/Makefile.fwinst: add missing space when setting mode in cmd_install
> -
> -This was causing build failures on some machines
> ----
> -
> -diff --git a/scripts/Makefile.fwinst b/scripts/Makefile.fwinst
> -index 6bf8e87..fb20532 100644
> ---- a/scripts/Makefile.fwinst
> -+++ b/scripts/Makefile.fwinst
> -@@ -37,7 +37,7 @@
> -        @true
> -
> - quiet_cmd_install = INSTALL $(subst $(srctree)/,,$@)
> --      cmd_install = $(INSTALL) -m0644 $< $@
> -+      cmd_install = $(INSTALL) -m 0644 $< $@
> -
> - $(installed-fw-dirs):
> -        $(call cmd,mkdir)
> diff --git a/recipes/linux/linux-openmoko-shr-devel_git.bb b/recipes/linux/linux-openmoko-shr-devel_git.bb
> deleted file mode 100644
> index 8753d65..0000000
> --- a/recipes/linux/linux-openmoko-shr-devel_git.bb
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -require linux.inc
> -require linux-openmoko.inc
> -
> -DESCRIPTION_${PN} = "Linux ${KERNEL_VERSION} kernel for the Openmoko Neo GSM Smartphones"
> -
> -KERNEL_RELEASE = "2.6.29"
> -KERNEL_VERSION = "2.6.29-rc3"
> -
> -SRCREV = "973a41fce60e5f6edfcf0eaf94056a57eee65e16"
> -OMV = "oe11"
> -PV = "${KERNEL_RELEASE}-${OMV}+gitr${SRCPV}"
> -PR = "r8"
> -
> -SRC_URI = "\
> -  git://git.openmoko.org/git/kernel.git;protocol=git;branch=andy-tracking \
> -  file://fix-install.patch;patch=1 \
> -  file://0007-Enable-UBI-UBIFS.patch;patch=1 \
> -"
> -S = "${WORKDIR}/git"
> -
> -CONFIG_NAME_om-gta01 = "gta01_moredrivers_defconfig"
> -CONFIG_NAME_om-gta02 = "gta02_packaging_defconfig"
> -
> -do_configure_prepend() { 
> -	install -m 644 ./arch/arm/configs/${CONFIG_NAME} ${WORKDIR}/defconfig-oe
> -}
> diff --git a/recipes/linux/linux-openmoko_2.6.24.bb b/recipes/linux/linux-openmoko_2.6.24.bb
> new file mode 100644
> index 0000000..f7f7e32
> --- /dev/null
> +++ b/recipes/linux/linux-openmoko_2.6.24.bb
> @@ -0,0 +1,28 @@
> +require linux.inc
> +require linux-openmoko.inc
> +
> +DESCRIPTION = "The Linux kernel for the Openmoko devices GTA01 (Neo1973) and GTA02 (Neo FreeRunner)"
> +
> +KERNEL_RELEASE = "2.6.24"
> +KERNEL_VERSION = "${KERNEL_RELEASE}"
> +
> +SRCREV = "fb42ce6724576fc173faf8abfb04aa2c36d213b7"
> +OEV = "oe5"
> +PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCPV}"
> +PR = "r1"
> +
> +SRC_URI = "\
> +  git://git.openmoko.org/git/kernel.git;protocol=git;branch=stable \
> +  \
> +  file://0001-squashfs-with-lzma.patch;patch=1 \
> +  file://0002-squashfs-initrd.patch;patch=1 \
> +  file://0003-squashfs-force-O2.patch;patch=1 \
> +  file://0004-squashfs-Kconfig.patch;patch=1 \
> +  file://0005-squashfs-Makefile.patch;patch=1 \
> +  \
> +  file://openwrt-ledtrig-netdev.patch;patch=1 \
> +  file://gta01-fix-battery-class-name.patch;patch=1 \
> +  \
> +  file://defconfig-oe \
> +"
> +S = "${WORKDIR}/git"
> diff --git a/recipes/linux/linux-openmoko_2.6.28.bb b/recipes/linux/linux-openmoko_2.6.28.bb
> new file mode 100644
> index 0000000..cc5ab90
> --- /dev/null
> +++ b/recipes/linux/linux-openmoko_2.6.28.bb
> @@ -0,0 +1,28 @@
> +require linux.inc
> +require linux-openmoko.inc
> +
> +DESCRIPTION_${PN} = "Linux ${KERNEL_RELEASE} kernel for the Openmoko Neo GSM Smartphones"
> +
> +KERNEL_RELEASE = "2.6.28"
> +KERNEL_VERSION = "${KERNEL_RELEASE}"
> +
> +SRCREV = "8c65792a5c83c76d662a617a7c4e1ae8104bb6a5"
> +OEV = "oe2"
> +PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCPV}"
> +PR = "r0"
> +
> +SRC_URI = "\
> +  git://git.openmoko.org/git/kernel.git;protocol=git;branch=stable \
> +  file://defconfig-oe.patch \
> +"
> +S = "${WORKDIR}/git"
> +
> +CONFIG_NAME_om-gta01 = "gta01_moredrivers_defconfig"
> +CONFIG_NAME_om-gta02 = "gta02_packaging_defconfig"
> +
> +do_configure_prepend() {
> +	install -m 644 ./arch/arm/configs/${CONFIG_NAME} ${WORKDIR}/defconfig-oe
> +	cat ${WORKDIR}/defconfig-oe.patch | patch -p0 -d ${WORKDIR}
> +}
> +
> +
> diff --git a/recipes/linux/linux-openmoko_2.6.29.bb b/recipes/linux/linux-openmoko_2.6.29.bb
> new file mode 100644
> index 0000000..8753d65
> --- /dev/null
> +++ b/recipes/linux/linux-openmoko_2.6.29.bb
> @@ -0,0 +1,26 @@
> +require linux.inc
> +require linux-openmoko.inc
> +
> +DESCRIPTION_${PN} = "Linux ${KERNEL_VERSION} kernel for the Openmoko Neo GSM Smartphones"
> +
> +KERNEL_RELEASE = "2.6.29"
> +KERNEL_VERSION = "2.6.29-rc3"
> +
> +SRCREV = "973a41fce60e5f6edfcf0eaf94056a57eee65e16"
> +OMV = "oe11"
> +PV = "${KERNEL_RELEASE}-${OMV}+gitr${SRCPV}"
> +PR = "r8"
> +
> +SRC_URI = "\
> +  git://git.openmoko.org/git/kernel.git;protocol=git;branch=andy-tracking \
> +  file://fix-install.patch;patch=1 \
> +  file://0007-Enable-UBI-UBIFS.patch;patch=1 \
> +"
> +S = "${WORKDIR}/git"
> +
> +CONFIG_NAME_om-gta01 = "gta01_moredrivers_defconfig"
> +CONFIG_NAME_om-gta02 = "gta02_packaging_defconfig"
> +
> +do_configure_prepend() { 
> +	install -m 644 ./arch/arm/configs/${CONFIG_NAME} ${WORKDIR}/defconfig-oe
> +}
> diff --git a/recipes/linux/linux-openmoko_2.6.32.bb b/recipes/linux/linux-openmoko_2.6.32.bb
> new file mode 100644
> index 0000000..133e5af
> --- /dev/null
> +++ b/recipes/linux/linux-openmoko_2.6.32.bb
> @@ -0,0 +1,46 @@
> +require linux.inc
> +require linux-openmoko.inc
> +
> +DESCRIPTION_${PN} = "Linux ${KERNEL_RELEASE} kernel for the Openmoko Neo GSM Smartphones"
> +
> +KERNEL_RELEASE="2.6.32.13"
> +
> +SRCREV = "a9254be10ac2294ea20165a87c09ea6afcf66d94"
> +OEV = "oe2"
> +PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCPV}"
> +
> +SRC_URI = "\
> +  git://git.openmoko.org/git/kernel.git;protocol=git;branch=om-gta02-2.6.32 \
> +  file://0001-Revert-s3cmci-initialize-default-platform-data-no_wp.patch;patch=1 \
> +# latest stable patch for ubi fix 943e167cb3e8fb191894bde8a4a75db78531a7c8
> +  ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${KERNEL_RELEASE}.bz2;patch=1;name=stablepatch \
> +# build fix
> +  file://0001-wm8753-fix-build-with-gcc-4.4.2-which-works-ok-with-.patch;patch=1 \
> +# patches from Radek Polak used in qtmoko
> +  file://0002-accels.patch.patch;patch=1 \
> +  file://0003-usbhost.patch.patch;patch=1 \
> +  file://0004-ar6000_delay.patch.patch;patch=1 \
> +  file://0005-save_regs.patch.patch;patch=1 \
> +# defconfig updates
> +  file://0006-gta02-defconfigs-enable-LEDS_S3C24XX-and-dummy-batte.patch;patch=1 \
> +# patches from Weiss's gdrm-for-merging branch
> +  file://0007-DRM-for-platform-devices.patch;patch=1 \
> +  file://0008-Glamo-DRM-and-KMS-driver.patch;patch=1 \
> +  file://0009-Work-on-Glamo-core-for-DRM.patch;patch=1 \
> +  file://0010-JBT6k74-work-for-KMS.patch;patch=1 \
> +  file://0011-Fix-crash-when-reading-Glamo-registers-via-sysfs.patch;patch=1 \
> +  file://0012-Fix-dynamic-command-queue-allocation.patch;patch=1 \
> +  file://0013-Debug-statements-for-testing.patch;patch=1 \
> +  file://0014-Fix-claim-of-2D-register-resource.patch;patch=1 \
> +"
> +
> +SRC_URI[stablepatch.md5sum] = "ba6abb1ffee513a1d4f831599ddae490"
> +SRC_URI[stablepatch.sha256sum] = "baf6dff5d1c478e65decf2e8b704c60e546ea37c4de59ee8eb6af9dd3d63f145"
> +
> +S = "${WORKDIR}/git"
> +
> +CONFIG_NAME_om-gta02 = "gta02_drm_defconfig"
> +
> +do_configure_prepend() {
> +        install -m 644 ./arch/arm/configs/${CONFIG_NAME} ${WORKDIR}/defconfig-oe
> +}
> diff --git a/recipes/linux/linux-openmoko_2.6.34_git b/recipes/linux/linux-openmoko_2.6.34_git
> new file mode 100644
> index 0000000..6d3b52b
> --- /dev/null
> +++ b/recipes/linux/linux-openmoko_2.6.34_git
> @@ -0,0 +1,39 @@
> +require linux.inc
> +require linux-openmoko.inc
> +
> +DESCRIPTION_${PN} = "Linux ${KERNEL_RELEASE} kernel for the Openmoko Neo GSM Smartphones"
> +
> +KERNEL_RELEASE="2.6.34"
> +
> +SRCREV = "dd1225cc08c3375bf80289ac1965c724881b149a"
> +OEV = "oe2"
> +PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCPV}"
> +
> +SRC_URI = "\
> +  git://git.openmoko.org/git/kernel.git;protocol=git;branch=om-gta02-2.6.34 \
> +# build fix
> +  file://wm8753-fix-build-with-gcc-4.4.2-which-works-ok-with-.patch;patch=1 \
> +# patches from Thomas White's gdrm-for-merging branch
> +  file://0001-DRM-for-platform-devices.patch;patch=1 \
> +  file://0002-Glamo-DRM-and-KMS-driver.patch;patch=1 \
> +  file://0003-Work-on-Glamo-core-for-DRM.patch;patch=1 \
> +  file://0004-JBT6k74-work-for-KMS.patch;patch=1 \
> +  file://0005-Fix-crash-when-reading-Glamo-registers-via-sysfs.patch;patch=1 \
> +  file://0006-Fix-dynamic-command-queue-allocation.patch;patch=1 \
> +  file://0007-Debug-statements-for-testing.patch;patch=1 \
> +  file://0008-Fix-claim-of-2D-register-resource.patch;patch=1 \
> +  file://0009-Use-unlocked_ioctl-rather-than-ioctl.patch;patch=1 \
> +# patches from Radek Polak used in qtmoko
> +  file://0001-accels.patch.patch;patch=1 \
> +  file://0002-usbhost.patch.patch;patch=1 \
> +  file://0003-ar6000_delay.patch.patch;patch=1 \
> +  file://0004-save_regs.patch.patch;patch=1 \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +CONFIG_NAME_om-gta02 = "gta02_drm_defconfig"
> +
> +do_configure_prepend() {
> +        install -m 644 ./arch/arm/configs/${CONFIG_NAME} ${WORKDIR}/defconfig-oe
> +}
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


