Return-Path: <linus.walleij@linaro.org>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id D4D046D12A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Nov 2013 13:02:49 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id q58so4597574wes.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Nov 2013 05:02:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=a36rJ9OxNzi7eYhXMn0gAxuaF2frxXtMy4bSiuCkbbY=;
	b=XuVdnQlHHX1aHQNFGSI1cQP0PZUcI1SfRJ5hkY42jIZv1klZAv3pkbtGiRbw+0mU6M
	l+96YDMlvtIZoKWJth5CHuojYETa7RHfspwhoC/BdPzB41oeC7U6+ejURiSfgqmseJ6h
	YLbf5D+JFgbFatmU/sWDdOTajNfiw/D+PHEULukrlJtYzJAFKZYRk1+hFatkYVHloMji
	9XuT/L0DRm28PlSa/sn2CGBjfOKwIRWUbV/LYnMl/TtPjBifYrbrkqGgmg/dojz9vhm5
	oIzKALYeXblfTuYRDDpV7T5+1Zoe8gyx+J+uLMfw2HpIBBFtoNM8pSceEnDZhtTxzh9P
	FgxQ==
X-Gm-Message-State: ALoCoQl3mf4pJDthsbDL6HpOSJ4J7nXS+Nt1mU7XD+Tj5cNbZtlEERYxvT9oDb9umANoVxdOmZIf
X-Received: by 10.180.24.137 with SMTP id u9mr12372289wif.5.1384174970989;
	Mon, 11 Nov 2013 05:02:50 -0800 (PST)
Received: from localhost.localdomain ([85.235.11.236])
	by mx.google.com with ESMTPSA id
	ft19sm34015364wic.5.2013.11.11.05.02.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Nov 2013 05:02:50 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Nov 2013 14:02:44 +0100
Message-Id: <1384174964-5006-1-git-send-email-linus.walleij@linaro.org>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-handheld] [PATCH 1/3] h3600: add rebased microcontroller patches
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
X-List-Received-Date: Mon, 11 Nov 2013 13:02:50 -0000

This adds a rebased set of the microcontroller patches previously
carried in the 2.6.x build. Upstreaming of this functionality
is ongoing.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 ...r-for-Atmel-Microcontroller-on-iPaq-h3xxx.patch | 527 +++++++++++++++++++++
 ...ARM-sa1100-add-Micro-ASIC-platform-device.patch |  71 +++
 ...r-for-microcontroller-keys-on-the-iPaq-h3.patch | 189 ++++++++
 ...nput-driver-for-touchscreen-on-iPaq-h3xxx.patch | 199 ++++++++
 ...-driver-for-battery-reading-on-iPaq-h3xxx.patch | 295 ++++++++++++
 .../0006-leds-add-driver-for-the-iPAQ-micro.patch  | 189 ++++++++
 ...light-add-driver-for-iPAQ-micro-backlight.patch | 142 ++++++
 recipes-kernel/linux/linux-yocto-handhelds.inc     |   7 +
 8 files changed, 1619 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/h3600/0001-MFD-driver-for-Atmel-Microcontroller-on-iPaq-h3xxx.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/h3600/0002-ARM-sa1100-add-Micro-ASIC-platform-device.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/h3600/0003-input-driver-for-microcontroller-keys-on-the-iPaq-h3.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/h3600/0004-input-driver-for-touchscreen-on-iPaq-h3xxx.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/h3600/0005-power-add-driver-for-battery-reading-on-iPaq-h3xxx.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/h3600/0006-leds-add-driver-for-the-iPAQ-micro.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/h3600/0007-fb-backlight-add-driver-for-iPAQ-micro-backlight.patch

diff --git a/recipes-kernel/linux/linux-yocto-3.10/h3600/0001-MFD-driver-for-Atmel-Microcontroller-on-iPaq-h3xxx.patch b/recipes-kernel/linux/linux-yocto-3.10/h3600/0001-MFD-driver-for-Atmel-Microcontroller-on-iPaq-h3xxx.patch
new file mode 100644
index 000000000000..e05660597a7b
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.10/h3600/0001-MFD-driver-for-Atmel-Microcontroller-on-iPaq-h3xxx.patch
@@ -0,0 +1,527 @@
+From a843ffb026e18e8912167692119ffe1298e81f7e Mon Sep 17 00:00:00 2001
+From: Dmitry Artamonow <mad_soft@inbox.ru>
+Date: Sat, 21 Mar 2009 16:06:56 +0300
+Subject: [PATCH 1/7] MFD: driver for Atmel Microcontroller on iPaq h3xxx
+
+This adds a driver for the Atmel Microcontroller found on the
+iPAQ h3xxx series. This device handles some keys, the
+touchscreen, and the battery monitoring.
+
+This is a port of a driver from handhelds.org 2.6.21 kernel,
+written by Alessandro GARDICH. It has been heavily cleaned and
+converted to mfd-core by Dmitry Artamonow and rewritten
+again for the v3.x series kernels by Linus Walleij.
+
+Signed-off-by: Alessandro GARDICH <gremlin@gremlin.it>
+Signed-off-by: Dmitry Artamonow <mad_soft@inbox.ru>
+Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
+---
+ drivers/mfd/Kconfig            |  10 ++
+ drivers/mfd/Makefile           |   1 +
+ drivers/mfd/ipaq-micro.c       | 383 +++++++++++++++++++++++++++++++++++++++++
+ include/linux/mfd/ipaq-micro.h |  73 ++++++++
+ 4 files changed, 467 insertions(+)
+ create mode 100644 drivers/mfd/ipaq-micro.c
+ create mode 100644 include/linux/mfd/ipaq-micro.h
+
+diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
+index d54e985748b7..38db97060c4a 100644
+--- a/drivers/mfd/Kconfig
++++ b/drivers/mfd/Kconfig
+@@ -223,6 +223,16 @@ config MFD_INTEL_MSIC
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
+index 718e94a2a9a7..4fddef75bdad 100644
+--- a/drivers/mfd/Makefile
++++ b/drivers/mfd/Makefile
+@@ -155,3 +155,4 @@ obj-$(CONFIG_MFD_LM3533)	+= lm3533-core.o lm3533-ctrlbank.o
+ obj-$(CONFIG_VEXPRESS_CONFIG)	+= vexpress-config.o vexpress-sysreg.o
+ obj-$(CONFIG_MFD_RETU)		+= retu-mfd.o
+ obj-$(CONFIG_MFD_AS3711)	+= as3711.o
++obj-$(CONFIG_MFD_IPAQ_MICRO)	+= ipaq-micro.o
+diff --git a/drivers/mfd/ipaq-micro.c b/drivers/mfd/ipaq-micro.c
+new file mode 100644
+index 000000000000..92deae2114e1
+--- /dev/null
++++ b/drivers/mfd/ipaq-micro.c
+@@ -0,0 +1,383 @@
++/*
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ * h3xxx Atmel microcontroller companion support
++ *
++ * This is an Atmel AT90LS8535 with a special flashed-in firmware that
++ * implements the special protocol used by this driver.
++ *
++ * based on previous kernel 2.4 version by Andrew Christian
++ * Author : Alessandro Gardich <gremlin@gremlin.it>
++ * Author : Dmitry Artamonow <mad_soft@inbox.ru>
++ * Author : Linus Walleij <linus.walleij@linaro.org>
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
++
++#include <mach/hardware.h>
++
++static void micro_rx_msg(struct ipaq_micro *micro, int id, int len, u8 *data)
++{
++	int i;
++
++	spin_lock(&micro->lock);
++	switch (id) {
++	case MSG_VERSION:
++		if (len == 4) {
++			memcpy(micro->version, data, 4);
++			micro->version[4] = '\0';
++		} else if (len == 9) {
++			memcpy(micro->version, data, 4);
++			micro->version[4] = '\0';
++			/* Bytes 4-7 are "pack", byte 8 is "boot type" */
++		} else {
++			dev_err(micro->dev,
++				"illegal version message %d bytes\n", len);
++		}
++		break;
++	case MSG_BACKLIGHT:
++		/* empty ack, just ignore */
++		break;
++	case MSG_KEYBOARD:
++		if (micro->h_key != NULL)
++			micro->h_key(len, data);
++		else
++			dev_err(micro->dev, "ipaq micro : key message ignored, "
++				"no handle \n");
++		break;
++	case MSG_TOUCHSCREEN:
++		if (micro->h_ts != NULL)
++			micro->h_ts(len, data);
++		else
++			dev_err(micro->dev, "ipaq micro : touchscreen message"
++				" ignored, no handle \n");
++		break;
++	case MSG_THERMAL_SENSOR:
++		if (micro->h_temp != NULL)
++			micro->h_temp(len, data);
++		else
++			dev_err(micro->dev, "ipaq micro : temperature message"
++				" ignored, no handle \n");
++		break;
++	case MSG_NOTIFY_LED:
++		/* Empty ack, just ignore */
++		break;
++	case MSG_BATTERY:
++		if (micro->h_batt != NULL)
++			micro->h_batt(len, data);
++		else
++			dev_err(micro->dev, "ipaq micro : battery message"
++				" ignored, no handle \n");
++		break;
++	default:
++		dev_err(micro->dev,
++			"ipaq micro : unknown msg %d [%d] ", id, len);
++		for (i = 0; i < len; ++i)
++			pr_cont("0x%02x ", data[i]);
++		pr_cont("\n");
++	}
++	complete(&micro->msg_ack);
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
++	unsigned int status, ch;
++
++	while ((status = Ser1UTSR1) & UTSR1_RNE) {
++		ch = Ser1UTDR;
++		if (status & UTSR1_PRE)
++			dev_err(micro->dev, "ipaq micro_rx : parity error\n");
++		else if (status & UTSR1_FRE)
++			dev_err(micro->dev, "ipaq micro_rx : framing error\n");
++		else if (status & UTSR1_ROR)
++			dev_err(micro->dev, "ipaq micro_rx : overrun error\n");
++		micro_process_char(micro, ch);
++	}
++}
++
++int ipaq_micro_tx_msg(struct ipaq_micro *micro, unsigned char id,
++		      unsigned char len, unsigned char *data)
++{
++	struct ipaq_micro_txdev *tx = &micro->tx;
++	int free_space;
++	int i;
++	u8 checksum;
++	int head, tail;
++
++	/* After TX, an interrupt will be triggered that completes */
++	init_completion(&micro->msg_ack);
++
++	tail = atomic_read(&tx->tail);
++	head = atomic_read(&tx->head);
++
++	free_space = (head >= tail) ? (TX_BUF_SIZE - head + tail - 1) \
++					: (tail - head - 1);
++
++	if (free_space < len + 2) {
++		dev_err(micro->dev, "%s : no avaiable space on tx buffer.",
++			__func__);
++		return -EIO;
++	}
++
++	tx->buf[head] = (u8) CHAR_SOF;
++	head = ((head+1) % TX_BUF_SIZE);
++
++	checksum = ((id & 0x0f) << 4) | (len & 0x0f);
++	tx->buf[head] = checksum;
++	head = ((head+1) % TX_BUF_SIZE);
++
++	for (i = 0; i < len; ++i) {
++		tx->buf[head] = data[i];
++		head = ((head + 1) % TX_BUF_SIZE);
++		checksum += data[i];
++	}
++
++	tx->buf[head] = checksum;
++	head = ((head + 1) % TX_BUF_SIZE);
++
++	atomic_set(&tx->head, head);
++
++	Ser1UTCR3 |= UTCR3_TIE; /* enable interrupt */
++
++	return 0;
++}
++EXPORT_SYMBOL(ipaq_micro_tx_msg);
++
++static void ipaq_micro_get_version(struct ipaq_micro *micro)
++{
++	ipaq_micro_tx_msg(micro, MSG_VERSION, 0, NULL);
++	wait_for_completion(&micro->msg_ack);
++}
++
++static void ipaq_micro_eeprom_read(struct ipaq_micro *micro,
++				   u16 address, u8 *data, u16 len)
++{
++	int i;
++
++	for (i = 0; i < len; i++) {
++		u8 data[2];
++		u16 read_sz = len - i;
++
++		data[0] = 0;
++
++		ipaq_micro_tx_msg(micro, MSG_EEPROM_READ, 2, NULL);
++	}
++}
++
++static void micro_tx_chars(struct ipaq_micro *micro)
++{
++	struct ipaq_micro_txdev *tx = &micro->tx;
++	int head, tail;
++
++	head = atomic_read(&tx->head);
++	tail = atomic_read(&tx->tail);
++
++	while ((head != tail) && (Ser1UTSR1 & UTSR1_TNF)) {
++		Ser1UTDR = tx->buf[tail];
++		tail = ((tail+1) % TX_BUF_SIZE);
++	}
++	atomic_set(&tx->tail, tail);
++
++	if (tail == head) /* Stop interrupts */
++		Ser1UTCR3 &= ~UTCR3_TIE;
++}
++
++static void micro_reset_comm(struct ipaq_micro *micro)
++{
++	struct ipaq_micro_rxdev *rx = &micro->rx;
++	struct ipaq_micro_txdev *tx = &micro->tx;
++
++	/* Initialize Serial channel protocol frame */
++	rx->state = STATE_SOF;  /* Reset the state machine */
++
++	atomic_set(&tx->head, 0);
++	atomic_set(&tx->tail, 0);
++
++	/* Set up interrupts */
++	Ser1SDCR0 = 0x1;				/* Select UART mode */
++
++	Ser1UTCR3 = 0;					/* Clean up CR3 */
++	Ser1UTCR0 = UTCR0_8BitData | UTCR0_1StpBit;	/* Format: 8N1 */
++	Ser1UTCR1 = 0;					/* Baud rate: 115200 */
++	Ser1UTCR2 = 0x1;
++
++	Ser1UTSR0 = 0xff;				/* Clear SR0 */
++	Ser1UTCR3 = UTCR3_TXE | UTCR3_RXE | UTCR3_RIE;	/* Enable RX int */
++	Ser1UTCR3 &= ~UTCR3_TIE;			/* Disable TX int */
++}
++
++static irqreturn_t micro_serial_isr(int irq, void *dev_id)
++{
++	struct ipaq_micro *micro = dev_id;
++	struct ipaq_micro_txdev *tx = &micro->tx;
++	unsigned int status; /* UTSR0 */
++	int head, tail;
++
++	status = Ser1UTSR0;
++	do {
++		if (status & (UTSR0_RID | UTSR0_RFS)) {
++			if (status & UTSR0_RID)
++				/* Clear the Receiver IDLE bit */
++				Ser1UTSR0 = UTSR0_RID;
++			micro_rx_chars(micro);
++		}
++
++		/* Clear break bits */
++		if (status & (UTSR0_RBB | UTSR0_REB))
++			Ser1UTSR0 = status & (UTSR0_RBB | UTSR0_REB);
++
++		if (status & UTSR0_TFS)
++			micro_tx_chars(micro);
++
++		status = Ser1UTSR0;
++
++		head = atomic_read(&tx->head);
++		tail = atomic_read(&tx->tail);
++	} while (((head != tail) && (status & UTSR0_TFS)) ||
++		  status & (UTSR0_RFS | UTSR0_RID));
++
++	return IRQ_HANDLED;
++}
++
++static struct mfd_cell micro_cells[] = {
++	{
++		.name = "ipaq-micro-backlight",
++	},
++	{
++		.name = "ipaq-micro-battery",
++	},
++	{
++		.name = "ipaq-micro-keys",
++	},
++	{
++		.name = "ipaq-micro-ts",
++	},
++	{
++		.name = "ipaq-micro-leds",
++	},
++};
++
++static int micro_suspend(struct device *dev)
++{
++	/* __micro_backlight_set_power(FB_BLANK_POWERDOWN); // FIXME */
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
++	int res = 0;
++	int irq;
++
++	micro = devm_kzalloc(&pdev->dev, sizeof(*micro), GFP_KERNEL);
++	if (!micro)
++		return -ENOMEM;
++	micro->dev = &pdev->dev;
++	micro_reset_comm(micro);
++	irq = platform_get_irq(pdev, 0);
++	if (!irq)
++		return -EINVAL;
++	res = devm_request_irq(&pdev->dev, irq, micro_serial_isr,
++			       IRQF_SHARED, "ipaq-micro",
++			       micro);
++	if (res) {
++		dev_err(&pdev->dev, "%s: unable to grab serial port IRQ\n",
++			__func__);
++		return res;
++	} else
++		dev_info(&pdev->dev, "grabbed serial port IRQ\n");
++
++
++	spin_lock_init(&micro->lock);
++	platform_set_drvdata(pdev, micro);
++
++	res = mfd_add_devices(&pdev->dev, pdev->id, micro_cells,
++			      ARRAY_SIZE(micro_cells), NULL, 0, NULL);
++	if (res) {
++		dev_err(&pdev->dev, "error adding MFD cells");
++		return res;
++	}
++	/* Check version */
++	ipaq_micro_get_version(micro);
++	dev_info(&pdev->dev, "Atmel micro ASIC version %s\n", micro->version);
++
++	return 0;
++}
++
++static int micro_remove(struct platform_device *pdev)
++{
++	mfd_remove_devices(&pdev->dev);
++	Ser1UTCR3 &= ~(UTCR3_RXE | UTCR3_RIE); /* disable receive interrupt */
++	Ser1UTCR3 &= ~(UTCR3_TXE | UTCR3_TIE); /* disable transmit interrupt */
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
+index 000000000000..74733ff8a5ff
+--- /dev/null
++++ b/include/linux/mfd/ipaq-micro.h
+@@ -0,0 +1,73 @@
++/*
++ * Header file for the compaq Micro MFD
++ */
++
++#ifndef _MICRO_H_
++#define _MICRO_H_
++
++#include <linux/spinlock.h>
++#include <linux/completion.h>
++struct device;
++
++#define TX_BUF_SIZE	32
++#define RX_BUF_SIZE	16
++#define CHAR_SOF	0x02
++
++/*
++ * These are the different messages that can be sent to the microcontroller
++ * to control various aspects.
++ */
++#define MSG_VERSION		0x00
++#define MSG_KEYBOARD		0x02
++#define MSG_TOUCHSCREEN		0x03
++#define MSG_EEPROM_READ		0x04
++#define MSG_EEPROM_WRITE	0x05
++#define MSG_THERMAL_SENSOR	0x06
++#define MSG_NOTIFY_LED		0x08
++#define MSG_BATTERY		0x09
++#define MSG_SPI_READ		0x0b
++#define MSG_SPI_WRITE		0x0c
++#define MSG_BACKLIGHT		0x0d /* H3600 only */
++#define MSG_CODEC_CTRL		0x0e /* H3100 only */
++#define MSG_DISPLAY_CTRL	0x0f /* H3100 only */
++
++/* state of receiver parser */
++enum rx_state {
++	STATE_SOF = 0,     /* Next byte should be start of frame */
++	STATE_ID,          /* Next byte is ID & message length   */
++	STATE_DATA,        /* Next byte is a data byte           */
++	STATE_CHKSUM       /* Next byte should be checksum       */
++};
++
++struct ipaq_micro_txdev {
++	unsigned char buf[TX_BUF_SIZE];
++	atomic_t head;
++	atomic_t tail;
++};
++
++struct ipaq_micro_rxdev {
++	enum rx_state state;            /* context of rx state machine */
++	unsigned char chksum;           /* calculated checksum */
++	int           id;               /* message ID from packet */
++	unsigned int  len;              /* rx buffer length */
++	unsigned int  index;            /* rx buffer index */
++	unsigned char buf[RX_BUF_SIZE]; /* rx buffer size  */
++};
++
++struct ipaq_micro {
++	struct device *dev;
++	char version[5];
++	struct ipaq_micro_txdev tx;	/* transmit ISR state */
++	struct ipaq_micro_rxdev rx;	/* receive ISR state */
++	spinlock_t lock;
++	struct completion msg_ack;
++	void (*h_key) (int len, unsigned char *data);
++	void (*h_batt) (int len, unsigned char *data);
++	void (*h_temp) (int len, unsigned char *data);
++	void (*h_ts) (int len, unsigned char *data);
++};
++
++int ipaq_micro_tx_msg(struct ipaq_micro *micro, unsigned char id,
++		      unsigned char len, unsigned char *data);
++
++#endif /* _MICRO_H_ */
+-- 
+1.8.3.1
+
diff --git a/recipes-kernel/linux/linux-yocto-3.10/h3600/0002-ARM-sa1100-add-Micro-ASIC-platform-device.patch b/recipes-kernel/linux/linux-yocto-3.10/h3600/0002-ARM-sa1100-add-Micro-ASIC-platform-device.patch
new file mode 100644
index 000000000000..5a05a2d73d31
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.10/h3600/0002-ARM-sa1100-add-Micro-ASIC-platform-device.patch
@@ -0,0 +1,71 @@
+From 21e2ad8a5ec7bfd69e17a04fb717fca9635c15eb Mon Sep 17 00:00:00 2001
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
+ arch/arm/mach-sa1100/h3xxx.c | 13 +++++++++++++
+ 2 files changed, 15 insertions(+)
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
+index f17e7382242a..6391c485139e 100644
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
+@@ -248,9 +249,21 @@ static struct platform_device h3xxx_keys = {
+ 	},
+ };
+ 
++static struct resource h3xxx_micro_resources[] = {
++	[0] = DEFINE_RES_IRQ(IRQ_Ser1UART),
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
+1.8.3.1
+
diff --git a/recipes-kernel/linux/linux-yocto-3.10/h3600/0003-input-driver-for-microcontroller-keys-on-the-iPaq-h3.patch b/recipes-kernel/linux/linux-yocto-3.10/h3600/0003-input-driver-for-microcontroller-keys-on-the-iPaq-h3.patch
new file mode 100644
index 000000000000..378eb61dac14
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.10/h3600/0003-input-driver-for-microcontroller-keys-on-the-iPaq-h3.patch
@@ -0,0 +1,189 @@
+From a2fe0abc50935e0c7be52f6eba3e4a993b865e83 Mon Sep 17 00:00:00 2001
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
+ drivers/input/keyboard/ipaq-micro-keys.c | 129 +++++++++++++++++++++++++++++++
+ 3 files changed, 137 insertions(+)
+ create mode 100644 drivers/input/keyboard/ipaq-micro-keys.c
+
+diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
+index 7ac9c9818d55..de6ee82f72a0 100644
+--- a/drivers/input/keyboard/Kconfig
++++ b/drivers/input/keyboard/Kconfig
+@@ -543,6 +543,13 @@ config KEYBOARD_DAVINCI
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
+index 0c43e8cf8d0e..a6b468200300 100644
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
+index 000000000000..d7da6f8b8e37
+--- /dev/null
++++ b/drivers/input/keyboard/ipaq-micro-keys.c
+@@ -0,0 +1,129 @@
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
++static struct ipaq_micro *p_micro;
++static struct input_dev *micro_key_input;
++
++int keycodes[] = {
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
++static void micro_key_receive(int len, unsigned char *data)
++{
++	int key, down;
++
++	down = (0x80 & data[0]) ? 1 : 0;
++	key  = 0x7f & data[0];
++
++	if (key < ARRAY_SIZE(keycodes)) {
++		input_report_key(micro_key_input, keycodes[key], down);
++		input_sync(micro_key_input);
++	}
++}
++
++static int micro_key_probe(struct platform_device *pdev)
++{
++	int ret;
++	int i;
++
++	micro_key_input = input_allocate_device();
++
++	micro_key_input->evbit[0] = BIT(EV_KEY);
++	set_bit(EV_KEY, micro_key_input->evbit);
++	for (i = 0; i < ARRAY_SIZE(keycodes); i++)
++		set_bit(keycodes[i], micro_key_input->keybit);
++
++	micro_key_input->name = "h3600 micro keys";
++
++	ret = input_register_device(micro_key_input);
++	if (ret)
++		return ret;
++
++	p_micro = dev_get_drvdata(pdev->dev.parent);
++	spin_lock(&p_micro->lock);
++	p_micro->h_key = micro_key_receive;
++	spin_unlock(&p_micro->lock);
++
++	return 0;
++}
++
++static int micro_key_remove(struct platform_device *pdev)
++{
++	input_unregister_device(micro_key_input);
++
++	spin_lock(&p_micro->lock);
++	p_micro->h_key = NULL;
++	spin_unlock(&p_micro->lock);
++
++	return 0;
++}
++
++static int micro_key_suspend(struct device *dev)
++{
++	spin_lock(&p_micro->lock);
++	p_micro->h_key = NULL;
++	spin_unlock(&p_micro->lock);
++
++	return 0;
++}
++
++static int micro_key_resume(struct device *dev)
++{
++	spin_lock(&p_micro->lock);
++	p_micro->h_key = micro_key_receive;
++	spin_unlock(&p_micro->lock);
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
+1.8.3.1
+
diff --git a/recipes-kernel/linux/linux-yocto-3.10/h3600/0004-input-driver-for-touchscreen-on-iPaq-h3xxx.patch b/recipes-kernel/linux/linux-yocto-3.10/h3600/0004-input-driver-for-touchscreen-on-iPaq-h3xxx.patch
new file mode 100644
index 000000000000..b1f0e6516446
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.10/h3600/0004-input-driver-for-touchscreen-on-iPaq-h3xxx.patch
@@ -0,0 +1,199 @@
+From 34645060d6786dbb6c97d3e5a32981afa3c9de37 Mon Sep 17 00:00:00 2001
+From: Dmitry Artamonow <mad_soft@inbox.ru>
+Date: Sat, 21 Mar 2009 16:27:19 +0300
+Subject: [PATCH 4/7] input: driver for touchscreen on iPaq h3xxx
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
+ drivers/input/touchscreen/ipaq-micro-ts.c | 138 ++++++++++++++++++++++++++++++
+ 3 files changed, 147 insertions(+)
+ create mode 100644 drivers/input/touchscreen/ipaq-micro-ts.c
+
+diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
+index f9a5fd89bc02..1f10c7c9f3df 100644
+--- a/drivers/input/touchscreen/Kconfig
++++ b/drivers/input/touchscreen/Kconfig
+@@ -436,6 +436,14 @@ config TOUCHSCREEN_HP7XX
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
+index 6bfbeab67c9f..3cb2dc18e8d4 100644
+--- a/drivers/input/touchscreen/Makefile
++++ b/drivers/input/touchscreen/Makefile
+@@ -43,6 +43,7 @@ obj-$(CONFIG_TOUCHSCREEN_MTOUCH)	+= mtouch.o
+ obj-$(CONFIG_TOUCHSCREEN_MK712)		+= mk712.o
+ obj-$(CONFIG_TOUCHSCREEN_HP600)		+= hp680_ts_input.o
+ obj-$(CONFIG_TOUCHSCREEN_HP7XX)		+= jornada720_ts.o
++obj-$(CONFIG_TOUCHSCREEN_IPAQ_MICRO)	+= ipaq-micro-ts.o
+ obj-$(CONFIG_TOUCHSCREEN_HTCPEN)	+= htcpen.o
+ obj-$(CONFIG_TOUCHSCREEN_USB_COMPOSITE)	+= usbtouchscreen.o
+ obj-$(CONFIG_TOUCHSCREEN_PCAP)		+= pcap_ts.o
+diff --git a/drivers/input/touchscreen/ipaq-micro-ts.c b/drivers/input/touchscreen/ipaq-micro-ts.c
+new file mode 100644
+index 000000000000..5ea012a51de5
+--- /dev/null
++++ b/drivers/input/touchscreen/ipaq-micro-ts.c
+@@ -0,0 +1,138 @@
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
++struct ts_sample {
++	unsigned short x;
++	unsigned short y;
++};
++
++struct touchscreen_data {
++	struct input_dev *input;
++};
++
++static struct ipaq_micro *p_micro;
++struct touchscreen_data *ts;
++
++static void micro_ts_receive(int len, unsigned char *data)
++{
++	if (len == 4) {
++		input_report_abs(ts->input, ABS_X, (data[2]<<8)+data[3]);
++		input_report_abs(ts->input, ABS_Y, (data[0]<<8)+data[1]);
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
++	int ret;
++
++	ts = devm_kzalloc(&pdev->dev, sizeof(*ts), GFP_KERNEL);
++	if (!ts)
++		return -ENOMEM;
++
++	p_micro = dev_get_drvdata(pdev->dev.parent);
++
++	platform_set_drvdata(pdev, ts);
++	/* dev->driver_data = ts; */
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
++	/*--- callback ---*/
++	spin_lock(&p_micro->lock);
++	p_micro->h_ts = micro_ts_receive;
++	spin_unlock(&p_micro->lock);
++
++	dev_info(&pdev->dev, "iPAQ micro touchscreen\n");
++	return 0;
++}
++
++static int micro_ts_remove(struct platform_device *pdev)
++{
++	struct touchscreen_data *ts;
++
++	ts = platform_get_drvdata(pdev);
++
++	spin_lock(&p_micro->lock);
++	p_micro->h_ts = NULL;
++	spin_unlock(&p_micro->lock);
++	input_unregister_device(ts->input);
++
++	return 0;
++}
++
++static int micro_ts_suspend(struct device *dev)
++{
++	spin_lock(&p_micro->lock);
++	p_micro->h_ts = NULL;
++	spin_unlock(&p_micro->lock);
++	return 0;
++}
++
++static int micro_ts_resume(struct device *dev)
++{
++	spin_lock(&p_micro->lock);
++	p_micro->h_ts = micro_ts_receive;
++	spin_unlock(&p_micro->lock);
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
+1.8.3.1
+
diff --git a/recipes-kernel/linux/linux-yocto-3.10/h3600/0005-power-add-driver-for-battery-reading-on-iPaq-h3xxx.patch b/recipes-kernel/linux/linux-yocto-3.10/h3600/0005-power-add-driver-for-battery-reading-on-iPaq-h3xxx.patch
new file mode 100644
index 000000000000..c0be9b8b37f6
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.10/h3600/0005-power-add-driver-for-battery-reading-on-iPaq-h3xxx.patch
@@ -0,0 +1,295 @@
+From 92a0ddf6c78180510b47dc3734ccc68e733aad3a Mon Sep 17 00:00:00 2001
+From: Dmitry Artamonow <mad_soft@inbox.ru>
+Date: Sat, 21 Mar 2009 16:28:50 +0300
+Subject: [PATCH 5/7] power: add driver for battery reading on iPaq h3xxx
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
+ drivers/power/Kconfig              |   7 ++
+ drivers/power/Makefile             |   1 +
+ drivers/power/ipaq_micro_battery.c | 235 +++++++++++++++++++++++++++++++++++++
+ 3 files changed, 243 insertions(+)
+ create mode 100644 drivers/power/ipaq_micro_battery.c
+
+diff --git a/drivers/power/Kconfig b/drivers/power/Kconfig
+index 7b8979c63f48..380e4846428f 100644
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
+index 653bf6ceff30..1451aa7b9fc2 100644
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
+index 000000000000..413e91cc128e
+--- /dev/null
++++ b/drivers/power/ipaq_micro_battery.c
+@@ -0,0 +1,235 @@
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
++#include <linux/power_supply.h>
++#include <linux/platform_device.h>
++#include <linux/timer.h>
++#include <linux/mfd/ipaq-micro.h>
++#include <linux/completion.h>
++
++#define BATT_PERIOD (10 * HZ)
++
++#define H3600_BATT_STATUS_HIGH         0x01
++#define H3600_BATT_STATUS_LOW          0x02
++#define H3600_BATT_STATUS_CRITICAL     0x04
++#define H3600_BATT_STATUS_CHARGING     0x08
++#define H3600_BATT_STATUS_CHARGEMAIN   0x10
++#define H3600_BATT_STATUS_DEAD         0x20 /* Battery will not charge */
++#define H3600_BATT_STATUS_NOTINSTALLED 0x20 /* For expansion pack batteries */
++#define H3600_BATT_STATUS_FULL         0x40 /* Battery fully charged */
++#define H3600_BATT_STATUS_NOBATTERY    0x80
++#define H3600_BATT_STATUS_UNKNOWN      0xff
++
++
++static struct ipaq_micro *p_micro;
++
++struct timer_list batt_timer;
++
++struct {
++	int ac;
++	int update_time;
++	int chemistry;
++	int voltage;
++	int temperature;
++	int flag;
++} micro_battery;
++
++static void micro_battery_receive(int len, unsigned char *data)
++{
++	pr_debug("h3600_battery: AC = %02x\n", data[0]);
++	pr_debug("h3600_battery: BAT1 chemistry = %02x\n", data[1]);
++	pr_debug("h3600_battery: BAT1 voltage = %d %02x%02x\n",
++		(data[3] << 8) + data[2], data[2], data[3]);
++	pr_debug("h3600_battery: BAT1 status = %02x\n", data[4]);
++
++	micro_battery.chemistry = data[1];
++	micro_battery.voltage = ((((unsigned short)data[3] << 8) + \
++				data[2]) * 5000L) * 1000 / 1024;
++	micro_battery.flag = data[4];
++
++	if (len == 9) {
++		pr_debug("h3600_battery: BAT2 chemistry = %02x\n", data[5]);
++		pr_debug("h3600_battery: BAT2 voltage = %d %02x%02x\n",
++				(data[7] << 8) + data[6], data[6], data[7]);
++		pr_debug("h3600_battery: BAT2 status = %02x\n", data[8]);
++	}
++}
++
++static void micro_temperature_receive(int len, unsigned char *data)
++{
++	micro_battery.temperature = ((unsigned short)data[1] << 8) + data[0];
++}
++
++void h3600_battery_read_status(unsigned long data)
++{
++	if (++data % 2)
++		ipaq_micro_tx_msg(p_micro, MSG_BATTERY, 0, NULL);
++	else
++		ipaq_micro_tx_msg(p_micro, MSG_THERMAL_SENSOR, 0, NULL);
++
++	batt_timer.expires += BATT_PERIOD;
++	batt_timer.data = data;
++
++	add_timer(&batt_timer);
++}
++
++int get_capacity(struct power_supply *b)
++{
++	switch (micro_battery.flag) {
++	case H3600_BATT_STATUS_HIGH:
++		return 100;
++		break;
++	case H3600_BATT_STATUS_LOW:
++		return 50;
++		break;
++	case H3600_BATT_STATUS_CRITICAL:
++		return 5;
++		break;
++	default:
++		break;
++	}
++	return 0;
++}
++
++int get_status(struct power_supply *b)
++{
++	if (micro_battery.flag == H3600_BATT_STATUS_UNKNOWN)
++		return POWER_SUPPLY_STATUS_UNKNOWN;
++
++	if (micro_battery.flag & H3600_BATT_STATUS_FULL)
++		return POWER_SUPPLY_STATUS_FULL;
++
++	if ((micro_battery.flag & H3600_BATT_STATUS_CHARGING) ||
++		(micro_battery.flag & H3600_BATT_STATUS_CHARGEMAIN))
++		return POWER_SUPPLY_STATUS_CHARGING;
++
++	return POWER_SUPPLY_STATUS_DISCHARGING;
++}
++
++static int micro_batt_get_property(struct power_supply *b,
++					enum power_supply_property psp,
++					union power_supply_propval *val)
++{
++	switch (psp) {
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
++		val->intval = micro_battery.temperature;
++		break;
++	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
++		val->intval = micro_battery.voltage;
++		break;
++	default:
++		return -EINVAL;
++	};
++
++	return 0;
++}
++
++static enum power_supply_property micro_batt_props[] = {
++	POWER_SUPPLY_PROP_STATUS,
++	POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN,
++	POWER_SUPPLY_PROP_CAPACITY,
++	POWER_SUPPLY_PROP_TEMP,
++	POWER_SUPPLY_PROP_VOLTAGE_NOW,
++};
++
++static struct power_supply h3600_battery = {
++	.name               = "main-battery",
++	.properties         = micro_batt_props,
++	.num_properties     = ARRAY_SIZE(micro_batt_props),
++	.get_property       = micro_batt_get_property,
++	.use_for_apm        = 1,
++};
++
++static int micro_batt_probe(struct platform_device *pdev)
++{
++	power_supply_register(&pdev->dev, &h3600_battery);
++
++	p_micro = dev_get_drvdata(pdev->dev.parent);
++	spin_lock(&p_micro->lock);
++	p_micro->h_batt = micro_battery_receive;
++	p_micro->h_temp = micro_temperature_receive;
++	spin_unlock(&p_micro->lock);
++
++	init_timer(&batt_timer);
++	batt_timer.expires = jiffies + BATT_PERIOD;
++	batt_timer.data = 0;
++	batt_timer.function = h3600_battery_read_status;
++
++	add_timer(&batt_timer);
++
++	dev_info(&pdev->dev, "iPAQ micro battery driver\n");
++	return 0;
++}
++
++static int micro_batt_remove(struct platform_device *pdev)
++{
++	power_supply_unregister(&h3600_battery);
++	init_timer(&batt_timer);
++	p_micro->h_batt = NULL;
++	p_micro->h_temp = NULL;
++	del_timer_sync(&batt_timer);
++
++	return 0;
++}
++
++static int micro_batt_suspend(struct device *dev)
++{
++	del_timer(&batt_timer);
++
++	return 0;
++}
++
++static int micro_batt_resume(struct device *dev)
++{
++	add_timer(&batt_timer);
++
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
+1.8.3.1
+
diff --git a/recipes-kernel/linux/linux-yocto-3.10/h3600/0006-leds-add-driver-for-the-iPAQ-micro.patch b/recipes-kernel/linux/linux-yocto-3.10/h3600/0006-leds-add-driver-for-the-iPAQ-micro.patch
new file mode 100644
index 000000000000..326e0710c5d8
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.10/h3600/0006-leds-add-driver-for-the-iPAQ-micro.patch
@@ -0,0 +1,189 @@
+From 972419f09360ff582ccb6c459ad2977c01fe05c0 Mon Sep 17 00:00:00 2001
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
+ drivers/leds/leds-ipaq-micro.c | 135 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 143 insertions(+)
+ create mode 100644 drivers/leds/leds-ipaq-micro.c
+
+diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
+index ef992293598a..62b66ec0fb37 100644
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
+index ac2897732b02..ea001f62f4bf 100644
+--- a/drivers/leds/Makefile
++++ b/drivers/leds/Makefile
+@@ -30,6 +30,7 @@ obj-$(CONFIG_LEDS_LP5562)		+= leds-lp5562.o
+ obj-$(CONFIG_LEDS_LP8788)		+= leds-lp8788.o
+ obj-$(CONFIG_LEDS_TCA6507)		+= leds-tca6507.o
+ obj-$(CONFIG_LEDS_CLEVO_MAIL)		+= leds-clevo-mail.o
++obj-$(CONFIG_LEDS_IPAQ_MICRO)		+= leds-ipaq-micro.o
+ obj-$(CONFIG_LEDS_HP6XX)		+= leds-hp6xx.o
+ obj-$(CONFIG_LEDS_OT200)		+= leds-ot200.o
+ obj-$(CONFIG_LEDS_FSG)			+= leds-fsg.o
+diff --git a/drivers/leds/leds-ipaq-micro.c b/drivers/leds/leds-ipaq-micro.c
+new file mode 100644
+index 000000000000..899dae416ea3
+--- /dev/null
++++ b/drivers/leds/leds-ipaq-micro.c
+@@ -0,0 +1,135 @@
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
++	u8 data[4];
++
++	data[0] = LED_GREEN;
++	data[1] = 0;
++	if (value) {
++		dev_info(micro->dev, "enable LED\n");
++		data[2] = 0; /* Duty cycle 256 */
++		data[3] = 1;
++	} else {
++		dev_info(micro->dev, "disable LED\n");
++		data[2] = 1;
++		data[3] = 0; /* Duty cycle 256 */
++	}
++	ipaq_micro_tx_msg(micro, MSG_NOTIFY_LED, 4, data);
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
++	u8 data[4];
++
++	data[0] = LED_GREEN;
++        if (*delay_on > IPAQ_LED_MAX_DUTY ||
++	    *delay_off > IPAQ_LED_MAX_DUTY)
++                return -EINVAL;
++
++        if (*delay_on == 0 && *delay_off == 0) {
++                *delay_on = 100;
++                *delay_off = 100;
++        }
++
++	data[1] = 0;
++	if (*delay_on >= IPAQ_LED_MAX_DUTY)
++		data[2] = 0;
++	else
++		data[2] = (u8) DIV_ROUND_CLOSEST(*delay_on, 100);
++	if (*delay_off >= IPAQ_LED_MAX_DUTY)
++		data[3] = 0;
++	else
++		data[3] = (u8) DIV_ROUND_CLOSEST(*delay_off, 100);
++	ipaq_micro_tx_msg(micro, MSG_NOTIFY_LED, 4, data);
++	return 0;
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
+1.8.3.1
+
diff --git a/recipes-kernel/linux/linux-yocto-3.10/h3600/0007-fb-backlight-add-driver-for-iPAQ-micro-backlight.patch b/recipes-kernel/linux/linux-yocto-3.10/h3600/0007-fb-backlight-add-driver-for-iPAQ-micro-backlight.patch
new file mode 100644
index 000000000000..e958fff85046
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.10/h3600/0007-fb-backlight-add-driver-for-iPAQ-micro-backlight.patch
@@ -0,0 +1,142 @@
+From 7b9fdd2573c3e20e0981ce6a5b62f295109b2510 Mon Sep 17 00:00:00 2001
+From: Linus Walleij <linus.walleij@linaro.org>
+Date: Fri, 8 Nov 2013 10:09:13 +0100
+Subject: [PATCH 7/7] fb: backlight: add driver for iPAQ micro backlight
+
+This adds a driver for the backlight controlled by the microcontroller
+on the Compaq iPAQ series of handheld computers: h3100, h3600
+and h3700.
+
+Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
+---
+ drivers/video/backlight/Kconfig         |  9 ++++
+ drivers/video/backlight/Makefile        |  1 +
+ drivers/video/backlight/ipaq_micro_bl.c | 84 +++++++++++++++++++++++++++++++++
+ 3 files changed, 94 insertions(+)
+ create mode 100644 drivers/video/backlight/ipaq_micro_bl.c
+
+diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
+index d5ab6583f440..caae5c946b66 100644
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
+index 92711fe60464..494e381c9694 100644
+--- a/drivers/video/backlight/Makefile
++++ b/drivers/video/backlight/Makefile
+@@ -34,6 +34,7 @@ obj-$(CONFIG_BACKLIGHT_EP93XX)		+= ep93xx_bl.o
+ obj-$(CONFIG_BACKLIGHT_GENERIC)		+= generic_bl.o
+ obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
+ obj-$(CONFIG_BACKLIGHT_HP700)		+= jornada720_bl.o
++obj-$(CONFIG_BACKLIGHT_IPAQ_MICRO)	+= ipaq_micro_bl.o
+ obj-$(CONFIG_BACKLIGHT_LM3533)		+= lm3533_bl.o
+ obj-$(CONFIG_BACKLIGHT_LM3630)		+= lm3630_bl.o
+ obj-$(CONFIG_BACKLIGHT_LM3639)		+= lm3639_bl.o
+diff --git a/drivers/video/backlight/ipaq_micro_bl.c b/drivers/video/backlight/ipaq_micro_bl.c
+new file mode 100644
+index 000000000000..ae284fc9a22d
+--- /dev/null
++++ b/drivers/video/backlight/ipaq_micro_bl.c
+@@ -0,0 +1,84 @@
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
++	u8 data[3];
++
++	if (bd->props.power != FB_BLANK_UNBLANK)
++		intensity = 0;
++	if (bd->props.state & BL_CORE_FBBLANK)
++		intensity = 0;
++	if (bd->props.state & BL_CORE_SUSPENDED)
++		intensity = 0;
++
++	data[0] = 0x01;
++	data[1] = intensity > 0 ? 1 : 0;
++	data[2] = intensity;
++	ipaq_micro_tx_msg(micro, MSG_BACKLIGHT, 3, data);
++	return 0;
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
++	bd = backlight_device_register("ipaq-micro-backlight", &pdev->dev,
++				       micro,
++				       &micro_bl_ops,
++				       &micro_bl_props);
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
+1.8.3.1
+
diff --git a/recipes-kernel/linux/linux-yocto-handhelds.inc b/recipes-kernel/linux/linux-yocto-handhelds.inc
index f1569faf23f5..cd0a844f3291 100644
--- a/recipes-kernel/linux/linux-yocto-handhelds.inc
+++ b/recipes-kernel/linux/linux-yocto-handhelds.inc
@@ -24,6 +24,13 @@ SRC_URI_append_collie = " \
 
 SRC_URI_append_h3600 = " \
            file://defconfig \
+	   file://0001-MFD-driver-for-Atmel-Microcontroller-on-iPaq-h3xxx.patch \
+	   file://0002-ARM-sa1100-add-Micro-ASIC-platform-device.patch \
+	   file://0003-input-driver-for-microcontroller-keys-on-the-iPaq-h3.patch \
+	   file://0004-input-driver-for-touchscreen-on-iPaq-h3xxx.patch \
+	   file://0005-power-add-driver-for-battery-reading-on-iPaq-h3xxx.patch \
+	   file://0006-leds-add-driver-for-the-iPAQ-micro.patch \
+	   file://0007-fb-backlight-add-driver-for-iPAQ-micro-backlight.patch \
            file://qvga/logo_linux_clut224.ppm.bz2 \
            "
 
-- 
1.8.3.1


