Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id DFCDE6E9A0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 22:07:19 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id cc10so6004544wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 15:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=x1K0OrAhodPF7nr/bmCX/thNBBo6kYtx+FJbt+bxNc8=;
	b=MhHULzkNFuOVjSZ+N7SlLXWmt+X4BbSPFin1ung55o8Sf2EInjdpxJtSciKpraqbLP
	KpCVZTmvgbbDgzF9DCARv9pswMfZpiR/QVDIy7J1x9wuKAL74v2VS+9bR1Fvg1CfDG8V
	21zkYLIc3u7wiQ1XtkDRTt+vzwkDSW+Tb9gNDNXC7kDFNQJyA3QkDuug/82rjfiPX/Rg
	7cT7t/31Bb0WpO99yG57VwOpgFH8nYr5NXzhvTC0AiMqqY1EdjTrNsYEHw86s4Ljt5dp
	NBD5ym+AI3jdPxkaIyZe0sLIBlok1C/w94ViKTw0C2ItFdZXw+unGHqopV55dsiFdD0t
	PGuQ==
X-Received: by 10.180.90.207 with SMTP id by15mr23373246wib.48.1396390039968; 
	Tue, 01 Apr 2014 15:07:19 -0700 (PDT)
Received: from mizar.localdomain
	(host89-230-dynamic.20-79-r.retail.telecomitalia.it. [79.20.230.89])
	by mx.google.com with ESMTPSA id q41sm43465876eez.7.2014.04.01.15.07.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 15:07:19 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Apr 2014 00:07:14 +0200
Message-Id: <1396390034-29605-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] linux-yocto-tiny-kexecboot: refer to the patches in linux-yocto
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
X-List-Received-Date: Tue, 01 Apr 2014 22:07:20 -0000

Avoid duplication between recipes with the same PV.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../patches/revert-check-on-console-device.patch   |   0
 .../patches-locomo/locomo-fix-SCL-SDA.patch        |  28 -----
 .../patches-locomo/locomolcd-suspend-resume.patch  |  92 --------------
 .../patches-locomokbd/locomo_kbd_tweak-r2.patch    |  84 -------------
 .../patches/patches-mfd/mcp-device.patch           |  30 -----
 .../patches/patches-mfd/ucb1x00-device.patch       |  28 -----
 .../patches/patches-mtd/collie-LH28F640BF.patch    | 131 --------------------
 .../patches-mtd/collie-cfi-probe-again.patch       |  29 -----
 .../patches/patches-mtd/collie-eraseinfo.patch     |  55 ---------
 .../patches/patches-mtd/collie-jedec-probe.patch   |  35 ------
 .../patches/patches-mtd/collie-match-cfi-qry.patch |  47 -------
 .../patches/patches-mtd/collie-mtd-resize.patch    |  41 -------
 .../patches-power/collie_battery-dev-pm.patch      |  39 ------
 .../patches-power/tosa_battery_irq_to_gpio.patch   |  39 ------
 .../patches/patches-pxa/sharpsl_param.patch        |  47 -------
 .../patches/patches-pxa/tosa-keys-mapping.patch    | 136 ---------------------
 .../patches-sa1100/arm-sa1100-add-cpu-clock.patch  |  95 --------------
 .../patches-sa1100/collie-add-bootblock.patch      |  29 -----
 .../patches/patches-sa1100/collie-irda.patch       |  88 -------------
 .../fbdev-sa1100fb-make-use-of-device-clock.patch  | 115 -----------------
 .../pcmcia-sa1100-device-clock.patch               | 100 ---------------
 .../linux/linux-yocto-tiny-kexecboot_3.10.bbappend |   2 +-
 22 files changed, 1 insertion(+), 1289 deletions(-)
 rename recipes-kernel/linux/{linux-yocto-tiny-kexecboot-3.10 => linux-yocto-3.10}/patches/revert-check-on-console-device.patch (100%)
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-locomo/locomo-fix-SCL-SDA.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-locomo/locomolcd-suspend-resume.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mfd/mcp-device.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mfd/ucb1x00-device.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-LH28F640BF.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-cfi-probe-again.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-eraseinfo.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-jedec-probe.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-match-cfi-qry.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-mtd-resize.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-power/collie_battery-dev-pm.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-power/tosa_battery_irq_to_gpio.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-pxa/sharpsl_param.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-pxa/tosa-keys-mapping.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/arm-sa1100-add-cpu-clock.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/collie-add-bootblock.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/collie-irda.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/fbdev-sa1100fb-make-use-of-device-clock.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/pcmcia-sa1100-device-clock.patch

diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/revert-check-on-console-device.patch b/recipes-kernel/linux/linux-yocto-3.10/patches/revert-check-on-console-device.patch
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/revert-check-on-console-device.patch
rename to recipes-kernel/linux/linux-yocto-3.10/patches/revert-check-on-console-device.patch
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-locomo/locomo-fix-SCL-SDA.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-locomo/locomo-fix-SCL-SDA.patch
deleted file mode 100644
index 3336e2b..0000000
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-locomo/locomo-fix-SCL-SDA.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From acc2f94781ab11bead994bb3faaad149f9187bd4 Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Tue, 12 Nov 2013 22:21:20 +0100
-Subject: [PATCH 631/631] linux-yocto: collie: locomo.c: fix SCL line instead
- of SDA
-
-Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- arch/arm/common/locomo.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/arm/common/locomo.c b/arch/arm/common/locomo.c
-index b55c362..d827bcb 100644
---- a/arch/arm/common/locomo.c
-+++ b/arch/arm/common/locomo.c
-@@ -629,7 +629,7 @@ static void locomo_m62332_sendbit(void *mapbase, int bit)
- 	unsigned int r;
- 
- 	r = locomo_readl(mapbase + LOCOMO_DAC);
--	r &=  ~(LOCOMO_DAC_SCLOEB);
-+	r &=  ~(LOCOMO_DAC_SDAOEB);
- 	locomo_writel(r, mapbase + LOCOMO_DAC);
- 	udelay(DAC_LOW_SETUP_TIME);	/* 300 nsec */
- 	udelay(DAC_DATA_HOLD_TIME);	/* 300 nsec */
--- 
-1.8.1.5
-
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-locomo/locomolcd-suspend-resume.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-locomo/locomolcd-suspend-resume.patch
deleted file mode 100644
index a3d63e0..0000000
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-locomo/locomolcd-suspend-resume.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From ec4ff55857d5f48d2bf08e46f12eb4670ec6aa1a Mon Sep 17 00:00:00 2001
-From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
-Date: Thu, 14 Nov 2013 17:18:26 +0400
-Subject: [PATCH] backlight: locomolcd: fix suspend/resume
-
-Replace cooked suspend/resume with support from core backlight layer.
-This allows us to remove suspend/resume callbacks from locomolcd
-completely. They were not working anyway, as locomo does not support
-pm_ops handling.
-
-Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
----
- drivers/video/backlight/locomolcd.c | 26 +++-----------------------
- 1 file changed, 3 insertions(+), 23 deletions(-)
-
-diff --git a/drivers/video/backlight/locomolcd.c b/drivers/video/backlight/locomolcd.c
-index 6c3ec42..54d2da9 100644
---- a/drivers/video/backlight/locomolcd.c
-+++ b/drivers/video/backlight/locomolcd.c
-@@ -28,8 +28,6 @@
- 
- static struct backlight_device *locomolcd_bl_device;
- static struct locomo_dev *locomolcd_dev;
--static unsigned long locomolcd_flags;
--#define LOCOMOLCD_SUSPENDED     0x01
- 
- static void locomolcd_on(int comadj)
- {
-@@ -117,7 +115,7 @@ static int locomolcd_set_intensity(struct backlight_device *bd)
- 		intensity = 0;
- 	if (bd->props.fb_blank != FB_BLANK_UNBLANK)
- 		intensity = 0;
--	if (locomolcd_flags & LOCOMOLCD_SUSPENDED)
-+	if (bd->props.state & BL_CORE_SUSPENDED)
- 		intensity = 0;
- 
- 	switch (intensity) {
-@@ -155,26 +153,9 @@ static int locomolcd_get_intensity(struct backlight_device *bd)
- static const struct backlight_ops locomobl_data = {
- 	.get_brightness = locomolcd_get_intensity,
- 	.update_status  = locomolcd_set_intensity,
-+	.options	= BL_CORE_SUSPENDRESUME,
- };
- 
--#ifdef CONFIG_PM_SLEEP
--static int locomolcd_suspend(struct device *dev)
--{
--	locomolcd_flags |= LOCOMOLCD_SUSPENDED;
--	locomolcd_set_intensity(locomolcd_bl_device);
--	return 0;
--}
--
--static int locomolcd_resume(struct device *dev)
--{
--	locomolcd_flags &= ~LOCOMOLCD_SUSPENDED;
--	locomolcd_set_intensity(locomolcd_bl_device);
--	return 0;
--}
--#endif
--
--static SIMPLE_DEV_PM_OPS(locomolcd_pm_ops, locomolcd_suspend, locomolcd_resume);
--
- static int locomolcd_probe(struct locomo_dev *ldev)
- {
- 	struct backlight_properties props;
-@@ -198,6 +179,7 @@ static int locomolcd_probe(struct locomo_dev *ldev)
- 	memset(&props, 0, sizeof(struct backlight_properties));
- 	props.type = BACKLIGHT_RAW;
- 	props.max_brightness = 4;
-+	props.brightness = 2;
- 	locomolcd_bl_device = backlight_device_register("locomo-bl",
- 							&ldev->dev, NULL,
- 							&locomobl_data, &props);
-@@ -206,7 +188,6 @@ static int locomolcd_probe(struct locomo_dev *ldev)
- 		return PTR_ERR(locomolcd_bl_device);
- 
- 	/* Set up frontlight so that screen is readable */
--	locomolcd_bl_device->props.brightness = 2;
- 	locomolcd_set_intensity(locomolcd_bl_device);
- 
- 	return 0;
-@@ -230,7 +211,6 @@ static int locomolcd_remove(struct locomo_dev *dev)
- static struct locomo_driver poodle_lcd_driver = {
- 	.drv = {
- 		.name	= "locomo-backlight",
--		.pm	= &locomolcd_pm_ops,
- 	},
- 	.devid	= LOCOMO_DEVID_BACKLIGHT,
- 	.probe	= locomolcd_probe,
--- 
-1.8.4.2
-
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
deleted file mode 100644
index 441e3dc..0000000
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
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
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mfd/mcp-device.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mfd/mcp-device.patch
deleted file mode 100644
index a3523b0..0000000
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mfd/mcp-device.patch
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
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mfd/ucb1x00-device.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mfd/ucb1x00-device.patch
deleted file mode 100644
index 76c4d97..0000000
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mfd/ucb1x00-device.patch
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
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-LH28F640BF.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-LH28F640BF.patch
deleted file mode 100644
index 182e782..0000000
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-LH28F640BF.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-From 7485f38ec10b7474932edebc4f3db60a8e32097c Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Tue, 21 Jan 2014 00:51:26 +0100
-Subject: mtd: add support for Sharp LH28F640BF NOR chips
-
-Tested on Zaurus SL-5500 (Collie) 2x16 on 32 bit bus
-
-Buffer write fixes as seen in 2007 patch c/o
-Anti Sullin <anti.sullin <at> artecdesign.ee>
-http://comments.gmane.org/gmane.linux.ports.arm.kernel/36733
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- drivers/mtd/chips/cfi_cmdset_0001.c | 66 +++++++++++++++++++++++++++++++++++++
- 1 file changed, 66 insertions(+)
-
-diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
-index 7751443..c3c0b41 100644
---- a/drivers/mtd/chips/cfi_cmdset_0001.c
-+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
-@@ -53,6 +53,11 @@
- /* Atmel chips */
- #define AT49BV640D	0x02de
- #define AT49BV640DT	0x02db
-+/* Sharp chips */
-+#define LH28F640BFHE_PTTL90	0x00b0
-+#define LH28F640BFHE_PBTL90	0x00b1
-+#define LH28F640BFHE_PTTL70A	0x00b2
-+#define LH28F640BFHE_PBTL70A	0x00b3
- 
- static int cfi_intelext_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
- static int cfi_intelext_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
-@@ -259,6 +264,47 @@ static void fixup_st_m28w320cb(struct mtd_info *mtd)
- 		(cfi->cfiq->EraseRegionInfo[1] & 0xffff0000) | 0x3e;
- };
- 
-+static int is_LH28F640BF(struct cfi_private *cfi)
-+{
-+	/* Sharp LH28F640BF Series */
-+	if (cfi->mfr == CFI_MFR_SHARP && (
-+	    cfi->id == LH28F640BFHE_PTTL90 || cfi->id == LH28F640BFHE_PBTL90 ||
-+	    cfi->id == LH28F640BFHE_PTTL70A || cfi->id == LH28F640BFHE_PBTL70A))
-+		return 1;
-+	return 0;
-+}
-+
-+static void fixup_LH28F640BF(struct mtd_info *mtd)
-+{
-+	struct map_info *map = mtd->priv;
-+	struct cfi_private *cfi = map->fldrv_priv;
-+	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
-+
-+	/* Reset the Partition Configuration Register on LH28F640BF
-+	 * to a single partition (PCRC = 0x000): PCRC is embedded into A0-A15. */
-+	if (is_LH28F640BF(cfi)) {
-+		printk(KERN_INFO "Reset Partition Config. Register: 1 Partition of 4 planes\n" );
-+		map_write(map, CMD(0x60), 0);
-+		map_write(map, CMD(0x04), 0);
-+		/* NOTE: Sharp Extended Query reports the nr of hardware partitions
-+		 * with an offset of +3. Change of the PCR are not reflected.
-+		 * Keep the wrong reading (0) and let the code convert it to 1 */
-+
-+		/* Sharp LH28F640BF Series has been set to one partition
-+		 * so Simultaneous Operations are disabled */
-+		printk(KERN_WARNING "cfi_cmdset_0001: Simultaneous Operations disabled\n");
-+		extp->FeatureSupport &= ~512;
-+
-+		/* To avoid issues with ubifs with concurrent erase-suspend
-+		 * we have to disable SuspendCmdSupport.
-+		 * The fixes described in "Micron TN-12-06: Adapting the
-+		 * Linux Kernel for P30, P33, and J3 Flash" do not help. */
-+		printk(KERN_WARNING "cfi_cmdset_0001: Suspend "
-+		                    "erase on write disabled.\n");
-+		extp->SuspendCmdSupport &= ~1;
-+	}
-+}
-+
- static void fixup_use_point(struct mtd_info *mtd)
- {
- 	struct map_info *map = mtd->priv;
-@@ -310,6 +356,8 @@ static struct cfi_fixup cfi_fixup_table[] = {
- 	{ CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct },
- 	{ CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb },
- 	{ CFI_MFR_INTEL, CFI_ID_ANY, fixup_unlock_powerup_lock },
-+	{ CFI_MFR_SHARP, CFI_ID_ANY, fixup_unlock_powerup_lock },
-+	{ CFI_MFR_SHARP, CFI_ID_ANY, fixup_LH28F640BF },
- 	{ 0, 0, NULL }
- };
- 
-@@ -387,6 +435,12 @@ read_pri_intelext(struct map_info *map, __u16 adr)
- 	if (extp->MinorVersion >= '3') {
- 		int nb_parts, i;
- 
-+		/* Sharp LH28F640BF query does not respect the nr of synch
-+		 * modes/fields. The value of "Synchronous mode read capability
-+		 * configuration" is 0 but 3 fields are reserved so the
-+		 * number of partitions is at offsets +3. Ignore, we have set PCR to 1. */
-+		/* if (is_LH28F640BF(cfi)) extra_size += 3; */
-+
- 		/* Number of hardware-partitions */
- 		extra_size += 1;
- 		if (extp_size < sizeof(*extp) + extra_size)
-@@ -656,6 +710,12 @@ static int cfi_intelext_partition_fixup(struct mtd_info *mtd,
- 		/* Burst Read info */
- 		offs += extp->extra[offs+1]+2;
- 
-+		/* Sharp LH28F640BF query does not respect the nr of synch
-+		 * modes/fields. The value of "Synchronous mode read capability
-+		 * configuration" is 0 but 3 fields are reserved so the
-+		 * number of partitions is at offsets +3. Ignore, we have set PCR to 1. */
-+		/* if (is_LH28F640BF(cfi)) offs += 3; */
-+
- 		/* Number of partition regions */
- 		numregions = extp->extra[offs];
- 		offs += 1;
-@@ -1654,6 +1714,12 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
- 	initial_adr = adr;
- 	cmd_adr = adr & ~(wbufsize-1);
- 
-+	/* Sharp LH28F640BF chips need the first address for the
-+	 * Page Buffer Program command. See Table 5 of
-+	 * LH28F320BF, LH28F640BF, LH28F128BF Series (Appendix FUM00701)
-+	 * Apparently some Intel Strataflash can be programmed this way as well */
-+	if (is_LH28F640BF(cfi)) cmd_adr = adr;
-+
- 	/* Let's determine this according to the interleave only once */
- 	write_cmd = (cfi->cfiq->P_ID != P_ID_INTEL_PERFORMANCE) ? CMD(0xe8) : CMD(0xe9);
- 
--- 
-1.8.1.5
-
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-cfi-probe-again.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-cfi-probe-again.patch
deleted file mode 100644
index 7a0dbe5..0000000
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-cfi-probe-again.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 35957eda21bdd2f22c84fa269c1b856f5039c308 Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Tue, 12 Nov 2013 22:32:26 +0100
-Subject: [PATCH 633/633] sa1100: collie: detect NOR again with cfi_probe
-
-Ehile the detection is still forced we switch away from jedec:
-the CFI code allows us to set the necessary fixups.
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- arch/arm/mach-sa1100/collie.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/arm/mach-sa1100/collie.c b/arch/arm/mach-sa1100/collie.c
-index 799902d..8c088cc 100644
---- a/arch/arm/mach-sa1100/collie.c
-+++ b/arch/arm/mach-sa1100/collie.c
-@@ -326,7 +326,7 @@ static void collie_flash_exit(void)
- }
- 
- static struct flash_platform_data collie_flash_data = {
--	.map_name	= "jedec_probe",
-+	.map_name	= "cfi_probe",
- 	.init		= collie_flash_init,
- 	.set_vpp	= collie_set_vpp,
- 	.exit		= collie_flash_exit,
--- 
-1.8.1.5
-
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-eraseinfo.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-eraseinfo.patch
deleted file mode 100644
index 0a8ebac..0000000
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-eraseinfo.patch
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
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-jedec-probe.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-jedec-probe.patch
deleted file mode 100644
index bae540a..0000000
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-jedec-probe.patch
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
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-match-cfi-qry.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-match-cfi-qry.patch
deleted file mode 100644
index a315d93..0000000
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-match-cfi-qry.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 66ec11df6561d5ba7cdf41977af828a53ba6b99f Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Sat, 1 Feb 2014 13:17:24 +0100
-Subject: [PATCH] mtd: cfi_util.c: force CFI detection of 2x LH28F640BF
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- drivers/mtd/chips/cfi_util.c | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
-
-diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
-index f992418..2c7a13d 100644
---- a/drivers/mtd/chips/cfi_util.c
-+++ b/drivers/mtd/chips/cfi_util.c
-@@ -29,6 +29,7 @@ int __xipram cfi_qry_present(struct map_info *map, __u32 base,
- 	int osf = cfi->interleave * cfi->device_type;	/* scale factor */
- 	map_word val[3];
- 	map_word qry[3];
-+	unsigned long mask = (1 << (cfi->device_type * 8)) - 1;
- 
- 	qry[0] = cfi_build_cmd('Q', map, cfi);
- 	qry[1] = cfi_build_cmd('R', map, cfi);
-@@ -38,6 +39,21 @@ int __xipram cfi_qry_present(struct map_info *map, __u32 base,
- 	val[1] = map_read(map, base + osf*0x11);
- 	val[2] = map_read(map, base + osf*0x12);
- 
-+	/* Apparently only one of the 2 interleaved LH28F640BF 16 bit chips on
-+	 * a 32 bit wide bus is answering to the CFI Query.
-+	 * Using the expected map bankwidth=4 and chip interleave=2 we get wrong
-+	 * readings like 0xffff0051 instead of 0x00510051 etc.
-+	 * We take the valid bytes and recreate the expected answer as workaround.
-+	 */
-+	if (((val[0].x[0] >> (cfi->device_type * 8)) == mask) &&
-+	    ((val[1].x[0] >> (cfi->device_type * 8)) == mask) &&
-+	    ((val[2].x[0] >> (cfi->device_type * 8)) == mask))
-+	{
-+	val[0].x[0] = (val[0].x[0] & mask) + ((val[0].x[0] & mask) << (cfi->device_type * 8));
-+	val[1].x[0] = (val[1].x[0] & mask) + ((val[1].x[0] & mask) << (cfi->device_type * 8));
-+	val[2].x[0] = (val[2].x[0] & mask) + ((val[2].x[0] & mask) << (cfi->device_type * 8));
-+	}
-+
- 	if (!map_word_equal(map, qry[0], val[0]))
- 		return 0;
- 
--- 
-1.8.1.5
-
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-mtd-resize.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-mtd-resize.patch
deleted file mode 100644
index ba52d2f..0000000
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-mtd-resize.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 85f5a57b9bdd94fa7a20280c31f4f8b148368215 Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Thu, 7 Nov 2013 23:00:31 +0100
-Subject: ARM: SA1100: resize collie mtd to SZ_16M
-
-The end-user models have all 2x8 = 16 Megabytes of NOR.
-It seems that only some dev models/prototype had 32M.
-With current code, giving size of 32M can confuse the detection.
-
-JEDEC:
-sa1100-0: Found 2 x16 devices at 0x0 in 32-bit bank
-sa1100-0: Found different chip or no chip at all (mfr 0x4, id 0x3001) at 0x1000000
-SA1100 flash: CFI device at 0x00000000, 16MiB, 32-bit
-
-CFI:
-sa1100-0: Found 2 x16 devices at 0x0 in 32-bit bank. Manufacturer ID 0x0000b0 Chip ID 0x0000b0
-sa1100-0: Found 2 x16 devices at 0x1000000 in 32-bit bank
-Intel/Sharp Extended Query Table at 0x0039
-...
-sa1100-0: 2 set(s) of 2 interleaved chips --> 2 partitions of 16384 KiB
-SA1100 flash: CFI device at 0x00000000, 32MiB, 32-bit
-
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- arch/arm/mach-sa1100/collie.c             |      2 +-
- 2 files changed, 230404 insertions(+), 1604 deletions(-)
-
-diff --git a/arch/arm/mach-sa1100/collie.c b/arch/arm/mach-sa1100/collie.c
-index 7fb96eb..c1005ef 100644
---- a/arch/arm/mach-sa1100/collie.c
-+++ b/arch/arm/mach-sa1100/collie.c
-@@ -298,7 +298,7 @@ static struct flash_platform_data collie_flash_data = {
- };
- 
- static struct resource collie_flash_resources[] = {
--	DEFINE_RES_MEM(SA1100_CS0_PHYS, SZ_32M),
-+	DEFINE_RES_MEM(SA1100_CS0_PHYS, SZ_16M),
- };
- 
- static struct sa1100fb_mach_info collie_lcd_info = {
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-power/collie_battery-dev-pm.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-power/collie_battery-dev-pm.patch
deleted file mode 100644
index 4792c32..0000000
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-power/collie_battery-dev-pm.patch
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
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-power/tosa_battery_irq_to_gpio.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-power/tosa_battery_irq_to_gpio.patch
deleted file mode 100644
index 9951d3a..0000000
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-power/tosa_battery_irq_to_gpio.patch
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
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-pxa/sharpsl_param.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-pxa/sharpsl_param.patch
deleted file mode 100644
index 934cdca..0000000
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-pxa/sharpsl_param.patch
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
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-pxa/tosa-keys-mapping.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-pxa/tosa-keys-mapping.patch
deleted file mode 100644
index b63754a..0000000
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-pxa/tosa-keys-mapping.patch
+++ /dev/null
@@ -1,136 +0,0 @@
-From patchwork Sat Nov 16 12:47:50 2013
-Content-Type: text/plain; charset="utf-8"
-MIME-Version: 1.0
-Content-Transfer-Encoding: 7bit
-Subject: [RESEND] arm: pxa: tosa: fix keys mapping
-From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
-X-Patchwork-Id: 3192431
-Message-Id: <20131116124750.GA26318@anuminas.rup.mentorg.com>
-To: linux-arm-kernel@lists.infradead.org
-Cc: Russell King <linux@arm.linux.org.uk>, Eric Miao <eric.y.miao@gmail.com>, 
-	Haojian Zhuang <haojian.zhuang@gmail.com>
-Date: Sat, 16 Nov 2013 16:47:50 +0400
-
-When converting from tosa-keyboard driver to matrix keyboard, tosa keys
-received extra 1 column shift. Replace that with correct values to make
-keyboard work again.
-
-Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
-
----
-arch/arm/mach-pxa/tosa.c | 102 +++++++++++++++++++++++------------------------
- 1 file changed, 51 insertions(+), 51 deletions(-)
-
-diff --git a/arch/arm/mach-pxa/tosa.c b/arch/arm/mach-pxa/tosa.c
-index 0206b91..ef5557b 100644
---- a/arch/arm/mach-pxa/tosa.c
-+++ b/arch/arm/mach-pxa/tosa.c
-@@ -425,57 +425,57 @@ static struct platform_device tosa_power_device = {
-  * Tosa Keyboard
-  */
- static const uint32_t tosakbd_keymap[] = {
--	KEY(0, 2, KEY_W),
--	KEY(0, 6, KEY_K),
--	KEY(0, 7, KEY_BACKSPACE),
--	KEY(0, 8, KEY_P),
--	KEY(1, 1, KEY_Q),
--	KEY(1, 2, KEY_E),
--	KEY(1, 3, KEY_T),
--	KEY(1, 4, KEY_Y),
--	KEY(1, 6, KEY_O),
--	KEY(1, 7, KEY_I),
--	KEY(1, 8, KEY_COMMA),
--	KEY(2, 1, KEY_A),
--	KEY(2, 2, KEY_D),
--	KEY(2, 3, KEY_G),
--	KEY(2, 4, KEY_U),
--	KEY(2, 6, KEY_L),
--	KEY(2, 7, KEY_ENTER),
--	KEY(2, 8, KEY_DOT),
--	KEY(3, 1, KEY_Z),
--	KEY(3, 2, KEY_C),
--	KEY(3, 3, KEY_V),
--	KEY(3, 4, KEY_J),
--	KEY(3, 5, TOSA_KEY_ADDRESSBOOK),
--	KEY(3, 6, TOSA_KEY_CANCEL),
--	KEY(3, 7, TOSA_KEY_CENTER),
--	KEY(3, 8, TOSA_KEY_OK),
--	KEY(3, 9, KEY_LEFTSHIFT),
--	KEY(4, 1, KEY_S),
--	KEY(4, 2, KEY_R),
--	KEY(4, 3, KEY_B),
--	KEY(4, 4, KEY_N),
--	KEY(4, 5, TOSA_KEY_CALENDAR),
--	KEY(4, 6, TOSA_KEY_HOMEPAGE),
--	KEY(4, 7, KEY_LEFTCTRL),
--	KEY(4, 8, TOSA_KEY_LIGHT),
--	KEY(4, 10, KEY_RIGHTSHIFT),
--	KEY(5, 1, KEY_TAB),
--	KEY(5, 2, KEY_SLASH),
--	KEY(5, 3, KEY_H),
--	KEY(5, 4, KEY_M),
--	KEY(5, 5, TOSA_KEY_MENU),
--	KEY(5, 7, KEY_UP),
--	KEY(5, 11, TOSA_KEY_FN),
--	KEY(6, 1, KEY_X),
--	KEY(6, 2, KEY_F),
--	KEY(6, 3, KEY_SPACE),
--	KEY(6, 4, KEY_APOSTROPHE),
--	KEY(6, 5, TOSA_KEY_MAIL),
--	KEY(6, 6, KEY_LEFT),
--	KEY(6, 7, KEY_DOWN),
--	KEY(6, 8, KEY_RIGHT),
-+	KEY(0, 1, KEY_W),
-+	KEY(0, 5, KEY_K),
-+	KEY(0, 6, KEY_BACKSPACE),
-+	KEY(0, 7, KEY_P),
-+	KEY(1, 0, KEY_Q),
-+	KEY(1, 1, KEY_E),
-+	KEY(1, 2, KEY_T),
-+	KEY(1, 3, KEY_Y),
-+	KEY(1, 5, KEY_O),
-+	KEY(1, 6, KEY_I),
-+	KEY(1, 7, KEY_COMMA),
-+	KEY(2, 0, KEY_A),
-+	KEY(2, 1, KEY_D),
-+	KEY(2, 2, KEY_G),
-+	KEY(2, 3, KEY_U),
-+	KEY(2, 5, KEY_L),
-+	KEY(2, 6, KEY_ENTER),
-+	KEY(2, 7, KEY_DOT),
-+	KEY(3, 0, KEY_Z),
-+	KEY(3, 1, KEY_C),
-+	KEY(3, 2, KEY_V),
-+	KEY(3, 3, KEY_J),
-+	KEY(3, 4, TOSA_KEY_ADDRESSBOOK),
-+	KEY(3, 5, TOSA_KEY_CANCEL),
-+	KEY(3, 6, TOSA_KEY_CENTER),
-+	KEY(3, 7, TOSA_KEY_OK),
-+	KEY(3, 8, KEY_LEFTSHIFT),
-+	KEY(4, 0, KEY_S),
-+	KEY(4, 1, KEY_R),
-+	KEY(4, 2, KEY_B),
-+	KEY(4, 3, KEY_N),
-+	KEY(4, 4, TOSA_KEY_CALENDAR),
-+	KEY(4, 5, TOSA_KEY_HOMEPAGE),
-+	KEY(4, 6, KEY_LEFTCTRL),
-+	KEY(4, 7, TOSA_KEY_LIGHT),
-+	KEY(4, 9, KEY_RIGHTSHIFT),
-+	KEY(5, 0, KEY_TAB),
-+	KEY(5, 1, KEY_SLASH),
-+	KEY(5, 2, KEY_H),
-+	KEY(5, 3, KEY_M),
-+	KEY(5, 4, TOSA_KEY_MENU),
-+	KEY(5, 6, KEY_UP),
-+	KEY(5, 10, TOSA_KEY_FN),
-+	KEY(6, 0, KEY_X),
-+	KEY(6, 1, KEY_F),
-+	KEY(6, 2, KEY_SPACE),
-+	KEY(6, 3, KEY_APOSTROPHE),
-+	KEY(6, 4, TOSA_KEY_MAIL),
-+	KEY(6, 5, KEY_LEFT),
-+	KEY(6, 6, KEY_DOWN),
-+	KEY(6, 7, KEY_RIGHT),
- };
- 
- static struct matrix_keymap_data tosakbd_keymap_data = {
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/arm-sa1100-add-cpu-clock.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/arm-sa1100-add-cpu-clock.patch
deleted file mode 100644
index cf3e23b..0000000
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/arm-sa1100-add-cpu-clock.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From 6abd8c6c642b7f5da4a8065fa6b29c4c90df308d Mon Sep 17 00:00:00 2001
-From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
-Date: Mon, 11 Nov 2013 22:53:36 +0400
-Subject: [PATCH 1/2] arm: sa1100: add cpu clock
-
-Both SA1100 framebuffer and PCMCIA drivers require knowledge of cpu
-frequency to correctly program timings.  Currently they receive timing
-information by calling cpufreq_get(0).  However if cpu frequency driver
-is not enabled (e.g. due to unsupported DRAM chip/board on sa1110)
-cpufreq_get(0) returns 0, causing incorrect timings to be programmed.
-
-Add cpu clock returning cpu frequency, to be used by sa11x0 fb and
-pcmcia drivers.
-
-Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
----
- arch/arm/mach-sa1100/clock.c | 34 ++++++++++++++++++++++++++++++++++
- 1 file changed, 34 insertions(+)
-
-diff --git a/arch/arm/mach-sa1100/clock.c b/arch/arm/mach-sa1100/clock.c
-index 172ebd0..abf1dc1 100644
---- a/arch/arm/mach-sa1100/clock.c
-+++ b/arch/arm/mach-sa1100/clock.c
-@@ -15,10 +15,12 @@
- #include <linux/clkdev.h>
- 
- #include <mach/hardware.h>
-+#include <mach/generic.h>
- 
- struct clkops {
- 	void			(*enable)(struct clk *);
- 	void			(*disable)(struct clk *);
-+	unsigned long		(*get_rate)(struct clk *);
- };
- 
- struct clk {
-@@ -51,6 +53,19 @@ static void clk_gpio27_disable(struct clk *clk)
- 	GAFR &= ~GPIO_32_768kHz;
- }
- 
-+static void clk_cpu_enable(struct clk *clk)
-+{
-+}
-+
-+static void clk_cpu_disable(struct clk *clk)
-+{
-+}
-+
-+static unsigned long clk_cpu_get_rate(struct clk *clk)
-+{
-+	return sa11x0_getspeed(0) * 1000;
-+}
-+
- int clk_enable(struct clk *clk)
- {
- 	unsigned long flags;
-@@ -80,16 +95,35 @@ void clk_disable(struct clk *clk)
- }
- EXPORT_SYMBOL(clk_disable);
- 
-+unsigned long clk_get_rate(struct clk *clk)
-+{
-+	if (clk && clk->ops && clk->ops->get_rate)
-+		return clk->ops->get_rate(clk);
-+	else
-+		return 0;
-+}
-+EXPORT_SYMBOL(clk_get_rate);
-+
- const struct clkops clk_gpio27_ops = {
- 	.enable		= clk_gpio27_enable,
- 	.disable	= clk_gpio27_disable,
- };
- 
-+const struct clkops clk_cpu_ops = {
-+	.enable		= clk_cpu_enable,
-+	.disable	= clk_cpu_disable,
-+	.get_rate	= clk_cpu_get_rate,
-+};
-+
- static DEFINE_CLK(gpio27, &clk_gpio27_ops);
- 
-+static DEFINE_CLK(cpu, &clk_cpu_ops);
-+
- static struct clk_lookup sa11xx_clkregs[] = {
- 	CLKDEV_INIT("sa1111.0", NULL, &clk_gpio27),
- 	CLKDEV_INIT("sa1100-rtc", NULL, NULL),
-+	CLKDEV_INIT("sa11x0-fb", NULL, &clk_cpu),
-+	CLKDEV_INIT("sa11x0-pcmcia", NULL, &clk_cpu),
- };
- 
- static int __init sa11xx_clk_init(void)
--- 
-1.8.4.2
-
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/collie-add-bootblock.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/collie-add-bootblock.patch
deleted file mode 100644
index 9f5aaa7..0000000
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/collie-add-bootblock.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 0b6559d7a3e28c89c3093fd193076a5d7d7c699b Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Sat, 9 Nov 2013 16:30:01 +0100
-Subject: [PATCH] linux-yocto: collie: add top boot partition
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- arch/arm/mach-sa1100/collie.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/arch/arm/mach-sa1100/collie.c b/arch/arm/mach-sa1100/collie.c
-index 946fa71..2785e6e 100644
---- a/arch/arm/mach-sa1100/collie.c
-+++ b/arch/arm/mach-sa1100/collie.c
-@@ -294,6 +294,11 @@ static struct mtd_partition collie_partitions[] = {
- 		.name		= "rootfs",
- 		.offset 	= MTDPART_OFS_APPEND,
- 		.size		= 0x00e20000,
-+	}, {
-+		.name		= "bootblock",
-+		.offset 	= MTDPART_OFS_APPEND,
-+		.size		= 0x00020000,
-+		.mask_flags	= MTD_WRITEABLE
- 	}
- };
- 
--- 
-1.8.1.5
-
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/collie-irda.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/collie-irda.patch
deleted file mode 100644
index 46ad808..0000000
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/collie-irda.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From c6fb61edf283f255c3763a57366bb89bb36ad79c Mon Sep 17 00:00:00 2001
-From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
-Date: Fri, 8 Nov 2013 17:57:32 +0400
-Subject: [PATCH] collie: add support for IrDA transceiver
-
-Collie has onboard IrDA transceiver controlled via active-low gpio. Add
-corresponding platform data.
-
-Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
----
- arch/arm/mach-sa1100/collie.c              | 33 ++++++++++++++++++++++++++++++
- arch/arm/mach-sa1100/include/mach/collie.h |  2 +-
- 2 files changed, 34 insertions(+), 1 deletion(-)
-
-diff --git a/arch/arm/mach-sa1100/collie.c b/arch/arm/mach-sa1100/collie.c
-index 2349dee..1b9473d 100644
---- a/arch/arm/mach-sa1100/collie.c
-+++ b/arch/arm/mach-sa1100/collie.c
-@@ -41,6 +41,7 @@
- #include <asm/mach/arch.h>
- #include <asm/mach/flash.h>
- #include <asm/mach/map.h>
-+#include <asm/mach/irda.h>
- 
- #include <asm/hardware/scoop.h>
- #include <asm/mach/sharpsl_param.h>
-@@ -94,6 +95,37 @@ static struct mcp_plat_data collie_mcp_data = {
- 	.codec_pdata	= &collie_ucb1x00_data,
- };
- 
-+int collie_ir_startup(struct device *dev)
-+{
-+	int rc = gpio_request(COLLIE_GPIO_IR_ON, "IrDA");
-+	if (rc)
-+		return rc;
-+	rc = gpio_direction_output(COLLIE_GPIO_IR_ON, 1);
-+
-+	if (!rc)
-+		return 0;
-+
-+	gpio_free(COLLIE_GPIO_IR_ON);
-+	return rc;
-+}
-+
-+void collie_ir_shutdown(struct device *dev)
-+{
-+	gpio_free(COLLIE_GPIO_IR_ON);
-+}
-+
-+static int collie_ir_set_power(struct device *dev, unsigned int state)
-+{
-+	gpio_set_value(COLLIE_GPIO_IR_ON, !state);
-+	return 0;
-+}
-+
-+static struct irda_platform_data collie_ir_data = {
-+	.startup = collie_ir_startup,
-+	.shutdown = collie_ir_shutdown,
-+	.set_power = collie_ir_set_power,
-+};
-+
- /*
-  * Collie AC IN
-  */
-@@ -323,6 +355,7 @@ static void __init collie_init(void)
- 	sa11x0_register_mtd(&collie_flash_data, collie_flash_resources,
- 			    ARRAY_SIZE(collie_flash_resources));
- 	sa11x0_register_mcp(&collie_mcp_data);
-+	sa11x0_register_irda(&collie_ir_data);
- 
- 	sharpsl_save_param();
- }
-diff --git a/arch/arm/mach-sa1100/include/mach/collie.h b/arch/arm/mach-sa1100/include/mach/collie.h
-index f33679d..0ef22f9 100644
---- a/arch/arm/mach-sa1100/include/mach/collie.h
-+++ b/arch/arm/mach-sa1100/include/mach/collie.h
-@@ -78,7 +78,7 @@ extern void locomolcd_power(int on);
- #define COLLIE_TC35143_GPIO_VERSION0    UCB_IO_0
- #define COLLIE_TC35143_GPIO_TBL_CHK     UCB_IO_1
- #define COLLIE_TC35143_GPIO_VPEN_ON     UCB_IO_2
--#define COLLIE_TC35143_GPIO_IR_ON       UCB_IO_3
-+#define COLLIE_GPIO_IR_ON		(COLLIE_TC35143_GPIO_BASE + 3)
- #define COLLIE_TC35143_GPIO_AMP_ON      UCB_IO_4
- #define COLLIE_TC35143_GPIO_VERSION1    UCB_IO_5
- #define COLLIE_TC35143_GPIO_FS8KLPF     UCB_IO_5
--- 
-1.8.4.rc3
-
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/fbdev-sa1100fb-make-use-of-device-clock.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/fbdev-sa1100fb-make-use-of-device-clock.patch
deleted file mode 100644
index 7460692..0000000
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/fbdev-sa1100fb-make-use-of-device-clock.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-From 14edf9123f62bbfbfbffe38e2837b51b3a6065b5 Mon Sep 17 00:00:00 2001
-From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
-Date: Mon, 11 Nov 2013 22:58:02 +0400
-Subject: [PATCH 2/2] fbdev: sa1100fb: make use of device clock
-
-Use per-device clock (instead of calling cpufreq_get(0), which can
-return 0 if no cpu frequency driver is selected) to program timings.
-
-Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
----
- drivers/video/sa1100fb.c | 24 +++++++++++++++++-------
- drivers/video/sa1100fb.h |  1 +
- 2 files changed, 18 insertions(+), 7 deletions(-)
-
-diff --git a/drivers/video/sa1100fb.c b/drivers/video/sa1100fb.c
-index de76da0..13d2c99 100644
---- a/drivers/video/sa1100fb.c
-+++ b/drivers/video/sa1100fb.c
-@@ -178,6 +178,7 @@
- #include <linux/dma-mapping.h>
- #include <linux/mutex.h>
- #include <linux/io.h>
-+#include <linux/clk.h>
- 
- #include <video/sa1100fb.h>
- 
-@@ -413,9 +414,9 @@ sa1100fb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
- 		var->transp.offset);
- 
- #ifdef CONFIG_CPU_FREQ
--	dev_dbg(fbi->dev, "dma period = %d ps, clock = %d kHz\n",
-+	dev_dbg(fbi->dev, "dma period = %d ps, clock = %ld kHz\n",
- 		sa1100fb_display_dma_period(var),
--		cpufreq_get(smp_processor_id()));
-+		clk_get_rate(fbi->clk)/1000);
- #endif
- 
- 	return 0;
-@@ -586,9 +587,10 @@ static struct fb_ops sa1100fb_ops = {
-  * Calculate the PCD value from the clock rate (in picoseconds).
-  * We take account of the PPCR clock setting.
-  */
--static inline unsigned int get_pcd(unsigned int pixclock, unsigned int cpuclock)
-+static inline unsigned int get_pcd(struct sa1100fb_info *fbi,
-+		unsigned int pixclock)
- {
--	unsigned int pcd = cpuclock / 100;
-+	unsigned int pcd = clk_get_rate(fbi->clk)/ 100 / 1000;
- 
- 	pcd *= pixclock;
- 	pcd /= 10000000;
-@@ -667,7 +669,7 @@ static int sa1100fb_activate_var(struct fb_var_screeninfo *var, struct sa1100fb_
- 		LCCR2_BegFrmDel(var->upper_margin) +
- 		LCCR2_EndFrmDel(var->lower_margin);
- 
--	pcd = get_pcd(var->pixclock, cpufreq_get(0));
-+	pcd = get_pcd(fbi, var->pixclock);
- 	new_regs.lccr3 = LCCR3_PixClkDiv(pcd) | fbi->inf->lccr3 |
- 		(var->sync & FB_SYNC_HOR_HIGH_ACT ? LCCR3_HorSnchH : LCCR3_HorSnchL) |
- 		(var->sync & FB_SYNC_VERT_HIGH_ACT ? LCCR3_VrtSnchH : LCCR3_VrtSnchL);
-@@ -1003,7 +1005,6 @@ sa1100fb_freq_transition(struct notifier_block *nb, unsigned long val,
- 			 void *data)
- {
- 	struct sa1100fb_info *fbi = TO_INF(nb, freq_transition);
--	struct cpufreq_freqs *f = data;
- 	u_int pcd;
- 
- 	switch (val) {
-@@ -1012,7 +1013,7 @@ sa1100fb_freq_transition(struct notifier_block *nb, unsigned long val,
- 		break;
- 
- 	case CPUFREQ_POSTCHANGE:
--		pcd = get_pcd(fbi->fb.var.pixclock, f->new);
-+		pcd = get_pcd(fbi, fbi->fb.var.pixclock);
- 		fbi->reg_lccr3 = (fbi->reg_lccr3 & ~0xff) | LCCR3_PixClkDiv(pcd);
- 		set_ctrlr_state(fbi, C_ENABLE_CLKCHANGE);
- 		break;
-@@ -1219,6 +1220,13 @@ static int sa1100fb_probe(struct platform_device *pdev)
- 	if (!fbi)
- 		goto failed;
- 
-+	fbi->clk = clk_get(&pdev->dev, NULL);
-+	if (IS_ERR(fbi->clk)) {
-+		ret = PTR_ERR(fbi->clk);
-+		fbi->clk = NULL;
-+		goto failed;
-+	}
-+
- 	fbi->base = ioremap(res->start, resource_size(res));
- 	if (!fbi->base)
- 		goto failed;
-@@ -1271,6 +1279,8 @@ static int sa1100fb_probe(struct platform_device *pdev)
-  failed:
- 	if (fbi)
- 		iounmap(fbi->base);
-+	if (fbi->clk)
-+		clk_put(fbi->clk);
- 	platform_set_drvdata(pdev, NULL);
- 	kfree(fbi);
- 	release_mem_region(res->start, resource_size(res));
-diff --git a/drivers/video/sa1100fb.h b/drivers/video/sa1100fb.h
-index fc5d429..0139d13 100644
---- a/drivers/video/sa1100fb.h
-+++ b/drivers/video/sa1100fb.h
-@@ -68,6 +68,7 @@ struct sa1100fb_info {
- #endif
- 
- 	const struct sa1100fb_mach_info *inf;
-+	struct clk *clk;
- };
- 
- #define TO_INF(ptr,member)	container_of(ptr,struct sa1100fb_info,member)
--- 
-1.8.4.2
-
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/pcmcia-sa1100-device-clock.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/pcmcia-sa1100-device-clock.patch
deleted file mode 100644
index 1d12fc8..0000000
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-sa1100/pcmcia-sa1100-device-clock.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From patchwork Tue Nov 12 03:32:10 2013
-Content-Type: text/plain; charset="utf-8"
-MIME-Version: 1.0
-Content-Transfer-Encoding: 7bit
-Subject: [3/5] pcmcia: sa1100: make use of device clock
-From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
-X-Patchwork-Id: 3170611
-Message-Id: <1384227132-10501-3-git-send-email-dbaryshkov@gmail.com>
-To: linux-arm-kernel@lists.infradead.org
-Cc: linux-fbdev@vger.kernel.org, linux-pcmcia@lists.infradead.org,
-	Russell King <linux@arm.linux.org.uk>
-Date: Tue, 12 Nov 2013 07:32:10 +0400
-
-Use per-device clock (instead of calling cpufreq_get(0), which can
-return 0 if no cpu frequency driver is selected) to program timings.
-
-Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
-
----
-drivers/pcmcia/sa1100_generic.c |  1 +
- drivers/pcmcia/sa11xx_base.c    | 14 ++++++++++++--
- 2 files changed, 13 insertions(+), 2 deletions(-)
-
-diff --git a/drivers/pcmcia/sa1100_generic.c b/drivers/pcmcia/sa1100_generic.c
-index ff8a027..d2ab060 100644
---- a/drivers/pcmcia/sa1100_generic.c
-+++ b/drivers/pcmcia/sa1100_generic.c
-@@ -93,6 +93,7 @@ static int sa11x0_drv_pcmcia_remove(struct platform_device *dev)
- 	for (i = 0; i < sinfo->nskt; i++)
- 		soc_pcmcia_remove_one(&sinfo->skt[i]);
- 
-+	clk_put(sinfo->clk);
- 	kfree(sinfo);
- 	return 0;
- }
-diff --git a/drivers/pcmcia/sa11xx_base.c b/drivers/pcmcia/sa11xx_base.c
-index 6eecd7c..aef0e69 100644
---- a/drivers/pcmcia/sa11xx_base.c
-+++ b/drivers/pcmcia/sa11xx_base.c
-@@ -38,6 +38,7 @@
- #include <linux/spinlock.h>
- #include <linux/io.h>
- #include <linux/slab.h>
-+#include <linux/clk.h>
- 
- #include <mach/hardware.h>
- #include <asm/irq.h>
-@@ -138,14 +139,15 @@ sa1100_pcmcia_frequency_change(struct soc_pcmcia_socket *skt,
- static int
- sa1100_pcmcia_set_timing(struct soc_pcmcia_socket *skt)
- {
--	return sa1100_pcmcia_set_mecr(skt, cpufreq_get(0));
-+	unsigned long clk = clk_get_rate(skt->clk);
-+	return sa1100_pcmcia_set_mecr(skt, clk / 1000);
- }
- 
- static int
- sa1100_pcmcia_show_timing(struct soc_pcmcia_socket *skt, char *buf)
- {
- 	struct soc_pcmcia_timing timing;
--	unsigned int clock = cpufreq_get(0);
-+	unsigned int clock = clk_get_rate(skt->clk);
- 	unsigned long mecr = MECR;
- 	char *p = buf;
- 
-@@ -221,6 +223,11 @@ int sa11xx_drv_pcmcia_probe(struct device *dev, struct pcmcia_low_level *ops,
- 	struct skt_dev_info *sinfo;
- 	struct soc_pcmcia_socket *skt;
- 	int i, ret = 0;
-+	struct clk *clk;
-+
-+	clk = clk_get(dev, NULL);
-+	if (IS_ERR(clk))
-+		return -ENODEV;
- 
- 	sa11xx_drv_pcmcia_ops(ops);
- 
-@@ -229,12 +236,14 @@ int sa11xx_drv_pcmcia_probe(struct device *dev, struct pcmcia_low_level *ops,
- 		return -ENOMEM;
- 
- 	sinfo->nskt = nr;
-+	sinfo->clk = clk;
- 
- 	/* Initialize processor specific parameters */
- 	for (i = 0; i < nr; i++) {
- 		skt = &sinfo->skt[i];
- 
- 		skt->nr = first + i;
-+		skt->clk = clk;
- 		soc_pcmcia_init_one(skt, ops, dev);
- 
- 		ret = sa11xx_drv_pcmcia_add_one(skt);
-@@ -245,6 +254,7 @@ int sa11xx_drv_pcmcia_probe(struct device *dev, struct pcmcia_low_level *ops,
- 	if (ret) {
- 		while (--i >= 0)
- 			soc_pcmcia_remove_one(&sinfo->skt[i]);
-+		clk_put(clk);
- 		kfree(sinfo);
- 	} else {
- 		dev_set_drvdata(dev, sinfo);
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend
index 85a9182..69179f3 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.10:${THISDIR}/${PN}:${THISDIR}/files:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.10:${THISDIR}/linux-yocto-3.10:${THISDIR}/files:"
 
 # re-expand the defconfig produced by 'make savedefconfig'
 KCONFIG_MODE = "--alldefconfig"
-- 
1.8.1.5


