Received: from mail-ea0-f169.google.com ([209.85.215.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UHN60-00010G-6L
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Mar 2013 00:34:48 +0100
Received: by mail-ea0-f169.google.com with SMTP id z7so2239455eaf.14
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Mar 2013 16:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=G38gNKnlAYv5knpjKmabPEy3WyQShYkbUQqWIYW9a+0=;
	b=VeEUOYmzFbLrd/oQxRLkoJe9fyvI7gJjiWWrf1+W9dwA205NRJc2znKtHimg5i3LjL
	R7fLD8QLoJZ6OXdr+PO3YyD28bx6Y6phMkStR8i/0IbtOZ8dMiPxd3A9fBHdvVcC8Xjo
	JpbBvvNGtN2K6JZXGL+njTABR19jLMQKhYP51XplUUk1e4YH0QHUUh2sP8dVG6ofjJ6X
	mRGqBSUlmANTETPWEymj075vv5K5WxJt8/gsIksw5MQtdmTNbXUNo2H3f3xrwB7q+914
	YPTedsFYlhv7zq27wBqK6q9qUn5EqRm9IjT7omLM9/QNirboOucl6xSYvSilxThT7opt
	CWIQ==
X-Received: by 10.14.173.196 with SMTP id v44mr42755591eel.29.1363562265264;
	Sun, 17 Mar 2013 16:17:45 -0700 (PDT)
Received: from mizar.localdomain
	(host195-251-dynamic.8-87-r.retail.telecomitalia.it. [87.8.251.195])
	by mx.google.com with ESMTPS id z45sm23918077eeu.10.2013.03.17.16.17.43
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 17 Mar 2013 16:17:44 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Mar 2013 00:17:17 +0100
Message-Id: <3e2b753e67779dcc1a1e1ba433139fd3b245e415.1363561878.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1363561878.git.andrea.adami@gmail.com>
References: <cover.1363561878.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1363561878.git.andrea.adami@gmail.com>
References: <cover.1363561878.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 4/5] linux-yocto-3.4: remove temporary version. Replace with 3.8
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
X-List-Received-Date: Sun, 17 Mar 2013 23:34:55 -0000

* this version was initially used to split the config
* but has been rapidly superseded by 3.6 and now 3.8

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.4/akita/akita-standard.scc |   7 -
 .../linux/linux-yocto-3.4/akita/akita.cfg          |   4 -
 .../linux/linux-yocto-3.4/akita/akita.scc          |  11 -
 .../linux/linux-yocto-3.4/c7x0/c7x0-standard.scc   |   7 -
 recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg |  57 ---
 recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.scc |  10 -
 .../linux-yocto-3.4/collie/collie-standard.scc     |   7 -
 .../linux/linux-yocto-3.4/collie/collie.cfg        |  86 -----
 .../linux/linux-yocto-3.4/collie/collie.scc        |   5 -
 .../linux/linux-yocto-3.4/feature-top.scc          |   1 -
 .../linux-yocto-3.4/locomo_kbd_tweak-r2.patch      |  80 ----
 .../linux-yocto-3.4/poodle/poodle-standard.scc     |   7 -
 .../linux/linux-yocto-3.4/poodle/poodle.cfg        |  62 ----
 .../linux/linux-yocto-3.4/poodle/poodle.scc        |  10 -
 .../linux/linux-yocto-3.4/pxa25x-gpio-wakeup.patch |  40 --
 .../linux/linux-yocto-3.4/pxa25x-sa1100-rtc.patch  |  29 --
 .../linux/linux-yocto-3.4/pxa27x-sa1100-rtc.patch  |  29 --
 .../linux/linux-yocto-3.4/sharpsl_param.patch      |  24 --
 .../linux/linux-yocto-3.4/spi-pxa2xx-fix-mem.patch |  34 --
 .../linux/linux-yocto-3.4/spitz/spitz-standard.scc |   7 -
 .../linux/linux-yocto-3.4/spitz/spitz.cfg          |  67 ----
 .../linux/linux-yocto-3.4/spitz/spitz.scc          |  10 -
 .../linux/linux-yocto-3.4/spitz_pm.patch           |  53 ---
 .../linux/linux-yocto-3.4/tosa/tosa-standard.scc   |   7 -
 recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg |  62 ----
 recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.scc |  10 -
 .../linux/linux-yocto-3.4/zaurus-common.scc        |  10 -
 .../linux/linux-yocto-3.4/zaurus-hardware.cfg      | 279 --------------
 .../linux/linux-yocto-3.4/zaurus-non-hardware.cfg  | 401 ---------------------
 .../linux-yocto-3.4/zaurus-pxa-common-non-hw.cfg   |   9 -
 .../linux/linux-yocto-3.4/zaurus-pxa-common.cfg    |  98 -----
 .../linux/linux-yocto-3.4/zaurus-pxa-only.scc      |   2 -
 .../linux/linux-yocto-3.4/zaurus-usb-host.scc      |   6 -
 .../linux-yocto-3.4/zaurus-usb-ohci-non-hw.cfg     |   4 -
 .../linux/linux-yocto-3.4/zaurus-usb-ohci.cfg      | 110 ------
 recipes-kernel/linux/linux-yocto_3.4.bbappend      |  54 ---
 36 files changed, 1699 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/akita/akita-standard.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/akita/akita.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0-standard.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/collie/collie-standard.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/collie/collie.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/collie/collie.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/feature-top.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/locomo_kbd_tweak-r2.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/poodle/poodle-standard.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/pxa25x-gpio-wakeup.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/pxa25x-sa1100-rtc.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/pxa27x-sa1100-rtc.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/sharpsl_param.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/spi-pxa2xx-fix-mem.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/spitz/spitz-standard.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/spitz_pm.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/tosa/tosa-standard.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-common.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-non-hardware.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common-non-hw.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-only.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-usb-host.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-usb-ohci-non-hw.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-usb-ohci.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto_3.4.bbappend

diff --git a/recipes-kernel/linux/linux-yocto-3.4/akita/akita-standard.scc b/recipes-kernel/linux/linux-yocto-3.4/akita/akita-standard.scc
deleted file mode 100644
index 21096d0..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/akita/akita-standard.scc
+++ /dev/null
@@ -1,7 +0,0 @@
-define KMACHINE akita
-define KTYPE standard
-define KARCH arm
-
-include ktypes/standard/standard.scc
-
-include akita.scc
diff --git a/recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg b/recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg
deleted file mode 100644
index f6eb8f2..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg
+++ /dev/null
@@ -1,4 +0,0 @@
-#
-# System Type
-#
-CONFIG_GPIO_PCA953X=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/akita/akita.scc b/recipes-kernel/linux/linux-yocto-3.4/akita/akita.scc
deleted file mode 100644
index e1549ef..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/akita/akita.scc
+++ /dev/null
@@ -1,11 +0,0 @@
-kconf hardware ../spitz/spitz.cfg
-kconf hardware akita.cfg
-
-include ../zaurus-pxa-only.scc
-include ../zaurus-common.scc
-include ../zaurus-usb-host.scc
-
-patch sharpsl_param.patch
-patch spitz_pm.patch
-patch pxa27x-sa1100-rtc.patch
-patch spi-pxa2xx-fix-mem.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0-standard.scc b/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0-standard.scc
deleted file mode 100644
index 325c7c7..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0-standard.scc
+++ /dev/null
@@ -1,7 +0,0 @@
-define KMACHINE c7x0
-define KTYPE standard
-define KARCH arm
-
-include ktypes/standard/standard.scc
-
-include c7x0.scc
diff --git a/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg b/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg
deleted file mode 100644
index e888c26..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg
+++ /dev/null
@@ -1,57 +0,0 @@
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
-
-#
-# on-CPU RTC drivers
-#
-CONFIG_RTC_DRV_SA1100=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.scc b/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.scc
deleted file mode 100644
index c33c7f5..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.scc
+++ /dev/null
@@ -1,10 +0,0 @@
-kconf hardware c7x0.cfg
-
-include ../zaurus-pxa-only.scc
-include ../zaurus-common.scc
-
-patch sharpsl_param.patch
-patch pxa25x-gpio-wakeup.patch
-patch pxa25x-sa1100-rtc.patch
-patch spi-pxa2xx-fix-mem.patch
-
diff --git a/recipes-kernel/linux/linux-yocto-3.4/collie/collie-standard.scc b/recipes-kernel/linux/linux-yocto-3.4/collie/collie-standard.scc
deleted file mode 100644
index 7283ad9..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/collie/collie-standard.scc
+++ /dev/null
@@ -1,7 +0,0 @@
-define KMACHINE collie
-define KTYPE standard
-define KARCH arm
-
-include ktypes/standard/standard.scc
-
-include collie.scc
diff --git a/recipes-kernel/linux/linux-yocto-3.4/collie/collie.cfg b/recipes-kernel/linux/linux-yocto-3.4/collie/collie.cfg
deleted file mode 100644
index 791c966..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/collie/collie.cfg
+++ /dev/null
@@ -1,86 +0,0 @@
-#
-# System Type
-#
-CONFIG_ARCH_SA1100=y
-
-#
-# Processor Features
-#
-CONFIG_SHARP_LOCOMO=y
-
-#
-# SA11x0 Implementations
-#
-CONFIG_SA1100_COLLIE=y
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
-CONFIG_MTD_CFI_INTELEXT=y
-CONFIG_MTD_CFI_UTIL=y
-
-#
-# Mapping drivers for chip access
-#
-CONFIG_MTD_SA1100=y
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
-# on-CPU RTC drivers
-#
-CONFIG_RTC_DRV_SA1100=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/collie/collie.scc b/recipes-kernel/linux/linux-yocto-3.4/collie/collie.scc
deleted file mode 100644
index b7c11fa..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/collie/collie.scc
+++ /dev/null
@@ -1,5 +0,0 @@
-kconf hardware collie.cfg
-
-include ../zaurus-common.scc
-
-patch locomo_kbd_tweak-r2.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.4/feature-top.scc b/recipes-kernel/linux/linux-yocto-3.4/feature-top.scc
deleted file mode 100644
index fdffa2a..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/feature-top.scc
+++ /dev/null
@@ -1 +0,0 @@
-# placeholder
diff --git a/recipes-kernel/linux/linux-yocto-3.4/locomo_kbd_tweak-r2.patch b/recipes-kernel/linux/linux-yocto-3.4/locomo_kbd_tweak-r2.patch
deleted file mode 100644
index e6178e2..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/locomo_kbd_tweak-r2.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From e60a4a9a3336a24a8e6ca3ea69587c60cb953881 Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Sat, 21 Apr 2012 23:48:57 +0200
-Subject: [PATCH 43/43] locomokbd: apply tweaks for Zaurus
-
-* from http://www.rpsys.net/openzaurus/patches/
-
-Signed-off-by: Richard Purdie <rpurdie@rpsys.net>
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- drivers/input/keyboard/locomokbd.c |   45 ++++++++++++++++++++---------------
- 1 files changed, 26 insertions(+), 19 deletions(-)
-
-diff --git a/drivers/input/keyboard/locomokbd.c b/drivers/input/keyboard/locomokbd.c
-index b1ab298..9bb5bc6 100644
---- a/drivers/input/keyboard/locomokbd.c
-+++ b/drivers/input/keyboard/locomokbd.c
-@@ -41,25 +41,32 @@ MODULE_LICENSE("GPL");
- 
- #define LOCOMOKBD_NUMKEYS	128
- 
--#define KEY_ACTIVITY		KEY_F16
--#define KEY_CONTACT		KEY_F18
--#define KEY_CENTER		KEY_F15
--
--static const unsigned char
-+#define LOCOMO_KEY_CALENDER	KEY_LEFTCTRL
-+#define LOCOMO_KEY_ADDRESS	KEY_LEFTALT	/* Needed for SysRQ */
-+#define LOCOMO_KEY_HOME		KEY_SYSRQ	/* Needed for SysRQ */
-+#define LOCOMO_KEY_MENU		KEY_F12
-+#define LOCOMO_KEY_MAIL		KEY_F10
-+#define LOCOMO_KEY_OK		KEY_F11		/* Don't hardwire to KEY_RETURN */
-+#define LOCOMO_KEY_CANCEL	KEY_POWER
-+#define LOCOMO_KEY_CENTER	KEY_F5		/* Don't hardwire to KEY_RETURN */
-+
-+#define LOCOMO_KEY_FN		KEY_F9
-+
-+static const unsigned char 
- locomokbd_keycode[LOCOMOKBD_NUMKEYS] __devinitconst = {
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
-@@ -68,7 +75,7 @@ locomokbd_keycode[LOCOMOKBD_NUMKEYS] __devinitconst = {
- #define SCANCODE(c,r)		( ((c)<<4) + (r) + 1 )
- 
- #define KB_DELAY		8
--#define SCAN_INTERVAL		(HZ/10)
-+#define SCAN_INTERVAL		(HZ/20)
- 
- struct locomokbd {
- 	unsigned char keycode[LOCOMOKBD_NUMKEYS];
--- 
-1.7.3.4
-
diff --git a/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle-standard.scc b/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle-standard.scc
deleted file mode 100644
index 31ad9df..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle-standard.scc
+++ /dev/null
@@ -1,7 +0,0 @@
-define KMACHINE poodle
-define KTYPE standard
-define KARCH arm
-
-include ktypes/standard/standard.scc
-
-include poodle.scc
diff --git a/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.cfg b/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.cfg
deleted file mode 100644
index 571df39..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.cfg
+++ /dev/null
@@ -1,62 +0,0 @@
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
-
-#
-# on-CPU RTC drivers
-#
-CONFIG_RTC_DRV_SA1100=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.scc b/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.scc
deleted file mode 100644
index fddbbfb..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.scc
+++ /dev/null
@@ -1,10 +0,0 @@
-kconf hardware poodle.cfg
-
-include ../zaurus-pxa-only.scc
-include ../zaurus-common.scc
-
-patch locomo_kbd_tweak-r2.patch
-patch sharpsl_param.patch
-patch pxa25x-gpio-wakeup.patch
-patch pxa25x-sa1100-rtc.patch
-patch spi-pxa2xx-fix-mem.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.4/pxa25x-gpio-wakeup.patch b/recipes-kernel/linux/linux-yocto-3.4/pxa25x-gpio-wakeup.patch
deleted file mode 100644
index 26b8ca5..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/pxa25x-gpio-wakeup.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From d406628a734b1b852bf08cac31d95fcd73cf797f Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Sat, 17 Nov 2012 01:04:07 +0100
-Subject: [PATCH 1/1] ARM: pxa: fix pxa25x gpio wakeup setting
-
-* Since 3.3 gpio wakeup is broken on pxa25x (tested on corgi and poodle).
-* Use gpio_set_wake like done for pxa27x with commit id
-* b95ace54a23e2f8ebb032744cebb17c9f43bf651
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- arch/arm/mach-pxa/pxa25x.c |    5 +++++
- 1 files changed, 5 insertions(+), 0 deletions(-)
-
-diff --git a/arch/arm/mach-pxa/pxa25x.c b/arch/arm/mach-pxa/pxa25x.c
-index 3352b37..aeb913e 100644
---- a/arch/arm/mach-pxa/pxa25x.c
-+++ b/arch/arm/mach-pxa/pxa25x.c
-@@ -338,6 +338,10 @@ void __init pxa25x_map_io(void)
- 	pxa25x_get_clk_frequency_khz(1);
- }
- 
-+static struct pxa_gpio_platform_data pxa25x_gpio_info __initdata = {
-+	.gpio_set_wake = gpio_set_wake,
-+};
-+
- static struct platform_device *pxa25x_devices[] __initdata = {
- 	&pxa25x_device_udc,
- 	&pxa_device_pmu,
-@@ -370,6 +374,7 @@ static int __init pxa25x_init(void)
- 		register_syscore_ops(&pxa2xx_mfp_syscore_ops);
- 		register_syscore_ops(&pxa2xx_clock_syscore_ops);
- 
-+		pxa_register_device(&pxa_device_gpio, &pxa25x_gpio_info);
- 		ret = platform_add_devices(pxa25x_devices,
- 					   ARRAY_SIZE(pxa25x_devices));
- 		if (ret)
--- 
-1.7.8.6
-
diff --git a/recipes-kernel/linux/linux-yocto-3.4/pxa25x-sa1100-rtc.patch b/recipes-kernel/linux/linux-yocto-3.4/pxa25x-sa1100-rtc.patch
deleted file mode 100644
index b53d20e..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/pxa25x-sa1100-rtc.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 40cea1b97cdc69b70d465f2b3a298eb46020a947 Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Thu, 22 Nov 2012 23:16:21 +0100
-Subject: [PATCH] ARM: pxa: pxa25x.c: add dummy SA1100 rtc clock
-
-* fix failure seen on Zaurus corgi:
-* sa1100-rtc sa1100-rtc: failed to find rtc clock source
-* sa1100-rtc: probe of sa1100-rtc failed with error -2
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- arch/arm/mach-pxa/pxa25x.c |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/arch/arm/mach-pxa/pxa25x.c b/arch/arm/mach-pxa/pxa25x.c
-index 3352b37..0f05671 100644
---- a/arch/arm/mach-pxa/pxa25x.c
-+++ b/arch/arm/mach-pxa/pxa25x.c
-@@ -209,6 +209,7 @@ static struct clk_lookup pxa25x_clkregs[] = {
- 	INIT_CLKREG(&clk_pxa25x_gpio12, NULL, "GPIO12_CLK"),
- 	INIT_CLKREG(&clk_pxa25x_mem, "pxa2xx-pcmcia", NULL),
- 	INIT_CLKREG(&clk_dummy, "pxa-gpio", NULL),
-+	INIT_CLKREG(&clk_dummy, "sa1100-rtc", NULL),
- };
- 
- static struct clk_lookup pxa25x_hwuart_clkreg =
--- 
-1.7.8.6
-
diff --git a/recipes-kernel/linux/linux-yocto-3.4/pxa27x-sa1100-rtc.patch b/recipes-kernel/linux/linux-yocto-3.4/pxa27x-sa1100-rtc.patch
deleted file mode 100644
index d3f643d..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/pxa27x-sa1100-rtc.patch
+++ /dev/null
@@ -1,29 +0,0 @@
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
--- 
-1.7.8.6
-
diff --git a/recipes-kernel/linux/linux-yocto-3.4/sharpsl_param.patch b/recipes-kernel/linux/linux-yocto-3.4/sharpsl_param.patch
deleted file mode 100644
index c626e92..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/sharpsl_param.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Signed-off-by: Marko Katic <dromede.gmail.com>
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
-+	void * param_start = phys_to_virt(PARAM_BASE);
-+	memcpy(&sharpsl_param, param_start, sizeof(struct sharpsl_param_info));
- 
- 	if (sharpsl_param.comadj_keyword != COMADJ_MAGIC)
- 		sharpsl_param.comadj=-1;
diff --git a/recipes-kernel/linux/linux-yocto-3.4/spi-pxa2xx-fix-mem.patch b/recipes-kernel/linux/linux-yocto-3.4/spi-pxa2xx-fix-mem.patch
deleted file mode 100644
index e20b597..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/spi-pxa2xx-fix-mem.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
-index dc25bee..b25fe27 100644
---- a/drivers/spi/spi-pxa2xx.c
-+++ b/drivers/spi/spi-pxa2xx.c
-@@ -106,6 +106,7 @@ struct driver_data {
- 	int rx_channel;
- 	int tx_channel;
- 	u32 *null_dma_buf;
-+	u8 null_dma_buf_unaligned[16];
- 
- 	/* SSP register addresses */
- 	void __iomem *ioaddr;
-@@ -1543,8 +1544,8 @@ static int __devinit pxa2xx_spi_probe(struct platform_device *pdev)
- 		return -ENODEV;
- 	}
- 
--	/* Allocate master with space for drv_data and null dma buffer */
--	master = spi_alloc_master(dev, sizeof(struct driver_data) + 16);
-+	/* Allocate master with space for drv_data */
-+	master = spi_alloc_master(dev, sizeof(struct driver_data));
- 	if (!master) {
- 		dev_err(&pdev->dev, "cannot alloc spi_master\n");
- 		pxa_ssp_free(ssp);
-@@ -1569,8 +1570,8 @@ static int __devinit pxa2xx_spi_probe(struct platform_device *pdev)
- 	master->transfer = transfer;
- 
- 	drv_data->ssp_type = ssp->type;
--	drv_data->null_dma_buf = (u32 *)ALIGN((u32)(drv_data +
--						sizeof(struct driver_data)), 8);
-+	drv_data->null_dma_buf =
-+		(u32 *)PTR_ALIGN(&drv_data->null_dma_buf_unaligned, 8);
- 
- 	drv_data->ioaddr = ssp->mmio_base;
- 	drv_data->ssdr_physical = ssp->phys_base + SSDR;
diff --git a/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz-standard.scc b/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz-standard.scc
deleted file mode 100644
index 5b8e2c3..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz-standard.scc
+++ /dev/null
@@ -1,7 +0,0 @@
-define KMACHINE spitz
-define KTYPE standard
-define KARCH arm
-
-include ktypes/standard/standard.scc
-
-include spitz.scc
diff --git a/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.cfg b/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.cfg
deleted file mode 100644
index 86494df..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.cfg
+++ /dev/null
@@ -1,67 +0,0 @@
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
-
-#
-# on-CPU RTC drivers
-#
-CONFIG_RTC_DRV_PXA=y
-CONFIG_RTC_DRV_SA1100=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.scc b/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.scc
deleted file mode 100644
index fe6aac8..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.scc
+++ /dev/null
@@ -1,10 +0,0 @@
-kconf hardware spitz.cfg
-
-include ../zaurus-pxa-only.scc
-include ../zaurus-common.scc
-include ../zaurus-usb-host.scc
-
-patch sharpsl_param.patch
-patch spitz_pm.patch
-patch pxa27x-sa1100-rtc.patch
-patch spi-pxa2xx-fix-mem.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.4/spitz_pm.patch b/recipes-kernel/linux/linux-yocto-3.4/spitz_pm.patch
deleted file mode 100644
index 34bcb9d..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/spitz_pm.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-Subject: [PATCH] [ARM] pxa/spitz_pm.c: Fix hang under certain conditions when resuming from STR.
-
-Devices that use spitz_pm.c will fail to resume
-from STR (Suspend To Ram) when the charger plug is inserted
-or removed when a device is in STR mode. The culprit is
-a misconfigured gpio line - GPIO18. GPIO18 should be configured as a
-regular GPIO input but it gets configured as an alternate function
-GPIO18_RDY. And then later in postsuspend() it gets configured as
-a regular GPIO18 input line.
-
-Fix this by removing the GPIO18_RDY configuration so that GPIO18
-only gets configured as a regular gpio input.
-
-Signed-off-by: Marko Katic <dromede@gmail.com>
----
- arch/arm/mach-pxa/spitz_pm.c |    8 ++------
- 1 files changed, 2 insertions(+), 6 deletions(-)
-
-diff --git a/arch/arm/mach-pxa/spitz_pm.c b/arch/arm/mach-pxa/spitz_pm.c
-index 438f02f..842596d 100644
---- a/arch/arm/mach-pxa/spitz_pm.c
-+++ b/arch/arm/mach-pxa/spitz_pm.c
-@@ -86,10 +86,7 @@ static void spitz_discharge1(int on)
- 	gpio_set_value(SPITZ_GPIO_LED_GREEN, on);
- }
- 
--static unsigned long gpio18_config[] = {
--	GPIO18_RDY,
--	GPIO18_GPIO,
--};
-+static unsigned long gpio18_config = GPIO18_GPIO;
- 
- static void spitz_presuspend(void)
- {
-@@ -112,7 +109,7 @@ static void spitz_presuspend(void)
- 	PGSR3 &= ~SPITZ_GPIO_G3_STROBE_BIT;
- 	PGSR2 |= GPIO_bit(SPITZ_GPIO_KEY_STROBE0);
- 
--	pxa2xx_mfp_config(&gpio18_config[0], 1);
-+	pxa2xx_mfp_config(&gpio18_config, 1);
- 	gpio_request_one(18, GPIOF_OUT_INIT_HIGH, "Unknown");
- 	gpio_free(18);
- 
-@@ -131,7 +128,6 @@ static void spitz_presuspend(void)
- 
- static void spitz_postsuspend(void)
- {
--	pxa2xx_mfp_config(&gpio18_config[1], 1);
- }
- 
- static int spitz_should_wakeup(unsigned int resume_on_alarm)
--- 
-1.7.4.1
diff --git a/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa-standard.scc b/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa-standard.scc
deleted file mode 100644
index b2e1324..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa-standard.scc
+++ /dev/null
@@ -1,7 +0,0 @@
-define KMACHINE tosa
-define KTYPE standard
-define KARCH arm
-
-include ktypes/standard/standard.scc
-
-include tosa.scc
diff --git a/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg b/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg
deleted file mode 100644
index 085e1d2..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg
+++ /dev/null
@@ -1,62 +0,0 @@
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
-#
-# on-CPU RTC drivers
-#
-CONFIG_RTC_DRV_SA1100=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.scc b/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.scc
deleted file mode 100644
index db5e176..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.scc
+++ /dev/null
@@ -1,10 +0,0 @@
-kconf hardware tosa.cfg
-
-include ../zaurus-pxa-only.scc
-include ../zaurus-common.scc
-include ../zaurus-usb-host.scc
-
-patch sharpsl_param.patch
-patch pxa25x-gpio-wakeup.patch
-patch pxa25x-sa1100-rtc.patch
-patch spi-pxa2xx-fix-mem.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.4/zaurus-common.scc b/recipes-kernel/linux/linux-yocto-3.4/zaurus-common.scc
deleted file mode 100644
index bc67bd9..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/zaurus-common.scc
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
diff --git a/recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg b/recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg
deleted file mode 100644
index b01ec8f..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg
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
-CONFIG_ARCH_HAS_CPU_IDLE_WAIT=y
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
-CONFIG_MTD_MAP_BANK_WIDTH_1=y
-CONFIG_MTD_MAP_BANK_WIDTH_2=y
-CONFIG_MTD_MAP_BANK_WIDTH_4=y
-CONFIG_MTD_CFI_I1=y
-CONFIG_MTD_CFI_I2=y
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
-# Multimedia Capabilities Port drivers
-#
-CONFIG_REGULATOR=y
-CONFIG_REGULATOR_DUMMY=y
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
-CONFIG_HID_SUPPORT=y
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
-CONFIG_USB_FILE_STORAGE=m
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
-# Kernel hacking
-#
-CONFIG_ARM_UNWIND=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/zaurus-non-hardware.cfg b/recipes-kernel/linux/linux-yocto-3.4/zaurus-non-hardware.cfg
deleted file mode 100644
index d76d794..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/zaurus-non-hardware.cfg
+++ /dev/null
@@ -1,401 +0,0 @@
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
-CONFIG_EXT4_FS_XATTR=y
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
diff --git a/recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common-non-hw.cfg b/recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common-non-hw.cfg
deleted file mode 100644
index 75c3626..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common-non-hw.cfg
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
diff --git a/recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common.cfg b/recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common.cfg
deleted file mode 100644
index dace6fd..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common.cfg
+++ /dev/null
@@ -1,98 +0,0 @@
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
-CONFIG_ARM_L1_CACHE_SHIFT=5
-CONFIG_XSCALE_PMU=y
-CONFIG_CPU_HAS_PMU=y
-CONFIG_MULTI_IRQ_HANDLER=y
-CONFIG_SHARP_PARAM=y
-CONFIG_SHARP_SCOOP=y
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
diff --git a/recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-only.scc b/recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-only.scc
deleted file mode 100644
index 037a2e4..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-only.scc
+++ /dev/null
@@ -1,2 +0,0 @@
-kconf hardware zaurus-pxa-common.cfg
-kconf non-hardware zaurus-pxa-common-non-hw.cfg
diff --git a/recipes-kernel/linux/linux-yocto-3.4/zaurus-usb-host.scc b/recipes-kernel/linux/linux-yocto-3.4/zaurus-usb-host.scc
deleted file mode 100644
index 19f7523..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/zaurus-usb-host.scc
+++ /dev/null
@@ -1,6 +0,0 @@
-kconf hardware zaurus-usb-ohci.cfg
-kconf non-hardware zaurus-usb-ohci-non-hw.cfg
-
-include features/usb/ohci-hcd.scc
-include features/usb-net/usb-net.scc
-#include cfg/usb-mass-storage.scc
diff --git a/recipes-kernel/linux/linux-yocto-3.4/zaurus-usb-ohci-non-hw.cfg b/recipes-kernel/linux/linux-yocto-3.4/zaurus-usb-ohci-non-hw.cfg
deleted file mode 100644
index f20d7e6..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/zaurus-usb-ohci-non-hw.cfg
+++ /dev/null
@@ -1,4 +0,0 @@
-#
-# Console display driver support
-#
-CONFIG_SND_RAWMIDI_SEQ=m
diff --git a/recipes-kernel/linux/linux-yocto-3.4/zaurus-usb-ohci.cfg b/recipes-kernel/linux/linux-yocto-3.4/zaurus-usb-ohci.cfg
deleted file mode 100644
index 788bd05..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/zaurus-usb-ohci.cfg
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
diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel/linux/linux-yocto_3.4.bbappend
deleted file mode 100644
index 7772dde..0000000
--- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
+++ /dev/null
@@ -1,54 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.4:${THISDIR}/${PN}:${THISDIR}/files:"
-
-COMPATIBLE_MACHINE .= "|akita|c7x0|collie|poodle|spitz|tosa"
-
-DEFAULT_PREFERENCE_akita = "-1"
-DEFAULT_PREFERENCE_c7x0 = "-1"
-DEFAULT_PREFERENCE_collie = "-1"
-DEFAULT_PREFERENCE_poodle = "-1"
-DEFAULT_PREFERENCE_spitz = "-1"
-DEFAULT_PREFERENCE_tosa = "-1"
-
-KMACHINE_akita = "akita"
-KMACHINE_c7x0 = "c7x0"
-KMACHINE_collie = "collie"
-KMACHINE_poodle = "poodle"
-KMACHINE_spitz = "spitz"
-KMACHINE_tosa = "tosa"
-
-SRC_URI_append_akita = " \
-           file://feature-top.scc \
-           file://vga/logo_linux_clut224.ppm.bz2 \
-           "
-
-SRC_URI_append_c7x0 = " \
-           file://feature-top.scc \
-           file://vga/logo_linux_clut224.ppm.bz2 \
-           "
-
-SRC_URI_append_collie = " \
-           file://feature-top.scc \
-           file://qvga/logo_linux_clut224.ppm.bz2 \
-           "
-
-SRC_URI_append_poodle = " \
-           file://feature-top.scc \
-           file://qvga/logo_linux_clut224.ppm.bz2 \
-           "
-
-SRC_URI_append_spitz = " \
-           file://feature-top.scc \
-           file://vga/logo_linux_clut224.ppm.bz2 \
-           "
-
-SRC_URI_append_tosa = " \
-           file://feature-top.scc \
-           file://vga/logo_linux_clut224.ppm.bz2 \
-           "
-
-do_configure_prepend() {
-
-    if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then
-        install -m 0644 ${WORKDIR}/logo_linux_clut224.ppm ${WORKDIR}/linux/drivers/video/logo/logo_linux_clut224.ppm
-    fi
-}
-- 
1.7.12.4



