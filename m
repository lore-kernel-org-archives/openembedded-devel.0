Received: from [216.168.135.167] (helo=sanddollar.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1MGb7j-0003ZL-SW
	for openembedded-devel@openembedded.org; Tue, 16 Jun 2009 18:03:02 +0200
Received: (qmail 4102 invoked by uid 1003); 16 Jun 2009 15:52:36 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 16 Jun 2009 15:52:35 -0000
Message-ID: <4A37BFC2.4040201@balister.org>
Date: Tue, 16 Jun 2009 11:52:34 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1245167160-2871-1-git-send-email-philip@balister.org>
In-Reply-To: <1245167160-2871-1-git-send-email-philip@balister.org>
Subject: Re: [PATCH] [STABLE]u-boot_git.bb : Update recipe from .dev
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
X-List-Received-Date: Tue, 16 Jun 2009 16:03:29 -0000
X-Groupsio-MsgNum: 11293
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms040008040606030002010702"

--------------ms040008040606030002010702
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This is for stable/2009. Still working out git-send-email ...

Philip

Philip Balister wrote:
> Updates u-boot revision for omap3 machines. Adds support for overo and
> several TI davinci boards. Adds support for mini2440 and micro2440 machines.
> Add afeb9260 machine.
> 
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  recipes/u-boot/files/dss2.patch                    |   61 ++++++++++++++++++
>  recipes/u-boot/files/fw-env.patch                  |   12 ++++
>  .../u-boot-git/afeb9260/AFEB9260-network-fix.patch |   40 ++++++++++++
>  recipes/u-boot/u-boot_git.bb                       |   68 +++++++++++++++++---
>  4 files changed, 172 insertions(+), 9 deletions(-)
>  create mode 100644 recipes/u-boot/files/dss2.patch
>  create mode 100644 recipes/u-boot/files/fw-env.patch
>  create mode 100644 recipes/u-boot/u-boot-git/afeb9260/AFEB9260-network-fix.patch
> 
> diff --git a/recipes/u-boot/files/dss2.patch b/recipes/u-boot/files/dss2.patch
> new file mode 100644
> index 0000000..4dfc5d6
> --- /dev/null
> +++ b/recipes/u-boot/files/dss2.patch
> @@ -0,0 +1,61 @@
> +diff --git a/include/configs/omap3_overo.h b/include/configs/omap3_overo.h
> +index dee0417..2f8a952 100644
> +--- a/include/configs/omap3_overo.h
> ++++ b/include/configs/omap3_overo.h
> +@@ -149,14 +149,21 @@
> + #define CONFIG_EXTRA_ENV_SETTINGS \
> + 	"loadaddr=0x82000000\0" \
> + 	"console=ttyS2,115200n8\0" \
> +-	"videomode=1024x768@60,vxres=1024,vyres=768\0" \
> +-	"videospec=omapfb:vram:2M,vram:4M\0" \
> ++	"vram=12M\0" \
> ++	"dvimode=1024x768MR-16@60\0" \
> ++	"defaultdisplay=dvi\0" \
> + 	"mmcargs=setenv bootargs console=${console} " \
> +-		"video=${videospec},mode:${videomode} " \
> ++		"vram=${vram} " \
> ++		"omapfb.mode=dvi:${dvimode} " \
> ++		"omapfb.debug=y " \
> ++		"omapdss.def_disp=${defaultdisplay} " \
> + 		"root=/dev/mmcblk0p2 rw " \
> + 		"rootfstype=ext3 rootwait\0" \
> + 	"nandargs=setenv bootargs console=${console} " \
> +-		"video=${videospec},mode:${videomode} " \
> ++		"vram=${vram} " \
> ++		"omapfb.mode=dvi:${dvimode} " \
> ++		"omapfb.debug=y " \
> ++		"omapdss.def_disp=${defaultdisplay} " \
> + 		"root=/dev/mtdblock4 rw " \
> + 		"rootfstype=jffs2\0" \
> + 	"loadbootscript=fatload mmc 0 ${loadaddr} boot.scr\0" \
> +diff --git a/include/configs/omap3_beagle.h b/include/configs/omap3_beagle.h
> +index dee0417..2f8a952 100644
> +--- a/include/configs/omap3_beagle.h
> ++++ b/include/configs/omap3_beagle.h
> +@@ -149,14 +149,21 @@
> + #define CONFIG_EXTRA_ENV_SETTINGS \
> + 	"loadaddr=0x82000000\0" \
> + 	"console=ttyS2,115200n8\0" \
> +-	"videomode=1024x768@60,vxres=1024,vyres=768\0" \
> +-	"videospec=omapfb:vram:2M,vram:4M\0" \
> ++	"vram=12M\0" \
> ++	"dvimode=1024x768MR-16@60\0" \
> ++	"defaultdisplay=dvi\0" \
> + 	"mmcargs=setenv bootargs console=${console} " \
> +-		"video=${videospec},mode:${videomode} " \
> ++		"vram=${vram} " \
> ++		"omapfb.mode=dvi:${dvimode} " \
> ++		"omapfb.debug=y " \
> ++		"omapdss.def_disp=${defaultdisplay} " \
> + 		"root=/dev/mmcblk0p2 rw " \
> + 		"rootfstype=ext3 rootwait\0" \
> + 	"nandargs=setenv bootargs console=${console} " \
> +-		"video=${videospec},mode:${videomode} " \
> ++		"vram=${vram} " \
> ++		"omapfb.mode=dvi:${dvimode} " \
> ++		"omapfb.debug=y " \
> ++		"omapdss.def_disp=${defaultdisplay} " \
> + 		"root=/dev/mtdblock4 rw " \
> + 		"rootfstype=jffs2\0" \
> + 	"loadbootscript=fatload mmc 0 ${loadaddr} boot.scr\0" \
> +
> diff --git a/recipes/u-boot/files/fw-env.patch b/recipes/u-boot/files/fw-env.patch
> new file mode 100644
> index 0000000..f3dd335
> --- /dev/null
> +++ b/recipes/u-boot/files/fw-env.patch
> @@ -0,0 +1,12 @@
> +--- git/tools/env/fw_env.config.orig	2009-02-04 09:42:50.000000000 -0700
> ++++ git/tools/env/fw_env.config	2009-02-04 14:25:09.000000000 -0700
> +@@ -4,8 +4,4 @@
> + # Notice, that the "Number of sectors" is ignored on NOR.
> + 
> + # MTD device name	Device offset	Env. size	Flash sector size	Number of sectors
> +-/dev/mtd1		0x0000		0x4000		0x4000
> +-/dev/mtd2		0x0000		0x4000		0x4000
> +-
> +-# NAND example
> +-#/dev/mtd0		0x4000		0x4000		0x20000			2
> ++/dev/mtd2		0x0000		0x20000		0x40000
> diff --git a/recipes/u-boot/u-boot-git/afeb9260/AFEB9260-network-fix.patch b/recipes/u-boot/u-boot-git/afeb9260/AFEB9260-network-fix.patch
> new file mode 100644
> index 0000000..ffd2f02
> --- /dev/null
> +++ b/recipes/u-boot/u-boot-git/afeb9260/AFEB9260-network-fix.patch
> @@ -0,0 +1,40 @@
> +From d0a09ac9587fbfc19970456e17f0ecc957a5549b Mon Sep 17 00:00:00 2001
> +From: Sergey Lapin <slapin@ossfans.org>
> +Date: Tue, 12 May 2009 01:12:50 +0400
> +Subject: [PATCH] AFEB9260 network fix
> +
> +Signed-off-by: Sergey Lapin <slapin@ossfans.org>
> +---
> + board/afeb9260/afeb9260.c             |    2 +-
> + cpu/arm926ejs/at91/at91sam9260_macb.c |    2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/board/afeb9260/afeb9260.c b/board/afeb9260/afeb9260.c
> +index 024db2b..a247663 100644
> +--- a/board/afeb9260/afeb9260.c
> ++++ b/board/afeb9260/afeb9260.c
> +@@ -177,7 +177,7 @@ int board_eth_init(bd_t *bis)
> + {
> + 	int rc = 0;
> + #ifdef CONFIG_MACB
> +-	rc = macb_eth_initialize(0, (void *)AT91SAM9260_BASE_EMAC, 0x00);
> ++	rc = macb_eth_initialize(0, (void *)AT91SAM9260_BASE_EMAC, 0x01);
> + #endif
> + 	return rc;
> + }
> +diff --git a/cpu/arm926ejs/at91/at91sam9260_macb.c b/cpu/arm926ejs/at91/at91sam9260_macb.c
> +index ab60fb7..ea5e767 100644
> +--- a/cpu/arm926ejs/at91/at91sam9260_macb.c
> ++++ b/cpu/arm926ejs/at91/at91sam9260_macb.c
> +@@ -47,7 +47,7 @@ void at91_macb_hw_init(void)
> + 	at91_set_B_periph(AT91_PIN_PA25, 0);	/* ERX2 */
> + 	at91_set_B_periph(AT91_PIN_PA26, 0);	/* ERX3 */
> + 	at91_set_B_periph(AT91_PIN_PA27, 0);	/* ERXCK */
> +-#if defined(CONFIG_AT91SAM9260EK)
> ++#if defined(CONFIG_AT91SAM9260EK) || defined(CONFIG_AFEB9260)
> + 	/*
> + 	 * use PA10, PA11 for ETX2, ETX3.
> + 	 * PA23 and PA24 are for TWI EEPROM
> +-- 
> +1.5.6.5
> +
> diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
> index e5a8d5d..12ebcfe 100644
> --- a/recipes/u-boot/u-boot_git.bb
> +++ b/recipes/u-boot/u-boot_git.bb
> @@ -1,26 +1,62 @@
>  require u-boot.inc
> -PR ="r22"
> +PR ="r26"
> +
> +FILESPATHPKG =. "u-boot-git:"
>  
>  SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git "
>  SRCREV_davinci-sffsdr = "4b50cd12a3b3c644153c4cf393f4a4c12289e5aa"
> -SRCREV_davinci-dvevm = "4b50cd12a3b3c644153c4cf393f4a4c12289e5aa"
>  SRCREV_akita = "9bf86baaa3b35b25baa2d664e2f7f6cafad689ee"
>  SRCREV_spitz = "9bf86baaa3b35b25baa2d664e2f7f6cafad689ee"
>  SRCREV_c7x0 = "9bf86baaa3b35b25baa2d664e2f7f6cafad689ee"
> -SRCREV_afeb9260 = "2077e348c2a84901022ad95311b47b70361e6daa"
> +SRCREV_afeb9260 = "6b8edfde22acc574b5532e9f086e6a7287a9bc78"
> +SRCREV_afeb9260-180 = "6b8edfde22acc574b5532e9f086e6a7287a9bc78"
> +SRC_URI_append_afeb9260 = " file://AFEB9260-network-fix.patch;patch=1"
> +SRC_URI_append_afeb9260-180 = " file://AFEB9260-network-fix.patch;patch=1"
>  
> -SRC_URI_beagleboard = "git://www.sakoman.net/git/u-boot-omap3.git;branch=omap3-dev;protocol=git" 
> -SRCREV_beagleboard = "b7038cff739684bb95853eb5bee924c2574a222e"
> -PV_beagleboard = "2008.10+${PR}+gitr${SRCREV}"
> +SRC_URI_beagleboard = "git://gitorious.org/u-boot-omap3/mainline.git;branch=omap3-dev;protocol=git \
> +                 file://fw-env.patch;patch=1 \
> +                 file://dss2.patch;patch=1 \
> +"
> +SRCREV_beagleboard = "d363f9cb0918a1b6b92e2e20d01543d0c4f53274"
> +PV_beagleboard = "2009.05+${PR}+gitr${SRCREV}"
>  
> -SRC_URI_omap3evm = "git://www.sakoman.net/git/u-boot-omap3.git;branch=omap3;protocol=git" 
> -SRCREV_omap3evm = "1e329ec630b31803ee191d2ee335214662b5bfea"
> -PV_omap3evm = "2008.10+${PR}+gitr${SRCREV}"
> +SRC_URI_omap3evm = "git://gitorious.org/u-boot-omap3/mainline.git;branch=omap3-dev;protocol=git"
> +SRCREV_omap3evm = "2dea1db2a3b7c12ed70bbf8ee50755089c5e5170"
> +PV_omap3evm = "2009.03+${PR}+gitr${SRCREV}"
>  
>  SRC_URI_omapzoom = "git://www.sakoman.net/git/u-boot-omap3.git;branch=omap3-dev;protocol=git"
>  SRCREV_omapzoom = "d691b424f1f5bf7eea3a4131dfc578d272e8f335"
>  PV_omapzoom = "2009.01+${PR}+gitr${SRCREV}"
>  
> +SRC_URI_overo = "git://gitorious.org/u-boot-omap3/mainline.git;branch=omap3-dev;protocol=git \
> +                 file://fw-env.patch;patch=1 \
> +                 file://dss2.patch;patch=1 \
> +"
> +SRCREV_overo = "2dea1db2a3b7c12ed70bbf8ee50755089c5e5170"
> +PV_overo = "2009.03+${PR}+gitr${SRCREV}"
> +
> +SRC_URI_dm6446-evm = "git://arago-project.org/git/people/sandeep/u-boot-davinci.git;protocol=git"
> +SRCREV_dm6446-evm = "6dc7c97635b46ed00117e326d16d092a963fb6d4"
> +PV_dm6446-evm = "2009.05+2009.06-rc0+${PR}+gitr${SRCREV}"
> +
> +SRC_URI_dm6467-evm = "git://arago-project.org/git/people/sandeep/u-boot-davinci.git;protocol=git"
> +SRCREV_dm6467-evm = "6dc7c97635b46ed00117e326d16d092a963fb6d4"
> +PV_dm6467-evm = "2009.05+2009.06-rc0+${PR}+gitr${SRCREV}"
> +
> +SRC_URI_dm355-evm = "git://arago-project.org/git/people/sandeep/u-boot-davinci.git;protocol=git"
> +SRCREV_dm355-evm = "6dc7c97635b46ed00117e326d16d092a963fb6d4"
> +PV_dm355-evm = "2009.05+2009.06-rc0+${PR}+gitr${SRCREV}"
> +
> +SRC_URI_dm365-evm = "git://arago-project.org/git/people/sandeep/u-boot-davinci.git;protocol=git"
> +SRCREV_dm365-evm = "6dc7c97635b46ed00117e326d16d092a963fb6d4"
> +PV_dm365-evm = "2009.05+2009.06-rc0+${PR}+gitr${SRCREV}"
> +
> +SRC_URI_dm355-leopard = "git://www.denx.de/git/u-boot-arm.git;protocol=git;branch=next \
> +                        file://leopardboard-support.patch;patch=1 \
> +"
> +SRCREV_dm355-leopard = "86d5c98d3d97d631b1d3a5f5e6a17e87c99b42cf"
> +PV_dm355-leopard = "2009.05+2009.06-rc2+gitr${SRCREV}"
> +
>  SRC_URI_neuros-osd2 = "git://github.com/neuros/u-boot.git;protocol=git;branch=neuros"
>  SRCREV_neuros-osd2 = "8de979d346624c0e4cfe2e5c0f08ce20ca4b5d14"
>  
> @@ -30,6 +66,12 @@ SRCREV_sequoa = "cf3b41e0c1111dbb865b6e34e9f3c3d3145a6093"
>  SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git "
>  SRC_URI_sequoia = "git://www.denx.de/git/u-boot.git;protocol=git;tag=cf3b41e0c1111dbb865b6e34e9f3c3d3145a6093 "
>  
> +SRC_URI_mini2440 = "git://repo.or.cz/u-boot-openmoko/mini2440.git;protocol=git;branch=dev-mini2440-stable"
> +SRCREV_mini2440 = "3516c35fb777ca959e5cadf2156a792ca10e1cff"
> +
> +SRC_URI_micro2440 = "git://repo.or.cz/u-boot-openmoko/mini2440.git;protocol=git;branch=dev-mini2440-stable"
> +SRCREV_micro2440 = "3516c35fb777ca959e5cadf2156a792ca10e1cff"
> +
>  SRC_URI_neuros-osd2 += "file://Makefile-fix.patch;patch=1"
>  SRC_URI_append_akita = "file://pdaXrom-u-boot.patch;patch=1 \
>                          file://uboot-eabi-fix-HACK2.patch;patch=1 \
> @@ -58,3 +100,11 @@ do_configure_prepend_spitz() {
>  do_configure_prepend_c7x0() {
>          sed -i s:ROOT_FLASH_SIZE:${ROOT_FLASH_SIZE}:g ${S}/include/configs/corgi.h
>  }
> +
> +do_deploy_prepend_mini2440() {
> +	cp ${S}/u-boot-nand16k.bin ${S}/u-boot.bin
> +}
> +
> +do_deploy_prepend_micro2440() {
> +	cp ${S}/u-boot-nand16k.bin ${S}/u-boot.bin
> +}

--------------ms040008040606030002010702
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJRTCCAv0w
ggJmoAMCAQICECwlen/oUcoDd1VrNqKp/fwwDQYJKoZIhvcNAQEFBQAwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA5MDQxNTAwNDQ1OFoXDTEwMDQxNTAwNDQ1
OFowYjERMA8GA1UEBBMIQmFsaXN0ZXIxDzANBgNVBCoTBlBoaWxpcDEYMBYGA1UEAxMPUGhpbGlw
IEJhbGlzdGVyMSIwIAYJKoZIhvcNAQkBFhNwaGlsaXBAYmFsaXN0ZXIub3JnMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAx5Xoie8CV9dJeiaiKRdylvicHE9Aha6f9/CLlVs+Ezob7fIu
Ra4P9ugzZZ2VCtPMQU3Qsjw35mVmYaKXB1U+fZeffbyad6OJEIK1jhqBIz5jtJMc/YWXn/bRmqCl
MfTCgilUMOcsfiHAbmLVhYiNbEhOuy6vWdxSSolHqVa/IHE72qqjhoYWHd+5XVfx1c4jW+CePNMQ
EHxjCzuD+wq6Mzle72dXw+bnyIpG99hB26uNmV//h5iz1VmJU63FZWynSjG79NcY9+mTWXeX213V
V6kJ2wce2rETbYvKQ7err6NnZnG/tiwGI1M7fQqQAti+CkDciLJ129LO+APVYZQgEwIDAQABozAw
LjAeBgNVHREEFzAVgRNwaGlsaXBAYmFsaXN0ZXIub3JnMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcN
AQEFBQADgYEAIUyDAPIEniN6SUdbDiBqi2dtITdnkoUItm/tX9TRn66P0VtWug7k7xjo6piWRE7B
ZwhihotNY0ZnjlK+h0VorxfY63B5tarRB6qJ7f26ukmpltwWWLDB2hWFoKUCn6PE2NTdj+1xNinh
ZNQHy4GyygXjlVfVSn/ZnaGJ31z4PK0wggL9MIICZqADAgECAhAsJXp/6FHKA3dVazaiqf38MA0G
CSqGSIb3DQEBBQUAMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAo
UHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTAe
Fw0wOTA0MTUwMDQ0NThaFw0xMDA0MTUwMDQ0NThaMGIxETAPBgNVBAQTCEJhbGlzdGVyMQ8wDQYD
VQQqEwZQaGlsaXAxGDAWBgNVBAMTD1BoaWxpcCBCYWxpc3RlcjEiMCAGCSqGSIb3DQEJARYTcGhp
bGlwQGJhbGlzdGVyLm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMeV6InvAlfX
SXomoikXcpb4nBxPQIWun/fwi5VbPhM6G+3yLkWuD/boM2WdlQrTzEFN0LI8N+ZlZmGilwdVPn2X
n328mnejiRCCtY4agSM+Y7STHP2Fl5/20ZqgpTH0woIpVDDnLH4hwG5i1YWIjWxITrsur1ncUkqJ
R6lWvyBxO9qqo4aGFh3fuV1X8dXOI1vgnjzTEBB8Yws7g/sKujM5Xu9nV8Pm58iKRvfYQdurjZlf
/4eYs9VZiVOtxWVsp0oxu/TXGPfpk1l3l9td1VepCdsHHtqxE22LykO3q6+jZ2Zxv7YsBiNTO30K
kALYvgpA3IiyddvSzvgD1WGUIBMCAwEAAaMwMC4wHgYDVR0RBBcwFYETcGhpbGlwQGJhbGlzdGVy
Lm9yZzAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBQUAA4GBACFMgwDyBJ4jeklHWw4gaotnbSE3
Z5KFCLZv7V/U0Z+uj9FbVroO5O8Y6OqYlkROwWcIYoaLTWNGZ45SvodFaK8X2OtwebWq0Qeqie39
urpJqZbcFliwwdoVhaClAp+jxNjU3Y/tcTYp4WTUB8uBssoF45VX1Up/2Z2hid9c+DytMIIDPzCC
AqigAwIBAgIBDTANBgkqhkiG9w0BAQUFADCB0TELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rl
cm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3dGUgQ29uc3VsdGluZzEo
MCYGA1UECxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEkMCIGA1UEAxMbVGhhd3Rl
IFBlcnNvbmFsIEZyZWVtYWlsIENBMSswKQYJKoZIhvcNAQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0
aGF3dGUuY29tMB4XDTAzMDcxNzAwMDAwMFoXDTEzMDcxNjIzNTk1OVowYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDE
pjxVc1X7TrnKmVoeaMB1BHCd3+n/ox7svc31W/Iadr1/DDph8r9RzgHU5VAKMNcCY1osiRVwjt3J
8CuFWqo/cVbLrzwLB+fxH5E2JCoTzyvV84J3PQO+K/67GD4Hv0CAAmTXp6a7n2XRxSpUhQ9IBH+n
ttE8YQRAHmQZcmC3+wIDAQABo4GUMIGRMBIGA1UdEwEB/wQIMAYBAf8CAQAwQwYDVR0fBDwwOjA4
oDagNIYyaHR0cDovL2NybC50aGF3dGUuY29tL1RoYXd0ZVBlcnNvbmFsRnJlZW1haWxDQS5jcmww
CwYDVR0PBAQDAgEGMCkGA1UdEQQiMCCkHjAcMRowGAYDVQQDExFQcml2YXRlTGFiZWwyLTEzODAN
BgkqhkiG9w0BAQUFAAOBgQBIjNFQg+oLLswNo2asZw9/r6y+whehQ5aUnX9MIbj4Nh+qLZ82L8D0
HFAgk3A8/a3hYWLD2ToZfoSxmRsAxRoLgnSeJVCUYsfbJ3FXJY3dqZw5jowgT2Vfldr394fWxghO
rvbqNOUQGls1TXfjViF4gtwhGTXeJLHTHUb/XV9lTzGCA2QwggNgAgEBMHYwYjELMAkGA1UEBhMC
WkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0
ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhAsJXp/6FHKA3dVazaiqf38MAkGBSsOAwIa
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA5MDYxNjE1
NTIzNFowIwYJKoZIhvcNAQkEMRYEFL9t3YhliQmloG4ESIwGlfdgggx9MFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9/DCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQLCV6f+hRygN3VWs2oqn9
/DANBgkqhkiG9w0BAQEFAASCAQCCjpjOtLLgykYA4JAt4muFguD+PhM+secx2/cA59nNe6pDhXYL
7yJ10EY0sNojEybIgwZ8EkLp1W9jXy6e04Qe0hICsuZFDwLVO3fCn9VYajSkYfvvklvwwBma68kP
IFyYfnyg0BQsCnrI0SmleQWoxPXEgTlKCCh9k+YS/R/wSj+eTfGdBJwcNMRTiovDKicnXd6Ew3fp
BHiBKpckERe+4qecVJZ2/dr8F4nn7BW4eGgZzoPsXjblVFdp4K2zZVWnZpaozAfRP0PmKivLEURc
pW/mc2j2yQSV3L3kzGXhymYgtMs6sHwRh4fQZ6ep5b2FcL5p1L/2dkWl3n1sLdcTAAAAAAAA

--------------ms040008040606030002010702--
