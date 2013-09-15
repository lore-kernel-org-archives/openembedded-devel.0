Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 572CE6C7AF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2013 16:16:35 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id h10so1511355eaj.25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2013 09:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=o6S9lEkSt79wH9u4bMVzm8HQLtp5R+mSMh1jYi0PCs0=;
	b=cROcrtIvQrnNvxgjuT/pLo1KkVuLLn8yA00rkuG9DffCpw/ItjW2xOCsHAdPMKqubk
	W0QOVXlY/IKvFMk6hb2B/5I7Df2Qs/iLfdt5dwiS7K06hhU8bG3rVY4y1y2iT604RPvc
	6zBdgGfVjOEnWrD4PsToFMcAioLNrl8fK+HV+X3j7aubqeiqtKQLJKnaKGYnSdPLhkHW
	vokmaycaW1y/0U0+729Qmurk3zxbpDHmCvF1IKVXwfoSR+PXpry4LmvklrJCqeuiYG+Y
	cqiCgLMEUWNmu0HOQAQuVYe3v+6SGaROj+at/OXoxcLz5uMcqRTHfsIEUGXzvnCKEQ6z
	pPcA==
X-Received: by 10.14.174.195 with SMTP id x43mr4247850eel.47.1379261796634;
	Sun, 15 Sep 2013 09:16:36 -0700 (PDT)
Received: from mizar.localdomain
	(host50-7-dynamic.20-79-r.retail.telecomitalia.it. [79.20.7.50])
	by mx.google.com with ESMTPSA id j7sm34003076eeo.15.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 15 Sep 2013 09:16:36 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Sep 2013 18:16:26 +0200
Message-Id: <1379261786-7660-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1379261786-7660-1-git-send-email-andrea.adami@gmail.com>
References: <1379261786-7660-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 3/3] linux-yocto_3.8: remove in favor of version 3.10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Sep 2013 16:16:36 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.8/akita/akita-standard.scc |   7 -
 .../linux/linux-yocto-3.8/akita/akita.cfg          |   4 -
 .../linux/linux-yocto-3.8/akita/akita.scc          |  10 -
 .../linux/linux-yocto-3.8/c7x0/c7x0-standard.scc   |   7 -
 recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.cfg |  52 ---
 recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc |   7 -
 .../linux-yocto-3.8/collie/collie-standard.scc     |   7 -
 .../linux/linux-yocto-3.8/collie/collie.cfg        | 118 ------
 .../linux/linux-yocto-3.8/collie/collie.scc        |  10 -
 .../linux/linux-yocto-3.8/feature-top.scc          |   1 -
 .../patches-locomokbd/locomo_kbd_tweak-r2.patch    |  84 -----
 .../patches/patches-mfd/mcp-device.patch           |  30 --
 .../patches/patches-mfd/ucb1x00-device.patch       |  28 --
 .../patches/patches-mtd/collie-eraseinfo.patch     |  55 ---
 .../patches/patches-mtd/collie-jedec-probe.patch   |  35 --
 .../patches-power/collie_battery-dev-pm.patch      |  39 --
 .../patches-power/tosa_battery_irq_to_gpio.patch   |  39 --
 .../patches/patches-pxa/pxa27x-sa1100-rtc.patch    |  32 --
 .../patches/patches-pxa/pxamci-regulator.patch     | 147 --------
 .../patches/patches-pxa/sharpsl_param.patch        |  47 ---
 .../linux-yocto-3.8/poodle/poodle-standard.scc     |   7 -
 .../linux/linux-yocto-3.8/poodle/poodle.cfg        |  57 ---
 .../linux/linux-yocto-3.8/poodle/poodle.scc        |   8 -
 .../linux/linux-yocto-3.8/spitz/spitz-standard.scc |   7 -
 .../linux/linux-yocto-3.8/spitz/spitz.cfg          |  61 ----
 .../linux/linux-yocto-3.8/spitz/spitz.scc          |   9 -
 .../linux/linux-yocto-3.8/tosa/tosa-standard.scc   |   7 -
 recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.cfg |  65 ----
 recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc |   9 -
 .../linux/linux-yocto-3.8/zaurus-common.scc        |  10 -
 .../linux/linux-yocto-3.8/zaurus-hardware.cfg      | 279 --------------
 .../linux/linux-yocto-3.8/zaurus-non-hardware.cfg  | 400 ---------------------
 .../linux-yocto-3.8/zaurus-pxa-common-non-hw.cfg   |   9 -
 .../linux/linux-yocto-3.8/zaurus-pxa-common.cfg    | 111 ------
 .../linux/linux-yocto-3.8/zaurus-pxa-only.scc      |   2 -
 .../linux/linux-yocto-3.8/zaurus-usb-host.scc      |   6 -
 .../linux-yocto-3.8/zaurus-usb-ohci-non-hw.cfg     |   4 -
 .../linux/linux-yocto-3.8/zaurus-usb-ohci.cfg      | 110 ------
 recipes-kernel/linux/linux-yocto_3.8.bbappend      |   3 -
 39 files changed, 1923 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/akita/akita-standard.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/akita/akita.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0-standard.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/collie/collie-standard.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/collie/collie.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/collie/collie.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/feature-top.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-mfd/mcp-device.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-mfd/ucb1x00-device.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-eraseinfo.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-jedec-probe.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-power/collie_battery-dev-pm.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-power/tosa_battery_irq_to_gpio.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxa27x-sa1100-rtc.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxamci-regulator.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/sharpsl_param.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/poodle/poodle-standard.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/spitz/spitz-standard.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/tosa/tosa-standard.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-common.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-hardware.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-non-hardware.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-pxa-common-non-hw.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-pxa-common.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-pxa-only.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-usb-host.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-usb-ohci-non-hw.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-usb-ohci.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto_3.8.bbappend

diff --git a/recipes-kernel/linux/linux-yocto-3.8/akita/akita-standard.scc b/recipes-kernel/linux/linux-yocto-3.8/akita/akita-standard.scc
deleted file mode 100644
index 21096d0..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/akita/akita-standard.scc
+++ /dev/null
@@ -1,7 +0,0 @@
-define KMACHINE akita
-define KTYPE standard
-define KARCH arm
-
-include ktypes/standard/standard.scc
-
-include akita.scc
diff --git a/recipes-kernel/linux/linux-yocto-3.8/akita/akita.cfg b/recipes-kernel/linux/linux-yocto-3.8/akita/akita.cfg
deleted file mode 100644
index f6eb8f2..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/akita/akita.cfg
+++ /dev/null
@@ -1,4 +0,0 @@
-#
-# System Type
-#
-CONFIG_GPIO_PCA953X=y
diff --git a/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc b/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
deleted file mode 100644
index 77a45e3..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
+++ /dev/null
@@ -1,10 +0,0 @@
-kconf hardware ../spitz/spitz.cfg
-kconf hardware akita.cfg
-
-include ../zaurus-pxa-only.scc
-include ../zaurus-common.scc
-include ../zaurus-usb-host.scc
-
-patch ../patches/patches-pxa/sharpsl_param.patch
-patch ../patches/patches-pxa/pxa27x-sa1100-rtc.patch
-patch ../patches/patches-pxa/pxamci-regulator.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0-standard.scc b/recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0-standard.scc
deleted file mode 100644
index 325c7c7..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0-standard.scc
+++ /dev/null
@@ -1,7 +0,0 @@
-define KMACHINE c7x0
-define KTYPE standard
-define KARCH arm
-
-include ktypes/standard/standard.scc
-
-include c7x0.scc
diff --git a/recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.cfg b/recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.cfg
deleted file mode 100644
index 7da7c19..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.cfg
+++ /dev/null
@@ -1,52 +0,0 @@
-#
-# End-user Products (sorted by vendor name)
-#
-CONFIG_MACH_CORGI=y
-CONFIG_MACH_SHEPHERD=y
-CONFIG_MACH_HUSKY=y
-CONFIG_PXA25x=y
-CONFIG_PXA_SHARP_C7xx=y
-CONFIG_SHARPSL_PM=y
-CONFIG_SHARPSL_PM_MAX1111=y
-
-#
-# Boot options
-#
-CONFIG_CMDLINE="console=ttyS0,115200n8 console=tty1 loglevel=3"
-
-#
-# Disk-On-Chip Device Drivers
-#
-CONFIG_MTD_NAND_SHARPSL=y
-
-#
-# Input Device Drivers
-#
-CONFIG_KEYBOARD_MATRIX=y
-CONFIG_TOUCHSCREEN_ADS7846=y
-
-#
-# Userland interfaces
-#
-CONFIG_INPUT_MOUSEDEV_SCREEN_X=640
-CONFIG_INPUT_MOUSEDEV_SCREEN_Y=480
-
-#
-# Frame buffer hardware drivers
-#
-CONFIG_FB_W100=y
-CONFIG_LCD_CORGI=y
-CONFIG_BACKLIGHT_GENERIC=y
-
-#
-# Console display driver support
-#
-CONFIG_FONT_8x16=y
-
-#
-# USB Miscellaneous drivers
-#
-CONFIG_USB_PXA25X=m
-CONFIG_SND_PXA2XX_SOC_I2S=m
-CONFIG_SND_PXA2XX_SOC_CORGI=m
-CONFIG_SND_SOC_WM8731=m
diff --git a/recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc b/recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc
deleted file mode 100644
index cef4907..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc
+++ /dev/null
@@ -1,7 +0,0 @@
-kconf hardware c7x0.cfg
-
-include ../zaurus-pxa-only.scc
-include ../zaurus-common.scc
-
-patch ../patches/patches-pxa/sharpsl_param.patch
-patch ../patches/patches-pxa/pxamci-regulator.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/collie/collie-standard.scc b/recipes-kernel/linux/linux-yocto-3.8/collie/collie-standard.scc
deleted file mode 100644
index 7283ad9..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/collie/collie-standard.scc
+++ /dev/null
@@ -1,7 +0,0 @@
-define KMACHINE collie
-define KTYPE standard
-define KARCH arm
-
-include ktypes/standard/standard.scc
-
-include collie.scc
diff --git a/recipes-kernel/linux/linux-yocto-3.8/collie/collie.cfg b/recipes-kernel/linux/linux-yocto-3.8/collie/collie.cfg
deleted file mode 100644
index c334774..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/collie/collie.cfg
+++ /dev/null
@@ -1,118 +0,0 @@
-#
-# System Type
-#
-CONFIG_ARCH_SA1100=y
-
-#
-# SA11x0 Implementations
-#
-CONFIG_SA1100_COLLIE=y
-
-#
-# Processor Type
-#
-CONFIG_CPU_SA1100=y
-CONFIG_CPU_32v4=y
-CONFIG_CPU_ABRT_EV4=y
-CONFIG_CPU_PABRT_LEGACY=y
-CONFIG_CPU_CACHE_V4WB=y
-CONFIG_CPU_CACHE_VIVT=y
-CONFIG_CPU_TLB_V4WB=y
-CONFIG_CPU_CP15=y
-CONFIG_CPU_CP15_MMU=y
-CONFIG_CPU_USE_DOMAINS=y
-
-#
-# Processor Features
-#
-CONFIG_SHARP_LOCOMO=y
-
-#
-# PC-card bridges
-#
-CONFIG_PCMCIA_SA11XX_BASE=y
-CONFIG_PCMCIA_SA1100=y
-
-#
-# Kernel Features
-#
-CONFIG_ARCH_SPARSEMEM_ENABLE=y
-CONFIG_ARCH_SPARSEMEM_DEFAULT=y
-CONFIG_ARCH_SELECT_MEMORY_MODEL=y
-CONFIG_SPARSEMEM_MANUAL=y
-CONFIG_SPARSEMEM=y
-CONFIG_HAVE_MEMORY_PRESENT=y
-CONFIG_SPARSEMEM_EXTREME=y
-
-#
-# Boot options
-#
-CONFIG_CMDLINE="console=ttySA0,115200n8 console=tty1 mem=64M fbcon=rotate:1 loglevel=3"
-
-#
-# RAM/ROM/Flash chip drivers
-#
-CONFIG_MTD_CFI=y
-CONFIG_MTD_JEDECPROBE=y
-CONFIG_MTD_GEN_PROBE=y
-CONFIG_MTD_CFI_ADV_OPTIONS=y
-CONFIG_MTD_CFI_NOSWAP=y
-CONFIG_MTD_CFI_GEOMETRY=y
-CONFIG_MTD_MAP_BANK_WIDTH_4=y
-CONFIG_MTD_CFI_I2=y
-CONFIG_MTD_CFI_INTELEXT=y
-CONFIG_MTD_CFI_UTIL=y
-
-#
-# Mapping drivers for chip access
-#
-CONFIG_MTD_SA1100=y
-
-#
-# Non-8250 serial port support
-# 
-CONFIG_SERIAL_SA1100=y
-CONFIG_SERIAL_SA1100_CONSOLE=y
-CONFIG_SERIAL_CORE=y
-CONFIG_SERIAL_CORE_CONSOLE=y
-
-#
-# Multimedia Capabilities Port drivers
-#
-CONFIG_MCP=y
-CONFIG_MCP_SA11X0=y
-CONFIG_MCP_UCB1200=y
-CONFIG_MCP_UCB1200_TS=y
-
-#
-# Input Device Drivers
-#
-CONFIG_KEYBOARD_LOCOMO=y
-
-#
-# Userland interfaces
-#
-CONFIG_INPUT_MOUSEDEV_SCREEN_X=240
-CONFIG_INPUT_MOUSEDEV_SCREEN_Y=320
-
-#
-# Frame buffer hardware drivers
-#
-CONFIG_FB_SA1100=y
-CONFIG_BACKLIGHT_LOCOMO=y
-
-#
-# Console display driver support
-#
-CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
-CONFIG_FONT_8x8=y
-
-#
-# LED drivers
-#
-CONFIG_LEDS_LOCOMO=y
-
-#
-# MODULbus GPIO expanders:
-#
-CONFIG_BATTERY_COLLIE=y
diff --git a/recipes-kernel/linux/linux-yocto-3.8/collie/collie.scc b/recipes-kernel/linux/linux-yocto-3.8/collie/collie.scc
deleted file mode 100644
index 2ce8650..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/collie/collie.scc
+++ /dev/null
@@ -1,10 +0,0 @@
-kconf hardware collie.cfg
-
-include ../zaurus-common.scc
-
-patch ../patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
-patch ../patches/patches-power/collie_battery-dev-pm.patch
-patch ../patches/patches-mfd/mcp-device.patch
-patch ../patches/patches-mfd/ucb1x00-device.patch
-patch ../patches/patches-mtd/collie-jedec-probe.patch
-patch ../patches/patches-mtd/collie-eraseinfo.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/feature-top.scc b/recipes-kernel/linux/linux-yocto-3.8/feature-top.scc
deleted file mode 100644
index fdffa2a..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/feature-top.scc
+++ /dev/null
@@ -1 +0,0 @@
-# placeholder
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
deleted file mode 100644
index 441e3dc..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From c9a909cedb442a1a3d020f0c10683298dcc2246c Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Sat, 21 Apr 2012 23:48:57 +0200
-Subject: [PATCH] locomokbd: apply tweaks for Zaurus
-
-from http://www.rpsys.net/openzaurus/patches/
-
-Signed-off-by: Richard Purdie <rpurdie@rpsys.net>
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
-
-Upstream-Status: Inappropriate [embedded specific]
-[Patch needed for initramfs w/out keymaps like kexecboot]
----
- drivers/input/keyboard/locomokbd.c | 44 ++++++++++++++++++++++----------------
- 1 file changed, 25 insertions(+), 19 deletions(-)
-
-diff --git a/drivers/input/keyboard/locomokbd.c b/drivers/input/keyboard/locomokbd.c
-index c94d610..2b978c8 100644
---- a/drivers/input/keyboard/locomokbd.c
-+++ b/drivers/input/keyboard/locomokbd.c
-@@ -39,27 +39,33 @@ MODULE_AUTHOR("John Lenz <lenz@cs.wisc.edu>");
- MODULE_DESCRIPTION("LoCoMo keyboard driver");
- MODULE_LICENSE("GPL");
- 
--#define LOCOMOKBD_NUMKEYS	128
--
--#define KEY_ACTIVITY		KEY_F16
--#define KEY_CONTACT		KEY_F18
--#define KEY_CENTER		KEY_F15
-+#define LOCOMOKBD_NUMKEYS		128
-+
-+#define LOCOMO_KEY_CALENDER	KEY_LEFTCTRL
-+#define LOCOMO_KEY_ADDRESS	KEY_LEFTALT	/* Needed for SysRQ */
-+#define LOCOMO_KEY_HOME		KEY_SYSRQ	/* Needed for SysRQ */
-+#define LOCOMO_KEY_MENU		KEY_F12
-+#define LOCOMO_KEY_MAIL		KEY_F10
-+#define LOCOMO_KEY_OK		KEY_F11		/* Don't hardwire to KEY_RETURN */
-+#define LOCOMO_KEY_CANCEL	KEY_POWER
-+#define LOCOMO_KEY_CENTER	KEY_F5		/* Don't hardwire to KEY_RETURN */
-+#define LOCOMO_KEY_FN		KEY_F9
- 
- static const unsigned char
- locomokbd_keycode[LOCOMOKBD_NUMKEYS] = {
--	0, KEY_ESC, KEY_ACTIVITY, 0, 0, 0, 0, 0, 0, 0,				/* 0 - 9 */
--	0, 0, 0, 0, 0, 0, 0, KEY_MENU, KEY_HOME, KEY_CONTACT,			/* 10 - 19 */
--	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,						/* 20 - 29 */
--	0, 0, 0, KEY_CENTER, 0, KEY_MAIL, 0, 0, 0, 0,				/* 30 - 39 */
--	0, 0, 0, 0, 0, 0, 0, 0, 0, KEY_RIGHT,					/* 40 - 49 */
--	KEY_UP, KEY_LEFT, 0, 0, KEY_P, 0, KEY_O, KEY_I, KEY_Y, KEY_T,		/* 50 - 59 */
--	KEY_E, KEY_W, 0, 0, 0, 0, KEY_DOWN, KEY_ENTER, 0, 0,			/* 60 - 69 */
--	KEY_BACKSPACE, 0, KEY_L, KEY_U, KEY_H, KEY_R, KEY_D, KEY_Q, 0, 0,	/* 70 - 79 */
--	0, 0, 0, 0, 0, 0, KEY_ENTER, KEY_RIGHTSHIFT, KEY_K, KEY_J,		/* 80 - 89 */
--	KEY_G, KEY_F, KEY_X, KEY_S, 0, 0, 0, 0, 0, 0,				/* 90 - 99 */
--	0, 0, KEY_DOT, 0, KEY_COMMA, KEY_N, KEY_B, KEY_C, KEY_Z, KEY_A,		/* 100 - 109 */
--	KEY_LEFTSHIFT, KEY_TAB, KEY_LEFTCTRL, 0, 0, 0, 0, 0, 0, 0,		/* 110 - 119 */
--	KEY_M, KEY_SPACE, KEY_V, KEY_APOSTROPHE, KEY_SLASH, 0, 0, 0		/* 120 - 128 */
-+	0, LOCOMO_KEY_CANCEL, LOCOMO_KEY_CALENDER, LOCOMO_KEY_HOME, 0, 0, 0, 0, 0, 0,	/* 0 - 9 */
-+	0, 0, 0, 0, 0, 0, 0, LOCOMO_KEY_MENU, 0, LOCOMO_KEY_ADDRESS,			/* 10 - 19 */
-+	0, 0, 0, 0, 0, LOCOMO_KEY_MAIL, 0, 0, 0, 0,					/* 20 - 29 */
-+	0, 0, 0, LOCOMO_KEY_CENTER, 0, LOCOMO_KEY_MAIL, 0, 0, 0, 0,			/* 30 - 39 */
-+	0, 0, 0, 0, 0, 0, 0, 0, 0, KEY_RIGHT,						/* 40 - 49 */
-+	KEY_UP, KEY_LEFT, 0, 0, KEY_P, 0, KEY_O, KEY_I, KEY_Y, KEY_T,			/* 50 - 59 */
-+	KEY_E, KEY_W, 0, 0, 0, 0, KEY_DOWN, LOCOMO_KEY_OK, 0, 0,			/* 60 - 69 */
-+	KEY_BACKSPACE, 0, KEY_L, KEY_U, KEY_H, KEY_R, KEY_D, KEY_Q, 0, 0,		/* 70 - 79 */
-+	0, 0, 0, 0, 0, 0, KEY_ENTER, KEY_RIGHTSHIFT, KEY_K, KEY_J,			/* 80 - 89 */
-+	KEY_G, KEY_F, KEY_X, KEY_S, 0, 0, 0, 0, 0, 0,					/* 90 - 99 */
-+	0, 0, KEY_DOT, 0, KEY_COMMA, KEY_N, KEY_B, KEY_C, KEY_Z, KEY_A,			/* 100 - 109 */
-+	KEY_LEFTSHIFT, KEY_TAB, LOCOMO_KEY_FN, 0, 0, 0, 0, 0, 0, 0,			/* 110 - 119 */
-+	KEY_M, KEY_SPACE, KEY_V, KEY_APOSTROPHE, KEY_SLASH, 0, 0, 0			/* 120 - 128 */
- };
- 
- #define KB_ROWS			16
-@@ -68,7 +74,7 @@ locomokbd_keycode[LOCOMOKBD_NUMKEYS] = {
- #define SCANCODE(c,r)		( ((c)<<4) + (r) + 1 )
- 
- #define KB_DELAY		8
--#define SCAN_INTERVAL		(HZ/10)
-+#define SCAN_INTERVAL		(HZ/20)
- 
- struct locomokbd {
- 	unsigned char keycode[LOCOMOKBD_NUMKEYS];
--- 
-1.8.1.5
-
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mfd/mcp-device.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mfd/mcp-device.patch
deleted file mode 100644
index a3523b0..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mfd/mcp-device.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c297f9bcdf58ed5bc69095ac6ff7fc1088c377dc Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Mon, 15 Jul 2013 18:15:19 +0200
-Subject: [PATCH] mcp.h: add missing header
-
-Fix
-linux/include/linux/mfd/mcp.h:22:16: error: field 'attached_device' has incomplete type
-linux/include/linux/mfd/mcp.h:48:23: error: field 'drv' has incomplete type
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- include/linux/mfd/mcp.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/include/linux/mfd/mcp.h b/include/linux/mfd/mcp.h
-index a9e8bd1..f682953 100644
---- a/include/linux/mfd/mcp.h
-+++ b/include/linux/mfd/mcp.h
-@@ -10,6 +10,8 @@
- #ifndef MCP_H
- #define MCP_H
- 
-+#include <linux/device.h>
-+
- struct mcp_ops;
- 
- struct mcp {
--- 
-1.8.1.5
-
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mfd/ucb1x00-device.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mfd/ucb1x00-device.patch
deleted file mode 100644
index 76c4d97..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mfd/ucb1x00-device.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f669a459cac00894ce4503c011103dbea5baabee Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Mon, 15 Jul 2013 18:16:57 +0200
-Subject: [PATCH] ucb1x00: explicitely include linux/device.h
-
-Fix
-linux/include/linux/mfd/ucb1x00.h:137:17: error: field 'dev' has incomplete type
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- include/linux/mfd/ucb1x00.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/linux/mfd/ucb1x00.h b/include/linux/mfd/ucb1x00.h
-index 28af417..88f90cb 100644
---- a/include/linux/mfd/ucb1x00.h
-+++ b/include/linux/mfd/ucb1x00.h
-@@ -10,6 +10,7 @@
- #ifndef UCB1200_H
- #define UCB1200_H
- 
-+#include <linux/device.h>
- #include <linux/mfd/mcp.h>
- #include <linux/gpio.h>
- #include <linux/mutex.h>
--- 
-1.8.1.5
-
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-eraseinfo.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-eraseinfo.patch
deleted file mode 100644
index 0a8ebac..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-eraseinfo.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 1fc59077a0f5a1f338c94e9dc2ef356f821d2614 Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Mon, 15 Jul 2013 01:18:19 +0200
-Subject: [PATCH] jedec_probe.c: fix LH28F640BF definition
-
-Zaurus 5500 contains 2 LH28F640BFHE-PTTL90 (64M 4Mx16) and
-the LH28F640BFHE-PTTL90.pdf datasheet available on the net shows
-the exact erasesize and the OTP support.
-At the moment only jedec_probe can discover the chip and
-the NOR is mounted read only probably because of wrong vpp.
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
-
-Upstream-Status: Submitted
-http://lists.infradead.org/pipermail/linux-mtd/2013-February/045781.html
----
- drivers/mtd/chips/jedec_probe.c | 13 +++++++------
- 1 file changed, 7 insertions(+), 6 deletions(-)
-
-diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
-index c443f52..7c0b27d 100644
---- a/drivers/mtd/chips/jedec_probe.c
-+++ b/drivers/mtd/chips/jedec_probe.c
-@@ -120,7 +120,7 @@
- #define PM49FL008	0x006A
- 
- /* Sharp */
--#define LH28F640BF	0x00b0
-+#define LH28F640BF	0x00B0
- 
- /* ST - www.st.com */
- #define M29F800AB	0x0058
-@@ -1299,13 +1299,14 @@ static const struct amd_flash_info jedec_table[] = {
- 		.mfr_id		= CFI_MFR_SHARP,
- 		.dev_id		= LH28F640BF,
- 		.name		= "LH28F640BF",
--		.devtypes	= CFI_DEVICETYPE_X8,
-+		.devtypes	= CFI_DEVICETYPE_X16,
- 		.uaddr		= MTD_UADDR_UNNECESSARY,
--		.dev_size	= SIZE_4MiB,
--		.cmd_set	= P_ID_INTEL_STD,
--		.nr_regions	= 1,
-+		.dev_size	= SIZE_8MiB,
-+		.cmd_set	= P_ID_INTEL_EXT,
-+		.nr_regions	= 2,
- 		.regions	= {
--			ERASEINFO(0x40000,16),
-+			ERASEINFO(0x10000, 127),
-+			ERASEINFO(0x02000, 8),
- 		}
- 	}, {
- 		.mfr_id		= CFI_MFR_SST,
--- 
-1.8.1.5
-
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-jedec-probe.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-jedec-probe.patch
deleted file mode 100644
index bae540a..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-jedec-probe.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 3d3ca843f0c1e6c9cac64744343774e2f7718034 Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Mon, 15 Jul 2013 01:18:25 +0200
-Subject: [PATCH] collie.c: fall back to jedec_probe flash detection
-
-Zaurus 5500 contains 2 LH28F640BFHE-PTTL90 (64M 4Mx16) and
-the LH28F640BFHE-PTTL90.pdf datasheet available on the net shows
-the exact erasesize and the OTP support.
-At the moment only jedec_probe can discover the chip and
-the NOR is mounted read only probably because of wrong vpp
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
-
-Upstream-Status: Submitted
-http://lists.infradead.org/pipermail/linux-mtd/2013-February/045781.html
----
- arch/arm/mach-sa1100/collie.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/arm/mach-sa1100/collie.c b/arch/arm/mach-sa1100/collie.c
-index 612a456..7fb96eb 100644
---- a/arch/arm/mach-sa1100/collie.c
-+++ b/arch/arm/mach-sa1100/collie.c
-@@ -289,7 +289,7 @@ static void collie_flash_exit(void)
- }
- 
- static struct flash_platform_data collie_flash_data = {
--	.map_name	= "cfi_probe",
-+	.map_name	= "jedec_probe",
- 	.init		= collie_flash_init,
- 	.set_vpp	= collie_set_vpp,
- 	.exit		= collie_flash_exit,
--- 
-1.8.1.5
-
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-power/collie_battery-dev-pm.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-power/collie_battery-dev-pm.patch
deleted file mode 100644
index 4792c32..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-power/collie_battery-dev-pm.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 94010e3700b65986c65960e2b7a0966773928347 Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Tue, 16 Jul 2013 17:33:39 +0200
-Subject: [PATCH] collie_battery.c: convert to use dev_pm_ops
-
-Fix
-linux/drivers/power/collie_battery.c:372:2: warning: initialization from
-incompatible pointer type [enabled by default]
-linux/drivers/power/collie_battery.c:372:2: warning: (near initialization
-for 'collie_bat_driver.suspend') [enabled by default]
-
-Referencess:
-MFD: ucb1x00-core: convert to use dev_pm_ops
-https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/include/linux/mfd?id=5a09b7120a965a7d7e8494d0ed509135bbce0118
-
-MFD: mcp-core: remove legacy driver suspend/resume methods
-https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/include/linux/mfd?id=cf4abfcc0df2985ff6061f74e63b8353f2a1d0bc
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- drivers/power/collie_battery.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/drivers/power/collie_battery.c b/drivers/power/collie_battery.c
-index c58d0e3..d02ae02 100644
---- a/drivers/power/collie_battery.c
-+++ b/drivers/power/collie_battery.c
-@@ -287,7 +287,7 @@ static struct gpio collie_batt_gpios[] = {
- };
- 
- #ifdef CONFIG_PM
--static int collie_bat_suspend(struct ucb1x00_dev *dev, pm_message_t state)
-+static int collie_bat_suspend(struct ucb1x00_dev *dev)
- {
- 	/* flush all pending status updates */
- 	flush_work(&bat_work);
--- 
-1.8.1.5
-
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-power/tosa_battery_irq_to_gpio.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-power/tosa_battery_irq_to_gpio.patch
deleted file mode 100644
index 9951d3a..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-power/tosa_battery_irq_to_gpio.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 59031299cbfba766f9197c46f5271b4cb4afb89d Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Wed, 17 Jul 2013 00:27:23 +0200
-Subject: [PATCH] tosa_battery.c: get rid of irq_to_gpio usage
-
-Fix
-linux/drivers/power/tosa_battery.c:153:2: error: implicit declaration of
-function 'irq_to_gpio' [-Werror=implicit-function-declaration]
-|   pr_info("tosa_bat_gpio irq: %d\n",
-gpio_get_value(irq_to_gpio(irq)));
-
-as done for collie_battery.c with
-commit 629bcb4b72d49b3631ae3dd0fe1d345820fadfcc
-
-Since 9d08d5d77a355510c2f5657c86b0a4b25acfe72c, irq_to_gpio() is no
-longer available but still in use by collie_battery.c. As it's just
-for a debug message, just get rid of this call.
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- drivers/power/tosa_battery.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/drivers/power/tosa_battery.c b/drivers/power/tosa_battery.c
-index 0224de5..f4d80df 100644
---- a/drivers/power/tosa_battery.c
-+++ b/drivers/power/tosa_battery.c
-@@ -150,7 +150,7 @@ static void tosa_bat_external_power_changed(struct power_supply *psy)
- 
- static irqreturn_t tosa_bat_gpio_isr(int irq, void *data)
- {
--	pr_info("tosa_bat_gpio irq: %d\n", gpio_get_value(irq_to_gpio(irq)));
-+	pr_info("tosa_bat_gpio irq\n");
- 	schedule_work(&bat_work);
- 	return IRQ_HANDLED;
- }
--- 
-1.8.1.5
-
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxa27x-sa1100-rtc.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxa27x-sa1100-rtc.patch
deleted file mode 100644
index d878ea1..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxa27x-sa1100-rtc.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From fcee0050f8ce5296e8007ed7ed17d98f334a8f38 Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Fri, 23 Nov 2012 23:07:20 +0100
-Subject: [PATCH] ARM: pxa: pxa27x.c: add dummy SA1100 rtc clock
-
-* Using pxa27x you could now build both RTC_DRV_PXA and RTC_DRV_SA1100.
-* Make sure you don't use both together: link /dev/rtc0 or /dev/rtc1
-* to /dev/rtc according to your requirement.
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
-Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
-Signed-off-by: Haojian Zhuang <haojian.zhuang@gmail.com>
-
-Upstream-Status: Accepted
-Committed in v3.9-rc1 with commit id
-495b21dc0e488b784ab1d4007d00db1ca2a95c98
----
- arch/arm/mach-pxa/pxa27x.c |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
-index 8047ee0..5970ebc 100644
---- a/arch/arm/mach-pxa/pxa27x.c
-+++ b/arch/arm/mach-pxa/pxa27x.c
-@@ -230,6 +230,7 @@ static struct clk_lookup pxa27x_clkregs[] = {
- 	INIT_CLKREG(&clk_pxa27x_memc, NULL, "MEMCLK"),
- 	INIT_CLKREG(&clk_pxa27x_mem, "pxa2xx-pcmcia", NULL),
- 	INIT_CLKREG(&clk_dummy, "pxa-gpio", NULL),
-+	INIT_CLKREG(&clk_dummy, "sa1100-rtc", NULL),
- };
- 
- #ifdef CONFIG_PM
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxamci-regulator.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxamci-regulator.patch
deleted file mode 100644
index 66351f3..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxamci-regulator.patch
+++ /dev/null
@@ -1,147 +0,0 @@
-From 04e7345a49a7ab2eb725f8ee2569c49b9ea697bb Mon Sep 17 00:00:00 2001
-From: Marko Katic <dromede@gmail.com>
-Date: Mon, 15 Jul 2013 00:55:13 +0200
-Subject: [PATCH] pxamci: Refactor regulator support
-
-Here's an interesting scenario. The spitz machine has an
-Intersil 6271A voltage regulator and an ADS7846 touchscreen
-controller.
-
-The ADS7846 driver _requires_ the use of a voltage regulator
-or if not present, CONFIG_REGULATOR_DUMMY should be used for proper operation.
-This was made mandatory by the following commit:
-
-========================================
-91143379b01b2020d8878d627ebe9dfb9d6eb4c8
-Input: ads7846 - add regulator support
-
-The ADS7846/TSC2046 touchscreen controllers can (and usually are)
-connected to various regulators for power, so add regulator support.
-
-Valid regulator will now be required, so boards without complete
-regulator setup should either disable regulator framework or enable
-CONFIG_REGULATOR_DUMMY.
-========================================
-
-The ADS7846 in spitz machines is not connected to
-any power regulator so it needs CONFIG_REGULATOR_DUMMY enabled.
-So to support both the Intersil 6271A regulator and
-the ADS7846 controller, CONFIG_REGULATOR and CONFIG_REGULATOR_DUMMY have
-to be defined.
-
-However, enabling CONFIG_REGULATOR and CONFIG_REGULATOR_DUMMY
-will break pxamci driver and cause the following error output:
-
-pxa2xx-mci.0 supply vmmc not found, using dummy regulator
-pxa2xx-mci pxa2xx-mci.0: ocr_mask/setpower will not be used
-pxa2xx-mci pxa2xx-mci.0: could not set regulator OCR (-22)
-pxa2xx-mci pxa2xx-mci.0: unable to set power
-pxa2xx-mci pxa2xx-mci.0: could not set regulator OCR (-22)
-pxa2xx-mci pxa2xx-mci.0: unable to set power
-
-Above failures occur in two functions;
-pxamci_init_ocr() and pxamci_set_power().
-
-Regulator support in pxamci_init_ocr() is not
-written with the existence of the dummy regulator driver in
-mind. It does not check the return value of mmc_regulator_get_ocrmask()
-and it will only fall back to platform data if no regulator was found.
-
-pxamci_set_power() fails because it does not even try to fall back
-to platform data if mmc_regulator_set_ocr() fails. It
-expects a proper regulator or no regulator at all. It will
-only fall back to platform data if no regulator was found. It does
-not properly handle the possible existence of the dummy regulator.
-
-This patch refactors pxamci_init_ocr() and  pxamci_set_power() regulator
-support to be more modular, to do more checks and to always fall back
-to platform data.
-
-Signed-off-by: Marko Katic <dromede@gmail.com>
-
-Upstream-Status: Submitted
-https://patchwork.kernel.org/patch/1875561/
----
- drivers/mmc/host/pxamci.c | 40 +++++++++++++++++++++++++++-------------
- 1 file changed, 27 insertions(+), 13 deletions(-)
-
-diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
-index 2b2f65a..341d5dc 100644
---- a/drivers/mmc/host/pxamci.c
-+++ b/drivers/mmc/host/pxamci.c
-@@ -83,18 +83,26 @@ struct pxamci_host {
- static inline void pxamci_init_ocr(struct pxamci_host *host)
- {
- #ifdef CONFIG_REGULATOR
-+	int ocr_mask;
- 	host->vcc = regulator_get(mmc_dev(host->mmc), "vmmc");
- 
- 	if (IS_ERR(host->vcc))
- 		host->vcc = NULL;
- 	else {
--		host->mmc->ocr_avail = mmc_regulator_get_ocrmask(host->vcc);
--		if (host->pdata && host->pdata->ocr_mask)
-+		ocr_mask = mmc_regulator_get_ocrmask(host->vcc);
-+		if (ocr_mask <= 0)
-+			host->mmc->ocr_avail = 0;
-+		else
-+			host->mmc->ocr_avail = ocr_mask;
-+
-+		if (host->pdata &&
-+			host->pdata->ocr_mask &&
-+			host->mmc->ocr_avail)
- 			dev_warn(mmc_dev(host->mmc),
- 				"ocr_mask/setpower will not be used\n");
- 	}
- #endif
--	if (host->vcc == NULL) {
-+	if (host->vcc == NULL || host->mmc->ocr_avail == 0) {
- 		/* fall-back to platform data */
- 		host->mmc->ocr_avail = host->pdata ?
- 			host->pdata->ocr_mask :
-@@ -108,26 +116,32 @@ static inline int pxamci_set_power(struct pxamci_host *host,
- {
- 	int on;
- 
-+#ifdef CONFIG_REGULATOR
- 	if (host->vcc) {
--		int ret;
-+		int ret = 0;
- 
--		if (power_mode == MMC_POWER_UP) {
-+		if (power_mode == MMC_POWER_UP)
- 			ret = mmc_regulator_set_ocr(host->mmc, host->vcc, vdd);
--			if (ret)
--				return ret;
--		} else if (power_mode == MMC_POWER_OFF) {
-+
-+		if (power_mode == MMC_POWER_OFF)
- 			ret = mmc_regulator_set_ocr(host->mmc, host->vcc, 0);
--			if (ret)
--				return ret;
--		}
-+
-+		if (ret == 0)
-+			return 0;
-+		else
-+			dev_warn(mmc_dev(host->mmc),
-+			 "mmc_regulator_set_ocr failed, "
-+			 "falling back to platform data\n");
- 	}
--	if (!host->vcc && host->pdata &&
-+#endif
-+
-+	if (host->pdata &&
- 	    gpio_is_valid(host->pdata->gpio_power)) {
- 		on = ((1 << vdd) & host->pdata->ocr_mask);
- 		gpio_set_value(host->pdata->gpio_power,
- 			       !!on ^ host->pdata->gpio_power_invert);
- 	}
--	if (!host->vcc && host->pdata && host->pdata->setpower)
-+	if (host->pdata && host->pdata->setpower)
- 		host->pdata->setpower(mmc_dev(host->mmc), vdd);
- 
- 	return 0;
--- 
-1.8.1.5
-
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/sharpsl_param.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/sharpsl_param.patch
deleted file mode 100644
index 934cdca..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/sharpsl_param.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From a8ca187342e1db8bf2f770b0d95935d2cbf1cc3c Mon Sep 17 00:00:00 2001
-From: Marko Katic <dromede@gmail.com>
-Date: Mon, 15 Jul 2013 00:57:22 +0200
-Subject: [PATCH] sharpsl_param: fix invalid memory access in
- sharpsl_save_param()
-
-Unbreak kernel boot (tested with kexecboot)
-
-Patch was sent twice upstrream:
-http://lists.infradead.org/pipermail/linux-arm-kernel/2012-December/137284.html
-Devices that call sharpsl_save_param() will hang on boot due to
-a memcpy call that uses a physical address that is no longer * accessible. Fix
-his by converting the physical address into a virtual one.
-
-Signed-off-by: Marko Katic <dromede@gmail.com>
-
-Upstream-Status: Submitted
-https://patchwork.kernel.org/patch/1818681/
----
- arch/arm/common/sharpsl_param.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/arch/arm/common/sharpsl_param.c b/arch/arm/common/sharpsl_param.c
-index d56c932..b70b13a 100644
---- a/arch/arm/common/sharpsl_param.c
-+++ b/arch/arm/common/sharpsl_param.c
-@@ -14,6 +14,7 @@
- #include <linux/kernel.h>
- #include <linux/module.h>
- #include <linux/string.h>
-+#include <asm/memory.h>
- #include <asm/mach/sharpsl_param.h>
- 
- /*
-@@ -41,7 +42,8 @@ EXPORT_SYMBOL(sharpsl_param);
- 
- void sharpsl_save_param(void)
- {
--	memcpy(&sharpsl_param, (void *)PARAM_BASE, sizeof(struct sharpsl_param_info));
-+	void *param_start = phys_to_virt(PARAM_BASE);
-+	memcpy(&sharpsl_param, param_start, sizeof(struct sharpsl_param_info));
- 
- 	if (sharpsl_param.comadj_keyword != COMADJ_MAGIC)
- 		sharpsl_param.comadj=-1;
--- 
-1.8.1.5
-
diff --git a/recipes-kernel/linux/linux-yocto-3.8/poodle/poodle-standard.scc b/recipes-kernel/linux/linux-yocto-3.8/poodle/poodle-standard.scc
deleted file mode 100644
index 31ad9df..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/poodle/poodle-standard.scc
+++ /dev/null
@@ -1,7 +0,0 @@
-define KMACHINE poodle
-define KTYPE standard
-define KARCH arm
-
-include ktypes/standard/standard.scc
-
-include poodle.scc
diff --git a/recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.cfg b/recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.cfg
deleted file mode 100644
index 8ae5c8e..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.cfg
+++ /dev/null
@@ -1,57 +0,0 @@
-#
-# Processor Features
-#
-CONFIG_SHARP_LOCOMO=y
-
-#
-# End-user Products (sorted by vendor name)
-#
-CONFIG_MACH_POODLE=y
-CONFIG_PXA25x=y
-
-#
-# Boot options
-#
-CONFIG_CMDLINE="console=ttyS0,115200n8 console=tty1 fbcon=rotate:1 loglevel=3"
-
-#
-# Disk-On-Chip Device Drivers
-#
-CONFIG_MTD_NAND_SHARPSL=y
-
-#
-# Input Device Drivers
-#
-CONFIG_KEYBOARD_LOCOMO=y
-CONFIG_TOUCHSCREEN_ADS7846=y
-
-#
-# Userland interfaces
-#
-CONFIG_INPUT_MOUSEDEV_SCREEN_X=240
-CONFIG_INPUT_MOUSEDEV_SCREEN_Y=320
-
-#
-# Frame buffer hardware drivers
-#
-CONFIG_FB_PXA=y
-CONFIG_BACKLIGHT_LOCOMO=y
-
-#
-# Console display driver support
-#
-CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
-CONFIG_FONT_8x8=y
-
-#
-# LED drivers
-#
-CONFIG_LEDS_LOCOMO=y
-
-#
-# USB Miscellaneous drivers
-#
-CONFIG_USB_PXA25X=m
-CONFIG_SND_PXA2XX_SOC_I2S=m
-CONFIG_SND_PXA2XX_SOC_POODLE=m
-CONFIG_SND_SOC_WM8731=m
diff --git a/recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.scc b/recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.scc
deleted file mode 100644
index 114b4d8..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.scc
+++ /dev/null
@@ -1,8 +0,0 @@
-kconf hardware poodle.cfg
-
-include ../zaurus-pxa-only.scc
-include ../zaurus-common.scc
-
-patch ../patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
-patch ../patches/patches-pxa/sharpsl_param.patch
-patch ../patches/patches-pxa/pxamci-regulator.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz-standard.scc b/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz-standard.scc
deleted file mode 100644
index 5b8e2c3..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz-standard.scc
+++ /dev/null
@@ -1,7 +0,0 @@
-define KMACHINE spitz
-define KTYPE standard
-define KARCH arm
-
-include ktypes/standard/standard.scc
-
-include spitz.scc
diff --git a/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.cfg b/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.cfg
deleted file mode 100644
index 85d5f0f..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.cfg
+++ /dev/null
@@ -1,61 +0,0 @@
-#
-# Processor Features
-#
-CONFIG_IWMMXT=y
-
-#
-# End-user Products (sorted by vendor name)
-#
-CONFIG_MACH_AKITA=y
-CONFIG_MACH_SPITZ=y
-CONFIG_MACH_BORZOI=y
-CONFIG_PXA27x=y
-CONFIG_PXA_SHARP_Cxx00=y
-CONFIG_SHARPSL_PM=y
-CONFIG_SHARPSL_PM_MAX1111=y
-
-#
-# Boot options
-#
-CONFIG_CMDLINE="console=ttyS0,115200n8 console=tty1 fbcon=rotate:1 loglevel=3"
-
-#
-# Disk-On-Chip Device Drivers
-#
-CONFIG_MTD_NAND_SHARPSL=y
-
-#
-# Input Device Drivers
-#
-CONFIG_KEYBOARD_MATRIX=y
-CONFIG_TOUCHSCREEN_ADS7846=y
-
-#
-# Userland interfaces
-#
-CONFIG_INPUT_MOUSEDEV_SCREEN_X=640
-CONFIG_INPUT_MOUSEDEV_SCREEN_Y=480
-
-#
-# Frame buffer hardware drivers
-#
-CONFIG_FB_PXA=y
-CONFIG_FB_PXA_OVERLAY=y
-CONFIG_FB_PXA_SMARTPANEL=y
-CONFIG_FB_PXA_PARAMETERS=y
-CONFIG_LCD_CORGI=y
-CONFIG_BACKLIGHT_GENERIC=y
-
-#
-# Console display driver support
-#
-CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
-CONFIG_FONT_8x16=y
-
-#
-# USB Miscellaneous drivers
-#
-CONFIG_USB_PXA27X=m
-CONFIG_SND_PXA2XX_SOC_I2S=m
-CONFIG_SND_PXA2XX_SOC_SPITZ=m
-CONFIG_SND_SOC_WM8750=m
diff --git a/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc b/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
deleted file mode 100644
index 8cf32bd..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
+++ /dev/null
@@ -1,9 +0,0 @@
-kconf hardware spitz.cfg
-
-include ../zaurus-pxa-only.scc
-include ../zaurus-common.scc
-include ../zaurus-usb-host.scc
-
-patch ../patches/patches-pxa/sharpsl_param.patch
-patch ../patches/patches-pxa/pxa27x-sa1100-rtc.patch
-patch ../patches/patches-pxa/pxamci-regulator.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/tosa/tosa-standard.scc b/recipes-kernel/linux/linux-yocto-3.8/tosa/tosa-standard.scc
deleted file mode 100644
index b2e1324..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/tosa/tosa-standard.scc
+++ /dev/null
@@ -1,7 +0,0 @@
-define KMACHINE tosa
-define KTYPE standard
-define KARCH arm
-
-include ktypes/standard/standard.scc
-
-include tosa.scc
diff --git a/recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.cfg b/recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.cfg
deleted file mode 100644
index 77aedfe..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.cfg
+++ /dev/null
@@ -1,65 +0,0 @@
-#
-# End-user Products (sorted by vendor name)
-#
-CONFIG_MACH_TOSA=y
-CONFIG_TOSA_BT=m
-CONFIG_PXA25x=y
-
-#
-# Boot options
-#
-CONFIG_CMDLINE="console=ttyS0,115200n8 console=tty1 loglevel=3"
-
-#
-# Multifunction device drivers
-#
-CONFIG_MFD_CORE=y
-CONFIG_MFD_TMIO=y
-CONFIG_MFD_TC6393XB=y
-
-#
-# Disk-On-Chip Device Drivers
-#
-CONFIG_MTD_NAND_TMIO=y
-
-#
-# Input Device Drivers
-#
-CONFIG_KEYBOARD_MATRIX=y
-CONFIG_TOUCHSCREEN_WM97XX=m
-CONFIG_TOUCHSCREEN_WM9705=y
-CONFIG_TOUCHSCREEN_WM9712=y
-CONFIG_TOUCHSCREEN_WM9713=y
-
-#
-# Userland interfaces
-#
-CONFIG_INPUT_MOUSEDEV_SCREEN_X=640
-CONFIG_INPUT_MOUSEDEV_SCREEN_Y=480
-
-#
-# Frame buffer hardware drivers
-#
-CONFIG_FB_TMIO=y
-CONFIG_FB_TMIO_ACCELL=y
-CONFIG_LCD_TOSA=y
-CONFIG_BACKLIGHT_GENERIC=y
-CONFIG_BACKLIGHT_TOSA=y
-
-#
-# Console display driver support
-#
-CONFIG_FONT_8x16=y
-
-#
-# USB Miscellaneous drivers
-#
-CONFIG_USB_PXA25X=m
-CONFIG_SND_PXA2XX_SOC_AC97=m
-CONFIG_SND_PXA2XX_SOC_TOSA=m
-CONFIG_SND_SOC_WM9712=m
-CONFIG_SND_SOC_AC97_BUS=y
-
-# USB GPIO expanders:
-#
-CONFIG_BATTERY_TOSA=m
diff --git a/recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc b/recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc
deleted file mode 100644
index 8a8c24a..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc
+++ /dev/null
@@ -1,9 +0,0 @@
-kconf hardware tosa.cfg
-
-include ../zaurus-pxa-only.scc
-include ../zaurus-common.scc
-include ../zaurus-usb-host.scc
-
-patch ../patches/patches-pxa/sharpsl_param.patch
-patch ../patches/patches-power/tosa_battery_irq_to_gpio.patch
-patch ../patches/patches-pxa/pxamci-regulator.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/zaurus-common.scc b/recipes-kernel/linux/linux-yocto-3.8/zaurus-common.scc
deleted file mode 100644
index bc67bd9..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/zaurus-common.scc
+++ /dev/null
@@ -1,10 +0,0 @@
-kconf hardware zaurus-hardware.cfg
-kconf non-hardware zaurus-non-hardware.cfg
-
-include cfg/fs/flash_fs.scc
-include cfg/serial-8250.cfg
-include cfg/sound.scc
-
-include features/scsi/disk.scc
-include features/hostapd/hostapd.scc
-include features/mac80211/mac80211.scc
diff --git a/recipes-kernel/linux/linux-yocto-3.8/zaurus-hardware.cfg b/recipes-kernel/linux/linux-yocto-3.8/zaurus-hardware.cfg
deleted file mode 100644
index 6fbc95e..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/zaurus-hardware.cfg
+++ /dev/null
@@ -1,279 +0,0 @@
-CONFIG_ARM=y
-CONFIG_SYS_SUPPORTS_APM_EMULATION=y
-CONFIG_GENERIC_GPIO=y
-CONFIG_HAVE_PROC_CPU=y
-CONFIG_STACKTRACE_SUPPORT=y
-CONFIG_HAVE_LATENCYTOP_SUPPORT=y
-CONFIG_LOCKDEP_SUPPORT=y
-CONFIG_TRACE_IRQFLAGS_SUPPORT=y
-CONFIG_RWSEM_GENERIC_SPINLOCK=y
-CONFIG_ARCH_HAS_CPUFREQ=y
-CONFIG_GENERIC_HWEIGHT=y
-CONFIG_GENERIC_CALIBRATE_DELAY=y
-CONFIG_NEED_DMA_MAP_STATE=y
-CONFIG_ARCH_MTD_XIP=y
-CONFIG_VECTORS_BASE=0xffff0000
-CONFIG_ARM_PATCH_PHYS_VIRT=y
-CONFIG_GENERIC_BUG=y
-
-#
-# Kernel Performance Events And Counters
-#
-CONFIG_HAVE_OPROFILE=y
-CONFIG_HAVE_KPROBES=y
-CONFIG_HAVE_KRETPROBES=y
-CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
-CONFIG_HAVE_CLK=y
-CONFIG_HAVE_DMA_API_DEBUG=y
-
-#
-# System Type
-#
-CONFIG_MMU=y
-
-
-#
-# Processor Features
-#
-CONFIG_ARM_L1_CACHE_SHIFT=5
-CONFIG_ARM_NR_BANKS=8
-CONFIG_SHARP_PARAM=y
-CONFIG_SHARP_SCOOP=y
-
-#
-# Power management options
-#
-CONFIG_SUSPEND=y
-CONFIG_SUSPEND_FREEZER=y
-CONFIG_PM_SLEEP=y
-CONFIG_PM_RUNTIME=y
-CONFIG_PM=y
-CONFIG_APM_EMULATION=y
-CONFIG_PM_CLK=y
-CONFIG_CPU_PM=y
-CONFIG_ARCH_SUSPEND_POSSIBLE=y
-CONFIG_ARM_CPU_SUSPEND=y
-
-#
-# Generic Driver Options
-#
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-
-#
-# User Modules And Translation Layers
-#
-CONFIG_MTD_CHAR=y
-CONFIG_MTD_BLKDEVS=y
-CONFIG_MTD_BLOCK=y
-
-#
-# RAM/ROM/Flash chip drivers
-#
-CONFIG_MTD_ROM=y
-
-#
-# Mapping drivers for chip access
-#
-CONFIG_MTD_COMPLEX_MAPPINGS=y
-CONFIG_MTD_PHYSMAP=y
-
-#
-# Disk-On-Chip Device Drivers
-#
-CONFIG_MTD_NAND_ECC=y
-CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_IDS=y
-
-#
-# Input device support
-#
-CONFIG_INPUT=y
-
-#
-# Userland interfaces
-#
-CONFIG_INPUT_MOUSEDEV=y
-CONFIG_INPUT_EVDEV=y
-CONFIG_INPUT_APMPOWER=y
-
-#
-# Input Device Drivers
-#
-CONFIG_INPUT_KEYBOARD=y
-CONFIG_KEYBOARD_GPIO=y
-CONFIG_INPUT_TOUCHSCREEN=y
-CONFIG_INPUT_MISC=y
-CONFIG_INPUT_UINPUT=m
-
-#
-# Character devices
-#
-CONFIG_VT=y
-CONFIG_VT_CONSOLE=y
-CONFIG_HW_CONSOLE=y
-CONFIG_DEVKMEM=y
-
-#
-# Serial drivers
-#
-CONFIG_SERIAL_8250=m
-CONFIG_SERIAL_8250_CS=m
-
-#
-# Non-8250 serial port support
-#
-CONFIG_HW_RANDOM=m
-
-#
-# PCMCIA character devices
-#
-CONFIG_I2C=y
-CONFIG_I2C_BOARDINFO=y
-CONFIG_I2C_COMPAT=y
-CONFIG_I2C_HELPER_AUTO=y
-
-#
-# Other I2C/SMBus bus drivers
-#
-CONFIG_SPI=y
-CONFIG_SPI_MASTER=y
-
-#
-# Enable Device Drivers -> PPS to see the PTP clock options.
-#
-CONFIG_ARCH_REQUIRE_GPIOLIB=y
-CONFIG_GPIOLIB=y
-CONFIG_GPIO_SYSFS=y
-
-#
-# MODULbus GPIO expanders:
-#
-CONFIG_POWER_SUPPLY=y
-CONFIG_POWER_SUPPLY_DEBUG=y
-CONFIG_PDA_POWER=y
-CONFIG_APM_POWER=y
-CONFIG_HWMON=y
-
-#
-# Native drivers
-#
-CONFIG_SENSORS_MAX1111=y
-
-#
-# USB-based Watchdog Cards
-#
-CONFIG_SSB_POSSIBLE=y
-
-#
-# Graphics support
-#
-CONFIG_FB=y
-CONFIG_FB_CFB_FILLRECT=y
-CONFIG_FB_CFB_COPYAREA=y
-CONFIG_FB_CFB_IMAGEBLIT=y
-
-#
-# Frame buffer hardware drivers
-#
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
-CONFIG_LCD_CLASS_DEVICE=y
-CONFIG_BACKLIGHT_CLASS_DEVICE=y
-
-#
-# Console display driver support
-#
-CONFIG_DUMMY_CONSOLE=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_FONTS=y
-CONFIG_LOGO=y
-CONFIG_LOGO_LINUX_CLUT224=y
-CONFIG_SOUND=m
-CONFIG_SOUND_OSS_CORE=y
-CONFIG_SOUND_OSS_CORE_PRECLAIM=y
-CONFIG_SND=m
-CONFIG_SND_TIMER=m
-CONFIG_SND_PCM=m
-CONFIG_SND_JACK=y
-CONFIG_SND_SUPPORT_OLD_API=y
-CONFIG_SND_VERBOSE_PROCFS=y
-CONFIG_SND_DRIVERS=y
-CONFIG_SND_ARM=y
-CONFIG_SND_SPI=y
-CONFIG_SND_PCMCIA=y
-CONFIG_SND_SOC=m
-CONFIG_SND_SOC_I2C_AND_SPI=m
-CONFIG_HID=m
-
-#
-# Special HID drivers
-#
-CONFIG_USB_ARCH_HAS_HCD=y
-
-#
-# Miscellaneous USB options
-#
-CONFIG_USB_OTG_WHITELIST=y
-
-#
-# USB Miscellaneous drivers
-#
-CONFIG_USB_GADGET=m
-CONFIG_USB_GADGET_DEBUG_FILES=y
-CONFIG_USB_GADGET_DEBUG_FS=y
-CONFIG_USB_GADGET_VBUS_DRAW=2
-CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
-CONFIG_USB_ZERO=m
-CONFIG_USB_ETH=m
-CONFIG_USB_ETH_RNDIS=y
-CONFIG_USB_ETH_EEM=y
-CONFIG_USB_GADGETFS=m
-CONFIG_USB_MASS_STORAGE=m
-CONFIG_USB_G_SERIAL=m
-CONFIG_USB_CDC_COMPOSITE=m
-CONFIG_USB_G_MULTI=m
-CONFIG_USB_G_MULTI_RNDIS=y
-CONFIG_USB_G_MULTI_CDC=y
-
-#
-# MMC/SD/SDIO Host Controller Drivers
-#
-CONFIG_NEW_LEDS=y
-CONFIG_LEDS_CLASS=y
-
-#
-# LED drivers
-#
-CONFIG_LEDS_GPIO=y
-CONFIG_LEDS_TRIGGERS=y
-
-#
-# LED Triggers
-#
-CONFIG_LEDS_TRIGGER_TIMER=y
-CONFIG_LEDS_TRIGGER_HEARTBEAT=y
-
-#
-# iptables trigger is under Netfilter config (LED target)
-#
-CONFIG_RTC_LIB=y
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_HCTOSYS=y
-CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
-
-#
-# RTC interfaces
-#
-CONFIG_RTC_INTF_SYSFS=y
-CONFIG_RTC_INTF_PROC=y
-CONFIG_RTC_INTF_DEV=y
-
-#
-# on-CPU RTC drivers
-#
-CONFIG_RTC_DRV_SA1100=y
-
-#
-# Kernel hacking
-#
-CONFIG_ARM_UNWIND=y
diff --git a/recipes-kernel/linux/linux-yocto-3.8/zaurus-non-hardware.cfg b/recipes-kernel/linux/linux-yocto-3.8/zaurus-non-hardware.cfg
deleted file mode 100644
index b267978..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/zaurus-non-hardware.cfg
+++ /dev/null
@@ -1,400 +0,0 @@
-CONFIG_KERNEL_LZMA=y
-CONFIG_HARDIRQS_SW_RESEND=y
-CONFIG_GENERIC_IRQ_PROBE=y
-#
-# General setup
-#
-CONFIG_KTIME_SCALAR=y
-
-CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
-CONFIG_HAVE_IRQ_WORK=y
-CONFIG_IRQ_WORK=y
-
-#
-# General setup
-#
-CONFIG_BROKEN_ON_SMP=y
-CONFIG_INIT_ENV_ARG_LIMIT=32
-CONFIG_CROSS_COMPILE=""
-CONFIG_HAVE_KERNEL_GZIP=y
-CONFIG_HAVE_KERNEL_LZMA=y
-CONFIG_HAVE_KERNEL_LZO=y
-CONFIG_KERNEL_GZIP=y
-CONFIG_DEFAULT_HOSTNAME="(none)"
-CONFIG_SYSVIPC_SYSCTL=y
-CONFIG_HAVE_GENERIC_HARDIRQS=y
-
-#
-# IRQ subsystem
-#
-CONFIG_GENERIC_HARDIRQS=y
-CONFIG_GENERIC_IRQ_SHOW=y
-CONFIG_SPARSE_IRQ=y
-
-#
-# RCU Subsystem
-#
-CONFIG_TINY_RCU=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_RD_GZIP=y
-CONFIG_RD_BZIP2=y
-CONFIG_RD_LZMA=y
-CONFIG_RD_LZO=y
-CONFIG_CC_OPTIMIZE_FOR_SIZE=y
-CONFIG_ANON_INODES=y
-CONFIG_EXPERT=y
-CONFIG_UID16=y
-CONFIG_PRINTK=y
-CONFIG_BUG=y
-CONFIG_ELF_CORE=y
-CONFIG_BASE_FULL=y
-CONFIG_SIGNALFD=y
-CONFIG_TIMERFD=y
-CONFIG_EVENTFD=y
-CONFIG_AIO=y
-CONFIG_HAVE_PERF_EVENTS=y
-CONFIG_PERF_USE_VMALLOC=y
-
-#
-# Kernel Performance Events And Counters
-#
-CONFIG_PERF_EVENTS=y
-CONFIG_VM_EVENT_COUNTERS=y
-CONFIG_COMPAT_BRK=y
-CONFIG_SLAB=y
-
-#
-# GCOV-based kernel profiling
-#
-CONFIG_HAVE_GENERIC_DMA_COHERENT=y
-CONFIG_SLABINFO=y
-CONFIG_RT_MUTEXES=y
-CONFIG_BASE_SMALL=0
-CONFIG_MODULE_FORCE_UNLOAD=y
-CONFIG_BLK_DEV_BSG=y
-
-#
-# Partition Types
-#
-CONFIG_PARTITION_ADVANCED=y
-
-#
-# IO Schedulers
-#
-CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
-CONFIG_INLINE_READ_UNLOCK=y
-CONFIG_INLINE_READ_UNLOCK_IRQ=y
-CONFIG_INLINE_WRITE_UNLOCK=y
-CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
-
-#
-# Bus support
-#
-CONFIG_PCCARD=y
-CONFIG_PCMCIA=y
-CONFIG_PCMCIA_LOAD_CIS=y
-
-#
-# PC-card bridges
-#
-CONFIG_PCMCIA_SOC_COMMON=y
-
-#
-# Kernel Features
-#
-CONFIG_TICK_ONESHOT=y
-CONFIG_NO_HZ=y
-CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
-CONFIG_VMSPLIT_3G=y
-CONFIG_PAGE_OFFSET=0xC0000000
-CONFIG_HZ=100
-CONFIG_SELECT_MEMORY_MODEL=y
-CONFIG_HAVE_MEMBLOCK=y
-CONFIG_SPLIT_PTLOCK_CPUS=999999
-CONFIG_ZONE_DMA_FLAG=0
-CONFIG_VIRT_TO_BUS=y
-CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
-CONFIG_NEED_PER_CPU_KM=y
-CONFIG_FORCE_MAX_ZONEORDER=11
-CONFIG_ALIGNMENT_TRAP=y
-
-#
-# Boot options
-#
-CONFIG_ZBOOT_ROM_TEXT=0x0
-CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_CMDLINE_FROM_BOOTLOADER=y
-CONFIG_KEXEC=y
-CONFIG_ATAGS_PROC=y
-
-#
-# Network testing
-#
-CONFIG_IRDA=m
-
-#
-# IrDA protocols
-#
-CONFIG_IRLAN=m
-CONFIG_IRNET=m
-CONFIG_IRCOMM=m
-
-#
-# FIR device drivers
-#
-CONFIG_BT=m
-CONFIG_BT_RFCOMM=m
-CONFIG_BT_RFCOMM_TTY=y
-CONFIG_BT_BNEP=m
-CONFIG_BT_BNEP_MC_FILTER=y
-CONFIG_BT_BNEP_PROTO_FILTER=y
-CONFIG_BT_HIDP=m
-
-#
-# Bluetooth device drivers
-#
-CONFIG_BT_HCIBTSDIO=m
-CONFIG_BT_HCIUART=m
-CONFIG_BT_HCIUART_H4=y
-CONFIG_BT_HCIUART_BCSP=y
-CONFIG_BT_HCIUART_ATH3K=y
-CONFIG_BT_HCIUART_LL=y
-CONFIG_BT_HCIDTL1=m
-CONFIG_BT_HCIBT3C=m
-CONFIG_BT_HCIBLUECARD=m
-CONFIG_BT_HCIBTUART=m
-CONFIG_BT_HCIVHCI=m
-CONFIG_BT_MRVL=m
-CONFIG_BT_MRVL_SDIO=m
-CONFIG_WIRELESS=y
-CONFIG_WIRELESS_EXT=y
-CONFIG_WEXT_CORE=y
-CONFIG_WEXT_PROC=y
-CONFIG_WEXT_SPY=y
-CONFIG_WEXT_PRIV=y
-CONFIG_LIB80211_CRYPT_WEP=m
-CONFIG_LIB80211_CRYPT_CCMP=m
-CONFIG_LIB80211_CRYPT_TKIP=m
-
-#
-# Generic Driver Options
-#
-CONFIG_UEVENT_HELPER_PATH=""
-CONFIG_FW_LOADER=y
-CONFIG_FIRMWARE_IN_KERNEL=y
-CONFIG_EXTRA_FIRMWARE=""
-CONFIG_REGMAP=y
-CONFIG_REGMAP_I2C=m
-CONFIG_REGMAP_SPI=m
-
-#
-# LPDDR flash memory drivers
-#
-CONFIG_BLK_DEV=y
-
-#
-# Altera FPGA firmware download module
-#
-CONFIG_HAVE_IDE=y
-
-#
-# SCSI device support
-#
-CONFIG_SCSI_MOD=y
-CONFIG_SCSI_DMA=y
-
-#
-# SCSI Transports
-#
-CONFIG_SCSI_LOWLEVEL=y
-CONFIG_ATA=y
-CONFIG_ATA_VERBOSE_ERROR=y
-CONFIG_SATA_PMP=y
-
-#
-# Controllers with non-SFF native interface
-#
-CONFIG_ATA_SFF=y
-
-#
-# SFF controllers with custom DMA interface
-#
-CONFIG_ATA_BMDMA=y
-
-#
-# PIO-only SFF controllers
-#
-CONFIG_PATA_PCMCIA=y
-
-#
-# CAIF transport drivers
-#
-CONFIG_ETHERNET=y
-CONFIG_NET_VENDOR_3COM=y
-CONFIG_NET_VENDOR_AMD=y
-CONFIG_NET_VENDOR_BROADCOM=y
-CONFIG_NET_VENDOR_CHELSIO=y
-CONFIG_NET_VENDOR_CIRRUS=y
-CONFIG_NET_VENDOR_FARADAY=y
-CONFIG_NET_VENDOR_FUJITSU=y
-CONFIG_NET_VENDOR_INTEL=y
-CONFIG_NET_VENDOR_I825XX=y
-CONFIG_NET_VENDOR_MARVELL=y
-CONFIG_NET_VENDOR_MICREL=y
-CONFIG_NET_VENDOR_MICROCHIP=y
-CONFIG_NET_VENDOR_NATSEMI=y
-CONFIG_NET_VENDOR_8390=y
-CONFIG_PCMCIA_PCNET=m
-CONFIG_NET_VENDOR_SEEQ=y
-CONFIG_NET_VENDOR_SMSC=y
-CONFIG_NET_VENDOR_STMICRO=y
-CONFIG_NET_VENDOR_XIRCOM=y
-CONFIG_SLHC=m
-
-#
-# USB Network Adapters
-#
-CONFIG_AIRO_CS=m
-CONFIG_HOSTAP=m
-CONFIG_HOSTAP_FIRMWARE=y
-CONFIG_HOSTAP_CS=m
-
-#
-# Character devices
-#
-CONFIG_CONSOLE_TRANSLATIONS=y
-CONFIG_VT_CONSOLE_SLEEP=y
-
-#
-# Sonics Silicon Backplane
-#
-CONFIG_BCMA_POSSIBLE=y
-
-#
-# OTG and related infrastructure
-#
-CONFIG_USB_OTG_UTILS=y
-CONFIG_USB_GPIO_VBUS=m
-CONFIG_USB_ULPI=y
-CONFIG_NOP_USB_XCEIV=m
-#
-CONFIG_MMC=y
-CONFIG_MMC_UNSAFE_RESUME=y
-
-#
-# MMC/SD/SDIO Card Drivers
-#
-CONFIG_MMC_BLOCK=y
-CONFIG_MMC_BLOCK_MINORS=8
-CONFIG_MMC_BLOCK_BOUNCE=y
-
-#
-# MMC/SD/SDIO Host Controller Drivers
-#
-CONFIG_MMC_SPI=y
-
-#
-# Hardware Spinlock drivers
-#
-CONFIG_CLKSRC_MMIO=y
-CONFIG_IOMMU_SUPPORT=y
-
-#
-# File systems
-#
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-CONFIG_EXT4_FS=y
-CONFIG_JBD=y
-CONFIG_JBD2=y
-CONFIG_EXPORTFS=m
-CONFIG_FILE_LOCKING=y
-CONFIG_FSNOTIFY=y
-CONFIG_INOTIFY_USER=y
-CONFIG_GENERIC_ACL=y
-
-#
-# DOS/FAT/NT Filesystems
-#
-CONFIG_FAT_DEFAULT_CODEPAGE=437
-CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
-
-#
-# Pseudo filesystems
-#
-CONFIG_PROC_SYSCTL=y
-CONFIG_PROC_PAGE_MONITOR=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_TMPFS_XATTR=y
-CONFIG_MISC_FILESYSTEMS=y
-CONFIG_JFFS2_FS=y
-CONFIG_JFFS2_FS_DEBUG=0
-CONFIG_JFFS2_FS_WRITEBUFFER=y
-CONFIG_JFFS2_SUMMARY=y
-CONFIG_JFFS2_COMPRESSION_OPTIONS=y
-CONFIG_JFFS2_ZLIB=y
-CONFIG_JFFS2_LZO=y
-CONFIG_JFFS2_RTIME=y
-CONFIG_JFFS2_RUBIN=y
-CONFIG_JFFS2_CMODE_PRIORITY=y
-CONFIG_UBIFS_FS=y
-CONFIG_UBIFS_FS_ADVANCED_COMPR=y
-CONFIG_UBIFS_FS_LZO=y
-CONFIG_UBIFS_FS_ZLIB=y
-CONFIG_CRAMFS=m
-CONFIG_NETWORK_FILESYSTEMS=y
-CONFIG_NFS_DEF_FILE_IO_SIZE=4096
-CONFIG_NFS_USE_KERNEL_DNS=y
-CONFIG_NFSD=m
-CONFIG_NFSD_V4=y
-CONFIG_NFS_COMMON=y
-CONFIG_NLS=y
-
-#
-# Kernel hacking
-#
-CONFIG_DEFAULT_MESSAGE_LOGLEVEL=4
-CONFIG_ENABLE_WARN_DEPRECATED=y
-CONFIG_ENABLE_MUST_CHECK=y
-CONFIG_FRAME_WARN=1024
-
-CONFIG_HAVE_FUNCTION_TRACER=y
-CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
-CONFIG_HAVE_DYNAMIC_FTRACE=y
-CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
-CONFIG_HAVE_C_RECORDMCOUNT=y
-CONFIG_RING_BUFFER=y
-CONFIG_RING_BUFFER_ALLOW_SWAP=y
-CONFIG_TRACING_SUPPORT=y
-CONFIG_FTRACE=y
-CONFIG_BRANCH_PROFILE_NONE=y
-CONFIG_HAVE_ARCH_KGDB=y
-
-#
-# Security options
-#
-CONFIG_DEFAULT_SECURITY_DAC=y
-CONFIG_DEFAULT_SECURITY=""
-
-#
-# Library routines
-#
-CONFIG_BITREVERSE=y
-CONFIG_CRC_CCITT=y
-CONFIG_CRC16=y
-CONFIG_CRC_ITU_T=y
-CONFIG_CRC32=y
-CONFIG_CRC7=y
-CONFIG_ZLIB_INFLATE=y
-CONFIG_LZO_COMPRESS=y
-CONFIG_LZO_DECOMPRESS=y
-CONFIG_DECOMPRESS_GZIP=y
-CONFIG_DECOMPRESS_BZIP2=y
-CONFIG_DECOMPRESS_LZMA=y
-CONFIG_DECOMPRESS_LZO=y
-CONFIG_HAS_IOMEM=y
-CONFIG_HAS_IOPORT=y
-CONFIG_HAS_DMA=y
-CONFIG_NLATTR=y
-CONFIG_GENERIC_ATOMIC64=y
-CONFIG_AVERAGE=y
diff --git a/recipes-kernel/linux/linux-yocto-3.8/zaurus-pxa-common-non-hw.cfg b/recipes-kernel/linux/linux-yocto-3.8/zaurus-pxa-common-non-hw.cfg
deleted file mode 100644
index 75c3626..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/zaurus-pxa-common-non-hw.cfg
+++ /dev/null
@@ -1,9 +0,0 @@
-#
-# Microsoft Hyper-V guest support
-#
-CONFIG_CLKDEV_LOOKUP=y
-
-#
-# End-user Products (sorted by vendor name)
-#
-CONFIG_PXA_SSP=y
diff --git a/recipes-kernel/linux/linux-yocto-3.8/zaurus-pxa-common.cfg b/recipes-kernel/linux/linux-yocto-3.8/zaurus-pxa-common.cfg
deleted file mode 100644
index 01805f2..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/zaurus-pxa-common.cfg
+++ /dev/null
@@ -1,111 +0,0 @@
-#
-# System Type
-#
-CONFIG_ARCH_PXA=y
-
-#
-# End-user Products (sorted by vendor name)
-#
-CONFIG_PXA_SHARPSL=y
-
-#
-# System MMU
-#
-CONFIG_PLAT_PXA=y
-
-#
-# Processor Type
-#
-CONFIG_CPU_XSCALE=y
-CONFIG_CPU_32v5=y
-CONFIG_CPU_ABRT_EV5T=y
-CONFIG_CPU_PABRT_LEGACY=y
-CONFIG_CPU_CACHE_VIVT=y
-CONFIG_CPU_TLB_V4WBI=y
-CONFIG_CPU_CP15=y
-CONFIG_CPU_CP15_MMU=y
-CONFIG_CPU_USE_DOMAINS=y
-
-#
-# Processor Features
-#
-CONFIG_XSCALE_PMU=y
-CONFIG_CPU_HAS_PMU=y
-CONFIG_MULTI_IRQ_HANDLER=y
-
-#
-# PC-card bridges
-#
-CONFIG_PCMCIA_PXA2XX=y
-
-#
-# Kernel Features
-#
-CONFIG_HAVE_ARCH_PFN_VALID=y
-CONFIG_HW_PERF_EVENTS=y
-CONFIG_FLATMEM_MANUAL=y
-CONFIG_FLATMEM=y
-CONFIG_FLAT_NODE_MEM_MAP=y
-CONFIG_PAGEFLAGS_EXTENDED=y
-
-#
-# Boot options
-#
-CONFIG_AUTO_ZRELADDR=y
-
-#
-# FIR device drivers
-#
-CONFIG_PXA_FICP=m
-
-#
-# RAM/ROM/Flash chip drivers
-#
-CONFIG_MTD_MAP_BANK_WIDTH_1=y
-CONFIG_MTD_MAP_BANK_WIDTH_2=y
-CONFIG_MTD_MAP_BANK_WIDTH_4=y
-CONFIG_MTD_CFI_I1=y
-CONFIG_MTD_CFI_I2=y
-
-#
-# PATA SFF controllers with BMDMA
-#
-CONFIG_PATA_PXA=y
-
-#
-# Non-8250 serial port support
-#
-CONFIG_SERIAL_PXA=y
-CONFIG_SERIAL_PXA_CONSOLE=y
-
-#
-# I2C system bus drivers (mostly embedded / system-on-chip)
-#
-CONFIG_I2C_PXA=y
-
-#
-# SPI Master Controller Drivers
-#
-CONFIG_SPI_PXA2XX=y
-
-#
-# Multimedia Capabilities Port drivers
-#
-CONFIG_REGULATOR=y
-CONFIG_REGULATOR_DUMMY=y
-
-
-#
-# Console display driver support
-#
-CONFIG_SND_VMASTER=y
-CONFIG_SND_PXA2XX_PCM=m
-CONFIG_SND_PXA2XX_LIB=m
-CONFIG_SND_PXA2XX_LIB_AC97=y
-CONFIG_SND_PXA2XX_AC97=m
-CONFIG_SND_PXA2XX_SOC=m
-
-#
-# MMC/SD/SDIO Host Controller Drivers
-#
-CONFIG_MMC_PXA=y
diff --git a/recipes-kernel/linux/linux-yocto-3.8/zaurus-pxa-only.scc b/recipes-kernel/linux/linux-yocto-3.8/zaurus-pxa-only.scc
deleted file mode 100644
index 037a2e4..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/zaurus-pxa-only.scc
+++ /dev/null
@@ -1,2 +0,0 @@
-kconf hardware zaurus-pxa-common.cfg
-kconf non-hardware zaurus-pxa-common-non-hw.cfg
diff --git a/recipes-kernel/linux/linux-yocto-3.8/zaurus-usb-host.scc b/recipes-kernel/linux/linux-yocto-3.8/zaurus-usb-host.scc
deleted file mode 100644
index 19f7523..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/zaurus-usb-host.scc
+++ /dev/null
@@ -1,6 +0,0 @@
-kconf hardware zaurus-usb-ohci.cfg
-kconf non-hardware zaurus-usb-ohci-non-hw.cfg
-
-include features/usb/ohci-hcd.scc
-include features/usb-net/usb-net.scc
-#include cfg/usb-mass-storage.scc
diff --git a/recipes-kernel/linux/linux-yocto-3.8/zaurus-usb-ohci-non-hw.cfg b/recipes-kernel/linux/linux-yocto-3.8/zaurus-usb-ohci-non-hw.cfg
deleted file mode 100644
index f20d7e6..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/zaurus-usb-ohci-non-hw.cfg
+++ /dev/null
@@ -1,4 +0,0 @@
-#
-# Console display driver support
-#
-CONFIG_SND_RAWMIDI_SEQ=m
diff --git a/recipes-kernel/linux/linux-yocto-3.8/zaurus-usb-ohci.cfg b/recipes-kernel/linux/linux-yocto-3.8/zaurus-usb-ohci.cfg
deleted file mode 100644
index 788bd05..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/zaurus-usb-ohci.cfg
+++ /dev/null
@@ -1,110 +0,0 @@
-#
-# Bluetooth device drivers
-#
-CONFIG_BT_HCIBTUSB=m
-CONFIG_BT_HCIBCM203X=m
-CONFIG_BT_HCIBPA10X=m
-CONFIG_BT_HCIBFUSB=m
-CONFIG_BT_ATH3K=m
-
-#
-# USB Network Adapters
-#
-CONFIG_USB_CATC=m
-CONFIG_USB_RTL8150=m
-CONFIG_USB_NET_CDC_NCM=m
-CONFIG_USB_SIERRA_NET=m
-
-#
-# Console display driver support
-#
-CONFIG_SND_HWDEP=m
-CONFIG_SND_RAWMIDI=m
-CONFIG_SND_USB=y
-CONFIG_SND_USB_AUDIO=m
-
-#
-# USB Input Devices
-#
-CONFIG_USB_HID=m
-
-#
-# USB HID Boot Protocol drivers
-#
-CONFIG_USB_KBD=m
-CONFIG_USB_MOUSE=m
-
-#
-# Special HID drivers
-#
-CONFIG_USB_ARCH_HAS_OHCI=y
-CONFIG_USB_DEBUG=y
-CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
-
-#
-# Miscellaneous USB options
-#
-CONFIG_USB_DEVICEFS=y
-CONFIG_USB_DEVICE_CLASS=y
-CONFIG_USB_MON=m
-
-#
-# USB Host Controller Drivers
-#
-CONFIG_USB_SL811_HCD=m
-CONFIG_USB_SL811_CS=m
-
-#
-# USB Device Class drivers
-#
-CONFIG_USB_ACM=m
-CONFIG_USB_PRINTER=m
-
-#
-# USB Imaging devices
-#
-CONFIG_USB_MDC800=m
-CONFIG_USB_MICROTEK=m
-
-#
-# USB port drivers
-#
-CONFIG_USB_SERIAL=m
-CONFIG_USB_EZUSB=y
-CONFIG_USB_SERIAL_GENERIC=y
-CONFIG_USB_SERIAL_BELKIN=m
-CONFIG_USB_SERIAL_DIGI_ACCELEPORT=m
-CONFIG_USB_SERIAL_CYPRESS_M8=m
-CONFIG_USB_SERIAL_EMPEG=m
-CONFIG_USB_SERIAL_FTDI_SIO=m
-CONFIG_USB_SERIAL_VISOR=m
-CONFIG_USB_SERIAL_IPAQ=m
-CONFIG_USB_SERIAL_IR=m
-CONFIG_USB_SERIAL_EDGEPORT=m
-CONFIG_USB_SERIAL_EDGEPORT_TI=m
-CONFIG_USB_SERIAL_GARMIN=m
-CONFIG_USB_SERIAL_IPW=m
-CONFIG_USB_SERIAL_KEYSPAN_PDA=m
-CONFIG_USB_SERIAL_KEYSPAN=m
-CONFIG_USB_SERIAL_KLSI=m
-CONFIG_USB_SERIAL_KOBIL_SCT=m
-CONFIG_USB_SERIAL_MCT_U232=m
-CONFIG_USB_SERIAL_PL2303=m
-CONFIG_USB_SERIAL_SAFE=m
-CONFIG_USB_SERIAL_TI=m
-CONFIG_USB_SERIAL_CYBERJACK=m
-CONFIG_USB_SERIAL_XIRCOM=m
-CONFIG_USB_SERIAL_WWAN=m
-CONFIG_USB_SERIAL_OMNINET=m
-
-#
-# USB Miscellaneous drivers
-#
-CONFIG_USB_EMI62=m
-CONFIG_USB_EMI26=m
-CONFIG_USB_RIO500=m
-CONFIG_USB_LEGOTOWER=m
-CONFIG_USB_LCD=m
-CONFIG_USB_LED=m
-CONFIG_USB_CYTHERM=m
-CONFIG_USB_IDMOUSE=m
diff --git a/recipes-kernel/linux/linux-yocto_3.8.bbappend b/recipes-kernel/linux/linux-yocto_3.8.bbappend
deleted file mode 100644
index 5423210..0000000
--- a/recipes-kernel/linux/linux-yocto_3.8.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.8:${THISDIR}/${PN}:${THISDIR}/files:"
-
-require linux-yocto-handhelds.inc
-- 
1.8.1.5


