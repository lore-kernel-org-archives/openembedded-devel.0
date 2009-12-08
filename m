Received: from compulab.co.il ([67.18.134.219])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mike@compulab.co.il>) id 1NI843-0003rg-7p
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Dec 2009 22:57:51 +0100
Received: from [62.90.235.247] (helo=zimbra-mta.compulab.co.il)
	by compulab.site5.com with esmtp (Exim 4.69)
	(envelope-from <mike@compulab.co.il>) id 1NI82K-00064u-M3
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Dec 2009 15:56:06 -0600
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra-mta.compulab.co.il (Postfix) with ESMTP id 1EBB89A0359
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Dec 2009 23:55:57 +0200 (IST)
X-Virus-Scanned: amavisd-new at compulab.co.il
Received: from zimbra-mta.compulab.co.il ([127.0.0.1])
	by localhost (zimbra-mta.compulab.co.il [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id nl2d-8IrPXH2; Tue,  8 Dec 2009 23:55:49 +0200 (IST)
Received: from droid.compulab.local (droid.compulab.local [10.1.1.77])
	by zimbra-mta.compulab.co.il (Postfix) with ESMTP id AB63B9A0360;
	Tue,  8 Dec 2009 23:55:48 +0200 (IST)
Received: from droid.compulab.local (localhost [127.0.0.1])
	by droid.compulab.local (8.14.0/8.14.0) with ESMTP id nB8LthjF022585;
	Tue, 8 Dec 2009 23:55:44 +0200
Received: (from mike@localhost)
	by droid.compulab.local (8.14.0/8.14.0/Submit) id nB8LBJar022423;
	Tue, 8 Dec 2009 23:11:19 +0200
X-Authentication-Warning: droid.compulab.local: mike set sender to
	mike@compulab.co.il using -f
From: Mike Rapoport <mike@compulab.co.il>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Dec 2009 23:11:11 +0200
Message-Id: <afbcd57e6833572755e535c8052474b8bc250cc7.1260305960.git.mike@compulab.co.il>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <cover.1260305960.git.mike@compulab.co.il>
References: <cover.1260305960.git.mike@compulab.co.il>
X-ACL-Warn: {
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - compulab.site5.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - compulab.co.il
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 67.18.134.219
X-SA-Exim-Mail-From: mike@compulab.co.il
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/5] linux-omap 2.6.32: add cm-t35 support
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
X-List-Received-Date: Tue, 08 Dec 2009 21:57:51 -0000

Signed-off-by: Mike Rapoport <mike@compulab.co.il>
---
 .../0001-OMAP-DSS2-add-Toppoly-TDO35S-panel.patch  |  159 ++
 ...do24m-ensure-chip-select-changes-between-.patch |   30 +
 ...002-omap3-cm-t35-add-DSS2-display-support.patch |  307 ++++
 ...03-omap3-cm-t35-update-defconfig-for-DSS2.patch |  145 ++
 .../0004-omap3-cm-t35-add-cm-t35-mux-configs.patch |  427 +++++
 .../0006-omap3-cm-t35-update-defconfig.patch       |   87 +
 recipes/linux/linux-omap-2.6.32/cm-t35/defconfig   | 1823 ++++++++++++++++++++
 recipes/linux/linux-omap_2.6.32.bb                 |   12 +-
 8 files changed, 2989 insertions(+), 1 deletions(-)
 create mode 100644 recipes/linux/linux-omap-2.6.32/cm-t35/0001-OMAP-DSS2-add-Toppoly-TDO35S-panel.patch
 create mode 100644 recipes/linux/linux-omap-2.6.32/cm-t35/0001-backlight-tdo24m-ensure-chip-select-changes-between-.patch
 create mode 100644 recipes/linux/linux-omap-2.6.32/cm-t35/0002-omap3-cm-t35-add-DSS2-display-support.patch
 create mode 100644 recipes/linux/linux-omap-2.6.32/cm-t35/0003-omap3-cm-t35-update-defconfig-for-DSS2.patch
 create mode 100644 recipes/linux/linux-omap-2.6.32/cm-t35/0004-omap3-cm-t35-add-cm-t35-mux-configs.patch
 create mode 100644 recipes/linux/linux-omap-2.6.32/cm-t35/0006-omap3-cm-t35-update-defconfig.patch
 create mode 100644 recipes/linux/linux-omap-2.6.32/cm-t35/defconfig

diff --git a/recipes/linux/linux-omap-2.6.32/cm-t35/0001-OMAP-DSS2-add-Toppoly-TDO35S-panel.patch b/recipes/linux/linux-omap-2.6.32/cm-t35/0001-OMAP-DSS2-add-Toppoly-TDO35S-panel.patch
new file mode 100644
index 0000000..423b29f
--- /dev/null
+++ b/recipes/linux/linux-omap-2.6.32/cm-t35/0001-OMAP-DSS2-add-Toppoly-TDO35S-panel.patch
@@ -0,0 +1,159 @@
+From 971595be3dc245cfa095747263b94535d27a3f1c Mon Sep 17 00:00:00 2001
+From: Mike Rapoport <mike@compulab.co.il>
+Date: Tue, 1 Dec 2009 12:14:10 +0200
+Subject: [PATCH 1/6] OMAP: DSS2: add Toppoly TDO35S panel
+
+Signed-off-by: Mike Rapoport <mike@compulab.co.il>
+---
+ drivers/video/omap2/displays/Kconfig               |    6 +
+ drivers/video/omap2/displays/Makefile              |    1 +
+ .../video/omap2/displays/panel-toppoly-tdo35s.c    |  112 ++++++++++++++++++++
+ 3 files changed, 119 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/video/omap2/displays/panel-toppoly-tdo35s.c
+
+diff --git a/drivers/video/omap2/displays/Kconfig b/drivers/video/omap2/displays/Kconfig
+index 79d2861..0d0d4f3 100644
+--- a/drivers/video/omap2/displays/Kconfig
++++ b/drivers/video/omap2/displays/Kconfig
+@@ -25,4 +25,10 @@ config PANEL_TAAL
+         help
+           Taal DSI command mode panel from TPO.
+ 
++config PANEL_TOPPOLY_TDO35S
++        tristate "Toppoly TDO35S LCD Panel support"
++        depends on OMAP2_DSS
++        help
++          LCD Panel used in CM-T35
++
+ endmenu
+diff --git a/drivers/video/omap2/displays/Makefile b/drivers/video/omap2/displays/Makefile
+index d44e765..e299454 100644
+--- a/drivers/video/omap2/displays/Makefile
++++ b/drivers/video/omap2/displays/Makefile
+@@ -3,3 +3,4 @@ obj-$(CONFIG_PANEL_SAMSUNG_LTE430WQ_F0C) += panel-samsung-lte430wq-f0c.o
+ obj-$(CONFIG_PANEL_SHARP_LS037V7DW01) += panel-sharp-ls037v7dw01.o
+ 
+ obj-$(CONFIG_PANEL_TAAL) += panel-taal.o
++obj-$(CONFIG_PANEL_TOPPOLY_TDO35S) += panel-toppoly-tdo35s.o
+\ No newline at end of file
+diff --git a/drivers/video/omap2/displays/panel-toppoly-tdo35s.c b/drivers/video/omap2/displays/panel-toppoly-tdo35s.c
+new file mode 100644
+index 0000000..e744b8c
+--- /dev/null
++++ b/drivers/video/omap2/displays/panel-toppoly-tdo35s.c
+@@ -0,0 +1,112 @@
++/*
++ * LCD panel driver for Toppoly TDO35S
++ *
++ * Copyright (C) 2009 CompuLab, Ltd.
++ * Author: Mike Rapoport <mike@compulab.co.il>
++ *
++ * Based on generic panel support
++ * Copyright (C) 2008 Nokia Corporation
++ * Author: Tomi Valkeinen <tomi.valkeinen@nokia.com>
++ *
++ * This program is free software; you can redistribute it and/or modify it
++ * under the terms of the GNU General Public License version 2 as published by
++ * the Free Software Foundation.
++ *
++ * This program is distributed in the hope that it will be useful, but WITHOUT
++ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
++ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
++ * more details.
++ *
++ * You should have received a copy of the GNU General Public License along with
++ * this program.  If not, see <http://www.gnu.org/licenses/>.
++ */
++
++#include <linux/module.h>
++#include <linux/delay.h>
++
++#include <plat/display.h>
++
++static struct omap_video_timings toppoly_tdo_panel_timings = {
++	/* 640 x 480 @ 60 Hz  Reduced blanking VESA CVT 0.31M3-R */
++	.x_res		= 480,
++	.y_res		= 640,
++
++	.pixel_clock	= 26000,
++
++	.hfp		= 104,
++	.hsw		= 8,
++	.hbp		= 8,
++
++	.vfp		= 4,
++	.vsw		= 2,
++	.vbp		= 2,
++};
++
++static int toppoly_tdo_panel_probe(struct omap_dss_device *dssdev)
++{
++	dssdev->panel.config = OMAP_DSS_LCD_TFT | OMAP_DSS_LCD_IVS |
++		OMAP_DSS_LCD_IHS;
++	dssdev->panel.timings = toppoly_tdo_panel_timings;
++
++	return 0;
++}
++
++static void toppoly_tdo_panel_remove(struct omap_dss_device *dssdev)
++{
++}
++
++static int toppoly_tdo_panel_enable(struct omap_dss_device *dssdev)
++{
++	int r = 0;
++
++	if (dssdev->platform_enable)
++		r = dssdev->platform_enable(dssdev);
++
++	return r;
++}
++
++static void toppoly_tdo_panel_disable(struct omap_dss_device *dssdev)
++{
++	if (dssdev->platform_disable)
++		dssdev->platform_disable(dssdev);
++}
++
++static int toppoly_tdo_panel_suspend(struct omap_dss_device *dssdev)
++{
++	toppoly_tdo_panel_disable(dssdev);
++	return 0;
++}
++
++static int toppoly_tdo_panel_resume(struct omap_dss_device *dssdev)
++{
++	return toppoly_tdo_panel_enable(dssdev);
++}
++
++static struct omap_dss_driver generic_driver = {
++	.probe		= toppoly_tdo_panel_probe,
++	.remove		= toppoly_tdo_panel_remove,
++
++	.enable		= toppoly_tdo_panel_enable,
++	.disable	= toppoly_tdo_panel_disable,
++	.suspend	= toppoly_tdo_panel_suspend,
++	.resume		= toppoly_tdo_panel_resume,
++
++	.driver         = {
++		.name   = "toppoly_tdo35s_panel",
++		.owner  = THIS_MODULE,
++	},
++};
++
++static int __init toppoly_tdo_panel_drv_init(void)
++{
++	return omap_dss_register_driver(&generic_driver);
++}
++
++static void __exit toppoly_tdo_panel_drv_exit(void)
++{
++	omap_dss_unregister_driver(&generic_driver);
++}
++
++module_init(toppoly_tdo_panel_drv_init);
++module_exit(toppoly_tdo_panel_drv_exit);
++MODULE_LICENSE("GPL");
+-- 
+1.6.4.4
+
diff --git a/recipes/linux/linux-omap-2.6.32/cm-t35/0001-backlight-tdo24m-ensure-chip-select-changes-between-.patch b/recipes/linux/linux-omap-2.6.32/cm-t35/0001-backlight-tdo24m-ensure-chip-select-changes-between-.patch
new file mode 100644
index 0000000..b540987
--- /dev/null
+++ b/recipes/linux/linux-omap-2.6.32/cm-t35/0001-backlight-tdo24m-ensure-chip-select-changes-between-.patch
@@ -0,0 +1,30 @@
+From 8a2cbbaa60ea06370d2a6d9303b1aab54cdb8a69 Mon Sep 17 00:00:00 2001
+From: Mike Rapoport <mike@compulab.co.il>
+Date: Tue, 24 Nov 2009 10:09:35 +0200
+Subject: [PATCH] backlight: tdo24m: ensure chip select changes between transfers
+
+Some SPI host drivers do not change chip select betwen transfers unless
+.cs_chnage field is explicitly set. The LCD spec requires chip select
+change between consecuitive transfers, so ensure it at the SPI driver
+level.
+
+Signed-off-by: Mike Rapoport <mike@compulab.co.il>
+---
+ drivers/video/backlight/tdo24m.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/video/backlight/tdo24m.c b/drivers/video/backlight/tdo24m.c
+index bbfb502..4a3d46e 100644
+--- a/drivers/video/backlight/tdo24m.c
++++ b/drivers/video/backlight/tdo24m.c
+@@ -367,6 +367,7 @@ static int __devinit tdo24m_probe(struct spi_device *spi)
+ 
+ 	spi_message_init(m);
+ 
++	x->cs_change = 1;
+ 	x->tx_buf = &lcd->buf[0];
+ 	spi_message_add_tail(x, m);
+ 
+-- 
+1.6.4.4
+
diff --git a/recipes/linux/linux-omap-2.6.32/cm-t35/0002-omap3-cm-t35-add-DSS2-display-support.patch b/recipes/linux/linux-omap-2.6.32/cm-t35/0002-omap3-cm-t35-add-DSS2-display-support.patch
new file mode 100644
index 0000000..199e89b
--- /dev/null
+++ b/recipes/linux/linux-omap-2.6.32/cm-t35/0002-omap3-cm-t35-add-DSS2-display-support.patch
@@ -0,0 +1,307 @@
+From 7d601fa33c5475bcd3035df797a3cbe40cc542d4 Mon Sep 17 00:00:00 2001
+From: Mike Rapoport <mike@compulab.co.il>
+Date: Tue, 1 Dec 2009 13:09:28 +0200
+Subject: [PATCH 2/6] omap3: cm-t35: add DSS2 display support
+
+Signed-off-by: Mike Rapoport <mike@compulab.co.il>
+---
+ arch/arm/mach-omap2/board-cm-t35.c |  234 +++++++++++++++++++++++++++++++++++-
+ 1 files changed, 233 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-cm-t35.c b/arch/arm/mach-omap2/board-cm-t35.c
+index 22c4529..2d7a819 100644
+--- a/arch/arm/mach-omap2/board-cm-t35.c
++++ b/arch/arm/mach-omap2/board-cm-t35.c
+@@ -32,6 +32,9 @@
+ #include <linux/i2c/twl4030.h>
+ #include <linux/regulator/machine.h>
+ 
++#include <linux/spi/spi.h>
++#include <linux/spi/tdo24m.h>
++
+ #include <asm/mach-types.h>
+ #include <asm/mach/arch.h>
+ #include <asm/mach/map.h>
+@@ -42,6 +45,7 @@
+ #include <plat/nand.h>
+ #include <plat/gpmc.h>
+ #include <plat/usb.h>
++#include <plat/display.h>
+ 
+ #include <mach/hardware.h>
+ 
+@@ -248,7 +252,6 @@ static inline void cm_t35_init_nand(void) {}
+ 
+ #if defined(CONFIG_TOUCHSCREEN_ADS7846) || \
+ 	defined(CONFIG_TOUCHSCREEN_ADS7846_MODULE)
+-#include <linux/spi/spi.h>
+ #include <linux/spi/ads7846.h>
+ 
+ #include <plat/mcspi.h>
+@@ -304,6 +307,193 @@ static void __init cm_t35_init_ads7846(void)
+ static inline void cm_t35_init_ads7846(void) {}
+ #endif
+ 
++#define CM_T35_LCD_EN_GPIO 157
++#define CM_T35_LCD_BL_GPIO 58
++#define CM_T35_DVI_EN_GPIO 54
++
++static int lcd_bl_gpio;
++static int lcd_en_gpio;
++static int dvi_en_gpio;
++
++static int lcd_enabled;
++static int dvi_enabled;
++
++static int cm_t35_panel_enable_lcd(struct omap_dss_device *dssdev)
++{
++	if (dvi_enabled) {
++		printk(KERN_ERR "cannot enable LCD, DVI is enabled\n");
++		return -EINVAL;
++	}
++
++	gpio_set_value(lcd_en_gpio, 1);
++	gpio_set_value(lcd_bl_gpio, 1);
++
++	lcd_enabled = 1;
++
++	return 0;
++}
++
++static void cm_t35_panel_disable_lcd(struct omap_dss_device *dssdev)
++{
++	lcd_enabled = 0;
++
++	gpio_set_value(lcd_bl_gpio, 0);
++	gpio_set_value(lcd_en_gpio, 0);
++}
++
++static int cm_t35_panel_enable_dvi(struct omap_dss_device *dssdev)
++{
++	if (lcd_enabled) {
++		printk(KERN_ERR "cannot enable DVI, LCD is enabled\n");
++		return -EINVAL;
++	}
++
++	gpio_set_value(dvi_en_gpio, 0);
++	dvi_enabled = 1;
++
++	return 0;
++}
++
++static void cm_t35_panel_disable_dvi(struct omap_dss_device *dssdev)
++{
++	gpio_set_value(dvi_en_gpio, 1);
++	dvi_enabled = 0;
++}
++
++static int cm_t35_panel_enable_tv(struct omap_dss_device *dssdev)
++{
++	return 0;
++}
++
++static void cm_t35_panel_disable_tv(struct omap_dss_device *dssdev)
++{
++}
++
++static struct omap_dss_device cm_t35_lcd_device = {
++	.name			= "lcd",
++	.driver_name		= "toppoly_tdo35s_panel",
++	.type			= OMAP_DISPLAY_TYPE_DPI,
++	.phy.dpi.data_lines	= 18,
++	.platform_enable	= cm_t35_panel_enable_lcd,
++	.platform_disable	= cm_t35_panel_disable_lcd,
++};
++
++static struct omap_dss_device cm_t35_dvi_device = {
++	.name			= "dvi",
++	.driver_name		= "generic_panel",
++	.type			= OMAP_DISPLAY_TYPE_DPI,
++	.phy.dpi.data_lines	= 24,
++	.platform_enable	= cm_t35_panel_enable_dvi,
++	.platform_disable	= cm_t35_panel_disable_dvi,
++};
++
++static struct omap_dss_device cm_t35_tv_device = {
++	.name			= "tv",
++	.driver_name		= "venc",
++	.type			= OMAP_DISPLAY_TYPE_VENC,
++	.phy.venc.type		= OMAP_DSS_VENC_TYPE_SVIDEO,
++	.platform_enable	= cm_t35_panel_enable_tv,
++	.platform_disable	= cm_t35_panel_disable_tv,
++};
++
++static struct omap_dss_device *cm_t35_dss_devices[] = {
++	&cm_t35_lcd_device,
++	&cm_t35_dvi_device,
++	&cm_t35_tv_device,
++};
++
++static struct omap_dss_board_info cm_t35_dss_data = {
++	.num_devices	= ARRAY_SIZE(cm_t35_dss_devices),
++	.devices	= cm_t35_dss_devices,
++	.default_device	= &cm_t35_dvi_device,
++};
++
++static struct platform_device cm_t35_dss_device = {
++	.name		= "omapdss",
++	.id		= -1,
++	.dev		= {
++		.platform_data = &cm_t35_dss_data,
++	},
++};
++
++static struct omap2_mcspi_device_config tdo24m_mcspi_config = {
++	.turbo_mode	= 0,
++	.single_channel	= 1,	/* 0: slave, 1: master */
++};
++
++static struct tdo24m_platform_data tdo24m_config = {
++	.model = TDO35S,
++};
++
++static struct spi_board_info cm_t35_lcd_spi_board_info[] __initdata = {
++	{
++		.modalias		= "tdo24m",
++		.bus_num		= 4,
++		.chip_select		= 0,
++		.max_speed_hz		= 1000000,
++		.controller_data	= &tdo24m_mcspi_config,
++		.platform_data		= &tdo24m_config,
++	},
++};
++
++static void __init cm_t35_display_init(void)
++{
++	int err;
++
++	lcd_en_gpio = CM_T35_LCD_EN_GPIO;
++	lcd_bl_gpio = CM_T35_LCD_BL_GPIO;
++	dvi_en_gpio = CM_T35_DVI_EN_GPIO;
++
++	spi_register_board_info(cm_t35_lcd_spi_board_info,
++				ARRAY_SIZE(cm_t35_lcd_spi_board_info));
++
++	err = gpio_request(lcd_en_gpio, "LCD RST");
++	if (err) {
++		pr_err("CM-T35: failed to get LCD reset GPIO\n");
++		goto out;
++	}
++
++	err = gpio_request(lcd_bl_gpio, "LCD BL");
++	if (err) {
++		pr_err("CM-T35: failed to get LCD backlight control GPIO\n");
++		goto err_lcd_bl;
++	}
++
++	err = gpio_request(dvi_en_gpio, "DVI EN");
++	if (err) {
++		pr_err("CM-T35: failed to get DVI reset GPIO\n");
++		goto err_dvi_en;
++	}
++
++	gpio_export(lcd_en_gpio, 0);
++	gpio_export(lcd_bl_gpio, 0);
++	gpio_export(dvi_en_gpio, 0);
++	gpio_direction_output(lcd_en_gpio, 0);
++	gpio_direction_output(lcd_bl_gpio, 0);
++	gpio_direction_output(dvi_en_gpio, 1);
++
++	msleep(50);
++	gpio_set_value(lcd_en_gpio, 1);
++
++	err = platform_device_register(&cm_t35_dss_device);
++	if (err) {
++		pr_err("CM-T35: failed to register DSS device\n");
++		goto err_dev_reg;
++	}
++
++	return;
++
++err_dev_reg:
++	gpio_free(dvi_en_gpio);
++err_dvi_en:
++	gpio_free(lcd_bl_gpio);
++err_lcd_bl:
++	gpio_free(lcd_en_gpio);
++out:
++
++	return;
++}
++
+ static struct regulator_consumer_supply cm_t35_vmmc1_supply = {
+ 	.supply			= "vmmc",
+ };
+@@ -312,6 +502,16 @@ static struct regulator_consumer_supply cm_t35_vsim_supply = {
+ 	.supply			= "vmmc_aux",
+ };
+ 
++static struct regulator_consumer_supply cm_t35_vdac_supply = {
++	.supply		= "vdda_dac",
++	.dev		= &cm_t35_dss_device.dev,
++};
++
++static struct regulator_consumer_supply cm_t35_vdvi_supply = {
++	.supply		= "vdvi",
++	.dev		= &cm_t35_dss_device.dev,
++};
++
+ /* VMMC1 for MMC1 pins CMD, CLK, DAT0..DAT3 (20 mA, plus card == max 220 mA) */
+ static struct regulator_init_data cm_t35_vmmc1 = {
+ 	.constraints = {
+@@ -342,6 +542,35 @@ static struct regulator_init_data cm_t35_vsim = {
+ 	.consumer_supplies	= &cm_t35_vsim_supply,
+ };
+ 
++/* VDAC for DSS driving S-Video (8 mA unloaded, max 65 mA) */
++static struct regulator_init_data cm_t35_vdac = {
++	.constraints = {
++		.min_uV			= 1800000,
++		.max_uV			= 1800000,
++		.valid_modes_mask	= REGULATOR_MODE_NORMAL
++					| REGULATOR_MODE_STANDBY,
++		.valid_ops_mask		= REGULATOR_CHANGE_MODE
++					| REGULATOR_CHANGE_STATUS,
++	},
++	.num_consumer_supplies	= 1,
++	.consumer_supplies	= &cm_t35_vdac_supply,
++};
++
++/* VPLL2 for digital video outputs */
++static struct regulator_init_data cm_t35_vpll2 = {
++	.constraints = {
++		.name			= "VDVI",
++		.min_uV			= 1800000,
++		.max_uV			= 1800000,
++		.valid_modes_mask	= REGULATOR_MODE_NORMAL
++					| REGULATOR_MODE_STANDBY,
++		.valid_ops_mask		= REGULATOR_CHANGE_MODE
++					| REGULATOR_CHANGE_STATUS,
++	},
++	.num_consumer_supplies	= 1,
++	.consumer_supplies	= &cm_t35_vdvi_supply,
++};
++
+ static struct twl4030_usb_data cm_t35_usb_data = {
+ 	.usb_mode	= T2_USB_MODE_ULPI,
+ };
+@@ -445,6 +674,8 @@ static struct twl4030_platform_data cm_t35_twldata = {
+ 	.gpio		= &cm_t35_gpio_data,
+ 	.vmmc1		= &cm_t35_vmmc1,
+ 	.vsim		= &cm_t35_vsim,
++	.vdac		= &cm_t35_vdac,
++	.vpll2		= &cm_t35_vpll2,
+ };
+ 
+ static struct i2c_board_info __initdata cm_t35_i2c_boardinfo[] = {
+@@ -490,6 +721,7 @@ static void __init cm_t35_init(void)
+ 	cm_t35_init_ads7846();
+ 	cm_t35_init_ethernet();
+ 	cm_t35_init_led();
++	cm_t35_display_init();
+ 
+ 	usb_musb_init();
+ 
+-- 
+1.6.4.4
+
diff --git a/recipes/linux/linux-omap-2.6.32/cm-t35/0003-omap3-cm-t35-update-defconfig-for-DSS2.patch b/recipes/linux/linux-omap-2.6.32/cm-t35/0003-omap3-cm-t35-update-defconfig-for-DSS2.patch
new file mode 100644
index 0000000..dc1e527
--- /dev/null
+++ b/recipes/linux/linux-omap-2.6.32/cm-t35/0003-omap3-cm-t35-update-defconfig-for-DSS2.patch
@@ -0,0 +1,145 @@
+From 10cd78db62cbda2f9db1c53d459ee03a35b84662 Mon Sep 17 00:00:00 2001
+From: Mike Rapoport <mike@compulab.co.il>
+Date: Tue, 1 Dec 2009 13:16:02 +0200
+Subject: [PATCH 3/6] omap3: cm-t35: update defconfig for DSS2
+
+Signed-off-by: Mike Rapoport <mike@compulab.co.il>
+---
+ arch/arm/configs/cm_t35_defconfig |   82 +++++++++++++++++++++++++++++++++++--
+ 1 files changed, 78 insertions(+), 4 deletions(-)
+
+diff --git a/arch/arm/configs/cm_t35_defconfig b/arch/arm/configs/cm_t35_defconfig
+index e42c5c8..bd6f882 100644
+--- a/arch/arm/configs/cm_t35_defconfig
++++ b/arch/arm/configs/cm_t35_defconfig
+@@ -1,7 +1,7 @@
+ #
+ # Automatically generated make config: don't edit
+-# Linux kernel version: 2.6.32-rc4
+-# Tue Oct 13 17:10:40 2009
++# Linux kernel version: 2.6.32-rc8
++# Tue Dec  1 12:08:44 2009
+ #
+ CONFIG_ARM=y
+ CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+@@ -215,6 +215,7 @@ CONFIG_OMAP_DM_TIMER=y
+ # CONFIG_OMAP_LL_DEBUG_UART1 is not set
+ # CONFIG_OMAP_LL_DEBUG_UART2 is not set
+ CONFIG_OMAP_LL_DEBUG_UART3=y
++# CONFIG_OMAP_LL_DEBUG_NONE is not set
+ # CONFIG_OMAP_PM_NONE is not set
+ CONFIG_OMAP_PM_NOOP=y
+ CONFIG_ARCH_OMAP34XX=y
+@@ -227,11 +228,15 @@ CONFIG_ARCH_OMAP3430=y
+ # CONFIG_MACH_OMAP_LDP is not set
+ # CONFIG_MACH_OVERO is not set
+ # CONFIG_MACH_OMAP3EVM is not set
++# CONFIG_MACH_OMAP3517EVM is not set
+ # CONFIG_MACH_OMAP3_PANDORA is not set
+ # CONFIG_MACH_OMAP_3430SDP is not set
+ # CONFIG_MACH_NOKIA_RX51 is not set
+ # CONFIG_MACH_OMAP_ZOOM2 is not set
++# CONFIG_MACH_OMAP_ZOOM3 is not set
+ CONFIG_MACH_CM_T35=y
++# CONFIG_MACH_IGEP0020 is not set
++# CONFIG_MACH_OMAP_3630SDP is not set
+ 
+ #
+ # Processor Type
+@@ -963,6 +968,7 @@ CONFIG_SSB_POSSIBLE=y
+ # CONFIG_TPS65010 is not set
+ CONFIG_TWL4030_CORE=y
+ # CONFIG_TWL4030_POWER is not set
++# CONFIG_TWL4030_CODEC is not set
+ # CONFIG_MFD_TMIO is not set
+ # CONFIG_MFD_T7L66XB is not set
+ # CONFIG_MFD_TC6387XB is not set
+@@ -993,8 +999,66 @@ CONFIG_REGULATOR_TWL4030=y
+ #
+ # CONFIG_VGASTATE is not set
+ # CONFIG_VIDEO_OUTPUT_CONTROL is not set
+-# CONFIG_FB is not set
+-# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
++CONFIG_FB=y
++# CONFIG_FIRMWARE_EDID is not set
++# CONFIG_FB_DDC is not set
++# CONFIG_FB_BOOT_VESA_SUPPORT is not set
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
++# CONFIG_FB_VIRTUAL is not set
++# CONFIG_FB_METRONOME is not set
++# CONFIG_FB_MB862XX is not set
++# CONFIG_FB_BROADSHEET is not set
++# CONFIG_FB_OMAP_BOOTLOADER_INIT is not set
++CONFIG_OMAP2_VRAM=y
++CONFIG_OMAP2_VRFB=y
++CONFIG_OMAP2_DSS=y
++CONFIG_OMAP2_VRAM_SIZE=4
++CONFIG_OMAP2_DSS_DEBUG_SUPPORT=y
++# CONFIG_OMAP2_DSS_RFBI is not set
++CONFIG_OMAP2_DSS_VENC=y
++# CONFIG_OMAP2_DSS_SDI is not set
++# CONFIG_OMAP2_DSS_DSI is not set
++# CONFIG_OMAP2_DSS_FAKE_VSYNC is not set
++CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=0
++CONFIG_FB_OMAP2=y
++CONFIG_FB_OMAP2_DEBUG_SUPPORT=y
++# CONFIG_FB_OMAP2_FORCE_AUTO_UPDATE is not set
++CONFIG_FB_OMAP2_NUM_FBS=3
++
++#
++# OMAP2/3 Display Device Drivers
++#
++CONFIG_PANEL_GENERIC=y
++# CONFIG_PANEL_SAMSUNG_LTE430WQ_F0C is not set
++# CONFIG_PANEL_SHARP_LS037V7DW01 is not set
++CONFIG_PANEL_TOPPOLY_TDO35S=y
++CONFIG_BACKLIGHT_LCD_SUPPORT=y
++CONFIG_LCD_CLASS_DEVICE=y
++# CONFIG_LCD_LMS283GF05 is not set
++# CONFIG_LCD_LTV350QV is not set
++# CONFIG_LCD_ILI9320 is not set
++CONFIG_LCD_TDO24M=y
++# CONFIG_LCD_VGG2432A4 is not set
++# CONFIG_LCD_PLATFORM is not set
++# CONFIG_BACKLIGHT_CLASS_DEVICE is not set
+ 
+ #
+ # Display device support
+@@ -1006,6 +1070,16 @@ CONFIG_REGULATOR_TWL4030=y
+ #
+ # CONFIG_VGA_CONSOLE is not set
+ CONFIG_DUMMY_CONSOLE=y
++CONFIG_FRAMEBUFFER_CONSOLE=y
++# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
++# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
++# CONFIG_FONTS is not set
++CONFIG_FONT_8x8=y
++CONFIG_FONT_8x16=y
++CONFIG_LOGO=y
++CONFIG_LOGO_LINUX_MONO=y
++CONFIG_LOGO_LINUX_VGA16=y
++CONFIG_LOGO_LINUX_CLUT224=y
+ # CONFIG_SOUND is not set
+ CONFIG_HID_SUPPORT=y
+ CONFIG_HID=y
+-- 
+1.6.4.4
+
diff --git a/recipes/linux/linux-omap-2.6.32/cm-t35/0004-omap3-cm-t35-add-cm-t35-mux-configs.patch b/recipes/linux/linux-omap-2.6.32/cm-t35/0004-omap3-cm-t35-add-cm-t35-mux-configs.patch
new file mode 100644
index 0000000..ff8b50b
--- /dev/null
+++ b/recipes/linux/linux-omap-2.6.32/cm-t35/0004-omap3-cm-t35-add-cm-t35-mux-configs.patch
@@ -0,0 +1,427 @@
+From a1a572a6b020996155fa3fd7e70a96299b37cf30 Mon Sep 17 00:00:00 2001
+From: Mike Rapoport <mike@compulab.co.il>
+Date: Mon, 7 Dec 2009 10:27:48 +0200
+Subject: [PATCH 4/6] omap3: cm-t35: add cm-t35 mux configs
+
+Signed-off-by: Mike Rapoport <mike@compulab.co.il>
+---
+ arch/arm/mach-omap2/board-cm-t35.c    |   94 +++++++++++++++++++
+ arch/arm/mach-omap2/mux.c             |  158 ++++++++++++++++++++++++++++++++-
+ arch/arm/plat-omap/include/plat/mux.h |   86 ++++++++++++++++++
+ 3 files changed, 337 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-cm-t35.c b/arch/arm/mach-omap2/board-cm-t35.c
+index 2d7a819..3e54499 100644
+--- a/arch/arm/mach-omap2/board-cm-t35.c
++++ b/arch/arm/mach-omap2/board-cm-t35.c
+@@ -693,6 +693,99 @@ static void __init cm_t35_init_i2c(void)
+ 			      ARRAY_SIZE(cm_t35_i2c_boardinfo));
+ }
+ 
++static void __init cm_t35_init_mux(void)
++{
++	/* nCS and IRQ mux for CM-T35 ethernet */
++	omap_cfg_reg(G5_34XX_GPMC_NCS5);
++	omap_cfg_reg(A23_34XX_GPIO163_UP);
++
++	/* nCS, IRQ and reset mux for SB-T35 ethernet */
++	omap_cfg_reg(F4_34XX_GPMC_NCS4);
++	omap_cfg_reg(N21_34XX_GPIO127_UP);
++	omap_cfg_reg(B23_34XX_GPIO164_OUT);
++
++	/* PENDOWN GPIO */
++	omap_cfg_reg(F3_34XX_GPIO57_UP);
++
++	/* mUSB */
++	omap_cfg_reg(R21_3430_USB0HS_PHY_CLK);
++	omap_cfg_reg(R23_3430_USB0HS_PHY_STP);
++	omap_cfg_reg(P23_3430_USB0HS_PHY_DIR);
++	omap_cfg_reg(R22_3430_USB0HS_PHY_NXT);
++	omap_cfg_reg(T24_3430_USB0HS_PHY_DATA0);
++	omap_cfg_reg(T23_3430_USB0HS_PHY_DATA1);
++	omap_cfg_reg(U24_3430_USB0HS_PHY_DATA2);
++	omap_cfg_reg(U23_3430_USB0HS_PHY_DATA3);
++	omap_cfg_reg(W24_3430_USB0HS_PHY_DATA4);
++	omap_cfg_reg(V23_3430_USB0HS_PHY_DATA5);
++	omap_cfg_reg(W23_3430_USB0HS_PHY_DATA6);
++	omap_cfg_reg(T22_3430_USB0HS_PHY_DATA7);
++
++	/* MMC 2 */
++	omap_cfg_reg(AB2_3430_MMC2_DIR_DAT0);
++	omap_cfg_reg(AA2_3430_MMC2_DIR_DAT1);
++	omap_cfg_reg(Y2_3430_MMC2_DIR_CMD);
++	omap_cfg_reg(AA1_3420_MMC2_CLKIN);
++
++	/* McSPI 1 */
++	omap_cfg_reg(T5_34XX_MCSPI1_CLK);
++	omap_cfg_reg(R4_34XX_MCSPI1_SIMO);
++	omap_cfg_reg(T4_34XX_MCSPI1_SOMI);
++	omap_cfg_reg(T6_34XX_MCSPI1_CS0);
++
++	/* McBSP 2 */
++	omap_cfg_reg(V20_34XX_MCBSP2_FSX);
++	omap_cfg_reg(T21_34XX_MCBSP2_CLKX);
++	omap_cfg_reg(V19_34XX_MCBSP2_DR);
++	omap_cfg_reg(R20_34XX_MCBSP2_DX);
++
++	omap_cfg_reg(F21_34XX_GPIO109_OUT);
++
++	/* serial ports */
++	omap_cfg_reg(W4_34XX_UART2_TX);
++	omap_cfg_reg(V4_34XX_UART2_RX);
++	omap_cfg_reg(W7_34XX_UART1_TX);
++	omap_cfg_reg(V7_34XX_UART1_RX);
++
++	/* display controls */
++	omap_cfg_reg(U8_34XX_GPIO54_OUT);
++	omap_cfg_reg(G4_34XX_GPIO58_OUT);
++/* 	omap_cfg_reg(??_34XX_GPIO129_OUT); */
++
++	/* DSS */
++	omap_cfg_reg(G22_34XX_DSS_PCLK);
++	omap_cfg_reg(E22_34XX_DSS_HSYNC);
++	omap_cfg_reg(F22_34XX_DSS_VSYNC);
++	omap_cfg_reg(J21_34XX_DSS_ACBIAS);
++	omap_cfg_reg(AC19_34XX_DSS_DATA0);
++	omap_cfg_reg(AB19_34XX_DSS_DATA1);
++	omap_cfg_reg(AD20_34XX_DSS_DATA2);
++	omap_cfg_reg(AC20_34XX_DSS_DATA3);
++	omap_cfg_reg(AD21_34XX_DSS_DATA4);
++	omap_cfg_reg(AC21_34XX_DSS_DATA5);
++	omap_cfg_reg(D24_34XX_DSS_DATA6);
++	omap_cfg_reg(E23_34XX_DSS_DATA7);
++	omap_cfg_reg(E24_34XX_DSS_DATA8);
++	omap_cfg_reg(F23_34XX_DSS_DATA9);
++	omap_cfg_reg(AC22_34XX_DSS_DATA10);
++	omap_cfg_reg(AC23_34XX_DSS_DATA11);
++	omap_cfg_reg(AB22_34XX_DSS_DATA12);
++	omap_cfg_reg(Y22_34XX_DSS_DATA13);
++	omap_cfg_reg(W22_34XX_DSS_DATA14);
++	omap_cfg_reg(V22_34XX_DSS_DATA15);
++	omap_cfg_reg(J22_34XX_DSS_DATA16);
++	omap_cfg_reg(G23_34XX_DSS_DATA17);
++	omap_cfg_reg(G24_34XX_DSS_DATA18);
++	omap_cfg_reg(H23_34XX_DSS_DATA19);
++	omap_cfg_reg(D23_34XX_DSS_DATA20);
++	omap_cfg_reg(K22_34XX_DSS_DATA21);
++	omap_cfg_reg(V21_34XX_DSS_DATA22);
++	omap_cfg_reg(W21_34XX_DSS_DATA23);
++
++	/* TPS IRQ */
++	omap_cfg_reg(AF26_34XX_SYS_NIRQ);
++}
++
+ static struct omap_board_config_kernel cm_t35_config[] __initdata = {
+ };
+ 
+@@ -716,6 +809,7 @@ static void __init cm_t35_map_io(void)
+ static void __init cm_t35_init(void)
+ {
+ 	omap_serial_init();
++	cm_t35_init_mux();
+ 	cm_t35_init_i2c();
+ 	cm_t35_init_nand();
+ 	cm_t35_init_ads7846();
+diff --git a/arch/arm/mach-omap2/mux.c b/arch/arm/mach-omap2/mux.c
+index c18a94e..23eb011 100644
+--- a/arch/arm/mach-omap2/mux.c
++++ b/arch/arm/mach-omap2/mux.c
+@@ -279,6 +279,33 @@ MUX_CFG_34XX("AD26_34XX_I2C4_SCL", 0xa00,
+ MUX_CFG_34XX("AE26_34XX_I2C4_SDA", 0xa02,
+ 		OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_INPUT_PULLUP)
+ 
++/* HSUSB Port 0 */
++MUX_CFG_34XX("R21_3430_USB0HS_PHY_CLK", 0x1a2,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_INPUT)
++MUX_CFG_34XX("R23_3430_USB0HS_PHY_STP", 0x1a4,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT | \
++	     OMAP2_PULL_ENA | OMAP2_PULL_UP)
++MUX_CFG_34XX("P23_3430_USB0HS_PHY_DIR", 0x1a6,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_INPUT)
++MUX_CFG_34XX("R22_3430_USB0HS_PHY_NXT", 0x1a8,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_INPUT)
++MUX_CFG_34XX("T24_3430_USB0HS_PHY_DATA0", 0x1aa,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_INPUT)
++MUX_CFG_34XX("T23_3430_USB0HS_PHY_DATA1", 0x1ac,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_INPUT)
++MUX_CFG_34XX("U24_3430_USB0HS_PHY_DATA2", 0x1ae,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_INPUT)
++MUX_CFG_34XX("U23_3430_USB0HS_PHY_DATA3", 0x1b0,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_INPUT)
++MUX_CFG_34XX("W24_3430_USB0HS_PHY_DATA4", 0x1b2,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_INPUT)
++MUX_CFG_34XX("V23_3430_USB0HS_PHY_DATA5", 0x1b4,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_INPUT)
++MUX_CFG_34XX("W23_3430_USB0HS_PHY_DATA6", 0x1b6,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_INPUT)
++MUX_CFG_34XX("T22_3430_USB0HS_PHY_DATA7", 0x1b8,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_INPUT)
++
+ /* PHY - HSUSB: 12-pin ULPI PHY: Port 1*/
+ MUX_CFG_34XX("Y8_3430_USB1HS_PHY_CLK", 0x5da,
+ 		OMAP34XX_MUX_MODE3 | OMAP34XX_PIN_OUTPUT)
+@@ -541,6 +568,15 @@ MUX_CFG_34XX("AF3_3430_MMC2_DAT6", 0x168,
+ MUX_CFG_34XX("AE3_3430_MMC2_DAT7", 0x16A,
+ 		OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_INPUT_PULLUP)
+ 
++MUX_CFG_34XX("AB2_3430_MMC2_DIR_DAT0", 0x164,
++	     OMAP34XX_MUX_MODE1 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("AA2_3430_MMC2_DIR_DAT1", 0x166,
++	     OMAP34XX_MUX_MODE1 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("Y2_3430_MMC2_DIR_CMD", 0x168,
++	     OMAP34XX_MUX_MODE1 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("AA1_3420_MMC2_CLKIN", 0x16a,
++	     OMAP34XX_MUX_MODE1 | OMAP34XX_PIN_INPUT)
++
+ /* MMC3 */
+ MUX_CFG_34XX("AF10_3430_MMC3_CLK", 0x5d8,
+ 		OMAP34XX_MUX_MODE2 | OMAP34XX_PIN_INPUT_PULLUP)
+@@ -559,13 +595,133 @@ MUX_CFG_34XX("AF13_3430_MMC3_DAT3", 0x5e2,
+ MUX_CFG_34XX("AF26_34XX_SYS_NIRQ", 0x1E0,
+ 		OMAP3_WAKEUP_EN | OMAP34XX_PIN_INPUT_PULLUP |
+ 		OMAP34XX_MUX_MODE0)
+-/* EHCI GPIO's on OMAP3EVM (Rev >= E) */
++
+ MUX_CFG_34XX("AH14_34XX_GPIO21", 0x5ea,
+ 	OMAP34XX_MUX_MODE4 | OMAP34XX_PIN_INPUT_PULLUP)
+ MUX_CFG_34XX("AF9_34XX_GPIO22", 0x5ec,
+ 	OMAP34XX_MUX_MODE4 | OMAP34XX_PIN_INPUT_PULLUP)
+ MUX_CFG_34XX("U3_34XX_GPIO61", 0x0c8,
+ 	OMAP34XX_MUX_MODE4 | OMAP34XX_PIN_INPUT_PULLUP)
++
++MUX_CFG_34XX("AG4_34XX_GPIO134", 0x160,
++		OMAP34XX_MUX_MODE4 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("U8_34XX_GPIO54", 0x0b4,
++		OMAP34XX_MUX_MODE4 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("AE4_34XX_GPIO136", 0x164,
++		OMAP34XX_MUX_MODE4 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("F3_34XX_GPIO57_UP", 0x0ba,
++		OMAP34XX_MUX_MODE4 | OMAP34XX_PIN_INPUT_PULLUP)
++MUX_CFG_34XX("G4_34XX_GPIO58_OUT", 0x0bc,
++		OMAP34XX_MUX_MODE4 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("W2_34XX_GPIO59", 0x0be,
++		OMAP34XX_MUX_MODE4 | OMAP34XX_PIN_INPUT)
++MUX_CFG_34XX("L1_34XX_GPIO61_OUT", 0x0c8,
++		OMAP34XX_MUX_MODE4 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("C2_34XX_GPIO65", 0x0d2,
++		OMAP34XX_MUX_MODE4 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("N21_34XX_GPIO127_UP", 0x152,
++		OMAP34XX_MUX_MODE4 | OMAP34XX_PIN_INPUT_PULLUP)
++MUX_CFG_34XX("A23_34XX_GPIO163_UP", 0x19a,
++		OMAP34XX_MUX_MODE4 | OMAP34XX_PIN_INPUT_PULLUP)
++MUX_CFG_34XX("B23_34XX_GPIO164_OUT", 0x19c,
++		OMAP34XX_MUX_MODE4 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("AA6_34XX_GPIO164_OUT", 0x1e2,
++		OMAP34XX_MUX_MODE4 | OMAP34XX_PIN_OUTPUT)
++
++/* GPMC */
++MUX_CFG_34XX("F4_34XX_GPMC_NCS4", 0x0b6, OMAP34XX_MUX_MODE0)
++MUX_CFG_34XX("G5_34XX_GPMC_NCS5", 0x0b8, OMAP34XX_MUX_MODE0)
++
++/* McSPI 1 */
++MUX_CFG_34XX("T5_34XX_MCSPI1_CLK", 0x1c8,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_INPUT)
++MUX_CFG_34XX("R4_34XX_MCSPI1_SIMO", 0x1ca,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_INPUT)
++MUX_CFG_34XX("T4_34XX_MCSPI1_SOMI", 0x1cc,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_INPUT)
++MUX_CFG_34XX("T6_34XX_MCSPI1_CS0", 0x1ce,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_INPUT_PULLDOWN)
++
++/* McBSP 2 */
++MUX_CFG_34XX("V20_34XX_MCBSP2_FSX", 0x13c,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_INPUT)
++MUX_CFG_34XX("T21_34XX_MCBSP2_CLKX", 0x13e,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_INPUT)
++MUX_CFG_34XX("V19_34XX_MCBSP2_DR", 0x140,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_INPUT)
++MUX_CFG_34XX("R20_34XX_MCBSP2_DX", 0x142,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++
++MUX_CFG_34XX("F21_34XX_GPIO109_OUT", 0x12a,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++
++/* Serial ports */
++MUX_CFG_34XX("W4_34XX_UART2_TX", 0x170,
++	     OMAP34XX_MUX_MODE1 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("V4_34XX_UART2_RX", 0x172,
++	     OMAP34XX_MUX_MODE1 | OMAP34XX_PIN_INPUT)
++MUX_CFG_34XX("W7_34XX_UART1_TX", 0x17c,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("V7_34XX_UART1_RX", 0x182,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_INPUT)
++
++/* DSS */
++MUX_CFG_34XX("G22_34XX_DSS_PCLK", 0x0d4,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("E22_34XX_DSS_HSYNC", 0x0d6,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("F22_34XX_DSS_VSYNC", 0x0d8,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("J21_34XX_DSS_ACBIAS", 0x0da,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("AC19_34XX_DSS_DATA0", 0x0dc,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("AB19_34XX_DSS_DATA1", 0x0de,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("AD20_34XX_DSS_DATA2", 0x0e0,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("AC20_34XX_DSS_DATA3", 0x0e2,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("AD21_34XX_DSS_DATA4", 0x0e4,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("AC21_34XX_DSS_DATA5", 0x0e6,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("D24_34XX_DSS_DATA6", 0x0e8,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("E23_34XX_DSS_DATA7", 0x0ea,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("E24_34XX_DSS_DATA8", 0x0ec,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("F23_34XX_DSS_DATA9", 0x0ee,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("AC22_34XX_DSS_DATA10", 0x0f0,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("AC23_34XX_DSS_DATA11", 0x0f2,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("AB22_34XX_DSS_DATA12", 0x0f4,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("Y22_34XX_DSS_DATA13", 0x0f6,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("W22_34XX_DSS_DATA14", 0x0f8,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("V22_34XX_DSS_DATA15", 0x0fa,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("J22_34XX_DSS_DATA16", 0x0fc,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("G23_34XX_DSS_DATA17", 0x0fe,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("G24_34XX_DSS_DATA18", 0x100,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("H23_34XX_DSS_DATA19", 0x102,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("D23_34XX_DSS_DATA20", 0x104,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("K22_34XX_DSS_DATA21", 0x106,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("V21_34XX_DSS_DATA22", 0x108,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
++MUX_CFG_34XX("W21_34XX_DSS_DATA23", 0x10a,
++	     OMAP34XX_MUX_MODE0 | OMAP34XX_PIN_OUTPUT)
+ };
+ 
+ #define OMAP34XX_PINS_SZ	ARRAY_SIZE(omap34xx_pins)
+diff --git a/arch/arm/plat-omap/include/plat/mux.h b/arch/arm/plat-omap/include/plat/mux.h
+index ba77de6..119379c 100644
+--- a/arch/arm/plat-omap/include/plat/mux.h
++++ b/arch/arm/plat-omap/include/plat/mux.h
+@@ -692,6 +692,20 @@ enum omap34xx_index {
+ 	AD26_34XX_I2C4_SCL,
+ 	AE26_34XX_I2C4_SDA,
+ 
++	/* HSUSB Port 0 */
++	R21_3430_USB0HS_PHY_CLK,
++	R23_3430_USB0HS_PHY_STP,
++	P23_3430_USB0HS_PHY_DIR,
++	R22_3430_USB0HS_PHY_NXT,
++	T24_3430_USB0HS_PHY_DATA0,
++	T23_3430_USB0HS_PHY_DATA1,
++	U24_3430_USB0HS_PHY_DATA2,
++	U23_3430_USB0HS_PHY_DATA3,
++	W24_3430_USB0HS_PHY_DATA4,
++	V23_3430_USB0HS_PHY_DATA5,
++	W23_3430_USB0HS_PHY_DATA6,
++	T22_3430_USB0HS_PHY_DATA7,
++
+ 	/* PHY - HSUSB: 12-pin ULPI PHY: Port 1*/
+ 	Y8_3430_USB1HS_PHY_CLK,
+ 	Y9_3430_USB1HS_PHY_STP,
+@@ -839,6 +853,11 @@ enum omap34xx_index {
+ 	AF3_3430_MMC2_DAT6,
+ 	AE3_3430_MMC2_DAT7,
+ 
++	AB2_3430_MMC2_DIR_DAT0,
++	AA2_3430_MMC2_DIR_DAT1,
++	Y2_3430_MMC2_DIR_CMD,
++	AA1_3420_MMC2_CLKIN,
++
+ 	/* MMC3 */
+ 	AF10_3430_MMC3_CLK,
+ 	AC3_3430_MMC3_CMD,
+@@ -854,6 +873,73 @@ enum omap34xx_index {
+ 	AH14_34XX_GPIO21,
+ 	AF9_34XX_GPIO22,
+ 	U3_34XX_GPIO61,
++
++	AG4_34XX_GPIO134,
++	U8_34XX_GPIO54,
++	AE4_34XX_GPIO136,
++	F3_34XX_GPIO57_UP,
++	G4_34XX_GPIO58_OUT,
++	W2_34XX_GPIO59,
++	L1_34XX_GPIO61_OUT,
++	C2_34XX_GPIO65,
++	N21_34XX_GPIO127_UP,
++	A23_34XX_GPIO163_UP,
++	B23_34XX_GPIO164_OUT,
++	AA6_34XX_GPIO186_OUT,
++
++	/* gpmc */
++	F4_34XX_GPMC_NCS4,
++	G5_34XX_GPMC_NCS5,
++
++	/* McSPI 1 */
++	T5_34XX_MCSPI1_CLK,
++	R4_34XX_MCSPI1_SIMO,
++	T4_34XX_MCSPI1_SOMI,
++	T6_34XX_MCSPI1_CS0,
++
++	/* McBSP 2 */
++	V20_34XX_MCBSP2_FSX,
++	T21_34XX_MCBSP2_CLKX,
++	V19_34XX_MCBSP2_DR,
++	R20_34XX_MCBSP2_DX,
++
++	F21_34XX_GPIO109_OUT,
++
++	/* serial ports */
++	W4_34XX_UART2_TX,
++	V4_34XX_UART2_RX,
++	W7_34XX_UART1_TX,
++	V7_34XX_UART1_RX,
++
++	/* DSS */
++	G22_34XX_DSS_PCLK,
++	E22_34XX_DSS_HSYNC,
++	F22_34XX_DSS_VSYNC,
++	J21_34XX_DSS_ACBIAS,
++	AC19_34XX_DSS_DATA0,
++	AB19_34XX_DSS_DATA1,
++	AD20_34XX_DSS_DATA2,
++	AC20_34XX_DSS_DATA3,
++	AD21_34XX_DSS_DATA4,
++	AC21_34XX_DSS_DATA5,
++	D24_34XX_DSS_DATA6,
++	E23_34XX_DSS_DATA7,
++	E24_34XX_DSS_DATA8,
++	F23_34XX_DSS_DATA9,
++	AC22_34XX_DSS_DATA10,
++	AC23_34XX_DSS_DATA11,
++	AB22_34XX_DSS_DATA12,
++	Y22_34XX_DSS_DATA13,
++	W22_34XX_DSS_DATA14,
++	V22_34XX_DSS_DATA15,
++	J22_34XX_DSS_DATA16,
++	G23_34XX_DSS_DATA17,
++	G24_34XX_DSS_DATA18,
++	H23_34XX_DSS_DATA19,
++	D23_34XX_DSS_DATA20,
++	K22_34XX_DSS_DATA21,
++	V21_34XX_DSS_DATA22,
++	W21_34XX_DSS_DATA23,
+ };
+ 
+ struct omap_mux_cfg {
+-- 
+1.6.4.4
+
diff --git a/recipes/linux/linux-omap-2.6.32/cm-t35/0006-omap3-cm-t35-update-defconfig.patch b/recipes/linux/linux-omap-2.6.32/cm-t35/0006-omap3-cm-t35-update-defconfig.patch
new file mode 100644
index 0000000..a9034f0
--- /dev/null
+++ b/recipes/linux/linux-omap-2.6.32/cm-t35/0006-omap3-cm-t35-update-defconfig.patch
@@ -0,0 +1,87 @@
+From 88f7dc4c115c57b12de7ab4170bdaaeba145283b Mon Sep 17 00:00:00 2001
+From: Mike Rapoport <mike@compulab.co.il>
+Date: Mon, 7 Dec 2009 11:07:55 +0200
+Subject: [PATCH 6/6] omap3: cm-t35: update defconfig
+
+Signed-off-by: Mike Rapoport <mike@compulab.co.il>
+---
+ arch/arm/configs/cm_t35_defconfig |   28 ++++++++++++++++++++++------
+ 1 files changed, 22 insertions(+), 6 deletions(-)
+
+diff --git a/arch/arm/configs/cm_t35_defconfig b/arch/arm/configs/cm_t35_defconfig
+index bd6f882..78eeb66 100644
+--- a/arch/arm/configs/cm_t35_defconfig
++++ b/arch/arm/configs/cm_t35_defconfig
+@@ -1,7 +1,7 @@
+ #
+ # Automatically generated make config: don't edit
+-# Linux kernel version: 2.6.32-rc8
+-# Tue Dec  1 12:08:44 2009
++# Linux kernel version: 2.6.32
++# Mon Dec  7 10:43:46 2009
+ #
+ CONFIG_ARM=y
+ CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+@@ -572,7 +572,15 @@ CONFIG_MTD_NAND_IDS=y
+ #
+ # UBI - Unsorted block images
+ #
+-# CONFIG_MTD_UBI is not set
++CONFIG_MTD_UBI=y
++CONFIG_MTD_UBI_WL_THRESHOLD=4096
++CONFIG_MTD_UBI_BEB_RESERVE=1
++# CONFIG_MTD_UBI_GLUEBI is not set
++
++#
++# UBI debugging options
++#
++# CONFIG_MTD_UBI_DEBUG is not set
+ # CONFIG_PARPORT is not set
+ CONFIG_BLK_DEV=y
+ # CONFIG_BLK_DEV_COW_COMMON is not set
+@@ -1506,6 +1514,12 @@ CONFIG_JFFS2_RTIME=y
+ CONFIG_JFFS2_CMODE_PRIORITY=y
+ # CONFIG_JFFS2_CMODE_SIZE is not set
+ # CONFIG_JFFS2_CMODE_FAVOURLZO is not set
++CONFIG_UBIFS_FS=y
++# CONFIG_UBIFS_FS_XATTR is not set
++# CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
++CONFIG_UBIFS_FS_LZO=y
++CONFIG_UBIFS_FS_ZLIB=y
++# CONFIG_UBIFS_FS_DEBUG is not set
+ # CONFIG_CRAMFS is not set
+ # CONFIG_SQUASHFS is not set
+ # CONFIG_VXFS_FS is not set
+@@ -1775,9 +1789,9 @@ CONFIG_CRYPTO_DES=y
+ #
+ # Compression
+ #
+-# CONFIG_CRYPTO_DEFLATE is not set
++CONFIG_CRYPTO_DEFLATE=y
+ # CONFIG_CRYPTO_ZLIB is not set
+-# CONFIG_CRYPTO_LZO is not set
++CONFIG_CRYPTO_LZO=y
+ 
+ #
+ # Random Number Generation
+@@ -1792,7 +1806,7 @@ CONFIG_CRYPTO_HW=y
+ CONFIG_BITREVERSE=y
+ CONFIG_GENERIC_FIND_LAST_BIT=y
+ CONFIG_CRC_CCITT=y
+-# CONFIG_CRC16 is not set
++CONFIG_CRC16=y
+ # CONFIG_CRC_T10DIF is not set
+ # CONFIG_CRC_ITU_T is not set
+ CONFIG_CRC32=y
+@@ -1800,6 +1814,8 @@ CONFIG_CRC32=y
+ CONFIG_LIBCRC32C=y
+ CONFIG_ZLIB_INFLATE=y
+ CONFIG_ZLIB_DEFLATE=y
++CONFIG_LZO_COMPRESS=y
++CONFIG_LZO_DECOMPRESS=y
+ CONFIG_DECOMPRESS_GZIP=y
+ CONFIG_HAS_IOMEM=y
+ CONFIG_HAS_IOPORT=y
+-- 
+1.6.4.4
+
diff --git a/recipes/linux/linux-omap-2.6.32/cm-t35/defconfig b/recipes/linux/linux-omap-2.6.32/cm-t35/defconfig
new file mode 100644
index 0000000..78eeb66
--- /dev/null
+++ b/recipes/linux/linux-omap-2.6.32/cm-t35/defconfig
@@ -0,0 +1,1823 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.32
+# Mon Dec  7 10:43:46 2009
+#
+CONFIG_ARM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_GENERIC_GPIO=y
+CONFIG_GENERIC_TIME=y
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+CONFIG_ARCH_HAS_CPUFREQ=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=y
+CONFIG_VECTORS_BASE=0xffff0000
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_CONSTRUCTORS=y
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_LOCALVERSION=""
+CONFIG_LOCALVERSION_AUTO=y
+CONFIG_SWAP=y
+CONFIG_SYSVIPC=y
+CONFIG_SYSVIPC_SYSCTL=y
+# CONFIG_POSIX_MQUEUE is not set
+CONFIG_BSD_PROCESS_ACCT=y
+# CONFIG_BSD_PROCESS_ACCT_V3 is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+
+#
+# RCU Subsystem
+#
+CONFIG_TREE_RCU=y
+# CONFIG_TREE_PREEMPT_RCU is not set
+# CONFIG_RCU_TRACE is not set
+CONFIG_RCU_FANOUT=32
+# CONFIG_RCU_FANOUT_EXACT is not set
+# CONFIG_TREE_RCU_TRACE is not set
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=17
+CONFIG_GROUP_SCHED=y
+CONFIG_FAIR_GROUP_SCHED=y
+# CONFIG_RT_GROUP_SCHED is not set
+CONFIG_USER_SCHED=y
+# CONFIG_CGROUP_SCHED is not set
+# CONFIG_CGROUPS is not set
+CONFIG_SYSFS_DEPRECATED=y
+CONFIG_SYSFS_DEPRECATED_V2=y
+# CONFIG_RELAY is not set
+# CONFIG_NAMESPACES is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE=""
+CONFIG_RD_GZIP=y
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+CONFIG_EMBEDDED=y
+CONFIG_UID16=y
+# CONFIG_SYSCTL_SYSCALL is not set
+CONFIG_KALLSYMS=y
+# CONFIG_KALLSYMS_ALL is not set
+CONFIG_KALLSYMS_EXTRA_PASS=y
+CONFIG_HOTPLUG=y
+CONFIG_PRINTK=y
+CONFIG_BUG=y
+CONFIG_ELF_CORE=y
+CONFIG_BASE_FULL=y
+CONFIG_FUTEX=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+CONFIG_AIO=y
+
+#
+# Kernel Performance Events And Counters
+#
+CONFIG_VM_EVENT_COUNTERS=y
+CONFIG_COMPAT_BRK=y
+CONFIG_SLAB=y
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+# CONFIG_PROFILING is not set
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_CLK=y
+
+#
+# GCOV-based kernel profiling
+#
+# CONFIG_GCOV_KERNEL is not set
+# CONFIG_SLOW_WORK is not set
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_SLABINFO=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=0
+CONFIG_MODULES=y
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_MODULE_FORCE_UNLOAD is not set
+CONFIG_MODVERSIONS=y
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_BLOCK=y
+CONFIG_LBDAF=y
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+CONFIG_IOSCHED_AS=y
+CONFIG_IOSCHED_DEADLINE=y
+CONFIG_IOSCHED_CFQ=y
+CONFIG_DEFAULT_AS=y
+# CONFIG_DEFAULT_DEADLINE is not set
+# CONFIG_DEFAULT_CFQ is not set
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED="anticipatory"
+CONFIG_FREEZER=y
+
+#
+# System Type
+#
+CONFIG_MMU=y
+# CONFIG_ARCH_AAEC2000 is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_GEMINI is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_STMP3XXX is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_NOMADIK is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_L7200 is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_LOKI is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_MMP is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_NS9XXX is not set
+# CONFIG_ARCH_W90X900 is not set
+# CONFIG_ARCH_PNX4008 is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_S5PC1XX is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_LH7A40X is not set
+# CONFIG_ARCH_U300 is not set
+# CONFIG_ARCH_DAVINCI is not set
+CONFIG_ARCH_OMAP=y
+# CONFIG_ARCH_BCMRING is not set
+
+#
+# TI OMAP Implementations
+#
+CONFIG_ARCH_OMAP_OTG=y
+# CONFIG_ARCH_OMAP1 is not set
+# CONFIG_ARCH_OMAP2 is not set
+CONFIG_ARCH_OMAP3=y
+# CONFIG_ARCH_OMAP4 is not set
+
+#
+# OMAP Feature Selections
+#
+# CONFIG_OMAP_DEBUG_POWERDOMAIN is not set
+# CONFIG_OMAP_DEBUG_CLOCKDOMAIN is not set
+CONFIG_OMAP_RESET_CLOCKS=y
+CONFIG_OMAP_MUX=y
+# CONFIG_OMAP_MUX_DEBUG is not set
+CONFIG_OMAP_MUX_WARNINGS=y
+CONFIG_OMAP_MCBSP=y
+# CONFIG_OMAP_MBOX_FWK is not set
+# CONFIG_OMAP_MPU_TIMER is not set
+CONFIG_OMAP_32K_TIMER=y
+CONFIG_OMAP_32K_TIMER_HZ=128
+CONFIG_OMAP_DM_TIMER=y
+# CONFIG_OMAP_LL_DEBUG_UART1 is not set
+# CONFIG_OMAP_LL_DEBUG_UART2 is not set
+CONFIG_OMAP_LL_DEBUG_UART3=y
+# CONFIG_OMAP_LL_DEBUG_NONE is not set
+# CONFIG_OMAP_PM_NONE is not set
+CONFIG_OMAP_PM_NOOP=y
+CONFIG_ARCH_OMAP34XX=y
+CONFIG_ARCH_OMAP3430=y
+
+#
+# OMAP Board Type
+#
+# CONFIG_MACH_OMAP3_BEAGLE is not set
+# CONFIG_MACH_OMAP_LDP is not set
+# CONFIG_MACH_OVERO is not set
+# CONFIG_MACH_OMAP3EVM is not set
+# CONFIG_MACH_OMAP3517EVM is not set
+# CONFIG_MACH_OMAP3_PANDORA is not set
+# CONFIG_MACH_OMAP_3430SDP is not set
+# CONFIG_MACH_NOKIA_RX51 is not set
+# CONFIG_MACH_OMAP_ZOOM2 is not set
+# CONFIG_MACH_OMAP_ZOOM3 is not set
+CONFIG_MACH_CM_T35=y
+# CONFIG_MACH_IGEP0020 is not set
+# CONFIG_MACH_OMAP_3630SDP is not set
+
+#
+# Processor Type
+#
+CONFIG_CPU_32=y
+CONFIG_CPU_32v6K=y
+CONFIG_CPU_V7=y
+CONFIG_CPU_32v7=y
+CONFIG_CPU_ABRT_EV7=y
+CONFIG_CPU_PABRT_V7=y
+CONFIG_CPU_CACHE_V7=y
+CONFIG_CPU_CACHE_VIPT=y
+CONFIG_CPU_COPY_V6=y
+CONFIG_CPU_TLB_V7=y
+CONFIG_CPU_HAS_ASID=y
+CONFIG_CPU_CP15=y
+CONFIG_CPU_CP15_MMU=y
+
+#
+# Processor Features
+#
+CONFIG_ARM_THUMB=y
+# CONFIG_ARM_THUMBEE is not set
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CPU_BPREDICT_DISABLE is not set
+CONFIG_HAS_TLS_REG=y
+CONFIG_ARM_L1_CACHE_SHIFT=6
+# CONFIG_ARM_ERRATA_430973 is not set
+# CONFIG_ARM_ERRATA_458693 is not set
+# CONFIG_ARM_ERRATA_460075 is not set
+CONFIG_COMMON_CLKDEV=y
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
+CONFIG_TICK_ONESHOT=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+CONFIG_PREEMPT_NONE=y
+# CONFIG_PREEMPT_VOLUNTARY is not set
+# CONFIG_PREEMPT is not set
+CONFIG_HZ=128
+# CONFIG_THUMB2_KERNEL is not set
+CONFIG_AEABI=y
+CONFIG_OABI_COMPAT=y
+# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
+# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
+# CONFIG_HIGHMEM is not set
+CONFIG_SELECT_MEMORY_MODEL=y
+CONFIG_FLATMEM_MANUAL=y
+# CONFIG_DISCONTIGMEM_MANUAL is not set
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_FLATMEM=y
+CONFIG_FLAT_NODE_MEM_MAP=y
+CONFIG_PAGEFLAGS_EXTENDED=y
+CONFIG_SPLIT_PTLOCK_CPUS=4
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=0
+CONFIG_VIRT_TO_BUS=y
+CONFIG_HAVE_MLOCK=y
+CONFIG_HAVE_MLOCKED_PAGE_BIT=y
+# CONFIG_KSM is not set
+CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
+# CONFIG_LEDS is not set
+CONFIG_ALIGNMENT_TRAP=y
+# CONFIG_UACCESS_WITH_MEMCPY is not set
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
+# CPU Power Management
+#
+# CONFIG_CPU_FREQ is not set
+# CONFIG_CPU_IDLE is not set
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
+CONFIG_VFP=y
+CONFIG_VFPv3=y
+CONFIG_NEON=y
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_HAVE_AOUT=y
+# CONFIG_BINFMT_AOUT is not set
+CONFIG_BINFMT_MISC=y
+
+#
+# Power management options
+#
+CONFIG_PM=y
+# CONFIG_PM_DEBUG is not set
+CONFIG_PM_SLEEP=y
+CONFIG_SUSPEND=y
+CONFIG_SUSPEND_FREEZER=y
+# CONFIG_APM_EMULATION is not set
+# CONFIG_PM_RUNTIME is not set
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
+# CONFIG_XFRM_USER is not set
+# CONFIG_XFRM_SUB_POLICY is not set
+# CONFIG_XFRM_MIGRATE is not set
+# CONFIG_XFRM_STATISTICS is not set
+CONFIG_NET_KEY=y
+# CONFIG_NET_KEY_MIGRATE is not set
+CONFIG_INET=y
+# CONFIG_IP_MULTICAST is not set
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_FIB_HASH=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+# CONFIG_NET_IPIP is not set
+# CONFIG_NET_IPGRE is not set
+# CONFIG_ARPD is not set
+# CONFIG_SYN_COOKIES is not set
+# CONFIG_INET_AH is not set
+# CONFIG_INET_ESP is not set
+# CONFIG_INET_IPCOMP is not set
+# CONFIG_INET_XFRM_TUNNEL is not set
+# CONFIG_INET_TUNNEL is not set
+CONFIG_INET_XFRM_MODE_TRANSPORT=y
+CONFIG_INET_XFRM_MODE_TUNNEL=y
+CONFIG_INET_XFRM_MODE_BEET=y
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
+# CONFIG_RDS is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_BRIDGE is not set
+# CONFIG_NET_DSA is not set
+# CONFIG_VLAN_8021Q is not set
+# CONFIG_DECNET is not set
+# CONFIG_LLC2 is not set
+# CONFIG_IPX is not set
+# CONFIG_ATALK is not set
+# CONFIG_X25 is not set
+# CONFIG_LAPB is not set
+# CONFIG_ECONET is not set
+# CONFIG_WAN_ROUTER is not set
+# CONFIG_PHONET is not set
+# CONFIG_IEEE802154 is not set
+# CONFIG_NET_SCHED is not set
+# CONFIG_DCB is not set
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
+CONFIG_WIRELESS=y
+# CONFIG_CFG80211 is not set
+CONFIG_CFG80211_DEFAULT_PS_VALUE=0
+# CONFIG_WIRELESS_OLD_REGULATORY is not set
+CONFIG_WIRELESS_EXT=y
+CONFIG_WIRELESS_EXT_SYSFS=y
+CONFIG_LIB80211=m
+# CONFIG_LIB80211_DEBUG is not set
+
+#
+# CFG80211 needs to be enabled for MAC80211
+#
+# CONFIG_WIMAX is not set
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
+# CONFIG_DEVTMPFS is not set
+CONFIG_STANDALONE=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
+CONFIG_FW_LOADER=m
+CONFIG_FIRMWARE_IN_KERNEL=y
+CONFIG_EXTRA_FIRMWARE=""
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+CONFIG_MTD=y
+# CONFIG_MTD_DEBUG is not set
+# CONFIG_MTD_TESTS is not set
+CONFIG_MTD_CONCAT=y
+CONFIG_MTD_PARTITIONS=y
+# CONFIG_MTD_REDBOOT_PARTS is not set
+CONFIG_MTD_CMDLINE_PARTS=y
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
+CONFIG_MTD_CFI_INTELEXT=y
+# CONFIG_MTD_CFI_AMDSTD is not set
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
+# CONFIG_MTD_ARM_INTEGRATOR is not set
+# CONFIG_MTD_OMAP_NOR is not set
+# CONFIG_MTD_PLATRAM is not set
+
+#
+# Self-contained MTD device drivers
+#
+# CONFIG_MTD_DATAFLASH is not set
+# CONFIG_MTD_M25P80 is not set
+# CONFIG_MTD_SST25L is not set
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
+CONFIG_MTD_NAND=y
+# CONFIG_MTD_NAND_VERIFY_WRITE is not set
+# CONFIG_MTD_NAND_ECC_SMC is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+# CONFIG_MTD_NAND_GPIO is not set
+CONFIG_MTD_NAND_OMAP2=y
+CONFIG_MTD_NAND_OMAP_PREFETCH=y
+# CONFIG_MTD_NAND_OMAP_PREFETCH_DMA is not set
+CONFIG_MTD_NAND_IDS=y
+# CONFIG_MTD_NAND_DISKONCHIP is not set
+# CONFIG_MTD_NAND_NANDSIM is not set
+# CONFIG_MTD_NAND_PLATFORM is not set
+# CONFIG_MTD_ALAUDA is not set
+# CONFIG_MTD_ONENAND is not set
+
+#
+# LPDDR flash memory drivers
+#
+# CONFIG_MTD_LPDDR is not set
+
+#
+# UBI - Unsorted block images
+#
+CONFIG_MTD_UBI=y
+CONFIG_MTD_UBI_WL_THRESHOLD=4096
+CONFIG_MTD_UBI_BEB_RESERVE=1
+# CONFIG_MTD_UBI_GLUEBI is not set
+
+#
+# UBI debugging options
+#
+# CONFIG_MTD_UBI_DEBUG is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_UB is not set
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=16
+CONFIG_BLK_DEV_RAM_SIZE=16384
+# CONFIG_BLK_DEV_XIP is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+# CONFIG_MG_DISK is not set
+CONFIG_MISC_DEVICES=y
+# CONFIG_ICS932S401 is not set
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_ISL29003 is not set
+# CONFIG_C2PORT is not set
+
+#
+# EEPROM support
+#
+# CONFIG_EEPROM_AT24 is not set
+# CONFIG_EEPROM_AT25 is not set
+# CONFIG_EEPROM_LEGACY is not set
+# CONFIG_EEPROM_MAX6875 is not set
+# CONFIG_EEPROM_93CX6 is not set
+CONFIG_HAVE_IDE=y
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
+# CONFIG_RAID_ATTRS is not set
+CONFIG_SCSI=y
+CONFIG_SCSI_DMA=y
+# CONFIG_SCSI_TGT is not set
+# CONFIG_SCSI_NETLINK is not set
+CONFIG_SCSI_PROC_FS=y
+
+#
+# SCSI support type (disk, tape, CD-ROM)
+#
+CONFIG_BLK_DEV_SD=y
+# CONFIG_CHR_DEV_ST is not set
+# CONFIG_CHR_DEV_OSST is not set
+# CONFIG_BLK_DEV_SR is not set
+# CONFIG_CHR_DEV_SG is not set
+# CONFIG_CHR_DEV_SCH is not set
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
+# CONFIG_LIBFC is not set
+# CONFIG_LIBFCOE is not set
+# CONFIG_SCSI_DEBUG is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_SCSI_OSD_INITIATOR is not set
+# CONFIG_ATA is not set
+# CONFIG_MD is not set
+CONFIG_NETDEVICES=y
+# CONFIG_DUMMY is not set
+# CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_EQUALIZER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+CONFIG_PHYLIB=y
+
+#
+# MII PHY device drivers
+#
+# CONFIG_MARVELL_PHY is not set
+# CONFIG_DAVICOM_PHY is not set
+# CONFIG_QSEMI_PHY is not set
+# CONFIG_LXT_PHY is not set
+# CONFIG_CICADA_PHY is not set
+# CONFIG_VITESSE_PHY is not set
+# CONFIG_SMSC_PHY is not set
+# CONFIG_BROADCOM_PHY is not set
+# CONFIG_ICPLUS_PHY is not set
+# CONFIG_REALTEK_PHY is not set
+# CONFIG_NATIONAL_PHY is not set
+# CONFIG_STE10XP is not set
+# CONFIG_LSI_ET1011C_PHY is not set
+# CONFIG_FIXED_PHY is not set
+# CONFIG_MDIO_BITBANG is not set
+CONFIG_NET_ETHERNET=y
+CONFIG_MII=y
+# CONFIG_AX88796 is not set
+# CONFIG_SMC91X is not set
+# CONFIG_DM9000 is not set
+# CONFIG_ENC28J60 is not set
+# CONFIG_ETHOC is not set
+# CONFIG_SMC911X is not set
+CONFIG_SMSC911X=y
+# CONFIG_DNET is not set
+# CONFIG_IBM_NEW_EMAC_ZMII is not set
+# CONFIG_IBM_NEW_EMAC_RGMII is not set
+# CONFIG_IBM_NEW_EMAC_TAH is not set
+# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
+# CONFIG_IBM_NEW_EMAC_NO_FLOW_CTRL is not set
+# CONFIG_IBM_NEW_EMAC_MAL_CLR_ICINTSTAT is not set
+# CONFIG_IBM_NEW_EMAC_MAL_COMMON_ERR is not set
+# CONFIG_B44 is not set
+# CONFIG_KS8842 is not set
+# CONFIG_KS8851 is not set
+# CONFIG_KS8851_MLL is not set
+# CONFIG_NETDEV_1000 is not set
+# CONFIG_NETDEV_10000 is not set
+CONFIG_WLAN=y
+# CONFIG_WLAN_PRE80211 is not set
+CONFIG_WLAN_80211=y
+CONFIG_LIBERTAS=m
+# CONFIG_LIBERTAS_USB is not set
+CONFIG_LIBERTAS_SDIO=m
+# CONFIG_LIBERTAS_SPI is not set
+# CONFIG_LIBERTAS_DEBUG is not set
+# CONFIG_USB_ZD1201 is not set
+# CONFIG_HOSTAP is not set
+
+#
+# Enable WiMAX (Networking options) to see the WiMAX drivers
+#
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
+# CONFIG_PHONE is not set
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
+CONFIG_INPUT_MOUSEDEV=y
+CONFIG_INPUT_MOUSEDEV_PSAUX=y
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
+# CONFIG_INPUT_JOYDEV is not set
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_EVBUG is not set
+
+#
+# Input Device Drivers
+#
+CONFIG_INPUT_KEYBOARD=y
+# CONFIG_KEYBOARD_ADP5588 is not set
+CONFIG_KEYBOARD_ATKBD=y
+# CONFIG_QT2160 is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+# CONFIG_KEYBOARD_GPIO is not set
+# CONFIG_KEYBOARD_MATRIX is not set
+# CONFIG_KEYBOARD_LM8323 is not set
+# CONFIG_KEYBOARD_MAX7359 is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_OPENCORES is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+CONFIG_KEYBOARD_TWL4030=m
+# CONFIG_KEYBOARD_XTKBD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_ADS7846=m
+# CONFIG_TOUCHSCREEN_AD7877 is not set
+# CONFIG_TOUCHSCREEN_AD7879_I2C is not set
+# CONFIG_TOUCHSCREEN_AD7879_SPI is not set
+# CONFIG_TOUCHSCREEN_AD7879 is not set
+# CONFIG_TOUCHSCREEN_EETI is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
+# CONFIG_TOUCHSCREEN_MCS5000 is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_TOUCHSCREEN_TSC2007 is not set
+# CONFIG_TOUCHSCREEN_W90X900 is not set
+# CONFIG_INPUT_MISC is not set
+
+#
+# Hardware I/O ports
+#
+CONFIG_SERIO=y
+CONFIG_SERIO_SERPORT=y
+CONFIG_SERIO_LIBPS2=y
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
+CONFIG_SERIAL_8250_NR_UARTS=32
+CONFIG_SERIAL_8250_RUNTIME_UARTS=4
+CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_MANY_PORTS=y
+CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_SERIAL_8250_DETECT_IRQ=y
+CONFIG_SERIAL_8250_RSA=y
+
+#
+# Non-8250 serial port support
+#
+# CONFIG_SERIAL_MAX3100 is not set
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+CONFIG_UNIX98_PTYS=y
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_IPMI_HANDLER is not set
+CONFIG_HW_RANDOM=y
+# CONFIG_HW_RANDOM_TIMERIOMEM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+CONFIG_I2C_COMPAT=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_HELPER_AUTO=y
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+# CONFIG_I2C_DESIGNWARE is not set
+# CONFIG_I2C_GPIO is not set
+# CONFIG_I2C_OCORES is not set
+CONFIG_I2C_OMAP=y
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
+
+#
+# Miscellaneous I2C Chip support
+#
+# CONFIG_DS1682 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+# CONFIG_I2C_DEBUG_CHIP is not set
+CONFIG_SPI=y
+# CONFIG_SPI_DEBUG is not set
+CONFIG_SPI_MASTER=y
+
+#
+# SPI Master Controller Drivers
+#
+# CONFIG_SPI_BITBANG is not set
+# CONFIG_SPI_GPIO is not set
+CONFIG_SPI_OMAP24XX=y
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
+
+#
+# PPS support
+#
+# CONFIG_PPS is not set
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+# CONFIG_DEBUG_GPIO is not set
+CONFIG_GPIO_SYSFS=y
+
+#
+# Memory mapped GPIO expanders:
+#
+
+#
+# I2C GPIO expanders:
+#
+# CONFIG_GPIO_MAX732X is not set
+# CONFIG_GPIO_PCA953X is not set
+# CONFIG_GPIO_PCF857X is not set
+CONFIG_GPIO_TWL4030=y
+
+#
+# PCI GPIO expanders:
+#
+
+#
+# SPI GPIO expanders:
+#
+# CONFIG_GPIO_MAX7301 is not set
+# CONFIG_GPIO_MCP23S08 is not set
+# CONFIG_GPIO_MC33880 is not set
+
+#
+# AC97 GPIO expanders:
+#
+# CONFIG_W1 is not set
+# CONFIG_POWER_SUPPLY is not set
+# CONFIG_HWMON is not set
+# CONFIG_THERMAL is not set
+CONFIG_WATCHDOG=y
+CONFIG_WATCHDOG_NOWAYOUT=y
+
+#
+# Watchdog Device Drivers
+#
+# CONFIG_SOFT_WATCHDOG is not set
+CONFIG_OMAP_WATCHDOG=y
+# CONFIG_TWL4030_WATCHDOG is not set
+
+#
+# USB-based Watchdog Cards
+#
+# CONFIG_USBPCWATCHDOG is not set
+CONFIG_SSB_POSSIBLE=y
+
+#
+# Sonics Silicon Backplane
+#
+# CONFIG_SSB is not set
+
+#
+# Multifunction device drivers
+#
+# CONFIG_MFD_CORE is not set
+# CONFIG_MFD_SM501 is not set
+# CONFIG_MFD_ASIC3 is not set
+# CONFIG_HTC_EGPIO is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_TPS65010 is not set
+CONFIG_TWL4030_CORE=y
+# CONFIG_TWL4030_POWER is not set
+# CONFIG_TWL4030_CODEC is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
+# CONFIG_MFD_TC6393XB is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM831X is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_PCF50633 is not set
+# CONFIG_MFD_MC13783 is not set
+# CONFIG_AB3100_CORE is not set
+# CONFIG_EZX_PCAP is not set
+CONFIG_REGULATOR=y
+# CONFIG_REGULATOR_DEBUG is not set
+# CONFIG_REGULATOR_FIXED_VOLTAGE is not set
+# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
+# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
+# CONFIG_REGULATOR_BQ24022 is not set
+# CONFIG_REGULATOR_MAX1586 is not set
+CONFIG_REGULATOR_TWL4030=y
+# CONFIG_REGULATOR_LP3971 is not set
+# CONFIG_REGULATOR_TPS65023 is not set
+# CONFIG_REGULATOR_TPS6507X is not set
+# CONFIG_MEDIA_SUPPORT is not set
+
+#
+# Graphics support
+#
+# CONFIG_VGASTATE is not set
+# CONFIG_VIDEO_OUTPUT_CONTROL is not set
+CONFIG_FB=y
+# CONFIG_FIRMWARE_EDID is not set
+# CONFIG_FB_DDC is not set
+# CONFIG_FB_BOOT_VESA_SUPPORT is not set
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
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_MB862XX is not set
+# CONFIG_FB_BROADSHEET is not set
+# CONFIG_FB_OMAP_BOOTLOADER_INIT is not set
+CONFIG_OMAP2_VRAM=y
+CONFIG_OMAP2_VRFB=y
+CONFIG_OMAP2_DSS=y
+CONFIG_OMAP2_VRAM_SIZE=4
+CONFIG_OMAP2_DSS_DEBUG_SUPPORT=y
+# CONFIG_OMAP2_DSS_RFBI is not set
+CONFIG_OMAP2_DSS_VENC=y
+# CONFIG_OMAP2_DSS_SDI is not set
+# CONFIG_OMAP2_DSS_DSI is not set
+# CONFIG_OMAP2_DSS_FAKE_VSYNC is not set
+CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=0
+CONFIG_FB_OMAP2=y
+CONFIG_FB_OMAP2_DEBUG_SUPPORT=y
+# CONFIG_FB_OMAP2_FORCE_AUTO_UPDATE is not set
+CONFIG_FB_OMAP2_NUM_FBS=3
+
+#
+# OMAP2/3 Display Device Drivers
+#
+CONFIG_PANEL_GENERIC=y
+# CONFIG_PANEL_SAMSUNG_LTE430WQ_F0C is not set
+# CONFIG_PANEL_SHARP_LS037V7DW01 is not set
+CONFIG_PANEL_TOPPOLY_TDO35S=y
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CLASS_DEVICE=y
+# CONFIG_LCD_LMS283GF05 is not set
+# CONFIG_LCD_LTV350QV is not set
+# CONFIG_LCD_ILI9320 is not set
+CONFIG_LCD_TDO24M=y
+# CONFIG_LCD_VGG2432A4 is not set
+# CONFIG_LCD_PLATFORM is not set
+# CONFIG_BACKLIGHT_CLASS_DEVICE is not set
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
+# CONFIG_FONTS is not set
+CONFIG_FONT_8x8=y
+CONFIG_FONT_8x16=y
+CONFIG_LOGO=y
+CONFIG_LOGO_LINUX_MONO=y
+CONFIG_LOGO_LINUX_VGA16=y
+CONFIG_LOGO_LINUX_CLUT224=y
+# CONFIG_SOUND is not set
+CONFIG_HID_SUPPORT=y
+CONFIG_HID=y
+# CONFIG_HIDRAW is not set
+
+#
+# USB Input Devices
+#
+CONFIG_USB_HID=y
+# CONFIG_HID_PID is not set
+# CONFIG_USB_HIDDEV is not set
+
+#
+# Special HID drivers
+#
+# CONFIG_HID_A4TECH is not set
+# CONFIG_HID_APPLE is not set
+# CONFIG_HID_BELKIN is not set
+# CONFIG_HID_CHERRY is not set
+# CONFIG_HID_CHICONY is not set
+# CONFIG_HID_CYPRESS is not set
+# CONFIG_HID_DRAGONRISE is not set
+# CONFIG_HID_EZKEY is not set
+# CONFIG_HID_KYE is not set
+# CONFIG_HID_GYRATION is not set
+# CONFIG_HID_TWINHAN is not set
+# CONFIG_HID_KENSINGTON is not set
+# CONFIG_HID_LOGITECH is not set
+# CONFIG_HID_MICROSOFT is not set
+# CONFIG_HID_MONTEREY is not set
+# CONFIG_HID_NTRIG is not set
+# CONFIG_HID_PANTHERLORD is not set
+# CONFIG_HID_PETALYNX is not set
+# CONFIG_HID_SAMSUNG is not set
+# CONFIG_HID_SONY is not set
+# CONFIG_HID_SUNPLUS is not set
+# CONFIG_HID_GREENASIA is not set
+# CONFIG_HID_SMARTJOYPLUS is not set
+# CONFIG_HID_TOPSEED is not set
+# CONFIG_HID_THRUSTMASTER is not set
+# CONFIG_HID_ZEROPLUS is not set
+CONFIG_USB_SUPPORT=y
+CONFIG_USB_ARCH_HAS_HCD=y
+CONFIG_USB_ARCH_HAS_OHCI=y
+CONFIG_USB_ARCH_HAS_EHCI=y
+CONFIG_USB=y
+# CONFIG_USB_DEBUG is not set
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+
+#
+# Miscellaneous USB options
+#
+CONFIG_USB_DEVICEFS=y
+# CONFIG_USB_DEVICE_CLASS is not set
+# CONFIG_USB_DYNAMIC_MINORS is not set
+CONFIG_USB_SUSPEND=y
+CONFIG_USB_OTG=y
+# CONFIG_USB_OTG_WHITELIST is not set
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+CONFIG_USB_MON=y
+# CONFIG_USB_WUSB is not set
+# CONFIG_USB_WUSB_CBAF is not set
+
+#
+# USB Host Controller Drivers
+#
+# CONFIG_USB_C67X00_HCD is not set
+CONFIG_USB_EHCI_HCD=y
+# CONFIG_USB_EHCI_ROOT_HUB_TT is not set
+# CONFIG_USB_EHCI_TT_NEWSCHED is not set
+# CONFIG_USB_OXU210HP_HCD is not set
+# CONFIG_USB_ISP116X_HCD is not set
+# CONFIG_USB_ISP1760_HCD is not set
+# CONFIG_USB_ISP1362_HCD is not set
+# CONFIG_USB_OHCI_HCD is not set
+# CONFIG_USB_SL811_HCD is not set
+# CONFIG_USB_R8A66597_HCD is not set
+# CONFIG_USB_HWA_HCD is not set
+CONFIG_USB_MUSB_HDRC=y
+CONFIG_USB_MUSB_SOC=y
+
+#
+# OMAP 343x high speed USB support
+#
+# CONFIG_USB_MUSB_HOST is not set
+# CONFIG_USB_MUSB_PERIPHERAL is not set
+CONFIG_USB_MUSB_OTG=y
+CONFIG_USB_GADGET_MUSB_HDRC=y
+CONFIG_USB_MUSB_HDRC_HCD=y
+# CONFIG_MUSB_PIO_ONLY is not set
+CONFIG_USB_INVENTRA_DMA=y
+# CONFIG_USB_TI_CPPI_DMA is not set
+# CONFIG_USB_MUSB_DEBUG is not set
+
+#
+# USB Device Class drivers
+#
+# CONFIG_USB_ACM is not set
+# CONFIG_USB_PRINTER is not set
+# CONFIG_USB_WDM is not set
+# CONFIG_USB_TMC is not set
+
+#
+# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
+#
+
+#
+# also be needed; see USB_STORAGE Help for more info
+#
+CONFIG_USB_STORAGE=y
+# CONFIG_USB_STORAGE_DEBUG is not set
+# CONFIG_USB_STORAGE_DATAFAB is not set
+# CONFIG_USB_STORAGE_FREECOM is not set
+# CONFIG_USB_STORAGE_ISD200 is not set
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
+# CONFIG_USB_SERIAL is not set
+
+#
+# USB Miscellaneous drivers
+#
+# CONFIG_USB_EMI62 is not set
+# CONFIG_USB_EMI26 is not set
+# CONFIG_USB_ADUTUX is not set
+# CONFIG_USB_SEVSEG is not set
+# CONFIG_USB_RIO500 is not set
+# CONFIG_USB_LEGOTOWER is not set
+# CONFIG_USB_LCD is not set
+# CONFIG_USB_BERRY_CHARGE is not set
+# CONFIG_USB_LED is not set
+# CONFIG_USB_CYPRESS_CY7C63 is not set
+# CONFIG_USB_CYTHERM is not set
+# CONFIG_USB_IDMOUSE is not set
+# CONFIG_USB_FTDI_ELAN is not set
+# CONFIG_USB_APPLEDISPLAY is not set
+# CONFIG_USB_SISUSBVGA is not set
+# CONFIG_USB_LD is not set
+# CONFIG_USB_TRANCEVIBRATOR is not set
+# CONFIG_USB_IOWARRIOR is not set
+CONFIG_USB_TEST=y
+# CONFIG_USB_ISIGHTFW is not set
+# CONFIG_USB_VST is not set
+CONFIG_USB_GADGET=y
+# CONFIG_USB_GADGET_DEBUG is not set
+# CONFIG_USB_GADGET_DEBUG_FILES is not set
+# CONFIG_USB_GADGET_DEBUG_FS is not set
+CONFIG_USB_GADGET_VBUS_DRAW=2
+CONFIG_USB_GADGET_SELECTED=y
+# CONFIG_USB_GADGET_AT91 is not set
+# CONFIG_USB_GADGET_ATMEL_USBA is not set
+# CONFIG_USB_GADGET_FSL_USB2 is not set
+# CONFIG_USB_GADGET_LH7A40X is not set
+# CONFIG_USB_GADGET_OMAP is not set
+# CONFIG_USB_GADGET_PXA25X is not set
+# CONFIG_USB_GADGET_R8A66597 is not set
+# CONFIG_USB_GADGET_PXA27X is not set
+# CONFIG_USB_GADGET_S3C_HSOTG is not set
+# CONFIG_USB_GADGET_IMX is not set
+# CONFIG_USB_GADGET_S3C2410 is not set
+# CONFIG_USB_GADGET_M66592 is not set
+# CONFIG_USB_GADGET_AMD5536UDC is not set
+# CONFIG_USB_GADGET_FSL_QE is not set
+# CONFIG_USB_GADGET_CI13XXX is not set
+# CONFIG_USB_GADGET_NET2280 is not set
+# CONFIG_USB_GADGET_GOKU is not set
+# CONFIG_USB_GADGET_LANGWELL is not set
+# CONFIG_USB_GADGET_DUMMY_HCD is not set
+CONFIG_USB_GADGET_DUALSPEED=y
+# CONFIG_USB_ZERO is not set
+# CONFIG_USB_AUDIO is not set
+CONFIG_USB_ETH=y
+CONFIG_USB_ETH_RNDIS=y
+# CONFIG_USB_ETH_EEM is not set
+# CONFIG_USB_GADGETFS is not set
+# CONFIG_USB_FILE_STORAGE is not set
+# CONFIG_USB_G_SERIAL is not set
+# CONFIG_USB_MIDI_GADGET is not set
+# CONFIG_USB_G_PRINTER is not set
+# CONFIG_USB_CDC_COMPOSITE is not set
+
+#
+# OTG and related infrastructure
+#
+CONFIG_USB_OTG_UTILS=y
+# CONFIG_USB_GPIO_VBUS is not set
+# CONFIG_ISP1301_OMAP is not set
+CONFIG_TWL4030_USB=y
+# CONFIG_NOP_USB_XCEIV is not set
+CONFIG_MMC=y
+# CONFIG_MMC_DEBUG is not set
+# CONFIG_MMC_UNSAFE_RESUME is not set
+
+#
+# MMC/SD/SDIO Card Drivers
+#
+CONFIG_MMC_BLOCK=y
+CONFIG_MMC_BLOCK_BOUNCE=y
+# CONFIG_SDIO_UART is not set
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD/SDIO Host Controller Drivers
+#
+# CONFIG_MMC_SDHCI is not set
+# CONFIG_MMC_OMAP is not set
+CONFIG_MMC_OMAP_HS=y
+# CONFIG_MMC_AT91 is not set
+# CONFIG_MMC_ATMELMCI is not set
+# CONFIG_MMC_SPI is not set
+# CONFIG_MEMSTICK is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+
+#
+# LED drivers
+#
+# CONFIG_LEDS_PCA9532 is not set
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_GPIO_PLATFORM=y
+# CONFIG_LEDS_LP3944 is not set
+# CONFIG_LEDS_PCA955X is not set
+# CONFIG_LEDS_DAC124S085 is not set
+# CONFIG_LEDS_BD2802 is not set
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGERS=y
+# CONFIG_LEDS_TRIGGER_TIMER is not set
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
+# CONFIG_LEDS_TRIGGER_GPIO is not set
+# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
+
+#
+# iptables trigger is under Netfilter config (LED target)
+#
+# CONFIG_ACCESSIBILITY is not set
+CONFIG_RTC_LIB=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_HCTOSYS=y
+CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
+# CONFIG_RTC_DEBUG is not set
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
+# CONFIG_RTC_DRV_M41T80 is not set
+CONFIG_RTC_DRV_TWL4030=y
+# CONFIG_RTC_DRV_S35390A is not set
+# CONFIG_RTC_DRV_FM3130 is not set
+# CONFIG_RTC_DRV_RX8581 is not set
+# CONFIG_RTC_DRV_RX8025 is not set
+
+#
+# SPI RTC drivers
+#
+# CONFIG_RTC_DRV_M41T94 is not set
+# CONFIG_RTC_DRV_DS1305 is not set
+# CONFIG_RTC_DRV_DS1390 is not set
+# CONFIG_RTC_DRV_MAX6902 is not set
+# CONFIG_RTC_DRV_R9701 is not set
+# CONFIG_RTC_DRV_RS5C348 is not set
+# CONFIG_RTC_DRV_DS3234 is not set
+# CONFIG_RTC_DRV_PCF2123 is not set
+
+#
+# Platform RTC drivers
+#
+# CONFIG_RTC_DRV_CMOS is not set
+# CONFIG_RTC_DRV_DS1286 is not set
+# CONFIG_RTC_DRV_DS1511 is not set
+# CONFIG_RTC_DRV_DS1553 is not set
+# CONFIG_RTC_DRV_DS1742 is not set
+# CONFIG_RTC_DRV_STK17TA8 is not set
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T35 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_BQ4802 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+
+#
+# on-CPU RTC drivers
+#
+# CONFIG_DMADEVICES is not set
+# CONFIG_AUXDISPLAY is not set
+# CONFIG_UIO is not set
+
+#
+# TI VLYNQ
+#
+# CONFIG_STAGING is not set
+
+#
+# CBUS support
+#
+# CONFIG_CBUS is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=y
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=y
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+# CONFIG_EXT3_FS_XATTR is not set
+# CONFIG_EXT4_FS is not set
+CONFIG_JBD=y
+# CONFIG_JBD_DEBUG is not set
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_FS_POSIX_ACL is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_GFS2_FS is not set
+# CONFIG_OCFS2_FS is not set
+# CONFIG_BTRFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+CONFIG_FILE_LOCKING=y
+CONFIG_FSNOTIFY=y
+CONFIG_DNOTIFY=y
+CONFIG_INOTIFY=y
+CONFIG_INOTIFY_USER=y
+CONFIG_QUOTA=y
+# CONFIG_QUOTA_NETLINK_INTERFACE is not set
+CONFIG_PRINT_QUOTA_WARNING=y
+CONFIG_QUOTA_TREE=y
+# CONFIG_QFMT_V1 is not set
+CONFIG_QFMT_V2=y
+CONFIG_QUOTACTL=y
+# CONFIG_AUTOFS_FS is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+
+#
+# Caches
+#
+# CONFIG_FSCACHE is not set
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
+CONFIG_FAT_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
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
+CONFIG_PROC_PAGE_MONITOR=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+# CONFIG_TMPFS_POSIX_ACL is not set
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+CONFIG_MISC_FILESYSTEMS=y
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_FS_DEBUG=0
+CONFIG_JFFS2_FS_WRITEBUFFER=y
+# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
+CONFIG_JFFS2_SUMMARY=y
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
+CONFIG_UBIFS_FS=y
+# CONFIG_UBIFS_FS_XATTR is not set
+# CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
+CONFIG_UBIFS_FS_LZO=y
+CONFIG_UBIFS_FS_ZLIB=y
+# CONFIG_UBIFS_FS_DEBUG is not set
+# CONFIG_CRAMFS is not set
+# CONFIG_SQUASHFS is not set
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
+CONFIG_NFS_V4=y
+# CONFIG_NFS_V4_1 is not set
+CONFIG_ROOT_NFS=y
+# CONFIG_NFSD is not set
+CONFIG_LOCKD=y
+CONFIG_LOCKD_V4=y
+CONFIG_NFS_COMMON=y
+CONFIG_SUNRPC=y
+CONFIG_SUNRPC_GSS=y
+CONFIG_RPCSEC_GSS_KRB5=y
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
+CONFIG_PARTITION_ADVANCED=y
+# CONFIG_ACORN_PARTITION is not set
+# CONFIG_OSF_PARTITION is not set
+# CONFIG_AMIGA_PARTITION is not set
+# CONFIG_ATARI_PARTITION is not set
+# CONFIG_MAC_PARTITION is not set
+CONFIG_MSDOS_PARTITION=y
+# CONFIG_BSD_DISKLABEL is not set
+# CONFIG_MINIX_SUBPARTITION is not set
+# CONFIG_SOLARIS_X86_PARTITION is not set
+# CONFIG_UNIXWARE_DISKLABEL is not set
+# CONFIG_LDM_PARTITION is not set
+# CONFIG_SGI_PARTITION is not set
+# CONFIG_ULTRIX_PARTITION is not set
+# CONFIG_SUN_PARTITION is not set
+# CONFIG_KARMA_PARTITION is not set
+# CONFIG_EFI_PARTITION is not set
+# CONFIG_SYSV68_PARTITION is not set
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="iso8859-1"
+CONFIG_NLS_CODEPAGE_437=y
+# CONFIG_NLS_CODEPAGE_737 is not set
+# CONFIG_NLS_CODEPAGE_775 is not set
+# CONFIG_NLS_CODEPAGE_850 is not set
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
+CONFIG_NLS_UTF8=m
+# CONFIG_DLM is not set
+
+#
+# Kernel hacking
+#
+# CONFIG_PRINTK_TIME is not set
+CONFIG_ENABLE_WARN_DEPRECATED=y
+CONFIG_ENABLE_MUST_CHECK=y
+CONFIG_FRAME_WARN=1024
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_STRIP_ASM_SYMS is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+CONFIG_DEBUG_FS=y
+# CONFIG_HEADERS_CHECK is not set
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_DEBUG_SHIRQ is not set
+CONFIG_DETECT_SOFTLOCKUP=y
+# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
+CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=0
+CONFIG_DETECT_HUNG_TASK=y
+# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
+CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=0
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_SCHEDSTATS is not set
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_OBJECTS is not set
+# CONFIG_DEBUG_SLAB is not set
+# CONFIG_DEBUG_KMEMLEAK is not set
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_RT_MUTEX_TESTER is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+CONFIG_DEBUG_MUTEXES=y
+# CONFIG_DEBUG_LOCK_ALLOC is not set
+# CONFIG_PROVE_LOCKING is not set
+# CONFIG_LOCK_STAT is not set
+# CONFIG_DEBUG_SPINLOCK_SLEEP is not set
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+# CONFIG_DEBUG_KOBJECT is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+CONFIG_DEBUG_INFO=y
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_DEBUG_SG is not set
+# CONFIG_DEBUG_NOTIFIERS is not set
+# CONFIG_DEBUG_CREDENTIALS is not set
+# CONFIG_BOOT_PRINTK_DELAY is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_RCU_CPU_STALL_DETECTOR is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
+# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_PAGE_POISONING is not set
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_TRACING_SUPPORT=y
+CONFIG_FTRACE=y
+# CONFIG_FUNCTION_TRACER is not set
+# CONFIG_IRQSOFF_TRACER is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_ENABLE_DEFAULT_TRACERS is not set
+# CONFIG_BOOT_TRACER is not set
+CONFIG_BRANCH_PROFILE_NONE=y
+# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
+# CONFIG_PROFILE_ALL_BRANCHES is not set
+# CONFIG_STACK_TRACER is not set
+# CONFIG_KMEMTRACE is not set
+# CONFIG_WORKQUEUE_TRACER is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_DYNAMIC_DEBUG is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+# CONFIG_KGDB is not set
+CONFIG_ARM_UNWIND=y
+# CONFIG_DEBUG_USER is not set
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
+# CONFIG_SECURITYFS is not set
+# CONFIG_SECURITY_FILE_CAPABILITIES is not set
+CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
+CONFIG_CRYPTO_ALGAPI=y
+CONFIG_CRYPTO_ALGAPI2=y
+CONFIG_CRYPTO_AEAD2=y
+CONFIG_CRYPTO_BLKCIPHER=y
+CONFIG_CRYPTO_BLKCIPHER2=y
+CONFIG_CRYPTO_HASH=y
+CONFIG_CRYPTO_HASH2=y
+CONFIG_CRYPTO_RNG2=y
+CONFIG_CRYPTO_PCOMP=y
+CONFIG_CRYPTO_MANAGER=y
+CONFIG_CRYPTO_MANAGER2=y
+# CONFIG_CRYPTO_GF128MUL is not set
+# CONFIG_CRYPTO_NULL is not set
+CONFIG_CRYPTO_WORKQUEUE=y
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
+CONFIG_CRYPTO_CBC=y
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+CONFIG_CRYPTO_ECB=m
+# CONFIG_CRYPTO_LRW is not set
+CONFIG_CRYPTO_PCBC=m
+# CONFIG_CRYPTO_XTS is not set
+
+#
+# Hash modes
+#
+# CONFIG_CRYPTO_HMAC is not set
+# CONFIG_CRYPTO_XCBC is not set
+# CONFIG_CRYPTO_VMAC is not set
+
+#
+# Digest
+#
+CONFIG_CRYPTO_CRC32C=y
+# CONFIG_CRYPTO_GHASH is not set
+# CONFIG_CRYPTO_MD4 is not set
+CONFIG_CRYPTO_MD5=y
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
+CONFIG_CRYPTO_DES=y
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
+CONFIG_CRYPTO_DEFLATE=y
+# CONFIG_CRYPTO_ZLIB is not set
+CONFIG_CRYPTO_LZO=y
+
+#
+# Random Number Generation
+#
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+CONFIG_CRYPTO_HW=y
+# CONFIG_BINARY_PRINTF is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=y
+CONFIG_GENERIC_FIND_LAST_BIT=y
+CONFIG_CRC_CCITT=y
+CONFIG_CRC16=y
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=y
+# CONFIG_CRC7 is not set
+CONFIG_LIBCRC32C=y
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_LZO_COMPRESS=y
+CONFIG_LZO_DECOMPRESS=y
+CONFIG_DECOMPRESS_GZIP=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_NLATTR=y
diff --git a/recipes/linux/linux-omap_2.6.32.bb b/recipes/linux/linux-omap_2.6.32.bb
index 95692c0..3caaaf4 100644
--- a/recipes/linux/linux-omap_2.6.32.bb
+++ b/recipes/linux/linux-omap_2.6.32.bb
@@ -3,9 +3,10 @@ require linux.inc
 DESCRIPTION = "Linux kernel for OMAP processors"
 KERNEL_IMAGETYPE = "uImage"
 
-COMPATIBLE_MACHINE = "omap5912osk|omap1710h3|omap2430sdp|omap2420h4|beagleboard|omap3evm|omap3-pandora|overo|omapzoom|omapzoom2|omap4430-sdp"
+COMPATIBLE_MACHINE = "omap5912osk|omap1710h3|omap2430sdp|omap2420h4|beagleboard|omap3evm|omap3-pandora|overo|omapzoom|omapzoom2|omap4430-sdp|cm-t35"
 
 DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_cm-t35 = "1"
 
 SRCREV = "89c9eaeb92c97348dcabd6cb377b646c00855f6a"
 
@@ -23,6 +24,15 @@ file://usb/ehci-omap.c-mach-to-plat.diff;patch=1 \
 SRC_URI_append_beagleboard = " file://logo_linux_clut224.ppm \
 "
 
+SRC_URI_append_cm-t35 = " \
+file://cm-t35/0001-OMAP-DSS2-add-Toppoly-TDO35S-panel.patch;patch=1 \
+file://cm-t35/0002-omap3-cm-t35-add-DSS2-display-support.patch;patch=1 \
+file://cm-t35/0003-omap3-cm-t35-update-defconfig-for-DSS2.patch;patch=1 \
+file://cm-t35/0004-omap3-cm-t35-add-cm-t35-mux-configs.patch;patch=1 \
+file://cm-t35/0006-omap3-cm-t35-update-defconfig.patch;patch=1 \
+file://cm-t35/0001-backlight-tdo24m-ensure-chip-select-changes-between-.patch;patch=1 \
+"
+
 S = "${WORKDIR}/git"
 
 module_autoload_ohci-hcd_omap5912osk = "ohci-hcd"
-- 
1.6.4.4



