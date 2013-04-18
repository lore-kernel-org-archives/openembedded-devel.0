Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1USyxN-0005Ik-EK
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Apr 2013 02:13:40 +0200
Received: by mail-ee0-f48.google.com with SMTP id b15so1562156eek.35
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2013 16:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=BycR3Mn9m5dfrkdIUtHPCVh8FDAgAYwrH3bSP8Wa5yk=;
	b=aj8YOVU+iKh/6a8XLhqUqRuvF9S/dGRCgiKuZZaFX+XXzobRRd9sUGeVrU7jx4vpPx
	/XkCj3PEhFH68/yWTK7GRCUuhC62WP04ecnPHDzWytZ7r4S/LE8kfI0fofO+5S77GOG0
	zYmyffG66zIikIzMtPPzdfCsG9s/rYUIPiVjSPLkUYt5pq13+x1jDy+cGpEWY0tTsRUY
	lXY2VrViR7xVSHdqmSvQkFJKDNYJ8Vg5OTIM/lqJ6Y5g6y9iln441QK7WpvEkSH+DjJb
	IjFz1NML0Giq0FWRQ54GKOjWKxcgOjbTR9mo4B6iPaEbuyHJNYk7KI2RRXOC1A3zbHun
	aWyQ==
X-Received: by 10.15.98.66 with SMTP id bi42mr35142633eeb.39.1366329363771;
	Thu, 18 Apr 2013 16:56:03 -0700 (PDT)
Received: from mizar.localdomain
	(host5-250-dynamic.0-87-r.retail.telecomitalia.it. [87.0.250.5])
	by mx.google.com with ESMTPS id 8sm19118414eeg.15.2013.04.18.16.56.01
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 18 Apr 2013 16:56:02 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Apr 2013 01:52:06 +0200
Message-Id: <1366329127-8869-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH 1/2] linux-yocto_3.8: move Zaurus patches to the respective subdirs
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
X-List-Received-Date: Fri, 19 Apr 2013 00:13:46 -0000
X-List-Received-Date: Fri, 19 Apr 2013 00:13:46 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.8/akita/akita.scc          |   8 +-
 recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc |   6 +-
 .../linux/linux-yocto-3.8/collie-eraseinfo.patch   |  31 -----
 .../linux/linux-yocto-3.8/collie-jedec-probe.patch |  11 --
 .../linux/linux-yocto-3.8/collie/collie.scc        |   8 +-
 .../linux-yocto-3.8/locomo_kbd_tweak-r2.patch      |  75 ------------
 .../linux/linux-yocto-3.8/mcp-device.patch         |  13 --
 .../patches-locomokbd/locomo_kbd_tweak-r2.patch    |  75 ++++++++++++
 .../patches/patches-mfd/mcp-device.patch           |  13 ++
 .../patches/patches-mtd/collie-eraseinfo.patch     |  31 +++++
 .../patches/patches-mtd/collie-jedec-probe.patch   |  11 ++
 .../patches/patches-pxa/pxa27x-sa1100-rtc.patch    |  34 ++++++
 .../patches/patches-pxa/pxamci-regulator.patch     | 135 +++++++++++++++++++++
 .../patches/patches-pxa/sharpsl_param.patch        |  24 ++++
 .../patches/patches-pxa/spi-pxa2xx-fix-mem.patch   |  34 ++++++
 .../linux/linux-yocto-3.8/poodle/poodle.scc        |   8 +-
 .../linux/linux-yocto-3.8/pxa27x-sa1100-rtc.patch  |  34 ------
 .../linux/linux-yocto-3.8/pxamci-regulator.patch   | 135 ---------------------
 .../linux/linux-yocto-3.8/sharpsl_param.patch      |  24 ----
 .../linux/linux-yocto-3.8/spi-pxa2xx-fix-mem.patch |  34 ------
 .../linux/linux-yocto-3.8/spitz/spitz.scc          |   8 +-
 recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc |   6 +-
 22 files changed, 379 insertions(+), 379 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/collie-eraseinfo.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/collie-jedec-probe.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/locomo_kbd_tweak-r2.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/mcp-device.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-mfd/mcp-device.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-eraseinfo.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-jedec-probe.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxa27x-sa1100-rtc.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxamci-regulator.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/sharpsl_param.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/spi-pxa2xx-fix-mem.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/pxa27x-sa1100-rtc.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/pxamci-regulator.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/sharpsl_param.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/spi-pxa2xx-fix-mem.patch

diff --git a/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc b/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
index b40cb7e..001b11b 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
+++ b/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
@@ -5,7 +5,7 @@ include ../zaurus-pxa-only.scc
 include ../zaurus-common.scc
 include ../zaurus-usb-host.scc
 
-patch sharpsl_param.patch
-patch pxa27x-sa1100-rtc.patch
-patch spi-pxa2xx-fix-mem.patch
-patch pxamci-regulator.patch
+patch ../patches/patches-pxa/sharpsl_param.patch
+patch ../patches/patches-pxa/pxa27x-sa1100-rtc.patch
+patch ../patches/patches-pxa/spi-pxa2xx-fix-mem.patch
+patch ../patches/patches-pxa/pxamci-regulator.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc b/recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc
index a732d5e..edb99b6 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc
+++ b/recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc
@@ -3,6 +3,6 @@ kconf hardware c7x0.cfg
 include ../zaurus-pxa-only.scc
 include ../zaurus-common.scc
 
-patch sharpsl_param.patch
-patch spi-pxa2xx-fix-mem.patch
-patch pxamci-regulator.patch
+patch ../patches/patches-pxa/sharpsl_param.patch
+patch ../patches/patches-pxa/spi-pxa2xx-fix-mem.patch
+patch ../patches/patches-pxa/pxamci-regulator.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/collie-eraseinfo.patch b/recipes-kernel/linux/linux-yocto-3.8/collie-eraseinfo.patch
deleted file mode 100644
index 6aba29e..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/collie-eraseinfo.patch
+++ /dev/null
@@ -1,31 +0,0 @@
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
-@@ -1299,13 +1299,14 @@
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
diff --git a/recipes-kernel/linux/linux-yocto-3.8/collie-jedec-probe.patch b/recipes-kernel/linux/linux-yocto-3.8/collie-jedec-probe.patch
deleted file mode 100644
index 530643e..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/collie-jedec-probe.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/arch/arm/mach-sa1100/collie.c
-+++ b/arch/arm/mach-sa1100/collie.c
-@@ -289,7 +289,7 @@
- }
- 
- static struct flash_platform_data collie_flash_data = {
--	.map_name	= "cfi_probe",
-+	.map_name	= "jedec_probe",
- 	.init		= collie_flash_init,
- 	.set_vpp	= collie_set_vpp,
- 	.exit		= collie_flash_exit,
diff --git a/recipes-kernel/linux/linux-yocto-3.8/collie/collie.scc b/recipes-kernel/linux/linux-yocto-3.8/collie/collie.scc
index 3f96f24..857586e 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/collie/collie.scc
+++ b/recipes-kernel/linux/linux-yocto-3.8/collie/collie.scc
@@ -2,7 +2,7 @@ kconf hardware collie.cfg
 
 include ../zaurus-common.scc
 
-patch locomo_kbd_tweak-r2.patch
-patch mcp-device.patch
-patch collie-jedec-probe.patch
-patch collie-eraseinfo.patch
+patch ../patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
+patch ../patches/patches-mfd/mcp-device.patch
+patch ../patches/patches-mtd/collie-jedec-probe.patch
+patch ../patches/patches-mtd/collie-eraseinfo.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/locomo_kbd_tweak-r2.patch b/recipes-kernel/linux/linux-yocto-3.8/locomo_kbd_tweak-r2.patch
deleted file mode 100644
index 5f015f4..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/locomo_kbd_tweak-r2.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From e60a4a9a3336a24a8e6ca3ea69587c60cb953881 Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Sat, 21 Apr 2012 23:48:57 +0200
-Subject: [PATCH 43/43] locomokbd: apply tweaks for Zaurus
-
-* from http://www.rpsys.net/openzaurus/patches/
-
-Signed-off-by: Richard Purdie <rpurdie@rpsys.net>
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
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
diff --git a/recipes-kernel/linux/linux-yocto-3.8/mcp-device.patch b/recipes-kernel/linux/linux-yocto-3.8/mcp-device.patch
deleted file mode 100644
index 9a0a8ba..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/mcp-device.patch
+++ /dev/null
@@ -1,13 +0,0 @@
---- a/include/linux/mfd/mcp.h	2013-02-18 00:14:09.000000000 +0100
-+++ b/include/linux/mfd/mcp.h	2013-02-17 23:55:52.000000000 +0100
-@@ -10,6 +10,8 @@
- #ifndef MCP_H
- #define MCP_H
- 
-+#include <linux/device.h>
-+
- struct mcp_ops;
- 
- struct mcp {
-
-
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
new file mode 100644
index 0000000..5f015f4
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
@@ -0,0 +1,75 @@
+From e60a4a9a3336a24a8e6ca3ea69587c60cb953881 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Sat, 21 Apr 2012 23:48:57 +0200
+Subject: [PATCH 43/43] locomokbd: apply tweaks for Zaurus
+
+* from http://www.rpsys.net/openzaurus/patches/
+
+Signed-off-by: Richard Purdie <rpurdie@rpsys.net>
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+diff --git a/drivers/input/keyboard/locomokbd.c b/drivers/input/keyboard/locomokbd.c
+index c94d610..2b978c8 100644
+--- a/drivers/input/keyboard/locomokbd.c
++++ b/drivers/input/keyboard/locomokbd.c
+@@ -39,27 +39,33 @@ MODULE_AUTHOR("John Lenz <lenz@cs.wisc.edu>");
+ MODULE_DESCRIPTION("LoCoMo keyboard driver");
+ MODULE_LICENSE("GPL");
+ 
+-#define LOCOMOKBD_NUMKEYS	128
+-
+-#define KEY_ACTIVITY		KEY_F16
+-#define KEY_CONTACT		KEY_F18
+-#define KEY_CENTER		KEY_F15
++#define LOCOMOKBD_NUMKEYS		128
++
++#define LOCOMO_KEY_CALENDER	KEY_LEFTCTRL
++#define LOCOMO_KEY_ADDRESS	KEY_LEFTALT	/* Needed for SysRQ */
++#define LOCOMO_KEY_HOME		KEY_SYSRQ	/* Needed for SysRQ */
++#define LOCOMO_KEY_MENU		KEY_F12
++#define LOCOMO_KEY_MAIL		KEY_F10
++#define LOCOMO_KEY_OK		KEY_F11		/* Don't hardwire to KEY_RETURN */
++#define LOCOMO_KEY_CANCEL	KEY_POWER
++#define LOCOMO_KEY_CENTER	KEY_F5		/* Don't hardwire to KEY_RETURN */
++#define LOCOMO_KEY_FN		KEY_F9
+ 
+ static const unsigned char
+ locomokbd_keycode[LOCOMOKBD_NUMKEYS] = {
+-	0, KEY_ESC, KEY_ACTIVITY, 0, 0, 0, 0, 0, 0, 0,				/* 0 - 9 */
+-	0, 0, 0, 0, 0, 0, 0, KEY_MENU, KEY_HOME, KEY_CONTACT,			/* 10 - 19 */
+-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,						/* 20 - 29 */
+-	0, 0, 0, KEY_CENTER, 0, KEY_MAIL, 0, 0, 0, 0,				/* 30 - 39 */
+-	0, 0, 0, 0, 0, 0, 0, 0, 0, KEY_RIGHT,					/* 40 - 49 */
+-	KEY_UP, KEY_LEFT, 0, 0, KEY_P, 0, KEY_O, KEY_I, KEY_Y, KEY_T,		/* 50 - 59 */
+-	KEY_E, KEY_W, 0, 0, 0, 0, KEY_DOWN, KEY_ENTER, 0, 0,			/* 60 - 69 */
+-	KEY_BACKSPACE, 0, KEY_L, KEY_U, KEY_H, KEY_R, KEY_D, KEY_Q, 0, 0,	/* 70 - 79 */
+-	0, 0, 0, 0, 0, 0, KEY_ENTER, KEY_RIGHTSHIFT, KEY_K, KEY_J,		/* 80 - 89 */
+-	KEY_G, KEY_F, KEY_X, KEY_S, 0, 0, 0, 0, 0, 0,				/* 90 - 99 */
+-	0, 0, KEY_DOT, 0, KEY_COMMA, KEY_N, KEY_B, KEY_C, KEY_Z, KEY_A,		/* 100 - 109 */
+-	KEY_LEFTSHIFT, KEY_TAB, KEY_LEFTCTRL, 0, 0, 0, 0, 0, 0, 0,		/* 110 - 119 */
+-	KEY_M, KEY_SPACE, KEY_V, KEY_APOSTROPHE, KEY_SLASH, 0, 0, 0		/* 120 - 128 */
++	0, LOCOMO_KEY_CANCEL, LOCOMO_KEY_CALENDER, LOCOMO_KEY_HOME, 0, 0, 0, 0, 0, 0,	/* 0 - 9 */
++	0, 0, 0, 0, 0, 0, 0, LOCOMO_KEY_MENU, 0, LOCOMO_KEY_ADDRESS,			/* 10 - 19 */
++	0, 0, 0, 0, 0, LOCOMO_KEY_MAIL, 0, 0, 0, 0,					/* 20 - 29 */
++	0, 0, 0, LOCOMO_KEY_CENTER, 0, LOCOMO_KEY_MAIL, 0, 0, 0, 0,			/* 30 - 39 */
++	0, 0, 0, 0, 0, 0, 0, 0, 0, KEY_RIGHT,						/* 40 - 49 */
++	KEY_UP, KEY_LEFT, 0, 0, KEY_P, 0, KEY_O, KEY_I, KEY_Y, KEY_T,			/* 50 - 59 */
++	KEY_E, KEY_W, 0, 0, 0, 0, KEY_DOWN, LOCOMO_KEY_OK, 0, 0,			/* 60 - 69 */
++	KEY_BACKSPACE, 0, KEY_L, KEY_U, KEY_H, KEY_R, KEY_D, KEY_Q, 0, 0,		/* 70 - 79 */
++	0, 0, 0, 0, 0, 0, KEY_ENTER, KEY_RIGHTSHIFT, KEY_K, KEY_J,			/* 80 - 89 */
++	KEY_G, KEY_F, KEY_X, KEY_S, 0, 0, 0, 0, 0, 0,					/* 90 - 99 */
++	0, 0, KEY_DOT, 0, KEY_COMMA, KEY_N, KEY_B, KEY_C, KEY_Z, KEY_A,			/* 100 - 109 */
++	KEY_LEFTSHIFT, KEY_TAB, LOCOMO_KEY_FN, 0, 0, 0, 0, 0, 0, 0,			/* 110 - 119 */
++	KEY_M, KEY_SPACE, KEY_V, KEY_APOSTROPHE, KEY_SLASH, 0, 0, 0			/* 120 - 128 */
+ };
+ 
+ #define KB_ROWS			16
+@@ -68,7 +74,7 @@ locomokbd_keycode[LOCOMOKBD_NUMKEYS] = {
+ #define SCANCODE(c,r)		( ((c)<<4) + (r) + 1 )
+ 
+ #define KB_DELAY		8
+-#define SCAN_INTERVAL		(HZ/10)
++#define SCAN_INTERVAL		(HZ/20)
+ 
+ struct locomokbd {
+ 	unsigned char keycode[LOCOMOKBD_NUMKEYS];
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mfd/mcp-device.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mfd/mcp-device.patch
new file mode 100644
index 0000000..9a0a8ba
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mfd/mcp-device.patch
@@ -0,0 +1,13 @@
+--- a/include/linux/mfd/mcp.h	2013-02-18 00:14:09.000000000 +0100
++++ b/include/linux/mfd/mcp.h	2013-02-17 23:55:52.000000000 +0100
+@@ -10,6 +10,8 @@
+ #ifndef MCP_H
+ #define MCP_H
+ 
++#include <linux/device.h>
++
+ struct mcp_ops;
+ 
+ struct mcp {
+
+
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-eraseinfo.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-eraseinfo.patch
new file mode 100644
index 0000000..6aba29e
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-eraseinfo.patch
@@ -0,0 +1,31 @@
+--- a/drivers/mtd/chips/jedec_probe.c
++++ b/drivers/mtd/chips/jedec_probe.c
+@@ -120,7 +120,7 @@
+ #define PM49FL008	0x006A
+ 
+ /* Sharp */
+-#define LH28F640BF	0x00b0
++#define LH28F640BF	0x00B0
+ 
+ /* ST - www.st.com */
+ #define M29F800AB	0x0058
+@@ -1299,13 +1299,14 @@
+ 		.mfr_id		= CFI_MFR_SHARP,
+ 		.dev_id		= LH28F640BF,
+ 		.name		= "LH28F640BF",
+-		.devtypes	= CFI_DEVICETYPE_X8,
++		.devtypes	= CFI_DEVICETYPE_X16,
+ 		.uaddr		= MTD_UADDR_UNNECESSARY,
+-		.dev_size	= SIZE_4MiB,
+-		.cmd_set	= P_ID_INTEL_STD,
+-		.nr_regions	= 1,
++		.dev_size	= SIZE_8MiB,
++		.cmd_set	= P_ID_INTEL_EXT,
++		.nr_regions	= 2,
+ 		.regions	= {
+-			ERASEINFO(0x40000,16),
++			ERASEINFO(0x10000, 127),
++			ERASEINFO(0x02000, 8),
+ 		}
+ 	}, {
+ 		.mfr_id		= CFI_MFR_SST,
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-jedec-probe.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-jedec-probe.patch
new file mode 100644
index 0000000..530643e
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-mtd/collie-jedec-probe.patch
@@ -0,0 +1,11 @@
+--- a/arch/arm/mach-sa1100/collie.c
++++ b/arch/arm/mach-sa1100/collie.c
+@@ -289,7 +289,7 @@
+ }
+ 
+ static struct flash_platform_data collie_flash_data = {
+-	.map_name	= "cfi_probe",
++	.map_name	= "jedec_probe",
+ 	.init		= collie_flash_init,
+ 	.set_vpp	= collie_set_vpp,
+ 	.exit		= collie_flash_exit,
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxa27x-sa1100-rtc.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxa27x-sa1100-rtc.patch
new file mode 100644
index 0000000..7cb5385
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxa27x-sa1100-rtc.patch
@@ -0,0 +1,34 @@
+From fcee0050f8ce5296e8007ed7ed17d98f334a8f38 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Fri, 23 Nov 2012 23:07:20 +0100
+Subject: [PATCH] ARM: pxa: pxa27x.c: add dummy SA1100 rtc clock
+
+* Using pxa27x you could now build both RTC_DRV_PXA and RTC_DRV_SA1100.
+* Make sure you don't use both together: link /dev/rtc0 or /dev/rtc1
+* to /dev/rtc according to your requirement.
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
+Signed-off-by: Haojian Zhuang <haojian.zhuang@gmail.com>
+
+Upstream-Status: Accepted. Committed in v3.9-rc1
+with commit id 495b21dc0e488b784ab1d4007d00db1ca2a95c98
+---
+ arch/arm/mach-pxa/pxa27x.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
+index 8047ee0..5970ebc 100644
+--- a/arch/arm/mach-pxa/pxa27x.c
++++ b/arch/arm/mach-pxa/pxa27x.c
+@@ -230,6 +230,7 @@ static struct clk_lookup pxa27x_clkregs[] = {
+ 	INIT_CLKREG(&clk_pxa27x_memc, NULL, "MEMCLK"),
+ 	INIT_CLKREG(&clk_pxa27x_mem, "pxa2xx-pcmcia", NULL),
+ 	INIT_CLKREG(&clk_dummy, "pxa-gpio", NULL),
++	INIT_CLKREG(&clk_dummy, "sa1100-rtc", NULL),
+ };
+ 
+ #ifdef CONFIG_PM
+-- 
+1.7.8.6
+
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxamci-regulator.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxamci-regulator.patch
new file mode 100644
index 0000000..8e7c521
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/pxamci-regulator.patch
@@ -0,0 +1,135 @@
+From: Marko Katic <dromede.gmail.com>
+
+Here's an interesting scenario. The spitz machine has an
+Intersil 6271A voltage regulator and an ADS7846 touchscreen
+controller.
+
+The ADS7846 driver _requires_ the use of a voltage regulator
+or if not present, CONFIG_REGULATOR_DUMMY should be used for proper operation.
+This was made mandatory by the following commit:
+
+========================================
+91143379b01b2020d8878d627ebe9dfb9d6eb4c8
+Input: ads7846 - add regulator support
+
+The ADS7846/TSC2046 touchscreen controllers can (and usually are)
+connected to various regulators for power, so add regulator support.
+
+Valid regulator will now be required, so boards without complete
+regulator setup should either disable regulator framework or enable
+CONFIG_REGULATOR_DUMMY.
+========================================
+
+The ADS7846 in spitz machines is not connected to
+any power regulator so it needs CONFIG_REGULATOR_DUMMY enabled.
+So to support both the Intersil 6271A regulator and
+the ADS7846 controller, CONFIG_REGULATOR and CONFIG_REGULATOR_DUMMY have
+to be defined.
+
+However, enabling CONFIG_REGULATOR and CONFIG_REGULATOR_DUMMY
+will break pxamci driver and cause the following error output:
+
+pxa2xx-mci.0 supply vmmc not found, using dummy regulator
+pxa2xx-mci pxa2xx-mci.0: ocr_mask/setpower will not be used
+pxa2xx-mci pxa2xx-mci.0: could not set regulator OCR (-22)
+pxa2xx-mci pxa2xx-mci.0: unable to set power
+pxa2xx-mci pxa2xx-mci.0: could not set regulator OCR (-22)
+pxa2xx-mci pxa2xx-mci.0: unable to set power
+
+Above failures occur in two functions;
+pxamci_init_ocr() and pxamci_set_power().
+
+Regulator support in pxamci_init_ocr() is not
+written with the existence of the dummy regulator driver in
+mind. It does not check the return value of mmc_regulator_get_ocrmask()
+and it will only fall back to platform data if no regulator was found.
+
+pxamci_set_power() fails because it does not even try to fall back
+to platform data if mmc_regulator_set_ocr() fails. It
+expects a proper regulator or no regulator at all. It will
+only fall back to platform data if no regulator was found. It does
+not properly handle the possible existence of the dummy regulator.
+
+This patch refactors pxamci_init_ocr() and  pxamci_set_power() regulator
+support to be more modular, to do more checks and to always fall back
+to platform data.
+
+Signed-off-by: Marko Katic <dromede@gmail.com>
+---
+ drivers/mmc/host/pxamci.c |   37 ++++++++++++++++++++++++-------------
+ 1 file changed, 24 insertions(+), 13 deletions(-)
+
+diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
+index 2b2f65a..6ec1566 100644
+--- a/drivers/mmc/host/pxamci.c
++++ b/drivers/mmc/host/pxamci.c
+@@ -83,18 +83,24 @@ struct pxamci_host {
+ static inline void pxamci_init_ocr(struct pxamci_host *host)
+ {
+ #ifdef CONFIG_REGULATOR
++	int ocr_mask;
+ 	host->vcc = regulator_get(mmc_dev(host->mmc), "vmmc");
+ 
+ 	if (IS_ERR(host->vcc))
+ 		host->vcc = NULL;
+ 	else {
+-		host->mmc->ocr_avail = mmc_regulator_get_ocrmask(host->vcc);
+-		if (host->pdata && host->pdata->ocr_mask)
++		ocr_mask = mmc_regulator_get_ocrmask(host->vcc);
++		if (ocr_mask <= 0)
++			host->mmc->ocr_avail = 0;
++		else
++			host->mmc->ocr_avail = ocr_mask;
++
++		if (host->pdata && host->pdata->ocr_mask && host->mmc->ocr_avail)
+ 			dev_warn(mmc_dev(host->mmc),
+ 				"ocr_mask/setpower will not be used\n");
+ 	}
+ #endif
+-	if (host->vcc == NULL) {
++	if (host->vcc == NULL || host->mmc->ocr_avail == 0) {
+ 		/* fall-back to platform data */
+ 		host->mmc->ocr_avail = host->pdata ?
+ 			host->pdata->ocr_mask :
+@@ -108,26 +114,31 @@ static inline int pxamci_set_power(struct pxamci_host *host,
+ {
+ 	int on;
+ 
++#ifdef CONFIG_REGULATOR
+ 	if (host->vcc) {
+-		int ret;
++		int ret = 0;
+ 
+-		if (power_mode == MMC_POWER_UP) {
++		if (power_mode == MMC_POWER_UP)
+ 			ret = mmc_regulator_set_ocr(host->mmc, host->vcc, vdd);
+-			if (ret)
+-				return ret;
+-		} else if (power_mode == MMC_POWER_OFF) {
++
++		if (power_mode == MMC_POWER_OFF)
+ 			ret = mmc_regulator_set_ocr(host->mmc, host->vcc, 0);
+-			if (ret)
+-				return ret;
+-		}
++
++		if (ret == 0)
++			return 0;
++		else
++			dev_warn(mmc_dev(host->mmc),
++			 "mmc_regulator_set_ocr failed, falling back to platform data\n");
+ 	}
+-	if (!host->vcc && host->pdata &&
++#endif
++
++	if (host->pdata &&
+ 	    gpio_is_valid(host->pdata->gpio_power)) {
+ 		on = ((1 << vdd) & host->pdata->ocr_mask);
+ 		gpio_set_value(host->pdata->gpio_power,
+ 			       !!on ^ host->pdata->gpio_power_invert);
+ 	}
+-	if (!host->vcc && host->pdata && host->pdata->setpower)
++	if (host->pdata && host->pdata->setpower)
+ 		host->pdata->setpower(mmc_dev(host->mmc), vdd);
+ 
+ 	return 0;
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/sharpsl_param.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/sharpsl_param.patch
new file mode 100644
index 0000000..c626e92
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/sharpsl_param.patch
@@ -0,0 +1,24 @@
+Signed-off-by: Marko Katic <dromede.gmail.com>
+
+diff --git a/arch/arm/common/sharpsl_param.c b/arch/arm/common/sharpsl_param.c
+index d56c932..b70b13a 100644
+--- a/arch/arm/common/sharpsl_param.c
++++ b/arch/arm/common/sharpsl_param.c
+@@ -14,6 +14,7 @@
+ #include <linux/kernel.h>
+ #include <linux/module.h>
+ #include <linux/string.h>
++#include <asm/memory.h>
+ #include <asm/mach/sharpsl_param.h>
+ 
+ /*
+@@ -41,7 +42,8 @@ EXPORT_SYMBOL(sharpsl_param);
+ 
+ void sharpsl_save_param(void)
+ {
+-	memcpy(&sharpsl_param, (void *)PARAM_BASE, sizeof(struct sharpsl_param_info));
++	void * param_start = phys_to_virt(PARAM_BASE);
++	memcpy(&sharpsl_param, param_start, sizeof(struct sharpsl_param_info));
+ 
+ 	if (sharpsl_param.comadj_keyword != COMADJ_MAGIC)
+ 		sharpsl_param.comadj=-1;
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/spi-pxa2xx-fix-mem.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/spi-pxa2xx-fix-mem.patch
new file mode 100644
index 0000000..e20b597
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/spi-pxa2xx-fix-mem.patch
@@ -0,0 +1,34 @@
+diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
+index dc25bee..b25fe27 100644
+--- a/drivers/spi/spi-pxa2xx.c
++++ b/drivers/spi/spi-pxa2xx.c
+@@ -106,6 +106,7 @@ struct driver_data {
+ 	int rx_channel;
+ 	int tx_channel;
+ 	u32 *null_dma_buf;
++	u8 null_dma_buf_unaligned[16];
+ 
+ 	/* SSP register addresses */
+ 	void __iomem *ioaddr;
+@@ -1543,8 +1544,8 @@ static int __devinit pxa2xx_spi_probe(struct platform_device *pdev)
+ 		return -ENODEV;
+ 	}
+ 
+-	/* Allocate master with space for drv_data and null dma buffer */
+-	master = spi_alloc_master(dev, sizeof(struct driver_data) + 16);
++	/* Allocate master with space for drv_data */
++	master = spi_alloc_master(dev, sizeof(struct driver_data));
+ 	if (!master) {
+ 		dev_err(&pdev->dev, "cannot alloc spi_master\n");
+ 		pxa_ssp_free(ssp);
+@@ -1569,8 +1570,8 @@ static int __devinit pxa2xx_spi_probe(struct platform_device *pdev)
+ 	master->transfer = transfer;
+ 
+ 	drv_data->ssp_type = ssp->type;
+-	drv_data->null_dma_buf = (u32 *)ALIGN((u32)(drv_data +
+-						sizeof(struct driver_data)), 8);
++	drv_data->null_dma_buf =
++		(u32 *)PTR_ALIGN(&drv_data->null_dma_buf_unaligned, 8);
+ 
+ 	drv_data->ioaddr = ssp->mmio_base;
+ 	drv_data->ssdr_physical = ssp->phys_base + SSDR;
diff --git a/recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.scc b/recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.scc
index cfe97be..35f1323 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.scc
+++ b/recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.scc
@@ -3,7 +3,7 @@ kconf hardware poodle.cfg
 include ../zaurus-pxa-only.scc
 include ../zaurus-common.scc
 
-patch locomo_kbd_tweak-r2.patch
-patch sharpsl_param.patch
-patch spi-pxa2xx-fix-mem.patch
-patch pxamci-regulator.patch
+patch ../patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
+patch ../patches/patches-pxa/sharpsl_param.patch
+patch ../patches/patches-pxa/spi-pxa2xx-fix-mem.patch
+patch ../patches/patches-pxa/pxamci-regulator.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/pxa27x-sa1100-rtc.patch b/recipes-kernel/linux/linux-yocto-3.8/pxa27x-sa1100-rtc.patch
deleted file mode 100644
index 7cb5385..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/pxa27x-sa1100-rtc.patch
+++ /dev/null
@@ -1,34 +0,0 @@
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
-Upstream-Status: Accepted. Committed in v3.9-rc1
-with commit id 495b21dc0e488b784ab1d4007d00db1ca2a95c98
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
diff --git a/recipes-kernel/linux/linux-yocto-3.8/pxamci-regulator.patch b/recipes-kernel/linux/linux-yocto-3.8/pxamci-regulator.patch
deleted file mode 100644
index 8e7c521..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/pxamci-regulator.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From: Marko Katic <dromede.gmail.com>
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
----
- drivers/mmc/host/pxamci.c |   37 ++++++++++++++++++++++++-------------
- 1 file changed, 24 insertions(+), 13 deletions(-)
-
-diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
-index 2b2f65a..6ec1566 100644
---- a/drivers/mmc/host/pxamci.c
-+++ b/drivers/mmc/host/pxamci.c
-@@ -83,18 +83,24 @@ struct pxamci_host {
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
-+		if (host->pdata && host->pdata->ocr_mask && host->mmc->ocr_avail)
- 			dev_warn(mmc_dev(host->mmc),
- 				"ocr_mask/setpower will not be used\n");
- 	}
- #endif
--	if (host->vcc == NULL) {
-+	if (host->vcc == NULL || host->mmc->ocr_avail == 0) {
- 		/* fall-back to platform data */
- 		host->mmc->ocr_avail = host->pdata ?
- 			host->pdata->ocr_mask :
-@@ -108,26 +114,31 @@ static inline int pxamci_set_power(struct pxamci_host *host,
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
-+			 "mmc_regulator_set_ocr failed, falling back to platform data\n");
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
diff --git a/recipes-kernel/linux/linux-yocto-3.8/sharpsl_param.patch b/recipes-kernel/linux/linux-yocto-3.8/sharpsl_param.patch
deleted file mode 100644
index c626e92..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/sharpsl_param.patch
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
diff --git a/recipes-kernel/linux/linux-yocto-3.8/spi-pxa2xx-fix-mem.patch b/recipes-kernel/linux/linux-yocto-3.8/spi-pxa2xx-fix-mem.patch
deleted file mode 100644
index e20b597..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/spi-pxa2xx-fix-mem.patch
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
diff --git a/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc b/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
index be8c470..c47a0c5 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
+++ b/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
@@ -4,7 +4,7 @@ include ../zaurus-pxa-only.scc
 include ../zaurus-common.scc
 include ../zaurus-usb-host.scc
 
-patch sharpsl_param.patch
-patch pxa27x-sa1100-rtc.patch
-patch spi-pxa2xx-fix-mem.patch
-patch pxamci-regulator.patch
+patch ../patches/patches-pxa/sharpsl_param.patch
+patch ../patches/patches-pxa/pxa27x-sa1100-rtc.patch
+patch ../patches/patches-pxa/spi-pxa2xx-fix-mem.patch
+patch ../patches/patches-pxa/pxamci-regulator.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc b/recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc
index b4d6e8e..4d57894 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc
+++ b/recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc
@@ -4,6 +4,6 @@ include ../zaurus-pxa-only.scc
 include ../zaurus-common.scc
 include ../zaurus-usb-host.scc
 
-patch sharpsl_param.patch
-patch spi-pxa2xx-fix-mem.patch
-patch pxamci-regulator.patch
+patch ../patches/patches-pxa/sharpsl_param.patch
+patch ../patches/patches-pxa/spi-pxa2xx-fix-mem.patch
+patch ../patches/patches-pxa/pxamci-regulator.patch
-- 
1.8.1.5



