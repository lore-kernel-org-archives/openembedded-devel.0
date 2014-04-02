Return-Path: <linus.walleij@linaro.org>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 208266B7B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Apr 2014 13:20:10 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id bs8so493106wib.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Apr 2014 06:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/g0OZJB0ZvCGzv36/4VFU0YF1xuOiWKsRkoUVwvGLXs=;
	b=KKnRG2TSbkcDV6Ta4a+MSLrVvtFVWBEvUGzeez2E6Cmprwx67FfW6w4XeY8GIzE2u7
	YLiU1WyURdt9gJoUhZ4jgVDfWRAYBHZOb6Aox4Uj9NgoX0bEFROlbO+F6eKPa2vlXJyU
	KYTpWCMrYwdtdwbAKM2bt7AiF2qu5pUImQvBl8TIdSMsfQrBL3OgAghCfoqW9VEAV5KB
	IS/+lZ6t49l5YEIt/A6XLPrY3o7jMA3FfZUgbkvLXWThyQfpb+u6Lus6fLzwZqq/XbIS
	OuCkAUwdL+8MY2aYCkxK4uZw/AUzTcqq7g3DTYep19tokSNCDZ2XhdwInDSN0sbVCgOS
	V3Ww==
X-Gm-Message-State: ALoCoQnQcC+1ekljfAVHv6LN/f03QrK2Pu3vuExAcQrdIZeEyZCXLUm8OzCCsyOHaIfh2GC6jSmE
X-Received: by 10.180.109.107 with SMTP id hr11mr17836075wib.4.1396444811072; 
	Wed, 02 Apr 2014 06:20:11 -0700 (PDT)
Received: from localhost.localdomain ([85.235.11.236])
	by mx.google.com with ESMTPSA id
	gp10sm39691465wib.13.2014.04.02.06.20.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Apr 2014 06:20:09 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Apr 2014 15:20:03 +0200
Message-Id: <1396444803-17605-1-git-send-email-linus.walleij@linaro.org>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] h3600: add new patches, update config
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
X-List-Received-Date: Wed, 02 Apr 2014 13:20:11 -0000

This adds the latest iPAQ microcontroller patches to the yocto-dev
recipe, updates the defconfig, adds the h3600 variant to the bbappend
file and selects this as default for the h3600.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 conf/machine/h3600.conf                            |   2 +-
 recipes-kernel/linux/linux-yocto-dev.bbappend      |  16 +-
 ...r-for-Atmel-Microcontroller-on-iPaq-h3xxx.patch | 712 +++++++++++++++++++++
 ...ARM-sa1100-add-Micro-ASIC-platform-device.patch |  73 +++
 ...r-for-microcontroller-keys-on-the-iPaq-h3.patch | 208 ++++++
 ...light-add-driver-for-iPAQ-micro-backlight.patch | 147 +++++
 ...nput-driver-for-touchscreen-on-iPaq-h3xxx.patch | 198 ++++++
 .../0006-leds-add-driver-for-the-iPAQ-micro.patch  | 193 ++++++
 ...-driver-for-battery-reading-on-iPaq-h3xxx.patch | 350 ++++++++++
 .../linux/linux-yocto-dev/h3600/defconfig          |  94 +++
 10 files changed, 1991 insertions(+), 2 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/h3600/0001-MFD-driver-for-Atmel-Microcontroller-on-iPaq-h3xxx.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/h3600/0002-ARM-sa1100-add-Micro-ASIC-platform-device.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/h3600/0003-input-driver-for-microcontroller-keys-on-the-iPaq-h3.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/h3600/0004-fb-backlight-add-driver-for-iPAQ-micro-backlight.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/h3600/0005-input-driver-for-touchscreen-on-iPaq-h3xxx.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/h3600/0006-leds-add-driver-for-the-iPAQ-micro.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/h3600/0007-power-add-driver-for-battery-reading-on-iPaq-h3xxx.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/h3600/defconfig

diff --git a/conf/machine/h3600.conf b/conf/machine/h3600.conf
index 7670c9c0e170..50ffb10fa13c 100644
--- a/conf/machine/h3600.conf
+++ b/conf/machine/h3600.conf
@@ -15,7 +15,7 @@ MACHINE_FEATURES = "touchscreen apm alsa irda usbgadget screen vfat ext2 qvga"
 #
 # Software/packages selection
 #
-PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
+PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-dev"
 KERNEL_IMAGETYPE ?= "zImage"
 # Compression level for 32MB RAM
 XZ_COMPRESSION_LEVEL = "-2e"
diff --git a/recipes-kernel/linux/linux-yocto-dev.bbappend b/recipes-kernel/linux/linux-yocto-dev.bbappend
index 3352291e7dbc..c4e85f9cb819 100644
--- a/recipes-kernel/linux/linux-yocto-dev.bbappend
+++ b/recipes-kernel/linux/linux-yocto-dev.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-dev:${THISDIR}/${PN}:${THISDIR}/files:"
 
-COMPATIBLE_MACHINE .= "|akita|c7x0|collie|h1940|poodle|spitz|tosa"
+COMPATIBLE_MACHINE .= "|akita|c7x0|collie|h1940|h3600|poodle|spitz|tosa"
 
 # Override kernel features
 #KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
@@ -9,6 +9,7 @@ KERNEL_EXTRA_FEATURES_akita ?= ""
 KERNEL_EXTRA_FEATURES_c7x0 ?= ""
 KERNEL_EXTRA_FEATURES_collie ?= ""
 KERNEL_EXTRA_FEATURES_h1940 ?= ""
+KERNEL_EXTRA_FEATURES_h3600 ?= ""
 KERNEL_EXTRA_FEATURES_poodle ?= ""
 KERNEL_EXTRA_FEATURES_spitz ?= ""
 KERNEL_EXTRA_FEATURES_tosa ?= ""
@@ -17,6 +18,7 @@ KMACHINE_akita = "akita"
 KMACHINE_c7x0 = "c7x0"
 KMACHINE_collie = "collie"
 KMACHINE_h1940 = "h1940"
+KMACHINE_h3600 = "h3600"
 KMACHINE_poodle = "poodle"
 KMACHINE_spitz = "spitz"
 KMACHINE_tosa = "tosa"
@@ -53,6 +55,18 @@ SRC_URI_append_h1940 = " \
            file://qvga/logo_linux_clut224.ppm.bz2 \
            "
 
+SRC_URI_append_h3600 = " \
+           file://defconfig \
+           file://0001-MFD-driver-for-Atmel-Microcontroller-on-iPaq-h3xxx.patch \
+           file://0002-ARM-sa1100-add-Micro-ASIC-platform-device.patch \
+           file://0003-input-driver-for-microcontroller-keys-on-the-iPaq-h3.patch \
+           file://0004-fb-backlight-add-driver-for-iPAQ-micro-backlight.patch \
+           file://0005-input-driver-for-touchscreen-on-iPaq-h3xxx.patch \
+           file://0006-leds-add-driver-for-the-iPAQ-micro.patch \
+           file://0007-power-add-driver-for-battery-reading-on-iPaq-h3xxx.patch \
+           file://qvga/logo_linux_clut224.ppm.bz2 \
+           "
+
 SRC_URI_append_poodle = " \
            file://feature-top.scc \
            file://qvga/logo_linux_clut224.ppm.bz2 \
diff --git a/recipes-kernel/linux/linux-yocto-dev/h3600/0001-MFD-driver-for-Atmel-Microcontroller-on-iPaq-h3xxx.patch b/recipes-kernel/linux/linux-yocto-dev/h3600/0001-MFD-driver-for-Atmel-Microcontroller-on-iPaq-h3xxx.patch
new file mode 100644
index 000000000000..2470cdfef2ee
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-dev/h3600/0001-MFD-driver-for-Atmel-Microcontroller-on-iPaq-h3xxx.patch
@@ -0,0 +1,712 @@
+From a2073bd47b86b1ad3ba0600e772cd0f14ba73838 Mon Sep 17 00:00:00 2001
+From: Linus Walleij <linus.walleij@linaro.org>
+Date: Fri, 31 Jan 2014 14:34:35 +0100
+Subject: [PATCH 1/7] MFD: driver for Atmel Microcontroller on iPaq h3xxx
+
+This adds a driver for the Atmel Microcontroller found on the
+iPAQ h3xxx series. This device handles some keys, the
+touchscreen, and the battery monitoring.
+
+This is a port of a driver from handhelds.org 2.6.21 kernel,
+written by Alessandro Gardich based on Andrew Christians
+original HAL-driver. It has been heavily cleaned and
+converted to mfd-core by Dmitry Artamonow and rewritten
+again for the v3.x series kernels by Linus Walleij,
+bringing back some of the functionality lost from Andrew's
+original driver.
+
+Cc: Russell King <linux@arm.linux.org.uk>
+Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Signed-off-by: Alessandro Gardich <gremlin@gremlin.it>
+Signed-off-by: Dmitry Artamonow <mad_soft@inbox.ru>
+Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
+---
+ drivers/mfd/Kconfig            |  10 +
+ drivers/mfd/Makefile           |   1 +
+ drivers/mfd/ipaq-micro.c       | 487 +++++++++++++++++++++++++++++++++++++++++
+ include/linux/mfd/ipaq-micro.h | 148 +++++++++++++
+ 4 files changed, 646 insertions(+)
+ create mode 100644 drivers/mfd/ipaq-micro.c
+ create mode 100644 include/linux/mfd/ipaq-micro.h
+
+diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
+index 49bb445d846a..255807afc582 100644
+--- a/drivers/mfd/Kconfig
++++ b/drivers/mfd/Kconfig
+@@ -242,6 +242,16 @@ config MFD_INTEL_MSIC
+ 	  Passage) chip. This chip embeds audio, battery, GPIO, etc.
+ 	  devices used in Intel Medfield platforms.
+ 
++config MFD_IPAQ_MICRO
++	bool "Atmel Micro ASIC (iPAQ h3100/h3600/h3700) Support"
++	depends on SA1100_H3100 || SA1100_H3600
++	select MFD_CORE
++	help
++	  Select this to get support for the Microcontroller found in
++	  the Compaq iPAQ handheld computers. This is an Atmel
++	  AT90LS8535 microcontroller flashed with a special iPAQ
++	  firmware using the custom protocol implemented in this driver.
++
+ config MFD_JANZ_CMODIO
+ 	tristate "Janz CMOD-IO PCI MODULbus Carrier Board"
+ 	select MFD_CORE
+diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
+index 5aea5ef0a62f..cf8081fcb3ac 100644
+--- a/drivers/mfd/Makefile
++++ b/drivers/mfd/Makefile
+@@ -166,3 +166,4 @@ obj-$(CONFIG_MFD_RETU)		+= retu-mfd.o
+ obj-$(CONFIG_MFD_AS3711)	+= as3711.o
+ obj-$(CONFIG_MFD_AS3722)	+= as3722.o
+ obj-$(CONFIG_MFD_STW481X)	+= stw481x.o
++obj-$(CONFIG_MFD_IPAQ_MICRO)	+= ipaq-micro.o
+diff --git a/drivers/mfd/ipaq-micro.c b/drivers/mfd/ipaq-micro.c
+new file mode 100644
+index 000000000000..f71dffdd3f0f
+--- /dev/null
++++ b/drivers/mfd/ipaq-micro.c
+@@ -0,0 +1,487 @@
++/*
++ * Compaq iPAQ h3xxx Atmel microcontroller companion support
++ *
++ * This is an Atmel AT90LS8535 with a special flashed-in firmware that
++ * implements the special protocol used by this driver.
++ *
++ * based on previous kernel 2.4 version by Andrew Christian
++ * Author : Alessandro Gardich <gremlin@gremlin.it>
++ * Author : Dmitry Artamonow <mad_soft@inbox.ru>
++ * Author : Linus Walleij <linus.walleij@linaro.org>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ */
++
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/interrupt.h>
++#include <linux/pm.h>
++#include <linux/delay.h>
++#include <linux/device.h>
++#include <linux/platform_device.h>
++#include <linux/io.h>
++#include <linux/mfd/core.h>
++#include <linux/mfd/ipaq-micro.h>
++#include <linux/string.h>
++#include <linux/random.h>
++#include <linux/slab.h>
++#include <linux/list.h>
++
++#include <mach/hardware.h>
++
++static void ipaq_micro_trigger_tx(struct ipaq_micro *micro)
++{
++	struct ipaq_micro_txdev *tx = &micro->tx;
++	struct ipaq_micro_msg *msg = micro->msg;
++	int i, bp;
++	u8 checksum;
++	u32 val;
++
++	bp = 0;
++	tx->buf[bp++] = CHAR_SOF;
++
++	checksum = ((msg->id & 0x0f) << 4) | (msg->tx_len & 0x0f);
++	tx->buf[bp++] = checksum;
++
++	for (i = 0; i < msg->tx_len; i++) {
++		tx->buf[bp++] = msg->tx_data[i];
++		checksum += msg->tx_data[i];
++	}
++
++	tx->buf[bp++] = checksum;
++	tx->len = bp;
++	tx->index = 0;
++	print_hex_dump(KERN_DEBUG, "data: ", DUMP_PREFIX_OFFSET, 16, 1,
++		       tx->buf, tx->len, true);
++
++	/* Enable interrupt */
++	val = readl(micro->base + UTCR3);
++	val |= UTCR3_TIE;
++	writel(val, micro->base + UTCR3);
++}
++
++int ipaq_micro_tx_msg(struct ipaq_micro *micro, struct ipaq_micro_msg *msg)
++{
++	unsigned long flags;
++
++	dev_dbg(micro->dev, "TX msg: %02x, %d bytes\n", msg->id, msg->tx_len);
++
++	spin_lock_irqsave(&micro->lock, flags);
++	if (micro->msg) {
++		list_add_tail(&msg->node, &micro->queue);
++		spin_unlock_irqrestore(&micro->lock, flags);
++		return 0;
++	}
++	micro->msg = msg;
++	ipaq_micro_trigger_tx(micro);
++	spin_unlock_irqrestore(&micro->lock, flags);
++	return 0;
++}
++EXPORT_SYMBOL(ipaq_micro_tx_msg);
++
++static void micro_rx_msg(struct ipaq_micro *micro, u8 id, int len, u8 *data)
++{
++	int i;
++
++	dev_dbg(micro->dev, "RX msg: %02x, %d bytes\n", id, len);
++
++	spin_lock(&micro->lock);
++	switch (id) {
++	case MSG_VERSION:
++	case MSG_EEPROM_READ:
++	case MSG_EEPROM_WRITE:
++	case MSG_BACKLIGHT:
++	case MSG_NOTIFY_LED:
++	case MSG_THERMAL_SENSOR:
++	case MSG_BATTERY:
++		/* Handle synchronous messages */
++		if (micro->msg && micro->msg->id == id) {
++			struct ipaq_micro_msg *msg = micro->msg;
++
++			memcpy(msg->rx_data, data, len);
++			msg->rx_len = len;
++			complete(&micro->msg->ack);
++			if (!list_empty(&micro->queue)) {
++				micro->msg = list_entry(micro->queue.next,
++							struct ipaq_micro_msg,
++							node);
++				list_del_init(&micro->msg->node);
++				ipaq_micro_trigger_tx(micro);
++			} else
++				micro->msg = NULL;
++			dev_dbg(micro->dev, "OK RX message 0x%02x\n", id);
++		} else {
++			dev_err(micro->dev,
++				"out of band RX message 0x%02x\n", id);
++			if(!micro->msg)
++				dev_info(micro->dev, "no message queued\n");
++			else
++				dev_info(micro->dev, "expected message %02x\n",
++					 micro->msg->id);
++		}
++		break;
++	case MSG_KEYBOARD:
++		if (micro->key)
++			micro->key(micro->key_data, len, data);
++		else
++			dev_dbg(micro->dev, "key message ignored, no handle \n");
++		break;
++	case MSG_TOUCHSCREEN:
++		if (micro->ts)
++			micro->ts(micro->ts_data, len, data);
++		else
++			dev_dbg(micro->dev, "touchscreen message ignored, no handle \n");
++		break;
++	default:
++		dev_err(micro->dev,
++			"unknown msg %d [%d] ", id, len);
++		for (i = 0; i < len; ++i)
++			pr_cont("0x%02x ", data[i]);
++		pr_cont("\n");
++	}
++	spin_unlock(&micro->lock);
++}
++
++static void micro_process_char(struct ipaq_micro *micro, u8 ch)
++{
++	struct ipaq_micro_rxdev *rx = &micro->rx;
++
++	switch (rx->state) {
++	case STATE_SOF:	/* Looking for SOF */
++		if (ch == CHAR_SOF)
++			rx->state = STATE_ID; /* Next byte is the id and len */
++		break;
++	case STATE_ID: /* Looking for id and len byte */
++		rx->id = (ch & 0xf0) >> 4 ;
++		rx->len = (ch & 0x0f);
++		rx->index = 0;
++		rx->chksum = ch;
++		rx->state = (rx->len > 0) ? STATE_DATA : STATE_CHKSUM;
++		break;
++	case STATE_DATA: /* Looking for 'len' data bytes */
++		rx->chksum += ch;
++		rx->buf[rx->index] = ch;
++		if (++rx->index == rx->len)
++			rx->state = STATE_CHKSUM;
++		break;
++	case STATE_CHKSUM: /* Looking for the checksum */
++		if (ch == rx->chksum)
++			micro_rx_msg(micro, rx->id, rx->len, rx->buf);
++		rx->state = STATE_SOF;
++		break;
++	}
++}
++
++static void micro_rx_chars(struct ipaq_micro *micro)
++{
++	u32 status, ch;
++
++	while ((status = readl(micro->base + UTSR1)) & UTSR1_RNE) {
++		ch = readl(micro->base + UTDR);
++		if (status & UTSR1_PRE)
++			dev_err(micro->dev, "rx: parity error\n");
++		else if (status & UTSR1_FRE)
++			dev_err(micro->dev, "rx: framing error\n");
++		else if (status & UTSR1_ROR)
++			dev_err(micro->dev, "rx: overrun error\n");
++		micro_process_char(micro, ch);
++	}
++}
++
++static void ipaq_micro_get_version(struct ipaq_micro *micro)
++{
++	struct ipaq_micro_msg msg = {
++		.id = MSG_VERSION,
++	};
++
++	ipaq_micro_tx_msg_sync(micro, &msg);
++	if (msg.rx_len == 4) {
++		memcpy(micro->version, msg.rx_data, 4);
++		micro->version[4] = '\0';
++	} else if (msg.rx_len == 9) {
++		memcpy(micro->version, msg.rx_data, 4);
++		micro->version[4] = '\0';
++		/* Bytes 4-7 are "pack", byte 8 is "boot type" */
++	} else {
++		dev_err(micro->dev,
++			"illegal version message %d bytes\n", msg.rx_len);
++	}
++}
++
++static void ipaq_micro_eeprom_read(struct ipaq_micro *micro,
++				   u8 address, u8 len, u8 *data)
++{
++	struct ipaq_micro_msg msg = {
++		.id = MSG_EEPROM_READ,
++	};
++	u8 i;
++
++	for (i = 0; i < len; i++) {
++		msg.tx_data[0] = address + i;
++		msg.tx_data[1] = 1;
++		msg.tx_len = 2;
++		ipaq_micro_tx_msg_sync(micro, &msg);
++		memcpy(data + (i * 2), msg.rx_data, 2);
++	}
++}
++
++static char *ipaq_micro_str(u8 *wchar, u8 len)
++{
++	char retstr[256];
++	u8 i;
++
++	for (i = 0; i < len / 2; i++)
++		retstr[i] = wchar[i * 2];
++	return kstrdup(retstr, GFP_KERNEL);
++}
++
++static u16 ipaq_micro_to_u16(u8 *data)
++{
++	return data[1] << 8 | data[0];
++}
++
++static void ipaq_micro_eeprom_dump(struct ipaq_micro *micro)
++{
++	u8 dump[256];
++	char *str;
++
++	ipaq_micro_eeprom_read(micro, 0, 128, dump);
++	str = ipaq_micro_str(dump, 10);
++	if (str) {
++		dev_info(micro->dev, "HM version %s\n", str);
++		kfree(str);
++	}
++	str = ipaq_micro_str(dump+10, 40);
++	if (str) {
++		dev_info(micro->dev, "serial number: %s\n", str);
++		/* Feed the random pool with this */
++		add_device_randomness(str, strlen(str));
++		kfree(str);
++	}
++	str = ipaq_micro_str(dump+50, 20);
++	if (str) {
++		dev_info(micro->dev, "module ID: %s\n", str);
++		kfree(str);
++	}
++	str = ipaq_micro_str(dump+70, 10);
++	if (str) {
++		dev_info(micro->dev, "product revision: %s\n", str);
++		kfree(str);
++	}
++	dev_info(micro->dev, "product ID: %u\n", ipaq_micro_to_u16(dump+80));
++	dev_info(micro->dev, "frame rate: %u fps\n",
++		 ipaq_micro_to_u16(dump+82));
++	dev_info(micro->dev, "page mode: %u\n", ipaq_micro_to_u16(dump+84));
++	dev_info(micro->dev, "country ID: %u\n", ipaq_micro_to_u16(dump+86));
++	dev_info(micro->dev, "color display: %s\n",
++		 ipaq_micro_to_u16(dump+88) ? "yes" : "no");
++	dev_info(micro->dev, "ROM size: %u MiB\n", ipaq_micro_to_u16(dump+90));
++	dev_info(micro->dev, "RAM size: %u KiB\n", ipaq_micro_to_u16(dump+92));
++	dev_info(micro->dev, "screen: %u x %u\n",
++		 ipaq_micro_to_u16(dump+94), ipaq_micro_to_u16(dump+96));
++	print_hex_dump(KERN_DEBUG, "eeprom: ", DUMP_PREFIX_OFFSET, 16, 1,
++		       dump, 256, true);
++
++}
++
++static void micro_tx_chars(struct ipaq_micro *micro)
++{
++	struct ipaq_micro_txdev *tx = &micro->tx;
++	u32 val;
++
++	while ((tx->index < tx->len) &&
++	       (readl(micro->base + UTSR1) & UTSR1_TNF)) {
++		writel(tx->buf[tx->index], micro->base + UTDR);
++		tx->index++;
++	}
++
++	/* Stop interrupts */
++	val = readl(micro->base + UTCR3);
++	val &= ~UTCR3_TIE;
++	writel(val, micro->base + UTCR3);
++}
++
++static void micro_reset_comm(struct ipaq_micro *micro)
++{
++	struct ipaq_micro_rxdev *rx = &micro->rx;
++	u32 val;
++
++	if (micro->msg)
++		complete(&micro->msg->ack);
++
++	/* Initialize Serial channel protocol frame */
++	rx->state = STATE_SOF;  /* Reset the state machine */
++
++	/* Set up interrupts */
++	writel(0x01, micro->sdlc + 0x0); /* Select UART mode */
++
++	/* Clean up CR3 */
++	writel(0x0, micro->base + UTCR3);
++
++	/* Format: 8N1 */
++	writel(UTCR0_8BitData | UTCR0_1StpBit, micro->base + UTCR0);
++
++	/* Baud rate: 115200 */
++	writel(0x0, micro->base + UTCR1);
++	writel(0x1, micro->base + UTCR2);
++
++	/* Clear SR0 */
++	writel(0xff, micro->base + UTSR0);
++
++	/* Enable RX int, disable TX int */
++	writel(UTCR3_TXE | UTCR3_RXE | UTCR3_RIE, micro->base + UTCR3);
++	val = readl(micro->base + UTCR3);
++	val &= ~UTCR3_TIE;
++	writel(val, micro->base + UTCR3);
++}
++
++static irqreturn_t micro_serial_isr(int irq, void *dev_id)
++{
++	struct ipaq_micro *micro = dev_id;
++	struct ipaq_micro_txdev *tx = &micro->tx;
++	u32 status;
++
++	status = readl(micro->base + UTSR0);
++	do {
++		if (status & (UTSR0_RID | UTSR0_RFS)) {
++			if (status & UTSR0_RID)
++				/* Clear the Receiver IDLE bit */
++				writel(UTSR0_RID, micro->base + UTSR0);
++			micro_rx_chars(micro);
++		}
++
++		/* Clear break bits */
++		if (status & (UTSR0_RBB | UTSR0_REB))
++			writel(status & (UTSR0_RBB | UTSR0_REB),
++			       micro->base + UTSR0);
++
++		if (status & UTSR0_TFS)
++			micro_tx_chars(micro);
++
++		status = readl(micro->base + UTSR0);
++
++	} while (((tx->index < tx->len) && (status & UTSR0_TFS)) ||
++		 (status & (UTSR0_RFS | UTSR0_RID)));
++
++	return IRQ_HANDLED;
++}
++
++static struct mfd_cell micro_cells[] = {
++	{ .name = "ipaq-micro-backlight", },
++	{ .name = "ipaq-micro-battery", },
++	{ .name = "ipaq-micro-keys", },
++	{ .name = "ipaq-micro-ts", },
++	{ .name = "ipaq-micro-leds", },
++};
++
++static int micro_suspend(struct device *dev)
++{
++	return 0;
++}
++
++static int micro_resume(struct device *dev)
++{
++	struct ipaq_micro *micro = dev_get_drvdata(dev);
++
++	micro_reset_comm(micro);
++	mdelay(10);
++
++	return 0;
++}
++
++static int micro_probe(struct platform_device *pdev)
++{
++	struct ipaq_micro *micro;
++	struct resource *res;
++	int ret;
++	int irq;
++
++	micro = devm_kzalloc(&pdev->dev, sizeof(*micro), GFP_KERNEL);
++	if (!micro)
++		return -ENOMEM;
++
++	micro->dev = &pdev->dev;
++
++	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (!res)
++		return -EINVAL;
++
++	micro->base = devm_request_and_ioremap(&pdev->dev, res);
++	if (!micro->base)
++		return -ENOMEM;
++
++	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
++	if (!res)
++		return -EINVAL;
++
++	micro->sdlc = devm_request_and_ioremap(&pdev->dev, res);
++	if (!micro->sdlc)
++		return -ENOMEM;
++
++	micro_reset_comm(micro);
++
++	irq = platform_get_irq(pdev, 0);
++	if (!irq)
++		return -EINVAL;
++	ret = devm_request_irq(&pdev->dev, irq, micro_serial_isr,
++			       IRQF_SHARED, "ipaq-micro",
++			       micro);
++	if (ret) {
++		dev_err(&pdev->dev, "unable to grab serial port IRQ\n");
++		return ret;
++	} else
++		dev_info(&pdev->dev, "grabbed serial port IRQ\n");
++
++	spin_lock_init(&micro->lock);
++	INIT_LIST_HEAD(&micro->queue);
++	platform_set_drvdata(pdev, micro);
++
++	ret = mfd_add_devices(&pdev->dev, pdev->id, micro_cells,
++			      ARRAY_SIZE(micro_cells), NULL, 0, NULL);
++	if (ret) {
++		dev_err(&pdev->dev, "error adding MFD cells");
++		return ret;
++	}
++
++	/* Check version */
++	ipaq_micro_get_version(micro);
++	dev_info(&pdev->dev, "Atmel micro ASIC version %s\n", micro->version);
++	ipaq_micro_eeprom_dump(micro);
++
++	return 0;
++}
++
++static int micro_remove(struct platform_device *pdev)
++{
++	struct ipaq_micro *micro = platform_get_drvdata(pdev);
++	u32 val;
++
++	mfd_remove_devices(&pdev->dev);
++
++	val = readl(micro->base + UTCR3);
++	val &= ~(UTCR3_RXE | UTCR3_RIE); /* disable receive interrupt */
++	val &= ~(UTCR3_TXE | UTCR3_TIE); /* disable transmit interrupt */
++	writel(val, micro->base + UTCR3);
++
++	return 0;
++}
++
++static const struct dev_pm_ops micro_dev_pm_ops = {
++	SET_SYSTEM_SLEEP_PM_OPS(micro_suspend, micro_resume)
++};
++
++static struct platform_driver micro_device_driver = {
++	.driver   = {
++		.name	= "ipaq-h3xxx-micro",
++		.pm	= &micro_dev_pm_ops,
++	},
++	.probe    = micro_probe,
++	.remove   = micro_remove,
++	/* .shutdown = micro_suspend, // FIXME */
++};
++module_platform_driver(micro_device_driver);
++
++MODULE_LICENSE("GPL");
++MODULE_DESCRIPTION("driver for iPAQ Atmel micro core and backlight");
+diff --git a/include/linux/mfd/ipaq-micro.h b/include/linux/mfd/ipaq-micro.h
+new file mode 100644
+index 000000000000..5c4d29f6674f
+--- /dev/null
++++ b/include/linux/mfd/ipaq-micro.h
+@@ -0,0 +1,148 @@
++/*
++ * Header file for the compaq Micro MFD
++ */
++
++#ifndef _MFD_IPAQ_MICRO_H_
++#define _MFD_IPAQ_MICRO_H_
++
++#include <linux/spinlock.h>
++#include <linux/completion.h>
++#include <linux/list.h>
++
++#define TX_BUF_SIZE	32
++#define RX_BUF_SIZE	16
++#define CHAR_SOF	0x02
++
++/*
++ * These are the different messages that can be sent to the microcontroller
++ * to control various aspects.
++ */
++#define MSG_VERSION		0x0
++#define MSG_KEYBOARD		0x2
++#define MSG_TOUCHSCREEN		0x3
++#define MSG_EEPROM_READ		0x4
++#define MSG_EEPROM_WRITE	0x5
++#define MSG_THERMAL_SENSOR	0x6
++#define MSG_NOTIFY_LED		0x8
++#define MSG_BATTERY		0x9
++#define MSG_SPI_READ		0xb
++#define MSG_SPI_WRITE		0xc
++#define MSG_BACKLIGHT		0xd /* H3600 only */
++#define MSG_CODEC_CTRL		0xe /* H3100 only */
++#define MSG_DISPLAY_CTRL	0xf /* H3100 only */
++
++/* state of receiver parser */
++enum rx_state {
++	STATE_SOF = 0,     /* Next byte should be start of frame */
++	STATE_ID,          /* Next byte is ID & message length   */
++	STATE_DATA,        /* Next byte is a data byte           */
++	STATE_CHKSUM       /* Next byte should be checksum       */
++};
++
++/**
++ * struct ipaq_micro_txdev - TX state
++ * @len: length of message in TX buffer
++ * @index: current index into TX buffer
++ * @buf: TX buffer
++ */
++struct ipaq_micro_txdev {
++	u8 len;
++	u8 index;
++	u8 buf[TX_BUF_SIZE];
++};
++
++/**
++ * struct ipaq_micro_rxdev - RX state
++ * @state: context of RX state machine
++ * @chksum: calculated checksum
++ * @id: message ID from packet
++ * @len: RX buffer length
++ * @index: RX buffer index
++ * @buf: RX buffer
++ */
++struct ipaq_micro_rxdev {
++	enum rx_state state;
++	unsigned char chksum;
++	u8            id;
++	unsigned int  len;
++	unsigned int  index;
++	u8            buf[RX_BUF_SIZE];
++};
++
++/**
++ * struct ipaq_micro_msg - message to the iPAQ microcontroller
++ * @id: 4-bit ID of the message
++ * @tx_len: length of TX data
++ * @tx_data: TX data to send
++ * @rx_len: length of receieved RX data
++ * @rx_data: RX data to recieve
++ * @ack: a completion that will be completed when RX is complete
++ * @node: list node if message gets queued
++ */
++struct ipaq_micro_msg {
++	u8 id;
++	u8 tx_len;
++	u8 tx_data[TX_BUF_SIZE];
++	u8 rx_len;
++	u8 rx_data[RX_BUF_SIZE];
++	struct completion ack;
++	struct list_head node;
++};
++
++/**
++ * struct ipaq_micro - iPAQ microcontroller state
++ * @dev: corresponding platform device
++ * @base: virtual memory base for underlying serial device
++ * @sdlc: virtual memory base for Synchronous Data Link Controller
++ * @version: version string
++ * @tx: TX state
++ * @rx: RX state
++ * @lock: lock for this state container
++ * @msg: current message
++ * @queue: message queue
++ * @key: callback for asynchronous key events
++ * @key_data: data to pass along with key events
++ * @ts: callback for asynchronous touchscreen events
++ * @ts_data: data to pass along with key events
++ */
++struct ipaq_micro {
++	struct device *dev;
++	void __iomem *base;
++	void __iomem *sdlc;
++	char version[5];
++	struct ipaq_micro_txdev tx;	/* transmit ISR state */
++	struct ipaq_micro_rxdev rx;	/* receive ISR state */
++	spinlock_t lock;
++	struct ipaq_micro_msg *msg;
++	struct list_head queue;
++	void (*key) (void *data, int len, unsigned char *rxdata);
++	void *key_data;
++	void (*ts) (void *data, int len, unsigned char *rxdata);
++	void *ts_data;
++};
++
++extern int
++ipaq_micro_tx_msg(struct ipaq_micro *micro, struct ipaq_micro_msg *msg);
++
++static inline int
++ipaq_micro_tx_msg_sync(struct ipaq_micro *micro,
++		       struct ipaq_micro_msg *msg)
++{
++	int ret;
++
++	init_completion(&msg->ack);
++	ret = ipaq_micro_tx_msg(micro, msg);
++	wait_for_completion(&msg->ack);
++
++	return ret;
++}
++
++static inline int
++ipaq_micro_tx_msg_async(struct ipaq_micro *micro,
++			struct ipaq_micro_msg *msg)
++{
++	init_completion(&msg->ack);
++	return ipaq_micro_tx_msg(micro, msg);
++}
++
++#endif /* _MFD_IPAQ_MICRO_H_ */
+-- 
+1.9.0
+
diff --git a/recipes-kernel/linux/linux-yocto-dev/h3600/0002-ARM-sa1100-add-Micro-ASIC-platform-device.patch b/recipes-kernel/linux/linux-yocto-dev/h3600/0002-ARM-sa1100-add-Micro-ASIC-platform-device.patch
new file mode 100644
index 000000000000..8bb2439cc921
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-dev/h3600/0002-ARM-sa1100-add-Micro-ASIC-platform-device.patch
@@ -0,0 +1,73 @@
+From b8d45042ceaae1b0a5a86c8a0a9c1da7aae5c248 Mon Sep 17 00:00:00 2001
+From: Linus Walleij <linus.walleij@linaro.org>
+Date: Thu, 17 Oct 2013 15:03:17 +0200
+Subject: [PATCH 2/7] ARM: sa1100: add Micro ASIC platform device
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
+index f17e7382242a..814dcecf00c4 100644
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
+@@ -248,9 +249,23 @@ static struct platform_device h3xxx_keys = {
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
+1.9.0
+
diff --git a/recipes-kernel/linux/linux-yocto-dev/h3600/0003-input-driver-for-microcontroller-keys-on-the-iPaq-h3.patch b/recipes-kernel/linux/linux-yocto-dev/h3600/0003-input-driver-for-microcontroller-keys-on-the-iPaq-h3.patch
new file mode 100644
index 000000000000..cb080e8d1edd
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-dev/h3600/0003-input-driver-for-microcontroller-keys-on-the-iPaq-h3.patch
@@ -0,0 +1,208 @@
+From 96394b690b27fd3b4175b290a179e5e4e9138085 Mon Sep 17 00:00:00 2001
+From: Dmitry Artamonow <mad_soft@inbox.ru>
+Date: Sat, 21 Mar 2009 16:22:16 +0300
+Subject: [PATCH 3/7] input: driver for microcontroller keys on the iPaq h3xxx
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
+index a673c9f3a0b9..8d4892dfa6e2 100644
+--- a/drivers/input/keyboard/Kconfig
++++ b/drivers/input/keyboard/Kconfig
+@@ -554,6 +554,13 @@ config KEYBOARD_DAVINCI
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
+index a699b6172303..e776af737804 100644
+--- a/drivers/input/keyboard/Makefile
++++ b/drivers/input/keyboard/Makefile
+@@ -21,6 +21,7 @@ obj-$(CONFIG_KEYBOARD_TCA6416)		+= tca6416-keypad.o
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
+1.9.0
+
diff --git a/recipes-kernel/linux/linux-yocto-dev/h3600/0004-fb-backlight-add-driver-for-iPAQ-micro-backlight.patch b/recipes-kernel/linux/linux-yocto-dev/h3600/0004-fb-backlight-add-driver-for-iPAQ-micro-backlight.patch
new file mode 100644
index 000000000000..2c81a9b26fd1
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-dev/h3600/0004-fb-backlight-add-driver-for-iPAQ-micro-backlight.patch
@@ -0,0 +1,147 @@
+From 2444e6fcd6c313e3cfdee58d692fe88a4bbc8fb8 Mon Sep 17 00:00:00 2001
+From: Linus Walleij <linus.walleij@linaro.org>
+Date: Fri, 8 Nov 2013 10:09:13 +0100
+Subject: [PATCH 4/7] fb: backlight: add driver for iPAQ micro backlight
+
+This adds a driver for the backlight controlled by the microcontroller
+on the Compaq iPAQ series of handheld computers: h3100, h3600
+and h3700.
+
+Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
+---
+ drivers/video/backlight/Kconfig         |  9 ++++
+ drivers/video/backlight/Makefile        |  1 +
+ drivers/video/backlight/ipaq_micro_bl.c | 89 +++++++++++++++++++++++++++++++++
+ 3 files changed, 99 insertions(+)
+ create mode 100644 drivers/video/backlight/ipaq_micro_bl.c
+
+diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
+index 5a3eb2ecb525..ed2d61062907 100644
+--- a/drivers/video/backlight/Kconfig
++++ b/drivers/video/backlight/Kconfig
+@@ -207,6 +207,15 @@ config BACKLIGHT_GENERIC
+ 	  known as the Corgi backlight driver. If you have a Sharp Zaurus
+ 	  SL-C7xx, SL-Cxx00 or SL-6000x say y.
+ 
++config BACKLIGHT_IPAQ_MICRO
++	tristate "iPAQ microcontroller backlight driver"
++	depends on MFD_IPAQ_MICRO
++	default y
++	help
++	  Say y to enable the backlight driver for Compaq iPAQ handheld
++	  computers. Say yes if you have one of the h3100/h3600/h3700
++	  machines.
++
+ config BACKLIGHT_LM3533
+ 	tristate "Backlight Driver for LM3533"
+ 	depends on BACKLIGHT_CLASS_DEVICE
+diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
+index bb820024f346..a9ea34a39cad 100644
+--- a/drivers/video/backlight/Makefile
++++ b/drivers/video/backlight/Makefile
+@@ -36,6 +36,7 @@ obj-$(CONFIG_BACKLIGHT_GENERIC)		+= generic_bl.o
+ obj-$(CONFIG_BACKLIGHT_GPIO)		+= gpio_backlight.o
+ obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
+ obj-$(CONFIG_BACKLIGHT_HP700)		+= jornada720_bl.o
++obj-$(CONFIG_BACKLIGHT_IPAQ_MICRO)	+= ipaq_micro_bl.o
+ obj-$(CONFIG_BACKLIGHT_LM3533)		+= lm3533_bl.o
+ obj-$(CONFIG_BACKLIGHT_LM3630A)		+= lm3630a_bl.o
+ obj-$(CONFIG_BACKLIGHT_LM3639)		+= lm3639_bl.o
+diff --git a/drivers/video/backlight/ipaq_micro_bl.c b/drivers/video/backlight/ipaq_micro_bl.c
+new file mode 100644
+index 000000000000..b7ec8c453b61
+--- /dev/null
++++ b/drivers/video/backlight/ipaq_micro_bl.c
+@@ -0,0 +1,89 @@
++/*
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ * iPAQ microcontroller backlight support
++ * Author : Linus Walleij <linus.walleij@linaro.org>
++ */
++
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/platform_device.h>
++#include <linux/backlight.h>
++#include <linux/mfd/ipaq-micro.h>
++#include <linux/fb.h>
++#include <linux/err.h>
++
++static int micro_bl_update_status(struct backlight_device *bd)
++{
++	struct ipaq_micro *micro = dev_get_drvdata(&bd->dev);
++	int intensity = bd->props.brightness;
++	struct ipaq_micro_msg msg = {
++		.id = MSG_BACKLIGHT,
++		.tx_len = 3,
++	};
++
++	if (bd->props.power != FB_BLANK_UNBLANK)
++		intensity = 0;
++	if (bd->props.state & BL_CORE_FBBLANK)
++		intensity = 0;
++	if (bd->props.state & BL_CORE_SUSPENDED)
++		intensity = 0;
++
++	msg.tx_data[0] = 0x01;
++	msg.tx_data[1] = intensity > 0 ? 1 : 0;
++	msg.tx_data[2] = intensity;
++	return ipaq_micro_tx_msg_sync(micro, &msg);
++}
++
++static const struct backlight_ops micro_bl_ops = {
++	.options = BL_CORE_SUSPENDRESUME,
++	.update_status  = micro_bl_update_status,
++};
++
++static struct backlight_properties micro_bl_props = {
++	.type = BACKLIGHT_RAW,
++	.max_brightness = 255,
++	.power = FB_BLANK_UNBLANK,
++	.brightness = 64,
++};
++
++static int micro_backlight_probe(struct platform_device *pdev)
++{
++	struct backlight_device *bd;
++	struct ipaq_micro *micro = dev_get_drvdata(pdev->dev.parent);
++
++	bd = devm_backlight_device_register(
++		&pdev->dev,
++		"ipaq-micro-backlight",
++		&pdev->dev,
++		micro,
++		&micro_bl_ops,
++		&micro_bl_props);
++	if (IS_ERR(bd))
++		return PTR_ERR(bd);
++	platform_set_drvdata(pdev, bd);
++	backlight_update_status(bd);
++	dev_info(&pdev->dev, "iPAQ micro backlight driver\n");
++
++	return 0;
++}
++
++static int micro_backlight_remove(struct platform_device *pdev)
++{
++	return 0;
++}
++
++struct platform_driver micro_backlight_device_driver = {
++	.driver = {
++		.name    = "ipaq-micro-backlight",
++	},
++	.probe   = micro_backlight_probe,
++	.remove  = micro_backlight_remove,
++};
++module_platform_driver(micro_backlight_device_driver);
++
++MODULE_LICENSE("GPL");
++MODULE_DESCRIPTION("driver for iPAQ Atmel micro backlight");
++MODULE_ALIAS("platform:ipaq-micro-backlight");
+-- 
+1.9.0
+
diff --git a/recipes-kernel/linux/linux-yocto-dev/h3600/0005-input-driver-for-touchscreen-on-iPaq-h3xxx.patch b/recipes-kernel/linux/linux-yocto-dev/h3600/0005-input-driver-for-touchscreen-on-iPaq-h3xxx.patch
new file mode 100644
index 000000000000..96f640d4915b
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-dev/h3600/0005-input-driver-for-touchscreen-on-iPaq-h3xxx.patch
@@ -0,0 +1,198 @@
+From 4f2952cd1fa1fcfd49de628dcba97a758f81ac3a Mon Sep 17 00:00:00 2001
+From: Dmitry Artamonow <mad_soft@inbox.ru>
+Date: Sat, 21 Mar 2009 16:27:19 +0300
+Subject: [PATCH 5/7] input: driver for touchscreen on iPaq h3xxx
+
+This adds a driver for the touchscreen connected to the
+Atmel microcontroller on the iPAQ h3xxx series.
+
+Based on a driver from handhelds.org 2.6.21 kernel, written
+by Alessandro GARDICH.
+
+Signed-off-by: Alessandro GARDICH <gremlin@gremlin.it>
+Signed-off-by: Dmitry Artamonow <mad_soft@inbox.ru>
+Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
+---
+ drivers/input/touchscreen/Kconfig         |   8 ++
+ drivers/input/touchscreen/Makefile        |   1 +
+ drivers/input/touchscreen/ipaq-micro-ts.c | 137 ++++++++++++++++++++++++++++++
+ 3 files changed, 146 insertions(+)
+ create mode 100644 drivers/input/touchscreen/ipaq-micro-ts.c
+
+diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
+index 07e9e82029d1..118d71b39861 100644
+--- a/drivers/input/touchscreen/Kconfig
++++ b/drivers/input/touchscreen/Kconfig
+@@ -466,6 +466,14 @@ config TOUCHSCREEN_HP7XX
+ 	  To compile this driver as a module, choose M here: the
+ 	  module will be called jornada720_ts.
+ 
++config TOUCHSCREEN_IPAQ_MICRO
++	tristate "HP iPAQ Atmel Micro ASIC touchscreen"
++	depends on MFD_IPAQ_MICRO
++	help
++	  This enables support for the touchscreen attached to
++	  the Atmel Micro peripheral controller on iPAQ h3100/h3600/h3700
++
++
+ config TOUCHSCREEN_HTCPEN
+ 	tristate "HTC Shift X9500 touchscreen"
+ 	depends on ISA
+diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
+index 62801f213346..5f754c4f87bb 100644
+--- a/drivers/input/touchscreen/Makefile
++++ b/drivers/input/touchscreen/Makefile
+@@ -46,6 +46,7 @@ obj-$(CONFIG_TOUCHSCREEN_MTOUCH)	+= mtouch.o
+ obj-$(CONFIG_TOUCHSCREEN_MK712)		+= mk712.o
+ obj-$(CONFIG_TOUCHSCREEN_HP600)		+= hp680_ts_input.o
+ obj-$(CONFIG_TOUCHSCREEN_HP7XX)		+= jornada720_ts.o
++obj-$(CONFIG_TOUCHSCREEN_IPAQ_MICRO)	+= ipaq-micro-ts.o
+ obj-$(CONFIG_TOUCHSCREEN_HTCPEN)	+= htcpen.o
+ obj-$(CONFIG_TOUCHSCREEN_USB_COMPOSITE)	+= usbtouchscreen.o
+ obj-$(CONFIG_TOUCHSCREEN_PCAP)		+= pcap_ts.o
+diff --git a/drivers/input/touchscreen/ipaq-micro-ts.c b/drivers/input/touchscreen/ipaq-micro-ts.c
+new file mode 100644
+index 000000000000..9c5e1b62d192
+--- /dev/null
++++ b/drivers/input/touchscreen/ipaq-micro-ts.c
+@@ -0,0 +1,137 @@
++/*
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ * h3600 atmel micro companion support, touchscreen subdevice
++ * Author : Alessandro Gardich <gremlin@gremlin.it>
++ * Author : Linus Walleij <linus.walleij@linaro.org>
++ *
++ */
++
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/interrupt.h>
++#include <linux/pm.h>
++#include <linux/delay.h>
++#include <linux/device.h>
++#include <linux/input.h>
++#include <linux/platform_device.h>
++#include <linux/slab.h>
++#include <linux/mfd/ipaq-micro.h>
++
++struct touchscreen_data {
++	struct input_dev *input;
++	struct ipaq_micro *micro;
++};
++
++static void micro_ts_receive(void *data, int len, unsigned char *msg)
++{
++	struct touchscreen_data *ts = data;
++
++	if (len == 4) {
++		input_report_abs(ts->input, ABS_X, (msg[2]<<8)+msg[3]);
++		input_report_abs(ts->input, ABS_Y, (msg[0]<<8)+msg[1]);
++		input_report_abs(ts->input, ABS_PRESSURE, 1);
++		input_report_key(ts->input, BTN_TOUCH, 0);
++	}
++	if (len == 0) {
++		input_report_abs(ts->input, ABS_X, 0);
++		input_report_abs(ts->input, ABS_Y, 0);
++		input_report_abs(ts->input, ABS_PRESSURE, 0);
++		input_report_key(ts->input, BTN_TOUCH, 1);
++	}
++	input_sync(ts->input);
++}
++
++
++static int micro_ts_probe(struct platform_device *pdev)
++{
++	struct touchscreen_data *ts;
++	int ret;
++
++	ts = devm_kzalloc(&pdev->dev, sizeof(*ts), GFP_KERNEL);
++	if (!ts)
++		return -ENOMEM;
++	ts->micro = dev_get_drvdata(pdev->dev.parent);
++
++	platform_set_drvdata(pdev, ts);
++
++	ts->input = input_allocate_device();
++
++	ts->input->evbit[0] = BIT(EV_ABS);
++	ts->input->absbit[0] = BIT(ABS_X) | BIT(ABS_Y) | BIT(ABS_PRESSURE);
++	input_set_abs_params(ts->input, ABS_X, 0, 1023, 0, 0);
++	input_set_abs_params(ts->input, ABS_Y, 0, 1023, 0, 0);
++	input_set_abs_params(ts->input, ABS_PRESSURE, 0x0, 0x1, 0, 0);
++
++	ts->input->name = "ipaq micro ts";
++	/* ts->input->private = ts; */
++
++	ret = input_register_device(ts->input);
++	if (ret) {
++		dev_err(&pdev->dev, "error registering touch input\n");
++		return ret;
++	}
++
++	spin_lock(&ts->micro->lock);
++	ts->micro->ts = micro_ts_receive;
++	ts->micro->ts_data = ts;
++	spin_unlock(&ts->micro->lock);
++
++	dev_info(&pdev->dev, "iPAQ micro touchscreen\n");
++	return 0;
++}
++
++static int micro_ts_remove(struct platform_device *pdev)
++{
++	struct touchscreen_data *ts = platform_get_drvdata(pdev);
++
++	spin_lock(&ts->micro->lock);
++	ts->micro->ts = NULL;
++	ts->micro->ts_data = NULL;
++	spin_unlock(&ts->micro->lock);
++	input_unregister_device(ts->input);
++
++	return 0;
++}
++
++static int micro_ts_suspend(struct device *dev)
++{
++	struct touchscreen_data *ts = dev_get_drvdata(dev);
++
++	spin_lock(&ts->micro->lock);
++	ts->micro->ts = NULL;
++	ts->micro->ts_data = NULL;
++	spin_unlock(&ts->micro->lock);
++	return 0;
++}
++
++static int micro_ts_resume(struct device *dev)
++{
++	struct touchscreen_data *ts = dev_get_drvdata(dev);
++
++	spin_lock(&ts->micro->lock);
++	ts->micro->ts = micro_ts_receive;
++	ts->micro->ts_data = ts;
++	spin_unlock(&ts->micro->lock);
++	return 0;
++}
++
++static const struct dev_pm_ops micro_ts_dev_pm_ops = {
++	SET_SYSTEM_SLEEP_PM_OPS(micro_ts_suspend, micro_ts_resume)
++};
++
++struct platform_driver micro_ts_device_driver = {
++	.driver  = {
++		.name    = "ipaq-micro-ts",
++		.pm	= &micro_ts_dev_pm_ops,
++	},
++	.probe   = micro_ts_probe,
++	.remove  = micro_ts_remove,
++};
++module_platform_driver(micro_ts_device_driver);
++
++MODULE_LICENSE("GPL");
++MODULE_DESCRIPTION("driver for iPAQ Atmel micro touchscreen");
++MODULE_ALIAS("platform:ipaq-micro-ts");
+-- 
+1.9.0
+
diff --git a/recipes-kernel/linux/linux-yocto-dev/h3600/0006-leds-add-driver-for-the-iPAQ-micro.patch b/recipes-kernel/linux/linux-yocto-dev/h3600/0006-leds-add-driver-for-the-iPAQ-micro.patch
new file mode 100644
index 000000000000..212d3660ee45
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-dev/h3600/0006-leds-add-driver-for-the-iPAQ-micro.patch
@@ -0,0 +1,193 @@
+From b4c8a1cdfbbaf615a6d9da3e46f1b788fc0f1568 Mon Sep 17 00:00:00 2001
+From: Linus Walleij <linus.walleij@linaro.org>
+Date: Thu, 31 Oct 2013 10:53:06 -0700
+Subject: [PATCH 6/7] leds: add driver for the iPAQ micro
+
+This adds a driver for the iPAQ microcontroller LED.
+
+Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
+---
+ drivers/leds/Kconfig           |   7 +++
+ drivers/leds/Makefile          |   1 +
+ drivers/leds/leds-ipaq-micro.c | 139 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 147 insertions(+)
+ create mode 100644 drivers/leds/leds-ipaq-micro.c
+
+diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
+index 72156c123033..39dae8a15297 100644
+--- a/drivers/leds/Kconfig
++++ b/drivers/leds/Kconfig
+@@ -143,6 +143,13 @@ config LEDS_SUNFIRE
+ 	  This option enables support for the Left, Middle, and Right
+ 	  LEDs on the I/O and CPU boards of SunFire UltraSPARC servers.
+ 
++config LEDS_IPAQ_MICRO
++	tristate "LED Support for the Compaq iPAQ h3xxx"
++	depends on MFD_IPAQ_MICRO
++	help
++	  Choose this option if you want to use the notification LED on
++	  Compaq/HP iPAQ h3100 and h3600.
++
+ config LEDS_HP6XX
+ 	tristate "LED Support for the HP Jornada 6xx"
+ 	depends on LEDS_CLASS
+diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
+index 3cd76dbd9be2..db0e6e856ca9 100644
+--- a/drivers/leds/Makefile
++++ b/drivers/leds/Makefile
+@@ -31,6 +31,7 @@ obj-$(CONFIG_LEDS_LP8501)		+= leds-lp8501.o
+ obj-$(CONFIG_LEDS_LP8788)		+= leds-lp8788.o
+ obj-$(CONFIG_LEDS_TCA6507)		+= leds-tca6507.o
+ obj-$(CONFIG_LEDS_CLEVO_MAIL)		+= leds-clevo-mail.o
++obj-$(CONFIG_LEDS_IPAQ_MICRO)		+= leds-ipaq-micro.o
+ obj-$(CONFIG_LEDS_HP6XX)		+= leds-hp6xx.o
+ obj-$(CONFIG_LEDS_OT200)		+= leds-ot200.o
+ obj-$(CONFIG_LEDS_FSG)			+= leds-fsg.o
+diff --git a/drivers/leds/leds-ipaq-micro.c b/drivers/leds/leds-ipaq-micro.c
+new file mode 100644
+index 000000000000..a716ec27f066
+--- /dev/null
++++ b/drivers/leds/leds-ipaq-micro.c
+@@ -0,0 +1,139 @@
++/*
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ * h3xxx atmel micro companion support, notification LED subdevice
++ *
++ * Author : Linus Walleij <linus.walleij@linaro.org>
++ */
++
++#include <linux/module.h>
++#include <linux/platform_device.h>
++#include <linux/mfd/ipaq-micro.h>
++#include <linux/leds.h>
++
++#define LED_YELLOW	0x00
++#define LED_GREEN	0x01
++
++#define LED_EN          (1 << 4)        /* LED ON/OFF 0:off, 1:on                       */
++#define LED_AUTOSTOP    (1 << 5)        /* LED ON/OFF auto stop set 0:disable, 1:enable */
++#define LED_ALWAYS      (1 << 6)        /* LED Interrupt Mask 0:No mask, 1:mask         */
++
++static void micro_leds_brightness_set(struct led_classdev *led_cdev,
++				      enum led_brightness value)
++{
++	struct ipaq_micro *micro = dev_get_drvdata(led_cdev->dev->parent->parent);
++	/*
++	 * In this message:
++	 * Byte 0 = LED color: 0 = yellow, 1 = green
++	 *          yellow LED is always ~30 blinks per minute
++	 * Byte 1 = duration (flags?) appears to be ignored
++	 * Byte 2 = green ontime in 1/10 sec (deciseconds)
++	 *          1 = 1/10 second
++	 *          0 = 256/10 second
++	 * Byte 3 = green offtime in 1/10 sec (deciseconds)
++	 *          1 = 1/10 second
++	 *          0 = 256/10 seconds
++	 */
++	struct ipaq_micro_msg msg = {
++		.id = MSG_NOTIFY_LED,
++		.tx_len = 4,
++	};
++
++	msg.tx_data[0] = LED_GREEN;
++	msg.tx_data[1] = 0;
++	if (value) {
++		msg.tx_data[2] = 0; /* Duty cycle 256 */
++		msg.tx_data[3] = 1;
++	} else {
++		msg.tx_data[2] = 1;
++		msg.tx_data[3] = 0; /* Duty cycle 256 */
++	}
++	ipaq_micro_tx_msg_sync(micro, &msg);
++}
++
++/* Maximum duty cycle in ms 256/10 sec = 25600 ms */
++#define IPAQ_LED_MAX_DUTY 25600
++
++static int micro_leds_blink_set(struct led_classdev *led_cdev,
++				unsigned long *delay_on,
++				unsigned long *delay_off)
++{
++	struct ipaq_micro *micro = dev_get_drvdata(led_cdev->dev->parent->parent);
++	/*
++	 * In this message:
++	 * Byte 0 = LED color: 0 = yellow, 1 = green
++	 *          yellow LED is always ~30 blinks per minute
++	 * Byte 1 = duration (flags?) appears to be ignored
++	 * Byte 2 = green ontime in 1/10 sec (deciseconds)
++	 *          1 = 1/10 second
++	 *          0 = 256/10 second
++	 * Byte 3 = green offtime in 1/10 sec (deciseconds)
++	 *          1 = 1/10 second
++	 *          0 = 256/10 seconds
++	 */
++	struct ipaq_micro_msg msg = {
++		.id = MSG_NOTIFY_LED,
++		.tx_len = 4,
++	};
++
++	msg.tx_data[0] = LED_GREEN;
++        if (*delay_on > IPAQ_LED_MAX_DUTY ||
++	    *delay_off > IPAQ_LED_MAX_DUTY)
++                return -EINVAL;
++
++        if (*delay_on == 0 && *delay_off == 0) {
++                *delay_on = 100;
++                *delay_off = 100;
++        }
++
++	msg.tx_data[1] = 0;
++	if (*delay_on >= IPAQ_LED_MAX_DUTY)
++		msg.tx_data[2] = 0;
++	else
++		msg.tx_data[2] = (u8) DIV_ROUND_CLOSEST(*delay_on, 100);
++	if (*delay_off >= IPAQ_LED_MAX_DUTY)
++		msg.tx_data[3] = 0;
++	else
++		msg.tx_data[3] = (u8) DIV_ROUND_CLOSEST(*delay_off, 100);
++	return ipaq_micro_tx_msg_sync(micro, &msg);
++}
++
++static struct led_classdev micro_led = {
++	.name			= "notify",
++	.brightness_set		= micro_leds_brightness_set,
++	.blink_set		= micro_leds_blink_set,
++	.flags			= LED_CORE_SUSPENDRESUME,
++};
++
++static int micro_leds_probe(struct platform_device *pdev)
++{
++	int ret;
++
++	ret = led_classdev_register(&pdev->dev, &micro_led);
++	if (ret)
++		dev_err(&pdev->dev, "registering led failed: %d\n", ret);
++	dev_info(&pdev->dev, "iPAQ micro notification LED driver\n");
++
++	return 0;
++}
++
++static int micro_leds_remove(struct platform_device *pdev)
++{
++	led_classdev_unregister(&micro_led);
++	return 0;
++}
++
++struct platform_driver micro_leds_device_driver = {
++	.driver = {
++		.name    = "ipaq-micro-leds",
++	},
++	.probe   = micro_leds_probe,
++	.remove  = micro_leds_remove,
++};
++module_platform_driver(micro_leds_device_driver);
++
++MODULE_LICENSE("GPL");
++MODULE_DESCRIPTION("driver for iPAQ Atmel micro leds");
++MODULE_ALIAS("platform:ipaq-micro-leds");
+-- 
+1.9.0
+
diff --git a/recipes-kernel/linux/linux-yocto-dev/h3600/0007-power-add-driver-for-battery-reading-on-iPaq-h3xxx.patch b/recipes-kernel/linux/linux-yocto-dev/h3600/0007-power-add-driver-for-battery-reading-on-iPaq-h3xxx.patch
new file mode 100644
index 000000000000..fb34e623acd2
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-dev/h3600/0007-power-add-driver-for-battery-reading-on-iPaq-h3xxx.patch
@@ -0,0 +1,350 @@
+From e6d787e84661a0bc3992fcf1d0c77075ca9b3b90 Mon Sep 17 00:00:00 2001
+From: Dmitry Artamonow <mad_soft@inbox.ru>
+Date: Sat, 21 Mar 2009 16:28:50 +0300
+Subject: [PATCH 7/7] power: add driver for battery reading on iPaq h3xxx
+
+This adds a driver for reading the battery status of the
+battery connected to the Atmel microcontroller on the
+iPAQ h3xxx series.
+
+Based on a driver from handhelds.org 2.6.21 kernel, written
+by Alessandro GARDICH.
+
+Signed-off-by: Dmitry Artamonow <mad_soft@inbox.ru>
+Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
+---
+ drivers/power/Kconfig              |   7 +
+ drivers/power/Makefile             |   1 +
+ drivers/power/ipaq_micro_battery.c | 290 +++++++++++++++++++++++++++++++++++++
+ 3 files changed, 298 insertions(+)
+ create mode 100644 drivers/power/ipaq_micro_battery.c
+
+diff --git a/drivers/power/Kconfig b/drivers/power/Kconfig
+index ba6975123071..73cfcdf28a36 100644
+--- a/drivers/power/Kconfig
++++ b/drivers/power/Kconfig
+@@ -137,6 +137,13 @@ config BATTERY_COLLIE
+ 	  Say Y to enable support for the battery on the Sharp Zaurus
+ 	  SL-5500 (collie) models.
+ 
++config BATTERY_IPAQ_MICRO
++	tristate "iPAQ Atmel Micro ASIC battery driver"
++	depends on MFD_IPAQ_MICRO
++	help
++	  Choose this option if you want to monitor battery status on
++	  Compaq/HP iPAQ h3100 and h3600.
++
+ config BATTERY_WM97XX
+ 	bool "WM97xx generic battery driver"
+ 	depends on TOUCHSCREEN_WM97XX=y
+diff --git a/drivers/power/Makefile b/drivers/power/Makefile
+index ee54a3e4c90a..dfa894273926 100644
+--- a/drivers/power/Makefile
++++ b/drivers/power/Makefile
+@@ -25,6 +25,7 @@ obj-$(CONFIG_BATTERY_PMU)	+= pmu_battery.o
+ obj-$(CONFIG_BATTERY_OLPC)	+= olpc_battery.o
+ obj-$(CONFIG_BATTERY_TOSA)	+= tosa_battery.o
+ obj-$(CONFIG_BATTERY_COLLIE)	+= collie_battery.o
++obj-$(CONFIG_BATTERY_IPAQ_MICRO) += ipaq_micro_battery.o
+ obj-$(CONFIG_BATTERY_WM97XX)	+= wm97xx_battery.o
+ obj-$(CONFIG_BATTERY_SBS)	+= sbs-battery.o
+ obj-$(CONFIG_BATTERY_BQ27x00)	+= bq27x00_battery.o
+diff --git a/drivers/power/ipaq_micro_battery.c b/drivers/power/ipaq_micro_battery.c
+new file mode 100644
+index 000000000000..f875137e4d9c
+--- /dev/null
++++ b/drivers/power/ipaq_micro_battery.c
+@@ -0,0 +1,290 @@
++/*
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ * h3xxx atmel micro companion support, battery subdevice
++ * based on previous kernel 2.4 version
++ * Author : Alessandro Gardich <gremlin@gremlin.it>
++ * Author : Linus Walleij <linus.walleij@linaro.org>
++ *
++ */
++
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/platform_device.h>
++#include <linux/mfd/ipaq-micro.h>
++#include <linux/power_supply.h>
++#include <linux/workqueue.h>
++
++#define BATT_PERIOD 100000 /* 10 seconds in milliseconds */
++
++#define MICRO_BATT_CHEM_ALKALINE	0x01
++#define MICRO_BATT_CHEM_NICD		0x02
++#define MICRO_BATT_CHEM_NIMH		0x03
++#define MICRO_BATT_CHEM_LION		0x04
++#define MICRO_BATT_CHEM_LIPOLY		0x05
++#define MICRO_BATT_CHEM_NOT_INSTALLED	0x06
++#define MICRO_BATT_CHEM_UNKNOWN		0xff
++
++#define MICRO_BATT_STATUS_HIGH		0x01
++#define MICRO_BATT_STATUS_LOW		0x02
++#define MICRO_BATT_STATUS_CRITICAL	0x04
++#define MICRO_BATT_STATUS_CHARGING	0x08
++#define MICRO_BATT_STATUS_CHARGEMAIN	0x10
++#define MICRO_BATT_STATUS_DEAD		0x20 /* Battery will not charge */
++#define MICRO_BATT_STATUS_NOTINSTALLED	0x20 /* For expansion pack batteries */
++#define MICRO_BATT_STATUS_FULL		0x40 /* Battery fully charged */
++#define MICRO_BATT_STATUS_NOBATTERY	0x80
++#define MICRO_BATT_STATUS_UNKNOWN	0xff
++
++struct micro_battery {
++	struct ipaq_micro *micro;
++	struct workqueue_struct *wq;
++	struct delayed_work update;
++	u8 ac;
++	u8 chemistry;
++	unsigned int voltage;
++	u16 temperature;
++	u8 flag;
++};
++
++static void micro_battery_work(struct work_struct *work)
++{
++	struct micro_battery *mb = container_of(work,
++				struct micro_battery, update.work);
++	struct ipaq_micro_msg msg_battery = {
++		.id = MSG_BATTERY,
++	};
++	struct ipaq_micro_msg msg_sensor = {
++		.id = MSG_THERMAL_SENSOR,
++	};
++
++	/* First send battery message */
++	ipaq_micro_tx_msg_sync(mb->micro, &msg_battery);
++	if (msg_battery.rx_len < 4)
++		pr_info("ERROR");
++
++	/*
++	 * Returned message format:
++	 * byte 0:   0x00 = Not plugged in
++	 *           0x01 = AC adapter plugged in
++	 * byte 1:   chemistry
++	 * byte 2:   voltage LSB
++	 * byte 3:   voltage MSB
++	 * byte 4:   flags
++	 * byte 5-9: same for battery 2
++	 */
++	mb->ac = msg_battery.rx_data[0];
++	mb->chemistry = msg_battery.rx_data[1];
++	mb->voltage = ((((unsigned short)msg_battery.rx_data[3] << 8) +
++			msg_battery.rx_data[2]) * 5000L) * 1000 / 1024;
++	mb->flag = msg_battery.rx_data[4];
++
++	if (msg_battery.rx_len == 9)
++		pr_debug("second battery ignored\n");
++
++	/* Then read the sensor */
++	ipaq_micro_tx_msg_sync(mb->micro, &msg_sensor);
++	mb->temperature = msg_sensor.rx_data[1] << 8 | msg_sensor.rx_data[0];
++
++	queue_delayed_work(mb->wq, &mb->update, msecs_to_jiffies(BATT_PERIOD));
++}
++
++static int get_capacity(struct power_supply *b)
++{
++	struct micro_battery *mb = dev_get_drvdata(b->dev->parent);
++
++	switch (mb->flag & 0x07) {
++	case MICRO_BATT_STATUS_HIGH:
++		return 100;
++		break;
++	case MICRO_BATT_STATUS_LOW:
++		return 50;
++		break;
++	case MICRO_BATT_STATUS_CRITICAL:
++		return 5;
++		break;
++	default:
++		break;
++	}
++	return 0;
++}
++
++static int get_status(struct power_supply *b)
++{
++	struct micro_battery *mb = dev_get_drvdata(b->dev->parent);
++
++	if (mb->flag == MICRO_BATT_STATUS_UNKNOWN)
++		return POWER_SUPPLY_STATUS_UNKNOWN;
++
++	if (mb->flag & MICRO_BATT_STATUS_FULL)
++		return POWER_SUPPLY_STATUS_FULL;
++
++	if ((mb->flag & MICRO_BATT_STATUS_CHARGING) ||
++		(mb->flag & MICRO_BATT_STATUS_CHARGEMAIN))
++		return POWER_SUPPLY_STATUS_CHARGING;
++
++	return POWER_SUPPLY_STATUS_DISCHARGING;
++}
++
++static int micro_batt_get_property(struct power_supply *b,
++					enum power_supply_property psp,
++					union power_supply_propval *val)
++{
++	struct micro_battery *mb = dev_get_drvdata(b->dev->parent);
++
++	switch (psp) {
++	case POWER_SUPPLY_PROP_TECHNOLOGY:
++		switch (mb->chemistry) {
++		case MICRO_BATT_CHEM_NICD:
++			val->intval = POWER_SUPPLY_TECHNOLOGY_NiCd;
++			break;
++		case MICRO_BATT_CHEM_NIMH:
++			val->intval = POWER_SUPPLY_TECHNOLOGY_NiMH;
++			break;
++		case MICRO_BATT_CHEM_LION:
++			val->intval = POWER_SUPPLY_TECHNOLOGY_LION;
++			break;
++		case MICRO_BATT_CHEM_LIPOLY:
++			val->intval = POWER_SUPPLY_TECHNOLOGY_LIPO;
++			break;
++		default:
++			val->intval = POWER_SUPPLY_TECHNOLOGY_UNKNOWN;
++			break;
++		};
++		break;
++	case POWER_SUPPLY_PROP_STATUS:
++		val->intval = get_status(b);
++		break;
++	case POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN:
++		val->intval = 4700000;
++		break;
++	case POWER_SUPPLY_PROP_CAPACITY:
++		val->intval = get_capacity(b);
++		break;
++	case POWER_SUPPLY_PROP_TEMP:
++		val->intval = mb->temperature;
++		break;
++	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
++		val->intval = mb->voltage;
++		break;
++	default:
++		return -EINVAL;
++	};
++
++	return 0;
++}
++
++static int micro_ac_get_property(struct power_supply *b,
++				 enum power_supply_property psp,
++				 union power_supply_propval *val)
++{
++	struct micro_battery *mb = dev_get_drvdata(b->dev->parent);
++
++	switch (psp) {
++	case POWER_SUPPLY_PROP_ONLINE:
++		val->intval = mb->ac;
++		break;
++	default:
++		return -EINVAL;
++	};
++
++	return 0;
++}
++
++static enum power_supply_property micro_batt_props[] = {
++	POWER_SUPPLY_PROP_TECHNOLOGY,
++	POWER_SUPPLY_PROP_STATUS,
++	POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN,
++	POWER_SUPPLY_PROP_CAPACITY,
++	POWER_SUPPLY_PROP_TEMP,
++	POWER_SUPPLY_PROP_VOLTAGE_NOW,
++};
++
++static struct power_supply micro_battery = {
++	.name			= "main-battery",
++	.type			= POWER_SUPPLY_TYPE_BATTERY,
++	.properties		= micro_batt_props,
++	.num_properties		= ARRAY_SIZE(micro_batt_props),
++	.get_property		= micro_batt_get_property,
++	.use_for_apm		= 1,
++};
++
++static enum power_supply_property micro_ac_props[] = {
++	POWER_SUPPLY_PROP_ONLINE,
++};
++
++static struct power_supply micro_ac = {
++	.name			= "ac",
++	.type			= POWER_SUPPLY_TYPE_MAINS,
++	.properties		= micro_ac_props,
++	.num_properties		= ARRAY_SIZE(micro_ac_props),
++	.get_property		= micro_ac_get_property,
++};
++
++static int micro_batt_probe(struct platform_device *pdev)
++{
++	struct micro_battery *mb;
++
++	mb = devm_kzalloc(&pdev->dev, sizeof(*mb), GFP_KERNEL);
++	if (!mb)
++		return -ENOMEM;
++
++	mb->micro = dev_get_drvdata(pdev->dev.parent);
++	mb->wq = create_singlethread_workqueue("ipaq-battery-wq");
++	INIT_DELAYED_WORK(&mb->update, micro_battery_work);
++	platform_set_drvdata(pdev, mb);
++	queue_delayed_work(mb->wq, &mb->update, 1);
++	power_supply_register(&pdev->dev, &micro_battery);
++	power_supply_register(&pdev->dev, &micro_ac);
++
++	dev_info(&pdev->dev, "iPAQ micro battery driver\n");
++	return 0;
++}
++
++static int micro_batt_remove(struct platform_device *pdev)
++
++{
++	struct micro_battery *mb = platform_get_drvdata(pdev);
++
++	power_supply_unregister(&micro_ac);
++	power_supply_unregister(&micro_battery);
++	cancel_delayed_work_sync(&mb->update);
++
++	return 0;
++}
++
++static int micro_batt_suspend(struct device *dev)
++{
++	struct micro_battery *mb = dev_get_drvdata(dev);
++
++	cancel_delayed_work_sync(&mb->update);
++	return 0;
++}
++
++static int micro_batt_resume(struct device *dev)
++{
++	struct micro_battery *mb = dev_get_drvdata(dev);
++
++	queue_delayed_work(mb->wq, &mb->update, msecs_to_jiffies(BATT_PERIOD));
++	return 0;
++}
++
++static const struct dev_pm_ops micro_batt_dev_pm_ops = {
++	SET_SYSTEM_SLEEP_PM_OPS(micro_batt_suspend, micro_batt_resume)
++};
++
++struct platform_driver micro_batt_device_driver = {
++	.driver		= {
++		.name	= "ipaq-micro-battery",
++		.pm	= &micro_batt_dev_pm_ops,
++	},
++	.probe		= micro_batt_probe,
++	.remove		= micro_batt_remove,
++};
++module_platform_driver(micro_batt_device_driver);
++
++MODULE_LICENSE("GPL");
++MODULE_DESCRIPTION("driver for iPAQ Atmel micro battery");
++MODULE_ALIAS("platform:battery-ipaq-micro");
+-- 
+1.9.0
+
diff --git a/recipes-kernel/linux/linux-yocto-dev/h3600/defconfig b/recipes-kernel/linux/linux-yocto-dev/h3600/defconfig
new file mode 100644
index 000000000000..07968783c075
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-dev/h3600/defconfig
@@ -0,0 +1,94 @@
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
-- 
1.9.0


