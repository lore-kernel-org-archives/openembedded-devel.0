Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RTWVL-0003hc-Dz
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 11:26:07 +0100
Received: by wwf22 with SMTP id 22so412245wwf.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 02:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=tklLd8/joIOSdyAUWWF7r73kECXSRpQKVwiaR+wCrMI=;
	b=v1Vd5jFWO90YEf/odgEyHphMAntXkjfNCY78FbWYbz01hepas3vbnJlWwxAmIuk5ZD
	/Y6JV/3Ng9ak6IPz6FCVdP+jrUaZPXXSLhXmSu3R2uWsq4jkE9fYeLbCkwyQ+eF6osZT
	1pSUDaKNJYpLIiCJCBXz9BmnmsdCZm68lrfwc=
Received: by 10.227.205.135 with SMTP id fq7mr17569901wbb.19.1322129974688;
	Thu, 24 Nov 2011 02:19:34 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m30sm2983235wbo.14.2011.11.24.02.19.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 02:19:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Nov 2011 11:18:45 +0100
Message-Id: <5481ee02a91ce0e79f9980a097dc1e68147e6088.1322129758.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc3
In-Reply-To: <0004016e514fbb3f18793561ebf85766344ae499.1322129758.git.Martin.Jansa@gmail.com>
References: <0004016e514fbb3f18793561ebf85766344ae499.1322129758.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322129758.git.Martin.Jansa@gmail.com>
References: <cover.1322129758.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld 6/6] linux-git: upgrade to 3.2.0-rc3
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
X-List-Received-Date: Thu, 24 Nov 2011 10:26:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-kernel/linux/linux-git.inc                 |    6 ++--
 .../linux/linux-kexecboot/spitz/defconfig          |    7 +----
 recipes-kernel/linux/linux/spitz/defconfig         |   26 +++++++------------
 3 files changed, 14 insertions(+), 25 deletions(-)

diff --git a/recipes-kernel/linux/linux-git.inc b/recipes-kernel/linux/linux-git.inc
index 4e7565e..66a6b9a 100644
--- a/recipes-kernel/linux/linux-git.inc
+++ b/recipes-kernel/linux/linux-git.inc
@@ -1,8 +1,8 @@
-KERNEL_RELEASE = "3.1.0-rc9"
-OLD_KERNEL_RELEASE = "3.0.99"
+KERNEL_RELEASE = "3.2.0-rc3"
+OLD_KERNEL_RELEASE = "3.1.99"
 PV = "${OLD_KERNEL_RELEASE}+${KERNEL_RELEASE}+gitr${SRCPV}"
 
-SRCREV = "65112dccf8a113737684366349d7f9ec373ddc47"
+SRCREV = "caca6a03d365883564885f2c1da3e88dcf65d139"
 
 CMDLINE_DEBUG = "debug"
 
diff --git a/recipes-kernel/linux/linux-kexecboot/spitz/defconfig b/recipes-kernel/linux/linux-kexecboot/spitz/defconfig
index e62ab14..c368338 100644
--- a/recipes-kernel/linux/linux-kexecboot/spitz/defconfig
+++ b/recipes-kernel/linux/linux-kexecboot/spitz/defconfig
@@ -8,10 +8,7 @@ CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"
 CONFIG_RD_LZMA=y
 CONFIG_INITRAMFS_COMPRESSION_LZMA=y
 # CONFIG_UID16 is not set
-# CONFIG_SYSCTL_SYSCALL is not set
 # CONFIG_KALLSYMS is not set
-# CONFIG_PRINTK is not set
-# CONFIG_BUG is not set
 # CONFIG_ELF_CORE is not set
 # CONFIG_BASE_FULL is not set
 CONFIG_EMBEDDED=y
@@ -33,7 +30,7 @@ CONFIG_AEABI=y
 # CONFIG_OABI_COMPAT is not set
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_CMDLINE="console=tty1 console=ttyS0,115200n8 fbcon=rotate:1 loglevel=3"
+CONFIG_CMDLINE="console=tty1 console=ttyS0,115200n8 fbcon=rotate:1 debug"
 CONFIG_KEXEC=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
@@ -73,12 +70,10 @@ CONFIG_SERIAL_PXA=y
 CONFIG_SERIAL_PXA_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_I2C_COMPAT is not set
-CONFIG_SPI=y
 CONFIG_SPI_PXA2XX=y
 CONFIG_POWER_SUPPLY=y
 CONFIG_PDA_POWER=y
 CONFIG_APM_POWER=y
-# CONFIG_MFD_SUPPORT is not set
 CONFIG_FB=y
 CONFIG_FB_PXA=y
 CONFIG_BACKLIGHT_LCD_SUPPORT=y
diff --git a/recipes-kernel/linux/linux/spitz/defconfig b/recipes-kernel/linux/linux/spitz/defconfig
index 65aed48..90d49e9 100644
--- a/recipes-kernel/linux/linux/spitz/defconfig
+++ b/recipes-kernel/linux/linux/spitz/defconfig
@@ -29,10 +29,9 @@ CONFIG_PCMCIA_PXA2XX=y
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_AEABI=y
-# CONFIG_OABI_COMPAT is not set
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_CMDLINE="console=ttyS0,115200n8 console=tty1 fbcon=rotate:1 loglevel=3"
+CONFIG_CMDLINE="console=ttyS0,115200n8 console=tty1 fbcon=rotate:1 debug"
 CONFIG_KEXEC=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_BINFMT_AOUT=m
@@ -139,13 +138,11 @@ CONFIG_PATA_PXA=y
 CONFIG_PATA_PCMCIA=y
 CONFIG_NETDEVICES=y
 CONFIG_TUN=m
-CONFIG_NET_ETHERNET=y
-# CONFIG_NETDEV_1000 is not set
-# CONFIG_NETDEV_10000 is not set
-CONFIG_AIRO_CS=m
-CONFIG_HOSTAP=m
-CONFIG_HOSTAP_FIRMWARE=y
-CONFIG_HOSTAP_CS=m
+CONFIG_PCMCIA_PCNET=m
+CONFIG_PPP=m
+CONFIG_PPP_BSDCOMP=m
+CONFIG_PPP_DEFLATE=m
+CONFIG_PPP_ASYNC=m
 CONFIG_USB_CATC=m
 CONFIG_USB_KAWETH=m
 CONFIG_USB_PEGASUS=m
@@ -154,12 +151,10 @@ CONFIG_USB_USBNET=m
 CONFIG_USB_NET_DM9601=m
 # CONFIG_USB_NET_CDC_SUBSET is not set
 CONFIG_USB_SIERRA_NET=m
-CONFIG_NET_PCMCIA=y
-CONFIG_PCMCIA_PCNET=m
-CONFIG_PPP=m
-CONFIG_PPP_ASYNC=m
-CONFIG_PPP_DEFLATE=m
-CONFIG_PPP_BSDCOMP=m
+CONFIG_AIRO_CS=m
+CONFIG_HOSTAP=m
+CONFIG_HOSTAP_FIRMWARE=y
+CONFIG_HOSTAP_CS=m
 # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
 CONFIG_INPUT_MOUSEDEV_SCREEN_X=640
 CONFIG_INPUT_MOUSEDEV_SCREEN_Y=480
@@ -180,7 +175,6 @@ CONFIG_SERIAL_8250_CS=m
 CONFIG_SERIAL_PXA=y
 CONFIG_SERIAL_PXA_CONSOLE=y
 CONFIG_RAMOOPS=y
-CONFIG_SPI=y
 CONFIG_SPI_PXA2XX=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_POWER_SUPPLY=y
-- 
1.7.8.rc3



