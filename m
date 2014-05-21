Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f41.google.com (unknown [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 466BB65DA3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 21:30:54 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so2025491eei.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 14:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wOPFJkAoHY4GgpquukRjVf96c+iUJTRfzTaGw6a7nwY=;
	b=T3rYmDzTEvPLsUX+7+7IBxsJNiAm7ocx9zBZwVRfK6Ao3MtsoFzF+AlXfriE0eLk94
	bk9RX2VeNRAPKzYC5Bdtls+BtBrwHs6mB996OwxYiMF9qN+CXuSgSLhvpExluq4vD0v1
	NDNpLO4fK3qqgNpBOrv/tw7AF/dQ1oV+oyVnFhvcgkHaMxun+82ENQuQhirUd5EMj6N/
	oy7noycaqFU95evJiky4JFjhPWZEpSzOHDg9zWXmEPKtOvMZOjn/4D2i0D4avGSCtv1g
	wR7aMjh829hUGdM1PkXirBSUg3dqt9VdYTHrmpyd72jsdC4fUMt4MaONOoFHjnerV78I
	Hfbw==
X-Received: by 10.14.109.201 with SMTP id s49mr7177848eeg.88.1400707855036;
	Wed, 21 May 2014 14:30:55 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host253-196-dynamic.45-79-r.retail.telecomitalia.it.
	[79.45.196.253])
	by mx.google.com with ESMTPSA id o5sm14784166eeg.8.2014.05.21.14.30.52
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 May 2014 14:30:54 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 May 2014 23:26:20 +0200
Message-Id: <1400707582-7786-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld][PATCH 1/3] linux-yocto_3.14: add patches and defconfig for ipaq h1940
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
X-List-Received-Date: Wed, 21 May 2014 21:30:58 -0000

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../h1940/0001-rfkill-add-IR-type.patch            |  59 +++
 ...-Remove-S3C24XX_DMA-dependency-from-S3C24.patch |  30 ++
 ...4xx-add-dma_coherent_mask-for-DMA-devices.patch |  35 ++
 ...s3c24xx-Add-DMA-resources-for-SDI-and-I2S.patch |  34 ++
 ...xx-drop-RFKILL-driver-for-H1940-bluetooth.patch | 202 ++++++++
 .../0006-ARM-s3c24xx-h1940-Add-nand-device.patch   | 126 +++++
 ...007-ARM-s3c24xx-h1940-don-t-touch-UPLLCON.patch |  41 ++
 ...008-ARM-s3c24xx-h1940-unlock-reset-button.patch |  52 +++
 ...3c24xx-h1940-add-bluetooth-RF-kill-switch.patch | 100 ++++
 .../0010-ARM-s3c24xx-h1940-add-IR-switch.patch     |  73 +++
 ...s3c24xx-h1940-increase-oversampling-shift.patch |  29 ++
 .../0012-ARM-s3c24xx-h1940-Add-DMA-device.patch    |  27 ++
 ...engine-s3c24xx-dma-Process-whole-SG-chain.patch |  27 ++
 ...e-s3c24xx-dma-Add-cyclic-transfer-support.patch | 183 ++++++++
 ...015-s3cmci-port-DMA-code-to-dmaengine-API.patch | 370 +++++++++++++++
 ...g-s3c24-xx-12-i2s-port-to-use-generic-dma.patch | 385 +++++++++++++++
 ...g-drop-support-for-legacy-S3C24XX-DMA-API.patch | 515 +++++++++++++++++++++
 .../linux/linux-yocto-3.14/h1940/defconfig         | 200 ++++++++
 recipes-kernel/linux/linux-yocto_3.14.bbappend     |  27 +-
 19 files changed, 2514 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0001-rfkill-add-IR-type.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0002-ARM-s3c24xx-Remove-S3C24XX_DMA-dependency-from-S3C24.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0003-ARM-s3c24xx-add-dma_coherent_mask-for-DMA-devices.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0004-ARM-s3c24xx-Add-DMA-resources-for-SDI-and-I2S.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0005-ARM-s3c24xx-drop-RFKILL-driver-for-H1940-bluetooth.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0006-ARM-s3c24xx-h1940-Add-nand-device.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0007-ARM-s3c24xx-h1940-don-t-touch-UPLLCON.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0008-ARM-s3c24xx-h1940-unlock-reset-button.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0009-ARM-s3c24xx-h1940-add-bluetooth-RF-kill-switch.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0010-ARM-s3c24xx-h1940-add-IR-switch.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0011-ARM-s3c24xx-h1940-increase-oversampling-shift.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0012-ARM-s3c24xx-h1940-Add-DMA-device.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0013-dmaengine-s3c24xx-dma-Process-whole-SG-chain.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0014-dmaengine-s3c24xx-dma-Add-cyclic-transfer-support.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0015-s3cmci-port-DMA-code-to-dmaengine-API.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0016-ASoC-samsung-s3c24-xx-12-i2s-port-to-use-generic-dma.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/0017-ASoC-samsung-drop-support-for-legacy-S3C24XX-DMA-API.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.14/h1940/defconfig

diff --git a/recipes-kernel/linux/linux-yocto-3.14/h1940/0001-rfkill-add-IR-type.patch b/recipes-kernel/linux/linux-yocto-3.14/h1940/0001-rfkill-add-IR-type.patch
new file mode 100644
index 0000000..0045cf2
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.14/h1940/0001-rfkill-add-IR-type.patch
@@ -0,0 +1,59 @@
+From 674eef7154d529886d5e9fe77914e9bc77e549b0 Mon Sep 17 00:00:00 2001
+From: Vasily Khoruzhick <anarsoul@gmail.com>
+Date: Thu, 17 Oct 2013 12:19:47 +0300
+Subject: [PATCH 01/17] rfkill: add IR type
+
+Infrared receivers/transmitters can also be disabled,
+so add IR type to rfkill subsystem
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+---
+ include/uapi/linux/rfkill.h | 2 ++
+ net/rfkill/core.c           | 4 +++-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/include/uapi/linux/rfkill.h b/include/uapi/linux/rfkill.h
+index 058757f..d4ae526 100644
+--- a/include/uapi/linux/rfkill.h
++++ b/include/uapi/linux/rfkill.h
+@@ -38,6 +38,7 @@
+  * @RFKILL_TYPE_GPS: switch is on a GPS device.
+  * @RFKILL_TYPE_FM: switch is on a FM radio device.
+  * @RFKILL_TYPE_NFC: switch is on an NFC device.
++ * @RFKILL_TYPE_IR: switch is on an IR device.
+  * @NUM_RFKILL_TYPES: number of defined rfkill types
+  */
+ enum rfkill_type {
+@@ -50,6 +51,7 @@ enum rfkill_type {
+ 	RFKILL_TYPE_GPS,
+ 	RFKILL_TYPE_FM,
+ 	RFKILL_TYPE_NFC,
++	RFKILL_TYPE_IR,
+ 	NUM_RFKILL_TYPES,
+ };
+ 
+diff --git a/net/rfkill/core.c b/net/rfkill/core.c
+index ed7e0b4..4c4abb6 100644
+--- a/net/rfkill/core.c
++++ b/net/rfkill/core.c
+@@ -585,7 +585,7 @@ static DEVICE_ATTR_RO(name);
+ 
+ static const char *rfkill_get_type_str(enum rfkill_type type)
+ {
+-	BUILD_BUG_ON(NUM_RFKILL_TYPES != RFKILL_TYPE_NFC + 1);
++	BUILD_BUG_ON(NUM_RFKILL_TYPES != RFKILL_TYPE_IR + 1);
+ 
+ 	switch (type) {
+ 	case RFKILL_TYPE_WLAN:
+@@ -604,6 +604,8 @@ static const char *rfkill_get_type_str(enum rfkill_type type)
+ 		return "fm";
+ 	case RFKILL_TYPE_NFC:
+ 		return "nfc";
++	case RFKILL_TYPE_IR:
++		return "ir";
+ 	default:
+ 		BUG();
+ 	}
+-- 
+1.9.3
+
diff --git a/recipes-kernel/linux/linux-yocto-3.14/h1940/0002-ARM-s3c24xx-Remove-S3C24XX_DMA-dependency-from-S3C24.patch b/recipes-kernel/linux/linux-yocto-3.14/h1940/0002-ARM-s3c24xx-Remove-S3C24XX_DMA-dependency-from-S3C24.patch
new file mode 100644
index 0000000..0a2f0df
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.14/h1940/0002-ARM-s3c24xx-Remove-S3C24XX_DMA-dependency-from-S3C24.patch
@@ -0,0 +1,30 @@
+From 43403f1d4744e0d71ef360655f44b489b57f443e Mon Sep 17 00:00:00 2001
+From: Vasily Khoruzhick <anarsoul@gmail.com>
+Date: Sun, 18 May 2014 12:43:35 +0300
+Subject: [PATCH 02/17] ARM: s3c24xx: Remove S3C24XX_DMA dependency from
+ S3C2410_DMA
+
+S3C24XX_DMA enables legacy DMA driver, and since we want to
+move to introduced generic dmaengine s3c24xx-dma driver,
+it's necessary to remove this redundant dependency.
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+---
+ arch/arm/mach-s3c24xx/Kconfig | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
+index d876431..3be853c 100644
+--- a/arch/arm/mach-s3c24xx/Kconfig
++++ b/arch/arm/mach-s3c24xx/Kconfig
+@@ -149,7 +149,6 @@ config S3C2410_DMA_DEBUG
+ 
+ config S3C2410_DMA
+ 	bool
+-	depends on S3C24XX_DMA && (CPU_S3C2410 || CPU_S3C2442)
+ 	help
+ 	  DMA device selection for S3C2410 and compatible CPUs
+ 
+-- 
+1.9.3
+
diff --git a/recipes-kernel/linux/linux-yocto-3.14/h1940/0003-ARM-s3c24xx-add-dma_coherent_mask-for-DMA-devices.patch b/recipes-kernel/linux/linux-yocto-3.14/h1940/0003-ARM-s3c24xx-add-dma_coherent_mask-for-DMA-devices.patch
new file mode 100644
index 0000000..5372b93
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.14/h1940/0003-ARM-s3c24xx-add-dma_coherent_mask-for-DMA-devices.patch
@@ -0,0 +1,35 @@
+From acdc541821464171954cbd1a4e1a34f3e743e043 Mon Sep 17 00:00:00 2001
+From: Vasily Khoruzhick <anarsoul@gmail.com>
+Date: Sun, 18 May 2014 12:44:52 +0300
+Subject: [PATCH 03/17] ARM: s3c24xx: add dma_coherent_mask for DMA devices
+
+Otherwise dma_alloc_coherent() fails.
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+---
+ arch/arm/mach-s3c24xx/common.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/arch/arm/mach-s3c24xx/common.c b/arch/arm/mach-s3c24xx/common.c
+index 4adaa4b..d61f611 100644
+--- a/arch/arm/mach-s3c24xx/common.c
++++ b/arch/arm/mach-s3c24xx/common.c
+@@ -383,6 +383,7 @@ struct platform_device s3c2410_device_dma = {
+ 	.resource	= s3c2410_dma_resource,
+ 	.dev	= {
+ 		.platform_data	= &s3c2410_dma_platdata,
++		.coherent_dma_mask = ~0,
+ 	},
+ };
+ #endif
+@@ -480,6 +481,7 @@ struct platform_device s3c2440_device_dma = {
+ 	.resource	= s3c2410_dma_resource,
+ 	.dev	= {
+ 		.platform_data	= &s3c2440_dma_platdata,
++		.coherent_dma_mask = ~0,
+ 	},
+ };
+ #endif
+-- 
+1.9.3
+
diff --git a/recipes-kernel/linux/linux-yocto-3.14/h1940/0004-ARM-s3c24xx-Add-DMA-resources-for-SDI-and-I2S.patch b/recipes-kernel/linux/linux-yocto-3.14/h1940/0004-ARM-s3c24xx-Add-DMA-resources-for-SDI-and-I2S.patch
new file mode 100644
index 0000000..9a25241
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.14/h1940/0004-ARM-s3c24xx-Add-DMA-resources-for-SDI-and-I2S.patch
@@ -0,0 +1,34 @@
+From e62096b744e4fa4376f0fe10bbe72dc0cae32b0d Mon Sep 17 00:00:00 2001
+From: Vasily Khoruzhick <anarsoul@gmail.com>
+Date: Sun, 18 May 2014 12:45:39 +0300
+Subject: [PATCH 04/17] ARM: s3c24xx: Add DMA resources for SDI and I2S
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+---
+ arch/arm/plat-samsung/devs.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
+index ac07e87..a0575d5 100644
+--- a/arch/arm/plat-samsung/devs.c
++++ b/arch/arm/plat-samsung/devs.c
+@@ -787,6 +787,8 @@ void __init s5p_hdmi_set_platdata(struct i2c_board_info *hdmiphy_info,
+ #ifdef CONFIG_PLAT_S3C24XX
+ static struct resource s3c_iis_resource[] = {
+ 	[0] = DEFINE_RES_MEM(S3C24XX_PA_IIS, S3C24XX_SZ_IIS),
++	[1] = DEFINE_RES_DMA(DMACH_I2S_OUT),
++	[2] = DEFINE_RES_DMA(DMACH_I2S_IN),
+ };
+ 
+ struct platform_device s3c_device_iis = {
+@@ -1153,6 +1155,7 @@ struct platform_device s3c_device_rtc = {
+ static struct resource s3c_sdi_resource[] = {
+ 	[0] = DEFINE_RES_MEM(S3C24XX_PA_SDI, S3C24XX_SZ_SDI),
+ 	[1] = DEFINE_RES_IRQ(IRQ_SDI),
++	[2] = DEFINE_RES_DMA(DMACH_SDI),
+ };
+ 
+ struct platform_device s3c_device_sdi = {
+-- 
+1.9.3
+
diff --git a/recipes-kernel/linux/linux-yocto-3.14/h1940/0005-ARM-s3c24xx-drop-RFKILL-driver-for-H1940-bluetooth.patch b/recipes-kernel/linux/linux-yocto-3.14/h1940/0005-ARM-s3c24xx-drop-RFKILL-driver-for-H1940-bluetooth.patch
new file mode 100644
index 0000000..6347474
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.14/h1940/0005-ARM-s3c24xx-drop-RFKILL-driver-for-H1940-bluetooth.patch
@@ -0,0 +1,202 @@
+From ead5b0c7815504351ae492c6445251769c75db7b Mon Sep 17 00:00:00 2001
+From: Vasily Khoruzhick <anarsoul@gmail.com>
+Date: Thu, 17 Oct 2013 12:09:19 +0300
+Subject: [PATCH 05/17] ARM: s3c24xx: drop RFKILL driver for H1940 bluetooth
+
+rfkill-gpio can do it's job easily.
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+---
+ arch/arm/mach-s3c24xx/Kconfig           |   8 --
+ arch/arm/mach-s3c24xx/Makefile          |   1 -
+ arch/arm/mach-s3c24xx/h1940-bluetooth.c | 147 --------------------------------
+ 3 files changed, 156 deletions(-)
+ delete mode 100644 arch/arm/mach-s3c24xx/h1940-bluetooth.c
+
+diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
+index 3be853c..e115127 100644
+--- a/arch/arm/mach-s3c24xx/Kconfig
++++ b/arch/arm/mach-s3c24xx/Kconfig
+@@ -286,14 +286,6 @@ config ARCH_H1940
+ 	help
+ 	  Say Y here if you are using the HP IPAQ H1940
+ 
+-config H1940BT
+-	tristate "Control the state of H1940 bluetooth chip"
+-	depends on ARCH_H1940
+-	select RFKILL
+-	help
+-	  This is a simple driver that is able to control
+-	  the state of built in bluetooth chip on h1940.
+-
+ config PM_H1940
+ 	bool
+ 	help
+diff --git a/arch/arm/mach-s3c24xx/Makefile b/arch/arm/mach-s3c24xx/Makefile
+index 7f54e5b..d326722 100644
+--- a/arch/arm/mach-s3c24xx/Makefile
++++ b/arch/arm/mach-s3c24xx/Makefile
+@@ -65,7 +65,6 @@ obj-$(CONFIG_MACH_AML_M5900)		+= mach-amlm5900.o
+ obj-$(CONFIG_ARCH_BAST)			+= mach-bast.o
+ obj-$(CONFIG_BAST_PC104_IRQ)		+= bast-irq.o
+ obj-$(CONFIG_ARCH_H1940)		+= mach-h1940.o
+-obj-$(CONFIG_H1940BT)			+= h1940-bluetooth.o
+ obj-$(CONFIG_PM_H1940)			+= pm-h1940.o
+ obj-$(CONFIG_MACH_N30)			+= mach-n30.o
+ obj-$(CONFIG_MACH_OTOM)			+= mach-otom.o
+diff --git a/arch/arm/mach-s3c24xx/h1940-bluetooth.c b/arch/arm/mach-s3c24xx/h1940-bluetooth.c
+deleted file mode 100644
+index b4d14b8..0000000
+--- a/arch/arm/mach-s3c24xx/h1940-bluetooth.c
++++ /dev/null
+@@ -1,147 +0,0 @@
+-/*
+- * arch/arm/mach-s3c2410/h1940-bluetooth.c
+- * Copyright (c) Arnaud Patard <arnaud.patard@rtp-net.org>
+- *
+- * This file is subject to the terms and conditions of the GNU General Public
+- * License.  See the file COPYING in the main directory of this archive for
+- * more details.
+- *
+- *	    S3C2410 bluetooth "driver"
+- *
+- */
+-
+-#include <linux/module.h>
+-#include <linux/platform_device.h>
+-#include <linux/delay.h>
+-#include <linux/string.h>
+-#include <linux/ctype.h>
+-#include <linux/leds.h>
+-#include <linux/gpio.h>
+-#include <linux/rfkill.h>
+-
+-#include <plat/gpio-cfg.h>
+-#include <mach/hardware.h>
+-#include <mach/regs-gpio.h>
+-#include <mach/gpio-samsung.h>
+-
+-#include "h1940.h"
+-
+-#define DRV_NAME "h1940-bt"
+-
+-/* Bluetooth control */
+-static void h1940bt_enable(int on)
+-{
+-	if (on) {
+-		/* Power on the chip */
+-		gpio_set_value(H1940_LATCH_BLUETOOTH_POWER, 1);
+-		/* Reset the chip */
+-		mdelay(10);
+-
+-		gpio_set_value(S3C2410_GPH(1), 1);
+-		mdelay(10);
+-		gpio_set_value(S3C2410_GPH(1), 0);
+-
+-		h1940_led_blink_set(-EINVAL, GPIO_LED_BLINK, NULL, NULL);
+-	}
+-	else {
+-		gpio_set_value(S3C2410_GPH(1), 1);
+-		mdelay(10);
+-		gpio_set_value(S3C2410_GPH(1), 0);
+-		mdelay(10);
+-		gpio_set_value(H1940_LATCH_BLUETOOTH_POWER, 0);
+-
+-		h1940_led_blink_set(-EINVAL, GPIO_LED_NO_BLINK_LOW, NULL, NULL);
+-	}
+-}
+-
+-static int h1940bt_set_block(void *data, bool blocked)
+-{
+-	h1940bt_enable(!blocked);
+-	return 0;
+-}
+-
+-static const struct rfkill_ops h1940bt_rfkill_ops = {
+-	.set_block = h1940bt_set_block,
+-};
+-
+-static int h1940bt_probe(struct platform_device *pdev)
+-{
+-	struct rfkill *rfk;
+-	int ret = 0;
+-
+-	ret = gpio_request(S3C2410_GPH(1), dev_name(&pdev->dev));
+-	if (ret) {
+-		dev_err(&pdev->dev, "could not get GPH1\n");
+-		return ret;
+-	}
+-
+-	ret = gpio_request(H1940_LATCH_BLUETOOTH_POWER, dev_name(&pdev->dev));
+-	if (ret) {
+-		gpio_free(S3C2410_GPH(1));
+-		dev_err(&pdev->dev, "could not get BT_POWER\n");
+-		return ret;
+-	}
+-
+-	/* Configures BT serial port GPIOs */
+-	s3c_gpio_cfgpin(S3C2410_GPH(0), S3C2410_GPH0_nCTS0);
+-	s3c_gpio_setpull(S3C2410_GPH(0), S3C_GPIO_PULL_NONE);
+-	s3c_gpio_cfgpin(S3C2410_GPH(1), S3C2410_GPIO_OUTPUT);
+-	s3c_gpio_setpull(S3C2410_GPH(1), S3C_GPIO_PULL_NONE);
+-	s3c_gpio_cfgpin(S3C2410_GPH(2), S3C2410_GPH2_TXD0);
+-	s3c_gpio_setpull(S3C2410_GPH(2), S3C_GPIO_PULL_NONE);
+-	s3c_gpio_cfgpin(S3C2410_GPH(3), S3C2410_GPH3_RXD0);
+-	s3c_gpio_setpull(S3C2410_GPH(3), S3C_GPIO_PULL_NONE);
+-
+-	rfk = rfkill_alloc(DRV_NAME, &pdev->dev, RFKILL_TYPE_BLUETOOTH,
+-			&h1940bt_rfkill_ops, NULL);
+-	if (!rfk) {
+-		ret = -ENOMEM;
+-		goto err_rfk_alloc;
+-	}
+-
+-	ret = rfkill_register(rfk);
+-	if (ret)
+-		goto err_rfkill;
+-
+-	platform_set_drvdata(pdev, rfk);
+-
+-	return 0;
+-
+-err_rfkill:
+-	rfkill_destroy(rfk);
+-err_rfk_alloc:
+-	return ret;
+-}
+-
+-static int h1940bt_remove(struct platform_device *pdev)
+-{
+-	struct rfkill *rfk = platform_get_drvdata(pdev);
+-
+-	platform_set_drvdata(pdev, NULL);
+-	gpio_free(S3C2410_GPH(1));
+-
+-	if (rfk) {
+-		rfkill_unregister(rfk);
+-		rfkill_destroy(rfk);
+-	}
+-	rfk = NULL;
+-
+-	h1940bt_enable(0);
+-
+-	return 0;
+-}
+-
+-
+-static struct platform_driver h1940bt_driver = {
+-	.driver		= {
+-		.name	= DRV_NAME,
+-	},
+-	.probe		= h1940bt_probe,
+-	.remove		= h1940bt_remove,
+-};
+-
+-module_platform_driver(h1940bt_driver);
+-
+-MODULE_AUTHOR("Arnaud Patard <arnaud.patard@rtp-net.org>");
+-MODULE_DESCRIPTION("Driver for the iPAQ H1940 bluetooth chip");
+-MODULE_LICENSE("GPL");
+-- 
+1.9.3
+
diff --git a/recipes-kernel/linux/linux-yocto-3.14/h1940/0006-ARM-s3c24xx-h1940-Add-nand-device.patch b/recipes-kernel/linux/linux-yocto-3.14/h1940/0006-ARM-s3c24xx-h1940-Add-nand-device.patch
new file mode 100644
index 0000000..c23984a
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.14/h1940/0006-ARM-s3c24xx-h1940-Add-nand-device.patch
@@ -0,0 +1,126 @@
+From a63933b7f6b410c478a4fad08ec61f13ef1549a8 Mon Sep 17 00:00:00 2001
+From: Vasily Khoruzhick <anarsoul@gmail.com>
+Date: Thu, 17 Oct 2013 12:13:29 +0300
+Subject: [PATCH 06/17] ARM: s3c24xx: h1940: Add nand device
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+---
+ arch/arm/mach-s3c24xx/mach-h1940.c | 74 ++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 74 insertions(+)
+
+diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
+index de08321..1b3807e 100644
+--- a/arch/arm/mach-s3c24xx/mach-h1940.c
++++ b/arch/arm/mach-s3c24xx/mach-h1940.c
+@@ -31,6 +31,9 @@
+ #include <linux/s3c_adc_battery.h>
+ #include <linux/delay.h>
+ 
++#include <linux/mtd/mtd.h>
++#include <linux/mtd/partitions.h>
++
+ #include <video/platform_lcd.h>
+ 
+ #include <linux/mmc/host.h>
+@@ -46,6 +49,7 @@
+ #include <linux/platform_data/mmc-s3cmci.h>
+ #include <linux/platform_data/touchscreen-s3c2410.h>
+ #include <linux/platform_data/usb-s3c2410_udc.h>
++#include <linux/platform_data/mtd-nand-s3c2410.h>
+ 
+ #include <sound/uda1380.h>
+ 
+@@ -466,6 +470,74 @@ static struct s3c24xx_mci_pdata h1940_mmc_cfg __initdata = {
+ 	.ocr_avail     = MMC_VDD_32_33,
+ };
+ 
++static struct mtd_partition h1940_nand_part[] = {
++	[0] = {
++			.name = "Boot0",
++			.offset = 0,
++			.size = SZ_16K,
++			.mask_flags = MTD_WRITEABLE,
++	},
++	[1] = {
++			.name = "Boot1",
++			.offset = MTDPART_OFS_APPEND,
++			.size = SZ_1K * 240,
++			.mask_flags = 0,
++	},
++	[2] = {
++			.name = "Env",
++			.offset = MTDPART_OFS_APPEND,
++			.size = SZ_16K,
++			.mask_flags = 0,
++	},
++	[3] = {
++			.name = "Opts",
++			.offset = MTDPART_OFS_APPEND,
++			.size = SZ_32K,
++			.mask_flags = 0,
++	},
++	[4] = {
++			.name = "Kernel",
++			.offset = MTDPART_OFS_APPEND,
++			.size = SZ_1M * 3,
++			.mask_flags = 0,
++	},
++	[5] = {
++			.name = "Filesystem",
++			.offset = MTDPART_OFS_APPEND,
++			.size = MTDPART_SIZ_FULL,
++			.mask_flags = 0,
++	},
++};
++
++static struct nand_ecclayout h1940_ecc_layout = {
++	.eccbytes = 3,
++	.eccpos = {
++		8, 9, 10
++	},
++	.oobfree = {
++		{2, 6},
++		{11, 5}
++	}
++};
++
++static struct s3c2410_nand_set h1940_nand_sets[] = {
++	[0] = {
++		.name = "Internal",
++		.nr_chips = 1,
++		.nr_partitions = ARRAY_SIZE(h1940_nand_part),
++		.partitions = h1940_nand_part,
++		.ecc_layout = &h1940_ecc_layout,
++	},
++};
++
++static struct s3c2410_platform_nand h1940_nand_info = {
++	.tacls = 14,
++	.twrph0 = 44,
++	.twrph1 = 20,
++	.nr_sets = ARRAY_SIZE(h1940_nand_sets),
++	.sets = h1940_nand_sets,
++};
++
+ static int h1940_backlight_init(struct device *dev)
+ {
+ 	gpio_request(S3C2410_GPB(0), "Backlight");
+@@ -634,6 +706,7 @@ static struct platform_device *h1940_devices[] __initdata = {
+ 	&h1940_device_bluetooth,
+ 	&s3c_device_sdi,
+ 	&s3c_device_rtc,
++	&s3c_device_nand,
+ 	&samsung_device_pwm,
+ 	&h1940_backlight,
+ 	&h1940_lcd_powerdev,
+@@ -678,6 +751,7 @@ static void __init h1940_init(void)
+  	s3c24xx_udc_set_platdata(&h1940_udc_cfg);
+ 	s3c24xx_ts_set_platdata(&h1940_ts_cfg);
+ 	s3c_i2c0_set_platdata(NULL);
++	s3c_nand_set_platdata(&h1940_nand_info);
+ 
+ 	/* Turn off suspend on both USB ports, and switch the
+ 	 * selectable USB port to USB device mode. */
+-- 
+1.9.3
+
diff --git a/recipes-kernel/linux/linux-yocto-3.14/h1940/0007-ARM-s3c24xx-h1940-don-t-touch-UPLLCON.patch b/recipes-kernel/linux/linux-yocto-3.14/h1940/0007-ARM-s3c24xx-h1940-don-t-touch-UPLLCON.patch
new file mode 100644
index 0000000..f327041
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.14/h1940/0007-ARM-s3c24xx-h1940-don-t-touch-UPLLCON.patch
@@ -0,0 +1,41 @@
+From ef5846b814c7952910d5d0592ffc5ea713e7f84f Mon Sep 17 00:00:00 2001
+From: Vasily Khoruzhick <anarsoul@gmail.com>
+Date: Thu, 17 Oct 2013 12:15:16 +0300
+Subject: [PATCH 07/17] ARM: s3c24xx: h1940: don't touch UPLLCON
+
+It's a bit late to modify UPLLCON in board init,
+anyway bootloader already puts correct value in it.
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+---
+ arch/arm/mach-s3c24xx/mach-h1940.c | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
+index 1b3807e..9ca26d1 100644
+--- a/arch/arm/mach-s3c24xx/mach-h1940.c
++++ b/arch/arm/mach-s3c24xx/mach-h1940.c
+@@ -744,8 +744,6 @@ static void __init h1940_reserve(void)
+ 
+ static void __init h1940_init(void)
+ {
+-	u32 tmp;
+-
+ 	s3c24xx_fb_set_platdata(&h1940_fb_info);
+ 	s3c24xx_mci_set_platdata(&h1940_mmc_cfg);
+  	s3c24xx_udc_set_platdata(&h1940_udc_cfg);
+@@ -760,11 +758,6 @@ static void __init h1940_init(void)
+ 			      S3C2410_MISCCR_USBSUSPND0 |
+ 			      S3C2410_MISCCR_USBSUSPND1, 0x0);
+ 
+-	tmp =   (0x78 << S3C24XX_PLL_MDIV_SHIFT)
+-	      | (0x02 << S3C24XX_PLL_PDIV_SHIFT)
+-	      | (0x03 << S3C24XX_PLL_SDIV_SHIFT);
+-	writel(tmp, S3C2410_UPLLCON);
+-
+ 	gpio_request(S3C2410_GPC(0), "LCD power");
+ 	gpio_request(S3C2410_GPC(1), "LCD power");
+ 	gpio_request(S3C2410_GPC(4), "LCD power");
+-- 
+1.9.3
+
diff --git a/recipes-kernel/linux/linux-yocto-3.14/h1940/0008-ARM-s3c24xx-h1940-unlock-reset-button.patch b/recipes-kernel/linux/linux-yocto-3.14/h1940/0008-ARM-s3c24xx-h1940-unlock-reset-button.patch
new file mode 100644
index 0000000..6c3c9d3
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.14/h1940/0008-ARM-s3c24xx-h1940-unlock-reset-button.patch
@@ -0,0 +1,52 @@
+From f163da149d098264475000f33bf919fe3342a5f6 Mon Sep 17 00:00:00 2001
+From: Vasily Khoruzhick <anarsoul@gmail.com>
+Date: Sat, 3 Dec 2011 12:12:21 +0300
+Subject: [PATCH 08/17] ARM: s3c24xx: h1940: unlock reset button
+
+Reset button can be left locked by bootloader and in case of kernel panic
+user won't be able to reset a device by pressing reset button.
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+---
+ arch/arm/mach-s3c24xx/mach-h1940.c | 17 +++++++++++++++--
+ 1 file changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
+index 9ca26d1..6403d80 100644
+--- a/arch/arm/mach-s3c24xx/mach-h1940.c
++++ b/arch/arm/mach-s3c24xx/mach-h1940.c
+@@ -219,9 +219,9 @@ static struct s3c2410fb_mach_info h1940_fb_info __initdata = {
+ 	.gpcup =	0x0000ffff,
+ 	.gpcup_mask =	0xffffffff,
+ 	.gpdcon =	0xaa84aaa0,
+-	.gpdcon_mask =	0xffffffff,
++	.gpdcon_mask =	0xfffffff3,
+ 	.gpdup =	0x0000faff,
+-	.gpdup_mask =	0xffffffff,
++	.gpdup_mask =	0xfffffffd,
+ };
+ 
+ static int power_supply_init(struct device *dev)
+@@ -795,6 +795,19 @@ static void __init h1940_init(void)
+ 	gpio_direction_output(S3C2410_GPA(7), 0);
+ 	gpio_direction_output(H1940_LATCH_LED_FLASH, 0);
+ 
++	gpio_request(S3C2410_GPD(1), "Reset sense");
++	gpio_request(S3C2410_GPA(14), "Reset reset");
++	gpio_request(S3C2410_GPB(6), "Reset lock");
++	gpio_direction_input(S3C2410_GPD(1));
++	gpio_direction_output(S3C2410_GPA(14), 0);
++	if (gpio_get_value(S3C2410_GPD(1)))
++		gpio_set_value(S3C2410_GPA(14), 0);
++
++	gpio_direction_output(S3C2410_GPA(14), 1);
++	mdelay(100);
++	gpio_direction_output(S3C2410_GPB(6), 1);
++	gpio_direction_output(S3C2410_GPB(6), 0);
++
+ 	i2c_register_board_info(0, h1940_i2c_devices,
+ 		ARRAY_SIZE(h1940_i2c_devices));
+ }
+-- 
+1.9.3
+
diff --git a/recipes-kernel/linux/linux-yocto-3.14/h1940/0009-ARM-s3c24xx-h1940-add-bluetooth-RF-kill-switch.patch b/recipes-kernel/linux/linux-yocto-3.14/h1940/0009-ARM-s3c24xx-h1940-add-bluetooth-RF-kill-switch.patch
new file mode 100644
index 0000000..b397cd5
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.14/h1940/0009-ARM-s3c24xx-h1940-add-bluetooth-RF-kill-switch.patch
@@ -0,0 +1,100 @@
+From 09e3a02c82c1bfce950951cbd690201266e2f133 Mon Sep 17 00:00:00 2001
+From: Vasily Khoruzhick <anarsoul@gmail.com>
+Date: Sat, 17 Dec 2011 13:14:51 +0300
+Subject: [PATCH 09/17] ARM: s3c24xx: h1940: add bluetooth RF kill switch
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+---
+ arch/arm/mach-s3c24xx/h1940.h      |  4 +++-
+ arch/arm/mach-s3c24xx/mach-h1940.c | 39 ++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 42 insertions(+), 1 deletion(-)
+
+diff --git a/arch/arm/mach-s3c24xx/h1940.h b/arch/arm/mach-s3c24xx/h1940.h
+index 2950cc4..96c69d5 100644
+--- a/arch/arm/mach-s3c24xx/h1940.h
++++ b/arch/arm/mach-s3c24xx/h1940.h
+@@ -46,7 +46,9 @@ extern int h1940_led_blink_set(unsigned gpio, int state,
+ #define H1940_LATCH_SM803_ENABLE	H1940_LATCH_GPIO(10)
+ #define H1940_LATCH_LCD_P4		H1940_LATCH_GPIO(11)
+ #define H1940_LATCH_SD_POWER		H1940_LATCH_GPIO(12)
+-#define H1940_LATCH_BLUETOOTH_POWER	H1940_LATCH_GPIO(13)
++#define H1940_LATCH_BT_POWER_IDX	13
++#define H1940_LATCH_BLUETOOTH_POWER \
++			H1940_LATCH_GPIO(H1940_LATCH_BT_POWER_IDX)
+ #define H1940_LATCH_LED_GREEN		H1940_LATCH_GPIO(14)
+ #define H1940_LATCH_LED_FLASH		H1940_LATCH_GPIO(15)
+ 
+diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
+index 6403d80..fb2d5a1 100644
+--- a/arch/arm/mach-s3c24xx/mach-h1940.c
++++ b/arch/arm/mach-s3c24xx/mach-h1940.c
+@@ -30,6 +30,7 @@
+ #include <linux/pda_power.h>
+ #include <linux/s3c_adc_battery.h>
+ #include <linux/delay.h>
++#include <linux/rfkill-gpio.h>
+ 
+ #include <linux/mtd/mtd.h>
+ #include <linux/mtd/partitions.h>
+@@ -694,6 +695,29 @@ static struct platform_device h1940_dev_buttons = {
+ 	}
+ };
+ 
++static struct rfkill_gpio_platform_data h1940_bt_rfkill_pdata = {
++	.name		= "h1940-bt",
++	.reset_gpio	= -EINVAL,
++	.shutdown_gpio	= H1940_LATCH_BLUETOOTH_POWER,
++	.type		= RFKILL_TYPE_BLUETOOTH,
++};
++
++static struct platform_device h1940_bluetooth = {
++	.name		= "rfkill_gpio",
++	.id		= 0,
++	.dev		= {
++		.platform_data = &h1940_bt_rfkill_pdata,
++	},
++};
++
++static struct gpiod_lookup_table bt_gpio_lookup = {
++	.dev_id = "h1940-bt",
++	.table = {
++		GPIO_LOOKUP_IDX("H1940_LATCH", 13, NULL, 0, 0),
++		{ },
++	},
++};
++
+ static struct platform_device *h1940_devices[] __initdata = {
+ 	&h1940_dev_buttons,
+ 	&s3c_device_ohci,
+@@ -714,6 +738,7 @@ static struct platform_device *h1940_devices[] __initdata = {
+ 	&s3c_device_ts,
+ 	&power_supply,
+ 	&h1940_battery,
++	&h1940_bluetooth,
+ };
+ 
+ static void __init h1940_map_io(void)
+@@ -784,6 +809,20 @@ static void __init h1940_init(void)
+ 	gpio_request(H1940_LATCH_SD_POWER, "SD power");
+ 	gpio_direction_output(H1940_LATCH_SD_POWER, 0);
+ 
++	/* Configures BT serial port GPIOs */
++	s3c_gpio_cfgpin(S3C2410_GPH(0), S3C2410_GPH0_nCTS0);
++	s3c_gpio_setpull(S3C2410_GPH(0), S3C_GPIO_PULL_NONE);
++	s3c_gpio_cfgpin(S3C2410_GPH(1), S3C2410_GPH1_nRTS0);
++	s3c_gpio_setpull(S3C2410_GPH(1), S3C_GPIO_PULL_NONE);
++	s3c_gpio_cfgpin(S3C2410_GPH(2), S3C2410_GPH2_TXD0);
++	s3c_gpio_setpull(S3C2410_GPH(2), S3C_GPIO_PULL_NONE);
++	s3c_gpio_cfgpin(S3C2410_GPH(3), S3C2410_GPH3_RXD0);
++	s3c_gpio_setpull(S3C2410_GPH(3), S3C_GPIO_PULL_NONE);
++
++	gpio_request(S3C2410_GPC(9), "BT reset");
++	gpio_direction_output(S3C2410_GPC(9), 1);
++
++	gpiod_add_lookup_table(&bt_gpio_lookup);
+ 	platform_add_devices(h1940_devices, ARRAY_SIZE(h1940_devices));
+ 
+ 	gpio_request(S3C2410_GPA(1), "Red LED blink");
+-- 
+1.9.3
+
diff --git a/recipes-kernel/linux/linux-yocto-3.14/h1940/0010-ARM-s3c24xx-h1940-add-IR-switch.patch b/recipes-kernel/linux/linux-yocto-3.14/h1940/0010-ARM-s3c24xx-h1940-add-IR-switch.patch
new file mode 100644
index 0000000..851f0f1
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.14/h1940/0010-ARM-s3c24xx-h1940-add-IR-switch.patch
@@ -0,0 +1,73 @@
+From 79a09055ff091d60bdedff17150d1ca15233db44 Mon Sep 17 00:00:00 2001
+From: Vasily Khoruzhick <anarsoul@gmail.com>
+Date: Sun, 18 Dec 2011 11:29:30 +0300
+Subject: [PATCH 10/17] ARM: s3c24xx: h1940: add IR switch
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+---
+ arch/arm/mach-s3c24xx/mach-h1940.c | 31 +++++++++++++++++++++++++++++++
+ 1 file changed, 31 insertions(+)
+
+diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
+index fb2d5a1..df0e89f 100644
+--- a/arch/arm/mach-s3c24xx/mach-h1940.c
++++ b/arch/arm/mach-s3c24xx/mach-h1940.c
+@@ -718,6 +718,29 @@ static struct gpiod_lookup_table bt_gpio_lookup = {
+ 	},
+ };
+ 
++static struct rfkill_gpio_platform_data h1940_ir_rfkill_pdata = {
++	.name		= "h1940-ir",
++	.reset_gpio	= -EINVAL,
++	.shutdown_gpio	= S3C2410_GPB(9),
++	.type		= RFKILL_TYPE_IR,
++};
++
++static struct platform_device h1940_irda = {
++	.name		= "rfkill_gpio",
++	.id		= 1,
++	.dev		= {
++		.platform_data = &h1940_ir_rfkill_pdata,
++	},
++};
++
++static struct gpiod_lookup_table ir_gpio_lookup = {
++	.dev_id = "h1940-ir",
++	.table = {
++		GPIO_LOOKUP_IDX("GPIOB", 9, NULL, 0, GPIO_ACTIVE_LOW),
++		{ },
++	},
++};
++
+ static struct platform_device *h1940_devices[] __initdata = {
+ 	&h1940_dev_buttons,
+ 	&s3c_device_ohci,
+@@ -739,6 +762,7 @@ static struct platform_device *h1940_devices[] __initdata = {
+ 	&power_supply,
+ 	&h1940_battery,
+ 	&h1940_bluetooth,
++	&h1940_irda,
+ };
+ 
+ static void __init h1940_map_io(void)
+@@ -819,10 +843,17 @@ static void __init h1940_init(void)
+ 	s3c_gpio_cfgpin(S3C2410_GPH(3), S3C2410_GPH3_RXD0);
+ 	s3c_gpio_setpull(S3C2410_GPH(3), S3C_GPIO_PULL_NONE);
+ 
++	/* Configure IR serial port GPIOs */
++	s3c_gpio_cfgpin(S3C2410_GPH(6), S3C2410_GPH6_TXD2);
++	s3c_gpio_setpull(S3C2410_GPH(6), S3C_GPIO_PULL_NONE);
++	s3c_gpio_cfgpin(S3C2410_GPH(7), S3C2410_GPH7_RXD2);
++	s3c_gpio_setpull(S3C2410_GPH(7), S3C_GPIO_PULL_NONE);
++
+ 	gpio_request(S3C2410_GPC(9), "BT reset");
+ 	gpio_direction_output(S3C2410_GPC(9), 1);
+ 
+ 	gpiod_add_lookup_table(&bt_gpio_lookup);
++	gpiod_add_lookup_table(&ir_gpio_lookup);
+ 	platform_add_devices(h1940_devices, ARRAY_SIZE(h1940_devices));
+ 
+ 	gpio_request(S3C2410_GPA(1), "Red LED blink");
+-- 
+1.9.3
+
diff --git a/recipes-kernel/linux/linux-yocto-3.14/h1940/0011-ARM-s3c24xx-h1940-increase-oversampling-shift.patch b/recipes-kernel/linux/linux-yocto-3.14/h1940/0011-ARM-s3c24xx-h1940-increase-oversampling-shift.patch
new file mode 100644
index 0000000..93479fe
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.14/h1940/0011-ARM-s3c24xx-h1940-increase-oversampling-shift.patch
@@ -0,0 +1,29 @@
+From 9b3fda3f079093bda68fab588da54ae305035cb9 Mon Sep 17 00:00:00 2001
+From: Vasily Khoruzhick <anarsoul@gmail.com>
+Date: Sun, 18 Dec 2011 11:47:03 +0300
+Subject: [PATCH 11/17] ARM: s3c24xx: h1940: increase oversampling shift
+
+4 samples seems to be not enough for touchscreen driver
+to work accurately
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+---
+ arch/arm/mach-s3c24xx/mach-h1940.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
+index df0e89f..15e1039 100644
+--- a/arch/arm/mach-s3c24xx/mach-h1940.c
++++ b/arch/arm/mach-s3c24xx/mach-h1940.c
+@@ -182,7 +182,7 @@ static struct s3c2410_udc_mach_info h1940_udc_cfg __initdata = {
+ static struct s3c2410_ts_mach_info h1940_ts_cfg __initdata = {
+ 		.delay = 10000,
+ 		.presc = 49,
+-		.oversampling_shift = 2,
++		.oversampling_shift = 5,
+ 		.cfg_gpio = s3c24xx_ts_cfg_gpio,
+ };
+ 
+-- 
+1.9.3
+
diff --git a/recipes-kernel/linux/linux-yocto-3.14/h1940/0012-ARM-s3c24xx-h1940-Add-DMA-device.patch b/recipes-kernel/linux/linux-yocto-3.14/h1940/0012-ARM-s3c24xx-h1940-Add-DMA-device.patch
new file mode 100644
index 0000000..8858529
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.14/h1940/0012-ARM-s3c24xx-h1940-Add-DMA-device.patch
@@ -0,0 +1,27 @@
+From e6cc75e785cab181a29a9b97c9e37b7614e132f1 Mon Sep 17 00:00:00 2001
+From: Vasily Khoruzhick <anarsoul@gmail.com>
+Date: Sun, 18 May 2014 12:46:09 +0300
+Subject: [PATCH 12/17] ARM: s3c24xx: h1940: Add DMA device
+
+To use new s3c24xx-dma driver we need to add appropriate platform device.
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+---
+ arch/arm/mach-s3c24xx/mach-h1940.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
+index 15e1039..3a082f3 100644
+--- a/arch/arm/mach-s3c24xx/mach-h1940.c
++++ b/arch/arm/mach-s3c24xx/mach-h1940.c
+@@ -743,6 +743,7 @@ static struct gpiod_lookup_table ir_gpio_lookup = {
+ 
+ static struct platform_device *h1940_devices[] __initdata = {
+ 	&h1940_dev_buttons,
++	&s3c2410_device_dma,
+ 	&s3c_device_ohci,
+ 	&s3c_device_lcd,
+ 	&s3c_device_wdt,
+-- 
+1.9.3
+
diff --git a/recipes-kernel/linux/linux-yocto-3.14/h1940/0013-dmaengine-s3c24xx-dma-Process-whole-SG-chain.patch b/recipes-kernel/linux/linux-yocto-3.14/h1940/0013-dmaengine-s3c24xx-dma-Process-whole-SG-chain.patch
new file mode 100644
index 0000000..051efca
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.14/h1940/0013-dmaengine-s3c24xx-dma-Process-whole-SG-chain.patch
@@ -0,0 +1,27 @@
+From ad9763daaad79c35803732ac9ffd21f714363ebd Mon Sep 17 00:00:00 2001
+From: Vasily Khoruzhick <anarsoul@gmail.com>
+Date: Sun, 18 May 2014 11:42:10 +0300
+Subject: [PATCH 13/17] dmaengine: s3c24xx-dma: Process whole SG chain
+
+Due to redundant 'break' in loop driver processed only first chunk.
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+---
+ drivers/dma/s3c24xx-dma.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/drivers/dma/s3c24xx-dma.c b/drivers/dma/s3c24xx-dma.c
+index 4eddedb..2167608 100644
+--- a/drivers/dma/s3c24xx-dma.c
++++ b/drivers/dma/s3c24xx-dma.c
+@@ -961,7 +961,6 @@ static struct dma_async_tx_descriptor *s3c24xx_dma_prep_slave_sg(
+ 			dsg->src_addr = slave_addr;
+ 			dsg->dst_addr = sg_dma_address(sg);
+ 		}
+-		break;
+ 	}
+ 
+ 	return vchan_tx_prep(&s3cchan->vc, &txd->vd, flags);
+-- 
+1.9.3
+
diff --git a/recipes-kernel/linux/linux-yocto-3.14/h1940/0014-dmaengine-s3c24xx-dma-Add-cyclic-transfer-support.patch b/recipes-kernel/linux/linux-yocto-3.14/h1940/0014-dmaengine-s3c24xx-dma-Add-cyclic-transfer-support.patch
new file mode 100644
index 0000000..b3c68ed
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.14/h1940/0014-dmaengine-s3c24xx-dma-Add-cyclic-transfer-support.patch
@@ -0,0 +1,183 @@
+From a2b08b319caba9b3297efa7d1d48cba4f99281f2 Mon Sep 17 00:00:00 2001
+From: Vasily Khoruzhick <anarsoul@gmail.com>
+Date: Sun, 18 May 2014 11:44:51 +0300
+Subject: [PATCH 14/17] dmaengine: s3c24xx-dma: Add cyclic transfer support
+
+Many audio interface drivers require support of cyclic transfers to work
+correctly, for example Samsung ASoC DMA driver. This patch adds support
+for cyclic transfers to the s3c24xx-dma driver
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+---
+ drivers/dma/s3c24xx-dma.c | 112 +++++++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 111 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/dma/s3c24xx-dma.c b/drivers/dma/s3c24xx-dma.c
+index 2167608..141e220 100644
+--- a/drivers/dma/s3c24xx-dma.c
++++ b/drivers/dma/s3c24xx-dma.c
+@@ -164,6 +164,7 @@ struct s3c24xx_sg {
+  * @disrcc: value for source control register
+  * @didstc: value for destination control register
+  * @dcon: base value for dcon register
++ * @cyclic: indicate cyclic transfer
+  */
+ struct s3c24xx_txd {
+ 	struct virt_dma_desc vd;
+@@ -173,6 +174,7 @@ struct s3c24xx_txd {
+ 	u32 disrcc;
+ 	u32 didstc;
+ 	u32 dcon;
++	bool cyclic;
+ };
+ 
+ struct s3c24xx_dma_chan;
+@@ -669,8 +671,10 @@ static irqreturn_t s3c24xx_dma_irq(int irq, void *data)
+ 		/* when more sg's are in this txd, start the next one */
+ 		if (!list_is_last(txd->at, &txd->dsg_list)) {
+ 			txd->at = txd->at->next;
++			if (txd->cyclic)
++				vchan_cyclic_callback(&txd->vd);
+ 			s3c24xx_dma_start_next_sg(s3cchan, txd);
+-		} else {
++		} else if (!txd->cyclic) {
+ 			s3cchan->at = NULL;
+ 			vchan_cookie_complete(&txd->vd);
+ 
+@@ -682,6 +686,12 @@ static irqreturn_t s3c24xx_dma_irq(int irq, void *data)
+ 				s3c24xx_dma_start_next_txd(s3cchan);
+ 			else
+ 				s3c24xx_dma_phy_free(s3cchan);
++		} else {
++			vchan_cyclic_callback(&txd->vd);
++
++			/* Cyclic: reset at beginning */
++			txd->at = txd->dsg_list.next;
++			s3c24xx_dma_start_next_sg(s3cchan, txd);
+ 		}
+ 	}
+ 	spin_unlock(&s3cchan->vc.lock);
+@@ -877,6 +887,104 @@ static struct dma_async_tx_descriptor *s3c24xx_dma_prep_memcpy(
+ 	return vchan_tx_prep(&s3cchan->vc, &txd->vd, flags);
+ }
+ 
++static struct dma_async_tx_descriptor *s3c24xx_dma_prep_dma_cyclic(
++	struct dma_chan *chan, dma_addr_t addr, size_t size, size_t period,
++	enum dma_transfer_direction direction, unsigned long flags,
++	void *context)
++{
++	struct s3c24xx_dma_chan *s3cchan = to_s3c24xx_dma_chan(chan);
++	struct s3c24xx_dma_engine *s3cdma = s3cchan->host;
++	const struct s3c24xx_dma_platdata *pdata = s3cdma->pdata;
++	struct s3c24xx_dma_channel *cdata = &pdata->channels[s3cchan->id];
++	struct s3c24xx_txd *txd;
++	struct s3c24xx_sg *dsg;
++	unsigned sg_len;
++	dma_addr_t slave_addr;
++	u32 hwcfg = 0;
++	int i;
++
++	dev_dbg(&s3cdma->pdev->dev,
++		"prepare cyclic transaction of %d bytes with period %d from %s\n",
++		size, period, s3cchan->name);
++
++	if (!is_slave_direction(direction)) {
++		dev_err(&s3cdma->pdev->dev,
++			"direction %d unsupported\n", direction);
++		return NULL;
++	}
++
++	txd = s3c24xx_dma_get_txd();
++	if (!txd)
++		return NULL;
++
++	txd->cyclic = 1;
++
++	if (cdata->handshake)
++		txd->dcon |= S3C24XX_DCON_HANDSHAKE;
++
++	switch (cdata->bus) {
++	case S3C24XX_DMA_APB:
++		txd->dcon |= S3C24XX_DCON_SYNC_PCLK;
++		hwcfg |= S3C24XX_DISRCC_LOC_APB;
++		break;
++	case S3C24XX_DMA_AHB:
++		txd->dcon |= S3C24XX_DCON_SYNC_HCLK;
++		hwcfg |= S3C24XX_DISRCC_LOC_AHB;
++		break;
++	}
++
++	/*
++	 * Always assume our peripheral desintation is a fixed
++	 * address in memory.
++	 */
++	hwcfg |= S3C24XX_DISRCC_INC_FIXED;
++
++	/*
++	 * Individual dma operations are requested by the slave,
++	 * so serve only single atomic operations (S3C24XX_DCON_SERV_SINGLE).
++	 */
++	txd->dcon |= S3C24XX_DCON_SERV_SINGLE;
++
++	if (direction == DMA_MEM_TO_DEV) {
++		txd->disrcc = S3C24XX_DISRCC_LOC_AHB |
++			      S3C24XX_DISRCC_INC_INCREMENT;
++		txd->didstc = hwcfg;
++		slave_addr = s3cchan->cfg.dst_addr;
++		txd->width = s3cchan->cfg.dst_addr_width;
++	} else {
++		txd->disrcc = hwcfg;
++		txd->didstc = S3C24XX_DIDSTC_LOC_AHB |
++			      S3C24XX_DIDSTC_INC_INCREMENT;
++		slave_addr = s3cchan->cfg.src_addr;
++		txd->width = s3cchan->cfg.src_addr_width;
++	}
++
++	sg_len = size / period;
++
++	for (i = 0; i < sg_len; i++) {
++		dsg = kzalloc(sizeof(*dsg), GFP_NOWAIT);
++		if (!dsg) {
++			s3c24xx_dma_free_txd(txd);
++			return NULL;
++		}
++		list_add_tail(&dsg->node, &txd->dsg_list);
++
++		dsg->len = period;
++		/* Check last period length */
++		if (i == (sg_len - 1))
++			dsg->len = size - (period * i);
++		if (direction == DMA_MEM_TO_DEV) {
++			dsg->src_addr = addr + (period * i);
++			dsg->dst_addr = slave_addr;
++		} else { /* DMA_DEV_TO_MEM */
++			dsg->src_addr = slave_addr;
++			dsg->dst_addr = addr + (period * i);
++		}
++	}
++
++	return vchan_tx_prep(&s3cchan->vc, &txd->vd, flags);
++}
++
+ static struct dma_async_tx_descriptor *s3c24xx_dma_prep_slave_sg(
+ 		struct dma_chan *chan, struct scatterlist *sgl,
+ 		unsigned int sg_len, enum dma_transfer_direction direction,
+@@ -1197,6 +1305,7 @@ static int s3c24xx_dma_probe(struct platform_device *pdev)
+ 
+ 	/* Initialize slave engine for SoC internal dedicated peripherals */
+ 	dma_cap_set(DMA_SLAVE, s3cdma->slave.cap_mask);
++	dma_cap_set(DMA_CYCLIC, s3cdma->slave.cap_mask);
+ 	dma_cap_set(DMA_PRIVATE, s3cdma->slave.cap_mask);
+ 	s3cdma->slave.dev = &pdev->dev;
+ 	s3cdma->slave.device_alloc_chan_resources =
+@@ -1206,6 +1315,7 @@ static int s3c24xx_dma_probe(struct platform_device *pdev)
+ 	s3cdma->slave.device_tx_status = s3c24xx_dma_tx_status;
+ 	s3cdma->slave.device_issue_pending = s3c24xx_dma_issue_pending;
+ 	s3cdma->slave.device_prep_slave_sg = s3c24xx_dma_prep_slave_sg;
++	s3cdma->slave.device_prep_dma_cyclic = s3c24xx_dma_prep_dma_cyclic;
+ 	s3cdma->slave.device_control = s3c24xx_dma_control;
+ 
+ 	/* Register as many memcpy channels as there are physical channels */
+-- 
+1.9.3
+
diff --git a/recipes-kernel/linux/linux-yocto-3.14/h1940/0015-s3cmci-port-DMA-code-to-dmaengine-API.patch b/recipes-kernel/linux/linux-yocto-3.14/h1940/0015-s3cmci-port-DMA-code-to-dmaengine-API.patch
new file mode 100644
index 0000000..735f558
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.14/h1940/0015-s3cmci-port-DMA-code-to-dmaengine-API.patch
@@ -0,0 +1,370 @@
+From f237d97db372b315f940defc63ffb75b07d903f9 Mon Sep 17 00:00:00 2001
+From: Vasily Khoruzhick <anarsoul@gmail.com>
+Date: Fri, 13 Aug 2010 20:01:53 +0300
+Subject: [PATCH 15/17] s3cmci: port DMA code to dmaengine API
+
+Utilise new s3c24xx-dma dmaengine driver for DMA ops.
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+---
+ drivers/mmc/host/Kconfig  |   9 ---
+ drivers/mmc/host/s3cmci.c | 183 +++++++++++++++-------------------------------
+ drivers/mmc/host/s3cmci.h |   6 +-
+ 3 files changed, 61 insertions(+), 137 deletions(-)
+
+diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
+index 1384f67..45c791c3 100644
+--- a/drivers/mmc/host/Kconfig
++++ b/drivers/mmc/host/Kconfig
+@@ -457,15 +457,6 @@ config MMC_S3C_DMA
+ 	  working properly and needs to be debugged before this
+ 	  option is useful.
+ 
+-config MMC_S3C_PIODMA
+-	bool "Support for both PIO and DMA"
+-	help
+-	  Compile both the PIO and DMA transfer routines into the
+-	  driver and let the platform select at run-time which one
+-	  is best.
+-
+-	  See notes for the DMA option.
+-
+ endchoice
+ 
+ config MMC_SDRICOH_CS
+diff --git a/drivers/mmc/host/s3cmci.c b/drivers/mmc/host/s3cmci.c
+index f237826..9f32a30 100644
+--- a/drivers/mmc/host/s3cmci.c
++++ b/drivers/mmc/host/s3cmci.c
+@@ -12,6 +12,7 @@
+  */
+ 
+ #include <linux/module.h>
++#include <linux/dmaengine.h>
+ #include <linux/dma-mapping.h>
+ #include <linux/clk.h>
+ #include <linux/mmc/host.h>
+@@ -24,9 +25,9 @@
+ #include <linux/io.h>
+ 
+ #include <plat/gpio-cfg.h>
+-#include <mach/dma.h>
+ #include <mach/gpio-samsung.h>
+ 
++#include <linux/platform_data/dma-s3c24xx.h>
+ #include <linux/platform_data/mmc-s3cmci.h>
+ 
+ #include "s3cmci.h"
+@@ -140,10 +141,6 @@ static const int dbgmap_debug = dbg_err | dbg_debug;
+ 		dev_dbg(&host->pdev->dev, args);  \
+ 	} while (0)
+ 
+-static struct s3c2410_dma_client s3cmci_dma_client = {
+-	.name		= "s3c-mci",
+-};
+-
+ static void finalize_request(struct s3cmci_host *host);
+ static void s3cmci_send_request(struct mmc_host *mmc);
+ static void s3cmci_reset(struct s3cmci_host *host);
+@@ -256,25 +253,8 @@ static inline bool s3cmci_host_usedma(struct s3cmci_host *host)
+ {
+ #ifdef CONFIG_MMC_S3C_PIO
+ 	return false;
+-#elif defined(CONFIG_MMC_S3C_DMA)
+-	return true;
+-#else
+-	return host->dodma;
+-#endif
+-}
+-
+-/**
+- * s3cmci_host_canpio - return true if host has pio code available
+- *
+- * Return true if the driver has been compiled with the PIO support code
+- * available.
+- */
+-static inline bool s3cmci_host_canpio(void)
+-{
+-#ifdef CONFIG_MMC_S3C_PIO
++#else /* CONFIG_MMC_S3C_DMA */
+ 	return true;
+-#else
+-	return false;
+ #endif
+ }
+ 
+@@ -841,11 +821,9 @@ static irqreturn_t s3cmci_irq_cd(int irq, void *dev_id)
+ 	return IRQ_HANDLED;
+ }
+ 
+-static void s3cmci_dma_done_callback(struct s3c2410_dma_chan *dma_ch,
+-				     void *buf_id, int size,
+-				     enum s3c2410_dma_buffresult result)
++static void s3cmci_dma_done_callback(void *arg)
+ {
+-	struct s3cmci_host *host = buf_id;
++	struct s3cmci_host *host = arg;
+ 	unsigned long iflags;
+ 	u32 mci_csta, mci_dsta, mci_fsta, mci_dcnt;
+ 
+@@ -856,45 +834,17 @@ static void s3cmci_dma_done_callback(struct s3c2410_dma_chan *dma_ch,
+ 
+ 	BUG_ON(!host->mrq);
+ 	BUG_ON(!host->mrq->data);
+-	BUG_ON(!host->dmatogo);
+ 
+ 	spin_lock_irqsave(&host->complete_lock, iflags);
+ 
+-	if (result != S3C2410_RES_OK) {
+-		dbg(host, dbg_fail, "DMA FAILED: csta=0x%08x dsta=0x%08x "
+-			"fsta=0x%08x dcnt:0x%08x result:0x%08x toGo:%u\n",
+-			mci_csta, mci_dsta, mci_fsta,
+-			mci_dcnt, result, host->dmatogo);
+-
+-		goto fail_request;
+-	}
+-
+-	host->dmatogo--;
+-	if (host->dmatogo) {
+-		dbg(host, dbg_dma, "DMA DONE  Size:%i DSTA:[%08x] "
+-			"DCNT:[%08x] toGo:%u\n",
+-			size, mci_dsta, mci_dcnt, host->dmatogo);
+-
+-		goto out;
+-	}
+-
+-	dbg(host, dbg_dma, "DMA FINISHED Size:%i DSTA:%08x DCNT:%08x\n",
+-		size, mci_dsta, mci_dcnt);
++	dbg(host, dbg_dma, "DMA FINISHED\n");
+ 
+ 	host->dma_complete = 1;
+ 	host->complete_what = COMPLETION_FINALIZE;
+ 
+-out:
+ 	tasklet_schedule(&host->pio_tasklet);
+ 	spin_unlock_irqrestore(&host->complete_lock, iflags);
+-	return;
+ 
+-fail_request:
+-	host->mrq->data->error = -EINVAL;
+-	host->complete_what = COMPLETION_FINALIZE;
+-	clear_imask(host);
+-
+-	goto out;
+ }
+ 
+ static void finalize_request(struct s3cmci_host *host)
+@@ -966,7 +916,7 @@ static void finalize_request(struct s3cmci_host *host)
+ 	 * DMA channel and the fifo to clear out any garbage. */
+ 	if (mrq->data->error != 0) {
+ 		if (s3cmci_host_usedma(host))
+-			s3c2410_dma_ctrl(host->dma, S3C2410_DMAOP_FLUSH);
++			dmaengine_terminate_all(host->dma);
+ 
+ 		if (host->is2440) {
+ 			/* Clear failure register and reset fifo. */
+@@ -992,29 +942,6 @@ request_done:
+ 	mmc_request_done(host->mmc, mrq);
+ }
+ 
+-static void s3cmci_dma_setup(struct s3cmci_host *host,
+-			     enum dma_data_direction source)
+-{
+-	static enum dma_data_direction last_source = -1;
+-	static int setup_ok;
+-
+-	if (last_source == source)
+-		return;
+-
+-	last_source = source;
+-
+-	s3c2410_dma_devconfig(host->dma, source,
+-			      host->mem->start + host->sdidata);
+-
+-	if (!setup_ok) {
+-		s3c2410_dma_config(host->dma, 4);
+-		s3c2410_dma_set_buffdone_fn(host->dma,
+-					    s3cmci_dma_done_callback);
+-		s3c2410_dma_setflags(host->dma, S3C2410_DMAF_AUTOSTART);
+-		setup_ok = 1;
+-	}
+-}
+-
+ static void s3cmci_send_command(struct s3cmci_host *host,
+ 					struct mmc_command *cmd)
+ {
+@@ -1162,43 +1089,44 @@ static int s3cmci_prepare_pio(struct s3cmci_host *host, struct mmc_data *data)
+ 
+ static int s3cmci_prepare_dma(struct s3cmci_host *host, struct mmc_data *data)
+ {
+-	int dma_len, i;
+ 	int rw = data->flags & MMC_DATA_WRITE;
++	struct dma_slave_config conf = {
++		.src_addr = host->mem->start + host->sdidata,
++		.dst_addr = host->mem->start + host->sdidata,
++		.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES,
++		.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES,
++	};
+ 
+ 	BUG_ON((data->flags & BOTH_DIR) == BOTH_DIR);
+ 
+-	s3cmci_dma_setup(host, rw ? DMA_TO_DEVICE : DMA_FROM_DEVICE);
+-	s3c2410_dma_ctrl(host->dma, S3C2410_DMAOP_FLUSH);
+-
+-	dma_len = dma_map_sg(mmc_dev(host->mmc), data->sg, data->sg_len,
+-			     rw ? DMA_TO_DEVICE : DMA_FROM_DEVICE);
+-
+-	if (dma_len == 0)
+-		return -ENOMEM;
+-
+-	host->dma_complete = 0;
+-	host->dmatogo = dma_len;
+-
+-	for (i = 0; i < dma_len; i++) {
+-		int res;
+-
+-		dbg(host, dbg_dma, "enqueue %i: %08x@%u\n", i,
+-		    sg_dma_address(&data->sg[i]),
+-		    sg_dma_len(&data->sg[i]));
++	/* Restore prescaler value */
++	writel(host->prescaler, host->base + S3C2410_SDIPRE);
+ 
+-		res = s3c2410_dma_enqueue(host->dma, host,
+-					  sg_dma_address(&data->sg[i]),
+-					  sg_dma_len(&data->sg[i]));
++	if (!rw)
++		conf.direction = DMA_DEV_TO_MEM;
++	else
++		conf.direction = DMA_MEM_TO_DEV;
+ 
+-		if (res) {
+-			s3c2410_dma_ctrl(host->dma, S3C2410_DMAOP_FLUSH);
+-			return -EBUSY;
+-		}
+-	}
++	dma_map_sg(mmc_dev(host->mmc), data->sg, data->sg_len,
++			     rw ? DMA_TO_DEVICE : DMA_FROM_DEVICE);
+ 
+-	s3c2410_dma_ctrl(host->dma, S3C2410_DMAOP_START);
++	dmaengine_slave_config(host->dma, &conf);
++	host->desc = dmaengine_prep_slave_sg(host->dma, data->sg, data->sg_len,
++		conf.direction,
++		DMA_CTRL_ACK | DMA_PREP_INTERRUPT);
++	if (!host->desc)
++		goto unmap_exit;
++	host->desc->callback = s3cmci_dma_done_callback;
++	host->desc->callback_param = host;
++	dmaengine_submit(host->desc);
++	dma_async_issue_pending(host->dma);
+ 
+ 	return 0;
++
++unmap_exit:
++	dma_unmap_sg(mmc_dev(host->mmc), data->sg, data->sg_len,
++			     rw ? DMA_TO_DEVICE : DMA_FROM_DEVICE);
++	return -ENOMEM;
+ }
+ 
+ static void s3cmci_send_request(struct mmc_host *mmc)
+@@ -1676,10 +1604,6 @@ static int s3cmci_probe(struct platform_device *pdev)
+ 	host->complete_what 	= COMPLETION_NONE;
+ 	host->pio_active 	= XFER_NONE;
+ 
+-#ifdef CONFIG_MMC_S3C_PIODMA
+-	host->dodma		= host->pdata->use_dma;
+-#endif
+-
+ 	host->mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+ 	if (!host->mem) {
+ 		dev_err(&pdev->dev,
+@@ -1765,17 +1689,26 @@ static int s3cmci_probe(struct platform_device *pdev)
+ 	/* depending on the dma state, get a dma channel to use. */
+ 
+ 	if (s3cmci_host_usedma(host)) {
+-		host->dma = s3c2410_dma_request(DMACH_SDI, &s3cmci_dma_client,
+-						host);
+-		if (host->dma < 0) {
++		struct resource *res;
++		dma_cap_mask_t mask;
++
++		res = platform_get_resource(pdev, IORESOURCE_DMA, 0);
++		if (!res) {
++			dev_err(&pdev->dev,
++				"failed to get dma resource.\n");
++			ret = -ENOENT;
++			goto probe_free_gpio_wp;
++		}
++
++		dma_cap_zero(mask);
++		dma_cap_set(DMA_SLAVE, mask);
++
++		host->dma = dma_request_channel(mask,
++			s3c24xx_dma_filter, (void *)res->start);
++		if (!host->dma) {
+ 			dev_err(&pdev->dev, "cannot get DMA channel.\n");
+-			if (!s3cmci_host_canpio()) {
+-				ret = -EBUSY;
+-				goto probe_free_gpio_wp;
+-			} else {
+-				dev_warn(&pdev->dev, "falling back to PIO.\n");
+-				host->dodma = 0;
+-			}
++			ret = -EBUSY;
++			goto probe_free_gpio_wp;
+ 		}
+ 	}
+ 
+@@ -1816,7 +1749,7 @@ static int s3cmci_probe(struct platform_device *pdev)
+ 	mmc->max_segs		= 128;
+ 
+ 	dbg(host, dbg_debug,
+-	    "probe: mode:%s mapped mci_base:%p irq:%u irq_cd:%u dma:%u.\n",
++	    "probe: mode:%s mapped mci_base:%p irq:%u irq_cd:%u dma:%p.\n",
+ 	    (host->is2440?"2440":""),
+ 	    host->base, host->irq, host->irq_cd, host->dma);
+ 
+@@ -1852,7 +1785,7 @@ static int s3cmci_probe(struct platform_device *pdev)
+ 
+  probe_free_dma:
+ 	if (s3cmci_host_usedma(host))
+-		s3c2410_dma_free(host->dma, &s3cmci_dma_client);
++		dma_release_channel(host->dma);
+ 
+  probe_free_gpio_wp:
+ 	if (!host->pdata->no_wprotect)
+@@ -1914,7 +1847,7 @@ static int s3cmci_remove(struct platform_device *pdev)
+ 	tasklet_disable(&host->pio_tasklet);
+ 
+ 	if (s3cmci_host_usedma(host))
+-		s3c2410_dma_free(host->dma, &s3cmci_dma_client);
++		dma_release_channel(host->dma);
+ 
+ 	free_irq(host->irq, host);
+ 
+diff --git a/drivers/mmc/host/s3cmci.h b/drivers/mmc/host/s3cmci.h
+index c76b53d..09dbbcd 100644
+--- a/drivers/mmc/host/s3cmci.h
++++ b/drivers/mmc/host/s3cmci.h
+@@ -26,7 +26,9 @@ struct s3cmci_host {
+ 	void __iomem		*base;
+ 	int			irq;
+ 	int			irq_cd;
+-	int			dma;
++	struct dma_chan		*dma;
++	struct dma_async_tx_descriptor
++				*desc;
+ 
+ 	unsigned long		clk_rate;
+ 	unsigned long		clk_div;
+@@ -36,8 +38,6 @@ struct s3cmci_host {
+ 	int			is2440;
+ 	unsigned		sdiimsk;
+ 	unsigned		sdidata;
+-	int			dodma;
+-	int			dmatogo;
+ 
+ 	bool			irq_disabled;
+ 	bool			irq_enabled;
+-- 
+1.9.3
+
diff --git a/recipes-kernel/linux/linux-yocto-3.14/h1940/0016-ASoC-samsung-s3c24-xx-12-i2s-port-to-use-generic-dma.patch b/recipes-kernel/linux/linux-yocto-3.14/h1940/0016-ASoC-samsung-s3c24-xx-12-i2s-port-to-use-generic-dma.patch
new file mode 100644
index 0000000..866ea91
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.14/h1940/0016-ASoC-samsung-s3c24-xx-12-i2s-port-to-use-generic-dma.patch
@@ -0,0 +1,385 @@
+From e1a8f391f28967f4d2afa8fa31044abfafc57b0f Mon Sep 17 00:00:00 2001
+From: Vasily Khoruzhick <anarsoul@gmail.com>
+Date: Sun, 18 May 2014 12:38:57 +0300
+Subject: [PATCH 16/17] ASoC: samsung: s3c24{xx,12}-i2s: port to use generic
+ dmaengine API
+
+Use dmaengine instead of legacy s3c24xx DMA API for s3c24xx and s3c2412
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+---
+ sound/soc/samsung/Kconfig       |  9 ++----
+ sound/soc/samsung/dmaengine.c   |  3 ++
+ sound/soc/samsung/s3c-i2s-v2.c  | 17 +---------
+ sound/soc/samsung/s3c2412-i2s.c | 63 +++++++++++++++++++++---------------
+ sound/soc/samsung/s3c24xx-i2s.c | 72 +++++++++++++++++++++++------------------
+ 5 files changed, 84 insertions(+), 80 deletions(-)
+
+diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
+index 3507574..022c7a4 100644
+--- a/sound/soc/samsung/Kconfig
++++ b/sound/soc/samsung/Kconfig
+@@ -1,11 +1,10 @@
+ config SND_SOC_SAMSUNG
+ 	tristate "ASoC support for Samsung"
+ 	depends on PLAT_SAMSUNG
+-	select S3C2410_DMA if ARCH_S3C24XX
++	select S3C24XX_DMAC if ARCH_S3C24XX
+ 	select S3C64XX_PL080 if ARCH_S3C64XX
+-	select SND_S3C_DMA if !ARCH_S3C24XX
+-	select SND_S3C_DMA_LEGACY if ARCH_S3C24XX
+-	select SND_SOC_GENERIC_DMAENGINE_PCM if !ARCH_S3C24XX
++	select SND_S3C_DMA
++	select SND_SOC_GENERIC_DMAENGINE_PCM
+ 	help
+ 	  Say Y or M if you want to add support for codecs attached to
+ 	  the Samsung SoCs' Audio interfaces. You will also need to
+@@ -19,7 +18,6 @@ config SND_S3C_DMA_LEGACY
+ 
+ config SND_S3C24XX_I2S
+ 	tristate
+-	select S3C24XX_DMA
+ 
+ config SND_S3C_I2SV2_SOC
+ 	tristate
+@@ -27,7 +25,6 @@ config SND_S3C_I2SV2_SOC
+ config SND_S3C2412_SOC_I2S
+ 	tristate
+ 	select SND_S3C_I2SV2_SOC
+-	select S3C2410_DMA
+ 
+ config SND_SAMSUNG_PCM
+ 	tristate
+diff --git a/sound/soc/samsung/dmaengine.c b/sound/soc/samsung/dmaengine.c
+index 750ce58..72f27d1 100644
+--- a/sound/soc/samsung/dmaengine.c
++++ b/sound/soc/samsung/dmaengine.c
+@@ -17,6 +17,7 @@
+ 
+ #include <linux/module.h>
+ #include <linux/amba/pl08x.h>
++#include <linux/platform_data/dma-s3c24xx.h>
+ 
+ #include <sound/core.h>
+ #include <sound/pcm.h>
+@@ -29,6 +30,8 @@
+ 
+ #ifdef CONFIG_ARCH_S3C64XX
+ #define filter_fn pl08x_filter_id
++#elif defined(CONFIG_ARCH_S3C24XX)
++#define filter_fn s3c24xx_dma_filter
+ #else
+ #define filter_fn NULL
+ #endif
+diff --git a/sound/soc/samsung/s3c-i2s-v2.c b/sound/soc/samsung/s3c-i2s-v2.c
+index 79e7efb..1a74051 100644
+--- a/sound/soc/samsung/s3c-i2s-v2.c
++++ b/sound/soc/samsung/s3c-i2s-v2.c
+@@ -392,8 +392,6 @@ static int s3c2412_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
+ 	int capture = (substream->stream == SNDRV_PCM_STREAM_CAPTURE);
+ 	unsigned long irqs;
+ 	int ret = 0;
+-	struct s3c_dma_params *dma_data =
+-		snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
+ 
+ 	pr_debug("Entered %s\n", __func__);
+ 
+@@ -424,13 +422,6 @@ static int s3c2412_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
+ 
+ 		local_irq_restore(irqs);
+ 
+-		/*
+-		 * Load the next buffer to DMA to meet the reqirement
+-		 * of the auto reload mechanism of S3C24XX.
+-		 * This call won't bother S3C64XX.
+-		 */
+-		s3c2410_dma_ctrl(dma_data->channel, S3C2410_DMAOP_STARTED);
+-
+ 		break;
+ 
+ 	case SNDRV_PCM_TRIGGER_STOP:
+@@ -644,12 +635,6 @@ int s3c_i2sv2_probe(struct snd_soc_dai *dai,
+ 	/* record our i2s structure for later use in the callbacks */
+ 	snd_soc_dai_set_drvdata(dai, i2s);
+ 
+-	i2s->regs = ioremap(base, 0x100);
+-	if (i2s->regs == NULL) {
+-		dev_err(dev, "cannot ioremap registers\n");
+-		return -ENXIO;
+-	}
+-
+ 	i2s->iis_pclk = clk_get(dev, "iis");
+ 	if (IS_ERR(i2s->iis_pclk)) {
+ 		dev_err(dev, "failed to get iis_clock\n");
+@@ -729,7 +714,7 @@ int s3c_i2sv2_register_component(struct device *dev, int id,
+ 			   struct snd_soc_component_driver *cmp_drv,
+ 			   struct snd_soc_dai_driver *dai_drv)
+ {
+-	struct snd_soc_dai_ops *ops = dai_drv->ops;
++	struct snd_soc_dai_ops *ops = (struct snd_soc_dai_ops *)dai_drv->ops;
+ 
+ 	ops->trigger = s3c2412_i2s_trigger;
+ 	if (!ops->hw_params)
+diff --git a/sound/soc/samsung/s3c2412-i2s.c b/sound/soc/samsung/s3c2412-i2s.c
+index d079445..f672352 100644
+--- a/sound/soc/samsung/s3c2412-i2s.c
++++ b/sound/soc/samsung/s3c2412-i2s.c
+@@ -33,25 +33,17 @@
+ #include "regs-i2s-v2.h"
+ #include "s3c2412-i2s.h"
+ 
+-static struct s3c2410_dma_client s3c2412_dma_client_out = {
+-	.name		= "I2S PCM Stereo out"
+-};
+-
+-static struct s3c2410_dma_client s3c2412_dma_client_in = {
+-	.name		= "I2S PCM Stereo in"
+-};
+-
+ static struct s3c_dma_params s3c2412_i2s_pcm_stereo_out = {
+-	.client		= &s3c2412_dma_client_out,
+-	.channel	= DMACH_I2S_OUT,
+-	.dma_addr	= S3C2410_PA_IIS + S3C2412_IISTXD,
++	.client		=
++		(struct s3c2410_dma_client *)&s3c2412_i2s_pcm_stereo_out,
++	.ch_name	= "tx",
+ 	.dma_size	= 4,
+ };
+ 
+ static struct s3c_dma_params s3c2412_i2s_pcm_stereo_in = {
+-	.client		= &s3c2412_dma_client_in,
+-	.channel	= DMACH_I2S_IN,
+-	.dma_addr	= S3C2410_PA_IIS + S3C2412_IISRXD,
++	.client		=
++		(struct s3c2410_dma_client *)&s3c2412_i2s_pcm_stereo_in,
++	.ch_name	= "rx",
+ 	.dma_size	= 4,
+ };
+ 
+@@ -63,6 +55,9 @@ static int s3c2412_i2s_probe(struct snd_soc_dai *dai)
+ 
+ 	pr_debug("Entered %s\n", __func__);
+ 
++	samsung_asoc_init_dma_data(dai, &s3c2412_i2s_pcm_stereo_out,
++		&s3c2412_i2s_pcm_stereo_in);
++
+ 	ret = s3c_i2sv2_probe(dai, &s3c2412_i2s, S3C2410_PA_IIS);
+ 	if (ret)
+ 		return ret;
+@@ -70,10 +65,9 @@ static int s3c2412_i2s_probe(struct snd_soc_dai *dai)
+ 	s3c2412_i2s.dma_capture = &s3c2412_i2s_pcm_stereo_in;
+ 	s3c2412_i2s.dma_playback = &s3c2412_i2s_pcm_stereo_out;
+ 
+-	s3c2412_i2s.iis_cclk = clk_get(dai->dev, "i2sclk");
++	s3c2412_i2s.iis_cclk = devm_clk_get(dai->dev, "i2sclk");
+ 	if (IS_ERR(s3c2412_i2s.iis_cclk)) {
+ 		pr_err("failed to get i2sclk clock\n");
+-		iounmap(s3c2412_i2s.regs);
+ 		return PTR_ERR(s3c2412_i2s.iis_cclk);
+ 	}
+ 
+@@ -94,8 +88,6 @@ static int s3c2412_i2s_probe(struct snd_soc_dai *dai)
+ static int s3c2412_i2s_remove(struct snd_soc_dai *dai)
+ {
+ 	clk_disable(s3c2412_i2s.iis_cclk);
+-	clk_put(s3c2412_i2s.iis_cclk);
+-	iounmap(s3c2412_i2s.regs);
+ 
+ 	return 0;
+ }
+@@ -105,18 +97,10 @@ static int s3c2412_i2s_hw_params(struct snd_pcm_substream *substream,
+ 				 struct snd_soc_dai *cpu_dai)
+ {
+ 	struct s3c_i2sv2_info *i2s = snd_soc_dai_get_drvdata(cpu_dai);
+-	struct s3c_dma_params *dma_data;
+ 	u32 iismod;
+ 
+ 	pr_debug("Entered %s\n", __func__);
+ 
+-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+-		dma_data = i2s->dma_playback;
+-	else
+-		dma_data = i2s->dma_capture;
+-
+-	snd_soc_dai_set_dma_data(cpu_dai, substream, dma_data);
+-
+ 	iismod = readl(i2s->regs + S3C2412_IISMOD);
+ 	pr_debug("%s: r: IISMOD: %x\n", __func__, iismod);
+ 
+@@ -169,6 +153,33 @@ static const struct snd_soc_component_driver s3c2412_i2s_component = {
+ static int s3c2412_iis_dev_probe(struct platform_device *pdev)
+ {
+ 	int ret = 0;
++	struct resource *res;
++
++	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (!res) {
++		dev_err(&pdev->dev, "Can't get IO resource.\n");
++		return -ENOENT;
++	}
++	s3c2412_i2s.regs = devm_ioremap_resource(&pdev->dev, res);
++	if (s3c2412_i2s.regs == NULL)
++		return -ENXIO;
++
++	s3c2412_i2s_pcm_stereo_out.dma_addr = res->start + S3C2412_IISTXD;
++	s3c2412_i2s_pcm_stereo_in.dma_addr = res->start + S3C2412_IISRXD;
++
++	res = platform_get_resource(pdev, IORESOURCE_DMA, 0);
++	if (!res) {
++		dev_err(&pdev->dev, "Can't get DMA resource for playback.\n");
++		return -ENOENT;
++	}
++	s3c2412_i2s_pcm_stereo_out.channel = res->start;
++
++	res = platform_get_resource(pdev, IORESOURCE_DMA, 1);
++	if (!res) {
++		dev_err(&pdev->dev, "Can't get DMA resource for capture.\n");
++		return -ENOENT;
++	}
++	s3c2412_i2s_pcm_stereo_in.channel = res->start;
+ 
+ 	ret = s3c_i2sv2_register_component(&pdev->dev, -1,
+ 					   &s3c2412_i2s_component,
+diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
+index f31e916..f854d45 100644
+--- a/sound/soc/samsung/s3c24xx-i2s.c
++++ b/sound/soc/samsung/s3c24xx-i2s.c
+@@ -31,25 +31,17 @@
+ #include "dma.h"
+ #include "s3c24xx-i2s.h"
+ 
+-static struct s3c2410_dma_client s3c24xx_dma_client_out = {
+-	.name = "I2S PCM Stereo out"
+-};
+-
+-static struct s3c2410_dma_client s3c24xx_dma_client_in = {
+-	.name = "I2S PCM Stereo in"
+-};
+-
+ static struct s3c_dma_params s3c24xx_i2s_pcm_stereo_out = {
+-	.client		= &s3c24xx_dma_client_out,
+-	.channel	= DMACH_I2S_OUT,
+-	.dma_addr	= S3C2410_PA_IIS + S3C2410_IISFIFO,
++	.client		=
++		(struct s3c2410_dma_client *)&s3c24xx_i2s_pcm_stereo_out,
++	.ch_name	= "tx",
+ 	.dma_size	= 2,
+ };
+ 
+ static struct s3c_dma_params s3c24xx_i2s_pcm_stereo_in = {
+-	.client		= &s3c24xx_dma_client_in,
+-	.channel	= DMACH_I2S_IN,
+-	.dma_addr	= S3C2410_PA_IIS + S3C2410_IISFIFO,
++	.client		=
++		(struct s3c2410_dma_client *)&s3c24xx_i2s_pcm_stereo_in,
++	.ch_name	= "rx",
+ 	.dma_size	= 2,
+ };
+ 
+@@ -231,18 +223,12 @@ static int s3c24xx_i2s_hw_params(struct snd_pcm_substream *substream,
+ 				 struct snd_pcm_hw_params *params,
+ 				 struct snd_soc_dai *dai)
+ {
+-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+-	struct s3c_dma_params *dma_data;
++	struct snd_dmaengine_dai_dma_data *dma_data;
+ 	u32 iismod;
+ 
+ 	pr_debug("Entered %s\n", __func__);
+ 
+-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+-		dma_data = &s3c24xx_i2s_pcm_stereo_out;
+-	else
+-		dma_data = &s3c24xx_i2s_pcm_stereo_in;
+-
+-	snd_soc_dai_set_dma_data(rtd->cpu_dai, substream, dma_data);
++	dma_data = snd_soc_dai_get_dma_data(dai, substream);
+ 
+ 	/* Working copies of register */
+ 	iismod = readl(s3c24xx_i2s.regs + S3C2410_IISMOD);
+@@ -251,11 +237,11 @@ static int s3c24xx_i2s_hw_params(struct snd_pcm_substream *substream,
+ 	switch (params_format(params)) {
+ 	case SNDRV_PCM_FORMAT_S8:
+ 		iismod &= ~S3C2410_IISMOD_16BIT;
+-		dma_data->dma_size = 1;
++		dma_data->addr_width = 1;
+ 		break;
+ 	case SNDRV_PCM_FORMAT_S16_LE:
+ 		iismod |= S3C2410_IISMOD_16BIT;
+-		dma_data->dma_size = 2;
++		dma_data->addr_width = 2;
+ 		break;
+ 	default:
+ 		return -EINVAL;
+@@ -270,8 +256,6 @@ static int s3c24xx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
+ 			       struct snd_soc_dai *dai)
+ {
+ 	int ret = 0;
+-	struct s3c_dma_params *dma_data =
+-		snd_soc_dai_get_dma_data(dai, substream);
+ 
+ 	pr_debug("Entered %s\n", __func__);
+ 
+@@ -290,7 +274,6 @@ static int s3c24xx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
+ 		else
+ 			s3c24xx_snd_txctrl(1);
+ 
+-		s3c2410_dma_ctrl(dma_data->channel, S3C2410_DMAOP_STARTED);
+ 		break;
+ 	case SNDRV_PCM_TRIGGER_STOP:
+ 	case SNDRV_PCM_TRIGGER_SUSPEND:
+@@ -380,14 +363,12 @@ static int s3c24xx_i2s_probe(struct snd_soc_dai *dai)
+ {
+ 	pr_debug("Entered %s\n", __func__);
+ 
+-	s3c24xx_i2s.regs = ioremap(S3C2410_PA_IIS, 0x100);
+-	if (s3c24xx_i2s.regs == NULL)
+-		return -ENXIO;
++	samsung_asoc_init_dma_data(dai, &s3c24xx_i2s_pcm_stereo_out,
++		&s3c24xx_i2s_pcm_stereo_in);
+ 
+-	s3c24xx_i2s.iis_clk = clk_get(dai->dev, "iis");
++	s3c24xx_i2s.iis_clk = devm_clk_get(dai->dev, "iis");
+ 	if (IS_ERR(s3c24xx_i2s.iis_clk)) {
+ 		pr_err("failed to get iis_clock\n");
+-		iounmap(s3c24xx_i2s.regs);
+ 		return PTR_ERR(s3c24xx_i2s.iis_clk);
+ 	}
+ 	clk_enable(s3c24xx_i2s.iis_clk);
+@@ -474,6 +455,33 @@ static const struct snd_soc_component_driver s3c24xx_i2s_component = {
+ static int s3c24xx_iis_dev_probe(struct platform_device *pdev)
+ {
+ 	int ret = 0;
++	struct resource *res;
++
++	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (!res) {
++		dev_err(&pdev->dev, "Can't get IO resource.\n");
++		return -ENOENT;
++	}
++	s3c24xx_i2s.regs = devm_ioremap_resource(&pdev->dev, res);
++	if (s3c24xx_i2s.regs == NULL)
++		return -ENXIO;
++
++	s3c24xx_i2s_pcm_stereo_out.dma_addr = res->start + S3C2410_IISFIFO;
++	s3c24xx_i2s_pcm_stereo_in.dma_addr = res->start + S3C2410_IISFIFO;
++
++	res = platform_get_resource(pdev, IORESOURCE_DMA, 0);
++	if (!res) {
++		dev_err(&pdev->dev, "Can't get DMA resource for playback.\n");
++		return -ENOENT;
++	}
++	s3c24xx_i2s_pcm_stereo_out.channel = res->start;
++
++	res = platform_get_resource(pdev, IORESOURCE_DMA, 1);
++	if (!res) {
++		dev_err(&pdev->dev, "Can't get DMA resource for capture.\n");
++		return -ENOENT;
++	}
++	s3c24xx_i2s_pcm_stereo_in.channel = res->start;
+ 
+ 	ret = snd_soc_register_component(&pdev->dev, &s3c24xx_i2s_component,
+ 					 &s3c24xx_i2s_dai, 1);
+-- 
+1.9.3
+
diff --git a/recipes-kernel/linux/linux-yocto-3.14/h1940/0017-ASoC-samsung-drop-support-for-legacy-S3C24XX-DMA-API.patch b/recipes-kernel/linux/linux-yocto-3.14/h1940/0017-ASoC-samsung-drop-support-for-legacy-S3C24XX-DMA-API.patch
new file mode 100644
index 0000000..8de8c21
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.14/h1940/0017-ASoC-samsung-drop-support-for-legacy-S3C24XX-DMA-API.patch
@@ -0,0 +1,515 @@
+From b63f4747fb0f17d970b643bd648794d60fc15838 Mon Sep 17 00:00:00 2001
+From: Vasily Khoruzhick <anarsoul@gmail.com>
+Date: Mon, 19 May 2014 14:40:57 +0300
+Subject: [PATCH 17/17] ASoC: samsung: drop support for legacy S3C24XX DMA API
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+---
+ sound/soc/samsung/Kconfig  |   3 -
+ sound/soc/samsung/Makefile |   2 -
+ sound/soc/samsung/dma.c    | 460 ---------------------------------------------
+ 3 files changed, 465 deletions(-)
+ delete mode 100644 sound/soc/samsung/dma.c
+
+diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
+index 022c7a4..bf4bb7b 100644
+--- a/sound/soc/samsung/Kconfig
++++ b/sound/soc/samsung/Kconfig
+@@ -13,9 +13,6 @@ config SND_SOC_SAMSUNG
+ config SND_S3C_DMA
+ 	tristate
+ 
+-config SND_S3C_DMA_LEGACY
+-	tristate
+-
+ config SND_S3C24XX_I2S
+ 	tristate
+ 
+diff --git a/sound/soc/samsung/Makefile b/sound/soc/samsung/Makefile
+index 86715d8..bc02da0 100644
+--- a/sound/soc/samsung/Makefile
++++ b/sound/soc/samsung/Makefile
+@@ -1,6 +1,5 @@
+ # S3c24XX Platform Support
+ snd-soc-s3c-dma-objs := dmaengine.o
+-snd-soc-s3c-dma-legacy-objs := dma.o
+ snd-soc-idma-objs := idma.o
+ snd-soc-s3c24xx-i2s-objs := s3c24xx-i2s.o
+ snd-soc-s3c2412-i2s-objs := s3c2412-i2s.o
+@@ -11,7 +10,6 @@ snd-soc-pcm-objs := pcm.o
+ snd-soc-i2s-objs := i2s.o
+ 
+ obj-$(CONFIG_SND_S3C_DMA) += snd-soc-s3c-dma.o
+-obj-$(CONFIG_SND_S3C_DMA_LEGACY) += snd-soc-s3c-dma-legacy.o
+ obj-$(CONFIG_SND_S3C24XX_I2S) += snd-soc-s3c24xx-i2s.o
+ obj-$(CONFIG_SND_SAMSUNG_AC97) += snd-soc-ac97.o
+ obj-$(CONFIG_SND_S3C2412_SOC_I2S) += snd-soc-s3c2412-i2s.o
+diff --git a/sound/soc/samsung/dma.c b/sound/soc/samsung/dma.c
+deleted file mode 100644
+index dc09b71..0000000
+--- a/sound/soc/samsung/dma.c
++++ /dev/null
+@@ -1,460 +0,0 @@
+-/*
+- * dma.c  --  ALSA Soc Audio Layer
+- *
+- * (c) 2006 Wolfson Microelectronics PLC.
+- * Graeme Gregory graeme.gregory@wolfsonmicro.com or linux@wolfsonmicro.com
+- *
+- * Copyright 2004-2005 Simtec Electronics
+- *	http://armlinux.simtec.co.uk/
+- *	Ben Dooks <ben@simtec.co.uk>
+- *
+- *  This program is free software; you can redistribute  it and/or modify it
+- *  under  the terms of  the GNU General  Public License as published by the
+- *  Free Software Foundation;  either version 2 of the  License, or (at your
+- *  option) any later version.
+- */
+-
+-#include <linux/slab.h>
+-#include <linux/dma-mapping.h>
+-#include <linux/module.h>
+-
+-#include <sound/soc.h>
+-#include <sound/pcm_params.h>
+-
+-#include <asm/dma.h>
+-#include <mach/hardware.h>
+-#include <mach/dma.h>
+-
+-#include "dma.h"
+-
+-#define ST_RUNNING		(1<<0)
+-#define ST_OPENED		(1<<1)
+-
+-static const struct snd_pcm_hardware dma_hardware = {
+-	.info			= SNDRV_PCM_INFO_INTERLEAVED |
+-				    SNDRV_PCM_INFO_BLOCK_TRANSFER |
+-				    SNDRV_PCM_INFO_MMAP |
+-				    SNDRV_PCM_INFO_MMAP_VALID,
+-	.buffer_bytes_max	= 128*1024,
+-	.period_bytes_min	= PAGE_SIZE,
+-	.period_bytes_max	= PAGE_SIZE*2,
+-	.periods_min		= 2,
+-	.periods_max		= 128,
+-	.fifo_size		= 32,
+-};
+-
+-struct runtime_data {
+-	spinlock_t lock;
+-	int state;
+-	unsigned int dma_loaded;
+-	unsigned int dma_period;
+-	dma_addr_t dma_start;
+-	dma_addr_t dma_pos;
+-	dma_addr_t dma_end;
+-	struct s3c_dma_params *params;
+-};
+-
+-static void audio_buffdone(void *data);
+-
+-/* dma_enqueue
+- *
+- * place a dma buffer onto the queue for the dma system
+- * to handle.
+- */
+-static void dma_enqueue(struct snd_pcm_substream *substream)
+-{
+-	struct runtime_data *prtd = substream->runtime->private_data;
+-	dma_addr_t pos = prtd->dma_pos;
+-	unsigned int limit;
+-	struct samsung_dma_prep dma_info;
+-
+-	pr_debug("Entered %s\n", __func__);
+-
+-	limit = (prtd->dma_end - prtd->dma_start) / prtd->dma_period;
+-
+-	pr_debug("%s: loaded %d, limit %d\n",
+-				__func__, prtd->dma_loaded, limit);
+-
+-	dma_info.cap = (samsung_dma_has_circular() ? DMA_CYCLIC : DMA_SLAVE);
+-	dma_info.direction =
+-		(substream->stream == SNDRV_PCM_STREAM_PLAYBACK
+-		? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM);
+-	dma_info.fp = audio_buffdone;
+-	dma_info.fp_param = substream;
+-	dma_info.period = prtd->dma_period;
+-	dma_info.len = prtd->dma_period*limit;
+-
+-	if (dma_info.cap == DMA_CYCLIC) {
+-		dma_info.buf = pos;
+-		prtd->params->ops->prepare(prtd->params->ch, &dma_info);
+-		prtd->dma_loaded += limit;
+-		return;
+-	}
+-
+-	while (prtd->dma_loaded < limit) {
+-		pr_debug("dma_loaded: %d\n", prtd->dma_loaded);
+-
+-		if ((pos + dma_info.period) > prtd->dma_end) {
+-			dma_info.period  = prtd->dma_end - pos;
+-			pr_debug("%s: corrected dma len %ld\n",
+-					__func__, dma_info.period);
+-		}
+-
+-		dma_info.buf = pos;
+-		prtd->params->ops->prepare(prtd->params->ch, &dma_info);
+-
+-		prtd->dma_loaded++;
+-		pos += prtd->dma_period;
+-		if (pos >= prtd->dma_end)
+-			pos = prtd->dma_start;
+-	}
+-
+-	prtd->dma_pos = pos;
+-}
+-
+-static void audio_buffdone(void *data)
+-{
+-	struct snd_pcm_substream *substream = data;
+-	struct runtime_data *prtd = substream->runtime->private_data;
+-
+-	pr_debug("Entered %s\n", __func__);
+-
+-	if (prtd->state & ST_RUNNING) {
+-		prtd->dma_pos += prtd->dma_period;
+-		if (prtd->dma_pos >= prtd->dma_end)
+-			prtd->dma_pos = prtd->dma_start;
+-
+-		if (substream)
+-			snd_pcm_period_elapsed(substream);
+-
+-		spin_lock(&prtd->lock);
+-		if (!samsung_dma_has_circular()) {
+-			prtd->dma_loaded--;
+-			dma_enqueue(substream);
+-		}
+-		spin_unlock(&prtd->lock);
+-	}
+-}
+-
+-static int dma_hw_params(struct snd_pcm_substream *substream,
+-	struct snd_pcm_hw_params *params)
+-{
+-	struct snd_pcm_runtime *runtime = substream->runtime;
+-	struct runtime_data *prtd = runtime->private_data;
+-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+-	unsigned long totbytes = params_buffer_bytes(params);
+-	struct s3c_dma_params *dma =
+-		snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
+-	struct samsung_dma_req req;
+-	struct samsung_dma_config config;
+-
+-	pr_debug("Entered %s\n", __func__);
+-
+-	/* return if this is a bufferless transfer e.g.
+-	 * codec <--> BT codec or GSM modem -- lg FIXME */
+-	if (!dma)
+-		return 0;
+-
+-	/* this may get called several times by oss emulation
+-	 * with different params -HW */
+-	if (prtd->params == NULL) {
+-		/* prepare DMA */
+-		prtd->params = dma;
+-
+-		pr_debug("params %p, client %p, channel %d\n", prtd->params,
+-			prtd->params->client, prtd->params->channel);
+-
+-		prtd->params->ops = samsung_dma_get_ops();
+-
+-		req.cap = (samsung_dma_has_circular() ?
+-			DMA_CYCLIC : DMA_SLAVE);
+-		req.client = prtd->params->client;
+-		config.direction =
+-			(substream->stream == SNDRV_PCM_STREAM_PLAYBACK
+-			? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM);
+-		config.width = prtd->params->dma_size;
+-		config.fifo = prtd->params->dma_addr;
+-		prtd->params->ch = prtd->params->ops->request(
+-				prtd->params->channel, &req, rtd->cpu_dai->dev,
+-				prtd->params->ch_name);
+-		if (!prtd->params->ch) {
+-			pr_err("Failed to allocate DMA channel\n");
+-			return -ENXIO;
+-		}
+-		prtd->params->ops->config(prtd->params->ch, &config);
+-	}
+-
+-	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
+-
+-	runtime->dma_bytes = totbytes;
+-
+-	spin_lock_irq(&prtd->lock);
+-	prtd->dma_loaded = 0;
+-	prtd->dma_period = params_period_bytes(params);
+-	prtd->dma_start = runtime->dma_addr;
+-	prtd->dma_pos = prtd->dma_start;
+-	prtd->dma_end = prtd->dma_start + totbytes;
+-	spin_unlock_irq(&prtd->lock);
+-
+-	return 0;
+-}
+-
+-static int dma_hw_free(struct snd_pcm_substream *substream)
+-{
+-	struct runtime_data *prtd = substream->runtime->private_data;
+-
+-	pr_debug("Entered %s\n", __func__);
+-
+-	snd_pcm_set_runtime_buffer(substream, NULL);
+-
+-	if (prtd->params) {
+-		prtd->params->ops->flush(prtd->params->ch);
+-		prtd->params->ops->release(prtd->params->ch,
+-					prtd->params->client);
+-		prtd->params = NULL;
+-	}
+-
+-	return 0;
+-}
+-
+-static int dma_prepare(struct snd_pcm_substream *substream)
+-{
+-	struct runtime_data *prtd = substream->runtime->private_data;
+-	int ret = 0;
+-
+-	pr_debug("Entered %s\n", __func__);
+-
+-	/* return if this is a bufferless transfer e.g.
+-	 * codec <--> BT codec or GSM modem -- lg FIXME */
+-	if (!prtd->params)
+-		return 0;
+-
+-	/* flush the DMA channel */
+-	prtd->params->ops->flush(prtd->params->ch);
+-
+-	prtd->dma_loaded = 0;
+-	prtd->dma_pos = prtd->dma_start;
+-
+-	/* enqueue dma buffers */
+-	dma_enqueue(substream);
+-
+-	return ret;
+-}
+-
+-static int dma_trigger(struct snd_pcm_substream *substream, int cmd)
+-{
+-	struct runtime_data *prtd = substream->runtime->private_data;
+-	int ret = 0;
+-
+-	pr_debug("Entered %s\n", __func__);
+-
+-	spin_lock(&prtd->lock);
+-
+-	switch (cmd) {
+-	case SNDRV_PCM_TRIGGER_START:
+-		prtd->state |= ST_RUNNING;
+-		prtd->params->ops->trigger(prtd->params->ch);
+-		break;
+-
+-	case SNDRV_PCM_TRIGGER_STOP:
+-		prtd->state &= ~ST_RUNNING;
+-		prtd->params->ops->stop(prtd->params->ch);
+-		break;
+-
+-	default:
+-		ret = -EINVAL;
+-		break;
+-	}
+-
+-	spin_unlock(&prtd->lock);
+-
+-	return ret;
+-}
+-
+-static snd_pcm_uframes_t
+-dma_pointer(struct snd_pcm_substream *substream)
+-{
+-	struct snd_pcm_runtime *runtime = substream->runtime;
+-	struct runtime_data *prtd = runtime->private_data;
+-	unsigned long res;
+-
+-	pr_debug("Entered %s\n", __func__);
+-
+-	res = prtd->dma_pos - prtd->dma_start;
+-
+-	pr_debug("Pointer offset: %lu\n", res);
+-
+-	/* we seem to be getting the odd error from the pcm library due
+-	 * to out-of-bounds pointers. this is maybe due to the dma engine
+-	 * not having loaded the new values for the channel before being
+-	 * called... (todo - fix )
+-	 */
+-
+-	if (res >= snd_pcm_lib_buffer_bytes(substream)) {
+-		if (res == snd_pcm_lib_buffer_bytes(substream))
+-			res = 0;
+-	}
+-
+-	return bytes_to_frames(substream->runtime, res);
+-}
+-
+-static int dma_open(struct snd_pcm_substream *substream)
+-{
+-	struct snd_pcm_runtime *runtime = substream->runtime;
+-	struct runtime_data *prtd;
+-
+-	pr_debug("Entered %s\n", __func__);
+-
+-	snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+-	snd_soc_set_runtime_hwparams(substream, &dma_hardware);
+-
+-	prtd = kzalloc(sizeof(struct runtime_data), GFP_KERNEL);
+-	if (prtd == NULL)
+-		return -ENOMEM;
+-
+-	spin_lock_init(&prtd->lock);
+-
+-	runtime->private_data = prtd;
+-	return 0;
+-}
+-
+-static int dma_close(struct snd_pcm_substream *substream)
+-{
+-	struct snd_pcm_runtime *runtime = substream->runtime;
+-	struct runtime_data *prtd = runtime->private_data;
+-
+-	pr_debug("Entered %s\n", __func__);
+-
+-	if (!prtd)
+-		pr_debug("dma_close called with prtd == NULL\n");
+-
+-	kfree(prtd);
+-
+-	return 0;
+-}
+-
+-static int dma_mmap(struct snd_pcm_substream *substream,
+-	struct vm_area_struct *vma)
+-{
+-	struct snd_pcm_runtime *runtime = substream->runtime;
+-
+-	pr_debug("Entered %s\n", __func__);
+-
+-	return dma_mmap_writecombine(substream->pcm->card->dev, vma,
+-				     runtime->dma_area,
+-				     runtime->dma_addr,
+-				     runtime->dma_bytes);
+-}
+-
+-static struct snd_pcm_ops dma_ops = {
+-	.open		= dma_open,
+-	.close		= dma_close,
+-	.ioctl		= snd_pcm_lib_ioctl,
+-	.hw_params	= dma_hw_params,
+-	.hw_free	= dma_hw_free,
+-	.prepare	= dma_prepare,
+-	.trigger	= dma_trigger,
+-	.pointer	= dma_pointer,
+-	.mmap		= dma_mmap,
+-};
+-
+-static int preallocate_dma_buffer(struct snd_pcm *pcm, int stream)
+-{
+-	struct snd_pcm_substream *substream = pcm->streams[stream].substream;
+-	struct snd_dma_buffer *buf = &substream->dma_buffer;
+-	size_t size = dma_hardware.buffer_bytes_max;
+-
+-	pr_debug("Entered %s\n", __func__);
+-
+-	buf->dev.type = SNDRV_DMA_TYPE_DEV;
+-	buf->dev.dev = pcm->card->dev;
+-	buf->private_data = NULL;
+-	buf->area = dma_alloc_writecombine(pcm->card->dev, size,
+-					   &buf->addr, GFP_KERNEL);
+-	if (!buf->area)
+-		return -ENOMEM;
+-	buf->bytes = size;
+-	return 0;
+-}
+-
+-static void dma_free_dma_buffers(struct snd_pcm *pcm)
+-{
+-	struct snd_pcm_substream *substream;
+-	struct snd_dma_buffer *buf;
+-	int stream;
+-
+-	pr_debug("Entered %s\n", __func__);
+-
+-	for (stream = 0; stream < 2; stream++) {
+-		substream = pcm->streams[stream].substream;
+-		if (!substream)
+-			continue;
+-
+-		buf = &substream->dma_buffer;
+-		if (!buf->area)
+-			continue;
+-
+-		dma_free_writecombine(pcm->card->dev, buf->bytes,
+-				      buf->area, buf->addr);
+-		buf->area = NULL;
+-	}
+-}
+-
+-static int dma_new(struct snd_soc_pcm_runtime *rtd)
+-{
+-	struct snd_card *card = rtd->card->snd_card;
+-	struct snd_pcm *pcm = rtd->pcm;
+-	int ret;
+-
+-	pr_debug("Entered %s\n", __func__);
+-
+-	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
+-	if (ret)
+-		return ret;
+-
+-	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream) {
+-		ret = preallocate_dma_buffer(pcm,
+-			SNDRV_PCM_STREAM_PLAYBACK);
+-		if (ret)
+-			goto out;
+-	}
+-
+-	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
+-		ret = preallocate_dma_buffer(pcm,
+-			SNDRV_PCM_STREAM_CAPTURE);
+-		if (ret)
+-			goto out;
+-	}
+-out:
+-	return ret;
+-}
+-
+-static struct snd_soc_platform_driver samsung_asoc_platform = {
+-	.ops		= &dma_ops,
+-	.pcm_new	= dma_new,
+-	.pcm_free	= dma_free_dma_buffers,
+-};
+-
+-void samsung_asoc_init_dma_data(struct snd_soc_dai *dai,
+-				struct s3c_dma_params *playback,
+-				struct s3c_dma_params *capture)
+-{
+-	snd_soc_dai_init_dma_data(dai, playback, capture);
+-}
+-EXPORT_SYMBOL_GPL(samsung_asoc_init_dma_data);
+-
+-int samsung_asoc_dma_platform_register(struct device *dev)
+-{
+-	return snd_soc_register_platform(dev, &samsung_asoc_platform);
+-}
+-EXPORT_SYMBOL_GPL(samsung_asoc_dma_platform_register);
+-
+-void samsung_asoc_dma_platform_unregister(struct device *dev)
+-{
+-	snd_soc_unregister_platform(dev);
+-}
+-EXPORT_SYMBOL_GPL(samsung_asoc_dma_platform_unregister);
+-
+-MODULE_AUTHOR("Ben Dooks, <ben@simtec.co.uk>");
+-MODULE_DESCRIPTION("Samsung ASoC DMA Driver");
+-MODULE_LICENSE("GPL");
+-- 
+1.9.3
+
diff --git a/recipes-kernel/linux/linux-yocto-3.14/h1940/defconfig b/recipes-kernel/linux/linux-yocto-3.14/h1940/defconfig
new file mode 100644
index 0000000..de546c6
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.14/h1940/defconfig
@@ -0,0 +1,200 @@
+CONFIG_LOCALVERSION="-yocto-standard"
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_SYSVIPC=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=18
+CONFIG_CGROUPS=y
+CONFIG_CGROUP_DEBUG=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CPUSETS=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_RESOURCE_COUNTERS=y
+CONFIG_MEMCG=y
+CONFIG_MEMCG_SWAP=y
+# CONFIG_MEMCG_SWAP_ENABLED is not set
+CONFIG_MEMCG_KMEM=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_BLK_CGROUP=y
+# CONFIG_UTS_NS is not set
+# CONFIG_IPC_NS is not set
+# CONFIG_PID_NS is not set
+# CONFIG_NET_NS is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SLAB=y
+CONFIG_MODULES=y
+CONFIG_MODULE_FORCE_LOAD=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+# CONFIG_BLK_DEV_BSG is not set
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_BSD_DISKLABEL=y
+# CONFIG_EFI_PARTITION is not set
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_ARCH_S3C24XX=y
+CONFIG_S3C_LOWLEVEL_UART_PORT=1
+CONFIG_SAMSUNG_GPIO_EXTRA=16
+CONFIG_S3C24XX_PWM=y
+CONFIG_CPU_S3C2442=y
+CONFIG_ARCH_H1940=y
+CONFIG_PREEMPT_VOLUNTARY=y
+CONFIG_AEABI=y
+# CONFIG_COMPACTION is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CPU_IDLE=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_APM_EMULATION=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+# CONFIG_IPV6 is not set
+CONFIG_IRDA=m
+CONFIG_IRCOMM=m
+CONFIG_IRDA_CACHE_LAST_LSAP=y
+CONFIG_IRDA_FAST_RR=y
+CONFIG_IRTTY_SIR=m
+CONFIG_BT=m
+CONFIG_BT_RFCOMM=m
+CONFIG_BT_RFCOMM_TTY=y
+CONFIG_BT_BNEP=m
+CONFIG_BT_HCIUART=m
+CONFIG_BT_HCIUART_H4=y
+CONFIG_BT_HCIUART_BCSP=y
+CONFIG_BT_HCIUART_ATH3K=y
+CONFIG_BT_HCIUART_LL=y
+CONFIG_CFG80211=m
+CONFIG_CFG80211_WEXT=y
+CONFIG_MAC80211=m
+CONFIG_RFKILL=m
+CONFIG_RFKILL_GPIO=m
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_FIRMWARE_IN_KERNEL is not set
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_CFI=y
+CONFIG_MTD_JEDECPROBE=y
+CONFIG_MTD_CFI_INTELEXT=y
+CONFIG_MTD_CFI_AMDSTD=y
+CONFIG_MTD_ROM=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_S3C2410=y
+CONFIG_MTD_NAND_S3C2410_HWECC=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=1
+CONFIG_BLK_DEV_RAM_SIZE=8192
+CONFIG_NETDEVICES=y
+# CONFIG_ETHERNET is not set
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=240
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=320
+CONFIG_INPUT_EVDEV=y
+# CONFIG_KEYBOARD_ATKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_S3C2410=y
+# CONFIG_LEGACY_PTYS is not set
+CONFIG_SERIAL_SAMSUNG=y
+CONFIG_SERIAL_SAMSUNG_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_I2C=y
+# CONFIG_I2C_COMPAT is not set
+CONFIG_I2C_CHARDEV=m
+CONFIG_I2C_S3C2410=m
+CONFIG_GPIO_SYSFS=y
+CONFIG_POWER_SUPPLY=y
+CONFIG_PDA_POWER=y
+CONFIG_APM_POWER=y
+CONFIG_BATTERY_S3C_ADC=y
+# CONFIG_HWMON is not set
+CONFIG_WATCHDOG=y
+CONFIG_S3C2410_WATCHDOG=y
+CONFIG_FB=y
+CONFIG_FB_S3C2410=y
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CLASS_DEVICE=y
+CONFIG_LCD_PLATFORM=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+# CONFIG_BACKLIGHT_GENERIC is not set
+CONFIG_BACKLIGHT_PWM=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_SOUND=m
+# CONFIG_SOUND_OSS_CORE_PRECLAIM is not set
+CONFIG_SND=m
+CONFIG_SND_MIXER_OSS=m
+CONFIG_SND_PCM_OSS=m
+# CONFIG_SND_DRIVERS is not set
+# CONFIG_SND_ARM is not set
+CONFIG_SND_SOC=m
+CONFIG_SND_SOC_SAMSUNG=m
+CONFIG_SND_SOC_SAMSUNG_H1940_UDA1380=m
+CONFIG_USB_GADGET=y
+CONFIG_USB_GADGET_VBUS_DRAW=250
+CONFIG_USB_S3C2410=y
+CONFIG_USB_ETH=y
+CONFIG_MMC=y
+CONFIG_MMC_UNSAFE_RESUME=y
+CONFIG_MMC_S3C=y
+CONFIG_MMC_S3C_DMA=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_RTC_CLASS=y
+# CONFIG_RTC_INTF_PROC is not set
+CONFIG_RTC_DRV_S3C=y
+CONFIG_DMADEVICES=y
+CONFIG_S3C24XX_DMAC=y
+CONFIG_STAGING=y
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_EXT2_FS=y
+CONFIG_EXT3_FS=m
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+CONFIG_FUSE_FS=m
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_CODEPAGE=866
+CONFIG_FAT_DEFAULT_IOCHARSET="utf8"
+CONFIG_TMPFS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V4=y
+CONFIG_ROOT_NFS=y
+CONFIG_NLS_DEFAULT="utf8"
+CONFIG_NLS_CODEPAGE_866=y
+CONFIG_NLS_CODEPAGE_1251=y
+CONFIG_NLS_UTF8=y
+CONFIG_DEBUG_FS=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_USER=y
+CONFIG_CRYPTO_CBC=y
+CONFIG_CRYPTO_ECB=y
+CONFIG_CRYPTO_MD5=y
+CONFIG_CRYPTO_MICHAEL_MIC=y
+CONFIG_CRYPTO_ARC4=y
+CONFIG_CRYPTO_DES=y
+CONFIG_CRYPTO_ANSI_CPRNG=y
+CONFIG_CRC_CCITT=y
+CONFIG_CRC16=y
+CONFIG_XZ_DEC_X86=y
+CONFIG_XZ_DEC_POWERPC=y
+CONFIG_XZ_DEC_IA64=y
+CONFIG_XZ_DEC_SPARC=y
+CONFIG_FONTS=y
+CONFIG_FONT_MINI_4x6=y
diff --git a/recipes-kernel/linux/linux-yocto_3.14.bbappend b/recipes-kernel/linux/linux-yocto_3.14.bbappend
index 335fe27..12f910a 100644
--- a/recipes-kernel/linux/linux-yocto_3.14.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.14.bbappend
@@ -1,11 +1,12 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.14:${THISDIR}/${PN}:"
 
 # Declare more compatible machines
-COMPATIBLE_MACHINE .= "|akita|c7x0|collie|h3600|hx4700|poodle|spitz|tosa"
+COMPATIBLE_MACHINE .= "|akita|c7x0|collie|h1940|h3600|hx4700|poodle|spitz|tosa"
 
 KERNEL_EXTRA_FEATURES_akita ?= ""
 KERNEL_EXTRA_FEATURES_c7x0 ?= ""
 KERNEL_EXTRA_FEATURES_collie ?= ""
+KERNEL_EXTRA_FEATURES_h1940 ?= ""
 KERNEL_EXTRA_FEATURES_h3600 ?= ""
 KERNEL_EXTRA_FEATURES_hx4700 ?= ""
 KERNEL_EXTRA_FEATURES_poodle ?= ""
@@ -15,6 +16,7 @@ KERNEL_EXTRA_FEATURES_tosa ?= ""
 KMACHINE_akita = "akita"
 KMACHINE_c7x0 = "c7x0"
 KMACHINE_collie = "collie"
+KMACHINE_h1940 = "h1940"
 KMACHINE_h3600 = "h3600"
 KMACHINE_hx4700 = "hx4700"
 KMACHINE_poodle = "poodle"
@@ -26,6 +28,7 @@ KMACHINE_tosa = "tosa"
 KCONFIG_MODE_akita = "--alldefconfig"
 KCONFIG_MODE_c7x0 = "--alldefconfig"
 KCONFIG_MODE_collie = "--alldefconfig"
+KCONFIG_MODE_h1940 = "--alldefconfig"
 KCONFIG_MODE_h3600 = "--alldefconfig"
 KCONFIG_MODE_hx4700 = "--alldefconfig"
 KCONFIG_MODE_poodle = "--alldefconfig"
@@ -69,6 +72,28 @@ SRC_URI_append_collie = " \
            \
            "
 
+SRC_URI_append_h1940 = " \
+           file://defconfig \
+           file://OE-qvga-logo.patch \
+           file://0001-rfkill-add-IR-type.patch \
+           file://0002-ARM-s3c24xx-Remove-S3C24XX_DMA-dependency-from-S3C24.patch \
+           file://0003-ARM-s3c24xx-add-dma_coherent_mask-for-DMA-devices.patch \
+           file://0004-ARM-s3c24xx-Add-DMA-resources-for-SDI-and-I2S.patch \
+           file://0005-ARM-s3c24xx-drop-RFKILL-driver-for-H1940-bluetooth.patch \
+           file://0006-ARM-s3c24xx-h1940-Add-nand-device.patch \
+           file://0007-ARM-s3c24xx-h1940-don-t-touch-UPLLCON.patch \
+           file://0008-ARM-s3c24xx-h1940-unlock-reset-button.patch \
+           file://0009-ARM-s3c24xx-h1940-add-bluetooth-RF-kill-switch.patch \
+           file://0010-ARM-s3c24xx-h1940-add-IR-switch.patch \
+           file://0011-ARM-s3c24xx-h1940-increase-oversampling-shift.patch \
+           file://0012-ARM-s3c24xx-h1940-Add-DMA-device.patch \
+           file://0013-dmaengine-s3c24xx-dma-Process-whole-SG-chain.patch \
+           file://0014-dmaengine-s3c24xx-dma-Add-cyclic-transfer-support.patch \
+           file://0015-s3cmci-port-DMA-code-to-dmaengine-API.patch \
+           file://0016-ASoC-samsung-s3c24-xx-12-i2s-port-to-use-generic-dma.patch \
+           file://0017-ASoC-samsung-drop-support-for-legacy-S3C24XX-DMA-API.patch \
+           "
+
 SRC_URI_append_h3600 = " \
            file://defconfig \
            file://OE-qvga-logo.patch \
-- 
1.9.1


