Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jekhor@gmail.com>) id 1Qy1DW-0007vr-La
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Aug 2011 14:45:32 +0200
Received: by mail-fx0-f47.google.com with SMTP id 11so4525302fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Aug 2011 05:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=lGCswsb/p9+5PS9o9DvGC4I8oyD6WB7uTnCoeyAqjp4=;
	b=g780lbN1WAiaLfJl1Y4+lLDNRzs92GQPDuCMWoyphRaB6rFe6TGMWWXo0DDZgG0brw
	ttzcPpACtOf9ctxiXoBxLPWxsTjVhm1S3R03oPDloNd3GZDfISrsqNQMkGCEhZHewiR8
	3cmyBclqogqCUtLgY1qzpWaqv48fpHo5pJYzc=
Received: by 10.223.97.210 with SMTP id m18mr1654071fan.127.1314621640774;
	Mon, 29 Aug 2011 05:40:40 -0700 (PDT)
Received: from localhost.localdomain (mx2.promwad.com [195.222.87.218])
	by mx.google.com with ESMTPS id b14sm3731118fak.29.2011.08.29.05.40.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Aug 2011 05:40:39 -0700 (PDT)
Sender: Yauhen Kharuzhy <jekhor@gmail.com>
Received: from jek by localhost.localdomain with local (Exim 4.76)
	(envelope-from <jek@jeknote.loshitsa1.net>)
	id 1Qy18i-0006yb-V0; Mon, 29 Aug 2011 15:40:33 +0300
From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Aug 2011 15:40:19 +0300
Message-Id: <1314621621-26512-2-git-send-email-yauhen.kharuzhy@promwad.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1314621621-26512-1-git-send-email-yauhen.kharuzhy@promwad.com>
References: <1314621621-26512-1-git-send-email-yauhen.kharuzhy@promwad.com>
Cc: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
Subject: [PATCH 1/3] Add linux kernel recipe and patches for mycable's Jade Evaluation Board
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
X-List-Received-Date: Mon, 29 Aug 2011 12:45:32 -0000

Add linux kernel patches from xxsvideo project[1] and create kernel
recipe for Jade Evaluation Board[2].

1. http://sourceforge.net/projects/xxsvideo/
2. http://www.fujitsu.com/emea/services/microelectronics/gdc/evalbds/jade-evalboard.html

Signed-off-by: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
---
 .../jade-sk-86r01/01_diff-mycable-all.patch        |11568 ++++++++++++++++++++
 .../jade-sk-86r01/02_diff-mycable-leds.patch       |  234 +
 .../jade-sk-86r01/03_diff-mycable-fb.patch         | 1024 ++
 .../jade-sk-86r01/04_diff-mycable-i2c.patch        |  974 ++
 .../jade-sk-86r01/05_diff-mycable-usb.patch        |  619 ++
 .../jade-sk-86r01/06_diff-mycable-can.patch        | 1926 ++++
 .../07_diff-mycable-xxsnet-cryptoeeprom.patch      |  422 +
 .../jade-sk-86r01/08_diff-mycable-spi.patch        | 1406 +++
 .../jade-sk-86r01/09_diff-mycable-sound.patch      | 2506 +++++
 .../10_0001-Add-Fujitsu-framebuffer-driver.patch   | 3305 ++++++
 .../linux-jade-2.6.27/jade-sk-86r01/defconfig      | 1473 +++
 .../jade-sk-86r01/logo_linux_clut224.ppm           | 1604 +++
 recipes/linux/linux-jade_2.6.27.bb                 |   44 +
 13 files changed, 27105 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-jade-2.6.27/jade-sk-86r01/01_diff-mycable-all.patch
 create mode 100644 recipes/linux/linux-jade-2.6.27/jade-sk-86r01/02_diff-mycable-leds.patch
 create mode 100644 recipes/linux/linux-jade-2.6.27/jade-sk-86r01/03_diff-mycable-fb.patch
 create mode 100644 recipes/linux/linux-jade-2.6.27/jade-sk-86r01/04_diff-mycable-i2c.patch
 create mode 100644 recipes/linux/linux-jade-2.6.27/jade-sk-86r01/05_diff-mycable-usb.patch
 create mode 100644 recipes/linux/linux-jade-2.6.27/jade-sk-86r01/06_diff-mycable-can.patch
 create mode 100644 recipes/linux/linux-jade-2.6.27/jade-sk-86r01/07_diff-mycable-xxsnet-cryptoeeprom.patch
 create mode 100644 recipes/linux/linux-jade-2.6.27/jade-sk-86r01/08_diff-mycable-spi.patch
 create mode 100644 recipes/linux/linux-jade-2.6.27/jade-sk-86r01/09_diff-mycable-sound.patch
 create mode 100644 recipes/linux/linux-jade-2.6.27/jade-sk-86r01/10_0001-Add-Fujitsu-framebuffer-driver.patch
 create mode 100644 recipes/linux/linux-jade-2.6.27/jade-sk-86r01/defconfig
 create mode 100644 recipes/linux/linux-jade-2.6.27/jade-sk-86r01/logo_linux_clut224.ppm
 create mode 100644 recipes/linux/linux-jade_2.6.27.bb

diff --git a/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/01_diff-mycable-all.patch b/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/01_diff-mycable-all.patch
new file mode 100644
index 0000000..c42d85f
--- /dev/null
+++ b/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/01_diff-mycable-all.patch
@@ -0,0 +1,11568 @@
+--- linux-2.6.27.21/arch/arm/Kconfig	2009-03-23 22:04:09.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/Kconfig	2009-11-20 05:20:21.000000000 +0000
+@@ -280,6 +280,13 @@
+ 	  Support for systems based on the DC21285 companion chip
+ 	  ("FootBridge"), such as the Simtec CATS and the Rebel NetWinder.
+ 
++config ARCH_JADE
++	bool "Fujitsu 'Jade' SoCs (MB86Rxx)"
++	select GENERIC_GPIO
++	help
++	  This enables support for systems based on the Fujitsu MB86R01 
++	  'Jade' and MB86R02 'Jade-D' SoCs.
++
+ config ARCH_NETX
+ 	bool "Hilscher NetX based"
+ 	select ARM_VIC
+@@ -608,6 +615,8 @@
+ 
+ source "arch/arm/plat-mxc/Kconfig"
+ 
++source "arch/arm/mach-xxsvideo/Kconfig"
++
+ source "arch/arm/mach-netx/Kconfig"
+ 
+ source "arch/arm/mach-ns9xxx/Kconfig"
+--- linux-2.6.27.21/arch/arm/mach-xxsvideo/board-xxsterminal.c	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/mach-xxsvideo/board-xxsterminal.c	2010-03-05 10:40:46.000000000 +0000
+@@ -0,0 +1,295 @@
++/*
++ * linux/arch/arm/mach-xxsvideo/board-xxsterminal.c
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *	Carsten Schneider <cs@mycable.de>, Tiemo Krueger <tk@mycable.de>
++ *	Alexander Bigga <ab@mycable.de>
++ *
++ * mycable XXSvideo on XXSterminal extension board
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++#include <asm/mach/arch.h>
++#include <asm/mach/map.h>
++
++#include <linux/platform_device.h>
++#include <linux/gpio_keys.h>
++#include <linux/input.h>
++#include <linux/i2c.h>
++#include <linux/delay.h>
++
++#include <asm/mach/time.h>
++#include <asm/mach-types.h>
++
++#include <mach/board.h>
++#include <mach/gpio.h>
++#include <mach/xxsvideofb.h>
++#include <mach/can.h>
++
++#include <asm/dma.h>
++#include <mach/dma.h>
++
++#include "generic.h"
++
++/* --------------------------------------------------------------------
++ *  Ethernet Controller SMSC LAN9218 using driver smc911x.c
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_SMC911X) || defined(CONFIG_SMC911X_MODULE)
++static struct resource  smsc911x_resources[] = {
++	[0] = {
++		.start	= JADE_XSC0_PHYS_BASE,
++		.end	= JADE_XSC0_PHYS_BASE + 0x100 - 1,
++		.flags	= IORESOURCE_MEM,
++	},
++	[1] = {
++		.start	= INT_ETHERNET,
++		.end	= INT_ETHERNET,
++		.flags	= IORESOURCE_IRQ,
++	},
++};
++
++static struct platform_device  smsc911x_device = {
++	.name		= "smc911x",
++	.id		= 0,
++	.num_resources	= ARRAY_SIZE(smsc911x_resources),
++	.resource	= smsc911x_resources,
++};
++
++void __init xxsvideo_add_device_eth(struct xxsvideo_eth_data *data)
++{
++	platform_device_register(&smsc911x_device);
++}
++
++#else
++void __init xxsvideo_add_device_eth(struct xxsvideo_eth_data *data) {}
++#endif
++
++/*
++ * RTC M41t81
++ */
++static struct i2c_board_info rtcinfo __initdata = {
++                 I2C_BOARD_INFO("m41t80", 0x68),
++                .type = "m41t81",
++};
++
++/*
++ * SII 164
++ */
++#if defined(CONFIG_XXSVIDEO_SII164) || defined(CONFIG_XXSVIDEO_SII164_MODULE)
++static struct i2c_board_info sii_info1 __initdata = {
++               I2C_BOARD_INFO("sii164", 0x38),
++};
++void __init xxsvideo_add_device_sii164(void)
++{
++	i2c_register_board_info(0, &sii_info1, 1);
++}
++#else
++void __init xxsvideo_add_device_sii164(void) {}
++#endif
++
++/*
++ * SPI devices.
++ */
++static struct spi_board_info xxsterminal_spi_devices[] = {
++	{	/* DAC? */
++		.modalias	= "spi",
++		.chip_select	= 0,
++		.max_speed_hz	= 10 * 1000 * 1000,
++		.bus_num	= 1,
++	},
++};
++
++/*
++ * GPIO Buttons
++ */
++#if defined(CONFIG_XXSVIDEO_KEYS) || defined(CONFIG_XXSVIDEO_KEYS_MODULE)
++static struct xxsvideo_gpio_keys_button xxsvideo_buttons[] = {
++        {
++                .gpio           = 12,
++                .desc           = "Button 0",
++                .active_low     = 1,
++                .type		= EV_KEY,
++                .code		= KEY_1,
++        },
++        {
++                .gpio           = 11,
++                .desc           = "Button 1",
++                .active_low     = 1,
++                .type		= EV_KEY,
++                .code		= KEY_2,
++        },
++        {
++                .gpio           = 10,
++                .desc           = "Button 2",
++                .active_low     = 1,
++                .type		= EV_KEY,
++                .code		= KEY_3,
++        },
++};
++
++static struct gpio_keys_platform_data xxsvideo_button_data = {
++        .buttons        = xxsvideo_buttons,
++        .nbuttons       = ARRAY_SIZE(xxsvideo_buttons),
++};
++
++static struct platform_device xxsvideo_button_device = {
++        .name           = "xxsvideo-keys",
++        .id             = -1,
++        .num_resources  = 0,
++        .dev            = {
++                .platform_data  = &xxsvideo_button_data,
++        }
++};
++static void __init xxsvideo_add_device_buttons(void)
++{
++        platform_device_register(&xxsvideo_button_device);
++}
++#else
++static void __init xxsvideo_add_device_buttons(void) {}
++#endif
++
++/*
++ * CAN
++ */
++static struct xxsvideo_ccan_gpio xxsvideo_ccan = {
++	.id 		= 0,
++	.gpio_outen 	= 20,
++	.gpio_standby 	= 19,
++	.standby_active_low = 0,
++	.gpio_wake	= -1,
++};
++static struct xxsvideo_ccan_gpio xxsvideo_ccan_1 = {
++	.id 		= 1,
++	.gpio_outen 	= 18,
++	.gpio_standby 	= 17,
++	.standby_active_low = 0,
++	.gpio_wake	= -1,
++};
++
++/* --------------------------------------------------------------------
++ *  Machine Description
++ * -------------------------------------------------------------------- */
++
++static void xxsvideo_reset(void)
++{
++        /*
++         * reset as much CPU macros as possible:::
++         */
++	printk("/ab/%s: will do software reset now\n", __func__);
++	__raw_writel(0xffffffff, JADE_CCNT_BASE + JADE_CCNT_CMSR0);
++	__raw_writel(0x1cfffffd, JADE_CCNT_BASE + JADE_CCNT_CMSR1);
++	udelay(100);
++	__raw_writel(0, JADE_CCNT_BASE + JADE_CCNT_CMSR0);
++	__raw_writel(0, JADE_CCNT_BASE + JADE_CCNT_CMSR1);
++}
++
++static void __init xxsterminal_init_irq(void)
++{
++        xxsvideo_init_interrupts();
++
++	/*
++	 * INT_A0   high level  Ethernet
++	 * INT_A1   low level   RTC
++	 * INT_A2   high level  (unused)
++	 * INT_A3   high level  (unused)
++	 */
++	set_irq_type(INT_EXT_0, IRQ_TYPE_LEVEL_HIGH);
++	set_irq_type(INT_EXT_1, IRQ_TYPE_LEVEL_LOW);
++	set_irq_type(INT_EXT_2, IRQ_TYPE_LEVEL_HIGH);
++	set_irq_type(INT_EXT_3, IRQ_TYPE_LEVEL_HIGH);
++}
++
++static void __init xxsterminal_map_io(void)
++{
++	xxsvideo_initialize(0);
++}
++
++static void __init xxsterminal_board_init(void)
++{
++	int ret;
++	printk("DEBUG: xxsterminal_board_init\n");
++	xxsvideo_arch_reset = xxsvideo_reset;
++
++	/* set GPIO switch on LEDs */
++	/*
++	* GPIO 6: SYSLED# green
++	* GPIO 7: SYSLED# red
++	* GPIO 8: LED# green
++	*
++	* SYSLED colors:
++	*    - red: during u-boot
++	*    - orange: during kernel boot
++	*    - green: Rootfs ready
++	*/
++
++	xxsvideo_add_device_gpio(6, "sysled# green");
++	xxsvideo_add_device_gpio(7, "sysled# red");
++	xxsvideo_add_device_gpio(8, "led# green");
++
++	xxsvideo_set_gpio_value(6, 0);
++	xxsvideo_set_gpio_value(7, 0);
++	xxsvideo_set_gpio_value(8, 1);
++
++	/* add platform devices */
++
++	/* UART0 */
++	xxsvideo_add_device_serial();
++
++	/* NOR Flash */
++	xxsvideo_add_device_nor();
++
++	/* SPI */
++// 	xxsvideo_add_device_spi(xxsterminal_spi_devices, ARRAY_SIZE(xxsterminal_spi_devices));
++
++	/* FRAMEBUFFER */
++	xxsvideo_add_device_fb(0, 0x00010104); /* DCKinv=1 DCKD=4? */
++
++	/* I2C */
++ 	xxsvideo_add_device_i2c();
++ 	ret = i2c_register_board_info(0, &rtcinfo, 1);
++
++	/* Panel Link Transmitter SII164 */
++	xxsvideo_add_device_sii164();
++
++	/* Ethernet */
++	xxsvideo_add_device_eth(NULL);
++
++	/* Cryptoeeprom */
++//	xxsvideo_add_device_cryptoeeprom();
++
++	/* Push Buttons */
++        xxsvideo_add_device_buttons();
++
++	/* USB Host */
++ 	xxsvideo_add_device_usbh_ohci();
++ 	xxsvideo_add_device_usbh_ehci();
++
++	/* CAN */
++	xxsvideo_add_device_ccan(&xxsvideo_ccan);
++	xxsvideo_add_device_ccan(&xxsvideo_ccan_1);
++
++	printk("/ab/%s: chip-id: 0x%x, multiplex-mode: 0x%x, ext pin satus: 0x%x\n", \
++		__func__, __raw_readl(JADE_CCNT_BASE), \
++		__raw_readl(JADE_CCNT_BASE+0x30), __raw_readl(JADE_CCNT_BASE+0x34));
++
++	// just for information purpose during development
++	ret = __raw_readl(JADE_CRG_BASE+JADE_CRG_CRDA);
++
++	// not working yet...
++//	xxsvideo_gpio_irq_setup();
++}
++
++MACHINE_START(XXSVIDEO, "mycable XXSterminal SBC")
++	.phys_io	= JADE_UART0_PHYS_BASE,
++	.io_pg_offst	= ((u32)(JADE_UART0_BASE) >> 18) & 0xfffc,
++	.boot_params	= 0x40000000 + 0x100,
++	.timer		= &xxsvideo_timer,
++	.map_io		= xxsterminal_map_io,
++	.init_irq	= xxsterminal_init_irq,
++	.init_machine	= xxsterminal_board_init,
++MACHINE_END
+--- linux-2.6.27.21/arch/arm/mach-xxsvideo/board-jadeevalkit.c	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/mach-xxsvideo/board-jadeevalkit.c	2010-03-05 10:40:34.000000000 +0000
+@@ -0,0 +1,568 @@
++/*
++ * linux/arch/arm/mach-xxsvideo/board-jadeevalkit.c
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *	Carsten Schneider <cs@mycable.de>, Tiemo Krueger <tk@mycable.de>
++ *	Alexander Bigga <ab@mycable.de>
++ *
++ * mycable XXSvideo on Jade Eval Kit extension board
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++#include <asm/mach/arch.h>
++#include <asm/mach/map.h>
++
++#include <linux/platform_device.h>
++#include <linux/gpio_keys.h>
++#include <linux/input.h>
++#include <linux/i2c.h>
++#include <linux/delay.h>
++
++#include <asm/mach/time.h>
++#include <asm/mach-types.h>
++
++#include <mach/board.h>
++#include <mach/gpio.h>
++#include <mach/xxsvideofb.h>
++#include <mach/can.h>
++#include <mach/audio.h>
++
++#include <asm/dma.h>
++
++#include "generic.h"
++
++/* --------------------------------------------------------------------
++ *  Ethernet Controller SMSC LAN9218 using driver smc911x.c
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_SMC911X) || defined(CONFIG_SMC911X_MODULE)
++static struct resource  smsc911x_resources[] = {
++	[0] = {
++		.start	= JADE_XSC0_PHYS_BASE,
++		.end	= JADE_XSC0_PHYS_BASE + 0x100 - 1,
++		.flags	= IORESOURCE_MEM,
++	},
++	[1] = {
++		.start	= INT_ETHERNET,
++		.end	= INT_ETHERNET,
++		.flags	= IORESOURCE_IRQ,
++	},
++};
++
++static struct platform_device  smsc911x_device = {
++	.name		= "smc911x",
++	.id		= 0,
++	.num_resources	= ARRAY_SIZE(smsc911x_resources),
++	.resource	= smsc911x_resources,
++};
++
++void __init xxsvideo_add_device_eth(struct xxsvideo_eth_data *data)
++{
++	platform_device_register(&smsc911x_device);
++}
++
++#else
++void __init xxsvideo_add_device_eth(struct xxsvideo_eth_data *data) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  RTC M41T81
++ * -------------------------------------------------------------------- */
++
++static struct i2c_board_info rtcinfo __initdata = {
++                 I2C_BOARD_INFO("m41t81", 0x68),
++};
++
++/* --------------------------------------------------------------------
++ *  I/O Expander MPC23017
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_XXSVIDEO_IOEXPANDER) || defined(CONFIG_XXSVIDEO_IOEXPANDER_MODULE)
++static struct i2c_board_info ioexp0 __initdata = {
++               I2C_BOARD_INFO("ioexpander", 0x20),
++};
++
++#if defined(CONFIG_MACH_XXSVIDEO_EVALKIT_VIDEOIN)
++static struct i2c_board_info ioexp1 __initdata = {
++               I2C_BOARD_INFO("ioexpander", 0x21),
++};
++#endif
++
++void __init xxsvideo_add_device_ioexpander(void)
++{
++	i2c_register_board_info(0, &ioexp0, 1);
++#if defined(CONFIG_MACH_XXSVIDEO_EVALKIT_VIDEOIN)
++	i2c_register_board_info(1, &ioexp1, 1);
++#endif
++}
++
++#else
++void __init xxsvideo_add_device_ioexpander(void) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  SiI 164
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_XXSVIDEO_SII164) || defined(CONFIG_XXSVIDEO_SII164_MODULE)
++static struct i2c_board_info sii_info1 __initdata = {
++               I2C_BOARD_INFO("sii164", 0x38),
++};
++static struct i2c_board_info sii_info2 __initdata = {
++               I2C_BOARD_INFO("sii164", 0x39),
++};
++void __init xxsvideo_add_device_sii164(void)
++{
++	i2c_register_board_info(0, &sii_info1, 1);
++	i2c_register_board_info(0, &sii_info2, 1);
++}
++#else
++void __init xxsvideo_add_device_sii164(void) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  GPIO Buttons
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_XXSVIDEO_KEYS) || defined(CONFIG_XXSVIDEO_KEYS_MODULE)
++static struct xxsvideo_gpio_keys_button xxsvideo_buttons[] = {
++        {
++                .gpio           = 211,
++                .desc           = "Button 0",
++                .active_low     = 1,
++                .type		= EV_KEY,
++                .code		= KEY_1,
++        },
++        {
++                .gpio           = 212,
++                .desc           = "Button 1",
++                .active_low     = 1,
++                .type		= EV_KEY,
++                .code		= KEY_2,
++        },
++        {
++                .gpio           = 213,
++                .desc           = "Button 2",
++                .active_low     = 1,
++                .type		= EV_KEY,
++                .code		= KEY_3,
++        },
++};
++
++static struct gpio_keys_platform_data xxsvideo_button_data = {
++        .buttons        = xxsvideo_buttons,
++        .nbuttons       = ARRAY_SIZE(xxsvideo_buttons),
++};
++
++static struct platform_device xxsvideo_button_device = {
++        .name           = "xxsvideo-keys",
++        .id             = -1,
++        .num_resources  = 0,
++        .dev            = {
++                .platform_data  = &xxsvideo_button_data,
++        }
++};
++
++static void __init xxsvideo_add_device_buttons(void)
++{
++        platform_device_register(&xxsvideo_button_device);
++}
++#else
++static void __init xxsvideo_add_device_buttons(void) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  CAN
++ * -------------------------------------------------------------------- */
++
++#ifdef CONFIG_MACH_XXSVIDEO_CAN_GROUP2
++static struct xxsvideo_ccan_gpio xxsvideo_ccan = {
++	.id 		= 0,
++	.gpio_outen 	= 5,
++	.gpio_standby	= 4,
++	.standby_active_low = 0,
++	.gpio_wake	= -1,
++};
++
++static struct xxsvideo_ccan_gpio xxsvideo_ccan_1 = {
++	.id		= 1,
++	.gpio_outen	= 3,
++	.gpio_standby	= 2,
++	.standby_active_low = 0,
++	.gpio_wake	= -1,
++};
++
++#else /* CAN multiplex group #4 */
++static struct xxsvideo_ccan_gpio xxsvideo_ccan = {
++	.id 		= 0,
++	.gpio_outen 	= 23,
++	.gpio_standby	= 22,
++	.standby_active_low = 0,
++	.gpio_wake	= -1,
++};
++
++static struct xxsvideo_ccan_gpio xxsvideo_ccan_1 = {
++	.id		= 1,
++	.gpio_outen	= 21,
++	.gpio_standby	= 20,
++	.standby_active_low = 0,
++	.gpio_wake	= -1,
++};
++#endif /* CONFIG_MACH_XXSVIDEO_CAN_GROUP2 */
++
++/* --------------------------------------------------------------------
++ *  SPI
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_SPI_XXSVIDEO) || defined(CONFIG_SPI_XXSVIDEO_MODULE)
++static u64 spi_dmamask = 0xffffffffUL;
++
++static struct resource spi0_resources[] = {
++	[0] = {
++		.start	= JADE_SPI_BASE,
++		.end	= JADE_SPI_BASE + SZ_16K - 1,
++		.flags	= IORESOURCE_MEM,
++	},
++	[1] = {
++		.start	= INT_SPI,
++		.end	= INT_SPI,
++		.flags	= IORESOURCE_IRQ,
++	},
++};
++
++static struct platform_device xxsvideo_spi0_device = {
++	.name		= "xxsvideo_spi",
++	.id		= 0,
++	.dev		= {
++				.dma_mask		= &spi_dmamask,
++				.coherent_dma_mask	= 0xffffffff,
++	},
++	.resource	= spi0_resources,
++	.num_resources	= ARRAY_SIZE(spi0_resources),
++};
++
++void __init xxsvideo_add_device_spi(struct spi_board_info *devices, int nr_devices)
++{
++	u32 cmux_md, mpx_mode_2;
++
++	/* enable SPI in pin multiplex */
++	cmux_md = __raw_readl(JADE_CCNT_BASE+JADE_CCNT_CMUX_MD);
++	mpx_mode_2 = ((cmux_md >> 0) & 0x7);
++	if (mpx_mode_2 != 3) {
++		printk(KERN_WARNING "%s: CMUX_MD.MPX_MODE_2 = %u, "
++		       "changing to %u\n", __func__, mpx_mode_2, 3);
++		cmux_md = (cmux_md & ~(0x7<<0)) | (3<<0);
++		__raw_writel(cmux_md, JADE_CCNT_BASE+JADE_CCNT_CMUX_MD);
++	}
++
++	printk("/ab/%s: will add spi board info %i\n", __func__, nr_devices);
++	spi_register_board_info(devices, nr_devices);
++
++//	xxsvideo_clock_associate("spi0_clk", &xxsvideo_spi0_device.dev, "spi_clk");
++	platform_device_register(&xxsvideo_spi0_device);
++}
++#else
++void __init xxsvideo_add_device_spi(struct spi_board_info *devices, int nr_devices) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  SPI devices
++ * -------------------------------------------------------------------- */
++
++// static struct spi_board_info jadeevalkit_spi_devices[] = {
++// 	{	/* DAC? */
++// 		.modalias	= "at73c213",
++// 		.chip_select	= 0,
++// 		.max_speed_hz	= 10 * 1000 * 1000,
++// 		.bus_num	= 1,
++// 	},
++// };
++
++// static struct m41t94_platform_data ads_info = {
++// 	.model			= 7812,
++// 	.x_min			= 150,
++// 	.x_max			= 3830,
++// 	.y_min			= 190,
++// 	.y_max			= 3830,
++// 	.vref_delay_usecs	= 100,
++// 	.x_plate_ohms		= 450,
++// 	.y_plate_ohms		= 250,
++// 	.pressure_max		= 15000,
++// 	.debounce_max		= 1,
++// 	.debounce_rep		= 0,
++// 	.debounce_tol		= (~0),
++// //	.get_pendown_state	= ads7843_pendown_state,
++// };
++
++static struct spi_board_info xxsvideo_spi_devices[] = {
++	{
++		.modalias	= "m41t94",
++// 		.platform_data	= &ads_info,
++		.chip_select	= 1,
++		.max_speed_hz	= 125000 * 26,	/* (max sample rate @ 3V) * (cmd + data + overhead) */
++		.bus_num	= 0,
++	},
++};
++
++/* --------------------------------------------------------------------
++ *  Sound: I2S
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_SND_XXSVIDEO_ALSA_SOC_I2S) || defined(CONFIG_SND_XXSVIDEO_ALSA_SOC_I2S_MODULE)
++static struct xxsvideo_i2s xxsvideo_sound_soc_i2s = {
++	.id 		= 0,
++	.channel	= 1,
++} ;
++
++static struct resource xxsvideo_i2s_resources[] = {
++	[0] = {
++		.start	= JADE_I2S1_BASE,
++		.end	= JADE_I2S1_BASE + SZ_4K - 1,
++		.flags	= IORESOURCE_MEM,
++	},
++	[1] = {
++		.start	= INT_I2S1,
++		.end	= INT_I2S1,
++		.flags	= IORESOURCE_IRQ,
++	},
++	/*
++	 * DMA parameters
++	 */
++	[2] = {
++		.start	= DMACH_I2S1_OUT,
++		.end	= DMACH_I2S1_OUT,
++		.flags	= IORESOURCE_DMA,
++	},
++	[3] = {
++		.start	= DMACH_I2S1_IN,
++		.end	= DMACH_I2S1_IN,
++		.flags	= IORESOURCE_DMA,
++	},
++	[4] = {
++		.start	= JADE_I2S1_PHYS_BASE,
++		.end	= JADE_I2S1_PHYS_BASE + SZ_4K - 1,
++		.flags	= IORESOURCE_MEM,
++	},
++};
++
++static struct platform_device xxsvideo_i2s_device = {
++	.name		= "xxsvideo_i2s",
++	.id		= 0,
++	.resource	= xxsvideo_i2s_resources,
++	.num_resources	= ARRAY_SIZE(xxsvideo_i2s_resources),
++	.dev		= {
++				.platform_data	= &xxsvideo_sound_soc_i2s,
++	},
++};
++
++void __init xxsvideo_add_device_i2s(void)
++{
++	u32 cmux_md, mpx_mode_2, mpx_mode_4;
++
++	/* enable I2S-1 in pin multiplex, groups #2 and #4 */
++	cmux_md = __raw_readl(JADE_CCNT_BASE+JADE_CCNT_CMUX_MD);
++	mpx_mode_2 = ((cmux_md >> 0) & 0x7);
++	mpx_mode_4 = ((cmux_md >> 4) & 0x3);
++	if ((mpx_mode_2 != 2) && (mpx_mode_2 != 3) && (mpx_mode_2 != 4)) {
++		printk(KERN_WARNING "%s: CMUX_MD.MPX_MODE_2 = %u, "
++		       "changing to %u\n", __func__, mpx_mode_2, 3);
++		cmux_md = (cmux_md & ~(0x7<<0)) | (3<<0);
++		__raw_writel(cmux_md, JADE_CCNT_BASE+JADE_CCNT_CMUX_MD);
++	}
++	if (mpx_mode_4 != 1) {
++		printk(KERN_WARNING "%s: CMUX_MD.MPX_MODE_4 = %u, "
++		       "changing to %u\n", __func__, mpx_mode_4, 1);
++		cmux_md = (cmux_md & ~(0x3<<4)) | (1<<4);
++		__raw_writel(cmux_md, JADE_CCNT_BASE+JADE_CCNT_CMUX_MD);
++	}
++
++	platform_device_register(&xxsvideo_i2s_device);
++}
++#else
++void __init xxsvideo_add_device_i2s(void) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  Sound: oci2c
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_SND_OCI2C) || defined(CONFIG_SND_OCI2C_MODULE)
++static struct i2c_board_info oci2c_info __initdata = {
++               I2C_BOARD_INFO("oci2c", 0x4e),
++};
++
++void __init xxsvideo_add_device_oci2c(void)
++{
++	printk("/ab/%s: ..\n", __func__);
++	i2c_register_board_info(1, &oci2c_info, 1);
++}
++#else
++void __init xxsvideo_add_device_oci2c(void) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  Sound: Codec
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_SND_XXSVIDEO_ALSA_EVALKIT_CS4245) || defined(CONFIG_SND_XXSVIDEO_ALSA_EVALKIT_CS4245_MODULE)
++static struct i2c_board_info xxsvideo_sound_info __initdata = {
++               I2C_BOARD_INFO("cs4245", 0x4e),
++};
++void __init xxsvideo_add_device_sound(void)
++{
++	printk("/ab/%s: ..\n", __func__);
++	i2c_register_board_info(1, &xxsvideo_sound_info, 1);
++}
++#else
++void __init xxsvideo_add_device_sound(void) {}
++#endif
++
++// -----------------------------------------------------------------
++// ??
++// -----------------------------------------------------------------
++struct sysdev_class xxsvideo_sysclass = {
++        .name = "xxsvideo-core",
++};
++
++// static struct sys_device xxsvideo_sysdev = {
++//         .cls            = &xxsvideo_sysclass,
++// };
++
++/* need to register class before we actually register the device, and
++ * we also need to ensure that it has been initialised before any of the
++ * drivers even try to use it (even if not on an s3c2410 based system)
++ * as a driver which may support both 2410 and 2440 may try and use it.
++*/
++
++static int __init xxsvideo_core_init(void)
++{
++        return sysdev_class_register(&xxsvideo_sysclass);
++}
++ 
++core_initcall(xxsvideo_core_init);
++
++/* --------------------------------------------------------------------
++ *  Machine Description
++ * -------------------------------------------------------------------- */
++
++static void xxsvideo_reset(void)
++{
++        /*
++         * reset as much CPU macros as possible:::
++         */
++	__raw_writel(0, JADE_I2S1_BASE + JADE_I2S_INTCNT);	
++	__raw_writel(0, JADE_DMAC_BASE + JADE_DMACR);	
++	__raw_writel(0, JADE_I2S1_BASE + JADE_I2S_DMAACT);	
++	__raw_writel(0, JADE_I2S1_BASE + JADE_I2S_OPRREG);	
++	printk("/ab/%s: will do software reset now\n", __func__);
++	udelay(100);
++	__raw_writel(0xffffffff, JADE_CCNT_BASE + JADE_CCNT_CMSR0);
++	__raw_writel(0x1cfffffd, JADE_CCNT_BASE + JADE_CCNT_CMSR1);
++	udelay(100);
++	__raw_writel(0, JADE_CCNT_BASE + JADE_CCNT_CMSR0);
++	__raw_writel(0, JADE_CCNT_BASE + JADE_CCNT_CMSR1);
++}
++
++static void __init jadeevalkit_init_irq(void)
++{
++	xxsvideo_init_interrupts();
++
++	/*
++	 * INT_A0   high level  Ethernet
++	 * INT_A1   low level   I/O Expander 1
++	 * INT_A2   low level   INIC
++	 * INT_A3   low level   I/O Expander 0, Touch Screen Controller
++	 */
++	set_irq_type(INT_EXT_0, IRQ_TYPE_LEVEL_HIGH);
++	set_irq_type(INT_EXT_1, IRQ_TYPE_LEVEL_LOW);
++	set_irq_type(INT_EXT_2, IRQ_TYPE_LEVEL_LOW);
++	set_irq_type(INT_EXT_3, IRQ_TYPE_LEVEL_LOW);
++}
++
++static void __init jadeevalkit_map_io(void)
++{
++	xxsvideo_initialize(0);
++}
++
++static void __init jadeevalkit_board_init(void)
++{
++	int ret;
++
++	printk("DEBUG: jadeevalkit_board_init\n");
++//         void __iomem *membase;
++// 	printk("/ab/%s\n", __func__);
++// 	membase = ioremap(0xfffe1000, 64);
++// 	printk("/ab/%s 0x%x\n", __func__, membase);
++
++	xxsvideo_arch_reset = xxsvideo_reset;
++
++	/* set GPIO function for LEDs */
++
++	/* add platform devices */
++
++	/* UART0 */
++	xxsvideo_add_device_serial();
++
++	/* NOR Flash */
++	xxsvideo_add_device_nor();
++
++	/* FRAMEBUFFER */
++	xxsvideo_add_device_fb(0, 0x00010104); /* DCKinv=1 DCKD=4 */
++	xxsvideo_add_device_fb(1, 0x00010102); /* DCKinv=1 DCKD=2 */
++
++	/* I2C */
++	xxsvideo_add_device_i2c();
++	ret = i2c_register_board_info(0, &rtcinfo, 1);
++
++	/* LEDs via IO-Expander */
++	xxsvideo_add_device_ioexpander();
++	//ret = i2c_register_board_info(0, &ledinfo, 1);
++
++	/* Panel Link Transmitter SII164 */
++	xxsvideo_add_device_sii164();
++
++	/* Ethernet */
++	xxsvideo_add_device_eth(NULL);
++
++	/* Cryptoeeprom */
++//	xxsvideo_add_device_cryptoeeprom();
++	/* USB Host */
++ 	xxsvideo_add_device_usbh_ohci();
++ 	xxsvideo_add_device_usbh_ehci();
++
++	/* Push Buttons */
++        xxsvideo_add_device_buttons();
++
++	/* CAN */
++	xxsvideo_add_device_ccan(&xxsvideo_ccan);
++	xxsvideo_add_device_ccan(&xxsvideo_ccan_1);
++
++	/* SPI */
++        xxsvideo_add_device_spi(xxsvideo_spi_devices, ARRAY_SIZE(xxsvideo_spi_devices));
++
++        /* sound ... */
++	xxsvideo_add_device_i2s();
++	xxsvideo_add_device_sound();
++
++	printk("/ab/%s: chip-id: 0x%x, multiplex-mode: 0x%x, ext pin satus: 0x%x\n", \
++		__func__, __raw_readl(JADE_CCNT_BASE), \
++		__raw_readl(JADE_CCNT_BASE+0x30), __raw_readl(JADE_CCNT_BASE+0x34));
++
++	// just for information purpose during development
++	ret = __raw_readl(JADE_CRG_BASE+JADE_CRG_CRDA);
++
++}
++
++MACHINE_START(XXSVIDEO, "mycable/Fujitsu Jade Eval Kit")
++	.phys_io	= JADE_UART0_PHYS_BASE,
++	.io_pg_offst	= ((u32)(JADE_UART0_BASE) >> 18) & 0xfffc,
++	.boot_params	= 0x40000000 + 0x100,
++	.timer		= &xxsvideo_timer,
++	.map_io		= jadeevalkit_map_io,
++	.init_irq	= jadeevalkit_init_irq,
++	.init_machine	= jadeevalkit_board_init,
++MACHINE_END
+--- linux-2.6.27.21/arch/arm/mach-xxsvideo/board-jadedevalkit.c	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/mach-xxsvideo/board-jadedevalkit.c	2010-03-05 10:40:23.000000000 +0000
+@@ -0,0 +1,487 @@
++/*
++ * linux/arch/arm/mach-xxsvideo/board-jadedevalkit.c
++ *
++ * Copyright (C) 2009, Fujitsu Microelectronics Europe GmbH
++ *      Thomas Betker <thomas.betker@fme.fujitsu.com>
++ *
++ * Copyright (C) 2007 mycable GmbH
++ *      Carsten Schneider <cs@mycable.de>, Tiemo Krueger <tk@mycable.de>
++ *      Alexander Bigga <ab@mycable.de>
++ *
++ * Board setup for Jade-D Eval Kit.
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ */
++
++#include <asm/mach/arch.h>
++#include <asm/mach/map.h>
++
++#include <linux/platform_device.h>
++#include <linux/gpio_keys.h>
++#include <linux/input.h>
++#include <linux/i2c.h>
++#include <linux/delay.h>
++
++#include <asm/mach/time.h>
++#include <asm/mach-types.h>
++
++#include <mach/board.h>
++#include <mach/gpio.h>
++#include <mach/xxsvideofb.h>
++#include <mach/can.h>
++#include <mach/audio.h>
++
++#include <asm/dma.h>
++
++#include "generic.h"
++
++/* --------------------------------------------------------------------
++ *  SMSC LAN9218 Ethernet (using smc911x.c driver)
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_SMC911X) || defined(CONFIG_SMC911X_MODULE)
++static struct resource  smsc911x_resources[] = {
++	[0] = {
++		.start	= JADE_XSC0_PHYS_BASE,
++		.end	= JADE_XSC0_PHYS_BASE + 0x100 - 1,
++		.flags	= IORESOURCE_MEM,
++	},
++	[1] = {
++		.start	= INT_ETHERNET,
++		.end	= INT_ETHERNET,
++		.flags	= IORESOURCE_IRQ,
++	},
++};
++
++static struct platform_device  smsc911x_device = {
++	.name		= "smc911x",
++	.id		= 0,
++	.num_resources	= ARRAY_SIZE(smsc911x_resources),
++	.resource	= smsc911x_resources,
++};
++
++void __init xxsvideo_add_device_eth(struct xxsvideo_eth_data *data)
++{
++	platform_device_register(&smsc911x_device);
++}
++
++#else
++void __init xxsvideo_add_device_eth(struct xxsvideo_eth_data *data) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  M41T81 RTC
++ * -------------------------------------------------------------------- */
++
++static struct i2c_board_info rtcinfo __initdata = {
++	I2C_BOARD_INFO("m41t81", 0x68),
++};
++
++/* --------------------------------------------------------------------
++ *  MCP23017 I/O Expander
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_XXSVIDEO_IOEXPANDER) || defined(CONFIG_XXSVIDEO_IOEXPANDER_MODULE)
++static struct i2c_board_info ioexp0 __initdata = {
++	I2C_BOARD_INFO("ioexpander", 0x20),
++};
++
++void __init xxsvideo_add_device_ioexpander(void)
++{
++	i2c_register_board_info(0, &ioexp0, 1);
++}
++
++#else
++void __init xxsvideo_add_device_ioexpander(void) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  SiI 164 PanelLink Transmitter
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_XXSVIDEO_SII164) || defined(CONFIG_XXSVIDEO_SII164_MODULE)
++static struct i2c_board_info sii_info1 __initdata = {
++	I2C_BOARD_INFO("sii164", 0x38),
++};
++
++static struct i2c_board_info sii_info2 __initdata = {
++	I2C_BOARD_INFO("sii164", 0x39),
++};
++
++void __init xxsvideo_add_device_sii164(void)
++{
++	i2c_register_board_info(0, &sii_info1, 1);
++	i2c_register_board_info(0, &sii_info2, 1);
++}
++#else
++void __init xxsvideo_add_device_sii164(void) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  GPIO Buttons
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_XXSVIDEO_KEYS) || defined(CONFIG_XXSVIDEO_KEYS_MODULE)
++static struct xxsvideo_gpio_keys_button xxsvideo_buttons[] = {
++	{
++		.gpio           = 211,
++		.desc           = "Button 0",
++		.active_low     = 1,
++		.type           = EV_KEY,
++		.code           = KEY_1,
++	},
++	{
++		.gpio           = 212,
++		.desc           = "Button 1",
++		.active_low     = 1,
++		.type           = EV_KEY,
++		.code           = KEY_2,
++	},
++	{
++		.gpio           = 213,
++		.desc           = "Button 2",
++		.active_low     = 1,
++		.type           = EV_KEY,
++		.code           = KEY_3,
++	},
++};
++
++static struct gpio_keys_platform_data xxsvideo_button_data = {
++	.buttons        = xxsvideo_buttons,
++	.nbuttons       = ARRAY_SIZE(xxsvideo_buttons),
++};
++
++static struct platform_device xxsvideo_button_device = {
++	.name           = "xxsvideo-keys",
++	.id             = -1,
++	.num_resources  = 0,
++	.dev            = {
++		.platform_data  = &xxsvideo_button_data,
++	}
++};
++
++static void __init xxsvideo_add_device_buttons(void)
++{
++	platform_device_register(&xxsvideo_button_device);
++}
++#else
++static void __init xxsvideo_add_device_buttons(void) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  CAN
++ * -------------------------------------------------------------------- */
++
++static struct xxsvideo_ccan_gpio xxsvideo_ccan = {
++	.id 		= 0,
++	.gpio_outen 	= -1,
++	.gpio_standby	= -1,
++	.standby_active_low = 0,
++	.gpio_wake	= -1,
++};
++
++static struct xxsvideo_ccan_gpio xxsvideo_ccan_1 = {
++	.id		= 1,
++	.gpio_outen	= -1,
++	.gpio_standby	= -1,
++	.standby_active_low = 0,
++	.gpio_wake	= -1,
++};
++
++/* --------------------------------------------------------------------
++ *  SPI
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_SPI_XXSVIDEO) || defined(CONFIG_SPI_XXSVIDEO_MODULE)
++static u64 spi_dmamask = 0xffffffffUL;
++
++static struct resource spi0_resources[] = {
++	[0] = {
++		.start	= JADE_SPI_BASE,
++		.end	= JADE_SPI_BASE + SZ_16K - 1,
++		.flags	= IORESOURCE_MEM,
++	},
++	[1] = {
++		.start	= INT_SPI,
++		.end	= INT_SPI,
++		.flags	= IORESOURCE_IRQ,
++	},
++};
++
++static struct platform_device xxsvideo_spi0_device = {
++	.name		= "xxsvideo_spi",
++	.id		= 0,
++	.dev		= {
++				.dma_mask		= &spi_dmamask,
++				.coherent_dma_mask	= 0xffffffff,
++	},
++	.resource	= spi0_resources,
++	.num_resources	= ARRAY_SIZE(spi0_resources),
++};
++
++void __init xxsvideo_add_device_spi(struct spi_board_info *devices, int nr_devices)
++{
++	u32 cmux_md, cmpx_mode_11;
++
++	/* check if SPI-0 is enabled in pin multiplex */
++	cmux_md = __raw_readl(JADE_CCNT_BASE+JADE_CCNT_CMUX_MD);
++	cmpx_mode_11 = ((cmux_md >> 27) & 0x1);
++	if (cmpx_mode_11 != 0) {
++		printk(KERN_WARNING "%s: CMUX_MD.CMPX_MODE_11 = %u, "
++		       "skipping SPI-0 driver\n", __func__, cmpx_mode_11);
++		return;
++	}
++
++	spi_register_board_info(devices, nr_devices);
++
++//	xxsvideo_clock_associate("spi0_clk", &xxsvideo_spi0_device.dev, "spi_clk");
++	platform_device_register(&xxsvideo_spi0_device);
++}
++#else
++void __init xxsvideo_add_device_spi(struct spi_board_info *devices, int nr_devices) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  SPI devices
++ * -------------------------------------------------------------------- */
++
++// static struct spi_board_info jadeevalkit_spi_devices[] = {
++// 	{	/* DAC? */
++// 		.modalias	= "at73c213",
++// 		.chip_select	= 0,
++// 		.max_speed_hz	= 10 * 1000 * 1000,
++// 		.bus_num	= 1,
++// 	},
++// };
++
++// static struct m41t94_platform_data ads_info = {
++// 	.model			= 7812,
++// 	.x_min			= 150,
++// 	.x_max			= 3830,
++// 	.y_min			= 190,
++// 	.y_max			= 3830,
++// 	.vref_delay_usecs	= 100,
++// 	.x_plate_ohms		= 450,
++// 	.y_plate_ohms		= 250,
++// 	.pressure_max		= 15000,
++// 	.debounce_max		= 1,
++// 	.debounce_rep		= 0,
++// 	.debounce_tol		= (~0),
++// //	.get_pendown_state	= ads7843_pendown_state,
++// };
++
++static struct spi_board_info xxsvideo_spi_devices[] = {
++	{
++		.modalias	= "m41t94",
++//		.platform_data	= &ads_info,
++		.chip_select	= 1,
++		.max_speed_hz	= 125000 * 26,	/* (max sample rate @ 3V) * (cmd + data + overhead) */
++		.bus_num	= 0,
++	},
++};
++
++/* --------------------------------------------------------------------
++ *  Sound: I2S
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_SND_XXSVIDEO_ALSA_SOC_I2S) || defined(CONFIG_SND_XXSVIDEO_ALSA_SOC_I2S_MODULE)
++static struct xxsvideo_i2s xxsvideo_sound_soc_i2s = {
++	.id 		= 0,
++	.channel	= 0,
++} ;
++
++static struct resource xxsvideo_i2s_resources[] = {
++	[0] = {
++		.start	= JADE_I2S0_BASE,
++		.end	= JADE_I2S0_BASE + SZ_4K - 1,
++		.flags	= IORESOURCE_MEM,
++	},
++	[1] = {
++		.start	= INT_I2S0,
++		.end	= INT_I2S0,
++		.flags	= IORESOURCE_IRQ,
++	},
++	/*
++	 * DMA parameters
++	 */
++	[2] = {
++		.start	= DMACH_I2S0_OUT,
++		.end	= DMACH_I2S0_OUT,
++		.flags	= IORESOURCE_DMA,
++	},
++	[3] = {
++		.start	= DMACH_I2S0_IN,
++		.end	= DMACH_I2S0_IN,
++		.flags	= IORESOURCE_DMA,
++	},
++	[4] = {
++		.start	= JADE_I2S0_PHYS_BASE,
++		.end	= JADE_I2S0_PHYS_BASE + SZ_4K - 1,
++		.flags	= IORESOURCE_MEM,
++	},
++};
++
++static struct platform_device xxsvideo_i2s_device = {
++	.name		= "xxsvideo_i2s",
++	.id		= 0,
++	.resource	= xxsvideo_i2s_resources,
++	.num_resources	= ARRAY_SIZE(xxsvideo_i2s_resources),
++	.dev		= {
++				.platform_data	= &xxsvideo_sound_soc_i2s,
++	},
++};
++
++void __init xxsvideo_add_device_i2s(void)
++{
++	u32 cmux_md, cmpx_mode_6;
++
++	/* check if I2S-0 is enabled in pin multiplex */
++	cmux_md = __raw_readl(JADE_CCNT_BASE+JADE_CCNT_CMUX_MD);
++	cmpx_mode_6 = ((cmux_md >> 21) & 0x1);
++	if (cmpx_mode_6 != 0) {
++		printk(KERN_WARNING "%s: CMUX_MD.CMPX_MODE_6 = %u, "
++		       "skipping I2S-0 driver\n", __func__, cmpx_mode_6);
++		return;
++	}
++
++	platform_device_register(&xxsvideo_i2s_device);
++}
++#else
++void __init xxsvideo_add_device_i2s(void) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  Sound: Codec
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_SND_XXSVIDEO_ALSA_EVALKIT_CS4245) || defined(CONFIG_SND_XXSVIDEO_ALSA_EVALKIT_CS4245_MODULE)
++static struct i2c_board_info xxsvideo_sound_info __initdata = {
++	I2C_BOARD_INFO("cs4245", 0x4e),
++};
++
++void __init xxsvideo_add_device_sound(void)
++{
++	printk("/ab/%s: ..\n", __func__);
++	i2c_register_board_info(1, &xxsvideo_sound_info, 1);
++}
++#else
++void __init xxsvideo_add_device_sound(void) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  Machine Description
++ * -------------------------------------------------------------------- */
++
++static void xxsvideo_reset(void)
++{
++	/*
++	 * reset as many SoC modules as possible
++	 */
++	__raw_writel(0, JADE_I2S0_BASE + JADE_I2S_INTCNT);	
++	__raw_writel(0, JADE_DMAC_BASE + JADE_DMACR);	
++	__raw_writel(0, JADE_I2S0_BASE + JADE_I2S_DMAACT);	
++	__raw_writel(0, JADE_I2S0_BASE + JADE_I2S_OPRREG);	
++	udelay(100);
++	__raw_writel(0xffffffff, JADE_CCNT_BASE + JADE_CCNT_CMSR0);
++	__raw_writel(0xdcfffffd, JADE_CCNT_BASE + JADE_CCNT_CMSR1);
++	__raw_writel(0xffffffff, JADE_CCNT_BASE + JADE_CCNT_CMSR2);
++	udelay(100);
++	__raw_writel(0, JADE_CCNT_BASE + JADE_CCNT_CMSR0);
++	__raw_writel(0, JADE_CCNT_BASE + JADE_CCNT_CMSR1);
++	__raw_writel(0, JADE_CCNT_BASE + JADE_CCNT_CMSR2);
++}
++
++static void __init jadedevalkit_init_irq(void)
++{
++	xxsvideo_init_interrupts();
++
++	/*
++	 * INT_A0   high level  Ethernet
++	 * INT_A1   low level   USB, Codec
++	 * INT_A2   low level   INIC
++	 * INT_A3   low level   I/O Expander
++	 */
++	set_irq_type(INT_EXT_0, IRQ_TYPE_LEVEL_HIGH);
++	set_irq_type(INT_EXT_1, IRQ_TYPE_LEVEL_LOW);
++	set_irq_type(INT_EXT_2, IRQ_TYPE_LEVEL_LOW);
++	set_irq_type(INT_EXT_3, IRQ_TYPE_LEVEL_LOW);
++}
++
++static void __init jadedevalkit_map_io(void)
++{
++	xxsvideo_initialize(0);
++}
++
++static void __init jadedevalkit_board_init(void)
++{
++	/* set reset function */
++	xxsvideo_arch_reset = xxsvideo_reset;
++
++	/*
++	 * Add platform devices.
++	 */
++
++	/* UART */
++	xxsvideo_add_device_serial();
++
++	/* NOR flash */
++	xxsvideo_add_device_nor();
++
++	/* framebuffer */
++	xxsvideo_add_device_fb(0, 0x00010104); /* DCKinv=1 DCKD=4 */
++	xxsvideo_add_device_fb(1, 0x00010100); /* DCKinv=1 DCKD=0 */
++
++	/* I2C */
++	xxsvideo_add_device_i2c();
++
++	/* RTC */
++	i2c_register_board_info(0, &rtcinfo, 1);
++
++	/* I/O Expander */
++	xxsvideo_add_device_ioexpander();
++
++	/* SiI 164 PanelLink Transmitter */
++	xxsvideo_add_device_sii164();
++
++	/* Ethernet */
++	xxsvideo_add_device_eth(NULL);
++
++	/* CryptoMemory */
++	xxsvideo_add_device_cryptoeeprom();
++
++	/* push buttons */
++	xxsvideo_add_device_buttons();
++
++	/* CAN */
++	xxsvideo_add_device_ccan(&xxsvideo_ccan);
++	xxsvideo_add_device_ccan(&xxsvideo_ccan_1);
++
++	/* SPI */
++	xxsvideo_add_device_spi(xxsvideo_spi_devices, ARRAY_SIZE(xxsvideo_spi_devices));
++
++	/* sound */
++	xxsvideo_add_device_i2s();
++	xxsvideo_add_device_sound();
++
++	/*
++	 * For information purposes during development.
++	 */
++
++	printk("/tb/ %s: CCID=0x%08x\n", __func__, 
++	       __raw_readl(JADE_CCNT_BASE+0x00));
++	printk("/tb/ %s: CMUX_MD=0x%08x CEX_PIN_ST=0x%08x\n", __func__, 
++	       __raw_readl(JADE_CCNT_BASE+0x30), 
++	       __raw_readl(JADE_CCNT_BASE+0x34));
++}
++
++MACHINE_START(XXSVIDEOD, "mycable/Fujitsu Jade-D Eval Kit")
++	.phys_io	= JADE_UART0_PHYS_BASE,
++	.io_pg_offst	= ((u32)(JADE_UART0_BASE) >> 18) & 0xfffc,
++	.boot_params	= 0x40000000 + 0x100,
++	.timer		= &xxsvideo_timer,
++	.map_io		= jadedevalkit_map_io,
++	.init_irq	= jadedevalkit_init_irq,
++	.init_machine	= jadedevalkit_board_init,
++MACHINE_END
+--- linux-2.6.27.21/arch/arm/mach-xxsvideo/xxsvideo.c	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/mach-xxsvideo/xxsvideo.c	2010-07-05 08:45:44.000000000 +0000
+@@ -0,0 +1,779 @@
++/*
++ * linux/arch/arm/mach-xxsvideo/xxsvideo.c
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Carsten Schneider <cs@mycable.de>, Tiemo Krueger <tk@mycable.de>
++ *
++ * mycable XXSvideo SoC support
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++#include <linux/types.h>
++#include <linux/init.h>
++#include <linux/mm.h>
++#include <linux/module.h>
++#include <linux/platform_device.h>
++#include <linux/mtd/physmap.h>
++#include <linux/serial.h>
++#include <linux/serial_8250.h>
++#include <linux/time.h>
++
++#include <asm/mach-types.h>
++#include <asm/setup.h>
++
++#include <asm/mach/arch.h>
++#include <asm/mach/flash.h>
++#include <asm/mach/map.h>
++
++#include <mach/serial.h>
++#include <asm/mach/time.h>
++
++#include <mach/board.h>
++#include <mach/gpio.h>
++#include <mach/xxsvideofb.h>
++#include <mach/can.h>
++
++#include "generic.h"
++#define CLOCK_F_XCKK	13500000
++
++static unsigned long f_cclk;
++
++/* --------------------------------------------------------------------
++ *  architecture-specific I/O mappings
++ * -------------------------------------------------------------------- */
++
++static struct map_desc xxsvideo_io_desc[] __initdata = {
++	{
++		.virtual	= JADE_GDC_BASE,
++		.pfn		= __phys_to_pfn(JADE_GDC_PHYS_BASE),
++		.length		= SZ_256K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_I2S0_BASE,
++		.pfn		= __phys_to_pfn(JADE_I2S0_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_I2S1_BASE,
++		.pfn		= __phys_to_pfn(JADE_I2S1_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_I2S2_BASE,
++		.pfn		= __phys_to_pfn(JADE_I2S2_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_CCNT_BASE,
++		.pfn		= __phys_to_pfn(JADE_CCNT_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_PWM0_BASE,
++		.pfn		= __phys_to_pfn(JADE_PWM0_PHYS_BASE),
++		.length		= SZ_256,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_PWM1_BASE,
++		.pfn		= __phys_to_pfn(JADE_PWM1_PHYS_BASE),
++		.length		= SZ_256,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_SPI_BASE,
++		.pfn		= __phys_to_pfn(JADE_SPI_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_CAN0_BASE,
++		.pfn		= __phys_to_pfn(JADE_CAN0_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_CAN1_BASE,
++		.pfn		= __phys_to_pfn(JADE_CAN1_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_I2C0_BASE,
++		.pfn		= __phys_to_pfn(JADE_I2C0_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_I2C1_BASE,
++		.pfn		= __phys_to_pfn(JADE_I2C1_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_EHCI_BASE,
++		.pfn		= __phys_to_pfn(JADE_EHCI_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_OHCI_BASE,
++		.pfn		= __phys_to_pfn(JADE_OHCI_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_PHYCNT_BASE,
++		.pfn		= __phys_to_pfn(JADE_PHYCNT_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_IRC1_BASE,
++		.pfn		= __phys_to_pfn(JADE_IRC1_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_DMAC_BASE,
++		.pfn		= __phys_to_pfn(JADE_DMAC_PHYS_BASE),
++		.length		= SZ_64K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_TIMER_BASE,
++		.pfn		= __phys_to_pfn(JADE_TIMER_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_UART0_BASE,
++		.pfn		= __phys_to_pfn(JADE_UART0_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_UART1_BASE,
++		.pfn		= __phys_to_pfn(JADE_UART1_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_IRCE_BASE,
++		.pfn		= __phys_to_pfn(JADE_IRCE_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_CRG_BASE,
++		.pfn		= __phys_to_pfn(JADE_CRG_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_IRC0_BASE,
++		.pfn		= __phys_to_pfn(JADE_IRC0_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_GPIO_BASE,
++		.pfn		= __phys_to_pfn(JADE_GPIO_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_XSC0_BASE,
++		.pfn		= __phys_to_pfn(JADE_XSC0_PHYS_BASE),
++		.length		= SZ_1M,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_XSC4_BASE,
++		.pfn		= __phys_to_pfn(JADE_XSC4_PHYS_BASE),
++		.length		= SZ_32M,
++		.type		= MT_DEVICE,
++	}
++};
++
++void __init xxsvideo_initialize(unsigned long main_clock)
++{
++	/* Map peripherals */
++	iotable_init(xxsvideo_io_desc, ARRAY_SIZE(xxsvideo_io_desc));
++}
++
++/* --------------------------------------------------------------------
++ *  GPIOs
++ * -------------------------------------------------------------------- */
++
++void __init xxsvideo_add_device_gpio(int pin, char *pin_name)
++{
++	u32 cmux_md, mpx_mode_4, mpx_mode_2;
++	u32 cex_pin_st, mpx_mode_1;
++
++	if (pin < 0 || pin >= 24)
++		return;
++
++	cmux_md = __raw_readl(JADE_CCNT_BASE+0x30);
++	mpx_mode_4 = ((cmux_md >> 4) & 0x3);
++	mpx_mode_2 = ((cmux_md >> 0) & 0x7);
++	cex_pin_st = __raw_readl(JADE_CCNT_BASE+0x34);
++	mpx_mode_1 = ((cex_pin_st >> 0) & 0x3);
++
++	if (pin < 2) {
++		if (mpx_mode_2 != 4)
++			printk(KERN_WARNING "%s: MPX_MODE_2=%u, GPIO %d (%s) "
++			       "dead\n", __func__, mpx_mode_2, pin, pin_name);
++	}
++	else if (pin < 6) {
++		if (mpx_mode_2 != 2 && mpx_mode_2 != 3 && mpx_mode_2 != 4)
++			printk(KERN_WARNING "%s: MPX_MODE_2=%u, GPIO %d (%s) "
++			       "dead\n", __func__, mpx_mode_2, pin, pin_name);
++	}
++	else if (pin < 13) {
++		if (mpx_mode_1 != 2)
++			printk(KERN_WARNING "%s: MPX_MODE_1=%u, GPIO %d (%s) "
++			       "dead\n", __func__, mpx_mode_1, pin, pin_name);
++	}
++	else {
++		if (mpx_mode_4 != 1)
++			printk(KERN_WARNING "%s: MPX_MODE_4=%u, GPIO %d (%s) "
++			       "dead\n", __func__, mpx_mode_4, pin, pin_name);
++	}
++}
++
++/* --------------------------------------------------------------------
++ *  USB Host
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_USB_OHCI_HCD) || defined(CONFIG_USB_OHCI_HCD_MODULE)
++static u64 ohci_dmamask = 0xffffffffUL;
++static struct xxsvideo_usbh_data  usbh_ohci_data  = {
++        .ports          = 1,
++};
++
++static struct resource  usbh_resources[] = {
++	[0] = {
++		.start	= JADE_OHCI_PHYS_BASE,
++		.end	= JADE_OHCI_PHYS_BASE + SZ_4K - 1,
++		.flags	= IORESOURCE_MEM,
++	},
++	[1] = {
++		.start	= INT_OHCI,
++		.end	= INT_OHCI,
++		.flags	= IORESOURCE_IRQ,
++	},
++};
++
++static struct platform_device  xxsvideo_usbh_device = {
++	.name		= "xxsvideo_ohci",
++	.id		= -1,
++	.dev		= {
++				.dma_mask		= &ohci_dmamask,
++				.coherent_dma_mask	= 0xffffffff,
++				.platform_data		= &usbh_ohci_data,
++	},
++	.resource	= usbh_resources,
++	.num_resources	= ARRAY_SIZE(usbh_resources),
++};
++
++void __init xxsvideo_add_device_usbh_ohci(void)
++{
++unsigned long chip_id;
++
++	printk("/ab/%s:\n", __func__);
++	chip_id = __raw_readl(JADE_CCNT_BASE);
++
++	/* ohci fixed in ES2 == 0x20061001 */
++	if (chip_id > 0x20061000)
++		platform_device_register(&xxsvideo_usbh_device);
++}
++#else
++void __init xxsvideo_add_device_usbh_ohci(void) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  USB 2.0 (EHCI) Host
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_USB_EHCI_HCD) || defined(CONFIG_USB_EHCI_HCD_MODULE)
++static u64 ehci_dmamask = 0xffffffffUL;
++static struct xxsvideo_usbh_data  usbh_ehci_data  = {
++        .ports          = 1,
++};
++
++static struct resource  usbh_ehci_resources[] = {
++	[0] = {
++		.start	= JADE_EHCI_PHYS_BASE,
++		.end	= JADE_EHCI_PHYS_BASE + SZ_4K - 1,
++		.flags	= IORESOURCE_MEM,
++	},
++	[1] = {
++		.start	= INT_EHCI,
++		.end	= INT_EHCI,
++		.flags	= IORESOURCE_IRQ,
++	},
++};
++
++static struct platform_device  xxsvideo_usbh_ehci_device  = {
++	.name		= "xxsvideo_ehci",
++	.id		= -1,
++	.dev		= {
++				.dma_mask		= &ehci_dmamask,
++				.coherent_dma_mask	= 0xffffffff,
++				.platform_data		= &usbh_ehci_data,
++	},
++	.resource	= usbh_ehci_resources,
++	.num_resources	= ARRAY_SIZE(usbh_ehci_resources),
++};
++
++void __init xxsvideo_add_device_usbh_ehci(void)
++{
++unsigned long chip_id;
++
++	printk("/ab/%s:\n", __func__);
++	chip_id = __raw_readl(JADE_CCNT_BASE);
++
++	/* ehci fixed in ES3 == 0x20061002 */
++	if (chip_id > 0x20061001)
++		platform_device_register(&xxsvideo_usbh_ehci_device);
++}
++#else
++void __init xxsvideo_add_device_usbh_ehci(void) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  UART 0 & 1
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_SERIAL_8250)
++static struct resource  xxsvideo_uart_resources[] = {
++
++    [0] = {
++        .start      = JADE_UART0_BASE,
++        .end        = JADE_UART0_BASE + 0x0fff,
++        .flags      = IORESOURCE_MEM,
++    },
++    [1] = {
++        .start      = JADE_UART1_BASE,
++        .end        = JADE_UART1_BASE + 0x0fff,
++        .flags      = IORESOURCE_MEM,
++    },
++};
++
++static struct plat_serial8250_port  xxsvideo_uart_data[] = {
++    [0] = {
++        .membase    = (unsigned char *)JADE_UART0_BASE,
++        .mapbase    = JADE_UART0_PHYS_BASE,
++        .irq        = IRQ_UARTINT0,
++        .flags      = UPF_BOOT_AUTOCONF | UPF_SKIP_TEST,
++        .iotype     = UPIO_MEM,
++        .regshift   = 2,
++    },
++    [1] = {
++        .membase    = (unsigned char *)JADE_UART1_BASE,
++        .mapbase    = JADE_UART1_PHYS_BASE,
++        .irq        = IRQ_UARTINT1,
++        .flags      = UPF_BOOT_AUTOCONF | UPF_SKIP_TEST,
++        .iotype     = UPIO_MEM,
++        .regshift   = 2,
++    },
++    [2] = {
++        .flags 	    = 0,
++    },
++};
++
++static struct platform_device  xxsvideo_uart = {
++	.name			= "serial8250",
++	.id			= PLAT8250_DEV_PLATFORM,
++	.dev.platform_data	= xxsvideo_uart_data,
++	.num_resources		= 2,
++	.resource		= xxsvideo_uart_resources,
++};
++
++void __init xxsvideo_add_device_serial(void)
++{
++	/* set uartclk to APB-clock */
++	xxsvideo_uart_data[0].uartclk = f_cclk >> (__raw_readl(JADE_CRG_BASE+0x10)>>3 & 0x03);
++	xxsvideo_uart_data[1].uartclk = f_cclk >> (__raw_readl(JADE_CRG_BASE+0x10)>>3 & 0x03);
++	platform_device_register(&xxsvideo_uart);
++}
++
++#else
++void __init xxsvideo_add_device_serial(void) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  I2C
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_I2C_XXSVIDEO) || defined(CONFIG_I2C_XXSVIDEO_MODULE)
++static struct resource xxsvideo_i2c_resources[] = {
++	[0] = {
++		.start	= JADE_I2C0_PHYS_BASE,
++		.end	= JADE_I2C0_PHYS_BASE + SZ_4K - 1,
++		.flags	= IORESOURCE_MEM,
++	},
++	[1] = {
++		.start	= INT_I2C0,
++		.end	= INT_I2C0,
++		.flags	= IORESOURCE_IRQ,
++	},
++};
++
++static struct resource xxsvideo_i2c_resources_1[] = {
++	[0] = {
++		.start	= JADE_I2C1_PHYS_BASE,
++		.end	= JADE_I2C1_PHYS_BASE + SZ_4K - 1,
++		.flags	= IORESOURCE_MEM,
++	},
++	[1] = {
++		.start	= INT_I2C1,
++		.end	= INT_I2C1,
++		.flags	= IORESOURCE_IRQ,
++	},
++};
++
++static struct platform_device xxsvideo_i2c_device = {
++	.name		= "xxsvideo_i2c",
++	.id		= 0,
++	.resource	= xxsvideo_i2c_resources,
++	.num_resources	= ARRAY_SIZE(xxsvideo_i2c_resources),
++};
++
++static struct platform_device xxsvideo_i2c_device_1 = {
++	.name		= "xxsvideo_i2c",
++	.id		= 1,
++	.resource	= xxsvideo_i2c_resources_1,
++	.num_resources	= ARRAY_SIZE(xxsvideo_i2c_resources_1),
++};
++
++void __init xxsvideo_add_device_i2c(void)
++{
++	platform_device_register(&xxsvideo_i2c_device);
++	platform_device_register(&xxsvideo_i2c_device_1);
++}
++#else
++void __init xxsvideo_add_device_i2c(void) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  I2C - Cryptoeeprom
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_CRYPTOEEPROM) || defined(CONFIG_CRYPTOEEPROM_MODULE)
++/*
++ * Atmel AT88SC0808
++ */
++static struct i2c_board_info cryptoeeprom __initdata = {
++                 I2C_BOARD_INFO("cryptoeeprom", 0x58),
++};
++
++void __init xxsvideo_add_device_cryptoeeprom(void)
++{
++	i2c_register_board_info(0, &cryptoeeprom, 1);
++
++}
++
++#else
++void __init xxsvideo_add_device_cryptoeeprom(void) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  FRAMEBUFFER
++ * -------------------------------------------------------------------- */
++
++/*
++ * For valid resolution IDs look at fb_modes.c:
++ * - 800x600:   0
++ * - 800x480:   1
++ * - 640x480:   2
++ * - 1280x1024: 3
++ * - 1024x768:  4
++ */
++
++#if defined(CONFIG_FB_XXSVIDEO) || defined(CONFIG_FB_XXSVIDEO_MODULE)
++
++static struct resource xxsvideo_fb_resources_0[] = {
++	[0] = {
++		.start	= JADE_GDC_PHYS_DISP_BASE,
++		.end	= JADE_GDC_PHYS_DISP_BASE + SZ_256K - 1,
++		.flags	= IORESOURCE_MEM,
++	},
++};
++
++static struct resource xxsvideo_fb_resources_1[] = {
++	[0] = {
++		.start	= JADE_GDC_PHYS_DISP_BASE + SZ_8K,
++		.end	= JADE_GDC_PHYS_DISP_BASE + SZ_256K - 1,
++		.flags	= IORESOURCE_MEM,
++	},
++};
++
++static struct xxsvideofb_plat_data xxsvideo_fb_plat_data_0 = {
++#if defined(CONFIG_FB_XXSVIDEO_FB0_800_600)
++	.mode_info      = &xxsvideofb_fb_modes[0],
++#elif defined(CONFIG_FB_XXSVIDEO_FB0_800_480)
++	.mode_info      = &xxsvideofb_fb_modes[1],
++#elif defined(CONFIG_FB_XXSVIDEO_FB0_640_480)
++	.mode_info      = &xxsvideofb_fb_modes[2],
++#elif defined(CONFIG_FB_XXSVIDEO_FB0_1280_1024)
++	.mode_info      = &xxsvideofb_fb_modes[3],
++#elif defined(CONFIG_FB_XXSVIDEO_FB0_1024_768)
++	.mode_info      = &xxsvideofb_fb_modes[4],
++#else
++	.mode_info      = NULL,
++#endif
++};
++
++static struct xxsvideofb_plat_data xxsvideo_fb_plat_data_1 = {
++#if defined(CONFIG_FB_XXSVIDEO_FB1_800_600)
++	.mode_info      = &xxsvideofb_fb_modes[0],
++#elif defined(CONFIG_FB_XXSVIDEO_FB1_800_480)
++	.mode_info      = &xxsvideofb_fb_modes[1],
++#elif defined(CONFIG_FB_XXSVIDEO_FB1_640_480)
++	.mode_info      = &xxsvideofb_fb_modes[2],
++#elif defined(CONFIG_FB_XXSVIDEO_FB1_1280_1024)
++	.mode_info      = &xxsvideofb_fb_modes[3],
++#elif defined(CONFIG_FB_XXSVIDEO_FB1_1024_768)
++	.mode_info      = &xxsvideofb_fb_modes[4],
++#else
++	.mode_info      = NULL,
++#endif
++};
++
++static struct platform_device xxsvideo_fb_device = {
++	.name		= "xxsvideo_fb",
++	.id		= 0,
++	.resource	= xxsvideo_fb_resources_0,
++	.num_resources	= ARRAY_SIZE(xxsvideo_fb_resources_0),
++	.dev.platform_data = &xxsvideo_fb_plat_data_0,
++};
++
++static struct platform_device xxsvideo_fb_device1 = {
++	.name		= "xxsvideo_fb",
++	.id		= 1,
++	.resource	= xxsvideo_fb_resources_1,
++	.num_resources	= ARRAY_SIZE(xxsvideo_fb_resources_1),
++	.dev.platform_data = &xxsvideo_fb_plat_data_1,
++};
++
++void __init xxsvideo_add_device_fb(unsigned int fb_nr, u32 dcm3)
++{
++	if (fb_nr == 0) {
++		if (!xxsvideo_fb_plat_data_0.mode_info)
++			return;
++		xxsvideo_fb_plat_data_0.pll_clk = f_cclk*2;
++		xxsvideo_fb_plat_data_0.dcm3 = dcm3;
++		platform_device_register(&xxsvideo_fb_device);
++	}
++	else if (fb_nr == 1) {
++		if (!xxsvideo_fb_plat_data_1.mode_info)
++			return;
++		xxsvideo_fb_plat_data_1.pll_clk = f_cclk*2;
++		xxsvideo_fb_plat_data_1.dcm3 = dcm3;
++		platform_device_register(&xxsvideo_fb_device1);
++	}
++}
++
++#else
++void __init xxsvideo_add_device_fb(unsigned int fb_nr, u32 dcm3) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  NOR Flash
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_MTD_ARM_INTEGRATOR)
++static struct mtd_partition xxsvideo_flash_partitions[] = {
++         {
++                .name = "u-boot",
++                .size = 0x00020000,
++                .offset = 0x0000000,
++                .mask_flags = MTD_WRITEABLE,        /* read only */
++        },{
++                .name = "u-boot var",
++                .size = 0x00020000,
++                .offset = MTDPART_OFS_APPEND,
++                .mask_flags = MTD_WRITEABLE,        /* read only */
++        },{
++                .name = "kernel",
++                .size = 0x00200000,
++                .offset = MTDPART_OFS_APPEND,
++                //.mask_flags = MTD_WRITEABLE,        /* read only */
++        },{
++                .name = "rootfs",
++                .size = JADE_FLASH_SIZE - 0x00240000,
++                .offset = MTDPART_OFS_APPEND,
++	}
++};
++
++static struct flash_platform_data xxsvideo_flash_data = {
++        .map_name       = "cfi_probe",
++        .width          = 2,
++        .parts		= xxsvideo_flash_partitions,
++        .nr_parts       = ARRAY_SIZE(xxsvideo_flash_partitions),
++};
++
++static struct resource  xxsvideo_flash_resource = {
++        .start          = JADE_FLASH_BASE,
++        .end            = JADE_FLASH_BASE + JADE_FLASH_SIZE - 1,
++        .flags          = IORESOURCE_MEM,
++};
++
++static struct platform_device  xxsvideo_flash_device = {
++        .name           = "armflash",
++	.id             = 0,
++        .dev            = {
++                .platform_data  = &xxsvideo_flash_data,
++        },
++        .num_resources  = 1,
++        .resource       = &xxsvideo_flash_resource,
++};
++
++void __init xxsvideo_add_device_nor(void)
++{
++	platform_device_register(&xxsvideo_flash_device);
++}
++#else
++void __init xxsvideo_add_device_nor(void) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  CAN
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_XXS_C_CAN) || defined(CONFIG_XXS_C_CAN_MODULE)
++static struct resource xxsvideo_ccan_resources[] = {
++	[0] = {
++		.start	= JADE_CAN0_BASE,
++		.end	= JADE_CAN0_BASE + SZ_4K - 1,
++		.flags	= IORESOURCE_MEM,
++	},
++	[1] = {
++		.start	= INT_CAN0,
++		.end	= INT_CAN0,
++		.flags	= IORESOURCE_IRQ,
++	},
++};
++
++static struct resource xxsvideo_ccan_resources_1[] = {
++	[0] = {
++		.start	= JADE_CAN1_BASE,
++		.end	= JADE_CAN1_BASE + SZ_4K - 1,
++		.flags	= IORESOURCE_MEM,
++	},
++	[1] = {
++		.start	= INT_CAN1,
++		.end	= INT_CAN1,
++		.flags	= IORESOURCE_IRQ,
++	},
++};
++
++static struct platform_device xxsvideo_ccan_device = {
++	.name		= "xxsvideo_ccan",
++	.id		= 0,
++	.resource	= xxsvideo_ccan_resources,
++	.num_resources	= ARRAY_SIZE(xxsvideo_ccan_resources),
++};
++
++static struct platform_device xxsvideo_ccan_device_1 = {
++	.name		= "xxsvideo_ccan",
++	.id		= 1,
++	.resource	= xxsvideo_ccan_resources_1,
++	.num_resources	= ARRAY_SIZE(xxsvideo_ccan_resources_1),
++};
++
++void __init xxsvideo_add_device_ccan(struct xxsvideo_ccan_gpio *gpio)
++{
++	u32 cmux_md, mpx_mode;
++
++	cmux_md = __raw_readl(JADE_CCNT_BASE+0x30);
++
++#ifdef CONFIG_MACH_XXSVIDEO_CAN_GROUP2
++	mpx_mode = ((cmux_md >> 0) & 0x7); /* MPX_MODE_2 */
++	if (mpx_mode != 2 && mpx_mode != 3 && mpx_mode != 4) {
++		printk(KERN_WARNING "%s: MPX_MODE_2 = %u, skipping CAN-%u "
++		       "driver\n", __func__, mpx_mode, gpio->id);
++		return;
++	}
++#else /* CAN multiplex group #4 */
++	mpx_mode = ((cmux_md >> 4) & 0x3); /* MPX_MODE_4 */
++	if (mpx_mode != 1) {
++		printk(KERN_WARNING "%s: MPX_MODE_4 = %u, skipping CAN-%u "
++		       "driver\n", __func__, mpx_mode, gpio->id);
++		return;
++	}
++#endif /* CONFIG_MACH_XXSVIDEO_CAN_GROUP2 */
++
++	if (gpio->id == 0) {
++		xxsvideo_add_device_gpio(gpio->gpio_outen, "CAN-0 outen");
++		xxsvideo_add_device_gpio(gpio->gpio_standby, "CAN-0 standby");
++		xxsvideo_add_device_gpio(gpio->gpio_wake, "CAN-0 wake");
++		xxsvideo_ccan_device.dev.platform_data = gpio;
++		platform_device_register(&xxsvideo_ccan_device);
++	}
++	else if (gpio->id == 1) {
++		xxsvideo_add_device_gpio(gpio->gpio_outen, "CAN-1 outen");
++		xxsvideo_add_device_gpio(gpio->gpio_standby, "CAN-1 standby");
++		xxsvideo_add_device_gpio(gpio->gpio_wake, "CAN-1 wake");
++		xxsvideo_ccan_device_1.dev.platform_data = gpio;
++		platform_device_register(&xxsvideo_ccan_device_1);
++	}
++}
++#else
++void __init xxsvideo_add_device_ccan(struct xxsvideo_ccan_gpio *gpio) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  System Timer
++ * -------------------------------------------------------------------- */
++
++static void  xxsvideo_init_timer(void)
++{
++	unsigned long f_pa_clk;
++	int ret;
++
++	switch (__raw_readl(JADE_CRG_BASE+0x00) & 0x1f) {
++		case 0:	f_cclk = CLOCK_F_XCKK * 49 / 2;
++			break;
++		case 1:	f_cclk = CLOCK_F_XCKK * 46 / 2;
++			break;
++		case 2:	f_cclk = CLOCK_F_XCKK * 37 / 2;
++			break;
++		case 3:	f_cclk = CLOCK_F_XCKK * 20 / 2;
++			break;
++		case 4:	f_cclk = CLOCK_F_XCKK * 47 / 2;
++			break;
++		case 5:	f_cclk = CLOCK_F_XCKK * 44 / 2;
++			break;
++		case 6:	f_cclk = CLOCK_F_XCKK * 36 / 2;
++			break;
++		case 7:	f_cclk = CLOCK_F_XCKK * 19 / 2;
++			break;
++		case 8:	f_cclk = CLOCK_F_XCKK * 39 / 2;
++			break;
++		case 9:	f_cclk = CLOCK_F_XCKK * 38 / 2;
++			break;
++		case 10:	f_cclk = CLOCK_F_XCKK * 30 / 2;
++			break;
++		case 11:	f_cclk = CLOCK_F_XCKK * 15 / 2;
++			break;
++	}
++
++	/* Jade Timer uses the APB clock as base clock. It depends on
++	Clock Divider Control Register A (offset 0x10) */
++	f_pa_clk = f_cclk >> (__raw_readl(JADE_CRG_BASE+0x10)>>3 & 0x07);
++	printk("/ab/%s: f_PA_CLK = %lu Hz, f_cclk = %lu HZ\n", __func__, f_pa_clk, f_cclk);
++	printk("/ab/%s: CONFIG_JADE_PACLK_FREQ = %d Hz\n", __func__, CONFIG_JADE_PACLK_FREQ);
++
++	/* check CONFIG_JADE_PACLK_FREQ */
++	if (CONFIG_JADE_PACLK_FREQ != f_pa_clk)
++		printk(KERN_WARNING "%s: CONFIG_JADE_PACLK_FREQ = %d, "
++		"should be %lu\n", __func__, CONFIG_JADE_PACLK_FREQ, f_pa_clk);
++
++	xxsvideo_time_init(f_pa_clk/HZ, 0);
++	printk("/ab/%s: timer_load value %lu \n", __func__, f_pa_clk/HZ);
++
++	// just for information purpose during development
++	ret = __raw_readl(JADE_CRG_BASE+JADE_CRG_CRDA);
++
++	printk("/ab/%s: f_cclk = %lu Hz\n", __func__, f_cclk);
++	printk("/ab/%s: f_ARMB_CLK = %lu Hz\n", __func__, f_cclk >>(ret>>12 & 0x07) );
++	printk("/ab/%s: f_ARMA_CLK = %lu Hz\n", __func__, f_cclk >>(ret>>9 & 0x07) );
++	printk("/ab/%s: f_PB_CLK = %lu Hz\n", __func__, f_cclk >>(ret>>6 & 0x07) );
++	printk("/ab/%s: f_PA_CLK = %lu Hz\n", __func__, f_cclk >>(ret>>3 & 0x07) );
++	printk("/ab/%s: f_HA_CLK = %lu Hz\n", __func__, f_cclk >>(ret>>0 & 0x07) );
++	printk("/ab/%s: f_HB_CLK = %lu Hz\n", __func__, f_cclk >>(__raw_readl(JADE_CRG_BASE+JADE_CRG_CRDB) & 0x07) );
++
++}
++
++struct sys_timer xxsvideo_timer = {
++	.init		= xxsvideo_init_timer,
++	.offset		= xxsvideo_gettimeoffset,
++};
++
+--- linux-2.6.27.21/arch/arm/mach-xxsvideo/xxsvideod.c	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/mach-xxsvideo/xxsvideod.c	2010-07-05 08:45:56.000000000 +0000
+@@ -0,0 +1,702 @@
++/*
++ * linux/arch/arm/mach-xxsvideo/xxsvideod.c
++ *
++ * Copyright (C) 2009, Fujitsu Microelectronics Europe GmbH
++ *      Thomas Betker <thomas.betker@fme.fujitsu.com>
++ *
++ * Copyright (C) 2007 mycable GmbH
++ *      Carsten Schneider <cs@mycable.de>, Tiemo Krueger <tk@mycable.de>
++ *
++ * Fujitsu Jade-D SoC and mycable XXSvideo-D board support.
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ */
++
++#include <linux/types.h>
++#include <linux/init.h>
++#include <linux/mm.h>
++#include <linux/module.h>
++#include <linux/platform_device.h>
++#include <linux/mtd/physmap.h>
++#include <linux/serial.h>
++#include <linux/serial_8250.h>
++#include <linux/time.h>
++
++#include <asm/mach-types.h>
++#include <asm/setup.h>
++
++#include <asm/mach/arch.h>
++#include <asm/mach/flash.h>
++#include <asm/mach/map.h>
++
++#include <mach/serial.h>
++#include <asm/mach/time.h>
++
++#include <mach/board.h>
++#include <mach/gpio.h>
++#include <mach/xxsvideofb.h>
++#include <mach/can.h>
++
++#include "generic.h"
++
++#define CLOCK_F_CLK	25000000
++
++static unsigned long f_cclk;
++
++/* --------------------------------------------------------------------
++ *  architecture-specific I/O mappings
++ * -------------------------------------------------------------------- */
++
++static struct map_desc xxsvideo_io_desc[] __initdata = {
++	{
++		.virtual	= JADE_GDC_BASE,
++		.pfn		= __phys_to_pfn(JADE_GDC_PHYS_BASE),
++		.length		= SZ_256K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_I2S0_BASE,
++		.pfn		= __phys_to_pfn(JADE_I2S0_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_APIX_BASE,
++		.pfn		= __phys_to_pfn(JADE_APIX_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_CCNT_BASE,
++		.pfn		= __phys_to_pfn(JADE_CCNT_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_PWM0_BASE,
++		.pfn		= __phys_to_pfn(JADE_PWM0_PHYS_BASE),
++		.length		= SZ_256,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_PWM1_BASE,
++		.pfn		= __phys_to_pfn(JADE_PWM1_PHYS_BASE),
++		.length		= SZ_256,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_SPI_BASE,
++		.pfn		= __phys_to_pfn(JADE_SPI_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_SPI1_BASE,
++		.pfn		= __phys_to_pfn(JADE_SPI1_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_CAN0_BASE,
++		.pfn		= __phys_to_pfn(JADE_CAN0_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_CAN1_BASE,
++		.pfn		= __phys_to_pfn(JADE_CAN1_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_I2C0_BASE,
++		.pfn		= __phys_to_pfn(JADE_I2C0_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_I2C1_BASE,
++		.pfn		= __phys_to_pfn(JADE_I2C1_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_IRC1_BASE,
++		.pfn		= __phys_to_pfn(JADE_IRC1_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_IRC2_BASE,
++		.pfn		= __phys_to_pfn(JADE_IRC2_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_MEMC_BASE,
++		.pfn		= __phys_to_pfn(JADE_MEMC_PHYS_BASE),
++		.length		= 0x8000,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_DMAC_BASE,
++		.pfn		= __phys_to_pfn(JADE_DMAC_PHYS_BASE),
++		.length		= SZ_64K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_TIMER_BASE,
++		.pfn		= __phys_to_pfn(JADE_TIMER_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_UART0_BASE,
++		.pfn		= __phys_to_pfn(JADE_UART0_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_UART1_BASE,
++		.pfn		= __phys_to_pfn(JADE_UART1_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_IRCE_BASE,
++		.pfn		= __phys_to_pfn(JADE_IRCE_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_CRG_BASE,
++		.pfn		= __phys_to_pfn(JADE_CRG_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_IRC0_BASE,
++		.pfn		= __phys_to_pfn(JADE_IRC0_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_GPIO_BASE,
++		.pfn		= __phys_to_pfn(JADE_GPIO_PHYS_BASE),
++		.length		= SZ_4K,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_XSC0_BASE,
++		.pfn		= __phys_to_pfn(JADE_XSC0_PHYS_BASE),
++		.length		= SZ_1M,
++		.type		= MT_DEVICE,
++	}, {
++		.virtual	= JADE_XSC4_BASE,
++		.pfn		= __phys_to_pfn(JADE_XSC4_PHYS_BASE),
++		.length		= SZ_32M,
++		.type		= MT_DEVICE,
++	}
++};
++
++void __init xxsvideo_initialize(unsigned long main_clock)
++{
++	/* Map peripherals */
++	iotable_init(xxsvideo_io_desc, ARRAY_SIZE(xxsvideo_io_desc));
++}
++
++/* --------------------------------------------------------------------
++ *  GPIOs
++ * -------------------------------------------------------------------- */
++
++void __init xxsvideo_add_device_gpio(int pin, char *pin_name)
++{
++	u32 cmux_md, cmpx_mode_2;
++	u32 cex_pin_st;
++
++	if (pin < 0 || pin >= 24)
++		return;
++
++	/*
++	 * Jade-D has two sets of pins for GPIO 0..23: One that uses 
++	 * the TSG, HOST_SPI, UART, SPI pins (CMPX_MODE_2=b'0X), and 
++	 * one that uses the DISP pins (CMPX_MODE_2=b'1X).
++	 */
++
++	cmux_md = __raw_readl(JADE_CCNT_BASE+0x30);
++	cmpx_mode_2 = ((cmux_md >> 16) & 0x3);
++	cex_pin_st = __raw_readl(JADE_CCNT_BASE+0x34);
++
++	if (cmpx_mode_2 < 2) {
++		if (pin < 8) {
++			u32 cmpx_mode_3 = ((cmux_md >> 18) & 0x3);
++			if (cmpx_mode_3 != 1)
++				printk("%s: CMPX_MODE_2=%u CMPX_MODE_3=%u, "
++				"GPIO %d (%s) dead\n", __func__, cmpx_mode_2, 
++				cmpx_mode_3, pin, pin_name);
++		}
++		else if (pin < 12) {
++			u32 cmpx_mode_8 = ((cmux_md >> 23) & 0x1);
++			if (cmpx_mode_8 != 1)
++				printk("%s: CMPX_MODE_2=%u CMPX_MODE_8=%u, "
++				"GPIO %d (%s) dead\n", __func__, cmpx_mode_2, 
++				cmpx_mode_8, pin, pin_name);
++		}
++		else if (pin < 16) {
++			u32 mpx_mode_5 = ((cex_pin_st >> 2) & 0x3);
++			u32 cmpx_mode_9 = ((cmux_md >> 24) & 0x3);
++			if (mpx_mode_5 != 0 || cmpx_mode_9 != 1)
++				printk("%s: CMPX_MODE_2=%u MPX_MODE_5=%u "
++				"CMPX_MODE_9=%u, GPIO %d (%s) dead\n", 
++				__func__, cmpx_mode_2, mpx_mode_5, 
++				cmpx_mode_9, pin, pin_name);
++		}
++		else if (pin < 20) {
++			u32 cmpx_mode_10 = ((cmux_md >> 26) & 0x3);
++			if (cmpx_mode_10 != 1)
++				printk("%s: CMPX_MODE_2=%u CMPX_MODE_10=%u, "
++				"GPIO %d (%s) dead\n", __func__, cmpx_mode_2, 
++				cmpx_mode_10, pin, pin_name);
++		}
++		else {
++			u32 cmpx_mode_11 = ((cmux_md >> 28) & 0x1);
++			if (cmpx_mode_11 != 1)
++				printk("%s: CMPX_MODE_2=%u CMPX_MODE_11=%u, "
++				"GPIO %d (%s) dead\n", __func__, cmpx_mode_2, 
++				cmpx_mode_11, pin, pin_name);
++		}
++	}
++	else if (cmpx_mode_2 != 3) {
++		if (pin == 0 || pin == 1 || pin == 16 || pin == 17)
++			printk("%s: CMPX_MODE_2=%u, GPIO %d (%s) dead\n", 
++			__func__, cmpx_mode_2, pin, pin_name);
++	}
++}
++
++/* --------------------------------------------------------------------
++ *  UART
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_SERIAL_8250)
++static struct resource  xxsvideo_uart_resources[] = {
++
++    [0] = {
++        .start      = JADE_UART0_BASE,
++        .end        = JADE_UART0_BASE + 0x0fff,
++        .flags      = IORESOURCE_MEM,
++    },
++    [1] = {
++        .start      = JADE_UART1_BASE,
++        .end        = JADE_UART1_BASE + 0x0fff,
++        .flags      = IORESOURCE_MEM,
++    },
++};
++
++static struct plat_serial8250_port  xxsvideo_uart_data[] = {
++    [0] = {
++        .membase    = (unsigned char *)JADE_UART0_BASE,
++        .mapbase    = JADE_UART0_PHYS_BASE,
++        .irq        = IRQ_UARTINT0,
++        .flags      = UPF_BOOT_AUTOCONF | UPF_SKIP_TEST,
++        .iotype     = UPIO_MEM,
++        .regshift   = 2,
++    },
++    [1] = {
++        .membase    = (unsigned char *)JADE_UART1_BASE,
++        .mapbase    = JADE_UART1_PHYS_BASE,
++        .irq        = IRQ_UARTINT1,
++        .flags      = UPF_BOOT_AUTOCONF | UPF_SKIP_TEST,
++        .iotype     = UPIO_MEM,
++        .regshift   = 2,
++    },
++    [2] = {
++        .flags 	    = 0,
++    },
++};
++
++static struct platform_device  xxsvideo_uart = {
++	.name			= "serial8250",
++	.id			= PLAT8250_DEV_PLATFORM,
++	.dev.platform_data	= xxsvideo_uart_data,
++	.num_resources		= 2,
++	.resource		= xxsvideo_uart_resources,
++};
++
++void __init xxsvideo_add_device_serial(void)
++{
++	/* set uartclk to APB-clock */
++	xxsvideo_uart_data[0].uartclk = f_cclk >> (__raw_readl(JADE_CRG_BASE+0x10)>>3 & 0x03);
++	xxsvideo_uart_data[1].uartclk = f_cclk >> (__raw_readl(JADE_CRG_BASE+0x10)>>3 & 0x03);
++	platform_device_register(&xxsvideo_uart);
++}
++
++#else
++void __init xxsvideo_add_device_serial(void) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  I2C
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_I2C_XXSVIDEO) || defined(CONFIG_I2C_XXSVIDEO_MODULE)
++static struct resource xxsvideo_i2c_resources[] = {
++	[0] = {
++		.start	= JADE_I2C0_PHYS_BASE,
++		.end	= JADE_I2C0_PHYS_BASE + SZ_4K - 1,
++		.flags	= IORESOURCE_MEM,
++	},
++	[1] = {
++		.start	= INT_I2C0,
++		.end	= INT_I2C0,
++		.flags	= IORESOURCE_IRQ,
++	},
++};
++
++static struct resource xxsvideo_i2c_resources_1[] = {
++	[0] = {
++		.start	= JADE_I2C1_PHYS_BASE,
++		.end	= JADE_I2C1_PHYS_BASE + SZ_4K - 1,
++		.flags	= IORESOURCE_MEM,
++	},
++	[1] = {
++		.start	= INT_I2C1,
++		.end	= INT_I2C1,
++		.flags	= IORESOURCE_IRQ,
++	},
++};
++
++static struct platform_device xxsvideo_i2c_device = {
++	.name		= "xxsvideo_i2c",
++	.id		= 0,
++	.resource	= xxsvideo_i2c_resources,
++	.num_resources	= ARRAY_SIZE(xxsvideo_i2c_resources),
++};
++
++static struct platform_device xxsvideo_i2c_device_1 = {
++	.name		= "xxsvideo_i2c",
++	.id		= 1,
++	.resource	= xxsvideo_i2c_resources_1,
++	.num_resources	= ARRAY_SIZE(xxsvideo_i2c_resources_1),
++};
++
++void __init xxsvideo_add_device_i2c(void)
++{
++	platform_device_register(&xxsvideo_i2c_device);
++	platform_device_register(&xxsvideo_i2c_device_1);
++}
++#else
++void __init xxsvideo_add_device_i2c(void) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  AT88SC0808C CryptoMemory
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_CRYPTOEEPROM) || defined(CONFIG_CRYPTOEEPROM_MODULE)
++/*
++ * Atmel AT88SC0808
++ */
++static struct i2c_board_info cryptoeeprom __initdata = {
++                 I2C_BOARD_INFO("cryptoeeprom", 0x58),
++};
++
++void __init xxsvideo_add_device_cryptoeeprom(void)
++{
++	i2c_register_board_info(0, &cryptoeeprom, 1);
++}
++
++#else
++void __init xxsvideo_add_device_cryptoeeprom(void) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  Framebuffer
++ * -------------------------------------------------------------------- */
++
++/*
++ * For valid resolution IDs look at fb_modes.c:
++ * - 800x600:   0
++ * - 800x480:   1
++ * - 640x480:   2
++ * - 1280x1024: 3
++ * - 1024x768:  4
++ */
++
++#if defined(CONFIG_FB_XXSVIDEO) || defined(CONFIG_FB_XXSVIDEO_MODULE)
++
++static struct resource xxsvideo_fb_resources_0[] = {
++	[0] = {
++		.start	= JADE_GDC_PHYS_DISP_BASE,
++		.end	= JADE_GDC_PHYS_DISP_BASE + SZ_256K - 1,
++		.flags	= IORESOURCE_MEM,
++	},
++};
++
++static struct resource xxsvideo_fb_resources_1[] = {
++	[0] = {
++		.start	= JADE_GDC_PHYS_DISP_BASE + SZ_8K,
++		.end	= JADE_GDC_PHYS_DISP_BASE + SZ_256K - 1,
++		.flags	= IORESOURCE_MEM,
++	},
++};
++
++static struct xxsvideofb_plat_data xxsvideo_fb_plat_data_0 = {
++#if defined(CONFIG_FB_XXSVIDEO_FB0_800_600)
++	.mode_info      = &xxsvideofb_fb_modes[0],
++#elif defined(CONFIG_FB_XXSVIDEO_FB0_800_480)
++	.mode_info      = &xxsvideofb_fb_modes[1],
++#elif defined(CONFIG_FB_XXSVIDEO_FB0_640_480)
++	.mode_info      = &xxsvideofb_fb_modes[2],
++#elif defined(CONFIG_FB_XXSVIDEO_FB0_1280_1024)
++	.mode_info      = &xxsvideofb_fb_modes[3],
++#elif defined(CONFIG_FB_XXSVIDEO_FB0_1024_768)
++	.mode_info      = &xxsvideofb_fb_modes[4],
++#else
++	.mode_info      = NULL,
++#endif
++};
++
++static struct xxsvideofb_plat_data xxsvideo_fb_plat_data_1 = {
++#if defined(CONFIG_FB_XXSVIDEO_FB1_800_600)
++	.mode_info      = &xxsvideofb_fb_modes[0],
++#elif defined(CONFIG_FB_XXSVIDEO_FB1_800_480)
++	.mode_info      = &xxsvideofb_fb_modes[1],
++#elif defined(CONFIG_FB_XXSVIDEO_FB1_640_480)
++	.mode_info      = &xxsvideofb_fb_modes[2],
++#elif defined(CONFIG_FB_XXSVIDEO_FB1_1280_1024)
++	.mode_info      = &xxsvideofb_fb_modes[3],
++#elif defined(CONFIG_FB_XXSVIDEO_FB1_1024_768)
++	.mode_info      = &xxsvideofb_fb_modes[4],
++#else
++	.mode_info      = NULL,
++#endif
++};
++
++static struct platform_device xxsvideo_fb_device = {
++	.name		= "xxsvideo_fb",
++	.id		= 0,
++	.resource	= xxsvideo_fb_resources_0,
++	.num_resources	= ARRAY_SIZE(xxsvideo_fb_resources_0),
++	.dev.platform_data = &xxsvideo_fb_plat_data_0,
++};
++
++static struct platform_device xxsvideo_fb_device1 = {
++	.name		= "xxsvideo_fb",
++	.id		= 1,
++	.resource	= xxsvideo_fb_resources_1,
++	.num_resources	= ARRAY_SIZE(xxsvideo_fb_resources_1),
++	.dev.platform_data = &xxsvideo_fb_plat_data_1,
++};
++
++void __init xxsvideo_add_device_fb(unsigned int fb_nr, u32 dcm3)
++{
++	if (fb_nr == 0) {
++		if (!xxsvideo_fb_plat_data_0.mode_info)
++			return;
++		xxsvideo_fb_plat_data_0.pll_clk = f_cclk*2;
++		xxsvideo_fb_plat_data_0.dcm3 = dcm3;
++		platform_device_register(&xxsvideo_fb_device);
++	}
++	else if (fb_nr == 1) {
++		if (!xxsvideo_fb_plat_data_1.mode_info)
++			return;
++		xxsvideo_fb_plat_data_1.pll_clk = f_cclk*2;
++		xxsvideo_fb_plat_data_1.dcm3 = dcm3;
++		platform_device_register(&xxsvideo_fb_device1);
++	}
++}
++
++#else
++void __init xxsvideo_add_device_fb(unsigned int fb_nr, u32 dcm3) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  NOR Flash
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_MTD_ARM_INTEGRATOR)
++static struct mtd_partition xxsvideo_flash_partitions[] = {
++         {
++                .name = "u-boot",
++                .size = 0x00020000,
++                .offset = 0x0000000,
++                .mask_flags = MTD_WRITEABLE,        /* read only */
++        },{
++                .name = "u-boot var",
++                .size = 0x00020000,
++                .offset = MTDPART_OFS_APPEND,
++                .mask_flags = MTD_WRITEABLE,        /* read only */
++        },{
++                .name = "kernel",
++                .size = 0x00200000,
++                .offset = MTDPART_OFS_APPEND,
++        },{
++                .name = "rootfs",
++                .size = JADE_FLASH_SIZE - 0x00240000,
++                .offset = MTDPART_OFS_APPEND,
++	}
++};
++
++static struct flash_platform_data xxsvideo_flash_data = {
++        .map_name       = "cfi_probe",
++        .width          = 2,
++        .parts		= xxsvideo_flash_partitions,
++        .nr_parts       = ARRAY_SIZE(xxsvideo_flash_partitions),
++};
++
++static struct resource  xxsvideo_flash_resource = {
++        .start          = JADE_FLASH_BASE,
++        .end            = JADE_FLASH_BASE + JADE_FLASH_SIZE - 1,
++        .flags          = IORESOURCE_MEM,
++};
++
++static struct platform_device  xxsvideo_flash_device = {
++        .name           = "armflash",
++	.id             = 0,
++        .dev            = {
++                .platform_data  = &xxsvideo_flash_data,
++        },
++        .num_resources  = 1,
++        .resource       = &xxsvideo_flash_resource,
++};
++
++void __init xxsvideo_add_device_nor(void)
++{
++	u32 wdth;
++
++	/* MEMC.MCFMODE4.WDTH */
++	wdth = (__raw_readl(JADE_MEMC_BASE+0x10) & 0x3);
++
++	/*
++	 * For 16-bit flash (default), wdth is 1, bankwidth is 2, and 
++	 * the sector size is 128 KB. For 32-bit flash, wdth is 2, 
++	 * bankwidth is 4, and the sector size is 256 KB.
++	 */
++	xxsvideo_flash_data.width = (1<<wdth);
++	xxsvideo_flash_partitions[0].size = (0x10000<<wdth);
++	xxsvideo_flash_partitions[1].size = (0x10000<<wdth);
++	xxsvideo_flash_partitions[3].size = JADE_FLASH_SIZE - 
++		((0x20000<<wdth) + xxsvideo_flash_partitions[2].size);
++
++	platform_device_register(&xxsvideo_flash_device);
++}
++#else
++void __init xxsvideo_add_device_nor(void) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  CAN
++ * -------------------------------------------------------------------- */
++
++#if defined(CONFIG_XXS_C_CAN) || defined(CONFIG_XXS_C_CAN_MODULE)
++static struct resource xxsvideo_ccan_resources[] = {
++	[0] = {
++		.start	= JADE_CAN0_BASE,
++		.end	= JADE_CAN0_BASE + SZ_4K - 1,
++		.flags	= IORESOURCE_MEM,
++	},
++	[1] = {
++		.start	= INT_CAN0,
++		.end	= INT_CAN0,
++		.flags	= IORESOURCE_IRQ,
++	},
++};
++
++static struct resource xxsvideo_ccan_resources_1[] = {
++	[0] = {
++		.start	= JADE_CAN1_BASE,
++		.end	= JADE_CAN1_BASE + SZ_4K - 1,
++		.flags	= IORESOURCE_MEM,
++	},
++	[1] = {
++		.start	= INT_CAN1,
++		.end	= INT_CAN1,
++		.flags	= IORESOURCE_IRQ,
++	},
++};
++
++static struct platform_device xxsvideo_ccan_device = {
++	.name		= "xxsvideo_ccan",
++	.id		= 0,
++	.resource	= xxsvideo_ccan_resources,
++	.num_resources	= ARRAY_SIZE(xxsvideo_ccan_resources),
++};
++
++static struct platform_device xxsvideo_ccan_device_1 = {
++	.name		= "xxsvideo_ccan",
++	.id		= 1,
++	.resource	= xxsvideo_ccan_resources_1,
++	.num_resources	= ARRAY_SIZE(xxsvideo_ccan_resources_1),
++};
++
++void __init xxsvideo_add_device_ccan(struct xxsvideo_ccan_gpio *gpio)
++{
++	if (gpio->id == 0) {
++		xxsvideo_add_device_gpio(gpio->gpio_outen, "CAN-0 outen");
++		xxsvideo_add_device_gpio(gpio->gpio_standby, "CAN-0 standby");
++		xxsvideo_add_device_gpio(gpio->gpio_wake, "CAN-0 wake");
++		xxsvideo_ccan_device.dev.platform_data = gpio;
++		platform_device_register(&xxsvideo_ccan_device);
++	}
++	else if (gpio->id == 1) {
++		xxsvideo_add_device_gpio(gpio->gpio_outen, "CAN-1 outen");
++		xxsvideo_add_device_gpio(gpio->gpio_standby, "CAN-1 standby");
++		xxsvideo_add_device_gpio(gpio->gpio_wake, "CAN-1 wake");
++		xxsvideo_ccan_device_1.dev.platform_data = gpio;
++		platform_device_register(&xxsvideo_ccan_device_1);
++	}
++}
++#else
++void __init xxsvideo_add_device_ccan(struct xxsvideo_ccan_gpio *gpio) {}
++#endif
++
++/* --------------------------------------------------------------------
++ *  System Timer
++ * -------------------------------------------------------------------- */
++
++static void xxsvideo_init_timer(void)
++{
++	u32 crpr, crda, crdb;
++	unsigned long f_paclk;
++
++	/*
++	 * Calculate f_CCLK (core clock) from f_CLK and CRPR.
++	 * PLLBYPASS=1: f_CCLK = f_CLK
++	 * PLLDEN=1:    f_CCLK = f_CLK * (PLLNDIV/(PLLPDIV+1))
++	 * else:        f_CCLK = f_CLK * multiplier(PLLMODE)
++	 */
++
++	crpr = __raw_readl(JADE_CRG_BASE+0x00);
++	if (crpr & 0x80) { /* PLLBYPASS */
++		f_cclk = CLOCK_F_CLK;
++	}
++	else if (crpr & 0x80000000) { /* PLLDEN */
++		f_cclk = CLOCK_F_CLK;
++		f_cclk *= ((crpr>>24)&0x7f); /* PLLNDIV */
++		f_cclk /= ((crpr>>16)&0x3);  /* PLLPDIV */
++	}
++	else {
++		switch (crpr & 0x1f) { /* PLLMODE */
++			case 0: f_cclk = (CLOCK_F_CLK*32)/3; break;
++			case 1: f_cclk = (CLOCK_F_CLK*40)/3; break;
++			case 2: f_cclk = (CLOCK_F_CLK*32)/2; break;
++			case 3: f_cclk = (CLOCK_F_CLK*33)/2; break;
++			case 4: f_cclk = (CLOCK_F_CLK*61)/6; break;
++			case 5: f_cclk = (CLOCK_F_CLK*51)/4; break;
++			case 6: f_cclk = (CLOCK_F_CLK*46)/3; break;
++			case 8: f_cclk = (CLOCK_F_CLK*17)/2; break;
++			default: f_cclk = CLOCK_F_CLK/*?*/; break;
++		}
++	}
++
++	/*
++	 * The system timer uses Timer-0, which is sourced from the 
++	 * APB-A clock.
++	 */
++
++	crda = __raw_readl(JADE_CRG_BASE+JADE_CRG_CRDA);
++	f_paclk = f_cclk >> ((crda>>3) & 0x7);
++	xxsvideo_time_init(f_paclk/HZ, 0);
++
++	/* check CONFIG_JADE_PACLK_FREQ */
++	if (CONFIG_JADE_PACLK_FREQ != f_paclk)
++		printk(KERN_WARNING "%s: CONFIG_JADE_PACLK_FREQ = %d, "
++		"should be %lu\n", __func__, CONFIG_JADE_PACLK_FREQ, f_paclk);
++
++	/*
++	 * Just for information purposes during development.
++	 */
++
++	crdb = __raw_readl(JADE_CRG_BASE+JADE_CRG_CRDB);
++	printk("/tb/ %s: f_CCLK = %lu\n", __func__, f_cclk);
++	printk("/tb/ %s: f_ARMBCLK = %lu, f_ARMACLK = %lu\n", __func__, 
++	       f_cclk >> ((crda>>12) & 0x7), f_cclk >> ((crda>>9) & 0x7));
++	printk("/tb/ %s: f_PACLK = %lu\n", __func__, f_paclk);
++	printk("/tb/ %s: f_HACLK = %lu, f_HBCLK = %lu\n", __func__, 
++	       f_cclk >> ((crda>>0) & 0x7), f_cclk >> ((crdb>>0) & 0x7));
++}
++
++struct sys_timer xxsvideo_timer = {
++	.init		= xxsvideo_init_timer,
++	.offset		= xxsvideo_gettimeoffset,
++};
++
+--- linux-2.6.27.21/arch/arm/mach-xxsvideo/dma.c	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/mach-xxsvideo/dma.c	2009-10-16 14:25:53.000000000 +0000
+@@ -0,0 +1,1296 @@
++/* linux/arch/arm/mach-xxsvideo/dma.c
++ *
++ * Copyright (c) 2008 mycable GmbH
++ *	Alexander Bigga <linux@bigga.de>
++ *
++ * mycable XXSVIDEO / Fujitsu Jade DMA core
++ *
++ * http://www.mycable.de/
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++*/
++
++
++#define DEBUG
++
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/sched.h>
++#include <linux/spinlock.h>
++#include <linux/interrupt.h>
++#include <linux/slab.h>
++#include <linux/errno.h>
++#include <linux/delay.h>
++
++#include <asm/system.h>
++#include <asm/irq.h>
++#include <asm/io.h>
++#include <asm/dma.h>
++
++#include <mach/dma.h>
++#include <mach/board.h>
++
++#include <mach/dma.h>
++
++#include <mach/audio.h>
++
++static unsigned int irq_counter=0;
++static unsigned int buf_count=0;
++
++static int dma_channels;
++
++static struct xxsvideo_dma_selection dma_sel;
++
++/* dma channel state information */
++struct xxsvideo_dma_chan xxsvideo_chans[JADE_DMA_CHANNELS];
++
++/* debugging functions */
++
++#define BUF_MAGIC (0xcafebabe)
++
++/* "disable" debugging */
++// #define printk(x...)
++// #define TRACE(x...) DBG(KERN_ERR x)
++#define TRACE(x...)
++unsigned long alpha = 0;
++
++
++#define XXSVIDEO_DMA_DEBUG 0
++#if XXSVIDEO_DMA_DEBUG
++#define DBG(x...) DBG(KERN_ERR x)
++#else
++#define DBG(x...)
++#endif
++
++#define dmawarn(fmt...) DBG(KERN_ERR fmt)
++
++#define dma_regaddr(chan, reg) ((chan)->regs + (reg))
++
++static int xxsvideo_dma_dostop(struct xxsvideo_dma_chan *chan);
++
++static inline void
++dma_wrreg(struct xxsvideo_dma_chan *chan, int reg, unsigned long val)
++{
++// 	DBG("writing %08x to register %08x\n",(unsigned int)val, (chan)->regs + (reg));
++	writel(val, dma_regaddr(chan, reg));
++}
++
++#define dma_rdreg(chan, reg) readl((chan)->regs + (reg))
++
++/* captured register state for debug */
++
++struct xxsvideo_dma_regstate {
++	unsigned long         dmacr;
++	unsigned long         dmacax;
++	unsigned long         dmacbx;
++	unsigned long         dmacsax;
++	unsigned long         dmacdax;
++
++};
++#define DMA_REG_DUMP 0
++
++void dump_dma_regs(void)
++{
++#if XXSVIDEO_DMA_DEBUG && DMA_REG_DUMP
++	int dmacnum;
++	u32 dmacregs;
++
++	if (xxsvideo_chans[2].in_use) {
++		dmacnum = 2;
++		dmacregs = JADE_DMAC_BASE + 0x30;
++	}
++	else if (xxsvideo_chans[0].in_use) {
++		dmacnum = 0;
++		dmacregs = JADE_DMAC_BASE + 0x10;
++	}
++	else
++		return;
++#endif /* XXSVIDEO_DMA_DEBUG && DMA_REG_DUMP */
++
++	TRACE("dma TRACE %s\n", __func__);
++#if DMA_REG_DUMP
++	DBG("JADE_  =0x%08x\n", __raw_readl(JADE_DMAC_BASE + JADE_DMACR));
++
++	DBG("DMACA%d =0x%08x\n", dmacnum, __raw_readl(dmacregs + JADE_DMACAX));
++	DBG("DMACB%d =0x%08x\n", dmacnum, __raw_readl(dmacregs + JADE_DMACBX));
++	DBG("DMACSA%d=0x%08x\n", dmacnum, __raw_readl(dmacregs + JADE_DMACSAX));
++	DBG("DMACDA%d=0x%08x\n", dmacnum, __raw_readl(dmacregs + JADE_DMACDAX));
++
++	DBG("\n");
++#endif
++}
++EXPORT_SYMBOL(dump_dma_regs);
++
++ void dump_i2s_regs(void)
++{
++#ifdef XXSVIDEO_DMA_DEBUG
++	u32 i2sregs;
++
++	if (xxsvideo_chans[2].in_use 
++	&& (((xxsvideo_chans[2].dmaca>>25)&0xf) == 0x7)) /* DREQH, DREQL */
++		i2sregs = JADE_I2S1_BASE;
++	else if (xxsvideo_chans[0].in_use 
++	&& (((xxsvideo_chans[0].dmaca>>25)&0xf) == 0x7)) /* DREQH, DREQL */
++		i2sregs = JADE_I2S0_BASE;
++	else
++		return;
++#endif /* XXSVIDEO_DMA_DEBUG */
++
++	TRACE("dma TRACE %s\n", __func__);
++	DBG("Register Dump for I2S:\n");
++
++	//DBG("OCDBG: Next Instruction accessing address 0x%08x\n", i2sregs + I2S_RXFDAT);
++
++	DBG("(0x%08x) I2S_RXFDAT  = 0x%08x\n", i2sregs + JADE_I2S_RXFDAT,  __raw_readl(i2sregs + JADE_I2S_RXFDAT));
++	DBG("(0x%08x) I2S_TXFDAT  = 0x%08x\n", i2sregs + JADE_I2S_TXFDAT,  __raw_readl(i2sregs + JADE_I2S_TXFDAT));
++	DBG("(0x%08x) I2S_CNTREG  = 0x%08x\n", i2sregs + JADE_I2S_CNTREG,  __raw_readl(i2sregs + JADE_I2S_CNTREG));
++	DBG("(0x%08x) I2S_MCR0REG = 0x%08x\n", i2sregs + JADE_I2S_MCR0REG, __raw_readl(i2sregs + JADE_I2S_MCR0REG));
++	DBG("(0x%08x) I2S_MCR1REG = 0x%08x\n", i2sregs + JADE_I2S_MCR1REG, __raw_readl(i2sregs + JADE_I2S_MCR1REG));
++	DBG("(0x%08x) I2S_MCR2REG = 0x%08x\n", i2sregs + JADE_I2S_MCR2REG, __raw_readl(i2sregs + JADE_I2S_MCR2REG));
++	DBG("(0x%08x) I2S_OPRREG  = 0x%08x\n", i2sregs + JADE_I2S_OPRREG,  __raw_readl(i2sregs + JADE_I2S_OPRREG));
++	DBG("(0x%08x) I2S_SRST    = 0x%08x\n", i2sregs + JADE_I2S_SRST,    __raw_readl(i2sregs + JADE_I2S_SRST));
++	DBG("(0x%08x) I2S_INTCNT  = 0x%08x\n", i2sregs + JADE_I2S_INTCNT,  __raw_readl(i2sregs + JADE_I2S_INTCNT));
++	DBG("(0x%08x) I2S_STATUS  = 0x%08x\n", i2sregs + JADE_I2S_STATUS,  __raw_readl(i2sregs + JADE_I2S_STATUS));
++	DBG("(0x%08x) I2S_DMAACT  = 0x%08x\n", i2sregs + JADE_I2S_DMAACT,  __raw_readl(i2sregs + JADE_I2S_DMAACT));
++
++	DBG("(0x%08x) I2S_TSTREG  = 0x%08x\n", i2sregs + JADE_I2S_TSTREG,  __raw_readl(i2sregs + JADE_I2S_TSTREG));
++
++}
++EXPORT_SYMBOL(dump_i2s_regs);
++
++#ifdef XXSVIDEO_DMA_DEBUG
++
++/* dmadbg_showregs
++ *
++ * simple debug routine to print the current state of the dma registers
++*/
++
++static void
++dmadbg_capture(struct xxsvideo_dma_chan *chan, struct xxsvideo_dma_regstate *regs)
++{
++	TRACE("dma TRACE %s\n", __func__);
++
++	regs->dmacr	= __raw_readl(JADE_DMAC_BASE + JADE_DMACR);
++
++ 	regs->dmacax	= dma_rdreg(chan, JADE_DMACAX);
++ 	regs->dmacbx	= dma_rdreg(chan, JADE_DMACBX);
++ 	regs->dmacsax	= dma_rdreg(chan, JADE_DMACSAX);
++ 	regs->dmacdax	= dma_rdreg(chan, JADE_DMACDAX);
++
++}
++
++static void
++dmadbg_dumpregs(const char *fname, int line, struct xxsvideo_dma_chan *chan,
++		 struct xxsvideo_dma_regstate *regs)
++{
++	TRACE("dma TRACE %s\n", __func__);
++	DBG("/ab/%s: dma%d: %s:%d: \nDMACR=%08lx \nDMACAX=%08lx \nDMACBX=%08lx \nDMACSAX=%02lx \nDMACDAX=%08lx\n",
++	       __func__, chan->number, fname, line,
++	       regs->dmacr, regs->dmacax, regs->dmacbx, regs->dmacsax,
++	       regs->dmacdax);
++}
++
++static void
++dmadbg_showregs(const char *fname, int line, struct xxsvideo_dma_chan *chan)
++{
++	struct xxsvideo_dma_regstate state;
++
++	TRACE("dma TRACE %s\n", __func__);
++	dmadbg_capture(chan, &state);
++	dmadbg_dumpregs(fname, line, chan, &state);
++	if ((chan->number < 6) && (((chan->dmaca>>25)&0xf) == 0x7)) /* DREQ */
++		dump_i2s_regs();
++}
++
++#define dbg_showregs(chan) dmadbg_showregs(__FUNCTION__, __LINE__, (chan))
++#else
++#define dbg_showregs(chan) do { } while(0)
++#endif /* XXSVIDEO_DMA_DEBUG */
++
++static struct xxsvideo_dma_chan *dma_chan_map[DMACH_MAX];
++
++/* lookup_dma_channel
++ *
++ * change the dma channel number given into a real dma channel id
++*/
++
++static struct xxsvideo_dma_chan *lookup_dma_channel(unsigned int channel)
++{
++	TRACE("dma TRACE %s\n", __func__);
++	if (channel & DMACH_LOW_LEVEL)
++		return &xxsvideo_chans[channel & ~DMACH_LOW_LEVEL];
++	else
++		return dma_chan_map[channel];
++}
++
++/* xxsvideo_dma_loadbuffer
++ *
++ * load a buffer, and update the channel state
++*/
++
++static inline int
++xxsvideo_dma_loadbuffer(struct xxsvideo_dma_chan *chan,
++		       struct xxsvideo_dma_buf *buf)
++{
++	unsigned long bc;
++
++	TRACE("dma TRACE %s\n", __func__);
++	buf_count++;
++	dbg_showregs(chan);
++ 	if (buf_count%100 == 0)
++		DBG("/ab/%s: loading buff %p (0x%08lx,0x%06x)\n", __func__,
++			buf, (unsigned long)buf->data, buf->size);
++
++	if (buf == NULL) {
++		DBG("buffer is NULL\n");
++		return -EINVAL;
++	}
++
++	/* check the state of the channel before we do anything */
++
++	if (chan->load_state == XXSVIDEO_DMALOAD_RUNNING) {
++		DBG("load_state is XXSVIDEO_DMALOAD_RUNNING\n");
++	}
++
++	DBG("/ab/%s: JADE_DMACA2=0x%08x 0x%08x\n", __func__, dma_rdreg(chan, JADE_DMACAX), (chan->dmaca |JADE_DMACAX_EB));
++
++	/* set source/destination address */
++	if (chan->source == XXSVIDEO_DMASRC_MEM) {
++		chan->dmacsa = buf->data;
++		dma_wrreg(chan, JADE_DMACSAX, chan->dmacsa);
++	} else if (chan->source == XXSVIDEO_DMASRC_HW) {
++		chan->dmacda = buf->data;
++		dma_wrreg(chan, JADE_DMACDAX, chan->dmacda);
++	}
++
++	// set transfer count:
++	bc = ((chan->dmaca>>16)&0xf) + 1;
++	chan->dmaca &= ~0xffff;
++	chan->dmaca |= ( (buf->size/(chan->xfer_unit))/bc )-1 ;
++
++	DBG("/ab/%s set dmaca to 0x%x, (buf->size/chan->xfer_unit)-1 = (%d/%d) = %d \n", __func__, chan->dmaca, buf->size, chan->xfer_unit, (buf->size/chan->xfer_unit)-1 );
++
++	/* start transfer */
++	dma_wrreg(chan, JADE_DMACAX, chan->dmaca | JADE_DMACAX_EB);
++
++	DBG("/ab/%s chan->curr %p, chan->next %p, chan->end %p, buf->next %p\n", __func__, chan->curr, chan->next, chan->end, buf->next);
++	chan->next = buf->next;
++
++	/* update the state of the channel */
++	switch (chan->load_state) {
++	case XXSVIDEO_DMALOAD_NONE:
++		DBG("/ab/%s: set load_state to XXSVIDEO_DMALOAD_RUNNING\n", __func__);
++		chan->load_state = XXSVIDEO_DMALOAD_RUNNING;
++		break;
++
++	default:
++		dmawarn("dmaload: unknown state %d in loadbuffer\n",
++			chan->load_state);
++		break;
++	}
++	return 0;
++}
++
++/* xxsvideo_dma_buffdone
++ *
++ * small wrapper to check if callback routine needs to be called, and
++ * if so, call it
++*/
++
++static inline void
++xxsvideo_dma_buffdone(struct xxsvideo_dma_chan *chan, struct xxsvideo_dma_buf *buf,
++		     enum xxsvideo_dma_buffresult result)
++{
++	TRACE("dma TRACE %s\n", __func__);
++#if 0
++	DBG("callback_fn=%p, buf=%p, id=%p, size=%d, result=%d\n",
++		 chan->callback_fn, buf, buf->id, buf->size, result);
++#endif
++
++	if (chan->callback_fn != NULL) {
++		(chan->callback_fn)(chan, buf->id, buf->size, result);
++	}
++}
++
++/* xxsvideo_dma_start
++ *
++ * start a dma channel going
++*/
++
++static int xxsvideo_dma_start(struct xxsvideo_dma_chan *chan)
++{
++	unsigned long flags;
++
++	DBG("dma TRACE %s, chan->state 0x%x, chan->load_state 0x%x\n", __func__, chan->state, chan->load_state);
++	DBG("xxsvideo_start_dma: channel=%d\n", chan->number);
++
++	local_irq_save(flags);
++
++	/* configure and start dma controller */
++
++	if (chan->state == XXSVIDEO_DMA_RUNNING) {
++		DBG("xxsvideo_start_dma: already running (%d)\n", chan->state);
++		local_irq_restore(flags);
++		return 0;
++	}
++
++	chan->state = XXSVIDEO_DMA_RUNNING;
++
++	/* enable the channel */
++
++	if (!chan->irq_enabled) {
++		enable_irq(chan->irq);
++		chan->irq_enabled = 1;
++	}
++
++// 	xxsvideo_dma_call_op(chan, XXSVIDEO_DMAOP_START);
++
++	/* (re)start dma controller */
++	if (! (__raw_readl(JADE_DMAC_BASE + JADE_DMACR) & 1<<31))
++		__raw_writel(0x80000000, JADE_DMAC_BASE + JADE_DMACR);
++
++	/* check whether there is anything to load */
++	if (chan->load_state == XXSVIDEO_DMALOAD_NONE && chan->next != NULL) {
++		DBG("/ab/%s loading buffer...\n", __func__);
++		xxsvideo_dma_loadbuffer(chan, chan->next);
++	}
++
++	local_irq_restore(flags);
++
++	DBG("/ab/%s: END chan->state 0x%x, chan->load_state 0x%x\n", __func__, chan->state, chan->load_state);
++	return 0;
++}
++
++/* xxsvideo_dma_enqueue
++ *
++ * queue an given buffer for dma transfer.
++ *
++ * id         the device driver's id information for this buffer
++ * data       the physical address of the buffer data
++ * size       the size of the buffer in bytes
++ *
++ * It is possible to queue more than one DMA buffer onto a channel at
++ * once, and the code will deal with the re-loading of the next buffer
++ * when necessary.
++*/
++
++int xxsvideo_dma_enqueue(unsigned int channel, void *id,
++			dma_addr_t data, int size)
++{
++	struct xxsvideo_dma_chan *chan = lookup_dma_channel(channel);
++	struct xxsvideo_dma_buf *buf;
++	unsigned long flags;
++
++	TRACE("dma TRACE %s\n", __func__);
++	if (chan == NULL)
++		return -EINVAL;
++
++	DBG("/ab/%s: id=%p, data_ptr=%p, size=%d\n",
++		 __func__, id, data, size);
++
++	buf = kmalloc(sizeof(struct xxsvideo_dma_buf), GFP_ATOMIC);
++	if (buf == NULL) {
++		DBG("%s: out of memory (%ld alloc)\n",
++			 __FUNCTION__, (long)sizeof(*buf));
++		return -ENOMEM;
++	}
++
++	DBG("%s: new buffer %p\n", __FUNCTION__, buf);
++
++	buf->next  = NULL;
++	buf->data  = data;
++	buf->size  = size;
++	buf->id    = id;
++	buf->magic = BUF_MAGIC;
++
++	local_irq_save(flags);
++
++	if (chan->curr == NULL) {
++		/* we've got nothing loaded... */
++		DBG("%s: buffer %p queued onto empty channel\n",
++			 __func__, buf);
++
++		chan->curr = buf;
++		chan->end  = buf;
++		chan->next = NULL;
++	} else {
++		DBG("/ab/%s: dma%d: buffer %p queued onto non-empty channel\n",
++			 __func__, chan->number, buf);
++
++		if (chan->end == NULL)
++			DBG("/ab/%s:dma%d: %p not empty, and chan->end==NULL?\n",
++				 __func__, chan->number,  chan);
++		chan->end->next = buf;
++		chan->end = buf;
++	}
++
++	/* if necessary, update the next buffer field */
++	if (chan->next == NULL)
++		chan->next = buf;
++
++	/* check if there is anything to load */
++	if (chan->state == XXSVIDEO_DMA_RUNNING) {
++		DBG("/ab/%s: dma%d: channel already running XXSVIDEO_DMA_RUNNING\n", __func__, chan->number);
++		if (chan->load_state == XXSVIDEO_DMALOAD_NONE && chan->next) {
++			DBG("/ab/%s: loading buffer\n", __func__);
++			xxsvideo_dma_loadbuffer(chan, chan->next);
++ 		}
++	}
++
++	local_irq_restore(flags);
++	return 0;
++}
++
++EXPORT_SYMBOL(xxsvideo_dma_enqueue);
++
++static inline void
++xxsvideo_dma_freebuf(struct xxsvideo_dma_buf *buf)
++{
++	int magicok = (buf->magic == BUF_MAGIC);
++
++	DBG("dma TRACE %s\n", __func__);
++	buf->magic = -1;
++
++	if (magicok) {
++// 		printk("xxsvideo_dma_freebuf: buff %p with magic OK\n", buf);
++		kfree(buf);
++	} else {
++		printk("xxsvideo_dma_freebuf: buff %p with bad magic\n", buf);
++	}
++}
++
++
++static irqreturn_t
++xxsvideo_dma_irq(int irq, void *devpw)
++{
++	struct xxsvideo_dma_chan *chan = (struct xxsvideo_dma_chan *)devpw;
++	struct xxsvideo_dma_buf  *buf;
++	unsigned long reg;
++
++	/* release dma irq */
++	reg = dma_rdreg(chan, JADE_DMACBX);
++	dma_wrreg(chan, JADE_DMACBX, reg & (~(0x7 << 16)));
++
++	if (((reg >> 16) & 0x7) != 0x05) {
++		/* don't know, what to do: disable irq and exit */
++// 		__raw_writel(0, JADE_DMAC_BASE + JADE_DMACR);
++		DBG("/ab/%s: error: JADE_DMACB2 status bits=%d\n", __func__, (reg >> 16) & 0x7);
++// 		return IRQ_HANDLED;
++	}
++
++	irq_counter++;
++// 	if (irq_counter%100 == 0 || irq_counter < 10)
++// 		printk("xxsvideo_dma_irq(%i)\n", irq_counter);
++	DBG("dma TRACE %s, chan->load_state 0x%x\n", __func__, chan->load_state);
++	dump_dma_regs();
++
++	buf = chan->curr;
++
++	DBG("/ab/%s: (1) JADE_DMACSA2=0x%08x JADE_DMACDA2=0x%08x\n", __func__, dma_rdreg(chan, JADE_DMACSAX), dma_rdreg(chan, JADE_DMACDAX));
++
++	/* modify the channel state */
++
++	switch (chan->load_state) {
++	case XXSVIDEO_DMALOAD_RUNNING:
++                /* we'll worry about checking to see if another buffer is
++                 * ready after we've called back the owner. This should
++                 * ensure we do not wait around too long for the DMA
++                 * engine to start the next transfer
++                 */
++
++		DBG("/ab/%s: dma load_state XXSVIDEO_DMALOAD_RUNNING --> XXSVIDEO_DMALOAD_NONE\n", __func__);
++		chan->load_state = XXSVIDEO_DMALOAD_NONE;
++		break;
++
++	case XXSVIDEO_DMALOAD_NONE:
++		DBG("/ab/%s: dma load_state XXSVIDEO_DMALOAD_NONE\n", __func__);
++		DBG(KERN_ERR "dma%d: IRQ with no loaded buffer?\n",
++		       chan->number);
++		break;
++
++	default:
++		DBG(KERN_ERR "dma%d: IRQ in invalid load_state %d\n",
++		       chan->number, chan->load_state);
++		break;
++	}
++
++	if (buf != NULL) {
++		/* update the chain to make sure that if we load any more
++		 * buffers when we call the callback function, things should
++		 * work properly */
++
++		chan->curr = buf->next;
++		buf->next  = NULL;
++
++		if (buf->magic != BUF_MAGIC) {
++			DBG(KERN_ERR "dma%d: %s: buf %p incorrect magic\n",
++			       chan->number, __FUNCTION__, buf);
++			return IRQ_HANDLED;
++		}
++
++		xxsvideo_dma_buffdone(chan, buf, XXSVIDEO_RES_OK);
++
++		/* free resouces */
++		xxsvideo_dma_freebuf(buf);
++	} else {
++		DBG("/ab/%s: dma else...?\n", __func__);
++	}
++
++	/* only reload if the channel is still running... our buffer done
++	 * routine may have altered the state by requesting the dma channel
++	 * to stop or shutdown... */
++
++	/* todo: check that when the channel is shut-down from inside this
++	 * function, we cope with unsetting reload, etc */
++
++	if (chan->next != NULL && chan->state == XXSVIDEO_DMA_RUNNING) {
++		unsigned long flags;
++
++		DBG("/ab/%s: dma chan->load_state %i\n", __func__, chan->load_state);
++		switch (chan->load_state) {
++		case XXSVIDEO_DMALOAD_NONE:
++			/* can load buffer immediately */
++			break;
++
++                case XXSVIDEO_DMALOAD_RUNNING:
++			DBG("/ab/%s: will go to no_load\n", __func__);
++                        goto no_load;
++
++		default:
++			DBG(KERN_ERR "dma%d: unknown load_state in irq, %d\n",
++			       chan->number, chan->load_state);
++			return IRQ_HANDLED;
++		}
++
++		local_irq_save(flags);
++		DBG("/ab/%s: loading buffer\n", __func__);
++		xxsvideo_dma_loadbuffer(chan, chan->next);
++		local_irq_restore(flags);
++	}
++
++	DBG("/ab/%s: (2) JADE_DMACSA2=0x%08x JADE_DMACDA2=0x%08x, chan->load_state 0x%x\n", __func__, dma_rdreg(chan, JADE_DMACSAX), dma_rdreg(chan, JADE_DMACDAX), chan->load_state);
++
++	DBG("/ab/%s chan->curr %p, chan->next %p, chan->end %p, buf->next %p\n", __func__, chan->curr, chan->next, chan->end, buf->next);
++
++no_load:
++	return IRQ_HANDLED;
++}
++
++static struct xxsvideo_dma_chan *xxsvideo_dma_map_channel(int channel);
++
++/* xxsvideo_request_dma
++ *
++ * get control of an dma channel
++*/
++
++int xxsvideo_request_dma(unsigned int channel,
++			struct xxsvideo_dma_client *client, void *dev)
++{
++	struct xxsvideo_dma_chan *chan;
++	unsigned long flags;
++	int err;
++
++	TRACE("dma TRACE %s\n", __func__);
++	DBG("/ab/%s: dma%d client=%s, dev=%p\n",
++		 __func__, channel, client->name, dev);
++
++	local_irq_save(flags);
++
++	chan = xxsvideo_dma_map_channel(channel);
++	DBG("/ab/%s: chan 0x%x\n", __func__, chan);
++	if (chan == NULL) {
++		local_irq_restore(flags);
++		return -EBUSY;
++	}
++
++	dbg_showregs(chan);
++
++	chan->client = client;
++	chan->in_use = 1;
++
++	if (!chan->irq_claimed) {
++		DBG("/ab/%s: dma%d: %s : requesting irq %d\n",
++			 __func__, channel, __FUNCTION__, chan->irq);
++
++		chan->irq_claimed = 1;
++		local_irq_restore(flags);
++
++		err = request_irq(chan->irq, xxsvideo_dma_irq, IRQF_DISABLED,
++				  client->name, (void *)chan);
++
++		local_irq_save(flags);
++
++		if (err) {
++			chan->in_use = 0;
++			chan->irq_claimed = 0;
++			local_irq_restore(flags);
++
++			DBG(KERN_ERR "%s: cannot get IRQ %d for DMA %d\n",
++			       client->name, chan->irq, chan->number);
++			return err;
++		}
++
++
++		chan->irq_enabled = 1;
++	}
++
++	local_irq_restore(flags);
++
++	/* need to setup */
++
++	DBG("%s: channel initialized, %p, irq=%i\n", __func__, chan, chan->irq);
++
++// 	dump_dma_regs();
++	return 0;
++}
++
++EXPORT_SYMBOL(xxsvideo_request_dma);
++
++/* xxsvideo_dma_free
++ *
++ * release the given channel back to the system, will stop and flush
++ * any outstanding transfers, and ensure the channel is ready for the
++ * next claimant.
++ *
++*/
++
++int xxsvideo_dma_free(dmach_t channel, struct xxsvideo_dma_client *client)
++{
++	struct xxsvideo_dma_chan *chan = lookup_dma_channel(channel);
++	unsigned long flags;
++
++	DBG("dma TRACE %s\n", __func__);
++	if (chan == NULL)
++		return -EINVAL;
++
++	local_irq_save(flags);
++
++	if (chan->client != client) {
++		DBG(KERN_WARNING "dma%d: possible free from different client (channel %p, passed %p)\n",
++		       channel, chan->client, client);
++	}
++
++	/* sort out stopping and freeing the channel */
++
++	if (chan->state != XXSVIDEO_DMA_IDLE) {
++		printk("%s: need to stop dma channel %p\n",
++		       __FUNCTION__, chan);
++
++		/* possibly flush the channel */
++		xxsvideo_dma_ctrl(channel, XXSVIDEO_DMAOP_FLUSH);
++	}
++
++	chan->client = NULL;
++	chan->in_use = 0;
++
++	if (chan->irq_claimed) {
++		DBG("%s: will free irq %i\n", __func__, chan->irq);
++		free_irq(chan->irq, (void *)chan);
++	}
++
++	chan->irq_claimed = 0;
++
++	if (!(channel & DMACH_LOW_LEVEL))
++		dma_chan_map[channel] = NULL;
++
++	/* possibly flush the channel */
++// 	printk("%lu %s: stop channel %i\n", jiffies, __func__, chan->irq);
++	xxsvideo_dma_ctrl(channel, XXSVIDEO_DMAOP_STOP);
++
++	local_irq_restore(flags);
++
++	return 0;
++}
++
++EXPORT_SYMBOL(xxsvideo_dma_free);
++
++static int xxsvideo_dma_dostop(struct xxsvideo_dma_chan *chan)
++{
++	unsigned long flags;
++
++	DBG("dma TRACE %s\n", __func__);
++
++	dbg_showregs(chan);
++
++	local_irq_save(flags);
++	
++	DBG("/ab/%s: dmaca 0x%lx, irq_counter %d\n", __func__, chan->dmaca, irq_counter);
++#if 0
++	/* stop the channel going */
++	dma_wrreg(chan, JADE_DMACAX, chan->dmaca );
++#else
++	// do a pause only
++ 	dma_wrreg(chan, JADE_DMACAX, chan->dmaca | JADE_DMACAX_EB | JADE_DMACAX_PB);
++#endif
++	/* should stop do this, or should we wait for flush? */
++	chan->state      = XXSVIDEO_DMA_IDLE;
++	chan->load_state = XXSVIDEO_DMALOAD_NONE;
++
++	local_irq_restore(flags);
++
++	return 0;
++}
++
++/* xxsvideo_dma_flush
++ *
++ * stop the channel, and remove all current and pending transfers
++*/
++
++static int xxsvideo_dma_flush(struct xxsvideo_dma_chan *chan)
++{
++	struct xxsvideo_dma_buf *buf, *next;
++	unsigned long flags;
++
++	TRACE("dma TRACE %s\n", __func__);
++	DBG("%s: chan %p (%d)\n", __FUNCTION__, chan, chan->number);
++
++	local_irq_save(flags);
++
++	if (chan->state != XXSVIDEO_DMA_IDLE) {
++		printk("%s: stopping channel...\n", __FUNCTION__ );
++		xxsvideo_dma_ctrl(chan->number, XXSVIDEO_DMAOP_STOP);
++	}
++
++	buf = chan->curr;
++	if (buf == NULL)
++		buf = chan->next;
++
++	chan->curr = chan->next = chan->end = NULL;
++
++	if (buf != NULL) {
++		for ( ; buf != NULL; buf = next) {
++			next = buf->next;
++
++			DBG("%s: free buffer %p, next %p\n",
++			       __FUNCTION__, buf, buf->next);
++
++			xxsvideo_dma_buffdone(chan, buf, XXSVIDEO_RES_ABORT);
++			xxsvideo_dma_freebuf(buf);
++		}
++	}
++
++	dbg_showregs(chan);
++
++	local_irq_restore(flags);
++
++	return 0;
++}
++
++
++int
++xxsvideo_dma_ctrl(dmach_t channel, enum xxsvideo_chan_op op)
++{
++	struct xxsvideo_dma_chan *chan = lookup_dma_channel(channel);
++
++	DBG("dma TRACE %s, channel %d, op %d\n", __func__, channel, op);
++	if (chan == NULL)
++		return -EINVAL;
++
++	switch (op) {
++	case XXSVIDEO_DMAOP_START:
++		return xxsvideo_dma_start(chan);
++
++	case XXSVIDEO_DMAOP_STOP:
++		return xxsvideo_dma_dostop(chan);
++
++	case XXSVIDEO_DMAOP_PAUSE:
++	case XXSVIDEO_DMAOP_RESUME:
++		return -ENOENT;
++
++	case XXSVIDEO_DMAOP_FLUSH:
++		return xxsvideo_dma_flush(chan);
++
++	case XXSVIDEO_DMAOP_TIMEOUT:
++		return -ENOENT;
++
++	}
++
++	return 0;      /* unknown, don't bother */
++}
++
++EXPORT_SYMBOL(xxsvideo_dma_ctrl);
++
++/* DMA configuration for each channel
++ *
++ * DISRCC -> source of the DMA (AHB,APB)
++ * DISRC  -> source address of the DMA
++ * DIDSTC -> destination of the DMA (AHB,APD)
++ * DIDST  -> destination address of the DMA
++*/
++
++/* xxsvideo_dma_config
++ *
++ * xfersize:     size of unit in bytes (1,2,4)
++ * dmaca:        default value of the DMACAx register
++ * dmacb:        default value of the DMACBx register
++*/
++
++int xxsvideo_dma_config(dmach_t channel,
++		       int xferunit,
++		       int dmaca, int dmacb)
++{
++	struct xxsvideo_dma_chan *chan = lookup_dma_channel(channel);
++
++	TRACE("dma TRACE %s\n", __func__);
++	DBG("%s: chan=%d, xfer_unit=%d, dmaca=%08x, dmacb=%08x\n",
++		 __FUNCTION__, channel, xferunit, dmaca, dmacb);
++
++	if (chan == NULL)
++		return -EINVAL;
++
++	DBG("%s: Initial dmaca is %08x\n", __FUNCTION__, dmaca);
++
++	/* dmaca: EB=0 PB=0 ST=0 */
++	dmaca &= 0x1fffffff;
++
++	/* dmacb: TW=xx EI=1 CI=1 SS=000 */
++	dmacb &= 0xf3e0ffff;
++	dmacb |= 0x00180000;
++
++	switch (xferunit) {
++	case 1:
++		dmacb |= JADE_DMACBX_TW_BYTE;
++		break;
++
++	case 2:
++		dmacb |= JADE_DMACBX_TW_HALFWORD;
++		break;
++
++	case 4:
++		DBG("%s: transfer size WORD --> OK %d\n", __FUNCTION__, xferunit);
++		dmacb |= JADE_DMACBX_TW_WORD;
++		break;
++
++	default:
++		DBG("%s: bad transfer size %d\n", __FUNCTION__, xferunit);
++		return -EINVAL;
++	}
++
++	DBG("%s: dmaca now 0x%08x, dmacb now 0x%08x, xferunit %d\n", __FUNCTION__, dmaca, dmacb, xferunit);
++
++	chan->dmaca = dmaca;
++	chan->dmacb = dmacb;
++	chan->xfer_unit = xferunit;
++
++	return 0;
++}
++
++EXPORT_SYMBOL(xxsvideo_dma_config);
++
++int xxsvideo_dma_setflags(dmach_t channel, unsigned int flags)
++{
++	struct xxsvideo_dma_chan *chan = lookup_dma_channel(channel);
++
++	TRACE("dma TRACE %s\n", __func__);
++	if (chan == NULL)
++		return -EINVAL;
++
++	DBG("%s: chan=%p, flags=%08x\n", __FUNCTION__, chan, flags);
++
++	chan->flags = flags;
++
++	return 0;
++}
++
++EXPORT_SYMBOL(xxsvideo_dma_setflags);
++
++
++/* do we need to protect the settings of the fields from
++ * irq?
++*/
++
++int xxsvideo_dma_set_opfn(dmach_t channel, xxsvideo_dma_opfn_t rtn)
++{
++	struct xxsvideo_dma_chan *chan = lookup_dma_channel(channel);
++
++	TRACE("dma TRACE %s\n", __func__);
++	if (chan == NULL)
++		return -EINVAL;
++
++	DBG("%s: chan=%p, op rtn=%p\n", __FUNCTION__, chan, rtn);
++
++	chan->op_fn = rtn;
++
++	return 0;
++}
++
++EXPORT_SYMBOL(xxsvideo_dma_set_opfn);
++
++int xxsvideo_dma_set_buffdone_fn(dmach_t channel, xxsvideo_dma_cbfn_t rtn)
++{
++	struct xxsvideo_dma_chan *chan = lookup_dma_channel(channel);
++
++	TRACE("dma TRACE %s\n", __func__);
++	if (chan == NULL)
++		return -EINVAL;
++
++	DBG("%s: chan=%p, callback rtn=%p\n", __FUNCTION__, chan, rtn);
++
++	chan->callback_fn = rtn;
++
++	return 0;
++}
++
++EXPORT_SYMBOL(xxsvideo_dma_set_buffdone_fn);
++
++/* xxsvideo_dma_devconfig
++ *
++ * configure the dma source/destination hardware type and address
++ *
++ * source:    XXSVIDEO_DMASRC_HW: source is hardware
++ *            XXSVIDEO_DMASRC_MEM: source is memory
++ *
++ * hwcfg:     the value for xxxSTCn register,
++ *            bit 0: 0=increment pointer, 1=leave pointer
++ *            bit 1: 0=source is AHB, 1=source is APB
++ *
++ * devaddr:   physical address of the source
++*/
++
++int xxsvideo_dma_devconfig(int channel,
++			  enum xxsvideo_dmasrc source,
++			  int hwcfg,
++			  unsigned long devaddr)
++{
++	struct xxsvideo_dma_chan *chan = lookup_dma_channel(channel);
++	TRACE("dma TRACE %s\n", __func__);
++	if (chan == NULL)
++		return -EINVAL;
++
++	DBG("%s: source=%d, hwcfg=%08x, devaddr=%08lx\n",
++		 __FUNCTION__, (int)source, hwcfg, devaddr);
++
++	chan->source = source;
++	chan->dev_addr = devaddr;
++
++	switch (source) {
++	case XXSVIDEO_DMASRC_HW:
++		/* source is hardware */
++		DBG("%s: hw source, devaddr=%08lx, hwcfg=%d\n",
++			 __FUNCTION__, devaddr, hwcfg);
++		chan->dmacsa = devaddr;
++		dma_wrreg(chan, JADE_DMACSAX,  devaddr); /* source address */
++
++		dma_wrreg(chan, JADE_DMACBX, chan->dmacb);
++
++		return 0;
++
++	case XXSVIDEO_DMASRC_MEM:
++		/* source is memory */
++		DBG( "%s: mem source, devaddr=%08lx, hwcfg=%d\n",
++			  __FUNCTION__, devaddr, hwcfg);
++		chan->dmacda = devaddr;
++		dma_wrreg(chan, JADE_DMACDAX,  devaddr);/* destination address */
++		dma_wrreg(chan, JADE_DMACBX, chan->dmacb);
++
++		return 0;
++	}
++
++	DBG(KERN_ERR "dma%d: invalid source type (%d)\n", channel, source);
++	return -EINVAL;
++}
++
++EXPORT_SYMBOL(xxsvideo_dma_devconfig);
++
++/* xxsvideo_dma_getposition
++ *
++ * returns the current transfer points for the dma source and destination
++*/
++
++int xxsvideo_dma_getposition(dmach_t channel, dma_addr_t *src, dma_addr_t *dst)
++{
++ 	struct xxsvideo_dma_chan *chan = lookup_dma_channel(channel);
++
++	TRACE("dma TRACE %s\n", __func__);
++	if (chan == NULL)
++		return -EINVAL;
++
++	if (src != NULL)
++ 		*src = dma_rdreg(chan, JADE_DMACSAX);
++
++ 	if (dst != NULL)
++ 		*dst = dma_rdreg(chan, JADE_DMACDAX);
++
++ 	return 0;
++}
++
++EXPORT_SYMBOL(xxsvideo_dma_getposition);
++
++
++/* system device class */
++
++#ifdef CONFIG_PM_XX
++
++static int xxsvideo_dma_suspend(struct sys_device *dev, pm_message_t state)
++{
++	struct xxsvideo_dma_chan *cp = container_of(dev, struct xxsvideo_dma_chan, dev);
++
++	DBG("dma TRACE %s\n", __func__);
++	DBG(KERN_DEBUG "suspending dma channel %d\n", cp->number);
++
++	if (dma_rdreg(cp, XXSVIDEO_DMA_DMASKTRIG) & XXSVIDEO_DMASKTRIG_ON) {
++		/* the dma channel is still working, which is probably
++		 * a bad thing to do over suspend/resume. We stop the
++		 * channel and assume that the client is either going to
++		 * retry after resume, or that it is broken.
++		 */
++
++		DBG(KERN_INFO "dma: stopping channel %d due to suspend\n",
++		       cp->number);
++
++		xxsvideo_dma_dostop(cp);
++	}
++
++	return 0;
++}
++
++static int xxsvideo_dma_resume(struct sys_device *dev)
++{
++	TRACE("dma TRACE %s\n", __func__);
++	return 0;
++}
++
++#else
++#define xxsvideo_dma_suspend NULL
++#define xxsvideo_dma_resume  NULL
++#endif /* CONFIG_PM */
++
++int __devinit xxsvideo_dma_init(unsigned int channels, unsigned int irq,
++			    unsigned int stride)
++{
++	struct xxsvideo_dma_chan *cp;
++	int channel;
++	int ret;
++
++	TRACE("dma TRACE %s\n", __func__);
++	dma_channels = channels;
++
++	for (channel = 0; channel < channels;  channel++) {
++		cp = &xxsvideo_chans[channel];
++
++		memset(cp, 0, sizeof(struct xxsvideo_dma_chan));
++
++		/* dma channel irqs are in order.. */
++		cp->number = channel;
++		cp->irq    = channel + irq;
++		cp->regs   = (void __iomem*)( JADE_DMAC_BASE + ((channel+1) * stride) );
++
++		/* point current stats somewhere */
++		cp->stats  = &cp->stats_store;
++		cp->stats_store.timeout_shortest = LONG_MAX;
++
++		/* basic channel configuration */
++
++		cp->load_timeout = 1<<18;
++
++		DBG("DMA channel %d at %p, irq %d\n",
++		       cp->number, cp->regs, cp->irq);
++	}
++
++	/* configure and start dma controller */
++	__raw_writel(0x80000000, JADE_DMAC_BASE + JADE_DMACR);
++
++	return 0;
++
++ err:
++	return ret;
++}
++
++static struct xxsvideo_dma_order *dma_order;
++
++
++
++static inline int is_channel_valid(unsigned int channel)
++{
++	TRACE("dma TRACE %s, channel %d, valid %i\n", __func__, channel, (channel & DMA_CH_VALID));
++	return (channel & DMA_CH_VALID);
++}
++
++
++
++/* xxsvideo_dma_map_channel()
++ *
++ * turn the virtual channel number into a real, and un-used hardware
++ * channel.
++ *
++ * first, try the dma ordering given to us by either the relevant
++ * dma code, or the board. Then just find the first usable free
++ * channel
++*/
++
++static struct xxsvideo_dma_chan *xxsvideo_dma_map_channel(int channel)
++{
++	struct xxsvideo_dma_order_ch *ord = NULL;
++	struct xxsvideo_dma_map *ch_map;
++	struct xxsvideo_dma_chan *dmach;
++	int ch;
++
++	TRACE("dma TRACE %s\n", __func__);
++	DBG("/ab/%s: channel %i dma_sel.map %p dma_sel.map_size %i\n", __func__, channel, dma_sel.map, dma_sel.map_size);
++	if (dma_sel.map == NULL || channel > dma_sel.map_size)
++		return NULL;
++
++	ch_map = dma_sel.map + channel;
++
++	/* first, try the board mapping */
++
++	if (dma_order) {
++		ord = &dma_order->channels[channel];
++
++		for (ch = 0; ch < dma_channels; ch++) {
++			if (!is_channel_valid(ord->list[ch]))
++				continue;
++
++			if (xxsvideo_chans[ord->list[ch]].in_use == 0) {
++				ch = ord->list[ch] & ~DMA_CH_VALID;
++				goto found;
++			}
++		}
++
++		DBG("/ab/%s: ord->flags %i\n", __func__, ord->flags);
++		if (ord->flags & DMA_CH_NEVER)
++			return NULL;
++	}
++
++	/* second, search the channel map for first free */
++
++	for (ch = 0; ch < dma_channels; ch++) {
++		if (!is_channel_valid(ch_map->channels[ch]))
++			continue;
++
++		if (xxsvideo_chans[ch].in_use == 0) {
++			DBG("mapped channel %d to %d\n", channel, ch);
++			break;
++		}
++	}
++
++	if (ch >= dma_channels)
++		return NULL;
++
++	/* update our channel mapping */
++
++ found:
++	dmach = &xxsvideo_chans[ch];
++	dma_chan_map[channel] = dmach;
++
++	/* select the channel */
++
++	(dma_sel.select)(dmach, ch_map);
++
++	DBG("/ab/%s: dmach->number %i, dmach->irq %i\n", __func__, dmach->number, dmach->irq);
++	return dmach;
++}
++
++static int xxsvideo_dma_check_entry(struct xxsvideo_dma_map *map, int ch)
++{
++	TRACE("dma TRACE %s\n", __func__);
++	return 0;
++}
++
++int __init xxsvideo_dma_init_map(struct xxsvideo_dma_selection *sel)
++{
++	struct xxsvideo_dma_map *nmap;
++	size_t map_sz = sizeof(*nmap) * sel->map_size;
++	int ptr;
++
++	TRACE("dma TRACE %s\n", __func__);
++
++	nmap = kmalloc(map_sz, GFP_KERNEL);
++	if (nmap == NULL)
++		return -ENOMEM;
++
++	memcpy(nmap, sel->map, map_sz);
++	memcpy(&dma_sel, sel, sizeof(*sel));
++
++	printk("/ab/%s nmap: 0x%x\n", __func__, nmap);
++	dma_sel.map = nmap;
++
++	for (ptr = 0; ptr < sel->map_size; ptr++)
++		xxsvideo_dma_check_entry(nmap+ptr, ptr);
++
++	return 0;
++}
++
++int __init xxsvideo_dma_order_set(struct xxsvideo_dma_order *ord)
++{
++	struct xxsvideo_dma_order *nord = dma_order;
++
++	TRACE("dma TRACE %s\n", __func__);
++	if (nord == NULL)
++		nord = kmalloc(sizeof(struct xxsvideo_dma_order), GFP_KERNEL);
++
++	if (nord == NULL) {
++		DBG(KERN_ERR "no memory to store dma channel order\n");
++		return -ENOMEM;
++	}
++
++	dma_order = nord;
++	memcpy(nord, ord, sizeof(struct xxsvideo_dma_order));
++	return 0;
++}
++
++static struct xxsvideo_dma_map __initdata xxsvideo_dma_mappings[] = {
++	[DMACH_I2S0_OUT] = {
++		.name		= "i2s-sdo",
++		.channels[0]	= JADE_DMACAX_IS_DREQH | DMA_CH_VALID,
++ 		.hw_addr.to	= JADE_I2S0_PHYS_BASE + 0x04,
++	},
++	[DMACH_I2S0_IN] = {
++		.name		= "i2s-sdi",
++		.channels[1]	= JADE_DMACAX_IS_DREQH | DMA_CH_VALID,
++ 		.hw_addr.from	= JADE_I2S0_PHYS_BASE + 0x00,
++	},
++	[DMACH_I2S1_OUT] = {
++		.name		= "i2s-sdo",
++		.channels[2]	= JADE_DMACAX_IS_DREQH | DMA_CH_VALID,
++ 		.hw_addr.to	= JADE_I2S1_PHYS_BASE + 0x04,
++	},
++	[DMACH_I2S1_IN] = {
++		.name		= "i2s-sdi",
++		.channels[3]	= JADE_DMACAX_IS_DREQH | DMA_CH_VALID,
++ 		.hw_addr.from	= JADE_I2S1_PHYS_BASE + 0x00,
++	},
++};
++
++static void xxsvideo_dma_select(struct xxsvideo_dma_chan *chan,
++			       struct xxsvideo_dma_map *map)
++{
++	TRACE("dma TRACE %s\n", __func__);
++	chan->dmaca = map->channels[chan->number] & ~DMA_CH_VALID;
++}
++
++static struct xxsvideo_dma_selection __initdata xxsvideo_dma_sel = {
++	.select		= xxsvideo_dma_select,
++	.map		= xxsvideo_dma_mappings,
++	.map_size	= ARRAY_SIZE(xxsvideo_dma_mappings),
++};
++
++static struct xxsvideo_dma_order __initdata xxsvideo_dma_order = {
++	.channels	= {
++		[DMACH_I2S0_IN]	= {
++			.list	= {
++				[0]	= 1 | DMA_CH_VALID,
++			},
++		},
++		[DMACH_I2S1_IN]	= {
++			.list	= {
++				[0]	= 3 | DMA_CH_VALID,
++			},
++		},
++	},
++};
++
++static int __init xxsvideo_dma_init_0(void)
++{
++	TRACE("dma TRACE %s\n", __func__);
++
++	xxsvideo_dma_init(JADE_DMA_CHANNELS, INT_DMAC0, 0x10);
++	xxsvideo_dma_order_set(&xxsvideo_dma_order);
++	return xxsvideo_dma_init_map(&xxsvideo_dma_sel);
++
++}
++
++arch_initcall(xxsvideo_dma_init_0);
++
+--- linux-2.6.27.21/arch/arm/mach-xxsvideo/irq.c	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/mach-xxsvideo/irq.c	2009-11-30 12:24:06.000000000 +0000
+@@ -0,0 +1,181 @@
++/*
++ * linux/arch/arm/mach-xxsvideo/board-xxsvideo.c
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Carsten Schneider <cs@mycable.de>, Tiemo Krueger <tk@mycable.de>
++ *
++ * mycable XXSvideo SoC support
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++#include <linux/init.h>
++#include <linux/module.h>
++#include <linux/mm.h>
++#include <linux/types.h>
++
++// #include <asm/hardware.h>
++#include <asm/irq.h>
++#include <asm/mach-types.h>
++#include <asm/setup.h>
++
++#include <asm/mach/arch.h>
++#include <asm/mach/irq.h>
++#include <asm/mach/map.h>
++
++static void xxsvideo_mask_irq(unsigned int irq)
++{
++	int val;
++
++/*	if (irq == INT_EXT_3)
++		printk("/ab/%s irq = %i\n", __func__, irq);*/
++#ifdef CONFIG_ARCH_JADE_MB86R02
++	if (irq>63){
++		__raw_writel(15, JADE_IRC2_BASE + ICR00 + ((irq-64) << 2)); /* mask int */
++		__raw_writel( 0, JADE_IRC2_BASE + IRQF); /* clear int */
++		__raw_readl (    JADE_IRC2_BASE + IRQF); /* dummy read */
++		__raw_writel( 0, JADE_IRC0_BASE + IRQF); /* clear int */
++		__raw_readl (    JADE_IRC0_BASE + IRQF); /* dummy read */
++	}
++	else
++#endif /* CONFIG_ARCH_JADE_MB86R02 */
++	if (irq>31){
++	        __raw_writel(15, JADE_IRC1_BASE + ICR00 + ((irq-32) << 2)); /* mask int */
++		__raw_writel( 0, JADE_IRC1_BASE + IRQF); /* clear int */
++		__raw_readl (    JADE_IRC1_BASE + IRQF);
++		__raw_writel( 0, JADE_IRC0_BASE + IRQF); /* clear int */
++		__raw_readl (    JADE_IRC0_BASE + IRQF); /* dummy read */
++	}
++	else {
++		if (irq > 9 && irq < 14){ /* external int */
++			/* do not overwrite settings for other external irqs! */
++			val = __raw_readl(JADE_IRCE_BASE+ JADE_IRCE_EIENB);
++			__raw_writel(val & (~(1<<(irq-10)) & 0x0f), JADE_IRCE_BASE+ JADE_IRCE_EIENB); /* mask ext ints */
++
++		}
++                __raw_writel(15, JADE_IRC0_BASE + ICR00 + (irq << 2)); /* mask int */
++		__raw_writel( 0, JADE_IRC0_BASE + IRQF); /* clear int */
++		__raw_readl (    JADE_IRC0_BASE + IRQF); /* dummy read */
++	}
++}
++
++
++static void xxsvideo_unmask_irq(unsigned int irq)
++{
++	int val;
++
++// 	if (irq == INT_EXT_3)
++// 		printk("/ab/%s irq = %i\n", __func__, irq);
++
++#ifdef CONFIG_ARCH_JADE_MB86R02
++	if (irq>63){
++		__raw_writel(10, JADE_IRC0_BASE + ICR00 + (5 << 2)); /* unmask irq */
++		__raw_writel(14, JADE_IRC2_BASE + ICR00 + ((irq-64) << 2));
++	}
++	else
++#endif /* CONFIG_ARCH_JADE_MB86R02 */
++	if (irq<=31){
++                if (irq>9 && irq<14){
++                	/* external int */
++			/* clear all ext interrupts; write '1' is invalid */
++                        __raw_writel(0, JADE_IRCE_BASE + JADE_IRCE_EIREQ);
++			__raw_readl(JADE_IRCE_BASE + JADE_IRCE_EIREQ);
++			/* do not overwrite settings for other external irqs! */
++			/* read register status */
++			val = __raw_readl(JADE_IRCE_BASE + JADE_IRCE_EIENB);
++			/* set enable external interrupt demand for irq */
++			__raw_writel( val | 1<<(irq-10), JADE_IRCE_BASE + JADE_IRCE_EIENB); 	/* unmask ext irq */
++		}
++		__raw_writel(13, JADE_IRC0_BASE + ICR00 + ((irq) << 2)); /* unmask irq */
++	}
++	else {
++		__raw_writel(10, JADE_IRC0_BASE + ICR00 + (6 << 2)); /* unmask irq */
++		__raw_writel(14, JADE_IRC1_BASE + ICR00 + ((irq-32) << 2));
++
++	}
++}
++
++static int xxsvideo_set_irq_type(unsigned int irq, unsigned int type)
++{
++	int val;
++	unsigned char shift;
++
++	if (irq < 10 || irq > 14) {
++		printk(KERN_ERR "XXSVIDEO IRQ: Unsupported external irq %d\n", irq);
++		return -1;
++	}
++
++	shift = (irq - 10) * 2;
++	val = __raw_readl(JADE_IRCE_BASE + JADE_IRCE_EILVL) & ~(0x03<<shift);
++
++        switch (type) {
++        case IRQ_TYPE_EDGE_RISING:
++		__raw_writel(val | (2<<shift), JADE_IRCE_BASE + JADE_IRCE_EILVL);
++                set_irq_handler(irq, handle_edge_irq);
++                break;
++        case IRQ_TYPE_EDGE_FALLING:
++		__raw_writel(val | (3<<shift), JADE_IRCE_BASE + JADE_IRCE_EILVL);
++                set_irq_handler(irq, handle_edge_irq);
++                break;
++        case IRQ_TYPE_LEVEL_LOW:
++		__raw_writel(val |(0<<shift), JADE_IRCE_BASE + JADE_IRCE_EILVL);
++                set_irq_handler(irq, handle_level_irq);
++                break;
++        case IRQ_TYPE_LEVEL_HIGH:
++		__raw_writel(val | (1<<shift), JADE_IRCE_BASE + JADE_IRCE_EILVL);
++                set_irq_handler(irq, handle_level_irq);
++                break;
++
++        /* IRQT_BOTHEDGE is not supported */
++        default:
++                printk(KERN_ERR "XXSVIDEO IRQ: unsupported irq type: 0x%x\n",  type);
++                return -1;
++        }
++        return 0;
++}
++
++static struct irq_chip xxsvideo_ic_chip = {
++	.name		= "xxsvideo-IC",
++	.ack		= xxsvideo_mask_irq,
++	.mask		= xxsvideo_mask_irq,
++	.unmask		= xxsvideo_unmask_irq,
++        .set_type 	= xxsvideo_set_irq_type,
++	.set_wake	= NULL,
++};
++
++//static struct xxsvideo_gpio_data gpio_data = {
++//	.gpio_mask 	= 0x0,
++//};
++
++void __init xxsvideo_init_interrupts(void)
++{
++	unsigned int i;
++	/* IRQ 0-4 are unused */
++	/* all other interrupts */
++	for (i = 5; (i < NR_IRQS); i++) {
++		set_irq_chip(i, &xxsvideo_ic_chip);
++		xxsvideo_mask_irq(i); /* mask all interrupts initially. */
++		set_irq_handler(i, handle_level_irq);
++		set_irq_flags(i, IRQF_VALID | IRQF_PROBE);
++	}
++
++	/* interrupt channel 0 */
++	__raw_writel( 0, JADE_IRC0_BASE + IRQF); /* JADE: clear all interrupts */
++	__raw_writel( 1, JADE_IRC0_BASE + IRQM); /* JADE: enable all interrupts */
++	__raw_writel(0xf, JADE_IRC0_BASE + ILM);  /* JADE: set interrupt level mask register */
++
++	/* interrupt channel 1 */
++        __raw_writel( 0, JADE_IRC1_BASE + IRQF); /* JADE: clear all interrupts */
++        __raw_writel( 1, JADE_IRC1_BASE + IRQM); /* JADE: enable all interrupts */
++        __raw_writel(0xf, JADE_IRC1_BASE + ILM);  /* JADE: set interrupt level */
++
++#ifdef CONFIG_ARCH_JADE_MB86R02
++	/* interrupt channel 2 */
++	__raw_writel( 0, JADE_IRC2_BASE + IRQF); /* clear all interrupts */
++	__raw_writel( 1, JADE_IRC2_BASE + IRQM); /* enable all interrupts */
++	__raw_writel(0xf, JADE_IRC2_BASE + ILM); /* set interrupt level mask */
++#endif /* CONFIG_ARCH_JADE_MB86R02 */
++}
+--- linux-2.6.27/arch/arm/mach-xxsvideo/generic.h	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/arch/arm/mach-xxsvideo/generic.h	2009-01-08 10:49:40.000000000 +0100
+@@ -0,0 +1,34 @@
++/*
++ * linux/include/asm-arm/arch-xxsvideo/generic.h
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Carsten Schneider <cs@mycable.de>, Tiemo Krueger <tk@mycable.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++ /* Processors */
++extern void __init xxsvideo_initialize(unsigned long main_clock);
++
++ /* Interrupts */
++extern void __init xxsvideo_init_interrupts(void); //unsigned int priority[]);
++
++ /* Timer */
++extern struct sys_timer xxsvideo_timer;
++extern unsigned long xxsvideo_gettimeoffset(void);
++extern void xxsvideo_time_init(unsigned long reload, unsigned int ctrl);
++
++ /* Clocks */
++
++
++ /* Power Management */
++
++
++ /* GPIO */
++
++ /* Reset */
++
++extern void (*xxsvideo_arch_reset)(void);
+--- linux-2.6.27/arch/arm/mach-xxsvideo/gpio.c	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/arch/arm/mach-xxsvideo/gpio.c	2009-01-08 10:49:40.000000000 +0100
+@@ -0,0 +1,277 @@
++/*
++ * linux/arch/arm/mach-xxsvideo/gpio.c
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Alexander Bigga <ab@mycable.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++
++#include <linux/clk.h>
++#include <linux/errno.h>
++#include <linux/interrupt.h>
++#include <linux/irq.h>
++#include <linux/kernel.h>
++#include <linux/list.h>
++#include <linux/module.h>
++#include <linux/platform_device.h>
++
++#include <asm/io.h>
++// #include <asm/hardware.h>
++#include <mach/gpio.h>
++
++
++/*--------------------------------------------------------------------------*/
++static inline void __iomem *get_gpio_reg(unsigned pin, unsigned type)
++{
++	void __iomem *gpio_base = (void __iomem *) XXSVIDEO_GPIO_BASE;
++	unsigned int offset;
++
++	pin /= 8;
++
++	switch (type) {
++		/* (PDR) Port Data Register */
++		case GPIO_DATA:	offset = 0x00;
++			break;
++		/* (DDR) Data Direction Register */
++		case GPIO_DIR:	offset = 0x10;
++			break;
++	}
++
++	switch (pin) {
++		case 0:	offset += 0x00;
++			break;
++		case 1:	offset += 0x04;
++			break;
++		case 2:	offset += 0x08;
++			break;
++	}
++
++	return (gpio_base + offset);
++}
++
++
++static inline unsigned get_gpio_mask(unsigned pin)
++{
++	return 1 << (pin % 8);
++}
++
++/*--------------------------------------------------------------------------*/
++
++/* new-style GPIO calls
++ */
++
++int xxsvideo_gpio_direction(unsigned pin, unsigned int dir)
++{
++	void __iomem	*gpio_reg = get_gpio_reg(pin, GPIO_DIR);
++	unsigned	mask = get_gpio_mask(pin);
++	u32		dirstate;
++
++	if (dir == GPIO_DIR_OUTPUT)
++		dirstate = __raw_readl(gpio_reg) | mask;
++	else
++		dirstate = __raw_readl(gpio_reg) & ~mask;
++
++	__raw_writel(dirstate, gpio_reg);
++	return 0;
++}
++EXPORT_SYMBOL(xxsvideo_gpio_direction);
++
++/*--------------------------------------------------------------------------*/
++
++/*
++ * assuming the pin is muxed as a gpio output, set its value.
++ */
++int xxsvideo_set_gpio_value(unsigned pin, int value)
++{
++	void __iomem	*gpio_reg = get_gpio_reg(pin, GPIO_DATA);
++	unsigned	mask = get_gpio_mask(pin);
++	u32		pinstate = 0;
++
++	xxsvideo_gpio_direction(pin, GPIO_DIR_OUTPUT);
++
++	if (value)
++		pinstate = __raw_readl(gpio_reg) | mask;
++	else
++		pinstate = __raw_readl(gpio_reg) & ~mask;
++
++	__raw_writel(pinstate, gpio_reg);
++	return 0;
++}
++EXPORT_SYMBOL(xxsvideo_set_gpio_value);
++
++
++/*
++ * read the pin's value (works even if it's not muxed as a gpio).
++ */
++int xxsvideo_get_gpio_value(unsigned pin)
++{
++	void __iomem	*gpio_reg = get_gpio_reg(pin, GPIO_DATA);
++	unsigned	mask = get_gpio_mask(pin);
++	u32		pinstate;
++
++	xxsvideo_gpio_direction(pin, GPIO_DIR_INPUT);
++
++	pinstate = __raw_readl(gpio_reg);
++	return (pinstate & mask) != 0;
++}
++EXPORT_SYMBOL(xxsvideo_get_gpio_value);
++
++#define gpio_irq_set_wake	NULL
++
++static void gpio_irq_mask(unsigned gpio)
++{
++	int val;
++
++	printk("/ab/%s gpio %i\n", __func__, gpio);
++	gpio -= 100;
++
++	/* clear GPIO interrupt */
++	val = __raw_readl(JADE_CCNT_BASE + JADE_CCNT_CGPIO_IST);
++	__raw_writel( 0, JADE_CCNT_BASE + JADE_CCNT_CGPIO_IST);
++
++}
++
++static void gpio_irq_unmask(unsigned gpio)
++{
++	int val;
++
++	printk("/ab/%s gpio %i\n", __func__, gpio);
++	gpio -= 100;
++	val = __raw_readl(JADE_CCNT_BASE + JADE_CCNT_CGPIO_ISTM) & (~1<<gpio);
++	__raw_writel( val | 1<<gpio, JADE_CCNT_BASE + JADE_CCNT_CGPIO_ISTM); /* unmask irq */
++}
++
++static int gpio_set_irq_type(unsigned int gpio, unsigned int type)
++{
++	int val_ip, val_im;
++	int mode, polarity;
++
++	type = type;
++
++	gpio -= 100;
++
++	val_ip = __raw_readl(JADE_CCNT_BASE + JADE_CCNT_CGPIO_IM) & (~1<<gpio);
++	val_im = __raw_readl(JADE_CCNT_BASE + JADE_CCNT_CGPIO_IM) & (~1<<gpio);
++
++        switch (type) {
++	        case IRQ_TYPE_EDGE_RISING:
++        		polarity = 1;
++        		mode = 1;
++			set_irq_handler(gpio, handle_edge_irq);
++                	break;
++        	case IRQ_TYPE_EDGE_FALLING:
++        		polarity = 0;
++        		mode = 1;
++			set_irq_handler(gpio, handle_edge_irq);
++	                break;
++        	case IRQ_TYPE_LEVEL_LOW:
++        		polarity = 0;
++        		mode = 0;
++			set_irq_handler(gpio, handle_level_irq);
++	                break;
++	        case IRQ_TYPE_LEVEL_HIGH:
++        		polarity = 1;
++        		mode = 0;
++			set_irq_handler(gpio, handle_level_irq);
++	                break;
++
++        /* IRQT_BOTHEDGE is not supported */
++        	default:
++                	printk(KERN_ERR "xxsvideo_set_irq_type: unsupported irq type: 0x%x\n",  type);
++                	return -1;
++        }
++
++	/* level: positive edge */
++	__raw_writel( val_ip | polarity<<gpio, JADE_CCNT_BASE + JADE_CCNT_CGPIO_IP);
++	/* mode: edge */
++	__raw_writel( val_im | mode<<gpio, JADE_CCNT_BASE + JADE_CCNT_CGPIO_IM);
++
++	/* mask interrupt */
++//	__raw_writel( val_im | 1<<gpio, JADE_CCNT_BASE + JADE_CCNT_CGPIO_ISTM);
++        return 0;
++}
++
++static struct irq_chip gpio_irqchip = {
++        .name           = "GPIO",
++        .mask           = gpio_irq_mask,
++        .unmask         = gpio_irq_unmask,
++        .set_type       = gpio_set_irq_type,
++        .set_wake       = NULL,
++};
++
++static void gpio_irq_handler(unsigned irq, struct irq_desc *desc)
++{
++        unsigned        pin;
++        struct irq_desc *gpio;
++        u32             isr;
++
++//	printk("/ab/%s irq = %i\n", __func__, irq);
++	isr = 1;
++
++//         /* temporarily mask (level sensitive) parent IRQ */
++        desc->chip->ack(irq);
++	for (;;) {
++		isr = __raw_readl(JADE_CCNT_BASE + JADE_CCNT_CGPIO_IST);
++ 		if (!isr)
++			break;
++
++// 		printk("/ab/%s JADE_CCNT_CGPIO_IST  0x%x\n", __func__, isr);
++
++//		pin = (unsigned) get_irq_data(irq); // == get_irq_data = (irq_desc[irq].handler_data)
++		pin = 100;
++		gpio = &desc[pin];
++		while (isr) {
++			if (isr & 1) {
++					gpio_irq_mask(pin);
++					//printk("/ab/%s pin %i, desc %p\n", __func__, pin, &desc[pin]);
++					gpio->handle_irq(pin, desc);
++                                      //desc_handle_irq(pin, desc);
++				// printk("/ab/%s done %i gpio->status %i gpio->depth %i\n", __func__, pin, gpio->status, gpio->depth);
++                                      //gpio->handle_irq(pin, desc);
++			}
++			pin++;
++			gpio++;
++			isr >>= 1;
++		}
++        }
++        desc->chip->unmask(irq);
++        /* now it may re-trigger */
++}
++
++/*
++ * Called from the processor-specific init to enable GPIO interrupt support.
++ */
++void __init xxsvideo_gpio_irq_setup(void)
++{
++        unsigned pin;
++
++	printk("/ab/%s\n", __func__);
++
++	for (pin = 100; pin < 123; pin++) {
++		set_irq_chip(pin, &gpio_irqchip);
++		set_irq_handler(pin, handle_simple_irq);
++//		set_irq_handler(pin, handle_level_irq);
++		set_irq_flags(pin, IRQF_VALID);
++	}
++
++	set_irq_chained_handler(INT_GPIO, gpio_irq_handler);
++
++
++
++}
++
++/*
++ * Called from the processor-specific init to enable GPIO pin support.
++ */
++void __init xxsvideo_gpio_init(struct xxsvideo_gpio_data *data)
++{
++	printk("/ab/%s\n", __func__);
++/*
++        gpio = data;*/
++}
++
+--- linux-2.6.27.21/arch/arm/mach-xxsvideo/time.c	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/mach-xxsvideo/time.c	2009-12-02 17:10:42.000000000 +0000
+@@ -0,0 +1,149 @@
++/*
++ * linux/arch/arm/mach-xxsvideo/time.c
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Carsten Schneider <cs@mycable.de>, Tiemo Krueger <tk@mycable.de>
++ *
++ * mycable XXSvideo SoC support
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++#include <linux/init.h>
++#include <linux/interrupt.h>
++#include <linux/irq.h>
++#include <linux/kernel.h>
++#include <linux/sched.h>
++#include <linux/time.h>
++
++#include <asm/hardware/arm_timer.h>
++#include <asm/system.h>
++#include <asm/mach/time.h>
++
++#include <asm/irq.h>
++#include <asm/io.h>
++
++#include <mach/board.h>
++#include <mach/gpio.h>
++
++#include "generic.h"
++
++extern void printascii(const char *);
++
++static unsigned long timer_reload;
++
++#ifdef DEBUG
++static unsigned long ledon;
++
++/* used only for debugging the timer; will be removed! */
++static void toggle_led(void)
++{
++#if defined(CONFIG_MACH_XXSVIDEO_TERMINAL)
++	xxsvideo_set_gpio_value(8, ledon%2);
++#elif defined(CONFIG_MACH_XXSVIDEO_EVALKIT)
++//	xxsvideo_set_gpio_value(216, ledon%2);
++#endif
++	ledon++;
++}
++#endif /* DEBUG */
++
++/*
++ * Returns number of us since last clock interrupt.  Note that interrupts
++ * will have been disabled by do_gettimeoffset()
++ */
++unsigned long xxsvideo_gettimeoffset(void)
++{
++	unsigned long elapsed, ticks2, intpending;
++	unsigned long usecs = 0;
++
++	/*
++	 * Get the current number of ticks.  Note that there is a race
++	 * condition between us reading the timer and checking for
++	 * an interrupt.  We get around this by ensuring that the
++	 * counter has not reloaded between our two reads.
++	 */
++	elapsed = __raw_readl(JADE_TIMER0_BASE + JADE_TIMER_VALUE);
++	do {
++		ticks2 = elapsed;
++		intpending = __raw_readl(JADE_TIMER0_BASE | TIMER_RIS); // FIXME: TIMER_MIS
++		elapsed = __raw_readl(JADE_TIMER0_BASE | JADE_TIMER_VALUE);
++	} while (elapsed > ticks2);
++
++	/*
++	 * Number of ticks since last interrupt.
++	 */
++	elapsed = timer_reload - elapsed;
++
++	/*
++	 * Interrupt pending?  If so, we've reloaded once already.
++	 */
++	if (intpending)
++		usecs += jiffies_to_usecs(1);
++
++	/*
++	 * Convert the ticks to usecs
++	 */
++	usecs += (elapsed * jiffies_to_usecs(1)) / (timer_reload + 1);
++	 
++//	 sprintf(buf, "%s %lu\n", __func__, usecs);
++//         printascii(buf);
++	 
++	return usecs;
++}
++
++
++
++/*
++ * IRQ handler for the timer
++ */
++static irqreturn_t xxsvideo_timer_interrupt(int irq, void *dev_id)
++{
++	/*
++	 * clear the interrupt
++	 */
++	__raw_writel(1, JADE_TIMER0_BASE + TIMER_INTCLR);
++
++	timer_tick();
++	
++//	toggle_led();
++	
++
++	return IRQ_HANDLED;
++}
++
++static struct irqaction xxsvideo_timer_irq = {
++	.name		= "xxsvideo Timer0 Tick",
++	.flags		= IRQF_DISABLED | IRQF_TIMER, // | IRQF_IRQPOLL,
++	.handler	= xxsvideo_timer_interrupt,
++};
++
++/*
++ * Set up timer interrupt
++ */
++void xxsvideo_time_init(unsigned long reload, unsigned int ctrl)
++{
++        unsigned int timer_ctrl = TIMER_CTRL_ENABLE | TIMER_CTRL_PERIODIC |
++        				TIMER_CTRL_32BIT | TIMER_CTRL_IE | TIMER_CTRL_DIV1;
++
++        timer_reload = reload;
++        timer_ctrl |= ctrl;
++
++       	/*
++	 * Initialise to a known state (all timers off)
++	 */
++	__raw_writel(0, JADE_TIMER0_BASE | JADE_TIMER_CONTROL);
++	__raw_writel(0, JADE_TIMER1_BASE | JADE_TIMER_CONTROL);
++
++
++	__raw_writel(timer_reload,JADE_TIMER0_BASE + TIMER_VALUE);
++	__raw_writel(timer_reload,JADE_TIMER0_BASE + TIMER_LOAD);
++	__raw_writel(timer_ctrl, JADE_TIMER0_BASE + TIMER_CTRL);
++	/*
++	 * Make irqs happen for the system timer
++	 */
++	setup_irq(IRQ_TIMERINT0, &xxsvideo_timer_irq);
++
++}
+--- linux-2.6.27.21/arch/arm/mach-xxsvideo/xxsvideo-keys.c	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/mach-xxsvideo/xxsvideo-keys.c	2009-12-02 11:54:25.000000000 +0000
+@@ -0,0 +1,371 @@
++/*
++ * linux/arch/arm/mach-xxsvideo/xxsvideo-keys.c
++ *
++ *  Copyright (C) 2007-2008 mycable GmbH
++ *       Alexander Bigga <ab@mycable.de>
++ *
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++#include <linux/module.h>
++#include <linux/version.h>
++
++#include <linux/init.h>
++#include <linux/fs.h>
++#include <linux/interrupt.h>
++#include <linux/irq.h>
++#include <linux/sched.h>
++#include <linux/pm.h>
++#include <linux/sysctl.h>
++#include <linux/proc_fs.h>
++#include <linux/delay.h>
++#include <linux/platform_device.h>
++#include <linux/input.h>
++#include <linux/irq.h>
++
++#include <linux/mutex.h>
++#include <linux/workqueue.h>
++
++#include <asm/gpio.h>
++#include <asm/atomic.h>
++#include <asm/dma.h>
++
++static irqreturn_t gpio_keys_isr( int irq, void *dev_id);
++static void gpio_keys_work( struct work_struct *work);
++static void gpio_keys_interrupt( int irq, struct platform_device *pdev);
++
++/*
++ * We cannot run i2c_transfer() from interrupt context, so we use a 
++ * work function for deferred work: gpio_keys_isr() schedules 
++ * gpio_keys_work(), which in turn invokes gpio_keys_interrupt().
++ *
++ * Note that the interrupt is disabled in gpio_keys_isr(), and 
++ * re-enabled in gpio_keys_work(); this cannot be avoided since the 
++ * interrupt is level-triggered. If the interrupt is shared, this may 
++ * cause long interrupt latencies for other drivers.
++ *
++ * There is one work_struct for every combination of interrupt and 
++ * platform device, since we need these parameters for calling 
++ * gpio_keys_interrupt(). In general, there exists just one platform 
++ * device, and all buttons use the same interrupt, so there is only one 
++ * work_struct altogether.
++ */
++
++struct gpio_keys_work_entry {
++	unsigned int irq;
++	struct platform_device *pdev;
++	int use_count;
++	struct work_struct work;
++	struct list_head list;
++};
++
++static spinlock_t gpio_keys_work_lock = SPIN_LOCK_UNLOCKED;
++static LIST_HEAD(gpio_keys_work_list);
++
++static int gpio_keys_request_irq(unsigned int irq, struct platform_device *pdev)
++{
++	struct gpio_keys_work_entry *entry;
++	int ret = 0;
++
++	/* check if work entry already exists */
++	spin_lock(&gpio_keys_work_lock);
++	list_for_each_entry(entry, &gpio_keys_work_list, list) {
++		if (entry->irq == irq && entry->pdev == pdev) {
++			entry->use_count++;
++			spin_unlock(&gpio_keys_work_lock);
++			return 0;
++		}
++	}
++
++	/* allocate work entry */
++	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
++	if (!entry) {
++		spin_unlock(&gpio_keys_work_lock);
++		return -ENOMEM;
++	}
++
++	/* request interrupt */
++	ret = request_irq(irq, gpio_keys_isr, IRQF_SHARED, 
++	                  "xxsvideo-keys", pdev);
++	if (ret != 0) {
++		spin_unlock(&gpio_keys_work_lock);
++		kfree(entry);
++		return ret;
++	}
++
++	/* set up work entry */
++	entry->irq = irq;
++	entry->pdev = pdev;
++	entry->use_count = 1;
++	INIT_WORK(&entry->work, gpio_keys_work);
++
++	/* add work entry to list */
++	list_add(&entry->list, &gpio_keys_work_list);
++	spin_unlock(&gpio_keys_work_lock);
++
++	return 0;
++}
++
++static void gpio_keys_free_irq(unsigned int irq, struct platform_device *pdev)
++{
++	struct gpio_keys_work_entry *entry, *n;
++
++	/* find work entry */
++	spin_lock(&gpio_keys_work_lock);
++	list_for_each_entry_safe(entry, n, &gpio_keys_work_list, list) {
++		if (entry->irq != irq || entry->pdev != pdev)
++			continue;
++
++		/* check if work entry is still used */
++		entry->use_count--;
++		if (entry->use_count != 0)
++			break;
++
++		/* remove work entry from list */
++		list_del(&entry->list);
++		spin_unlock(&gpio_keys_work_lock);
++
++		/* wait for work to finish */
++		flush_scheduled_work();
++
++		/* free work entry */
++		kfree(entry);
++
++		/* free interrupt */
++		free_irq(irq, pdev);
++
++		return;
++	}
++	spin_unlock(&gpio_keys_work_lock);
++}
++
++static irqreturn_t gpio_keys_isr( int irq, void *dev_id)
++{
++	struct platform_device *pdev = dev_id;
++	struct gpio_keys_work_entry *entry;
++	int handled = 0;
++
++	disable_irq_nosync(irq);
++
++	spin_lock(&gpio_keys_work_lock);
++	list_for_each_entry(entry, &gpio_keys_work_list, list) {
++		if (entry->irq == irq && entry->pdev == pdev) {
++			(void) schedule_work(&entry->work);
++			handled = 1;
++			break;
++		}
++	}
++	spin_unlock(&gpio_keys_work_lock);
++
++	if (handled)
++		return IRQ_HANDLED;
++
++	enable_irq(irq);
++	return IRQ_NONE;
++}
++
++static void gpio_keys_work( struct work_struct *work)
++{
++	struct gpio_keys_work_entry *entry;
++
++	entry = container_of(work, struct gpio_keys_work_entry, work);
++	gpio_keys_interrupt(entry->irq, entry->pdev);
++	enable_irq(entry->irq);
++}
++
++static void gpio_keys_interrupt( int irq, struct platform_device *pdev)
++{
++	atomic_t v = ATOMIC_INIT(0);
++	int i;
++	struct xxsvideo_gpio_keys_platform_data *pdata = pdev->dev.platform_data;
++	struct input_dev *input = platform_get_drvdata(pdev);
++
++//	int state;
++//	unsigned long flags;
++        static int count = 0;
++	int ret = 0;
++	int intf = 0;
++
++        count++;
++
++	for (i = 0; i < pdata->nbuttons; i++) {
++		struct xxsvideo_gpio_keys_button *button = &pdata->buttons[i];
++		int gpio = button->gpio;
++		int gpio_encoder = button->gpio_encoder;
++		int button_mask = 0;
++		int offset_gpio = 0;
++		int offset_gpio_encoder = 0;
++
++		/* avoid reading I/O-Expander registers multiple times */
++		/* FIXME: only valid if all used GPIOs use the same block! */
++		if (atomic_read(&v) == 0) {
++			intf = xxsvideo_ioexpander_get_intf(gpio);
++			ret = xxsvideo_ioexpander_get_io(gpio);
++			atomic_inc(&v);
++		}
++
++		if (gpio >= 210) {
++			offset_gpio = 210;
++			offset_gpio_encoder = 210;
++		} else if (gpio >= 200) {
++			offset_gpio = 200;
++			offset_gpio_encoder = 200;
++		}
++
++		button_mask = 1<<(gpio-offset_gpio);
++// 		printk("/ab/%s (%d) ret 0x%x, intf 0x%x, mask 0x%x, gpio %d\n", __func__, count, ret, intf, button_mask, gpio);
++
++		if (irq == gpio_to_irq(gpio) && (button_mask & intf)) {
++//			unsigned int type = button->type ?: EV_KEY;
++			int state;
++			int code = 0;
++			int mask_encoder_left = 0;
++
++			mask_encoder_left = (1<<(gpio-offset_gpio) | 1<<(gpio_encoder-offset_gpio_encoder));
++
++			/* special handling of encoder */
++			if (button->gpio_encoder) {
++				if ( (ret & mask_encoder_left) == mask_encoder_left ) {
++					state = 1 ^ button->active_low;
++					code = button->code;
++// 					printk("/ab/%s LINKS 0x%x, mask 0x%x, gpio %d, code %d\n", __func__, ret, mask_encoder_left, gpio, code);
++				}
++				else if ( (ret & button_mask) == button_mask ) {
++					state = 1 ^ button->active_low;
++					code = button->code_right;
++//  					printk("/ab/%s RECHTS 0x%x, mask 0x%x, gpio %d, code %d\n", __func__, ret, mask_encoder_right, gpio, code);
++				} else {
++// 					printk("/ab/%s x ret 0x%x, gpio %d\n", __func__, ret, gpio);
++					state = 0 ^ button->active_low;
++ 					code = button->code;
++ 					/* send code_right too - we don't know which one was active before */
++					input_report_key(input, button->code_right, !!state);
++				}
++			} else {
++				dump_dma_regs();
++				dump_i2s_regs();
++				printk("/ab/%s no encoder: gpio %i ret 0x%x\n", __func__, gpio, ret);
++				if ( (ret & button_mask) == button_mask ) {
++					state = 1 ^ button->active_low;
++				} else
++					state = 0 ^ button->active_low;
++
++				code=button->code;
++			}
++//  			printk("/ab/%s (%d): state %i, gpio %i, code %i, !!state 0x%x\n", __func__, count, state, gpio, code, !!state);
++			input_report_key(input, code, !!state);
++// 			}
++		}
++	}
++
++	/* finally sync all the input events */
++	input_sync(input);
++}
++
++static int __devinit gpio_keys_probe(struct platform_device *pdev)
++{
++	struct xxsvideo_gpio_keys_platform_data *pdata = pdev->dev.platform_data;
++	struct input_dev *input;
++	int i, error, irq_registered;
++
++	input = input_allocate_device();
++	if (!input)
++		return -ENOMEM;
++
++	platform_set_drvdata(pdev, input);
++
++	/* only accept key events */
++	input->evbit[0] = BIT(EV_KEY);
++
++	input->name = pdev->name;
++	input->phys = "xxsvideo-keys/input0";
++	input->dev.parent = &pdev->dev;
++
++	input->id.bustype = BUS_HOST;
++	input->id.vendor = 0x0001;
++	input->id.product = 0x0001;
++	input->id.version = 0x0100;
++
++	irq_registered = 0;
++
++	for (i = 0; i < pdata->nbuttons; i++) {
++		struct xxsvideo_gpio_keys_button *button = &pdata->buttons[i];
++		int irq = gpio_to_irq(button->gpio);
++		unsigned int type = button->type ?: EV_KEY;
++
++		gpio_direction_input(button->gpio);
++		set_irq_type(irq, IRQ_TYPE_LEVEL_LOW);
++
++		error = gpio_keys_request_irq(irq, pdev);
++		if (error) {
++			printk(KERN_ERR "xxsvideo-keys: unable to claim irq %d; error %d\n",
++				irq, error);
++			goto fail;
++		}
++
++		input_set_capability(input, type, button->code);
++		if (button->code_right)
++			input_set_capability(input, type, button->code_right);
++	}
++
++	error = input_register_device(input);
++	if (error) {
++		printk(KERN_ERR "Unable to register gpio-keys input device\n");
++		goto fail;
++	}
++
++	return 0;
++
++ fail:
++	for (i = i - 1; i >= 0; i--)
++		gpio_keys_free_irq(gpio_to_irq(pdata->buttons[i].gpio), pdev);
++
++	input_free_device(input);
++
++	return error;
++}
++
++static int __devexit gpio_keys_remove(struct platform_device *pdev)
++{
++	struct xxsvideo_gpio_keys_platform_data *pdata = pdev->dev.platform_data;
++	struct input_dev *input = platform_get_drvdata(pdev);
++	int i;
++
++	for (i = 0; i < pdata->nbuttons; i++) {
++		int irq = gpio_to_irq(pdata->buttons[i].gpio);
++		gpio_keys_free_irq(irq, pdev);
++	}
++
++	input_unregister_device(input);
++
++	return 0;
++}
++
++struct platform_driver gpio_keys_device_driver = {
++	.probe		= gpio_keys_probe,
++	.remove		= __devexit_p(gpio_keys_remove),
++	.driver		= {
++		.name	= "xxsvideo-keys",
++	}
++};
++
++static int __init gpio_keys_init(void)
++{
++	return platform_driver_register(&gpio_keys_device_driver);
++}
++
++static void __exit gpio_keys_exit(void)
++{
++	platform_driver_unregister(&gpio_keys_device_driver);
++}
++
++module_init(gpio_keys_init);
++module_exit(gpio_keys_exit);
++
++MODULE_LICENSE("GPL");
++MODULE_AUTHOR("Alexander Bigga <ab@mycable.de>");
++MODULE_DESCRIPTION("Keyboard driver for CPU GPIOs");
+--- linux-2.6.27.21/arch/arm/mach-xxsvideo/Kconfig	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/mach-xxsvideo/Kconfig	2009-11-27 10:04:52.000000000 +0000
+@@ -0,0 +1,130 @@
++if ARCH_JADE
++
++comment "Fujitsu Jade Options"
++
++choice
++	prompt "Fujitsu Jade SoC"
++
++config ARCH_JADE_MB86R01
++	bool "MB86R01 'Jade'"
++	help
++	  Select this for the Fujitsu MB86R01 'Jade' SoC.
++
++config ARCH_JADE_MB86R02
++	bool "MB86R02 'Jade-D'"
++	help
++	  Select this for the Fujitsu MB86R02 'Jade-D' SoC.
++
++endchoice
++
++config JADE_PACLK_FREQ
++	int "MB86Rxx APB-A clock"
++	default "41343750" if ARCH_JADE_MB86R01
++	default "41666666" if ARCH_JADE_MB86R02
++	help
++	  The frequency f_PACLK of the APB-A bus, in Hz. The Timer, UART 
++	  and I2C modules are attached to this bus, so the configured 
++	  value is used for CLOCK_TICK_RATE (timex.h), BASE_BAUD (serial.h), 
++	  and I2C driver (i2c-xxsvideo.c).
++	  
++	  The value should be as accurate as possible. In general, use the 
++	  default value, and adapt it only when f_PACLK has been changed in 
++	  the bootloader (by the CRG registers CRPR and CRDA).
++
++config MACH_XXSVIDEO
++        bool
++        default n
++
++config MACH_XXSVIDEOD
++        bool
++        default n
++
++choice
++	prompt "Fujitsu Jade Implementations"
++
++config MACH_XXSVIDEO_TERMINAL
++	bool "mycable Jade Starter Kit"
++	depends on ARCH_JADE_MB86R01
++	select MACH_XXSVIDEO
++	help
++	  Select this if you are using mycable's Jade Starter Kit with 
++	  XXSvideo board and XXSterminal board.
++	  <http://www.mycable.de>
++
++config MACH_XXSVIDEO_EVALKIT
++	bool "mycable Jade Evaluation Kit"
++	depends on ARCH_JADE_MB86R01
++	select MACH_XXSVIDEO
++	help
++	  Select this if you are using mycable's Jade Evaluation Kit with 
++	  XXSvideo board, Jade Evaluation Board, Extension Video Input board 
++	  (optional), and Extension Video Output board (optional).
++	  <http://www.mycable.de>
++
++config MACH_XXSVIDEOD_EVALKIT
++	bool "mycable Jade-D Evaluation Kit"
++	depends on ARCH_JADE_MB86R02
++	select MACH_XXSVIDEOD
++	help
++	  Select this if you are using mycable's Jade-D Evaluation Kit with 
++	  XXSvideo-D board, Jade Evaluation Board, and Jade-D Interface 
++	  Adapter board.
++	  <http://www.mycable.de>
++
++endchoice
++
++config MACH_XXSVIDEO_CAN_GROUP2
++	bool "Use Jade pin multiplex group #2 for CAN"
++	depends on MACH_XXSVIDEO_EVALKIT
++	default n
++	help
++	  On the Jade Evaluation Kit, use CAN-0 and CAN-1 from Jade's pin 
++	  multiplex group #2 (instead of the default group #4). Note that 
++	  you have to set the DIP switches SW902.1 "CAN_GROUP2_EN#" and 
++	  SW902.2 "CAN_GROUP4_EN#" on the Jade Evaluation Board accordingly.
++
++config MACH_XXSVIDEO_EVALKIT_VIDEOIN
++	bool "mycable Video-IN Extension for Jade Evaluation Kit"
++	depends on MACH_XXSVIDEO_EVALKIT
++	help
++	  Select this if you have the Video-IN extension for mycable's
++	  Jade Evaluation Kit.
++
++config XXSVIDEO_IOEXPANDER
++	tristate "mycable I/O-Expander"
++	depends on MACH_XXSVIDEO_EVALKIT || MACH_XXSVIDEOD_EVALKIT
++	help
++	  Select this to use the MCP23017 I/O Expanders on mycable's Jade 
++	  Evaluation Kit or Jade-D Evaluation Kit (e.g., for push buttons 
++	  and front LEDs).
++
++config XXSVIDEO_KEYS
++	tristate "mycable key/button support"
++	depends on MACH_XXSVIDEO_TERMINAL || XXSVIDEO_IOEXPANDER
++	depends on INPUT
++	help
++	  Select this to use the push buttons on mycable's Jade Starter Kit, 
++	  Jade Evaluation Kit, or Jade-D Evaluation Kit.
++
++config XXSVIDEO_SII164
++    tristate "mycable SiI 164 driver"
++    depends on MACH_XXSVIDEO_TERMINAL || MACH_XXSVIDEO_EVALKIT || \
++               MACH_XXSVIDEOD_EVALKIT
++    help
++      Select this to use the SiI 164 Panel Link Transmitters on mycable's 
++      Jade Starter Kit, Jade Evaluation Kit, or Jade-D Evaluation Kit.
++
++config SPI_AD7812
++    tristate "mycable AD7812"
++    depends on SPI
++    help
++      Select this to use an AD7812 A/D Converter connected by SPI.
++
++config SPI_M41T94
++    tristate "mycable m41t94"
++    depends on SPI
++    help
++      Select this to use an M41T94 RTC connected by SPI.
++
++endif
++
+--- linux-2.6.27.21/arch/arm/mach-xxsvideo/Makefile	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/mach-xxsvideo/Makefile	2009-11-20 05:20:57.000000000 +0000
+@@ -0,0 +1,24 @@
++#
++# Makefile for the linux kernel.
++#
++
++obj-y		:= irq.o gpio.o time.o dma.o
++obj-m		:=
++obj-n		:=
++obj-		:=
++
++# CPU module
++obj-$(CONFIG_MACH_XXSVIDEO)		+= xxsvideo.o
++obj-$(CONFIG_MACH_XXSVIDEOD)		+= xxsvideod.o
++
++# Extension Boards
++obj-$(CONFIG_MACH_XXSVIDEO_TERMINAL)	+= board-xxsterminal.o
++obj-$(CONFIG_MACH_XXSVIDEO_EVALKIT)	+= board-jadeevalkit.o
++obj-$(CONFIG_MACH_XXSVIDEOD_EVALKIT)	+= board-jadedevalkit.o
++
++obj-$(CONFIG_XXSVIDEO_IOEXPANDER)	+= io-expander.o
++obj-$(CONFIG_XXSVIDEO_KEYS)		+= xxsvideo-keys.o
++obj-$(CONFIG_XXSVIDEO_SII164)		+= sii164.o
++obj-$(CONFIG_FB_XXSVIDEO)		+= fb_modes.o
++obj-$(CONFIG_SPI_AD7812)		+= ad7812.o
++obj-$(CONFIG_SPI_M41T94)		+= m41t94.o
+--- linux-2.6.27/arch/arm/mach-xxsvideo/Makefile.boot	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/arch/arm/mach-xxsvideo/Makefile.boot	2009-01-08 10:49:40.000000000 +0100
+@@ -0,0 +1,9 @@
++# Note: the following conditions must always be true:
++#   ZRELADDR == virt_to_phys(TEXTADDR)
++#   PARAMS_PHYS must be within 4MB of ZRELADDR
++#   INITRD_PHYS must be in RAM
++
++   zreladdr-y	:= 0x40008000
++params_phys-y	:= 0x40000100
++#initrd_phys-y	:= 0x40410000
++
+--- linux-2.6.27/arch/arm/Makefile	2009-01-08 10:49:43.000000000 +0100
++++ linux-2.6.27-dev/arch/arm/Makefile	2009-01-08 10:49:40.000000000 +0100
+@@ -143,6 +143,7 @@
+  machine-$(CONFIG_ARCH_MSM7X00A)   := msm
+  machine-$(CONFIG_ARCH_LOKI)       := loki
+  machine-$(CONFIG_ARCH_MV78XX0)    := mv78xx0
++ machine-$(CONFIG_ARCH_JADE)       := xxsvideo
+ 
+ ifeq ($(CONFIG_ARCH_EBSA110),y)
+ # This is what happens if you forget the IOCS16 line.
+--- linux-2.6.27/arch/arm/mm/Kconfig	2009-01-08 10:49:43.000000000 +0100
++++ linux-2.6.27-dev/arch/arm/mm/Kconfig	2009-01-08 10:49:40.000000000 +0100
+@@ -187,14 +187,14 @@
+ 		ARCH_AT91SAM9260 || ARCH_AT91SAM9261 || \
+ 		ARCH_AT91SAM9263 || ARCH_AT91SAM9RL || \
+ 		ARCH_AT91SAM9G20 || ARCH_AT91CAP9 || \
+-		ARCH_NS9XXX || ARCH_DAVINCI || ARCH_MX2
++		ARCH_NS9XXX || ARCH_DAVINCI || ARCH_MX2 || ARCH_JADE 
+ 	default y if ARCH_VERSATILE_PB || MACH_VERSATILE_AB || \
+ 		ARCH_OMAP730 || ARCH_OMAP16XX || \
+ 		ARCH_PNX4008 || ARCH_NETX || CPU_S3C2412 || \
+ 		ARCH_AT91SAM9260 || ARCH_AT91SAM9261 || \
+ 		ARCH_AT91SAM9263 || ARCH_AT91SAM9RL || \
+ 		ARCH_AT91SAM9G20 || ARCH_AT91CAP9 || \
+-		ARCH_NS9XXX || ARCH_DAVINCI || ARCH_MX2
++		ARCH_NS9XXX || ARCH_DAVINCI || ARCH_MX2 || ARCH_JADE 
+ 	select CPU_32v5
+ 	select CPU_ABRT_EV5TJ
+ 	select CPU_PABRT_NOIFAR
+--- linux-2.6.27.21/arch/arm/tools/mach-types	2009-03-23 22:04:09.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/tools/mach-types	2009-11-20 05:21:09.000000000 +0000
+@@ -1861,3 +1861,4 @@
+ imx27ipcam		MACH_IMX27IPCAM		IMX27IPCAM		1871
+ nenoc			MACH_NEMOC		NEMOC			1872
+ geneva			MACH_GENEVA		GENEVA			1873
++xxsvideod		MACH_XXSVIDEOD		XXSVIDEOD		2526
+--- linux-2.6.27.21/arch/arm/configs/xxsvideo_xxsterminal_defconfig	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/configs/xxsvideo_xxsterminal_defconfig	2009-12-02 17:10:06.000000000 +0000
+@@ -0,0 +1,1424 @@
++#
++# Automatically generated make config: don't edit
++# Linux kernel version: 2.6.27.21
++# Wed Dec  2 15:20:07 2009
++#
++CONFIG_ARM=y
++CONFIG_SYS_SUPPORTS_APM_EMULATION=y
++CONFIG_GENERIC_GPIO=y
++# CONFIG_GENERIC_TIME is not set
++# CONFIG_GENERIC_CLOCKEVENTS is not set
++CONFIG_MMU=y
++# CONFIG_NO_IOPORT is not set
++CONFIG_GENERIC_HARDIRQS=y
++CONFIG_STACKTRACE_SUPPORT=y
++CONFIG_HAVE_LATENCYTOP_SUPPORT=y
++CONFIG_LOCKDEP_SUPPORT=y
++CONFIG_TRACE_IRQFLAGS_SUPPORT=y
++CONFIG_HARDIRQS_SW_RESEND=y
++CONFIG_GENERIC_IRQ_PROBE=y
++CONFIG_RWSEM_GENERIC_SPINLOCK=y
++# CONFIG_ARCH_HAS_ILOG2_U32 is not set
++# CONFIG_ARCH_HAS_ILOG2_U64 is not set
++CONFIG_GENERIC_HWEIGHT=y
++CONFIG_GENERIC_CALIBRATE_DELAY=y
++CONFIG_ARCH_SUPPORTS_AOUT=y
++CONFIG_ZONE_DMA=y
++CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=y
++CONFIG_VECTORS_BASE=0xffff0000
++CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
++
++#
++# General setup
++#
++CONFIG_EXPERIMENTAL=y
++CONFIG_BROKEN_ON_SMP=y
++CONFIG_INIT_ENV_ARG_LIMIT=32
++CONFIG_LOCALVERSION=""
++# CONFIG_LOCALVERSION_AUTO is not set
++CONFIG_SWAP=y
++CONFIG_SYSVIPC=y
++CONFIG_SYSVIPC_SYSCTL=y
++CONFIG_POSIX_MQUEUE=y
++CONFIG_BSD_PROCESS_ACCT=y
++# CONFIG_BSD_PROCESS_ACCT_V3 is not set
++# CONFIG_TASKSTATS is not set
++# CONFIG_AUDIT is not set
++CONFIG_IKCONFIG=y
++CONFIG_IKCONFIG_PROC=y
++CONFIG_LOG_BUF_SHIFT=14
++# CONFIG_CGROUPS is not set
++# CONFIG_GROUP_SCHED is not set
++CONFIG_SYSFS_DEPRECATED=y
++CONFIG_SYSFS_DEPRECATED_V2=y
++# CONFIG_RELAY is not set
++# CONFIG_NAMESPACES is not set
++# CONFIG_BLK_DEV_INITRD is not set
++# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
++CONFIG_SYSCTL=y
++CONFIG_EMBEDDED=y
++CONFIG_UID16=y
++CONFIG_SYSCTL_SYSCALL=y
++CONFIG_KALLSYMS=y
++# CONFIG_KALLSYMS_ALL is not set
++# CONFIG_KALLSYMS_EXTRA_PASS is not set
++CONFIG_HOTPLUG=y
++CONFIG_PRINTK=y
++CONFIG_BUG=y
++CONFIG_ELF_CORE=y
++CONFIG_COMPAT_BRK=y
++CONFIG_BASE_FULL=y
++CONFIG_FUTEX=y
++CONFIG_ANON_INODES=y
++CONFIG_EPOLL=y
++CONFIG_SIGNALFD=y
++CONFIG_TIMERFD=y
++CONFIG_EVENTFD=y
++CONFIG_SHMEM=y
++CONFIG_VM_EVENT_COUNTERS=y
++CONFIG_SLAB=y
++# CONFIG_SLUB is not set
++# CONFIG_SLOB is not set
++# CONFIG_PROFILING is not set
++# CONFIG_MARKERS is not set
++CONFIG_HAVE_OPROFILE=y
++# CONFIG_KPROBES is not set
++# CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is not set
++# CONFIG_HAVE_IOREMAP_PROT is not set
++CONFIG_HAVE_KPROBES=y
++CONFIG_HAVE_KRETPROBES=y
++# CONFIG_HAVE_ARCH_TRACEHOOK is not set
++# CONFIG_HAVE_DMA_ATTRS is not set
++# CONFIG_USE_GENERIC_SMP_HELPERS is not set
++# CONFIG_HAVE_CLK is not set
++CONFIG_PROC_PAGE_MONITOR=y
++CONFIG_HAVE_GENERIC_DMA_COHERENT=y
++CONFIG_SLABINFO=y
++CONFIG_RT_MUTEXES=y
++# CONFIG_TINY_SHMEM is not set
++CONFIG_BASE_SMALL=0
++CONFIG_MODULES=y
++# CONFIG_MODULE_FORCE_LOAD is not set
++CONFIG_MODULE_UNLOAD=y
++# CONFIG_MODULE_FORCE_UNLOAD is not set
++# CONFIG_MODVERSIONS is not set
++# CONFIG_MODULE_SRCVERSION_ALL is not set
++CONFIG_KMOD=y
++CONFIG_BLOCK=y
++# CONFIG_LBD is not set
++# CONFIG_BLK_DEV_IO_TRACE is not set
++# CONFIG_LSF is not set
++# CONFIG_BLK_DEV_BSG is not set
++# CONFIG_BLK_DEV_INTEGRITY is not set
++
++#
++# IO Schedulers
++#
++CONFIG_IOSCHED_NOOP=y
++CONFIG_IOSCHED_AS=y
++# CONFIG_IOSCHED_DEADLINE is not set
++# CONFIG_IOSCHED_CFQ is not set
++CONFIG_DEFAULT_AS=y
++# CONFIG_DEFAULT_DEADLINE is not set
++# CONFIG_DEFAULT_CFQ is not set
++# CONFIG_DEFAULT_NOOP is not set
++CONFIG_DEFAULT_IOSCHED="anticipatory"
++CONFIG_CLASSIC_RCU=y
++
++#
++# System Type
++#
++# CONFIG_ARCH_AAEC2000 is not set
++# CONFIG_ARCH_INTEGRATOR is not set
++# CONFIG_ARCH_REALVIEW is not set
++# CONFIG_ARCH_VERSATILE is not set
++# CONFIG_ARCH_AT91 is not set
++# CONFIG_ARCH_CLPS7500 is not set
++# CONFIG_ARCH_CLPS711X is not set
++# CONFIG_ARCH_EBSA110 is not set
++# CONFIG_ARCH_EP93XX is not set
++# CONFIG_ARCH_FOOTBRIDGE is not set
++CONFIG_ARCH_JADE=y
++# CONFIG_ARCH_NETX is not set
++# CONFIG_ARCH_H720X is not set
++# CONFIG_ARCH_IMX is not set
++# CONFIG_ARCH_IOP13XX is not set
++# CONFIG_ARCH_IOP32X is not set
++# CONFIG_ARCH_IOP33X is not set
++# CONFIG_ARCH_IXP23XX is not set
++# CONFIG_ARCH_IXP2000 is not set
++# CONFIG_ARCH_IXP4XX is not set
++# CONFIG_ARCH_L7200 is not set
++# CONFIG_ARCH_KIRKWOOD is not set
++# CONFIG_ARCH_KS8695 is not set
++# CONFIG_ARCH_NS9XXX is not set
++# CONFIG_ARCH_LOKI is not set
++# CONFIG_ARCH_MV78XX0 is not set
++# CONFIG_ARCH_MXC is not set
++# CONFIG_ARCH_ORION5X is not set
++# CONFIG_ARCH_PNX4008 is not set
++# CONFIG_ARCH_PXA is not set
++# CONFIG_ARCH_RPC is not set
++# CONFIG_ARCH_SA1100 is not set
++# CONFIG_ARCH_S3C2410 is not set
++# CONFIG_ARCH_SHARK is not set
++# CONFIG_ARCH_LH7A40X is not set
++# CONFIG_ARCH_DAVINCI is not set
++# CONFIG_ARCH_OMAP is not set
++# CONFIG_ARCH_MSM7X00A is not set
++
++#
++# Boot options
++#
++
++#
++# Power management
++#
++
++#
++# Fujitsu Jade Options
++#
++CONFIG_ARCH_JADE_MB86R01=y
++# CONFIG_ARCH_JADE_MB86R02 is not set
++CONFIG_JADE_PACLK_FREQ=38812500
++CONFIG_MACH_XXSVIDEO=y
++# CONFIG_MACH_XXSVIDEOD is not set
++CONFIG_MACH_XXSVIDEO_TERMINAL=y
++# CONFIG_MACH_XXSVIDEO_EVALKIT is not set
++# CONFIG_MACH_XXSVIDEOD_EVALKIT is not set
++# CONFIG_XXSVIDEO_KEYS is not set
++CONFIG_XXSVIDEO_SII164=m
++
++#
++# Processor Type
++#
++CONFIG_CPU_32=y
++CONFIG_CPU_ARM926T=y
++CONFIG_CPU_32v5=y
++CONFIG_CPU_ABRT_EV5TJ=y
++CONFIG_CPU_PABRT_NOIFAR=y
++CONFIG_CPU_CACHE_VIVT=y
++CONFIG_CPU_COPY_V4WB=y
++CONFIG_CPU_TLB_V4WBI=y
++CONFIG_CPU_CP15=y
++CONFIG_CPU_CP15_MMU=y
++
++#
++# Processor Features
++#
++CONFIG_ARM_THUMB=y
++# CONFIG_CPU_ICACHE_DISABLE is not set
++# CONFIG_CPU_DCACHE_DISABLE is not set
++# CONFIG_CPU_DCACHE_WRITETHROUGH is not set
++# CONFIG_CPU_CACHE_ROUND_ROBIN is not set
++# CONFIG_OUTER_CACHE is not set
++
++#
++# Bus support
++#
++# CONFIG_PCI_SYSCALL is not set
++# CONFIG_ARCH_SUPPORTS_MSI is not set
++# CONFIG_PCCARD is not set
++
++#
++# Kernel Features
++#
++# CONFIG_TICK_ONESHOT is not set
++# CONFIG_PREEMPT is not set
++CONFIG_HZ=100
++CONFIG_AEABI=y
++CONFIG_OABI_COMPAT=y
++CONFIG_ARCH_FLATMEM_HAS_HOLES=y
++# CONFIG_ARCH_DISCONTIGMEM_ENABLE is not set
++CONFIG_SELECT_MEMORY_MODEL=y
++CONFIG_FLATMEM_MANUAL=y
++# CONFIG_DISCONTIGMEM_MANUAL is not set
++# CONFIG_SPARSEMEM_MANUAL is not set
++CONFIG_FLATMEM=y
++CONFIG_FLAT_NODE_MEM_MAP=y
++# CONFIG_SPARSEMEM_STATIC is not set
++# CONFIG_SPARSEMEM_VMEMMAP_ENABLE is not set
++CONFIG_PAGEFLAGS_EXTENDED=y
++CONFIG_SPLIT_PTLOCK_CPUS=4096
++# CONFIG_RESOURCES_64BIT is not set
++CONFIG_ZONE_DMA_FLAG=1
++CONFIG_BOUNCE=y
++CONFIG_VIRT_TO_BUS=y
++CONFIG_ALIGNMENT_TRAP=y
++
++#
++# Boot options
++#
++CONFIG_ZBOOT_ROM_TEXT=0x0
++CONFIG_ZBOOT_ROM_BSS=0x0
++CONFIG_CMDLINE=""
++# CONFIG_XIP_KERNEL is not set
++# CONFIG_KEXEC is not set
++
++#
++# Floating point emulation
++#
++
++#
++# At least one emulation must be selected
++#
++CONFIG_FPE_NWFPE=y
++# CONFIG_FPE_NWFPE_XP is not set
++# CONFIG_FPE_FASTFPE is not set
++# CONFIG_VFP is not set
++
++#
++# Userspace binary formats
++#
++CONFIG_BINFMT_ELF=y
++# CONFIG_BINFMT_AOUT is not set
++# CONFIG_BINFMT_MISC is not set
++
++#
++# Power management options
++#
++# CONFIG_PM is not set
++CONFIG_ARCH_SUSPEND_POSSIBLE=y
++CONFIG_NET=y
++
++#
++# Networking options
++#
++CONFIG_PACKET=y
++# CONFIG_PACKET_MMAP is not set
++CONFIG_UNIX=y
++CONFIG_XFRM=y
++CONFIG_XFRM_USER=y
++# CONFIG_XFRM_SUB_POLICY is not set
++# CONFIG_XFRM_MIGRATE is not set
++# CONFIG_XFRM_STATISTICS is not set
++CONFIG_NET_KEY=y
++# CONFIG_NET_KEY_MIGRATE is not set
++CONFIG_INET=y
++# CONFIG_IP_MULTICAST is not set
++CONFIG_IP_ADVANCED_ROUTER=y
++CONFIG_ASK_IP_FIB_HASH=y
++# CONFIG_IP_FIB_TRIE is not set
++CONFIG_IP_FIB_HASH=y
++# CONFIG_IP_MULTIPLE_TABLES is not set
++# CONFIG_IP_ROUTE_MULTIPATH is not set
++# CONFIG_IP_ROUTE_VERBOSE is not set
++CONFIG_IP_PNP=y
++CONFIG_IP_PNP_DHCP=y
++CONFIG_IP_PNP_BOOTP=y
++# CONFIG_IP_PNP_RARP is not set
++# CONFIG_NET_IPIP is not set
++# CONFIG_NET_IPGRE is not set
++# CONFIG_ARPD is not set
++# CONFIG_SYN_COOKIES is not set
++# CONFIG_INET_AH is not set
++# CONFIG_INET_ESP is not set
++# CONFIG_INET_IPCOMP is not set
++# CONFIG_INET_XFRM_TUNNEL is not set
++# CONFIG_INET_TUNNEL is not set
++# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
++# CONFIG_INET_XFRM_MODE_TUNNEL is not set
++# CONFIG_INET_XFRM_MODE_BEET is not set
++# CONFIG_INET_LRO is not set
++CONFIG_INET_DIAG=y
++CONFIG_INET_TCP_DIAG=y
++# CONFIG_TCP_CONG_ADVANCED is not set
++CONFIG_TCP_CONG_CUBIC=y
++CONFIG_DEFAULT_TCP_CONG="cubic"
++# CONFIG_TCP_MD5SIG is not set
++# CONFIG_IPV6 is not set
++# CONFIG_NETWORK_SECMARK is not set
++# CONFIG_NETFILTER is not set
++# CONFIG_IP_DCCP is not set
++# CONFIG_IP_SCTP is not set
++# CONFIG_TIPC is not set
++# CONFIG_ATM is not set
++# CONFIG_BRIDGE is not set
++# CONFIG_VLAN_8021Q is not set
++# CONFIG_DECNET is not set
++# CONFIG_LLC2 is not set
++# CONFIG_IPX is not set
++# CONFIG_ATALK is not set
++# CONFIG_X25 is not set
++# CONFIG_LAPB is not set
++# CONFIG_ECONET is not set
++# CONFIG_WAN_ROUTER is not set
++# CONFIG_NET_SCHED is not set
++
++#
++# Network testing
++#
++# CONFIG_NET_PKTGEN is not set
++# CONFIG_HAMRADIO is not set
++# CONFIG_CAN is not set
++# CONFIG_IRDA is not set
++# CONFIG_BT is not set
++# CONFIG_AF_RXRPC is not set
++
++#
++# Wireless
++#
++# CONFIG_CFG80211 is not set
++# CONFIG_WIRELESS_EXT is not set
++# CONFIG_MAC80211 is not set
++# CONFIG_IEEE80211 is not set
++# CONFIG_RFKILL is not set
++# CONFIG_NET_9P is not set
++
++#
++# Device Drivers
++#
++
++#
++# Generic Driver Options
++#
++CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
++CONFIG_STANDALONE=y
++CONFIG_PREVENT_FIRMWARE_BUILD=y
++# CONFIG_FW_LOADER is not set
++# CONFIG_DEBUG_DRIVER is not set
++# CONFIG_DEBUG_DEVRES is not set
++# CONFIG_SYS_HYPERVISOR is not set
++# CONFIG_CONNECTOR is not set
++CONFIG_MTD=y
++# CONFIG_MTD_DEBUG is not set
++CONFIG_MTD_CONCAT=y
++CONFIG_MTD_PARTITIONS=y
++# CONFIG_MTD_REDBOOT_PARTS is not set
++# CONFIG_MTD_CMDLINE_PARTS is not set
++# CONFIG_MTD_AFS_PARTS is not set
++# CONFIG_MTD_AR7_PARTS is not set
++
++#
++# User Modules And Translation Layers
++#
++CONFIG_MTD_CHAR=y
++CONFIG_MTD_BLKDEVS=y
++CONFIG_MTD_BLOCK=y
++# CONFIG_FTL is not set
++# CONFIG_NFTL is not set
++# CONFIG_INFTL is not set
++# CONFIG_RFD_FTL is not set
++# CONFIG_SSFDC is not set
++# CONFIG_MTD_OOPS is not set
++
++#
++# RAM/ROM/Flash chip drivers
++#
++CONFIG_MTD_CFI=y
++# CONFIG_MTD_JEDECPROBE is not set
++CONFIG_MTD_GEN_PROBE=y
++# CONFIG_MTD_CFI_ADV_OPTIONS is not set
++CONFIG_MTD_MAP_BANK_WIDTH_1=y
++CONFIG_MTD_MAP_BANK_WIDTH_2=y
++CONFIG_MTD_MAP_BANK_WIDTH_4=y
++# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
++# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
++# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
++CONFIG_MTD_CFI_I1=y
++CONFIG_MTD_CFI_I2=y
++# CONFIG_MTD_CFI_I4 is not set
++# CONFIG_MTD_CFI_I8 is not set
++# CONFIG_MTD_CFI_INTELEXT is not set
++CONFIG_MTD_CFI_AMDSTD=y
++# CONFIG_MTD_CFI_STAA is not set
++CONFIG_MTD_CFI_UTIL=y
++# CONFIG_MTD_RAM is not set
++# CONFIG_MTD_ROM is not set
++# CONFIG_MTD_ABSENT is not set
++
++#
++# Mapping drivers for chip access
++#
++# CONFIG_MTD_COMPLEX_MAPPINGS is not set
++# CONFIG_MTD_PHYSMAP is not set
++CONFIG_MTD_ARM_INTEGRATOR=y
++# CONFIG_MTD_PLATRAM is not set
++
++#
++# Self-contained MTD device drivers
++#
++# CONFIG_MTD_SLRAM is not set
++# CONFIG_MTD_PHRAM is not set
++# CONFIG_MTD_MTDRAM is not set
++# CONFIG_MTD_BLOCK2MTD is not set
++
++#
++# Disk-On-Chip Device Drivers
++#
++# CONFIG_MTD_DOC2000 is not set
++# CONFIG_MTD_DOC2001 is not set
++# CONFIG_MTD_DOC2001PLUS is not set
++# CONFIG_MTD_NAND is not set
++# CONFIG_MTD_ONENAND is not set
++
++#
++# UBI - Unsorted block images
++#
++# CONFIG_MTD_UBI is not set
++# CONFIG_PARPORT is not set
++CONFIG_BLK_DEV=y
++# CONFIG_BLK_DEV_COW_COMMON is not set
++# CONFIG_BLK_DEV_LOOP is not set
++# CONFIG_BLK_DEV_NBD is not set
++# CONFIG_BLK_DEV_UB is not set
++CONFIG_BLK_DEV_RAM=y
++CONFIG_BLK_DEV_RAM_COUNT=16
++CONFIG_BLK_DEV_RAM_SIZE=8192
++# CONFIG_BLK_DEV_XIP is not set
++# CONFIG_CDROM_PKTCDVD is not set
++# CONFIG_ATA_OVER_ETH is not set
++CONFIG_MISC_DEVICES=y
++# CONFIG_EEPROM_93CX6 is not set
++# CONFIG_ENCLOSURE_SERVICES is not set
++CONFIG_HAVE_IDE=y
++# CONFIG_IDE is not set
++
++#
++# SCSI device support
++#
++# CONFIG_RAID_ATTRS is not set
++CONFIG_SCSI=m
++CONFIG_SCSI_DMA=y
++# CONFIG_SCSI_TGT is not set
++# CONFIG_SCSI_NETLINK is not set
++CONFIG_SCSI_PROC_FS=y
++
++#
++# SCSI support type (disk, tape, CD-ROM)
++#
++CONFIG_BLK_DEV_SD=m
++# CONFIG_CHR_DEV_ST is not set
++# CONFIG_CHR_DEV_OSST is not set
++# CONFIG_BLK_DEV_SR is not set
++# CONFIG_CHR_DEV_SG is not set
++# CONFIG_CHR_DEV_SCH is not set
++
++#
++# Some SCSI devices (e.g. CD jukebox) support multiple LUNs
++#
++# CONFIG_SCSI_MULTI_LUN is not set
++# CONFIG_SCSI_CONSTANTS is not set
++# CONFIG_SCSI_LOGGING is not set
++# CONFIG_SCSI_SCAN_ASYNC is not set
++CONFIG_SCSI_WAIT_SCAN=m
++
++#
++# SCSI Transports
++#
++# CONFIG_SCSI_SPI_ATTRS is not set
++# CONFIG_SCSI_FC_ATTRS is not set
++# CONFIG_SCSI_ISCSI_ATTRS is not set
++# CONFIG_SCSI_SAS_LIBSAS is not set
++# CONFIG_SCSI_SRP_ATTRS is not set
++CONFIG_SCSI_LOWLEVEL=y
++# CONFIG_ISCSI_TCP is not set
++# CONFIG_SCSI_DEBUG is not set
++# CONFIG_SCSI_DH is not set
++# CONFIG_ATA is not set
++# CONFIG_MD is not set
++CONFIG_NETDEVICES=y
++# CONFIG_DUMMY is not set
++# CONFIG_BONDING is not set
++# CONFIG_MACVLAN is not set
++# CONFIG_EQUALIZER is not set
++# CONFIG_TUN is not set
++# CONFIG_VETH is not set
++# CONFIG_PHYLIB is not set
++CONFIG_NET_ETHERNET=y
++CONFIG_MII=y
++# CONFIG_AX88796 is not set
++# CONFIG_SMC91X is not set
++# CONFIG_DM9000 is not set
++CONFIG_SMC911X=y
++# CONFIG_IBM_NEW_EMAC_ZMII is not set
++# CONFIG_IBM_NEW_EMAC_RGMII is not set
++# CONFIG_IBM_NEW_EMAC_TAH is not set
++# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
++# CONFIG_B44 is not set
++# CONFIG_NETDEV_1000 is not set
++# CONFIG_NETDEV_10000 is not set
++
++#
++# Wireless LAN
++#
++# CONFIG_WLAN_PRE80211 is not set
++# CONFIG_WLAN_80211 is not set
++# CONFIG_IWLWIFI_LEDS is not set
++
++#
++# USB Network Adapters
++#
++# CONFIG_USB_CATC is not set
++# CONFIG_USB_KAWETH is not set
++# CONFIG_USB_PEGASUS is not set
++# CONFIG_USB_RTL8150 is not set
++# CONFIG_USB_USBNET is not set
++# CONFIG_WAN is not set
++# CONFIG_PPP is not set
++# CONFIG_SLIP is not set
++# CONFIG_NETCONSOLE is not set
++# CONFIG_NETPOLL is not set
++# CONFIG_NET_POLL_CONTROLLER is not set
++# CONFIG_ISDN is not set
++
++#
++# Input device support
++#
++CONFIG_INPUT=y
++# CONFIG_INPUT_FF_MEMLESS is not set
++# CONFIG_INPUT_POLLDEV is not set
++
++#
++# Userland interfaces
++#
++# CONFIG_INPUT_MOUSEDEV is not set
++# CONFIG_INPUT_JOYDEV is not set
++CONFIG_INPUT_EVDEV=m
++# CONFIG_INPUT_EVBUG is not set
++
++#
++# Input Device Drivers
++#
++CONFIG_INPUT_KEYBOARD=y
++# CONFIG_KEYBOARD_ATKBD is not set
++# CONFIG_KEYBOARD_SUNKBD is not set
++# CONFIG_KEYBOARD_LKKBD is not set
++# CONFIG_KEYBOARD_XTKBD is not set
++# CONFIG_KEYBOARD_NEWTON is not set
++# CONFIG_KEYBOARD_STOWAWAY is not set
++# CONFIG_KEYBOARD_GPIO is not set
++# CONFIG_INPUT_MOUSE is not set
++# CONFIG_INPUT_JOYSTICK is not set
++# CONFIG_INPUT_TABLET is not set
++# CONFIG_INPUT_TOUCHSCREEN is not set
++# CONFIG_INPUT_MISC is not set
++
++#
++# Hardware I/O ports
++#
++# CONFIG_SERIO is not set
++# CONFIG_GAMEPORT is not set
++
++#
++# Character devices
++#
++CONFIG_VT=y
++CONFIG_CONSOLE_TRANSLATIONS=y
++CONFIG_VT_CONSOLE=y
++CONFIG_HW_CONSOLE=y
++# CONFIG_VT_HW_CONSOLE_BINDING is not set
++CONFIG_DEVKMEM=y
++# CONFIG_SERIAL_NONSTANDARD is not set
++
++#
++# Serial drivers
++#
++CONFIG_SERIAL_8250=y
++CONFIG_SERIAL_8250_CONSOLE=y
++CONFIG_SERIAL_8250_NR_UARTS=2
++CONFIG_SERIAL_8250_RUNTIME_UARTS=2
++# CONFIG_SERIAL_8250_EXTENDED is not set
++
++#
++# Non-8250 serial port support
++#
++CONFIG_SERIAL_CORE=y
++CONFIG_SERIAL_CORE_CONSOLE=y
++CONFIG_UNIX98_PTYS=y
++# CONFIG_LEGACY_PTYS is not set
++# CONFIG_IPMI_HANDLER is not set
++# CONFIG_HW_RANDOM is not set
++# CONFIG_NVRAM is not set
++# CONFIG_R3964 is not set
++# CONFIG_RAW_DRIVER is not set
++# CONFIG_TCG_TPM is not set
++CONFIG_XXS_C_CAN=m
++CONFIG_CRYPTOEEPROM=m
++CONFIG_I2C=m
++CONFIG_I2C_BOARDINFO=y
++CONFIG_I2C_CHARDEV=m
++CONFIG_I2C_HELPER_AUTO=y
++
++#
++# I2C Hardware Bus support
++#
++
++#
++# I2C system bus drivers (mostly embedded / system-on-chip)
++#
++# CONFIG_I2C_GPIO is not set
++# CONFIG_I2C_OCORES is not set
++# CONFIG_I2C_SIMTEC is not set
++
++#
++# External I2C/SMBus adapter drivers
++#
++# CONFIG_I2C_PARPORT_LIGHT is not set
++# CONFIG_I2C_TAOS_EVM is not set
++# CONFIG_I2C_TINY_USB is not set
++
++#
++# Other I2C/SMBus bus drivers
++#
++# CONFIG_I2C_PCA_PLATFORM is not set
++# CONFIG_I2C_STUB is not set
++CONFIG_I2C_XXSVIDEO=m
++
++#
++# Miscellaneous I2C Chip support
++#
++# CONFIG_DS1682 is not set
++# CONFIG_AT24 is not set
++# CONFIG_SENSORS_EEPROM is not set
++# CONFIG_SENSORS_PCF8574 is not set
++# CONFIG_PCF8575 is not set
++# CONFIG_SENSORS_PCA9539 is not set
++# CONFIG_SENSORS_PCF8591 is not set
++# CONFIG_SENSORS_MAX6875 is not set
++# CONFIG_SENSORS_TSL2550 is not set
++# CONFIG_I2C_DEBUG_CORE is not set
++# CONFIG_I2C_DEBUG_ALGO is not set
++# CONFIG_I2C_DEBUG_BUS is not set
++# CONFIG_I2C_DEBUG_CHIP is not set
++# CONFIG_SPI is not set
++# CONFIG_W1 is not set
++# CONFIG_POWER_SUPPLY is not set
++# CONFIG_HWMON is not set
++# CONFIG_WATCHDOG is not set
++
++#
++# Sonics Silicon Backplane
++#
++CONFIG_SSB_POSSIBLE=y
++# CONFIG_SSB is not set
++
++#
++# Multifunction device drivers
++#
++# CONFIG_MFD_CORE is not set
++# CONFIG_MFD_SM501 is not set
++# CONFIG_HTC_PASIC3 is not set
++# CONFIG_MFD_TMIO is not set
++# CONFIG_MFD_T7L66XB is not set
++# CONFIG_MFD_TC6387XB is not set
++
++#
++# Multimedia devices
++#
++
++#
++# Multimedia core support
++#
++CONFIG_VIDEO_DEV=m
++CONFIG_VIDEO_V4L2_COMMON=m
++CONFIG_VIDEO_ALLOW_V4L1=y
++CONFIG_VIDEO_V4L1_COMPAT=y
++# CONFIG_DVB_CORE is not set
++CONFIG_VIDEO_MEDIA=m
++
++#
++# Multimedia drivers
++#
++# CONFIG_MEDIA_ATTACH is not set
++CONFIG_MEDIA_TUNER=m
++# CONFIG_MEDIA_TUNER_CUSTOMIZE is not set
++CONFIG_MEDIA_TUNER_SIMPLE=m
++CONFIG_MEDIA_TUNER_TDA8290=m
++CONFIG_MEDIA_TUNER_TDA9887=m
++CONFIG_MEDIA_TUNER_TEA5761=m
++CONFIG_MEDIA_TUNER_TEA5767=m
++CONFIG_MEDIA_TUNER_MT20XX=m
++CONFIG_MEDIA_TUNER_XC2028=m
++CONFIG_MEDIA_TUNER_XC5000=m
++CONFIG_VIDEO_V4L2=m
++CONFIG_VIDEO_V4L1=m
++CONFIG_VIDEO_CAPTURE_DRIVERS=y
++# CONFIG_VIDEO_ADV_DEBUG is not set
++# CONFIG_VIDEO_HELPER_CHIPS_AUTO is not set
++
++#
++# Encoders/decoders and other helper chips
++#
++
++#
++# Audio decoders
++#
++# CONFIG_VIDEO_TVAUDIO is not set
++# CONFIG_VIDEO_TDA7432 is not set
++# CONFIG_VIDEO_TDA9840 is not set
++# CONFIG_VIDEO_TDA9875 is not set
++# CONFIG_VIDEO_TEA6415C is not set
++# CONFIG_VIDEO_TEA6420 is not set
++# CONFIG_VIDEO_MSP3400 is not set
++# CONFIG_VIDEO_CS5345 is not set
++# CONFIG_VIDEO_CS53L32A is not set
++# CONFIG_VIDEO_M52790 is not set
++# CONFIG_VIDEO_TLV320AIC23B is not set
++# CONFIG_VIDEO_WM8775 is not set
++# CONFIG_VIDEO_WM8739 is not set
++# CONFIG_VIDEO_VP27SMPX is not set
++
++#
++# Video decoders
++#
++# CONFIG_VIDEO_BT819 is not set
++# CONFIG_VIDEO_BT856 is not set
++# CONFIG_VIDEO_BT866 is not set
++# CONFIG_VIDEO_KS0127 is not set
++# CONFIG_VIDEO_OV7670 is not set
++# CONFIG_VIDEO_TCM825X is not set
++# CONFIG_VIDEO_SAA7110 is not set
++# CONFIG_VIDEO_SAA7111 is not set
++# CONFIG_VIDEO_SAA7114 is not set
++CONFIG_VIDEO_SAA711X=m
++# CONFIG_VIDEO_SAA717X is not set
++# CONFIG_VIDEO_SAA7191 is not set
++# CONFIG_VIDEO_TVP5150 is not set
++# CONFIG_VIDEO_VPX3220 is not set
++
++#
++# Video and audio decoders
++#
++# CONFIG_VIDEO_CX25840 is not set
++
++#
++# MPEG video encoders
++#
++# CONFIG_VIDEO_CX2341X is not set
++
++#
++# Video encoders
++#
++# CONFIG_VIDEO_SAA7127 is not set
++# CONFIG_VIDEO_SAA7185 is not set
++# CONFIG_VIDEO_ADV7170 is not set
++# CONFIG_VIDEO_ADV7175 is not set
++
++#
++# Video improvement chips
++#
++# CONFIG_VIDEO_UPD64031A is not set
++# CONFIG_VIDEO_UPD64083 is not set
++# CONFIG_VIDEO_VIVI is not set
++# CONFIG_VIDEO_CPIA is not set
++# CONFIG_VIDEO_CPIA2 is not set
++# CONFIG_VIDEO_SAA5246A is not set
++# CONFIG_VIDEO_SAA5249 is not set
++# CONFIG_TUNER_3036 is not set
++# CONFIG_V4L_USB_DRIVERS is not set
++# CONFIG_SOC_CAMERA is not set
++# CONFIG_VIDEO_SH_MOBILE_CEU is not set
++# CONFIG_RADIO_ADAPTERS is not set
++# CONFIG_DAB is not set
++
++#
++# Graphics support
++#
++# CONFIG_VGASTATE is not set
++# CONFIG_VIDEO_OUTPUT_CONTROL is not set
++CONFIG_FB=y
++# CONFIG_FIRMWARE_EDID is not set
++# CONFIG_FB_DDC is not set
++CONFIG_FB_CFB_FILLRECT=y
++CONFIG_FB_CFB_COPYAREA=y
++CONFIG_FB_CFB_IMAGEBLIT=y
++# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
++# CONFIG_FB_SYS_FILLRECT is not set
++# CONFIG_FB_SYS_COPYAREA is not set
++# CONFIG_FB_SYS_IMAGEBLIT is not set
++# CONFIG_FB_FOREIGN_ENDIAN is not set
++# CONFIG_FB_SYS_FOPS is not set
++# CONFIG_FB_SVGALIB is not set
++# CONFIG_FB_MACMODES is not set
++# CONFIG_FB_BACKLIGHT is not set
++# CONFIG_FB_MODE_HELPERS is not set
++# CONFIG_FB_TILEBLITTING is not set
++
++#
++# Frame buffer hardware drivers
++#
++# CONFIG_FB_S1D13XXX is not set
++CONFIG_FB_XXSVIDEO=y
++# CONFIG_FB_XXSVIDEO_FB0_640_480 is not set
++# CONFIG_FB_XXSVIDEO_FB0_800_480 is not set
++CONFIG_FB_XXSVIDEO_FB0_800_600=y
++# CONFIG_FB_XXSVIDEO_FB0_1024_768 is not set
++# CONFIG_FB_XXSVIDEO_FB0_1280_1024 is not set
++# CONFIG_FB_VIRTUAL is not set
++# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
++
++#
++# Display device support
++#
++# CONFIG_DISPLAY_SUPPORT is not set
++
++#
++# Console display driver support
++#
++# CONFIG_VGA_CONSOLE is not set
++CONFIG_DUMMY_CONSOLE=y
++CONFIG_FRAMEBUFFER_CONSOLE=y
++# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
++# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
++CONFIG_FONTS=y
++# CONFIG_FONT_8x8 is not set
++CONFIG_FONT_8x16=y
++# CONFIG_FONT_6x11 is not set
++# CONFIG_FONT_7x14 is not set
++# CONFIG_FONT_PEARL_8x8 is not set
++# CONFIG_FONT_ACORN_8x8 is not set
++# CONFIG_FONT_MINI_4x6 is not set
++# CONFIG_FONT_SUN8x16 is not set
++# CONFIG_FONT_SUN12x22 is not set
++# CONFIG_FONT_10x18 is not set
++CONFIG_LOGO=y
++CONFIG_LOGO_LINUX_MONO=y
++CONFIG_LOGO_LINUX_VGA16=y
++CONFIG_LOGO_LINUX_CLUT224=y
++# CONFIG_SOUND is not set
++CONFIG_HID_SUPPORT=y
++CONFIG_HID=y
++CONFIG_HID_DEBUG=y
++# CONFIG_HIDRAW is not set
++
++#
++# USB Input Devices
++#
++CONFIG_USB_HID=y
++# CONFIG_USB_HIDINPUT_POWERBOOK is not set
++# CONFIG_HID_FF is not set
++# CONFIG_USB_HIDDEV is not set
++CONFIG_USB_SUPPORT=y
++CONFIG_USB_ARCH_HAS_HCD=y
++CONFIG_USB_ARCH_HAS_OHCI=y
++CONFIG_USB_ARCH_HAS_EHCI=y
++CONFIG_USB=y
++CONFIG_USB_DEBUG=y
++# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
++
++#
++# Miscellaneous USB options
++#
++CONFIG_USB_DEVICEFS=y
++# CONFIG_USB_DEVICE_CLASS is not set
++# CONFIG_USB_DYNAMIC_MINORS is not set
++# CONFIG_USB_OTG is not set
++# CONFIG_USB_OTG_WHITELIST is not set
++# CONFIG_USB_OTG_BLACKLIST_HUB is not set
++CONFIG_USB_MON=y
++
++#
++# USB Host Controller Drivers
++#
++# CONFIG_USB_C67X00_HCD is not set
++CONFIG_USB_EHCI_HCD=y
++# CONFIG_USB_EHCI_ROOT_HUB_TT is not set
++# CONFIG_USB_EHCI_TT_NEWSCHED is not set
++# CONFIG_USB_ISP116X_HCD is not set
++CONFIG_USB_OHCI_HCD=y
++# CONFIG_USB_OHCI_BIG_ENDIAN_DESC is not set
++# CONFIG_USB_OHCI_BIG_ENDIAN_MMIO is not set
++CONFIG_USB_OHCI_LITTLE_ENDIAN=y
++# CONFIG_USB_SL811_HCD is not set
++# CONFIG_USB_R8A66597_HCD is not set
++
++#
++# USB Device Class drivers
++#
++# CONFIG_USB_ACM is not set
++# CONFIG_USB_PRINTER is not set
++# CONFIG_USB_WDM is not set
++
++#
++# NOTE: USB_STORAGE enables SCSI, and 'SCSI disk support'
++#
++
++#
++# may also be needed; see USB_STORAGE Help for more information
++#
++CONFIG_USB_STORAGE=m
++# CONFIG_USB_STORAGE_DEBUG is not set
++# CONFIG_USB_STORAGE_DATAFAB is not set
++# CONFIG_USB_STORAGE_FREECOM is not set
++# CONFIG_USB_STORAGE_ISD200 is not set
++# CONFIG_USB_STORAGE_DPCM is not set
++# CONFIG_USB_STORAGE_USBAT is not set
++# CONFIG_USB_STORAGE_SDDR09 is not set
++# CONFIG_USB_STORAGE_SDDR55 is not set
++# CONFIG_USB_STORAGE_JUMPSHOT is not set
++# CONFIG_USB_STORAGE_ALAUDA is not set
++# CONFIG_USB_STORAGE_ONETOUCH is not set
++# CONFIG_USB_STORAGE_KARMA is not set
++# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
++# CONFIG_USB_LIBUSUAL is not set
++
++#
++# USB Imaging devices
++#
++# CONFIG_USB_MDC800 is not set
++# CONFIG_USB_MICROTEK is not set
++
++#
++# USB port drivers
++#
++CONFIG_USB_SERIAL=m
++# CONFIG_USB_EZUSB is not set
++CONFIG_USB_SERIAL_GENERIC=y
++# CONFIG_USB_SERIAL_AIRCABLE is not set
++# CONFIG_USB_SERIAL_ARK3116 is not set
++# CONFIG_USB_SERIAL_BELKIN is not set
++# CONFIG_USB_SERIAL_CH341 is not set
++# CONFIG_USB_SERIAL_WHITEHEAT is not set
++# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
++# CONFIG_USB_SERIAL_CP2101 is not set
++# CONFIG_USB_SERIAL_CYPRESS_M8 is not set
++# CONFIG_USB_SERIAL_EMPEG is not set
++# CONFIG_USB_SERIAL_FTDI_SIO is not set
++# CONFIG_USB_SERIAL_FUNSOFT is not set
++# CONFIG_USB_SERIAL_VISOR is not set
++# CONFIG_USB_SERIAL_IPAQ is not set
++# CONFIG_USB_SERIAL_IR is not set
++# CONFIG_USB_SERIAL_EDGEPORT is not set
++# CONFIG_USB_SERIAL_EDGEPORT_TI is not set
++# CONFIG_USB_SERIAL_GARMIN is not set
++# CONFIG_USB_SERIAL_IPW is not set
++# CONFIG_USB_SERIAL_IUU is not set
++# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
++# CONFIG_USB_SERIAL_KEYSPAN is not set
++# CONFIG_USB_SERIAL_KLSI is not set
++# CONFIG_USB_SERIAL_KOBIL_SCT is not set
++# CONFIG_USB_SERIAL_MCT_U232 is not set
++# CONFIG_USB_SERIAL_MOS7720 is not set
++# CONFIG_USB_SERIAL_MOS7840 is not set
++# CONFIG_USB_SERIAL_MOTOROLA is not set
++# CONFIG_USB_SERIAL_NAVMAN is not set
++CONFIG_USB_SERIAL_PL2303=m
++# CONFIG_USB_SERIAL_OTI6858 is not set
++# CONFIG_USB_SERIAL_SPCP8X5 is not set
++# CONFIG_USB_SERIAL_HP4X is not set
++# CONFIG_USB_SERIAL_SAFE is not set
++# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
++# CONFIG_USB_SERIAL_TI is not set
++# CONFIG_USB_SERIAL_CYBERJACK is not set
++# CONFIG_USB_SERIAL_XIRCOM is not set
++# CONFIG_USB_SERIAL_OPTION is not set
++# CONFIG_USB_SERIAL_OMNINET is not set
++# CONFIG_USB_SERIAL_DEBUG is not set
++
++#
++# USB Miscellaneous drivers
++#
++# CONFIG_USB_EMI62 is not set
++# CONFIG_USB_EMI26 is not set
++# CONFIG_USB_ADUTUX is not set
++# CONFIG_USB_RIO500 is not set
++# CONFIG_USB_LEGOTOWER is not set
++# CONFIG_USB_LCD is not set
++# CONFIG_USB_BERRY_CHARGE is not set
++# CONFIG_USB_LED is not set
++# CONFIG_USB_CYPRESS_CY7C63 is not set
++# CONFIG_USB_CYTHERM is not set
++# CONFIG_USB_PHIDGET is not set
++# CONFIG_USB_IDMOUSE is not set
++# CONFIG_USB_FTDI_ELAN is not set
++# CONFIG_USB_APPLEDISPLAY is not set
++# CONFIG_USB_SISUSBVGA is not set
++# CONFIG_USB_LD is not set
++# CONFIG_USB_TRANCEVIBRATOR is not set
++# CONFIG_USB_IOWARRIOR is not set
++# CONFIG_USB_TEST is not set
++# CONFIG_USB_ISIGHTFW is not set
++# CONFIG_USB_GADGET is not set
++# CONFIG_MMC is not set
++CONFIG_NEW_LEDS=y
++CONFIG_LEDS_CLASS=y
++
++#
++# LED drivers
++#
++# CONFIG_LEDS_PCA9532 is not set
++# CONFIG_LEDS_GPIO is not set
++# CONFIG_LEDS_PCA955X is not set
++CONFIG_LEDS_XXSVIDEO_TERMINAL=m
++
++#
++# LED Triggers
++#
++# CONFIG_LEDS_TRIGGERS is not set
++CONFIG_RTC_LIB=y
++CONFIG_RTC_CLASS=m
++
++#
++# RTC interfaces
++#
++CONFIG_RTC_INTF_SYSFS=y
++CONFIG_RTC_INTF_PROC=y
++CONFIG_RTC_INTF_DEV=y
++# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
++# CONFIG_RTC_DRV_TEST is not set
++
++#
++# I2C RTC drivers
++#
++# CONFIG_RTC_DRV_DS1307 is not set
++# CONFIG_RTC_DRV_DS1374 is not set
++# CONFIG_RTC_DRV_DS1672 is not set
++# CONFIG_RTC_DRV_MAX6900 is not set
++# CONFIG_RTC_DRV_RS5C372 is not set
++# CONFIG_RTC_DRV_ISL1208 is not set
++# CONFIG_RTC_DRV_X1205 is not set
++# CONFIG_RTC_DRV_PCF8563 is not set
++# CONFIG_RTC_DRV_PCF8583 is not set
++CONFIG_RTC_DRV_M41T80=m
++# CONFIG_RTC_DRV_M41T80_WDT is not set
++# CONFIG_RTC_DRV_S35390A is not set
++# CONFIG_RTC_DRV_FM3130 is not set
++
++#
++# SPI RTC drivers
++#
++
++#
++# Platform RTC drivers
++#
++# CONFIG_RTC_DRV_CMOS is not set
++# CONFIG_RTC_DRV_DS1511 is not set
++# CONFIG_RTC_DRV_DS1553 is not set
++# CONFIG_RTC_DRV_DS1742 is not set
++# CONFIG_RTC_DRV_STK17TA8 is not set
++# CONFIG_RTC_DRV_M48T86 is not set
++# CONFIG_RTC_DRV_M48T59 is not set
++# CONFIG_RTC_DRV_V3020 is not set
++
++#
++# on-CPU RTC drivers
++#
++# CONFIG_DMADEVICES is not set
++
++#
++# Voltage and Current regulators
++#
++# CONFIG_REGULATOR is not set
++# CONFIG_REGULATOR_FIXED_VOLTAGE is not set
++# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
++# CONFIG_REGULATOR_BQ24022 is not set
++# CONFIG_UIO is not set
++
++#
++# File systems
++#
++CONFIG_EXT2_FS=m
++# CONFIG_EXT2_FS_XATTR is not set
++# CONFIG_EXT2_FS_XIP is not set
++CONFIG_EXT3_FS=m
++CONFIG_EXT3_FS_XATTR=y
++# CONFIG_EXT3_FS_POSIX_ACL is not set
++# CONFIG_EXT3_FS_SECURITY is not set
++# CONFIG_EXT4DEV_FS is not set
++CONFIG_JBD=m
++CONFIG_FS_MBCACHE=m
++# CONFIG_REISERFS_FS is not set
++# CONFIG_JFS_FS is not set
++# CONFIG_FS_POSIX_ACL is not set
++# CONFIG_XFS_FS is not set
++# CONFIG_OCFS2_FS is not set
++CONFIG_DNOTIFY=y
++CONFIG_INOTIFY=y
++CONFIG_INOTIFY_USER=y
++# CONFIG_QUOTA is not set
++# CONFIG_AUTOFS_FS is not set
++# CONFIG_AUTOFS4_FS is not set
++# CONFIG_FUSE_FS is not set
++
++#
++# CD-ROM/DVD Filesystems
++#
++# CONFIG_ISO9660_FS is not set
++# CONFIG_UDF_FS is not set
++
++#
++# DOS/FAT/NT Filesystems
++#
++CONFIG_FAT_FS=m
++# CONFIG_MSDOS_FS is not set
++CONFIG_VFAT_FS=m
++CONFIG_FAT_DEFAULT_CODEPAGE=437
++CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
++CONFIG_NTFS_FS=m
++# CONFIG_NTFS_DEBUG is not set
++# CONFIG_NTFS_RW is not set
++
++#
++# Pseudo filesystems
++#
++CONFIG_PROC_FS=y
++CONFIG_PROC_SYSCTL=y
++CONFIG_SYSFS=y
++CONFIG_TMPFS=y
++# CONFIG_TMPFS_POSIX_ACL is not set
++# CONFIG_HUGETLB_PAGE is not set
++# CONFIG_CONFIGFS_FS is not set
++
++#
++# Miscellaneous filesystems
++#
++# CONFIG_ADFS_FS is not set
++# CONFIG_AFFS_FS is not set
++# CONFIG_HFS_FS is not set
++# CONFIG_HFSPLUS_FS is not set
++# CONFIG_BEFS_FS is not set
++# CONFIG_BFS_FS is not set
++# CONFIG_EFS_FS is not set
++CONFIG_JFFS2_FS=y
++CONFIG_JFFS2_FS_DEBUG=0
++# CONFIG_JFFS2_FS_WRITEBUFFER is not set
++# CONFIG_JFFS2_SUMMARY is not set
++# CONFIG_JFFS2_FS_XATTR is not set
++CONFIG_JFFS2_COMPRESSION_OPTIONS=y
++CONFIG_JFFS2_ZLIB=y
++# CONFIG_JFFS2_LZO is not set
++CONFIG_JFFS2_RTIME=y
++# CONFIG_JFFS2_RUBIN is not set
++# CONFIG_JFFS2_CMODE_NONE is not set
++CONFIG_JFFS2_CMODE_PRIORITY=y
++# CONFIG_JFFS2_CMODE_SIZE is not set
++# CONFIG_JFFS2_CMODE_FAVOURLZO is not set
++# CONFIG_CRAMFS is not set
++# CONFIG_VXFS_FS is not set
++# CONFIG_MINIX_FS is not set
++# CONFIG_OMFS_FS is not set
++# CONFIG_HPFS_FS is not set
++# CONFIG_QNX4FS_FS is not set
++# CONFIG_ROMFS_FS is not set
++# CONFIG_SYSV_FS is not set
++# CONFIG_UFS_FS is not set
++CONFIG_NETWORK_FILESYSTEMS=y
++CONFIG_NFS_FS=y
++CONFIG_NFS_V3=y
++# CONFIG_NFS_V3_ACL is not set
++# CONFIG_NFS_V4 is not set
++CONFIG_ROOT_NFS=y
++# CONFIG_NFSD is not set
++CONFIG_LOCKD=y
++CONFIG_LOCKD_V4=y
++CONFIG_NFS_COMMON=y
++CONFIG_SUNRPC=y
++# CONFIG_RPCSEC_GSS_KRB5 is not set
++# CONFIG_RPCSEC_GSS_SPKM3 is not set
++# CONFIG_SMB_FS is not set
++# CONFIG_CIFS is not set
++# CONFIG_NCP_FS is not set
++# CONFIG_CODA_FS is not set
++# CONFIG_AFS_FS is not set
++
++#
++# Partition Types
++#
++# CONFIG_PARTITION_ADVANCED is not set
++CONFIG_MSDOS_PARTITION=y
++CONFIG_NLS=y
++CONFIG_NLS_DEFAULT="iso8859-1"
++CONFIG_NLS_CODEPAGE_437=y
++# CONFIG_NLS_CODEPAGE_737 is not set
++# CONFIG_NLS_CODEPAGE_775 is not set
++CONFIG_NLS_CODEPAGE_850=y
++# CONFIG_NLS_CODEPAGE_852 is not set
++# CONFIG_NLS_CODEPAGE_855 is not set
++# CONFIG_NLS_CODEPAGE_857 is not set
++# CONFIG_NLS_CODEPAGE_860 is not set
++# CONFIG_NLS_CODEPAGE_861 is not set
++# CONFIG_NLS_CODEPAGE_862 is not set
++# CONFIG_NLS_CODEPAGE_863 is not set
++# CONFIG_NLS_CODEPAGE_864 is not set
++# CONFIG_NLS_CODEPAGE_865 is not set
++# CONFIG_NLS_CODEPAGE_866 is not set
++# CONFIG_NLS_CODEPAGE_869 is not set
++# CONFIG_NLS_CODEPAGE_936 is not set
++# CONFIG_NLS_CODEPAGE_950 is not set
++# CONFIG_NLS_CODEPAGE_932 is not set
++# CONFIG_NLS_CODEPAGE_949 is not set
++# CONFIG_NLS_CODEPAGE_874 is not set
++# CONFIG_NLS_ISO8859_8 is not set
++# CONFIG_NLS_CODEPAGE_1250 is not set
++# CONFIG_NLS_CODEPAGE_1251 is not set
++# CONFIG_NLS_ASCII is not set
++CONFIG_NLS_ISO8859_1=y
++# CONFIG_NLS_ISO8859_2 is not set
++# CONFIG_NLS_ISO8859_3 is not set
++# CONFIG_NLS_ISO8859_4 is not set
++# CONFIG_NLS_ISO8859_5 is not set
++# CONFIG_NLS_ISO8859_6 is not set
++# CONFIG_NLS_ISO8859_7 is not set
++# CONFIG_NLS_ISO8859_9 is not set
++# CONFIG_NLS_ISO8859_13 is not set
++# CONFIG_NLS_ISO8859_14 is not set
++# CONFIG_NLS_ISO8859_15 is not set
++# CONFIG_NLS_KOI8_R is not set
++# CONFIG_NLS_KOI8_U is not set
++# CONFIG_NLS_UTF8 is not set
++# CONFIG_DLM is not set
++
++#
++# Kernel hacking
++#
++# CONFIG_PRINTK_TIME is not set
++CONFIG_ENABLE_WARN_DEPRECATED=y
++CONFIG_ENABLE_MUST_CHECK=y
++CONFIG_FRAME_WARN=1024
++# CONFIG_MAGIC_SYSRQ is not set
++# CONFIG_UNUSED_SYMBOLS is not set
++# CONFIG_DEBUG_FS is not set
++# CONFIG_HEADERS_CHECK is not set
++CONFIG_DEBUG_KERNEL=y
++# CONFIG_DEBUG_SHIRQ is not set
++CONFIG_DETECT_SOFTLOCKUP=y
++# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
++CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=0
++CONFIG_SCHED_DEBUG=y
++# CONFIG_SCHEDSTATS is not set
++# CONFIG_TIMER_STATS is not set
++# CONFIG_DEBUG_OBJECTS is not set
++# CONFIG_DEBUG_SLAB is not set
++# CONFIG_DEBUG_RT_MUTEXES is not set
++# CONFIG_RT_MUTEX_TESTER is not set
++# CONFIG_DEBUG_SPINLOCK is not set
++# CONFIG_DEBUG_MUTEXES is not set
++# CONFIG_DEBUG_LOCK_ALLOC is not set
++# CONFIG_PROVE_LOCKING is not set
++# CONFIG_LOCK_STAT is not set
++# CONFIG_DEBUG_SPINLOCK_SLEEP is not set
++# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
++# CONFIG_DEBUG_KOBJECT is not set
++# CONFIG_DEBUG_BUGVERBOSE is not set
++# CONFIG_DEBUG_INFO is not set
++# CONFIG_DEBUG_VM is not set
++# CONFIG_DEBUG_WRITECOUNT is not set
++# CONFIG_DEBUG_MEMORY_INIT is not set
++# CONFIG_DEBUG_LIST is not set
++# CONFIG_DEBUG_SG is not set
++CONFIG_FRAME_POINTER=y
++# CONFIG_BOOT_PRINTK_DELAY is not set
++# CONFIG_RCU_TORTURE_TEST is not set
++# CONFIG_BACKTRACE_SELF_TEST is not set
++# CONFIG_FAULT_INJECTION is not set
++# CONFIG_LATENCYTOP is not set
++# CONFIG_SYSCTL_SYSCALL_CHECK is not set
++CONFIG_HAVE_FTRACE=y
++CONFIG_HAVE_DYNAMIC_FTRACE=y
++# CONFIG_FTRACE is not set
++# CONFIG_SCHED_TRACER is not set
++# CONFIG_CONTEXT_SWITCH_TRACER is not set
++# CONFIG_SAMPLES is not set
++CONFIG_HAVE_ARCH_KGDB=y
++# CONFIG_KGDB is not set
++CONFIG_DEBUG_USER=y
++# CONFIG_DEBUG_ERRORS is not set
++# CONFIG_DEBUG_STACK_USAGE is not set
++CONFIG_DEBUG_LL=y
++# CONFIG_DEBUG_ICEDCC is not set
++
++#
++# Security options
++#
++# CONFIG_KEYS is not set
++# CONFIG_SECURITY is not set
++# CONFIG_SECURITY_FILE_CAPABILITIES is not set
++CONFIG_CRYPTO=y
++
++#
++# Crypto core or helper
++#
++# CONFIG_CRYPTO_MANAGER is not set
++# CONFIG_CRYPTO_GF128MUL is not set
++# CONFIG_CRYPTO_NULL is not set
++# CONFIG_CRYPTO_CRYPTD is not set
++# CONFIG_CRYPTO_AUTHENC is not set
++# CONFIG_CRYPTO_TEST is not set
++
++#
++# Authenticated Encryption with Associated Data
++#
++# CONFIG_CRYPTO_CCM is not set
++# CONFIG_CRYPTO_GCM is not set
++# CONFIG_CRYPTO_SEQIV is not set
++
++#
++# Block modes
++#
++# CONFIG_CRYPTO_CBC is not set
++# CONFIG_CRYPTO_CTR is not set
++# CONFIG_CRYPTO_CTS is not set
++# CONFIG_CRYPTO_ECB is not set
++# CONFIG_CRYPTO_LRW is not set
++# CONFIG_CRYPTO_PCBC is not set
++# CONFIG_CRYPTO_XTS is not set
++
++#
++# Hash modes
++#
++# CONFIG_CRYPTO_HMAC is not set
++# CONFIG_CRYPTO_XCBC is not set
++
++#
++# Digest
++#
++# CONFIG_CRYPTO_CRC32C is not set
++# CONFIG_CRYPTO_MD4 is not set
++# CONFIG_CRYPTO_MD5 is not set
++# CONFIG_CRYPTO_MICHAEL_MIC is not set
++# CONFIG_CRYPTO_RMD128 is not set
++# CONFIG_CRYPTO_RMD160 is not set
++# CONFIG_CRYPTO_RMD256 is not set
++# CONFIG_CRYPTO_RMD320 is not set
++# CONFIG_CRYPTO_SHA1 is not set
++# CONFIG_CRYPTO_SHA256 is not set
++# CONFIG_CRYPTO_SHA512 is not set
++# CONFIG_CRYPTO_TGR192 is not set
++# CONFIG_CRYPTO_WP512 is not set
++
++#
++# Ciphers
++#
++# CONFIG_CRYPTO_AES is not set
++# CONFIG_CRYPTO_ANUBIS is not set
++# CONFIG_CRYPTO_ARC4 is not set
++# CONFIG_CRYPTO_BLOWFISH is not set
++# CONFIG_CRYPTO_CAMELLIA is not set
++# CONFIG_CRYPTO_CAST5 is not set
++# CONFIG_CRYPTO_CAST6 is not set
++# CONFIG_CRYPTO_DES is not set
++# CONFIG_CRYPTO_FCRYPT is not set
++# CONFIG_CRYPTO_KHAZAD is not set
++# CONFIG_CRYPTO_SALSA20 is not set
++# CONFIG_CRYPTO_SEED is not set
++# CONFIG_CRYPTO_SERPENT is not set
++# CONFIG_CRYPTO_TEA is not set
++# CONFIG_CRYPTO_TWOFISH is not set
++
++#
++# Compression
++#
++# CONFIG_CRYPTO_DEFLATE is not set
++# CONFIG_CRYPTO_LZO is not set
++CONFIG_CRYPTO_HW=y
++
++#
++# Library routines
++#
++CONFIG_BITREVERSE=y
++# CONFIG_GENERIC_FIND_FIRST_BIT is not set
++# CONFIG_GENERIC_FIND_NEXT_BIT is not set
++# CONFIG_CRC_CCITT is not set
++# CONFIG_CRC16 is not set
++# CONFIG_CRC_T10DIF is not set
++# CONFIG_CRC_ITU_T is not set
++CONFIG_CRC32=y
++# CONFIG_CRC7 is not set
++# CONFIG_LIBCRC32C is not set
++CONFIG_ZLIB_INFLATE=y
++CONFIG_ZLIB_DEFLATE=y
++CONFIG_PLIST=y
++CONFIG_HAS_IOMEM=y
++CONFIG_HAS_IOPORT=y
++CONFIG_HAS_DMA=y
+--- linux-2.6.27.21/arch/arm/configs/xxsvideo_jadeevalkit_defconfig	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/configs/xxsvideo_jadeevalkit_defconfig	2009-11-27 10:04:28.000000000 +0000
+@@ -0,0 +1,1468 @@
++#
++# Automatically generated make config: don't edit
++# Linux kernel version: 2.6.27.21
++# Thu Nov 26 18:02:36 2009
++#
++CONFIG_ARM=y
++CONFIG_SYS_SUPPORTS_APM_EMULATION=y
++CONFIG_GENERIC_GPIO=y
++# CONFIG_GENERIC_TIME is not set
++# CONFIG_GENERIC_CLOCKEVENTS is not set
++CONFIG_MMU=y
++# CONFIG_NO_IOPORT is not set
++CONFIG_GENERIC_HARDIRQS=y
++CONFIG_STACKTRACE_SUPPORT=y
++CONFIG_HAVE_LATENCYTOP_SUPPORT=y
++CONFIG_LOCKDEP_SUPPORT=y
++CONFIG_TRACE_IRQFLAGS_SUPPORT=y
++CONFIG_HARDIRQS_SW_RESEND=y
++CONFIG_GENERIC_IRQ_PROBE=y
++CONFIG_RWSEM_GENERIC_SPINLOCK=y
++# CONFIG_ARCH_HAS_ILOG2_U32 is not set
++# CONFIG_ARCH_HAS_ILOG2_U64 is not set
++CONFIG_GENERIC_HWEIGHT=y
++CONFIG_GENERIC_CALIBRATE_DELAY=y
++CONFIG_ARCH_SUPPORTS_AOUT=y
++CONFIG_ZONE_DMA=y
++CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=y
++CONFIG_VECTORS_BASE=0xffff0000
++CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
++
++#
++# General setup
++#
++CONFIG_EXPERIMENTAL=y
++CONFIG_BROKEN_ON_SMP=y
++CONFIG_INIT_ENV_ARG_LIMIT=32
++CONFIG_LOCALVERSION=""
++# CONFIG_LOCALVERSION_AUTO is not set
++CONFIG_SWAP=y
++CONFIG_SYSVIPC=y
++CONFIG_SYSVIPC_SYSCTL=y
++CONFIG_POSIX_MQUEUE=y
++CONFIG_BSD_PROCESS_ACCT=y
++# CONFIG_BSD_PROCESS_ACCT_V3 is not set
++# CONFIG_TASKSTATS is not set
++# CONFIG_AUDIT is not set
++CONFIG_IKCONFIG=y
++CONFIG_IKCONFIG_PROC=y
++CONFIG_LOG_BUF_SHIFT=14
++# CONFIG_CGROUPS is not set
++# CONFIG_GROUP_SCHED is not set
++CONFIG_SYSFS_DEPRECATED=y
++CONFIG_SYSFS_DEPRECATED_V2=y
++# CONFIG_RELAY is not set
++# CONFIG_NAMESPACES is not set
++# CONFIG_BLK_DEV_INITRD is not set
++# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
++CONFIG_SYSCTL=y
++CONFIG_EMBEDDED=y
++CONFIG_UID16=y
++CONFIG_SYSCTL_SYSCALL=y
++CONFIG_KALLSYMS=y
++# CONFIG_KALLSYMS_ALL is not set
++# CONFIG_KALLSYMS_EXTRA_PASS is not set
++CONFIG_HOTPLUG=y
++CONFIG_PRINTK=y
++CONFIG_BUG=y
++CONFIG_ELF_CORE=y
++CONFIG_COMPAT_BRK=y
++CONFIG_BASE_FULL=y
++CONFIG_FUTEX=y
++CONFIG_ANON_INODES=y
++CONFIG_EPOLL=y
++CONFIG_SIGNALFD=y
++CONFIG_TIMERFD=y
++CONFIG_EVENTFD=y
++CONFIG_SHMEM=y
++CONFIG_VM_EVENT_COUNTERS=y
++CONFIG_SLAB=y
++# CONFIG_SLUB is not set
++# CONFIG_SLOB is not set
++# CONFIG_PROFILING is not set
++# CONFIG_MARKERS is not set
++CONFIG_HAVE_OPROFILE=y
++# CONFIG_KPROBES is not set
++# CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is not set
++# CONFIG_HAVE_IOREMAP_PROT is not set
++CONFIG_HAVE_KPROBES=y
++CONFIG_HAVE_KRETPROBES=y
++# CONFIG_HAVE_ARCH_TRACEHOOK is not set
++# CONFIG_HAVE_DMA_ATTRS is not set
++# CONFIG_USE_GENERIC_SMP_HELPERS is not set
++# CONFIG_HAVE_CLK is not set
++CONFIG_PROC_PAGE_MONITOR=y
++CONFIG_HAVE_GENERIC_DMA_COHERENT=y
++CONFIG_SLABINFO=y
++CONFIG_RT_MUTEXES=y
++# CONFIG_TINY_SHMEM is not set
++CONFIG_BASE_SMALL=0
++CONFIG_MODULES=y
++# CONFIG_MODULE_FORCE_LOAD is not set
++CONFIG_MODULE_UNLOAD=y
++# CONFIG_MODULE_FORCE_UNLOAD is not set
++# CONFIG_MODVERSIONS is not set
++# CONFIG_MODULE_SRCVERSION_ALL is not set
++CONFIG_KMOD=y
++CONFIG_BLOCK=y
++# CONFIG_LBD is not set
++# CONFIG_BLK_DEV_IO_TRACE is not set
++# CONFIG_LSF is not set
++# CONFIG_BLK_DEV_BSG is not set
++# CONFIG_BLK_DEV_INTEGRITY is not set
++
++#
++# IO Schedulers
++#
++CONFIG_IOSCHED_NOOP=y
++CONFIG_IOSCHED_AS=y
++# CONFIG_IOSCHED_DEADLINE is not set
++# CONFIG_IOSCHED_CFQ is not set
++CONFIG_DEFAULT_AS=y
++# CONFIG_DEFAULT_DEADLINE is not set
++# CONFIG_DEFAULT_CFQ is not set
++# CONFIG_DEFAULT_NOOP is not set
++CONFIG_DEFAULT_IOSCHED="anticipatory"
++CONFIG_CLASSIC_RCU=y
++
++#
++# System Type
++#
++# CONFIG_ARCH_AAEC2000 is not set
++# CONFIG_ARCH_INTEGRATOR is not set
++# CONFIG_ARCH_REALVIEW is not set
++# CONFIG_ARCH_VERSATILE is not set
++# CONFIG_ARCH_AT91 is not set
++# CONFIG_ARCH_CLPS7500 is not set
++# CONFIG_ARCH_CLPS711X is not set
++# CONFIG_ARCH_EBSA110 is not set
++# CONFIG_ARCH_EP93XX is not set
++# CONFIG_ARCH_FOOTBRIDGE is not set
++CONFIG_ARCH_JADE=y
++# CONFIG_ARCH_NETX is not set
++# CONFIG_ARCH_H720X is not set
++# CONFIG_ARCH_IMX is not set
++# CONFIG_ARCH_IOP13XX is not set
++# CONFIG_ARCH_IOP32X is not set
++# CONFIG_ARCH_IOP33X is not set
++# CONFIG_ARCH_IXP23XX is not set
++# CONFIG_ARCH_IXP2000 is not set
++# CONFIG_ARCH_IXP4XX is not set
++# CONFIG_ARCH_L7200 is not set
++# CONFIG_ARCH_KIRKWOOD is not set
++# CONFIG_ARCH_KS8695 is not set
++# CONFIG_ARCH_NS9XXX is not set
++# CONFIG_ARCH_LOKI is not set
++# CONFIG_ARCH_MV78XX0 is not set
++# CONFIG_ARCH_MXC is not set
++# CONFIG_ARCH_ORION5X is not set
++# CONFIG_ARCH_PNX4008 is not set
++# CONFIG_ARCH_PXA is not set
++# CONFIG_ARCH_RPC is not set
++# CONFIG_ARCH_SA1100 is not set
++# CONFIG_ARCH_S3C2410 is not set
++# CONFIG_ARCH_SHARK is not set
++# CONFIG_ARCH_LH7A40X is not set
++# CONFIG_ARCH_DAVINCI is not set
++# CONFIG_ARCH_OMAP is not set
++# CONFIG_ARCH_MSM7X00A is not set
++
++#
++# Boot options
++#
++
++#
++# Power management
++#
++
++#
++# Fujitsu Jade Options
++#
++CONFIG_ARCH_JADE_MB86R01=y
++# CONFIG_ARCH_JADE_MB86R02 is not set
++CONFIG_JADE_PACLK_FREQ=38812500
++CONFIG_MACH_XXSVIDEO=y
++# CONFIG_MACH_XXSVIDEOD is not set
++# CONFIG_MACH_XXSVIDEO_TERMINAL is not set
++CONFIG_MACH_XXSVIDEO_EVALKIT=y
++# CONFIG_MACH_XXSVIDEOD_EVALKIT is not set
++# CONFIG_MACH_XXSVIDEO_CAN_GROUP2 is not set
++CONFIG_MACH_XXSVIDEO_EVALKIT_VIDEOIN=y
++CONFIG_XXSVIDEO_IOEXPANDER=m
++CONFIG_XXSVIDEO_KEYS=m
++CONFIG_XXSVIDEO_SII164=m
++
++#
++# Processor Type
++#
++CONFIG_CPU_32=y
++CONFIG_CPU_ARM926T=y
++CONFIG_CPU_32v5=y
++CONFIG_CPU_ABRT_EV5TJ=y
++CONFIG_CPU_PABRT_NOIFAR=y
++CONFIG_CPU_CACHE_VIVT=y
++CONFIG_CPU_COPY_V4WB=y
++CONFIG_CPU_TLB_V4WBI=y
++CONFIG_CPU_CP15=y
++CONFIG_CPU_CP15_MMU=y
++
++#
++# Processor Features
++#
++CONFIG_ARM_THUMB=y
++# CONFIG_CPU_ICACHE_DISABLE is not set
++# CONFIG_CPU_DCACHE_DISABLE is not set
++# CONFIG_CPU_DCACHE_WRITETHROUGH is not set
++# CONFIG_CPU_CACHE_ROUND_ROBIN is not set
++# CONFIG_OUTER_CACHE is not set
++
++#
++# Bus support
++#
++# CONFIG_PCI_SYSCALL is not set
++# CONFIG_ARCH_SUPPORTS_MSI is not set
++# CONFIG_PCCARD is not set
++
++#
++# Kernel Features
++#
++# CONFIG_TICK_ONESHOT is not set
++# CONFIG_PREEMPT is not set
++CONFIG_HZ=100
++CONFIG_AEABI=y
++CONFIG_OABI_COMPAT=y
++CONFIG_ARCH_FLATMEM_HAS_HOLES=y
++# CONFIG_ARCH_DISCONTIGMEM_ENABLE is not set
++CONFIG_SELECT_MEMORY_MODEL=y
++CONFIG_FLATMEM_MANUAL=y
++# CONFIG_DISCONTIGMEM_MANUAL is not set
++# CONFIG_SPARSEMEM_MANUAL is not set
++CONFIG_FLATMEM=y
++CONFIG_FLAT_NODE_MEM_MAP=y
++# CONFIG_SPARSEMEM_STATIC is not set
++# CONFIG_SPARSEMEM_VMEMMAP_ENABLE is not set
++CONFIG_PAGEFLAGS_EXTENDED=y
++CONFIG_SPLIT_PTLOCK_CPUS=4096
++# CONFIG_RESOURCES_64BIT is not set
++CONFIG_ZONE_DMA_FLAG=1
++CONFIG_BOUNCE=y
++CONFIG_VIRT_TO_BUS=y
++CONFIG_ALIGNMENT_TRAP=y
++
++#
++# Boot options
++#
++CONFIG_ZBOOT_ROM_TEXT=0x0
++CONFIG_ZBOOT_ROM_BSS=0x0
++CONFIG_CMDLINE=""
++# CONFIG_XIP_KERNEL is not set
++# CONFIG_KEXEC is not set
++
++#
++# Floating point emulation
++#
++
++#
++# At least one emulation must be selected
++#
++CONFIG_FPE_NWFPE=y
++# CONFIG_FPE_NWFPE_XP is not set
++# CONFIG_FPE_FASTFPE is not set
++# CONFIG_VFP is not set
++
++#
++# Userspace binary formats
++#
++CONFIG_BINFMT_ELF=y
++# CONFIG_BINFMT_AOUT is not set
++# CONFIG_BINFMT_MISC is not set
++
++#
++# Power management options
++#
++# CONFIG_PM is not set
++CONFIG_ARCH_SUSPEND_POSSIBLE=y
++CONFIG_NET=y
++
++#
++# Networking options
++#
++CONFIG_PACKET=y
++# CONFIG_PACKET_MMAP is not set
++CONFIG_UNIX=y
++CONFIG_XFRM=y
++CONFIG_XFRM_USER=y
++# CONFIG_XFRM_SUB_POLICY is not set
++# CONFIG_XFRM_MIGRATE is not set
++# CONFIG_XFRM_STATISTICS is not set
++CONFIG_NET_KEY=y
++# CONFIG_NET_KEY_MIGRATE is not set
++CONFIG_INET=y
++# CONFIG_IP_MULTICAST is not set
++CONFIG_IP_ADVANCED_ROUTER=y
++CONFIG_ASK_IP_FIB_HASH=y
++# CONFIG_IP_FIB_TRIE is not set
++CONFIG_IP_FIB_HASH=y
++# CONFIG_IP_MULTIPLE_TABLES is not set
++# CONFIG_IP_ROUTE_MULTIPATH is not set
++# CONFIG_IP_ROUTE_VERBOSE is not set
++CONFIG_IP_PNP=y
++CONFIG_IP_PNP_DHCP=y
++CONFIG_IP_PNP_BOOTP=y
++# CONFIG_IP_PNP_RARP is not set
++# CONFIG_NET_IPIP is not set
++# CONFIG_NET_IPGRE is not set
++# CONFIG_ARPD is not set
++# CONFIG_SYN_COOKIES is not set
++# CONFIG_INET_AH is not set
++# CONFIG_INET_ESP is not set
++# CONFIG_INET_IPCOMP is not set
++# CONFIG_INET_XFRM_TUNNEL is not set
++# CONFIG_INET_TUNNEL is not set
++# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
++# CONFIG_INET_XFRM_MODE_TUNNEL is not set
++# CONFIG_INET_XFRM_MODE_BEET is not set
++# CONFIG_INET_LRO is not set
++CONFIG_INET_DIAG=y
++CONFIG_INET_TCP_DIAG=y
++# CONFIG_TCP_CONG_ADVANCED is not set
++CONFIG_TCP_CONG_CUBIC=y
++CONFIG_DEFAULT_TCP_CONG="cubic"
++# CONFIG_TCP_MD5SIG is not set
++# CONFIG_IPV6 is not set
++# CONFIG_NETWORK_SECMARK is not set
++# CONFIG_NETFILTER is not set
++# CONFIG_IP_DCCP is not set
++# CONFIG_IP_SCTP is not set
++# CONFIG_TIPC is not set
++# CONFIG_ATM is not set
++# CONFIG_BRIDGE is not set
++# CONFIG_VLAN_8021Q is not set
++# CONFIG_DECNET is not set
++# CONFIG_LLC2 is not set
++# CONFIG_IPX is not set
++# CONFIG_ATALK is not set
++# CONFIG_X25 is not set
++# CONFIG_LAPB is not set
++# CONFIG_ECONET is not set
++# CONFIG_WAN_ROUTER is not set
++# CONFIG_NET_SCHED is not set
++
++#
++# Network testing
++#
++# CONFIG_NET_PKTGEN is not set
++# CONFIG_HAMRADIO is not set
++# CONFIG_CAN is not set
++# CONFIG_IRDA is not set
++# CONFIG_BT is not set
++# CONFIG_AF_RXRPC is not set
++
++#
++# Wireless
++#
++# CONFIG_CFG80211 is not set
++# CONFIG_WIRELESS_EXT is not set
++# CONFIG_MAC80211 is not set
++# CONFIG_IEEE80211 is not set
++# CONFIG_RFKILL is not set
++# CONFIG_NET_9P is not set
++
++#
++# Device Drivers
++#
++
++#
++# Generic Driver Options
++#
++CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
++CONFIG_STANDALONE=y
++CONFIG_PREVENT_FIRMWARE_BUILD=y
++# CONFIG_FW_LOADER is not set
++# CONFIG_DEBUG_DRIVER is not set
++# CONFIG_DEBUG_DEVRES is not set
++# CONFIG_SYS_HYPERVISOR is not set
++# CONFIG_CONNECTOR is not set
++CONFIG_MTD=y
++# CONFIG_MTD_DEBUG is not set
++CONFIG_MTD_CONCAT=y
++CONFIG_MTD_PARTITIONS=y
++# CONFIG_MTD_REDBOOT_PARTS is not set
++# CONFIG_MTD_CMDLINE_PARTS is not set
++# CONFIG_MTD_AFS_PARTS is not set
++# CONFIG_MTD_AR7_PARTS is not set
++
++#
++# User Modules And Translation Layers
++#
++CONFIG_MTD_CHAR=y
++CONFIG_MTD_BLKDEVS=y
++CONFIG_MTD_BLOCK=y
++# CONFIG_FTL is not set
++# CONFIG_NFTL is not set
++# CONFIG_INFTL is not set
++# CONFIG_RFD_FTL is not set
++# CONFIG_SSFDC is not set
++# CONFIG_MTD_OOPS is not set
++
++#
++# RAM/ROM/Flash chip drivers
++#
++CONFIG_MTD_CFI=y
++# CONFIG_MTD_JEDECPROBE is not set
++CONFIG_MTD_GEN_PROBE=y
++# CONFIG_MTD_CFI_ADV_OPTIONS is not set
++CONFIG_MTD_MAP_BANK_WIDTH_1=y
++CONFIG_MTD_MAP_BANK_WIDTH_2=y
++CONFIG_MTD_MAP_BANK_WIDTH_4=y
++# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
++# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
++# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
++CONFIG_MTD_CFI_I1=y
++CONFIG_MTD_CFI_I2=y
++# CONFIG_MTD_CFI_I4 is not set
++# CONFIG_MTD_CFI_I8 is not set
++# CONFIG_MTD_CFI_INTELEXT is not set
++CONFIG_MTD_CFI_AMDSTD=y
++# CONFIG_MTD_CFI_STAA is not set
++CONFIG_MTD_CFI_UTIL=y
++# CONFIG_MTD_RAM is not set
++# CONFIG_MTD_ROM is not set
++# CONFIG_MTD_ABSENT is not set
++
++#
++# Mapping drivers for chip access
++#
++# CONFIG_MTD_COMPLEX_MAPPINGS is not set
++# CONFIG_MTD_PHYSMAP is not set
++CONFIG_MTD_ARM_INTEGRATOR=y
++# CONFIG_MTD_PLATRAM is not set
++
++#
++# Self-contained MTD device drivers
++#
++# CONFIG_MTD_SLRAM is not set
++# CONFIG_MTD_PHRAM is not set
++# CONFIG_MTD_MTDRAM is not set
++# CONFIG_MTD_BLOCK2MTD is not set
++
++#
++# Disk-On-Chip Device Drivers
++#
++# CONFIG_MTD_DOC2000 is not set
++# CONFIG_MTD_DOC2001 is not set
++# CONFIG_MTD_DOC2001PLUS is not set
++# CONFIG_MTD_NAND is not set
++# CONFIG_MTD_ONENAND is not set
++
++#
++# UBI - Unsorted block images
++#
++# CONFIG_MTD_UBI is not set
++# CONFIG_PARPORT is not set
++CONFIG_BLK_DEV=y
++# CONFIG_BLK_DEV_COW_COMMON is not set
++# CONFIG_BLK_DEV_LOOP is not set
++# CONFIG_BLK_DEV_NBD is not set
++# CONFIG_BLK_DEV_UB is not set
++CONFIG_BLK_DEV_RAM=y
++CONFIG_BLK_DEV_RAM_COUNT=16
++CONFIG_BLK_DEV_RAM_SIZE=8192
++# CONFIG_BLK_DEV_XIP is not set
++# CONFIG_CDROM_PKTCDVD is not set
++# CONFIG_ATA_OVER_ETH is not set
++CONFIG_MISC_DEVICES=y
++# CONFIG_EEPROM_93CX6 is not set
++# CONFIG_ENCLOSURE_SERVICES is not set
++CONFIG_HAVE_IDE=y
++# CONFIG_IDE is not set
++
++#
++# SCSI device support
++#
++# CONFIG_RAID_ATTRS is not set
++CONFIG_SCSI=m
++CONFIG_SCSI_DMA=y
++# CONFIG_SCSI_TGT is not set
++# CONFIG_SCSI_NETLINK is not set
++CONFIG_SCSI_PROC_FS=y
++
++#
++# SCSI support type (disk, tape, CD-ROM)
++#
++CONFIG_BLK_DEV_SD=m
++# CONFIG_CHR_DEV_ST is not set
++# CONFIG_CHR_DEV_OSST is not set
++# CONFIG_BLK_DEV_SR is not set
++# CONFIG_CHR_DEV_SG is not set
++# CONFIG_CHR_DEV_SCH is not set
++
++#
++# Some SCSI devices (e.g. CD jukebox) support multiple LUNs
++#
++# CONFIG_SCSI_MULTI_LUN is not set
++# CONFIG_SCSI_CONSTANTS is not set
++# CONFIG_SCSI_LOGGING is not set
++# CONFIG_SCSI_SCAN_ASYNC is not set
++CONFIG_SCSI_WAIT_SCAN=m
++
++#
++# SCSI Transports
++#
++# CONFIG_SCSI_SPI_ATTRS is not set
++# CONFIG_SCSI_FC_ATTRS is not set
++# CONFIG_SCSI_ISCSI_ATTRS is not set
++# CONFIG_SCSI_SAS_LIBSAS is not set
++# CONFIG_SCSI_SRP_ATTRS is not set
++CONFIG_SCSI_LOWLEVEL=y
++# CONFIG_ISCSI_TCP is not set
++# CONFIG_SCSI_DEBUG is not set
++# CONFIG_SCSI_DH is not set
++# CONFIG_ATA is not set
++# CONFIG_MD is not set
++CONFIG_NETDEVICES=y
++# CONFIG_DUMMY is not set
++# CONFIG_BONDING is not set
++# CONFIG_MACVLAN is not set
++# CONFIG_EQUALIZER is not set
++# CONFIG_TUN is not set
++# CONFIG_VETH is not set
++# CONFIG_PHYLIB is not set
++CONFIG_NET_ETHERNET=y
++CONFIG_MII=y
++# CONFIG_AX88796 is not set
++# CONFIG_SMC91X is not set
++# CONFIG_DM9000 is not set
++CONFIG_SMC911X=y
++# CONFIG_IBM_NEW_EMAC_ZMII is not set
++# CONFIG_IBM_NEW_EMAC_RGMII is not set
++# CONFIG_IBM_NEW_EMAC_TAH is not set
++# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
++# CONFIG_B44 is not set
++# CONFIG_NETDEV_1000 is not set
++# CONFIG_NETDEV_10000 is not set
++
++#
++# Wireless LAN
++#
++# CONFIG_WLAN_PRE80211 is not set
++# CONFIG_WLAN_80211 is not set
++# CONFIG_IWLWIFI_LEDS is not set
++
++#
++# USB Network Adapters
++#
++# CONFIG_USB_CATC is not set
++# CONFIG_USB_KAWETH is not set
++# CONFIG_USB_PEGASUS is not set
++# CONFIG_USB_RTL8150 is not set
++# CONFIG_USB_USBNET is not set
++# CONFIG_WAN is not set
++# CONFIG_PPP is not set
++# CONFIG_SLIP is not set
++# CONFIG_NETCONSOLE is not set
++# CONFIG_NETPOLL is not set
++# CONFIG_NET_POLL_CONTROLLER is not set
++# CONFIG_ISDN is not set
++
++#
++# Input device support
++#
++CONFIG_INPUT=y
++# CONFIG_INPUT_FF_MEMLESS is not set
++# CONFIG_INPUT_POLLDEV is not set
++
++#
++# Userland interfaces
++#
++CONFIG_INPUT_MOUSEDEV=m
++CONFIG_INPUT_MOUSEDEV_PSAUX=y
++CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
++CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
++# CONFIG_INPUT_JOYDEV is not set
++CONFIG_INPUT_EVDEV=m
++# CONFIG_INPUT_EVBUG is not set
++
++#
++# Input Device Drivers
++#
++CONFIG_INPUT_KEYBOARD=y
++CONFIG_KEYBOARD_ATKBD=m
++# CONFIG_KEYBOARD_SUNKBD is not set
++# CONFIG_KEYBOARD_LKKBD is not set
++# CONFIG_KEYBOARD_XTKBD is not set
++# CONFIG_KEYBOARD_NEWTON is not set
++# CONFIG_KEYBOARD_STOWAWAY is not set
++# CONFIG_KEYBOARD_GPIO is not set
++# CONFIG_INPUT_MOUSE is not set
++# CONFIG_INPUT_JOYSTICK is not set
++# CONFIG_INPUT_TABLET is not set
++# CONFIG_INPUT_TOUCHSCREEN is not set
++# CONFIG_INPUT_MISC is not set
++
++#
++# Hardware I/O ports
++#
++CONFIG_SERIO=m
++CONFIG_SERIO_SERPORT=m
++CONFIG_SERIO_LIBPS2=m
++# CONFIG_SERIO_RAW is not set
++# CONFIG_GAMEPORT is not set
++
++#
++# Character devices
++#
++CONFIG_VT=y
++CONFIG_CONSOLE_TRANSLATIONS=y
++CONFIG_VT_CONSOLE=y
++CONFIG_HW_CONSOLE=y
++# CONFIG_VT_HW_CONSOLE_BINDING is not set
++CONFIG_DEVKMEM=y
++# CONFIG_SERIAL_NONSTANDARD is not set
++
++#
++# Serial drivers
++#
++CONFIG_SERIAL_8250=y
++CONFIG_SERIAL_8250_CONSOLE=y
++CONFIG_SERIAL_8250_NR_UARTS=2
++CONFIG_SERIAL_8250_RUNTIME_UARTS=2
++# CONFIG_SERIAL_8250_EXTENDED is not set
++
++#
++# Non-8250 serial port support
++#
++CONFIG_SERIAL_CORE=y
++CONFIG_SERIAL_CORE_CONSOLE=y
++CONFIG_UNIX98_PTYS=y
++# CONFIG_LEGACY_PTYS is not set
++# CONFIG_IPMI_HANDLER is not set
++# CONFIG_HW_RANDOM is not set
++# CONFIG_NVRAM is not set
++# CONFIG_R3964 is not set
++# CONFIG_RAW_DRIVER is not set
++# CONFIG_TCG_TPM is not set
++CONFIG_XXS_C_CAN=m
++# CONFIG_CRYPTOEEPROM is not set
++CONFIG_I2C=m
++CONFIG_I2C_BOARDINFO=y
++CONFIG_I2C_CHARDEV=m
++CONFIG_I2C_HELPER_AUTO=y
++
++#
++# I2C Hardware Bus support
++#
++
++#
++# I2C system bus drivers (mostly embedded / system-on-chip)
++#
++# CONFIG_I2C_GPIO is not set
++# CONFIG_I2C_OCORES is not set
++# CONFIG_I2C_SIMTEC is not set
++
++#
++# External I2C/SMBus adapter drivers
++#
++# CONFIG_I2C_PARPORT_LIGHT is not set
++# CONFIG_I2C_TAOS_EVM is not set
++# CONFIG_I2C_TINY_USB is not set
++
++#
++# Other I2C/SMBus bus drivers
++#
++# CONFIG_I2C_PCA_PLATFORM is not set
++# CONFIG_I2C_STUB is not set
++CONFIG_I2C_XXSVIDEO=m
++
++#
++# Miscellaneous I2C Chip support
++#
++# CONFIG_DS1682 is not set
++# CONFIG_AT24 is not set
++# CONFIG_SENSORS_EEPROM is not set
++# CONFIG_SENSORS_PCF8574 is not set
++# CONFIG_PCF8575 is not set
++# CONFIG_SENSORS_PCA9539 is not set
++# CONFIG_SENSORS_PCF8591 is not set
++# CONFIG_SENSORS_MAX6875 is not set
++# CONFIG_SENSORS_TSL2550 is not set
++# CONFIG_I2C_DEBUG_CORE is not set
++# CONFIG_I2C_DEBUG_ALGO is not set
++# CONFIG_I2C_DEBUG_BUS is not set
++# CONFIG_I2C_DEBUG_CHIP is not set
++# CONFIG_SPI is not set
++# CONFIG_W1 is not set
++# CONFIG_POWER_SUPPLY is not set
++# CONFIG_HWMON is not set
++# CONFIG_WATCHDOG is not set
++
++#
++# Sonics Silicon Backplane
++#
++CONFIG_SSB_POSSIBLE=y
++# CONFIG_SSB is not set
++
++#
++# Multifunction device drivers
++#
++# CONFIG_MFD_CORE is not set
++# CONFIG_MFD_SM501 is not set
++# CONFIG_HTC_PASIC3 is not set
++# CONFIG_MFD_TMIO is not set
++# CONFIG_MFD_T7L66XB is not set
++# CONFIG_MFD_TC6387XB is not set
++
++#
++# Multimedia devices
++#
++
++#
++# Multimedia core support
++#
++CONFIG_VIDEO_DEV=m
++CONFIG_VIDEO_V4L2_COMMON=m
++CONFIG_VIDEO_ALLOW_V4L1=y
++CONFIG_VIDEO_V4L1_COMPAT=y
++# CONFIG_DVB_CORE is not set
++CONFIG_VIDEO_MEDIA=m
++
++#
++# Multimedia drivers
++#
++# CONFIG_MEDIA_ATTACH is not set
++CONFIG_MEDIA_TUNER=m
++# CONFIG_MEDIA_TUNER_CUSTOMIZE is not set
++CONFIG_MEDIA_TUNER_SIMPLE=m
++CONFIG_MEDIA_TUNER_TDA8290=m
++CONFIG_MEDIA_TUNER_TDA9887=m
++CONFIG_MEDIA_TUNER_TEA5761=m
++CONFIG_MEDIA_TUNER_TEA5767=m
++CONFIG_MEDIA_TUNER_MT20XX=m
++CONFIG_MEDIA_TUNER_XC2028=m
++CONFIG_MEDIA_TUNER_XC5000=m
++CONFIG_VIDEO_V4L2=m
++CONFIG_VIDEO_V4L1=m
++CONFIG_VIDEO_CAPTURE_DRIVERS=y
++# CONFIG_VIDEO_ADV_DEBUG is not set
++# CONFIG_VIDEO_HELPER_CHIPS_AUTO is not set
++
++#
++# Encoders/decoders and other helper chips
++#
++
++#
++# Audio decoders
++#
++# CONFIG_VIDEO_TVAUDIO is not set
++# CONFIG_VIDEO_TDA7432 is not set
++# CONFIG_VIDEO_TDA9840 is not set
++# CONFIG_VIDEO_TDA9875 is not set
++# CONFIG_VIDEO_TEA6415C is not set
++# CONFIG_VIDEO_TEA6420 is not set
++# CONFIG_VIDEO_MSP3400 is not set
++# CONFIG_VIDEO_CS5345 is not set
++# CONFIG_VIDEO_CS53L32A is not set
++# CONFIG_VIDEO_M52790 is not set
++# CONFIG_VIDEO_TLV320AIC23B is not set
++# CONFIG_VIDEO_WM8775 is not set
++# CONFIG_VIDEO_WM8739 is not set
++# CONFIG_VIDEO_VP27SMPX is not set
++
++#
++# Video decoders
++#
++# CONFIG_VIDEO_BT819 is not set
++# CONFIG_VIDEO_BT856 is not set
++# CONFIG_VIDEO_BT866 is not set
++# CONFIG_VIDEO_KS0127 is not set
++# CONFIG_VIDEO_OV7670 is not set
++# CONFIG_VIDEO_TCM825X is not set
++# CONFIG_VIDEO_SAA7110 is not set
++# CONFIG_VIDEO_SAA7111 is not set
++# CONFIG_VIDEO_SAA7114 is not set
++CONFIG_VIDEO_SAA711X=m
++# CONFIG_VIDEO_SAA717X is not set
++# CONFIG_VIDEO_SAA7191 is not set
++# CONFIG_VIDEO_TVP5150 is not set
++# CONFIG_VIDEO_VPX3220 is not set
++
++#
++# Video and audio decoders
++#
++# CONFIG_VIDEO_CX25840 is not set
++
++#
++# MPEG video encoders
++#
++# CONFIG_VIDEO_CX2341X is not set
++
++#
++# Video encoders
++#
++# CONFIG_VIDEO_SAA7127 is not set
++# CONFIG_VIDEO_SAA7185 is not set
++# CONFIG_VIDEO_ADV7170 is not set
++# CONFIG_VIDEO_ADV7175 is not set
++
++#
++# Video improvement chips
++#
++# CONFIG_VIDEO_UPD64031A is not set
++# CONFIG_VIDEO_UPD64083 is not set
++# CONFIG_VIDEO_VIVI is not set
++# CONFIG_VIDEO_CPIA is not set
++# CONFIG_VIDEO_CPIA2 is not set
++# CONFIG_VIDEO_SAA5246A is not set
++# CONFIG_VIDEO_SAA5249 is not set
++# CONFIG_TUNER_3036 is not set
++# CONFIG_V4L_USB_DRIVERS is not set
++# CONFIG_SOC_CAMERA is not set
++# CONFIG_VIDEO_SH_MOBILE_CEU is not set
++# CONFIG_RADIO_ADAPTERS is not set
++# CONFIG_DAB is not set
++
++#
++# Graphics support
++#
++# CONFIG_VGASTATE is not set
++# CONFIG_VIDEO_OUTPUT_CONTROL is not set
++CONFIG_FB=y
++# CONFIG_FIRMWARE_EDID is not set
++# CONFIG_FB_DDC is not set
++CONFIG_FB_CFB_FILLRECT=y
++CONFIG_FB_CFB_COPYAREA=y
++CONFIG_FB_CFB_IMAGEBLIT=y
++# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
++# CONFIG_FB_SYS_FILLRECT is not set
++# CONFIG_FB_SYS_COPYAREA is not set
++# CONFIG_FB_SYS_IMAGEBLIT is not set
++# CONFIG_FB_FOREIGN_ENDIAN is not set
++# CONFIG_FB_SYS_FOPS is not set
++# CONFIG_FB_SVGALIB is not set
++# CONFIG_FB_MACMODES is not set
++# CONFIG_FB_BACKLIGHT is not set
++# CONFIG_FB_MODE_HELPERS is not set
++# CONFIG_FB_TILEBLITTING is not set
++
++#
++# Frame buffer hardware drivers
++#
++# CONFIG_FB_S1D13XXX is not set
++CONFIG_FB_XXSVIDEO=y
++# CONFIG_FB_XXSVIDEO_FB0_640_480 is not set
++# CONFIG_FB_XXSVIDEO_FB0_800_480 is not set
++CONFIG_FB_XXSVIDEO_FB0_800_600=y
++# CONFIG_FB_XXSVIDEO_FB0_1024_768 is not set
++# CONFIG_FB_XXSVIDEO_FB0_1280_1024 is not set
++CONFIG_FB_XXSVIDEO_FB1_640_480=y
++# CONFIG_FB_XXSVIDEO_FB1_800_480 is not set
++# CONFIG_FB_XXSVIDEO_FB1_800_600 is not set
++# CONFIG_FB_XXSVIDEO_FB1_1024_768 is not set
++# CONFIG_FB_XXSVIDEO_FB1_1280_1024 is not set
++# CONFIG_FB_VIRTUAL is not set
++# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
++
++#
++# Display device support
++#
++# CONFIG_DISPLAY_SUPPORT is not set
++
++#
++# Console display driver support
++#
++# CONFIG_VGA_CONSOLE is not set
++CONFIG_DUMMY_CONSOLE=y
++CONFIG_FRAMEBUFFER_CONSOLE=y
++# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
++# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
++CONFIG_FONTS=y
++# CONFIG_FONT_8x8 is not set
++CONFIG_FONT_8x16=y
++# CONFIG_FONT_6x11 is not set
++# CONFIG_FONT_7x14 is not set
++# CONFIG_FONT_PEARL_8x8 is not set
++# CONFIG_FONT_ACORN_8x8 is not set
++# CONFIG_FONT_MINI_4x6 is not set
++# CONFIG_FONT_SUN8x16 is not set
++# CONFIG_FONT_SUN12x22 is not set
++# CONFIG_FONT_10x18 is not set
++CONFIG_LOGO=y
++CONFIG_LOGO_LINUX_MONO=y
++CONFIG_LOGO_LINUX_VGA16=y
++CONFIG_LOGO_LINUX_CLUT224=y
++CONFIG_SOUND=m
++CONFIG_SND=m
++CONFIG_SND_TIMER=m
++CONFIG_SND_PCM=m
++# CONFIG_SND_SEQUENCER is not set
++CONFIG_SND_OSSEMUL=y
++CONFIG_SND_MIXER_OSS=m
++CONFIG_SND_PCM_OSS=m
++CONFIG_SND_PCM_OSS_PLUGINS=y
++# CONFIG_SND_DYNAMIC_MINORS is not set
++# CONFIG_SND_SUPPORT_OLD_API is not set
++CONFIG_SND_VERBOSE_PROCFS=y
++CONFIG_SND_VERBOSE_PRINTK=y
++CONFIG_SND_DEBUG=y
++CONFIG_SND_DEBUG_VERBOSE=y
++CONFIG_SND_PCM_XRUN_DEBUG=y
++CONFIG_SND_DRIVERS=y
++# CONFIG_SND_DUMMY is not set
++# CONFIG_SND_MTPAV is not set
++# CONFIG_SND_SERIAL_U16550 is not set
++# CONFIG_SND_MPU401 is not set
++CONFIG_SND_ARM=y
++CONFIG_SND_USB=y
++# CONFIG_SND_USB_AUDIO is not set
++# CONFIG_SND_USB_CAIAQ is not set
++CONFIG_SND_SOC=m
++CONFIG_SND_XXSVIDEO_ALSA_SOC=m
++CONFIG_SND_XXSVIDEO_ALSA_SOC_I2S=m
++CONFIG_SND_XXSVIDEO_ALSA_EVALKIT_CS4245=m
++CONFIG_SND_SOC_CS4245=m
++# CONFIG_SOUND_PRIME is not set
++CONFIG_HID_SUPPORT=y
++CONFIG_HID=y
++CONFIG_HID_DEBUG=y
++# CONFIG_HIDRAW is not set
++
++#
++# USB Input Devices
++#
++CONFIG_USB_HID=y
++# CONFIG_USB_HIDINPUT_POWERBOOK is not set
++# CONFIG_HID_FF is not set
++# CONFIG_USB_HIDDEV is not set
++CONFIG_USB_SUPPORT=y
++CONFIG_USB_ARCH_HAS_HCD=y
++CONFIG_USB_ARCH_HAS_OHCI=y
++CONFIG_USB_ARCH_HAS_EHCI=y
++CONFIG_USB=y
++CONFIG_USB_DEBUG=y
++# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
++
++#
++# Miscellaneous USB options
++#
++CONFIG_USB_DEVICEFS=y
++# CONFIG_USB_DEVICE_CLASS is not set
++# CONFIG_USB_DYNAMIC_MINORS is not set
++# CONFIG_USB_OTG is not set
++# CONFIG_USB_OTG_WHITELIST is not set
++# CONFIG_USB_OTG_BLACKLIST_HUB is not set
++CONFIG_USB_MON=y
++
++#
++# USB Host Controller Drivers
++#
++# CONFIG_USB_C67X00_HCD is not set
++CONFIG_USB_EHCI_HCD=y
++# CONFIG_USB_EHCI_ROOT_HUB_TT is not set
++# CONFIG_USB_EHCI_TT_NEWSCHED is not set
++# CONFIG_USB_ISP116X_HCD is not set
++CONFIG_USB_OHCI_HCD=y
++# CONFIG_USB_OHCI_BIG_ENDIAN_DESC is not set
++# CONFIG_USB_OHCI_BIG_ENDIAN_MMIO is not set
++CONFIG_USB_OHCI_LITTLE_ENDIAN=y
++# CONFIG_USB_SL811_HCD is not set
++# CONFIG_USB_R8A66597_HCD is not set
++
++#
++# USB Device Class drivers
++#
++# CONFIG_USB_ACM is not set
++# CONFIG_USB_PRINTER is not set
++# CONFIG_USB_WDM is not set
++
++#
++# NOTE: USB_STORAGE enables SCSI, and 'SCSI disk support'
++#
++
++#
++# may also be needed; see USB_STORAGE Help for more information
++#
++CONFIG_USB_STORAGE=m
++# CONFIG_USB_STORAGE_DEBUG is not set
++# CONFIG_USB_STORAGE_DATAFAB is not set
++# CONFIG_USB_STORAGE_FREECOM is not set
++# CONFIG_USB_STORAGE_ISD200 is not set
++# CONFIG_USB_STORAGE_DPCM is not set
++# CONFIG_USB_STORAGE_USBAT is not set
++# CONFIG_USB_STORAGE_SDDR09 is not set
++# CONFIG_USB_STORAGE_SDDR55 is not set
++# CONFIG_USB_STORAGE_JUMPSHOT is not set
++# CONFIG_USB_STORAGE_ALAUDA is not set
++# CONFIG_USB_STORAGE_ONETOUCH is not set
++# CONFIG_USB_STORAGE_KARMA is not set
++# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
++# CONFIG_USB_LIBUSUAL is not set
++
++#
++# USB Imaging devices
++#
++# CONFIG_USB_MDC800 is not set
++# CONFIG_USB_MICROTEK is not set
++
++#
++# USB port drivers
++#
++CONFIG_USB_SERIAL=m
++# CONFIG_USB_EZUSB is not set
++CONFIG_USB_SERIAL_GENERIC=y
++# CONFIG_USB_SERIAL_AIRCABLE is not set
++# CONFIG_USB_SERIAL_ARK3116 is not set
++# CONFIG_USB_SERIAL_BELKIN is not set
++# CONFIG_USB_SERIAL_CH341 is not set
++# CONFIG_USB_SERIAL_WHITEHEAT is not set
++# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
++# CONFIG_USB_SERIAL_CP2101 is not set
++# CONFIG_USB_SERIAL_CYPRESS_M8 is not set
++# CONFIG_USB_SERIAL_EMPEG is not set
++# CONFIG_USB_SERIAL_FTDI_SIO is not set
++# CONFIG_USB_SERIAL_FUNSOFT is not set
++# CONFIG_USB_SERIAL_VISOR is not set
++# CONFIG_USB_SERIAL_IPAQ is not set
++# CONFIG_USB_SERIAL_IR is not set
++# CONFIG_USB_SERIAL_EDGEPORT is not set
++# CONFIG_USB_SERIAL_EDGEPORT_TI is not set
++# CONFIG_USB_SERIAL_GARMIN is not set
++# CONFIG_USB_SERIAL_IPW is not set
++# CONFIG_USB_SERIAL_IUU is not set
++# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
++# CONFIG_USB_SERIAL_KEYSPAN is not set
++# CONFIG_USB_SERIAL_KLSI is not set
++# CONFIG_USB_SERIAL_KOBIL_SCT is not set
++# CONFIG_USB_SERIAL_MCT_U232 is not set
++# CONFIG_USB_SERIAL_MOS7720 is not set
++# CONFIG_USB_SERIAL_MOS7840 is not set
++# CONFIG_USB_SERIAL_MOTOROLA is not set
++# CONFIG_USB_SERIAL_NAVMAN is not set
++CONFIG_USB_SERIAL_PL2303=m
++# CONFIG_USB_SERIAL_OTI6858 is not set
++# CONFIG_USB_SERIAL_SPCP8X5 is not set
++# CONFIG_USB_SERIAL_HP4X is not set
++# CONFIG_USB_SERIAL_SAFE is not set
++# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
++# CONFIG_USB_SERIAL_TI is not set
++# CONFIG_USB_SERIAL_CYBERJACK is not set
++# CONFIG_USB_SERIAL_XIRCOM is not set
++# CONFIG_USB_SERIAL_OPTION is not set
++# CONFIG_USB_SERIAL_OMNINET is not set
++# CONFIG_USB_SERIAL_DEBUG is not set
++
++#
++# USB Miscellaneous drivers
++#
++# CONFIG_USB_EMI62 is not set
++# CONFIG_USB_EMI26 is not set
++# CONFIG_USB_ADUTUX is not set
++# CONFIG_USB_RIO500 is not set
++# CONFIG_USB_LEGOTOWER is not set
++# CONFIG_USB_LCD is not set
++# CONFIG_USB_BERRY_CHARGE is not set
++# CONFIG_USB_LED is not set
++# CONFIG_USB_CYPRESS_CY7C63 is not set
++# CONFIG_USB_CYTHERM is not set
++# CONFIG_USB_PHIDGET is not set
++# CONFIG_USB_IDMOUSE is not set
++# CONFIG_USB_FTDI_ELAN is not set
++# CONFIG_USB_APPLEDISPLAY is not set
++# CONFIG_USB_SISUSBVGA is not set
++# CONFIG_USB_LD is not set
++# CONFIG_USB_TRANCEVIBRATOR is not set
++# CONFIG_USB_IOWARRIOR is not set
++# CONFIG_USB_TEST is not set
++# CONFIG_USB_ISIGHTFW is not set
++# CONFIG_USB_GADGET is not set
++# CONFIG_MMC is not set
++CONFIG_NEW_LEDS=y
++CONFIG_LEDS_CLASS=y
++
++#
++# LED drivers
++#
++# CONFIG_LEDS_PCA9532 is not set
++# CONFIG_LEDS_GPIO is not set
++# CONFIG_LEDS_PCA955X is not set
++CONFIG_LEDS_XXSVIDEO_JADEEVALKIT=m
++
++#
++# LED Triggers
++#
++# CONFIG_LEDS_TRIGGERS is not set
++CONFIG_RTC_LIB=y
++CONFIG_RTC_CLASS=m
++
++#
++# RTC interfaces
++#
++CONFIG_RTC_INTF_SYSFS=y
++CONFIG_RTC_INTF_PROC=y
++CONFIG_RTC_INTF_DEV=y
++# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
++# CONFIG_RTC_DRV_TEST is not set
++
++#
++# I2C RTC drivers
++#
++# CONFIG_RTC_DRV_DS1307 is not set
++# CONFIG_RTC_DRV_DS1374 is not set
++# CONFIG_RTC_DRV_DS1672 is not set
++# CONFIG_RTC_DRV_MAX6900 is not set
++# CONFIG_RTC_DRV_RS5C372 is not set
++# CONFIG_RTC_DRV_ISL1208 is not set
++# CONFIG_RTC_DRV_X1205 is not set
++# CONFIG_RTC_DRV_PCF8563 is not set
++# CONFIG_RTC_DRV_PCF8583 is not set
++CONFIG_RTC_DRV_M41T80=m
++# CONFIG_RTC_DRV_M41T80_WDT is not set
++# CONFIG_RTC_DRV_S35390A is not set
++# CONFIG_RTC_DRV_FM3130 is not set
++
++#
++# SPI RTC drivers
++#
++
++#
++# Platform RTC drivers
++#
++# CONFIG_RTC_DRV_CMOS is not set
++# CONFIG_RTC_DRV_DS1511 is not set
++# CONFIG_RTC_DRV_DS1553 is not set
++# CONFIG_RTC_DRV_DS1742 is not set
++# CONFIG_RTC_DRV_STK17TA8 is not set
++# CONFIG_RTC_DRV_M48T86 is not set
++# CONFIG_RTC_DRV_M48T59 is not set
++# CONFIG_RTC_DRV_V3020 is not set
++
++#
++# on-CPU RTC drivers
++#
++# CONFIG_DMADEVICES is not set
++
++#
++# Voltage and Current regulators
++#
++# CONFIG_REGULATOR is not set
++# CONFIG_REGULATOR_FIXED_VOLTAGE is not set
++# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
++# CONFIG_REGULATOR_BQ24022 is not set
++# CONFIG_UIO is not set
++
++#
++# File systems
++#
++CONFIG_EXT2_FS=m
++# CONFIG_EXT2_FS_XATTR is not set
++# CONFIG_EXT2_FS_XIP is not set
++CONFIG_EXT3_FS=m
++CONFIG_EXT3_FS_XATTR=y
++# CONFIG_EXT3_FS_POSIX_ACL is not set
++# CONFIG_EXT3_FS_SECURITY is not set
++# CONFIG_EXT4DEV_FS is not set
++CONFIG_JBD=m
++CONFIG_FS_MBCACHE=m
++# CONFIG_REISERFS_FS is not set
++# CONFIG_JFS_FS is not set
++# CONFIG_FS_POSIX_ACL is not set
++# CONFIG_XFS_FS is not set
++# CONFIG_OCFS2_FS is not set
++CONFIG_DNOTIFY=y
++CONFIG_INOTIFY=y
++CONFIG_INOTIFY_USER=y
++# CONFIG_QUOTA is not set
++# CONFIG_AUTOFS_FS is not set
++# CONFIG_AUTOFS4_FS is not set
++# CONFIG_FUSE_FS is not set
++
++#
++# CD-ROM/DVD Filesystems
++#
++# CONFIG_ISO9660_FS is not set
++# CONFIG_UDF_FS is not set
++
++#
++# DOS/FAT/NT Filesystems
++#
++CONFIG_FAT_FS=m
++# CONFIG_MSDOS_FS is not set
++CONFIG_VFAT_FS=m
++CONFIG_FAT_DEFAULT_CODEPAGE=437
++CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
++CONFIG_NTFS_FS=m
++# CONFIG_NTFS_DEBUG is not set
++# CONFIG_NTFS_RW is not set
++
++#
++# Pseudo filesystems
++#
++CONFIG_PROC_FS=y
++CONFIG_PROC_SYSCTL=y
++CONFIG_SYSFS=y
++CONFIG_TMPFS=y
++# CONFIG_TMPFS_POSIX_ACL is not set
++# CONFIG_HUGETLB_PAGE is not set
++# CONFIG_CONFIGFS_FS is not set
++
++#
++# Miscellaneous filesystems
++#
++# CONFIG_ADFS_FS is not set
++# CONFIG_AFFS_FS is not set
++# CONFIG_HFS_FS is not set
++# CONFIG_HFSPLUS_FS is not set
++# CONFIG_BEFS_FS is not set
++# CONFIG_BFS_FS is not set
++# CONFIG_EFS_FS is not set
++CONFIG_JFFS2_FS=y
++CONFIG_JFFS2_FS_DEBUG=0
++# CONFIG_JFFS2_FS_WRITEBUFFER is not set
++# CONFIG_JFFS2_SUMMARY is not set
++# CONFIG_JFFS2_FS_XATTR is not set
++CONFIG_JFFS2_COMPRESSION_OPTIONS=y
++CONFIG_JFFS2_ZLIB=y
++# CONFIG_JFFS2_LZO is not set
++CONFIG_JFFS2_RTIME=y
++# CONFIG_JFFS2_RUBIN is not set
++# CONFIG_JFFS2_CMODE_NONE is not set
++CONFIG_JFFS2_CMODE_PRIORITY=y
++# CONFIG_JFFS2_CMODE_SIZE is not set
++# CONFIG_JFFS2_CMODE_FAVOURLZO is not set
++# CONFIG_CRAMFS is not set
++# CONFIG_VXFS_FS is not set
++# CONFIG_MINIX_FS is not set
++# CONFIG_OMFS_FS is not set
++# CONFIG_HPFS_FS is not set
++# CONFIG_QNX4FS_FS is not set
++# CONFIG_ROMFS_FS is not set
++# CONFIG_SYSV_FS is not set
++# CONFIG_UFS_FS is not set
++CONFIG_NETWORK_FILESYSTEMS=y
++CONFIG_NFS_FS=y
++CONFIG_NFS_V3=y
++# CONFIG_NFS_V3_ACL is not set
++# CONFIG_NFS_V4 is not set
++CONFIG_ROOT_NFS=y
++# CONFIG_NFSD is not set
++CONFIG_LOCKD=y
++CONFIG_LOCKD_V4=y
++CONFIG_NFS_COMMON=y
++CONFIG_SUNRPC=y
++# CONFIG_RPCSEC_GSS_KRB5 is not set
++# CONFIG_RPCSEC_GSS_SPKM3 is not set
++# CONFIG_SMB_FS is not set
++# CONFIG_CIFS is not set
++# CONFIG_NCP_FS is not set
++# CONFIG_CODA_FS is not set
++# CONFIG_AFS_FS is not set
++
++#
++# Partition Types
++#
++# CONFIG_PARTITION_ADVANCED is not set
++CONFIG_MSDOS_PARTITION=y
++CONFIG_NLS=y
++CONFIG_NLS_DEFAULT="iso8859-1"
++CONFIG_NLS_CODEPAGE_437=y
++# CONFIG_NLS_CODEPAGE_737 is not set
++# CONFIG_NLS_CODEPAGE_775 is not set
++CONFIG_NLS_CODEPAGE_850=y
++# CONFIG_NLS_CODEPAGE_852 is not set
++# CONFIG_NLS_CODEPAGE_855 is not set
++# CONFIG_NLS_CODEPAGE_857 is not set
++# CONFIG_NLS_CODEPAGE_860 is not set
++# CONFIG_NLS_CODEPAGE_861 is not set
++# CONFIG_NLS_CODEPAGE_862 is not set
++# CONFIG_NLS_CODEPAGE_863 is not set
++# CONFIG_NLS_CODEPAGE_864 is not set
++# CONFIG_NLS_CODEPAGE_865 is not set
++# CONFIG_NLS_CODEPAGE_866 is not set
++# CONFIG_NLS_CODEPAGE_869 is not set
++# CONFIG_NLS_CODEPAGE_936 is not set
++# CONFIG_NLS_CODEPAGE_950 is not set
++# CONFIG_NLS_CODEPAGE_932 is not set
++# CONFIG_NLS_CODEPAGE_949 is not set
++# CONFIG_NLS_CODEPAGE_874 is not set
++# CONFIG_NLS_ISO8859_8 is not set
++# CONFIG_NLS_CODEPAGE_1250 is not set
++# CONFIG_NLS_CODEPAGE_1251 is not set
++# CONFIG_NLS_ASCII is not set
++CONFIG_NLS_ISO8859_1=y
++# CONFIG_NLS_ISO8859_2 is not set
++# CONFIG_NLS_ISO8859_3 is not set
++# CONFIG_NLS_ISO8859_4 is not set
++# CONFIG_NLS_ISO8859_5 is not set
++# CONFIG_NLS_ISO8859_6 is not set
++# CONFIG_NLS_ISO8859_7 is not set
++# CONFIG_NLS_ISO8859_9 is not set
++# CONFIG_NLS_ISO8859_13 is not set
++# CONFIG_NLS_ISO8859_14 is not set
++# CONFIG_NLS_ISO8859_15 is not set
++# CONFIG_NLS_KOI8_R is not set
++# CONFIG_NLS_KOI8_U is not set
++# CONFIG_NLS_UTF8 is not set
++# CONFIG_DLM is not set
++
++#
++# Kernel hacking
++#
++# CONFIG_PRINTK_TIME is not set
++CONFIG_ENABLE_WARN_DEPRECATED=y
++CONFIG_ENABLE_MUST_CHECK=y
++CONFIG_FRAME_WARN=1024
++# CONFIG_MAGIC_SYSRQ is not set
++# CONFIG_UNUSED_SYMBOLS is not set
++# CONFIG_DEBUG_FS is not set
++# CONFIG_HEADERS_CHECK is not set
++CONFIG_DEBUG_KERNEL=y
++# CONFIG_DEBUG_SHIRQ is not set
++CONFIG_DETECT_SOFTLOCKUP=y
++# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
++CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=0
++CONFIG_SCHED_DEBUG=y
++# CONFIG_SCHEDSTATS is not set
++# CONFIG_TIMER_STATS is not set
++# CONFIG_DEBUG_OBJECTS is not set
++# CONFIG_DEBUG_SLAB is not set
++# CONFIG_DEBUG_RT_MUTEXES is not set
++# CONFIG_RT_MUTEX_TESTER is not set
++# CONFIG_DEBUG_SPINLOCK is not set
++# CONFIG_DEBUG_MUTEXES is not set
++# CONFIG_DEBUG_LOCK_ALLOC is not set
++# CONFIG_PROVE_LOCKING is not set
++# CONFIG_LOCK_STAT is not set
++# CONFIG_DEBUG_SPINLOCK_SLEEP is not set
++# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
++# CONFIG_DEBUG_KOBJECT is not set
++# CONFIG_DEBUG_BUGVERBOSE is not set
++# CONFIG_DEBUG_INFO is not set
++# CONFIG_DEBUG_VM is not set
++# CONFIG_DEBUG_WRITECOUNT is not set
++# CONFIG_DEBUG_MEMORY_INIT is not set
++# CONFIG_DEBUG_LIST is not set
++# CONFIG_DEBUG_SG is not set
++CONFIG_FRAME_POINTER=y
++# CONFIG_BOOT_PRINTK_DELAY is not set
++# CONFIG_RCU_TORTURE_TEST is not set
++# CONFIG_BACKTRACE_SELF_TEST is not set
++# CONFIG_FAULT_INJECTION is not set
++# CONFIG_LATENCYTOP is not set
++# CONFIG_SYSCTL_SYSCALL_CHECK is not set
++CONFIG_HAVE_FTRACE=y
++CONFIG_HAVE_DYNAMIC_FTRACE=y
++# CONFIG_FTRACE is not set
++# CONFIG_SCHED_TRACER is not set
++# CONFIG_CONTEXT_SWITCH_TRACER is not set
++# CONFIG_SAMPLES is not set
++CONFIG_HAVE_ARCH_KGDB=y
++# CONFIG_KGDB is not set
++CONFIG_DEBUG_USER=y
++# CONFIG_DEBUG_ERRORS is not set
++# CONFIG_DEBUG_STACK_USAGE is not set
++CONFIG_DEBUG_LL=y
++# CONFIG_DEBUG_ICEDCC is not set
++
++#
++# Security options
++#
++# CONFIG_KEYS is not set
++# CONFIG_SECURITY is not set
++# CONFIG_SECURITY_FILE_CAPABILITIES is not set
++CONFIG_CRYPTO=y
++
++#
++# Crypto core or helper
++#
++# CONFIG_CRYPTO_MANAGER is not set
++# CONFIG_CRYPTO_GF128MUL is not set
++# CONFIG_CRYPTO_NULL is not set
++# CONFIG_CRYPTO_CRYPTD is not set
++# CONFIG_CRYPTO_AUTHENC is not set
++# CONFIG_CRYPTO_TEST is not set
++
++#
++# Authenticated Encryption with Associated Data
++#
++# CONFIG_CRYPTO_CCM is not set
++# CONFIG_CRYPTO_GCM is not set
++# CONFIG_CRYPTO_SEQIV is not set
++
++#
++# Block modes
++#
++# CONFIG_CRYPTO_CBC is not set
++# CONFIG_CRYPTO_CTR is not set
++# CONFIG_CRYPTO_CTS is not set
++# CONFIG_CRYPTO_ECB is not set
++# CONFIG_CRYPTO_LRW is not set
++# CONFIG_CRYPTO_PCBC is not set
++# CONFIG_CRYPTO_XTS is not set
++
++#
++# Hash modes
++#
++# CONFIG_CRYPTO_HMAC is not set
++# CONFIG_CRYPTO_XCBC is not set
++
++#
++# Digest
++#
++# CONFIG_CRYPTO_CRC32C is not set
++# CONFIG_CRYPTO_MD4 is not set
++# CONFIG_CRYPTO_MD5 is not set
++# CONFIG_CRYPTO_MICHAEL_MIC is not set
++# CONFIG_CRYPTO_RMD128 is not set
++# CONFIG_CRYPTO_RMD160 is not set
++# CONFIG_CRYPTO_RMD256 is not set
++# CONFIG_CRYPTO_RMD320 is not set
++# CONFIG_CRYPTO_SHA1 is not set
++# CONFIG_CRYPTO_SHA256 is not set
++# CONFIG_CRYPTO_SHA512 is not set
++# CONFIG_CRYPTO_TGR192 is not set
++# CONFIG_CRYPTO_WP512 is not set
++
++#
++# Ciphers
++#
++# CONFIG_CRYPTO_AES is not set
++# CONFIG_CRYPTO_ANUBIS is not set
++# CONFIG_CRYPTO_ARC4 is not set
++# CONFIG_CRYPTO_BLOWFISH is not set
++# CONFIG_CRYPTO_CAMELLIA is not set
++# CONFIG_CRYPTO_CAST5 is not set
++# CONFIG_CRYPTO_CAST6 is not set
++# CONFIG_CRYPTO_DES is not set
++# CONFIG_CRYPTO_FCRYPT is not set
++# CONFIG_CRYPTO_KHAZAD is not set
++# CONFIG_CRYPTO_SALSA20 is not set
++# CONFIG_CRYPTO_SEED is not set
++# CONFIG_CRYPTO_SERPENT is not set
++# CONFIG_CRYPTO_TEA is not set
++# CONFIG_CRYPTO_TWOFISH is not set
++
++#
++# Compression
++#
++# CONFIG_CRYPTO_DEFLATE is not set
++# CONFIG_CRYPTO_LZO is not set
++CONFIG_CRYPTO_HW=y
++
++#
++# Library routines
++#
++CONFIG_BITREVERSE=y
++# CONFIG_GENERIC_FIND_FIRST_BIT is not set
++# CONFIG_GENERIC_FIND_NEXT_BIT is not set
++# CONFIG_CRC_CCITT is not set
++# CONFIG_CRC16 is not set
++# CONFIG_CRC_T10DIF is not set
++# CONFIG_CRC_ITU_T is not set
++CONFIG_CRC32=y
++# CONFIG_CRC7 is not set
++# CONFIG_LIBCRC32C is not set
++CONFIG_ZLIB_INFLATE=y
++CONFIG_ZLIB_DEFLATE=y
++CONFIG_PLIST=y
++CONFIG_HAS_IOMEM=y
++CONFIG_HAS_IOPORT=y
++CONFIG_HAS_DMA=y
+--- linux-2.6.27.21/arch/arm/configs/xxsvideo_jadedevalkit_defconfig	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/configs/xxsvideo_jadedevalkit_defconfig	2009-11-30 12:57:11.000000000 +0000
+@@ -0,0 +1,1458 @@
++#
++# Automatically generated make config: don't edit
++# Linux kernel version: 2.6.27.21
++# Fri Nov 27 16:12:44 2009
++#
++CONFIG_ARM=y
++CONFIG_SYS_SUPPORTS_APM_EMULATION=y
++CONFIG_GENERIC_GPIO=y
++# CONFIG_GENERIC_TIME is not set
++# CONFIG_GENERIC_CLOCKEVENTS is not set
++CONFIG_MMU=y
++# CONFIG_NO_IOPORT is not set
++CONFIG_GENERIC_HARDIRQS=y
++CONFIG_STACKTRACE_SUPPORT=y
++CONFIG_HAVE_LATENCYTOP_SUPPORT=y
++CONFIG_LOCKDEP_SUPPORT=y
++CONFIG_TRACE_IRQFLAGS_SUPPORT=y
++CONFIG_HARDIRQS_SW_RESEND=y
++CONFIG_GENERIC_IRQ_PROBE=y
++CONFIG_RWSEM_GENERIC_SPINLOCK=y
++# CONFIG_ARCH_HAS_ILOG2_U32 is not set
++# CONFIG_ARCH_HAS_ILOG2_U64 is not set
++CONFIG_GENERIC_HWEIGHT=y
++CONFIG_GENERIC_CALIBRATE_DELAY=y
++CONFIG_ARCH_SUPPORTS_AOUT=y
++CONFIG_ZONE_DMA=y
++CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=y
++CONFIG_VECTORS_BASE=0xffff0000
++CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
++
++#
++# General setup
++#
++CONFIG_EXPERIMENTAL=y
++CONFIG_BROKEN_ON_SMP=y
++CONFIG_INIT_ENV_ARG_LIMIT=32
++CONFIG_LOCALVERSION=""
++# CONFIG_LOCALVERSION_AUTO is not set
++CONFIG_SWAP=y
++CONFIG_SYSVIPC=y
++CONFIG_SYSVIPC_SYSCTL=y
++CONFIG_POSIX_MQUEUE=y
++CONFIG_BSD_PROCESS_ACCT=y
++# CONFIG_BSD_PROCESS_ACCT_V3 is not set
++# CONFIG_TASKSTATS is not set
++# CONFIG_AUDIT is not set
++CONFIG_IKCONFIG=y
++CONFIG_IKCONFIG_PROC=y
++CONFIG_LOG_BUF_SHIFT=14
++# CONFIG_CGROUPS is not set
++# CONFIG_GROUP_SCHED is not set
++CONFIG_SYSFS_DEPRECATED=y
++CONFIG_SYSFS_DEPRECATED_V2=y
++# CONFIG_RELAY is not set
++# CONFIG_NAMESPACES is not set
++# CONFIG_BLK_DEV_INITRD is not set
++# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
++CONFIG_SYSCTL=y
++CONFIG_EMBEDDED=y
++CONFIG_UID16=y
++CONFIG_SYSCTL_SYSCALL=y
++CONFIG_KALLSYMS=y
++# CONFIG_KALLSYMS_ALL is not set
++# CONFIG_KALLSYMS_EXTRA_PASS is not set
++CONFIG_HOTPLUG=y
++CONFIG_PRINTK=y
++CONFIG_BUG=y
++CONFIG_ELF_CORE=y
++CONFIG_COMPAT_BRK=y
++CONFIG_BASE_FULL=y
++CONFIG_FUTEX=y
++CONFIG_ANON_INODES=y
++CONFIG_EPOLL=y
++CONFIG_SIGNALFD=y
++CONFIG_TIMERFD=y
++CONFIG_EVENTFD=y
++CONFIG_SHMEM=y
++CONFIG_VM_EVENT_COUNTERS=y
++CONFIG_SLAB=y
++# CONFIG_SLUB is not set
++# CONFIG_SLOB is not set
++# CONFIG_PROFILING is not set
++# CONFIG_MARKERS is not set
++CONFIG_HAVE_OPROFILE=y
++# CONFIG_KPROBES is not set
++# CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is not set
++# CONFIG_HAVE_IOREMAP_PROT is not set
++CONFIG_HAVE_KPROBES=y
++CONFIG_HAVE_KRETPROBES=y
++# CONFIG_HAVE_ARCH_TRACEHOOK is not set
++# CONFIG_HAVE_DMA_ATTRS is not set
++# CONFIG_USE_GENERIC_SMP_HELPERS is not set
++# CONFIG_HAVE_CLK is not set
++CONFIG_PROC_PAGE_MONITOR=y
++CONFIG_HAVE_GENERIC_DMA_COHERENT=y
++CONFIG_SLABINFO=y
++CONFIG_RT_MUTEXES=y
++# CONFIG_TINY_SHMEM is not set
++CONFIG_BASE_SMALL=0
++CONFIG_MODULES=y
++# CONFIG_MODULE_FORCE_LOAD is not set
++CONFIG_MODULE_UNLOAD=y
++# CONFIG_MODULE_FORCE_UNLOAD is not set
++# CONFIG_MODVERSIONS is not set
++# CONFIG_MODULE_SRCVERSION_ALL is not set
++CONFIG_KMOD=y
++CONFIG_BLOCK=y
++# CONFIG_LBD is not set
++# CONFIG_BLK_DEV_IO_TRACE is not set
++# CONFIG_LSF is not set
++# CONFIG_BLK_DEV_BSG is not set
++# CONFIG_BLK_DEV_INTEGRITY is not set
++
++#
++# IO Schedulers
++#
++CONFIG_IOSCHED_NOOP=y
++CONFIG_IOSCHED_AS=y
++# CONFIG_IOSCHED_DEADLINE is not set
++# CONFIG_IOSCHED_CFQ is not set
++CONFIG_DEFAULT_AS=y
++# CONFIG_DEFAULT_DEADLINE is not set
++# CONFIG_DEFAULT_CFQ is not set
++# CONFIG_DEFAULT_NOOP is not set
++CONFIG_DEFAULT_IOSCHED="anticipatory"
++CONFIG_CLASSIC_RCU=y
++
++#
++# System Type
++#
++# CONFIG_ARCH_AAEC2000 is not set
++# CONFIG_ARCH_INTEGRATOR is not set
++# CONFIG_ARCH_REALVIEW is not set
++# CONFIG_ARCH_VERSATILE is not set
++# CONFIG_ARCH_AT91 is not set
++# CONFIG_ARCH_CLPS7500 is not set
++# CONFIG_ARCH_CLPS711X is not set
++# CONFIG_ARCH_EBSA110 is not set
++# CONFIG_ARCH_EP93XX is not set
++# CONFIG_ARCH_FOOTBRIDGE is not set
++CONFIG_ARCH_JADE=y
++# CONFIG_ARCH_NETX is not set
++# CONFIG_ARCH_H720X is not set
++# CONFIG_ARCH_IMX is not set
++# CONFIG_ARCH_IOP13XX is not set
++# CONFIG_ARCH_IOP32X is not set
++# CONFIG_ARCH_IOP33X is not set
++# CONFIG_ARCH_IXP23XX is not set
++# CONFIG_ARCH_IXP2000 is not set
++# CONFIG_ARCH_IXP4XX is not set
++# CONFIG_ARCH_L7200 is not set
++# CONFIG_ARCH_KIRKWOOD is not set
++# CONFIG_ARCH_KS8695 is not set
++# CONFIG_ARCH_NS9XXX is not set
++# CONFIG_ARCH_LOKI is not set
++# CONFIG_ARCH_MV78XX0 is not set
++# CONFIG_ARCH_MXC is not set
++# CONFIG_ARCH_ORION5X is not set
++# CONFIG_ARCH_PNX4008 is not set
++# CONFIG_ARCH_PXA is not set
++# CONFIG_ARCH_RPC is not set
++# CONFIG_ARCH_SA1100 is not set
++# CONFIG_ARCH_S3C2410 is not set
++# CONFIG_ARCH_SHARK is not set
++# CONFIG_ARCH_LH7A40X is not set
++# CONFIG_ARCH_DAVINCI is not set
++# CONFIG_ARCH_OMAP is not set
++# CONFIG_ARCH_MSM7X00A is not set
++
++#
++# Boot options
++#
++
++#
++# Power management
++#
++
++#
++# Fujitsu Jade Options
++#
++# CONFIG_ARCH_JADE_MB86R01 is not set
++CONFIG_ARCH_JADE_MB86R02=y
++CONFIG_JADE_PACLK_FREQ=41666666
++# CONFIG_MACH_XXSVIDEO is not set
++CONFIG_MACH_XXSVIDEOD=y
++# CONFIG_MACH_XXSVIDEO_TERMINAL is not set
++# CONFIG_MACH_XXSVIDEO_EVALKIT is not set
++CONFIG_MACH_XXSVIDEOD_EVALKIT=y
++CONFIG_XXSVIDEO_IOEXPANDER=m
++CONFIG_XXSVIDEO_KEYS=m
++CONFIG_XXSVIDEO_SII164=m
++
++#
++# Processor Type
++#
++CONFIG_CPU_32=y
++CONFIG_CPU_ARM926T=y
++CONFIG_CPU_32v5=y
++CONFIG_CPU_ABRT_EV5TJ=y
++CONFIG_CPU_PABRT_NOIFAR=y
++CONFIG_CPU_CACHE_VIVT=y
++CONFIG_CPU_COPY_V4WB=y
++CONFIG_CPU_TLB_V4WBI=y
++CONFIG_CPU_CP15=y
++CONFIG_CPU_CP15_MMU=y
++
++#
++# Processor Features
++#
++CONFIG_ARM_THUMB=y
++# CONFIG_CPU_ICACHE_DISABLE is not set
++# CONFIG_CPU_DCACHE_DISABLE is not set
++# CONFIG_CPU_DCACHE_WRITETHROUGH is not set
++# CONFIG_CPU_CACHE_ROUND_ROBIN is not set
++# CONFIG_OUTER_CACHE is not set
++
++#
++# Bus support
++#
++# CONFIG_PCI_SYSCALL is not set
++# CONFIG_ARCH_SUPPORTS_MSI is not set
++# CONFIG_PCCARD is not set
++
++#
++# Kernel Features
++#
++# CONFIG_TICK_ONESHOT is not set
++# CONFIG_PREEMPT is not set
++CONFIG_HZ=100
++CONFIG_AEABI=y
++CONFIG_OABI_COMPAT=y
++CONFIG_ARCH_FLATMEM_HAS_HOLES=y
++# CONFIG_ARCH_DISCONTIGMEM_ENABLE is not set
++CONFIG_SELECT_MEMORY_MODEL=y
++CONFIG_FLATMEM_MANUAL=y
++# CONFIG_DISCONTIGMEM_MANUAL is not set
++# CONFIG_SPARSEMEM_MANUAL is not set
++CONFIG_FLATMEM=y
++CONFIG_FLAT_NODE_MEM_MAP=y
++# CONFIG_SPARSEMEM_STATIC is not set
++# CONFIG_SPARSEMEM_VMEMMAP_ENABLE is not set
++CONFIG_PAGEFLAGS_EXTENDED=y
++CONFIG_SPLIT_PTLOCK_CPUS=4096
++# CONFIG_RESOURCES_64BIT is not set
++CONFIG_ZONE_DMA_FLAG=1
++CONFIG_BOUNCE=y
++CONFIG_VIRT_TO_BUS=y
++CONFIG_ALIGNMENT_TRAP=y
++
++#
++# Boot options
++#
++CONFIG_ZBOOT_ROM_TEXT=0x0
++CONFIG_ZBOOT_ROM_BSS=0x0
++CONFIG_CMDLINE=""
++# CONFIG_XIP_KERNEL is not set
++# CONFIG_KEXEC is not set
++
++#
++# Floating point emulation
++#
++
++#
++# At least one emulation must be selected
++#
++CONFIG_FPE_NWFPE=y
++# CONFIG_FPE_NWFPE_XP is not set
++# CONFIG_FPE_FASTFPE is not set
++# CONFIG_VFP is not set
++
++#
++# Userspace binary formats
++#
++CONFIG_BINFMT_ELF=y
++# CONFIG_BINFMT_AOUT is not set
++# CONFIG_BINFMT_MISC is not set
++
++#
++# Power management options
++#
++# CONFIG_PM is not set
++CONFIG_ARCH_SUSPEND_POSSIBLE=y
++CONFIG_NET=y
++
++#
++# Networking options
++#
++CONFIG_PACKET=y
++# CONFIG_PACKET_MMAP is not set
++CONFIG_UNIX=y
++CONFIG_XFRM=y
++CONFIG_XFRM_USER=y
++# CONFIG_XFRM_SUB_POLICY is not set
++# CONFIG_XFRM_MIGRATE is not set
++# CONFIG_XFRM_STATISTICS is not set
++CONFIG_NET_KEY=y
++# CONFIG_NET_KEY_MIGRATE is not set
++CONFIG_INET=y
++# CONFIG_IP_MULTICAST is not set
++CONFIG_IP_ADVANCED_ROUTER=y
++CONFIG_ASK_IP_FIB_HASH=y
++# CONFIG_IP_FIB_TRIE is not set
++CONFIG_IP_FIB_HASH=y
++# CONFIG_IP_MULTIPLE_TABLES is not set
++# CONFIG_IP_ROUTE_MULTIPATH is not set
++# CONFIG_IP_ROUTE_VERBOSE is not set
++CONFIG_IP_PNP=y
++CONFIG_IP_PNP_DHCP=y
++CONFIG_IP_PNP_BOOTP=y
++# CONFIG_IP_PNP_RARP is not set
++# CONFIG_NET_IPIP is not set
++# CONFIG_NET_IPGRE is not set
++# CONFIG_ARPD is not set
++# CONFIG_SYN_COOKIES is not set
++# CONFIG_INET_AH is not set
++# CONFIG_INET_ESP is not set
++# CONFIG_INET_IPCOMP is not set
++# CONFIG_INET_XFRM_TUNNEL is not set
++# CONFIG_INET_TUNNEL is not set
++# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
++# CONFIG_INET_XFRM_MODE_TUNNEL is not set
++# CONFIG_INET_XFRM_MODE_BEET is not set
++# CONFIG_INET_LRO is not set
++CONFIG_INET_DIAG=y
++CONFIG_INET_TCP_DIAG=y
++# CONFIG_TCP_CONG_ADVANCED is not set
++CONFIG_TCP_CONG_CUBIC=y
++CONFIG_DEFAULT_TCP_CONG="cubic"
++# CONFIG_TCP_MD5SIG is not set
++# CONFIG_IPV6 is not set
++# CONFIG_NETWORK_SECMARK is not set
++# CONFIG_NETFILTER is not set
++# CONFIG_IP_DCCP is not set
++# CONFIG_IP_SCTP is not set
++# CONFIG_TIPC is not set
++# CONFIG_ATM is not set
++# CONFIG_BRIDGE is not set
++# CONFIG_VLAN_8021Q is not set
++# CONFIG_DECNET is not set
++# CONFIG_LLC2 is not set
++# CONFIG_IPX is not set
++# CONFIG_ATALK is not set
++# CONFIG_X25 is not set
++# CONFIG_LAPB is not set
++# CONFIG_ECONET is not set
++# CONFIG_WAN_ROUTER is not set
++# CONFIG_NET_SCHED is not set
++
++#
++# Network testing
++#
++# CONFIG_NET_PKTGEN is not set
++# CONFIG_HAMRADIO is not set
++# CONFIG_CAN is not set
++# CONFIG_IRDA is not set
++# CONFIG_BT is not set
++# CONFIG_AF_RXRPC is not set
++
++#
++# Wireless
++#
++# CONFIG_CFG80211 is not set
++# CONFIG_WIRELESS_EXT is not set
++# CONFIG_MAC80211 is not set
++# CONFIG_IEEE80211 is not set
++# CONFIG_RFKILL is not set
++# CONFIG_NET_9P is not set
++
++#
++# Device Drivers
++#
++
++#
++# Generic Driver Options
++#
++CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
++CONFIG_STANDALONE=y
++CONFIG_PREVENT_FIRMWARE_BUILD=y
++# CONFIG_FW_LOADER is not set
++# CONFIG_DEBUG_DRIVER is not set
++# CONFIG_DEBUG_DEVRES is not set
++# CONFIG_SYS_HYPERVISOR is not set
++# CONFIG_CONNECTOR is not set
++CONFIG_MTD=y
++# CONFIG_MTD_DEBUG is not set
++CONFIG_MTD_CONCAT=y
++CONFIG_MTD_PARTITIONS=y
++# CONFIG_MTD_REDBOOT_PARTS is not set
++# CONFIG_MTD_CMDLINE_PARTS is not set
++# CONFIG_MTD_AFS_PARTS is not set
++# CONFIG_MTD_AR7_PARTS is not set
++
++#
++# User Modules And Translation Layers
++#
++CONFIG_MTD_CHAR=y
++CONFIG_MTD_BLKDEVS=y
++CONFIG_MTD_BLOCK=y
++# CONFIG_FTL is not set
++# CONFIG_NFTL is not set
++# CONFIG_INFTL is not set
++# CONFIG_RFD_FTL is not set
++# CONFIG_SSFDC is not set
++# CONFIG_MTD_OOPS is not set
++
++#
++# RAM/ROM/Flash chip drivers
++#
++CONFIG_MTD_CFI=y
++# CONFIG_MTD_JEDECPROBE is not set
++CONFIG_MTD_GEN_PROBE=y
++# CONFIG_MTD_CFI_ADV_OPTIONS is not set
++CONFIG_MTD_MAP_BANK_WIDTH_1=y
++CONFIG_MTD_MAP_BANK_WIDTH_2=y
++CONFIG_MTD_MAP_BANK_WIDTH_4=y
++# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
++# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
++# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
++CONFIG_MTD_CFI_I1=y
++CONFIG_MTD_CFI_I2=y
++# CONFIG_MTD_CFI_I4 is not set
++# CONFIG_MTD_CFI_I8 is not set
++# CONFIG_MTD_CFI_INTELEXT is not set
++CONFIG_MTD_CFI_AMDSTD=y
++# CONFIG_MTD_CFI_STAA is not set
++CONFIG_MTD_CFI_UTIL=y
++# CONFIG_MTD_RAM is not set
++# CONFIG_MTD_ROM is not set
++# CONFIG_MTD_ABSENT is not set
++
++#
++# Mapping drivers for chip access
++#
++# CONFIG_MTD_COMPLEX_MAPPINGS is not set
++# CONFIG_MTD_PHYSMAP is not set
++CONFIG_MTD_ARM_INTEGRATOR=y
++# CONFIG_MTD_PLATRAM is not set
++
++#
++# Self-contained MTD device drivers
++#
++# CONFIG_MTD_SLRAM is not set
++# CONFIG_MTD_PHRAM is not set
++# CONFIG_MTD_MTDRAM is not set
++# CONFIG_MTD_BLOCK2MTD is not set
++
++#
++# Disk-On-Chip Device Drivers
++#
++# CONFIG_MTD_DOC2000 is not set
++# CONFIG_MTD_DOC2001 is not set
++# CONFIG_MTD_DOC2001PLUS is not set
++# CONFIG_MTD_NAND is not set
++# CONFIG_MTD_ONENAND is not set
++
++#
++# UBI - Unsorted block images
++#
++# CONFIG_MTD_UBI is not set
++# CONFIG_PARPORT is not set
++CONFIG_BLK_DEV=y
++# CONFIG_BLK_DEV_COW_COMMON is not set
++# CONFIG_BLK_DEV_LOOP is not set
++# CONFIG_BLK_DEV_NBD is not set
++# CONFIG_BLK_DEV_UB is not set
++CONFIG_BLK_DEV_RAM=y
++CONFIG_BLK_DEV_RAM_COUNT=16
++CONFIG_BLK_DEV_RAM_SIZE=8192
++# CONFIG_BLK_DEV_XIP is not set
++# CONFIG_CDROM_PKTCDVD is not set
++# CONFIG_ATA_OVER_ETH is not set
++CONFIG_MISC_DEVICES=y
++# CONFIG_EEPROM_93CX6 is not set
++# CONFIG_ENCLOSURE_SERVICES is not set
++CONFIG_HAVE_IDE=y
++# CONFIG_IDE is not set
++
++#
++# SCSI device support
++#
++# CONFIG_RAID_ATTRS is not set
++CONFIG_SCSI=m
++CONFIG_SCSI_DMA=y
++# CONFIG_SCSI_TGT is not set
++# CONFIG_SCSI_NETLINK is not set
++CONFIG_SCSI_PROC_FS=y
++
++#
++# SCSI support type (disk, tape, CD-ROM)
++#
++CONFIG_BLK_DEV_SD=m
++# CONFIG_CHR_DEV_ST is not set
++# CONFIG_CHR_DEV_OSST is not set
++# CONFIG_BLK_DEV_SR is not set
++# CONFIG_CHR_DEV_SG is not set
++# CONFIG_CHR_DEV_SCH is not set
++
++#
++# Some SCSI devices (e.g. CD jukebox) support multiple LUNs
++#
++# CONFIG_SCSI_MULTI_LUN is not set
++# CONFIG_SCSI_CONSTANTS is not set
++# CONFIG_SCSI_LOGGING is not set
++# CONFIG_SCSI_SCAN_ASYNC is not set
++CONFIG_SCSI_WAIT_SCAN=m
++
++#
++# SCSI Transports
++#
++# CONFIG_SCSI_SPI_ATTRS is not set
++# CONFIG_SCSI_FC_ATTRS is not set
++# CONFIG_SCSI_ISCSI_ATTRS is not set
++# CONFIG_SCSI_SAS_LIBSAS is not set
++# CONFIG_SCSI_SRP_ATTRS is not set
++CONFIG_SCSI_LOWLEVEL=y
++# CONFIG_ISCSI_TCP is not set
++# CONFIG_SCSI_DEBUG is not set
++# CONFIG_SCSI_DH is not set
++# CONFIG_ATA is not set
++# CONFIG_MD is not set
++CONFIG_NETDEVICES=y
++# CONFIG_DUMMY is not set
++# CONFIG_BONDING is not set
++# CONFIG_MACVLAN is not set
++# CONFIG_EQUALIZER is not set
++# CONFIG_TUN is not set
++# CONFIG_VETH is not set
++# CONFIG_PHYLIB is not set
++CONFIG_NET_ETHERNET=y
++CONFIG_MII=y
++# CONFIG_AX88796 is not set
++# CONFIG_SMC91X is not set
++# CONFIG_DM9000 is not set
++CONFIG_SMC911X=y
++# CONFIG_IBM_NEW_EMAC_ZMII is not set
++# CONFIG_IBM_NEW_EMAC_RGMII is not set
++# CONFIG_IBM_NEW_EMAC_TAH is not set
++# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
++# CONFIG_B44 is not set
++# CONFIG_NETDEV_1000 is not set
++# CONFIG_NETDEV_10000 is not set
++
++#
++# Wireless LAN
++#
++# CONFIG_WLAN_PRE80211 is not set
++# CONFIG_WLAN_80211 is not set
++# CONFIG_IWLWIFI_LEDS is not set
++
++#
++# USB Network Adapters
++#
++# CONFIG_USB_CATC is not set
++# CONFIG_USB_KAWETH is not set
++# CONFIG_USB_PEGASUS is not set
++# CONFIG_USB_RTL8150 is not set
++# CONFIG_USB_USBNET is not set
++# CONFIG_WAN is not set
++# CONFIG_PPP is not set
++# CONFIG_SLIP is not set
++# CONFIG_NETCONSOLE is not set
++# CONFIG_NETPOLL is not set
++# CONFIG_NET_POLL_CONTROLLER is not set
++# CONFIG_ISDN is not set
++
++#
++# Input device support
++#
++CONFIG_INPUT=y
++# CONFIG_INPUT_FF_MEMLESS is not set
++# CONFIG_INPUT_POLLDEV is not set
++
++#
++# Userland interfaces
++#
++CONFIG_INPUT_MOUSEDEV=m
++CONFIG_INPUT_MOUSEDEV_PSAUX=y
++CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
++CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
++# CONFIG_INPUT_JOYDEV is not set
++CONFIG_INPUT_EVDEV=m
++# CONFIG_INPUT_EVBUG is not set
++
++#
++# Input Device Drivers
++#
++CONFIG_INPUT_KEYBOARD=y
++CONFIG_KEYBOARD_ATKBD=m
++# CONFIG_KEYBOARD_SUNKBD is not set
++# CONFIG_KEYBOARD_LKKBD is not set
++# CONFIG_KEYBOARD_XTKBD is not set
++# CONFIG_KEYBOARD_NEWTON is not set
++# CONFIG_KEYBOARD_STOWAWAY is not set
++# CONFIG_KEYBOARD_GPIO is not set
++# CONFIG_INPUT_MOUSE is not set
++# CONFIG_INPUT_JOYSTICK is not set
++# CONFIG_INPUT_TABLET is not set
++# CONFIG_INPUT_TOUCHSCREEN is not set
++# CONFIG_INPUT_MISC is not set
++
++#
++# Hardware I/O ports
++#
++CONFIG_SERIO=m
++CONFIG_SERIO_SERPORT=m
++CONFIG_SERIO_LIBPS2=m
++# CONFIG_SERIO_RAW is not set
++# CONFIG_GAMEPORT is not set
++
++#
++# Character devices
++#
++CONFIG_VT=y
++CONFIG_CONSOLE_TRANSLATIONS=y
++CONFIG_VT_CONSOLE=y
++CONFIG_HW_CONSOLE=y
++# CONFIG_VT_HW_CONSOLE_BINDING is not set
++CONFIG_DEVKMEM=y
++# CONFIG_SERIAL_NONSTANDARD is not set
++
++#
++# Serial drivers
++#
++CONFIG_SERIAL_8250=y
++CONFIG_SERIAL_8250_CONSOLE=y
++CONFIG_SERIAL_8250_NR_UARTS=2
++CONFIG_SERIAL_8250_RUNTIME_UARTS=2
++# CONFIG_SERIAL_8250_EXTENDED is not set
++
++#
++# Non-8250 serial port support
++#
++CONFIG_SERIAL_CORE=y
++CONFIG_SERIAL_CORE_CONSOLE=y
++CONFIG_UNIX98_PTYS=y
++# CONFIG_LEGACY_PTYS is not set
++# CONFIG_IPMI_HANDLER is not set
++# CONFIG_HW_RANDOM is not set
++# CONFIG_NVRAM is not set
++# CONFIG_R3964 is not set
++# CONFIG_RAW_DRIVER is not set
++# CONFIG_TCG_TPM is not set
++CONFIG_XXS_C_CAN=m
++# CONFIG_CRYPTOEEPROM is not set
++CONFIG_I2C=m
++CONFIG_I2C_BOARDINFO=y
++CONFIG_I2C_CHARDEV=m
++CONFIG_I2C_HELPER_AUTO=y
++
++#
++# I2C Hardware Bus support
++#
++
++#
++# I2C system bus drivers (mostly embedded / system-on-chip)
++#
++# CONFIG_I2C_GPIO is not set
++# CONFIG_I2C_OCORES is not set
++# CONFIG_I2C_SIMTEC is not set
++
++#
++# External I2C/SMBus adapter drivers
++#
++# CONFIG_I2C_PARPORT_LIGHT is not set
++# CONFIG_I2C_TAOS_EVM is not set
++# CONFIG_I2C_TINY_USB is not set
++
++#
++# Other I2C/SMBus bus drivers
++#
++# CONFIG_I2C_PCA_PLATFORM is not set
++# CONFIG_I2C_STUB is not set
++CONFIG_I2C_XXSVIDEO=m
++
++#
++# Miscellaneous I2C Chip support
++#
++# CONFIG_DS1682 is not set
++# CONFIG_AT24 is not set
++# CONFIG_SENSORS_EEPROM is not set
++# CONFIG_SENSORS_PCF8574 is not set
++# CONFIG_PCF8575 is not set
++# CONFIG_SENSORS_PCA9539 is not set
++# CONFIG_SENSORS_PCF8591 is not set
++# CONFIG_SENSORS_MAX6875 is not set
++# CONFIG_SENSORS_TSL2550 is not set
++# CONFIG_I2C_DEBUG_CORE is not set
++# CONFIG_I2C_DEBUG_ALGO is not set
++# CONFIG_I2C_DEBUG_BUS is not set
++# CONFIG_I2C_DEBUG_CHIP is not set
++# CONFIG_SPI is not set
++# CONFIG_W1 is not set
++# CONFIG_POWER_SUPPLY is not set
++# CONFIG_HWMON is not set
++# CONFIG_WATCHDOG is not set
++
++#
++# Sonics Silicon Backplane
++#
++CONFIG_SSB_POSSIBLE=y
++# CONFIG_SSB is not set
++
++#
++# Multifunction device drivers
++#
++# CONFIG_MFD_CORE is not set
++# CONFIG_MFD_SM501 is not set
++# CONFIG_HTC_PASIC3 is not set
++# CONFIG_MFD_TMIO is not set
++# CONFIG_MFD_T7L66XB is not set
++# CONFIG_MFD_TC6387XB is not set
++
++#
++# Multimedia devices
++#
++
++#
++# Multimedia core support
++#
++CONFIG_VIDEO_DEV=m
++CONFIG_VIDEO_V4L2_COMMON=m
++CONFIG_VIDEO_ALLOW_V4L1=y
++CONFIG_VIDEO_V4L1_COMPAT=y
++# CONFIG_DVB_CORE is not set
++CONFIG_VIDEO_MEDIA=m
++
++#
++# Multimedia drivers
++#
++# CONFIG_MEDIA_ATTACH is not set
++CONFIG_MEDIA_TUNER=m
++# CONFIG_MEDIA_TUNER_CUSTOMIZE is not set
++CONFIG_MEDIA_TUNER_SIMPLE=m
++CONFIG_MEDIA_TUNER_TDA8290=m
++CONFIG_MEDIA_TUNER_TDA9887=m
++CONFIG_MEDIA_TUNER_TEA5761=m
++CONFIG_MEDIA_TUNER_TEA5767=m
++CONFIG_MEDIA_TUNER_MT20XX=m
++CONFIG_MEDIA_TUNER_XC2028=m
++CONFIG_MEDIA_TUNER_XC5000=m
++CONFIG_VIDEO_V4L2=m
++CONFIG_VIDEO_V4L1=m
++CONFIG_VIDEO_CAPTURE_DRIVERS=y
++# CONFIG_VIDEO_ADV_DEBUG is not set
++# CONFIG_VIDEO_HELPER_CHIPS_AUTO is not set
++
++#
++# Encoders/decoders and other helper chips
++#
++
++#
++# Audio decoders
++#
++# CONFIG_VIDEO_TVAUDIO is not set
++# CONFIG_VIDEO_TDA7432 is not set
++# CONFIG_VIDEO_TDA9840 is not set
++# CONFIG_VIDEO_TDA9875 is not set
++# CONFIG_VIDEO_TEA6415C is not set
++# CONFIG_VIDEO_TEA6420 is not set
++# CONFIG_VIDEO_MSP3400 is not set
++# CONFIG_VIDEO_CS5345 is not set
++# CONFIG_VIDEO_CS53L32A is not set
++# CONFIG_VIDEO_M52790 is not set
++# CONFIG_VIDEO_TLV320AIC23B is not set
++# CONFIG_VIDEO_WM8775 is not set
++# CONFIG_VIDEO_WM8739 is not set
++# CONFIG_VIDEO_VP27SMPX is not set
++
++#
++# Video decoders
++#
++# CONFIG_VIDEO_BT819 is not set
++# CONFIG_VIDEO_BT856 is not set
++# CONFIG_VIDEO_BT866 is not set
++# CONFIG_VIDEO_KS0127 is not set
++# CONFIG_VIDEO_OV7670 is not set
++# CONFIG_VIDEO_TCM825X is not set
++# CONFIG_VIDEO_SAA7110 is not set
++# CONFIG_VIDEO_SAA7111 is not set
++# CONFIG_VIDEO_SAA7114 is not set
++CONFIG_VIDEO_SAA711X=m
++# CONFIG_VIDEO_SAA717X is not set
++# CONFIG_VIDEO_SAA7191 is not set
++# CONFIG_VIDEO_TVP5150 is not set
++# CONFIG_VIDEO_VPX3220 is not set
++
++#
++# Video and audio decoders
++#
++# CONFIG_VIDEO_CX25840 is not set
++
++#
++# MPEG video encoders
++#
++# CONFIG_VIDEO_CX2341X is not set
++
++#
++# Video encoders
++#
++# CONFIG_VIDEO_SAA7127 is not set
++# CONFIG_VIDEO_SAA7185 is not set
++# CONFIG_VIDEO_ADV7170 is not set
++# CONFIG_VIDEO_ADV7175 is not set
++
++#
++# Video improvement chips
++#
++# CONFIG_VIDEO_UPD64031A is not set
++# CONFIG_VIDEO_UPD64083 is not set
++# CONFIG_VIDEO_VIVI is not set
++# CONFIG_VIDEO_CPIA is not set
++# CONFIG_VIDEO_CPIA2 is not set
++# CONFIG_VIDEO_SAA5246A is not set
++# CONFIG_VIDEO_SAA5249 is not set
++# CONFIG_TUNER_3036 is not set
++# CONFIG_V4L_USB_DRIVERS is not set
++# CONFIG_SOC_CAMERA is not set
++# CONFIG_VIDEO_SH_MOBILE_CEU is not set
++# CONFIG_RADIO_ADAPTERS is not set
++# CONFIG_DAB is not set
++
++#
++# Graphics support
++#
++# CONFIG_VGASTATE is not set
++# CONFIG_VIDEO_OUTPUT_CONTROL is not set
++CONFIG_FB=y
++# CONFIG_FIRMWARE_EDID is not set
++# CONFIG_FB_DDC is not set
++CONFIG_FB_CFB_FILLRECT=y
++CONFIG_FB_CFB_COPYAREA=y
++CONFIG_FB_CFB_IMAGEBLIT=y
++# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
++# CONFIG_FB_SYS_FILLRECT is not set
++# CONFIG_FB_SYS_COPYAREA is not set
++# CONFIG_FB_SYS_IMAGEBLIT is not set
++# CONFIG_FB_FOREIGN_ENDIAN is not set
++# CONFIG_FB_SYS_FOPS is not set
++# CONFIG_FB_SVGALIB is not set
++# CONFIG_FB_MACMODES is not set
++# CONFIG_FB_BACKLIGHT is not set
++# CONFIG_FB_MODE_HELPERS is not set
++# CONFIG_FB_TILEBLITTING is not set
++
++#
++# Frame buffer hardware drivers
++#
++# CONFIG_FB_S1D13XXX is not set
++CONFIG_FB_XXSVIDEO=y
++# CONFIG_FB_XXSVIDEO_FB0_640_480 is not set
++# CONFIG_FB_XXSVIDEO_FB0_800_480 is not set
++CONFIG_FB_XXSVIDEO_FB0_800_600=y
++# CONFIG_FB_XXSVIDEO_FB0_1024_768 is not set
++# CONFIG_FB_XXSVIDEO_FB0_1280_1024 is not set
++CONFIG_FB_XXSVIDEO_FB1_640_480=y
++# CONFIG_FB_XXSVIDEO_FB1_800_480 is not set
++# CONFIG_FB_XXSVIDEO_FB1_800_600 is not set
++# CONFIG_FB_XXSVIDEO_FB1_1024_768 is not set
++# CONFIG_FB_XXSVIDEO_FB1_1280_1024 is not set
++# CONFIG_FB_VIRTUAL is not set
++# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
++
++#
++# Display device support
++#
++# CONFIG_DISPLAY_SUPPORT is not set
++
++#
++# Console display driver support
++#
++# CONFIG_VGA_CONSOLE is not set
++CONFIG_DUMMY_CONSOLE=y
++CONFIG_FRAMEBUFFER_CONSOLE=y
++# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
++# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
++CONFIG_FONTS=y
++# CONFIG_FONT_8x8 is not set
++CONFIG_FONT_8x16=y
++# CONFIG_FONT_6x11 is not set
++# CONFIG_FONT_7x14 is not set
++# CONFIG_FONT_PEARL_8x8 is not set
++# CONFIG_FONT_ACORN_8x8 is not set
++# CONFIG_FONT_MINI_4x6 is not set
++# CONFIG_FONT_SUN8x16 is not set
++# CONFIG_FONT_SUN12x22 is not set
++# CONFIG_FONT_10x18 is not set
++CONFIG_LOGO=y
++CONFIG_LOGO_LINUX_MONO=y
++CONFIG_LOGO_LINUX_VGA16=y
++CONFIG_LOGO_LINUX_CLUT224=y
++CONFIG_SOUND=m
++CONFIG_SND=m
++CONFIG_SND_TIMER=m
++CONFIG_SND_PCM=m
++# CONFIG_SND_SEQUENCER is not set
++CONFIG_SND_OSSEMUL=y
++CONFIG_SND_MIXER_OSS=m
++CONFIG_SND_PCM_OSS=m
++CONFIG_SND_PCM_OSS_PLUGINS=y
++# CONFIG_SND_DYNAMIC_MINORS is not set
++# CONFIG_SND_SUPPORT_OLD_API is not set
++CONFIG_SND_VERBOSE_PROCFS=y
++CONFIG_SND_VERBOSE_PRINTK=y
++CONFIG_SND_DEBUG=y
++CONFIG_SND_DEBUG_VERBOSE=y
++CONFIG_SND_PCM_XRUN_DEBUG=y
++CONFIG_SND_DRIVERS=y
++# CONFIG_SND_DUMMY is not set
++# CONFIG_SND_MTPAV is not set
++# CONFIG_SND_SERIAL_U16550 is not set
++# CONFIG_SND_MPU401 is not set
++CONFIG_SND_ARM=y
++CONFIG_SND_USB=y
++# CONFIG_SND_USB_AUDIO is not set
++# CONFIG_SND_USB_CAIAQ is not set
++CONFIG_SND_SOC=m
++CONFIG_SND_XXSVIDEO_ALSA_SOC=m
++CONFIG_SND_XXSVIDEO_ALSA_SOC_I2S=m
++CONFIG_SND_XXSVIDEO_ALSA_EVALKIT_CS4245=m
++CONFIG_SND_SOC_CS4245=m
++# CONFIG_SOUND_PRIME is not set
++CONFIG_HID_SUPPORT=y
++CONFIG_HID=y
++CONFIG_HID_DEBUG=y
++# CONFIG_HIDRAW is not set
++
++#
++# USB Input Devices
++#
++CONFIG_USB_HID=y
++# CONFIG_USB_HIDINPUT_POWERBOOK is not set
++# CONFIG_HID_FF is not set
++# CONFIG_USB_HIDDEV is not set
++CONFIG_USB_SUPPORT=y
++CONFIG_USB_ARCH_HAS_HCD=y
++# CONFIG_USB_ARCH_HAS_OHCI is not set
++# CONFIG_USB_ARCH_HAS_EHCI is not set
++CONFIG_USB=y
++CONFIG_USB_DEBUG=y
++# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
++
++#
++# Miscellaneous USB options
++#
++CONFIG_USB_DEVICEFS=y
++# CONFIG_USB_DEVICE_CLASS is not set
++# CONFIG_USB_DYNAMIC_MINORS is not set
++# CONFIG_USB_OTG is not set
++# CONFIG_USB_OTG_WHITELIST is not set
++# CONFIG_USB_OTG_BLACKLIST_HUB is not set
++CONFIG_USB_MON=y
++
++#
++# USB Host Controller Drivers
++#
++# CONFIG_USB_C67X00_HCD is not set
++# CONFIG_USB_ISP116X_HCD is not set
++# CONFIG_USB_SL811_HCD is not set
++# CONFIG_USB_R8A66597_HCD is not set
++
++#
++# USB Device Class drivers
++#
++# CONFIG_USB_ACM is not set
++# CONFIG_USB_PRINTER is not set
++# CONFIG_USB_WDM is not set
++
++#
++# NOTE: USB_STORAGE enables SCSI, and 'SCSI disk support'
++#
++
++#
++# may also be needed; see USB_STORAGE Help for more information
++#
++CONFIG_USB_STORAGE=m
++# CONFIG_USB_STORAGE_DEBUG is not set
++# CONFIG_USB_STORAGE_DATAFAB is not set
++# CONFIG_USB_STORAGE_FREECOM is not set
++# CONFIG_USB_STORAGE_ISD200 is not set
++# CONFIG_USB_STORAGE_DPCM is not set
++# CONFIG_USB_STORAGE_USBAT is not set
++# CONFIG_USB_STORAGE_SDDR09 is not set
++# CONFIG_USB_STORAGE_SDDR55 is not set
++# CONFIG_USB_STORAGE_JUMPSHOT is not set
++# CONFIG_USB_STORAGE_ALAUDA is not set
++# CONFIG_USB_STORAGE_ONETOUCH is not set
++# CONFIG_USB_STORAGE_KARMA is not set
++# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
++# CONFIG_USB_LIBUSUAL is not set
++
++#
++# USB Imaging devices
++#
++# CONFIG_USB_MDC800 is not set
++# CONFIG_USB_MICROTEK is not set
++
++#
++# USB port drivers
++#
++CONFIG_USB_SERIAL=m
++# CONFIG_USB_EZUSB is not set
++CONFIG_USB_SERIAL_GENERIC=y
++# CONFIG_USB_SERIAL_AIRCABLE is not set
++# CONFIG_USB_SERIAL_ARK3116 is not set
++# CONFIG_USB_SERIAL_BELKIN is not set
++# CONFIG_USB_SERIAL_CH341 is not set
++# CONFIG_USB_SERIAL_WHITEHEAT is not set
++# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
++# CONFIG_USB_SERIAL_CP2101 is not set
++# CONFIG_USB_SERIAL_CYPRESS_M8 is not set
++# CONFIG_USB_SERIAL_EMPEG is not set
++# CONFIG_USB_SERIAL_FTDI_SIO is not set
++# CONFIG_USB_SERIAL_FUNSOFT is not set
++# CONFIG_USB_SERIAL_VISOR is not set
++# CONFIG_USB_SERIAL_IPAQ is not set
++# CONFIG_USB_SERIAL_IR is not set
++# CONFIG_USB_SERIAL_EDGEPORT is not set
++# CONFIG_USB_SERIAL_EDGEPORT_TI is not set
++# CONFIG_USB_SERIAL_GARMIN is not set
++# CONFIG_USB_SERIAL_IPW is not set
++# CONFIG_USB_SERIAL_IUU is not set
++# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
++# CONFIG_USB_SERIAL_KEYSPAN is not set
++# CONFIG_USB_SERIAL_KLSI is not set
++# CONFIG_USB_SERIAL_KOBIL_SCT is not set
++# CONFIG_USB_SERIAL_MCT_U232 is not set
++# CONFIG_USB_SERIAL_MOS7720 is not set
++# CONFIG_USB_SERIAL_MOS7840 is not set
++# CONFIG_USB_SERIAL_MOTOROLA is not set
++# CONFIG_USB_SERIAL_NAVMAN is not set
++CONFIG_USB_SERIAL_PL2303=m
++# CONFIG_USB_SERIAL_OTI6858 is not set
++# CONFIG_USB_SERIAL_SPCP8X5 is not set
++# CONFIG_USB_SERIAL_HP4X is not set
++# CONFIG_USB_SERIAL_SAFE is not set
++# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
++# CONFIG_USB_SERIAL_TI is not set
++# CONFIG_USB_SERIAL_CYBERJACK is not set
++# CONFIG_USB_SERIAL_XIRCOM is not set
++# CONFIG_USB_SERIAL_OPTION is not set
++# CONFIG_USB_SERIAL_OMNINET is not set
++# CONFIG_USB_SERIAL_DEBUG is not set
++
++#
++# USB Miscellaneous drivers
++#
++# CONFIG_USB_EMI62 is not set
++# CONFIG_USB_EMI26 is not set
++# CONFIG_USB_ADUTUX is not set
++# CONFIG_USB_RIO500 is not set
++# CONFIG_USB_LEGOTOWER is not set
++# CONFIG_USB_LCD is not set
++# CONFIG_USB_BERRY_CHARGE is not set
++# CONFIG_USB_LED is not set
++# CONFIG_USB_CYPRESS_CY7C63 is not set
++# CONFIG_USB_CYTHERM is not set
++# CONFIG_USB_PHIDGET is not set
++# CONFIG_USB_IDMOUSE is not set
++# CONFIG_USB_FTDI_ELAN is not set
++# CONFIG_USB_APPLEDISPLAY is not set
++# CONFIG_USB_LD is not set
++# CONFIG_USB_TRANCEVIBRATOR is not set
++# CONFIG_USB_IOWARRIOR is not set
++# CONFIG_USB_TEST is not set
++# CONFIG_USB_ISIGHTFW is not set
++# CONFIG_USB_GADGET is not set
++# CONFIG_MMC is not set
++CONFIG_NEW_LEDS=y
++CONFIG_LEDS_CLASS=y
++
++#
++# LED drivers
++#
++# CONFIG_LEDS_PCA9532 is not set
++# CONFIG_LEDS_GPIO is not set
++# CONFIG_LEDS_PCA955X is not set
++CONFIG_LEDS_XXSVIDEO_JADEEVALKIT=m
++
++#
++# LED Triggers
++#
++# CONFIG_LEDS_TRIGGERS is not set
++CONFIG_RTC_LIB=y
++CONFIG_RTC_CLASS=m
++
++#
++# RTC interfaces
++#
++CONFIG_RTC_INTF_SYSFS=y
++CONFIG_RTC_INTF_PROC=y
++CONFIG_RTC_INTF_DEV=y
++# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
++# CONFIG_RTC_DRV_TEST is not set
++
++#
++# I2C RTC drivers
++#
++# CONFIG_RTC_DRV_DS1307 is not set
++# CONFIG_RTC_DRV_DS1374 is not set
++# CONFIG_RTC_DRV_DS1672 is not set
++# CONFIG_RTC_DRV_MAX6900 is not set
++# CONFIG_RTC_DRV_RS5C372 is not set
++# CONFIG_RTC_DRV_ISL1208 is not set
++# CONFIG_RTC_DRV_X1205 is not set
++# CONFIG_RTC_DRV_PCF8563 is not set
++# CONFIG_RTC_DRV_PCF8583 is not set
++CONFIG_RTC_DRV_M41T80=m
++# CONFIG_RTC_DRV_M41T80_WDT is not set
++# CONFIG_RTC_DRV_S35390A is not set
++# CONFIG_RTC_DRV_FM3130 is not set
++
++#
++# SPI RTC drivers
++#
++
++#
++# Platform RTC drivers
++#
++# CONFIG_RTC_DRV_CMOS is not set
++# CONFIG_RTC_DRV_DS1511 is not set
++# CONFIG_RTC_DRV_DS1553 is not set
++# CONFIG_RTC_DRV_DS1742 is not set
++# CONFIG_RTC_DRV_STK17TA8 is not set
++# CONFIG_RTC_DRV_M48T86 is not set
++# CONFIG_RTC_DRV_M48T59 is not set
++# CONFIG_RTC_DRV_V3020 is not set
++
++#
++# on-CPU RTC drivers
++#
++# CONFIG_DMADEVICES is not set
++
++#
++# Voltage and Current regulators
++#
++# CONFIG_REGULATOR is not set
++# CONFIG_REGULATOR_FIXED_VOLTAGE is not set
++# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
++# CONFIG_REGULATOR_BQ24022 is not set
++# CONFIG_UIO is not set
++
++#
++# File systems
++#
++CONFIG_EXT2_FS=m
++# CONFIG_EXT2_FS_XATTR is not set
++# CONFIG_EXT2_FS_XIP is not set
++CONFIG_EXT3_FS=m
++CONFIG_EXT3_FS_XATTR=y
++# CONFIG_EXT3_FS_POSIX_ACL is not set
++# CONFIG_EXT3_FS_SECURITY is not set
++# CONFIG_EXT4DEV_FS is not set
++CONFIG_JBD=m
++CONFIG_FS_MBCACHE=m
++# CONFIG_REISERFS_FS is not set
++# CONFIG_JFS_FS is not set
++# CONFIG_FS_POSIX_ACL is not set
++# CONFIG_XFS_FS is not set
++# CONFIG_OCFS2_FS is not set
++CONFIG_DNOTIFY=y
++CONFIG_INOTIFY=y
++CONFIG_INOTIFY_USER=y
++# CONFIG_QUOTA is not set
++# CONFIG_AUTOFS_FS is not set
++# CONFIG_AUTOFS4_FS is not set
++# CONFIG_FUSE_FS is not set
++
++#
++# CD-ROM/DVD Filesystems
++#
++# CONFIG_ISO9660_FS is not set
++# CONFIG_UDF_FS is not set
++
++#
++# DOS/FAT/NT Filesystems
++#
++CONFIG_FAT_FS=m
++# CONFIG_MSDOS_FS is not set
++CONFIG_VFAT_FS=m
++CONFIG_FAT_DEFAULT_CODEPAGE=437
++CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
++CONFIG_NTFS_FS=m
++# CONFIG_NTFS_DEBUG is not set
++# CONFIG_NTFS_RW is not set
++
++#
++# Pseudo filesystems
++#
++CONFIG_PROC_FS=y
++CONFIG_PROC_SYSCTL=y
++CONFIG_SYSFS=y
++CONFIG_TMPFS=y
++# CONFIG_TMPFS_POSIX_ACL is not set
++# CONFIG_HUGETLB_PAGE is not set
++# CONFIG_CONFIGFS_FS is not set
++
++#
++# Miscellaneous filesystems
++#
++# CONFIG_ADFS_FS is not set
++# CONFIG_AFFS_FS is not set
++# CONFIG_HFS_FS is not set
++# CONFIG_HFSPLUS_FS is not set
++# CONFIG_BEFS_FS is not set
++# CONFIG_BFS_FS is not set
++# CONFIG_EFS_FS is not set
++CONFIG_JFFS2_FS=y
++CONFIG_JFFS2_FS_DEBUG=0
++# CONFIG_JFFS2_FS_WRITEBUFFER is not set
++# CONFIG_JFFS2_SUMMARY is not set
++# CONFIG_JFFS2_FS_XATTR is not set
++CONFIG_JFFS2_COMPRESSION_OPTIONS=y
++CONFIG_JFFS2_ZLIB=y
++# CONFIG_JFFS2_LZO is not set
++CONFIG_JFFS2_RTIME=y
++# CONFIG_JFFS2_RUBIN is not set
++# CONFIG_JFFS2_CMODE_NONE is not set
++CONFIG_JFFS2_CMODE_PRIORITY=y
++# CONFIG_JFFS2_CMODE_SIZE is not set
++# CONFIG_JFFS2_CMODE_FAVOURLZO is not set
++# CONFIG_CRAMFS is not set
++# CONFIG_VXFS_FS is not set
++# CONFIG_MINIX_FS is not set
++# CONFIG_OMFS_FS is not set
++# CONFIG_HPFS_FS is not set
++# CONFIG_QNX4FS_FS is not set
++# CONFIG_ROMFS_FS is not set
++# CONFIG_SYSV_FS is not set
++# CONFIG_UFS_FS is not set
++CONFIG_NETWORK_FILESYSTEMS=y
++CONFIG_NFS_FS=y
++CONFIG_NFS_V3=y
++# CONFIG_NFS_V3_ACL is not set
++# CONFIG_NFS_V4 is not set
++CONFIG_ROOT_NFS=y
++# CONFIG_NFSD is not set
++CONFIG_LOCKD=y
++CONFIG_LOCKD_V4=y
++CONFIG_NFS_COMMON=y
++CONFIG_SUNRPC=y
++# CONFIG_RPCSEC_GSS_KRB5 is not set
++# CONFIG_RPCSEC_GSS_SPKM3 is not set
++# CONFIG_SMB_FS is not set
++# CONFIG_CIFS is not set
++# CONFIG_NCP_FS is not set
++# CONFIG_CODA_FS is not set
++# CONFIG_AFS_FS is not set
++
++#
++# Partition Types
++#
++# CONFIG_PARTITION_ADVANCED is not set
++CONFIG_MSDOS_PARTITION=y
++CONFIG_NLS=y
++CONFIG_NLS_DEFAULT="iso8859-1"
++CONFIG_NLS_CODEPAGE_437=y
++# CONFIG_NLS_CODEPAGE_737 is not set
++# CONFIG_NLS_CODEPAGE_775 is not set
++CONFIG_NLS_CODEPAGE_850=y
++# CONFIG_NLS_CODEPAGE_852 is not set
++# CONFIG_NLS_CODEPAGE_855 is not set
++# CONFIG_NLS_CODEPAGE_857 is not set
++# CONFIG_NLS_CODEPAGE_860 is not set
++# CONFIG_NLS_CODEPAGE_861 is not set
++# CONFIG_NLS_CODEPAGE_862 is not set
++# CONFIG_NLS_CODEPAGE_863 is not set
++# CONFIG_NLS_CODEPAGE_864 is not set
++# CONFIG_NLS_CODEPAGE_865 is not set
++# CONFIG_NLS_CODEPAGE_866 is not set
++# CONFIG_NLS_CODEPAGE_869 is not set
++# CONFIG_NLS_CODEPAGE_936 is not set
++# CONFIG_NLS_CODEPAGE_950 is not set
++# CONFIG_NLS_CODEPAGE_932 is not set
++# CONFIG_NLS_CODEPAGE_949 is not set
++# CONFIG_NLS_CODEPAGE_874 is not set
++# CONFIG_NLS_ISO8859_8 is not set
++# CONFIG_NLS_CODEPAGE_1250 is not set
++# CONFIG_NLS_CODEPAGE_1251 is not set
++# CONFIG_NLS_ASCII is not set
++CONFIG_NLS_ISO8859_1=y
++# CONFIG_NLS_ISO8859_2 is not set
++# CONFIG_NLS_ISO8859_3 is not set
++# CONFIG_NLS_ISO8859_4 is not set
++# CONFIG_NLS_ISO8859_5 is not set
++# CONFIG_NLS_ISO8859_6 is not set
++# CONFIG_NLS_ISO8859_7 is not set
++# CONFIG_NLS_ISO8859_9 is not set
++# CONFIG_NLS_ISO8859_13 is not set
++# CONFIG_NLS_ISO8859_14 is not set
++# CONFIG_NLS_ISO8859_15 is not set
++# CONFIG_NLS_KOI8_R is not set
++# CONFIG_NLS_KOI8_U is not set
++# CONFIG_NLS_UTF8 is not set
++# CONFIG_DLM is not set
++
++#
++# Kernel hacking
++#
++# CONFIG_PRINTK_TIME is not set
++CONFIG_ENABLE_WARN_DEPRECATED=y
++CONFIG_ENABLE_MUST_CHECK=y
++CONFIG_FRAME_WARN=1024
++# CONFIG_MAGIC_SYSRQ is not set
++# CONFIG_UNUSED_SYMBOLS is not set
++# CONFIG_DEBUG_FS is not set
++# CONFIG_HEADERS_CHECK is not set
++CONFIG_DEBUG_KERNEL=y
++# CONFIG_DEBUG_SHIRQ is not set
++CONFIG_DETECT_SOFTLOCKUP=y
++# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
++CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=0
++CONFIG_SCHED_DEBUG=y
++# CONFIG_SCHEDSTATS is not set
++# CONFIG_TIMER_STATS is not set
++# CONFIG_DEBUG_OBJECTS is not set
++# CONFIG_DEBUG_SLAB is not set
++# CONFIG_DEBUG_RT_MUTEXES is not set
++# CONFIG_RT_MUTEX_TESTER is not set
++# CONFIG_DEBUG_SPINLOCK is not set
++# CONFIG_DEBUG_MUTEXES is not set
++# CONFIG_DEBUG_LOCK_ALLOC is not set
++# CONFIG_PROVE_LOCKING is not set
++# CONFIG_LOCK_STAT is not set
++# CONFIG_DEBUG_SPINLOCK_SLEEP is not set
++# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
++# CONFIG_DEBUG_KOBJECT is not set
++# CONFIG_DEBUG_BUGVERBOSE is not set
++# CONFIG_DEBUG_INFO is not set
++# CONFIG_DEBUG_VM is not set
++# CONFIG_DEBUG_WRITECOUNT is not set
++# CONFIG_DEBUG_MEMORY_INIT is not set
++# CONFIG_DEBUG_LIST is not set
++# CONFIG_DEBUG_SG is not set
++CONFIG_FRAME_POINTER=y
++# CONFIG_BOOT_PRINTK_DELAY is not set
++# CONFIG_RCU_TORTURE_TEST is not set
++# CONFIG_BACKTRACE_SELF_TEST is not set
++# CONFIG_FAULT_INJECTION is not set
++# CONFIG_LATENCYTOP is not set
++# CONFIG_SYSCTL_SYSCALL_CHECK is not set
++CONFIG_HAVE_FTRACE=y
++CONFIG_HAVE_DYNAMIC_FTRACE=y
++# CONFIG_FTRACE is not set
++# CONFIG_SCHED_TRACER is not set
++# CONFIG_CONTEXT_SWITCH_TRACER is not set
++# CONFIG_SAMPLES is not set
++CONFIG_HAVE_ARCH_KGDB=y
++# CONFIG_KGDB is not set
++CONFIG_DEBUG_USER=y
++# CONFIG_DEBUG_ERRORS is not set
++# CONFIG_DEBUG_STACK_USAGE is not set
++CONFIG_DEBUG_LL=y
++# CONFIG_DEBUG_ICEDCC is not set
++
++#
++# Security options
++#
++# CONFIG_KEYS is not set
++# CONFIG_SECURITY is not set
++# CONFIG_SECURITY_FILE_CAPABILITIES is not set
++CONFIG_CRYPTO=y
++
++#
++# Crypto core or helper
++#
++# CONFIG_CRYPTO_MANAGER is not set
++# CONFIG_CRYPTO_GF128MUL is not set
++# CONFIG_CRYPTO_NULL is not set
++# CONFIG_CRYPTO_CRYPTD is not set
++# CONFIG_CRYPTO_AUTHENC is not set
++# CONFIG_CRYPTO_TEST is not set
++
++#
++# Authenticated Encryption with Associated Data
++#
++# CONFIG_CRYPTO_CCM is not set
++# CONFIG_CRYPTO_GCM is not set
++# CONFIG_CRYPTO_SEQIV is not set
++
++#
++# Block modes
++#
++# CONFIG_CRYPTO_CBC is not set
++# CONFIG_CRYPTO_CTR is not set
++# CONFIG_CRYPTO_CTS is not set
++# CONFIG_CRYPTO_ECB is not set
++# CONFIG_CRYPTO_LRW is not set
++# CONFIG_CRYPTO_PCBC is not set
++# CONFIG_CRYPTO_XTS is not set
++
++#
++# Hash modes
++#
++# CONFIG_CRYPTO_HMAC is not set
++# CONFIG_CRYPTO_XCBC is not set
++
++#
++# Digest
++#
++# CONFIG_CRYPTO_CRC32C is not set
++# CONFIG_CRYPTO_MD4 is not set
++# CONFIG_CRYPTO_MD5 is not set
++# CONFIG_CRYPTO_MICHAEL_MIC is not set
++# CONFIG_CRYPTO_RMD128 is not set
++# CONFIG_CRYPTO_RMD160 is not set
++# CONFIG_CRYPTO_RMD256 is not set
++# CONFIG_CRYPTO_RMD320 is not set
++# CONFIG_CRYPTO_SHA1 is not set
++# CONFIG_CRYPTO_SHA256 is not set
++# CONFIG_CRYPTO_SHA512 is not set
++# CONFIG_CRYPTO_TGR192 is not set
++# CONFIG_CRYPTO_WP512 is not set
++
++#
++# Ciphers
++#
++# CONFIG_CRYPTO_AES is not set
++# CONFIG_CRYPTO_ANUBIS is not set
++# CONFIG_CRYPTO_ARC4 is not set
++# CONFIG_CRYPTO_BLOWFISH is not set
++# CONFIG_CRYPTO_CAMELLIA is not set
++# CONFIG_CRYPTO_CAST5 is not set
++# CONFIG_CRYPTO_CAST6 is not set
++# CONFIG_CRYPTO_DES is not set
++# CONFIG_CRYPTO_FCRYPT is not set
++# CONFIG_CRYPTO_KHAZAD is not set
++# CONFIG_CRYPTO_SALSA20 is not set
++# CONFIG_CRYPTO_SEED is not set
++# CONFIG_CRYPTO_SERPENT is not set
++# CONFIG_CRYPTO_TEA is not set
++# CONFIG_CRYPTO_TWOFISH is not set
++
++#
++# Compression
++#
++# CONFIG_CRYPTO_DEFLATE is not set
++# CONFIG_CRYPTO_LZO is not set
++CONFIG_CRYPTO_HW=y
++
++#
++# Library routines
++#
++CONFIG_BITREVERSE=y
++# CONFIG_GENERIC_FIND_FIRST_BIT is not set
++# CONFIG_GENERIC_FIND_NEXT_BIT is not set
++# CONFIG_CRC_CCITT is not set
++# CONFIG_CRC16 is not set
++# CONFIG_CRC_T10DIF is not set
++# CONFIG_CRC_ITU_T is not set
++CONFIG_CRC32=y
++# CONFIG_CRC7 is not set
++# CONFIG_LIBCRC32C is not set
++CONFIG_ZLIB_INFLATE=y
++CONFIG_ZLIB_DEFLATE=y
++CONFIG_PLIST=y
++CONFIG_HAS_IOMEM=y
++CONFIG_HAS_IOPORT=y
++CONFIG_HAS_DMA=y
+--- linux-2.6.27.21/drivers/net/Kconfig	2009-03-23 22:04:09.000000000 +0000
++++ linux-2.6.27.21-dev/drivers/net/Kconfig	2009-11-20 05:21:56.000000000 +0000
+@@ -960,7 +960,7 @@
+ 	tristate "SMSC LAN911[5678] support"
+ 	select CRC32
+ 	select MII
+-	depends on ARCH_PXA || SUPERH
++	depends on ARCH_PXA || SUPERH || MACH_XXSVIDEO || MACH_XXSVIDEOD
+ 	help
+ 	  This is a driver for SMSC's LAN911x series of Ethernet chipsets
+ 	  including the new LAN9115, LAN9116, LAN9117, and LAN9118.
+--- linux-2.6.27.21/drivers/net/smc911x.h	2009-03-23 22:04:09.000000000 +0000
++++ linux-2.6.27.21-dev/drivers/net/smc911x.h	2009-11-20 05:22:07.000000000 +0000
+@@ -38,7 +38,8 @@
+   #define SMC_USE_16BIT		0
+   #define SMC_USE_32BIT		1
+   #define SMC_IRQ_SENSE		IRQF_TRIGGER_FALLING
+-#elif defined(CONFIG_SH_MAGIC_PANEL_R2)
++#elif defined(CONFIG_SH_MAGIC_PANEL_R2) || \
++      defined(CONFIG_MACH_XXSVIDEO) || defined(CONFIG_MACH_XXSVIDEOD)
+   #define SMC_USE_16BIT		0
+   #define SMC_USE_32BIT		1
+   #define SMC_IRQ_SENSE		IRQF_TRIGGER_LOW
+@@ -670,6 +671,7 @@
+ #define CHIP_9116	0x116
+ #define CHIP_9117	0x117
+ #define CHIP_9118	0x118
++#define CHIP_9118a	0x118a
+ 
+ struct chip_id {
+ 	u16 id;
+@@ -681,6 +683,7 @@
+ 	{ CHIP_9116, "LAN9116" },
+ 	{ CHIP_9117, "LAN9117" },
+ 	{ CHIP_9118, "LAN9118" },
++	{ CHIP_9118a, "LAN9118a" },
+ 	{ 0, NULL },
+ };
+ 
+--- linux-2.6.27/drivers/mtd/maps/integrator-flash.c	2009-01-08 10:49:43.000000000 +0100
++++ linux-2.6.27-dev/drivers/mtd/maps/integrator-flash.c	2009-03-01 09:50:05.000000000 +0100
+@@ -41,11 +41,6 @@
+ #include <asm/io.h>
+ #include <asm/system.h>
+ 
+-#ifdef CONFIG_ARCH_P720T
+-#define FLASH_BASE		(0x04000000)
+-#define FLASH_SIZE		(64*1024*1024)
+-#endif
+-
+ struct armflash_info {
+ 	struct flash_platform_data *plat;
+ 	struct resource		*res;
+@@ -123,12 +118,12 @@
+ 
+ 	info->mtd->owner = THIS_MODULE;
+ 
+-	err = parse_mtd_partitions(info->mtd, probes, &info->parts, 0);
+-	if (err > 0) {
+-		err = add_mtd_partitions(info->mtd, info->parts, err);
+-		if (err)
+-			printk(KERN_ERR
+-			       "mtd partition registration failed: %d\n", err);
++	if (plat->parts) {
++		err = add_mtd_partitions(info->mtd, plat->parts, plat->nr_parts);
++	} else {
++		err = parse_mtd_partitions(info->mtd, probes, &info->parts, 0);
++		if (err > 0)
++			err = add_mtd_partitions(info->mtd, info->parts, err);
+ 	}
+ 
+ 	if (err == 0)
+--- linux-2.6.27/arch/arm/mach-xxsvideo/include/mach/board.h	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/arch/arm/mach-xxsvideo/include/mach/board.h	2009-02-25 13:05:21.000000000 +0100
+@@ -0,0 +1,135 @@
++/*
++ * include/asm-arm/arch-xxsvideo/board.h
++ *
++ *  Copyright (C) 2005 HP Labs
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
++ */
++
++/*
++ * These are data structures found in platform_device.dev.platform_data,
++ * and describing board-specific data needed by drivers.  For example,
++ * which pin is used for a given GPIO role.
++ *
++ * In 2.6, drivers should strongly avoid board-specific knowledge so
++ * that supporting new boards normally won't require driver patches.
++ * Most board-specific knowledge should be in arch/.../board-*.c files.
++ */
++
++#ifndef __ASM_ARCH_BOARD_H
++#define __ASM_ARCH_BOARD_H
++
++#include <linux/mtd/partitions.h>
++#include <linux/device.h>
++#include <linux/spi/spi.h>
++
++ /* USB Device */
++struct xxsvideo_udc_data {
++	u8	vbus_pin;		/* high == host powering us */
++	u8	pullup_pin;		/* high == D+ pulled up */
++};
++extern void __init xxsvideo_add_device_udc(struct xxsvideo_udc_data *data);
++
++ /* Compact Flash */
++struct xxsvideo_cf_data {
++	u8	irq_pin;		/* I/O IRQ */
++	u8	det_pin;		/* Card detect */
++	u8	vcc_pin;		/* power switching */
++	u8	rst_pin;		/* card reset */
++	u8	chipselect;		/* EBI Chip Select number */
++};
++extern void __init xxsvideo_add_device_cf(struct xxsvideo_cf_data *data);
++
++ /* MMC / SD */
++struct xxsvideo_mmc_data {
++	u8		det_pin;	/* card detect IRQ */
++	unsigned	slot_b:1;	/* uses Slot B */
++	unsigned	wire4:1;	/* (SD) supports DAT0..DAT3 */
++	u8		wp_pin;		/* (SD) writeprotect detect */
++	u8		vcc_pin;	/* power switching (high == on) */
++};
++extern void __init xxsvideo_add_device_mmc(short mmc_id, struct xxsvideo_mmc_data *data);
++
++ /* Ethernet (EMAC & MACB) */
++struct xxsvideo_eth_data {
++	u8		phy_irq_pin;	/* PHY IRQ */
++	u8		is_rmii;	/* using RMII interface? */
++};
++extern void __init xxsvideo_add_device_eth(struct xxsvideo_eth_data *data);
++
++ /* USB Host */
++struct xxsvideo_usbh_data {
++	u8		ports;		/* number of ports on root hub */
++	u8		vbus_pin[];	/* port power-control pin */
++};
++
++ /* NAND / SmartMedia */
++struct xxsvideo_nand_data {
++	u8		enable_pin;	/* chip enable */
++	u8		det_pin;	/* card detect */
++	u8		rdy_pin;	/* ready/busy */
++	u8		ale;		/* address line number connected to ALE */
++	u8		cle;		/* address line number connected to CLE */
++	u8		bus_width_16;	/* buswidth is 16 bit */
++	struct mtd_partition* (*partition_info)(int, int*);
++};
++extern void __init xxsvideo_add_device_nand(struct xxsvideo_nand_data *data);
++
++ /* NOR Flash*/
++extern void __init xxsvideo_add_device_nor(void);
++
++ /* I2C*/
++extern void __init xxsvideo_add_device_i2c(void);
++
++ /* SPI */
++extern void __init xxsvideo_add_device_spi(struct spi_board_info *devices, int nr_devices);
++
++ /* Serial */
++extern void __init xxsvideo_add_device_serial(void);
++
++ /* USB OHCI */
++extern void __init xxsvideo_add_device_usbh_ohci(void);
++
++ /* USB EHCI */
++extern void __init xxsvideo_add_device_usbh_ehci(void);
++
++ /* Crypto-Eeprom */
++extern void __init xxsvideo_add_device_cryptoeeprom(void);
++
++/* LCD Controller */
++struct atmel_lcdfb_info;
++extern void __init xxsvideo_add_device_lcdc(struct atmel_lcdfb_info *data);
++
++ /* AC97 */
++struct atmel_ac97_data {
++	u8		reset_pin;	/* reset */
++};
++extern void __init xxsvideo_add_device_ac97(struct atmel_ac97_data *data);
++
++ /* LEDs */
++extern u8 xxsvideo_leds_cpu;
++extern u8 xxsvideo_leds_timer;
++extern void __init xxsvideo_init_leds(u8 cpu_led, u8 timer_led);
++
++extern void __init xxsvideo_gpio_irq_setup(void);
++
++/* system device classes */
++
++// extern struct sysdev_class xxsvideo_sysclass;
++
++extern struct sys_timer xxsvideo_timer;
++
++
++#endif
+--- linux-2.6.27/arch/arm/mach-xxsvideo/include/mach/debug-macro.S	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/arch/arm/mach-xxsvideo/include/mach/debug-macro.S	2009-01-08 10:49:39.000000000 +0100
+@@ -0,0 +1,49 @@
++/*
++ * linux/include/asm-arm/arch-xxsvideo/debug-macro.S
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Carsten Schneider <cs@mycable.de>, Tiemo Krueger <tk@mycable.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++#include <mach/platform.h>
++
++                .macro  addruart,rx
++                mrc     p15, 0, \rx, c1, c0
++                tst     \rx, #1                 @ MMU enabled?
++		ldreq	\rx, = JADE_UART0_PHYS_BASE
++		ldrne	\rx, = JADE_UART0_BASE
++                .endm
++
++#define UART_SHIFT	2
++#include <asm/hardware/debug-8250.S>
++
++/*
++                .macro  addruart,rx
++                mrc     p15, 0, \rx, c1, c0
++                tst     \rx, #1                 @ MMU enabled?
++                mov     \rx, #0xf0000000        @ virtual base
++                sub     \rx, \rx, #0x1f000
++                addne   \rx, \rx, #0x10000000   @ physical base
++                .endm
++
++                .macro  senduart,rd,rx
++                strb    \rd, [\rx, #0]
++                .endm
++
++                .macro  waituart,rd,rx
++1001:           ldr     \rd, [\rx, #0x8]       @ UARTFLG
++                tst     \rd, #1 << 1           @ UARTFLGUFFNE - 1 when FIFO not empty
++                bne     1001b
++                .endm
++
++                .macro  busyuart,rd,rx
++1001:           ldr     \rd, [\rx, #0x8]       @ UARTFLG
++                tst     \rd, #1 << 1           @ UARTFLGUFFNE - 1 when FIFO not empty
++                bne     1001b
++                .endm
++*/
+--- linux-2.6.27.21/arch/arm/mach-xxsvideo/include/mach/dma.h	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/mach-xxsvideo/include/mach/dma.h	2009-10-16 14:26:05.000000000 +0000
+@@ -0,0 +1,450 @@
++/*
++ * linux/include/asm-arm/arch-xxsvideo/dma.h
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Carsten Schneider <cs@mycable.de>, Tiemo Krueger <tk@mycable.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++#ifndef __ASM_ARCH_DMA_H
++#define __ASM_ARCH_DMA_H
++
++#include <linux/sysdev.h>
++#include "hardware.h"
++
++#define MAX_DMA_ADDRESS		0xffffffff
++
++/* we have 8 dma channels */
++#define JADE_DMA_CHANNELS	(8)
++//#define MAX_DMA_CHANNELS	JADE_DMA_CHANNELS
++#define DMA_CH_VALID		(1<<31)
++#define DMA_CH_NEVER		(1<<30)
++
++/*
++ * This is the maximum DMA address(physical address) that can be DMAd to.
++ *
++ */
++//#define MAX_DMA_ADDRESS		0x40000000
++// #define MAX_DMA_TRANSFER_SIZE   0x100000 /* Data Unit is half word  */
++
++/* We use `virtual` dma channels to hide the fact we have only a limited
++ * number of DMA channels, and not of all of them (dependant on the device)
++ * can be attached to any DMA source. We therefore let the DMA core handle
++ * the allocation of hardware channels to clients.
++*/
++
++enum dma_ch {
++	DMACH_I2S0_OUT,
++	DMACH_I2S0_IN,
++	DMACH_I2S1_OUT,
++	DMACH_I2S1_IN,
++	DMACH_MAX,		/* the end entry */
++};
++#define DMACH_LOW_LEVEL	(1<<28)	/* use this to specifiy hardware ch no */
++
++/* types */
++
++enum xxsvideo_dma_state {
++	XXSVIDEO_DMA_IDLE,
++	XXSVIDEO_DMA_RUNNING,
++	XXSVIDEO_DMA_PAUSED
++};
++
++
++/* enum xxsvideo_dma_loadst
++ *
++ * This represents the state of the DMA engine, wrt to the loaded / running
++ * transfers. Since we don't have any way of knowing exactly the state of
++ * the DMA transfers, we need to know the state to make decisions on wether
++ * we can
++ *
++ * XXSVIDEO_DMA_NONE
++ *
++ * There are no buffers loaded.
++ *
++ * XXSVIDEO_DMA_RUNNING
++ *
++ * The buffer has been loaded, and is not finished.
++*/
++
++enum xxsvideo_dma_loadst {
++	XXSVIDEO_DMALOAD_NONE,
++	XXSVIDEO_DMALOAD_RUNNING,
++};
++
++enum xxsvideo_dma_buffresult {
++	XXSVIDEO_RES_OK,
++	XXSVIDEO_RES_ERR,
++	XXSVIDEO_RES_ABORT
++};
++
++enum xxsvideo_dmasrc {
++	XXSVIDEO_DMASRC_HW,		/* source is memory */
++	XXSVIDEO_DMASRC_MEM		/* source is hardware */
++};
++
++/* enum xxsvideo_chan_op
++ *
++ * operation codes passed to the DMA code by the user, and also used
++ * to inform the current channel owner of any changes to the system state
++*/
++
++enum xxsvideo_chan_op {
++	XXSVIDEO_DMAOP_START,
++	XXSVIDEO_DMAOP_STOP,
++	XXSVIDEO_DMAOP_PAUSE,
++	XXSVIDEO_DMAOP_RESUME,
++	XXSVIDEO_DMAOP_FLUSH,
++	XXSVIDEO_DMAOP_TIMEOUT,		/* internal signal to handler */
++};
++
++/* dma buffer */
++struct xxsvideo_dma_client {
++	char                *name;
++};
++
++/* xxsvideo_dma_buf_s
++ *
++ * internally used buffer structure to describe a queued or running
++ * buffer.
++*/
++
++struct xxsvideo_dma_buf;
++struct xxsvideo_dma_buf {
++	struct xxsvideo_dma_buf	*next;
++	int			 magic;		/* magic */
++	int			 size;		/* buffer size in bytes */
++	dma_addr_t		 data;		/* start of DMA data */
++	void			*id;		/* client's id */
++};
++
++struct xxsvideo_dma_chan;
++
++/* xxsvideo_dma_cbfn_t
++ *
++ * buffer callback routine type
++*/
++
++typedef void (*xxsvideo_dma_cbfn_t)(struct xxsvideo_dma_chan *,
++				   void *buf, int size,
++				   enum xxsvideo_dma_buffresult result);
++
++typedef int  (*xxsvideo_dma_opfn_t)(struct xxsvideo_dma_chan *,
++				   enum xxsvideo_chan_op );
++
++struct xxsvideo_dma_stats {
++	unsigned long		loads;
++	unsigned long		timeout_longest;
++	unsigned long		timeout_shortest;
++	unsigned long		timeout_avg;
++	unsigned long		timeout_failed;
++};
++
++struct xxsvideo_dma_map;
++
++/* struct xxsvideo_dma_chan
++ *
++ * full state information for each DMA channel
++*/
++
++struct xxsvideo_dma_chan {
++	/* channel state flags and information */
++	unsigned char		 number;      /* number of this dma channel */
++	unsigned char		 in_use;      /* channel allocated */
++	unsigned char		 irq_claimed; /* irq claimed for channel */
++	unsigned char		 irq_enabled; /* irq enabled for channel */
++	unsigned char		 xfer_unit;   /* size of an transfer */
++
++	/* channel state */
++
++	enum xxsvideo_dma_state	 state;
++	enum xxsvideo_dma_loadst load_state;
++	struct xxsvideo_dma_client *client;
++
++	/* channel configuration */
++	enum xxsvideo_dmasrc	 source;
++	unsigned long		 dev_addr;
++	unsigned long		 load_timeout;
++	unsigned int		 flags;		/* channel flags */
++
++	struct xxsvideo_dma_map	*map;		/* channel hw maps */
++
++	/* channel's hardware position and configuration */
++	void __iomem		*regs;		/* channels registers */
++	unsigned int		 irq;		/* channel irq */
++	unsigned long		 dmaca;		/* default value of DMACAx */
++	unsigned long		 dmacb;		/* default value of DMACBx */
++	unsigned long		 dmacsa;	/* default value of DMACSAx */
++	unsigned long		 dmacda;	/* default value of DMACDAx */
++
++	/* driver handles */
++	xxsvideo_dma_cbfn_t	 callback_fn;	/* buffer done callback */
++	xxsvideo_dma_opfn_t	 op_fn;		/* channel op callback */
++
++	/* stats gathering */
++	struct xxsvideo_dma_stats *stats;
++	struct xxsvideo_dma_stats  stats_store;
++
++	/* buffer list and information */
++	struct xxsvideo_dma_buf	*curr;		/* current dma buffer */
++	struct xxsvideo_dma_buf	*next;		/* next buffer to load */
++	struct xxsvideo_dma_buf	*end;		/* end of queue */
++
++	/* system device */
++	struct sys_device	dev;
++};
++
++/* the currently allocated channel information */
++extern struct xxsvideo_dma_chan xxsvideo_chans[JADE_DMA_CHANNELS];
++
++#define JADE_DMACR		0x0000
++
++#define JADE_DMACAX		0x0
++#define JADE_DMACBX		0x4
++#define JADE_DMACSAX		0x8
++#define JADE_DMACDAX		0xC
++
++#define JADE_DMACAX_BT_NORMAL	(0x0 << 20)
++#define JADE_DMACAX_BT_SINGLE	(0x8 << 20)
++#define JADE_DMACAX_BT_INCR	(0x9 << 20)
++#define JADE_DMACAX_BT_WRAP4	(0xa << 20)
++#define JADE_DMACAX_BT_INCR4	(0xb << 20)
++#define JADE_DMACAX_BT_WRAP8	(0xc << 20)
++#define JADE_DMACAX_BT_INCR8	(0xd << 20)
++#define JADE_DMACAX_BT_WRAP16	(0xe << 20)
++#define JADE_DMACAX_BT_INCR16	(0xf << 20)
++#define JADE_DMACAX_IS_SW	(0x00 << 24)
++#define JADE_DMACAX_IS_DREQH	(0x0e << 24)
++#define JADE_DMACAX_IS_DREQL	(0x0f << 24)
++#define JADE_DMACAX_IS_IDREQ0H	(0x10 << 24)
++#define JADE_DMACAX_IS_IDREQ1H	(0x11 << 24)
++#define JADE_DMACAX_IS_IDREQ2H	(0x12 << 24)
++#define JADE_DMACAX_IS_IDREQ3H	(0x13 << 24)
++#define JADE_DMACAX_IS_IDREQ4H	(0x14 << 24)
++#define JADE_DMACAX_IS_IDREQ5H	(0x15 << 24)
++#define JADE_DMACAX_IS_IDREQ6H	(0x16 << 24)
++#define JADE_DMACAX_IS_IDREQ7H	(0x17 << 24)
++#define JADE_DMACAX_IS_IDREQ8H	(0x18 << 24)
++#define JADE_DMACAX_IS_IDREQ9H	(0x19 << 24)
++#define JADE_DMACAX_IS_IDREQ10H	(0x1a << 24)
++#define JADE_DMACAX_IS_IDREQ11H	(0x1b << 24)
++#define JADE_DMACAX_IS_IDREQ12H	(0x1c << 24)
++#define JADE_DMACAX_IS_IDREQ13H	(0x1d << 24)
++#define JADE_DMACAX_IS_IDREQ14H	(0x1e << 24)
++#define JADE_DMACAX_IS_IDREQ15H	(0x1f << 24)
++#define JADE_DMACAX_ST		(1 << 29)
++#define JADE_DMACAX_PB		(1 << 30)
++#define JADE_DMACAX_EB		(1 << 31)
++
++#define JADE_DMACBX_CI		(1 << 19)
++#define JADE_DMACBX_EI		(1 << 20)
++#define JADE_DMACBX_RD		(1 << 21)
++#define JADE_DMACBX_RS		(1 << 22)
++#define JADE_DMACBX_RC		(1 << 23)
++#define JADE_DMACBX_FD		(1 << 24)
++#define JADE_DMACBX_FS		(1 << 25)
++#define JADE_DMACBX_TW_BYTE	(0 << 26)
++#define JADE_DMACBX_TW_HALFWORD	(1 << 26)
++#define JADE_DMACBX_TW_WORD	(2 << 26)
++#define JADE_DMACBX_MS_BLOCK	(0 << 28)
++#define JADE_DMACBX_MS_BURST	(1 << 28)
++#define JADE_DMACBX_MS_DEMAND	(2 << 28)
++#define JADE_DMACBX_TT_2CYCLE	(0 << 30)
++
++
++
++/* bits */
++#define DMACA_BT_NORMAL		(0x0 << 20)
++#define DMACA_BT_SINGLE		(0x8 << 20)
++#define DMACA_BT_INCR		(0x9 << 20)
++#define DMACA_BT_WRAP4		(0xa << 20)
++#define DMACA_BT_INCR4		(0xb << 20)
++#define DMACA_BT_WRAP8		(0xc << 20)
++#define DMACA_BT_INCR8		(0xd << 20)
++#define DMACA_BT_WRAP16		(0xe << 20)
++#define DMACA_BT_INCR16		(0xf << 20)
++#define DMACA_IS_SW		(0x00 << 24)
++#define DMACA_IS_DREQH		(0x0e << 24)
++#define DMACA_IS_DREQL		(0x0f << 24)
++#define DMACA_IS_IDREQ0H	(0x10 << 24)
++#define DMACA_IS_IDREQ1H	(0x11 << 24)
++#define DMACA_IS_IDREQ2H	(0x12 << 24)
++#define DMACA_IS_IDREQ3H	(0x13 << 24)
++#define DMACA_IS_IDREQ4H	(0x14 << 24)
++#define DMACA_IS_IDREQ5H	(0x15 << 24)
++#define DMACA_IS_IDREQ6H	(0x16 << 24)
++#define DMACA_IS_IDREQ7H	(0x17 << 24)
++#define DMACA_IS_IDREQ8H	(0x18 << 24)
++#define DMACA_IS_IDREQ9H	(0x19 << 24)
++#define DMACA_IS_IDREQ10H	(0x1a << 24)
++#define DMACA_IS_IDREQ11H	(0x1b << 24)
++#define DMACA_IS_IDREQ12H	(0x1c << 24)
++#define DMACA_IS_IDREQ13H	(0x1d << 24)
++#define DMACA_IS_IDREQ14H	(0x1e << 24)
++#define DMACA_IS_IDREQ15H	(0x1f << 24)
++#define DMACA_ST		(1 << 29)
++#define DMACA_PB		(1 << 30)
++#define DMACA_EB		(1 << 31)
++
++
++#define DMACB_CI		(1 << 19)
++#define DMACB_EI		(1 << 20)
++#define DMACB_RD		(1 << 21)
++#define DMACB_RS		(1 << 22)
++#define DMACB_RC		(1 << 23)
++#define DMACB_FD		(1 << 24)
++#define DMACB_FS		(1 << 25)
++#define DMACB_TW_BYTE		(0 << 26)
++#define DMACB_TW_HALFWORD	(1 << 26)
++#define DMACB_TW_WORD		(2 << 26)
++#define DMACB_MS_BLOCK		(0 << 28)
++#define DMACB_MS_BURST		(1 << 28)
++#define DMACB_MS_DEMAND		(2 << 28)
++#define DMACB_TT_2CYCLE		(0 << 30)
++
++/* functions --------------------------------------------------------------- */
++
++/* just vor debugging ... */ 
++extern void dump_dma_regs(void); 
++/* just vor debugging ... */ 
++extern void dump_i2s_regs(void);
++
++/* xxsvideo_request_dma
++ *
++ * request a dma channel exclusivley
++*/
++
++extern int xxsvideo_request_dma(dmach_t channel,
++			       struct xxsvideo_dma_client *, void *dev);
++
++
++/* xxsvideo_dma_ctrl
++ *
++ * change the state of the dma channel
++*/
++
++extern int xxsvideo_dma_ctrl(dmach_t channel, enum xxsvideo_chan_op op);
++
++/* xxsvideo_dma_setflags
++ *
++ * set the channel's flags to a given state
++*/
++
++extern int xxsvideo_dma_setflags(dmach_t channel,
++				unsigned int flags);
++
++/* xxsvideo_dma_free
++ *
++ * free the dma channel (will also abort any outstanding operations)
++*/
++
++extern int xxsvideo_dma_free(dmach_t channel, struct xxsvideo_dma_client *);
++
++/* xxsvideo_dma_enqueue
++ *
++ * place the given buffer onto the queue of operations for the channel.
++ * The buffer must be allocated from dma coherent memory, or the Dcache/WB
++ * drained before the buffer is given to the DMA system.
++*/
++
++extern int xxsvideo_dma_enqueue(dmach_t channel, void *id,
++			       dma_addr_t data, int size);
++
++/* xxsvideo_dma_config
++ *
++ * configure the dma channel
++*/
++
++extern int xxsvideo_dma_config(dmach_t channel, int xferunit, int dmaca, int dmacb);
++
++/* xxsvideo_dma_devconfig
++ *
++ * configure the device we're talking to
++*/
++
++extern int xxsvideo_dma_devconfig(int channel, enum xxsvideo_dmasrc source,
++				 int hwcfg, unsigned long devaddr);
++
++/* xxsvideo_dma_getposition
++ *
++ * get the position that the dma transfer is currently at
++*/
++
++extern int xxsvideo_dma_getposition(dmach_t channel,
++				   dma_addr_t *src, dma_addr_t *dest);
++
++extern int xxsvideo_dma_set_opfn(dmach_t, xxsvideo_dma_opfn_t rtn);
++extern int xxsvideo_dma_set_buffdone_fn(dmach_t, xxsvideo_dma_cbfn_t rtn);
++
++/* DMA Register definitions */
++/* FIXME */
++#define XXSVIDEO_DCON_CH0_SDI	(2<<24)
++#define XXSVIDEO_DCON_CH1_I2SSDI	(2<<24)
++#define XXSVIDEO_DCON_CH2_I2SSDO	(0<<24)
++#define XXSVIDEO_DCON_CH2_I2SSDI	(1<<24)
++
++
++struct xxsvideo_dma_addr {
++	unsigned long		from;
++	unsigned long		to;
++};
++
++/* struct xxsvideo_dma_map
++ *
++ * this holds the mapping information for the channel selected
++ * to be connected to the specified device
++*/
++
++struct xxsvideo_dma_map {
++	const char		*name;
++	struct xxsvideo_dma_addr  hw_addr;
++
++	unsigned long		 channels[JADE_DMA_CHANNELS];
++};
++
++struct xxsvideo_dma_selection {
++	struct xxsvideo_dma_map	*map;
++	unsigned long		 map_size;
++	unsigned long		 dmaca_mask;
++	unsigned long		 dmacb_mask;
++
++	void	(*select)(struct xxsvideo_dma_chan *chan,
++			  struct xxsvideo_dma_map *map);
++};
++
++extern int xxsvideo_dma_init_map(struct xxsvideo_dma_selection *sel);
++
++/* struct xxsvideo_dma_order_ch
++ *
++ * channel map for one of the `enum dma_ch` dma channels. the list
++ * entry contains a set of low-level channel numbers, orred with
++ * DMA_CH_VALID, which are checked in the order in the array.
++*/
++
++struct xxsvideo_dma_order_ch {
++	unsigned int	list[JADE_DMA_CHANNELS];	/* list of channels */
++	unsigned int	flags;				/* flags */
++};
++
++/* struct xxsvideo_dma_order
++ *
++ * information provided by either the core or the board to give the
++ * dma system a hint on how to allocate channels
++*/
++
++struct xxsvideo_dma_order {
++	struct xxsvideo_dma_order_ch	channels[DMACH_MAX];
++};
++
++/* DMA init code, called from the cpu support code */
++
++extern int s3c2410_dma_init(void);
++
++extern int s3c24xx_dma_init(unsigned int channels, unsigned int irq,
++			    unsigned int stride);
++
++#endif /* _ASM_ARCH_DMA_H */
++
+--- linux-2.6.27.21/arch/arm/mach-xxsvideo/include/mach/entry-macro.S	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/mach-xxsvideo/include/mach/entry-macro.S	2009-11-30 12:23:42.000000000 +0000
+@@ -0,0 +1,76 @@
++/*
++ * linux/include/asm-arm/arch-xxsvideo/entry-macro.S
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Carsten Schneider <cs@mycable.de>, Tiemo Krueger <tk@mycable.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++#include "hardware.h"
++
++	.macro	disable_fiq
++	.endm
++
++	.macro  get_irqnr_preamble, base, tmp
++	.endm
++
++	.macro  arch_ret_to_user, tmp1, tmp2
++	.endm
++
++               .macro  get_irqnr_and_base, irqnr, irqstat, base, tmp
++
++                @ check JADE IRC0
++                ldr     \irqnr, =JADE_IRC0_BASE
++                ldr     r1,[\irqnr,#IRQF]
++                cmp     r1, #0
++                beq     1003f
++
++                ldr     \irqstat,[\irqnr, #TBR]
++                ldr     \irqnr,  [\irqnr, #VCT]         @ get vector address
++                sub     \irqnr, \irqnr, \irqstat
++                sub     \irqnr, \irqnr, #VCT
++                mov     \irqnr, \irqnr, lsr #2
++#ifdef CONFIG_ARCH_JADE_MB86R02
++                cmp     \irqnr, #5                      @ cascaded int from irc2
++                beq     1001f
++#endif /* CONFIG_ARCH_JADE_MB86R02 */
++                cmp     \irqnr, #6                      @ cascaded int from irc1
++                bne     1002f
++
++                @ Check JADE IRC1
++                ldr     \irqnr, =JADE_IRC1_BASE
++                ldr     r1,[\irqnr,#IRQF]
++                cmp     r1, #0
++                beq     1003f
++
++                ldr     \irqstat,[\irqnr, #TBR]
++                ldr     \irqnr,  [\irqnr, #VCT]         @ get vector address
++                sub     \irqnr, \irqnr, \irqstat
++                sub     \irqnr, \irqnr, #VCT
++                mov     \irqnr, \irqnr, lsr #2
++		add     \irqnr, \irqnr, #32		@ add 32 to mark irc1
++#ifdef CONFIG_ARCH_JADE_MB86R02
++                b       1002f
++
++1001:           @ Check JADE IRC2
++                ldr     \irqnr, =JADE_IRC2_BASE
++                ldr     r1,[\irqnr,#IRQF]
++                cmp     r1, #0
++                beq     1003f
++
++                ldr     \irqstat,[\irqnr, #TBR]
++                ldr     \irqnr,  [\irqnr, #VCT]         @ get vector address
++                sub     \irqnr, \irqnr, \irqstat
++                sub     \irqnr, \irqnr, #VCT
++                mov     \irqnr, \irqnr, lsr #2
++                add     \irqnr, \irqnr, #64             @ add 64 to mark irc2
++#endif /* CONFIG_ARCH_JADE_MB86R02 */
++
++1002:
++                cmp \irqnr, #255        @ to unset Zeroflag
++1003:
++	.endm
++
+--- linux-2.6.27/arch/arm/mach-xxsvideo/include/mach/generic.h	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/arch/arm/mach-xxsvideo/include/mach/generic.h	2009-01-08 10:49:39.000000000 +0100
+@@ -0,0 +1,12 @@
++/*
++ * linux/include/asm-arm/arch-xxsvideo/generic.h
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Carsten Schneider <cs@mycable.de>, Tiemo Krueger <tk@mycable.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
+--- linux-2.6.27.21/arch/arm/mach-xxsvideo/include/mach/gpio.h	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/mach-xxsvideo/include/mach/gpio.h	2009-11-27 09:38:47.000000000 +0000
+@@ -0,0 +1,174 @@
++/*
++ * linux/include/asm-arm/arch-xxsvideo/gpio.h
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Alexander Bigga <ab@mycable.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++#ifndef __ASM_ARCH_XXSVIDEO_GPIO_H
++#define __ASM_ARCH_XXSVIDEO_GPIO_H
++
++#include <asm/irq.h>
++// #include <asm/arch/platform.h>
++
++#include <asm/irq.h>
++#include <asm/io.h>
++#include <asm/mach/irq.h>
++
++#include <linux/irq.h>
++
++#define XXSVIDEO_GPIO_BASE	JADE_GPIO_BASE
++
++#define GPIO_DATA		0
++#define GPIO_DIR		1
++
++#define GPIO_DIR_INPUT		1<<0
++#define GPIO_DIR_INT_EN		1<<1
++#define GPIO_DIR_OUTPUT		1<<2
++
++#if defined CONFIG_MACH_XXSVIDEO_EVALKIT
++
++#define INT_BLOCK_A	0	/* not available */
++#define INT_BLOCK_B	INT_EXT_3
++#define INT_BLOCK_C	0
++#define INT_BLOCK_D	INT_EXT_1
++
++#elif defined CONFIG_MACH_XXSVIDEOD_EVALKIT
++
++#define INT_BLOCK_A	0
++#define INT_BLOCK_B	INT_EXT_3
++#define INT_BLOCK_C	0
++#define INT_BLOCK_D	0
++
++#else
++
++#define INT_BLOCK_A	INT_EXT_1
++#define INT_BLOCK_B	INT_EXT_2
++
++#endif
++
++/* callable at any time */
++extern int xxsvideo_set_gpio_value(unsigned pin, int value);
++extern int xxsvideo_get_gpio_value(unsigned pin);
++extern int xxsvideo_gpio_direction(unsigned pin, unsigned int dir);
++
++/* GPIO platform setup */
++extern void __init xxsvideo_add_device_gpio(int pin, char *pin_name);
++
++#if defined(CONFIG_XXSVIDEO_IOEXPANDER) || defined(CONFIG_XXSVIDEO_IOEXPANDER_MODULE)
++extern int xxsvideo_ioexpander_set_io(unsigned int gpio, unsigned char val);
++extern int xxsvideo_ioexpander_get_io(unsigned int gpio);
++extern int xxsvideo_ioexpander_get_intf(unsigned int gpio);
++extern int xxsvideo_ioexpander_gpio_direction(unsigned gpio, unsigned int dir);
++#endif
++/*-------------------------------------------------------------------------*/
++/* own definition; from /include/linux/gpio.h */
++struct xxsvideo_gpio_keys_button {
++        /* Configuration parameters */
++        int code;               /* input event code (KEY_*, SW_*) */
++//         int code_left;               /* input event encoder left */
++        int code_right;               /* input event encoder right */
++        int gpio;
++        int gpio_encoder;
++        int active_low;
++        char *desc;
++        int type;               /* input event type (EV_KEY, EV_SW) */
++};
++
++struct xxsvideo_gpio_keys_platform_data {
++        struct xxsvideo_gpio_keys_button *buttons;
++        int nbuttons;
++};
++/*-------------------------------------------------------------------------*/
++
++/* wrappers for "new style" GPIO calls.
++ */
++
++static inline int gpio_request(unsigned gpio, const char *label)
++{
++	return 0;
++}
++
++static inline void gpio_free(unsigned gpio)
++{
++}
++
++static inline void gpio_direction_input(unsigned gpio) {
++
++#if defined(CONFIG_XXSVIDEO_IOEXPANDER) || defined(CONFIG_XXSVIDEO_IOEXPANDER_MODULE)
++	if (gpio >= 200) {
++		xxsvideo_ioexpander_gpio_direction(gpio, GPIO_DIR_INPUT | GPIO_DIR_INT_EN);
++	}
++	else
++#endif
++	xxsvideo_gpio_direction(gpio, GPIO_DIR_INPUT);
++
++}
++static inline void gpio_direction_output(unsigned gpio, int value) {
++
++	xxsvideo_gpio_direction(gpio, GPIO_DIR_OUTPUT);
++
++}
++
++static inline int gpio_get_value(unsigned gpio)
++{
++#if defined(CONFIG_XXSVIDEO_IOEXPANDER) || defined(CONFIG_XXSVIDEO_IOEXPANDER_MODULE)
++	int ret;
++	int ionr;
++
++	if (gpio >= 200) {
++		if (gpio < 208)
++			ionr = gpio - 200;
++		else if (gpio < 218)
++			ionr = gpio - 210;
++		else if (gpio < 228)
++			ionr = gpio - 220;
++		else if (gpio < 238)
++			ionr = gpio - 230;
++
++		ret = xxsvideo_ioexpander_get_io(gpio);
++		return (ret & (1<<ionr)) ? 1 : 0;
++	}
++	else
++#endif
++	return xxsvideo_get_gpio_value(gpio);
++}
++
++static inline void gpio_set_value(unsigned gpio, int value)
++{
++	xxsvideo_set_gpio_value(gpio, value);
++}
++
++static inline int gpio_to_irq(unsigned gpio)
++{
++	int irq;
++
++ /*	struct xxsvideo_gpio_data *gpio_data;*/
++
++#if defined(CONFIG_XXSVIDEO_IOEXPANDER) || defined(CONFIG_XXSVIDEO_IOEXPANDER_MODULE)
++	if (gpio >= 230)
++		irq = INT_BLOCK_D;
++	else if (gpio >= 220)
++		irq = INT_BLOCK_C;
++	else if (gpio >= 210)
++		irq = INT_BLOCK_B;
++	else if (gpio >= 200)
++		irq = INT_BLOCK_A;
++	else
++#endif
++		irq = gpio+100;
++
++/*	gpio_data = get_irq_chip_data(irq);
++	gpio_data->gpio_mask = 0x1c00;*/
++
++/*	set_irq_chip_data(irq, &gpio_data);*/
++
++	return irq;
++}
++
++#endif
+--- linux-2.6.27/arch/arm/mach-xxsvideo/include/mach/hardware.h	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/arch/arm/mach-xxsvideo/include/mach/hardware.h	2009-01-08 10:49:39.000000000 +0100
+@@ -0,0 +1,27 @@
++/*
++ * linux/include/asm-arm/arch-xxsvideo/hardware.h
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Carsten Schneider <cs@mycable.de>, Tiemo Krueger <tk@mycable.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++#ifndef __ASM_ARCH_HARDWARE_H
++#define __ASM_ARCH_HARDWARE_H
++
++#include <asm/sizes.h>
++#include "platform.h"
++
++/*
++ * Where in virtual memory the IO devices (timers, system controllers
++ * and so on)
++ */
++#define IO_BASE			0xE1FC0000                 // VA of IO
++#define IO_SIZE			0x0DF98000                 // How much?
++#define IO_START		0xF1FC0000                 // PA of IO
++
++#endif
++
+--- linux-2.6.27/arch/arm/mach-xxsvideo/include/mach/io.h	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/arch/arm/mach-xxsvideo/include/mach/io.h	2009-01-08 10:49:39.000000000 +0100
+@@ -0,0 +1,27 @@
++/*
++ * linux/include/asm-arm/arch-xxsvideo/io.h
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Carsten Schneider <cs@mycable.de>, Tiemo Krueger <tk@mycable.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++#ifndef __ASM_ARM_ARCH_IO_H
++#define __ASM_ARM_ARCH_IO_H
++
++#define IO_SPACE_LIMIT          0xffffffff
++
++#define __io(a)                 ((void __iomem *)(a))
++#define __mem_pci(a)            (a)
++
++/*
++ * Generic virtual read/write
++ */
++#define __arch_getw(a)		(*(volatile unsigned short *)(a))
++#define __arch_putw(v,a)	(*(volatile unsigned short *)(a) = (v))
++
++#define __arch_iounmap(virt)            do { } while (0)
++#endif
+--- linux-2.6.27/arch/arm/mach-xxsvideo/include/mach/irq.h	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/arch/arm/mach-xxsvideo/include/mach/irq.h	2009-01-08 10:49:39.000000000 +0100
+@@ -0,0 +1,14 @@
++/*
++ * linux/include/asm-arm/arch-xxsvideo/irq.h
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Carsten Schneider <cs@mycable.de>, Tiemo Krueger <tk@mycable.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++#define fixup_irq(i)	(i)
++
++
+--- linux-2.6.27/arch/arm/mach-xxsvideo/include/mach/irqs.h	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/arch/arm/mach-xxsvideo/include/mach/irqs.h	2009-01-08 10:49:39.000000000 +0100
+@@ -0,0 +1,132 @@
++/*
++ * linux/include/asm-arm/arch-xxsvideo/irqs.h
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Carsten Schneider <cs@mycable.de>, Tiemo Krueger <tk@mycable.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++#ifndef __ASM_ARM_ARCH_IRQS_H
++#define __ASM_ARM_ARCH_IRQS_H
++
++/* Use the xxsvideo definitions */
++#include "platform.h"
++
++/*
++ *  IRQ interrupts definitions are the same the INT definitions
++ *  held within platform.h
++ */
++#define IRQ_SOFTINT                     INT_SOFTINT
++#define IRQ_UARTINT0                    INT_UARTINT0
++#define IRQ_UARTINT1                    INT_UARTINT1
++#define IRQ_KMIINT0                     INT_KMIINT0
++#define IRQ_KMIINT1                     INT_KMIINT1
++#define IRQ_TIMERINT0                   INT_TIMERINT0
++#define IRQ_TIMERINT1                   INT_TIMERINT1
++#define IRQ_TIMERINT2                   INT_TIMERINT2
++#define IRQ_RTCINT                      INT_RTCINT
++#define IRQ_EXPINT0                     INT_EXPINT0
++#define IRQ_EXPINT1                     INT_EXPINT1
++#define IRQ_EXPINT2                     INT_EXPINT2
++#define IRQ_EXPINT3                     INT_EXPINT3
++#define IRQ_PCIINT0                     INT_PCIINT0
++#define IRQ_PCIINT1                     INT_PCIINT1
++#define IRQ_PCIINT2                     INT_PCIINT2
++#define IRQ_PCIINT3                     INT_PCIINT3
++#define IRQ_V3INT                       INT_V3INT
++#define IRQ_CPINT0                      INT_CPINT0
++#define IRQ_CPINT1                      INT_CPINT1
++#define IRQ_LBUSTIMEOUT                 INT_LBUSTIMEOUT
++#define IRQ_APCINT                      INT_APCINT
++
++#define IRQMASK_SOFTINT                 INTMASK_SOFTINT
++#define IRQMASK_UARTINT0                INTMASK_UARTINT0
++#define IRQMASK_UARTINT1                INTMASK_UARTINT1
++#define IRQMASK_KMIINT0                 INTMASK_KMIINT0
++#define IRQMASK_KMIINT1                 INTMASK_KMIINT1
++#define IRQMASK_TIMERINT0               INTMASK_TIMERINT0
++#define IRQMASK_TIMERINT1               INTMASK_TIMERINT1
++#define IRQMASK_TIMERINT2               INTMASK_TIMERINT2
++#define IRQMASK_RTCINT                  INTMASK_RTCINT
++#define IRQMASK_EXPINT0                 INTMASK_EXPINT0
++#define IRQMASK_EXPINT1                 INTMASK_EXPINT1
++#define IRQMASK_EXPINT2                 INTMASK_EXPINT2
++#define IRQMASK_EXPINT3                 INTMASK_EXPINT3
++#define IRQMASK_PCIINT0                 INTMASK_PCIINT0
++#define IRQMASK_PCIINT1                 INTMASK_PCIINT1
++#define IRQMASK_PCIINT2                 INTMASK_PCIINT2
++#define IRQMASK_PCIINT3                 INTMASK_PCIINT3
++#define IRQMASK_V3INT                   INTMASK_V3INT
++#define IRQMASK_CPINT0                  INTMASK_CPINT0
++#define IRQMASK_CPINT1                  INTMASK_CPINT1
++#define IRQMASK_LBUSTIMEOUT             INTMASK_LBUSTIMEOUT
++#define IRQMASK_APCINT                  INTMASK_APCINT
++
++/*
++ *  FIQ interrupts definitions are the same the INT definitions.
++ */
++#define FIQ_SOFTINT                     INT_SOFTINT
++#define FIQ_UARTINT0                    INT_UARTINT0
++#define FIQ_UARTINT1                    INT_UARTINT1
++#define FIQ_KMIINT0                     INT_KMIINT0
++#define FIQ_KMIINT1                     INT_KMIINT1
++#define FIQ_TIMERINT0                   INT_TIMERINT0
++#define FIQ_TIMERINT1                   INT_TIMERINT1
++#define FIQ_TIMERINT2                   INT_TIMERINT2
++#define FIQ_RTCINT                      INT_RTCINT
++#define FIQ_EXPINT0                     INT_EXPINT0
++#define FIQ_EXPINT1                     INT_EXPINT1
++#define FIQ_EXPINT2                     INT_EXPINT2
++#define FIQ_EXPINT3                     INT_EXPINT3
++#define FIQ_PCIINT0                     INT_PCIINT0
++#define FIQ_PCIINT1                     INT_PCIINT1
++#define FIQ_PCIINT2                     INT_PCIINT2
++#define FIQ_PCIINT3                     INT_PCIINT3
++#define FIQ_V3INT                       INT_V3INT
++#define FIQ_CPINT0                      INT_CPINT0
++#define FIQ_CPINT1                      INT_CPINT1
++#define FIQ_LBUSTIMEOUT                 INT_LBUSTIMEOUT
++#define FIQ_APCINT                      INT_APCINT
++
++#define FIQMASK_SOFTINT                 INTMASK_SOFTINT
++#define FIQMASK_UARTINT0                INTMASK_UARTINT0
++#define FIQMASK_UARTINT1                INTMASK_UARTINT1
++#define FIQMASK_KMIINT0                 INTMASK_KMIINT0
++#define FIQMASK_KMIINT1                 INTMASK_KMIINT1
++#define FIQMASK_TIMERINT0               INTMASK_TIMERINT0
++#define FIQMASK_TIMERINT1               INTMASK_TIMERINT1
++#define FIQMASK_TIMERINT2               INTMASK_TIMERINT2
++#define FIQMASK_RTCINT                  INTMASK_RTCINT
++#define FIQMASK_EXPINT0                 INTMASK_EXPINT0
++#define FIQMASK_EXPINT1                 INTMASK_EXPINT1
++#define FIQMASK_EXPINT2                 INTMASK_EXPINT2
++#define FIQMASK_EXPINT3                 INTMASK_EXPINT3
++#define FIQMASK_PCIINT0                 INTMASK_PCIINT0
++#define FIQMASK_PCIINT1                 INTMASK_PCIINT1
++#define FIQMASK_PCIINT2                 INTMASK_PCIINT2
++#define FIQMASK_PCIINT3                 INTMASK_PCIINT3
++#define FIQMASK_V3INT                   INTMASK_V3INT
++#define FIQMASK_CPINT0                  INTMASK_CPINT0
++#define FIQMASK_CPINT1                  INTMASK_CPINT1
++#define FIQMASK_LBUSTIMEOUT             INTMASK_LBUSTIMEOUT
++#define FIQMASK_APCINT                  INTMASK_APCINT
++
++/*
++ *  Misc. interrupt definitions
++ */
++#define IRQ_KEYBDINT                    INT_KMIINT0
++#define IRQ_MOUSEINT                    INT_KMIINT1
++
++#define IRQMASK_KEYBDINT                INTMASK_KMIINT0
++#define IRQMASK_MOUSEINT                INTMASK_KMIINT1
++
++#define NR_IRQS                         (MAXIRQNUM + 1)
++
++struct xxsvideo_gpio_data {
++        unsigned long gpio_mask;
++};
++
++#endif
+--- linux-2.6.27/arch/arm/mach-xxsvideo/include/mach/memory.h	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/arch/arm/mach-xxsvideo/include/mach/memory.h	2009-01-08 10:49:39.000000000 +0100
+@@ -0,0 +1,40 @@
++/*
++ * linux/include/asm-arm/arch-xxsvideo/generic.h
++ * based on linux/include/asm-arm/arch-integrator/mmu.h, Copyright (C) 1999 ARM Limited
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Carsten Schneider <cs@mycable.de>, Tiemo Krueger <tk@mycable.de>
++ *
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++#ifndef __ASM_ARCH_MMU_H
++#define __ASM_ARCH_MMU_H
++
++#include "platform.h"
++
++/*
++ */
++#define PHYS_OFFSET	JADE_SDRAM_BASE
++/*
++ * Increase size of DMA-consistent memory region
++ */
++#if 0
++#define CONSISTENT_DMA_SIZE (14<<20)
++#endif
++
++/*
++ * Virtual view <-> DMA view memory address translations
++ * virt_to_bus: Used to translate the virtual address to an
++ *              address suitable to be passed to set_dma_addr
++ * bus_to_virt: Used to convert an address for DMA operations
++ *              to an address that the kernel can use.
++ */
++
++#define __virt_to_bus(x)	__virt_to_phys(x)
++#define __bus_to_virt(x)	__phys_to_virt(x)
++
++#endif
+--- linux-2.6.27.21/arch/arm/mach-xxsvideo/include/mach/platform.h	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/mach-xxsvideo/include/mach/platform.h	2009-11-30 13:23:19.000000000 +0000
+@@ -0,0 +1,386 @@
++/*
++ * linux/include/asm-arm/arch-xxsvideo/platform.h
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Carsten Schneider <cs@mycable.de>, Tiemo Krueger <tk@mycable.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++/* ************************************************************************
++ *
++ *   Jade address map
++ *
++ * ***********************************************************************/
++
++#ifndef __ASM_ARCH_PLATFORM_H
++#define __ASM_ARCH_PLATFORM_H
++
++/*
++ * ------------------------------------------------------------------------
++ *  Memory definitions
++ * ------------------------------------------------------------------------
++ *  JADE memory map
++ *
++ */
++#define JADE_BOOT_ROM		0x10000000
++#define JADE_BOOT_ROM_BASE	JADE_BOOT_ROM	 /*  Normal position */
++#define JADE_BOOT_ROM_SIZE	SZ_32M
++
++#define JADE_SSRAM_BASE		0x01000000
++#define JADE_SSRAM_ALIAS_BASE	0x01000000
++#define JADE_SSRAM_SIZE		SZ_64K
++
++#define JADE_FLASH_BASE		0x10000000
++#define JADE_FLASH_SIZE		SZ_32M
++
++#define JADE_SDRAM_BASE		0x40000000
++
++/* ------------------------------------------------------------------------
++ *  JADE system registers
++ * ------------------------------------------------------------------------
++ *
++ */
++
++/*
++ *  System Controller
++ *
++ */
++/*
++ * Remap
++ *     - "graphics/memory register area (0xf1fc0000-f3001000"
++ *     - "expanded peripheral register area" (0xffee0000-0xfff83000)
++ *     - "general-purpose peripheral register area" (0xfffa0000-0xfffea000)
++ *
++ * to 0xe1fc0000 .. 0xf0000000.(reserved)
++ */
++#define XXSVIDEO_IO_PHYS_BASE	0xf1fc0000
++#define XXSVIDEO_IO_SIZE	(0xffffffff - XXSVIDEO_IO_PHYS_BASE + 1)
++#define XXSVIDEO_IO_VIRT_BASE	(0xf0000000 - XXSVIDEO_IO_SIZE)
++
++ /* Convert a physical IO address to virtual IO address */
++#define XXSVIDEO_IO_P2V(x)          ((x) - XXSVIDEO_IO_PHYS_BASE + XXSVIDEO_IO_VIRT_BASE)
++
++/*
++ * Physical Address Defines
++ */
++#define JADE_GDC_PHYS_BASE	0xf1fc0000  /* GDC phys */
++#define JADE_GDC_PHYS_DISP_BASE	0xf1fd0000  /* GDC DisplayBase phys */
++
++#define JADE_I2S0_PHYS_BASE	0xffee0000  /* I2S channel 0 */
++#define JADE_I2S1_PHYS_BASE	0xffef0000  /* I2S channel 1 */
++#define JADE_I2S2_PHYS_BASE	0xfff00000  /* I2S channel 2 */
++
++#define JADE_CCNT_PHYS_BASE	0xfff42000  /* Chip Control Module */
++#define JADE_PWM1_PHYS_BASE	0xfff41100  /* PWM 1 */
++#define JADE_PWM0_PHYS_BASE	0xfff41000  /* PWM 0 */
++#define JADE_SPI_PHYS_BASE	0xfff40000  /* Serial peripheral interface (SPI) */
++
++#define JADE_UART2_PHYS_BASE	0xfff50000  /* UART 2 phys */
++#define JADE_UART3_PHYS_BASE	0xfff51000  /* UART 3 phys */
++
++#define JADE_CAN0_PHYS_BASE	0xfff54000  /* CAN 0 phys */
++#define JADE_CAN1_PHYS_BASE	0xfff55000  /* CAN 1 phys */
++#define JADE_I2C0_PHYS_BASE	0xfff56000  /* I2C 0 phys */
++#define JADE_I2C1_PHYS_BASE	0xfff57000  /* I2C 1 phys */
++
++#define JADE_EHCI_PHYS_BASE	0xfff80000  /* EHCI phys */
++#define JADE_OHCI_PHYS_BASE	0xfff81000  /* OHCI phys */
++#define JADE_PHYCNT_PHYS_BASE	0xfff82000  /* USB2.0 phy control */
++
++#define JADE_IRC1_PHYS_BASE	0xfffb0000  /* Jade cascaded Interrupt Controller phys */
++#define JADE_MEMC_PHYS_BASE	0xfffc0000  /* MEMC phys */
++#define JADE_DMAC_PHYS_BASE	0xfffd0000  /* DMA controler phys */
++#define JADE_TIMER_PHYS_BASE	0xfffe0000  /* Counter/Timers JADE phys */
++#define JADE_UART0_PHYS_BASE	0xfffe1000  /* UART 0 phys */
++#define JADE_UART1_PHYS_BASE	0xfffe2000  /* UART 1 phys */
++#define JADE_IRCE_PHYS_BASE	0xfffe4000  /* Extended Interrupt Controller */
++#define JADE_CRG_PHYS_BASE	0xfffe7000  /* Clock Reset Generator */
++#define JADE_IRC0_PHYS_BASE	0xfffe8000  /* Jade Interrupt Controller phys */
++#define JADE_GPIO_PHYS_BASE	0xfffe9000  /* GPIO phys */
++
++#define JADE_XSC0_PHYS_BASE	0x02000000  /* Chip Select XSC0 - Ethernet */
++#define JADE_XSC2_PHYS_BASE	0x05000000  /* Chip Select XSC2 */
++#define JADE_XSC4_PHYS_BASE	0x10000000  /* Chip Select XSC4 - Flash */
++
++/* additional addresses for Jade-D */
++#define JADE_TCON0_PHYS_BASE	0xf2000000  /* Jade-D DPERI0 TCON phys */
++#define JADE_SIG0_PHYS_BASE	0xf2002000  /* Jade-D DPERI0 SIG phys */
++#define JADE_CLUT0_PHYS_BASE	0xf2004000  /* Jade-D DPERI0 CLUT phys */
++#define JADE_DITH0_PHYS_BASE	0xf2006000  /* Jade-D DPERI0 DITH phys */
++#define JADE_SIG1_PHYS_BASE	0xf200a000  /* Jade-D DPERI1 SIG phys */
++#define JADE_CLUT1_PHYS_BASE	0xf200c000  /* Jade-D DPERI1 CLUT phys */
++#define JADE_DITH1_PHYS_BASE	0xf200e000  /* Jade-D DPERI1 DITH phys */
++#define JADE_APIX_PHYS_BASE	0xffee1000  /* Jade-D APIX phys */
++#define JADE_SPI1_PHYS_BASE	0xfff45000  /* Jade-D SPI1 phys */
++#define JADE_PWM2_PHYS_BASE	0xfff46000  /* Jade-D PWM2 phys */
++#define JADE_PWM3_PHYS_BASE	0xfff46100  /* Jade-D PWM3 phys */
++#define JADE_PWM4_PHYS_BASE	0xfff47000  /* Jade-D PWM4 phys */
++#define JADE_PWM5_PHYS_BASE	0xfff47100  /* Jade-D PWM5 phys */
++#define JADE_PWM6_PHYS_BASE	0xfff48000  /* Jade-D PWM6 phys */
++#define JADE_PWM7_PHYS_BASE	0xfff48100  /* Jade-D PWM7 phys */
++#define JADE_RLD_PHYS_BASE	0xfff61000  /* Jade-D RLD phys */
++#define JADE_HOSTIF_PHYS_BASE	0xfff62000  /* Jade-D HOSTIF phys */
++#define JADE_IRC2_PHYS_BASE	0xfffb1000  /* Jade-D IRC2 phys */
++
++/*
++ * Virtual to Physical Address mapping for IO devices.
++ */
++#define JADE_GDC_BASE		XXSVIDEO_IO_P2V(JADE_GDC_PHYS_BASE)
++#define JADE_I2S0_BASE		XXSVIDEO_IO_P2V(JADE_I2S0_PHYS_BASE)
++#define JADE_I2S1_BASE		XXSVIDEO_IO_P2V(JADE_I2S1_PHYS_BASE)
++#define JADE_I2S2_BASE		XXSVIDEO_IO_P2V(JADE_I2S2_PHYS_BASE)
++#define JADE_CCNT_BASE		XXSVIDEO_IO_P2V(JADE_CCNT_PHYS_BASE)
++#define JADE_PWM1_BASE		XXSVIDEO_IO_P2V(JADE_PWM1_PHYS_BASE)
++#define JADE_PWM0_BASE		XXSVIDEO_IO_P2V(JADE_PWM0_PHYS_BASE)
++#define JADE_SPI_BASE		XXSVIDEO_IO_P2V(JADE_SPI_PHYS_BASE)
++#define JADE_UART2_BASE		XXSVIDEO_IO_P2V(JADE_UART2_PHYS_BASE)
++#define JADE_UART3_BASE		XXSVIDEO_IO_P2V(JADE_UART3_PHYS_BASE)
++#define JADE_CAN0_BASE		XXSVIDEO_IO_P2V(JADE_CAN0_PHYS_BASE)
++#define JADE_CAN1_BASE		XXSVIDEO_IO_P2V(JADE_CAN1_PHYS_BASE)
++#define JADE_I2C0_BASE		XXSVIDEO_IO_P2V(JADE_I2C0_PHYS_BASE)
++#define JADE_I2C1_BASE		XXSVIDEO_IO_P2V(JADE_I2C1_PHYS_BASE)
++#define JADE_EHCI_BASE		XXSVIDEO_IO_P2V(JADE_EHCI_PHYS_BASE)
++#define JADE_OHCI_BASE		XXSVIDEO_IO_P2V(JADE_OHCI_PHYS_BASE)
++#define JADE_PHYCNT_BASE	XXSVIDEO_IO_P2V(JADE_PHYCNT_PHYS_BASE)
++#define JADE_IRC1_BASE		XXSVIDEO_IO_P2V(JADE_IRC1_PHYS_BASE)
++#define JADE_MEMC_BASE		XXSVIDEO_IO_P2V(JADE_MEMC_PHYS_BASE)
++#define JADE_DMAC_BASE		XXSVIDEO_IO_P2V(JADE_DMAC_PHYS_BASE)
++#define JADE_TIMER_BASE		XXSVIDEO_IO_P2V(JADE_TIMER_PHYS_BASE)
++#define JADE_UART0_BASE		XXSVIDEO_IO_P2V(JADE_UART0_PHYS_BASE)
++#define JADE_UART1_BASE		XXSVIDEO_IO_P2V(JADE_UART1_PHYS_BASE)
++#define JADE_IRCE_BASE		XXSVIDEO_IO_P2V(JADE_IRCE_PHYS_BASE)
++#define JADE_CRG_BASE		XXSVIDEO_IO_P2V(JADE_CRG_PHYS_BASE)
++#define JADE_IRC0_BASE		XXSVIDEO_IO_P2V(JADE_IRC0_PHYS_BASE)
++#define JADE_GPIO_BASE		XXSVIDEO_IO_P2V(JADE_GPIO_PHYS_BASE)
++
++#define JADE_XSC0_BASE		(0xE2000000 + JADE_XSC0_PHYS_BASE)
++#define JADE_XSC2_BASE		(0xE0000000 | JADE_XSC2_PHYS_BASE)
++#define JADE_XSC4_BASE		(0xE0000000 | JADE_XSC4_PHYS_BASE)
++
++/* additional addresses for Jade-D */
++#define JADE_TCON0_BASE		XXSVIDEO_IO_P2V(JADE_TCON0_PHYS_BASE)
++#define JADE_SIG0_BASE		XXSVIDEO_IO_P2V(JADE_SIG0_PHYS_BASE)
++#define JADE_CLUT0_BASE		XXSVIDEO_IO_P2V(JADE_CLUT0_PHYS_BASE)
++#define JADE_DITH0_BASE		XXSVIDEO_IO_P2V(JADE_DITH0_PHYS_BASE)
++#define JADE_SIG1_BASE		XXSVIDEO_IO_P2V(JADE_SIG1_PHYS_BASE)
++#define JADE_CLUT1_BASE		XXSVIDEO_IO_P2V(JADE_CLUT1_PHYS_BASE)
++#define JADE_DITH1_BASE		XXSVIDEO_IO_P2V(JADE_DITH1_PHYS_BASE)
++#define JADE_APIX_BASE		XXSVIDEO_IO_P2V(JADE_APIX_PHYS_BASE)
++#define JADE_SPI1_BASE		XXSVIDEO_IO_P2V(JADE_SPI1_PHYS_BASE)
++#define JADE_PWM2_BASE		XXSVIDEO_IO_P2V(JADE_PWM2_PHYS_BASE)
++#define JADE_PWM3_BASE		XXSVIDEO_IO_P2V(JADE_PWM3_PHYS_BASE)
++#define JADE_PWM4_BASE		XXSVIDEO_IO_P2V(JADE_PWM4_PHYS_BASE)
++#define JADE_PWM5_BASE		XXSVIDEO_IO_P2V(JADE_PWM5_PHYS_BASE)
++#define JADE_PWM6_BASE		XXSVIDEO_IO_P2V(JADE_PWM6_PHYS_BASE)
++#define JADE_PWM7_BASE		XXSVIDEO_IO_P2V(JADE_PWM7_PHYS_BASE)
++#define JADE_RLD_BASE		XXSVIDEO_IO_P2V(JADE_RLD_PHYS_BASE)
++#define JADE_HOSTIF_BASE	XXSVIDEO_IO_P2V(JADE_HOSTIF_PHYS_BASE)
++#define JADE_IRC2_BASE		XXSVIDEO_IO_P2V(JADE_IRC2_PHYS_BASE)
++
++/* ------------------------------------------------------------------------
++ *  JADE Interrupt Controllers
++ * ------------------------------------------------------------------------
++ *
++ *  Offsets from interrupt controller base
++ *
++ */
++#define IRQF				0x00
++#define IRQM				0x04
++#define ILM				0x08
++#define ICRMN				0x0c
++#define HRCL				0x10	/* Jade-D */
++#define SWIR0				0x14
++#define SWIR1				0x18
++#define TBR				0x1c
++#define VCT				0x20
++#define IRQTEST				0x24	/* Jade-D */
++#define FIQTEST				0x28	/* Jade-D */
++#define ICR00                           0x30
++#define ICR01                           0x34
++#define ICR02                           0x38
++#define ICR03                           0x3c
++#define ICR04                           0x40
++#define ICR05                           0x44
++#define ICR06                           0x48
++#define ICR07                           0x4c
++#define ICR08                           0x50
++#define ICR09                           0x54
++#define ICR10                           0x58
++#define ICR11                           0x5c
++#define ICR12                           0x60
++#define ICR13                           0x64
++#define ICR14                           0x68
++#define ICR15                           0x6c
++#define ICR16                           0x70
++#define ICR17                           0x74
++#define ICR18                           0x78
++#define ICR19                           0x7c
++#define ICR20                           0x80
++#define ICR21                           0x84
++#define ICR22                           0x88
++#define ICR23                           0x8c
++#define ICR24                           0x90
++#define ICR25                           0x94
++#define ICR26                           0x98
++#define ICR27                           0x9c
++#define ICR28                           0xa0
++#define ICR29                           0xa4
++#define ICR30				0xa8
++#define ICR31				0xac
++
++/* ------------------------------------------------------------------------
++ *  JADE Clock Reset Generator (CRG)
++ * ------------------------------------------------------------------------
++ *  Offsets...
++ */
++
++#define JADE_CRG_CRPR		0x00	/* PLL control */
++#define JADE_CRG_CRWR		0x08	/* Watchdog timer control */
++#define JADE_CRG_CRSR		0x0c	/* Reset/Standby ctontrol */
++#define JADE_CRG_CRDA		0x10	/* Clock divider control A */
++#define JADE_CRG_CRDB		0x14	/* Clock divider control B */
++#define JADE_CRG_CRHA		0x18	/* AHB (A) bus clock gate control */
++#define JADE_CRG_CRPA		0x1c	/* APB (A) bus clock gate control */
++#define JADE_CRG_CRPB		0x20	/* not used */
++#define JADE_CRG_CRHB		0x24	/* AHB (B) bus clock gate control */
++#define JADE_CRG_CRAM		0x28	/* ARM core clock gate control */
++
++/* ------------------------------------------------------------------------
++ *  JADE External Interrupt Controllers
++ * ------------------------------------------------------------------------
++ *
++ *  Offsets from interrupt controller base
++ *
++ */
++
++#define JADE_IRCE_EIENB		0x00	/* enable register */
++#define JADE_IRCE_EIREQ		0x04	/* demand register */
++#define JADE_IRCE_EILVL		0x08	/* level register */
++
++/* ------------------------------------------------------------------------
++ *  JADE Chip Control Module
++ * ------------------------------------------------------------------------
++ *
++ *  Offsets from Chip Control Module Base
++ *
++ */
++
++#define JADE_CCNT_CGPIO_IST	0x18	/* GPIO interrupt status register */
++#define JADE_CCNT_CGPIO_ISTM	0x1c	/* GPIO interrupt status mask register */
++#define JADE_CCNT_CGPIO_IP	0x20	/* GPIO interrupt polarity setting register */
++#define JADE_CCNT_CGPIO_IM	0x24	/* GPIO interrupt mode setting register */
++#define JADE_CCNT_CMUX_MD	0x30	/* MultiplexMode setting register */
++
++#define JADE_CCNT_CMSR0		0xf0	/* Soft reset register 0 */
++#define JADE_CCNT_CMSR1		0xf4	/* Soft reset register 1 */
++#define JADE_CCNT_CMSR2		0xf8	/* Soft reset register 2 (Jade-D) */
++
++/* ------------------------------------------------------------------------
++ *  JADE I2S Module
++ * ------------------------------------------------------------------------
++ */
++#define JADE_I2S_CHANNEL_OFFSET 0x10000
++#define JADE_I2S_RXFDAT		0x00
++#define JADE_I2S_TXFDAT		0x04
++#define JADE_I2S_CNTREG		0x08
++#define JADE_I2S_MCR0REG	0x0C
++#define JADE_I2S_MCR1REG	0x10
++#define JADE_I2S_MCR2REG	0x14
++#define JADE_I2S_OPRREG		0x18
++#define JADE_I2S_SRST		0x1C
++#define JADE_I2S_INTCNT		0x20
++#define JADE_I2S_STATUS		0x24
++#define JADE_I2S_DMAACT		0x28
++#define JADE_I2S_TSTREG		0x2C	/* secret test register */
++
++/*
++ *  Interrupt numbers
++ *
++ */
++#define INT_GPIO			7
++#define INT_EXT_0			10
++#define INT_EXT_1			11
++#define INT_EXT_2			12
++#define INT_EXT_3			13
++#define INT_TIMERINT0			14
++#define INT_TIMERINT1			15
++#define INT_DMAC0			16
++#define INT_DMAC1			17
++#define INT_DMAC2			18
++#define INT_DMAC3			19
++#define INT_DMAC4			20
++#define INT_DMAC5			21
++#define INT_DMAC6			22
++#define INT_DMAC7			23
++#define INT_UARTINT0			24
++#define INT_UARTINT1			25
++/* second interrupt vector */
++#define INT_CAN0			34
++#define INT_CAN1			35
++#define INT_I2S0			38
++#define INT_I2S1			39
++#define INT_I2S2			40
++#define INT_SPI				41
++#define INT_I2C0			43
++#define INT_I2C1			44
++#define INT_PHYCNT			51
++#define INT_EHCI			52
++#define INT_OHCI			53
++#define IRQ_UNUSED			59
++
++/* additional interrupts for Jade-D */
++#define INT_IRC2			5
++#define INT_DDR2			33
++#define INT_AHB2AXI_CPUROOT		57
++#define INT_PWM2			(64+0)
++#define INT_PWM3			(64+1)
++#define INT_PWM4			(64+2)
++#define INT_PWM5			(64+3)
++#define INT_PWM6			(64+4)
++#define INT_PWM7			(64+5)
++#define INT_ADC2			(64+6)
++#define INT_ADC3			(64+7)
++#define INT_SPI1			(64+8)
++#define INT_RLD				(64+9)
++#define INT_SIG0			(64+10)
++#define INT_SIG1			(64+11)
++#define INT_RHLITE_CH0_OUTBOUND_READY	(64+12)
++#define INT_RHLITE_CH0_INBOUND_READY	(64+13)
++#define INT_RHLITE_CH0_LINK_ERROR	(64+14)
++#define INT_RHLITE_CH0_FIFO_ERROR	(64+15)
++#define INT_RHLITE_CH1_OUTBOUND_READY	(64+16)
++#define INT_RHLITE_CH1_INBOUND_READY	(64+17)
++#define INT_RHLITE_CH1_LINK_ERROR	(64+18)
++#define INT_RHLITE_CH1_FIFO_ERROR	(64+19)
++#define INT_RHLITE_CH0_EVENT		(64+20)
++#define INT_RHLITE_CH1_EVENT		(64+21)
++
++#define INT_ETHERNET			INT_EXT_0
++
++#ifdef CONFIG_ARCH_JADE_MB86R02
++#define MAXIRQNUM                       95
++#else /* MB68R01 */
++#define MAXIRQNUM                       63
++#endif
++
++/*
++ *  Timer definitions
++ *
++ */
++
++#define JADE_TIMER0_BASE		JADE_TIMER_BASE
++#define JADE_TIMER1_BASE		(JADE_TIMER_BASE + 0x20)
++
++#define JADE_TIMER_LOAD			0x00
++#define JADE_TIMER_VALUE		0x04
++#define JADE_TIMER_CONTROL 		0x08
++#define JADE_TIMER_CLEAR 		0x0c
++#define JADE_TIMER_IRQ_RAW		0x10
++#define JADE_TIMER_IRQ_STATUS		0x14
++
++
++#endif  /* __ASM_ARCH_PLATFORM_H */
++
+--- linux-2.6.27.21/arch/arm/mach-xxsvideo/include/mach/serial.h	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/mach-xxsvideo/include/mach/serial.h	2009-11-20 05:33:21.000000000 +0000
+@@ -0,0 +1,24 @@
++/*
++ * linux/include/asm-arm/arch-xxsvideo/serial.h
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Carsten Schneider <cs@mycable.de>, Tiemo Krueger <tk@mycable.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++#ifndef __ASM_ARCH_SERIAL_H
++#define __ASM_ARCH_SERIAL_H
++
++/*
++ * This is the clock rate of the 16550-compatible UART used for the 
++ * early serial console, divided by 16; see 8250_early.c.
++ *
++ * In Jade/Jade-D, all UARTs are sourced from the APB-A clock.
++ */
++#define BASE_BAUD       (CONFIG_JADE_PACLK_FREQ/16)
++
++#endif
+--- linux-2.6.27/arch/arm/mach-xxsvideo/include/mach/system.h	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/arch/arm/mach-xxsvideo/include/mach/system.h	2009-01-08 10:49:39.000000000 +0100
+@@ -0,0 +1,47 @@
++/*
++ * linux/include/asm-arm/arch-xxsvideo/system.h
++ * based on linux/include/asm-arm/arch-integrator/system.h
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Carsten Schneider <cs@mycable.de>, Tiemo Krueger <tk@mycable.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++/* ************************************************************************
++ *
++ *   Jade address map
++ *
++ * ***********************************************************************/
++
++#ifndef __ASM_ARCH_SYSTEM_H
++#define __ASM_ARCH_SYSTEM_H
++
++#include <mach/hardware.h>
++#include <asm/io.h>
++#include <mach/platform.h>
++
++static inline void arch_idle(void)
++{
++	/*
++	 * This should do all the clock switching
++	 * and wait for interrupt tricks
++	 */
++	cpu_do_idle();
++}
++
++void (*xxsvideo_arch_reset)(void);
++
++static inline void arch_reset(char mode)
++{
++        /* call the CPU-specific reset function */
++        if (xxsvideo_arch_reset)
++                (xxsvideo_arch_reset)();
++
++	cpu_reset(0);
++
++}
++
++#endif
+--- linux-2.6.27.21/arch/arm/mach-xxsvideo/include/mach/timex.h	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/mach-xxsvideo/include/mach/timex.h	2009-11-20 05:33:44.000000000 +0000
+@@ -0,0 +1,26 @@
++/*
++ * linux/include/asm-arm/arch-xxsvideo/timex.h
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Carsten Schneider <cs@mycable.de>, Tiemo Krueger <tk@mycable.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++/*
++ * This is the frequency of the timer used for Linux's timer interrupt. 
++ * The value should be defined as accurate as possible or under certain 
++ * circumstances Linux timekeeping might become inaccurate or fail.
++ *
++ * The macro, which has to be a constant, is used in jiffies.h to 
++ * calculate LATCH and ACTHZ. Don't use it in your own drivers!
++ *
++ * For Jade/Jade-D, the system timer uses Timer-0, which is sourced 
++ * from the APB-A clock.
++ */
++
++#define CLOCK_TICK_RATE         CONFIG_JADE_PACLK_FREQ
++
+--- linux-2.6.27/arch/arm/mach-xxsvideo/include/mach/uncompress.h	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/arch/arm/mach-xxsvideo/include/mach/uncompress.h	2009-01-08 10:49:39.000000000 +0100
+@@ -0,0 +1,50 @@
++/*
++ * linux/include/asm-arm/arch-xxsvideo/uncompress.h
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Carsten Schneider <cs@mycable.de>, Tiemo Krueger <tk@mycable.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++#ifndef _ARCH_UNCOMPRESS_H_
++#define _ARCH_UNCOMPRESS_H_
++
++#include <mach/hardware.h>
++#include <asm/mach-types.h>
++#include <linux/serial_reg.h>
++
++#define TX_DONE (UART_LSR_TEMT|UART_LSR_THRE)
++
++static volatile u32* uart_base;
++
++static inline void putc(int c)
++{
++	/* Check THRE and TEMT bits before we transmit the character.
++	 */
++
++	while ((uart_base[UART_LSR] & TX_DONE) != TX_DONE)
++		barrier();
++
++	*uart_base = c;
++}
++
++static void flush(void)
++{
++}
++
++static __inline__ void __arch_decomp_setup(unsigned long arch_id)
++{
++	uart_base = (volatile u32*) JADE_UART0_PHYS_BASE;
++}
++
++/*
++ * arch_id is a variable in decompress_kernel()
++ */
++#define arch_decomp_setup()	__arch_decomp_setup(arch_id)
++
++#define arch_decomp_wdog()
++
++#endif
+--- linux-2.6.27/arch/arm/mach-xxsvideo/include/mach/vmalloc.h	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/arch/arm/mach-xxsvideo/include/mach/vmalloc.h	2009-01-08 10:49:39.000000000 +0100
+@@ -0,0 +1,12 @@
++/*
++ * linux/include/asm-arm/arch-xxsvideo/vmalloc.h
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Carsten Schneider <cs@mycable.de>, Tiemo Krueger <tk@mycable.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++#define VMALLOC_END       (PAGE_OFFSET + 0x10000000)
diff --git a/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/02_diff-mycable-leds.patch b/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/02_diff-mycable-leds.patch
new file mode 100644
index 0000000..d721582
--- /dev/null
+++ b/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/02_diff-mycable-leds.patch
@@ -0,0 +1,234 @@
+--- linux-2.6.27.21/drivers/leds/Kconfig	2009-03-23 22:04:09.000000000 +0000
++++ linux-2.6.27.21-dev/drivers/leds/Kconfig	2009-11-20 05:21:44.000000000 +0000
+@@ -163,6 +163,20 @@
+ 	  LED driver chips accessed via the I2C bus.  Supported
+ 	  devices include PCA9550, PCA9551, PCA9552, and PCA9553.
+ 
++config LEDS_XXSVIDEO_TERMINAL
++	tristate "LED Support for mycable XXSterminal Board"
++	depends on LEDS_CLASS && MACH_XXSVIDEO_TERMINAL
++	help
++	  This option enables support for the front LEDs on mycable's 
++	  XXSterminal board.
++
++config LEDS_XXSVIDEO_JADEEVALKIT
++	tristate "LED Support for mycable Jade Eval Board"
++	depends on LEDS_CLASS && XXSVIDEO_IOEXPANDER
++	help
++	  This option enables support for the front LEDs on mycable's 
++	  Jade Evaluation Board.
++
+ comment "LED Triggers"
+ 
+ config LEDS_TRIGGERS
+--- linux-2.6.27/drivers/leds/Makefile	2009-01-08 10:49:44.000000000 +0100
++++ linux-2.6.27-dev/drivers/leds/Makefile	2009-01-08 10:49:41.000000000 +0100
+@@ -23,6 +23,8 @@
+ obj-$(CONFIG_LEDS_HP6XX)		+= leds-hp6xx.o
+ obj-$(CONFIG_LEDS_FSG)			+= leds-fsg.o
+ obj-$(CONFIG_LEDS_PCA955X)		+= leds-pca955x.o
++obj-$(CONFIG_LEDS_XXSVIDEO_TERMINAL)	+= leds-xxsterminal.o
++obj-$(CONFIG_LEDS_XXSVIDEO_JADEEVALKIT)	+= leds-jadeevalkit.o
+ 
+ # LED Triggers
+ obj-$(CONFIG_LEDS_TRIGGER_TIMER)	+= ledtrig-timer.o
+--- linux-2.6.27/drivers/leds/leds-xxsterminal.c	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/drivers/leds/leds-xxsterminal.c	2009-01-08 10:49:41.000000000 +0100
+@@ -0,0 +1,86 @@
++/*
++ * drivers/leds/leds-xxterminal.c
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Alexander Bigga <ab@mycable.de>
++ *
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++#include <linux/module.h>
++#include <linux/types.h>
++#include <linux/kernel.h>
++#include <linux/device.h>
++#include <linux/leds.h>
++#include <asm/gpio.h>
++
++static void xxsterminal_sysled_set(struct led_classdev *led_cdev, enum led_brightness brightness)
++{
++	/* 0: off; 1: red; 2: orange; 3: green */
++	/* remember: led IOs are low active! */
++	switch (brightness) {
++		case 1:	xxsvideo_set_gpio_value(6, 1);
++			xxsvideo_set_gpio_value(7, 0);
++			break;
++		case 2:	xxsvideo_set_gpio_value(6, 0);
++			xxsvideo_set_gpio_value(7, 0);
++			break;
++		case 3:	xxsvideo_set_gpio_value(6, 0);
++			xxsvideo_set_gpio_value(7, 1);
++			break;
++		default:xxsvideo_set_gpio_value(6, 1);
++			xxsvideo_set_gpio_value(7, 1);
++			break;
++	}
++}
++
++static void xxsterminal_led_set(struct led_classdev *led_cdev, enum led_brightness brightness)
++{
++	if (!brightness)
++		xxsvideo_set_gpio_value(8, 1);
++	else
++		xxsvideo_set_gpio_value(8, 0);
++}
++
++static struct led_classdev xxsterminal_sysled = {
++       .name = "xxsterminal-sysled",
++       .brightness_set = xxsterminal_sysled_set,
++/*       .default_trigger = "armflash",*/
++};
++
++static struct led_classdev xxsterminal_led = {
++       .name = "xxsterminal-led",
++       .brightness_set = xxsterminal_led_set,
++/*       .default_trigger = "armflash", */
++};
++
++static int __init xxsterminal_led_init(void)
++{
++        int ret;
++        ret = led_classdev_register(NULL, &xxsterminal_sysled);
++        if (ret < 0)
++        	return ret;
++
++        ret = led_classdev_register(NULL, &xxsterminal_led);
++        if (ret < 0)
++        	return ret;
++
++	return 0;
++}
++
++static void __exit xxsterminal_led_exit(void)
++{
++	led_classdev_unregister(&xxsterminal_sysled);
++	led_classdev_unregister(&xxsterminal_led);
++}
++
++module_init(xxsterminal_led_init);
++module_exit(xxsterminal_led_exit);
++
++MODULE_LICENSE("GPL");
++MODULE_DESCRIPTION("Front LED support for mycable XXSterminal Board");
++MODULE_AUTHOR("Alexander Bigga <ab@mycable.de>");
+--- linux-2.6.27/drivers/leds/leds-jadeevalkit.c	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/drivers/leds/leds-jadeevalkit.c	2009-01-08 10:49:41.000000000 +0100
+@@ -0,0 +1,108 @@
++/*
++ * drivers/leds/leds-xxterminal.c
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Alexander Bigga <ab@mycable.de>
++ *
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++#include <linux/module.h>
++#include <linux/types.h>
++#include <linux/kernel.h>
++#include <linux/device.h>
++#include <linux/leds.h>
++#include <asm/gpio.h>
++
++static void xxsevalkit_sysled_set(struct led_classdev *led_cdev,
++					enum led_brightness brightness)
++{
++	/* 0: off; 1: red; 2: orange; 3: green */
++	/* remember: led IOs are low active! */
++	switch (brightness) {
++		case 1:	xxsvideo_ioexpander_set_io(206, 0);
++			xxsvideo_ioexpander_set_io(207, 1);
++			break;
++		case 2:	xxsvideo_ioexpander_set_io(206, 0);
++			xxsvideo_ioexpander_set_io(207, 0);
++			break;
++		case 3:	xxsvideo_ioexpander_set_io(206, 1);
++			xxsvideo_ioexpander_set_io(207, 0);
++			break;
++		default:xxsvideo_ioexpander_set_io(206, 1);
++			xxsvideo_ioexpander_set_io(207, 1);
++			break;
++	}
++}
++
++static void xxsevalkit_led1_set(struct led_classdev *led_cdev,
++			enum led_brightness brightness)
++{
++	if (!brightness)
++		xxsvideo_ioexpander_set_io(216, 1);
++	else
++		xxsvideo_ioexpander_set_io(216, 0);
++}
++
++static void xxsevalkit_led2_set(struct led_classdev *led_cdev,
++			enum led_brightness brightness)
++{
++	if (!brightness)
++		xxsvideo_ioexpander_set_io(217, 1);
++	else
++		xxsvideo_ioexpander_set_io(217, 0);
++}
++
++static struct led_classdev xxsevalkit_sysled = {
++       .name = "jadeevalkit-sysled",
++       .brightness_set = xxsevalkit_sysled_set,
++/*       .default_trigger = "armflash",*/
++};
++
++static struct led_classdev xxsevalkit_led1 = {
++       .name = "jadeevalkit-led1",
++       .brightness_set = xxsevalkit_led1_set,
++/*       .default_trigger = "armflash", */
++};
++
++static struct led_classdev xxsevalkit_led2 = {
++       .name = "jadeevalkit-led2",
++       .brightness_set = xxsevalkit_led2_set,
++/*       .default_trigger = "armflash", */
++};
++
++static int __init xxsevalkit_led_init(void)
++{
++        int ret;
++        ret = led_classdev_register(NULL, &xxsevalkit_sysled);
++        if (ret < 0)
++        	return ret;
++
++        ret = led_classdev_register(NULL, &xxsevalkit_led1);
++        if (ret < 0)
++        	return ret;
++
++        ret = led_classdev_register(NULL, &xxsevalkit_led2);
++        if (ret < 0)
++        	return ret;
++
++	return 0;
++}
++
++static void __exit xxsevalkit_led_exit(void)
++{
++	led_classdev_unregister(&xxsevalkit_sysled);
++	led_classdev_unregister(&xxsevalkit_led1);
++	led_classdev_unregister(&xxsevalkit_led2);
++}
++
++module_init(xxsevalkit_led_init);
++module_exit(xxsevalkit_led_exit);
++
++MODULE_LICENSE("GPL");
++MODULE_DESCRIPTION("Front LED support for mycable XXSvideo Jade Eval Kit");
++MODULE_AUTHOR("Alexander Bigga <ab@mycable.de>");
diff --git a/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/03_diff-mycable-fb.patch b/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/03_diff-mycable-fb.patch
new file mode 100644
index 0000000..5a77f5d
--- /dev/null
+++ b/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/03_diff-mycable-fb.patch
@@ -0,0 +1,1024 @@
+--- linux-2.6.27.21/arch/arm/mach-xxsvideo/include/mach/xxsvideofb.h	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/mach-xxsvideo/include/mach/xxsvideofb.h	2009-11-27 09:03:10.000000000 +0000
+@@ -0,0 +1,50 @@
++/*
++ * linux/include/asm-arm/arch-xxsvideo/xxsvideofb.h
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Carsten Schneider <cs@mycable.de>, Alexander Bigga <ab@mycable.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++#ifndef __ASM_ARCH_XXSVIDEOFB_H
++#define __ASM_ARCH_XXSVIDEOFB_H
++
++#include <linux/fb.h>
++
++/*
++ * This structure describes the machine which we are running on.
++ * It is set in linux/arch/arm/mach-xxsvideo/machine_name.c and used in the probe routine
++ * of linux/drivers/video/xxsvideofb.c
++ */
++
++struct xxsvideofb_mode_info {
++//  	u_long		id;
++	char		*name;
++	u_char		bpp;
++	u_long	mode;	/* Display clock mode */
++	u_long	htp;	/* Horizontal Total Pixels */
++	u_long	hsp;	/* Horizontal Synchronize pulse Position */
++	u_long	hsw;	/* Horizontal Synchronize pulse Width */
++	u_long	hdp;	/* Horizontal Display Period */
++	u_long	vtr;	/* Vertical Total Rasters */
++	u_long	vsp;	/* Vertical Synchronize pulse Position */
++	u_long	vsw;	/* Vertical Synchronize pulse Width */
++	u_long	vdp;	/* Vertical Display Period */
++	u_long	xres;
++	u_long	yres;
++	u_long	size;
++};
++
++struct xxsvideofb_plat_data {
++	u_long                          pll_clk;        /* PLL clock */
++	u32                             dcm3;           /* DCM3 register */
++	struct xxsvideofb_mode_info     *mode_info;     /* initial mode */
++};
++
++extern struct xxsvideofb_mode_info xxsvideofb_fb_modes[];
++extern void __init xxsvideo_add_device_fb(unsigned int fb_nr, u32 dcm3);
++
++#endif
+--- linux-2.6.27.21/drivers/video/xxsvideofb.c	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/drivers/video/xxsvideofb.c	2010-07-05 08:48:21.000000000 +0000
+@@ -0,0 +1,636 @@
++/*
++ * BRIEF MODULE DESCRIPTION
++ *	xxsvideo/Fujitsu-Jade framebuffer driver.
++ *
++ * Copyright 2007 mycable GmbH
++ * Author: Carsten Schneider  <cs@mycable.de>,
++ *		Alexander Bigga <ab@mycable.de>
++ *
++ * Based on:
++ *	drivers/video/coralfb.c
++ *	framebuffer driver for Fujitsu-Coral-P
++ *  Created 2006 by mycable GmbH, Alexander Bigga <ab@mycable.de>
++ *
++ *  This program is free software; you can redistribute	 it and/or modify it
++ *  under  the terms of	 the GNU General  Public License as published by the
++ *  Free Software Foundation;  either version 2 of the	License, or (at your
++ *  option) any later version.
++ *
++ *  THIS  SOFTWARE  IS PROVIDED	  ``AS	IS'' AND   ANY	EXPRESS OR IMPLIED
++ *  WARRANTIES,	  INCLUDING, BUT NOT  LIMITED  TO, THE IMPLIED WARRANTIES OF
++ *  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN
++ *  NO	EVENT  SHALL   THE AUTHOR  BE	 LIABLE FOR ANY	  DIRECT, INDIRECT,
++ *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ *  NOT LIMITED	  TO, PROCUREMENT OF  SUBSTITUTE GOODS	OR SERVICES; LOSS OF
++ *  USE, DATA,	OR PROFITS; OR	BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
++ *  ANY THEORY OF LIABILITY, WHETHER IN	 CONTRACT, STRICT LIABILITY, OR TORT
++ *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ *  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ *
++ *  You should have received a copy of the  GNU General Public License along
++ *  with this program; if not, write  to the Free Software Foundation, Inc.,
++ *  675 Mass Ave, Cambridge, MA 02139, USA.
++ */
++
++
++#include <linux/module.h>
++#include <linux/kernel.h>
++#include <linux/errno.h>
++#include <linux/string.h>
++
++#include <linux/fb.h>
++#include <linux/init.h>
++#include <linux/device.h>
++#include <linux/platform_device.h>
++#include <asm/io.h>
++#include <asm/uaccess.h>
++#include <mach/platform.h>
++#include <mach/xxsvideofb.h>
++
++#include <linux/dma-mapping.h>
++
++
++#define DRIVER_NAME "xxsvideofb"
++
++/*
++ * Memory mapped IO Register offsets
++ */
++
++#define REG_DISPLAY_HTP			0x0004	/* horizontal total pixel */
++#define REG_DISPLAY_HDP			0x0008	/* horizontal display period */
++#define REG_DISPLAY_HSP			0x000C	/* horizontal synchronize pulse position */
++#define REG_DISPLAY_VTR			0x0010	/*  */
++#define REG_DISPLAY_VDP			0x0014	/*  */
++
++#define REG_DISPLAY_L0_M		0x0020
++#define REG_DISPLAY_L0_OA		0x0024   /* origin address */
++#define REG_DISPLAY_L0_DA		0x0028   /* display address */
++
++#define REG_DISPLAY_L0_DX		0x002C
++#define REG_DISPLAY_L0_DY		0x002E
++
++#define REG_DISPLAY_CUTC		0x00A0	/* cursor transparent mode */
++#define REG_DISPLAY_L0_TC		0x00BC	/* L0 transparent mode */
++#define REG_DISPLAY_L23_TC		0x00C0	/* L23 transparent mode */
++
++#define DISP_DCM_MASK			0xFFFF
++#define REG_DISPLAY_DCM0		0x0000	/* display control mode 0 */
++#define REG_DISPLAY_DCM1		0x0100	/* display control mode 1 */
++#define REG_DISPLAY_DCM2		0x0104	/* display control mode 2 */
++#define REG_DISPLAY_DCM3		0x0108	/* display control mode 3 */
++#define REG_DISPLAY_BACK_COL		0x0184	/* background colour */
++
++#define REG_DISPLAY_L0_EM		0x0110
++#define REG_DISPLAY_L0_WX		0x0114	/* windows x-position */
++#define REG_DISPLAY_L0_WY		0x0116	/* windows y-position */
++#define REG_DISPLAY_L0_WW		0x0118	/* windows width */
++#define REG_DISPLAY_L0_WH		0x011a	/* windows height */
++
++#define DISPLAY2_OFFSET         SZ_8K   /* display 2 offset */
++
++
++struct xxsvideofb_par {
++        volatile void __iomem 	*mmio;
++	volatile void __iomem 	*fb_base;
++	u32 pseudo_palette[17];
++	unsigned int xres;	/* last set x-resolution */
++	unsigned int yres;	/* last set y-resolution */
++// 	struct xxsvideofb_mode_info *mode;	/* last set video mdoe */ 
++	unsigned long pll_clk;	/* PLL clock */
++	u32 dcm3;		/* DCM3 register */
++};
++
++static struct fb_var_screeninfo xxsvideofb_defined __initdata = {
++        .activate       = FB_ACTIVATE_NOW,
++	.height = -1,
++	.width = -1,
++
++        .accel_flags    = FB_ACCEL_NONE,
++        .vmode          = FB_VMODE_NONINTERLACED,
++
++	.red = {10, 5, 0},	// { offset, length, msb_right }
++	.green = {5, 5, 0},	// { offset, length, msb_right }
++	.blue = {0, 5, 0},	// { offset, length, msb_right }
++	.transp = {15, 1, 0}
++};
++
++static struct fb_fix_screeninfo xxsvideofb_fix __initdata = {
++        .id             = "xxsvideo_fb",
++        .type           = FB_TYPE_PACKED_PIXELS,
++        .visual         = FB_VISUAL_TRUECOLOR,
++	.xpanstep =	0,
++	.ypanstep =	0,
++	.ywrapstep =	0,
++	.accel =	FB_ACCEL_NONE,
++        .mmio_len       = SZ_256K,
++};
++
++/*
++ * IO macros
++ */
++
++/*
++ * 2D engine routines
++ */
++
++/*
++ * helper routines
++ */
++void xxsvideofb_writel(struct fb_info *info, unsigned long reg, unsigned long val)
++{
++	struct xxsvideofb_par *par;
++
++	par = info->par;
++
++	__raw_writel( (val), par->mmio + reg);
++}
++
++void xxsvideofb_writel_par(struct xxsvideofb_par *par, unsigned long reg, unsigned long val)
++{
++	__raw_writel( (val), par->mmio + reg);
++}
++
++unsigned long xxsvideofb_readl(struct fb_info *info, unsigned long reg)
++{
++	struct xxsvideofb_par *par;
++
++	par = info->par;
++
++	return __raw_readl(par->mmio + reg);
++}
++
++
++/*
++ * globals
++ */
++
++/*
++ * prototypes
++ */
++
++
++static int xxsvideo_fbinit(struct fb_info *info)
++{
++	struct xxsvideofb_par *par = info->par;
++
++	xxsvideofb_writel(info, REG_DISPLAY_DCM0, 0x00010000);
++	xxsvideofb_writel(info, REG_DISPLAY_DCM3, par->dcm3);
++	return 0;
++}
++
++
++void xxsvideo_activate_var(struct fb_info *info, struct xxsvideofb_mode_info *mode)
++{
++	/* Parameters are decreased 1 because hardware spec is 0 to (n-1) */
++	unsigned long hdp;
++	unsigned long vdp;
++	unsigned long htp;
++	unsigned long hsp;
++	unsigned long hsw;
++	unsigned long vtr;
++	unsigned long vsp;
++	unsigned long vsw;
++	unsigned long hdb;
++
++	/* Mode Parameter for Clock divider */
++
++	/* Parameters are decreased 1 because hardware spec is 0 to (n-1) */
++	htp = mode->htp - 1;	/* Horizontal Total Pixel */
++	hsp = mode->hsp - 1;	/* Horizontal Synchronize pulse Position */
++	hsw = mode->hsw - 1;	/* Horizontal Synchronize pulse Width */
++	hdp = mode->hdp - 1;	/* Horizontal Display Period */
++	hdb = hdp;		/* Horizontal Display Boundary */
++
++	vtr = mode->vtr - 1;	/* Vertical Total Raster */
++	vsp = mode->vsp - 1;	/* Vertical Synchronize pulse Position */
++	vsw = mode->vsw - 1;	/* Vertical Synchronize pulse Width */
++	vdp = mode->vdp - 1;	/* Vertical Display Period */
++
++	xxsvideofb_writel(info, REG_DISPLAY_HTP, (htp << 16));
++	xxsvideofb_writel(info, REG_DISPLAY_HDP, (hdb << 16) | (hdp));
++	xxsvideofb_writel(info, REG_DISPLAY_HSP, (vsw << 24) | (hsw << 16) | (hsp));
++	xxsvideofb_writel(info, REG_DISPLAY_VTR, (vtr << 16));
++	xxsvideofb_writel(info, REG_DISPLAY_VDP, (vdp << 16) | (vsp));
++
++
++	/* set Display Parameters */
++
++	xxsvideofb_writel(info, REG_DISPLAY_L0_TC, 0);
++	xxsvideofb_writel(info, REG_DISPLAY_L23_TC, 0);
++
++	 /*RES 800X600 */
++	xxsvideofb_writel(info, REG_DISPLAY_L0_EM, 0);
++	xxsvideofb_writel(info, REG_DISPLAY_L0_DX, 0);
++	xxsvideofb_writel(info, REG_DISPLAY_L0_DY, 0);
++
++	xxsvideofb_writel(info, REG_DISPLAY_L0_WX, 0);
++	xxsvideofb_writel(info, REG_DISPLAY_L0_WY, 0);
++
++	/* Layer Window Width */
++	xxsvideofb_writel(info, REG_DISPLAY_L0_WW, mode->xres );
++	xxsvideofb_writel(info, REG_DISPLAY_L0_WH, mode->yres );
++
++	/* set Direct Color Mode and Display Dimensions */
++	xxsvideofb_writel(info, REG_DISPLAY_L0_M, 0x80000000 | 
++					((mode->xres / 32) << 16) | mode->yres);
++
++ 	xxsvideofb_writel(info, REG_DISPLAY_L0_OA, 
++					(unsigned long)info->fix.smem_start);
++ 	xxsvideofb_writel(info, REG_DISPLAY_L0_DA, 
++					(unsigned long)info->fix.smem_start);
++
++	/* set Display Timings and set Display on */
++	xxsvideofb_writel(info, REG_DISPLAY_DCM0, (mode->mode & DISP_DCM_MASK) | 0x80010000);
++}
++
++#if 0
++static int xxsvideofb_setcolreg (unsigned regno, unsigned red, unsigned green,
++			unsigned blue, unsigned transp, struct fb_info *info)
++{
++	return 0;
++}
++#else
++#define MAX_PALETTES	16
++
++/*
++ * Set a palette value from rgb components
++ * this is required by fbcon (framebuffer console)
++ */
++static int xxsvideofb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
++                             u_int trans, struct fb_info *info)
++{
++        unsigned int val;
++        int ret = 1;
++
++        /*
++         * If greyscale is true, then we convert the RGB value
++         * to greyscale no matter what visual we are using.   
++         */
++        if (info->var.grayscale)
++                red = green = blue = (19595 * red + 38470 * green + 7471 * blue) >> 16;
++
++        /*
++         * 16-bit True Colour.  We encode the RGB value
++         * according to the RGB bitfield information.  
++         */
++        if (regno < MAX_PALETTES) {
++                u32 *pal = info->pseudo_palette;
++
++                val = (red & 0xf800) | ((green & 0xfc00) >> 5) | ((blue & 0xf800) >> 11);
++                pal[regno] = val;
++                ret = 0;
++        }
++        return ret;
++}
++#endif
++
++/* xxsvideofb_check_var()
++   checks var values before set_par; currently checks nothing but it's 
++   necessary to use set_par 
++*/
++static int xxsvideofb_check_var(struct fb_var_screeninfo *var,
++			      struct fb_info *info)
++{
++        if ((var->xres) > 1280)
++                return -EINVAL;
++        if ((var->yres) > 1024)
++                return -EINVAL;
++
++	var->xres_virtual = var->xres;
++	var->yres_virtual = var->yres;
++
++	return 0;
++}
++
++/* xxsvidefb_set_par()
++   this function is called by fb_set_var (see fbmem.c). This happens during the 
++   first (!) register_framebuffer and on setting new modes by fbset from 
++   userspace.
++*/
++static int xxsvideofb_set_par(struct fb_info *info)
++{
++	struct xxsvideofb_par *par;
++	struct xxsvideofb_mode_info *mode = NULL;
++
++	par = info->par;
++
++        if (par->xres != info->var.xres || par->yres != info->var.yres) {
++		par->xres = info->var.xres;
++		par->yres = info->var.yres;
++
++		/* for valid resolution IDs look at fb_modes.c */
++		/* 800x600:  0 */
++		/* 800x480:  1 */
++		/* 640x480:  2 */
++		/* 1280x1024: 3 */
++		/* 1024x768: 4 */
++
++		switch (info->var.xres){
++			case 1280: mode = &xxsvideofb_fb_modes[3];
++				break;
++			case 1024: mode = &xxsvideofb_fb_modes[4];
++				break;
++			case 800: if (info->var.yres == 600)
++					mode = &xxsvideofb_fb_modes[0];
++				else
++					mode = &xxsvideofb_fb_modes[1];
++				break;
++			case 640:
++			default:
++				mode = &xxsvideofb_fb_modes[2];
++				break;
++		}
++
++		info->fix.line_length = mode->xres * mode->bpp / 8;
++ 		xxsvideo_activate_var(info, mode);
++        }
++        return 0;
++}
++
++
++static int xxsvideofb_pan_display(struct fb_var_screeninfo *var,
++                struct fb_info *info)
++{
++	if (var->vmode & FB_VMODE_YWRAP) {
++		if (var->yoffset < 0
++			|| var->yoffset >= info->var.yres_virtual
++			|| var->xoffset)
++			return -EINVAL;
++	} else {
++		if (var->xoffset + var->xres > info->var.xres_virtual ||
++			var->yoffset + var->yres > info->var.yres_virtual)
++			return -EINVAL;
++	}
++	info->var.xoffset = var->xoffset;
++	info->var.yoffset = var->yoffset;
++
++	if (var->vmode & FB_VMODE_YWRAP)
++		info->var.vmode |= FB_VMODE_YWRAP;
++	else
++		info->var.vmode &= ~FB_VMODE_YWRAP;
++	
++	return 0;
++}
++
++void xxsvideofb_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
++{
++}
++
++void xxsvideofb_copyarea(struct fb_info *info, const struct fb_copyarea *region)
++{
++}
++
++void xxsvideofb_imageblit(struct fb_info *info, const struct fb_image *image)
++{
++}
++
++static int xxsvideofb_mmap(struct fb_info *info,
++             struct vm_area_struct *vma)
++{
++	unsigned long start, len, off = vma->vm_pgoff << PAGE_SHIFT;
++
++	if ((vma->vm_end - vma->vm_start) >= info->fix.smem_len) {
++		start = info->fix.smem_start;
++		len = PAGE_ALIGN((start & ~PAGE_MASK) + info->fix.smem_len);
++// 		printk("/ab/%s TRACE 1 info->fix.start/smem_len, len %d/%d, len %d\n", __func__, start, info->fix.smem_len, len);
++	
++		if ((vma->vm_end - vma->vm_start + off) > len)
++			return -EINVAL;
++	
++		off += start;
++		vma->vm_pgoff = off >> PAGE_SHIFT;
++		vma->vm_flags |= VM_IO;
++		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
++		if (io_remap_pfn_range(vma, vma->vm_start, off >> PAGE_SHIFT,
++			vma->vm_end - vma->vm_start,
++			vma->vm_page_prot))
++			return -EAGAIN;
++
++		return 0;
++	}
++	start = info->fix.mmio_start;
++	len = PAGE_ALIGN((start & ~PAGE_MASK) + info->fix.mmio_len);
++
++	if ((vma->vm_end - vma->vm_start + off) > len)
++		return -EINVAL;
++	
++	off += start & PAGE_MASK;
++	vma->vm_pgoff = off >> PAGE_SHIFT;
++	vma->vm_flags |= VM_IO;
++	vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
++	
++	return io_remap_pfn_range(vma, vma->vm_start, off >> PAGE_SHIFT,
++			vma->vm_end - vma->vm_start,
++			vma->vm_page_prot);
++}
++
++static struct fb_ops xxsvideofb_ops = {
++	.owner		= THIS_MODULE,
++	.fb_set_par	= xxsvideofb_set_par,
++	.fb_check_var	= xxsvideofb_check_var,
++
++	.fb_setcolreg	= xxsvideofb_setcolreg,
++#if 0
++	.fb_ioctl       = xxsvideofb_ioctl,
++	.fb_blank       = xxsvideofb_blank,
++#endif	
++ 	.fb_pan_display = xxsvideofb_pan_display,
++ 	.fb_mmap	= xxsvideofb_mmap,
++#if 0
++	.fb_fillrect	= xxsvideofb_fillrect,
++	.fb_copyarea	= xxsvideofb_copyarea,
++	.fb_imageblit	= xxsvideofb_imageblit,
++#else
++	.fb_fillrect	= cfb_fillrect,
++	.fb_copyarea	= cfb_copyarea,
++	.fb_imageblit	= cfb_imageblit,
++#endif
++};
++
++
++static int __init xxsvideofb_probe (struct platform_device *pdev)
++{
++	static unsigned int fbcount = 0;
++	struct fb_info *info;
++	struct xxsvideofb_par *par;
++	struct xxsvideofb_plat_data *plat_data;
++	struct xxsvideofb_mode_info *mode;
++
++	struct device *dev = &pdev->dev;
++	struct resource *r1;
++	int ret;
++	resource_size_t start, len;
++
++	plat_data = dev->platform_data;
++	mode = plat_data->mode_info;
++
++	printk( "/ab/%s: ..., platform-name %s, id %i\n",
++		__func__, pdev->name, pdev->id);
++
++	r1 = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (!r1) {
++		ret = -ENXIO;
++		goto err_out;
++	}
++
++	printk( "/ab/%s: ..., start 0x%x, end 0x%x\n",
++		__func__, r1->start, r1->end);
++
++	info = framebuffer_alloc(sizeof(struct xxsvideofb_par), dev);
++	if (!info)
++		return -ENOMEM;
++
++	par = info->par;
++	par->pll_clk = plat_data->pll_clk;
++	par->dcm3 = plat_data->dcm3;
++
++	dev_set_drvdata(dev, info);
++	if (fb_alloc_cmap(&info->cmap, 256, 0) < 0)
++		goto err_cmap;
++
++	info->fbops = &xxsvideofb_ops;
++
++	/* set default for all */
++	info->fix = xxsvideofb_fix;
++	
++	/* set platform specific infos */
++	info->fix.line_length = mode->xres * mode->bpp / 8;
++
++	/* set default for all */
++	info->var = xxsvideofb_defined;
++	
++	/* set platform specific infos */
++	info->var.xres           = mode->xres;
++	info->var.yres           = mode->yres;
++	info->var.xres_virtual   = mode->xres;
++	info->var.yres_virtual   = mode->yres;
++	info->var.bits_per_pixel = mode->bpp;
++
++	info->flags = FBINFO_DEFAULT;
++	info->pseudo_palette = par->pseudo_palette;
++
++	/* Request the I/O MEM resource. */
++	start = r1->start;
++	len = r1->end - start + 1;
++	if (pdev->id != 0) start -= SZ_8K;
++	if (pdev->id != 0) len += SZ_8K;
++
++	/* MMIO mapping setup.  */
++	info->fix.mmio_start = start;
++	info->fix.mmio_len = len;
++
++	/* Frame buffer mapping setup.  */
++	info->fix.smem_len = SZ_8M;
++	
++	if (pdev->id == 0) {
++		par->mmio = ioremap_nocache(info->fix.mmio_start, 
++					info->fix.mmio_len);
++		if (!par->mmio)
++			goto err_resource;
++		
++		info->fix.smem_start = JADE_SDRAM_BASE + SZ_128M - SZ_16M;
++		info->screen_base = ioremap_nocache(info->fix.smem_start,
++							info->fix.smem_len);
++		if (!info->screen_base) {
++			printk( "%s: Cannot allocate video mem for fb0.\n" 
++				"Please reduce mem to 112MB. (boot-params: \
++				mem=112MB)\n", __func__);
++			goto err_smem_map;
++		}
++		fbcount++;
++	} else {
++		par->mmio = ioremap_nocache(info->fix.mmio_start + DISPLAY2_OFFSET,
++						info->fix.mmio_len);
++		if (!par->mmio)
++			goto err_resource;
++		
++		info->fix.smem_start = JADE_SDRAM_BASE + SZ_128M - SZ_8M;
++		info->screen_base = ioremap_nocache(info->fix.smem_start, 
++							info->fix.smem_len);
++		if (!info->screen_base) {
++			printk( "%s: Cannot allocate video mem for fb1.\n" 
++				"Please reduce mem to 112MB. (boot-params: \
++				mem=112MB)\n",	__func__);
++			goto err_smem_map;
++		}
++	}
++
++	info->screen_size = info->fix.smem_len;
++
++	/* Initialize black screen */
++ 	memset(info->screen_base, 0x00, info->screen_size);
++
++	xxsvideo_fbinit(info);
++	xxsvideo_activate_var(info, mode);
++
++ 	if (register_framebuffer(info) < 0) {
++		printk("%s: could not register framebuffer 0\n", __func__);
++ 		goto err_smem_map;
++ 	}
++
++	pr_info("fb%d: %s frame buffer device at %s\n",
++		info->node, info->fix.id, dev->bus_id);
++
++	return 0;
++
++err_smem_map:
++	iounmap(info->screen_base);
++
++err_resource:
++        release_mem_region(start, len);
++err_cmap:
++        fb_dealloc_cmap(&info->cmap);
++// err_alloc:
++	framebuffer_release(info);
++err_out:
++	return -ENXIO;
++}
++
++/*
++ *  Cleanup
++ */
++static int __devexit xxsvideofb_remove(struct platform_device *device)
++{
++	struct device *dev = &device->dev;
++	struct fb_info *info = (struct fb_info *)dev_get_drvdata(dev);
++
++	printk("/ab/%s: \n", __func__);
++	if (info) {
++		unregister_framebuffer(info);
++		fb_dealloc_cmap(&info->cmap);
++		framebuffer_release(info);
++	}
++	return 0;
++}
++
++static struct platform_driver xxsvideofb_driver = {
++	.driver	= {
++		.name	= "xxsvideo_fb",
++	},
++	.probe	= xxsvideofb_probe,
++	.remove = xxsvideofb_remove,
++#ifdef CONFIG_PM
++	.suspend= xxsvideofb_suspend,	/* optional but recommended */
++	.resume	= xxsvideofb_resume,	/* optional but recommended */
++#endif
++};
++
++static int __init xxsvideofb_init (void)
++{
++	int ret;
++
++	ret = platform_driver_register(&xxsvideofb_driver);
++	return ret;
++}
++
++static void __exit xxsvideofb_exit (void)
++{
++	platform_driver_unregister(&xxsvideofb_driver);
++}
++
++module_init(xxsvideofb_init);
++module_exit(xxsvideofb_exit);
++
++MODULE_AUTHOR("Carsten Schneider <cs@mycable.de>");
++MODULE_DESCRIPTION("framebuffer driver for xxsvideo/Fujitsu-Jade chipset");
++MODULE_LICENSE("GPL");
+--- linux-2.6.27/drivers/video/Makefile	2009-01-08 10:49:44.000000000 +0100
++++ linux-2.6.27-dev/drivers/video/Makefile	2009-01-08 10:49:41.000000000 +0100
+@@ -119,6 +119,7 @@
+ obj-$(CONFIG_FB_XILINX)           += xilinxfb.o
+ obj-$(CONFIG_FB_SH_MOBILE_LCDC)	  += sh_mobile_lcdcfb.o
+ obj-$(CONFIG_FB_OMAP)             += omap/
++obj-$(CONFIG_FB_XXSVIDEO)         += xxsvideofb.o
+ obj-$(CONFIG_XEN_FBDEV_FRONTEND)  += xen-fbfront.o
+ obj-$(CONFIG_FB_CARMINE)          += carminefb.o
+ 
+--- linux-2.6.27.21/drivers/video/Kconfig	2009-03-23 22:04:09.000000000 +0000
++++ linux-2.6.27.21-dev/drivers/video/Kconfig	2009-11-20 05:23:30.000000000 +0000
+@@ -1857,7 +1857,6 @@
+  	select FB_CFB_IMAGEBLIT
+ 	---help---
+ 	  Frame buffer driver for the w100 as found on the Sharp SL-Cxx series.
+-	  It can also drive the w3220 chip found on iPAQ hx4700.
+ 
+ 	  This driver is also available as a module ( = code which can be
+ 	  inserted and removed from the running kernel whenever you want). The
+@@ -2004,6 +2003,69 @@
+          and 8, 15 or 16 bpp color; 90 degrees clockwise display rotation for
+          panels <= 320 pixel horizontal resolution.
+ 
++config FB_XXSVIDEO
++	tristate "xxsvideo frame buffer support"
++	depends on FB && ARCH_JADE
++	select FB_CFB_FILLRECT
++	select FB_CFB_COPYAREA
++	select FB_CFB_IMAGEBLIT
++	---help---
++	  Include support for the xxsvideo framebuffer.
++
++choice
++	depends on FB_XXSVIDEO
++	prompt "xxsvideo frame buffer 0 default resolution"
++	default FB_XXSVIDEO_FB0_800_600
++
++config FB_XXSVIDEO_FB0_640_480
++	bool "640x480"
++	help
++
++config FB_XXSVIDEO_FB0_800_480
++	bool "800x480"
++	help
++
++config FB_XXSVIDEO_FB0_800_600
++	bool "800x600"
++	help
++
++config FB_XXSVIDEO_FB0_1024_768
++	bool "1024x768"
++	help
++
++config FB_XXSVIDEO_FB0_1280_1024
++	bool "1280x1024"
++	help
++
++endchoice 
++
++choice
++	depends on FB_XXSVIDEO && !MACH_XXSVIDEO_TERMINAL
++	prompt "xxsvideo frame buffer 1 default resolution"
++	default FB_XXSVIDEO_FB1_640_480
++
++config FB_XXSVIDEO_FB1_640_480
++	bool "640x480"
++	help
++
++config FB_XXSVIDEO_FB1_800_480
++	bool "800x480"
++	help
++
++config FB_XXSVIDEO_FB1_800_600
++	bool "800x600"
++	help
++
++config FB_XXSVIDEO_FB1_1024_768
++	bool "1024x768"
++	help
++
++config FB_XXSVIDEO_FB1_1280_1024
++	bool "1280x1024"
++	help
++
++endchoice 
++
+ config FB_VIRTUAL
+ 	tristate "Virtual Frame Buffer support (ONLY FOR TESTING!)"
+ 	depends on FB
+--- linux-2.6.27/arch/arm/mach-xxsvideo/sii164.c	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/arch/arm/mach-xxsvideo/sii164.c	2009-01-08 10:49:40.000000000 +0100
+@@ -0,0 +1,132 @@
++/*
++ * arch/arm/mach-xxsvideo/sii164.c
++ *
++ * Support for Silicon Image (SiI) 164 PanelLink Transmitter
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Alexander Bigga <ab@mycable.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++#include <linux/kernel.h>
++#include <linux/init.h>
++#include <linux/platform_device.h>
++#include <linux/module.h>
++#include <linux/i2c.h>
++#include <linux/slab.h>
++#include <linux/mutex.h>
++
++
++/*
++ * I2C Functions
++ */
++ /* write one byte to address */
++static int sii164_write_byte(struct i2c_client *client, int address, int value)
++{
++	u8 data[2];
++	struct i2c_msg message[] = {
++		{
++			.addr	= client->addr,
++			.flags	= 0,
++			.len	= 2,
++			.buf	= data,
++		},
++	};
++
++	data[0] = address & 0xff;
++	data[1] = value & 0xff;
++
++	if (i2c_transfer(client->adapter, message, 1) == 1)
++		return 0;
++
++	return -EIO;
++}
++
++static int sii164_read_byte(struct i2c_client *client, int address)
++{
++	u8 reg_addr[1];
++	u8 data[2];
++	struct i2c_msg message[2] = {
++		{
++			.addr	= client->addr,
++			.flags	= 0,
++			.len	= 1,
++			.buf	= reg_addr,
++		},
++		{
++			.addr	= client->addr,
++			.flags	= I2C_M_RD,
++			.len	= 0x1,
++			.buf	= data,
++		},
++	};
++
++	reg_addr[0] = address;
++	data[0] = 0x00;
++
++
++	if (i2c_transfer(client->adapter, message, 2) == 2)
++		return data[0];
++
++	return -EIO;
++}
++
++static int sii164_probe(struct i2c_client *client,
++			const struct i2c_device_id *id)
++{
++	int ret = 0;
++
++	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C
++				     | I2C_FUNC_SMBUS_BYTE_DATA)) {
++		ret = -ENODEV;
++		goto exit;
++	}
++
++	/* set IOCON.BANK = 1 --> change register mapping */
++	if (sii164_write_byte(client, 0x08, 0x37))
++		goto exit;
++	if (sii164_write_byte(client, 0x0c, 0x89))
++		goto exit;
++
++	dev_info(&client->dev, "probing chip done.\n");
++	return 0;
++exit:
++	dev_info(&client->dev, "probing chip failed!\n");
++	return ret;
++}
++
++
++static const struct i2c_device_id sii164_id[] = {
++	{ "sii164", 0 },
++	{ }
++};
++MODULE_DEVICE_TABLE(i2c, sii164_id);
++
++static struct i2c_driver sii164_driver = {
++	.driver = {
++		.name = "sii164",
++	},
++	.probe 		= sii164_probe,
++	.id_table       = sii164_id,
++};
++
++static int __init sii164_init(void)
++{
++	return i2c_add_driver(&sii164_driver);
++}
++
++static void __exit sii164_exit(void)
++{
++	/* remove i2c-driver */
++	i2c_del_driver(&sii164_driver);
++}
++
++MODULE_AUTHOR("Alexander Bigga <ab@mycable.de>");
++MODULE_DESCRIPTION("SIL 164 for XXSvideo-Extensions");
++MODULE_LICENSE("GPL");
++
++module_init(sii164_init);
++module_exit(sii164_exit);
+--- linux-2.6.27/arch/arm/mach-xxsvideo/fb_modes.c	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/arch/arm/mach-xxsvideo/fb_modes.c	2009-01-08 10:49:40.000000000 +0100
+@@ -0,0 +1,104 @@
++/*
++ * linux/arch/arm/mach-xxsvideo/fb_modes.c
++ *
++ *  Copyright (C) 2008 mycable GmbH
++ *	Alexander Bigga <ab@mycable.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++#include <linux/input.h>
++#include <linux/i2c.h>
++#include <linux/delay.h>
++
++#include <asm/mach/time.h>
++#include <asm/mach-types.h>
++
++#include <mach/board.h>
++#include <mach/xxsvideofb.h>
++
++#include "generic.h"
++struct xxsvideofb_mode_info xxsvideofb_fb_modes[] = {
++{
++// 	.name	= "800x600",
++	.mode	= 0x0700,
++	.bpp	= 16,
++	.htp	= 800+40+128+88,/* Horizontal Total Pixel */
++	.hsp	= 800+40,	/* Horizontal Synchronize pulse Position */
++	.hsw	= 128,		/* Horizontal Synchronize pulse Width */
++	.hdp	= 800,		/* Horizontal Display Period */
++	.vtr	= 600+3+1+29,	/* Vertical Total Raster */
++	.vsp	= 600+1,	/* Vertical Synchronize pulse Position */
++	.vsw	= 3,		/* Vertical Synchronize pulse Width */
++	.vdp	= 600,		/* Vertical Display Period */
++	.xres	= 800,
++	.yres	= 600,
++	.size	= ((800 * 600)/2),
++},{
++//   	.name   = "800x480",
++	//   .mode   = 0x0600,
++	//   .mode   = 0x0a00,
++	.mode   = 0x0900,
++	.bpp    = 16,
++	.htp    = 800+40+128+88,/* Horizontal Total Pixel */
++	.hsp    = 800+40,   /* Horizontal Synchronize pulse Position */
++	.hsw    = 128,      /* Horizontal Synchronize pulse Width */
++	.hdp    = 800,      /* Horizontal Display Period */
++	.vtr    = 480+1+10+34,  /* Vertical Total Raster */
++	.vsp    = 480+10,   /* Vertical Synchronize pulse Position */
++	.vsw    = 1,        /* Vertical Synchronize pulse Width */
++	.vdp    = 480,      /* Vertical Display Period */
++	.xres   = 800,
++	.yres   = 480,
++	.size   = ((800 * 480)/2),
++},{
++// 	.name   = "VGA_640x480",
++//      .mode   = 0x0a00,
++	.mode   = 0x0c00,
++	.bpp    = 16,
++	.htp    = 640+16+96+48, /* Horizontal Total Pixel */
++	.hsp    = 640+16,   /* Horizontal Synchronize pulse Position */
++	.hsw    = 96,       /* Horizontal Synchronize pulse Width */
++	.hdp    = 640,      /* Horizontal Display Period */
++	.vtr    = 480+1+10+34,  /* Vertical Total Raster */
++	.vsp    = 480+10,   /* Vertical Synchronize pulse Position */
++	.vsw    = 1,        /* Vertical Synchronize pulse Width */
++	.vdp    = 480,      /* Vertical Display Period */
++	.xres   = 640,
++	.yres   = 480,
++	.size   = ((640 * 480)/2),
++},{
++//     .name   = "1280x1024",
++	.mode   = 0x0200,
++	.bpp    = 16,
++	.htp    = 1280+84+150+150, /* 1664  Horizontal Total Pixel */
++	.hsp    = 1280+84,	/* Horizontal Synchronize pulse Position */
++	.hsw    = 150,		/* Horizontal Synchronize pulse Width */
++	.hdp    = 1280,		/* Horizontal Display Period */
++	.vtr    = 1024+10+3+48,	/* Vertical Total Raster */
++	.vsp    = 1024+10,	/* Vertical Synchronize pulse Position */
++	.vsw    = 3,		/* Vertical Synchronize pulse Width */
++	.vdp    = 1024,		/* Vertical Display Period */
++	.xres   = 1280,
++	.yres   = 1024,
++	.size   = ((1280 * 1024)/2),
++},{
++// 	.name	= "1024x768",
++	.mode	= 0x0400,
++	.bpp	= 16,
++	.htp	= 1024+24+136+200,/* Horizontal Total Pixel */
++	.hsp	= 1024+24,	/* Horizontal Synchronize pulse Position */
++	.hsw	= 136,		/* Horizontal Synchronize pulse Width */
++	.hdp	= 1024,		/* Horizontal Display Period */
++	.vtr	= 768+10+1+31,	/* Vertical Total Raster */
++	.vsp	= 768+1,	/* Vertical Synchronize pulse Position */
++	.vsw	= 5,		/* Vertical Synchronize pulse Width */
++	.vdp	= 768,		/* Vertical Display Period */
++	.xres	= 1024,
++	.yres	= 768,
++	.size	= ((1024 * 768)/2),
++},
++};
diff --git a/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/04_diff-mycable-i2c.patch b/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/04_diff-mycable-i2c.patch
new file mode 100644
index 0000000..876635d
--- /dev/null
+++ b/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/04_diff-mycable-i2c.patch
@@ -0,0 +1,974 @@
+--- linux-2.6.27.21/drivers/i2c/busses/i2c-xxsvideo.c	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/drivers/i2c/busses/i2c-xxsvideo.c	2009-11-20 05:34:34.000000000 +0000
+@@ -0,0 +1,569 @@
++/*
++ * linux/drivers/i2c/busses/i2c-xxsvideo.c
++ *
++ * This is a combined i2c adapter and algorithm driver for
++ *	the xxsvideo/Fujitsu-MB86R01(Jade)processor.
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Carsten Schneider <cs@mycable.de>, Alexander Bigga <ab@mycable.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++#include <linux/kernel.h>
++#include <linux/module.h>
++#include <linux/sched.h>
++#include <linux/init.h>
++#include <linux/platform_device.h>
++
++#include <asm/io.h>
++#include <asm/atomic.h>
++
++#include <linux/fsl_devices.h>
++#include <linux/i2c.h>
++#include <linux/interrupt.h>
++#include <linux/delay.h>
++#include <linux/wait.h>
++
++// #include <mach/timex.h>
++
++/* Jade I2C register adress definitions */
++#define JADE_I2C_REG_BSR	0x00	/* Bus Status Regster */
++#define JADE_I2C_REG_BCR	0x04	/* Bus Control Register */
++#define JADE_I2C_REG_CCR	0x08	/* Clock Control Register */
++#define JADE_I2C_REG_ADR	0x0C	/* Address Register */
++#define JADE_I2C_REG_DAR	0x10	/* Data Register */
++#define JADE_I2C_REG_ECSR	0x14	/* Expansion CS Register */
++#define JADE_I2C_REG_BCFR	0x18	/* Bus Clock Frequency Register */
++#define JADE_I2C_REG_BC2R	0x1C	/* Bus Control 2 Register */
++
++
++/* Jade I2C register bit definitions */
++#define	I2C_BSR_FBT		1<<0	/* First Byte Transfer */
++#define	I2C_BSR_GCA		1<<1	/* General Call Address */
++#define	I2C_BSR_AAS		1<<2	/* Address as Slave */
++#define	I2C_BSR_TRX		1<<3	/* Transfer/Receive */
++#define	I2C_BSR_LRB		1<<4	/* Last Received Bit */
++#define	I2C_BSR_AL		1<<5	/* Arbitration Lost */
++#define	I2C_BSR_RSC		1<<6	/* Repeated Start Condition */
++#define	I2C_BSR_BB		1<<7	/* Bus Busy */
++
++#define	I2C_BCR_INT		1<<0	/* Interrupt */
++#define	I2C_BCR_INTE		1<<1	/* Interrupt Enable */
++#define	I2C_BCR_GCAA		1<<2	/* General Call Access Acknowledge */
++#define	I2C_BCR_ACK		1<<3	/* Acknowledge */
++#define	I2C_BCR_MSS		1<<4	/* Master Slave Select */
++#define	I2C_BCR_SCC		1<<5	/* Start Condition Continue */
++#define	I2C_BCR_BEIE		1<<6	/* Bus Error Interrupt Enable */
++#define	I2C_BCR_BER		1<<7	/* Bus Error */
++
++#define	I2C_CCR_CS		0x1f	/* Clock Period Select */
++#define	I2C_CCR_EN		1<<5	/* Enable */
++#define	I2C_CCR_HSM		1<<6	/* High Speed Mode */
++
++#define	I2C_BC2R_SCLL		1<<0	/* SCL Low Drive */
++#define	I2C_BC2R_SDAL		1<<1	/* SDA Low Drive */
++#define	I2C_BC2R_SCLS		1<<4	/* SCL Status */
++#define	I2C_BC2R_SDAS		1<<5	/* SDA Status */
++
++
++#define PCLK_HZ			CONFIG_JADE_PACLK_FREQ /* APB-A clock */
++#define CLK_MASTER_NORMAL	(((PCLK_HZ / 100000) - 2) / 2) /*  209d = 0xd1 */
++#define CLK_MASTER_FAST		(((PCLK_HZ / 400000) - 2) * 2 / 3) /* 68d = 0x44 */
++
++#define WAIT_PCLK(n)		udelay( (1000000 / (PCLK_HZ / n)) + 10 )
++
++#if (PCLK_HZ <= 18000000)
++#define CCR_CS_NORMAL   ((CLK_MASTER_NORMAL - 65) & 0xff)
++#define CSR_CS_NORMAL   0x00
++#define CCR_CS_FAST     ((CLK_MASTER_FAST    - 1) & 0xff)
++#define CSR_CS_FAST     0x00
++#else /* (PCLK_HZ <= 18000000) */
++#define CCR_CS_NORMAL   ( (CLK_MASTER_NORMAL - 1)       & 0x1f)
++#define CSR_CS_NORMAL   (((CLK_MASTER_NORMAL - 1) >> 5) & 0x3f)
++#define CCR_CS_FAST     ( (CLK_MASTER_FAST   - 1)       & 0x1f)
++#define CSR_CS_FAST     (((CLK_MASTER_FAST   - 1) >> 5) & 0x3f)
++#endif /* (PCLK_HZ <= 18000000) */
++
++/* state */
++#define STATE_RUNNING           1               /* transfer running */
++#define STATE_SUCCESS           0               /* success */
++#define STATE_BER               (-EIO)          /* bus error */
++#define STATE_AL                (-EREMOTEIO)    /* arbitration lost */
++#define STATE_LBR               (-EFAULT)       /* NACK received */
++#define STATE_TIMEO             (-ETIMEDOUT)    /* timeout */
++
++struct xxsvideo_i2c {
++	void 			__iomem *base;
++	struct 			i2c_adapter adap;
++	int 			irq;
++	wait_queue_head_t	wait;
++	struct i2c_msg		*pmsg;
++	int			count;
++	atomic_t		state;
++};
++
++/*
++ * Function Declarations
++ */
++
++static int xxsvideo_i2c_master_recover(struct xxsvideo_i2c *);
++static short i2c_get_status(struct xxsvideo_i2c *, unsigned long, unsigned long);
++static int xxsvideo_read(struct xxsvideo_i2c *, struct i2c_msg *,
++			int);
++static int xxsvideo_write(struct xxsvideo_i2c *, struct i2c_msg *,
++			int);
++
++static irqreturn_t xxsvideo_i2c_isr(int irq, void *dev_id)
++{
++        struct xxsvideo_i2c *i2c = dev_id;
++	unsigned long bsr, bcr;
++	unsigned int ret;
++
++    	bcr = readl(i2c->base + JADE_I2C_REG_BCR);
++    	bsr = readl(i2c->base + JADE_I2C_REG_BSR);
++
++    	if (bcr & I2C_BCR_BER) { /* check bus error */
++
++		/* clear IRQ (BCR.BER=0) */
++		writel(I2C_BCR_BEIE, i2c->base + JADE_I2C_REG_BCR);
++
++		/* re-enable operation (CCR.EN=1) */
++		writel(CCR_CS_NORMAL | I2C_CCR_EN, i2c->base + JADE_I2C_REG_CCR );
++
++		/* re-enable interrupts (BCR.INTE=1) */
++		writel(I2C_BCR_INTE | I2C_BCR_BEIE, i2c->base + JADE_I2C_REG_BCR);
++
++		printk(KERN_WARNING "%s: bus error\n", __func__);
++		atomic_set(&i2c->state, STATE_BER);
++		wake_up_interruptible(&i2c->wait);
++
++	} else if (bsr & I2C_BSR_AL) { /* arbitration lost */
++
++		/* clear IRQ */
++		writel(I2C_BCR_INTE | I2C_BCR_BEIE, i2c->base + JADE_I2C_REG_BCR);
++
++		printk(KERN_WARNING "%s: arbitration lost\n", __func__);
++		atomic_set(&i2c->state, STATE_AL);
++		wake_up_interruptible(&i2c->wait);
++
++	} else if (atomic_read(&i2c->state) != STATE_RUNNING) {
++
++		writel(I2C_BCR_BEIE | I2C_BCR_INTE, i2c->base + JADE_I2C_REG_BCR);
++		printk("/ab/ %s: unexpected interrupt\n", __func__);
++
++	} else if (bcr & I2C_BCR_MSS) {
++
++		if (bsr & I2C_BSR_TRX) {
++			/* master send */
++			ret = xxsvideo_write(i2c, i2c->pmsg, 0);
++		} else {
++			/* master read */
++			ret = xxsvideo_read(i2c, i2c->pmsg, 0);
++		}
++
++	}
++	else {
++
++		/* clear IRQ */
++		writel(I2C_BCR_INTE | I2C_BCR_BEIE, i2c->base + JADE_I2C_REG_BCR);
++       	}
++
++        return IRQ_HANDLED;
++}
++
++static short i2c_get_status(struct xxsvideo_i2c *i2c, unsigned long reg,
++			unsigned long bit)
++{
++	int ret;
++	ret = readl(i2c->base + reg) & bit;
++
++	return (ret) ? 1 : 0;
++}
++
++/*
++ * Initialize the I2C hardware registers.
++ */
++static void xxsvideo_init_txr(struct xxsvideo_i2c *i2c)
++{
++	/* Set own Address (only if slave mode) */
++	writel(0x00, i2c->base + JADE_I2C_REG_ADR );
++
++	/* Set PCLK frequency */
++	/* FIXME: value? */
++	writel( ((PCLK_HZ / 20000000) + 1), i2c->base + JADE_I2C_REG_BCFR );
++
++	/* Set Clock and EN, mode normal */
++	writel(CSR_CS_NORMAL, i2c->base + JADE_I2C_REG_ECSR);
++	writel(CCR_CS_NORMAL | I2C_CCR_EN, i2c->base + JADE_I2C_REG_CCR );
++
++	/* Enable Interrupts */
++	writel(I2C_BCR_INTE | I2C_BCR_BEIE, i2c->base + JADE_I2C_REG_BCR);
++
++	/* init BC2R */
++	writel(0x00, i2c->base + JADE_I2C_REG_BC2R);
++}
++
++static int xxsvideo_i2c_master_recover(struct xxsvideo_i2c *i2c)
++{
++	unsigned int count = 0;
++	unsigned int bc2r;
++
++	/* monitor SDA, SCL */
++	bc2r = readl(i2c->base + JADE_I2C_REG_BC2R);
++
++	while (((bc2r & I2C_BC2R_SDAS)==0x00) &&
++		((bc2r & I2C_BC2R_SCLS) != 0x00)) {
++		WAIT_PCLK(10);
++		bc2r = readl(i2c->base + JADE_I2C_REG_BC2R);
++
++		/* another master is running */
++		if (++count >= 100) {
++			printk("/ab/%s: another master is running? \n", __func__);
++			return 1;
++		}
++	}
++
++	count = 0;
++
++	for (;;) {
++		/* SCLO forced low, and wait for L */
++		writel(I2C_BC2R_SCLL, i2c->base + JADE_I2C_REG_BC2R);
++
++		WAIT_PCLK(10);
++
++		/* SCLO forced high, and wait  */
++		writel(0x00, i2c->base + JADE_I2C_REG_BC2R);
++
++		WAIT_PCLK(5);
++
++		if (i2c_get_status(i2c, JADE_I2C_REG_BC2R, I2C_BC2R_SDAS) == 1) {
++			/* exit loop */
++			break;
++		}
++
++		if (++count > 9) {
++			bc2r = readl(i2c->base + JADE_I2C_REG_BC2R);
++			printk("/ab/%s: giving up. count = %i, bc2r = 0x%x SDA = %i\n", __func__, count, bc2r, i2c_get_status(i2c, JADE_I2C_REG_BC2R, I2C_BC2R_SDAS));
++			/* giving up */
++			return -1;
++		}
++
++	}
++
++	/* force bus-error phase */
++	writel(I2C_BC2R_SDAL, i2c->base + JADE_I2C_REG_BC2R);
++
++	WAIT_PCLK(1);
++
++	writel(0x00, i2c->base + JADE_I2C_REG_BC2R);
++
++	bc2r = readl(i2c->base + JADE_I2C_REG_BC2R);
++	if (((bc2r & I2C_BC2R_SDAS) == 0x00) ||
++			((bc2r & I2C_BC2R_SCLS) == 0x00)) {
++			printk("/ab/%s: giving up. bc2r = 0x%x? \n", __func__, bc2r);
++			/* giving up */
++			return -1;
++	}
++
++	/* success */
++	return 0;
++
++}
++
++static int xxsvideo_read(struct xxsvideo_i2c *i2c, struct i2c_msg *pmsg,
++			int restart)
++{
++	unsigned int bsr;
++
++	/* check if data or address */
++	bsr = readl(i2c->base + JADE_I2C_REG_BSR);
++    	if (!(bsr & I2C_BSR_FBT)) {
++        	/* data */
++        	pmsg->buf[i2c->count] = readl(i2c->base + JADE_I2C_REG_DAR);
++        	i2c->count++;
++	}
++
++	/* address, check slave NACK */
++	else if (bsr & I2C_BSR_LRB) {
++		/* clear IRQ (INT=0, BER=0), and set Stop Condition (MSS=0) */
++		writel(I2C_BCR_INTE | I2C_BCR_BEIE,
++			i2c->base + JADE_I2C_REG_BCR);
++		atomic_set(&i2c->state, STATE_LBR);
++		wake_up_interruptible(&i2c->wait);
++		return 0;
++    	}
++
++	if (i2c->count >= pmsg->len) {
++		/* clear IRQ, set Stop condition */
++		writel((I2C_BCR_BEIE | I2C_BCR_INTE),
++			i2c->base + JADE_I2C_REG_BCR);
++		i2c->count = pmsg->len + 1;
++		atomic_set(&i2c->state, STATE_SUCCESS);
++		wake_up_interruptible(&i2c->wait);
++	} else if (i2c->count + 1 >= pmsg->len) {
++		/* clear IRQ, don't acknowledge next data */
++		writel((I2C_BCR_BEIE | I2C_BCR_MSS | I2C_BCR_INTE),
++			i2c->base + JADE_I2C_REG_BCR);
++	} else {
++		/* clear IRQ, acknowledge next data */
++		writel((I2C_BCR_BEIE | I2C_BCR_MSS | I2C_BCR_INTE |
++			I2C_BCR_ACK), i2c->base + JADE_I2C_REG_BCR);
++	}
++
++	return 0;
++}
++
++static int xxsvideo_write(struct xxsvideo_i2c *i2c, struct i2c_msg *pmsg,
++                    int restart)
++{
++	unsigned int bsr_lrb;
++
++	/* end of data, or slave NACK */
++	bsr_lrb = i2c_get_status(i2c, JADE_I2C_REG_BSR, I2C_BSR_LRB);
++	if ( i2c->count >= pmsg->len || bsr_lrb ) {
++
++		/* clear IRQ (INT=0, BER=0), and set Stop Condition (MSS=0) */
++		writel((I2C_BCR_BEIE | I2C_BCR_INTE),
++			i2c->base + JADE_I2C_REG_BCR);
++
++		if (bsr_lrb)
++			atomic_set(&i2c->state, STATE_LBR);
++		else {
++			i2c->count = pmsg->len + 1;
++			atomic_set(&i2c->state, STATE_SUCCESS);
++		}
++		wake_up_interruptible(&i2c->wait);
++		return 0;
++	}
++
++	/* set data */
++	writel(pmsg->buf[i2c->count], i2c->base + JADE_I2C_REG_DAR);
++	i2c->count++;
++
++	/* clear IRQ, and continue */
++	writel((I2C_BCR_BEIE | I2C_BCR_MSS | I2C_BCR_INTE),
++			i2c->base + JADE_I2C_REG_BCR);
++
++	return 0;
++}
++
++static int xxsvideo_i2c_run_txr(struct xxsvideo_i2c *i2c, struct i2c_msg *pmsg)
++{
++	int ret = 0;
++
++	i2c->count = 0;
++	i2c->pmsg = pmsg;
++	atomic_set(&i2c->state, STATE_RUNNING);
++
++	/* write slave address */
++	if (pmsg->flags & I2C_M_RD)
++		writel((pmsg->addr<<1 | 1), i2c->base + JADE_I2C_REG_DAR);
++	else
++		writel((pmsg->addr<<1), i2c->base + JADE_I2C_REG_DAR);
++
++	/* set Start Condition, and enable IRQ */
++	writel( I2C_BCR_BEIE | I2C_BCR_MSS | I2C_BCR_INTE,
++		i2c->base + JADE_I2C_REG_BCR);
++
++	/* wait for end of transfer */
++	ret = wait_event_interruptible_timeout(i2c->wait, 
++	               atomic_read(&i2c->state) != STATE_RUNNING, HZ);
++	if (ret <= 0) { /* interrupted by signal or timed out */
++		atomic_set(&i2c->state, STATE_TIMEO);
++		synchronize_irq(i2c->irq);
++		writel(I2C_BCR_BEIE | I2C_BCR_INTE,
++		       i2c->base + JADE_I2C_REG_BCR);
++		if (ret < 0)
++			printk("/ab/ %s: interrupted by signal\n", __func__);
++		else
++			printk("/ab/ %s: timed out\n", __func__);
++	}
++
++	i2c->count = 0;
++	i2c->pmsg = NULL;
++	return atomic_read(&i2c->state);
++}
++
++static int xxsvideo_i2c_master(struct xxsvideo_i2c *i2c, struct i2c_msg *msgs, int num)
++{
++	int i, ret = 0;
++
++	xxsvideo_init_txr(i2c);
++
++	for (i = 0; i < num; i++)
++	{
++		ret = xxsvideo_i2c_run_txr(i2c, &msgs[i]);
++		if (ret != 0) {
++			/* bus error, lost arbitration */
++			if (ret == STATE_BER || ret == STATE_AL)
++				(void) xxsvideo_i2c_master_recover(i2c);
++			/* received NACK, timed out */
++			return ret;
++		}
++	}
++
++	return num;
++}
++
++static int xxsvideo_i2c_xfer(struct xxsvideo_i2c *i2c, struct i2c_msg *msgs, int num)
++{
++	unsigned long timeo;
++	int try, ret = 0;
++
++	timeo = jiffies + i2c->adap.timeout;
++
++	for (try = 0; try <= i2c->adap.retries; try++) {
++
++		ret = xxsvideo_i2c_master(i2c, msgs, num);
++		if (ret >= 0 || time_after(jiffies, timeo))
++			return ret;
++
++		udelay(100);
++	}
++
++	//printk("/ab/ %s: retries exceeded\n", __func__);
++	return ret;
++}
++
++static int xxsvideo_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
++{
++	int ret = 0;
++
++	struct xxsvideo_i2c *i2c = i2c_get_adapdata(adap);
++	ret = xxsvideo_i2c_xfer(i2c, msgs, num);
++
++	return (ret < 0) ? ret : num;
++}
++
++static u32 xxsvideo_functionality(struct i2c_adapter *adap)
++{
++	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
++}
++
++static const struct i2c_algorithm xxsvideo_algo = {
++	.master_xfer = xxsvideo_xfer,
++	.functionality = xxsvideo_functionality,
++};
++
++static struct i2c_adapter xxsvideo_ops = {
++	.owner = THIS_MODULE,
++	.name = "xxsvideo-adapter",
++	.algo = &xxsvideo_algo,
++	.class = I2C_CLASS_HWMON | I2C_CLASS_TV_ANALOG,
++        .timeout = 1, /* 1 tick (10 ms) */
++        .retries = 5,
++};
++
++static int __devinit xxsvideo_i2c_probe(struct platform_device *pdev)
++{
++	struct xxsvideo_i2c *i2c;
++	struct resource *r;
++	int ret;
++
++	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (!r) {
++		ret = -ENXIO;
++		goto err_out;
++	}
++
++	if (!request_mem_region(r->start, r->end - r->start + 1, "xxsvideo_i2c")) {
++		ret = -EBUSY;
++		goto err_out;
++	}
++
++	i2c = kzalloc(sizeof(struct xxsvideo_i2c), GFP_KERNEL);
++
++	if (!i2c) {
++		ret = -ENOMEM;
++		goto err_release;
++	}
++
++	init_waitqueue_head(&i2c->wait);
++	atomic_set(&i2c->state, STATE_SUCCESS);
++
++	i2c->base = ioremap(r->start, r->end - r->start + 1);
++	if (!i2c->base) {
++		ret = -ENOMEM;
++		goto err_free;
++	}
++
++        i2c->irq = platform_get_irq(pdev, 0);
++        if (i2c->irq < 0) {
++                ret = -ENXIO;
++                goto err_irq;
++        }
++
++        if (i2c->irq != 0)
++/*        	gl_irq = i2c->irq;
++        	save_client = i2c;*/
++                if ((ret = request_irq(i2c->irq, xxsvideo_i2c_isr,
++                                          IRQF_DISABLED, "i2c-xxsvideo", i2c)) < 0) {
++                        printk(KERN_ERR
++                               "i2c-xxsvideo - failed to attach interrupt\n");
++                        goto err_irq;
++                }
++	i2c->adap = xxsvideo_ops;
++	i2c_set_adapdata(&i2c->adap, i2c);
++	i2c->adap.dev.parent = &pdev->dev;
++
++	i2c->adap.nr = pdev->id;
++	ret = i2c_add_numbered_adapter(&i2c->adap);
++	if (ret <0)
++		goto err_add_adapter;
++	else {
++		platform_set_drvdata(pdev, i2c);
++		return 0;
++	}
++
++err_add_adapter:
++	if (i2c->irq != 0)
++                free_irq(i2c->irq, NULL);
++err_irq:
++	iounmap(i2c->base);
++err_free:
++	kfree(i2c);
++err_release:
++	release_mem_region(r->start, r->end - r->start + 1);
++err_out:
++	return ret;
++};
++
++static int xxsvideo_i2c_remove(struct platform_device *pdev)
++{
++	struct xxsvideo_i2c *i2c = platform_get_drvdata(pdev);
++
++	platform_set_drvdata(pdev, NULL);
++	i2c_del_adapter(&i2c->adap);
++	return 0;
++};
++
++/* Structure for a device driver */
++static struct platform_driver xxsvideo_i2c_driver = {
++	.probe = xxsvideo_i2c_probe,
++	.remove = xxsvideo_i2c_remove,
++	.driver	= {
++		.owner = THIS_MODULE,
++		.name = "xxsvideo_i2c",
++	},
++};
++
++static int __init xxsvideo_i2c_init(void)
++{
++	return platform_driver_register(&xxsvideo_i2c_driver);
++}
++
++static void __exit xxsvideo_i2c_exit(void)
++{
++	platform_driver_unregister(&xxsvideo_i2c_driver);
++}
++
++module_init(xxsvideo_i2c_init);
++module_exit(xxsvideo_i2c_exit);
++
++MODULE_AUTHOR("Carsten Schneider <cs@mycable.de>");
++MODULE_DESCRIPTION("I2C-Bus adapter for xxsvideo processor");
++MODULE_LICENSE("GPL");
+--- linux-2.6.27/drivers/i2c/busses/Makefile	2009-01-08 10:49:45.000000000 +0100
++++ linux-2.6.27-dev/drivers/i2c/busses/Makefile	2009-01-08 10:49:42.000000000 +0100
+@@ -66,6 +66,8 @@
+ obj-$(CONFIG_I2C_STUB)		+= i2c-stub.o
+ obj-$(CONFIG_SCx200_ACB)	+= scx200_acb.o
+ obj-$(CONFIG_SCx200_I2C)	+= scx200_i2c.o
++obj-$(CONFIG_I2C_XXSVIDEO)	+= i2c-xxsvideo.o
++
+ 
+ ifeq ($(CONFIG_I2C_DEBUG_BUS),y)
+ EXTRA_CFLAGS += -DDEBUG
+--- linux-2.6.27.21/drivers/i2c/busses/Kconfig	2009-03-23 22:04:09.000000000 +0000
++++ linux-2.6.27.21-dev/drivers/i2c/busses/Kconfig	2009-11-20 05:21:32.000000000 +0000
+@@ -700,4 +700,14 @@
+ 	  This support is also available as a module.  If so, the module
+ 	  will be called scx200_acb.
+ 
++config I2C_XXSVIDEO
++	tristate "XXSvideo I2C interface"
++	depends on ARCH_JADE
++	help
++	  If you say yes to this option, support will be included for the
++	  built-in I2C interface of the Fujitsu Jade/Jade-D SoC.
++
++	  This driver can also be built as a module.  If so, the module
++	  will be called i2c-xxsvideo.
++
+ endmenu
+--- linux-2.6.27/arch/arm/mach-xxsvideo/io-expander.c	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/arch/arm/mach-xxsvideo/io-expander.c	2009-01-08 10:49:40.000000000 +0100
+@@ -0,0 +1,371 @@
++/*
++ * arch/arm/mach-xxsvideo/io-expander.c
++ *
++ * Support for I/O-Expander MCP23017 from Microchip connected to I2C
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Alexander Bigga <ab@mycable.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++#include <linux/kernel.h>
++#include <linux/init.h>
++#include <linux/platform_device.h>
++#include <linux/module.h>
++#include <linux/i2c.h>
++#include <linux/slab.h>
++#include <linux/mutex.h>
++
++#include <mach/gpio.h>
++
++#define REG_IODIR	0x00
++#define REG_IPOL	0x01
++#define REG_GPINTEN	0x02
++#define REG_DEFVAL	0x03
++#define REG_INTCON	0x04
++#define REG_INTF	0x07
++#define REG_INTCAP	0x08
++#define REG_GPIO	0x09
++#define REG_OLAT	0x0a
++
++#define REG_B_OFFSET	0x10
++
++#define MAX_IO_EXPANDER	2
++
++/* GPIOs:
++ *
++ * Jade-Evalkit:
++ * 200-207: GPA
++ * 210-207: GPB
++ *
++ * Video-IN extension:
++ * 220-207: GPA
++ * 230-207: GPB
++ *
++ */
++static int xxsvideo_ioexpander_write(struct i2c_client *client, int address, int data);
++
++static struct i2c_client save_client[MAX_IO_EXPANDER];
++static int ioexp_nr = 0;
++
++static int get_gpio_offset(unsigned int gpio)
++{
++int ret;
++
++	if (gpio < 208)
++		ret = 200;
++	else if (gpio < 218)
++		ret = 210;
++	else if (gpio < 228)
++		ret = 220;
++	else if (gpio < 238)
++		ret = 230;
++	else
++		ret = 0;
++
++	return ret;
++}
++
++/*
++ * I2C Functions
++ */
++static int xxsvideo_ioexpander_write(struct i2c_client *client, int address, int value)
++{
++	u8 data[2];
++	struct i2c_msg message[] = {
++		{
++			.addr	= client->addr,
++			.flags	= 0,
++			.len	= 2,
++			.buf	= data,
++		},
++	};
++
++	data[0] = address & 0xff;
++	data[1] = value & 0xff;
++
++	if (i2c_transfer(client->adapter, message, 1) == 1)
++		return 0;
++
++	return -EIO;
++}
++
++static int xxsvideo_ioexpander_read(struct i2c_client *client, int address)
++{
++	u8 reg_addr[1];
++	u8 data[2];
++	int ret;
++	struct i2c_msg message[2] = {
++		{
++			.addr	= client->addr,
++			.flags	= 0,
++			.len	= 1,
++			.buf	= reg_addr,
++		},
++		{
++			.addr	= client->addr,
++			.flags	= I2C_M_RD,
++			.len	= 0x1,
++			.buf	= data,
++		},
++	};
++
++	reg_addr[0] = address;
++	data[0] = 0x00;
++
++	ret = i2c_transfer(client->adapter, message, 2);
++	if (ret == 2)
++		return data[0];
++
++	return -EIO;
++}
++
++/* set direction of gpio
++ *
++ * direction may be output, input, input with interrupts enabled
++ *
++ */
++int xxsvideo_ioexpander_gpio_direction(unsigned gpio, unsigned int dir)
++{
++	unsigned char reg_dir;
++	unsigned char reg_int;
++	unsigned char ionr;
++	unsigned char iodir;
++	unsigned char ioint;
++	unsigned char exnr;
++	unsigned int gpio_offset;
++
++
++	gpio_offset = get_gpio_offset(gpio);
++
++//  	printk("/ab/%s: gpio %d\n", __func__, gpio);
++	if (gpio_offset >= 220)
++		exnr = 1;
++	else
++		exnr = 0;
++
++	if (gpio_offset == 200 || gpio_offset == 220) {
++		iodir = REG_IODIR;
++		ioint = REG_GPINTEN;
++	} else {
++		iodir = REG_IODIR + REG_B_OFFSET;
++		ioint = REG_GPINTEN + REG_B_OFFSET;
++	}
++	ionr = gpio - gpio_offset;
++
++	reg_dir = xxsvideo_ioexpander_read(&save_client[exnr], iodir);
++	reg_int = xxsvideo_ioexpander_read(&save_client[exnr], ioint);
++	/* 1: input
++	   0: output */
++	if (dir & GPIO_DIR_INPUT) {
++		reg_dir = reg_dir | dir<<ionr;
++		/* enable / disable interrupt enable */
++		if (dir & GPIO_DIR_INT_EN)
++			reg_int = reg_int | 1<<ionr;
++		else
++			reg_int = reg_int & ~(1<<ionr);
++		/* write GPINTEN register */
++		xxsvideo_ioexpander_write(&save_client[exnr], ioint, reg_int);
++	}
++	else
++		reg_dir = reg_dir & ~(1<<ionr);
++
++	/* write IODIR register */
++	xxsvideo_ioexpander_write(&save_client[exnr], iodir, reg_dir);
++
++	return 0;
++}
++EXPORT_SYMBOL(xxsvideo_ioexpander_gpio_direction);
++
++
++static int xxsvideo_ioexpander_probe(struct i2c_client *client,
++			const struct i2c_device_id *id)
++{
++	int rc = 0, ret;
++
++	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C
++				     | I2C_FUNC_SMBUS_BYTE_DATA)) {
++		rc = -ENODEV;
++		goto exit;
++	}
++
++	save_client[ioexp_nr] = *client;
++	dev_info(&client->dev, "probe chip at address 0x%x...\n", save_client[ioexp_nr].addr);
++	ioexp_nr++;
++
++	/* set IOCON.BANK = 1 --> change register mapping */
++	if (xxsvideo_ioexpander_write(client, REG_OLAT, 0x80))
++		goto exit;
++
++	/* read INTCAP to reset INTA and INTB  */
++	ret = xxsvideo_ioexpander_read(client, REG_INTCAP);
++	ret = xxsvideo_ioexpander_read(client, REG_INTCAP + REG_B_OFFSET);
++
++	/* set GPINTEN --> disable Interrupt on Change
++	 *             --> may be enabled with xxsvideo_ioexpander_gpio_direction
++	 */
++	xxsvideo_ioexpander_write(client, REG_GPINTEN, 0);
++	xxsvideo_ioexpander_write(client, REG_GPINTEN + REG_B_OFFSET, 0);
++
++	dev_info(&client->dev, "probing chip done\n");
++	return 0;
++exit:
++	dev_info(&client->dev, "probing chip failed!\n");
++
++	return rc;
++}
++
++static int xxsvideo_ioexpander_remove(struct i2c_client *client)
++{
++	int ret;
++	/* set all GPIOs back to input */
++	ret = xxsvideo_ioexpander_write(client, REG_IODIR, 0xff);
++	if (ret)
++		goto failure;
++	ret = xxsvideo_ioexpander_write(client, REG_IODIR + REG_B_OFFSET, 0xff);
++	if (ret)
++		goto failure;
++
++	return 0;
++failure:
++	return ret;
++}
++
++
++int xxsvideo_ioexpander_set_io(unsigned int gpio, unsigned char val)
++{
++	unsigned char reg;
++	unsigned char ionr;
++	unsigned char iodir;
++	unsigned char exnr;
++	unsigned int gpio_offset;
++
++
++	gpio_offset = get_gpio_offset(gpio);
++
++//  	printk("/ab/%s: gpio %d\n", __func__, gpio);
++	if (gpio_offset >= 220)
++		exnr = 1;
++	else
++		exnr = 0;
++
++//  	printk("/ab/%s: gpio %d, exnr %i, gpio_offset %d\n", __func__, gpio, exnr, gpio_offset);
++
++	/*
++	* 1. read the IO DIRA and DIRB-registers
++	* 2. set selected gpio to output
++	* 3. set gpio
++	*/
++	xxsvideo_ioexpander_gpio_direction(gpio, GPIO_DIR_OUTPUT);
++
++	if (gpio_offset == 200 || gpio_offset == 220)
++		iodir = REG_GPIO;
++	else
++		iodir = REG_GPIO + REG_B_OFFSET;
++
++	ionr = gpio - gpio_offset;
++
++	reg = xxsvideo_ioexpander_read(&save_client[exnr], iodir);
++
++
++	if (val > 0)
++		reg = reg | 1<<ionr;
++	else
++		reg = reg & ~(1<<ionr);
++
++	xxsvideo_ioexpander_write(&save_client[exnr], iodir, reg);
++
++	return 0;
++}
++EXPORT_SYMBOL(xxsvideo_ioexpander_set_io);
++
++int xxsvideo_ioexpander_get_intf(unsigned int gpio)
++{
++	unsigned char reg;
++	unsigned char iodir;
++	unsigned char exnr;
++	unsigned int gpio_offset;
++
++	gpio_offset = get_gpio_offset(gpio);
++
++//  	printk("/ab/%s: gpio %d\n", __func__, gpio);
++	if (gpio_offset >= 220)
++		exnr = 1;
++	else
++		exnr = 0;
++
++	if (gpio_offset == 200 || gpio_offset == 220)
++		iodir = REG_INTF;
++	else
++		iodir = REG_INTF + REG_B_OFFSET;
++
++	reg = xxsvideo_ioexpander_read(&save_client[exnr], iodir);
++
++	return reg;
++}
++EXPORT_SYMBOL(xxsvideo_ioexpander_get_intf);
++
++
++int xxsvideo_ioexpander_get_io(unsigned int gpio)
++{
++	int ret2;
++	unsigned char iodir;
++	unsigned char exnr;
++	unsigned int gpio_offset;
++
++	gpio_offset = get_gpio_offset(gpio);
++
++//  	printk("/ab/%s: gpio %d\n", __func__, gpio);
++	if (gpio_offset >= 220)
++		exnr = 1;
++	else
++		exnr = 0;
++
++	if (gpio_offset == 200 || gpio_offset == 220)
++		iodir = REG_GPIO;
++	else
++		iodir = REG_GPIO + REG_B_OFFSET;
++
++	ret2 = xxsvideo_ioexpander_read(&save_client[exnr], iodir);
++
++	return ret2;
++}
++EXPORT_SYMBOL(xxsvideo_ioexpander_get_io);
++
++static const struct i2c_device_id xxsvideo_ioexpander_id[] = {
++	{ "ioexpander", 0 },
++	{ }
++};
++MODULE_DEVICE_TABLE(i2c, xxsvideo_ioexpander_id);
++
++static struct i2c_driver xxsvideo_ioexpander_driver = {
++	.driver = {
++		.name = "xxsvideo-ioexpander",
++	},
++	.probe 		= xxsvideo_ioexpander_probe,
++	.remove		= xxsvideo_ioexpander_remove,
++	.id_table	= xxsvideo_ioexpander_id,
++};
++
++static int __init xxsvideo_ioexpander_init(void)
++{
++	return i2c_add_driver(&xxsvideo_ioexpander_driver);
++}
++
++static void __exit xxsvideo_ioexpander_exit(void)
++{
++	/* remove i2c-driver */
++	i2c_del_driver(&xxsvideo_ioexpander_driver);
++}
++
++MODULE_AUTHOR("Alexander Bigga <ab@mycable.de>");
++MODULE_DESCRIPTION("MCP23017 I/O-Expander for XXSvideo-Extensions");
++MODULE_LICENSE("GPL");
++
++fs_initcall(xxsvideo_ioexpander_init);
++//module_init(xxsvideo_ioexpander_init);
++module_exit(xxsvideo_ioexpander_exit);
++
diff --git a/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/05_diff-mycable-usb.patch b/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/05_diff-mycable-usb.patch
new file mode 100644
index 0000000..9a7cd4d
--- /dev/null
+++ b/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/05_diff-mycable-usb.patch
@@ -0,0 +1,619 @@
+--- linux-2.6.27.21/drivers/usb/host/ohci-hcd.c	2009-03-23 22:04:09.000000000 +0000
++++ linux-2.6.27.21-dev/drivers/usb/host/ohci-hcd.c	2009-11-20 05:22:54.000000000 +0000
+@@ -1045,6 +1045,11 @@
+ #define PLATFORM_DRIVER		ohci_hcd_at91_driver
+ #endif
+ 
++#ifdef CONFIG_ARCH_JADE_MB86R01
++#include "ohci-xxsvideo.c"
++#define PLATFORM_DRIVER		ohci_hcd_xxsvideo_driver
++#endif
++
+ #ifdef CONFIG_ARCH_PNX4008
+ #include "ohci-pnx4008.c"
+ #define PLATFORM_DRIVER		usb_hcd_pnx4008_driver
+--- linux-2.6.27.21/drivers/usb/host/ehci-hcd.c	2009-03-23 22:04:09.000000000 +0000
++++ linux-2.6.27.21-dev/drivers/usb/host/ehci-hcd.c	2009-11-20 05:22:31.000000000 +0000
+@@ -1041,6 +1041,11 @@
+ #define	PLATFORM_DRIVER		ixp4xx_ehci_driver
+ #endif
+ 
++#ifdef CONFIG_ARCH_JADE_MB86R01
++#include "ehci-xxsvideo.c" 
++#define PLATFORM_DRIVER		ehci_hcd_xxsvideo_driver
++#endif
++
+ #if !defined(PCI_DRIVER) && !defined(PLATFORM_DRIVER) && \
+     !defined(PS3_SYSTEM_BUS_DRIVER) && !defined(OF_PLATFORM_DRIVER)
+ #error "missing bus glue for ehci-hcd"
+--- linux-2.6.27.21/drivers/usb/host/ohci-xxsvideo.c	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/drivers/usb/host/ohci-xxsvideo.c	2009-11-20 05:23:06.000000000 +0000
+@@ -0,0 +1,292 @@
++/*
++ * linux/drivers/usb/host/ohci-xxsvideo.c
++ *
++ * OHCI HCD (Host Controller Driver) for USB.
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Alexander Bigga <ab@mycable.de>
++ *
++ * XXSvideo Bus Glue
++ *
++ * Based on ohci-at91.c
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++#include <linux/platform_device.h>
++
++#include <asm/mach-types.h>
++#include <mach/hardware.h>
++#include <mach/board.h>
++
++
++#ifndef CONFIG_ARCH_JADE_MB86R01
++#error "CONFIG_ARCH_JADE_MB86R01 must be defined."
++#endif
++
++/* interface and function clocks; sometimes also an AHB clock */
++
++extern int usb_disabled(void);
++
++/*-------------------------------------------------------------------------*/
++
++static void xxsvideo_start_hc(struct platform_device *pdev)
++{
++	struct usb_hcd *hcd = platform_get_drvdata(pdev);
++	struct ohci_regs __iomem *regs = hcd->regs;
++
++	/*
++	 * The USB host controller must remain in reset.
++	 */
++	writel(0, &regs->control);
++}
++
++static void xxsvideo_stop_hc(struct platform_device *pdev)
++{
++	struct usb_hcd *hcd = platform_get_drvdata(pdev);
++	struct ohci_regs __iomem *regs = hcd->regs;
++
++	dev_dbg(&pdev->dev, "stop\n");
++
++	/*
++	 * Put the USB host controller into reset.
++	 */
++	writel(0, &regs->control);
++}
++
++/*-------------------------------------------------------------------------*/
++
++static int usb_hcd_xxsvideo_remove (struct usb_hcd *, struct platform_device *);
++
++/* configure so an HC device and id are always provided */
++/* always called with process context; sleeping is OK */
++
++static int usb_hcd_xxsvideo_probe(const struct hc_driver *driver,
++			struct platform_device *pdev)
++{
++	int retval;
++	struct usb_hcd *hcd = NULL;
++
++	printk("/ab/%s:\n", __func__);
++	if (pdev->num_resources != 2) {
++		pr_debug("hcd probe: invalid num_resources");
++		return -ENODEV;
++	}
++
++	if ((pdev->resource[0].flags != IORESOURCE_MEM)
++			|| (pdev->resource[1].flags != IORESOURCE_IRQ)) {
++		pr_debug("hcd probe: invalid resource type\n");
++		return -ENODEV;
++	}
++
++	hcd = usb_create_hcd(driver, &pdev->dev, "xxsvideo");
++	if (!hcd)
++		return -ENOMEM;
++	hcd->rsrc_start = pdev->resource[0].start;
++	hcd->rsrc_len = pdev->resource[0].end - pdev->resource[0].start + 1;
++
++	if (!request_mem_region(hcd->rsrc_start, hcd->rsrc_len, hcd_name)) {
++		pr_debug("request_mem_region failed\n");
++		retval = -EBUSY;
++		goto err1;
++	}
++
++	hcd->regs = ioremap(hcd->rsrc_start, hcd->rsrc_len);
++	if (!hcd->regs) {
++		pr_debug("ioremap failed\n");
++		retval = -EIO;
++		goto err2;
++	}
++
++// 	hcd->regs = (void __iomem *) hcd->rsrc_start;
++	printk("/ab/%s: revision: 0x%x, control: 0x%x\n", __func__, readl(hcd->regs), readl(hcd->regs + 4));
++
++	xxsvideo_start_hc(pdev);
++	ohci_hcd_init(hcd_to_ohci(hcd));
++
++	retval = usb_add_hcd(hcd, pdev->resource[1].start, IRQF_DISABLED);
++	if (retval == 0)
++		return retval;
++
++	/* Error handling */
++	xxsvideo_stop_hc(pdev);
++
++ 	iounmap(hcd->regs);
++
++ err2:
++	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
++
++ err1:
++	usb_put_hcd(hcd);
++	return retval;
++}
++
++
++/* may be called with controller, bus, and devices active */
++
++/**
++ * usb_hcd_xxsvideo_remove - shutdown processing for AT91-based HCDs
++ * @dev: USB Host Controller being removed
++ * Context: !in_interrupt()
++ *
++ * Reverses the effect of usb_hcd_xxsvideo_probe(), first invoking
++ * the HCD's stop() method.  It is always called from a thread
++ * context, "rmmod" or something similar.
++ *
++ */
++static int usb_hcd_xxsvideo_remove(struct usb_hcd *hcd,
++				struct platform_device *pdev)
++{
++	usb_remove_hcd(hcd);
++	xxsvideo_stop_hc(pdev);
++	iounmap(hcd->regs);
++	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
++
++
++	dev_set_drvdata(&pdev->dev, NULL);
++	return 0;
++}
++
++/*-------------------------------------------------------------------------*/
++
++static int __devinit
++ohci_xxsvideo_start (struct usb_hcd *hcd)
++{
++	struct xxsvideo_usbh_data	*board = hcd->self.controller->platform_data;
++	struct ohci_hcd		*ohci = hcd_to_ohci (hcd);
++	int			ret;
++
++	printk("/ab/%s: num_ports: %i\n", __func__, board->ports);
++	if ((ret = ohci_init(ohci)) < 0)
++		return ret;
++
++	ohci->num_ports = board->ports;
++
++	if ((ret = ohci_run(ohci)) < 0) {
++		err("can't start %s", hcd->self.bus_name);
++		ohci_stop(hcd);
++		return ret;
++	}
++	return 0;
++}
++
++/*-------------------------------------------------------------------------*/
++
++static const struct hc_driver ohci_xxsvideo_hc_driver = {
++	.description =		hcd_name,
++	.product_desc =		"XXSVIDEO OHCI",
++	.hcd_priv_size =	sizeof(struct ohci_hcd),
++
++	/*
++	 * generic hardware linkage
++	 */
++	.irq =			ohci_irq,
++	.flags =		HCD_USB11 | HCD_MEMORY,
++
++	/*
++	 * basic lifecycle operations
++	 */
++	.start =		ohci_xxsvideo_start,
++	.stop =			ohci_stop,
++	.shutdown =		ohci_shutdown,
++
++	/*
++	 * managing i/o requests and associated device resources
++	 */
++	.urb_enqueue =		ohci_urb_enqueue,
++	.urb_dequeue =		ohci_urb_dequeue,
++	.endpoint_disable =	ohci_endpoint_disable,
++
++	/*
++	 * scheduling support
++	 */
++	.get_frame_number =	ohci_get_frame,
++
++	/*
++	 * root hub support
++	 */
++	.hub_status_data =	ohci_hub_status_data,
++	.hub_control =		ohci_hub_control,
++//	.hub_irq_enable =	ohci_rhsc_enable,
++#ifdef CONFIG_PM
++	.bus_suspend =		ohci_bus_suspend,
++	.bus_resume =		ohci_bus_resume,
++#endif
++	.start_port_reset =	ohci_start_port_reset,
++};
++
++/*-------------------------------------------------------------------------*/
++
++static int ohci_hcd_xxsvideo_drv_probe(struct platform_device *pdev)
++{
++	printk("/ab/%s:\n", __func__);
++	device_init_wakeup(&pdev->dev, 1);
++	return usb_hcd_xxsvideo_probe(&ohci_xxsvideo_hc_driver, pdev);
++}
++
++static int ohci_hcd_xxsvideo_drv_remove(struct platform_device *pdev)
++{
++	printk("/ab/%s:\n", __func__);
++	device_init_wakeup(&pdev->dev, 0);
++	return usb_hcd_xxsvideo_remove(platform_get_drvdata(pdev), pdev);
++}
++
++#ifdef CONFIG_PM
++
++static int
++ohci_hcd_xxsvideo_drv_suspend(struct platform_device *pdev, pm_message_t mesg)
++{
++	struct usb_hcd	*hcd = platform_get_drvdata(pdev);
++	struct ohci_hcd	*ohci = hcd_to_ohci(hcd);
++
++	if (device_may_wakeup(&pdev->dev))
++		enable_irq_wake(hcd->irq);
++
++	/*
++	 * The integrated transceivers seem unable to notice disconnect,
++	 * reconnect, or wakeup without the 48 MHz clock active.  so for
++	 * correctness, always discard connection state (using reset).
++	 *
++	 * REVISIT: some boards will be able to turn VBUS off...
++	 */
++	if (xxsvideo_suspend_entering_slow_clock()) {
++		ohci_usb_reset (ohci);
++		xxsvideo_stop_clock();
++	}
++
++	return 0;
++}
++
++static int ohci_hcd_xxsvideo_drv_resume(struct platform_device *pdev)
++{
++	struct usb_hcd	*hcd = platform_get_drvdata(pdev);
++
++	if (device_may_wakeup(&pdev->dev))
++		disable_irq_wake(hcd->irq);
++
++	if (!clocked)
++		xxsvideo_start_clock();
++
++	return 0;
++}
++#else
++#define ohci_hcd_xxsvideo_drv_suspend NULL
++#define ohci_hcd_xxsvideo_drv_resume  NULL
++#endif
++
++MODULE_ALIAS("xxsvideo_ohci");
++
++static struct platform_driver ohci_hcd_xxsvideo_driver = {
++	.probe		= ohci_hcd_xxsvideo_drv_probe,
++	.remove		= ohci_hcd_xxsvideo_drv_remove,
++	.shutdown	= usb_hcd_platform_shutdown,
++	.suspend	= ohci_hcd_xxsvideo_drv_suspend,
++	.resume		= ohci_hcd_xxsvideo_drv_resume,
++	.driver		= {
++		.name	= "xxsvideo_ohci",
++		.owner	= THIS_MODULE,
++	},
++};
+--- linux-2.6.27.21/drivers/usb/host/ehci-xxsvideo.c	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/drivers/usb/host/ehci-xxsvideo.c	2009-11-20 05:22:43.000000000 +0000
+@@ -0,0 +1,266 @@
++/*
++ * linux/drivers/usb/host/ehci-xxsvideo.c
++ *
++ * EHCI HCD (Host Controller Driver) for USB.
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *       Alexander Bigga <ab@mycable.de>
++ *
++ * XXSvideo Bus Glue
++ *
++ * Based on ehci-au1xxx.c
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++#include <linux/platform_device.h>
++
++#include <asm/mach-types.h>
++#include <mach/hardware.h>
++#include <mach/board.h>
++#include <asm/irq.h>
++
++
++#ifndef CONFIG_ARCH_JADE_MB86R01
++#error "CONFIG_ARCH_JADE_MB86R01 must be defined."
++#endif
++
++extern int usb_disabled(void);
++/*-------------------------------------------------------------------------*/
++static irqreturn_t
++xxsvideo_ehci_interrupt(int irq, void *dev_id)
++{
++	int			ret = IRQ_NONE;
++
++	/* ?? /ab/ D- Pull-down is ON; D+ Pull-down is OFF ??*/
++	printk("/ab/%s: USB PHYCNT: 0x%x, 0x%x, 0x%x\n", __func__, 
++		 __raw_readl(JADE_PHYCNT_BASE), 
++		 __raw_readl(JADE_PHYCNT_BASE+0x04), 
++		 __raw_readl(JADE_PHYCNT_BASE+0x08));
++
++	ret = IRQ_HANDLED;
++	
++	return ret;
++}
++
++/*-------------------------------------------------------------------------*/
++static void xxsvideo_start_ehc(struct platform_device *dev)
++{
++	int ret = 0;
++	printk("/ab/%s: \n", __func__);
++	ret = request_irq(INT_PHYCNT, xxsvideo_ehci_interrupt, 0,
++			"ehci phycnt", dev);
++
++}
++
++static void xxsvideo_stop_ehc(struct platform_device *dev)
++{
++	printk("/ab/%s: \n", __func__);
++}
++
++/*-------------------------------------------------------------------------*/
++
++/* configure so an HC device and id are always provided */
++/* always called with process context; sleeping is OK */
++
++/**
++ * usb_ehci_xxsvideo_probe - initialize Au1xxx-based HCDs
++ * Context: !in_interrupt()
++ *
++ * Allocates basic resources for this USB host controller, and
++ * then invokes the start() method for the HCD associated with it
++ * through the hotplug entry's driver_data.
++ *
++ */
++int usb_ehci_xxsvideo_probe(const struct hc_driver *driver,
++			  struct usb_hcd **hcd_out, struct platform_device *dev)
++{
++	int retval;
++	struct usb_hcd *hcd;
++	struct ehci_hcd *ehci;
++
++	printk("/ab/%s: \n", __func__);
++	xxsvideo_start_ehc(dev);
++
++	if (dev->resource[1].flags != IORESOURCE_IRQ) {
++		pr_debug("resource[1] is not IORESOURCE_IRQ");
++		retval = -ENOMEM;
++	}
++	hcd = usb_create_hcd(driver, &dev->dev, "XXSVIDEO");
++	if (!hcd)
++		return -ENOMEM;
++	hcd->rsrc_start = dev->resource[0].start;
++	hcd->rsrc_len = dev->resource[0].end - dev->resource[0].start + 1;
++
++	if (!request_mem_region(hcd->rsrc_start, hcd->rsrc_len, hcd_name)) {
++		pr_debug("request_mem_region failed");
++		retval = -EBUSY;
++		goto err1;
++	}
++
++	hcd->regs = ioremap(hcd->rsrc_start, hcd->rsrc_len);
++	if (!hcd->regs) {
++		pr_debug("ioremap failed");
++		retval = -ENOMEM;
++		goto err2;
++	}
++
++	ehci = hcd_to_ehci(hcd);
++	/* ehci capability registers HCCAPBASE */
++	ehci->caps = hcd->regs;
++	/* ehci operational registers (HC_LENGTH reads 0x10; ab ok */
++	ehci->regs = hcd->regs + HC_LENGTH(readl(&ehci->caps->hc_capbase));
++	printk("/ab/%s: op regs phase 0x%x\n", __func__, ehci->regs);
++	printk("/ab/%s: CCNT: CUSB 0x%x\n", __func__, __raw_readl(JADE_CCNT_BASE+0x40));
++	/* cache this readonly data; minimize chip reads */
++	ehci->hcs_params = readl(&ehci->caps->hcs_params);
++
++	/* ?? /ab/ D- Pull-down is ON; D+ Pull-down is OFF ??*/
++	printk("/ab/%s: EHCI CAPA: 0x%x, 0x%x, 0x%x\n", __func__, 
++		 __raw_readl(JADE_EHCI_BASE), 
++		 __raw_readl(JADE_EHCI_BASE+0x04), 
++		 __raw_readl(JADE_EHCI_BASE+0x08));
++
++	printk("/ab/%s: EHCI OP: 0x%x, 0x%x, 0x%x\n", __func__, 
++		 __raw_readl(JADE_EHCI_BASE+0x10), 
++		 __raw_readl(JADE_EHCI_BASE+0x10+0x04), 
++		 __raw_readl(JADE_EHCI_BASE+0x10+0x08));
++
++	/* ?? /ab/ D- Pull-down is ON; D+ Pull-down is OFF ??*/
++	printk("/ab/%s: USB Others: 0x%x, 0x%x, 0x%x\n", __func__, 
++		 __raw_readl(JADE_PHYCNT_BASE), 
++		 __raw_readl(JADE_PHYCNT_BASE+0x04), 
++		 __raw_readl(JADE_PHYCNT_BASE+0x08));
++
++
++	retval = usb_add_hcd(hcd, dev->resource[1].start, IRQF_DISABLED | IRQF_SHARED);
++	if (retval == 0)
++		return retval;
++
++	xxsvideo_stop_ehc(dev);
++	iounmap(hcd->regs);
++err2:
++	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
++err1:
++	usb_put_hcd(hcd);
++	return retval;
++}
++
++/* may be called without controller electrically present */
++/* may be called with controller, bus, and devices active */
++
++/**
++ * usb_ehci_hcd_xxsvideo_remove - shutdown processing for Au1xxx-based HCDs
++ * @dev: USB Host Controller being removed
++ * Context: !in_interrupt()
++ *
++ * Reverses the effect of usb_ehci_hcd_xxsvideo_probe(), first invoking
++ * the HCD's stop() method.  It is always called from a thread
++ * context, normally "rmmod", "apmd", or something similar.
++ *
++ */
++void usb_ehci_xxsvideo_remove(struct usb_hcd *hcd, struct platform_device *dev)
++{
++	usb_remove_hcd(hcd);
++	iounmap(hcd->regs);
++	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
++	usb_put_hcd(hcd);
++	xxsvideo_stop_ehc(dev);
++}
++
++/*-------------------------------------------------------------------------*/
++
++static const struct hc_driver ehci_xxsvideo_hc_driver = {
++	.description = hcd_name,
++	.product_desc = "XXSVIDEO EHCI",
++	.hcd_priv_size = sizeof(struct ehci_hcd),
++
++	/*
++	 * generic hardware linkage
++	 */
++	.irq = ehci_irq,
++//	.flags = HCD_MEMORY | HCD_USB2,
++	.flags = HCD_USB2,
++
++	/*
++	 * basic lifecycle operations
++	 */
++	.reset = ehci_init,
++	.start = ehci_run,
++	.stop = ehci_stop,
++	.shutdown = ehci_shutdown,
++
++	/*
++	 * managing i/o requests and associated device resources
++	 */
++	.urb_enqueue = ehci_urb_enqueue,
++	.urb_dequeue = ehci_urb_dequeue,
++	.endpoint_disable = ehci_endpoint_disable,
++
++	/*
++	 * scheduling support
++	 */
++	.get_frame_number = ehci_get_frame,
++
++	/*
++	 * root hub support
++	 */
++	.hub_status_data = ehci_hub_status_data,
++	.hub_control = ehci_hub_control,
++};
++
++/*-------------------------------------------------------------------------*/
++
++static int ehci_hcd_xxsvideo_drv_probe(struct platform_device *pdev)
++{
++	struct usb_hcd *hcd = NULL;
++	int ret;
++
++	pr_debug("In ehci_hcd_xxsvideo_drv_probe\n");
++
++	if (usb_disabled())
++		return -ENODEV;
++
++	ret = usb_ehci_xxsvideo_probe(&ehci_xxsvideo_hc_driver, &hcd, pdev);
++	return ret;
++}
++
++static int ehci_hcd_xxsvideo_drv_remove(struct platform_device *pdev)
++{
++	struct usb_hcd *hcd = platform_get_drvdata(pdev);
++
++	usb_ehci_xxsvideo_remove(hcd, pdev);
++	return 0;
++}
++
++ /*TBD*/
++/*static int ehci_hcd_xxsvideo_drv_suspend(struct device *dev)
++{
++	struct platform_device *pdev = to_platform_device(dev);
++	struct usb_hcd *hcd = dev_get_drvdata(dev);
++
++	return 0;
++}
++static int ehci_hcd_xxsvideo_drv_resume(struct device *dev)
++{
++	struct platform_device *pdev = to_platform_device(dev);
++	struct usb_hcd *hcd = dev_get_drvdata(dev);
++
++	return 0;
++}
++*/
++MODULE_ALIAS("xxsvideo_ehci");
++static struct platform_driver ehci_hcd_xxsvideo_driver = {
++	.probe = ehci_hcd_xxsvideo_drv_probe,
++	.remove = ehci_hcd_xxsvideo_drv_remove,
++	.shutdown = usb_hcd_platform_shutdown,
++	/*.suspend      = ehci_hcd_xxsvideo_drv_suspend, */
++	/*.resume       = ehci_hcd_xxsvideo_drv_resume, */
++	.driver = {
++		.name = "xxsvideo_ehci",
++		.bus = &platform_bus_type
++	}
++};
+--- linux-2.6.27.21/drivers/usb/Kconfig	2009-03-23 22:04:09.000000000 +0000
++++ linux-2.6.27.21-dev/drivers/usb/Kconfig	2009-11-20 05:23:18.000000000 +0000
+@@ -37,6 +37,7 @@
+ 	default y if ARCH_EP93XX
+ 	default y if ARCH_AT91
+ 	default y if ARCH_PNX4008
++	default y if ARCH_JADE_MB86R01
+ 	# PPC:
+ 	default y if STB03xxx
+ 	default y if PPC_MPC52xx
+@@ -55,6 +56,7 @@
+ 	default y if PPC_83xx
+ 	default y if SOC_AU1200
+ 	default y if ARCH_IXP4XX
++	default y if ARCH_JADE_MB86R01
+ 	default PCI
+ 
+ # ARM SA1111 chips have a non-PCI based "OHCI-compatible" USB host interface.
+@@ -67,7 +69,7 @@
+ 	  traditional PC serial port.  The bus supplies power to peripherals
+ 	  and allows for hot swapping.  Up to 127 USB peripherals can be
+ 	  connected to a single USB host in a tree structure.
+-	  
++
+ 	  The USB host is the root of the tree, the peripherals are the
+ 	  leaves and the inner nodes are special USB devices called hubs.
+ 	  Most PCs now have USB host ports, used to connect peripherals
diff --git a/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/06_diff-mycable-can.patch b/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/06_diff-mycable-can.patch
new file mode 100644
index 0000000..5db0255
--- /dev/null
+++ b/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/06_diff-mycable-can.patch
@@ -0,0 +1,1926 @@
+--- linux-2.6.27.21/drivers/char/Makefile	2009-03-23 22:04:09.000000000 +0000
++++ linux-2.6.27.21-dev/drivers/char/Makefile	2009-12-02 17:11:06.000000000 +0000
+@@ -98,6 +98,9 @@
+ obj-$(CONFIG_GPIO_TB0219)	+= tb0219.o
+ obj-$(CONFIG_TELCLOCK)		+= tlclk.o
+ 
++obj-$(CONFIG_XXS_C_CAN)		+= xxs_c_can.o
++obj-$(CONFIG_CRYPTOEEPROM)	+= cryptoeeprom.o
++
+ obj-$(CONFIG_MWAVE)		+= mwave/
+ obj-$(CONFIG_AGP)		+= agp/
+ obj-$(CONFIG_PCMCIA)		+= pcmcia/
+--- linux-2.6.27.21/drivers/char/Kconfig	2009-03-23 22:04:09.000000000 +0000
++++ linux-2.6.27.21-dev/drivers/char/Kconfig	2009-11-20 05:21:20.000000000 +0000
+@@ -133,7 +133,7 @@
+ 	tristate "Comtrol RocketPort support"
+ 	depends on SERIAL_NONSTANDARD && (ISA || EISA || PCI)
+ 	help
+-	  This driver supports Comtrol RocketPort and RocketModem PCI boards.   
++	  This driver supports Comtrol RocketPort and RocketModem PCI boards.
+           These boards provide 2, 4, 8, 16, or 32 high-speed serial ports or
+           modems.  For information about the RocketPort/RocketModem  boards
+           and this driver read <file:Documentation/rocket.txt>.
+@@ -1104,5 +1104,19 @@
+ 
+ source "drivers/s390/char/Kconfig"
+ 
++config XXS_C_CAN
++	depends on ARCH_JADE
++	tristate "C_CAN support for Jade/Jade-D"
++	help
++	  Driver for the CAN controller of the Fujitsu Jade/Jade-D SoCs.
++
++config CRYPTOEEPROM
++	depends on MACH_XXSVIDEO || MACH_XXSVIDEOD
++	tristate "Atmel AT88SC0808 CryptoEEPROM"
++	help
++	  Support for the Atmel AT88SC0808 CryptoMemory chip on mycable's 
++	  XXSvideo/XXSvideo-D boards. Currently only EEPROM functionality 
++	  is supported.
++
+ endmenu
+ 
+--- linux-2.6.27.21/drivers/char/xxs_c_can.c	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/drivers/char/xxs_c_can.c	2009-12-02 17:11:18.000000000 +0000
+@@ -0,0 +1,1258 @@
++/*
++* linux/drivers/char/xxs_c_can.c
++*
++* This is a CAN driver for
++*	the xxsvideo/Fujitsu-MB86R01(Jade)processor.
++*
++*  Copyright (C) 2007 mycable GmbH
++*       Dawid Nogens <dn@mycable.de>
++*
++* This program is free software; you can redistribute it and/or modify
++* it under the terms of the GNU General Public License version 2 as
++* published by the Free Software Foundation.
++*
++*/
++
++#include <mach/platform.h>
++#include <mach/can.h>
++#include <mach/gpio.h>
++#include <mach/irqs.h>
++
++#include <linux/module.h>
++#include <linux/version.h>
++#include <linux/init.h>
++#include <linux/fs.h>
++#include <linux/interrupt.h>
++#include <linux/platform_device.h>
++
++#include <linux/wait.h>
++#include <linux/types.h>
++#include <linux/cdev.h>
++
++#include <asm/uaccess.h>
++#include <asm/delay.h>
++#include <asm/io.h>
++
++#define WQ_TIMEOUT	(200/(1000/HZ))
++/**
++ * metainformation related to the driver.
++ */
++MODULE_AUTHOR("Dawid Nogens, mycable GmbH - <dn@mycable.de>");
++MODULE_LICENSE("GPL");
++MODULE_DESCRIPTION("A CAN driver for the xxsvideo/Fujitsu-MB86R01(Jade)processor");
++
++/* can_class for automatic class registration in /sys and device node creation */
++static struct class *can_class = 0;
++static unsigned int can_device_count = 0;
++
++static void xxs_ccan_disable_warnings(struct can_device *can_dev) {
++	u32 temp;
++
++// 	printk("/ab/%s\n", __func__);
++	temp = read_register32(can_dev, CAN_CTRL);
++	temp &= ~(CTRL_SIE | CTRL_EIE);
++	write_register32( can_dev, CAN_CTRL, temp );
++}
++
++static void xxs_ccan_enable_warnings(struct can_device *can_dev) {
++	u32 temp;
++
++// 	printk("/ab/%s\n", __func__);
++	temp = read_register32(can_dev, CAN_CTRL);
++	if (can_dev->options->err_int_enable)
++		temp |= CTRL_EIE;
++	if (can_dev->options->stat_int_enable)
++		temp |= CTRL_SIE;
++
++	write_register32( can_dev, CAN_CTRL, temp );
++}
++
++/** Interrupt service routine
++ *
++ */
++static irqreturn_t xxs_ccan_isr( int irq, void *dev_id)
++{
++	struct can_device *can_dev = dev_id;
++
++	u32 temp, status, error;
++	int msg_num;
++	CanData *buffer;
++	cfs_t *cfs;
++
++	temp = read_register32( can_dev, CAN_INTR );
++	if(!temp)
++		return IRQ_NONE; // temp == 0x0000 -> No interrupt
++//XXXab
++//	while (
++//	do {
++		if(temp == 0x8000){
++		// updated status register caused the interrupt
++		// interrupt gets cleared by reading status register
++			status = read_register32( can_dev,  CAN_STAT );
++			if(status & STAT_BOFF){
++				printk( KERN_WARNING "%s: CAN%i module is in bus-off state.\n", can_dev->pdev->name, can_dev->pdev->id);
++			}
++			if(status & STAT_WARN){
++				printk( KERN_WARNING "%s: CAN%i Number of errors detected has reached warning-limit. \n", can_dev->pdev->name, can_dev->pdev->id);
++
++				xxs_ccan_disable_warnings(can_dev);
++				/* disable interrupts for errors until next successful transfer */
++
++			}
++			if(status & STAT_PASS){
++				printk( KERN_WARNING "%s: CAN%i module is in error-passive state.\n", can_dev->pdev->name, can_dev->pdev->id);
++			}
++			if(status & STAT_RXOK){
++// 				printk( KERN_WARNING "%s: Successfully received a message.\n", pdev->name);
++				write_register32( can_dev, CAN_STAT, status & ~STAT_RXOK );
++			}
++			if(status & STAT_TXOK){
++// 				printk( KERN_WARNING "%s: Successfully wrote a message.\n", pdev->name);
++				write_register32( can_dev, CAN_STAT, status & ~STAT_TXOK );
++			}
++			if((error = (status & STAT_LEC))){
++				printk( KERN_WARNING "%s: CAN%i Last error occured:\n", can_dev->pdev->name, can_dev->pdev->id);
++				switch( error ){
++					case 1: printk( KERN_WARNING "          -> bit stuffing error.\n");
++						can_dev->errors->bit_stuffing_error++;
++						break;
++					case 2: printk( KERN_WARNING "          -> format error.\n");
++						can_dev->errors->format_error++;
++						break;
++					case 3: printk( KERN_WARNING "          -> acknowledgement error.\n");
++						can_dev->errors->acknoledgement_error++;
++						break;
++					case 4: printk( KERN_WARNING "          -> bit 1 error.\n");
++						can_dev->errors->bit_1_error++;
++						break;
++					case 5: printk( KERN_WARNING "          -> bit 0 error.\n");
++						can_dev->errors->bit_0_error++;
++						break;
++					case 6: printk( KERN_WARNING "          -> checksum error.\n");
++						can_dev->errors->checksum_error++;
++						break;
++					case 7: printk( KERN_WARNING "          -> unused: this should not happen.\n");
++						break;
++					default: printk( KERN_WARNING "          Error reading last error code.\n");
++					break;
++				}
++			}
++		} else if( temp >= 0x0001 && temp <= 0x0020 ) {
++		// a message caused the interrupt
++		// interrupt gets cleared by resetting the messages IntPnd.
++		// Clear that bit in read/write function
++
++// 			printk( KERN_DEBUG "Interrupt is caused by message %d.\n", temp);
++			msg_num = temp;
++
++			if(can_dev->message[msg_num-1]->msg_dir){
++				// write
++				temp = read_register32(can_dev, CAN_IFX1 + CAN_IFMC);
++
++				write_register32( can_dev, CAN_IFX1 + CAN_IFMC, temp & ~(IF_INTP | IF_TXRQ | IF_NEWD));
++				write_register32( can_dev, CAN_IFX1 + CAN_IFCM, IF_WRRD | IF_CTRL | IF_CINT);
++				write_register32( can_dev, CAN_IFX1 + CAN_IFCR, msg_num);
++
++				can_dev->message[msg_num-1]->new_txdata--;
++
++				wake_up_interruptible(&can_dev->wait_queue_write);
++
++			} else {
++				// read
++				// check busy-flag
++
++				can_dev->if2->ifx_command_mask = IF_MASK | IF_ARB | IF_CTRL | IF_CINT | IF_TXND | IF_DATA | IF_DATB;
++				write_register32( can_dev, CAN_IFX2 + CAN_IFCM, can_dev->if2->ifx_command_mask );
++				can_dev->if2->ifx_command_request = msg_num;
++				write_register32( can_dev, CAN_IFX2 + CAN_IFCR, can_dev->if2->ifx_command_request );
++
++				if( ( read_register32( can_dev, CAN_IFX2 + CAN_IFCR ) & IF_MSGN ) == msg_num ){
++					can_dev->if2->ifx_command_request = read_register32( can_dev, CAN_IFX2 + CAN_IFCR );
++					can_dev->if2->ifx_command_mask = read_register32( can_dev, CAN_IFX2 + CAN_IFCM );
++					// load any more registers ?
++					can_dev->if2->ifx_arbitration1 = read_register32( can_dev, CAN_IFX2 + CAN_IFA1 );
++					can_dev->if2->ifx_arbitration2 = read_register32( can_dev, CAN_IFX2 + CAN_IFA2 );
++					can_dev->if2->ifx_message_control = read_register32( can_dev, CAN_IFX2 + CAN_IFMC );
++
++					can_dev->if2->ifx_data_a1 = read_register32( can_dev, CAN_IFX2 + CAN_IFDA1 );
++					can_dev->if2->ifx_data_a2 = read_register32( can_dev, CAN_IFX2 + CAN_IFDA2 );
++					can_dev->if2->ifx_data_b1 = read_register32( can_dev, CAN_IFX2 + CAN_IFDB1 );
++					can_dev->if2->ifx_data_b2 = read_register32( can_dev, CAN_IFX2 + CAN_IFDB2 );
++				}
++
++				if ( (cfs = (cfs_t *) kmalloc((sizeof(cfs_t)), GFP_KERNEL )) != NULL ){
++					cfs->xtd = (can_dev->if2->ifx_arbitration2 & IF_XTD) ? 1 : 0;
++					if(cfs->xtd){
++						cfs->identifier = (can_dev->if2->ifx_arbitration2 & IF_IDH) << 16;
++						cfs->identifier |= can_dev->if2->ifx_arbitration1 & IF_IDL;
++					} else {
++						cfs->identifier = (can_dev->if2->ifx_arbitration2 & IF_IDH) >> 2;
++					}
++					cfs->length = can_dev->if2->ifx_message_control & IF_DLC;
++
++					cfs->data[0] = can_dev->if2->ifx_data_a1 & 0x00FF;
++					cfs->data[1] = (can_dev->if2->ifx_data_a1 & 0xFF00) >> 8;
++					cfs->data[2] = can_dev->if2->ifx_data_a2 & 0x00FF;
++					cfs->data[3] = (can_dev->if2->ifx_data_a2 & 0xFF00) >> 8;
++					cfs->data[4] = can_dev->if2->ifx_data_b1 & 0x00FF;
++					cfs->data[5] = (can_dev->if2->ifx_data_b1 & 0xFF00) >> 8;
++					cfs->data[6] = can_dev->if2->ifx_data_b2 & 0x00FF;
++					cfs->data[7] = (can_dev->if2->ifx_data_b2 & 0xFF00) >> 8;
++				}
++
++                if (can_dev->message[msg_num-1]->read_buffer->size >= 250) {
++                    kfree (cfs);
++                }
++                else {
++                
++				// fill read-buffer
++				if ( (buffer = (CanData *) kmalloc( sizeof( CanData ), GFP_KERNEL )) != NULL ){
++					buffer->next = NULL;
++
++					buffer->msg = cfs;
++
++					if( can_dev->message[msg_num-1]->read_buffer->first == NULL ){
++						can_dev->message[msg_num-1]->read_buffer->first = buffer;
++						can_dev->message[msg_num-1]->read_buffer->last = buffer;
++					} else {
++//                         printk(KERN_ALERT"CAN second\n");
++						can_dev->message[msg_num-1]->read_buffer->last->next = buffer;
++						can_dev->message[msg_num-1]->read_buffer->last = buffer;
++					}
++					can_dev->message[msg_num-1]->read_buffer->size++;
++/*                    if (can_dev->message[msg_num-1]->read_buffer->size == 10) printk(KERN_ALERT"QUEUE SIZE 10 \n");
++                    if (can_dev->message[msg_num-1]->read_buffer->size == 100) printk(KERN_ALERT"QUEUE SIZE 100 \n");
++                    if (can_dev->message[msg_num-1]->read_buffer->size == 1000) printk(KERN_ALERT"QUEUE SIZE 1000 \n");
++                    if (can_dev->message[msg_num-1]->read_buffer->size == 10000) printk(KERN_ALERT"QUEUE SIZE 10000 \n");*/
++                }
++//                 else printk(KERN_ALERT"MASSIVE ALLOC ERROR\n");
++// 				printk( KERN_ALERT "Size of readbuffer: %d\n", can_dev->message[msg_num-1]->read_buffer->size);
++
++				can_dev->message[msg_num-1]->new_rxdata++;
++				wake_up_interruptible(&can_dev->wait_queue_read);
++                }
++			}
++			xxs_ccan_enable_warnings(can_dev);
++		}
++/*		temp = read_register32( can_dev, CAN_INTR );
++	} while( temp );*/
++	return IRQ_HANDLED;
++}
++
++/** Function to open the driver.
++ * This function is called when opening the device node.
++ */
++static ssize_t xxs_ccan_open( struct inode *inode, struct file *filp ){
++
++	struct can_device *can_dev;
++
++	can_dev = container_of(inode->i_cdev, struct can_device, can_cdev);
++
++	filp->private_data = can_dev;
++
++	return 0;
++}
++
++
++/** Function to close the driver.
++ * This function is called whien closing the device node.
++ */
++static ssize_t xxs_ccan_close( struct inode *device, struct file *filep )
++{
++
++	return 0;
++}
++
++/** Function to seek the device file.
++ * The message objects within the device file can be accessed by seeking the file.
++ */
++loff_t xxs_ccan_llseek(struct file *filep, loff_t off, int whence)
++{
++	loff_t newpos;
++
++	switch(whence) {
++		case 0: // SEEK_SET
++			newpos = off;
++			break;
++		case 1: // SEEK_CUR
++			newpos = filep->f_pos + off;
++			break;
++		case 2: // SEEK_END
++			newpos = XXS_CAN_MAXMSG-1;
++			break;
++		default: // can't happen
++			return -EINVAL;
++	}
++
++	if (newpos < 0 || newpos > XXS_CAN_MAXMSG)
++		return -EINVAL;
++
++	filep->f_pos = newpos;
++	return newpos;
++}
++
++
++/** ioctl-function.
++ *
++ */
++static ssize_t xxs_ccan_ioctl( struct inode *device, struct file *filep, \
++			unsigned int cmd, unsigned long arg )
++{
++	struct can_device *can_dev = filep->private_data;
++	DeviceOptions temp;
++	int num, ret;
++	CanData *buffer;
++	cfsarg_t *cfsarg;
++    spinlock_t * my_lock;
++    unsigned long flags;
++
++	switch( cmd ) {
++		case IOCTL_XXS_CAN_MODINIT:
++			if(copy_from_user((void *)&temp, (void *)arg, sizeof(temp)))
++				return -EIO;
++
++			can_dev->options->test_loopback = temp.test_loopback;
++			can_dev->options->test_silent = temp.test_silent;
++			can_dev->options->test_basic = temp.test_basic;
++			can_dev->options->interrupt_enable = temp.interrupt_enable;
++			can_dev->options->retrans_disable = temp.retrans_disable;
++			can_dev->options->err_int_enable = temp.err_int_enable;
++			can_dev->options->stat_int_enable = temp.stat_int_enable;
++			can_dev->options->remote_enable = temp.remote_enable;
++			can_dev->options->bit_timing    = temp.bit_timing;
++			can_dev->options->brp_extension = temp.brp_extension;
++
++			init_can(can_dev);
++
++			break;
++		case IOCTL_XXS_CAN_MSGINIT:
++			init_message(can_dev, (CanMessage *)arg);
++			break;
++		case IOCTL_XXS_CAN_DEBUGREG:
++			debug_registers(can_dev, "DEBUG");
++			break;
++		case IOCTL_XXS_CAN_IDWRITE:
++			// TODO: Not working yet
++			break;
++		case IOCTL_XXS_CAN_IDREAD:
++            spin_lock_init(my_lock);
++			if((cfsarg = (cfsarg_t *) kmalloc( sizeof( cfsarg_t ) , GFP_KERNEL )) == NULL){
++				printk( KERN_ERR "%s: Failure allocating temporary buffer.\n", MODULE_NAME);
++				return -EIO;
++			}
++			if (copy_from_user ((void *)cfsarg, (void *)arg, sizeof(cfsarg_t))) {
++				printk( KERN_ERR "%s: Error copying data in ioctl IDREAD.\n", MODULE_NAME);
++                kfree(cfsarg);
++                return -EIO;
++			}
++
++			num = cfsarg->msg_num - 1;
++            ret = 0;
++
++            if(can_dev->message[num]->read_buffer->size <= 0){
++				//FIXME: this makes no sence: _timeout in blocking mode?
++				if (filep->f_flags & O_NONBLOCK) {
++                    kfree(cfsarg);
++                    return -EAGAIN;
++				} else {
++                    
++                    if(wait_event_interruptible_timeout( can_dev->wait_queue_read,
++                       can_dev->message[num]->read_buffer->size > 0,10)==0) {
++                           kfree(cfsarg);
++                           return -EAGAIN;
++                    }
++                }
++			}
++            
++            spin_lock_irqsave(my_lock, flags);
++			buffer = can_dev->message[num]->read_buffer->first;
++            if (buffer != NULL){
++                can_dev->message[num]->read_buffer->first = buffer->next;
++                can_dev->message[num]->read_buffer->size--;
++                can_dev->message[num]->new_rxdata--;
++            }            
++            if (buffer == NULL){
++                can_dev->message[num]->read_buffer->last = NULL;
++                can_dev->message[num]->read_buffer->size = 0;
++            }
++
++            spin_unlock_irqrestore(my_lock, flags);
++
++			if (buffer != NULL){
++
++				cfsarg->cfs_msg = *buffer->msg;
++                ret = copy_to_user( (cfsarg_t *)arg, cfsarg, sizeof(cfsarg_t) );
++				ret = sizeof(cfsarg_t) - ret;
++				kfree(buffer->msg);
++			}
++            
++            kfree(cfsarg);
++			kfree(buffer);
++            return ret;
++
++		default:
++			return -EINVAL;
++			break;
++	}
++	return 0;
++}
++
++/** Writes data to be transmitted to the CAN device.
++ *
++ * The data is written to the message object set by the seek function.
++ * @see xxs_ccan_llseek.
++ * Note, that the message object has to be valid and initialized through
++ * @see init_message.
++ * The mask and id are not changed after initialization.
++ */
++static ssize_t xxs_ccan_write( struct file *filep, const char __user *user_buffer, size_t count, loff_t *offset )
++{
++	// Uses offset as index for number of message object !!! offset is set by lseek.
++	struct can_device *can_dev = filep->private_data;
++	char data[XXS_CAN_DATALEN];
++	int ret, data_length, j, k;
++	char *temp;
++
++// 	printk("/ab/%s\n", __func__);
++	ret = 0;
++
++//  	printk( KERN_DEBUG "DATALENGTH: %d\n", data_length = can_dev->message[*offset]->data_length);
++	data_length = can_dev->message[*offset]->data_length;
++	if (*offset >= XXS_CAN_MAXMSG){
++		printk( KERN_WARNING "%s: %d is not a valid message-object.\n", MODULE_NAME, (int)*offset+1);
++		return -EINVAL;
++	}
++	if (!can_dev->message[*offset]->msg_valid){
++		printk( KERN_WARNING "%s: Message %d has not been configured.\n", MODULE_NAME,(int)*offset+1 );
++		return count;
++	}
++	if(data_length == 0){
++		printk( KERN_WARNING "%s: Data length of message %d has not been configured.\n", MODULE_NAME,(int)*offset+1 );
++		return count;
++	}
++
++	if(count % data_length ){
++		printk( KERN_WARNING "%s: Message length is not a multiple of %d bytes.\n", MODULE_NAME, data_length);
++		return count;
++	}
++	// filling the buffer
++	if( (temp = (char *) kmalloc( sizeof( char ) * count , GFP_KERNEL )) == NULL ){
++		printk( KERN_ERR "%s: Failure allocating temporary buffer.\n", MODULE_NAME);
++		return -EIO;
++	}
++
++	if( (ret = copy_from_user( temp, user_buffer, count )) ){
++		printk( KERN_ERR "%s: Failure copying data from user. could not copy %d bytes.\n", MODULE_NAME, ret);
++		return -EIO;
++	}
++
++	for( j = 0; j < count; j += data_length){
++		can_dev->message[*offset]->new_txdata++;
++
++		can_dev->if1->ifx_command_request = (u32)*offset + 1;
++		can_dev->if1->ifx_command_mask = IF_WRRD | IF_CTRL | IF_DATA | IF_DATB;
++		can_dev->if1->ifx_message_control = data_length;
++
++		for(k = 0; k < XXS_CAN_DATALEN; k++){
++			data[k] = *temp;
++			temp++;
++		}
++
++		can_dev->if1->ifx_data_a1 = 0x00000000;
++		can_dev->if1->ifx_data_a2 = 0x00000000;
++		can_dev->if1->ifx_data_b1 = 0x00000000;
++		can_dev->if1->ifx_data_b2 = 0x00000000;
++
++		switch (data_length) {
++			case 8: can_dev->if1->ifx_data_b2 = ((u32)data[7] << 8);
++			case 7: can_dev->if1->ifx_data_b2 |= data[6];
++			case 6: can_dev->if1->ifx_data_b1 = ((u32)data[5] << 8);
++			case 5: can_dev->if1->ifx_data_b1 |= data[4];
++			case 4: can_dev->if1->ifx_data_a2 = ((u32)data[3] << 8);
++			case 3: can_dev->if1->ifx_data_a2 |= data[2];
++			case 2: can_dev->if1->ifx_data_a1 = ((u32)data[1] << 8);
++			case 1: can_dev->if1->ifx_data_a1 |= data[0];
++			break;
++			default: break;
++		}
++
++		if( can_dev->message[*offset]->msg_dir ){
++			if( can_dev->message[*offset]->int_enable )
++				can_dev->if1->ifx_message_control |= IF_TXIE;
++			if( can_dev->message[*offset]->remote_enable )
++				can_dev->if1->ifx_message_control |= IF_RMTE;
++		} else {
++			if( can_dev->message[*offset]->int_enable )
++				can_dev->if1->ifx_message_control |= IF_RXIE;
++		}
++
++		write_register32( can_dev, CAN_IFX1 + CAN_IFCM, can_dev->if1->ifx_command_mask);
++		write_register32( can_dev, CAN_IFX1 + CAN_IFMC, can_dev->if1->ifx_message_control);
++		write_register32( can_dev, CAN_IFX1 + CAN_IFDA1, can_dev->if1->ifx_data_a1);
++		write_register32( can_dev, CAN_IFX1 + CAN_IFDA2, can_dev->if1->ifx_data_a2);
++		write_register32( can_dev, CAN_IFX1 + CAN_IFDB1, can_dev->if1->ifx_data_b1);
++		write_register32( can_dev, CAN_IFX1 + CAN_IFDB2, can_dev->if1->ifx_data_b2);
++
++		do {
++			udelay( TIME_TO_WAIT );
++		} while( get_busy_flag( can_dev, CAN_IFX1 ));
++
++		write_register32( can_dev, CAN_IFX1 + CAN_IFMC, can_dev->if1->ifx_message_control | IF_NEWD | IF_TXRQ);
++		write_register32( can_dev, CAN_IFX1 + CAN_IFCR, can_dev->if1->ifx_command_request);
++
++		ret = wait_event_interruptible_timeout( can_dev->wait_queue_write,
++					     can_dev->message[*offset]->new_txdata == 0, WQ_TIMEOUT);
++	}
++
++	return sizeof(data) - ret;
++}
++
++
++/** Reads received data from the CAN device.
++ * The data is read from the message object set by the seek function.
++ * @see xxs_ccan_llseek.
++ * Note, that the message object has to be valid and initialized through
++ * @see init_message.
++ * The mask and id are not changed after initialization.
++ */
++static ssize_t xxs_ccan_read( struct file *filep, char __user *user, size_t count, loff_t *offset )
++{
++	struct can_device *can_dev = filep->private_data;
++	int data_length, not_copied;
++	CanData *buffer;
++
++	if(can_dev->message[*offset]->read_buffer->size <= 0){
++		printk( KERN_INFO "%s: CAN%i: No data to be read for message %d.\n", MODULE_NAME, can_dev->pdev->id, (int)*offset+1);
++		if (filep->f_flags & O_NONBLOCK) {
++			return -EAGAIN;
++		} else {
++			wait_event_interruptible( can_dev->wait_queue_read,
++					can_dev->message[*offset]->new_rxdata > 0);
++		}
++	}
++
++	not_copied = 0;
++	data_length = can_dev->message[*offset]->data_length;
++
++	if( count % data_length ){
++		printk( KERN_ERR "%s: CAN%i: length of message to be read is not a multiple of %d", MODULE_NAME,  can_dev->pdev->id, data_length);
++		return -EINVAL;
++	}
++
++	if( (buffer = can_dev->message[*offset]->read_buffer->first) != NULL){
++		not_copied = copy_to_user( user, buffer->msg->data, data_length );
++		can_dev->message[*offset]->read_buffer->first = buffer->next;
++		can_dev->message[*offset]->read_buffer->size--;
++		kfree(buffer->msg);
++	}
++	if( (buffer = can_dev->message[*offset]->read_buffer->first) == NULL){
++		can_dev->message[*offset]->read_buffer->last = NULL;
++	}
++
++	can_dev->message[*offset]->new_rxdata--;
++
++	return count - not_copied;
++}
++
++/**
++ * entry points to the functions
++ */
++static struct file_operations fops = {
++	.owner   = THIS_MODULE,
++	.read    = xxs_ccan_read,
++	.write   = xxs_ccan_write,
++	.ioctl   = xxs_ccan_ioctl,
++	.open    = xxs_ccan_open,
++	.release = xxs_ccan_close,
++	.llseek  = xxs_ccan_llseek
++};
++
++static int __devinit xxs_ccan_probe(struct platform_device *pdev)
++{
++	struct device *dev = &pdev->dev;
++	struct xxsvideo_ccan_gpio *gpio;
++	struct can_device *can_dev;
++	struct resource *r;
++	int ret = 0;
++	int j = 0;
++
++	gpio = dev->platform_data;
++
++//	printk("/ab/%s\n", __func__);
++
++	// allocate devices
++	if( (can_dev = kmalloc( sizeof( CanDevice ), GFP_KERNEL )) == NULL){
++		printk( KERN_ERR "%s: Could not allocate device[%d]\n.", MODULE_NAME, gpio->id);
++		goto err_out;
++	}
++
++	dev_set_drvdata(dev, can_dev);
++
++	// allocate ifx Registers
++	if( (can_dev->if1 = (IFxRegister *) kmalloc( sizeof( IFxRegister ), GFP_KERNEL)) == NULL){
++		printk( KERN_ERR "%s: Could not allocate if1 for device[%d]\n.", MODULE_NAME, gpio->id);
++		goto err_if1;
++	}
++	can_dev->if1->ifx_command_request = 0;
++	can_dev->if1->ifx_command_mask = 0;
++	can_dev->if1->ifx_mask1 = 0;
++	can_dev->if1->ifx_mask2 = 0;
++	can_dev->if1->ifx_arbitration1 = 0;
++	can_dev->if1->ifx_arbitration2 = 0;
++	can_dev->if1->ifx_message_control = 0;
++	can_dev->if1->ifx_data_a1 = 0;
++	can_dev->if1->ifx_data_a2 = 0;
++	can_dev->if1->ifx_data_b1 = 0;
++	can_dev->if1->ifx_data_b2 = 0;
++
++	if( (can_dev->if2 = (IFxRegister *) kmalloc( sizeof( IFxRegister ), GFP_KERNEL)) == NULL ){
++		printk( KERN_ERR "%s: Could not allocate if2 for device[%d]\n.", MODULE_NAME, gpio->id);
++		goto err_if2;
++	}
++	can_dev->if2->ifx_command_request = 0;
++	can_dev->if2->ifx_command_mask = 0;
++	can_dev->if2->ifx_mask1 = 0;
++	can_dev->if2->ifx_mask2 = 0;
++	can_dev->if2->ifx_arbitration1 = 0;
++	can_dev->if2->ifx_arbitration2 = 0;
++	can_dev->if2->ifx_message_control = 0;
++	can_dev->if2->ifx_data_a1 = 0;
++	can_dev->if2->ifx_data_a2 = 0;
++	can_dev->if2->ifx_data_b1 = 0;
++	can_dev->if2->ifx_data_b2 = 0;
++
++	// allocate DeviceSettings
++	if( (can_dev->settings = (DeviceSettings *) kmalloc( sizeof( DeviceSettings ), GFP_KERNEL )) == NULL){
++		printk( KERN_ERR "%s: Could not allocate settings for device[%d]\n.", MODULE_NAME, gpio->id);
++		goto err_settings;
++	}
++	/* get memory resources */
++	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (!r) {
++		ret = -ENXIO;
++		goto err_out;
++	}
++	can_dev->settings->base_address = r->start;
++	can_dev->settings->mem_len = r->end - r->start;
++	can_dev->pdev = pdev;
++
++	/* get interrupt resources */
++	ret = platform_get_irq(pdev, 0);
++	if (!ret) {
++		goto err_out;
++	}
++	can_dev->settings->can_irq = ret;
++
++	// allocate DeviceOptions
++	if( (can_dev->options = (DeviceOptions *) kmalloc( sizeof( DeviceOptions ), GFP_KERNEL )) == NULL){
++		printk( KERN_ERR "%s: Could not allocate options for device[%d]\n.", MODULE_NAME, gpio->id);
++		goto err_options;
++	}
++	/* can_dev->options->new_txdata = 0;
++	can_dev->options->new_rxdata = 0;*/
++	can_dev->options->test_loopback = 0;
++	can_dev->options->test_silent = 0;
++	can_dev->options->test_basic = 0;
++	can_dev->options->interrupt_enable = 0;
++	can_dev->options->retrans_disable = 0;
++	can_dev->options->err_int_enable = 0;
++	can_dev->options->stat_int_enable = 0;
++	can_dev->options->remote_enable = 0;
++	can_dev->options->bit_timing = 0;
++	can_dev->options->brp_extension = 0;
++
++	if( (can_dev->errors = (CanError *) kmalloc( sizeof( CanError ), GFP_KERNEL )) == NULL){
++		printk( KERN_ERR "%s: Could not allocate errors for device[%d]\n.", MODULE_NAME, gpio->id);
++		goto err_errors;
++	}
++	can_dev->errors->bit_stuffing_error = 0;
++	can_dev->errors->format_error = 0;
++	can_dev->errors->acknoledgement_error = 0;
++	can_dev->errors->bit_1_error = 0;
++	can_dev->errors->bit_0_error = 0;
++	can_dev->errors->checksum_error = 0;
++
++	for(j = 0; j < XXS_CAN_MAXMSG; j++){
++		if( (can_dev->message[j] = (CanMessage *) kmalloc( sizeof( CanMessage ), GFP_KERNEL )) == NULL){
++			printk( KERN_ERR "%s: Could not allocate message[%d] for device[%d]\n.", MODULE_NAME, j, gpio->id);
++			goto err_message;
++		}
++		can_dev->message[j]->msg_valid = 0;
++		can_dev->message[j]->id_extended = 0;
++		can_dev->message[j]->mask_extended = 0;
++		can_dev->message[j]->remote_enable = 0;
++		can_dev->message[j]->int_enable = 0;
++		can_dev->message[j]->msg_num = 0;
++		can_dev->message[j]->msg_dir = 0;
++		can_dev->message[j]->data_length = 0;
++		can_dev->message[j]->msg_mask = 0;
++		can_dev->message[j]->msg_id = 0;
++		can_dev->message[j]->new_txdata = 0;
++		can_dev->message[j]->new_rxdata = 0;
++
++		can_dev->message[j]->data = NULL;
++		if( (can_dev->message[j]->read_buffer = (MessageBuffer *) kmalloc( sizeof( MessageBuffer ), GFP_KERNEL )) == NULL){
++			printk( KERN_ERR "%s: Could not allocate read_buffer of message[%d] for device[%d]\n.", MODULE_NAME, j, gpio->id);
++			goto err_buffer;
++		}
++		can_dev->message[j]->read_buffer->first = NULL;
++		can_dev->message[j]->read_buffer->last = NULL;
++		can_dev->message[j]->read_buffer->size = 0;
++	}
++
++	/* register character device and can_class */
++	cdev_init(&can_dev->can_cdev, &fops);
++	can_dev->can_cdev.owner = THIS_MODULE;
++	can_dev->can_cdev.ops = &fops; // why a seconde time ??
++
++	if( cdev_add(&can_dev->can_cdev, MKDEV(XXS_CAN_MAJOR, gpio->id), XXS_CAN_MAXDEV) != 0 ){
++		printk( KERN_ERR "%s: could not add devices to system.\n", MODULE_NAME);
++		goto err_module;
++	}
++
++        /* Dynamic /dev creation
++         *
++         * This creates entries in /dev and /sys/class/simple_driver
++         */
++
++        if (can_class == NULL)
++        	can_class = class_create(THIS_MODULE, "can");
++        if (can_class == NULL) {
++                ret = -ENODEV;
++                goto err_out;
++        }
++
++	device_create_drvdata(can_class, NULL, MKDEV(XXS_CAN_MAJOR, gpio->id), 
++			NULL, "can%d", gpio->id);
++	can_device_count++;
++
++	// Getting Interrupts
++/*	printk( KERN_INFO "%s: requesting interrupt %i\n", pdev->name,
++				can_dev->settings->can_irq);*/
++	ret = request_irq( can_dev->settings->can_irq, xxs_ccan_isr, \
++		(IRQF_DISABLED), pdev->name, can_dev);
++	if(ret != 0){
++		printk( KERN_ERR" failed.\n");
++		goto err_irq;
++	}
++
++	init_waitqueue_head( &can_dev->wait_queue_read );
++	init_waitqueue_head( &can_dev->wait_queue_write );
++
++	printk( KERN_INFO "%s: Registration of CAN%i driver succeeded.\n", MODULE_NAME, gpio->id);
++
++	return 0;
++
++
++	/* Free all pointers, that have been allocated before */
++err_module:
++err_irq:
++	free_irq(can_dev->settings->can_irq, can_dev);
++	while(j >= 0){
++err_buffer:
++		kfree(can_dev->message[j]->read_buffer->first);
++		kfree(can_dev->message[j]->read_buffer->last);
++		kfree(can_dev->message[j]->read_buffer);
++		kfree(can_dev->message[j]);
++err_message:
++		j--;
++	}
++	kfree(can_dev->errors);
++err_errors:
++	kfree(can_dev->options);
++err_options:
++	release_mem_region( can_dev->settings->base_address, \
++			can_dev->settings->mem_len );
++	kfree(can_dev->settings);
++err_settings:
++err_if1:
++	kfree(can_dev->if2);
++err_if2:
++	kfree(can_dev->if1);
++	kfree(can_dev);
++err_out:
++	return ret;
++}
++
++/*
++ *  Cleanup
++ */
++static int __devexit xxs_ccan_remove(struct platform_device *device)
++{
++	struct device *dev = &device->dev;
++	struct can_device *can_dev = (struct can_device *) dev_get_drvdata(dev);
++
++	int j;
++	CanData *pdata;
++	u32 temp;
++
++// 	printk("/ab/%s: \n", __func__);
++
++	temp = read_register32(can_dev, CAN_CTRL);
++	temp &= ~(CTRL_IE | CTRL_SIE | CTRL_EIE);
++	write_register32( can_dev, CAN_CTRL, temp );
++
++	free_irq(can_dev->settings->can_irq, can_dev);
++	for(j = 0; j < XXS_CAN_MAXMSG; j++){
++		pdata = can_dev->message[j]->read_buffer->first;
++		while(pdata != NULL){
++			can_dev->message[j]->read_buffer->first = pdata->next;
++			kfree(pdata);
++			pdata = can_dev->message[j]->read_buffer->first;
++		}
++		kfree(can_dev->message[j]->read_buffer);
++		kfree(can_dev->message[j]);
++	}
++	kfree(can_dev->errors);
++	kfree(can_dev->options);
++	kfree(can_dev->settings);
++	kfree(can_dev->if2);
++	kfree(can_dev->if1);
++
++	cdev_del(&can_dev->can_cdev);
++
++        if (can_class != NULL) {
++                for (j = 0; j< can_device_count; j++) {
++                        device_destroy(can_class, MKDEV(XXS_CAN_MAJOR, j));
++		}
++		class_destroy(can_class);
++	}
++
++	return 0;
++}
++
++
++/** Initializes and registers the CAN module.
++ * This routine is called, when loading the kernel module.
++ */
++struct platform_driver  xxs_ccan_device_driver = {
++	.probe		= xxs_ccan_probe,
++	.remove 	= xxs_ccan_remove,
++	.driver		= {
++		.name	= "xxsvideo_ccan",
++	}
++};
++
++static int __init xxs_ccan_init(void)
++{
++	return platform_driver_register(&xxs_ccan_device_driver);
++}
++
++
++/**
++ * exit-function.
++ * This routine is called when unloading the kernel module.
++ */
++static void __exit xxs_ccan_exit(void)
++{
++
++	platform_driver_unregister(&xxs_ccan_device_driver);
++
++        /*
++         * reset CAN macro
++         */
++	__raw_writel(3<<2, JADE_CCNT_BASE + JADE_CCNT_CMSR1);
++	udelay(100);
++	__raw_writel(0, JADE_CCNT_BASE + JADE_CCNT_CMSR1);
++}
++
++/* internal functions */
++
++/** Routine for initialization of the C_CAN-Module.
++ * Within the initialization of the C_CAN-Module it's test-mode and options for the bit-timing can be set.
++ * In case that the default bit-timing options should not be overwritten and the module is not driven in
++ * any test-mode, these parameters have to be set to zero.
++ * The messages in the message-RAM all are set to "not valid" and have to be initialized one by one after
++ * the initialization of the CAN-core itself. @see init_message()
++ * @param device
++ */
++int init_can( struct can_device *can_dev)
++{
++	struct platform_device *pdev = can_dev->pdev;
++	struct device *dev = &pdev->dev;
++	struct xxsvideo_ccan_gpio *gpio = dev->platform_data;
++
++	u32 temp;
++	int i;
++
++	udelay( TIME_TO_WAIT );
++	if (gpio->gpio_outen != -1)
++		xxsvideo_set_gpio_value( gpio->gpio_outen, 1 );
++	if (gpio->gpio_standby != -1)
++		xxsvideo_set_gpio_value( gpio->gpio_standby,  gpio->standby_active_low);
++	if (gpio->gpio_wake != -1)
++		xxsvideo_set_gpio_value( gpio->gpio_wake, 1 );
++
++	// Set Init and Test/CCE Bits in CTRL-Register
++	temp = 0;
++	temp |= (CTRL_CCE | CTRL_INIT);
++
++	if ( can_dev->options->test_loopback ||
++	     can_dev->options->test_silent ||
++	     can_dev->options->test_basic )
++		   	temp |= CTRL_TEST;
++	if (can_dev->options->retrans_disable)	temp |= CTRL_DAR;
++	if (can_dev->options->interrupt_enable)	temp |= CTRL_IE;
++	if (can_dev->options->err_int_enable)	temp |= CTRL_EIE;
++	if (can_dev->options->stat_int_enable)	temp |= CTRL_SIE;
++
++	write_register32( can_dev, CAN_CTRL, temp );
++
++	// Set Test-Mode
++	temp = 0;
++
++	if( can_dev->options->test_loopback )		temp |= TEST_MODE_LOOPB;
++	if( can_dev->options->test_silent )		temp |= TEST_MODE_SILENT;
++	if( can_dev->options->test_basic )		temp |= TEST_MODE_BASIC;
++
++	write_register32( can_dev, CAN_TEST, temp );
++
++	// Set Timing Configuration
++	if( can_dev->options->bit_timing ||
++	    can_dev->options->brp_extension ) {
++		printk( KERN_DEBUG "%s: Setting Bit-rate: %4X, brpe: %4X\n", pdev->name,
++		       can_dev->options->bit_timing,
++		       can_dev->options->brp_extension );
++		write_register32 (can_dev, CAN_BTIM, can_dev->options->bit_timing );
++		write_register32 (can_dev, CAN_BRPE, can_dev->options->brp_extension );
++	}
++	// Init all Message Objects in the Message-RAM,
++	if( (read_register32( can_dev, CAN_TEST ) & TEST_MODE_BASIC) ) {
++		// Only init IF1 and IF2 in Basic-Mode
++//		printk( KERN_DEBUG "%s: Initializing IFx-registers for basic-mode ... ", pdev->name);
++		// Initialization of IF1
++		do {
++			udelay( TIME_TO_WAIT );
++		} while( get_busy_flag( can_dev, CAN_IFX1 ));
++		can_dev->if1->ifx_message_control = 0;
++		can_dev->if1->ifx_command_request = 0 | (1 & IF_MSGN);
++		// direction = send
++		can_dev->if1->ifx_mask1 = 0;
++		can_dev->if1->ifx_mask2 = 0;
++		can_dev->if1->ifx_arbitration1 = 0;
++		can_dev->if1->ifx_arbitration2 = 0 | IF_DIR;
++		if(can_dev->options->interrupt_enable)
++			can_dev->if1->ifx_message_control |= IF_TXIE;
++		if(can_dev->options->remote_enable)
++			can_dev->if1->ifx_message_control |= IF_RMTE;
++		can_dev->if1->ifx_arbitration2 |= IF_MVAL;
++		can_dev->if1->ifx_message_control |= IF_EOB;
++
++		if( dump_ifx( can_dev, can_dev->if1, CAN_IFX1) ){
++			printk( KERN_DEBUG "-> failed.\n");
++			return -EIO;
++		}
++		// Initialization of IF2
++		do {
++			udelay( TIME_TO_WAIT );
++		} while( get_busy_flag( can_dev, CAN_IFX2 ));
++
++		can_dev->if2->ifx_command_request = 0 | (1 & IF_MSGN);
++		can_dev->if2->ifx_mask1 = 0;
++		can_dev->if2->ifx_mask2 = 0;
++		can_dev->if2->ifx_arbitration1 = 0;
++		can_dev->if2->ifx_arbitration2 = 0;
++		// direction = send
++		can_dev->if2->ifx_arbitration2 &= ~IF_DIR;
++		if( can_dev->options->interrupt_enable)	can_dev->if2->ifx_message_control |= IF_RXIE;
++		if( can_dev->options->remote_enable)	can_dev->if2->ifx_message_control |= IF_RMTE;
++
++		if( dump_ifx( can_dev, can_dev->if2, CAN_IFX2)){
++			printk( KERN_DEBUG "-> failed.\n");
++			return -EIO;
++		}
++//		printk( KERN_DEBUG "-> done.\n");
++	} else {
++		// all message objects are set to not valid to be initialized later on
++// 		printk( KERN_DEBUG "%s: Initializing message-objects ... ", pdev->name);
++		for (i = 1; i <= 32; i++){
++			do {
++				udelay( TIME_TO_WAIT );
++			} while( get_busy_flag( can_dev, CAN_IFX1 ));
++
++			can_dev->if1->ifx_mask1 = 0;
++			can_dev->if1->ifx_mask2 = 0;
++			can_dev->if1->ifx_arbitration1 = 0;
++			can_dev->if1->ifx_arbitration2 = 0;
++
++			can_dev->if1->ifx_message_control = 0;
++			can_dev->if1->ifx_message_control |= IF_EOB;
++
++			can_dev->if1->ifx_message_control &= ~(IF_TXRQ | IF_NEWD);
++			can_dev->if1->ifx_command_request = 0 | (i & IF_MSGN);	// Set Message Number
++			can_dev->if1->ifx_arbitration2 &= ~IF_MVAL;		// Set Message to "not valid"
++			// Write the updated content of internal buffer back to Register IF1
++			if( dump_ifx( can_dev, can_dev->if1, CAN_IFX1 ) ){
++				printk( KERN_DEBUG "-> failed.\n");
++				return -EIO;
++			}
++// 			printk( KERN_DEBUG "\n%s: Initialized message-object: %d", pdev->name, i);
++		}
++// 		printk( KERN_DEBUG "-> done.\n");
++	}
++	// Reset Init and CCE
++	temp = read_register32( can_dev, CAN_CTRL );
++	printk( KERN_DEBUG "%s: CTRL is: %4X\n", pdev->name, temp);
++	write_register32( can_dev, CAN_CTRL, (temp & ~(CTRL_INIT | CTRL_CCE) ));
++
++	return 0;
++}
++
++
++
++/** Routine for initialization of one single message object.
++ * Initializes a message object and sets options like arbitration as specified
++ * in settings->message
++ * No initial Data- or Command Mask Registers are set.
++ */
++int init_message( struct can_device *can_dev, CanMessage *msg ) {
++	// don't do anything while register is busy
++	CanMessage temp;
++	int num;
++
++	if(copy_from_user((void *)&temp, (void *)msg, sizeof(temp))){
++		printk( KERN_ERR "%s: Error copying data in message_init.\n", MODULE_NAME);
++		return -EIO;
++	}
++
++	num = temp.msg_num - 1;
++
++	can_dev->message[num]->msg_num  = temp.msg_num;
++	can_dev->message[num]->msg_dir  = temp.msg_dir;
++	can_dev->message[num]->msg_mask = temp.msg_mask;
++	can_dev->message[num]->msg_id   = temp.msg_id;
++	can_dev->message[num]->data_length = temp.data_length;
++	can_dev->message[num]->msg_valid = temp.msg_valid;
++	can_dev->message[num]->id_extended = temp.id_extended;
++	can_dev->message[num]->mask_extended = temp.mask_extended;
++	can_dev->message[num]->remote_enable = temp.remote_enable;
++	can_dev->message[num]->int_enable = temp.int_enable;
++	can_dev->message[num]->new_txdata = temp.new_txdata;
++	can_dev->message[num]->new_rxdata = temp.new_rxdata;
++
++	do {
++		udelay( TIME_TO_WAIT );
++	} while( get_busy_flag( can_dev, CAN_IFX1 ));
++
++	can_dev->if1->ifx_command_request = can_dev->message[num]->msg_num;
++	can_dev->if1->ifx_command_mask = IF_WRRD | IF_MASK | IF_ARB | IF_CTRL;
++//     can_dev->if1->ifx_command_mask = IF_WRRD | IF_ARB | IF_CTRL;
++
++	if( can_dev->message[num]->mask_extended ){
++		can_dev->if1->ifx_mask2 = (can_dev->message[num]->msg_mask >> 16) & IF_MSKH;
++		can_dev->if1->ifx_mask2 |= IF_MXTD;
++		can_dev->if1->ifx_mask1 = can_dev->message[num]->msg_mask & IF_MSKL;
++	} else {
++        can_dev->if1->ifx_mask2 = (can_dev->message[num]->msg_mask << 2) & IF_MSKH;
++	}
++
++	if( can_dev->message[num]->id_extended ){
++        can_dev->if1->ifx_arbitration2 = (can_dev->message[num]->msg_id >> 16) & IF_IDH;
++		can_dev->if1->ifx_arbitration2 |= IF_XTD;
++		can_dev->if1->ifx_arbitration1 = (can_dev->message[num]->msg_id & IF_IDL);
++	} else {
++        can_dev->if1->ifx_arbitration2 = (can_dev->message[num]->msg_id << 2) & IF_IDH;
++	}
++
++	can_dev->if1->ifx_message_control = can_dev->message[num]->data_length;
++
++	if( can_dev->message[num]->msg_dir ){
++		can_dev->if1->ifx_arbitration2 |= IF_DIR;
++		if( can_dev->message[num]->int_enable )
++			can_dev->if1->ifx_message_control |= IF_TXIE;
++		if( can_dev->message[num]->remote_enable )
++			can_dev->if1->ifx_message_control |= IF_RMTE;
++	} else {
++		if( can_dev->message[num]->int_enable )
++			can_dev->if1->ifx_message_control |= IF_RXIE;
++	}
++
++	can_dev->if1->ifx_message_control |= IF_UMSK;
++	can_dev->if1->ifx_mask2 |= IF_MDIR;
++
++	if( can_dev->message[num]->msg_valid )
++		can_dev->if1->ifx_arbitration2 |= IF_MVAL;
++
++	if( dump_ifx( can_dev, can_dev->if1, CAN_IFX1))
++		return -EIO;
++
++	do {
++		udelay(TIME_TO_WAIT);
++	} while( get_busy_flag( can_dev, CAN_IFX1 ));
++
++	write_register32( can_dev, CAN_IFX1 + CAN_IFCR, can_dev->if1->ifx_command_request);
++
++	return 0;
++}
++
++
++
++
++/** Internal function, that loads the content of an IFx Register.
++ * The current content of the IFx Register specified by it's address
++ * @see ifxbase is completely loaded
++ * into the the internal buffer @see reg.
++ * @param can_dev	  The can_dev number of the CAN device.
++ * @param reg     The internal buffer the register's content is stored to
++ * @param ifxbase The offset-address of the IFx Register to load into the buffer
++ */
++int load_ifx( struct can_device *can_dev, IFxRegister *reg, u32 ifx_base) {
++
++	if( ifx_base != CAN_IFX1 && ifx_base != CAN_IFX2 )
++		return -EINVAL;
++	if( reg == NULL )
++		return -EIO;
++
++	reg->ifx_command_request = read_register32( can_dev, ifx_base + CAN_IFCR);
++	reg->ifx_command_mask    = read_register32( can_dev, ifx_base + CAN_IFCM);
++	reg->ifx_mask1           = read_register32( can_dev, ifx_base + CAN_IFM1);
++	reg->ifx_mask2           = read_register32( can_dev, ifx_base + CAN_IFM2);
++	reg->ifx_arbitration1    = read_register32( can_dev, ifx_base + CAN_IFA1);
++	reg->ifx_arbitration2    = read_register32( can_dev, ifx_base + CAN_IFA2);
++	reg->ifx_message_control = read_register32( can_dev, ifx_base + CAN_IFMC);
++	reg->ifx_data_a1         = read_register32( can_dev, ifx_base + CAN_IFDA1);
++	reg->ifx_data_a2         = read_register32( can_dev, ifx_base + CAN_IFDA2);
++	reg->ifx_data_b1         = read_register32( can_dev, ifx_base + CAN_IFDB1);
++	reg->ifx_data_b2         = read_register32( can_dev, ifx_base + CAN_IFDB2);
++
++	return 0;
++}
++
++
++/** Internal function, that dumps a buffer's content into an IFx Register.
++ * The updated content of the buffer specified by @see reg is written to the
++ * IFx Register at the
++ * offset-address @see ifxbase.
++ * @param can_dev	   The can_dev number of the CAN device.
++ * @param reg      The internal buffer which content will be dumped
++ * @param ifx_base The base address determing the IFx Register, the content is
++ * written to
++ */
++int dump_ifx( struct can_device *can_dev, IFxRegister *reg, u32 ifx_base)
++{
++	if( ifx_base != CAN_IFX1 && ifx_base != CAN_IFX2 )
++		return -EINVAL;
++	if( reg == NULL )
++		return -EIO;
++
++	write_register32( can_dev, ifx_base + CAN_IFCR, reg->ifx_command_request);
++	write_register32( can_dev, ifx_base + CAN_IFCM, reg->ifx_command_mask);
++	write_register32( can_dev, ifx_base + CAN_IFM1, reg->ifx_mask1);
++	write_register32( can_dev, ifx_base + CAN_IFM2, reg->ifx_mask2);
++	write_register32( can_dev, ifx_base + CAN_IFA1, reg->ifx_arbitration1);
++	write_register32( can_dev, ifx_base + CAN_IFA2, reg->ifx_arbitration2);
++	write_register32( can_dev, ifx_base + CAN_IFMC, reg->ifx_message_control);
++	write_register32( can_dev, ifx_base + CAN_IFDA1, reg->ifx_data_a1);
++	write_register32( can_dev, ifx_base + CAN_IFDA2, reg->ifx_data_a2);
++	write_register32( can_dev, ifx_base + CAN_IFDB1, reg->ifx_data_b1);
++	write_register32( can_dev, ifx_base + CAN_IFDB2, reg->ifx_data_b2);
++
++	return 0;
++}
++
++/** Internal function to print out content of an interface register.
++ * The content of the register specified by @see reg and the offset-address
++ * @see ifxbase
++ * is written out for debugging.
++ * @param can_dev	   The can_dev number of the CAN device.
++ * @param reg      The internal buffer which content will be dumped
++ * @param ifx_base The base address determing the IFx Register, the content is
++ * written to.
++ */
++int debug_ifx( struct can_device *can_dev, IFxRegister *reg, u32 ifx_base)
++{
++	if( ifx_base != CAN_IFX1 && ifx_base != CAN_IFX2 )
++		return -EINVAL;
++	if( reg == NULL )
++		return -EIO;
++
++	printk( KERN_NOTICE "%4X: %4X\n", ifx_base + CAN_IFCR, reg->ifx_command_request);
++	printk( KERN_NOTICE "%4X: %4X\n", ifx_base + CAN_IFCM, reg->ifx_command_mask);
++	printk( KERN_NOTICE "%4X: %4X\n", ifx_base + CAN_IFM1, reg->ifx_mask1);
++	printk( KERN_NOTICE "%4X: %4X\n", ifx_base + CAN_IFM2, reg->ifx_mask2);
++	printk( KERN_NOTICE "%4X: %4X\n", ifx_base + CAN_IFA1, reg->ifx_arbitration1);
++	printk( KERN_NOTICE "%4X: %4X\n", ifx_base + CAN_IFA2, reg->ifx_arbitration2);
++	printk( KERN_NOTICE "%4X: %4X\n", ifx_base + CAN_IFMC, reg->ifx_message_control);
++	printk( KERN_NOTICE "%4X: %4X\n", ifx_base + CAN_IFDA1, reg->ifx_data_a1);
++	printk( KERN_NOTICE "%4X: %4X\n", ifx_base + CAN_IFDA2, reg->ifx_data_a2);
++	printk( KERN_NOTICE "%4X: %4X\n", ifx_base + CAN_IFDB1, reg->ifx_data_b1);
++	printk( KERN_NOTICE "%4X: %4X\n", ifx_base + CAN_IFDB2, reg->ifx_data_b2);
++
++	return 0;
++}
++
++/** Busy flag check.
++ * Reads the actual state of the Busy-Flag in the IFx Register given by
++ * @see ifxbase.
++ * @param can_dev	   The can_dev number of the CAN device.
++ * @param ifx_base The base address determing the IFx Register.
++ * @return returns zero, if the busy-flag is not set.
++ */
++int get_busy_flag( struct can_device *can_dev, u32 ifx_base )
++{
++	return (read_register32( can_dev, ifx_base + CAN_IFCR ) & IF_BUSY);
++}
++
++/** Internal function to print out content of the CAN related registers.
++ * The content of the CAN related registers is written out for debugging
++ * purposes.
++ * @param can_dev	    The can_dev number of the CAN device.
++ * @param info_text A brief text that can be added to recognize the output.
++ */
++void debug_registers(struct can_device *can_dev, char *info_text )
++{
++	printk( KERN_NOTICE "Actual content of Registers %s:\n", info_text);
++
++	printk( KERN_NOTICE "Control-Registers\n");
++	printk( KERN_NOTICE  "   ControlReg: %4X\n", read_register32( can_dev, CAN_CTRL) );
++	printk( KERN_NOTICE  "   Status Reg: %4X\n", read_register32( can_dev, CAN_STAT) );
++	printk( KERN_NOTICE  "   ErrorCount: %4X\n", read_register32( can_dev, CAN_ERRC) );
++	printk( KERN_NOTICE  "   BitTimingR: %4X\n", read_register32( can_dev, CAN_BTIM) );
++	printk( KERN_NOTICE  "   InterruptR: %4X\n", read_register32( can_dev, CAN_INTR) );
++	printk( KERN_NOTICE  "   Test   Reg: %4X\n", read_register32( can_dev, CAN_TEST) );
++	printk( KERN_NOTICE  "   B R P -Reg: %4X\n", read_register32( can_dev, CAN_BRPE) );
++
++	printk( KERN_NOTICE "Message-Handler-Registers\n");
++	printk( KERN_NOTICE  "   TransRqst1: %4X\n", read_register32( can_dev, CAN_TR1) );
++	printk( KERN_NOTICE  "   TransRqst2: %4X\n", read_register32( can_dev, CAN_TR2) );
++	printk( KERN_NOTICE  "   New Data 1: %4X\n", read_register32( can_dev, CAN_ND1) );
++	printk( KERN_NOTICE  "   New Data 2: %4X\n", read_register32( can_dev, CAN_ND2) );
++	printk( KERN_NOTICE  "   InterPend1: %4X\n", read_register32( can_dev, CAN_IP1) );
++	printk( KERN_NOTICE  "   InterPend2: %4X\n", read_register32( can_dev, CAN_IP2) );
++	printk( KERN_NOTICE  "   MessValid1: %4X\n", read_register32( can_dev, CAN_MV1) );
++	printk( KERN_NOTICE  "   MessValid2: %4X\n", read_register32( can_dev, CAN_MV2) );
++
++	debug_ifx(can_dev, can_dev->if1, CAN_IFX1);
++	printk( KERN_NOTICE "\n");
++	debug_ifx(can_dev, can_dev->if2, CAN_IFX2);
++}
++
++
++/** Read the content of a register
++ * Internal, hardware-specific function, that reads data from a register
++ * @param can_dev	  The can_dev number of the CAN device.
++ * @param address The offset address of the register the data is read from.
++ */
++u32 read_register32 (struct can_device *can_dev, u32 address)
++{
++	return __raw_readl(can_dev->settings->base_address + address);
++}
++
++
++/** Write data to a register
++ * Internal, hardware-specific function, that writes data to a register.
++ * @param can_dev   The can_dev number of the CAN device.
++ * @param address The offset address of the register the data is written to.
++ */
++void write_register32 (struct can_device *can_dev, u32 address, u32 data)
++{
++	__raw_writel(data, can_dev->settings->base_address + address);
++}
++
++/* end of internal functions */
++
++/**
++ * declaration of the init-/ exit-functions
++ */
++module_init(xxs_ccan_init);
++module_exit(xxs_ccan_exit);
+--- linux-2.6.27/arch/arm/mach-xxsvideo/include/mach/can.h	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/arch/arm/mach-xxsvideo/include/mach/can.h	2009-01-08 10:49:39.000000000 +0100
+@@ -0,0 +1,347 @@
++/*
++* linux/include/asm-arm/arch-xxsvideo/can.h
++*
++*  Copyright (C) 2007 mycable GmbH
++*       Dawid Nogens <dn@mycable.de>
++*
++* This program is free software; you can redistribute it and/or modify
++* it under the terms of the GNU General Public License version 2 as
++* published by the Free Software Foundation.
++*
++*/
++
++#ifndef __ASM_ARCH_XXSVIDEO_CAN_H
++#define __ASM_ARCH_XXSVIDEO_CAN_H
++
++#include <asm/types.h>
++#include <asm/ioctl.h>
++#include <linux/module.h>
++#include <linux/version.h>
++#include <linux/init.h>
++#include <linux/fs.h>
++#include <linux/cdev.h>
++#include <linux/interrupt.h>
++#include <mach/platform.h>
++#include <linux/platform_device.h>
++
++/** ioctl commands */
++#define XXS_CAN_IOCTL_TYPE		0xAA
++
++#define IOCTL_XXS_CAN_MODINIT		_IOW ( XXS_CAN_IOCTL_TYPE, 0, DeviceOptions*)
++#define	IOCTL_XXS_CAN_MSGINIT		_IOW ( XXS_CAN_IOCTL_TYPE, 1, CanMessage*)
++#define	IOCTL_XXS_CAN_DEBUGREG		_IO  ( XXS_CAN_IOCTL_TYPE, 2)
++#define IOCTL_XXS_CAN_IDWRITE		_IOW ( XXS_CAN_IOCTL_TYPE, 3, cfsarg_t)
++#define	IOCTL_XXS_CAN_IDREAD		_IOWR( XXS_CAN_IOCTL_TYPE, 4, cfsarg_t*)
++
++#define XXS_CAN_MAXDEV		1
++#define XXS_CAN_MAXMSG		32
++#define XXS_CAN_FIFOLEN		32
++#define XXS_CAN_DATALEN		8
++#define XXS_CAN_MAXBUF		32
++
++#define XXS_CAN_MAJOR		244
++
++#define MODULE_NAME		"xxs_c_can"
++#define TIME_TO_WAIT		1000
++
++/** CAN-related GPIOs */
++struct xxsvideo_ccan_gpio {
++	unsigned char	id;
++	int	gpio_outen;		/** The GPIO number used a output enable */
++	int	gpio_standby;		/** The GPIO number used to enable sleep mode */
++	unsigned char	standby_active_low;	/* set 1: active low;*/
++	int	gpio_wake;		/* set to -1 if unused */
++};
++/* CAN platform data */
++extern void __init xxsvideo_add_device_ccan(struct xxsvideo_ccan_gpio *gpio);
++
++
++/** CAN-Protocol Registers */
++#define CAN_CTRL	0x0000 /** CAN Control Register */
++#define CAN_STAT	0x0004 /** Status Register */
++#define CAN_ERRC	0x0008 /** Error Counter */
++#define CAN_BTIM	0x000C /** Bit Timing Register - write enabled by CCE in CAN_CTRL */
++#define CAN_INTR	0x0010 /** Interrupt Register - READ ONLY! */
++#define CAN_TEST	0x0014 /** Test Register - write enabled by TEST in CAN_CTRL */
++#define CAN_BRPE	0x0018 /** BRP Extension Register - write enabled by CCE in CAN_CTRL */
++
++/** Base-Addresses of the IFx Registers */
++#define CAN_IFX1	0x0020 /** Interface Register 1 */
++#define CAN_IFX2	0x0080 /** Interface Register 2 */
++
++/** Offset-Adresses within the IFx Registers */
++#define CAN_IFCR	0x0000 /** IFx Command Request */
++#define CAN_IFCM	0x0004 /** IFx Command Mask */
++#define CAN_IFM1	0x0008 /** IFx Mask 1 */
++#define CAN_IFM2	0x000C /** IFx Mask 2 */
++#define CAN_IFA1	0x0010 /** IFx Arbitration 1 */
++#define CAN_IFA2	0x0014 /** IFx Arbitration 2 */
++#define CAN_IFMC	0x0018 /** IFx Message Control */
++#define CAN_IFDA1	0x001C /** IFx Data A 1 */
++#define CAN_IFDA2	0x0020 /** IFx Data A 2 */
++#define CAN_IFDB1	0x0024 /** IFx Data B 1 */
++#define CAN_IFDB2	0x0028 /** IFx Data B 2 */
++
++/** Message Handler Registers */
++#define CAN_TR1		0x0100 /** Transmission Request 1 - READ ONLY! */
++#define CAN_TR2		0x0104 /** Transmission Request 2 - READ ONLY! */
++#define CAN_ND1		0x0120 /** New Data 1 - READ ONLY! */
++#define CAN_ND2		0x0124 /** New Data 2 - READ ONLY! */
++#define CAN_IP1		0x0140 /** Interrupt Pending 1 - READ ONLY! */
++#define CAN_IP2		0x0144 /** Interrupt Pending 2 - READ ONLY! */
++#define CAN_MV1		0x0160 /** Message Valid 1 - READ ONLY! */
++#define CAN_MV2		0x0164 /** Message Valid 2 - READ ONLY! */
++
++/** Elements within the CAN Control-Register */
++#define CTRL_TEST	0x0080
++#define CTRL_CCE	0x0040
++#define CTRL_DAR	0x0020
++#define CTRL_EIE	0x0008
++#define CTRL_SIE	0x0004
++#define CTRL_IE		0x0002
++#define CTRL_INIT	0x0001
++
++/** Elements within the Status Register */
++#define STAT_BOFF	0x0080
++#define STAT_WARN	0x0040
++#define STAT_PASS	0x0020
++#define STAT_RXOK	0x0010
++#define STAT_TXOK	0x0008
++#define STAT_LEC	0x0007
++
++/** Elements within the Error Counter */
++#define ERRC_RP		0x8000
++#define ERRC_REC	0x7F00
++#define ERRC_TEC	0x00FF
++
++/** Elements within the Bit Timing Register */
++#define BTIM_SEG1	0x7000
++#define BTIM_SEG2	0x0F00
++#define BTIM_SJW	0x00C0
++#define BTIM_BRP	0x003F
++
++/** Elements within the Test-Register */
++#define TEST_RX		0x0080
++#define TEST_TX		0x0060
++#define TEST_MODE	0x001C
++
++/** Test-Mode: Loop-Back.
++ * The module enters a mode for self-testing purposes. The module itself
++ * receives the own data sent.
++ * This mode can be combined with silent-mode, if the CAN-Bus should not be
++ * affected.
++ */
++#define TEST_MODE_LOOPB	0x0010
++
++/** Test-Mode: Silent.
++ * The Module enters a monitoring-mode and only sends recessive bits so it
++ * doesn't affect the CAN-Bus.
++ */
++#define TEST_MODE_SILENT 0x0008
++
++/** Test-Mode: Basic.
++ * In this mode, the Message RAM is not being used, so CAN-Messages will be
++ * directly transmitted or received by the IFx Registers. IF1 is used for
++ * transmission, IF2 for reception.
++ */
++#define TEST_MODE_BASIC	0x0004
++
++/** Elements within the BRP Register */
++#define BRPE_BRPE	0x000F
++
++/** Elements within the IFx Registers */
++#define IF_BUSY		0x8000
++#define IF_MSGN		0x003F
++
++#define IF_WRRD		0x0080
++#define IF_MASK		0x0040
++#define IF_ARB		0x0020
++#define IF_CTRL		0x0010
++#define IF_CINT		0x0008
++#define IF_TXND		0x0004
++#define IF_DATA		0x0002
++#define IF_DATB		0x0001
++
++#define IF_MSKL		0xFFFF
++#define IF_MSKH		0x1FFF
++#define IF_MXTD		0x8000
++#define IF_MDIR		0x4000
++
++#define IF_IDL		0xFFFF
++#define IF_IDH		0x1FFF
++#define IF_MVAL		0x8000
++#define IF_XTD		0x4000
++#define IF_DIR		0x2000
++
++#define IF_NEWD		0x8000
++#define IF_MSGL		0x4000
++#define IF_INTP		0x2000
++#define IF_UMSK		0x1000
++#define IF_TXIE		0x0800
++#define IF_RXIE		0x0400
++#define IF_RMTE		0x0200
++#define IF_TXRQ		0x0100
++#define IF_EOB		0x0080
++#define IF_DLC		0x000F
++
++
++typedef struct can_frame_struct
++{
++	unsigned long identifier;   //11 or 29 bit identifier
++	int xtd;                    //0: standard id, 1: extended id
++	int length;                 //data length 0..MAX_CAN_LEN
++	unsigned char data[XXS_CAN_DATALEN];    //data bytes
++} cfs_t;
++
++
++typedef struct cfs_arg_struct
++{
++	int msg_num;
++	cfs_t cfs_msg;
++} cfsarg_t;
++
++#define CAN0_OUTEN	23
++#define CAN0_SLEEP	22
++#define CAN1_OUTEN	21
++#define CAN1_SLEEP	20
++/** Structure representing the message interface registers.
++ * The interface registers are used for transfer of data between the driver an
++ * the message RAM of the CAN module.
++ */
++typedef struct ifx_register {
++	u32 ifx_base;
++	u32 ifx_command_request;
++	u32 ifx_command_mask;
++	u32 ifx_mask1;
++	u32 ifx_mask2;
++	u32 ifx_arbitration1;
++	u32 ifx_arbitration2;
++	u32 ifx_message_control;
++	u32 ifx_data_a1;
++	u32 ifx_data_a2;
++	u32 ifx_data_b1;
++	u32 ifx_data_b2;
++} IFxRegister;
++
++/** Structure holding device specific settings.
++ * The devices included in the CAN module all have different settings that are
++ * required to get the device to work.
++ */
++typedef struct device_settings {
++	int can_irq;		/** The IRQ of the CAN device */
++	u32 base_address;	/** The base addess of the registers used for this device */
++	u32 mem_len;		/**  */
++} DeviceSettings;
++
++/** Structure holding device specific options.
++* The devices included in the CAN module all may have different settings in the
++* behaviour of the CAN core.
++*/
++typedef struct device_options {
++/*	int new_txdata;
++	int new_rxdata;*/
++	int test_loopback;
++	int test_silent;
++	int test_basic;
++	int interrupt_enable;
++	int retrans_disable;
++	int err_int_enable;
++	int stat_int_enable;
++	int remote_enable;
++	u32 bit_timing;
++	u32 brp_extension;
++} DeviceOptions;
++
++/** Structure representing the error counter of the device.
++ * Every time an error is detected by the CAN core, the repsective counter is
++ * increased here.
++ */
++typedef struct can_errors {
++	int bit_stuffing_error;
++	int format_error;
++	int acknoledgement_error;
++	int bit_1_error;
++	int bit_0_error;
++	int checksum_error;
++} CanError;
++
++/** Structure representing one node of the message buffer.
++ * As the message buffer is implemented as a linked list, one node contains the
++ * data received and a pointer to the next node in this list.
++ */
++typedef struct can_data {
++	cfs_t *msg;		/** The data that has been received. */
++// 	u8 data[XXS_CAN_DATALEN];
++	struct can_data *next; 	/** Pointer to the next node in the linked list. */
++} CanData;
++
++/** Structure representing a message buffer.
++ * The message buffer is implemented as a linked list. @see can_data
++ */
++typedef struct message_buffer {
++	CanData *first; /** Pointer to the first data in the message buffer. */
++	CanData *last;  /** Pointer to the last data in the message buffer. */
++	int size;	/** Current number of messages in the message buffer. */
++} MessageBuffer;
++
++/** Structure representing a message object in the message RAM.
++ * A C_CAN device has got a message RAM containing a number of messages that
++ * can be configured independent from each other.
++ * In the driver each object in the message RAM has its own buffer, where
++ * received messages are stored until they have been read.
++ */
++typedef struct can_message_object {
++	int msg_valid;
++	int id_extended;
++	int mask_extended;
++	int remote_enable;
++	int int_enable;
++	int msg_num;
++	int msg_dir;		/* 0: receive; 1: transmit */
++	int data_length;
++	int msg_mask;
++	int msg_id;
++	CanData *data;
++	MessageBuffer *read_buffer;
++	int new_txdata;
++	int new_rxdata;
++//	MessageBuffer *write_buffer;
++} CanMessage;
++
++/** Structure representing one single CAN device.
++ * The entire CAN module may consist of more than one CAN device. Each of these CAN devices included
++ * in the CAN module is represented by an instance of this structure.
++ */
++typedef struct can_device {
++	wait_queue_head_t wait_queue_read;	/** The wait queue used when reading messages. */
++	wait_queue_head_t wait_queue_write;	/** The wait queue used when writing messages. */
++	IFxRegister *if1;			/** Registers used transferring data into a message object. */
++	IFxRegister *if2;			/** Registers used transferring data from a message object. */
++	DeviceSettings *settings;		/** Device specific settings. */
++	DeviceOptions *options;			/** Device specific options. */
++	CanMessage *message[XXS_CAN_MAXMSG];	/** The message objects of the device. */
++	CanError *errors;			/** The error counters of the device. */
++        struct platform_device *pdev;		/** Platform data of the device */
++        struct cdev can_cdev;			/** the modules cdev structure */
++} CanDevice;
++
++/** Structure representing the CAN module.
++ * All CAN devices of the CAN module are held in this structure.
++ */
++
++/** Function prototypes */
++
++int init_can( struct can_device *device );
++int load_ifx( struct can_device *can_dev, IFxRegister *reg, u32 ifxbase );
++int dump_ifx( struct can_device *can_dev, IFxRegister *reg, u32 ifxbase );
++int get_busy_flag( struct can_device *device, u32 ifxbase );
++
++u32 read_register32( struct can_device *device, u32 address );
++void write_register32( struct can_device *device, u32 address, u32 data );
++
++void debug_registers( struct can_device *device, char *info_text );
++int debug_ifx( struct can_device *device , IFxRegister *reg, u32 ifx_base );
++int init_message ( struct can_device *device, CanMessage *arg );
++
++
++#endif
+--- linux-2.6.27/Documentation/drivers/char/xxs_c_can.txt	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/Documentation/drivers/char/xxs_c_can.txt	2009-01-08 10:49:38.000000000 +0100
+@@ -0,0 +1,268 @@
++/*
++* Documentation/drivers/char/xxs_c_can.txt
++*
++*  Copyright (C) 2007 mycable GmbH
++*       Dawid Nogens <dn@mycable.de>
++*
++* This program is free software; you can redistribute it and/or modify
++* it under the terms of the GNU General Public License version 2 as
++* published by the Free Software Foundation.
++*
++*/
++
++CONTENT:
++1. INSTALLATION
++2. INITIALIZATION
++3. USING THE CAN DEVICES
++4. HEADER FILE
++5. EXAMPLES
++6. NOTES
++
++
++1. INSTALLATION
++
++The CAN driver supports 2 CAN devices integrated in the CAN module shipped with
++the mycable XXSvideo board.
++
++If the driver is built as module it can be loaded with
++
++	modprobe xxs_c_can
++
++The device nodes will be set automatically by udevd. If you don't use udev, you
++may set them with:
++	mknod /dev/can0 c 244 0
++	mknod /dev/can1 c 244 1
++
++Now, the device CAN0 can be accessed by /dev/can0 and the device CAN1 by /dev/can1.
++
++
++2. INITIALIZATION
++(see /include/asm-arm/arch-xxsvideo/can.h for more information regarding symbols and data types)
++
++After inserting the kernelmodule to the system, the CAN devices aren't ready to communicate with the CAN bus yet.
++To tranmit or receive data the device itself and the message obejcts have to be initialized.
++
++The device specific options are held in a data structure like shown below:
++	typedef struct device_options {
++		int test_loopback;
++		int test_silent;
++		int test_basic;
++		int interrupt_enable;
++		int retrans_disable;
++		int err_int_enable;
++		int stat_int_enable;
++		int remote_enable;
++		u32 bit_timing;
++		u32 brp_extension;
++	} DeviceOptions;
++These settings are transmitted to the driver by the ioctl command IOCTL_XXS_CAN_MODINIT.
++
++After the initialization of the CAN device, at least one message object has to be initialized.
++The settings of a message object also are represented in a structure,
++	typedef struct can_message_object {
++		int msg_valid;
++		int id_extended;
++		int mask_extended;
++		int remote_enable;
++		int int_enable;
++		int msg_num;
++		int msg_dir;
++		int data_length;
++		int msg_mask;
++		int msg_id;
++		void *data;
++		void *read_buffer;
++		int new_txdata;
++	} CanMessage;
++which is transferred to the driver by the ioctl command IOCTL_XXS_CAN_MSGINIT.
++
++When reading messages with a variable id or data-length, the ioctl IOCTL_XXS_CAN_IDREAD should be used.
++	typedef struct cfs_arg_struct
++	{
++		int msg_num;				// message object to read from
++		cfs_t cfs_msg;				// Buffer, where the message should be stored
++	} cfsarg_t;
++
++This structure contains the data, the data-length and the id of a message.
++	typedef struct can_frame_struct
++	{
++		unsigned long identifier;   		// 11 or 29 bit identifier
++		int xtd;                    		// 0: standard id, 1: extended id
++		int length;                 		// data length 0..MAX_CAN_LEN
++		unsigned char data[XXS_CAN_DATALEN];    // data bytes
++	} cfs_t;
++
++
++
++Definition of the IOCTL-commands:
++	#define XXS_CAN_IOCTL_TYPE		0xAA
++
++	#define IOCTL_XXS_CAN_MODINIT		_IOW( XXS_CAN_IOCTL_TYPE, 0, DeviceOptions*)
++	#define	IOCTL_XXS_CAN_MSGINIT		_IOW( XXS_CAN_IOCTL_TYPE, 1, CanMessage*)
++	#define	IOCTL_XXS_CAN_DEBUGREG		_IO( XXS_CAN_IOCTL_TYPE, 2)
++	#define IOCTL_XXS_CAN_IDWRITE		_IOW( XXS_CAN_IOCTL_TYPE, 3, cfsarg_t)
++	#define	IOCTL_XXS_CAN_IDREAD		_IOWR( XXS_CAN_IOCTL_TYPE, 4, cfsarg_t*)
++
++
++3. USING THE CAN DEVICES
++
++The CAN device consists of 32 message objects, which all can be configured independent from each other.
++After initialization the CAN driver stores received CAN messages in a corresponding message-buffer for each
++message object.	A message will be deleted in the message buffer, when it's read from userspace.
++
++Access to the message objects can be controlled by seeking the device file with lseek.
++
++
++4. HEADER FILE
++/* ------------------------------------------------------------------------------------- */
++/* xxs_can.h - Header file for Applications using CAN */
++/** ioctl commands */
++#define XXS_CAN_IOCTL_TYPE      0xAA
++#define IOCTL_XXS_CAN_MODINIT       _IOW( XXS_CAN_IOCTL_TYPE, 0, DeviceOptions*)
++#define IOCTL_XXS_CAN_MSGINIT       _IOW( XXS_CAN_IOCTL_TYPE, 1, CanMessage*)
++#define IOCTL_XXS_CAN_DEBUGREG      _IO( XXS_CAN_IOCTL_TYPE, 2)
++#define IOCTL_XXS_CAN_IDWRITE       _IOW( XXS_CAN_IOCTL_TYPE, 3, cfsarg_t)
++#define IOCTL_XXS_CAN_IDREAD        _IOWR( XXS_CAN_IOCTL_TYPE, 4, cfsarg_t*)
++
++#define TEST_MODE_LOOPB         0x0010
++
++#define MAX(x,y) ((x)<(y)?(y):(x))
++#define MIN(x,y) ((x)<(y)?(x):(y))
++
++typedef struct can_frame_struct
++{
++	unsigned long identifier;
++	int xtd;
++	int length;
++	unsigned char data[XXS_CAN_DATALEN];
++} cfs_t;
++
++typedef struct cfs_arg_struct
++{
++	int msg_num;
++	cfs_t cfs_msg;
++} cfsarg_t;
++
++typedef struct device_options {
++	int test_loopback;
++	int test_silent;
++	int test_basic;
++	int interrupt_enable;
++	int retrans_disable;
++	int err_int_enable;
++	int stat_int_enable;
++	int remote_enable;
++	u32 bit_timing;
++	u32 brp_extension;
++} DeviceOptions;
++
++typedef struct can_data {
++	cfs_t *msg;
++	struct can_data *next;
++} CanData;;
++
++typedef struct message_buffer {
++	CanData *first;
++	CanData *last;
++	int size;
++} MessageBuffer;
++
++typedef struct can_message_object {
++	int msg_valid;
++	int id_extended;
++	int mask_extended;
++	int remote_enable;
++	int int_enable;
++	int msg_num;
++	int msg_dir;
++	int data_length;
++	int msg_mask;
++	int msg_id;
++	CanData *data;
++	MessageBuffer *read_buffer;
++	int new_txdata;
++} CanMessage;
++/* ------------------------------------------------------------------------------------- */
++
++5. EXAMPLES
++
++Given examples without error handling:
++
++int fd;
++DeviceOptions *device_options;
++char send[9];
++char buffer[8];
++CanMessage *message_object;
++cfsarg_t *rxframe;
++cfsarg_t rx;
++
++// open device node
++fd = open("/dev/can0", O_RDWR);
++
++// setting options for CAN device
++device_options->test_loopback = 0;	// no test mode
++device_options->test_silent = 0;
++device_options->test_basic = 0;
++device_options->interrupt_enable = 1;   // all interrupts enabled
++device_options->retrans_disable = 0;
++device_options->err_int_enable = 1;
++device_options->stat_int_enable = 1;
++device_options->bit_timing    = 0x125B ;
++device_options->brp_extension = 0x0000;
++
++io = ioctl(fd, IOCTL_XXS_CAN_MODINIT, device_options); // transmittig options to driver
++
++// Initialize all message objects
++for(i = 0; i < 32; i+=16){
++	for(id = 1; id <= 16; id++){
++		message_object->msg_valid = 1;
++		message_object->id_extended = 1;
++		message_object->mask_extended = 1;
++		message_object->remote_enable = 0;
++		message_object->int_enable = 1;
++		message_object->msg_num = id + i;
++		message_object->msg_dir = (i) ? 0 : 1;
++		message_object->data_length = 8;
++		message_object->msg_mask = mask;
++		message_object->msg_id = id;
++		message_object->data = NULL;
++		message_object->read_buffer = NULL;
++
++		io = ioctl(fd, IOCTL_XXS_CAN_MSGINIT, message_object);
++	}
++}
++
++strcpy(send,"testtext");
++
++// write to first message object using write-function
++write(fd, send, strlen(send));
++// set position to next message object
++lseek(fd, 1, SEEK_CUR);
++// write to current message object
++write(fd, send, strlen(send));
++
++// read received data at current message object using read-function
++lseek(fd, 17, SEEK_SET);
++read(fd, buffer, sizeof(buffer));
++
++// read received data from a specified message object using ioctl
++rx.msg_num = 1;
++rxframe = &rx;
++
++count = ioctl(fd, IOCTL_XXS_CAN_IDREAD, rxframe);
++printf("Bytes copied: %d\n", count);
++printf("msg_num: %d\n",rxframe->msg_num );
++printf("length: %X\n", rxframe->cfs_msg.length);
++printf("xtd: %d\n", rxframe->cfs_msg.xtd);
++printf("id: %X\n", rxframe->cfs_msg.identifier);
++printf("data read:\n");
++for(i = 0; i < rxframe->cfs_msg.length; i++)
++	printf("%c", rxframe->cfs_msg.data[i]);
++printf("\n");
++
++6. NOTES
++
++TODO list:
++	- Basic mode has not been implemented yet
++	- Remote frames have not been tested
++	- No notifcation about received messages
+\ Kein Zeilenumbruch am Dateiende.
diff --git a/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/07_diff-mycable-xxsnet-cryptoeeprom.patch b/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/07_diff-mycable-xxsnet-cryptoeeprom.patch
new file mode 100644
index 0000000..e5b7f2a
--- /dev/null
+++ b/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/07_diff-mycable-xxsnet-cryptoeeprom.patch
@@ -0,0 +1,422 @@
+--- linux-2.6.27.21/drivers/char/cryptoeeprom.c	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/drivers/char/cryptoeeprom.c	2009-12-02 17:10:54.000000000 +0000
+@@ -0,0 +1,388 @@
++/*
++ * ATMEL AT88SC0808 - cryptoeeprom
++ *
++ * Author: Alexander Bigga <ab@mycable.de>
++ *
++ * Copyright (c) 2007 mycable GmbH <ab@mycable.de>
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License
++ * as published by the Free Software Foundation; either version
++ * 2 of the License, or (at your option) any later version.
++ *
++ */
++
++#define VERSION "0.1"
++
++#define MYDEBUG 0
++
++#include <linux/module.h>
++#include <linux/moduleparam.h>
++#include <linux/types.h>
++#include <linux/miscdevice.h>
++#include <linux/ioport.h>
++
++#include <linux/fs.h>
++#include <linux/init.h>
++#include <linux/jiffies.h>
++#include <linux/timer.h>
++#include <linux/delay.h>
++#include <linux/i2c.h>
++
++#include <asm/uaccess.h>
++
++#include "cryptoeeprom.h"
++
++
++#define CMD_LEN		3
++static struct i2c_client *save_client;
++
++
++/* --- functions declarations -------------------------------------- */
++
++
++static int cryptoeeprom_write(struct i2c_client *client, ce_msg_t *msg)
++{
++	int ret;
++	int i;
++	unsigned char buf[130];
++	struct i2c_msg message[] = {
++		{
++			.addr	= client->addr + msg->cmd_offset,
++			.flags	= 0,
++			.len	= msg->len_write + CMD_LEN,
++			.buf	= buf,
++		},
++	};
++
++	buf[0] = msg->buf_config[0];
++	buf[1] = msg->buf_config[1];
++	buf[2] = msg->buf_config[2];
++	for (i=0; i<msg->len_write; i++)
++		buf[i+CMD_LEN] = msg->buf_config[i];
++
++	printk("/ab/%s: \n", __func__);
++	for (i=0; i<msg->len_write+CMD_LEN; i++)
++		printk("0x%x, ", buf[i]);
++	printk("\n");
++
++//	printk("/ab/%s client->addr 0x%x, data 0x%x to 0x%x\n", __func__, client->addr, data[1], data[0]);
++	ret = i2c_transfer(client->adapter, message, 1);
++
++	if (ret == 1)
++		return 0;
++// 	if (i2c_transfer(client->adapter, message, 2) == 2)
++// 		return 0;
++
++	return -EIO;
++}
++
++static int cryptoeeprom_read(struct i2c_client *client, ce_msg_t *msg)
++{
++        int i;
++	int ret;
++	struct i2c_msg message[2] = {
++		{
++			.addr	= client->addr + msg->cmd_offset,
++			.flags	= 0,
++			.len	= CMD_LEN,
++			.buf	= msg->buf_config,
++		},
++		{
++			.addr	= client->addr + msg->cmd_offset,
++			.flags	= I2C_M_RD,
++			.len	= msg->len_read,
++			.buf	= msg->buf_read,
++		},
++	};
++
++
++	printk("/ab/%s: \n", __func__);
++	for (i=0; i<CMD_LEN; i++)
++		printk("0x%x, ", msg->buf_config[i]);
++	printk("\n");
++
++	ret = i2c_transfer(client->adapter, message, 2);
++
++	if (ret == 2)
++		return 0;
++
++// 	if (i2c_transfer(client->adapter, message, 2) == 2)
++// 		return data[0];
++
++	return -EIO;
++
++}
++
++void i2c_start(void) {
++
++}
++void i2c_stop(void) {
++
++}
++/* --- eeprom functions --------------------------------------	*/
++
++static int setUserZone(struct i2c_client *client, int zone)
++{
++//	char setUserZone0[] = {0xb4, 0x03, zone, 0x00};
++
++	u8 data[2];
++	int ret;
++	struct i2c_msg message[] = {
++		{
++			.addr	= client->addr + 0x04, // --> 0xb4
++			.flags	= 0,
++			.len	= 3,
++			.buf	= data,
++		},
++	};
++
++	data[0] = 0x03;
++	data[1] = zone & 0xff;
++	data[2] = 0x00;
++
++//	printk("/ab/%s client->addr 0x%x, data 0x%x to 0x%x\n", __func__, client->addr, data[1], data[0]);
++	ret = i2c_transfer(client->adapter, message, 1);
++	if (ret == 1)
++		return 0;
++// 	if (i2c_transfer(client->adapter, message, 2) == 2)
++// 		return 0;
++
++	return -EIO;
++}
++
++static int writeUserZone(struct i2c_client *client, int zone, int offset, ce_msg_t *pmsg)
++{
++	int ret;
++
++	/* select the User Zone */
++	setUserZone(client, zone);
++
++	pmsg->userzone = zone; /* ?? */
++	pmsg->cmd_offset = 0x00; /* command offset */
++
++	pmsg->buf_config[0] = zone; /* offset in user zone */
++	pmsg->buf_config[1] = offset;
++	pmsg->buf_config[2] = pmsg->len_write;
++
++	ret = cryptoeeprom_write(client, pmsg);
++
++	return ret;
++}
++
++static int readUserZone(struct i2c_client *client, int zone, int offset, ce_msg_t *pmsg)
++{
++	int ret;
++
++	/* select the User Zone */
++	setUserZone(client, zone);
++
++	pmsg->buf_config[0] = zone; /* ?? */
++	pmsg->buf_config[1] = offset;
++	pmsg->buf_config[2] = pmsg->len_read;
++
++	pmsg->cmd_offset = 0x02;
++
++	ret = cryptoeeprom_read(client, pmsg);
++	printk("/ab/%s len_read %i, message %s\n", __func__, pmsg->len_read, pmsg->buf_read);
++
++	return ret;
++}
++
++/*
++ *	file operation
++ */
++
++static int cryptoeeprom_open(struct inode *inode, struct file *file)
++{
++	return 0;
++}
++
++static int cryptoeeprom_release(struct inode *inode, struct file *file)
++{
++	return 0;
++}
++
++
++
++static int cryptoeeprom_ioctl(struct inode *inode, struct file *file,
++	unsigned int cmd, unsigned long arg)
++{
++	int err= 0, ret = 0;
++	ce_msg_t *msg;
++	int i;
++	int offset;
++	ce_msg_t lmessage;
++
++	msg = (ce_msg_t *) kmalloc(sizeof(ce_msg_t), GFP_KERNEL);
++
++	/* don't even decode wrong cmds: better returningENOTTY than EFAULT */
++	if (_IOC_TYPE(cmd) != WMIO_IOC_MAGIC) return -ENOTTY;
++	if (_IOC_NR(cmd) > WMIO_IOC_MAXNR) return -ENOTTY;
++
++	/*
++	* the type is a bitmask, and VERIFY_WRITE catches R/W
++	* transfers. Note that the type is user-oriented, while
++	* verify_area is kernel-oriented, so the concept of "read" and
++	* "write" is reversed
++	*/
++	if (_IOC_DIR(cmd) & _IOC_READ)
++		err = !access_ok(VERIFY_WRITE, (void *)arg, _IOC_SIZE(cmd));
++	else if (_IOC_DIR(cmd) & _IOC_WRITE)
++		err =!access_ok(VERIFY_READ, (void *)arg, _IOC_SIZE(cmd));
++	if (err) { return -EFAULT;}
++
++	switch(cmd) {
++
++		case CEEPROM_WRITE:
++			if (copy_from_user(msg, (int *)arg, sizeof(ce_msg_t))) {
++				ret = -EFAULT;
++				goto out;
++			}
++//			printk("/ab/%s: write: msg->userzone=%i, msg->buf=%s\n", __func__, msg->userzone, msg->buf);
++
++			/* the Atmel cryptomemory may only write 16 bytes at once.
++			If we want to write more, we have split it and use the offset */
++			if (msg->len_write < 0x10) {
++				writeUserZone(save_client, msg->userzone, 0, msg);
++			} else {
++				offset = 0;
++				while (msg->len_write > 0) {
++					for (i=0; i<0x10 && i<msg->len_write; i++)
++						lmessage.buf_write[i] = msg->buf_write[offset+i];
++					lmessage.len_write = i;
++					ret = writeUserZone(save_client, msg->userzone, offset, &lmessage);
++					if (ret < 0 ){
++						ret = -EFAULT;
++						goto out;
++					}
++					msg->len_write -= lmessage.len_write;
++					offset += 0x10;
++					msleep(10);
++				}
++			}
++
++			ret = 0;
++			break;
++
++		case CEEPROM_READ:
++			if (copy_from_user(msg, (int *)arg, sizeof(ce_msg_t))) {
++				ret = -EFAULT;
++				goto out;
++			}
++			for (i=0; i<msg->len_write; i++)
++				msg->buf_write[i]=0;
++
++			readUserZone(save_client, msg->userzone, 0, msg);
++
++			/* 0xff means empty - so return '\0' */
++			for (i=0; i<msg->len_write; i++)
++				if (msg->buf_write[i] == 0xff)
++					msg->buf_write[i] = '\0';
++
++			msg->buf_write[msg->len_write]= '\0';
++//			printk("/ab/%s: read: zone=%i, offset=%i, buf=%s", __func__, msg->userzone, msg->offset, msg->buf);
++
++			if (copy_to_user((int *)arg, msg, sizeof(ce_msg_t))) {
++				ret = -EFAULT;
++				goto out;
++			}
++			ret = 0;
++			break;
++
++		default:/* redundant, as cmd was checked against MAXNR */
++				return ret;
++	}
++out:
++	kfree(msg);
++	return ret;
++}
++
++static const struct file_operations cryptoeeprom_fops=
++{
++	.owner		= THIS_MODULE,
++	.llseek		= no_llseek,
++	.ioctl		= cryptoeeprom_ioctl,
++	.open		= cryptoeeprom_open,
++	.release	= cryptoeeprom_release,
++};
++
++static struct miscdevice cryptoeeprom_miscdev=
++{
++	.minor	= NVRAM_MINOR,
++	.name	= "cryptoeeprom",
++	.fops	= &cryptoeeprom_fops,
++};
++
++static int cryptoeeprom_probe(struct i2c_client *client, const struct i2c_device_id *id)
++{
++	int rc = 0;
++
++	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C
++				     | I2C_FUNC_SMBUS_BYTE_DATA)) {
++		rc = -ENODEV;
++		goto exit;
++	}
++
++	dev_info(&client->dev, "chip found\n");
++
++//	printk("/ab/%s client->addr 0x%x\n", __func__, client->addr);
++//	i2c_set_clientdata(client, NULL);
++	save_client = client;
++
++	printk("/ab/%s: end ok\n", __func__);
++
++	return 0;
++exit:
++	printk("/ab/%s: end error\n", __func__);
++	return rc;
++}
++
++static struct i2c_driver cryptoeeprom_driver = {
++	.driver = {
++		.name = "cryptoeeprom",
++	},
++	.probe 		= cryptoeeprom_probe,
++};
++
++
++static int __init cryptoeeprom_init(void)
++{
++	int ret;
++	if (MYDEBUG)
++		printk("/ab/%s: enter\n", __func__);
++
++	ret = i2c_add_driver(&cryptoeeprom_driver);
++	if (ret < 0)
++		goto fail_i2c;
++
++	/* register as /dev/watchdog */
++	ret = misc_register(&cryptoeeprom_miscdev);
++	if (ret < 0)
++		goto fail_reg;
++
++	return 0;
++
++fail_reg:
++	i2c_del_driver(&cryptoeeprom_driver);
++fail_i2c:
++	return ret;
++}
++
++static void __exit cryptoeeprom_exit(void)
++{
++	if (MYDEBUG)
++		printk("/ab/%s: enter\n", __func__);
++
++	/* remove i2c-driver */
++	i2c_del_driver(&cryptoeeprom_driver);
++
++	misc_deregister(&cryptoeeprom_miscdev);
++}
++
++module_init(cryptoeeprom_init);
++module_exit(cryptoeeprom_exit);
++
++MODULE_AUTHOR("Alexander Bigga <ab@mycable.de>");
++MODULE_DESCRIPTION("eeprom test driver");
++MODULE_LICENSE("GPL");
+--- linux-2.6.27/drivers/char/cryptoeeprom.h	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/drivers/char/cryptoeeprom.h	2009-01-08 10:49:42.000000000 +0100
+@@ -0,0 +1,28 @@
++/*
++* include-file for cryptoeeprom.h
++*
++*/
++
++#define CEEPROM_NUM_USERZONES 	8
++
++/*Start of IOCTL Numbers*/
++#define WMIO_IOC_MAGIC  'l'
++
++/*IO control*/
++#define CEEPROM_WRITE    	_IOWR(WMIO_IOC_MAGIC,  0, int)
++#define CEEPROM_READ 		_IOWR(WMIO_IOC_MAGIC,  1, int)
++
++#define WMIO_IOC_MAXNR 2
++/*End of IOCTL Numbers*/
++
++
++typedef struct {
++	unsigned int userzone;
++	unsigned int len_write;
++	unsigned char buf_config[4];
++	unsigned char buf_write[129];
++	unsigned int len_read;
++	unsigned char buf_read[129];
++	unsigned int cmd_offset;
++} ce_msg_t;
++
diff --git a/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/08_diff-mycable-spi.patch b/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/08_diff-mycable-spi.patch
new file mode 100644
index 0000000..1d8a9ad
--- /dev/null
+++ b/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/08_diff-mycable-spi.patch
@@ -0,0 +1,1406 @@
+--- linux-2.6.27.21/drivers/spi/spi_xxsvideo.c	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/drivers/spi/spi_xxsvideo.c	2009-11-18 09:17:25.000000000 +0000
+@@ -0,0 +1,379 @@
++/*
++ * linux/drivers/spi/spi_xxsvideo.c
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *	Alexander Bigga <ab@mycable.de>
++ *
++ * mycable XXSvideo on XXSterminal extension board
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++#include <linux/kernel.h>
++#include <linux/init.h>
++#include <linux/module.h>
++#include <linux/platform_device.h>
++#include <linux/delay.h>
++#include <linux/dma-mapping.h>
++#include <linux/interrupt.h>
++#include <linux/spi/spi.h>
++#include <linux/completion.h>
++
++#include <mach/board.h>
++#include <mach/gpio.h>
++
++/* Jade SPI register adress definitions */
++#define JADE_SPI_CR		0x00	/* control register */
++#define JADE_SPI_SCR		0x04	/* slave control register */
++#define JADE_SPI_DR		0x08	/* data register */
++#define JADE_SPI_SR		0x0C	/* status register */
++
++/* Jade SPI register bit definitions */
++#define SPI_CR_SPL0		1<<16
++#define SPI_CR_CDV		8	/* Freq. Divider Serial Clock */
++#define SPI_CR_CPOL		1<<1	/* Clock Polarity */
++#define SPI_CR_CPHA		1<<0	/* Clock Phase*/
++
++#define SPI_SCR_SPE		1<<28	/* Enable SPI Clock */
++#define SPI_SCR_DRVS		1<<26	/* Transfer Order */
++#define SPI_SCR_STL		16	/* Strobe Width (Pulse Mode) */
++#define SPI_SCR_DLN		8	/* Data Length */
++#define SPI_SCR_SMOD		1<<5	/* SMOD */
++#define SPI_SCR_SAUT		1<<4	/* SAUT */
++#define SPI_SCR_SS		1	/* Enable SPI_SS */
++
++#define	SPI_SR_SENB		1<<0	/* Enable */
++#define	SPI_SR_SBSY		1<<1	/* Busy */
++#define	SPI_SR_SERR		1<<2	/* Error */
++#define	SPI_SR_SIRQ		1<<7	/* SIRQ Pin */
++
++#define SPI_SR_STAT_SLEEP	0
++#define SPI_SR_STAT_SETUP	(SPI_SR_SENB)
++#define SPI_SR_STAT_BUSY 	(SPI_SR_SENB | SPI_SR_SBSY)
++#define SPI_SR_STAT_ERROR	(SPI_SR_SENB | SPI_SR_SERR)
++#define SPI_SR_STAT_MASK 	(SPI_SR_SENB | SPI_SR_SBSY | SPI_SR_SERR)
++
++#define DEBUG 0
++
++struct xxsvideo_spi {
++
++	int			count;
++
++	struct platform_device	*pdev;
++
++	struct completion	master_done;
++
++	unsigned long		cur_rx;
++};
++#define BUFFER_SIZE		PAGE_SIZE
++
++
++static int xxsvideo_read_spi_reg(unsigned long offset)
++{
++	return __raw_readl(JADE_SPI_BASE + offset);
++}
++
++/*-------------------------------------------------------------------------*/
++static void xxsvideo_write_spi_reg(unsigned long val, unsigned long offset)
++{
++//	printk("/ab/%s val 0x%x to 0x%x\n", __func__, val, JADE_SPI_BASE + offset);
++	__raw_writel(val, JADE_SPI_BASE + offset);
++}
++
++static void print_state(int state) {
++
++	state &= SPI_SR_STAT_MASK;
++
++	if (!DEBUG)
++		return;
++
++	switch (state) {
++		case SPI_SR_STAT_SLEEP:
++			printk("/ab/%s: SLEEP state  0x%x\n", __func__, state);
++			break;
++		case SPI_SR_STAT_SETUP:
++			printk("/ab/%s: SETUP state  0x%x\n", __func__, state);
++			break;
++		case SPI_SR_STAT_BUSY:
++			printk("/ab/%s: BUSY state  0x%x\n", __func__, state);
++			break;
++		default:
++			printk("/ab/%s unknown state 0x%x\n", __func__, state);
++
++	}
++}
++
++/*-------------------------------------------------------------------------*/
++static irqreturn_t
++xxsvideo_spi_interrupt(int irq, void *dev_id)
++{
++	struct spi_master	*master = dev_id;
++	struct xxsvideo_spi	*xxs_spi = spi_master_get_devdata(master);
++	int			ret = IRQ_NONE;
++	int			state;
++
++	state = xxsvideo_read_spi_reg(JADE_SPI_SR);
++	if (!(state & SPI_SR_STAT_MASK) == SPI_SR_STAT_SETUP) {
++		ret = IRQ_HANDLED;
++		printk("ERROR: state NOT SETUP! 0x%x\n", state);
++		goto err_busy;
++	}
++	print_state(state);
++
++	ret = xxsvideo_read_spi_reg(JADE_SPI_DR);
++
++	if (DEBUG)
++		printk("/ab/%s SR = 0x%x, DR = 0x%x\n", __func__, state, ret);
++
++	xxs_spi->cur_rx = ret;
++
++	/* unset SPI_SS */
++	state = xxsvideo_read_spi_reg(JADE_SPI_SCR);
++	xxsvideo_write_spi_reg( state & ~1, JADE_SPI_SCR );
++
++	/* mark transfer as done */
++	complete(&xxs_spi->master_done);
++	ret = IRQ_HANDLED;
++
++err_busy:
++	return ret;
++}
++
++/*-------------------------------------------------------------------------*/
++
++static int xxsvideo_spi_sleep(struct spi_device *spi)
++{
++	printk("/ab/%s\n", __func__);
++	/* SLEEP state */
++	xxsvideo_write_spi_reg( xxsvideo_read_spi_reg(JADE_SPI_SCR) &
++					(~SPI_SCR_SPE), JADE_SPI_SCR );
++
++	return 0;
++}
++static int xxsvideo_spi_setup(struct spi_device *spi)
++{
++	struct xxsvideo_spi	*xxs_spi;
++	unsigned int		bits = spi->bits_per_word;
++	int			config = 0;
++
++	static int	count = 0;
++
++	xxs_spi = spi_master_get_devdata(spi->master);
++
++	count++;
++	printk("/ab/%s bits %d, count %d\n", __func__, bits, count);
++	if (bits == 0)
++		bits = 10;
++	if (bits < 8 || bits > 32) {
++		dev_dbg(&spi->dev,
++				"setup: invalid bits_per_word %u (8 to 16)\n",
++				bits);
++		return -EINVAL;
++	}
++
++	/* it's device depending... now we set it for AD7812... */
++//  	config = SPI_SCR_SAUT | SPI_CR_SPL0;
++ 	config = SPI_CR_SPL0;
++ 	if (spi->max_speed_hz) {
++ 		printk("/ab/%s TODO handle max_speed_hz %d\n", __func__, spi->max_speed_hz);
++		config |= 15<<SPI_CR_CDV;
++	}
++	if (spi->mode & SPI_CPHA)
++		config |= SPI_CR_CPHA;
++
++	xxsvideo_write_spi_reg(config, JADE_SPI_CR);
++	printk("/ab/%s JADE_SPI_CR 0x%x config 0x%x\n", __func__, xxsvideo_read_spi_reg(JADE_SPI_CR), config);
++
++	/* SPI state SLEEP -> SETUP */
++	xxsvideo_write_spi_reg( (bits-1)<<SPI_SCR_DLN | SPI_SCR_SPE | SPI_SCR_SS, JADE_SPI_SCR );
++
++	return 0;
++}
++
++static int xxsvideo_spi_transfer(struct spi_device *spi, struct spi_message *msg)
++{
++        struct xxsvideo_spi	*xxs_spi;
++        struct spi_transfer	*xfer;
++	unsigned char 		*tx_buf; // = (unsigned char *)t->tx_buf;
++	unsigned long		mytx = 0;
++	int ret;
++	int state;
++
++	xxs_spi = spi_master_get_devdata(spi->master);
++
++	ret = xxsvideo_read_spi_reg(JADE_SPI_SCR);
++// 	printk("/ab/%s JADE_SPI_SCR 0x%x\n", __func__, ret);
++	xxsvideo_write_spi_reg( ret | 1, JADE_SPI_SCR );
++
++        if (unlikely(list_empty(&msg->transfers)
++                        || !spi->max_speed_hz))
++                return -EINVAL;
++
++	/* if state SLEEP --> setup */
++	state = (xxsvideo_read_spi_reg(JADE_SPI_SR) & SPI_SR_STAT_MASK);
++	if (state == SPI_SR_STAT_SLEEP) {
++		printk("/ab/%s: state (0x%x) is SLEEP! Will try setup...\n", __func__, state);
++		xxsvideo_spi_setup(spi);
++	}
++
++	/* if not SETUP state goto SLEEP state */
++	state = (xxsvideo_read_spi_reg(JADE_SPI_SR) & SPI_SR_STAT_MASK);
++	if (state != SPI_SR_STAT_SETUP) {
++		printk("/ab/%s: state (0x%x) is NOT Setup! going to sleep...\n", __func__, state);
++		xxsvideo_spi_sleep(spi);
++		return -1;
++	}
++
++        list_for_each_entry(xfer, &msg->transfers, transfer_list) {
++        	tx_buf = (unsigned char *)xfer->tx_buf;
++// 		mytx = tx_buf[0]<<8 | tx_buf[1];
++		mytx = tx_buf[0]<<24 | tx_buf[1]<<16 | tx_buf[2]<<8 | tx_buf[3];
++
++		if (DEBUG)
++			printk("/ab/%s: mytx = 0x%lx\n", __func__, mytx);
++		xxsvideo_write_spi_reg(mytx, JADE_SPI_DR);
++
++		wait_for_completion(&xxs_spi->master_done);
++
++		xfer->rx_buf=&xxs_spi->cur_rx;
++        }
++
++	return -1;
++}
++
++static void xxsvideo_spi_cleanup(struct spi_device *spi)
++{
++	printk("/ab/%s nothing to do?\n", __func__);
++}
++
++static int __devinit xxsvideo_spi_probe(struct platform_device *pdev)
++{
++	struct resource		*regs;
++	int ret;
++	int			irq;
++	struct spi_master	*master;
++	struct xxsvideo_spi	*xxs_spi;
++
++	printk("/ab/%s\n", __func__);
++
++	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (!regs)
++		return -ENXIO;
++
++	irq = platform_get_irq(pdev, 0);
++	if (irq < 0)
++		return irq;
++
++	/* disable SPI */
++	xxsvideo_write_spi_reg(0, JADE_SPI_SCR);
++
++	/* setup CE# Active-Low as default */
++	xxsvideo_write_spi_reg(SPI_CR_SPL0, JADE_SPI_CR);
++
++	/* setup spi core then jade-specific driver state */
++	ret = -ENOMEM;
++	master = spi_alloc_master(&pdev->dev, sizeof *xxs_spi);
++	if (!master)
++		goto out_free;
++
++	master->bus_num = pdev->id;
++	master->num_chipselect = 4;
++	master->setup = xxsvideo_spi_setup;
++	master->transfer = xxsvideo_spi_transfer;
++	master->cleanup = xxsvideo_spi_cleanup;
++
++
++	platform_set_drvdata(pdev, master);
++
++
++	xxs_spi = spi_master_get_devdata(master);
++
++/*	xxs_spi->buffer = dma_alloc_coherent(&pdev->dev, BUFFER_SIZE,
++					&xxs_spi->buffer_dma, GFP_KERNEL);*/
++// 	if (!xxs_spi->buffer)
++// 		goto out_free;
++
++	xxs_spi->pdev = pdev;
++//	xxs_spi->regs = ioremap(regs->start, (regs->end - regs->start) + 1);
++/*	if (!xxs_spi->regs)
++		goto out_free_buffer;*/
++//	xxs_spi->irq = irq;
++
++	ret = request_irq(irq, xxsvideo_spi_interrupt, 0,
++			pdev->dev.bus_id, master);
++	if (ret)
++		goto out_unmap_regs;
++
++
++        init_completion(&xxs_spi->master_done);
++	ret = spi_register_master(master);
++	if (ret)
++		goto out_reset_hw;
++
++	printk("/ab/%s OK.\n", __func__);
++	return 0;
++
++out_reset_hw:
++/*	spi_writel(as, CR, SPI_BIT(SWRST));
++	clk_disable(clk);*/
++	free_irq(irq, master);
++out_unmap_regs:
++//	iounmap(xxs_spi->regs);
++// out_free_buffer:
++// 	dma_free_coherent(&pdev->dev, BUFFER_SIZE, xxs_spi->buffer,
++// 			xxs_spi->buffer_dma);
++
++out_free:
++	spi_master_put(master);
++	return ret;
++}
++
++static int xxsvideo_spi_remove(struct platform_device *pdev)
++{
++	struct spi_master	*master = platform_get_drvdata(pdev);
++	int 			irq = platform_get_irq(pdev, 0);
++
++	/* disable SPI */
++	xxsvideo_write_spi_reg(0, JADE_SPI_SCR);
++
++// 	printk("/ab/%s JADE_SPI_CR 0x%x\n", __func__, xxsvideo_read_spi_reg(JADE_SPI_CR));
++// 	printk("/ab/%s JADE_SPI_SR 0x%x\n", __func__, xxsvideo_read_spi_reg(JADE_SPI_SR));
++
++	platform_set_drvdata(pdev, NULL);
++
++	free_irq(irq, master);
++	spi_unregister_master(master);
++	return 0;
++};
++
++
++/* Structure for a device driver */
++static struct platform_driver xxsvideo_spi_driver = {
++	.probe = xxsvideo_spi_probe,
++	.remove = xxsvideo_spi_remove,
++	.driver	= {
++		.owner = THIS_MODULE,
++		.name = "xxsvideo_spi",
++	},
++};
++
++
++static int __init xxsvideo_spi_init(void)
++{
++	return platform_driver_register(&xxsvideo_spi_driver);
++}
++
++static void __exit xxsvideo_spi_exit(void)
++{
++	platform_driver_unregister(&xxsvideo_spi_driver);
++}
++
++
++module_init(xxsvideo_spi_init);
++module_exit(xxsvideo_spi_exit);
++
++MODULE_AUTHOR("Alexander Bigga <ab@mycable.de>");
++MODULE_DESCRIPTION("SPI-Master on xxsvideo processor");
++MODULE_LICENSE("GPL");
+--- linux-2.6.27.21/drivers/spi/Kconfig	2009-03-23 22:04:09.000000000 +0000
++++ linux-2.6.27.21-dev/drivers/spi/Kconfig	2009-11-20 05:22:19.000000000 +0000
+@@ -204,6 +204,12 @@
+ 	  See the "OPB Serial Peripheral Interface (SPI) (v1.00e)"
+ 	  Product Specification document (DS464) for hardware details.
+ 
++config SPI_XXSVIDEO
++	tristate "Fujitsu Jade/Jade-D SPI"
++	depends on SPI_MASTER && ARCH_JADE
++	help
++	  SPI driver for Fujitsu Jade/Jade-D SoCs.
++
+ #
+ # Add new SPI master controllers in alphabetical order above this line
+ #
+--- linux-2.6.27.21/drivers/spi/Makefile	2009-03-23 22:04:09.000000000 +0000
++++ linux-2.6.27.21-dev/drivers/spi/Makefile	2009-11-18 09:17:13.000000000 +0000
+@@ -29,6 +29,7 @@
+ obj-$(CONFIG_SPI_TXX9)			+= spi_txx9.o
+ obj-$(CONFIG_SPI_XILINX)		+= xilinx_spi.o
+ obj-$(CONFIG_SPI_SH_SCI)		+= spi_sh_sci.o
++obj-$(CONFIG_SPI_XXSVIDEO)		+= spi_xxsvideo.o
+ # 	... add above this line ...
+ 
+ # SPI protocol drivers (device/link on bus)
+--- linux-2.6.27.21/arch/arm/mach-xxsvideo/ad7812.c	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/mach-xxsvideo/ad7812.c	2009-12-02 17:10:18.000000000 +0000
+@@ -0,0 +1,467 @@
++/*
++ * linux/arch/arm/mach-xxsvideo/ad7812.c
++ *
++ *  Copyright (C) 2007 mycable GmbH
++ *	Alexander Bigga <ab@mycable.de>
++ *
++ * AD7812 Analog Digital Converter
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++#include <linux/hwmon.h>
++#include <linux/init.h>
++#include <linux/err.h>
++#include <linux/delay.h>
++#include <linux/input.h>
++#include <linux/interrupt.h>
++#include <linux/slab.h>
++#include <linux/spi/spi.h>
++#include <asm/mach-types.h>
++
++#include <mach/ad7812.h>
++
++struct ad7812 {
++	struct input_dev	*input;
++	char			phys[32];
++
++	struct spi_device	*spi;
++
++#if defined(CONFIG_HWMON) || defined(CONFIG_HWMON_MODULE)
++	struct attribute_group	*attr_group;
++	struct class_device	*hwmon;
++#endif
++
++	u16			model;
++	u16			vref_delay_usecs;
++	u16			x_plate_ohms;
++	u16			pressure_max;
++
++	struct spi_transfer	xfer[10];
++	struct spi_message	msg[5];
++	struct spi_message	*last_msg;
++	int			msg_idx;
++	int			read_cnt;
++	int			read_rep;
++	int			last_read;
++
++	u16			debounce_max;
++	u16			debounce_tol;
++	u16			debounce_rep;
++
++	int			(*filter)(void *data, int data_idx, int *val);
++	void			*filter_data;
++	void			(*filter_cleanup)(void *data);
++	int			(*get_pendown_state)(void);
++};
++
++/*--------------------------------------------------------------------------*/
++
++#define	MAX_10BIT	((1<<10)-1)
++
++/*--------------------------------------------------------------------------*/
++
++/*
++ * external reference voltage
++ */
++static unsigned vREF_mV = 3300;
++module_param(vREF_mV, uint, 0);
++MODULE_PARM_DESC(vREF_mV, "external vREF voltage, in milliVolts");
++
++struct ser_req {
++	u8			ref_on;
++	u8			command;
++	u8			ref_off;
++	u16			scratch;
++	__be16			sample;
++	struct spi_message	msg;
++	struct spi_transfer	xfer[6];
++};
++
++static int ad7812_read10_ser(struct device *dev, unsigned channel)
++{
++	struct spi_device	*spi = to_spi_device(dev);
++	struct ser_req		*req = kzalloc(sizeof *req, GFP_KERNEL);
++	int			status;
++	int			scmd;
++  	u8                      mycmd[2];
++  	int i=0;
++	u8			*myrx_buf;
++	int			rxbuf[3];
++	int			ret;
++	int n, sorted;
++
++
++ 	if (!req)
++ 		return -ENOMEM;
++
++
++	/* take four samples: */
++	for (i=0; i<4; i++) {
++		spi_message_init(&req->msg);
++
++		scmd = 0x0181 | channel<<2;
++		scmd <<=4;
++
++		mycmd[0] = scmd>>8 & 0xff;
++		mycmd[1] = scmd & 0xff;
++
++		req->xfer[0].tx_buf = &mycmd;
++		req->xfer[0].len = 2;
++
++		spi_message_add_tail(&req->xfer[0], &req->msg);
++
++		status = spi_sync(spi, &req->msg);
++		if (i>0) {
++			myrx_buf = req->xfer[0].rx_buf;
++		  	rxbuf[i-1]=myrx_buf[1]<<8 | myrx_buf[0];
++		}
++	}
++//   	printk("/ab/%s 0x%x 0x%x 0x%x\n", __func__, rxbuf[0], rxbuf[1], rxbuf[2]);
++	/* sort by size */
++	n = 2;
++	do {
++		sorted = 0;
++		for (i = 0; i < n; i++) {
++			if (rxbuf[i]>rxbuf[i+1]) {
++				ret = rxbuf[i];
++				rxbuf[i] = rxbuf[i+1];
++				rxbuf[i+1] = ret;
++				sorted = 1;
++			}
++		}
++		n--;
++//   		printk("/ab/%s %d %d\n", __func__, sorted, n);
++	} while (sorted && n != 0);
++//   	printk("/ab/%s 0x%x 0x%x 0x%x\n", __func__, rxbuf[0], rxbuf[1], rxbuf[2]);
++	kfree(req);
++	return rxbuf[1]>>4;
++}
++
++#if defined(CONFIG_HWMON) || defined(CONFIG_HWMON_MODULE)
++
++#define SHOW(name, var, adjust) static ssize_t \
++name ## _show(struct device *dev, struct device_attribute *attr, char *buf) \
++{ \
++	struct ad7812 *ts = dev_get_drvdata(dev); \
++	ssize_t v = ad7812_read10_ser(dev, var); \
++	if (v < 0) \
++		return v; \
++	return sprintf(buf, "%u\n", adjust(ts, v)); \
++} \
++static DEVICE_ATTR(name, S_IRUGO, name ## _show, NULL);
++
++/* Sysfs conventions report temperatures in millidegrees Celcius.
++ * ADS7846 could use the low-accuracy two-sample scheme, but can't do the high
++ * accuracy scheme without calibration data.  For now we won't try either;
++ * userspace sees raw sensor values, and must scale/calibrate appropriately.
++ */
++static inline unsigned null_adjust(struct ad7812 *ts, ssize_t v)
++{
++	return v;
++}
++
++/* sysfs conventions report voltages in millivolts.  We can convert voltages
++ * if we know vREF.  userspace may need to scale vAUX to match the board's
++ * external resistors; we assume that vBATT only uses the internal ones.
++ */
++static inline unsigned vaux_adjust(struct ad7812 *ts, ssize_t v)
++{
++	unsigned retval = v;
++
++	/* external resistors may scale vAUX into 0..vREF */
++	retval *= vREF_mV;
++	retval = retval >> 10;
++	return retval;
++}
++
++SHOW(vin1, 0, vaux_adjust);
++SHOW(vin2, 1, vaux_adjust);
++SHOW(vin3, 2, vaux_adjust);
++SHOW(vin4, 3, vaux_adjust);
++SHOW(vin5, 4, vaux_adjust);
++SHOW(vin6, 5, vaux_adjust);
++SHOW(vin7, 6, vaux_adjust);
++SHOW(vin8, 7, vaux_adjust);
++
++
++static struct attribute *ad7812_attributes[] = {
++	&dev_attr_vin1.attr,
++	&dev_attr_vin2.attr,
++	&dev_attr_vin3.attr,
++	&dev_attr_vin4.attr,
++	&dev_attr_vin5.attr,
++	&dev_attr_vin6.attr,
++	&dev_attr_vin7.attr,
++	&dev_attr_vin8.attr,
++	NULL,
++};
++
++static struct attribute_group ad7812_attr_group = {
++	.attrs = ad7812_attributes,
++};
++
++static int ads784x_hwmon_register(struct spi_device *spi, struct ad7812 *ts)
++{
++	struct class_device *hwmon;
++	int err;
++
++	/* different chips have different sensor groups */
++	ts->attr_group = &ad7812_attr_group;
++
++	err = sysfs_create_group(&spi->dev.kobj, ts->attr_group);
++	if (err)
++		return err;
++
++	hwmon = hwmon_device_register(&spi->dev);
++	if (IS_ERR(hwmon)) {
++		sysfs_remove_group(&spi->dev.kobj, ts->attr_group);
++		return PTR_ERR(hwmon);
++	}
++
++	ts->hwmon = hwmon;
++	return 0;
++}
++
++static void ads784x_hwmon_unregister(struct spi_device *spi,
++				     struct ad7812 *ts)
++{
++	if (ts->hwmon) {
++		sysfs_remove_group(&spi->dev.kobj, ts->attr_group);
++		hwmon_device_unregister(ts->hwmon);
++	}
++}
++
++#else
++static inline int ads784x_hwmon_register(struct spi_device *spi,
++					 struct ad7812 *ts)
++{
++	return 0;
++}
++
++static inline void ads784x_hwmon_unregister(struct spi_device *spi,
++					    struct ad7812 *ts)
++{
++}
++#endif
++
++
++/*--------------------------------------------------------------------------*/
++
++
++static int ad7812_debounce(void *ads, int data_idx, int *val)
++{
++	struct ad7812		*ts = ads;
++
++	printk("/ab/%s\n", __func__);
++	if (!ts->read_cnt || (abs(ts->last_read - *val) > ts->debounce_tol)) {
++		/* Start over collecting consistent readings. */
++		ts->read_rep = 0;
++		/* Repeat it, if this was the first read or the read
++		 * wasn't consistent enough. */
++		if (ts->read_cnt < ts->debounce_max) {
++			ts->last_read = *val;
++			ts->read_cnt++;
++			return ADS7846_FILTER_REPEAT;
++		} else {
++			/* Maximum number of debouncing reached and still
++			 * not enough number of consistent readings. Abort
++			 * the whole sample, repeat it in the next sampling
++			 * period.
++			 */
++			ts->read_cnt = 0;
++			return ADS7846_FILTER_IGNORE;
++		}
++	} else {
++		if (++ts->read_rep > ts->debounce_rep) {
++			/* Got a good reading for this coordinate,
++			 * go for the next one. */
++			ts->read_cnt = 0;
++			ts->read_rep = 0;
++			return ADS7846_FILTER_OK;
++		} else {
++			/* Read more values that are consistent. */
++			ts->read_cnt++;
++			return ADS7846_FILTER_REPEAT;
++		}
++	}
++}
++
++static int ad7812_no_filter(void *ads, int data_idx, int *val)
++{
++	return ADS7846_FILTER_OK;
++}
++
++
++/*--------------------------------------------------------------------------*/
++
++static int ad7812_suspend(struct spi_device *spi, pm_message_t message)
++{
++	return 0;
++
++}
++
++static int ad7812_resume(struct spi_device *spi)
++{
++	return 0;
++}
++
++static int __devinit ad7812_probe(struct spi_device *spi)
++{
++	struct ad7812			*ts;
++	struct input_dev		*input_dev;
++	struct ad7812_platform_data	*pdata = spi->dev.platform_data;
++	int				vref;
++	int				err;
++
++	printk("/ab/%s\n", __func__);
++	if (!pdata) {
++		dev_dbg(&spi->dev, "no platform data?\n");
++		return -ENODEV;
++	}
++
++	/* We'd set TX wordsize 8 bits and RX wordsize to 13 bits ... except
++	 * that even if the hardware can do that, the SPI controller driver
++	 * may not.  So we stick to very-portable 8 bit words, both RX and TX.
++	 */
++	spi->bits_per_word = 14;
++	spi->mode = SPI_CPHA | SPI_LSB_FIRST;
++	err = spi_setup(spi);
++	if (err < 0)
++		return err;
++
++	ts = kzalloc(sizeof(struct ad7812), GFP_KERNEL);
++	input_dev = input_allocate_device();
++	if (!ts || !input_dev) {
++		err = -ENOMEM;
++		printk("/ab/%s fail ENOMEM\n", __func__);
++		goto err_free_mem;
++	}
++
++	dev_set_drvdata(&spi->dev, ts);
++	spi->dev.power.power_state = PMSG_ON;
++
++	ts->spi = spi;
++	ts->input = input_dev;
++
++// 	spin_lock_init(&ts->lock);
++
++// 	ts->model = pdata->model ? : 7846;
++	ts->vref_delay_usecs = pdata->vref_delay_usecs ? : 100;
++	ts->x_plate_ohms = pdata->x_plate_ohms ? : 400;
++	ts->pressure_max = pdata->pressure_max ? : ~0;
++
++	if (pdata->filter != NULL) {
++		if (pdata->filter_init != NULL) {
++			err = pdata->filter_init(pdata, &ts->filter_data);
++			if (err < 0)
++				goto err_free_mem;
++		}
++		ts->filter = pdata->filter;
++		ts->filter_cleanup = pdata->filter_cleanup;
++	} else if (pdata->debounce_max) {
++		ts->debounce_max = pdata->debounce_max;
++		if (ts->debounce_max < 2)
++			ts->debounce_max = 2;
++		ts->debounce_tol = pdata->debounce_tol;
++		ts->debounce_rep = pdata->debounce_rep;
++		ts->filter = ad7812_debounce;
++		ts->filter_data = ts;
++	} else
++		ts->filter = ad7812_no_filter;
++	ts->get_pendown_state = pdata->get_pendown_state;
++
++	snprintf(ts->phys, sizeof(ts->phys), "%s/input0", spi->dev.bus_id);
++
++	input_dev->name = "AD7812 A/D Converter";
++	input_dev->phys = ts->phys;
++	input_dev->dev.parent = &spi->dev;
++
++	input_dev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
++	input_dev->keybit[BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH);
++	input_set_abs_params(input_dev, ABS_X,
++			pdata->x_min ? : 0,
++			pdata->x_max ? : MAX_10BIT,
++			0, 0);
++	input_set_abs_params(input_dev, ABS_Y,
++			pdata->y_min ? : 0,
++			pdata->y_max ? : MAX_10BIT,
++			0, 0);
++	input_set_abs_params(input_dev, ABS_PRESSURE,
++			pdata->pressure_min, pdata->pressure_max, 0, 0);
++
++	vref = pdata->keep_vref_on;
++
++ 	err = ads784x_hwmon_register(spi, ts);
++ 	if (err)
++ 		goto err_cleanup_filter;
++
++	/* take a first sample, leaving nPENIRQ active and vREF off; avoid
++	 * the touchscreen, in case it's not connected.
++	 */
++	(void) ad7812_read10_ser(&spi->dev, 0x181 | 7<<2);
++
++	err = input_register_device(input_dev);
++	if (err)
++		goto err_remove_hwmon;
++
++	return 0;
++
++err_remove_hwmon:
++	ads784x_hwmon_unregister(spi, ts);
++err_cleanup_filter:
++	if (ts->filter_cleanup)
++		ts->filter_cleanup(ts->filter_data);
++err_free_mem:
++	input_free_device(input_dev);
++	kfree(ts);
++	return err;
++}
++
++static int __devexit ad7812_remove(struct spi_device *spi)
++{
++	struct ad7812		*ts = dev_get_drvdata(&spi->dev);
++
++	ads784x_hwmon_unregister(spi, ts);
++	input_unregister_device(ts->input);
++
++	if (ts->filter_cleanup)
++		ts->filter_cleanup(ts->filter_data);
++
++	kfree(ts);
++
++	dev_dbg(&spi->dev, "unregistered ad7812\n");
++	return 0;
++}
++
++static struct spi_driver ad7812_driver = {
++	.driver = {
++		.name	= "ad7812",
++		.bus	= &spi_bus_type,
++		.owner	= THIS_MODULE,
++	},
++	.probe		= ad7812_probe,
++	.remove		= __devexit_p(ad7812_remove),
++	.suspend	= ad7812_suspend,
++	.resume		= ad7812_resume,
++};
++
++static int __init ad7812_init(void)
++{
++	/* board-specific init should stay out of drivers!! */
++	return spi_register_driver(&ad7812_driver);
++}
++module_init(ad7812_init);
++
++static void __exit ad7812_exit(void)
++{
++	spi_unregister_driver(&ad7812_driver);
++
++}
++module_exit(ad7812_exit);
++
++MODULE_DESCRIPTION("AD7812 Analog/Digital Converter Driver");
++MODULE_LICENSE("GPL");
+--- linux-2.6.27/arch/arm/mach-xxsvideo/include/mach/ad7812.h	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/arch/arm/mach-xxsvideo/include/mach/ad7812.h	2009-01-08 10:49:39.000000000 +0100
+@@ -0,0 +1,37 @@
++/* linux/spi/ads7846.h */
++
++/* Touchscreen characteristics vary between boards and models.  The
++ * platform_data for the device's "struct device" holds this information.
++ *
++ * It's OK if the min/max values are zero.
++ */
++enum ad7812_filter {
++	ADS7846_FILTER_OK,
++	ADS7846_FILTER_REPEAT,
++	ADS7846_FILTER_IGNORE,
++};
++
++struct ad7812_platform_data {
++	u16	model;			/* 7843, 7845, 7846. */
++	u16	vref_delay_usecs;	/* 0 for external vref; etc */
++	int	keep_vref_on:1;		/* set to keep vref on for differential
++					 * measurements as well */
++	u16	x_plate_ohms;
++	u16	y_plate_ohms;
++
++	u16	x_min, x_max;
++	u16	y_min, y_max;
++	u16	pressure_min, pressure_max;
++
++	u16	debounce_max;		/* max number of additional readings
++					 * per sample */
++	u16	debounce_tol;		/* tolerance used for filtering */
++	u16	debounce_rep;		/* additional consecutive good readings
++					 * required after the first two */
++	int	(*get_pendown_state)(void);
++	int	(*filter_init)	(struct ad7812_platform_data *pdata,
++				 void **filter_data);
++	int	(*filter)	(void *filter_data, int data_idx, int *val);
++	void	(*filter_cleanup)(void *filter_data);
++};
++
+--- linux-2.6.27.21/arch/arm/mach-xxsvideo/m41t94.c	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/arch/arm/mach-xxsvideo/m41t94.c	2009-11-18 09:16:50.000000000 +0000
+@@ -0,0 +1,486 @@
++/*
++ * linux/arch/arm/mach-xxsvideo/m41t94.c
++ *
++ *  Copyright (C) 2008 mycable GmbH
++ *	Alexander Bigga <ab@mycable.de>
++ *
++ * M41T94 ST RTC
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++#include <linux/hwmon.h>
++#include <linux/init.h>
++#include <linux/err.h>
++#include <linux/delay.h>
++#include <linux/input.h>
++#include <linux/interrupt.h>
++#include <linux/slab.h>
++#include <linux/spi/spi.h>
++#include <asm/mach-types.h>
++
++#include <asm/mach/time.h>
++#include <asm/mach-types.h>
++
++#include <mach/board.h>
++#include <mach/gpio.h>
++#include <mach/xxsvideofb.h>
++#include <mach/can.h>
++
++//#include <asm/arch/m41t94.h>
++struct m41t94_platform_data {
++	u16	model;			/* 7843, 7845, 7846. */
++};
++
++struct m41t94 {
++	struct input_dev	*input;
++	char			phys[32];
++
++	struct spi_device	*spi;
++
++#if defined(CONFIG_HWMON) || defined(CONFIG_HWMON_MODULE)
++	struct attribute_group	*attr_group;
++	struct class_device	*hwmon;
++#endif
++
++	u16			model;
++	u16			vref_delay_usecs;
++	u16			x_plate_ohms;
++	u16			pressure_max;
++
++	struct spi_transfer	xfer[10];
++	struct spi_message	msg[5];
++	struct spi_message	*last_msg;
++	int			msg_idx;
++	int			read_cnt;
++	int			read_rep;
++	int			last_read;
++
++};
++
++/*--------------------------------------------------------------------------*/
++
++#define	MAX_10BIT	((1<<10)-1)
++
++/*--------------------------------------------------------------------------*/
++
++/*
++ * external reference voltage
++ */
++static unsigned vREF_mV = 3300;
++module_param(vREF_mV, uint, 0);
++MODULE_PARM_DESC(vREF_mV, "external vREF voltage, in milliVolts");
++
++struct ser_req {
++	u8			ref_on;
++	u8			command;
++	u8			ref_off;
++	u16			scratch;
++	__be16			sample;
++	struct spi_message	msg;
++	struct spi_transfer	xfer[6];
++};
++
++static int m41t94_read10_ser(struct device *dev, unsigned channel)
++{
++	struct spi_device	*spi = to_spi_device(dev);
++	struct ser_req		*req = kzalloc(sizeof *req, GFP_KERNEL);
++	int			status;
++	int			scmd;
++  	u8                      mycmd[20];
++  	int i=0;
++	u8			*myrx_buf;
++	int			rxbuf[20];
++	int			ret;
++	int n, sorted;
++	int j;
++
++
++ 	if (!req)
++ 		return -ENOMEM;
++
++	/* write to Flash: */
++
++#if 1
++	spi_message_init(&req->msg);
++
++	mycmd[0] = 0x9f;
++	mycmd[1] = 0x0;
++	mycmd[2] = 0x0;
++	mycmd[3] = 0x0;
++
++	req->xfer[0].tx_buf = &mycmd;
++	req->xfer[0].len = 4;
++
++	spi_message_add_tail(&req->xfer[0], &req->msg);
++
++	status = spi_sync(spi, &req->msg);
++	myrx_buf = req->xfer[0].rx_buf;
++	rxbuf[0]=myrx_buf[0]<<8 | myrx_buf[1];
++	rxbuf[1]=myrx_buf[2]<<8 | myrx_buf[3];
++   	printk("/ab/%s flash 1: 0x%x 0x%x\n", __func__, rxbuf[0], rxbuf[1]);
++
++	spi_message_init(&req->msg);
++
++	mycmd[0] = 0x9f;
++	mycmd[1] = 0x0;
++	mycmd[2] = 0x0;
++	mycmd[3] = 0x0;
++
++	req->xfer[0].tx_buf = &mycmd;
++	req->xfer[0].len = 4;
++
++	spi_message_add_tail(&req->xfer[0], &req->msg);
++
++	status = spi_sync(spi, &req->msg);
++	myrx_buf = req->xfer[0].rx_buf;
++	rxbuf[0]=myrx_buf[0]<<8 | myrx_buf[1];
++	rxbuf[1]=myrx_buf[2]<<8 | myrx_buf[3];
++   	printk("/ab/%s flash 2: 0x%x 0x%x\n", __func__, rxbuf[0], rxbuf[1]);
++/*	spi_setup(spi);*/
++#endif
++#if 1
++	/* write to RTC: */
++
++#if 1
++// for (i=0; i<15; i++) {
++	spi_message_init(&req->msg);
++
++	mycmd[0] = 0x80 | 0xc;
++	mycmd[1] = 0x0;
++
++	req->xfer[0].tx_buf = &mycmd;
++	req->xfer[0].len = 2;
++
++	spi_message_add_tail(&req->xfer[0], &req->msg);
++
++	status = spi_sync(spi, &req->msg);
++	myrx_buf = req->xfer[0].rx_buf;
++	rxbuf[0]=myrx_buf[1]<<8 | myrx_buf[0];
++// 	rxbuf[1]=myrx_buf[2]<<8 | myrx_buf[3];
++// 	rxbuf[0]=myrx_buf[1]<<8 | myrx_buf[0];
++
++   	printk("/ab/%s write rtc: 0x%x\n", __func__, rxbuf[0]);
++	/* write to RTC: */
++// }
++#endif
++
++	for (j=0; j<10; j++) {
++for (i=1; i<3; i++) {
++	spi_message_init(&req->msg);
++
++	mycmd[0] = i;
++	mycmd[1] = 0x0;
++	mycmd[2] = 0x0;
++ 	mycmd[3] = 0x0;
++
++	req->xfer[0].tx_buf = &mycmd;
++	req->xfer[0].len = 4;
++
++	spi_message_add_tail(&req->xfer[0], &req->msg);
++
++	status = spi_sync(spi, &req->msg);
++	myrx_buf = req->xfer[0].rx_buf;
++	rxbuf[0]=myrx_buf[0]<<8 | myrx_buf[1];
++	rxbuf[1]=myrx_buf[2]<<8 | myrx_buf[3];
++// 	rxbuf[0]=myrx_buf[1]<<8 | myrx_buf[0];
++   	printk("/ab/%s read rtc (0x%x): 0x%x 0x%x\n", __func__, i, rxbuf[0], rxbuf[1]);
++   }
++   	udelay(1);
++   }
++#endif
++#if 0
++	mycmd[0] = 0x01;
++	mycmd[1] = 0x0;
++	mycmd[2] = 0x0;
++	mycmd[3] = 0x0;
++
++	req->xfer[0].tx_buf = &mycmd;
++	req->xfer[0].len = 2;
++
++	spi_message_add_tail(&req->xfer[0], &req->msg);
++
++	status = spi_sync(spi, &req->msg);
++/*	myrx_buf = req->xfer[0].rx_buf;
++	rxbuf[0]=myrx_buf[1]<<8 | myrx_buf[0];*/
++   	printk("/ab/%s 0x%x\n", __func__, rxbuf[0]);
++
++	/* take four samples: */
++	for (i=0; i<5; i++) {
++		spi_message_init(&req->msg);
++
++		mycmd[0] = 0x01;
++		mycmd[1] = 0x0;
++		mycmd[2] = 0x0;
++		mycmd[3] = 0x0;
++
++		req->xfer[0].tx_buf = &mycmd;
++		req->xfer[0].len = 4;
++
++		spi_message_add_tail(&req->xfer[0], &req->msg);
++
++		status = spi_sync(spi, &req->msg);
++		if (i>0) {
++			myrx_buf = req->xfer[0].rx_buf;
++		  	rxbuf[i-1]=myrx_buf[1]<<8 | myrx_buf[0];
++		}
++	}
++   	printk("/ab/%s 0x%x 0x%x 0x%x 0x%x\n", __func__, rxbuf[0], rxbuf[1], rxbuf[2], rxbuf[3]);
++	/* sort by size */
++	n = 2;
++	do {
++		sorted = 0;
++		for (i = 0; i < n; i++) {
++			if (rxbuf[i]>rxbuf[i+1]) {
++				ret = rxbuf[i];
++				rxbuf[i] = rxbuf[i+1];
++				rxbuf[i+1] = ret;
++				sorted = 1;
++			}
++		}
++		n--;
++//   		printk("/ab/%s %d %d\n", __func__, sorted, n);
++	} while (sorted && n != 0);
++   	printk("/ab/%s sorted: 0x%x 0x%x 0x%x\n", __func__, rxbuf[0], rxbuf[1], rxbuf[2]);
++	kfree(req);
++	return rxbuf[1]>>4;
++#endif
++	return rxbuf[0];
++}
++
++#if defined(CONFIG_HWMON) || defined(CONFIG_HWMON_MODULE)
++
++#define SHOW(name, var, adjust) static ssize_t \
++name ## _show(struct device *dev, struct device_attribute *attr, char *buf) \
++{ \
++	struct m41t94 *ts = dev_get_drvdata(dev); \
++	ssize_t v = m41t94_read10_ser(dev, var); \
++	if (v < 0) \
++		return v; \
++	return sprintf(buf, "%u\n", adjust(ts, v)); \
++} \
++static DEVICE_ATTR(name, S_IRUGO, name ## _show, NULL);
++
++/* sysfs conventions report voltages in millivolts.  We can convert voltages
++ * if we know vREF.  userspace may need to scale vAUX to match the board's
++ * external resistors; we assume that vBATT only uses the internal ones.
++ */
++static inline unsigned vaux_adjust(struct m41t94 *ts, ssize_t v)
++{
++	unsigned retval = v;
++
++	/* external resistors may scale vAUX into 0..vREF */
++	retval *= vREF_mV;
++	retval = retval >> 10;
++	return retval;
++}
++
++SHOW(vin1, 0, vaux_adjust);
++SHOW(vin2, 1, vaux_adjust);
++SHOW(vin3, 2, vaux_adjust);
++SHOW(vin4, 3, vaux_adjust);
++SHOW(vin5, 4, vaux_adjust);
++SHOW(vin6, 5, vaux_adjust);
++SHOW(vin7, 6, vaux_adjust);
++SHOW(vin8, 7, vaux_adjust);
++
++
++static struct attribute *m41t94_attributes[] = {
++	&dev_attr_vin1.attr,
++	&dev_attr_vin2.attr,
++	&dev_attr_vin3.attr,
++	&dev_attr_vin4.attr,
++	&dev_attr_vin5.attr,
++	&dev_attr_vin6.attr,
++	&dev_attr_vin7.attr,
++	&dev_attr_vin8.attr,
++	NULL,
++};
++
++static struct attribute_group m41t94_attr_group = {
++	.attrs = m41t94_attributes,
++};
++
++static int ads784x_hwmon_register(struct spi_device *spi, struct m41t94 *ts)
++{
++	struct class_device *hwmon;
++	int err;
++
++	/* different chips have different sensor groups */
++	ts->attr_group = &m41t94_attr_group;
++
++	err = sysfs_create_group(&spi->dev.kobj, ts->attr_group);
++	if (err)
++		return err;
++
++	hwmon = hwmon_device_register(&spi->dev);
++	if (IS_ERR(hwmon)) {
++		sysfs_remove_group(&spi->dev.kobj, ts->attr_group);
++		return PTR_ERR(hwmon);
++	}
++
++	ts->hwmon = hwmon;
++	return 0;
++}
++
++static void ads784x_hwmon_unregister(struct spi_device *spi,
++				     struct m41t94 *ts)
++{
++	if (ts->hwmon) {
++		sysfs_remove_group(&spi->dev.kobj, ts->attr_group);
++		hwmon_device_unregister(ts->hwmon);
++	}
++}
++
++#else
++static inline int ads784x_hwmon_register(struct spi_device *spi,
++					 struct m41t94 *ts)
++{
++	return 0;
++}
++
++static inline void ads784x_hwmon_unregister(struct spi_device *spi,
++					    struct m41t94 *ts)
++{
++}
++#endif
++
++
++/*--------------------------------------------------------------------------*/
++
++
++static int m41t94_suspend(struct spi_device *spi, pm_message_t message)
++{
++	return 0;
++
++}
++
++static int m41t94_resume(struct spi_device *spi)
++{
++	return 0;
++}
++
++static int __devinit m41t94_probe(struct spi_device *spi)
++{
++	struct m41t94			*ts;
++	struct input_dev		*input_dev;
++	int				vref;
++	int				err;
++
++	/* We'd set TX wordsize 8 bits and RX wordsize to 13 bits ... except
++	 * that even if the hardware can do that, the SPI controller driver
++	 * may not.  So we stick to very-portable 8 bit words, both RX and TX.
++	 */
++	spi->bits_per_word = 32;
++// 	spi->mode = SPI_CPHA | SPI_LSB_FIRST;
++	spi->mode = 0; //SPI_LSB_FIRST;
++	err = spi_setup(spi);
++	if (err < 0)
++		return err;
++
++	ts = kzalloc(sizeof(struct m41t94), GFP_KERNEL);
++	input_dev = input_allocate_device();
++	printk("/ab/%s1\n", __func__);
++	if (!ts || !input_dev) {
++		err = -ENOMEM;
++		printk("/ab/%s fail ENOMEM\n", __func__);
++		goto err_free_mem;
++	}
++
++	dev_set_drvdata(&spi->dev, ts);
++	spi->dev.power.power_state = PMSG_ON;
++
++	printk("/ab/%s2\n", __func__);
++
++	ts->spi = spi;
++	ts->input = input_dev;
++
++// 	spin_lock_init(&ts->lock);
++
++// 	ts->model = pdata->model ? : 7846;
++	ts->vref_delay_usecs = 100;
++	ts->x_plate_ohms = 400;
++	ts->pressure_max = ~0;
++
++
++	snprintf(ts->phys, sizeof(ts->phys), "%s/input0", spi->dev.bus_id);
++
++	input_dev->name = "M41T94 A/D Converter";
++	input_dev->phys = ts->phys;
++	input_dev->dev.parent = &spi->dev;
++
++	input_dev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
++	input_dev->keybit[BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH);
++	input_set_abs_params(input_dev, ABS_X, 0, MAX_10BIT, 0, 0);
++	input_set_abs_params(input_dev, ABS_Y, 0, MAX_10BIT, 0, 0);
++
++
++ 	err = ads784x_hwmon_register(spi, ts);
++ 	if (err)
++ 		goto err_free_mem;
++
++	printk("/ab/%s3\n", __func__);
++
++	/* take a first sample, leaving nPENIRQ active and vREF off; avoid
++	 * the touchscreen, in case it's not connected.
++	 */
++	(void) m41t94_read10_ser(&spi->dev, 0x00);
++
++	err = input_register_device(input_dev);
++	if (err)
++		goto err_remove_hwmon;
++
++	return 0;
++
++err_remove_hwmon:
++	ads784x_hwmon_unregister(spi, ts);
++err_free_mem:
++	input_free_device(input_dev);
++	kfree(ts);
++	return err;
++}
++
++static int __devexit m41t94_remove(struct spi_device *spi)
++{
++	struct m41t94		*ts = dev_get_drvdata(&spi->dev);
++
++	ads784x_hwmon_unregister(spi, ts);
++	input_unregister_device(ts->input);
++
++	kfree(ts);
++
++	dev_dbg(&spi->dev, "unregistered m41t94\n");
++	return 0;
++}
++
++static struct spi_driver m41t94_driver = {
++	.driver = {
++		.name	= "m41t94",
++		.bus	= &spi_bus_type,
++		.owner	= THIS_MODULE,
++	},
++	.probe		= m41t94_probe,
++	.remove		= __devexit_p(m41t94_remove),
++	.suspend	= m41t94_suspend,
++	.resume		= m41t94_resume,
++};
++
++static int __init m41t94_init(void)
++{
++	/* board-specific init should stay out of drivers!! */
++	return spi_register_driver(&m41t94_driver);
++}
++module_init(m41t94_init);
++
++static void __exit m41t94_exit(void)
++{
++	spi_unregister_driver(&m41t94_driver);
++
++}
++module_exit(m41t94_exit);
++
++MODULE_DESCRIPTION("M41T94 ST RTC");
++MODULE_LICENSE("GPL");
diff --git a/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/09_diff-mycable-sound.patch b/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/09_diff-mycable-sound.patch
new file mode 100644
index 0000000..8e5ff87
--- /dev/null
+++ b/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/09_diff-mycable-sound.patch
@@ -0,0 +1,2506 @@
+--- linux-2.6.27/include/linux/i2c-id.h	2009-01-08 10:49:42.000000000 +0100
++++ linux-2.6.27-dev/include/linux/i2c-id.h	2009-01-08 10:49:38.000000000 +0100
+@@ -82,6 +82,7 @@
+ #define I2C_DRIVERID_CS4270	94	/* Cirrus Logic 4270 audio codec */
+ #define I2C_DRIVERID_M52790 	95      /* Mitsubishi M52790SP/FP AV switch */
+ #define I2C_DRIVERID_CS5345	96	/* cs5345 audio processor	*/
++#define I2C_DRIVERID_CS4245	97	/* Cirrus Logic 4245 audio codec */
+ 
+ #define I2C_DRIVERID_OV7670 1048	/* Omnivision 7670 camera */
+ 
+--- linux-2.6.27/arch/arm/mach-xxsvideo/include/mach/audio.h	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/arch/arm/mach-xxsvideo/include/mach/audio.h	2009-01-09 09:36:39.000000000 +0100
+@@ -0,0 +1,35 @@
++/*
++ * linux/include/asm-arm/arch-xxsvideo/audio.h
++ *
++ *  Copyright (C) 2008 mycable GmbH
++ *       Alexander Bigga <ab@mycable.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++*/
++
++#ifndef __ASM_ARCH_AUDIO_H
++#define __ASM_ARCH_AUDIO_H __FILE__
++
++
++struct xxsvideo_i2s {
++	unsigned char	id;
++	int	channel;
++};
++
++/* Block Count setting in DMACR register */
++#define MYBC	0
++
++#define I2S_CMD_FLUSH_TXFIFO	1
++#define I2S_CMD_FLUSH_RXFIFO	2
++#define I2S_CMD_TDMACT		3	/* activate Transmission Channel DMA */
++#define I2S_CMD_RDMACT		4	/* activate Reception Channel DMA */
++#define I2S_CMD_START		5
++#define I2S_CMD_STOP		6
++
++
++extern int oci2c_set_reg(unsigned int reg, unsigned char val);
++extern int oci2c_get_reg(unsigned int reg);
++#endif /* __ASM_ARCH_AUDIO_H */
+--- linux-2.6.27/sound/soc/Kconfig	2009-01-08 10:49:42.000000000 +0100
++++ linux-2.6.27-dev/sound/soc/Kconfig	2009-01-08 10:49:38.000000000 +0100
+@@ -31,6 +31,7 @@
+ source "sound/soc/fsl/Kconfig"
+ source "sound/soc/davinci/Kconfig"
+ source "sound/soc/omap/Kconfig"
++source "sound/soc/xxsvideo/Kconfig"
+ 
+ # Supported codecs
+ source "sound/soc/codecs/Kconfig"
+--- linux-2.6.27/sound/soc/Makefile	2009-01-08 10:49:42.000000000 +0100
++++ linux-2.6.27-dev/sound/soc/Makefile	2009-01-08 10:49:38.000000000 +0100
+@@ -2,4 +2,4 @@
+ 
+ obj-$(CONFIG_SND_SOC)	+= snd-soc-core.o
+ obj-$(CONFIG_SND_SOC)	+= codecs/ at32/ at91/ pxa/ s3c24xx/ sh/ fsl/ davinci/
+-obj-$(CONFIG_SND_SOC)	+= omap/ au1x/
++obj-$(CONFIG_SND_SOC)	+= omap/ au1x/ xxsvideo/
+--- linux-2.6.27/sound/soc/codecs/Kconfig	2009-01-08 10:49:42.000000000 +0100
++++ linux-2.6.27-dev/sound/soc/codecs/Kconfig	2009-01-08 10:49:38.000000000 +0100
+@@ -29,6 +29,11 @@
+ config SND_SOC_WM9713
+ 	tristate
+ 
++# Cirrus Logic CS4245 Codec
++config SND_SOC_CS4245
++	tristate
++	depends on SND_SOC
++
+ # Cirrus Logic CS4270 Codec
+ config SND_SOC_CS4270
+ 	tristate
+--- linux-2.6.27/sound/soc/codecs/Makefile	2009-01-08 10:49:42.000000000 +0100
++++ linux-2.6.27-dev/sound/soc/codecs/Makefile	2009-01-08 10:49:38.000000000 +0100
+@@ -8,6 +8,7 @@
+ snd-soc-wm8990-objs := wm8990.o
+ snd-soc-wm9712-objs := wm9712.o
+ snd-soc-wm9713-objs := wm9713.o
++snd-soc-cs4245-objs := cs4245.o
+ snd-soc-cs4270-objs := cs4270.o
+ snd-soc-tlv320aic3x-objs := tlv320aic3x.o
+ 
+@@ -21,5 +22,6 @@
+ obj-$(CONFIG_SND_SOC_WM8990)	+= snd-soc-wm8990.o
+ obj-$(CONFIG_SND_SOC_WM9712)	+= snd-soc-wm9712.o
+ obj-$(CONFIG_SND_SOC_WM9713)	+= snd-soc-wm9713.o
++obj-$(CONFIG_SND_SOC_CS4245)	+= snd-soc-cs4245.o
+ obj-$(CONFIG_SND_SOC_CS4270)	+= snd-soc-cs4270.o
+ obj-$(CONFIG_SND_SOC_TLV320AIC3X)	+= snd-soc-tlv320aic3x.o
+--- linux-2.6.27.21/sound/soc/codecs/cs4245.c	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/sound/soc/codecs/cs4245.c	2009-11-27 09:39:22.000000000 +0000
+@@ -0,0 +1,769 @@
++/*
++ * sound/soc/codec/cs4245.c
++ *
++ * CS4245 ALSA SoC (ASoC) codec driver on mycable Jade Evalkit
++ *
++ *  Copyright (C) 2008 mycable GmbH
++ *      Alexander Bigga <linux@bigga.de>
++ *
++ * based on CS4270 driver by Timur Tabi
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++#include <linux/module.h>
++#include <linux/platform_device.h>
++#include <sound/core.h>
++#include <sound/soc.h>
++#include <sound/initval.h>
++#include <linux/i2c.h>
++
++#include <asm/gpio.h>
++
++#include "cs4245.h"
++// #define CS4245_REG_DUMP 1
++
++/* defined in include/sound/soc.h */
++/* codec IO */
++// #define snd_soc_read(codec, reg) codec->read(codec, reg)
++// #define snd_soc_write(codec, reg, value) codec->write(codec, reg, value)
++
++#ifdef CS4245_REG_DUMP
++static int oci2c_read(struct i2c_client *client, int address)
++{
++	u8 reg_addr[1];
++	u8 data[2];
++	int ret;
++	struct i2c_msg message[2] = {
++		{
++			.addr	= client->addr,
++			.flags	= 0,
++			.len	= 1,
++			.buf	= reg_addr,
++		},
++		{
++			.addr	= client->addr,
++			.flags	= I2C_M_RD,
++			.len	= 0x1,
++			.buf	= data,
++		},
++	};
++
++	reg_addr[0] = address;
++	data[0] = 0x00;
++
++
++	ret = i2c_transfer(client->adapter, message, 2);
++	if (ret == 2)
++		return data[0];
++
++// 	if (i2c_transfer(client->adapter, message, 2) == 2)
++// 		return data[0];
++
++	return -EIO;
++}
++
++int oci2c_get_reg(struct i2c_client *i2c_client, unsigned int reg)
++{
++	return oci2c_read(i2c_client, reg);
++}
++
++void dump_cs4245_regs(struct snd_soc_codec *codec)
++{
++	struct i2c_client *i2c_client = codec->control_data;
++	int i;
++	int tmp;
++
++	printk("CS4245 Registers:\n");
++	for (i = 0x01; i <= 0x10; i++) {
++		tmp = oci2c_get_reg(i2c_client, i);
++		printk("Reg 0x%02x = 0x%02x\n", i, tmp);
++	}
++}
++#endif
++
++/* Private data for the CS4245 */
++struct cs4245_private {
++	unsigned int mclk; /* Input frequency of the MCLK pin */
++	unsigned int dac;  /* (I2S or left-justified) */
++	unsigned int adc;  /* */
++};
++
++/*
++ * Clock Ratio Selection for Master Mode with I2C enabled
++ *
++ * The data for this chart is taken from Table 2 of the CS4245 reference
++ * manual.
++ *
++ * This table is used to determine how to program the Mode Control register.
++ * It is also used by cs4245_set_dai_sysclk() to tell ALSA which sampling
++ * rates the CS4245 currently supports.
++ *
++ * Each element in this array corresponds to the ratios in mclk_ratios[].
++ * These two arrays need to be in sync.
++ *
++ * 'speed_mode' is the corresponding bit pattern to be written to the
++ * MODE bits of the Mode Control Register
++ *
++ * 'mclk' is the corresponding bit pattern to be wirten to the MCLK bits of
++ * the Mode Control Register.
++ */
++static struct {
++        unsigned int ratio;
++	u8 speed_mode;
++	u8 mclk;
++} cs4245_mode_ratios[] = {
++	{64, CS4245_DACC1_MODE_4X, CS4245_MCLK_DIV1},   /* 192 kHz */
++	{96, CS4245_DACC1_MODE_4X, CS4245_MCLK_DIV15},  /* 128 kHz */
++	{128, CS4245_DACC1_MODE_2X, CS4245_MCLK_DIV1},  /*  96 kHz */
++	{192, CS4245_DACC1_MODE_2X, CS4245_MCLK_DIV15}, /*  64 kHz */
++	{256, CS4245_DACC1_MODE_1X, CS4245_MCLK_DIV1},  /*  48 kHz */
++	{384, CS4245_DACC1_MODE_1X, CS4245_MCLK_DIV15}, /*  32 kHz */
++	{512, CS4245_DACC1_MODE_1X, CS4245_MCLK_DIV2},  /*  24 kHz */
++	{768, CS4245_DACC1_MODE_1X, CS4245_MCLK_DIV3},  /*  16 kHz */
++	{1024, CS4245_DACC1_MODE_1X, CS4245_MCLK_DIV4}, /*  12 kHz */
++};
++
++/* The number of MCLK/LRCK ratios supported by the CS4245 */
++#define NUM_MCLK_RATIOS		ARRAY_SIZE(cs4245_mode_ratios)
++
++/*
++ * Determine the CS4245 samples rates.
++ *
++ * 'freq' is the input frequency to MCLK.  The other parameters are ignored.
++ *
++ * The value of MCLK is used to determine which sample rates are supported
++ * by the CS4245.  The ratio of MCLK / Fs must be equal to one of nine
++ * support values: 64, 96, 128, 192, 256, 384, 512, 768, and 1024.
++ *
++ * This function calculates the nine ratios and determines which ones match
++ * a standard sample rate.  If there's a match, then it is added to the list
++ * of support sample rates.
++ *
++ * This function must be called by the machine driver's 'startup' function,
++ * otherwise the list of supported sample rates will not be available in
++ * time for ALSA.
++ *
++ */
++static int cs4245_set_dai_sysclk(struct snd_soc_dai *codec_dai,
++				 int clk_id, unsigned int freq, int dir)
++{
++	struct snd_soc_codec *codec = codec_dai->codec;
++	struct cs4245_private *cs4245 = codec->private_data;
++	unsigned int rates = 0;
++	unsigned int rate_min = -1;
++	unsigned int rate_max = 0;
++	unsigned int i;
++
++	cs4245->mclk = freq;
++#if 0
++ 	printk("/ab/%s freq %i\n", __func__, freq);
++	for (i = 0; i < NUM_MCLK_RATIOS; i++) {
++		unsigned int rate = freq / cs4245_mode_ratios[i].ratio;
++		rates |= snd_pcm_rate_to_rate_bit(rate);
++		if (rate < rate_min)
++			rate_min = rate;
++		if (rate > rate_max)
++			rate_max = rate;
++	}
++
++	if (!rates) {
++		printk(KERN_ERR "cs4245: could not find a valid sample rate\n");
++		return -EINVAL;
++	}
++
++	codec_dai->playback.rates = rates;
++	codec_dai->playback.rate_min = rate_min;
++	codec_dai->playback.rate_max = rate_max;
++
++	codec_dai->capture.rates = rates;
++	codec_dai->capture.rate_min = rate_min;
++	codec_dai->capture.rate_max = rate_max;
++
++// 	printk("/ab/2 %s rates 0x%x, rate_min %d, rate_max %d\n", __func__, rates, rate_min, rate_max);
++#endif
++	return 0;
++}
++
++
++/*
++ * The codec isn't really big-endian or little-endian, since the I2S
++ * interface requires data to be sent serially with the MSbit first.
++ * However, to support BE and LE I2S devices, we specify both here.  That
++ * way, ALSA will always match the bit patterns.
++ */
++#define CS4245_FORMATS (SNDRV_PCM_FMTBIT_S8      | \
++			SNDRV_PCM_FMTBIT_S16_LE  | SNDRV_PCM_FMTBIT_S16_BE  | \
++			SNDRV_PCM_FMTBIT_S18_3LE | SNDRV_PCM_FMTBIT_S18_3BE | \
++			SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S20_3BE | \
++			SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_3BE | \
++			SNDRV_PCM_FMTBIT_S24_LE  | SNDRV_PCM_FMTBIT_S24_BE)
++
++
++/* to be verified ... */
++#define CS4245_FORMAT_FREEZE_A	0x80
++#define CS4245_FORMAT_FREEZE_B	0x40
++#define CS4245_FORMAT_LOOPBACK	0x20
++#define CS4245_FORMAT_DAC_MASK	0x18
++#define CS4245_FORMAT_DAC_LJ	0x00
++#define CS4245_FORMAT_DAC_I2S	0x08
++#define CS4245_FORMAT_DAC_RJ16	0x18
++#define CS4245_FORMAT_DAC_RJ24	0x10
++#define CS4245_FORMAT_ADC_MASK	0x01
++#define CS4245_FORMAT_ADC_LJ	0x00
++#define CS4245_FORMAT_ADC_I2S	0x01
++#define CS4245_TRANS_ONE_VOL	0x80
++#define CS4245_TRANS_SOFT	0x40
++#define CS4245_TRANS_ZERO	0x20
++#define CS4245_TRANS_INV_ADC_A	0x08
++#define CS4245_TRANS_INV_ADC_B	0x10
++#define CS4245_TRANS_INV_DAC_A	0x02
++#define CS4245_TRANS_INV_DAC_B	0x04
++#define CS4245_TRANS_DEEMPH	0x01
++
++/*
++ * Configure the codec for the selected audio format
++ *
++ * This function takes a bitmask of SND_SOC_DAIFMT_x bits and programs the
++ * codec accordingly.
++ *
++ * Currently, this function only supports SND_SOC_DAIFMT_I2S and
++ * SND_SOC_DAIFMT_LEFT_J.  The CS4245 codec also supports right-justified
++ * data for playback only, but ASoC currently does not support different
++ * formats for playback vs. record.
++ */
++static int cs4245_set_dai_fmt(struct snd_soc_dai *codec_dai,
++			      unsigned int format)
++{
++	struct snd_soc_codec *codec = codec_dai->codec;
++	struct cs4245_private *cs4245 = codec->private_data;
++	int ret = 0;
++
++// 	printk("/ab/%s format 0x%x\n", __func__, format);
++
++	switch (format & SND_SOC_DAIFMT_FORMAT_MASK) {
++	case SND_SOC_DAIFMT_I2S:
++		cs4245->dac = CS4245_DACC1_FORMAT_I2S;
++		cs4245->adc = CS4245_ADC_FORMAT_I2S;
++		break;
++	case SND_SOC_DAIFMT_LEFT_J:
++		cs4245->dac = CS4245_DACC1_FORMAT_LJ;
++		cs4245->adc = CS4245_ADC_FORMAT_LJ;
++		break;
++	default:
++		printk(KERN_ERR "cs4245: invalid DAI format\n");
++		cs4245->dac = 0;
++		cs4245->adc = 0;
++		ret = -EINVAL;
++	}
++
++	/* set master/slave */
++	if ((format & SND_SOC_DAIFMT_CBM_CFM) == SND_SOC_DAIFMT_CBM_CFM) {
++		cs4245->dac |= CS4245_DACC1_MASTER;
++//  		cs4245->adc |= CS4245_ADC_MASTER;
++	}
++
++	return ret;
++}
++
++/*
++ * A list of addresses on which this CS4245 could use.  I2C addresses are
++ * 7 bits.  For the CS4245, the upper four bits are always 1001, and the
++ * lower three bits are determined via the AD2, AD1, and AD0 pins
++ * (respectively).
++ */
++static unsigned short normal_i2c[] = {
++	0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D, 0x4E, 0x4F, I2C_CLIENT_END
++};
++I2C_CLIENT_INSMOD;
++
++/*
++ * Pre-fill the CS4245 register cache.
++ *
++ * We use the auto-increment feature of the CS4245 to read all registers in
++ * one shot.
++ */
++static int cs4245_fill_cache(struct snd_soc_codec *codec)
++{
++        u8 *cache = codec->reg_cache;
++        struct i2c_client *i2c_client = codec->control_data;
++        s32 length;
++
++        length = i2c_smbus_read_i2c_block_data(i2c_client,
++                CS4245_FIRSTREG | 0x80, CS4245_NUMREGS, cache);
++
++ 	/* FIXME: /ab/ */
++// 	length = CS4245_NUMREGS;
++
++       if (length != CS4245_NUMREGS) {
++                printk(KERN_ERR "cs4245: I2C read failure, addr=0x%x\n",
++                       i2c_client->addr);
++                return -EIO;
++        }
++  
++        return 0;
++} 
++
++/*
++ * Read from the CS4245 register cache.
++ *
++ * This CS4245 registers are cached to avoid excessive I2C I/O operations.
++ * After the initial read to pre-fill the cache, the CS4245 never updates
++ * the register values, so we won't have a cache coherncy problem.
++ */
++static unsigned int cs4245_read_reg_cache(struct snd_soc_codec *codec,
++	unsigned int reg)
++{
++	u8 *cache = codec->reg_cache;
++
++	if ((reg < CS4245_FIRSTREG) || (reg > CS4245_LASTREG))
++		return -EIO;
++
++	return cache[reg - CS4245_FIRSTREG];
++}
++
++/*
++ * Write to a CS4245 register via the I2C bus.
++ *
++ * This function writes the given value to the given CS4245 register, and
++ * also updates the register cache.
++ *
++ * Note that we don't use the hw_write function pointer of snd_soc_codec.
++ * That's because it's too clunky: the hw_write_t prototype does not match
++ * i2c_smbus_write_byte_data(), and it's just another layer of overhead.
++ */
++static int cs4245_i2c_write(struct snd_soc_codec *codec, unsigned int reg,
++			    unsigned int value)
++{
++	u8 *cache = codec->reg_cache;
++
++// 	printk("/ab/%s: will write via I2C 0x%x to reg 0x%x\n", __func__, value, reg);
++
++	if ((reg < CS4245_FIRSTREG) || (reg > CS4245_LASTREG))
++		return -EIO;
++
++	/* Only perform an I2C operation if the new value is different */
++	if (cache[reg - CS4245_FIRSTREG] != value) {
++		struct i2c_client *client = codec->control_data;
++		if (i2c_smbus_write_byte_data(client, reg, value)) {
++			printk(KERN_ERR "cs4245: I2C write failed\n");
++			return -EIO;
++		}
++
++		/* We've written to the hardware, so update the cache */
++		cache[reg - CS4245_FIRSTREG] = value;
++	}
++
++	return 0;
++}
++
++/*
++ * Program the CS4245 with the given hardware parameters.
++ *
++ * The .dai_ops functions are used to provide board-specific data, like
++ * input frequencies, to this driver.  This function takes that information,
++ * combines it with the hardware parameters provided, and programs the
++ * hardware accordingly.
++ */
++static int cs4245_hw_params(struct snd_pcm_substream *substream,
++			    struct snd_pcm_hw_params *params)
++{
++	struct snd_soc_pcm_runtime *rtd = substream->private_data;
++	struct snd_soc_device *socdev = rtd->socdev;
++	struct snd_soc_codec *codec = socdev->codec;
++	struct cs4245_private *cs4245 = codec->private_data;
++	unsigned int ret = 0;
++	unsigned int i;
++	unsigned int rate;
++	unsigned int ratio;
++	int reg;
++
++	/* Figure out which MCLK/LRCK ratio to use */
++
++	rate = params_rate(params);	/* Sampling rate, in Hz */
++	ratio = cs4245->mclk / rate;	/* MCLK/LRCK ratio */
++// 	printk("/ab/%s cs4245->mclk %d, rate %d\n", __func__, cs4245->mclk, rate);
++
++	for (i = 0; i < NUM_MCLK_RATIOS; i++) {
++// 		printk("/ab/%s cs4245_mode_ratios[i].ratio[%i] %d, ratio %d\n", __func__, i, cs4245_mode_ratios[i].ratio, ratio);
++		if (cs4245_mode_ratios[i].ratio == ratio)
++			break;
++	}
++
++	if (i == NUM_MCLK_RATIOS) {
++		/* We did not find a matching ratio */
++		printk(KERN_ERR "cs4245: could not find matching ratio %d\n", ratio);
++		return -EINVAL;
++	}
++
++	printk("/ab/%s found [%d], rate %d\n", __func__, i,  rate);
++
++
++	/* Freeze and power-down the codec */
++	ret = snd_soc_write(codec, CS4245_PWRCTL, CS4245_PWRCTL_FREEZE |
++			    CS4245_PWRCTL_PDN_ADC | CS4245_PWRCTL_PDN_DAC |
++			    CS4245_PWRCTL_PDN);
++	if (ret < 0) {
++		printk(KERN_ERR "cs4245: I2C write failed\n");
++		return ret;
++	}
++
++	/* Program the Master clock control register */
++	/* mclk1 == mclk2 */
++	reg = cs4245_mode_ratios[i].mclk<<4 | cs4245_mode_ratios[i].mclk;
++	ret = snd_soc_write(codec, CS4245_MCLK, reg);
++	if (ret < 0) {
++		printk(KERN_ERR "cs4245: I2C write failed\n");
++		return ret;
++	}
++
++/*
++	reg = snd_soc_read(codec, CS4245_MODE);
++	reg &= ~(CS4245_MODE_SPEED_MASK | CS4245_MODE_DIV_MASK);
++	reg |= cs4245_mode_ratios[i].speed_mode | cs4245_mode_ratios[i].mclk;
++
++	ret = snd_soc_write(codec, CS4245_MODE, reg);
++	if (ret < 0) {
++		printk(KERN_ERR "cs4245: I2C write failed\n");
++		return ret;
++	}*/
++
++	/* Program the DAC register */
++	reg = snd_soc_read(codec, CS4245_DACC1);
++ 	reg &= ~(CS4245_DACC1_FORMAT_MASK | CS4245_DACC1_MASTER);
++	reg |= (cs4245->dac | cs4245_mode_ratios[i].speed_mode);
++	ret = snd_soc_write(codec, CS4245_DACC1, reg);
++	if (ret < 0) {
++		printk(KERN_ERR "cs4245: I2C write failed\n");
++		return ret;
++	}
++
++	/* Program the ADC register */
++	reg = snd_soc_read(codec, CS4245_ADC);
++ 	reg &= ~(CS4245_ADC_FORMAT_MASK | CS4245_ADC_MASTER);
++	reg |= (cs4245->adc | cs4245_mode_ratios[i].speed_mode);
++	ret = snd_soc_write(codec, CS4245_ADC, reg);
++	if (ret < 0) {
++		printk(KERN_ERR "cs4245: I2C write failed\n");
++		return ret;
++	}
++
++	/* don't care for playback! */
++	ret = snd_soc_write(codec, CS4245_SIGNAL, 0x20);// Single Speed Mode; I2S, up to 24-bit data; mute ADC
++	if (ret < 0) {
++		printk(KERN_ERR "cs4245: I2C write failed\n");
++		return ret;
++	}
++
++	ret = snd_soc_write(codec, CS4245_DACC2, 0xc1);
++	if (ret < 0) {
++		printk(KERN_ERR "cs4245: I2C write failed\n");
++		return ret;
++	}
++
++	/* Thaw and power-up the codec */
++
++	ret = snd_soc_write(codec, CS4245_PWRCTL, 0);
++	if (ret < 0) {
++		printk(KERN_ERR "cs4245: I2C write failed\n");
++		return ret;
++	}
++
++#if 0
++	/* have a try with interrupt infos */
++	ret = snd_soc_write(codec, CS4245_INTM, 0xf);
++	if (ret < 0) {
++		printk(KERN_ERR "cs4245: I2C write failed\n");
++		return ret;
++	}
++#endif
++
++#if CS4245_REG_DUMP
++	dump_cs4245_regs(codec);
++#endif
++	return ret;
++}
++
++/*
++ * Global variable to store socdev for i2c probe function.
++ *
++ * If struct i2c_driver had a private_data field, we wouldn't need to use
++ * cs4245_socdec.  This is the only way to pass the socdev structure to
++ * cs4245_i2c_probe().
++ *
++ * The real solution to cs4245_socdev is to create a mechanism
++ * that maps I2C addresses to snd_soc_device structures.  Perhaps the
++ * creation of the snd_soc_device object should be moved out of
++ * cs4245_probe() and into cs4245_i2c_probe(), but that would make this
++ * driver dependent on I2C.  The CS4245 supports "stand-alone" mode, whereby
++ * the chip is *not* connected to the I2C bus, but is instead configured via
++ * input pins.
++ */
++static struct snd_soc_device *cs4245_socdev;
++
++/* A list of non-DAPM controls that the CS4245 supports */
++static const struct snd_kcontrol_new cs4245_snd_controls[] = {
++	SOC_DOUBLE_R("Master Playback Volume",
++		CS4245_VOLA, CS4245_VOLB, 0, 0x3F, 1)
++};
++
++/*
++ * Initialize the I2C interface of the CS4245
++ *
++ * This function is called for whenever the I2C subsystem finds a device
++ * at a particular address.
++ *
++ * Note: snd_soc_new_pcms() must be called before this function can be called,
++ * because of snd_ctl_add().
++ */
++static int cs4245_i2c_probe(struct i2c_client *i2c_client,
++			const struct i2c_device_id *id)
++{
++	struct snd_soc_device *socdev = cs4245_socdev;
++	struct snd_soc_codec *codec = socdev->codec;
++	int i;
++	int ret = 0;
++
++#ifdef CONFIG_MACH_XXSVIDEO_EVALKIT_VIDEOIN
++	/* enable codec on XXSvideo VideoIN extension */
++	xxsvideo_ioexpander_set_io(224, 1);
++#endif /* CONFIG_MACH_XXSVIDEO_EVALKIT_VIDEOIN */
++
++	if (!i2c_check_functionality(i2c_client->adapter, I2C_FUNC_I2C
++				     | I2C_FUNC_SMBUS_BYTE_DATA)) {
++		ret = -ENODEV;
++		goto exit;
++	}
++
++	codec->reg_cache = kzalloc(CS4245_NUMREGS, GFP_KERNEL);
++	if (!codec->reg_cache) {
++		printk(KERN_ERR "cs4245: could not allocate register cache\n");
++		ret = -ENOMEM;
++		goto error;
++	}
++
++	i2c_set_clientdata(i2c_client, codec);
++
++	/* Verify that we have a CS4245 */
++	ret = i2c_smbus_read_byte_data(i2c_client, CS4245_CHIPID);
++	if (ret < 0) {
++		printk(KERN_ERR "cs4245: failed to read I2C\n");
++		goto error;
++	}
++	/* The top four bits of the chip ID should be 1100. */
++	if ((ret & 0xF0) != 0xC0) {
++		/* The device at this address is not a CS4245 codec */
++		ret = -ENODEV;
++		goto error;
++	}
++
++// 	printk(KERN_INFO "cs4245: found device at I2C address %X\n", addr);
++	printk(KERN_INFO "cs4245: hardware revision %X\n", ret & 0xF);
++
++	/* Tell the I2C layer a new client has arrived */
++
++// 	ret = i2c_attach_client(i2c_client);
++// 	if (ret) {
++// 		printk(KERN_ERR "cs4245: could not attach codec, "
++// 			"I2C address %x, error code %i\n", addr, ret);
++// 		goto error;
++// 	}
++
++	codec->control_data = i2c_client;
++	codec->read = cs4245_read_reg_cache;
++	codec->write = cs4245_i2c_write;
++	codec->reg_cache_size = CS4245_NUMREGS;
++
++	/* The I2C interface is set up, so pre-fill our register cache */
++
++	ret = cs4245_fill_cache(codec);
++	if (ret < 0) {
++		printk(KERN_ERR "cs4245: failed to fill register cache\n");
++		goto error;
++	}
++
++#if 1
++	/* Add the non-DAPM controls */
++
++	for (i = 0; i < ARRAY_SIZE(cs4245_snd_controls); i++) {
++		struct snd_kcontrol *kctrl =
++		snd_soc_cnew(&cs4245_snd_controls[i], codec, NULL);
++
++		ret = snd_ctl_add(codec->card, kctrl);
++// 		printk("/ab/%s: ret after snd_ctl_add = %d\n", __func__, ret);
++		if (ret < 0)
++			goto error;
++	}
++
++	return 0;
++
++#endif
++error:
++	printk("/ab/%s: reached goto error!\n", __func__);
++	if (codec->control_data) {
++// 		i2c_detach_client(client);
++		codec->control_data = NULL;
++	}
++
++	kfree(codec->reg_cache);
++	codec->reg_cache = NULL;
++	codec->reg_cache_size = 0;
++
++	kfree(i2c_client);
++
++	return ret;
++
++exit:
++	printk("/ab/%s: reached goto exit, ret = %d!\n", __func__, ret);
++	return ret;
++}
++
++static const struct i2c_device_id cs4245_id[] = {
++	{ "cs4245", 0 },
++	{ }
++};
++MODULE_DEVICE_TABLE(i2c, cs4245_id);
++
++
++static struct i2c_driver cs4245_i2c_driver = {
++	.driver = {
++		.name = "CS4245 I2C",
++	},
++	.probe		= cs4245_i2c_probe,
++	.id_table = 	cs4245_id,
++};
++
++
++/*
++* all rates the CS4245 is able to do in this setup
++*/
++#define CS4245_RATES (SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_32000 | \
++		SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_64000 | \
++		SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000)
++
++struct snd_soc_dai cs4245_dai = {
++	.name = "CS4245",
++	.playback = {
++		.stream_name = "Playback",
++		.channels_min = 2,
++		.channels_max = 2,
++		.rates = CS4245_RATES,
++		.formats = CS4245_FORMATS,
++	},
++	.capture = {
++		.stream_name = "Capture",
++		.channels_min = 2,
++		.channels_max = 2,
++		.rates = CS4245_RATES,
++		.formats = CS4245_FORMATS,
++	},
++        /* pcm operations */
++        .ops = {
++		.hw_params = cs4245_hw_params,
++        },
++	/* DAI operations - see DAI.txt */
++	.dai_ops = {
++		.set_sysclk = cs4245_set_dai_sysclk,
++		.set_fmt = cs4245_set_dai_fmt,
++	}
++};
++EXPORT_SYMBOL_GPL(cs4245_dai);
++
++/*
++ * ASoC probe function
++ *
++ * This function is called when the machine driver calls
++ * platform_device_add().
++ */
++static int cs4245_probe(struct platform_device *pdev)
++{
++	struct snd_soc_device *socdev = platform_get_drvdata(pdev);
++	struct snd_soc_codec *codec;
++	int ret = 0;
++
++// 	printk("/ab/1 %s\n", __func__);
++	printk(KERN_INFO "CS4245 ALSA SoC Codec\n");
++
++	/* Allocate enough space for the snd_soc_codec structure
++	   and our private data together. */
++	codec = kzalloc(ALIGN(sizeof(struct snd_soc_codec), 4) +
++			sizeof(struct cs4245_private), GFP_KERNEL);
++	if (!codec) {
++		printk(KERN_ERR "cs4245: Could not allocate codec structure\n");
++		return -ENOMEM;
++	}
++
++	mutex_init(&codec->mutex);
++	INIT_LIST_HEAD(&codec->dapm_widgets);
++	INIT_LIST_HEAD(&codec->dapm_paths);
++
++	codec->name = "CS4245";
++	codec->owner = THIS_MODULE;
++	codec->dai = &cs4245_dai;
++	codec->num_dai = 1;
++	codec->private_data = (void *) codec +
++		ALIGN(sizeof(struct snd_soc_codec), 4);
++
++	socdev->codec = codec;
++
++	/* Register PCMs */
++
++	ret = snd_soc_new_pcms(socdev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1);
++	if (ret < 0) {
++		printk(KERN_ERR "cs4245: failed to create PCMs\n");
++		return ret;
++	}
++
++	cs4245_socdev = socdev;
++
++	/* add i2c driver */
++	ret = i2c_add_driver(&cs4245_i2c_driver);
++	if (ret) {
++		printk(KERN_ERR "cs4245: failed to attach driver");
++		snd_soc_free_pcms(socdev);
++		return ret;
++	}
++
++	ret = snd_soc_register_card(socdev);
++	if (ret < 0) {
++		printk(KERN_ERR "cs4245: failed to register card\n");
++		snd_soc_free_pcms(socdev);
++		return ret;
++	}
++
++	return ret;
++}
++
++static int cs4245_remove(struct platform_device *pdev)
++{
++	struct snd_soc_device *socdev = platform_get_drvdata(pdev);
++
++	snd_soc_free_pcms(socdev);
++
++	if (socdev->codec->control_data)
++		i2c_del_driver(&cs4245_i2c_driver);
++
++	kfree(socdev->codec);
++	socdev->codec = NULL;
++
++	return 0;
++}
++
++/*
++ * ASoC codec device structure
++ *
++ * Assign this variable to the codec_dev field of the machine driver's
++ * snd_soc_device structure.
++ */
++struct snd_soc_codec_device soc_codec_device_cs4245 = {
++	.probe = 	cs4245_probe,
++	.remove = 	cs4245_remove
++};
++EXPORT_SYMBOL_GPL(soc_codec_device_cs4245);
++
++MODULE_AUTHOR("Alexander Bigga <linux@bigga.de>");
++MODULE_DESCRIPTION("Cirrus Logic CS4245 ALSA SoC Codec Driver");
++MODULE_LICENSE("GPL");
+--- linux-2.6.27.21/sound/soc/codecs/cs4245.h	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/sound/soc/codecs/cs4245.h	2009-11-12 15:21:03.000000000 +0000
+@@ -0,0 +1,90 @@
++/*
++ * sound/soc/codec/cs4245.c
++ *
++ * CS4245 ALSA SoC (ASoC) codec driver on mycable Jade Evalkit
++ *
++ *  Copyright (C) 2008 mycable GmbH
++ *      Alexander Bigga <linux@bigga.de>
++ *
++ * based on CS4270 driver by Timur Tabi
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++#ifndef _CS4270_H
++#define _CS4270_H
++
++/* CS4245 registers addresses */
++#define CS4245_CHIPID	0x01	/* Chip ID */
++#define CS4245_PWRCTL	0x02	/* Power Control */
++
++#define CS4245_DACC1	0x03	/* DAC Control 1 */
++#define CS4245_ADC	0x04	/* ADC Control */
++#define CS4245_MCLK	0x05	/* MCLK Frequency */
++#define CS4245_SIGNAL	0x06	/* Signal Selection */
++#define CS4245_GAIN_B	0x07	/* PGA Channel B Gain Control */
++#define CS4245_GAIN_A	0x08	/* PGA Channel A Gain Control */
++#define CS4245_ANALOG_IN	0x09	/* Analog Input Control */
++#define CS4245_VOLA	0x0a	/* DAC Channel A Volume Control */
++#define CS4245_VOLB	0x0b	/* DAC Channel B Volume Control */
++#define CS4245_DACC2	0x0c	/* DAC Control 2 */
++#define CS4245_INTS	0x0d	/* Interrupt Status */
++#define CS4245_INTM	0x0e	/* Interrupt Mask */
++#define CS4245_INTMOM	0x0f	/* Interrupt Mode MSB */
++#define CS4245_INTMOL	0x10	/* Interrupt Mode LSB */
++
++#define CS4245_FIRSTREG	0x01
++#define CS4245_LASTREG	0x10
++#define CS4245_NUMREGS	(CS4245_LASTREG - CS4245_FIRSTREG + 1)
++
++/* Bit masks for the CS4245 registers */
++#define CS4245_CHIPID_ID	0xF0
++#define CS4245_CHIPID_REV	0x0F
++#define CS4245_PWRCTL_FREEZE	0x80
++#define CS4245_PWRCTL_PDN_ADC	0x04
++#define CS4245_PWRCTL_PDN_DAC	0x02
++#define CS4245_PWRCTL_PDN	0x01
++
++#define CS4245_DACC1_MASTER	0x01
++#define CS4245_DACC1_MODE_1X	0x00
++#define CS4245_DACC1_MODE_2X	0x40
++#define CS4245_DACC1_MODE_4X	0x80
++
++#define CS4245_DACC1_FORMAT_LJ	0x00
++#define CS4245_DACC1_FORMAT_I2S	0x10
++#define CS4245_DACC1_FORMAT_R16	0x20
++#define CS4245_DACC1_FORMAT_R24	0x30
++#define CS4245_DACC1_FORMAT_MASK 0xf0
++
++#define CS4245_ADC_MASTER	0x01
++#define CS4245_ADC_FORMAT_MASK	0xf0
++#define CS4245_ADC_FORMAT_LJ	0x00
++#define CS4245_ADC_FORMAT_I2S	0x10
++#define CS4245_ADC_FORMAT_R16	0x20
++#define CS4245_ADC_FORMAT_R24	0x30
++
++
++
++#define CS4245_MCLK_DIV1	(0<<0)		/* MCLK DIV 1 */
++#define CS4245_MCLK_DIV15	(1<<0)		/* MCLK DIV 1.5 */
++#define CS4245_MCLK_DIV2	(2<<0)		/* MCLK DIV 2 */
++#define CS4245_MCLK_DIV3	(3<<0)		/* MCLK DIV 3 */
++#define CS4245_MCLK_DIV4	(4<<0)		/* MCLK DIV 4 */
++
++/*
++ * The ASoC codec DAI structure for the CS4270.  Assign this structure to
++ * the .codec_dai field of your machine driver's snd_soc_dai_link structure.
++ */
++extern struct snd_soc_dai cs4245_dai;
++
++/*
++ * The ASoC codec device structure for the CS4270.  Assign this structure
++ * to the .codec_dev field of your machine driver's snd_soc_device
++ * structure.
++ */
++extern struct snd_soc_codec_device soc_codec_device_cs4245;
++
++#endif
+--- linux-2.6.27.21/sound/soc/xxsvideo/Kconfig	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/sound/soc/xxsvideo/Kconfig	2009-11-20 05:23:42.000000000 +0000
+@@ -0,0 +1,36 @@
++config SND_XXSVIDEO_AC97
++	tristate
++#	select SND_AC97_CODEC
++
++config SND_XXSVIDEO_SOC_AC97
++	tristate
++	select AC97_BUS
++#	select SND_SOC_AC97_BUS
++
++config SND_XXSVIDEO_SOC_I2S
++	tristate
++
++config SND_XXSVIDEO_ALSA_SOC
++	tristate "SoC Audio for mycable XXSvideo/-D kits"
++	depends on (MACH_XXSVIDEO || MACH_XXSVIDEOD) && SND_SOC
++	select SND_PCM
++#	select SND_SOC_CS4245
++	help
++	  Say Y or M if you want to add support for codecs attached to
++	  the Jade/Jade-D I2S interface. You will also need to select the 
++	  audio interfaces to support below.
++
++config SND_XXSVIDEO_ALSA_SOC_I2S
++	tristate
++
++config SND_XXSVIDEO_ALSA_EVALKIT_CS4245
++	tristate "SoC Audio for mycable XXSvideo/-D kits - CS4245"
++	depends on SND_XXSVIDEO_ALSA_SOC && \
++	           (MACH_XXSVIDEO_EVALKIT_VIDEOIN || MACH_XXSVIDEOD_EVALKIT)
++	select SND_XXSVIDEO_ALSA_SOC_I2S
++	select SND_SOC_CS4245
++	help
++	  Say Y or M if you want to add support for the CS4245 codec on 
++	  mycable's Jade Evaluation Kit (Extension Video Input board) or 
++	  Jade-D Evaluation Kit (Interface Adapter board).
++
+--- linux-2.6.27/sound/soc/xxsvideo/Makefile	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/sound/soc/xxsvideo/Makefile	2009-01-08 10:49:38.000000000 +0100
+@@ -0,0 +1,15 @@
++# XXSvideo Platform Support
++# XXSvideo Platform Support
++snd-soc-xxsvideo-objs := xxsvideo-pcm.o
++snd-soc-xxsvideo-i2s-objs := xxsvideo-i2s.o
++# snd-soc-s3c2443-ac97-objs := s3c2443-ac97.o
++
++obj-$(CONFIG_SND_XXSVIDEO_ALSA_SOC) += snd-soc-xxsvideo.o
++obj-$(CONFIG_SND_XXSVIDEO_ALSA_SOC_I2S) += snd-soc-xxsvideo-i2s.o
++# obj-$(CONFIG_SND_S3C2443_SOC_AC97) += snd-soc-s3c2443-ac97.o
++
++# Jade Evalkit Machine Support
++snd-soc-evalkit-cs4245-objs := evalkit_cs4245.o
++snd-soc-cs4245-objs := cs4245.o
++
++obj-$(CONFIG_SND_XXSVIDEO_ALSA_EVALKIT_CS4245) += snd-soc-evalkit-cs4245.o
+--- linux-2.6.27.21/sound/soc/xxsvideo/evalkit_cs4245.c	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/sound/soc/xxsvideo/evalkit_cs4245.c	2009-11-27 09:39:34.000000000 +0000
+@@ -0,0 +1,302 @@
++/*
++ * evalkit_cs4245.c  --  SoC audio for Jade Evalkit
++ *
++*  Copyright (C) 2008 mycable GmbH
++ *       Alexander Bigga <linux@bigga.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++*/
++
++#include <linux/module.h>
++#include <linux/moduleparam.h>
++#include <linux/timer.h>
++#include <linux/interrupt.h>
++#include <linux/platform_device.h>
++#include <linux/i2c.h>
++#include <sound/core.h>
++#include <sound/pcm.h>
++#include <sound/soc.h>
++#include <sound/soc-dapm.h>
++#include <asm/gpio.h>
++
++#include <asm/mach-types.h>
++
++#include <mach/hardware.h>
++#include <mach/audio.h>
++#include <asm/io.h>
++
++#include "../codecs/cs4245.h"
++
++#include "xxsvideo-pcm.h"
++#include "xxsvideo-i2s.h"
++
++/* define the scenarios */
++#define NEO_AUDIO_OFF			0
++#define NEO_STEREO_TO_SPEAKERS		4
++
++
++static struct snd_soc_machine jade_evalkit;
++
++static int evalkit_hw_params(struct snd_pcm_substream *substream,
++	struct snd_pcm_hw_params *params)
++{
++	struct snd_soc_pcm_runtime *rtd = substream->private_data;
++	struct snd_soc_dai *codec_dai = rtd->dai->codec_dai;
++	unsigned int pll_out = 0;
++	int ret = 0;
++
++	switch (params_rate(params)) {
++		case 12000:
++		case 16000:
++		case 24000:
++		case 32000:
++		case 48000:
++		case 64000:
++		case 96000:
++		case 128000:
++		case 192000:
++			pll_out = 12288000;
++			printk("/ab/%s rate %d, pll_out %d\n", __func__, params_rate(params), pll_out);
++			break;
++		default:	/* very funny */
++			pll_out = 12288000;
++			printk("/ab/%s no rate found, but continue anyway ... rate %d, pll_out %d\n", __func__, params_rate(params), pll_out);
++			break;
++		}
++
++	/*
++	* set codec DAI (Digital Audio Interface) configuration
++	* --> include/sound/soc.h
++	*/
++	ret = codec_dai->dai_ops.set_fmt(codec_dai,
++		SND_SOC_DAIFMT_I2S /* I2S mode */ | 
++		SND_SOC_DAIFMT_NB_NF  /* normal bclk + frm */ | 
++		SND_SOC_DAIFMT_CBM_CFS /* codec clk master & frame slave */ );
++	if (ret < 0)
++		return ret;
++
++	/* set the codec system clock for DAC and ADC */
++	ret = codec_dai->dai_ops.set_sysclk(codec_dai, CS4245_MCLK, pll_out,
++		SND_SOC_CLOCK_IN);
++	if (ret < 0)
++		return ret;
++
++	return 0;
++}
++
++static int evalkit_hw_free(struct snd_pcm_substream *substream)
++{
++	/* nothing to do */
++	return 0;
++}
++
++/*
++ * Jade Evalkit CS4245 HiFi DAI opserations.
++ */
++static struct snd_soc_ops evalkit_hifi_ops = {
++	.hw_params = evalkit_hw_params,
++	.hw_free = evalkit_hw_free,
++};
++
++static int evalkit_scenario = 0;
++
++static int evalkit_get_scenario(struct snd_kcontrol *kcontrol,
++	struct snd_ctl_elem_value *ucontrol)
++{
++	ucontrol->value.integer.value[0] = evalkit_scenario;
++	return 0;
++}
++
++static int set_scenario_endpoints(struct snd_soc_codec *codec, int scenario)
++{
++	switch(evalkit_scenario) {
++	case NEO_AUDIO_OFF:
++		snd_soc_dapm_disable_pin(codec, "Audio Out");
++		snd_soc_dapm_disable_pin(codec, "Headset Mic");
++		snd_soc_dapm_disable_pin(codec, "Call Mic");
++		break;
++	case NEO_STEREO_TO_SPEAKERS:
++		snd_soc_dapm_enable_pin(codec, "Audio Out");
++		snd_soc_dapm_disable_pin(codec, "Headset Mic");
++		snd_soc_dapm_disable_pin(codec, "Call Mic");
++		break;
++	default:
++		snd_soc_dapm_disable_pin(codec, "Audio Out");
++		snd_soc_dapm_disable_pin(codec, "Headset Mic");
++		snd_soc_dapm_disable_pin(codec, "Call Mic");
++	}
++
++	snd_soc_dapm_sync(codec);
++
++	return 0;
++}
++
++static int evalkit_set_scenario(struct snd_kcontrol *kcontrol,
++	struct snd_ctl_elem_value *ucontrol)
++{
++	struct snd_soc_codec *codec = snd_kcontrol_chip(kcontrol);
++
++	printk("/ab/%s: ucontrol->value.integer.value[0] %d\n", __func__, ucontrol->value.integer.value[0]);
++	if (evalkit_scenario == ucontrol->value.integer.value[0])
++		return 0;
++
++	evalkit_scenario = ucontrol->value.integer.value[0];
++// 	printk("/ab/%s: evalkit_scenario %d\n", __func__, evalkit_scenario);
++	set_scenario_endpoints(codec, evalkit_scenario);
++	return 1;
++}
++
++static const struct snd_soc_dapm_widget cs4245_dapm_widgets[] = {
++	SND_SOC_DAPM_LINE("Audio Out", NULL),
++	SND_SOC_DAPM_MIC("Headset Mic", NULL),
++	SND_SOC_DAPM_MIC("Call Mic", NULL),
++};
++
++
++// static const struct snd_soc_dapm_route dapm_routes[] = {
++// 
++// 	/* Connections to */
++// 	{"Audio Out", NULL, "LOUT1"},
++// 	{"Audio Out", NULL, "ROUT1"},
++// 
++// 	/* Connect the ALC pins */
++// // 	{"ACIN", NULL, "ACOP"},
++// 
++// 	{NULL, NULL, NULL},
++// };
++
++static const char *neo_scenarios[] = {
++	"Off",
++	"Speakers",
++	"Headphones",
++};
++
++static const struct soc_enum evalkit_scenario_enum[] = {
++	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(neo_scenarios),neo_scenarios),
++};
++
++static const struct snd_kcontrol_new cs4245_evalkit_controls[] = {
++	SOC_ENUM_EXT("Jade Evalkit Mode", evalkit_scenario_enum[0],
++		evalkit_get_scenario, evalkit_set_scenario),
++};
++
++/*
++ * This is an example machine initialisation for a cs4245 connected to a
++ * jade_evalkit II. It is missing logic to detect hp/mic insertions and logic
++ * to re-route the audio in such an event.
++ */
++static int evalkit_cs4245_init(struct snd_soc_codec *codec)
++{
++	int i, err;
++
++// 	printk("/ab/1 %s\n", __func__);
++
++	/* set up NC codec pins */
++// 	snd_soc_dapm_set_endpoint(codec, "LOUT2", 0);
++// 	snd_soc_dapm_set_endpoint(codec, "ROUT2", 0);
++// 	snd_soc_dapm_set_endpoint(codec, "OUT3",  0);
++// 	snd_soc_dapm_set_endpoint(codec, "OUT4",  0);
++// 	snd_soc_dapm_set_endpoint(codec, "LINE1", 0);
++// 	snd_soc_dapm_set_endpoint(codec, "LINE2", 0);
++
++	/* set endpoints to default mode */
++// 	set_scenario_endpoints(codec, NEO_AUDIO_OFF);
++// 	set_scenario_endpoints(codec, NEO_STEREO_TO_SPEAKERS);
++
++	/* Add jade_evalkit specific widgets */
++	for (i = 0; i < ARRAY_SIZE(cs4245_dapm_widgets); i++)
++		snd_soc_dapm_new_control(codec, &cs4245_dapm_widgets[i]);
++
++#if 0
++	/* add jade_evalkit specific controls */
++	for (i = 0; i < ARRAY_SIZE(cs4245_evalkit_controls); i++) {
++		printk("/ab/2 %s snd_ctl_add %i\n", __func__, i);
++		err = snd_ctl_add(codec->card,
++				snd_soc_cnew(&cs4245_evalkit_controls[i],
++				codec, NULL));
++		if (err < 0)
++			return err;
++	}
++#endif
++#if 0
++// what good for?
++        /* set up jade_evalkit specific audio routes */
++        err = snd_soc_dapm_add_routes(codec, dapm_routes,
++                                      ARRAY_SIZE(dapm_routes));
++
++	snd_soc_dapm_sync(codec);
++#endif
++	return 0;
++}
++
++/*
++ * BT Codec DAI
++ */
++/* Hifi Playback - for similatious use with voice below */
++static struct snd_soc_dai_link evalkit_dai = {
++	.name = "CS4245",
++	.stream_name = "CS4245 Stream",
++	.cpu_dai = &xxsvideo_i2s_dai,
++	.codec_dai = &cs4245_dai,
++	.init = evalkit_cs4245_init,
++	.ops = &evalkit_hifi_ops,	// /ab/ disabled ... good idea?. NO! --> cs4245 Anbindung
++};
++
++static struct snd_soc_machine jade_evalkit = {
++	.name = "jade_evalkit",
++	.dai_link = &evalkit_dai,
++	.num_links = 1,
++};
++
++static struct snd_soc_device evalkit_snd_devdata = {
++	.machine = &jade_evalkit,
++	.platform = &xxsvideo_soc_platform,
++	.codec_dev = &soc_codec_device_cs4245,
++//  	.codec_data = &evalkit_wm8753_setup,
++};
++
++static struct platform_device *evalkit_snd_device;
++
++static int __init evalkit_init(void)
++{
++	int ret;
++
++#ifdef CONFIG_MACH_XXSVIDEO_EVALKIT_VIDEOIN
++	/* get codec out of reset()... */
++	xxsvideo_ioexpander_set_io(224, 1);
++	/* enable I2S (default)... */
++	xxsvideo_ioexpander_set_io(223, 0);
++#endif /* CONFIG_MACH_XXSVIDEO_EVALKIT_VIDEOIN */
++
++	evalkit_snd_device = platform_device_alloc("soc-audio", -1);
++	if (!evalkit_snd_device)
++		return -ENOMEM;
++
++	platform_set_drvdata(evalkit_snd_device, &evalkit_snd_devdata);
++
++	evalkit_snd_devdata.dev = &evalkit_snd_device->dev;
++
++	ret = platform_device_add(evalkit_snd_device);
++	if (ret) {
++		platform_device_put(evalkit_snd_device);
++	}
++
++	return ret;
++}
++
++static void __exit evalkit_exit(void)
++{
++	platform_device_unregister(evalkit_snd_device);
++}
++
++
++module_init(evalkit_init);
++module_exit(evalkit_exit);
++
++/* Module information */
++MODULE_AUTHOR("Alexander Bigga <linux@bigga.de>, mycable GmbH www.mycable.de");
++MODULE_DESCRIPTION("ALSA SoC Jade Evalkit using CS4245 audio codec");
++MODULE_LICENSE("GPL");
+--- linux-2.6.27.21/sound/soc/xxsvideo/xxsvideo-i2s.c	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.27.21-dev/sound/soc/xxsvideo/xxsvideo-i2s.c	2009-11-12 15:14:34.000000000 +0000
+@@ -0,0 +1,551 @@
++/*
++ * xxsvideo-i2s.c  --  ALSA Soc Audio Layer
++ *
++ *  Copyright (C) 2008 mycable GmbH
++ *       Alexander Bigga <linux@bigga.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++*/
++
++#include <linux/init.h>
++#include <linux/module.h>
++#include <linux/device.h>
++#include <linux/delay.h>
++#include <linux/clk.h>
++#include <linux/platform_device.h>
++#include <linux/interrupt.h>
++
++#include <sound/core.h>
++#include <sound/pcm.h>
++#include <sound/pcm_params.h>
++#include <sound/initval.h>
++#include <sound/soc.h>
++
++
++#include <mach/hardware.h>
++#include <asm/io.h>
++#include <mach/audio.h>
++#include <asm/dma.h>
++#include <mach/dma.h>
++
++#include "xxsvideo-pcm.h"
++#include "xxsvideo-i2s.h"
++
++
++// #define printk(x...)
++
++#define DEFAULT_I2S_INTCNT 0x013f0000
++
++/* ------------------------------------------------------------------------- */
++
++#define S3C24XX_I2S_DEBUG 0
++#if S3C24XX_I2S_DEBUG
++#define DBG(x...) DBG(KERN_ERR x)
++#else
++#define DBG(x...)
++#endif
++
++static unsigned int irq_counter=0;
++
++static inline void
++i2s_wrreg(unsigned long val, void __iomem *reg)
++{
++// 	DBG("writing %08x to register %08x\n",(unsigned int)val, (unsigned int)reg);
++	writel(val, reg);
++}
++
++
++static struct xxsvideo_dma_client s3c24xx_dma_client_out = {
++	.name = "I2S PCM Stereo out"
++};
++
++static struct xxsvideo_dma_client s3c24xx_dma_client_in = {
++	.name = "I2S PCM Stereo in"
++};
++
++static struct xxsvideo_pcm_dma_params xxsvideo_i2s_pcm_stereo_out = {
++	.client		= &s3c24xx_dma_client_out,
++	.channel	= DMACH_I2S1_OUT,
++	.dma_addr	= JADE_I2S1_PHYS_BASE + JADE_I2S_TXFDAT,
++	.dma_size	= 4,
++};
++
++static struct xxsvideo_pcm_dma_params xxsvideo_i2s_pcm_stereo_in = {
++	.client		= &s3c24xx_dma_client_in,
++	.channel	= DMACH_I2S1_IN,
++	.dma_addr	= JADE_I2S1_PHYS_BASE + JADE_I2S_RXFDAT,
++	.dma_size	= 4,
++};
++
++struct xxsvideo_i2s_info {
++	void __iomem	*regs;
++	struct clk	*iis_clk;
++	unsigned int	irq;
++};
++static struct xxsvideo_i2s_info xxsvideo_i2s;
++
++static irqreturn_t i2s_isr(int irq, void *dev_id)
++{
++//	u32 cntreg;
++//	u32 oprreg;
++	u32 status_reg;
++//	u32 *tx;
++	status_reg = readl(xxsvideo_i2s.regs + JADE_I2S_STATUS);
++
++	irq_counter++;
++
++	/* release IRQ */
++	i2s_wrreg(0xffff0000, xxsvideo_i2s.regs + JADE_I2S_STATUS);
++// 	i2s_wrreg(0x10000000, xxsvideo_i2s.regs + JADE_I2S_STATUS);
++
++	return IRQ_HANDLED; // IRQ_NONE
++}
++
++static void xxsvideo_i2s_snd_txctrl(int on)
++{
++	u32 cntreg;
++//	u32 status;
++	u32 dmaact;
++	u32 oprreg;
++
++	cntreg = readl(xxsvideo_i2s.regs + JADE_I2S_CNTREG );
++	dmaact = readl(xxsvideo_i2s.regs + JADE_I2S_DMAACT);
++	oprreg = readl(xxsvideo_i2s.regs + JADE_I2S_OPRREG);
++
++	if (on) {
++
++		cntreg  &= ~I2S_CNTREG_TXDIS;
++		i2s_wrreg(cntreg, xxsvideo_i2s.regs + JADE_I2S_CNTREG);
++
++		/*
++		   Necessary at this point for first activation of block.
++		   After every i2s interrupt the DMAACT flag is set to zero.
++		   Reactivation in i2s_isr.
++		*/
++		if (!(cntreg & I2S_CNTREG_TXDIS)) {
++			dmaact  |= I2S_DMAACT_TDMACT;
++			i2s_wrreg(dmaact, xxsvideo_i2s.regs + JADE_I2S_DMAACT);
++		}
++
++		DBG("/ab/%s ON: cntreg: %ux dmaact: %ux oprreg: %ux\n", __func__, cntreg, dmaact, oprreg);
++
++	} else {
++
++		cntreg  |= I2S_CNTREG_TXDIS;
++		i2s_wrreg(cntreg, xxsvideo_i2s.regs + JADE_I2S_CNTREG);
++
++/*		oprreg  &= ~JADE_I2S_OPRREG_START;
++		i2s_wrreg(oprreg, xxsvideo_i2s.regs + JADE_I2S_OPRREG);
++*/
++		DBG("/ab/%s OFF: cntreg: %lx dmaact: %lx oprreg: 0x%lx\n", __func__, cntreg, dmaact, oprreg);
++
++	}
++
++}
++
++static void xxsvideo_i2s_snd_rxctrl(int on)
++{
++//	u32 iisfcon;
++//	u32 iiscon;
++//	u32 iismod;
++
++// 	printk("not implemented yet! %s\n", __FUNCTION__);
++
++
++	if (on) {
++
++	} else {
++
++	}
++}
++
++/*
++ * Set S3C24xx I2S DAI format
++ */
++static int xxsvideo_i2s_set_fmt(struct snd_soc_dai *dai,
++		unsigned int fmt)
++{
++	u32 cntreg;
++
++	cntreg = readl(xxsvideo_i2s.regs + JADE_I2S_CNTREG);
++	DBG("hw_params r: CNTREG: %lx \n", cntreg);
++
++	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
++	case SND_SOC_DAIFMT_CBM_CFM:
++		DBG("/ab/%s --> codec is master, cpu is slave CNTREG: %lx\n", __func__, cntreg);
++		break;
++	case SND_SOC_DAIFMT_CBS_CFS:
++		cntreg |= I2S_CNTREG_MSMD;
++		DBG("/ab/%s --> codec is slave, cpu is master, CNTREG: %lx\n", __func__, cntreg);
++		break;
++	default:
++		return -EINVAL;
++	}
++
++	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
++	case SND_SOC_DAIFMT_I2S:
++		break;
++	default:
++		return -EINVAL;
++	}
++
++	i2s_wrreg(cntreg, xxsvideo_i2s.regs + JADE_I2S_CNTREG);
++
++	return 0;
++}
++
++static int xxsvideo_i2s_hw_params(struct snd_pcm_substream *substream,
++				struct snd_pcm_hw_params *params)
++{
++	struct snd_soc_pcm_runtime *rtd = substream->private_data;
++	u32 cntreg;
++
++	DBG("Entered %s\n", __FUNCTION__);
++
++	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
++		DBG("/ab/%s: --> xxsvideo_i2s_pcm_stereo_out\n", __func__);
++		rtd->dai->cpu_dai->dma_data = &xxsvideo_i2s_pcm_stereo_out;
++	}
++	else {
++		DBG("/ab/%s: --> xxsvideo_i2s_pcm_stereo_in\n", __func__);
++		rtd->dai->cpu_dai->dma_data = &xxsvideo_i2s_pcm_stereo_in;
++	}
++
++	/* Working copies of register */
++	cntreg = readl(xxsvideo_i2s.regs + JADE_I2S_CNTREG);
++	DBG("hw_params r: CNTREG: %lx from 0x%lx\n", cntreg, xxsvideo_i2s.regs + JADE_I2S_CNTREG);
++
++	switch (params_format(params)) {
++	case SNDRV_PCM_FORMAT_S8:
++		DBG("/ab/%s: --> SNDRV_PCM_FORMAT_S8? WHAT TODO?\n", __func__);
++		break;
++	case SNDRV_PCM_FORMAT_S16_LE:
++		DBG("/ab/%s: --> SNDRV_PCM_FORMAT_S16_LE? WHAT TODO?\n", __func__);
++// 		iismod |= S3C2410_IISMOD_16BIT;
++		break;
++	}
++
++// 	dump_i2s_regs();
++// 	i2s_wrreg(iismod, xxsvideo_i2s.regs + S3C2410_IISMOD);
++// 	DBG("hw_params w: IISMOD: %lx to 0x%lx\n", iismod, xxsvideo_i2s.regs + S3C2410_IISMOD);
++	return 0;
++}
++
++ static int xxsvideo_i2s_startup(struct snd_pcm_substream *substream)
++{
++        struct snd_soc_pcm_runtime *rtd = substream->private_data;
++//         struct snd_soc_cpu_dai *cpu_dai = rtd->dai->cpu_dai;
++
++	DBG("Entered %s\n", __FUNCTION__);
++
++	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
++		DBG("/ab/%s: --> xxsvideo_i2s_pcm_stereo_out\n", __func__);
++		rtd->dai->cpu_dai->dma_data = &xxsvideo_i2s_pcm_stereo_out;
++
++		i2s_wrreg(I2S_OPRREG_TXENB | I2S_OPRREG_START, xxsvideo_i2s.regs + JADE_I2S_OPRREG);
++	}
++	else {
++		DBG("/ab/%s: --> xxsvideo_i2s_pcm_stereo_in\n", __func__);
++		rtd->dai->cpu_dai->dma_data = &xxsvideo_i2s_pcm_stereo_in;
++
++		i2s_wrreg(I2S_OPRREG_RXENB | I2S_OPRREG_START, xxsvideo_i2s.regs + JADE_I2S_OPRREG);
++	}
++//         cpu_dai->dma_data = dev->dma_params[substream->stream];
++
++        return 0;
++}
++
++static int xxsvideo_i2s_trigger(struct snd_pcm_substream *substream, int cmd)
++{
++	int ret = 0;
++	int capture = (substream->stream == SNDRV_PCM_STREAM_CAPTURE);
++	unsigned long irqs;
++
++	DBG("Entered %s\n", __FUNCTION__);
++
++	switch (cmd) {
++	case SNDRV_PCM_TRIGGER_START:
++		DBG("/ab/%s SNDRV_PCM_TRIGGER_START\n", __func__);
++		local_irq_save(irqs);
++		if (capture) {
++// 			xxsvideo_i2s_ctrl(I2S_CMD_FLUSH_RXFIFO);
++			xxsvideo_i2s_ctrl(I2S_CMD_RDMACT);
++// 			xxsvideo_i2s_snd_rxctrl(1);
++		}
++		else {
++// 			xxsvideo_i2s_ctrl(I2S_CMD_FLUSH_TXFIFO);
++// 			xxsvideo_i2s_ctrl(I2S_CMD_TDMACT);
++ 			xxsvideo_i2s_snd_txctrl(1);
++		}
++		xxsvideo_i2s_ctrl(I2S_CMD_START);	
++		local_irq_restore(irqs);
++		/* On start, ensure that the FIFOs are cleared and reset. */
++		/* TBD */
++		break;
++
++	case SNDRV_PCM_TRIGGER_STOP:
++		DBG("/ab/%s SNDRV_PCM_TRIGGER_STOP\n", __func__);
++		local_irq_save(irqs);
++		if (capture) {
++			xxsvideo_i2s_ctrl(I2S_CMD_FLUSH_RXFIFO);
++// 			xxsvideo_i2s_snd_rxctrl(0);
++		}
++		else {
++//  			xxsvideo_i2s_ctrl(I2S_CMD_FLUSH_TXFIFO);
++			DBG("/ab/%s SNDRV_PCM_TRIGGER_STOP else\n", __func__);
++ 			xxsvideo_i2s_snd_txctrl(0);
++		}
++		xxsvideo_i2s_ctrl(I2S_CMD_STOP);
++		local_irq_restore(irqs);
++// 		DBG("/ab/%s SNDRV_PCM_TRIGGER_STOP END\n", __func__);
++		break;
++	default:
++		ret = -EINVAL;
++		break;
++	}
++
++//exit_err:
++	return ret;
++}
++
++/*
++ * Set  Clock source
++ */
++static int xxsvideo_i2s_set_sysclk(struct snd_soc_dai *dai,
++	int clk_id, unsigned int freq, int dir)
++{
++	printk("Entered %s TODO??\n", __FUNCTION__);
++
++	return 0;
++}
++
++/*
++ * Set  Clock dividers
++ */
++static int xxsvideo_i2s_set_clkdiv(struct snd_soc_dai *dai,
++	int div_id, int div)
++{
++	printk("Entered %s TODO??\n", __FUNCTION__);
++
++	return 0;
++
++}
++
++/*
++ * To avoid duplicating clock code, allow machine driver to
++ * get the clockrate from here.
++ */
++// u32 xxsvideo_i2s_get_clockrate(void)
++// {
++// 	return 0;
++// 	//clk_get_rate(xxsvideo_i2s.iis_clk);
++// }
++// EXPORT_SYMBOL_GPL(xxsvideo_i2s_get_clockrate);
++
++/*
++ * flush fifo, stop i2s
++ */
++u32 xxsvideo_i2s_ctrl(unsigned int cmd)
++{
++	int reg;
++
++	switch (cmd) {
++	case I2S_CMD_START:
++		reg = __raw_readl(xxsvideo_i2s.regs + JADE_I2S_OPRREG);
++		i2s_wrreg( reg | I2S_OPRREG_START | I2S_OPRREG_TXENB, xxsvideo_i2s.regs + JADE_I2S_OPRREG);
++		DBG("/ab/%s I2S_CMD_START, 0x%x --> 0x%x (OPRREG)\n", __func__, (reg | I2S_OPRREG_START | I2S_OPRREG_TXENB), xxsvideo_i2s.regs + JADE_I2S_OPRREG);
++
++		break;
++	case I2S_CMD_STOP:
++		reg = __raw_readl(xxsvideo_i2s.regs + JADE_I2S_OPRREG);
++		i2s_wrreg( reg & ~I2S_OPRREG_START, xxsvideo_i2s.regs + JADE_I2S_OPRREG);
++		DBG("/ab/%s I2S_CMD_STOP, 0x%x --> 0x%x (OPRREG)\n", __func__, (reg & ~I2S_OPRREG_START), xxsvideo_i2s.regs + JADE_I2S_OPRREG);
++		break;
++	case I2S_CMD_FLUSH_TXFIFO:
++		reg = __raw_readl(xxsvideo_i2s.regs + JADE_I2S_OPRREG);
++		i2s_wrreg(reg & ~I2S_OPRREG_TXENB, xxsvideo_i2s.regs + JADE_I2S_OPRREG);
++		DBG("/ab/%s I2S_CMD_FLUSH_TXFIFO\n", __func__);
++		break;
++	case I2S_CMD_FLUSH_RXFIFO:
++		reg = __raw_readl(xxsvideo_i2s.regs + JADE_I2S_OPRREG);
++		i2s_wrreg(reg & ~I2S_OPRREG_RXENB, xxsvideo_i2s.regs + JADE_I2S_OPRREG);
++		break;
++	case I2S_CMD_TDMACT:
++		reg = __raw_readl(xxsvideo_i2s.regs + JADE_I2S_DMAACT);
++		i2s_wrreg( reg | I2S_DMAACT_TDMACT, xxsvideo_i2s.regs + JADE_I2S_DMAACT);
++		DBG("/ab/%s I2S_TDMACT DMAACT 0x%x\n", __func__, (reg | I2S_DMAACT_TDMACT));
++		break;
++	case I2S_CMD_RDMACT:
++		reg = __raw_readl(xxsvideo_i2s.regs + JADE_I2S_DMAACT);
++		i2s_wrreg( reg | I2S_DMAACT_RDMACT, xxsvideo_i2s.regs + JADE_I2S_DMAACT);
++		break;
++	default:
++		return -EINVAL;
++	}
++	return 0;
++}
++EXPORT_SYMBOL_GPL(xxsvideo_i2s_ctrl);
++
++static int xxsvideo_i2s_remove(struct platform_device *pdev)
++{
++	xxsvideo_i2s_ctrl(I2S_CMD_STOP);
++
++	i2s_wrreg( 0, xxsvideo_i2s.regs + JADE_I2S_INTCNT);
++	free_irq(xxsvideo_i2s.irq, NULL);
++
++	/* do software reset of I2S macro */
++	i2s_wrreg(0x00000001, xxsvideo_i2s.regs + JADE_I2S_SRST);
++	while ((__raw_readl(xxsvideo_i2s.regs + JADE_I2S_SRST) & 0x00000001) == 0x00000001 )
++		;
++
++	return 0;
++}
++
++static int xxsvideo_i2s_probe(struct platform_device *pdev)
++{
++	int ret = 0;
++	struct resource *r;
++	struct xxsvideo_i2s *pdata;
++
++	pdata = pdev->dev.platform_data;
++
++	DBG("Entered %s\n", __func__);
++
++	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	if (!r) {
++		ret = -ENXIO;
++		goto err_out;
++	}
++
++	xxsvideo_i2s.regs = (void __iomem *) r->start;
++	if (xxsvideo_i2s.regs == NULL)
++		return -ENXIO;
++
++	r = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
++	if (!r) {
++		ret = -ENXIO;
++		goto err_out;
++	}
++	xxsvideo_i2s.irq = (unsigned int) r->start;
++
++	/* DMA parameters */
++
++	r = platform_get_resource(pdev, IORESOURCE_DMA, 0);
++	if (!r) {
++		ret = -ENXIO;
++		goto err_out;
++	}
++	xxsvideo_i2s_pcm_stereo_out.channel = r->start;
++
++	r = platform_get_resource(pdev, IORESOURCE_DMA, 1);
++	if (!r) {
++		ret = -ENXIO;
++		goto err_out;
++	}
++	xxsvideo_i2s_pcm_stereo_in.channel = r->start;
++
++	r = platform_get_resource(pdev, IORESOURCE_MEM, 1);
++	if (!r) {
++		ret = -ENXIO;
++		goto err_out;
++	}
++	xxsvideo_i2s_pcm_stereo_out.dma_addr = r->start + JADE_I2S_TXFDAT;
++	xxsvideo_i2s_pcm_stereo_in.dma_addr = r->start + JADE_I2S_RXFDAT;
++
++	/* setup I2S controller */
++
++	/* perform softreset */
++	i2s_wrreg(0x00000001, xxsvideo_i2s.regs + JADE_I2S_SRST);
++	while ((__raw_readl(xxsvideo_i2s.regs + JADE_I2S_SRST) & 0x00000001) == 0x00000001 )
++		;
++	DBG("softreset completed\n");
++
++	i2s_wrreg(0x00000020 | 1<<11 | 0xb, xxsvideo_i2s.regs + JADE_I2S_CNTREG); // slave operation, RX DIS
++
++	i2s_wrreg(1<<10|0x1f<<5|0x1f<<0, xxsvideo_i2s.regs + JADE_I2S_MCR0REG);
++
++	/* channel no. 1 and 2 */
++	i2s_wrreg(0x00000003, xxsvideo_i2s.regs + JADE_I2S_MCR1REG);
++	/* no sub frames */
++	i2s_wrreg(0x00000000, xxsvideo_i2s.regs + JADE_I2S_MCR2REG);
++
++	/* enable TX only */
++// 	i2s_wrreg(I2S_OPRREG_TXENB | I2S_OPRREG_START, xxsvideo_i2s.regs + JADE_I2S_OPRREG);
++
++  	i2s_wrreg(DEFAULT_I2S_INTCNT | (MYBC << 8), xxsvideo_i2s.regs + JADE_I2S_INTCNT); // DMA XXXab
++
++	xxsvideo_i2s_snd_txctrl(0);
++	xxsvideo_i2s_snd_rxctrl(0);
++
++	if ((ret = request_irq(xxsvideo_i2s.irq, i2s_isr, IRQF_DISABLED, "i2s", NULL)) < 0) {
++		DBG(KERN_ERR	"i2s - failed to attach interrupt\n");
++		return -1;
++	}
++	return 0;
++
++err_out:
++	return ret;
++}
++
++#define XXSVIDEO_I2S_RATES \
++	(SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_11025 | SNDRV_PCM_RATE_16000 | \
++	SNDRV_PCM_RATE_22050 | SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 | \
++	SNDRV_PCM_RATE_48000)
++// | SNDRV_PCM_RATE_88200 | SNDRV_PCM_RATE_96000)
++
++struct snd_soc_dai xxsvideo_i2s_dai = {
++	.name = "xxsvideo-i2s",
++	.id = 0,
++	.type = SND_SOC_DAI_I2S,
++	.playback = {
++		.channels_min = 2,
++		.channels_max = 2,
++		.rates = XXSVIDEO_I2S_RATES,
++		.formats = SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,},
++	.capture = {
++		.channels_min = 2,
++		.channels_max = 2,
++		.rates = XXSVIDEO_I2S_RATES,
++		.formats = SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,},
++	.ops = {
++		.startup = xxsvideo_i2s_startup,
++		.trigger = xxsvideo_i2s_trigger,
++		.hw_params = xxsvideo_i2s_hw_params,},
++	.dai_ops = {
++		.set_fmt = xxsvideo_i2s_set_fmt,
++		.set_clkdiv = xxsvideo_i2s_set_clkdiv,
++		.set_sysclk = xxsvideo_i2s_set_sysclk,
++	},
++};
++EXPORT_SYMBOL_GPL(xxsvideo_i2s_dai);
++
++static struct platform_driver xxsvideo_i2s_driver = {
++        .probe = xxsvideo_i2s_probe,
++        .remove = __devexit_p(xxsvideo_i2s_remove),
++        .driver = {
++                .name = "xxsvideo_i2s",
++                .owner = THIS_MODULE,
++        },
++};
++
++static int __init xxsvideo_i2s_init(void)
++{
++        return platform_driver_register(&xxsvideo_i2s_driver);
++}
++
++static void __exit xxsvideo_i2s_exit(void)
++{
++        platform_driver_unregister(&xxsvideo_i2s_driver);
++}
++
++module_init(xxsvideo_i2s_init);
++module_exit(xxsvideo_i2s_exit);
++
++
++/* Module information */
++MODULE_AUTHOR("Alexander Bigga <linux@bigga.de>, mycable GmbH www.mycable.de");
++MODULE_DESCRIPTION("Jade XXSvideo I2S SoC Interface");
++MODULE_LICENSE("GPL");
+--- linux-2.6.27/sound/soc/xxsvideo/xxsvideo-pcm.c	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/sound/soc/xxsvideo/xxsvideo-pcm.c	2009-01-16 11:47:54.000000000 +0100
+@@ -0,0 +1,536 @@
++/*
++ * xxsvideo-pcm.c  --  ALSA SoC audio for Jade Evalkit
++ *
++ *  Copyright (C) 2008 mycable GmbH
++ *       Alexander Bigga <linux@bigga.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++*/
++
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/platform_device.h>
++#include <linux/slab.h>
++#include <linux/dma-mapping.h>
++
++#include <sound/core.h>
++#include <sound/pcm.h>
++#include <sound/pcm_params.h>
++#include <sound/soc.h>
++
++#include <asm/dma.h>
++#include <asm/io.h>
++#include <mach/hardware.h>
++#include <mach/dma.h>
++#include <mach/audio.h>
++
++#include "xxsvideo-pcm.h"
++
++#define XXSVIDEO_PCM_DEBUG 0
++#if XXSVIDEO_PCM_DEBUG
++#define DBG(x...) printk(KERN_ERR x)
++#else
++#define DBG(x...)
++#endif
++
++// #define printk(x...)
++
++static const struct snd_pcm_hardware xxsvideo_pcm_hardware = {
++	.info			= SNDRV_PCM_INFO_INTERLEAVED |
++				    SNDRV_PCM_INFO_BLOCK_TRANSFER |
++				    SNDRV_PCM_INFO_MMAP |
++				    SNDRV_PCM_INFO_MMAP_VALID |
++				    SNDRV_PCM_INFO_PAUSE |
++                                    SNDRV_PCM_INFO_RESUME,
++	.formats		= SNDRV_PCM_FMTBIT_S16_LE, /* SNDRV_PCM_FMTBIT_* */
++				    SNDRV_PCM_FMTBIT_U16_LE |
++				    SNDRV_PCM_FMTBIT_U8 |
++				    SNDRV_PCM_FMTBIT_S8,
++	.channels_min		= 2,
++	.channels_max		= 2,
++	/* max buffer size:
++	  limit ring buffer size; --> affects buf->size in dma and  params_period_size*/
++	.buffer_bytes_max	= 128*1024,
++	/* N periods passen in einen Buffer. Nach jeder Period kommt ein Interrupt.*/
++// 	.buffer_bytes_max	= 256*1024,
++	.period_bytes_min	= PAGE_SIZE,/* min period size < buffer_bytes_max ! */
++	.period_bytes_max	= 4*PAGE_SIZE,/* max period size, not to big! */
++	.periods_min		= 2,		/* min # of periods */
++	.periods_max		= 128,		/* max # of periods; hw dependend */
++//  	.fifo_size		= 16,		/*  fifo size in bytes; not used at all in alsa */
++};
++
++// is found later substream->runtime->private_data:
++struct xxsvideo_runtime_data {
++	spinlock_t lock;
++	int state;
++	unsigned int dma_loaded;
++	unsigned int dma_limit;
++	unsigned int dma_period;
++	dma_addr_t dma_start;
++	dma_addr_t dma_pos;
++	dma_addr_t dma_end;
++	struct xxsvideo_pcm_dma_params *params;
++};
++
++/* xxsvideo_pcm_enqueue
++ *
++ * place a dma buffer onto the queue for the dma system
++ * to handle.
++*/
++static void xxsvideo_pcm_enqueue(struct snd_pcm_substream *substream)
++{
++	struct xxsvideo_runtime_data *prtd = substream->runtime->private_data;
++	dma_addr_t pos = prtd->dma_pos;
++	int ret;
++
++	DBG("Entered %s\n", __FUNCTION__);
++
++	while (prtd->dma_loaded < prtd->dma_limit) {
++		unsigned long len = prtd->dma_period;
++
++		DBG("/ab/%s dma_loaded: %d, pos %p, dma_period==len %d, dma_limit %i\n", __func__, prtd->dma_loaded, pos, len, prtd->dma_limit);
++
++		if ((pos + len) > prtd->dma_end) {
++			len  = prtd->dma_end - pos;
++			DBG(KERN_DEBUG "%s: corrected dma len %ld\n",
++			       __FUNCTION__, len);
++		}
++
++		ret = xxsvideo_dma_enqueue(prtd->params->channel,
++			substream, pos, len);
++
++		if (ret == 0) {
++			prtd->dma_loaded++;
++			pos += prtd->dma_period;
++			if (pos >= prtd->dma_end)
++				pos = prtd->dma_start;
++
++			DBG("%s: new pos is: %p\n", __func__, pos);
++		} else {
++			printk("%s: xxsvideo_dma_enqueue ret %d\n", __func__, ret);
++			break;
++		}
++	}
++
++	prtd->dma_pos = pos;
++}
++
++/* is called after interrupt */
++static void xxsvideo_audio_buffdone(struct xxsvideo_dma_chan *channel,
++				void *dev_id, int size,
++				enum xxsvideo_dma_buffresult result)
++{
++	struct snd_pcm_substream *substream = dev_id;
++	struct xxsvideo_runtime_data *prtd;
++
++	DBG("Entered %s\n", __func__);
++
++
++	if (result == XXSVIDEO_RES_ABORT || result == XXSVIDEO_RES_ERR)
++		return;
++
++	prtd = substream->runtime->private_data;
++
++	if (substream)
++		snd_pcm_period_elapsed(substream);
++
++	spin_lock(&prtd->lock);
++	if (prtd->state & ST_RUNNING) {
++		prtd->dma_loaded--;
++		DBG("/ab/%s: if (prtd->state & ST_RUNNING)\n", __func__);
++		xxsvideo_pcm_enqueue(substream);
++	}
++
++	spin_unlock(&prtd->lock);
++
++	// reactivae i2s
++	// whould be nicer in i2s_isr, but only here it works without noise!
++	xxsvideo_i2s_ctrl(I2S_CMD_TDMACT);
++
++}
++
++static int xxsvideo_pcm_hw_params(struct snd_pcm_substream *substream,
++	struct snd_pcm_hw_params *params)
++{
++	struct snd_pcm_runtime *runtime = substream->runtime;
++	struct xxsvideo_runtime_data *prtd = runtime->private_data;
++	struct snd_soc_pcm_runtime *rtd = substream->private_data;
++	struct xxsvideo_pcm_dma_params *dma_data = rtd->dai->cpu_dai->dma_data;
++	unsigned long totbytes = params_buffer_bytes(params);
++
++	DBG("/ab/%s totbytes 0x%x, params_format(params) 0x%x\n", __func__, totbytes, params_format(params));
++	DBG("/ab/%s params_period_bytes %d =?= \n params_period_size %d * \n snd_pcm_format_physical_width(params_format(p)) %d \n params_channels(p) %d / 8\n", __func__, params_period_bytes(params), params_period_size(params), snd_pcm_format_physical_width(params_format(params)), params_channels(params));
++
++	DBG("/ab/%s params_buffer_bytes %d =?= \n params_buffer_size %d\n", __func__, params_buffer_bytes(params), params_buffer_size(params));
++	
++
++	if (!dma_data) {
++		DBG("/ab/%s no dma_data --> return -ENODEV\n", __func__);
++		return -ENODEV;
++	}
++
++
++	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
++
++	runtime->dma_bytes = totbytes;
++
++	spin_lock_irq(&prtd->lock);
++	prtd->dma_loaded = 0;
++	prtd->dma_limit = runtime->hw.periods_min;
++	prtd->dma_period = params_period_bytes(params);
++	prtd->dma_start = runtime->dma_addr;
++	prtd->dma_pos = prtd->dma_start;
++	prtd->dma_end = prtd->dma_start + totbytes;
++	spin_unlock_irq(&prtd->lock);
++
++	DBG("/ab/%s: end\n", __func__);
++	return 0;
++}
++
++static int xxsvideo_pcm_hw_free(struct snd_pcm_substream *substream)
++{
++	struct xxsvideo_runtime_data *prtd = substream->runtime->private_data;
++
++	DBG("Entered %s\n", __FUNCTION__);
++
++	snd_pcm_set_runtime_buffer(substream, NULL);
++
++	if (prtd->params) {
++		/* ensure DMA flushed */
++		xxsvideo_dma_ctrl(prtd->params->channel, XXSVIDEO_DMAOP_FLUSH);
++		xxsvideo_dma_free(prtd->params->channel, prtd->params->client);
++		prtd->params = NULL;
++	}
++
++	return 0;
++}
++
++static int xxsvideo_pcm_prepare(struct snd_pcm_substream *substream)
++{
++	struct xxsvideo_runtime_data *prtd = substream->runtime->private_data;
++	int ret = 0;
++
++	DBG("Entered %s\n", __FUNCTION__);
++
++	/* flush the DMA channel */
++	/* really important !! */
++	xxsvideo_dma_ctrl(prtd->params->channel, XXSVIDEO_DMAOP_FLUSH);
++
++	/* flush the I2S Fifo */
++	/* not necessary but doesn't hurt */
++// 	xxsvideo_i2s_ctrl(I2S_CMD_FLUSH_TXFIFO);
++
++	prtd->dma_loaded = 0;
++	prtd->dma_pos = prtd->dma_start;
++
++	/* enqueue dma buffers */
++	xxsvideo_pcm_enqueue(substream);
++
++	return ret;
++}
++
++static int xxsvideo_pcm_dma_request(struct snd_pcm_substream *substream)
++{
++	struct xxsvideo_runtime_data *prtd = substream->runtime->private_data;
++	struct snd_soc_pcm_runtime *rtd = substream->private_data;
++	struct xxsvideo_pcm_dma_params *dma_data = rtd->dai->cpu_dai->dma_data;
++	int ret = 0;
++
++	if (!dma_data) {
++		DBG("/ab/%s no dma_data --> return -ENODEV\n", __func__);
++		return -ENODEV;
++	}
++
++	prtd->params = dma_data;
++
++	/* Request master DMA channel */
++	ret = xxsvideo_request_dma(prtd->params->channel,
++					prtd->params->client, NULL);
++
++	DBG("/ab/%s stream is  %d\n", __func__, substream->stream);
++	/* channel needs configuring for mem=>device, increment memory addr,
++	 * sync to pclk, half-word transfers to the IIS-FIFO. */
++	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
++		DBG("/ab/%s SNDRV_PCM_STREAM_PLAYBACK, ch %d, dma_size %d\n", __func__, prtd->params->channel, prtd->params->dma_size);
++
++		xxsvideo_dma_config(prtd->params->channel,
++				prtd->params->dma_size,
++				JADE_DMACAX_IS_DREQH |  /*JADE_DMACAX_ST |*/
++				JADE_DMACAX_BT_NORMAL |
++				(MYBC<<16),
++			JADE_DMACBX_MS_BLOCK | JADE_DMACBX_TW_WORD |
++			JADE_DMACBX_RC |  JADE_DMACBX_RD | /* JADE_DMACBX_RS | */
++			JADE_DMACBX_CI | JADE_DMACBX_EI | JADE_DMACBX_FD /* DMACB */);
++
++		xxsvideo_dma_devconfig(prtd->params->channel,
++				XXSVIDEO_DMASRC_MEM,0, prtd->params->dma_addr);
++
++
++	} else {
++		xxsvideo_dma_config(prtd->params->channel,
++				prtd->params->dma_size,
++				JADE_DMACAX_IS_DREQH | (1<<16),
++			JADE_DMACBX_MS_BLOCK | JADE_DMACBX_TW_WORD |
++			JADE_DMACBX_RC | JADE_DMACBX_RS | JADE_DMACBX_RD | 
++			JADE_DMACBX_CI | JADE_DMACBX_EI | JADE_DMACBX_FD );
++
++		xxsvideo_dma_devconfig(prtd->params->channel,
++					XXSVIDEO_DMASRC_HW, 0x3,
++					prtd->params->dma_addr);
++	}
++
++	xxsvideo_dma_set_buffdone_fn(prtd->params->channel,
++				    xxsvideo_audio_buffdone);
++
++/*	ret = xxsvideo_request_dma(prtd->params->channel, prtd->params->name,
++				  xxsvideo_pcm_dma_irq, substream,
++				  &prtd->master_lch, &tcc, EVENTQ_0);*/
++	return ret;
++}
++
++/*
++order of calling *trigger-functions (soc-core.c):
++  1. codec_trigger
++  2. pcm_trigger
++  3. dai/i2s_trigger
++*/
++static int xxsvideo_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
++{
++	struct xxsvideo_runtime_data *prtd = substream->runtime->private_data;
++	int ret = 0;
++
++	DBG("Entered %s, cmd %i\n", __func__, cmd);
++
++	spin_lock(&prtd->lock);
++
++	switch (cmd) {
++	case SNDRV_PCM_TRIGGER_START:
++		DBG("/ab/%s SNDRV_PCM_TRIGGER_START, cmd 0x%x\n", __func__, cmd);
++		prtd->state |= ST_RUNNING;
++		xxsvideo_dma_ctrl(prtd->params->channel, XXSVIDEO_DMAOP_START);
++		break;
++
++	case SNDRV_PCM_TRIGGER_STOP:
++		DBG("/ab/%s SNDRV_PCM_TRIGGER_STOP, cmd 0x%x\n", __func__, cmd);
++		prtd->state &= ~ST_RUNNING;
++		xxsvideo_dma_ctrl(prtd->params->channel, XXSVIDEO_DMAOP_STOP);
++		break;
++
++	default:
++		spin_unlock(&prtd->lock);
++		ret = -EINVAL;
++		break;
++	}
++
++	spin_unlock(&prtd->lock);
++
++	return ret;
++}
++
++static snd_pcm_uframes_t
++	xxsvideo_pcm_pointer(struct snd_pcm_substream *substream)
++{
++	int capture = (substream->stream == SNDRV_PCM_STREAM_CAPTURE);
++	/* get the current hardware pointer */
++	struct snd_pcm_runtime *runtime = substream->runtime;
++	struct xxsvideo_runtime_data *prtd = runtime->private_data;
++	unsigned long res;
++	dma_addr_t src, dst;
++
++	DBG("Entered %s\n", __FUNCTION__);
++
++	spin_lock(&prtd->lock);
++
++	xxsvideo_dma_getposition(prtd->params->channel, &src, &dst);
++
++	if (capture)
++		res = dst - prtd->dma_start;
++	else
++		res = src - prtd->dma_start;
++
++	spin_unlock(&prtd->lock);
++
++	DBG("/ab/%s Pointer src 0x%x dst 0x%x, res 0x%x,  prtd->dma_start 0x%lx\n", __func__, src, dst, res,  prtd->dma_start);
++#if 1
++	/* we seem to be getting the odd error from the pcm library due
++	 * to out-of-bounds pointers. this is maybe due to the dma engine
++	 * not having loaded the new values for the channel before being
++	 * called... (todo - fix )
++	 */
++
++	if (res >= snd_pcm_lib_buffer_bytes(substream)) {
++		if (res == snd_pcm_lib_buffer_bytes(substream))
++			res = 0;
++	}
++#endif
++
++	return bytes_to_frames(substream->runtime, res);
++}
++
++static int xxsvideo_pcm_open(struct snd_pcm_substream *substream)
++{
++	struct snd_pcm_runtime *runtime = substream->runtime;
++	struct xxsvideo_runtime_data *prtd;
++	int ret = 0;
++
++	DBG("Entered %s\n", __FUNCTION__);
++
++	snd_soc_set_runtime_hwparams(substream, &xxsvideo_pcm_hardware);
++
++	/* ensure that buffer size is a multiple of period size */
++	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
++	if (ret < 0) {
++		DBG("/ab/%s: error buffer size is not multiple of period size!\n", __func__);
++		goto out;
++	}
++
++	prtd = kzalloc(sizeof(struct xxsvideo_runtime_data), GFP_KERNEL);
++	if (prtd == NULL)
++		return -ENOMEM;
++
++	spin_lock_init(&prtd->lock);
++	runtime->private_data = prtd;
++
++	ret = xxsvideo_pcm_dma_request(substream);
++	if (ret) {
++		DBG(KERN_ERR "xxsvideo-pcm: Failed to get dma channels\n");
++		kfree(prtd);
++		goto out;
++	}
++
++out:
++// 	DBG("/ab/%s: END return %i\n", __func__, ret);
++	return ret;
++}
++
++static int xxsvideo_pcm_close(struct snd_pcm_substream *substream)
++{
++	struct snd_pcm_runtime *runtime = substream->runtime;
++	struct xxsvideo_runtime_data *prtd = runtime->private_data;
++
++	DBG("Entered %s\n", __FUNCTION__);
++
++	if (prtd) 
++		kfree(prtd);
++
++	return 0;
++}
++
++static int xxsvideo_pcm_mmap(struct snd_pcm_substream *substream,
++	struct vm_area_struct *vma)
++{
++	struct snd_pcm_runtime *runtime = substream->runtime;
++
++	DBG("Entered %s\n", __FUNCTION__);
++
++	return dma_mmap_writecombine(substream->pcm->card->dev, vma,
++                                     runtime->dma_area,
++                                     runtime->dma_addr,
++                                     runtime->dma_bytes);
++}
++
++static struct snd_pcm_ops xxsvideo_pcm_ops = {
++	.open		= xxsvideo_pcm_open,
++	.close		= xxsvideo_pcm_close,
++	.ioctl		= snd_pcm_lib_ioctl,
++	.hw_params	= xxsvideo_pcm_hw_params,
++	.hw_free	= xxsvideo_pcm_hw_free,
++	.prepare	= xxsvideo_pcm_prepare,
++	.trigger	= xxsvideo_pcm_trigger,
++	.pointer	= xxsvideo_pcm_pointer,
++	.mmap		= xxsvideo_pcm_mmap,
++};
++
++static int s3c24xx_pcm_preallocate_dma_buffer(struct snd_pcm *pcm, int stream)
++{
++	struct snd_pcm_substream *substream = pcm->streams[stream].substream;
++	struct snd_dma_buffer *buf = &substream->dma_buffer;
++	size_t size = xxsvideo_pcm_hardware.buffer_bytes_max;
++
++	DBG("Entered %s\n", __FUNCTION__);
++
++	buf->dev.type = SNDRV_DMA_TYPE_DEV;
++	buf->dev.dev = pcm->card->dev;
++	buf->private_data = NULL;
++	buf->area = dma_alloc_writecombine(pcm->card->dev, size,
++					   &buf->addr, GFP_KERNEL);
++	if (!buf->area)
++		return -ENOMEM;
++	buf->bytes = size;
++	return 0;
++}
++
++static void xxsvideo_pcm_free_dma_buffers(struct snd_pcm *pcm)
++{
++	struct snd_pcm_substream *substream;
++
++	struct snd_dma_buffer *buf;
++	int stream;
++
++	DBG("Entered %s\n", __FUNCTION__);
++
++	for (stream = 0; stream < 2; stream++) {
++		substream = pcm->streams[stream].substream;
++		if (!substream)
++			continue;
++
++		buf = &substream->dma_buffer;
++		if (!buf->area)
++			continue;
++
++		dma_free_writecombine(pcm->card->dev, buf->bytes,
++				      buf->area, buf->addr);
++		buf->area = NULL;
++
++	}
++
++
++}
++
++static u64 s3c24xx_pcm_dmamask = DMA_32BIT_MASK;
++
++static int xxsvideo_pcm_new(struct snd_card *card,
++	struct snd_soc_dai *dai, struct snd_pcm *pcm)
++{
++	int ret = 0;
++
++	DBG("Entered %s\n", __FUNCTION__);
++
++	if (!card->dev->dma_mask)
++		card->dev->dma_mask = &s3c24xx_pcm_dmamask;
++	if (!card->dev->coherent_dma_mask)
++		card->dev->coherent_dma_mask = 0xffffffff;
++
++	if (dai->playback.channels_min) {
++		ret = s3c24xx_pcm_preallocate_dma_buffer(pcm,
++			SNDRV_PCM_STREAM_PLAYBACK);
++		if (ret)
++			goto out;
++	}
++
++	if (dai->capture.channels_min) {
++		ret = s3c24xx_pcm_preallocate_dma_buffer(pcm,
++			SNDRV_PCM_STREAM_CAPTURE);
++		if (ret)
++			goto out;
++	}
++ out:
++	return ret;
++}
++
++struct snd_soc_platform xxsvideo_soc_platform = {
++	.name		= "xxsvideo-audio",
++	.pcm_ops 	= &xxsvideo_pcm_ops,
++	.pcm_new	= xxsvideo_pcm_new,
++	.pcm_free	= xxsvideo_pcm_free_dma_buffers,
++};
++
++EXPORT_SYMBOL_GPL(xxsvideo_soc_platform);
++
++MODULE_AUTHOR("Alexander Bigga <linux@bigga.de>, mycable GmbH www.mycable.de");
++MODULE_DESCRIPTION("Jade XXSvideo PCM DMA module");
++MODULE_LICENSE("GPL");
+--- linux-2.6.27/sound/soc/xxsvideo/xxsvideo-pcm.h	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/sound/soc/xxsvideo/xxsvideo-pcm.h	2009-01-08 10:49:38.000000000 +0100
+@@ -0,0 +1,36 @@
++/*
++ * xxsvideo-pcm.c  --  ALSA SoC audio for Jade Evalkit
++ *
++ *  Copyright (C) 2008 mycable GmbH
++ *       Alexander Bigga <linux@bigga.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++*/
++
++#ifndef _XXSVIDEO_PCM_H
++#define _XXSVIDEO_PCM_H
++
++#define ST_RUNNING		(1<<0)
++#define ST_OPENED		(1<<1)
++
++struct xxsvideo_pcm_dma_params {
++	struct xxsvideo_dma_client *client;	/* stream identifier */
++	int channel;				/* Channel ID */
++	dma_addr_t dma_addr;
++	int dma_size;			/* Size of the DMA transfer */
++};
++
++// 5, 6, 7 works...?
++// #define MYBC 0
++// #define INT_CNT_MYBC 0
++
++/* platform data */
++extern struct snd_soc_platform xxsvideo_soc_platform;
++// extern struct snd_ac97_bus_ops xxsvideo_ac97_ops;
++extern u32 xxsvideo_i2s_ctrl(unsigned int);
++
++// static int xxsvideo_pcm_dma_request(struct snd_pcm_substream *substream);
++#endif
+--- linux-2.6.27/sound/soc/xxsvideo/xxsvideo-i2s.h	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.27-dev/sound/soc/xxsvideo/xxsvideo-i2s.h	2009-01-08 10:49:38.000000000 +0100
+@@ -0,0 +1,47 @@
++/*
++ * xxsvideo-i2s.c  --  ALSA Soc Audio Layer
++ *
++ *  Copyright (C) 2008 mycable GmbH
++ *       Alexander Bigga <linux@bigga.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++*/
++
++#ifndef XXSVIDEO_I2S_H_
++#define XXSVIDEO_I2S_H_
++
++#define I2S_CNTREG_RXDIS	(1<<5)	/* Receiving func. disable */
++#define I2S_CNTREG_TXDIS	(1<<6)	/* Transmitting func. disable */
++#define I2S_CNTREG_MSMD		(1<<13)	/* Master and slave modes */
++
++/* I2S OPRREG */
++#define I2S_OPRREG_RXENB	1<<24
++#define I2S_OPRREG_TXENB	1<<16
++#define I2S_OPRREG_START	1<<0
++
++/* I2S DMAACT */
++#define I2S_DMAACT_TDMACT	1<<16
++#define I2S_DMAACT_RDMACT	1<<0
++
++/* I2S Status */
++#define I2S_STATUS_TBERR	1<<31
++#define I2S_STATUS_RBERR	1<<30
++#define I2S_STATUS_FERR		1<<29
++#define I2S_STATUS_TXUDR1	1<<28
++#define I2S_STATUS_TXUDR0	1<<27
++#define I2S_STATUS_TXOVR	1<<26
++#define I2S_STATUS_RXUDR	1<<25
++#define I2S_STATUS_RXOVR	1<<24
++#define I2S_STATUS_EOPI		1<<19
++#define I2S_STATUS_BSY		1<<18
++#define I2S_STATUS_TXFI		1<<17
++#define I2S_STATUS_RXFI		1<<16
++
++u32 xxsvideo_i2s_ctrl(unsigned int);
++
++extern struct snd_soc_dai xxsvideo_i2s_dai;
++
++#endif /*XXSVIDEO_I2S_H_*/
diff --git a/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/10_0001-Add-Fujitsu-framebuffer-driver.patch b/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/10_0001-Add-Fujitsu-framebuffer-driver.patch
new file mode 100644
index 0000000..ff00202
--- /dev/null
+++ b/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/10_0001-Add-Fujitsu-framebuffer-driver.patch
@@ -0,0 +1,3305 @@
+From 4702ed47be006041fb3560fd77a9580e53ffff58 Mon Sep 17 00:00:00 2001
+From: Yauhen Kharuzhy <jekhor@gmail.com>
+Date: Tue, 31 May 2011 18:26:19 +0300
+Subject: [PATCH] Add Fujitsu framebuffer driver
+
+Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
+---
+ drivers/video/86xxx.h   | 1122 +++++++++++++++++++++++++++++
+ drivers/video/86xxxfb.c | 1835 +++++++++++++++++++++++++++++++++++++++++++++++
+ drivers/video/86xxxmm.c |  256 +++++++
+ drivers/video/Kconfig   |   31 +
+ drivers/video/Makefile  |    1 +
+ 5 files changed, 3245 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/video/86xxx.h
+ create mode 100644 drivers/video/86xxxfb.c
+ create mode 100644 drivers/video/86xxxmm.c
+
+diff --git a/drivers/video/86xxx.h b/drivers/video/86xxx.h
+new file mode 100644
+index 0000000..7fc9c2d
+--- /dev/null
++++ b/drivers/video/86xxx.h
+@@ -0,0 +1,1122 @@
++/******************************************************************************
++
++                   COPYRIGHT (C) FUJITSU LIMITED 2008
++
++******************************************************************************/
++
++/*!
++ * \author Stephan Doerr
++ * \version 0.1
++ * \date 2008
++ * \file 86xxx.h
++ *
++ * THIS SAMPLE CODE IS PROVIDED AS IS.
++ * FUJITSU MICROELECTRONICS ACCEPTS NO RESPONSIBILITY OR LIABILITY
++ * FOR ANY ERRORS OR OMMISSIONS.
++ *
++ * This file is subject to the terms and conditions of the GNU General Public
++ * License.  See the file LICENSE in the main directory of this archive
++ * for more details.
++ *
++ */
++
++#if   defined (CONFIG_FB_MAP_SIZE_0x00800000)
++#undef FB_MAP_SIZE
++#define FB_MAP_SIZE 0x00800000
++#elif defined (CONFIG_FB_MAP_SIZE_0x00400000)
++#undef FB_MAP_SIZE
++#define FB_MAP_SIZE 0x00400000
++#elif defined (CONFIG_FB_MAP_SIZE_0x02000000)
++#undef FB_MAP_SIZE
++#define FB_MAP_SIZE 0x00200000
++#elif defined (CONFIG_FB_MAP_SIZE_0x00100000)
++#undef FB_MAP_SIZE
++#define FB_MAP_SIZE 0x00100000
++#else /* default value */
++#ifndef FB_MAP_SIZE
++#define FB_MAP_SIZE 0x00800000
++#endif /*FB_MAP_SIZE*/
++#endif
++
++#define PANNING     0
++#define HW_CURSOR   0
++#define HW_ACCEL    0
++
++#define CURSOR_SIZE 64*64
++
++/* PIXMAP_SIZE should be small enough to optimize drawing, but not
++ * large enough that memory is wasted.  A safe size is
++ * (max_xres * max_font_height/8). max_xres is driver dependent,
++ * max_font_height is 32.
++ */
++#define PIXMAP_SIZE 1024 * 32/8
++
++struct Disp_Regs{
++/*offset 0x0000*/
++    union
++    {
++        volatile u32   DCM0_REG;
++        struct
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   DEN :1;
++            volatile u32   _R2 :11;
++            volatile u32   L45E:1;
++            volatile u32   L23E:1;
++            volatile u32   L1E :1;
++            volatile u32   L0E :1;
++            volatile u32   CKS :1;
++            volatile u32   LCS :1;
++            volatile u32   _R1 :1;
++            volatile u32   SC  :5;
++            volatile u32   EEQ :1;
++            volatile u32   EDE :1;
++            volatile u32   EOF :1;
++            volatile u32   EOD :1;
++            volatile u32   SF  :1;
++            volatile u32   ESY :1;
++            volatile u32   SYNC:2;
++#else
++            volatile u32   SYNC:2;
++            volatile u32   ESY :1;
++            volatile u32   SF  :1;
++            volatile u32   EOD :1;
++            volatile u32   EOF :1;
++            volatile u32   EDE :1;
++            volatile u32   EEQ :1;
++            volatile u32   SC  :5;
++            volatile u32   _R1 :1;
++            volatile u32   LCS :1;
++            volatile u32   CKS :1;
++            volatile u32   L0E :1;
++            volatile u32   L1E :1;
++            volatile u32   L23E:1;
++            volatile u32   L45E:1;
++            volatile u32   _R2 :11;
++            volatile u32   DEN :1;
++#endif /* defined(__BIG_ENDIAN) */
++        }DCM0_BITS;
++    }DCM0;
++/*offset 0x0004*/
++    union
++    {
++        volatile u32   HTP_REG;
++        struct
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R2:4;
++            volatile u32   HTP:12;
++            volatile u32   _R1:16;
++#else
++            volatile u32   _R1:16;
++            volatile u32   HTP:12;
++            volatile u32   _R2:4;
++#endif /* defined(__BIG_ENDIAN) */
++        }HTP_BITS;
++    }HTP;
++/*offset 0x0008*/
++    union
++    {
++        volatile u32   HDB_HDP_REG;
++        struct
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R2 :4;
++            volatile u32   HDB :12;
++            volatile u32   _R1 :4;
++            volatile u32   HDP :12;
++#else
++            volatile u32   HDP :12;
++            volatile u32   _R1 :4;
++            volatile u32   HDB :12;
++            volatile u32   _R2 :4;
++#endif /* defined(__BIG_ENDIAN) */
++        }HDB_HDP_BITS;
++    }HDB_HDP;
++/*offset 0x000c*/
++    union
++    {
++        volatile u32   VSWH_VSW_HSW_HSP_REG;
++        struct 
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   VSWH:1;
++            volatile u32   _R2 :1;
++            volatile u32   VSW :6;
++            volatile u32   HSW :8;
++            volatile u32   _R1 :4;
++            volatile u32   HSP :12;
++#else
++            volatile u32   HSP :12;
++            volatile u32   _R1 :4;
++            volatile u32   HSW :8;
++            volatile u32   VSW :6;
++            volatile u32   _R2 :1;
++            volatile u32   VSWH:1;
++#endif /* defined(__BIG_ENDIAN) */
++        }VSWH_VSW_HSW_HSP_BITS;
++    }VSWH_VSW_HSW_HSP;
++/*offset 0x0010*/
++    union
++    {
++        volatile u32   VTR_REG;
++        struct 
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R2 :4;
++            volatile u32   VTR :12;
++            volatile u32   _R1 :16;
++#else
++            volatile u32   _R1 :16;
++            volatile u32   VTR :12;
++            volatile u32   _R2 :4;
++#endif /* defined(__BIG_ENDIAN) */
++        }VTR_BITS;
++    }VTR;
++/*offset 0x0014*/
++    union
++    {
++        volatile u32   VDP_VSP_REG;
++        struct 
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R2 :4;
++            volatile u32   VDP :12;
++            volatile u32   _R1 :4;
++            volatile u32   VSP :12;
++#else
++            volatile u32   VSP :12;
++            volatile u32   _R1 :4;
++            volatile u32   VDP :12;
++            volatile u32   _R2 :4;
++#endif /* defined(__BIG_ENDIAN) */
++        }VDP_VSP_BITS;
++    }VDP_VSP;
++/*offset 0x0018*/
++    union
++    {
++        volatile u32   WY_WX_REG;
++        struct 
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R2 :4;
++            volatile u32    WY :12;
++            volatile u32   _R1 :4;
++            volatile u32    WX :12;
++#else
++            volatile u32    WX :12;
++            volatile u32   _R1 :4;
++            volatile u32    WY :12;
++            volatile u32   _R2 :4;
++#endif /* defined(__BIG_ENDIAN) */
++        }WY_WX_BITS;
++    }WY_WX;
++/*offset 0x001c*/
++    union
++    {
++        volatile u32   WH_WW_REG;
++        struct 
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R2 :4;
++            volatile u32    WH :12;
++            volatile u32   _R1 :4;
++            volatile u32    WW :12;
++#else
++            volatile u32    WW :12;
++            volatile u32   _R1 :4;
++            volatile u32    WH :12;
++            volatile u32   _R2 :4;
++#endif /* defined(__BIG_ENDIAN) */
++        }WH_WW_BITS;
++    }WH_WW;
++/*offset 0x0020*/
++    union
++    {
++        volatile u32   L0M_REG;
++        struct 
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   L0C :1;
++            volatile u32   _R1 :7;
++            volatile u32   L0W :8;
++            volatile u32   _R0 :4;
++            volatile u32   L0H :12;
++#else
++            volatile u32   L0H :12;
++            volatile u32   _R0 :4;
++            volatile u32   L0W :8;
++            volatile u32   _R1 :7;
++            volatile u32   L0C :1;
++#endif /* defined(__BIG_ENDIAN) */
++        }L0M_BITS;
++    }L0M;
++/*offset 0x0024*/
++    union
++    {
++        volatile u32   L0OA_REG;
++        struct 
++        {
++            volatile u32   L0OA :32;
++        }L0OA_BITS;
++    }L0OA;
++/*offset 0x0028*/
++    union
++    {
++        volatile u32   L0DA_REG;
++        struct 
++        {
++            volatile u32   L0DA :32;
++        }L0DA_BITS;
++    }L0DA;
++/*offset 0x002c*/
++    union
++    {
++        volatile u32   L0DY_L0DX_REG;
++        struct 
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R1  :4;
++            volatile u32   L0DY :12;
++            volatile u32   _R0  :4;
++            volatile u32   L0DX :12;
++#else
++            volatile u32   L0DX :12;
++            volatile u32   _R0  :4;
++            volatile u32   L0DY :12;
++            volatile u32   _R1  :4;
++#endif /* defined(__BIG_ENDIAN) */
++        }L0DY_L0DX_BITS;
++    }L0DY_L0DX;
++/*offset 0x0030*/
++    volatile u32 _reserved_1[28];
++/*offset 0x00a0*/
++    union
++    {
++        volatile u32     CUTC_CPM_REG;
++        struct
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32    _R2:10;
++            volatile u32   CUE1:1;
++            volatile u32   CUE0:1;
++            volatile u32    _R1:2;
++            volatile u32   CUO1:1;
++            volatile u32   CUO0:1;
++            volatile u32    _R0:7;
++            volatile u32   CUZT:1;
++            volatile u32   CUTC:8;
++#else
++            volatile u32   CUTC:8;
++            volatile u32   CUZT:1;
++            volatile u32    _R0:7;
++            volatile u32   CUO0:1;
++            volatile u32   CUO1:1;
++            volatile u32    _R1:2;
++            volatile u32   CUE0:1;
++            volatile u32   CUE1:1;
++            volatile u32    _R2:10;
++#endif /* defined(__BIG_ENDIAN) */
++        }CUTC_CPM_BITS;
++    }CUTC_CPM;
++
++    union
++    {
++        volatile u32 CUOA0_REG;
++        struct
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32       _R0:6;
++            volatile u32     CUOA0:26;
++#else
++            volatile u32     CUOA0:26;
++            volatile u32       _R0:6;
++#endif /* defined(__BIG_ENDIAN) */
++        }CUOA0_BITS;
++    }CUOA0;
++    union
++    {
++        volatile u32 CUXY0_REG;
++        struct
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32      _R1:4;
++            volatile u32     CUY0:12;
++            volatile u32      _R0:4;
++            volatile u32     CUX0:12;
++#else
++            volatile u32     CUX0:12;
++            volatile u32      _R0:4;
++            volatile u32     CUY0:12;
++            volatile u32      _R1:4;
++#endif /* defined(__BIG_ENDIAN) */
++        }CUXY0_BITS;
++    }CUXY0;
++    union
++    {
++        volatile u32 CUOA1_REG;
++        struct
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32       _R0:6;
++            volatile u32     CUOA1:26;
++#else
++            volatile u32     CUOA1:26;
++            volatile u32       _R0:6;
++#endif /* defined(__BIG_ENDIAN) */
++        }CUOA1_BITS;
++    }CUOA1;
++    union
++    {
++        volatile u32 CUXY1_REG;
++        struct
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32      _R1:4;
++            volatile u32     CUY1:12;
++            volatile u32      _R0:4;
++            volatile u32     CUX1:12;
++#else
++            volatile u32     CUX1:12;
++            volatile u32      _R0:4;
++            volatile u32     CUY1:12;
++            volatile u32      _R1:4;
++#endif /* defined(__BIG_ENDIAN) */
++        }CUXY1_BITS;
++    }CUXY1;
++    volatile u32 _reserved_2[19];
++/*offset 0x0100*/
++    union
++    {
++        volatile u32   DCM1_REG;
++        struct
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   DEN :1;
++            volatile u32   _R2 :9;
++            volatile u32   L5E :1;
++            volatile u32   L4E :1;
++            volatile u32   L3E :1;
++            volatile u32   L2E :1;
++            volatile u32   L1E :1;
++            volatile u32   L0E :1;
++
++            volatile u32   CKS :1;
++            volatile u32   LCS :1;
++            volatile u32   SC  :6;
++            volatile u32   EEQ :1;
++            volatile u32   EDE :1;
++            volatile u32   EOF :1;
++            volatile u32   EOD :1;
++            volatile u32   SF  :1;
++            volatile u32   ESY :1;
++            volatile u32   SYNC:2;
++#else
++            volatile u32   SYNC:2;
++            volatile u32   ESY :1;
++            volatile u32   SF  :1;
++            volatile u32   EOD :1;
++            volatile u32   EOF :1;
++            volatile u32   EDE :1;
++            volatile u32   EEQ :1;
++            volatile u32   SC  :6;
++            volatile u32   LCS :1;
++            volatile u32   CKS :1;
++            volatile u32   L0E :1;
++            volatile u32   L1E :1;
++            volatile u32   L2E :1;
++            volatile u32   L3E :1;
++            volatile u32   L4E :1;
++            volatile u32   L5E :1;
++            volatile u32   _R2 :9;
++            volatile u32   DEN :1;
++#endif /* defined(__BIG_ENDIAN) */
++        }DCM1_BITS;
++    }DCM1;
++/*offset 0x0104*/
++    union
++    {
++        volatile u32   DCM2_REG;
++        struct
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R2 :27;
++            volatile u32   RUM1:1;
++            volatile u32   _R1 :2;
++            volatile u32   RUF :1;
++            volatile u32   RUM0:1;
++#else
++            volatile u32   RUM0:1;
++            volatile u32   RUF :1;
++            volatile u32   _R1 :2;
++            volatile u32   RUM1:1;
++            volatile u32   _R2 :27;
++#endif /* defined(__BIG_ENDIAN) */
++        }DCM2_BITS;
++    }DCM2;
++/*offset 0x0108*/
++    union
++    {
++        volatile u32   DCM3_REG;
++        struct
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R4   :6;
++            volatile u32   GVD   :1;
++            volatile u32   VPMMs :1;
++            volatile u32   Gswap :1;
++            volatile u32   CSYz  :1;
++            volatile u32   RGBrv :1;
++            volatile u32   RGBsh :1;
++            volatile u32   _R3   :1;
++            volatile u32   BSYe  :1;
++            volatile u32   MBST  :2;
++            volatile u32   _R2   :5;
++            volatile u32   POM   :1;
++            volatile u32   CKddr :1;
++            volatile u32   CKinv :1;
++            volatile u32   CKDe  :1;
++            volatile u32   _R1   :2;
++            volatile u32   CKDn  :5;
++#else
++            volatile u32   CKDn  :5;
++            volatile u32   _R1   :2;
++            volatile u32   CKDe  :1;
++            volatile u32   CKinv :1;
++            volatile u32   CKddr :1;
++            volatile u32   POM   :1;
++            volatile u32   _R2   :5;
++            volatile u32   MBST  :2;
++            volatile u32   BSYe  :1;
++            volatile u32   _R3   :1;
++            volatile u32   RGBsh :1;
++            volatile u32   RGBrv :1;
++            volatile u32   CSYz  :1;
++            volatile u32   Gswap :1;
++            volatile u32   VPMMs :1;
++            volatile u32   GVD   :1;
++            volatile u32   _R4   :6;
++#endif /* defined(__BIG_ENDIAN) */
++        }DCM3_BITS;
++    }DCM3;
++    volatile u32 reserved_0x010c;
++/*offset 0x0110*/
++    union
++    {
++        volatile u32   L0EM_REG;
++        struct
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   L0EC:2;
++            volatile u32   _R1 :6;
++            volatile u32   L0PB:4;
++            volatile u32   _R0 :19;
++            volatile u32   L0WP:1;
++#else
++            volatile u32   L0WP:1;
++            volatile u32   _R0 :19;
++            volatile u32   L0PB:4;
++            volatile u32   _R1 :6;
++            volatile u32   L0EC:2;
++#endif /* defined(__BIG_ENDIAN) */
++        }L0EM_BITS;
++    }L0EM;
++/*offset 0x0114*/
++    union
++    {
++        volatile u32   L0WY_L0WX_REG;
++        struct 
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R1  :4;
++            volatile u32   L0WY :12;
++            volatile u32   _R0  :4;
++            volatile u32   L0WX :12;
++#else
++            volatile u32   L0WX :12;
++            volatile u32   _R0  :4;
++            volatile u32   L0WY :12;
++            volatile u32   _R1  :4;
++#endif /* defined(__BIG_ENDIAN) */
++        }L0WY_L0WX_BITS;
++    }L0WY_L0WX;
++/*offset 0x0118*/
++    union
++    {
++        volatile u32   L0WW_L0WH_REG;
++        struct 
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R1  :4;
++            volatile u32   L0WH :12;
++            volatile u32   _R0  :4;
++            volatile u32   L0WW :12;
++#else
++            volatile u32   L0WW :12;
++            volatile u32   _R0  :4;
++            volatile u32   L0WH :12;
++            volatile u32   _R1  :4;
++#endif /* defined(__BIG_ENDIAN) */
++        }L0WW_L0WH_BITS;
++    }L0WW_L0WH;
++};
++
++
++struct Host_Regs_MB86297{
++    union
++    {
++        volatile u32   STATUS_REG;
++        struct{
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R0   :5;
++            volatile u32   INT26 :1;
++            volatile u32   INT25 :1;
++            volatile u32   INT24 :1;
++            volatile u32   INT23 :1;
++            volatile u32   INT22 :1;
++            volatile u32   _R1   :1;
++            volatile u32   INT20 :1;
++            volatile u32   INT19 :1;
++            volatile u32   INT18 :1;
++            volatile u32   INT17 :1;
++            volatile u32   INT16 :1;
++            volatile u32   INT15 :1;
++            volatile u32   INT14 :1;
++            volatile u32   INT13 :1;
++            volatile u32   INT12 :1;
++            volatile u32   INT11 :1;
++            volatile u32   INT10 :1;
++            volatile u32   _R2   :1;
++            volatile u32   INT08 :1;
++            volatile u32   INT07 :1;
++            volatile u32   INT06 :1;
++            volatile u32   _R3   :1;
++            volatile u32   INT04 :1;
++            volatile u32   INT03 :1;
++            volatile u32   INT02 :1;
++            volatile u32   INT01 :1;
++            volatile u32   INT00 :1;
++#else
++            volatile u32   INT00 :1;
++            volatile u32   INT01 :1;
++            volatile u32   INT02 :1;
++            volatile u32   INT03 :1;
++            volatile u32   INT04 :1;
++            volatile u32   _R3   :1;
++            volatile u32   INT06 :1;
++            volatile u32   INT07 :1;
++            volatile u32   INT08 :1;
++            volatile u32   _R2   :1;
++            volatile u32   INT10 :1;
++            volatile u32   INT11 :1;
++            volatile u32   INT12 :1;
++            volatile u32   INT13 :1;
++            volatile u32   INT14 :1;
++            volatile u32   INT15 :1;
++            volatile u32   INT16 :1;
++            volatile u32   INT17 :1;
++            volatile u32   INT18 :1;
++            volatile u32   INT19 :1;
++            volatile u32   INT20 :1;
++            volatile u32   _R1   :1;
++            volatile u32   INT22 :1;
++            volatile u32   INT23 :1;
++            volatile u32   INT24 :1;
++            volatile u32   INT25 :1;
++            volatile u32   INT26 :1;
++            volatile u32   _R0   :5;
++#endif /* defined(__BIG_ENDIAN) */
++        }STATUS_BITS;
++    }STATUS;
++    union
++    {
++        volatile u32   INTMASK_REG;
++        struct{
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R0   :5;
++            volatile u32   INT26 :1;
++            volatile u32   INT25 :1;
++            volatile u32   INT24 :1;
++            volatile u32   INT23 :1;
++            volatile u32   INT22 :1;
++            volatile u32   INT21 :1;
++            volatile u32   INT20 :1;
++            volatile u32   INT19 :1;
++            volatile u32   INT18 :1;
++            volatile u32   INT17 :1;
++            volatile u32   INT16 :1;
++            volatile u32   INT15 :1;
++            volatile u32   INT14 :1;
++            volatile u32   INT13 :1;
++            volatile u32   INT12 :1;
++            volatile u32   INT11 :1;
++            volatile u32   INT10 :1;
++            volatile u32   INT09 :1;
++            volatile u32   INT08 :1;
++            volatile u32   INT07 :1;
++            volatile u32   INT06 :1;
++            volatile u32   INT05 :1;
++            volatile u32   INT04 :1;
++            volatile u32   INT03 :1;
++            volatile u32   INT02 :1;
++            volatile u32   INT01 :1;
++            volatile u32   INT00 :1;
++#else
++            volatile u32   INT00 :1;
++            volatile u32   INT01 :1;
++            volatile u32   INT02 :1;
++            volatile u32   INT03 :1;
++            volatile u32   INT04 :1;
++            volatile u32   INT05 :1;
++            volatile u32   INT06 :1;
++            volatile u32   INT07 :1;
++            volatile u32   INT08 :1;
++            volatile u32   INT09 :1;
++            volatile u32   INT10 :1;
++            volatile u32   INT11 :1;
++            volatile u32   INT12 :1;
++            volatile u32   INT13 :1;
++            volatile u32   INT14 :1;
++            volatile u32   INT15 :1;
++            volatile u32   INT16 :1;
++            volatile u32   INT17 :1;
++            volatile u32   INT18 :1;
++            volatile u32   INT19 :1;
++            volatile u32   INT20 :1;
++            volatile u32   INT21 :1;
++            volatile u32   INT22 :1;
++            volatile u32   INT23 :1;
++            volatile u32   INT24 :1;
++            volatile u32   INT25 :1;
++            volatile u32   INT26 :1;
++            volatile u32   _R0   :5;
++#endif /* defined(__BIG_ENDIAN) */
++        }INTMASK_BITS;
++    }INTMASK;
++    union
++    {
++        volatile u32   CCNT_REG;
++        struct{
++#if defined(__BIG_ENDIAN)
++            volatile u32   CCNT  :8;
++            volatile u32   _R0   :24;
++#else
++            volatile u32   _R0   :24;
++            volatile u32   CCNT  :8;
++#endif /* defined(__BIG_ENDIAN) */
++        }CCNT_BITS;
++    }CCNT;
++    union
++    {
++        volatile u32   CLOCK_ENABLE_REG;
++        struct{
++#if defined(__BIG_ENDIAN)
++            volatile u32   CKEN0 :1;
++            volatile u32   CKEN1 :1;
++            volatile u32   CKEN2 :1;
++            volatile u32   CKEN3 :1;
++            volatile u32   CKEN4 :1;
++            volatile u32   CKEN5 :1;
++            volatile u32   CKEN6 :1;
++            volatile u32   CKEN7 :1;
++            volatile u32   CKEN8 :1;
++            volatile u32   CKEN9 :1;
++            volatile u32   _R0   :22;
++#else
++            volatile u32   _R0   :22;
++            volatile u32   CKEN9 :1;
++            volatile u32   CKEN8 :1;
++            volatile u32   CKEN7 :1;
++            volatile u32   CKEN6 :1;
++            volatile u32   CKEN5 :1;
++            volatile u32   CKEN4 :1;
++            volatile u32   CKEN3 :1;
++            volatile u32   CKEN2 :1;
++            volatile u32   CKEN1 :1;
++            volatile u32   CKEN0 :1;
++#endif /* defined(__BIG_ENDIAN) */
++        }CLOCK_ENABLE_BITS;
++    }CLOCK_ENABLE;
++    union
++    {
++        volatile u32   SFTRST_REG;
++        struct{
++#if defined(__BIG_ENDIAN)
++            volatile u32   SFTRST:1;
++            volatile u32   _R0   :31;
++#else
++            volatile u32   _R0   :31;
++            volatile u32   SFTRST:1;
++#endif /* defined(__BIG_ENDIAN) */
++        }SFTRST_BITS;
++    }SFTRST;
++};
++
++struct Dram_Regs_MB86297{
++    volatile u32    DCTL_REG_MODE_ADD;
++    volatile u32    EMODE_SET_TIME1;
++    volatile u32    SET_TIME2_REFRESH;
++    volatile u32    STATES_EXTRA;
++    volatile u32    RESERVE0_RESERVE1;
++    volatile u32    DDRIF1_DDRIF2;
++    volatile u32    _r1;
++    volatile u32    _r2;
++    volatile u32    _r3;
++    volatile u32    IO_CONT0_IO_CONT1;
++};
++
++struct Host_Regs_MB86296{
++    volatile u32 _reserved_0[8];
++    union
++    {
++        volatile u32   IST_REG;
++        struct
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   IST2:6;
++            volatile u32   _R1 :8;
++            volatile u32   IST1:2;
++            volatile u32   _R0 :10;
++            volatile u32   IST0:6;
++#else
++            volatile u32   IST0:6;
++            volatile u32   _R0 :10;
++            volatile u32   IST1:2;
++            volatile u32   _R1 :8;
++            volatile u32   IST2:6;
++#endif /* defined(__BIG_ENDIAN) */
++        }IST_BITS;
++    }IST;
++    union
++    {
++        volatile u32   IMASK_REG;
++        struct
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   IMASK2  :6;
++            volatile u32   _R1     :8;
++            volatile u32   IMASK1  :2;
++            volatile u32   _R0     :10;
++            volatile u32   IMASK0  :6;
++#else
++            volatile u32   IMASK0  :6;
++            volatile u32   _R0     :10;
++            volatile u32   IMASK1  :2;
++            volatile u32   _R1     :8;
++            volatile u32   IMASK2  :6;
++#endif /* defined(__BIG_ENDIAN) */
++        }IMASK_BITS;
++    }IMASK;
++    volatile u32 _reserved_1;
++    union
++    {
++        volatile u32   SRST_REG;
++        struct
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R0  :31;
++            volatile u32   SRST :1;
++#else
++            volatile u32   SRST :1;
++            volatile u32   _R0  :31;
++#endif /* defined(__BIG_ENDIAN) */
++        }SRST_BITS;
++    }SRST;
++    volatile u32 _reserved_2[2];
++    union
++    {
++        volatile u32   CCF_REG;
++        struct 
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R1 :12;
++            volatile u32   CGE :2;
++            volatile u32   COT :2;
++            volatile u32   _R0 :16;
++#else
++            volatile u32   _R0 :16;
++            volatile u32   COT :2;
++            volatile u32   CGE :2;
++            volatile u32   _R1 :12;
++#endif /* defined(__BIG_ENDIAN) */
++        }CCF_BITS;
++    }CCF;
++    volatile u32 _reserved_3[8];
++    union
++    {
++        volatile u32   RSW_REG;
++        struct 
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R0 :31;
++            volatile u32   RSW :1;
++#else
++            volatile u32   RSW :1;
++            volatile u32   _R0 :31;
++#endif /* defined(__BIG_ENDIAN) */
++        }RSW_BITS;
++    }RSW;
++    volatile u32 _reserved_4[16];
++    union
++    {
++        volatile u32   FRST_REG;
++        struct 
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   FRST :1;
++            volatile u32   _R0  :31;
++#else
++            volatile u32   FRST :1;
++            volatile u32   _R0  :31;
++#endif /* defined(__BIG_ENDIAN) */
++        }FRST_BITS;
++    }FRST;
++    union
++    {
++        volatile u32   SRBS;
++        struct 
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R0 :29;
++            volatile u32   SRBS:3;
++#else
++            volatile u32   SRBS:3;
++            volatile u32   _R0 :29;
++#endif /* defined(__BIG_ENDIAN) */
++        }SRBS_BITS;
++    }SRBS;
++};
++
++struct Dram_Regs_MB86296{
++    volatile u32    MMR;
++};
++
++struct Host_Regs_MB86R01{
++    volatile u32 _reserved_0a[2];
++    union
++    {
++        volatile u32   LTS_REG;
++        struct
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R1 :23;
++            volatile u32   LTS :1;
++            volatile u32   _R0 :7;
++            volatile u32   DTS :1;
++#else
++            volatile u32   DTS :1;
++            volatile u32   _R0 :7;
++            volatile u32   LTS :1;
++            volatile u32   _R1 :23;
++#endif /* defined(__BIG_ENDIAN) */
++        }LTS_BITS;
++    }LTS;
++    volatile u32 _reserved_0b;
++    union
++    {
++        volatile u32   LSTA_REG;
++        struct
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32    _R0:31;
++            volatile u32   LSTA:1;
++#else
++            volatile u32   LSTA:1;
++            volatile u32    _R0:31;
++#endif /* defined(__BIG_ENDIAN) */
++        }LSTA_BITS;
++    }LSTA;
++    volatile u32 _reserved_0c[3];
++    union
++    {
++        volatile u32   IST_REG;
++        struct
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   IST2:6;
++            volatile u32   _R1 :8;
++            volatile u32   IST1:2;
++            volatile u32   _R0 :10;
++            volatile u32   IST0:6;
++#else
++            volatile u32   IST0:6;
++            volatile u32   _R0 :10;
++            volatile u32   IST1:2;
++            volatile u32   _R1 :8;
++            volatile u32   IST2:6;
++#endif /* defined(__BIG_ENDIAN) */
++        }IST_BITS;
++    }IST;
++    union
++    {
++        volatile u32   IMASK_REG;
++        struct
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   IMASK2  :6;
++            volatile u32   _R1     :8;
++            volatile u32   IMASK1  :2;
++            volatile u32   _R0     :10;
++            volatile u32   IMASK0  :6;
++#else
++            volatile u32   IMASK0  :6;
++            volatile u32   _R0     :10;
++            volatile u32   IMASK1  :2;
++            volatile u32   _R1     :8;
++            volatile u32   IMASK2  :6;
++#endif /* defined(__BIG_ENDIAN) */
++        }IMASK_BITS;
++    }IMASK;
++    volatile u32 _reserved_1;
++    union
++    {
++        volatile u32   SRST_REG;
++        struct
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R0  :31;
++            volatile u32   SRST :1;
++#else
++            volatile u32   SRST :1;
++            volatile u32   _R0  :31;
++#endif /* defined(__BIG_ENDIAN) */
++        }SRST_BITS;
++    }SRST;
++    volatile u32 _reserved_2[2];
++    union
++    {
++        volatile u32   CCF_REG;
++        struct 
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R1 :12;
++            volatile u32   CGE :2;
++            volatile u32   COT :2;
++            volatile u32   _R0 :16;
++#else
++            volatile u32   _R0 :16;
++            volatile u32   COT :2;
++            volatile u32   CGE :2;
++            volatile u32   _R1 :12;
++#endif /* defined(__BIG_ENDIAN) */
++        }CCF_BITS;
++    }CCF;
++    volatile u32 _reserved_2a;
++    union
++    {
++        volatile u32   LSA_REG;
++        struct
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R0 :6;
++            volatile u32   LSA :26;
++#else
++            volatile u32   LSA :26;
++            volatile u32   _R0 :6;
++#endif /* defined(__BIG_ENDIAN) */
++        }LSA_BITS;
++    }LSA;
++    union
++    {
++        volatile u32   LCO_REG;
++        struct
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R0 :7;
++            volatile u32   LCO :25;
++#else
++            volatile u32   LCO :25;
++            volatile u32   _R0 :7;
++#endif /* defined(__BIG_ENDIAN) */
++        }LCO_BITS;
++    }LCO;
++    union
++    {
++        volatile u32   LREQ_REG;
++        struct
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R0  :31;
++            volatile u32   LREQ :1;
++#else
++            volatile u32   LREQ :1;
++            volatile u32   _R0  :31;
++#endif /* defined(__BIG_ENDIAN) */
++        }LREQ_BITS;
++    }LREQ;
++    volatile u32 _reserved_2b[4];
++    union
++    {
++        volatile u32   RSW_REG;
++        struct 
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R0 :31;
++            volatile u32   RSW :1;
++#else
++            volatile u32   RSW :1;
++            volatile u32   _R0 :31;
++#endif /* defined(__BIG_ENDIAN) */
++        }RSW_BITS;
++    }RSW;
++    volatile u32 _reserved_4[16];
++    union
++    {
++        volatile u32   FRST_REG;
++        struct 
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   FRST :1;
++            volatile u32   _R0  :31;
++#else
++            volatile u32   FRST :1;
++            volatile u32   _R0  :31;
++#endif /* defined(__BIG_ENDIAN) */
++        }FRST_BITS;
++    }FRST;
++    union
++    {
++        volatile u32   SRBS;
++        struct 
++        {
++#if defined(__BIG_ENDIAN)
++            volatile u32   _R0 :29;
++            volatile u32   SRBS:3;
++#else
++            volatile u32   SRBS:3;
++            volatile u32   _R0 :29;
++#endif /* defined(__BIG_ENDIAN) */
++        }SRBS_BITS;
++    }SRBS;
++};
++
++
++#define MDR0        0x108
++#define DRAW_BASE   0x110
++#define X_RES       0x111
++#define STRIDE      0x095
++
++#define REG_BASE_HOST_MB86297           0x00400000
++#define REG_BASE_DISPLAY_MB86297        0x00100000
++#define REG_BASE_DRAM_MB86297           0x00300000
++
++#define REG_BASE_MB86296                0x01FC0000
++#define REG_SIZE_MB86296                0x00040000
++#define REG_BASE_HOST_MB86296           0x00000000
++#define REG_BASE_DISPLAY_MB86296        0x00010000
++#define REG_BASE_DRAM_MB86296           0x0000FFFC
++
++#define REG_BASE_HOST_MB86R01           0xF1FC0000
++#define DRAM_TOP_MB86R01                0x48000000
++#define REG_BASE_MB86R01_DISPLAY0       0x00010000
++#define REG_BASE_MB86R01_DISPLAY1       0x00012000
++
++#define PCI_VENDOR_ID_FUJITSU               0x10cf
++#define PCI_DEVICE_ID_FUJITSU_CORAL         0x201e /* 2019*/
++#define PCI_DEVICE_ID_FUJITSU_CARMINE       0x202b
++
++#define PLLCLOCK_MB86R01    666
++#define PLLCLOCK_MB86297    533
++#define PLLCLOCK_MB86296    400
++
++enum chipsets {MB86R01, MB86297, MB86296};
+diff --git a/drivers/video/86xxxfb.c b/drivers/video/86xxxfb.c
+new file mode 100644
+index 0000000..66f18f3
+--- /dev/null
++++ b/drivers/video/86xxxfb.c
+@@ -0,0 +1,1835 @@
++/******************************************************************************
++
++                   COPYRIGHT (C) FUJITSU LIMITED 2008
++
++******************************************************************************/
++
++/*!
++ * \author Stephan Doerr
++ * \version 0.1
++ * \date 2008
++ * \file 86xxxfb.c
++ *
++ * THIS SAMPLE CODE IS PROVIDED AS IS.
++ * FUJITSU MICROELECTRONICS ACCEPTS NO RESPONSIBILITY OR LIABILITY
++ * FOR ANY ERRORS OR OMMISSIONS.
++ *
++ * This file is subject to the terms and conditions of the GNU General Public
++ * License.  See the file LICENSE in the main directory of this archive
++ * for more details.
++ *
++ * based on linux/drivers/video/skeletonfb.c
++ */
++
++#include <linux/module.h>
++#include <linux/kernel.h>
++#include <linux/errno.h>
++#include <linux/string.h>
++#include <linux/mm.h>
++#include <linux/slab.h>
++#include <linux/delay.h>
++#include <linux/fb.h>
++#include <linux/init.h>
++#include <linux/poll.h>
++#ifdef CONFIG_PCI
++#include <linux/pci.h>
++#define _86xxxfb_writel  writel
++#else
++#include <linux/dma-mapping.h>
++#include <linux/platform_device.h>
++#include <linux/version.h>
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,6,27))
++#include <asm/arch/board.h>
++#else
++#include <mach/board.h>
++#endif
++#define _86xxxfb_writel(a,b)  __raw_writel(a,b)/*  ;printk("0x%08x : 0x%08x\n",(u32) b,a);*/
++#endif
++
++#include "86xxx.h"
++
++#ifdef CONFIG_PCI
++struct pci_device_id MB86xxxfb_devices[]=
++{
++    { PCI_VENDOR_ID_FUJITSU, PCI_DEVICE_ID_FUJITSU_CORAL  , PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
++    { PCI_VENDOR_ID_FUJITSU, PCI_DEVICE_ID_FUJITSU_CARMINE, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
++    { 0,0,0,0,0,0,0 }
++};
++#endif
++
++/*
++ * Driver data
++ */
++static char *mode_option;
++
++/* export for V03/V02 driver series */
++void *GDC_MMIO_BASE_VIRT;
++void *GDC_DRAM_BASE_PHYS;
++struct pci_dev *GDC_PCI_DEV;
++
++/* 
++ * This structure defines the hardware state of the graphics card.
++ */
++struct MB86xxx_par{
++    volatile void __iomem     *mmio;
++    volatile void __iomem     *fb_base;
++    u32                        map_base_phys;
++    u32                        map_size;
++
++#ifndef CONFIG_PCI
++    struct Host_Regs_MB86R01 *Host_Regs_MB86R01;
++#else
++    struct Host_Regs_MB86297 *Host_Regs_MB86297;
++    struct Dram_Regs_MB86297 *Dram_Regs_MB86297;
++    
++    struct Host_Regs_MB86296 *Host_Regs_MB86296;
++    struct Dram_Regs_MB86296 *Dram_Regs_MB86296;
++#endif
++
++    struct Disp_Regs         *Disp_Regs;
++
++    struct fb_cursor current_cursor;
++
++    u32 Cursor0_Base_virt;
++    u32 Cursor1_Base_virt;
++
++    u32 pseudo_palette[16];
++
++    enum chipsets   chipset;
++};
++
++static struct fb_var_screeninfo MB86xxx_var = {
++    .activate       = FB_ACTIVATE_NOW,
++    .height         = -1,
++    .width          = -1,
++    .accel_flags    = 254, //FB_ACCEL_NONE,
++    .vmode          = FB_VMODE_NONINTERLACED,
++};
++
++static struct fb_fix_screeninfo MB86xxx_fix = {
++    .id             = "MB86xxxfb",
++    .type           = FB_TYPE_PACKED_PIXELS,
++    .visual         = FB_VISUAL_TRUECOLOR,
++#if (PANNING==1)
++    .xpanstep       = 1,
++    .ypanstep       = 1,
++#else
++    .xpanstep       = 0,
++    .ypanstep       = 0,
++#endif
++    .ywrapstep      = 0,
++#ifndef CONFIG_PCI
++    .mmio_len       = SZ_256K,
++#endif
++};
++
++#ifdef CONFIG_PCI
++void MB86297_init( struct fb_info *info)
++{
++    struct Host_Regs_MB86297 *hregs;
++    struct Dram_Regs_MB86297 *dregs;
++    int timeout=5000;
++
++    hregs = ((struct MB86xxx_par *)info->par)->Host_Regs_MB86297;
++    dregs = ((struct MB86xxx_par *)info->par)->Dram_Regs_MB86297;
++
++
++   /* Sets internal clock */
++   _86xxxfb_writel(0x03ffUL, &hregs->CLOCK_ENABLE.CLOCK_ENABLE_REG);
++   /* software reset (SRST register) */
++   _86xxxfb_writel(0x01, &hregs->SFTRST.SFTRST_REG);
++   _86xxxfb_writel(0x00, &hregs->SFTRST.SFTRST_REG);
++   udelay(200);
++
++   /* Sets memory interface mode */
++   /* I/O mode setting */
++
++   _86xxxfb_writel( 0x05550555,  &dregs->IO_CONT0_IO_CONT1);
++
++   /* DRAM initial sequence */
++
++   _86xxxfb_writel( 0x012105C3,  &dregs->DCTL_REG_MODE_ADD);
++   _86xxxfb_writel( 0x47498000,  &dregs->EMODE_SET_TIME1);
++   _86xxxfb_writel( 0x00422a22,  &dregs->SET_TIME2_REFRESH);
++   _86xxxfb_writel( 0x0000000f,  &dregs->RESERVE0_RESERVE1);
++   _86xxxfb_writel( 0x00556646 , &dregs->DDRIF1_DDRIF2);
++   _86xxxfb_writel( 0x00200003,  &dregs->STATES_EXTRA);
++
++   /* Executes DLL reset */
++   /* wait for 0 */
++   while ((readl(&dregs->STATES_EXTRA) & 0xf) !=0 && timeout--)
++   {
++       udelay(1000);
++   }
++   if (!timeout) {
++       printk("%s: VRAM initialization failed.\n",__func__);
++   }
++
++   _86xxxfb_writel( 0x002105c3,  &dregs->DCTL_REG_MODE_ADD );
++   _86xxxfb_writel( 0x00200002,  &dregs->STATES_EXTRA );
++}
++#if defined(CONFIG_PCI) && !defined(FB_V03)
++#include "86xxxmm.c"
++#endif /* defined(CONFIG_PCI) && !defined(FB_V03) */
++void MB86296_init( struct fb_info *info)
++{
++    struct Host_Regs_MB86296 *hregs;
++    struct Dram_Regs_MB86296 *dregs;
++
++    hregs = ((struct MB86xxx_par *)info->par)->Host_Regs_MB86296;
++    dregs = ((struct MB86xxx_par *)info->par)->Dram_Regs_MB86296;
++
++    /* Sets internal clock (CCF register) */
++    /* 133 MHZ for geometry engine and other modules */
++    _86xxxfb_writel(0x00050000, &hregs->CCF.CCF_REG);
++    udelay(200);
++
++    /* software reset (SRST register) */
++    _86xxxfb_writel(0x01, &hregs->SRST.SRST_REG);
++    udelay(200);
++
++    /* memory mode for SDRAM interface (MMR register)*/
++    _86xxxfb_writel(0x11d7fa13, dregs);
++    udelay(200);
++}
++#endif /*CONFIG_PCI*/
++
++static struct fb_ops MB86xxxfb_ops;
++
++/**
++ *    MB86xxxfb_open - Optional function. Called when the framebuffer is
++ *             first accessed.
++ *    @info: frame buffer structure that represents a single frame buffer
++ *    @user: tell us if the userland (value=1) or the console is accessing
++ *           the framebuffer. 
++ *
++ *    This function is the first function called in the framebuffer api.
++ *    Usually you don't need to provide this function. The case where it 
++ *    is used is to change from a text mode hardware state to a graphics
++ *     mode state. 
++ *
++ *    Returns negative errno on error, or zero on success.
++ */
++int MB86xxxfb_open(struct fb_info *info, int user)
++{
++    return 0;
++}
++
++/**
++ *    MB86xxxfb_release - Optional function. Called when the framebuffer 
++ *            device is closed. 
++ *    @info: frame buffer structure that represents a single frame buffer
++ *    @user: tell us if the userland (value=1) or the console is accessing
++ *           the framebuffer. 
++ *    
++ *    Thus function is called when we close /dev/fb or the framebuffer 
++ *    console system is released. Usually you don't need this function.
++ *    The case where it is usually used is to go from a graphics state
++ *    to a text mode state.
++ *
++ *    Returns negative errno on error, or zero on success.
++ */
++int MB86xxxfb_release(struct fb_info *info, int user)
++{
++#if 0
++    printk("%s: called from",__func__);
++    if (user)
++        printk(" usermode\n");
++    else
++        printk(" kernelmode\n");
++#endif
++    return 0;
++}
++
++/**
++ *      MB86xxxfb_check_var - Optional function. Validates a var passed in. 
++ *      @var: frame buffer variable screen structure
++ *      @info: frame buffer structure that represents a single frame buffer 
++ *
++ *    Checks to see if the hardware supports the state requested by
++ *    var passed in. This function does not alter the hardware state!!! 
++ *    This means the data stored in struct fb_info and struct MB86xxx_par do 
++ *      not change. This includes the var inside of struct fb_info. 
++ *    Do NOT change these. This function can be called on its own if we
++ *    intent to only test a mode and not actually set it. The stuff in 
++ *    modedb.c is a example of this. If the var passed in is slightly 
++ *    off by what the hardware can support then we alter the var PASSED in
++ *    to what we can do.
++ *
++ *      For values that are off, this function must round them _up_ to the
++ *      next value that is supported by the hardware.  If the value is
++ *      greater than the highest value supported by the hardware, then this
++ *      function must return -EINVAL.
++ *
++ *      Exception to the above rule:  Some drivers have a fixed mode, ie,
++ *      the hardware is already set at boot up, and cannot be changed.  In
++ *      this case, it is more acceptable that this function just return
++ *      a copy of the currently working var (info->var). Better is to not
++ *      implement this function, as the upper layer will do the copying
++ *      of the current var for you.
++ *
++ *      Note:  This is the only function where the contents of var can be
++ *      freely adjusted after the driver has been registered. If you find
++ *      that you have code outside of this function that alters the content
++ *      of var, then you are doing something wrong.  Note also that the
++ *      contents of info->var must be left untouched at all times after
++ *      driver registration.
++ *
++ *    Returns negative errno on error, or zero on success.
++ */
++
++static int MB86xxxfb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
++{
++    int ret = -EINVAL;
++
++    /* Note: Refresh rate is ignored, only 60 Hz is supported */
++
++    switch (var->xres)
++    {
++#ifndef CONFIG_PCI
++    case 320:
++        if (var->yres == 240){
++            /* fill in blanking to assure proper display timing */
++            var->left_margin  = 32;
++            var->right_margin = 32;
++            var->hsync_len    = 40;
++            var->upper_margin = 10;
++            var->lower_margin = 10;
++            var->vsync_len    = 3;
++            ret = 0;
++        }
++        else
++            ret = -EINVAL;
++        break;
++#endif
++    case 640:
++        if (var->yres == 480){
++            /* fill in blanking to assure proper display timing */
++            var->left_margin  = 32;
++            var->right_margin = 32;
++            var->hsync_len    = 96;
++            var->upper_margin = 20;
++            var->lower_margin = 21;
++            var->vsync_len    = 4;
++            ret = 0;
++        }
++        else
++            ret = -EINVAL;
++        break;
++    case 800:
++        if (var->yres == 600){
++            var->left_margin  = 80;
++            var->right_margin = 80;
++            var->hsync_len    = 96;
++            var->upper_margin = 15;
++            var->lower_margin = 14;
++            var->vsync_len    = 4;
++            ret = 0;
++        }
++        else
++            ret = -EINVAL;
++        break;
++    case 1024:
++        if (var->yres == 768){
++            var->left_margin  = 134;
++            var->right_margin = 135;
++            var->hsync_len    = 96;
++            var->upper_margin = 19;
++            var->lower_margin = 19;
++            var->vsync_len    = 4;
++            ret = 0;
++        }
++        else
++            ret = -EINVAL;
++        break;
++
++    default:
++       ret = -EINVAL;
++    }
++
++    switch (info->var.bits_per_pixel)
++    {
++    case 32:
++        info->var.red.offset       = 16;
++        info->var.red.length       =  8;
++        info->var.red.msb_right    =  0;
++        info->var.green.offset     =  8;
++        info->var.green.length     =  8;
++        info->var.green.msb_right  =  0;
++        info->var.blue.offset      =  0;
++        info->var.blue.length      =  8;
++        info->var.blue.msb_right   =  0;
++        info->var.transp.offset    = 24;
++        info->var.transp.length    =  8;
++        info->var.transp.msb_right =  0;
++
++        info->fix.visual = FB_VISUAL_TRUECOLOR;
++//        info->var.bits_per_pixel = 32;
++        break;
++
++    case 16:
++        info->var.red.offset       = 10;
++        info->var.red.length       =  5;
++        info->var.red.msb_right    =  0;
++        info->var.green.offset     =  5;
++        info->var.green.length     =  5;
++        info->var.green.msb_right  =  0;
++        info->var.blue.offset      =  0;
++        info->var.blue.length      =  5;
++        info->var.blue.msb_right   =  0;
++        info->var.transp.offset    = 15;
++        info->var.transp.length    =  1;
++        info->var.transp.msb_right =  0;
++        info->fix.visual = FB_VISUAL_TRUECOLOR;
++//        info->var.bits_per_pixel = 16;
++        break;
++    case 8:
++        info->var.red.offset       =  0;
++        info->var.red.length       =  8;
++        info->var.red.msb_right    =  0;
++        info->var.green.offset     =  0;
++        info->var.green.length     =  8;
++        info->var.green.msb_right  =  0;
++        info->var.blue.offset      =  0;
++        info->var.blue.length      =  8;
++        info->var.blue.msb_right   =  0;
++        info->var.transp.offset    =  0;
++        info->var.transp.length    =  0;
++        info->var.transp.msb_right =  0;
++        info->fix.visual = FB_VISUAL_PSEUDOCOLOR;
++        break;
++    default:
++        printk("%s: should not come to here\n",__func__);
++    }
++
++
++    return ret;           
++}
++
++
++/**
++ *      MB86xxxfb_set_par - Optional function. Alters the hardware state.
++ *      @info: frame buffer structure that represents a single frame buffer
++ *
++ *    Using the fb_var_screeninfo in fb_info we set the resolution of the
++ *    this particular framebuffer. This function alters the par AND the
++ *    fb_fix_screeninfo stored in fb_info. It doesn't not alter var in 
++ *    fb_info since we are using that data. This means we depend on the
++ *    data in var inside fb_info to be supported by the hardware. 
++ *
++ *      This function is also used to recover/restore the hardware to a
++ *      known working state.
++ *
++ *      MB86xxxfb_check_var is always called before MB86xxxfb_set_par to ensure that
++ *      the contents of var is always valid.
++ *
++ *      Again if you can't change the resolution you don't need this function.
++ *
++ *      However, even if your hardware does not support mode changing,
++ *      a set_par might be needed to at least initialize the hardware to
++ *      a known working state, especially if it came back from another
++ *      process that also modifies the same hardware, such as X.
++ *
++ *      If this is the case, a combination such as the following should work:
++ *
++ *      static int MB86xxxfb_check_var(struct fb_var_screeninfo *var,
++ *                                struct fb_info *info)
++ *      {
++ *              *var = info->var;
++ *              return 0;
++ *      }
++ *
++ *      static int MB86xxxfb_set_par(struct fb_info *info)
++ *      {
++ *              init your hardware here
++ *      }
++ *
++ *  Returns negative errno on error, or zero on success.
++ */
++static int MB86xxxfb_set_par(struct fb_info *info)
++{
++    struct Disp_Regs regs,*pregs;
++
++    u32 pllclock=0;
++    u32 dram_phys_base = ((struct MB86xxx_par *)info->par)->map_base_phys;
++
++    switch (((struct MB86xxx_par*)(info->par))->chipset)
++    {
++    case MB86R01:
++        pllclock = PLLCLOCK_MB86R01;
++        break;
++    case MB86297:
++        pllclock = PLLCLOCK_MB86297;
++        break;
++    case MB86296:
++        pllclock = PLLCLOCK_MB86296;
++        break;
++    default:
++        pllclock = 0;
++        break;
++    }
++    
++    memset(&regs, 0, sizeof(struct Disp_Regs));
++
++    pregs = ((struct MB86xxx_par *)info->par)->Disp_Regs;
++
++    printk("setup video mode: %dx%d @ %d bpp\n",info->var.xres,info->var.yres,info->var.bits_per_pixel);
++    /* setup fb-structures */
++#if (PANNING==1)
++    info->var.xres_virtual = info->var.xres << 1;
++    info->var.yres_virtual = info->var.yres << 1;
++#else
++    info->var.xres_virtual = info->var.xres;
++    info->var.yres_virtual = info->var.yres;
++#endif
++    info->fix.line_length  = info->var.xres_virtual << (info->var.bits_per_pixel>>4);
++    info->screen_size = info->fix.line_length * info->var.yres_virtual;
++
++    /* display controller output registers */
++
++    regs.HTP.HTP_BITS.HTP = info->var.xres + info->var.left_margin + info->var.hsync_len + info->var.right_margin - 1;
++    regs.HDB_HDP.HDB_HDP_BITS.HDB = info->var.xres - 1;
++    regs.HDB_HDP.HDB_HDP_BITS.HDP = info->var.xres - 1;
++
++    regs.VSWH_VSW_HSW_HSP.VSWH_VSW_HSW_HSP_BITS.VSWH = 0;
++    regs.VSWH_VSW_HSW_HSP.VSWH_VSW_HSW_HSP_BITS.VSW  = info->var.lower_margin - 1;
++    regs.VSWH_VSW_HSW_HSP.VSWH_VSW_HSW_HSP_BITS.HSW  = info->var.hsync_len - 1;
++    regs.VSWH_VSW_HSW_HSP.VSWH_VSW_HSW_HSP_BITS.HSP  = info->var.xres + info->var.left_margin - 1;
++
++    regs.VTR.VTR_BITS.VTR = info->var.yres + info->var.upper_margin + info->var.vsync_len + info->var.lower_margin - 1;
++    
++    regs.VDP_VSP.VDP_VSP_BITS.VDP = info->var.yres - 1;
++    regs.VDP_VSP.VDP_VSP_BITS.VSP = info->var.yres + info->var.upper_margin - 1;
++
++    regs.WY_WX.WY_WX_BITS.WX = 0;
++    regs.WY_WX.WY_WX_BITS.WY = 0;
++
++    regs.WH_WW.WH_WW_BITS.WW = info->var.xres - 1;
++    regs.WH_WW.WH_WW_BITS.WH = info->var.yres - 1;
++
++    regs.DCM1.DCM1_REG=0;
++    switch (info->var.xres)
++    {
++#ifndef CONFIG_PCI
++    case 320:
++        regs.DCM1.DCM1_BITS.SC = (((pllclock / 8 )+(pllclock / 7))/2) + 1; /* MB86R01 only */
++	break;
++#endif
++    case 640:
++        regs.DCM1.DCM1_BITS.SC = (pllclock / 25)-1;
++        break;
++    case 800:
++        regs.DCM1.DCM1_BITS.SC = (pllclock / 40)-1;
++        break;
++    case 1024:
++        regs.DCM1.DCM1_BITS.SC = (pllclock / 65)-1;
++        break;
++    default:
++        printk("%s:should not come to here !\n",__func__);
++        return -EINVAL;
++    }
++
++    /* display controller layer0 registers */
++    regs.L0M.L0M_BITS.L0H = info->var.yres_virtual - 1;
++    regs.L0M.L0M_BITS.L0W = (info->var.xres_virtual >> (6 - (info->var.bits_per_pixel >> 4)));
++
++    if (info->var.bits_per_pixel == 8)
++    {
++        regs.L0M.L0M_BITS.L0C = 0;
++    }
++    else
++    {
++        regs.L0M.L0M_BITS.L0C = 1;
++    }
++
++    regs.L0OA.L0OA_BITS.L0OA = info->fix.smem_start - dram_phys_base;
++    regs.L0DA.L0DA_BITS.L0DA = info->fix.smem_start - dram_phys_base;
++    regs.L0DY_L0DX.L0DY_L0DX_BITS.L0DY = 0;
++    regs.L0DY_L0DX.L0DY_L0DX_BITS.L0DX = 0;
++
++    regs.L0EM.L0EM_BITS.L0WP = 1;
++    regs.L0EM.L0EM_BITS.L0EC = info->var.bits_per_pixel >> 5; /* 0: 8bit or 16bit | 1:24-bit */
++
++    regs.L0WY_L0WX.L0WY_L0WX_BITS.L0WX = 0;
++    regs.L0WY_L0WX.L0WY_L0WX_BITS.L0WY = 0;
++    
++    regs.L0WW_L0WH.L0WW_L0WH_BITS.L0WW = info->var.xres;
++    regs.L0WW_L0WH.L0WW_L0WH_BITS.L0WH = info->var.yres - 1;
++
++    /* enable L0 & display output */
++
++    regs.DCM1.DCM1_BITS.SYNC = 0;
++    regs.DCM1.DCM1_BITS.CKS  = 0;
++    regs.DCM1.DCM1_BITS.ESY  = 0;
++    regs.DCM1.DCM1_BITS.DEN  = 1;
++    regs.DCM1.DCM1_BITS.L0E  = 1;
++
++    _86xxxfb_writel(regs.L0WW_L0WH.L0WW_L0WH_REG, &pregs->L0WW_L0WH.L0WW_L0WH_REG);
++    _86xxxfb_writel(regs.L0WY_L0WX.L0WY_L0WX_REG, &pregs->L0WY_L0WX.L0WY_L0WX_REG);
++    _86xxxfb_writel(regs.L0EM.L0EM_REG, &pregs->L0EM.L0EM_REG);
++    _86xxxfb_writel(regs.L0DY_L0DX.L0DY_L0DX_REG, &pregs->L0DY_L0DX.L0DY_L0DX_REG);
++    _86xxxfb_writel(regs.L0DA.L0DA_REG, &pregs->L0DA.L0DA_REG);
++    _86xxxfb_writel(regs.L0OA.L0OA_REG, &pregs->L0OA.L0OA_REG);
++    _86xxxfb_writel(regs.L0M.L0M_REG, &pregs->L0M.L0M_REG);
++
++    _86xxxfb_writel(regs.WH_WW.WH_WW_REG, &pregs->WH_WW.WH_WW_REG);
++    _86xxxfb_writel(regs.WY_WX.WY_WX_REG, &pregs->WY_WX.WY_WX_REG);
++    _86xxxfb_writel(regs.VDP_VSP.VDP_VSP_REG, &pregs->VDP_VSP.VDP_VSP_REG);
++    _86xxxfb_writel(regs.VTR.VTR_REG, &pregs->VTR.VTR_REG);
++    _86xxxfb_writel(regs.VSWH_VSW_HSW_HSP.VSWH_VSW_HSW_HSP_REG, &pregs->VSWH_VSW_HSW_HSP.VSWH_VSW_HSW_HSP_REG);
++    _86xxxfb_writel(regs.HDB_HDP.HDB_HDP_REG, &pregs->HDB_HDP.HDB_HDP_REG);
++    _86xxxfb_writel(regs.HTP.HTP_REG, &pregs->HTP.HTP_REG);
++    
++    _86xxxfb_writel(regs.DCM1.DCM1_REG, &pregs->DCM1.DCM1_REG);
++
++    return 0;
++}
++
++/**
++ *      MB86xxxfb_setcolreg - Optional function. Sets a color register.
++ *      @regno: Which register in the CLUT we are programming 
++ *      @red: The red value which can be up to 16 bits wide 
++ *      @green: The green value which can be up to 16 bits wide 
++ *      @blue:  The blue value which can be up to 16 bits wide.
++ *      @transp: If supported, the alpha value which can be up to 16 bits wide.
++ *      @info: frame buffer info structure
++ * 
++ *      Set a single color register. The values supplied have a 16 bit
++ *      magnitude which needs to be scaled in this function for the hardware. 
++ *      Things to take into consideration are how many color registers, if
++ *      any, are supported with the current color visual. With truecolor mode
++ *      no color palettes are supported. Here a pseudo palette is created
++ *      which we store the value in pseudo_palette in struct fb_info. For
++ *      pseudocolor mode we have a limited color palette. To deal with this
++ *      we can program what color is displayed for a particular pixel value.
++ *      DirectColor is similar in that we can program each color field. If
++ *      we have a static colormap we don't need to implement this function. 
++ * 
++ *      Returns negative errno on error, or zero on success.
++ */
++
++static int MB86xxxfb_setcolreg( unsigned int regno,
++                                unsigned int red,
++                                unsigned int green,
++                                unsigned int blue,
++                                unsigned int transp,
++                                struct fb_info *info )
++{
++
++    unsigned long *palette;
++
++    /* grayscale works only partially under directcolor */
++    if (info->var.grayscale) {
++       /* grayscale = 0.30*R + 0.59*G + 0.11*B */
++       red = green = blue = (red * 77 + green * 151 + blue * 28) >> 8;
++    }
++
++    if (info->fix.visual == FB_VISUAL_PSEUDOCOLOR)
++    {
++        if ( regno > 255 )
++            return -EINVAL;
++
++        /* update clut layer 0 */
++        palette = (unsigned long*)(((struct MB86xxx_par *)info->par)->Disp_Regs);
++        palette += 0x100; /* palette l0 start */
++        palette += regno;
++        _86xxxfb_writel( (transp << 16 & 0x80000000) |
++                        (red    <<  8 & 0x00fc0000) |
++                        (green        & 0x0000fc00) |
++                        (blue   >>  8 & 0x000000fc), palette );
++    }
++
++    if (info->fix.visual == FB_VISUAL_TRUECOLOR ||
++    info->fix.visual == FB_VISUAL_DIRECTCOLOR) {
++        if (info->var.bits_per_pixel > 8)
++        {
++            unsigned int v;
++            if (regno >= 16)
++                return -EINVAL;
++
++#define CNVT_TOHW(val,width) ((((val)<<(width))+0x7FFF-(val))>>16)
++            red    = CNVT_TOHW(red, info->var.red.length);
++            green  = CNVT_TOHW(green, info->var.green.length);
++            blue   = CNVT_TOHW(blue, info->var.blue.length);
++            transp = CNVT_TOHW(transp, info->var.transp.length);
++#undef CNVT_TOHW
++            v =     (red    << info->var.red.offset)   |
++            (green  << info->var.green.offset) |
++                (blue   << info->var.blue.offset)  |
++                (transp << info->var.transp.offset);
++
++            ((u32*)(info->pseudo_palette))[regno] = v;
++        }
++    }
++    return 0;
++}
++
++/**
++ *      MB86xxxfb_pan_display - NOT a required function. Pans the display.
++ *      @var: frame buffer variable screen structure
++ *      @info: frame buffer structure that represents a single frame buffer
++ *
++ *    Pan (or wrap, depending on the `vmode' field) the display using the
++ *      `xoffset' and `yoffset' fields of the `var' structure.
++ *      If the values don't fit, return -EINVAL.
++ *
++ *      Returns negative errno on error, or zero on success.
++ */
++int MB86xxxfb_pan_display(struct fb_var_screeninfo *var,
++                          struct fb_info *info)
++{
++    /*
++     * If your hardware does not support panning, _do_ _not_ implement this
++     * function. Creating a dummy function will just confuse user apps.
++     */
++
++    /*
++     * Note that even if this function is fully functional, a setting of
++     * 0 in both xpanstep and ypanstep means that this function will never
++     * get called.
++     */
++    struct Disp_Regs *regs;
++    u32 dram_phys_base = ((struct MB86xxx_par *)info->par)->map_base_phys;
++
++    regs = ((struct MB86xxx_par *)info->par)->Disp_Regs;
++
++    //printk("called %s:%d\n",__func__,var->vmode);
++    //printk("xoffset: %d yoffset: %d\n",var->xoffset,var->yoffset);
++
++    regs->L0DA.L0DA_BITS.L0DA  = info->fix.smem_start - dram_phys_base;
++    regs->L0DA.L0DA_BITS.L0DA += var->xoffset * (var->bits_per_pixel>>3);
++    regs->L0DA.L0DA_BITS.L0DA += var->yoffset * info->fix.line_length;
++    regs->L0WY_L0WX.L0WY_L0WX_BITS.L0WX = var->xoffset;
++    regs->L0WY_L0WX.L0WY_L0WX_BITS.L0WY = var->yoffset;
++   
++    return 0;
++}
++
++/**
++ *      MB86xxxfb_blank - NOT a required function. Blanks the display.
++ *      @blank_mode: the blank mode we want. 
++ *      @info: frame buffer structure that represents a single frame buffer
++ *
++ *      Blank the screen if blank_mode != FB_BLANK_UNBLANK, else unblank.
++ *      Return 0 if blanking succeeded, != 0 if un-/blanking failed due to
++ *      e.g. a video mode which doesn't support it.
++ *
++ *      Implements VESA suspend and powerdown modes on hardware that supports
++ *      disabling hsync/vsync:
++ *
++ *      FB_BLANK_NORMAL = display is blanked, syncs are on.
++ *      FB_BLANK_HSYNC_SUSPEND = hsync off
++ *      FB_BLANK_VSYNC_SUSPEND = vsync off
++ *      FB_BLANK_POWERDOWN =  hsync and vsync off
++ *
++ *      If implementing this function, at least support FB_BLANK_UNBLANK.
++ *      Return !0 for any modes that are unimplemented.
++ *
++ */
++int MB86xxxfb_blank(int blank_mode, struct fb_info *info)
++{
++    struct Disp_Regs *regs;
++    
++    regs = ((struct MB86xxx_par *)info->par)->Disp_Regs;
++
++    switch (blank_mode)
++    {
++    case FB_BLANK_UNBLANK: /* enable output & Layer 0 */
++        regs->DCM1.DCM1_BITS.L0E = 1;
++        regs->DCM1.DCM1_BITS.DEN = 1;
++        break;
++    case FB_BLANK_NORMAL: /* disable Layer 0 */
++        regs->DCM1.DCM1_BITS.L0E = 0;
++        break;
++    case FB_BLANK_HSYNC_SUSPEND:
++        return -EINVAL;
++        break;
++    case FB_BLANK_VSYNC_SUSPEND:
++        return -EINVAL;
++        break;
++    case FB_BLANK_POWERDOWN: /* disable output */
++        regs->DCM1.DCM1_BITS.DEN = 0;
++        break;
++    default:
++        break;
++    }
++        
++    return 0;
++}
++
++/* ------------ Accelerated Functions --------------------- */
++
++/*
++ * We provide our own functions if we have hardware acceleration
++ * or non packed pixel format layouts. If we have no hardware 
++ * acceleration, we can use a generic unaccelerated function. If using
++ * a pack pixel format just use the functions in cfb_*.c. Each file 
++ * has one of the three different accel functions we support.
++ */
++#if (HW_ACCEL==1)
++**
++ *    MB86xxxfb_sync - NOT a required function. Normally the accel engine 
++ *             for a graphics card take a specific amount of time.
++ *             Often we have to wait for the accelerator to finish
++ *             its operation before we can write to the framebuffer
++ *             so we can have consistent display output. 
++ *
++ *      @info: frame buffer structure that represents a single frame buffer
++ *
++ *      If the driver has implemented its own hardware-based drawing function,
++ *      implementing this function is highly recommended.
++ */
++int MB86xxxfb_sync(struct fb_info *info)
++{
++    struct Host_Regs *regs;
++    u32 timeout,status;
++//printk("%s\n",__func__);
++    regs = ((struct MB86xxx_par *)info->par)->Host_Regs;
++    return 0;
++    timeout = 50000;
++    do
++    {
++        timeout--;
++        status = regs->LSTA.LSTA_REG;
++        //status = regs->IST.IST_REG & 0x02;
++    }
++    while(!status && timeout);
++    if (!timeout){
++            //printk("%s: timed out\n",__func__);
++    }
++    return 0;
++}
++
++void MB86xxx_Flush(struct fb_info *info, unsigned long source, unsigned long count)
++{
++    struct Host_Regs *regs;
++    u32 status;
++    int timeout = 50000;
++//printk("%s\n",__func__);
++    regs = ((struct MB86xxx_par *)info->par)->Host_Regs;
++
++    do
++    {
++        status = regs->LSTA.LSTA_REG;
++        timeout--;
++    }while (status && timeout);
++
++    if(!timeout)
++        //printk("%s timed out\n",__func__);
++
++    regs->LSA.LSA_REG    = source;
++    regs->LCO.LCO_REG    = count;
++    regs->LREQ.LREQ_REG  = 1;
++
++}
++
++
++/**
++ *      MB86xxxfb_fillrect - REQUIRED function. Can use generic routines if 
++ *      non acclerated hardware and packed pixel based.
++ *      Draws a rectangle on the screen.
++ *
++ *      @info: frame buffer structure that represents a single frame buffer
++ *      @region: The structure representing the rectangular region we 
++ *       wish to draw to.
++ *
++ *      This drawing operation places/removes a retangle on the screen 
++ *      depending on the rastering operation with the value of color which
++ *      is in the current color depth format.
++ */
++
++void MB86xxxfb_fillrect(struct fb_info *p, const struct fb_fillrect *region)
++{
++/*    Meaning of struct fb_fillrect
++ *
++ *    @dx: The x and y corrdinates of the upper left hand corner of the 
++ *    @dy: area we want to draw to. 
++ *    @width: How wide the rectangle is we want to draw.
++ *    @height: How tall the rectangle is we want to draw.
++ *    @color:    The color to fill in the rectangle with. 
++ *    @rop: The raster operation. We can draw the rectangle with a COPY
++ *          of XOR which provides erasing effect. 
++ */
++    u32 *dlbuf, source, count, width;
++    u32 dy, dx;
++
++    dlbuf = (u32 *)((u32)p->screen_base    + p->fix.smem_len - PIXMAP_SIZE);
++    source =             p->fix.smem_start + p->fix.smem_len - PIXMAP_SIZE;
++
++    count = 0;
++#if 0
++    printk("dx: %d\ndy: %d\nwidth: %d\nheight: %d\ncolor: %d\nrop: %d\n",region->dx,region->dy, region->width, region->height,region->color,region->rop);
++#endif                                                                   
++
++    width = region->width;
++    if (width<16){                                               
++        printk("%s: region width < 16\n",__func__);
++        width = 16;
++    }
++
++    /* DrawDimension */
++    dlbuf[count++] = (0xf1 << 24) | (1 << 16) | MDR0;
++    dlbuf[count++] = (p->var.bits_per_pixel>8)<<15;
++    dlbuf[count++] = (0xf1 << 24) | (1 << 16) | DRAW_BASE;
++    dlbuf[count++] = p->fix.smem_start;
++    dlbuf[count++] = (0xf1 << 24) | (1 << 16) | X_RES;
++    dlbuf[count++] = p->var.xres_virtual;
++    
++    /* Set Color Register */
++    dlbuf[count++] = (0xce << 24) | 0;
++    dlbuf[count++] = region->color;
++    dlbuf[count++] = (0xce << 24) | (1<<16);
++    dlbuf[count++] = 0x0;
++
++    dx = p->var.xoffset + region->dx;
++    dy = p->var.yoffset + region->dy;
++
++    /* DrawRectP BltFill */
++    dlbuf[count++] = (0x09 << 24) | (0x41 << 16);
++    dlbuf[count++] = (dy             << 16) | dx;
++    dlbuf[count++] = (region->height << 16) | width;
++
++    dlbuf[count++] = 0xfd << 24; /* generate interrupt event */
++
++    MB86xxx_Flush(p, source, count);
++}
++
++/**
++ *      MB86xxxfb_copyarea - REQUIRED function. Can use generic routines if
++ *                       non acclerated hardware and packed pixel based.
++ *                       Copies one area of the screen to another area.
++ *
++ *      @info: frame buffer structure that represents a single frame buffer
++ *      @area: Structure providing the data to copy the framebuffer contents
++ *           from one region to another.
++ *
++ *      This drawing operation copies a rectangular area from one area of the
++ *    screen to another area.
++ */
++void MB86xxxfb_copyarea(struct fb_info *p, const struct fb_copyarea *area) 
++{
++/*
++ *      @dx: The x and y coordinates of the upper left hand corner of the
++ *      @dy: destination area on the screen.
++ *      @width: How wide the rectangle is we want to copy.
++ *      @height: How tall the rectangle is we want to copy.
++ *      @sx: The x and y coordinates of the upper left hand corner of the
++ *      @sy: source area on the screen.
++ */
++
++    u32 *dlbuf, source, count,command;
++    u32 dx,dy,sx,sy;
++
++    dlbuf = (u32 *)((u32)p->screen_base    + p->fix.smem_len - PIXMAP_SIZE);
++    source =             p->fix.smem_start + p->fix.smem_len - PIXMAP_SIZE;
++
++    count = 0;
++
++    /* DrawDimension */
++    dlbuf[count++] = (0xf1 << 24) | (1 << 16) | MDR0;
++    dlbuf[count++] = (p->var.bits_per_pixel>8)<<15;
++    dlbuf[count++] = (0xf1 << 24) | (1 << 16) | DRAW_BASE;
++    dlbuf[count++] = p->fix.smem_start;
++    dlbuf[count++] = (0xf1 << 24) | (1 << 16) | X_RES;
++    dlbuf[count++] = p->var.xres_virtual;
++
++    command = 0x44000000; /* default: start from topleft corner */
++
++    if ( (area->sx < area->dx + area->width ) && (area->sx + area->width  > area->dx) &&
++         (area->sy < area->dy + area->height) && (area->sy + area->height > area->dy) ) /* overlapping rectangles */
++    {
++        if ( area->sx > area->dx )
++        {
++            if ( area->sy > area->dy )
++            {
++                command = 0x44000000; /* start from topleft corner */
++            }
++            else
++            {
++                command = 0x46000000; /* start from bottomleft corner */
++            }
++        }
++        else
++        {
++            if ( area->sy > area->dy )
++            {
++                command = 0x45000000; /* start from topright corner */
++            }
++            else
++            {
++                command = 0x47000000; /* start from bottomright corner */
++            }
++        }
++    }
++
++    /* BltCopy BltFill */
++    sx = p->var.xoffset + area->sx;
++    sy = p->var.yoffset + area->sy;
++
++    dx = p->var.xoffset + area->dx;
++    dy = p->var.yoffset + area->dy;
++       
++    dlbuf[count++] = (0x0d << 24) | command;
++    dlbuf[count++] = (      sy     << 16) | sx;
++    dlbuf[count++] = (      dy     << 16) | dx;
++    dlbuf[count++] = (area->height << 16) | area->width;
++
++    dlbuf[count++] = 0xfd << 24; /* generate interrupt event */
++
++    MB86xxx_Flush(p, source, count);
++}
++
++
++/**
++ *      MB86xxxfb_imageblit - REQUIRED function. Can use generic routines if
++ *                        non acclerated hardware and packed pixel based.
++ *                        Copies a image from system memory to the screen. 
++ *
++ *      @info: frame buffer structure that represents a single frame buffer
++ *    @image:    structure defining the image.
++ *
++ *      This drawing operation draws a image on the screen. It can be a 
++ *    mono image (needed for font handling) or a color image (needed for
++ *    tux). 
++ */
++
++void MB86xxxfb_imageblit(struct fb_info *p, struct fb_image *image) 
++{
++/*
++ *      @dx: The x and y coordinates of the upper left hand corner of the
++ *      @dy: destination area to place the image on the screen.
++ *      @width: How wide the image is we want to copy.
++ *      @height: How tall the image is we want to copy.
++ *      @fg_color: For mono bitmap images this is color data for     
++ *      @bg_color: the foreground and background of the image to
++ *           write directly to the framebuffer.
++ *    @depth:    How many bits represent a single pixel for this image.
++ *    @data: The actual data used to construct the image on the display.
++ *    @cmap: The colormap used for color images.   
++ */
++
++/*
++ * The generic function, cfb_imageblit, expects that the bitmap scanlines are
++ * padded to the next byte.  Most hardware accelerators may require padding to
++ * the next u16 or the next u32.  If that is the case, the driver can specify
++ * this by setting info->pixmap.scan_align = 2 or 4.  See a more
++ * comprehensive description of the pixmap below.
++ */
++#define SW
++#ifndef SW
++
++    /* |31        24|23       16|15         |          0|*/
++    /* |DrawBitmapP | Command   |              Count    | Command = (BltDraw 0x42| DrawBitmap 0x43)*/
++    /* | RYs                    |               RXs     |*/
++    /* | RsizeY                 |           RsizeX      |*/
++    /* |                Pattern Data                    |*/
++
++    u32 *dlbuf, source, data, count, tmp, width;
++    u32 *src = (u32 *)image->data;
++    u32 dx,dy;
++    u16 *palette = (u16 *) p->pseudo_palette;
++
++    if ((image->width==0) || (image->height==0))
++        return;
++
++    if (image->depth>1)
++        printk("x: %d\ny: %d\nw: %d\nh: %d\n",image->dx, image->dy, image->width, image->height);
++
++    width = (image->width + 31) >> 5;
++    data = width * image->height;
++
++    dlbuf = (u32 *)((u32)p->screen_base    + p->fix.smem_len - PIXMAP_SIZE);
++    source =             p->fix.smem_start + p->fix.smem_len - PIXMAP_SIZE;
++
++    count = 0;
++
++    /* DrawDimension */
++    dlbuf[count++] = (0xf1 << 24) | (1 << 16) | MDR0;
++    dlbuf[count++] = (p->var.bits_per_pixel>8)<<15;
++    dlbuf[count++] = (0xf1 << 24) | (1 << 16) | DRAW_BASE;
++    dlbuf[count++] = p->fix.smem_start;
++    dlbuf[count++] = (0xf1 << 24) | (1 << 16) | X_RES;
++    dlbuf[count++] = p->var.xres_virtual;
++
++    /* Set Color Register */
++
++    dlbuf[count++] = (0xce << 24);
++    if (p->var.bits_per_pixel==8)
++        dlbuf[count++] = image->fg_color;
++    else
++        dlbuf[count++] = palette[image->fg_color];
++    
++    dlbuf[count++] = (0xce << 24) | (1<<16);
++    if (p->var.bits_per_pixel==8)
++        dlbuf[count++] = image->bg_color;
++    else
++        dlbuf[count++] = palette[image->bg_color];
++
++    /* Destination Stride */
++
++    dlbuf[count++] = (0xf1 << 24) | (1 << 16) | STRIDE;
++    dlbuf[count++] = p->var.xres_virtual << 16;
++
++    dx = image->dx + p->var.xoffset;
++    dy = image->dy + p->var.yoffset;
++
++    /*Blit Command & Data*/
++    dlbuf[count++] = (0x0b << 24) | (0x43 << 16) | (data + 2);
++    dlbuf[count++] = (dy            << 16) | dx;
++    dlbuf[count++] = (image->height << 16) | image->width;
++
++    /* copy pattern data */
++
++    while(data--){
++        tmp = *(src++);
++        tmp = (tmp<<24) | (tmp>>24) | ((tmp &0xff0000)>>8) | ((tmp &0xff00)<<8);
++        *(dlbuf + count++) = tmp;
++    }
++    dlbuf[count++] = 0xfd << 24; /* generate interrupt event */
++
++    /* flush */
++    MB86xxx_Flush(p, source, count);
++#else //SW
++    u32 col,coltemp;
++    u32 *addr,dest;
++    char *temp,bits;
++    u32 x,x1,y,a1;
++
++
++    coltemp = 0;
++
++//    printk("%s:scan_align: %d\n",__func__,p->pixmap.scan_align);
++
++    temp  = image->data;
++    dest  = (unsigned long)p->screen_base;
++    dest += image->dy * p->fix.line_length;
++    dest += image->dx << (p->var.bits_per_pixel>>4);
++
++    if (image->depth == 1)
++    {
++        for (y=0; y<image->height;y++)
++        {
++            addr  = (unsigned long*)dest;
++            for (x=0;x<image->width;x+=8)
++            {
++                bits = *(temp++);
++                a1 = 0;
++                for (x1=8; x1--;)
++                {
++                    if (p->var.bits_per_pixel == 16)
++                    {
++                        if ((x1%2)==1) // calculate
++                        {
++                            coltemp = 0;
++                            if (((bits>>x1) & 1) && image->fg_color){
++                                coltemp = 0x7fff;
++                            }
++                            else{
++                                coltemp = 0;
++                            }
++                        }
++                        else        // calculate & write
++                        {
++                            col = coltemp;
++                            if (((bits>>x1) & 1) && image->fg_color){
++                                col |= 0x7fff0000;
++                            }
++                            *(addr + (x>>1) + a1++) = col;
++                        }
++                    }
++                    else
++                    {
++                        if (x1%4==0)
++                            coltemp = 0;
++
++                        coltemp >>=8;
++
++                        if ((bits>>x1) & 1)
++                            coltemp |= image->fg_color<<24;
++                        else
++                            coltemp |= image->bg_color<<24;
++
++                        if (x1%4==1)
++                            *(addr + (x>>2) + a1++) = coltemp;
++                    }
++                }
++            }
++            dest += p->fix.line_length;
++            if (image->width % 32)
++                temp += (32 - (image->width % 32))>>3;
++        }
++    }
++    else
++    {
++        for (y=0; y<image->height;y++)
++        {
++            addr  = (unsigned long*)dest;
++            if (p->var.bits_per_pixel == 32)
++            {
++                for (x=0;x<image->width;x++){
++                    *(addr + x) = *(temp++);
++                }
++            }
++            else
++            {
++                for (x=0;x<image->width;x+=2){
++                    *(addr + (x>>1)) = *(temp++);
++                }
++            }
++            dest += p->fix.line_length;
++        }
++    }
++#endif // SW
++}
++#endif /* (HW_ACCEL==1) */
++/**
++ *    MB86xxxfb_cursor -     OPTIONAL. If your hardware lacks support
++ *            for a cursor, leave this field NULL.
++ *
++ *      @info: frame buffer structure that represents a single frame buffer
++ *    @cursor: structure defining the cursor to draw.
++ *
++ *      This operation is used to set or alter the properities of the
++ *    cursor.
++ *
++ *    Returns negative errno on error, or zero on success.
++ */
++#if (HW_CURSOR==1)
++int MB86xxxfb_cursor(struct fb_info *info, struct fb_cursor *cursor)
++{
++    struct Disp_Regs *regs;
++    struct fb_cursor *cc;
++    u32 count, x, y, tmp=0;
++    unsigned char cursor_data;
++    unsigned char cd ,md;
++    volatile u32 *cursor_virt_base;
++
++    regs = ((struct MB86xxx_par *)info->par)->Disp_Regs;
++
++    /* enable or disable the cursor */
++    regs->CUTC_CPM.CUTC_CPM_BITS.CUE0 = cursor->enable;
++   
++    if ( cursor->set & (FB_CUR_SETIMAGE | FB_CUR_SETSHAPE | FB_CUR_SETSIZE) ) /* update cursor image data */
++    {
++        cursor_virt_base = (u32 *)(((struct MB86xxx_par *)info->par)->Cursor0_Base_virt);
++        cc =(struct fb_cursor*) &(((struct MB86xxx_par *)info->par)->current_cursor);
++
++        if (cursor->set & FB_CUR_SETSIZE)
++        {
++            cc->image.width  = cursor->image.width;
++            cc->image.height = cursor->image.height;
++        }
++
++        count=0;
++        cursor_data = 0;
++
++        if (cursor->set & (FB_CUR_SETIMAGE | FB_CUR_SETSHAPE))
++        {
++            for (y=0;y<64*16;y++)
++            {
++                cursor_virt_base[y]=0x0;
++            }
++            for (y=0; y<cc->image.height; y++)
++            {
++                for (x=0; x<cc->image.width; x++)
++                {
++                    if ((count%4)==0)
++                        tmp=0;
++                    if ((count%8)==0)
++                    {
++                        cd = *(cursor->image.data + (count>>3));/* read cursor image data */
++                        md = *(cursor->mask       + (count>>3));/* read cursor mask  data */
++                        
++                        if (cursor->rop)/*XOR*/
++                        {
++                            cursor_data = cd ^ md;
++                        }
++                        else            /*AND*/
++                        {
++                            cursor_data = cd & md;
++                        }
++                        //printk("%02x %02x %02x\n",cd,md,cursor_data);
++                    }
++                    tmp >>= 8;
++                    tmp  |= ((cursor_data & (1<<(7-(count%8))))?cursor->image.fg_color:cursor->image.bg_color)<<24;
++                    if (count%4 ==3){
++                        cursor_virt_base[(y<<4)+(x>>2)]= tmp;
++                        //printk("0x%08x = 0x%08x\n",&(cursor_virt_base[(y<<4)+(x>>2)]),cursor_virt_base[(y<<4)+(x>>2)]);
++                    }
++                    count++;
++                }
++            }
++        }
++    }
++
++    if (cursor->set & FB_CUR_SETPOS)
++    {
++        /* update cursor position */
++        regs->CUXY0.CUXY0_BITS.CUX0 = cursor->image.dx;
++        regs->CUXY0.CUXY0_BITS.CUY0 = cursor->image.dy;
++    }
++
++    if (cursor->set & FB_CUR_SETCMAP)
++    {
++        /* set cursor color map */
++//printk("%s:FB_CUR_SETCMAP\nfg_color :%d\nbg_color:%d\n",__func__, cursor->image.fg_color,cursor->image.bg_color);
++        regs->CUTC_CPM.CUTC_CPM_BITS.CUTC = cursor->image.bg_color;
++        regs->CUTC_CPM.CUTC_CPM_BITS.CUZT = cursor->image.bg_color?1:0;
++    }
++
++    return 0;
++}
++#endif
++
++    /*
++     *  Initialization
++     */
++
++#ifndef CONFIG_PCI
++static int __init MB86xxxfb_probe(struct platform_device *pdev) /* MB86R01 */
++#else
++static int __devinit MB86xxxfb_probe(struct pci_dev *dev,       /* MB86296 MB86297 */
++                  const struct pci_device_id *ent)
++#endif /* CONFIG_PCI */
++{
++    struct fb_info *info;
++    struct MB86xxx_par *par;
++#ifndef CONFIG_PCI
++    struct device *device = &pdev->dev;
++    struct resource *prsc;
++#else
++    struct device *device = &dev->dev;
++    u32 dev_id = ent->device;
++#endif /* CONFIG_PCI */
++    int retval;    
++    int cmap_len = 256;
++
++    /*
++     * Dynamically allocate info and par
++     */
++
++    info = (struct fb_info*) framebuffer_alloc(sizeof(struct fb_info), device);
++    if (!info) {
++        goto err_alloc_fb_info;
++    }
++
++    par  = kmalloc(sizeof(struct MB86xxx_par), GFP_KERNEL);
++    if (!par) {
++        goto err_alloc_par;
++    }
++
++    info->par   = par;
++    info->var   = MB86xxx_var; /* default values */
++    info->fbops = &MB86xxxfb_ops;
++    info->fix   = MB86xxx_fix; 
++
++    /* initialise pseudo_palette */
++    info->pseudo_palette = par->pseudo_palette;
++
++    /* 
++     * Here we set the screen_base to the virtual memory address
++     * for the framebuffer.
++     */
++#ifndef CONFIG_PCI
++    prsc = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++    if (!prsc) {
++        printk("%s: cannot get resource\n",__func__);
++        goto err_get_resource;
++    }
++    par->chipset =  MB86R01;
++    /* Request the I/O MEM resource.  */
++
++    /* MMIO mapping */
++    info->fix.mmio_start = prsc->start;
++    info->fix.mmio_len   = prsc->end - prsc->start + 1;
++
++    if (!request_mem_region(info->fix.mmio_start, info->fix.mmio_len, "MB86R01"))
++    {
++        printk("%s: cannot request mem_region mmio_reg\n", __func__);
++        goto err_request_mmio;
++    }
++    par->mmio = ioremap(info->fix.mmio_start, info->fix.mmio_len);
++    if (!par->mmio)
++    {
++    printk("%s: cannot remap mmio\n", __func__);
++        goto err_map_mmio;
++    }
++    GDC_MMIO_BASE_VIRT = (void*)par->mmio;
++
++    par->Host_Regs_MB86R01 = (struct Host_Regs_MB86R01 *) par->mmio;
++    par->Disp_Regs         = (struct Disp_Regs*)(par->mmio + REG_BASE_MB86R01_DISPLAY0);
++
++    info->fix.smem_len   = FB_MAP_SIZE; /* max frame buffer size */
++    info->fix.smem_start = DRAM_TOP_MB86R01 - FB_MAP_SIZE;
++    par->map_base_phys   = 0;
++    info->screen_base = ioremap(info->fix.smem_start, info->fix.smem_len);
++
++    if (!info->screen_base) {
++        printk("%s: cannot allocate fb_base\n", __func__);
++        goto err_map_smem;
++    }
++
++    strcpy (info->fix.id,"MB86R01");
++#else /* MB86296 MB86297 */
++/**********************************************************************************************************/
++    /* pci mapping */
++        if (pci_enable_device(dev) != 0) {
++                printk("%s: Can't enable PCI device\n",__func__);
++                goto err_get_resource;
++        }
++        info->device = device;
++        GDC_PCI_DEV = dev;
++        if (dev_id == PCI_DEVICE_ID_FUJITSU_CORAL)
++        {
++            /* CORALPA */
++            par->map_base_phys    = pci_resource_start(dev, 0);
++            par->map_size         = pci_resource_len(dev, 0);
++            info->fix.smem_start  = par->map_base_phys + par->map_size - FB_MAP_SIZE;
++            info->fix.mmio_start  = par->map_base_phys;
++#if !defined(FB_V03)
++            info->fix.mmio_start += REG_BASE_MB86296;
++            info->fix.mmio_len    = REG_SIZE_MB86296;
++#else
++            info->fix.mmio_len    = REG_BASE_MB86296 + REG_SIZE_MB86296;
++#endif
++            par->chipset          =  MB86296;
++            strcpy (info->fix.id,"MB86296");
++        }
++        else
++        {
++            /* CARMINE */
++            info->fix.smem_start   = pci_resource_start(dev, 2) + pci_resource_len(dev, 2) - FB_MAP_SIZE;
++            info->fix.mmio_start   = pci_resource_start(dev, 3);
++            info->fix.mmio_len     = pci_resource_len(dev, 3);
++            par->map_base_phys     = pci_resource_start(dev, 2);
++            par->chipset           =  MB86297;
++            strcpy (info->fix.id,"MB86297");
++        }
++        GDC_DRAM_BASE_PHYS = (void*)par->map_base_phys;
++        info->fix.smem_len     = FB_MAP_SIZE;
++
++        /* request mem region for mmio */
++        if (!request_mem_region (info->fix.mmio_start, info->fix.mmio_len, "MMIO"))
++        {
++            printk ("%s: cannot reserve memory region mmio\n",__func__);
++            goto err_request_mmio;
++        }
++        par->mmio = ioremap (info->fix.mmio_start, info->fix.mmio_len);
++        if (!par->mmio) {
++            printk("%s: cannot remap mmio\n", __func__);
++            goto err_map_mmio;
++        }
++        GDC_MMIO_BASE_VIRT = (void*)par->mmio;
++#if defined(FB_V03)
++        if (par->chipset == MB86296)
++        {
++            par->mmio += REG_BASE_MB86296;
++        }
++#endif /* FB_V03 */
++        if (par->chipset == MB86296)
++        {
++            /* CORALPA */
++            par->Host_Regs_MB86296 = (struct Host_Regs_MB86296*)(par->mmio + REG_BASE_HOST_MB86296);
++            par->Dram_Regs_MB86296 = (struct Dram_Regs_MB86296*)(par->mmio + REG_BASE_DRAM_MB86296);
++            par->Disp_Regs         = (struct Disp_Regs*)        (par->mmio + REG_BASE_DISPLAY_MB86296);
++            par->chipset           =  MB86296;
++          }
++        else
++        {
++            /* CARMINE */
++            par->Host_Regs_MB86297 = (struct Host_Regs_MB86297*)(par->mmio + REG_BASE_HOST_MB86297);
++            par->Dram_Regs_MB86297 = (struct Dram_Regs_MB86297*)(par->mmio + REG_BASE_DRAM_MB86297);
++            par->Disp_Regs         = (struct Disp_Regs*)        (par->mmio + REG_BASE_DISPLAY_MB86297);
++            par->chipset           =  MB86297;
++        }
++
++        /* request mem region for framebuffer */
++        if (!request_mem_region (info->fix.smem_start, info->fix.smem_len, "FBMEMORY"))
++        {
++            printk("%s: can't reserve memory region for fb_base\n", __func__);
++            goto err_request_smem;       
++        }
++        info->screen_base = ioremap (info->fix.smem_start, info->fix.smem_len);
++
++        if (!info->screen_base) {
++            printk("%s: can't remap fb_base\n", __func__);
++            goto err_map_smem;
++        }
++
++        if (par->chipset == MB86296)
++        {
++            /* CORALPA */
++            MB86296_init( info );
++        }
++        else
++        {
++            /* CARMINE */
++            MB86297_init( info );
++        }
++#endif /* MB86296 MB86297 */
++    /*
++     * Set up flags to indicate what sort of acceleration your
++     * driver can provide (pan/wrap/copyarea/etc.) and whether it
++     * is a module -- see FBINFO_* in include/linux/fb.h
++     *
++     * If your hardware can support any of the hardware accelerated functions
++     * fbcon performance will improve if info->flags is set properly.
++     *
++     * FBINFO_HWACCEL_COPYAREA - hardware moves
++     * FBINFO_HWACCEL_FILLRECT - hardware fills
++     * FBINFO_HWACCEL_IMAGEBLIT - hardware mono->color expansion
++     * FBINFO_HWACCEL_YPAN - hardware can pan display in y-axis
++     * FBINFO_HWACCEL_YWRAP - hardware can wrap display in y-axis
++     * FBINFO_HWACCEL_DISABLED - supports hardware accels, but disabled
++     * FBINFO_READS_FAST - if set, prefer moves over mono->color expansion
++     * FBINFO_MISC_TILEBLITTING - hardware can do tile blits
++     *
++     * NOTE: These are for fbcon use only.
++     */
++#if (HW_ACCEL==1)
++    info->flags = FBINFO_HWACCEL_COPYAREA | FBINFO_HWACCEL_FILLRECT | FBINFO_HWACCEL_IMAGEBLIT;
++#else
++    info->flags = FBINFO_DEFAULT;
++#endif /* (HW_ACCEL==1) */
++#if (PANNING==1)
++    info->flags |= FBINFO_HWACCEL_XPAN | FBINFO_HWACCEL_YPAN;
++#endif
++
++#if (HW_ACCEL==1)
++/********************* This stage is optional ******************************/
++     /*
++     * The struct pixmap is a scratch pad for the drawing functions. This
++     * is where the monochrome bitmap is constructed by the higher layers:
++     * and then passed to the accelerator.  For drivers that uses
++     * cfb_imageblit, you can skip this part.  For those that have a more
++     * rigorous requirement, this stage is needed
++     */
++
++    info->pixmap.addr = kmalloc(PIXMAP_SIZE, GFP_KERNEL);
++    if (!info->pixmap.addr){
++        printk("%s: cannot allocate pixmap\n", __func__);
++        goto err_alloc_pixmap;
++    }
++    info->pixmap.size = PIXMAP_SIZE;
++
++    /*
++     * FB_PIXMAP_SYSTEM - memory is in system ram:
++     * FB_PIXMAP_IO     - memory is iomapped
++     * FB_PIXMAP_SYNC   - if set, will call fb_sync() per access to pixmap,
++     *                    usually if FB_PIXMAP_IO is set.
++     *
++     */
++    info->pixmap.flags = FB_PIXMAP_IO | FB_PIXMAP_SYNC;
++
++    /*
++     * scan_align is the number of padding for each scanline.  It is in bytes.
++     * Thus for accelerators that need padding to the next u32, put 4 here.
++     */
++    info->pixmap.scan_align = 4;
++
++    /*
++     * buf_align is the amount to be padded for the buffer. For example,
++     * the i810fb needs a scan_align of 2 but expects it to be fed with
++     * dwords, so a buf_align = 4 is required.
++     */
++    info->pixmap.buf_align = 4;
++
++    /* access_align is how many bits can be accessed from the framebuffer
++     * ie. some epson cards allow 16-bit access only.  Most drivers will
++     * be safe with u32 here.
++     *
++     * NOTE: This field is currently unused.
++     */
++    info->pixmap.access_align = 32;
++#ifndef CONFIG_PCI
++    info->pixmap.blit_x = 0;
++    info->pixmap.blit_y = 0;
++#endif
++/***************************** End optional stage ***************************/
++#endif /* (HW_ACCEL==1) */
++    /*
++     * This should give a reasonable default video mode. The following is
++     * done when we can set a video mode. 
++     */
++    if (!mode_option){
++        printk("%s: set default videomode (640x480@60)\n",__func__);
++        mode_option = "640x480@60";
++    }
++
++    retval = fb_find_mode(&info->var, info, mode_option, NULL, 0, NULL, 16);
++  
++    if (!retval || retval == 4){
++        printk("%s: cannot find videomode\n",__func__);
++        goto err_alloc_cmap;
++    }
++
++    /* This has to been done !!! */    
++    if (fb_alloc_cmap(&info->cmap, cmap_len, 0)==-ENOMEM){
++        printk("%s: cannot allocate cmap\n", __func__);
++        goto err_alloc_cmap;
++    }
++
++    /* set cursor defaults */
++#if (HW_CURSOR == 1)
++    par->Disp_Regs->CUTC_CPM.CUTC_CPM_BITS.CUO0 = 1; /* cursor priority higher than layer */
++    par->Disp_Regs->CUOA0.CUOA0_BITS.CUOA0      = info->fix.smem_start + info->fix.smem_len - PIXMAP_SIZE - CURSOR_SIZE;
++    par->Cursor0_Base_virt =                (u32) info->screen_base    + info->fix.smem_len - PIXMAP_SIZE - CURSOR_SIZE;
++    par->current_cursor.image.dx=0;
++    par->current_cursor.image.dy=0;
++    par->current_cursor.image.width=0;
++    par->current_cursor.image.height=0;
++#endif /* (HW_CURSOR == 1) */
++
++    if (register_framebuffer(info) < 0){
++        printk("%s: cannot register framebuffer\n",__func__);
++        goto err_register_framebuffer;
++    }
++
++    printk(KERN_INFO "fb%d: %s frame buffer device\n", info->node, info->fix.id);
++
++#if defined(CONFIG_PCI) && !defined(FB_V03)
++    gdc_register(info);
++#endif /* defined(CONFIG_PCI) && !defined(FB_V03) */
++#ifndef CONFIG_PCI
++    dev_set_drvdata(device, info); /* MB86R01 */
++#else
++    pci_set_drvdata(dev, info);    /* MB86296 MB86297 */
++#endif
++    return 0;
++
++    /*error handling */
++err_register_framebuffer:
++    fb_dealloc_cmap(&info->cmap);
++err_alloc_cmap:
++#if (HW_ACCEL==1)
++    kfree(info->pixmap.addr);
++err_alloc_pixmap:
++#endif /*(HW_ACCEL==1)*/
++    iounmap(info->screen_base);
++err_map_smem:
++#ifdef CONFIG_PCI
++    release_mem_region(info->fix.smem_start, info->fix.smem_len);
++err_request_smem:
++#endif
++    iounmap(par->mmio);
++err_map_mmio:
++    release_mem_region(info->fix.mmio_start, info->fix.mmio_len);
++err_request_mmio:
++err_get_resource:
++    kfree(par);
++err_alloc_par:
++    framebuffer_release(info);
++err_alloc_fb_info:
++    return -EINVAL;
++}
++
++    /*
++     *  Cleanup
++     */
++#ifndef CONFIG_PCI
++int __devexit MB86xxxfb_remove(struct platform_device *pdev)
++{
++    struct device *dev = &pdev->dev;
++    struct fb_info *info = dev_get_drvdata(dev); /* MB86R01 */
++#else
++void __devexit MB86xxxfb_remove(struct pci_dev *dev)
++{
++    struct fb_info *info = pci_get_drvdata(dev); /* MB86296 MB86297 */
++#endif
++    if (info) {
++#if defined(CONFIG_PCI) && !defined(FB_V03)
++        gdc_unregister();
++#endif /* defined(CONFIG_PCI) && !defined(FB_V03) */
++        unregister_framebuffer(info);
++        fb_dealloc_cmap(&info->cmap);
++#if (HW_ACCEL==1)
++        kfree(info->pixmap.addr);
++#endif /*(HW_ACCEL==1)*/
++        iounmap(info->screen_base);
++#ifdef CONFIG_PCI
++        release_mem_region(info->fix.smem_start, info->fix.smem_len);
++#endif
++        iounmap(((struct MB86xxx_par *)(info->par))->mmio);
++        release_mem_region(info->fix.mmio_start, info->fix.mmio_len);
++        kfree(info->par);
++        framebuffer_release(info);
++    }
++#ifndef CONFIG_PCI
++    return 0;
++#endif
++}
++
++#ifndef MODULE
++void MB86xxxfb_setup(char *kernel_options)
++{
++    char *option;
++
++    if (!kernel_options || !*kernel_options)
++        return;
++
++
++    while ((option = strsep(&kernel_options, ",")) != NULL)
++    {
++        if (!*option)
++            continue;
++
++        if (strcmp(option, "mode_option"))
++            mode_option = option;
++    }
++}
++#endif
++
++#if defined(CONFIG_PCI)
++/* For PCI drivers */
++static struct pci_driver MB86xxxfb_driver = {
++    .name =        "MB86xxxfb",
++    .id_table =    MB86xxxfb_devices,
++    .probe =    MB86xxxfb_probe,
++    .remove =    __exit_p(MB86xxxfb_remove),
++};
++int __init MB86xxxfb_init(void)
++{
++    /*
++     *  For kernel boot options (in 'video=MB86xxxfb:<options>' format)
++     */
++#ifndef MODULE
++    char *option = NULL;
++
++    if (fb_get_options("MB86xxxfb", &option))
++    {
++        printk("%s: no kernel options found\n",__func__);
++        return -ENODEV;
++    }
++    MB86xxxfb_setup(option);
++#endif
++
++    return pci_register_driver(&MB86xxxfb_driver);
++}
++
++static void __exit MB86xxxfb_exit(void)
++{
++    pci_unregister_driver(&MB86xxxfb_driver);
++}
++#endif /* defined(CONFIG_PCI) */
++
++#if !defined(CONFIG_PCI)
++#include <linux/platform_device.h>
++/* for platform devices */
++static struct platform_driver MB86xxxfb_driver = {
++     .driver    = {
++        .name = "MB86xxxfb",
++    },
++    .probe = MB86xxxfb_probe,
++    .remove = MB86xxxfb_remove,
++};
++
++static u64 dma_mask = 0xffffffffUL;
++
++static struct resource host_disp_regs= {
++        .start = JADE_GDC_PHYS_BASE,
++		.end   = JADE_GDC_PHYS_BASE + 0x40000-1,
++        .flags = IORESOURCE_MEM,
++};
++static struct platform_device MB86xxxfb_device = {
++    .name      = "MB86xxxfb",
++    .id        = 0,
++    .dev       = {
++        .dma_mask           =  &dma_mask,
++        .coherent_dma_mask  =  0xffffffff,
++    },
++    .resource  = &host_disp_regs,
++    .num_resources = 1,
++};
++
++int __init MB86xxxfb_init(void)
++{
++    int ret;
++    /*
++     *  For kernel boot options (in 'video=MB86xxxfb:<options>' format)
++     */
++#ifndef MODULE
++    char *option = NULL;
++
++    if (fb_get_options("MB86xxxfb", &option))
++    {
++        printk("%s: no kernel options found\n",__func__);
++        return -ENODEV;
++    }
++    MB86xxxfb_setup(option);
++#endif
++
++    ret = platform_device_register(&MB86xxxfb_device);
++    ret = platform_driver_register(&MB86xxxfb_driver);
++    return ret;
++}
++
++static void __exit MB86xxxfb_exit(void)
++{
++    platform_device_unregister(&MB86xxxfb_device);
++    platform_driver_unregister(&MB86xxxfb_driver);
++}
++#endif
++
++    /*
++     *  Setup
++     */
++
++/* ------------------------------------------------------------------------- */
++
++    /*
++     *  Frame buffer operations
++     */
++
++static struct fb_ops MB86xxxfb_ops = {
++    .owner              = THIS_MODULE,
++    .fb_open            = MB86xxxfb_open,
++#if 0
++    .fb_read            = MB86xxxfb_read,
++    .fb_write           = MB86xxxfb_write,
++#endif
++    .fb_release         = MB86xxxfb_release,
++    .fb_check_var       = MB86xxxfb_check_var,
++    .fb_set_par         = MB86xxxfb_set_par,
++
++    .fb_setcolreg       = MB86xxxfb_setcolreg,
++    .fb_blank           = MB86xxxfb_blank,
++#if (PANNING==1)
++    .fb_pan_display     = MB86xxxfb_pan_display,
++#endif
++#if (HW_ACCEL==1)
++    .fb_fillrect        = MB86xxxfb_fillrect,
++    .fb_copyarea        = MB86xxxfb_copyarea,
++    .fb_imageblit       = MB86xxxfb_imageblit,
++    .fb_sync            = MB86xxxfb_sync,
++#else
++    .fb_fillrect        = cfb_fillrect,
++    .fb_copyarea        = cfb_copyarea,
++    .fb_imageblit       = cfb_imageblit,
++#endif /* (HW_ACCEL==1) */
++#if (HW_CURSOR==1)
++    .fb_cursor          = MB86xxxfb_cursor,
++#endif
++#if 0
++    .fb_ioctl           = MB86xxxfb_ioctl,
++    .fb_mmap            = MB86xxxfb_mmap,
++#endif
++};
++
++/* ------------------------------------------------------------------------- */
++
++
++    /*
++     *  Modularization
++     */
++module_init(MB86xxxfb_init);
++module_exit(MB86xxxfb_exit);
++
++EXPORT_SYMBOL (GDC_MMIO_BASE_VIRT);
++#ifdef CONFIG_PCI
++EXPORT_SYMBOL (GDC_DRAM_BASE_PHYS);
++EXPORT_SYMBOL (GDC_PCI_DEV);
++#endif
++
++MODULE_AUTHOR("Stephan Doerr <stephan.doerr@fme.fujitsu.com>");
++MODULE_DESCRIPTION("framebuffer driver for Fujitsu chipset MB86R01/MB86296/MB86297");
++MODULE_LICENSE("GPL");
+diff --git a/drivers/video/86xxxmm.c b/drivers/video/86xxxmm.c
+new file mode 100644
+index 0000000..8f2dd56
+--- /dev/null
++++ b/drivers/video/86xxxmm.c
+@@ -0,0 +1,256 @@
++/******************************************************************************
++
++                   COPYRIGHT (C) FUJITSU LIMITED 2008
++
++******************************************************************************/
++
++/*!
++ * \author Stephan Doerr
++ * \version 0.1
++ * \date 2008
++ * \file 86xxxmm.c
++ *
++ * THIS SAMPLE CODE IS PROVIDED AS IS.
++ * FUJITSU MICROELECTRONICS ACCEPTS NO RESPONSIBILITY OR LIABILITY
++ * FOR ANY ERRORS OR OMMISSIONS.
++ *
++ * This file is subject to the terms and conditions of the GNU General Public
++ * License.  See the file LICENSE in the main directory of this archive
++ * for more details.
++ *
++ */
++#ifndef CONFIG_PCI
++#include <linux/module.h>
++#include <linux/kernel.h>
++#include <linux/errno.h>
++#include <linux/string.h>
++#include <linux/mm.h>
++#include <linux/slab.h>
++#include <linux/delay.h>
++#include <linux/fb.h>
++#include <linux/init.h>
++#include <linux/poll.h>
++#include <linux/dma-mapping.h>
++#include <linux/platform_device.h>
++#include <mach/board.h>
++#define _86xxxfb_writel(a,b)  __raw_writel(a,b)
++
++#include "86xxx.h"
++#endif /* CONFIG_PCI */
++
++static int g_MajorNumber = 0;
++static int g_nDeviceOpened = 0;
++static u32 g_mem_base_phys;
++static u32 g_mem_size = 0;
++char g_devname[10]="mb86xxx";
++
++
++/*****************************************************************************/
++/*** SYSTEM CALL OPERATIONS **************************************************/
++/*****************************************************************************/
++void mb86xxx_mmap_open(struct vm_area_struct *vma)
++{
++}
++/*****************************************************************************/
++
++void mb86xxx_mmap_close(struct vm_area_struct *vma)
++{
++}
++/*****************************************************************************/
++#if 0
++struct page *mb86xxx_mmap_nopage(struct vm_area_struct *vma, unsigned long adress, int *type)
++{
++    //signal an error and prevent allocating pages from anywhere automatically
++    return NOPAGE_SIGBUS;
++}
++/*****************************************************************************/
++#endif
++static struct vm_operations_struct mb86xxx_mmap_vm_table =
++{
++    .open   =   mb86xxx_mmap_open,
++    .close  =   mb86xxx_mmap_close,
++//    .nopage =   mb86xxx_mmap_nopage,
++};
++/*****************************************************************************/
++int mb86xxx_mmap(struct file *pf, struct vm_area_struct *vma)
++{
++    u32 physical = g_mem_base_phys;
++    u32 vsize    = vma->vm_end - vma->vm_start;
++    u32 psize    = g_mem_size;
++    u32 offset   = vma->vm_pgoff << PAGE_SHIFT;
++
++    //check if area which should be allocated from user side fits into physical area
++    if(offset + vsize > psize)
++    {
++        printk("%s: size requested is bigger than physical available memory\n",__func__);
++        return -EINVAL;
++    }
++    //enable cpu caching for graphics memory but change cache write strategy to write through
++#ifndef CONFIG_PCI
++    vma->vm_page_prot &= ~L_PTE_BUFFERABLE;
++#else
++    vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
++#endif
++    vma->vm_flags |= VM_RESERVED;
++    vma->vm_flags |= VM_READ;
++    vma->vm_flags |= VM_WRITE;
++    vma->vm_flags |= VM_SHARED;
++    //we know that it is IO Memory - so mark it
++    vma->vm_flags |= VM_IO;
++
++    //map the physical adress to user space
++    if(remap_pfn_range(vma, vma->vm_start, (unsigned long)((physical+offset) >> PAGE_SHIFT), vsize, vma->vm_page_prot))
++    {
++        printk("%s: remap_pfn_range() failed\n",__func__);
++        return -EINVAL;
++    }
++    vma->vm_ops = &mb86xxx_mmap_vm_table;
++    mb86xxx_mmap_open(vma);
++    return 0;
++}
++/*****************************************************************************/
++int mb86xxx_open(struct inode *pinode,
++                 struct file *pf)
++{
++    g_nDeviceOpened++;
++    return 0;
++}
++
++/*****************************************************************************/
++int mb86xxx_release(struct inode *pinode,
++                    struct file *pf)
++{
++    g_nDeviceOpened--;
++    return 0;
++}
++
++static struct file_operations mb86xxx_fops =
++{
++    .owner   = THIS_MODULE,
++    .mmap    = mb86xxx_mmap,
++    .open    = mb86xxx_open,
++    .release = mb86xxx_release
++};
++
++#ifndef CONFIG_PCI
++#include <linux/platform_device.h>
++/* for platform devices */
++static int __init MB86xxx_mem_probe(struct platform_device *pdev);
++static int __devexit MB86xxx_mem_remove(struct platform_device *pdev);
++
++static struct platform_driver MB86xxx_mem_driver = {
++     .driver    = {
++        .name = "mb86xxx_mem",
++    },
++    .probe = MB86xxx_mem_probe,
++    .remove = MB86xxx_mem_remove,
++};
++
++static u64 dma_mem_mask = 0xffffffffUL;
++
++static struct resource gdc_mem = {
++        .start = 0x44000000,
++        .end   = 0x45ffffff,
++        .flags = IORESOURCE_MEM,
++};
++static void MB86xxx_mem_release(struct device * dev)
++{
++    /* nothing to release - memory is builtin */
++    return;
++}
++static struct platform_device MB86xxx_mem_device = {
++    .name      = "mb86xxx_mem",
++    .id        = 0,
++    .dev       = {
++        .dma_mask           =  &dma_mem_mask,
++        .coherent_dma_mask  =  0xffffffff,
++        .release = MB86xxx_mem_release
++    },
++    .resource  = &gdc_mem,
++    .num_resources = 1,
++};
++
++static struct class *gdcmem_class;
++static struct class_device *gdcmem_class_device;
++#endif /* CONFIG_PCI */
++
++#ifndef CONFIG_PCI
++static int __init MB86xxx_mem_probe(struct platform_device *pdev) /* MB86R01 */
++{
++    g_mem_base_phys = gdc_mem.start;
++    g_mem_size      = gdc_mem.end - gdc_mem.start + 1 - FB_MAP_SIZE;
++#else
++int gdc_register(struct fb_info* info)
++{
++    struct MB86xxx_par *par;
++
++    par = info->par;
++    /* register mb86xxx device to enable user mode access to memory & registers */
++    g_mem_base_phys = par->map_base_phys;
++    g_mem_size      = par->map_size;
++#endif /* CONFIG_PCI */
++    g_MajorNumber = register_chrdev( 0, /* get dynamic major number */
++                                     g_devname, /* device name */
++                                     &mb86xxx_fops );
++
++    if ( g_MajorNumber < 0 )
++    { /* error case */
++        printk ("%s: could not register device mb86xxx\n",__func__);
++        return -EINVAL;
++    }
++#ifndef CONFIG_PCI
++    /*create a class and a class device */
++    gdcmem_class = class_create(THIS_MODULE, "gdcmem_class");
++    if (IS_ERR(gdcmem_class)) {
++        printk(KERN_WARNING "Unable to create class; errno = %ld\n", PTR_ERR(gdcmem_class));
++        gdcmem_class = NULL;
++    }
++    if (gdcmem_class)
++    {
++        gdcmem_class_device = device_create(gdcmem_class, NULL, MKDEV(g_MajorNumber, 0),
++            &(pdev->dev), "gdcmem");
++    }
++#endif /* CONFIG_PCI */
++    return 0;
++
++}
++#ifndef CONFIG_PCI
++static int __devexit MB86xxx_mem_remove(struct platform_device *pdev)
++{
++    device_destroy(gdcmem_class, MKDEV(g_MajorNumber, 0));
++    unregister_chrdev( g_MajorNumber, g_devname);
++    return 0;
++}
++#else
++void gdc_unregister (void)
++{
++    unregister_chrdev( g_MajorNumber, g_devname);
++}
++#endif /* CONFIG_PCI */
++
++#ifndef CONFIG_PCI
++int __init MB86xxxmem_init(void)
++{
++    int ret;
++
++    ret = platform_driver_register(&MB86xxx_mem_driver);
++    ret = platform_device_register(&MB86xxx_mem_device);
++    
++    return ret;
++}
++
++static void __exit MB86xxxmem_exit(void)
++{
++    platform_driver_unregister(&MB86xxx_mem_driver);
++    platform_device_unregister(&MB86xxx_mem_device);
++}
++
++    /*
++     *  Modularization
++     */
++module_init(MB86xxxmem_init);
++module_exit(MB86xxxmem_exit);
++MODULE_AUTHOR("Stephan Doerr <stephan.doerr@fme.fujitsu.com>");
++MODULE_DESCRIPTION("gdc memory driver for Fujitsu chipset MB86R01");
++MODULE_LICENSE("GPL");
++#endif /* CONFIG_PCI*/
+diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
+index 05f99b7..c43a48f 100644
+--- a/drivers/video/Kconfig
++++ b/drivers/video/Kconfig
+@@ -2002,6 +2002,37 @@ config FB_SH7760
+          color operation, with depths ranging from 1 bpp to 8 bpp monochrome
+          and 8, 15 or 16 bpp color; 90 degrees clockwise display rotation for
+          panels <= 320 pixel horizontal resolution.
++         
++config FB_86XXX
++	tristate "MB86R01 frame buffer support"
++	depends on FB
++	select FB_CFB_FILLRECT
++	select FB_CFB_COPYAREA
++	select FB_CFB_IMAGEBLIT
++	---help---
++	  Include support for MB86R01 framebuffer.
++choice
++        depends on FB_86XXX
++        prompt "MB86R01 frame buffer size"
++        default FB_MAP_SIZE_0x00800000
++
++config FB_MAP_SIZE_0x00800000
++	bool "8 MB"
++	help
++
++config FB_MAP_SIZE_0x00400000
++	bool "4 MB"
++	help
++
++config FB_MAP_SIZE_0x00200000
++	bool "2 MB"
++	help
++
++config FB_MAP_SIZE_0x00100000
++	bool "1 MB"
++	help
++
++endchoice
+ 
+ config FB_XXSVIDEO
+ 	tristate "xxsvideo frame buffer support"
+diff --git a/drivers/video/Makefile b/drivers/video/Makefile
+index 14adcd7..593796b 100644
+--- a/drivers/video/Makefile
++++ b/drivers/video/Makefile
+@@ -119,6 +119,7 @@ obj-$(CONFIG_FB_SM501)            += sm501fb.o
+ obj-$(CONFIG_FB_XILINX)           += xilinxfb.o
+ obj-$(CONFIG_FB_SH_MOBILE_LCDC)	  += sh_mobile_lcdcfb.o
+ obj-$(CONFIG_FB_OMAP)             += omap/
++obj-$(CONFIG_FB_86XXX)            += 86xxxfb.o
+ obj-$(CONFIG_FB_XXSVIDEO)         += xxsvideofb.o
+ obj-$(CONFIG_XEN_FBDEV_FRONTEND)  += xen-fbfront.o
+ obj-$(CONFIG_FB_CARMINE)          += carminefb.o
+-- 
+1.7.5.3
+
diff --git a/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/defconfig b/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/defconfig
new file mode 100644
index 0000000..788fba7
--- /dev/null
+++ b/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/defconfig
@@ -0,0 +1,1473 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.27.21
+# Tue May 31 18:28:14 2011
+#
+CONFIG_ARM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_GENERIC_GPIO=y
+# CONFIG_GENERIC_TIME is not set
+# CONFIG_GENERIC_CLOCKEVENTS is not set
+CONFIG_MMU=y
+# CONFIG_NO_IOPORT is not set
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+# CONFIG_ARCH_HAS_ILOG2_U32 is not set
+# CONFIG_ARCH_HAS_ILOG2_U64 is not set
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_ARCH_SUPPORTS_AOUT=y
+CONFIG_ZONE_DMA=y
+CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=y
+CONFIG_VECTORS_BASE=0xffff0000
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_LOCALVERSION=""
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_SWAP=y
+CONFIG_SYSVIPC=y
+CONFIG_SYSVIPC_SYSCTL=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_BSD_PROCESS_ACCT=y
+# CONFIG_BSD_PROCESS_ACCT_V3 is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+# CONFIG_CGROUPS is not set
+# CONFIG_GROUP_SCHED is not set
+CONFIG_SYSFS_DEPRECATED=y
+CONFIG_SYSFS_DEPRECATED_V2=y
+# CONFIG_RELAY is not set
+# CONFIG_NAMESPACES is not set
+# CONFIG_BLK_DEV_INITRD is not set
+# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
+CONFIG_SYSCTL=y
+CONFIG_EMBEDDED=y
+CONFIG_UID16=y
+CONFIG_SYSCTL_SYSCALL=y
+CONFIG_KALLSYMS=y
+# CONFIG_KALLSYMS_ALL is not set
+# CONFIG_KALLSYMS_EXTRA_PASS is not set
+CONFIG_HOTPLUG=y
+CONFIG_PRINTK=y
+CONFIG_BUG=y
+CONFIG_ELF_CORE=y
+CONFIG_COMPAT_BRK=y
+CONFIG_BASE_FULL=y
+CONFIG_FUTEX=y
+CONFIG_ANON_INODES=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+CONFIG_VM_EVENT_COUNTERS=y
+CONFIG_SLAB=y
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+# CONFIG_PROFILING is not set
+# CONFIG_MARKERS is not set
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_KPROBES is not set
+# CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is not set
+# CONFIG_HAVE_IOREMAP_PROT is not set
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+# CONFIG_HAVE_ARCH_TRACEHOOK is not set
+# CONFIG_HAVE_DMA_ATTRS is not set
+# CONFIG_USE_GENERIC_SMP_HELPERS is not set
+# CONFIG_HAVE_CLK is not set
+CONFIG_PROC_PAGE_MONITOR=y
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_SLABINFO=y
+CONFIG_RT_MUTEXES=y
+# CONFIG_TINY_SHMEM is not set
+CONFIG_BASE_SMALL=0
+CONFIG_MODULES=y
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_MODULE_FORCE_UNLOAD is not set
+# CONFIG_MODVERSIONS is not set
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_KMOD=y
+CONFIG_BLOCK=y
+# CONFIG_LBD is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_LSF is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+CONFIG_IOSCHED_AS=y
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_DEFAULT_AS=y
+# CONFIG_DEFAULT_DEADLINE is not set
+# CONFIG_DEFAULT_CFQ is not set
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED="anticipatory"
+CONFIG_CLASSIC_RCU=y
+
+#
+# System Type
+#
+# CONFIG_ARCH_AAEC2000 is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_CLPS7500 is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+CONFIG_ARCH_JADE=y
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IMX is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_L7200 is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_NS9XXX is not set
+# CONFIG_ARCH_LOKI is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_PNX4008 is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_LH7A40X is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+# CONFIG_ARCH_MSM7X00A is not set
+
+#
+# Boot options
+#
+
+#
+# Power management
+#
+
+#
+# Fujitsu Jade Options
+#
+CONFIG_ARCH_JADE_MB86R01=y
+# CONFIG_ARCH_JADE_MB86R02 is not set
+CONFIG_JADE_PACLK_FREQ=38812500
+CONFIG_MACH_XXSVIDEO=y
+# CONFIG_MACH_XXSVIDEOD is not set
+# CONFIG_MACH_XXSVIDEO_TERMINAL is not set
+CONFIG_MACH_XXSVIDEO_EVALKIT=y
+# CONFIG_MACH_XXSVIDEOD_EVALKIT is not set
+# CONFIG_MACH_XXSVIDEO_CAN_GROUP2 is not set
+CONFIG_MACH_XXSVIDEO_EVALKIT_VIDEOIN=y
+CONFIG_XXSVIDEO_IOEXPANDER=m
+CONFIG_XXSVIDEO_KEYS=m
+CONFIG_XXSVIDEO_SII164=m
+
+#
+# Processor Type
+#
+CONFIG_CPU_32=y
+CONFIG_CPU_ARM926T=y
+CONFIG_CPU_32v5=y
+CONFIG_CPU_ABRT_EV5TJ=y
+CONFIG_CPU_PABRT_NOIFAR=y
+CONFIG_CPU_CACHE_VIVT=y
+CONFIG_CPU_COPY_V4WB=y
+CONFIG_CPU_TLB_V4WBI=y
+CONFIG_CPU_CP15=y
+CONFIG_CPU_CP15_MMU=y
+
+#
+# Processor Features
+#
+CONFIG_ARM_THUMB=y
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_WRITETHROUGH is not set
+# CONFIG_CPU_CACHE_ROUND_ROBIN is not set
+# CONFIG_OUTER_CACHE is not set
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+# CONFIG_PCCARD is not set
+
+#
+# Kernel Features
+#
+# CONFIG_TICK_ONESHOT is not set
+# CONFIG_PREEMPT is not set
+CONFIG_HZ=100
+CONFIG_AEABI=y
+CONFIG_OABI_COMPAT=y
+CONFIG_ARCH_FLATMEM_HAS_HOLES=y
+# CONFIG_ARCH_DISCONTIGMEM_ENABLE is not set
+CONFIG_SELECT_MEMORY_MODEL=y
+CONFIG_FLATMEM_MANUAL=y
+# CONFIG_DISCONTIGMEM_MANUAL is not set
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_FLATMEM=y
+CONFIG_FLAT_NODE_MEM_MAP=y
+# CONFIG_SPARSEMEM_STATIC is not set
+# CONFIG_SPARSEMEM_VMEMMAP_ENABLE is not set
+CONFIG_PAGEFLAGS_EXTENDED=y
+CONFIG_SPLIT_PTLOCK_CPUS=4096
+# CONFIG_RESOURCES_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=1
+CONFIG_BOUNCE=y
+CONFIG_VIRT_TO_BUS=y
+CONFIG_ALIGNMENT_TRAP=y
+
+#
+# Boot options
+#
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE=""
+# CONFIG_XIP_KERNEL is not set
+# CONFIG_KEXEC is not set
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+CONFIG_FPE_NWFPE=y
+# CONFIG_FPE_NWFPE_XP is not set
+# CONFIG_FPE_FASTFPE is not set
+# CONFIG_VFP is not set
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=y
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+
+#
+# Power management options
+#
+# CONFIG_PM is not set
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_NET=y
+
+#
+# Networking options
+#
+CONFIG_PACKET=y
+# CONFIG_PACKET_MMAP is not set
+CONFIG_UNIX=y
+CONFIG_XFRM=y
+CONFIG_XFRM_USER=y
+# CONFIG_XFRM_SUB_POLICY is not set
+# CONFIG_XFRM_MIGRATE is not set
+# CONFIG_XFRM_STATISTICS is not set
+CONFIG_NET_KEY=y
+# CONFIG_NET_KEY_MIGRATE is not set
+CONFIG_INET=y
+# CONFIG_IP_MULTICAST is not set
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_ASK_IP_FIB_HASH=y
+# CONFIG_IP_FIB_TRIE is not set
+CONFIG_IP_FIB_HASH=y
+# CONFIG_IP_MULTIPLE_TABLES is not set
+# CONFIG_IP_ROUTE_MULTIPATH is not set
+# CONFIG_IP_ROUTE_VERBOSE is not set
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+# CONFIG_IP_PNP_RARP is not set
+# CONFIG_NET_IPIP is not set
+# CONFIG_NET_IPGRE is not set
+# CONFIG_ARPD is not set
+# CONFIG_SYN_COOKIES is not set
+# CONFIG_INET_AH is not set
+# CONFIG_INET_ESP is not set
+# CONFIG_INET_IPCOMP is not set
+# CONFIG_INET_XFRM_TUNNEL is not set
+# CONFIG_INET_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+CONFIG_INET_DIAG=y
+CONFIG_INET_TCP_DIAG=y
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=y
+CONFIG_DEFAULT_TCP_CONG="cubic"
+# CONFIG_TCP_MD5SIG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETFILTER is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_BRIDGE is not set
+# CONFIG_VLAN_8021Q is not set
+# CONFIG_DECNET is not set
+# CONFIG_LLC2 is not set
+# CONFIG_IPX is not set
+# CONFIG_ATALK is not set
+# CONFIG_X25 is not set
+# CONFIG_LAPB is not set
+# CONFIG_ECONET is not set
+# CONFIG_WAN_ROUTER is not set
+# CONFIG_NET_SCHED is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+# CONFIG_IRDA is not set
+# CONFIG_BT is not set
+# CONFIG_AF_RXRPC is not set
+
+#
+# Wireless
+#
+# CONFIG_CFG80211 is not set
+# CONFIG_WIRELESS_EXT is not set
+# CONFIG_MAC80211 is not set
+# CONFIG_IEEE80211 is not set
+# CONFIG_RFKILL is not set
+# CONFIG_NET_9P is not set
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_STANDALONE=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
+# CONFIG_FW_LOADER is not set
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+CONFIG_MTD=y
+# CONFIG_MTD_DEBUG is not set
+CONFIG_MTD_CONCAT=y
+CONFIG_MTD_PARTITIONS=y
+# CONFIG_MTD_REDBOOT_PARTS is not set
+# CONFIG_MTD_CMDLINE_PARTS is not set
+# CONFIG_MTD_AFS_PARTS is not set
+# CONFIG_MTD_AR7_PARTS is not set
+
+#
+# User Modules And Translation Layers
+#
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLKDEVS=y
+CONFIG_MTD_BLOCK=y
+# CONFIG_FTL is not set
+# CONFIG_NFTL is not set
+# CONFIG_INFTL is not set
+# CONFIG_RFD_FTL is not set
+# CONFIG_SSFDC is not set
+# CONFIG_MTD_OOPS is not set
+
+#
+# RAM/ROM/Flash chip drivers
+#
+CONFIG_MTD_CFI=y
+# CONFIG_MTD_JEDECPROBE is not set
+CONFIG_MTD_GEN_PROBE=y
+# CONFIG_MTD_CFI_ADV_OPTIONS is not set
+CONFIG_MTD_MAP_BANK_WIDTH_1=y
+CONFIG_MTD_MAP_BANK_WIDTH_2=y
+CONFIG_MTD_MAP_BANK_WIDTH_4=y
+# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
+CONFIG_MTD_CFI_I1=y
+CONFIG_MTD_CFI_I2=y
+# CONFIG_MTD_CFI_I4 is not set
+# CONFIG_MTD_CFI_I8 is not set
+# CONFIG_MTD_CFI_INTELEXT is not set
+CONFIG_MTD_CFI_AMDSTD=y
+# CONFIG_MTD_CFI_STAA is not set
+CONFIG_MTD_CFI_UTIL=y
+# CONFIG_MTD_RAM is not set
+# CONFIG_MTD_ROM is not set
+# CONFIG_MTD_ABSENT is not set
+
+#
+# Mapping drivers for chip access
+#
+# CONFIG_MTD_COMPLEX_MAPPINGS is not set
+# CONFIG_MTD_PHYSMAP is not set
+CONFIG_MTD_ARM_INTEGRATOR=y
+# CONFIG_MTD_PLATRAM is not set
+
+#
+# Self-contained MTD device drivers
+#
+# CONFIG_MTD_SLRAM is not set
+# CONFIG_MTD_PHRAM is not set
+# CONFIG_MTD_MTDRAM is not set
+# CONFIG_MTD_BLOCK2MTD is not set
+
+#
+# Disk-On-Chip Device Drivers
+#
+# CONFIG_MTD_DOC2000 is not set
+# CONFIG_MTD_DOC2001 is not set
+# CONFIG_MTD_DOC2001PLUS is not set
+# CONFIG_MTD_NAND is not set
+# CONFIG_MTD_ONENAND is not set
+
+#
+# UBI - Unsorted block images
+#
+# CONFIG_MTD_UBI is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+# CONFIG_BLK_DEV_LOOP is not set
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_UB is not set
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=16
+CONFIG_BLK_DEV_RAM_SIZE=8192
+# CONFIG_BLK_DEV_XIP is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+CONFIG_MISC_DEVICES=y
+# CONFIG_EEPROM_93CX6 is not set
+# CONFIG_ENCLOSURE_SERVICES is not set
+CONFIG_HAVE_IDE=y
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
+# CONFIG_RAID_ATTRS is not set
+CONFIG_SCSI=m
+CONFIG_SCSI_DMA=y
+# CONFIG_SCSI_TGT is not set
+# CONFIG_SCSI_NETLINK is not set
+CONFIG_SCSI_PROC_FS=y
+
+#
+# SCSI support type (disk, tape, CD-ROM)
+#
+CONFIG_BLK_DEV_SD=m
+# CONFIG_CHR_DEV_ST is not set
+# CONFIG_CHR_DEV_OSST is not set
+# CONFIG_BLK_DEV_SR is not set
+# CONFIG_CHR_DEV_SG is not set
+# CONFIG_CHR_DEV_SCH is not set
+
+#
+# Some SCSI devices (e.g. CD jukebox) support multiple LUNs
+#
+# CONFIG_SCSI_MULTI_LUN is not set
+# CONFIG_SCSI_CONSTANTS is not set
+# CONFIG_SCSI_LOGGING is not set
+# CONFIG_SCSI_SCAN_ASYNC is not set
+CONFIG_SCSI_WAIT_SCAN=m
+
+#
+# SCSI Transports
+#
+# CONFIG_SCSI_SPI_ATTRS is not set
+# CONFIG_SCSI_FC_ATTRS is not set
+# CONFIG_SCSI_ISCSI_ATTRS is not set
+# CONFIG_SCSI_SAS_LIBSAS is not set
+# CONFIG_SCSI_SRP_ATTRS is not set
+CONFIG_SCSI_LOWLEVEL=y
+# CONFIG_ISCSI_TCP is not set
+# CONFIG_SCSI_DEBUG is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_ATA is not set
+# CONFIG_MD is not set
+CONFIG_NETDEVICES=y
+# CONFIG_DUMMY is not set
+# CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_EQUALIZER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+# CONFIG_PHYLIB is not set
+CONFIG_NET_ETHERNET=y
+CONFIG_MII=y
+# CONFIG_AX88796 is not set
+# CONFIG_SMC91X is not set
+# CONFIG_DM9000 is not set
+CONFIG_SMC911X=y
+# CONFIG_IBM_NEW_EMAC_ZMII is not set
+# CONFIG_IBM_NEW_EMAC_RGMII is not set
+# CONFIG_IBM_NEW_EMAC_TAH is not set
+# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
+# CONFIG_B44 is not set
+# CONFIG_NETDEV_1000 is not set
+# CONFIG_NETDEV_10000 is not set
+
+#
+# Wireless LAN
+#
+# CONFIG_WLAN_PRE80211 is not set
+# CONFIG_WLAN_80211 is not set
+# CONFIG_IWLWIFI_LEDS is not set
+
+#
+# USB Network Adapters
+#
+# CONFIG_USB_CATC is not set
+# CONFIG_USB_KAWETH is not set
+# CONFIG_USB_PEGASUS is not set
+# CONFIG_USB_RTL8150 is not set
+# CONFIG_USB_USBNET is not set
+# CONFIG_WAN is not set
+# CONFIG_PPP is not set
+# CONFIG_SLIP is not set
+# CONFIG_NETCONSOLE is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+# CONFIG_ISDN is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=y
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
+
+#
+# Userland interfaces
+#
+CONFIG_INPUT_MOUSEDEV=m
+CONFIG_INPUT_MOUSEDEV_PSAUX=y
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
+# CONFIG_INPUT_JOYDEV is not set
+CONFIG_INPUT_EVDEV=m
+# CONFIG_INPUT_EVBUG is not set
+
+#
+# Input Device Drivers
+#
+CONFIG_INPUT_KEYBOARD=y
+CONFIG_KEYBOARD_ATKBD=m
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_GPIO is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+# CONFIG_INPUT_TOUCHSCREEN is not set
+# CONFIG_INPUT_MISC is not set
+
+#
+# Hardware I/O ports
+#
+CONFIG_SERIO=m
+CONFIG_SERIO_SERPORT=m
+CONFIG_SERIO_LIBPS2=m
+# CONFIG_SERIO_RAW is not set
+# CONFIG_GAMEPORT is not set
+
+#
+# Character devices
+#
+CONFIG_VT=y
+CONFIG_CONSOLE_TRANSLATIONS=y
+CONFIG_VT_CONSOLE=y
+CONFIG_HW_CONSOLE=y
+# CONFIG_VT_HW_CONSOLE_BINDING is not set
+CONFIG_DEVKMEM=y
+# CONFIG_SERIAL_NONSTANDARD is not set
+
+#
+# Serial drivers
+#
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=2
+CONFIG_SERIAL_8250_RUNTIME_UARTS=2
+# CONFIG_SERIAL_8250_EXTENDED is not set
+
+#
+# Non-8250 serial port support
+#
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+CONFIG_UNIX98_PTYS=y
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_IPMI_HANDLER is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_NVRAM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+CONFIG_XXS_C_CAN=m
+# CONFIG_CRYPTOEEPROM is not set
+CONFIG_I2C=m
+CONFIG_I2C_BOARDINFO=y
+CONFIG_I2C_CHARDEV=m
+CONFIG_I2C_HELPER_AUTO=y
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+# CONFIG_I2C_GPIO is not set
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_SIMTEC is not set
+
+#
+# External I2C/SMBus adapter drivers
+#
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+# CONFIG_I2C_TINY_USB is not set
+
+#
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_PCA_PLATFORM is not set
+# CONFIG_I2C_STUB is not set
+CONFIG_I2C_XXSVIDEO=m
+
+#
+# Miscellaneous I2C Chip support
+#
+# CONFIG_DS1682 is not set
+# CONFIG_AT24 is not set
+# CONFIG_SENSORS_EEPROM is not set
+# CONFIG_SENSORS_PCF8574 is not set
+# CONFIG_PCF8575 is not set
+# CONFIG_SENSORS_PCA9539 is not set
+# CONFIG_SENSORS_PCF8591 is not set
+# CONFIG_SENSORS_MAX6875 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+# CONFIG_I2C_DEBUG_CHIP is not set
+# CONFIG_SPI is not set
+# CONFIG_W1 is not set
+# CONFIG_POWER_SUPPLY is not set
+# CONFIG_HWMON is not set
+# CONFIG_WATCHDOG is not set
+
+#
+# Sonics Silicon Backplane
+#
+CONFIG_SSB_POSSIBLE=y
+# CONFIG_SSB is not set
+
+#
+# Multifunction device drivers
+#
+# CONFIG_MFD_CORE is not set
+# CONFIG_MFD_SM501 is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
+
+#
+# Multimedia devices
+#
+
+#
+# Multimedia core support
+#
+CONFIG_VIDEO_DEV=m
+CONFIG_VIDEO_V4L2_COMMON=m
+CONFIG_VIDEO_ALLOW_V4L1=y
+CONFIG_VIDEO_V4L1_COMPAT=y
+# CONFIG_DVB_CORE is not set
+CONFIG_VIDEO_MEDIA=m
+
+#
+# Multimedia drivers
+#
+# CONFIG_MEDIA_ATTACH is not set
+CONFIG_MEDIA_TUNER=m
+# CONFIG_MEDIA_TUNER_CUSTOMIZE is not set
+CONFIG_MEDIA_TUNER_SIMPLE=m
+CONFIG_MEDIA_TUNER_TDA8290=m
+CONFIG_MEDIA_TUNER_TDA9887=m
+CONFIG_MEDIA_TUNER_TEA5761=m
+CONFIG_MEDIA_TUNER_TEA5767=m
+CONFIG_MEDIA_TUNER_MT20XX=m
+CONFIG_MEDIA_TUNER_XC2028=m
+CONFIG_MEDIA_TUNER_XC5000=m
+CONFIG_VIDEO_V4L2=m
+CONFIG_VIDEO_V4L1=m
+CONFIG_VIDEO_CAPTURE_DRIVERS=y
+# CONFIG_VIDEO_ADV_DEBUG is not set
+# CONFIG_VIDEO_HELPER_CHIPS_AUTO is not set
+
+#
+# Encoders/decoders and other helper chips
+#
+
+#
+# Audio decoders
+#
+# CONFIG_VIDEO_TVAUDIO is not set
+# CONFIG_VIDEO_TDA7432 is not set
+# CONFIG_VIDEO_TDA9840 is not set
+# CONFIG_VIDEO_TDA9875 is not set
+# CONFIG_VIDEO_TEA6415C is not set
+# CONFIG_VIDEO_TEA6420 is not set
+# CONFIG_VIDEO_MSP3400 is not set
+# CONFIG_VIDEO_CS5345 is not set
+# CONFIG_VIDEO_CS53L32A is not set
+# CONFIG_VIDEO_M52790 is not set
+# CONFIG_VIDEO_TLV320AIC23B is not set
+# CONFIG_VIDEO_WM8775 is not set
+# CONFIG_VIDEO_WM8739 is not set
+# CONFIG_VIDEO_VP27SMPX is not set
+
+#
+# Video decoders
+#
+# CONFIG_VIDEO_BT819 is not set
+# CONFIG_VIDEO_BT856 is not set
+# CONFIG_VIDEO_BT866 is not set
+# CONFIG_VIDEO_KS0127 is not set
+# CONFIG_VIDEO_OV7670 is not set
+# CONFIG_VIDEO_TCM825X is not set
+# CONFIG_VIDEO_SAA7110 is not set
+# CONFIG_VIDEO_SAA7111 is not set
+# CONFIG_VIDEO_SAA7114 is not set
+CONFIG_VIDEO_SAA711X=m
+# CONFIG_VIDEO_SAA717X is not set
+# CONFIG_VIDEO_SAA7191 is not set
+# CONFIG_VIDEO_TVP5150 is not set
+# CONFIG_VIDEO_VPX3220 is not set
+
+#
+# Video and audio decoders
+#
+# CONFIG_VIDEO_CX25840 is not set
+
+#
+# MPEG video encoders
+#
+# CONFIG_VIDEO_CX2341X is not set
+
+#
+# Video encoders
+#
+# CONFIG_VIDEO_SAA7127 is not set
+# CONFIG_VIDEO_SAA7185 is not set
+# CONFIG_VIDEO_ADV7170 is not set
+# CONFIG_VIDEO_ADV7175 is not set
+
+#
+# Video improvement chips
+#
+# CONFIG_VIDEO_UPD64031A is not set
+# CONFIG_VIDEO_UPD64083 is not set
+# CONFIG_VIDEO_VIVI is not set
+# CONFIG_VIDEO_CPIA is not set
+# CONFIG_VIDEO_CPIA2 is not set
+# CONFIG_VIDEO_SAA5246A is not set
+# CONFIG_VIDEO_SAA5249 is not set
+# CONFIG_TUNER_3036 is not set
+# CONFIG_V4L_USB_DRIVERS is not set
+# CONFIG_SOC_CAMERA is not set
+# CONFIG_VIDEO_SH_MOBILE_CEU is not set
+# CONFIG_RADIO_ADAPTERS is not set
+# CONFIG_DAB is not set
+
+#
+# Graphics support
+#
+# CONFIG_VGASTATE is not set
+# CONFIG_VIDEO_OUTPUT_CONTROL is not set
+CONFIG_FB=y
+# CONFIG_FIRMWARE_EDID is not set
+# CONFIG_FB_DDC is not set
+CONFIG_FB_CFB_FILLRECT=y
+CONFIG_FB_CFB_COPYAREA=y
+CONFIG_FB_CFB_IMAGEBLIT=y
+# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
+# CONFIG_FB_SYS_FILLRECT is not set
+# CONFIG_FB_SYS_COPYAREA is not set
+# CONFIG_FB_SYS_IMAGEBLIT is not set
+# CONFIG_FB_FOREIGN_ENDIAN is not set
+# CONFIG_FB_SYS_FOPS is not set
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+# CONFIG_FB_MODE_HELPERS is not set
+# CONFIG_FB_TILEBLITTING is not set
+
+#
+# Frame buffer hardware drivers
+#
+# CONFIG_FB_S1D13XXX is not set
+CONFIG_FB_86XXX=y
+CONFIG_FB_MAP_SIZE_0x00800000=y
+# CONFIG_FB_MAP_SIZE_0x00400000 is not set
+# CONFIG_FB_MAP_SIZE_0x00200000 is not set
+# CONFIG_FB_MAP_SIZE_0x00100000 is not set
+# CONFIG_FB_XXSVIDEO is not set
+# CONFIG_FB_XXSVIDEO_FB0_640_480 is not set
+# CONFIG_FB_XXSVIDEO_FB0_800_480 is not set
+# CONFIG_FB_XXSVIDEO_FB0_800_600 is not set
+# CONFIG_FB_XXSVIDEO_FB0_1024_768 is not set
+# CONFIG_FB_XXSVIDEO_FB0_1280_1024 is not set
+# CONFIG_FB_XXSVIDEO_FB1_640_480 is not set
+# CONFIG_FB_XXSVIDEO_FB1_800_480 is not set
+# CONFIG_FB_XXSVIDEO_FB1_800_600 is not set
+# CONFIG_FB_XXSVIDEO_FB1_1024_768 is not set
+# CONFIG_FB_XXSVIDEO_FB1_1280_1024 is not set
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
+
+#
+# Display device support
+#
+# CONFIG_DISPLAY_SUPPORT is not set
+
+#
+# Console display driver support
+#
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_DUMMY_CONSOLE=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
+# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
+CONFIG_FONTS=y
+# CONFIG_FONT_8x8 is not set
+CONFIG_FONT_8x16=y
+# CONFIG_FONT_6x11 is not set
+# CONFIG_FONT_7x14 is not set
+# CONFIG_FONT_PEARL_8x8 is not set
+# CONFIG_FONT_ACORN_8x8 is not set
+# CONFIG_FONT_MINI_4x6 is not set
+# CONFIG_FONT_SUN8x16 is not set
+# CONFIG_FONT_SUN12x22 is not set
+# CONFIG_FONT_10x18 is not set
+CONFIG_LOGO=y
+CONFIG_LOGO_LINUX_MONO=y
+CONFIG_LOGO_LINUX_VGA16=y
+CONFIG_LOGO_LINUX_CLUT224=y
+CONFIG_SOUND=m
+CONFIG_SND=m
+CONFIG_SND_TIMER=m
+CONFIG_SND_PCM=m
+# CONFIG_SND_SEQUENCER is not set
+CONFIG_SND_OSSEMUL=y
+CONFIG_SND_MIXER_OSS=m
+CONFIG_SND_PCM_OSS=m
+CONFIG_SND_PCM_OSS_PLUGINS=y
+# CONFIG_SND_DYNAMIC_MINORS is not set
+# CONFIG_SND_SUPPORT_OLD_API is not set
+CONFIG_SND_VERBOSE_PROCFS=y
+CONFIG_SND_VERBOSE_PRINTK=y
+CONFIG_SND_DEBUG=y
+CONFIG_SND_DEBUG_VERBOSE=y
+CONFIG_SND_PCM_XRUN_DEBUG=y
+CONFIG_SND_DRIVERS=y
+# CONFIG_SND_DUMMY is not set
+# CONFIG_SND_MTPAV is not set
+# CONFIG_SND_SERIAL_U16550 is not set
+# CONFIG_SND_MPU401 is not set
+CONFIG_SND_ARM=y
+CONFIG_SND_USB=y
+# CONFIG_SND_USB_AUDIO is not set
+# CONFIG_SND_USB_CAIAQ is not set
+CONFIG_SND_SOC=m
+CONFIG_SND_XXSVIDEO_ALSA_SOC=m
+CONFIG_SND_XXSVIDEO_ALSA_SOC_I2S=m
+CONFIG_SND_XXSVIDEO_ALSA_EVALKIT_CS4245=m
+CONFIG_SND_SOC_CS4245=m
+# CONFIG_SOUND_PRIME is not set
+CONFIG_HID_SUPPORT=y
+CONFIG_HID=y
+CONFIG_HID_DEBUG=y
+# CONFIG_HIDRAW is not set
+
+#
+# USB Input Devices
+#
+CONFIG_USB_HID=y
+# CONFIG_USB_HIDINPUT_POWERBOOK is not set
+# CONFIG_HID_FF is not set
+# CONFIG_USB_HIDDEV is not set
+CONFIG_USB_SUPPORT=y
+CONFIG_USB_ARCH_HAS_HCD=y
+CONFIG_USB_ARCH_HAS_OHCI=y
+CONFIG_USB_ARCH_HAS_EHCI=y
+CONFIG_USB=y
+CONFIG_USB_DEBUG=y
+# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
+
+#
+# Miscellaneous USB options
+#
+CONFIG_USB_DEVICEFS=y
+# CONFIG_USB_DEVICE_CLASS is not set
+# CONFIG_USB_DYNAMIC_MINORS is not set
+# CONFIG_USB_OTG is not set
+# CONFIG_USB_OTG_WHITELIST is not set
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+CONFIG_USB_MON=y
+
+#
+# USB Host Controller Drivers
+#
+# CONFIG_USB_C67X00_HCD is not set
+CONFIG_USB_EHCI_HCD=y
+# CONFIG_USB_EHCI_ROOT_HUB_TT is not set
+# CONFIG_USB_EHCI_TT_NEWSCHED is not set
+# CONFIG_USB_ISP116X_HCD is not set
+CONFIG_USB_OHCI_HCD=y
+# CONFIG_USB_OHCI_BIG_ENDIAN_DESC is not set
+# CONFIG_USB_OHCI_BIG_ENDIAN_MMIO is not set
+CONFIG_USB_OHCI_LITTLE_ENDIAN=y
+# CONFIG_USB_SL811_HCD is not set
+# CONFIG_USB_R8A66597_HCD is not set
+
+#
+# USB Device Class drivers
+#
+# CONFIG_USB_ACM is not set
+# CONFIG_USB_PRINTER is not set
+# CONFIG_USB_WDM is not set
+
+#
+# NOTE: USB_STORAGE enables SCSI, and 'SCSI disk support'
+#
+
+#
+# may also be needed; see USB_STORAGE Help for more information
+#
+CONFIG_USB_STORAGE=m
+# CONFIG_USB_STORAGE_DEBUG is not set
+# CONFIG_USB_STORAGE_DATAFAB is not set
+# CONFIG_USB_STORAGE_FREECOM is not set
+# CONFIG_USB_STORAGE_ISD200 is not set
+# CONFIG_USB_STORAGE_DPCM is not set
+# CONFIG_USB_STORAGE_USBAT is not set
+# CONFIG_USB_STORAGE_SDDR09 is not set
+# CONFIG_USB_STORAGE_SDDR55 is not set
+# CONFIG_USB_STORAGE_JUMPSHOT is not set
+# CONFIG_USB_STORAGE_ALAUDA is not set
+# CONFIG_USB_STORAGE_ONETOUCH is not set
+# CONFIG_USB_STORAGE_KARMA is not set
+# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
+# CONFIG_USB_LIBUSUAL is not set
+
+#
+# USB Imaging devices
+#
+# CONFIG_USB_MDC800 is not set
+# CONFIG_USB_MICROTEK is not set
+
+#
+# USB port drivers
+#
+CONFIG_USB_SERIAL=m
+# CONFIG_USB_EZUSB is not set
+CONFIG_USB_SERIAL_GENERIC=y
+# CONFIG_USB_SERIAL_AIRCABLE is not set
+# CONFIG_USB_SERIAL_ARK3116 is not set
+# CONFIG_USB_SERIAL_BELKIN is not set
+# CONFIG_USB_SERIAL_CH341 is not set
+# CONFIG_USB_SERIAL_WHITEHEAT is not set
+# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
+# CONFIG_USB_SERIAL_CP2101 is not set
+# CONFIG_USB_SERIAL_CYPRESS_M8 is not set
+# CONFIG_USB_SERIAL_EMPEG is not set
+# CONFIG_USB_SERIAL_FTDI_SIO is not set
+# CONFIG_USB_SERIAL_FUNSOFT is not set
+# CONFIG_USB_SERIAL_VISOR is not set
+# CONFIG_USB_SERIAL_IPAQ is not set
+# CONFIG_USB_SERIAL_IR is not set
+# CONFIG_USB_SERIAL_EDGEPORT is not set
+# CONFIG_USB_SERIAL_EDGEPORT_TI is not set
+# CONFIG_USB_SERIAL_GARMIN is not set
+# CONFIG_USB_SERIAL_IPW is not set
+# CONFIG_USB_SERIAL_IUU is not set
+# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
+# CONFIG_USB_SERIAL_KEYSPAN is not set
+# CONFIG_USB_SERIAL_KLSI is not set
+# CONFIG_USB_SERIAL_KOBIL_SCT is not set
+# CONFIG_USB_SERIAL_MCT_U232 is not set
+# CONFIG_USB_SERIAL_MOS7720 is not set
+# CONFIG_USB_SERIAL_MOS7840 is not set
+# CONFIG_USB_SERIAL_MOTOROLA is not set
+# CONFIG_USB_SERIAL_NAVMAN is not set
+CONFIG_USB_SERIAL_PL2303=m
+# CONFIG_USB_SERIAL_OTI6858 is not set
+# CONFIG_USB_SERIAL_SPCP8X5 is not set
+# CONFIG_USB_SERIAL_HP4X is not set
+# CONFIG_USB_SERIAL_SAFE is not set
+# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
+# CONFIG_USB_SERIAL_TI is not set
+# CONFIG_USB_SERIAL_CYBERJACK is not set
+# CONFIG_USB_SERIAL_XIRCOM is not set
+# CONFIG_USB_SERIAL_OPTION is not set
+# CONFIG_USB_SERIAL_OMNINET is not set
+# CONFIG_USB_SERIAL_DEBUG is not set
+
+#
+# USB Miscellaneous drivers
+#
+# CONFIG_USB_EMI62 is not set
+# CONFIG_USB_EMI26 is not set
+# CONFIG_USB_ADUTUX is not set
+# CONFIG_USB_RIO500 is not set
+# CONFIG_USB_LEGOTOWER is not set
+# CONFIG_USB_LCD is not set
+# CONFIG_USB_BERRY_CHARGE is not set
+# CONFIG_USB_LED is not set
+# CONFIG_USB_CYPRESS_CY7C63 is not set
+# CONFIG_USB_CYTHERM is not set
+# CONFIG_USB_PHIDGET is not set
+# CONFIG_USB_IDMOUSE is not set
+# CONFIG_USB_FTDI_ELAN is not set
+# CONFIG_USB_APPLEDISPLAY is not set
+# CONFIG_USB_SISUSBVGA is not set
+# CONFIG_USB_LD is not set
+# CONFIG_USB_TRANCEVIBRATOR is not set
+# CONFIG_USB_IOWARRIOR is not set
+# CONFIG_USB_TEST is not set
+# CONFIG_USB_ISIGHTFW is not set
+# CONFIG_USB_GADGET is not set
+# CONFIG_MMC is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+
+#
+# LED drivers
+#
+# CONFIG_LEDS_PCA9532 is not set
+# CONFIG_LEDS_GPIO is not set
+# CONFIG_LEDS_PCA955X is not set
+CONFIG_LEDS_XXSVIDEO_JADEEVALKIT=m
+
+#
+# LED Triggers
+#
+# CONFIG_LEDS_TRIGGERS is not set
+CONFIG_RTC_LIB=y
+CONFIG_RTC_CLASS=m
+
+#
+# RTC interfaces
+#
+CONFIG_RTC_INTF_SYSFS=y
+CONFIG_RTC_INTF_PROC=y
+CONFIG_RTC_INTF_DEV=y
+# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
+# CONFIG_RTC_DRV_TEST is not set
+
+#
+# I2C RTC drivers
+#
+# CONFIG_RTC_DRV_DS1307 is not set
+# CONFIG_RTC_DRV_DS1374 is not set
+# CONFIG_RTC_DRV_DS1672 is not set
+# CONFIG_RTC_DRV_MAX6900 is not set
+# CONFIG_RTC_DRV_RS5C372 is not set
+# CONFIG_RTC_DRV_ISL1208 is not set
+# CONFIG_RTC_DRV_X1205 is not set
+# CONFIG_RTC_DRV_PCF8563 is not set
+# CONFIG_RTC_DRV_PCF8583 is not set
+CONFIG_RTC_DRV_M41T80=m
+# CONFIG_RTC_DRV_M41T80_WDT is not set
+# CONFIG_RTC_DRV_S35390A is not set
+# CONFIG_RTC_DRV_FM3130 is not set
+
+#
+# SPI RTC drivers
+#
+
+#
+# Platform RTC drivers
+#
+# CONFIG_RTC_DRV_CMOS is not set
+# CONFIG_RTC_DRV_DS1511 is not set
+# CONFIG_RTC_DRV_DS1553 is not set
+# CONFIG_RTC_DRV_DS1742 is not set
+# CONFIG_RTC_DRV_STK17TA8 is not set
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+
+#
+# on-CPU RTC drivers
+#
+# CONFIG_DMADEVICES is not set
+
+#
+# Voltage and Current regulators
+#
+# CONFIG_REGULATOR is not set
+# CONFIG_REGULATOR_FIXED_VOLTAGE is not set
+# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
+# CONFIG_REGULATOR_BQ24022 is not set
+# CONFIG_UIO is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=m
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=m
+CONFIG_EXT3_FS_XATTR=y
+# CONFIG_EXT3_FS_POSIX_ACL is not set
+# CONFIG_EXT3_FS_SECURITY is not set
+# CONFIG_EXT4DEV_FS is not set
+CONFIG_JBD=m
+CONFIG_FS_MBCACHE=m
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_FS_POSIX_ACL is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_OCFS2_FS is not set
+CONFIG_DNOTIFY=y
+CONFIG_INOTIFY=y
+CONFIG_INOTIFY_USER=y
+# CONFIG_QUOTA is not set
+# CONFIG_AUTOFS_FS is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+
+#
+# CD-ROM/DVD Filesystems
+#
+# CONFIG_ISO9660_FS is not set
+# CONFIG_UDF_FS is not set
+
+#
+# DOS/FAT/NT Filesystems
+#
+CONFIG_FAT_FS=m
+# CONFIG_MSDOS_FS is not set
+CONFIG_VFAT_FS=m
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+CONFIG_NTFS_FS=m
+# CONFIG_NTFS_DEBUG is not set
+# CONFIG_NTFS_RW is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+CONFIG_PROC_SYSCTL=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+# CONFIG_TMPFS_POSIX_ACL is not set
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+
+#
+# Miscellaneous filesystems
+#
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_FS_DEBUG=0
+# CONFIG_JFFS2_FS_WRITEBUFFER is not set
+# CONFIG_JFFS2_SUMMARY is not set
+# CONFIG_JFFS2_FS_XATTR is not set
+CONFIG_JFFS2_COMPRESSION_OPTIONS=y
+CONFIG_JFFS2_ZLIB=y
+# CONFIG_JFFS2_LZO is not set
+CONFIG_JFFS2_RTIME=y
+# CONFIG_JFFS2_RUBIN is not set
+# CONFIG_JFFS2_CMODE_NONE is not set
+CONFIG_JFFS2_CMODE_PRIORITY=y
+# CONFIG_JFFS2_CMODE_SIZE is not set
+# CONFIG_JFFS2_CMODE_FAVOURLZO is not set
+# CONFIG_CRAMFS is not set
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3=y
+# CONFIG_NFS_V3_ACL is not set
+# CONFIG_NFS_V4 is not set
+CONFIG_ROOT_NFS=y
+# CONFIG_NFSD is not set
+CONFIG_LOCKD=y
+CONFIG_LOCKD_V4=y
+CONFIG_NFS_COMMON=y
+CONFIG_SUNRPC=y
+# CONFIG_RPCSEC_GSS_KRB5 is not set
+# CONFIG_RPCSEC_GSS_SPKM3 is not set
+# CONFIG_SMB_FS is not set
+# CONFIG_CIFS is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
+
+#
+# Partition Types
+#
+# CONFIG_PARTITION_ADVANCED is not set
+CONFIG_MSDOS_PARTITION=y
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="iso8859-1"
+CONFIG_NLS_CODEPAGE_437=y
+# CONFIG_NLS_CODEPAGE_737 is not set
+# CONFIG_NLS_CODEPAGE_775 is not set
+CONFIG_NLS_CODEPAGE_850=y
+# CONFIG_NLS_CODEPAGE_852 is not set
+# CONFIG_NLS_CODEPAGE_855 is not set
+# CONFIG_NLS_CODEPAGE_857 is not set
+# CONFIG_NLS_CODEPAGE_860 is not set
+# CONFIG_NLS_CODEPAGE_861 is not set
+# CONFIG_NLS_CODEPAGE_862 is not set
+# CONFIG_NLS_CODEPAGE_863 is not set
+# CONFIG_NLS_CODEPAGE_864 is not set
+# CONFIG_NLS_CODEPAGE_865 is not set
+# CONFIG_NLS_CODEPAGE_866 is not set
+# CONFIG_NLS_CODEPAGE_869 is not set
+# CONFIG_NLS_CODEPAGE_936 is not set
+# CONFIG_NLS_CODEPAGE_950 is not set
+# CONFIG_NLS_CODEPAGE_932 is not set
+# CONFIG_NLS_CODEPAGE_949 is not set
+# CONFIG_NLS_CODEPAGE_874 is not set
+# CONFIG_NLS_ISO8859_8 is not set
+# CONFIG_NLS_CODEPAGE_1250 is not set
+# CONFIG_NLS_CODEPAGE_1251 is not set
+# CONFIG_NLS_ASCII is not set
+CONFIG_NLS_ISO8859_1=y
+# CONFIG_NLS_ISO8859_2 is not set
+# CONFIG_NLS_ISO8859_3 is not set
+# CONFIG_NLS_ISO8859_4 is not set
+# CONFIG_NLS_ISO8859_5 is not set
+# CONFIG_NLS_ISO8859_6 is not set
+# CONFIG_NLS_ISO8859_7 is not set
+# CONFIG_NLS_ISO8859_9 is not set
+# CONFIG_NLS_ISO8859_13 is not set
+# CONFIG_NLS_ISO8859_14 is not set
+# CONFIG_NLS_ISO8859_15 is not set
+# CONFIG_NLS_KOI8_R is not set
+# CONFIG_NLS_KOI8_U is not set
+# CONFIG_NLS_UTF8 is not set
+# CONFIG_DLM is not set
+
+#
+# Kernel hacking
+#
+# CONFIG_PRINTK_TIME is not set
+CONFIG_ENABLE_WARN_DEPRECATED=y
+CONFIG_ENABLE_MUST_CHECK=y
+CONFIG_FRAME_WARN=1024
+# CONFIG_MAGIC_SYSRQ is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_DEBUG_SHIRQ is not set
+CONFIG_DETECT_SOFTLOCKUP=y
+# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
+CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=0
+CONFIG_SCHED_DEBUG=y
+# CONFIG_SCHEDSTATS is not set
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_OBJECTS is not set
+# CONFIG_DEBUG_SLAB is not set
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_RT_MUTEX_TESTER is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+# CONFIG_DEBUG_MUTEXES is not set
+# CONFIG_DEBUG_LOCK_ALLOC is not set
+# CONFIG_PROVE_LOCKING is not set
+# CONFIG_LOCK_STAT is not set
+# CONFIG_DEBUG_SPINLOCK_SLEEP is not set
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+# CONFIG_DEBUG_KOBJECT is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_DEBUG_SG is not set
+CONFIG_FRAME_POINTER=y
+# CONFIG_BOOT_PRINTK_DELAY is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_SYSCTL_SYSCALL_CHECK is not set
+CONFIG_HAVE_FTRACE=y
+CONFIG_HAVE_DYNAMIC_FTRACE=y
+# CONFIG_FTRACE is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_CONTEXT_SWITCH_TRACER is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+# CONFIG_KGDB is not set
+CONFIG_DEBUG_USER=y
+# CONFIG_DEBUG_ERRORS is not set
+# CONFIG_DEBUG_STACK_USAGE is not set
+CONFIG_DEBUG_LL=y
+# CONFIG_DEBUG_ICEDCC is not set
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITY_FILE_CAPABILITIES is not set
+CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
+# CONFIG_CRYPTO_MANAGER is not set
+# CONFIG_CRYPTO_GF128MUL is not set
+# CONFIG_CRYPTO_NULL is not set
+# CONFIG_CRYPTO_CRYPTD is not set
+# CONFIG_CRYPTO_AUTHENC is not set
+# CONFIG_CRYPTO_TEST is not set
+
+#
+# Authenticated Encryption with Associated Data
+#
+# CONFIG_CRYPTO_CCM is not set
+# CONFIG_CRYPTO_GCM is not set
+# CONFIG_CRYPTO_SEQIV is not set
+
+#
+# Block modes
+#
+# CONFIG_CRYPTO_CBC is not set
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+# CONFIG_CRYPTO_ECB is not set
+# CONFIG_CRYPTO_LRW is not set
+# CONFIG_CRYPTO_PCBC is not set
+# CONFIG_CRYPTO_XTS is not set
+
+#
+# Hash modes
+#
+# CONFIG_CRYPTO_HMAC is not set
+# CONFIG_CRYPTO_XCBC is not set
+
+#
+# Digest
+#
+# CONFIG_CRYPTO_CRC32C is not set
+# CONFIG_CRYPTO_MD4 is not set
+# CONFIG_CRYPTO_MD5 is not set
+# CONFIG_CRYPTO_MICHAEL_MIC is not set
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+# CONFIG_CRYPTO_SHA1 is not set
+# CONFIG_CRYPTO_SHA256 is not set
+# CONFIG_CRYPTO_SHA512 is not set
+# CONFIG_CRYPTO_TGR192 is not set
+# CONFIG_CRYPTO_WP512 is not set
+
+#
+# Ciphers
+#
+# CONFIG_CRYPTO_AES is not set
+# CONFIG_CRYPTO_ANUBIS is not set
+# CONFIG_CRYPTO_ARC4 is not set
+# CONFIG_CRYPTO_BLOWFISH is not set
+# CONFIG_CRYPTO_CAMELLIA is not set
+# CONFIG_CRYPTO_CAST5 is not set
+# CONFIG_CRYPTO_CAST6 is not set
+# CONFIG_CRYPTO_DES is not set
+# CONFIG_CRYPTO_FCRYPT is not set
+# CONFIG_CRYPTO_KHAZAD is not set
+# CONFIG_CRYPTO_SALSA20 is not set
+# CONFIG_CRYPTO_SEED is not set
+# CONFIG_CRYPTO_SERPENT is not set
+# CONFIG_CRYPTO_TEA is not set
+# CONFIG_CRYPTO_TWOFISH is not set
+
+#
+# Compression
+#
+# CONFIG_CRYPTO_DEFLATE is not set
+# CONFIG_CRYPTO_LZO is not set
+CONFIG_CRYPTO_HW=y
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=y
+# CONFIG_GENERIC_FIND_FIRST_BIT is not set
+# CONFIG_GENERIC_FIND_NEXT_BIT is not set
+# CONFIG_CRC_CCITT is not set
+# CONFIG_CRC16 is not set
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=y
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_PLIST=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
diff --git a/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/logo_linux_clut224.ppm b/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/logo_linux_clut224.ppm
new file mode 100644
index 0000000..3c14e43
--- /dev/null
+++ b/recipes/linux/linux-jade-2.6.27/jade-sk-86r01/logo_linux_clut224.ppm
@@ -0,0 +1,1604 @@
+P3
+# Standard 224-color Linux logo
+80 80
+255
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  6   6   6   6   6   6  10  10  10  10  10  10
+ 10  10  10   6   6   6   6   6   6   6   6   6
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   6   6   6  10  10  10  14  14  14
+ 22  22  22  26  26  26  30  30  30  34  34  34
+ 30  30  30  30  30  30  26  26  26  18  18  18
+ 14  14  14  10  10  10   6   6   6   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   1   0   0   1   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  6   6   6  14  14  14  26  26  26  42  42  42
+ 54  54  54  66  66  66  78  78  78  78  78  78
+ 78  78  78  74  74  74  66  66  66  54  54  54
+ 42  42  42  26  26  26  18  18  18  10  10  10
+  6   6   6   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   1   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  10  10  10
+ 22  22  22  42  42  42  66  66  66  86  86  86
+ 66  66  66  38  38  38  38  38  38  22  22  22
+ 26  26  26  34  34  34  54  54  54  66  66  66
+ 86  86  86  70  70  70  46  46  46  26  26  26
+ 14  14  14   6   6   6   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   1   0   0   1   0   0   1   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0  10  10  10  26  26  26
+ 50  50  50  82  82  82  58  58  58   6   6   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  6   6   6  54  54  54  86  86  86  66  66  66
+ 38  38  38  18  18  18   6   6   6   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   6   6   6  22  22  22  50  50  50
+ 78  78  78  34  34  34   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   6   6   6  70  70  70
+ 78  78  78  46  46  46  22  22  22   6   6   6
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   1   0   0   1   0   0   1   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  6   6   6  18  18  18  42  42  42  82  82  82
+ 26  26  26   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6  14  14  14
+ 46  46  46  34  34  34   6   6   6   2   2   6
+ 42  42  42  78  78  78  42  42  42  18  18  18
+  6   6   6   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   1   0   0   0   0   0   1   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+ 10  10  10  30  30  30  66  66  66  58  58  58
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6  26  26  26
+ 86  86  86 101 101 101  46  46  46  10  10  10
+  2   2   6  58  58  58  70  70  70  34  34  34
+ 10  10  10   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   1   0   0   1   0   0   1   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+ 14  14  14  42  42  42  86  86  86  10  10  10
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6  30  30  30
+ 94  94  94  94  94  94  58  58  58  26  26  26
+  2   2   6   6   6   6  78  78  78  54  54  54
+ 22  22  22   6   6   6   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   6   6   6
+ 22  22  22  62  62  62  62  62  62   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6  26  26  26
+ 54  54  54  38  38  38  18  18  18  10  10  10
+  2   2   6   2   2   6  34  34  34  82  82  82
+ 38  38  38  14  14  14   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   1   0   0   1   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   6   6   6
+ 30  30  30  78  78  78  30  30  30   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6  10  10  10
+ 10  10  10   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6  78  78  78
+ 50  50  50  18  18  18   6   6   6   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   1   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  10  10  10
+ 38  38  38  86  86  86  14  14  14   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6  54  54  54
+ 66  66  66  26  26  26   6   6   6   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   1   0   0   1   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  14  14  14
+ 42  42  42  82  82  82   2   2   6   2   2   6
+  2   2   6   6   6   6  10  10  10   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6   6   6   6
+ 14  14  14  10  10  10   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6  18  18  18
+ 82  82  82  34  34  34  10  10  10   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   1   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  14  14  14
+ 46  46  46  86  86  86   2   2   6   2   2   6
+  6   6   6   6   6   6  22  22  22  34  34  34
+  6   6   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6  18  18  18  34  34  34
+ 10  10  10  50  50  50  22  22  22   2   2   6
+  2   2   6   2   2   6   2   2   6  10  10  10
+ 86  86  86  42  42  42  14  14  14   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   1   0   0   1   0   0   1   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  14  14  14
+ 46  46  46  86  86  86   2   2   6   2   2   6
+ 38  38  38 116 116 116  94  94  94  22  22  22
+ 22  22  22   2   2   6   2   2   6   2   2   6
+ 14  14  14  86  86  86 138 138 138 162 162 162
+154 154 154  38  38  38  26  26  26   6   6   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+ 86  86  86  46  46  46  14  14  14   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  14  14  14
+ 46  46  46  86  86  86   2   2   6  14  14  14
+134 134 134 198 198 198 195 195 195 116 116 116
+ 10  10  10   2   2   6   2   2   6   6   6   6
+101  98  89 187 187 187 210 210 210 218 218 218
+214 214 214 134 134 134  14  14  14   6   6   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+ 86  86  86  50  50  50  18  18  18   6   6   6
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   1   0   0   0
+  0   0   1   0   0   1   0   0   1   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  14  14  14
+ 46  46  46  86  86  86   2   2   6  54  54  54
+218 218 218 195 195 195 226 226 226 246 246 246
+ 58  58  58   2   2   6   2   2   6  30  30  30
+210 210 210 253 253 253 174 174 174 123 123 123
+221 221 221 234 234 234  74  74  74   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+ 70  70  70  58  58  58  22  22  22   6   6   6
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  14  14  14
+ 46  46  46  82  82  82   2   2   6 106 106 106
+170 170 170  26  26  26  86  86  86 226 226 226
+123 123 123  10  10  10  14  14  14  46  46  46
+231 231 231 190 190 190   6   6   6  70  70  70
+ 90  90  90 238 238 238 158 158 158   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+ 70  70  70  58  58  58  22  22  22   6   6   6
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   1   0   0   0
+  0   0   1   0   0   1   0   0   1   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  14  14  14
+ 42  42  42  86  86  86   6   6   6 116 116 116
+106 106 106   6   6   6  70  70  70 149 149 149
+128 128 128  18  18  18  38  38  38  54  54  54
+221 221 221 106 106 106   2   2   6  14  14  14
+ 46  46  46 190 190 190 198 198 198   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+ 74  74  74  62  62  62  22  22  22   6   6   6
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   1   0   0   0
+  0   0   1   0   0   0   0   0   1   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  14  14  14
+ 42  42  42  94  94  94  14  14  14 101 101 101
+128 128 128   2   2   6  18  18  18 116 116 116
+118  98  46 121  92   8 121  92   8  98  78  10
+162 162 162 106 106 106   2   2   6   2   2   6
+  2   2   6 195 195 195 195 195 195   6   6   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+ 74  74  74  62  62  62  22  22  22   6   6   6
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   1   0   0   1
+  0   0   1   0   0   0   0   0   1   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  10  10  10
+ 38  38  38  90  90  90  14  14  14  58  58  58
+210 210 210  26  26  26  54  38   6 154 114  10
+226 170  11 236 186  11 225 175  15 184 144  12
+215 174  15 175 146  61  37  26   9   2   2   6
+ 70  70  70 246 246 246 138 138 138   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+ 70  70  70  66  66  66  26  26  26   6   6   6
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  10  10  10
+ 38  38  38  86  86  86  14  14  14  10  10  10
+195 195 195 188 164 115 192 133   9 225 175  15
+239 182  13 234 190  10 232 195  16 232 200  30
+245 207  45 241 208  19 232 195  16 184 144  12
+218 194 134 211 206 186  42  42  42   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+ 50  50  50  74  74  74  30  30  30   6   6   6
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  10  10  10
+ 34  34  34  86  86  86  14  14  14   2   2   6
+121  87  25 192 133   9 219 162  10 239 182  13
+236 186  11 232 195  16 241 208  19 244 214  54
+246 218  60 246 218  38 246 215  20 241 208  19
+241 208  19 226 184  13 121  87  25   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+ 50  50  50  82  82  82  34  34  34  10  10  10
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  10  10  10
+ 34  34  34  82  82  82  30  30  30  61  42   6
+180 123   7 206 145  10 230 174  11 239 182  13
+234 190  10 238 202  15 241 208  19 246 218  74
+246 218  38 246 215  20 246 215  20 246 215  20
+226 184  13 215 174  15 184 144  12   6   6   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+ 26  26  26  94  94  94  42  42  42  14  14  14
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  10  10  10
+ 30  30  30  78  78  78  50  50  50 104  69   6
+192 133   9 216 158  10 236 178  12 236 186  11
+232 195  16 241 208  19 244 214  54 245 215  43
+246 215  20 246 215  20 241 208  19 198 155  10
+200 144  11 216 158  10 156 118  10   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  6   6   6  90  90  90  54  54  54  18  18  18
+  6   6   6   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  10  10  10
+ 30  30  30  78  78  78  46  46  46  22  22  22
+137  92   6 210 162  10 239 182  13 238 190  10
+238 202  15 241 208  19 246 215  20 246 215  20
+241 208  19 203 166  17 185 133  11 210 150  10
+216 158  10 210 150  10 102  78  10   2   2   6
+  6   6   6  54  54  54  14  14  14   2   2   6
+  2   2   6  62  62  62  74  74  74  30  30  30
+ 10  10  10   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  10  10  10
+ 34  34  34  78  78  78  50  50  50   6   6   6
+ 94  70  30 139 102  15 190 146  13 226 184  13
+232 200  30 232 195  16 215 174  15 190 146  13
+168 122  10 192 133   9 210 150  10 213 154  11
+202 150  34 182 157 106 101  98  89   2   2   6
+  2   2   6  78  78  78 116 116 116  58  58  58
+  2   2   6  22  22  22  90  90  90  46  46  46
+ 18  18  18   6   6   6   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  10  10  10
+ 38  38  38  86  86  86  50  50  50   6   6   6
+128 128 128 174 154 114 156 107  11 168 122  10
+198 155  10 184 144  12 197 138  11 200 144  11
+206 145  10 206 145  10 197 138  11 188 164 115
+195 195 195 198 198 198 174 174 174  14  14  14
+  2   2   6  22  22  22 116 116 116 116 116 116
+ 22  22  22   2   2   6  74  74  74  70  70  70
+ 30  30  30  10  10  10   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   6   6   6  18  18  18
+ 50  50  50 101 101 101  26  26  26  10  10  10
+138 138 138 190 190 190 174 154 114 156 107  11
+197 138  11 200 144  11 197 138  11 192 133   9
+180 123   7 190 142  34 190 178 144 187 187 187
+202 202 202 221 221 221 214 214 214  66  66  66
+  2   2   6   2   2   6  50  50  50  62  62  62
+  6   6   6   2   2   6  10  10  10  90  90  90
+ 50  50  50  18  18  18   6   6   6   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0  10  10  10  34  34  34
+ 74  74  74  74  74  74   2   2   6   6   6   6
+144 144 144 198 198 198 190 190 190 178 166 146
+154 121  60 156 107  11 156 107  11 168 124  44
+174 154 114 187 187 187 190 190 190 210 210 210
+246 246 246 253 253 253 253 253 253 182 182 182
+  6   6   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6  62  62  62
+ 74  74  74  34  34  34  14  14  14   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0  10  10  10  22  22  22  54  54  54
+ 94  94  94  18  18  18   2   2   6  46  46  46
+234 234 234 221 221 221 190 190 190 190 190 190
+190 190 190 187 187 187 187 187 187 190 190 190
+190 190 190 195 195 195 214 214 214 242 242 242
+253 253 253 253 253 253 253 253 253 253 253 253
+ 82  82  82   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6  14  14  14
+ 86  86  86  54  54  54  22  22  22   6   6   6
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  6   6   6  18  18  18  46  46  46  90  90  90
+ 46  46  46  18  18  18   6   6   6 182 182 182
+253 253 253 246 246 246 206 206 206 190 190 190
+190 190 190 190 190 190 190 190 190 190 190 190
+206 206 206 231 231 231 250 250 250 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+202 202 202  14  14  14   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+ 42  42  42  86  86  86  42  42  42  18  18  18
+  6   6   6   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   6   6   6
+ 14  14  14  38  38  38  74  74  74  66  66  66
+  2   2   6   6   6   6  90  90  90 250 250 250
+253 253 253 253 253 253 238 238 238 198 198 198
+190 190 190 190 190 190 195 195 195 221 221 221
+246 246 246 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253  82  82  82   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6  78  78  78  70  70  70  34  34  34
+ 14  14  14   6   6   6   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  14  14  14
+ 34  34  34  66  66  66  78  78  78   6   6   6
+  2   2   6  18  18  18 218 218 218 253 253 253
+253 253 253 253 253 253 253 253 253 246 246 246
+226 226 226 231 231 231 246 246 246 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 178 178 178   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6  18  18  18  90  90  90  62  62  62
+ 30  30  30  10  10  10   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0  10  10  10  26  26  26
+ 58  58  58  90  90  90  18  18  18   2   2   6
+  2   2   6 110 110 110 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+250 250 250 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 231 231 231  18  18  18   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6  18  18  18  94  94  94
+ 54  54  54  26  26  26  10  10  10   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   6   6   6  22  22  22  50  50  50
+ 90  90  90  26  26  26   2   2   6   2   2   6
+ 14  14  14 195 195 195 250 250 250 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+250 250 250 242 242 242  54  54  54   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6  38  38  38
+ 86  86  86  50  50  50  22  22  22   6   6   6
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  6   6   6  14  14  14  38  38  38  82  82  82
+ 34  34  34   2   2   6   2   2   6   2   2   6
+ 42  42  42 195 195 195 246 246 246 253 253 253
+253 253 253 253 253 253 253 253 253 250 250 250
+242 242 242 242 242 242 250 250 250 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 250 250 250 246 246 246 238 238 238
+226 226 226 231 231 231 101 101 101   6   6   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+ 38  38  38  82  82  82  42  42  42  14  14  14
+  6   6   6   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+ 10  10  10  26  26  26  62  62  62  66  66  66
+  2   2   6   2   2   6   2   2   6   6   6   6
+ 70  70  70 170 170 170 206 206 206 234 234 234
+246 246 246 250 250 250 250 250 250 238 238 238
+226 226 226 231 231 231 238 238 238 250 250 250
+250 250 250 250 250 250 246 246 246 231 231 231
+214 214 214 206 206 206 202 202 202 202 202 202
+198 198 198 202 202 202 182 182 182  18  18  18
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6  62  62  62  66  66  66  30  30  30
+ 10  10  10   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+ 14  14  14  42  42  42  82  82  82  18  18  18
+  2   2   6   2   2   6   2   2   6  10  10  10
+ 94  94  94 182 182 182 218 218 218 242 242 242
+250 250 250 253 253 253 253 253 253 250 250 250
+234 234 234 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 246 246 246
+238 238 238 226 226 226 210 210 210 202 202 202
+195 195 195 195 195 195 210 210 210 158 158 158
+  6   6   6  14  14  14  50  50  50  14  14  14
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   6   6   6  86  86  86  46  46  46
+ 18  18  18   6   6   6   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   6   6   6
+ 22  22  22  54  54  54  70  70  70   2   2   6
+  2   2   6  10  10  10   2   2   6  22  22  22
+166 166 166 231 231 231 250 250 250 253 253 253
+253 253 253 253 253 253 253 253 253 250 250 250
+242 242 242 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 246 246 246
+231 231 231 206 206 206 198 198 198 226 226 226
+ 94  94  94   2   2   6   6   6   6  38  38  38
+ 30  30  30   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6  62  62  62  66  66  66
+ 26  26  26  10  10  10   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  10  10  10
+ 30  30  30  74  74  74  50  50  50   2   2   6
+ 26  26  26  26  26  26   2   2   6 106 106 106
+238 238 238 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 246 246 246 218 218 218 202 202 202
+210 210 210  14  14  14   2   2   6   2   2   6
+ 30  30  30  22  22  22   2   2   6   2   2   6
+  2   2   6   2   2   6  18  18  18  86  86  86
+ 42  42  42  14  14  14   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  14  14  14
+ 42  42  42  90  90  90  22  22  22   2   2   6
+ 42  42  42   2   2   6  18  18  18 218 218 218
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 250 250 250 221 221 221
+218 218 218 101 101 101   2   2   6  14  14  14
+ 18  18  18  38  38  38  10  10  10   2   2   6
+  2   2   6   2   2   6   2   2   6  78  78  78
+ 58  58  58  22  22  22   6   6   6   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   6   6   6  18  18  18
+ 54  54  54  82  82  82   2   2   6  26  26  26
+ 22  22  22   2   2   6 123 123 123 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 250 250 250
+238 238 238 198 198 198   6   6   6  38  38  38
+ 58  58  58  26  26  26  38  38  38   2   2   6
+  2   2   6   2   2   6   2   2   6  46  46  46
+ 78  78  78  30  30  30  10  10  10   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0  10  10  10  30  30  30
+ 74  74  74  58  58  58   2   2   6  42  42  42
+  2   2   6  22  22  22 231 231 231 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 250 250 250
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 246 246 246  46  46  46  38  38  38
+ 42  42  42  14  14  14  38  38  38  14  14  14
+  2   2   6   2   2   6   2   2   6   6   6   6
+ 86  86  86  46  46  46  14  14  14   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   6   6   6  14  14  14  42  42  42
+ 90  90  90  18  18  18  18  18  18  26  26  26
+  2   2   6 116 116 116 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 250 250 250 238 238 238
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253  94  94  94   6   6   6
+  2   2   6   2   2   6  10  10  10  34  34  34
+  2   2   6   2   2   6   2   2   6   2   2   6
+ 74  74  74  58  58  58  22  22  22   6   6   6
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0  10  10  10  26  26  26  66  66  66
+ 82  82  82   2   2   6  38  38  38   6   6   6
+ 14  14  14 210 210 210 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 246 246 246 242 242 242
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 144 144 144   2   2   6
+  2   2   6   2   2   6   2   2   6  46  46  46
+  2   2   6   2   2   6   2   2   6   2   2   6
+ 42  42  42  74  74  74  30  30  30  10  10  10
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  6   6   6  14  14  14  42  42  42  90  90  90
+ 26  26  26   6   6   6  42  42  42   2   2   6
+ 74  74  74 250 250 250 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 242 242 242 242 242 242
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 182 182 182   2   2   6
+  2   2   6   2   2   6   2   2   6  46  46  46
+  2   2   6   2   2   6   2   2   6   2   2   6
+ 10  10  10  86  86  86  38  38  38  10  10  10
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+ 10  10  10  26  26  26  66  66  66  82  82  82
+  2   2   6  22  22  22  18  18  18   2   2   6
+149 149 149 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 234 234 234 242 242 242
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 206 206 206   2   2   6
+  2   2   6   2   2   6   2   2   6  38  38  38
+  2   2   6   2   2   6   2   2   6   2   2   6
+  6   6   6  86  86  86  46  46  46  14  14  14
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   6   6   6
+ 18  18  18  46  46  46  86  86  86  18  18  18
+  2   2   6  34  34  34  10  10  10   6   6   6
+210 210 210 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 234 234 234 242 242 242
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 221 221 221   6   6   6
+  2   2   6   2   2   6   6   6   6  30  30  30
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6  82  82  82  54  54  54  18  18  18
+  6   6   6   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  10  10  10
+ 26  26  26  66  66  66  62  62  62   2   2   6
+  2   2   6  38  38  38  10  10  10  26  26  26
+238 238 238 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 231 231 231 238 238 238
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 231 231 231   6   6   6
+  2   2   6   2   2   6  10  10  10  30  30  30
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6  66  66  66  58  58  58  22  22  22
+  6   6   6   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  10  10  10
+ 38  38  38  78  78  78   6   6   6   2   2   6
+  2   2   6  46  46  46  14  14  14  42  42  42
+246 246 246 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 231 231 231 242 242 242
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 234 234 234  10  10  10
+  2   2   6   2   2   6  22  22  22  14  14  14
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6  66  66  66  62  62  62  22  22  22
+  6   6   6   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   6   6   6  18  18  18
+ 50  50  50  74  74  74   2   2   6   2   2   6
+ 14  14  14  70  70  70  34  34  34  62  62  62
+250 250 250 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 231 231 231 246 246 246
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 234 234 234  14  14  14
+  2   2   6   2   2   6  30  30  30   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6  66  66  66  62  62  62  22  22  22
+  6   6   6   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   6   6   6  18  18  18
+ 54  54  54  62  62  62   2   2   6   2   2   6
+  2   2   6  30  30  30  46  46  46  70  70  70
+250 250 250 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 231 231 231 246 246 246
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 226 226 226  10  10  10
+  2   2   6   6   6   6  30  30  30   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6  66  66  66  58  58  58  22  22  22
+  6   6   6   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   6   6   6  22  22  22
+ 58  58  58  62  62  62   2   2   6   2   2   6
+  2   2   6   2   2   6  30  30  30  78  78  78
+250 250 250 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 231 231 231 246 246 246
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 206 206 206   2   2   6
+ 22  22  22  34  34  34  18  14   6  22  22  22
+ 26  26  26  18  18  18   6   6   6   2   2   6
+  2   2   6  82  82  82  54  54  54  18  18  18
+  6   6   6   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   6   6   6  26  26  26
+ 62  62  62 106 106 106  74  54  14 185 133  11
+210 162  10 121  92   8   6   6   6  62  62  62
+238 238 238 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 231 231 231 246 246 246
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 158 158 158  18  18  18
+ 14  14  14   2   2   6   2   2   6   2   2   6
+  6   6   6  18  18  18  66  66  66  38  38  38
+  6   6   6  94  94  94  50  50  50  18  18  18
+  6   6   6   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   6   6   6
+ 10  10  10  10  10  10  18  18  18  38  38  38
+ 78  78  78 142 134 106 216 158  10 242 186  14
+246 190  14 246 190  14 156 118  10  10  10  10
+ 90  90  90 238 238 238 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 231 231 231 250 250 250
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 246 230 190
+238 204  91 238 204  91 181 142  44  37  26   9
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6  38  38  38  46  46  46
+ 26  26  26 106 106 106  54  54  54  18  18  18
+  6   6   6   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   6   6   6  14  14  14  22  22  22
+ 30  30  30  38  38  38  50  50  50  70  70  70
+106 106 106 190 142  34 226 170  11 242 186  14
+246 190  14 246 190  14 246 190  14 154 114  10
+  6   6   6  74  74  74 226 226 226 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 231 231 231 250 250 250
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 228 184  62
+241 196  14 241 208  19 232 195  16  38  30  10
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   6   6   6  30  30  30  26  26  26
+203 166  17 154 142  90  66  66  66  26  26  26
+  6   6   6   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  6   6   6  18  18  18  38  38  38  58  58  58
+ 78  78  78  86  86  86 101 101 101 123 123 123
+175 146  61 210 150  10 234 174  13 246 186  14
+246 190  14 246 190  14 246 190  14 238 190  10
+102  78  10   2   2   6  46  46  46 198 198 198
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 234 234 234 242 242 242
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 224 178  62
+242 186  14 241 196  14 210 166  10  22  18   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   6   6   6 121  92   8
+238 202  15 232 195  16  82  82  82  34  34  34
+ 10  10  10   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+ 14  14  14  38  38  38  70  70  70 154 122  46
+190 142  34 200 144  11 197 138  11 197 138  11
+213 154  11 226 170  11 242 186  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+225 175  15  46  32   6   2   2   6  22  22  22
+158 158 158 250 250 250 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 250 250 250 242 242 242 224 178  62
+239 182  13 236 186  11 213 154  11  46  32   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6  61  42   6 225 175  15
+238 190  10 236 186  11 112 100  78  42  42  42
+ 14  14  14   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   6   6   6
+ 22  22  22  54  54  54 154 122  46 213 154  11
+226 170  11 230 174  11 226 170  11 226 170  11
+236 178  12 242 186  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+241 196  14 184 144  12  10  10  10   2   2   6
+  6   6   6 116 116 116 242 242 242 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 231 231 231 198 198 198 214 170  54
+236 178  12 236 178  12 210 150  10 137  92   6
+ 18  14   6   2   2   6   2   2   6   2   2   6
+  6   6   6  70  47   6 200 144  11 236 178  12
+239 182  13 239 182  13 124 112  88  58  58  58
+ 22  22  22   6   6   6   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  10  10  10
+ 30  30  30  70  70  70 180 133  36 226 170  11
+239 182  13 242 186  14 242 186  14 246 186  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 232 195  16  98  70   6   2   2   6
+  2   2   6   2   2   6  66  66  66 221 221 221
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 206 206 206 198 198 198 214 166  58
+230 174  11 230 174  11 216 158  10 192 133   9
+163 110   8 116  81   8 102  78  10 116  81   8
+167 114   7 197 138  11 226 170  11 239 182  13
+242 186  14 242 186  14 162 146  94  78  78  78
+ 34  34  34  14  14  14   6   6   6   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   6   6   6
+ 30  30  30  78  78  78 190 142  34 226 170  11
+239 182  13 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 241 196  14 203 166  17  22  18   6
+  2   2   6   2   2   6   2   2   6  38  38  38
+218 218 218 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+250 250 250 206 206 206 198 198 198 202 162  69
+226 170  11 236 178  12 224 166  10 210 150  10
+200 144  11 197 138  11 192 133   9 197 138  11
+210 150  10 226 170  11 242 186  14 246 190  14
+246 190  14 246 186  14 225 175  15 124 112  88
+ 62  62  62  30  30  30  14  14  14   6   6   6
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  10  10  10
+ 30  30  30  78  78  78 174 135  50 224 166  10
+239 182  13 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 241 196  14 139 102  15
+  2   2   6   2   2   6   2   2   6   2   2   6
+ 78  78  78 250 250 250 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+250 250 250 214 214 214 198 198 198 190 150  46
+219 162  10 236 178  12 234 174  13 224 166  10
+216 158  10 213 154  11 213 154  11 216 158  10
+226 170  11 239 182  13 246 190  14 246 190  14
+246 190  14 246 190  14 242 186  14 206 162  42
+101 101 101  58  58  58  30  30  30  14  14  14
+  6   6   6   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  10  10  10
+ 30  30  30  74  74  74 174 135  50 216 158  10
+236 178  12 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 241 196  14 226 184  13
+ 61  42   6   2   2   6   2   2   6   2   2   6
+ 22  22  22 238 238 238 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 226 226 226 187 187 187 180 133  36
+216 158  10 236 178  12 239 182  13 236 178  12
+230 174  11 226 170  11 226 170  11 230 174  11
+236 178  12 242 186  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 186  14 239 182  13
+206 162  42 106 106 106  66  66  66  34  34  34
+ 14  14  14   6   6   6   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   6   6   6
+ 26  26  26  70  70  70 163 133  67 213 154  11
+236 178  12 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 241 196  14
+190 146  13  18  14   6   2   2   6   2   2   6
+ 46  46  46 246 246 246 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 221 221 221  86  86  86 156 107  11
+216 158  10 236 178  12 242 186  14 246 186  14
+242 186  14 239 182  13 239 182  13 242 186  14
+242 186  14 246 186  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+242 186  14 225 175  15 142 122  72  66  66  66
+ 30  30  30  10  10  10   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   6   6   6
+ 26  26  26  70  70  70 163 133  67 210 150  10
+236 178  12 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+232 195  16 121  92   8  34  34  34 106 106 106
+221 221 221 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+242 242 242  82  82  82  18  14   6 163 110   8
+216 158  10 236 178  12 242 186  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 242 186  14 163 133  67
+ 46  46  46  18  18  18   6   6   6   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  10  10  10
+ 30  30  30  78  78  78 163 133  67 210 150  10
+236 178  12 246 186  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+241 196  14 215 174  15 190 178 144 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 218 218 218
+ 58  58  58   2   2   6  22  18   6 167 114   7
+216 158  10 236 178  12 246 186  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 186  14 242 186  14 190 150  46
+ 54  54  54  22  22  22   6   6   6   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  14  14  14
+ 38  38  38  86  86  86 180 133  36 213 154  11
+236 178  12 246 186  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 232 195  16 190 146  13 214 214 214
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 250 250 250 170 170 170  26  26  26
+  2   2   6   2   2   6  37  26   9 163 110   8
+219 162  10 239 182  13 246 186  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 186  14 236 178  12 224 166  10 142 122  72
+ 46  46  46  18  18  18   6   6   6   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   6   6   6  18  18  18
+ 50  50  50 109 106  95 192 133   9 224 166  10
+242 186  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+242 186  14 226 184  13 210 162  10 142 110  46
+226 226 226 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+253 253 253 253 253 253 253 253 253 253 253 253
+198 198 198  66  66  66   2   2   6   2   2   6
+  2   2   6   2   2   6  50  34   6 156 107  11
+219 162  10 239 182  13 246 186  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 242 186  14
+234 174  13 213 154  11 154 122  46  66  66  66
+ 30  30  30  10  10  10   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   6   6   6  22  22  22
+ 58  58  58 154 121  60 206 145  10 234 174  13
+242 186  14 246 186  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 186  14 236 178  12 210 162  10 163 110   8
+ 61  42   6 138 138 138 218 218 218 250 250 250
+253 253 253 253 253 253 253 253 253 250 250 250
+242 242 242 210 210 210 144 144 144  66  66  66
+  6   6   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6  61  42   6 163 110   8
+216 158  10 236 178  12 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 239 182  13 230 174  11 216 158  10
+190 142  34 124 112  88  70  70  70  38  38  38
+ 18  18  18   6   6   6   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   6   6   6  22  22  22
+ 62  62  62 168 124  44 206 145  10 224 166  10
+236 178  12 239 182  13 242 186  14 242 186  14
+246 186  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 236 178  12 216 158  10 175 118   6
+ 80  54   7   2   2   6   6   6   6  30  30  30
+ 54  54  54  62  62  62  50  50  50  38  38  38
+ 14  14  14   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   6   6   6  80  54   7 167 114   7
+213 154  11 236 178  12 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 190  14 242 186  14 239 182  13 239 182  13
+230 174  11 210 150  10 174 135  50 124 112  88
+ 82  82  82  54  54  54  34  34  34  18  18  18
+  6   6   6   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   6   6   6  18  18  18
+ 50  50  50 158 118  36 192 133   9 200 144  11
+216 158  10 219 162  10 224 166  10 226 170  11
+230 174  11 236 178  12 239 182  13 239 182  13
+242 186  14 246 186  14 246 190  14 246 190  14
+246 190  14 246 190  14 246 190  14 246 190  14
+246 186  14 230 174  11 210 150  10 163 110   8
+104  69   6  10  10  10   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   6   6   6  91  60   6 167 114   7
+206 145  10 230 174  11 242 186  14 246 190  14
+246 190  14 246 190  14 246 186  14 242 186  14
+239 182  13 230 174  11 224 166  10 213 154  11
+180 133  36 124 112  88  86  86  86  58  58  58
+ 38  38  38  22  22  22  10  10  10   6   6   6
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0  14  14  14
+ 34  34  34  70  70  70 138 110  50 158 118  36
+167 114   7 180 123   7 192 133   9 197 138  11
+200 144  11 206 145  10 213 154  11 219 162  10
+224 166  10 230 174  11 239 182  13 242 186  14
+246 186  14 246 186  14 246 186  14 246 186  14
+239 182  13 216 158  10 185 133  11 152  99   6
+104  69   6  18  14   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   2   2   6   2   2   6   2   2   6
+  2   2   6   6   6   6  80  54   7 152  99   6
+192 133   9 219 162  10 236 178  12 239 182  13
+246 186  14 242 186  14 239 182  13 236 178  12
+224 166  10 206 145  10 192 133   9 154 121  60
+ 94  94  94  62  62  62  42  42  42  22  22  22
+ 14  14  14   6   6   6   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   6   6   6
+ 18  18  18  34  34  34  58  58  58  78  78  78
+101  98  89 124 112  88 142 110  46 156 107  11
+163 110   8 167 114   7 175 118   6 180 123   7
+185 133  11 197 138  11 210 150  10 219 162  10
+226 170  11 236 178  12 236 178  12 234 174  13
+219 162  10 197 138  11 163 110   8 130  83   6
+ 91  60   6  10  10  10   2   2   6   2   2   6
+ 18  18  18  38  38  38  38  38  38  38  38  38
+ 38  38  38  38  38  38  38  38  38  38  38  38
+ 38  38  38  38  38  38  26  26  26   2   2   6
+  2   2   6   6   6   6  70  47   6 137  92   6
+175 118   6 200 144  11 219 162  10 230 174  11
+234 174  13 230 174  11 219 162  10 210 150  10
+192 133   9 163 110   8 124 112  88  82  82  82
+ 50  50  50  30  30  30  14  14  14   6   6   6
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  6   6   6  14  14  14  22  22  22  34  34  34
+ 42  42  42  58  58  58  74  74  74  86  86  86
+101  98  89 122 102  70 130  98  46 121  87  25
+137  92   6 152  99   6 163 110   8 180 123   7
+185 133  11 197 138  11 206 145  10 200 144  11
+180 123   7 156 107  11 130  83   6 104  69   6
+ 50  34   6  54  54  54 110 110 110 101  98  89
+ 86  86  86  82  82  82  78  78  78  78  78  78
+ 78  78  78  78  78  78  78  78  78  78  78  78
+ 78  78  78  82  82  82  86  86  86  94  94  94
+106 106 106 101 101 101  86  66  34 124  80   6
+156 107  11 180 123   7 192 133   9 200 144  11
+206 145  10 200 144  11 192 133   9 175 118   6
+139 102  15 109 106  95  70  70  70  42  42  42
+ 22  22  22  10  10  10   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   6   6   6  10  10  10
+ 14  14  14  22  22  22  30  30  30  38  38  38
+ 50  50  50  62  62  62  74  74  74  90  90  90
+101  98  89 112 100  78 121  87  25 124  80   6
+137  92   6 152  99   6 152  99   6 152  99   6
+138  86   6 124  80   6  98  70   6  86  66  30
+101  98  89  82  82  82  58  58  58  46  46  46
+ 38  38  38  34  34  34  34  34  34  34  34  34
+ 34  34  34  34  34  34  34  34  34  34  34  34
+ 34  34  34  34  34  34  38  38  38  42  42  42
+ 54  54  54  82  82  82  94  86  76  91  60   6
+134  86   6 156 107  11 167 114   7 175 118   6
+175 118   6 167 114   7 152  99   6 121  87  25
+101  98  89  62  62  62  34  34  34  18  18  18
+  6   6   6   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   6   6   6   6   6   6  10  10  10
+ 18  18  18  22  22  22  30  30  30  42  42  42
+ 50  50  50  66  66  66  86  86  86 101  98  89
+106  86  58  98  70   6 104  69   6 104  69   6
+104  69   6  91  60   6  82  62  34  90  90  90
+ 62  62  62  38  38  38  22  22  22  14  14  14
+ 10  10  10  10  10  10  10  10  10  10  10  10
+ 10  10  10  10  10  10   6   6   6  10  10  10
+ 10  10  10  10  10  10  10  10  10  14  14  14
+ 22  22  22  42  42  42  70  70  70  89  81  66
+ 80  54   7 104  69   6 124  80   6 137  92   6
+134  86   6 116  81   8 100  82  52  86  86  86
+ 58  58  58  30  30  30  14  14  14   6   6   6
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   6   6   6  10  10  10  14  14  14
+ 18  18  18  26  26  26  38  38  38  54  54  54
+ 70  70  70  86  86  86  94  86  76  89  81  66
+ 89  81  66  86  86  86  74  74  74  50  50  50
+ 30  30  30  14  14  14   6   6   6   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  6   6   6  18  18  18  34  34  34  58  58  58
+ 82  82  82  89  81  66  89  81  66  89  81  66
+ 94  86  66  94  86  76  74  74  74  50  50  50
+ 26  26  26  14  14  14   6   6   6   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  6   6   6   6   6   6  14  14  14  18  18  18
+ 30  30  30  38  38  38  46  46  46  54  54  54
+ 50  50  50  42  42  42  30  30  30  18  18  18
+ 10  10  10   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   6   6   6  14  14  14  26  26  26
+ 38  38  38  50  50  50  58  58  58  58  58  58
+ 54  54  54  42  42  42  30  30  30  18  18  18
+ 10  10  10   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   6   6   6
+  6   6   6  10  10  10  14  14  14  18  18  18
+ 18  18  18  14  14  14  10  10  10   6   6   6
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   6   6   6
+ 14  14  14  18  18  18  22  22  22  22  22  22
+ 18  18  18  14  14  14  10  10  10   6   6   6
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
+  0   0   0   0   0   0   0   0   0   0   0   0
diff --git a/recipes/linux/linux-jade_2.6.27.bb b/recipes/linux/linux-jade_2.6.27.bb
new file mode 100644
index 0000000..cc8bc60
--- /dev/null
+++ b/recipes/linux/linux-jade_2.6.27.bb
@@ -0,0 +1,44 @@
+require linux.inc
+
+PR = "r1"
+
+S = "${WORKDIR}/linux-2.6.27"
+
+COMPATIBLE_HOST = "arm.*-linux"
+COMPATIBLE_MACHINE = "jade-sk-86r01"
+
+# Mark archs/machines that this kernel supports
+DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_jade-sk-86r01 = "1"
+
+SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
+           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.21.bz2;apply=yes;name=stablepatch \
+	   file://logo_linux_clut224.ppm \
+           file://defconfig "
+
+SRC_URI_append_jade-sk-86r01 = "\
+	file://01_diff-mycable-all.patch \
+	file://02_diff-mycable-leds.patch \
+	file://03_diff-mycable-fb.patch \
+	file://04_diff-mycable-i2c.patch \
+	file://05_diff-mycable-usb.patch \
+	file://06_diff-mycable-can.patch \
+	file://07_diff-mycable-xxsnet-cryptoeeprom.patch \
+	file://08_diff-mycable-spi.patch \
+	file://09_diff-mycable-sound.patch \
+	file://10_0001-Add-Fujitsu-framebuffer-driver.patch \
+	"
+
+# see http://bugzilla.kernel.org/show_bug.cgi?id=11143
+do_install_append() {
+	if [ -f arch/${ARCH}/lib/crtsavres.o ]; then
+		mkdir -p $kerneldir/arch/${ARCH}/lib
+		cp -a arch/${ARCH}/lib/crtsavres.o $kerneldir/arch/${ARCH}/lib/
+	fi
+}
+
+
+SRC_URI[kernel.md5sum] = "b3e78977aa79d3754cb7f8143d7ddabd"
+SRC_URI[kernel.sha256sum] = "0e99bf9e83f4d1ae0c656741a84dfddfa9c4d2469cf35475f5939d02dc3e4393"
+SRC_URI[stablepatch.md5sum] = "9297d56c7e47f2977593d92e218228f2"
+SRC_URI[stablepatch.sha256sum] = "ac48615ffab711edb64d88683aa50b839a2d12303abb6a9bfb21421112309c8c"
-- 
1.7.5.4



