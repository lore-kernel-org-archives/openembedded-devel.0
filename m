Return-Path: <linus.walleij@linaro.org>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id F03D565C7B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 08:11:33 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id k14so696898wgh.37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 00:11:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TYnRsQTmOSj2Yd6W0JBlkvubRnDyFIzMGTt42Qyp4kU=;
	b=fjsM4VRRFcuc73JIxRjqZzIDac7KrGPDhyhSMW/uBdkBDlH7Jh7Jx6Cydet6Bc92ZD
	i+xO7D0XyirARo1z8fH0oREsOnL7I3DDv480NvsVmWMPKSDVqVYNfrW8BAr0jNamqmUq
	z7hVpJEFw7K+0Csg0LdabM1ej20OCW8Rmnq7pJUUe5fztafuSbO0ORogCN9qVAfZpAPR
	HPrkG1LadNHPk1YkqsxQjGUqcSK5SF509tmPMY8hjtHTtLZIYZicSjpeCi2LNHXVJcHw
	l4yL3QOQlko2e8SwXM42GKtmMLzrZXTPezshl0NJkbtKmh8JdYkzwKPX8Sj/I8isf4C3
	s8Sw==
X-Gm-Message-State: ALoCoQmmQi5kVQTSBsGrI76SYl9mJCj50FRDjCpc6QaYKTLj/ToRd7PAsk35nRb7SIRuQpDo9Pap
X-Received: by 10.194.236.200 with SMTP id uw8mr11723987wjc.50.1415952693062; 
	Fri, 14 Nov 2014 00:11:33 -0800 (PST)
Received: from localhost.localdomain ([85.235.11.236])
	by mx.google.com with ESMTPSA id f6sm2402614wix.5.2014.11.14.00.11.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Nov 2014 00:11:32 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Nov 2014 09:11:23 +0100
Message-Id: <1415952683-6070-1-git-send-email-linus.walleij@linaro.org>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] meta-handheld: h3600: support kernel v3.17
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
X-List-Received-Date: Fri, 14 Nov 2014 08:11:36 -0000

This makes the v3.17 kernel work with the h3600 target.

As of kernel v3.17, most drivers for the H3600 have been
upstreamed and we only need two patches to boot it
successfully with full support.

Patch 1 is merged upstream by now (v3.18), patch 2 is
being worked on.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 ...ARM-sa1100-add-Micro-ASIC-platform-device.patch |  73 ++++++++
 ...r-for-microcontroller-keys-on-the-iPaq-h3.patch | 208 +++++++++++++++++++++
 .../linux/linux-yocto-3.17/h3600/defconfig         |  95 ++++++++++
 recipes-kernel/linux/linux-yocto_3.17.bbappend     |  10 +-
 4 files changed, 385 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/h3600/0001-ARM-sa1100-add-Micro-ASIC-platform-device.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/h3600/0002-input-driver-for-microcontroller-keys-on-the-iPaq-h3.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/h3600/defconfig

diff --git a/recipes-kernel/linux/linux-yocto-3.17/h3600/0001-ARM-sa1100-add-Micro-ASIC-platform-device.patch b/recipes-kernel/linux/linux-yocto-3.17/h3600/0001-ARM-sa1100-add-Micro-ASIC-platform-device.patch
new file mode 100644
index 000000000000..59f21ece8fbd
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.17/h3600/0001-ARM-sa1100-add-Micro-ASIC-platform-device.patch
@@ -0,0 +1,73 @@
+From d5acbfe59ac68f771238a0abcae66a668c77e928 Mon Sep 17 00:00:00 2001
+From: Linus Walleij <linus.walleij@linaro.org>
+Date: Thu, 17 Oct 2013 15:03:17 +0200
+Subject: [PATCH 1/2] ARM: sa1100: add Micro ASIC platform device
+
+This adds the Atmel Micro ASIC platform device and selects it
+by default for h3100 and h3600.
+
+Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
+---
+ arch/arm/mach-sa1100/Kconfig |  2 ++
+ arch/arm/mach-sa1100/h3xxx.c | 15 +++++++++++++++
+ 2 files changed, 17 insertions(+)
+
+diff --git a/arch/arm/mach-sa1100/Kconfig b/arch/arm/mach-sa1100/Kconfig
+index 04f9784ff0ed..c6f6ed1cbed0 100644
+--- a/arch/arm/mach-sa1100/Kconfig
++++ b/arch/arm/mach-sa1100/Kconfig
+@@ -58,6 +58,7 @@ config SA1100_H3100
+ 	bool "Compaq iPAQ H3100"
+ 	select ARM_SA1110_CPUFREQ
+ 	select HTC_EGPIO
++	select MFD_IPAQ_MICRO
+ 	help
+ 	  Say Y here if you intend to run this kernel on the Compaq iPAQ
+ 	  H3100 handheld computer.  Information about this machine and the
+@@ -69,6 +70,7 @@ config SA1100_H3600
+ 	bool "Compaq iPAQ H3600/H3700"
+ 	select ARM_SA1110_CPUFREQ
+ 	select HTC_EGPIO
++	select MFD_IPAQ_MICRO
+ 	help
+ 	  Say Y here if you intend to run this kernel on the Compaq iPAQ
+ 	  H3600 handheld computer.  Information about this machine and the
+diff --git a/arch/arm/mach-sa1100/h3xxx.c b/arch/arm/mach-sa1100/h3xxx.c
+index c79bf467fb7f..b1d4faa12f9a 100644
+--- a/arch/arm/mach-sa1100/h3xxx.c
++++ b/arch/arm/mach-sa1100/h3xxx.c
+@@ -25,6 +25,7 @@
+ #include <asm/mach/map.h>
+ 
+ #include <mach/h3xxx.h>
++#include <mach/irqs.h>
+ 
+ #include "generic.h"
+ 
+@@ -244,9 +245,23 @@ static struct platform_device h3xxx_keys = {
+ 	},
+ };
+ 
++static struct resource h3xxx_micro_resources[] = {
++	DEFINE_RES_MEM(0x80010000, SZ_4K),
++	DEFINE_RES_MEM(0x80020000, SZ_4K),
++	DEFINE_RES_IRQ(IRQ_Ser1UART),
++};
++
++struct platform_device h3xxx_micro_asic = {
++	.name = "ipaq-h3xxx-micro",
++	.id = -1,
++	.resource = h3xxx_micro_resources,
++	.num_resources = ARRAY_SIZE(h3xxx_micro_resources),
++};
++
+ static struct platform_device *h3xxx_devices[] = {
+ 	&h3xxx_egpio,
+ 	&h3xxx_keys,
++	&h3xxx_micro_asic,
+ };
+ 
+ void __init h3xxx_mach_init(void)
+-- 
+1.9.3
+
diff --git a/recipes-kernel/linux/linux-yocto-3.17/h3600/0002-input-driver-for-microcontroller-keys-on-the-iPaq-h3.patch b/recipes-kernel/linux/linux-yocto-3.17/h3600/0002-input-driver-for-microcontroller-keys-on-the-iPaq-h3.patch
new file mode 100644
index 000000000000..d0323017ccf3
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.17/h3600/0002-input-driver-for-microcontroller-keys-on-the-iPaq-h3.patch
@@ -0,0 +1,208 @@
+From 85f85d37b594cf937d007f90d10a4d978666ced7 Mon Sep 17 00:00:00 2001
+From: Dmitry Artamonow <mad_soft@inbox.ru>
+Date: Sat, 21 Mar 2009 16:22:16 +0300
+Subject: [PATCH 2/2] input: driver for microcontroller keys on the iPaq h3xxx
+
+This adds a key input driver for the keys found on the h3xxx
+iPAQ series.
+
+Based on a driver from handhelds.org 2.6.21 kernel, written
+by Alessandro GARDICH.
+
+Signed-off-by: Alessandro GARDICH <gremlin@gremlin.it>
+Signed-off-by: Dmitry Artamonow <mad_soft@inbox.ru>
+Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
+---
+ drivers/input/keyboard/Kconfig           |   7 ++
+ drivers/input/keyboard/Makefile          |   1 +
+ drivers/input/keyboard/ipaq-micro-keys.c | 148 +++++++++++++++++++++++++++++++
+ 3 files changed, 156 insertions(+)
+ create mode 100644 drivers/input/keyboard/ipaq-micro-keys.c
+
+diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
+index a3958c63d7d5..ff21613c7cc7 100644
+--- a/drivers/input/keyboard/Kconfig
++++ b/drivers/input/keyboard/Kconfig
+@@ -577,6 +577,13 @@ config KEYBOARD_DAVINCI
+ 	  To compile this driver as a module, choose M here: the
+ 	  module will be called davinci_keyscan.
+ 
++config KEYBOARD_IPAQ_MICRO
++	tristate "Buttons on Micro SoC (iPaq h3100,h3600,h3700)"
++	depends on MFD_IPAQ_MICRO
++	help
++	  This enables support for the buttons attached to
++	  Micro peripheral controller on iPAQ h3100/h3600/h3700
++
+ config KEYBOARD_OMAP
+ 	tristate "TI OMAP keypad support"
+ 	depends on ARCH_OMAP1
+diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
+index 0a3345634d79..7e2320523db0 100644
+--- a/drivers/input/keyboard/Makefile
++++ b/drivers/input/keyboard/Makefile
+@@ -23,6 +23,7 @@ obj-$(CONFIG_KEYBOARD_TCA6416)		+= tca6416-keypad.o
+ obj-$(CONFIG_KEYBOARD_TCA8418)		+= tca8418_keypad.o
+ obj-$(CONFIG_KEYBOARD_HIL)		+= hil_kbd.o
+ obj-$(CONFIG_KEYBOARD_HIL_OLD)		+= hilkbd.o
++obj-$(CONFIG_KEYBOARD_IPAQ_MICRO)	+= ipaq-micro-keys.o
+ obj-$(CONFIG_KEYBOARD_IMX)		+= imx_keypad.o
+ obj-$(CONFIG_KEYBOARD_HP6XX)		+= jornada680_kbd.o
+ obj-$(CONFIG_KEYBOARD_HP7XX)		+= jornada720_kbd.o
+diff --git a/drivers/input/keyboard/ipaq-micro-keys.c b/drivers/input/keyboard/ipaq-micro-keys.c
+new file mode 100644
+index 000000000000..7ca8b738cc73
+--- /dev/null
++++ b/drivers/input/keyboard/ipaq-micro-keys.c
+@@ -0,0 +1,148 @@
++/*
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ * h3600 atmel micro companion support, key subdevice
++ * based on previous kernel 2.4 version
++ * Author : Alessandro Gardich <gremlin@gremlin.it>
++ * Author : Linus Walleij <linus.walleij@linaro.org>
++ *
++ */
++
++
++#include <linux/module.h>
++#include <linux/version.h>
++
++#include <linux/init.h>
++#include <linux/fs.h>
++#include <linux/interrupt.h>
++#include <linux/sched.h>
++#include <linux/pm.h>
++#include <linux/sysctl.h>
++#include <linux/proc_fs.h>
++#include <linux/delay.h>
++#include <linux/device.h>
++#include <linux/input.h>
++#include <linux/platform_device.h>
++#include <linux/mfd/ipaq-micro.h>
++
++struct ipaq_micro_keys {
++	struct ipaq_micro *micro;
++	struct input_dev *input;
++};
++
++static int keycodes[] = {
++	KEY_RECORD,		/* 1:  Record button			*/
++	KEY_CALENDAR,		/* 2:  Calendar				*/
++	KEY_ADDRESSBOOK,	/* 3:  Contacts (looks like Outlook)	*/
++	KEY_MAIL,		/* 4:  Envelope (Q on older iPAQs)	*/
++	KEY_HOMEPAGE,		/* 5:  Start (looks like swoopy arrow)	*/
++	KEY_UP,			/* 6:  Up				*/
++	KEY_RIGHT,		/* 7:  Right				*/
++	KEY_LEFT,		/* 8:  Left				*/
++	KEY_DOWN,		/* 9:  Down				*/
++};
++
++static void micro_key_receive(void *data, int len, unsigned char *msg)
++{
++	struct ipaq_micro_keys *keys = data;
++	int key, down;
++
++	down = (0x80 & msg[0]) ? 1 : 0;
++	key  = 0x7f & msg[0];
++
++	if (key < ARRAY_SIZE(keycodes)) {
++		input_report_key(keys->input, keycodes[key], down);
++		input_sync(keys->input);
++	}
++}
++
++static int micro_key_probe(struct platform_device *pdev)
++{
++	struct ipaq_micro_keys *keys;
++	int ret;
++	int i;
++
++	keys = devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
++	if (!keys)
++		return -ENOMEM;
++	keys->input = input_allocate_device();
++	if (!keys->input)
++		return -ENOMEM;
++	keys->micro = dev_get_drvdata(pdev->dev.parent);
++	keys->input->evbit[0] = BIT(EV_KEY);
++	set_bit(EV_KEY, keys->input->evbit);
++	for (i = 0; i < ARRAY_SIZE(keycodes); i++)
++		set_bit(keycodes[i], keys->input->keybit);
++
++	keys->input->name = "h3600 micro keys";
++
++	ret = input_register_device(keys->input);
++	if (ret)
++		return ret;
++
++	platform_set_drvdata(pdev, keys);
++	spin_lock(&keys->micro->lock);
++	keys->micro->key = micro_key_receive;
++	keys->micro->key_data = keys;
++	spin_unlock(&keys->micro->lock);
++
++	return 0;
++}
++
++static int micro_key_remove(struct platform_device *pdev)
++{
++	struct ipaq_micro_keys *keys = platform_get_drvdata(pdev);
++
++	input_unregister_device(keys->input);
++
++	spin_lock(&keys->micro->lock);
++	keys->micro->key = NULL;
++	keys->micro->key_data = NULL;
++	spin_unlock(&keys->micro->lock);
++
++	return 0;
++}
++
++static int micro_key_suspend(struct device *dev)
++{
++	struct ipaq_micro_keys *keys = dev_get_drvdata(dev);
++
++	spin_lock(&keys->micro->lock);
++	keys->micro->key = NULL;
++	keys->micro->key_data = NULL;
++	spin_unlock(&keys->micro->lock);
++
++	return 0;
++}
++
++static int micro_key_resume(struct device *dev)
++{
++	struct ipaq_micro_keys *keys = dev_get_drvdata(dev);
++
++	spin_lock(&keys->micro->lock);
++	keys->micro->key = micro_key_receive;
++	keys->micro->key_data = keys;
++	spin_unlock(&keys->micro->lock);
++
++	return 0;
++}
++
++static const struct dev_pm_ops micro_key_dev_pm_ops = {
++	SET_SYSTEM_SLEEP_PM_OPS(micro_key_suspend, micro_key_resume)
++};
++
++struct platform_driver micro_key_device_driver = {
++	.driver = {
++		.name    = "ipaq-micro-keys",
++		.pm	= &micro_key_dev_pm_ops,
++	},
++	.probe   = micro_key_probe,
++	.remove  = micro_key_remove,
++};
++module_platform_driver(micro_key_device_driver);
++
++MODULE_LICENSE("GPL");
++MODULE_DESCRIPTION("driver for iPAQ Atmel micro keys");
++MODULE_ALIAS("platform:ipaq-micro-keys");
+-- 
+1.9.3
+
diff --git a/recipes-kernel/linux/linux-yocto-3.17/h3600/defconfig b/recipes-kernel/linux/linux-yocto-3.17/h3600/defconfig
new file mode 100644
index 000000000000..8553cd8533ce
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.17/h3600/defconfig
@@ -0,0 +1,95 @@
+CONFIG_LOCALVERSION="-yocto-standard"
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_MODULES=y
+# CONFIG_LBDAF is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_ARCH_SA1100=y
+CONFIG_SA1100_H3600=y
+CONFIG_PCCARD=y
+CONFIG_PCMCIA_SA1100=y
+CONFIG_PREEMPT=y
+CONFIG_AEABI=y
+CONFIG_OABI_COMPAT=y
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+# CONFIG_CPU_FREQ_STAT is not set
+CONFIG_FPE_NWFPE=y
+CONFIG_NET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_IPV6 is not set
+CONFIG_IRDA=y
+CONFIG_IRLAN=m
+CONFIG_IRNET=m
+CONFIG_IRCOMM=m
+# CONFIG_WIRELESS is not set
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_MTD=y
+CONFIG_MTD_REDBOOT_PARTS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_CFI=y
+CONFIG_MTD_CFI_ADV_OPTIONS=y
+CONFIG_MTD_CFI_GEOMETRY=y
+# CONFIG_MTD_CFI_I1 is not set
+CONFIG_MTD_CFI_INTELEXT=y
+CONFIG_MTD_SA1100=y
+CONFIG_BLK_DEV_LOOP=m
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_SIZE=8192
+CONFIG_IDE=y
+CONFIG_BLK_DEV_IDECS=y
+CONFIG_NETDEVICES=y
+CONFIG_PCMCIA_PCNET=y
+CONFIG_PPP=m
+CONFIG_PPP_BSDCOMP=m
+CONFIG_PPP_DEFLATE=m
+CONFIG_PPP_ASYNC=m
+# CONFIG_WLAN is not set
+CONFIG_INPUT_EVDEV=y
+# CONFIG_KEYBOARD_ATKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+CONFIG_KEYBOARD_IPAQ_MICRO=y
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_IPAQ_MICRO=y
+# CONFIG_SERIO is not set
+CONFIG_SERIAL_SA1100=y
+CONFIG_SERIAL_SA1100_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_POWER_SUPPLY=y
+CONFIG_BATTERY_IPAQ_MICRO=y
+# CONFIG_HWMON is not set
+CONFIG_FB=y
+CONFIG_FB_SA1100=y
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_LOGO=y
+# CONFIG_USB_SUPPORT is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_IPAQ_MICRO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_DMADEVICES=y
+CONFIG_DMA_SA11X0=y
+CONFIG_DMATEST=y
+CONFIG_EXT2_FS=y
+CONFIG_MSDOS_FS=m
+CONFIG_VFAT_FS=m
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_SUMMARY=y
+CONFIG_JFFS2_COMPRESSION_OPTIONS=y
+CONFIG_JFFS2_LZO=y
+CONFIG_CRAMFS=m
+CONFIG_NFS_FS=y
+CONFIG_NFSD=m
+CONFIG_NLS=y
+CONFIG_DEBUG_FS=y
diff --git a/recipes-kernel/linux/linux-yocto_3.17.bbappend b/recipes-kernel/linux/linux-yocto_3.17.bbappend
index 992bc85870a9..54747d098167 100644
--- a/recipes-kernel/linux/linux-yocto_3.17.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.17.bbappend
@@ -1,7 +1,7 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.17:${THISDIR}/${PN}:"
 
 # Declare more compatible machines
-COMPATIBLE_MACHINE .= "|akita|c7x0|collie|poodle|spitz|tosa"
+COMPATIBLE_MACHINE .= "|akita|c7x0|collie|h3600|poodle|spitz|tosa"
 
 KERNEL_EXTRA_FEATURES_akita ?= ""
 KERNEL_EXTRA_FEATURES_c7x0 ?= ""
@@ -13,6 +13,7 @@ KERNEL_EXTRA_FEATURES_tosa ?= ""
 KMACHINE_akita = "akita"
 KMACHINE_c7x0 = "c7x0"
 KMACHINE_collie = "collie"
+KMACHINE_h3600 = "h3600"
 KMACHINE_poodle = "poodle"
 KMACHINE_spitz = "spitz"
 KMACHINE_tosa = "tosa"
@@ -22,6 +23,7 @@ KMACHINE_tosa = "tosa"
 KCONFIG_MODE_akita = "--alldefconfig"
 KCONFIG_MODE_c7x0 = "--alldefconfig"
 KCONFIG_MODE_collie = "--alldefconfig"
+KCONFIG_MODE_h3600 = "--alldefconfig"
 KCONFIG_MODE_poodle = "--alldefconfig"
 KCONFIG_MODE_spitz = "--alldefconfig"
 KCONFIG_MODE_tosa = "--alldefconfig"
@@ -54,6 +56,12 @@ SRC_URI_append_collie = " \
            file://mtd-resume.patch \
            \
            "
+SRC_URI_append_h3600 = " \
+           file://defconfig \
+           file://OE-qvga-logo.patch \
+           file://0001-ARM-sa1100-add-Micro-ASIC-platform-device.patch \
+           file://0002-input-driver-for-microcontroller-keys-on-the-iPaq-h3.patch \
+           "
 
 SRC_URI_append_poodle = " \
            file://defconfig \
-- 
1.9.3


