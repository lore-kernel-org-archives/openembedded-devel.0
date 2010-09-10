Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anarsoul@gmail.com>) id 1OuAda-00054M-3p
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 22:56:14 +0200
Received: by eyb7 with SMTP id 7so2139191eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Sep 2010 13:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=TI3Qca8BDJ7egSLuzCOlo6I8avTPINqsVA+SEQ8hYHc=;
	b=Z44WhzvDzSxeYt8ryC2T4QJqTnnZMuNo41UEhZ1RxWtDu2Hd01NzCZSkg/RyPjBPFb
	yyLjJ87S/miLagSPSmImSaa/sEqalWDqNphuDZvZJY1AFf7UlfJ/MdnMAnnRMa3BP8/5
	1AZULBFFm31tj5VST8D+K10uChWZsDJ1w+ANg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=oFqlvpG5N6FEPgqe6NnCJQhhBziOEgPknzdAD0949A3xx19pt3fvN3h5kd/4XKt2tg
	nECKy9FMyUQ2tbYM9T/fPV42Z1II6/CRH1ZwZqy3ZHwPSAGBlPmE8U/NCfkhTEj1g6V7
	RxO26ApugPZqYHs7NByNk0G9jULMV1JsrO/i4=
Received: by 10.213.22.207 with SMTP id o15mr69842ebb.97.1284152115292;
	Fri, 10 Sep 2010 13:55:15 -0700 (PDT)
Received: from localhost.localdomain ([80.249.95.150])
	by mx.google.com with ESMTPS id z55sm4525469eeh.3.2010.09.10.13.55.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 10 Sep 2010 13:55:14 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	anarsoul@gmail.com
Date: Fri, 10 Sep 2010 23:54:13 +0300
Message-Id: <1284152054-27447-2-git-send-email-anarsoul@gmail.com>
X-Mailer: git-send-email 1.7.2.2
In-Reply-To: <1284152054-27447-1-git-send-email-anarsoul@gmail.com>
References: <1284152054-27447-1-git-send-email-anarsoul@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: anarsoul@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] linux-2.6.35: add rx1950 support
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
X-List-Received-Date: Fri, 10 Sep 2010 20:56:14 -0000

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 .../0001-s3c2410_ts-add-fake-pressure-events.patch |   41 +
 ...2-s3c2410_udc-2440-dual-packet-workaround.patch |   71 +
 .../rx1950/0003-rx1950-add-battery-device.patch    |  356 +++++
 .../rx1950/0004-rx1950-add-LEDs-support.patch      |   71 +
 ...-s3c24xx-DMA-don-t-use-autoreload-feature.patch |  701 +++++++++
 .../rx1950/0006-s3cmci-minor-fixups.patch          |   40 +
 .../rx1950/0007-Add-s3c-adc-battery-driver.patch   |  530 +++++++
 recipes/linux/linux-2.6.35/rx1950/defconfig        | 1615 ++++++++++++++++++++
 recipes/linux/linux_2.6.35.bb                      |    7 +
 9 files changed, 3432 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-2.6.35/rx1950/0001-s3c2410_ts-add-fake-pressure-events.patch
 create mode 100644 recipes/linux/linux-2.6.35/rx1950/0002-s3c2410_udc-2440-dual-packet-workaround.patch
 create mode 100644 recipes/linux/linux-2.6.35/rx1950/0003-rx1950-add-battery-device.patch
 create mode 100644 recipes/linux/linux-2.6.35/rx1950/0004-rx1950-add-LEDs-support.patch
 create mode 100644 recipes/linux/linux-2.6.35/rx1950/0005-s3c24xx-DMA-don-t-use-autoreload-feature.patch
 create mode 100644 recipes/linux/linux-2.6.35/rx1950/0006-s3cmci-minor-fixups.patch
 create mode 100644 recipes/linux/linux-2.6.35/rx1950/0007-Add-s3c-adc-battery-driver.patch
 create mode 100644 recipes/linux/linux-2.6.35/rx1950/defconfig

diff --git a/recipes/linux/linux-2.6.35/rx1950/0001-s3c2410_ts-add-fake-pressure-events.patch b/recipes/linux/linux-2.6.35/rx1950/0001-s3c2410_ts-add-fake-pressure-events.patch
new file mode 100644
index 0000000..fa43e2d
--- /dev/null
+++ b/recipes/linux/linux-2.6.35/rx1950/0001-s3c2410_ts-add-fake-pressure-events.patch
@@ -0,0 +1,41 @@
+From d9b482fc3e5bef43a7845989189cf9b71915a1cb Mon Sep 17 00:00:00 2001
+From: Vasily Khoruzhick <anarsoul@gmail.com>
+Date: Wed, 12 May 2010 09:59:32 +0300
+Subject: [PATCH 01/20] s3c2410_ts: add fake pressure events
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+---
+ drivers/input/touchscreen/s3c2410_ts.c |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/input/touchscreen/s3c2410_ts.c b/drivers/input/touchscreen/s3c2410_ts.c
+index 6085d12..381c295 100644
+--- a/drivers/input/touchscreen/s3c2410_ts.c
++++ b/drivers/input/touchscreen/s3c2410_ts.c
+@@ -126,6 +126,7 @@ static void touch_timer_fire(unsigned long data)
+ 			input_report_abs(ts.input, ABS_Y, ts.yp);
+ 
+ 			input_report_key(ts.input, BTN_TOUCH, 1);
++			input_report_abs(ts.input, ABS_PRESSURE, 1);
+ 			input_sync(ts.input);
+ 
+ 			ts.xp = 0;
+@@ -140,6 +141,7 @@ static void touch_timer_fire(unsigned long data)
+ 		ts.count = 0;
+ 
+ 		input_report_key(ts.input, BTN_TOUCH, 0);
++		input_report_abs(ts.input, ABS_PRESSURE, 0);
+ 		input_sync(ts.input);
+ 
+ 		writel(WAIT4INT | INT_DOWN, ts.io + S3C2410_ADCTSC);
+@@ -318,6 +320,7 @@ static int __devinit s3c2410ts_probe(struct platform_device *pdev)
+ 	ts.input->keybit[BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH);
+ 	input_set_abs_params(ts.input, ABS_X, 0, 0x3FF, 0, 0);
+ 	input_set_abs_params(ts.input, ABS_Y, 0, 0x3FF, 0, 0);
++	input_set_abs_params(ts.input, ABS_PRESSURE, 0, 1, 0, 0);
+ 
+ 	ts.input->name = "S3C24XX TouchScreen";
+ 	ts.input->id.bustype = BUS_HOST;
+-- 
+1.7.2.2
+
diff --git a/recipes/linux/linux-2.6.35/rx1950/0002-s3c2410_udc-2440-dual-packet-workaround.patch b/recipes/linux/linux-2.6.35/rx1950/0002-s3c2410_udc-2440-dual-packet-workaround.patch
new file mode 100644
index 0000000..bd9a8b1
--- /dev/null
+++ b/recipes/linux/linux-2.6.35/rx1950/0002-s3c2410_udc-2440-dual-packet-workaround.patch
@@ -0,0 +1,71 @@
+From fc47d51f262ec6d0a4601fe37ac6478e30d68060 Mon Sep 17 00:00:00 2001
+From: Vasily Khoruzhick <anarsoul@gmail.com>
+Date: Thu, 24 Sep 2009 22:17:47 +0300
+Subject: [PATCH 02/20] s3c2410_udc: 2440 dual packet workaround
+
+This is a patch that seems to make the USB hangs on the S3C2440 go away.
+At least a good amount of ping torture didn't make them come back so far.
+
+The issue is that, if there are several back-to-back packets, sometimes no
+interrupt is generated for one of them. This seems to be caused by the
+mysterious dual packet mode, which the USB hardware enters automatically
+if the endpoint size is half that of the FIFO. (On the 2440, this is the
+normal situation for bulk data endpoints.)
+
+There is also a timing factor in this. I think what happens is that the USB
+hardware automatically sends an acknowledgement if there is only one packet
+in the FIFO (the FIFO has space for two). If another packet arrives before
+the host has retrieved and acknowledged the previous one, no interrupt is
+generated for that second one.
+
+However, there may be an indication. There is one undocumented bit (none
+of the 244x manuals document it), OUT_CRS1_REG[1], that seems to be set
+suspiciously often when this condition occurs. There is also
+CLR_DATA_TOGGLE, OUT_CRS1_REG[7], which may have a function related to
+this. (The Samsung manual is rather terse on that, as usual.)
+
+This needs to be examined further. For now, the patch seems to do the
+trick.
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+---
+ drivers/usb/gadget/s3c2410_udc.c |   16 +++++++++++++++-
+ 1 files changed, 15 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/usb/gadget/s3c2410_udc.c b/drivers/usb/gadget/s3c2410_udc.c
+index ea2b3c7..fed323c 100644
+--- a/drivers/usb/gadget/s3c2410_udc.c
++++ b/drivers/usb/gadget/s3c2410_udc.c
+@@ -902,7 +902,7 @@ static irqreturn_t s3c2410_udc_irq(int dummy, void *_dev)
+ 	int pwr_reg;
+ 	int ep0csr;
+ 	int i;
+-	u32 idx;
++	u32 idx, idx2;
+ 	unsigned long flags;
+ 
+ 	spin_lock_irqsave(&dev->lock, flags);
+@@ -1017,6 +1017,20 @@ static irqreturn_t s3c2410_udc_irq(int dummy, void *_dev)
+ 		}
+ 	}
+ 
++	/* what else causes this interrupt? a receive! who is it? */
++	if (!usb_status && !usbd_status && !pwr_reg && !ep0csr) {
++		for (i = 1; i < S3C2410_ENDPOINTS; i++) {
++			idx2 = udc_read(S3C2410_UDC_INDEX_REG);
++			udc_write(i, S3C2410_UDC_INDEX_REG);
++
++			if (udc_read(S3C2410_UDC_OUT_CSR1_REG) & 0x1)
++				s3c2410_udc_handle_ep(&dev->ep[i]);
++
++			/* restore index */
++			udc_write(idx2, S3C2410_UDC_INDEX_REG);
++		}
++	}
++
+ 	dprintk(DEBUG_VERBOSE, "irq: %d s3c2410_udc_done.\n", IRQ_USBD);
+ 
+ 	/* Restore old index */
+-- 
+1.7.2.2
+
diff --git a/recipes/linux/linux-2.6.35/rx1950/0003-rx1950-add-battery-device.patch b/recipes/linux/linux-2.6.35/rx1950/0003-rx1950-add-battery-device.patch
new file mode 100644
index 0000000..1a5eff4
--- /dev/null
+++ b/recipes/linux/linux-2.6.35/rx1950/0003-rx1950-add-battery-device.patch
@@ -0,0 +1,356 @@
+From 880fc865d99084c3ec697289d34eb12a0aa54103 Mon Sep 17 00:00:00 2001
+From: Vasily Khoruzhick <anarsoul@gmail.com>
+Date: Wed, 16 Jun 2010 23:16:08 +0300
+Subject: [PATCH 03/20] rx1950: add battery device
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+---
+ arch/arm/mach-s3c2440/mach-rx1950.c |  316 +++++++++++++++++++++++++++++++++++
+ 1 files changed, 316 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-s3c2440/mach-rx1950.c b/arch/arm/mach-s3c2440/mach-rx1950.c
+index 142d1f9..2bfa43a 100644
+--- a/arch/arm/mach-s3c2440/mach-rx1950.c
++++ b/arch/arm/mach-s3c2440/mach-rx1950.c
+@@ -25,8 +25,10 @@
+ #include <linux/input.h>
+ #include <linux/gpio_keys.h>
+ #include <linux/sysdev.h>
++#include <linux/pda_power.h>
+ #include <linux/pwm_backlight.h>
+ #include <linux/pwm.h>
++#include <linux/s3c_adc_battery.h>
+ 
+ #include <linux/mtd/mtd.h>
+ #include <linux/mtd/partitions.h>
+@@ -127,6 +129,318 @@ static struct s3c2410fb_display rx1950_display = {
+ 
+ };
+ 
++static int power_supply_init(struct device *dev)
++{
++	return gpio_request(S3C2410_GPF(2), "cable plugged");
++}
++
++static int rx1950_is_ac_online(void)
++{
++	return !gpio_get_value(S3C2410_GPF(2));
++}
++
++static void power_supply_exit(struct device *dev)
++{
++	gpio_free(S3C2410_GPF(2));
++}
++
++static char *rx1950_supplicants[] = {
++	"main-battery"
++};
++
++static struct pda_power_pdata power_supply_info = {
++	.init			= power_supply_init,
++	.is_ac_online		= rx1950_is_ac_online,
++	.exit			= power_supply_exit,
++	.supplied_to		= rx1950_supplicants,
++	.num_supplicants	= ARRAY_SIZE(rx1950_supplicants),
++};
++
++static struct resource power_supply_resources[] = {
++	[0] = {
++			.name	= "ac",
++			.flags	= IORESOURCE_IRQ | IORESOURCE_IRQ_LOWEDGE |
++					  IORESOURCE_IRQ_HIGHEDGE,
++			.start	= IRQ_EINT2,
++			.end	= IRQ_EINT2,
++	},
++};
++
++static struct platform_device power_supply = {
++	.name			= "pda-power",
++	.id			= -1,
++	.dev			= {
++					.platform_data =
++						&power_supply_info,
++	},
++	.resource		= power_supply_resources,
++	.num_resources		= ARRAY_SIZE(power_supply_resources),
++};
++
++static const struct s3c_adc_bat_thresh bat_lut_noac[] = {
++	{
++		.volt = 4100,
++		.cur = 156,
++		.level = 100
++	},
++	{
++		.volt = 4050,
++		.cur = 156,
++		.level = 95
++	},
++	{
++		.volt = 4025,
++		.cur = 141,
++		.level = 90
++	},
++	{
++		.volt = 3995,
++		.cur = 144,
++		.level = 85
++	},
++	{
++		.volt = 3957,
++		.cur = 162,
++		.level = 80
++	},
++	{
++		.volt = 3931,
++		.cur = 147,
++		.level = 75
++	},
++	{
++		.volt = 3902,
++		.cur = 147,
++		.level = 70
++	},
++	{
++		.volt = 3863,
++		.cur = 153,
++		.level = 65
++	},
++	{
++		.volt = 3838,
++		.cur = 150,
++		.level = 60
++	},
++	{
++		.volt = 3800,
++		.cur = 153,
++		.level = 55
++	},
++	{
++		.volt = 3765,
++		.cur = 153,
++		.level = 50
++	},
++	{
++		.volt = 3748,
++		.cur = 172,
++		.level = 45
++	},
++	{
++		.volt = 3740,
++		.cur = 153,
++		.level = 40
++	},
++	{
++		.volt = 3714,
++		.cur = 175,
++		.level = 35
++	},
++	{
++		.volt = 3710,
++		.cur = 156,
++		.level = 30
++	},
++	{
++		.volt = 3963,
++		.cur = 156,
++		.level = 25
++	},
++	{
++		.volt = 3672,
++		.cur = 178,
++		.level = 20
++	},
++	{
++		.volt = 3651,
++		.cur = 178,
++		.level = 15
++	},
++	{
++		.volt = 3629,
++		.cur = 178,
++		.level = 10
++	},
++	{
++		.volt = 3612,
++		.cur = 162,
++		.level = 5
++	},
++	{
++		.volt = 3605,
++		.cur = 162,
++		.level = 0
++	},
++};
++
++static const struct s3c_adc_bat_thresh bat_lut_acin[] = {
++	{
++		.volt = 4200,
++		.cur = 0,
++		.level = 100
++	},
++	{
++		.volt = 4190,
++		.cur = 0,
++		.level = 99
++	},
++	{
++		.volt = 4178,
++		.cur = 0,
++		.level = 95
++	},
++	{
++		.volt = 4110,
++		.cur = 0,
++		.level = 70
++	},
++	{
++		.volt = 4076,
++		.cur = 0,
++		.level = 65
++	},
++	{
++		.volt = 4046,
++		.cur = 0,
++		.level = 60
++	},
++	{
++		.volt = 4021,
++		.cur = 0,
++		.level = 55
++	},
++	{
++		.volt = 3999,
++		.cur = 0,
++		.level = 50
++	},
++	{
++		.volt = 3982,
++		.cur = 0,
++		.level = 45
++	},
++	{
++		.volt = 3965,
++		.cur = 0,
++		.level = 40
++	},
++	{
++		.volt = 3957,
++		.cur = 0,
++		.level = 35
++	},
++	{
++		.volt = 3948,
++		.cur = 0,
++		.level = 30
++	},
++	{
++		.volt = 3936,
++		.cur = 0,
++		.level = 25
++	},
++	{
++		.volt = 3927,
++		.cur = 0,
++		.level = 20
++	},
++	{
++		.volt = 3906,
++		.cur = 0,
++		.level = 15
++	},
++	{
++		.volt = 3880,
++		.cur = 0,
++		.level = 10
++	},
++	{
++		.volt = 3829,
++		.cur = 0,
++		.level = 5
++	},
++	{
++		.volt = 3820,
++		.cur = 0,
++		.level = 0
++	},
++};
++
++int rx1950_bat_init(void)
++{
++	int ret;
++
++	ret = gpio_request(S3C2410_GPJ(2), "rx1950-charger-enable-1");
++	if (ret)
++		goto err_gpio1;
++	ret = gpio_request(S3C2410_GPJ(3), "rx1950-charger-enable-2");
++	if (ret)
++		goto err_gpio2;
++
++	return 0;
++
++err_gpio2:
++	gpio_free(S3C2410_GPJ(2));
++err_gpio1:
++	return ret;
++}
++
++void rx1950_bat_exit(void)
++{
++	gpio_free(S3C2410_GPJ(2));
++	gpio_free(S3C2410_GPJ(3));
++}
++
++void rx1950_enable_charger(void)
++{
++	gpio_direction_output(S3C2410_GPJ(2), 1);
++	gpio_direction_output(S3C2410_GPJ(3), 1);
++}
++
++void rx1950_disable_charger(void)
++{
++	gpio_direction_output(S3C2410_GPJ(2), 0);
++	gpio_direction_output(S3C2410_GPJ(3), 0);
++}
++
++static struct s3c_adc_bat_pdata rx1950_bat_cfg = {
++	.init = rx1950_bat_init,
++	.exit = rx1950_bat_exit,
++	.enable_charger = rx1950_enable_charger,
++	.disable_charger = rx1950_disable_charger,
++	.gpio_charge_finished = S3C2410_GPF(3),
++	.lut_noac = bat_lut_noac,
++	.lut_noac_cnt = ARRAY_SIZE(bat_lut_noac),
++	.lut_acin = bat_lut_acin,
++	.lut_acin_cnt = ARRAY_SIZE(bat_lut_acin),
++	.volt_channel = 0,
++	.current_channel = 1,
++	.volt_mult = 4235,
++	.current_mult = 2900,
++	.internal_impedance = 200,
++};
++
++static struct platform_device rx1950_battery = {
++	.name             = "s3c-adc-battery",
++	.id               = -1,
++	.dev = {
++		.parent = &s3c_device_adc.dev,
++		.platform_data = &rx1950_bat_cfg,
++	},
++};
++
+ static struct s3c2410fb_mach_info rx1950_lcd_cfg = {
+ 	.displays = &rx1950_display,
+ 	.num_displays = 1,
+@@ -503,6 +817,8 @@ static struct platform_device *rx1950_devices[] __initdata = {
+ 	&s3c_device_timer[1],
+ 	&rx1950_backlight,
+ 	&rx1950_device_gpiokeys,
++	&power_supply,
++	&rx1950_battery,
+ };
+ 
+ static struct clk *rx1950_clocks[] __initdata = {
+-- 
+1.7.2.2
+
diff --git a/recipes/linux/linux-2.6.35/rx1950/0004-rx1950-add-LEDs-support.patch b/recipes/linux/linux-2.6.35/rx1950/0004-rx1950-add-LEDs-support.patch
new file mode 100644
index 0000000..36ac70f
--- /dev/null
+++ b/recipes/linux/linux-2.6.35/rx1950/0004-rx1950-add-LEDs-support.patch
@@ -0,0 +1,71 @@
+From 2133ac2c163fb3963eb2463b1482a525112ea6e1 Mon Sep 17 00:00:00 2001
+From: Vasily Khoruzhick <anarsoul@gmail.com>
+Date: Fri, 23 Jul 2010 17:06:47 +0300
+Subject: [PATCH 04/20] rx1950: add LEDs support
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+---
+ arch/arm/mach-s3c2440/mach-rx1950.c |   33 +++++++++++++++++++++++++++++++++
+ 1 files changed, 33 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-s3c2440/mach-rx1950.c b/arch/arm/mach-s3c2440/mach-rx1950.c
+index 2bfa43a..53180da 100644
+--- a/arch/arm/mach-s3c2440/mach-rx1950.c
++++ b/arch/arm/mach-s3c2440/mach-rx1950.c
+@@ -29,6 +29,7 @@
+ #include <linux/pwm_backlight.h>
+ #include <linux/pwm.h>
+ #include <linux/s3c_adc_battery.h>
++#include <linux/leds.h>
+ 
+ #include <linux/mtd/mtd.h>
+ #include <linux/mtd/partitions.h>
+@@ -415,6 +416,37 @@ void rx1950_disable_charger(void)
+ 	gpio_direction_output(S3C2410_GPJ(3), 0);
+ }
+ 
++static struct gpio_led rx1950_leds_desc[] = {
++	{
++		.name				= "Green",
++		.default_trigger	= "main-battery-charging-or-full",
++		.gpio				= S3C2410_GPA(6),
++	},
++	{
++		.name				= "Red",
++		.default_trigger	= "main-battery-full",
++		.gpio				= S3C2410_GPA(7),
++	},
++	{
++		.name				= "Blue",
++		.default_trigger	= "rx1950-acx-mem",
++		.gpio				= S3C2410_GPA(11),
++	},
++};
++
++static struct gpio_led_platform_data rx1950_leds_pdata = {
++	.num_leds	= ARRAY_SIZE(rx1950_leds_desc),
++	.leds		= rx1950_leds_desc,
++};
++
++static struct platform_device rx1950_leds = {
++	.name	= "leds-gpio",
++	.id		= -1,
++	.dev	= {
++				.platform_data = &rx1950_leds_pdata,
++	},
++};
++
+ static struct s3c_adc_bat_pdata rx1950_bat_cfg = {
+ 	.init = rx1950_bat_init,
+ 	.exit = rx1950_bat_exit,
+@@ -819,6 +851,7 @@ static struct platform_device *rx1950_devices[] __initdata = {
+ 	&rx1950_device_gpiokeys,
+ 	&power_supply,
+ 	&rx1950_battery,
++	&rx1950_leds,
+ };
+ 
+ static struct clk *rx1950_clocks[] __initdata = {
+-- 
+1.7.2.2
+
diff --git a/recipes/linux/linux-2.6.35/rx1950/0005-s3c24xx-DMA-don-t-use-autoreload-feature.patch b/recipes/linux/linux-2.6.35/rx1950/0005-s3c24xx-DMA-don-t-use-autoreload-feature.patch
new file mode 100644
index 0000000..ea2208e
--- /dev/null
+++ b/recipes/linux/linux-2.6.35/rx1950/0005-s3c24xx-DMA-don-t-use-autoreload-feature.patch
@@ -0,0 +1,701 @@
+From 3f78c6a448e380c40c6cc9dff2b7175be8fc2b9a Mon Sep 17 00:00:00 2001
+From: Vasily Khoruzhick <anarsoul@gmail.com>
+Date: Thu, 12 Aug 2010 21:32:25 +0300
+Subject: [PATCH 05/20] s3c24xx: DMA: don't use autoreload feature
+
+Some integrated DMA-capable hardware doesn't like autoreload
+feature of s3c24xx DMA-engine, that's why s3cmci driver
+didn't work with DMA transfers enabled.
+
+I rewrote DMA driver not to use autoreload feature and removed
+all pre-loading features. Buffer re-load is fast enought to perform
+it in IRQ handler, and anyway I don't see any reason to waste CPU
+cycles on waiting for buffer load. Driver is much simplier now,
+it was tested with s3cmci and s3c24xx-i2s drivers on s3c2442 and
+s3c2410 SoCs and works just nice.
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+---
+ arch/arm/mach-s3c2410/include/mach/dma.h |   17 +-
+ arch/arm/plat-s3c24xx/dma.c              |  442 +++++-------------------------
+ 2 files changed, 75 insertions(+), 384 deletions(-)
+
+diff --git a/arch/arm/mach-s3c2410/include/mach/dma.h b/arch/arm/mach-s3c2410/include/mach/dma.h
+index cf68136..1cbeff2 100644
+--- a/arch/arm/mach-s3c2410/include/mach/dma.h
++++ b/arch/arm/mach-s3c2410/include/mach/dma.h
+@@ -79,28 +79,15 @@ enum s3c2410_dma_state {
+  *
+  * There are no buffers loaded (the channel should be inactive)
+  *
+- * S3C2410_DMA_1LOADED
+- *
+- * There is one buffer loaded, however it has not been confirmed to be
+- * loaded by the DMA engine. This may be because the channel is not
+- * yet running, or the DMA driver decided that it was too costly to
+- * sit and wait for it to happen.
+- *
+  * S3C2410_DMA_1RUNNING
+  *
+- * The buffer has been confirmed running, and not finisged
+- *
+- * S3C2410_DMA_1LOADED_1RUNNING
++ * The buffer has been confirmed running, and not finished
+  *
+- * There is a buffer waiting to be loaded by the DMA engine, and one
+- * currently running.
+ */
+ 
+ enum s3c2410_dma_loadst {
+ 	S3C2410_DMALOAD_NONE,
+-	S3C2410_DMALOAD_1LOADED,
+ 	S3C2410_DMALOAD_1RUNNING,
+-	S3C2410_DMALOAD_1LOADED_1RUNNING,
+ };
+ 
+ 
+@@ -129,6 +116,7 @@ struct s3c2410_dma_buf {
+ 	dma_addr_t		 data;		/* start of DMA data */
+ 	dma_addr_t		 ptr;		/* where the DMA got to [1] */
+ 	void			*id;		/* client's id */
++	unsigned int		timestamp;
+ };
+ 
+ /* [1] is this updated for both recv/send modes? */
+@@ -189,6 +177,7 @@ struct s3c2410_dma_chan {
+ 	struct s3c2410_dma_buf	*curr;		/* current dma buffer */
+ 	struct s3c2410_dma_buf	*next;		/* next buffer to load */
+ 	struct s3c2410_dma_buf	*end;		/* end of queue */
++	spinlock_t				queue_lock;
+ 
+ 	/* system device */
+ 	struct sys_device	dev;
+diff --git a/arch/arm/plat-s3c24xx/dma.c b/arch/arm/plat-s3c24xx/dma.c
+index 6ad274e..5ed045b 100644
+--- a/arch/arm/plat-s3c24xx/dma.c
++++ b/arch/arm/plat-s3c24xx/dma.c
+@@ -133,70 +133,6 @@ dmadbg_showregs(const char *fname, int line, struct s3c2410_dma_chan *chan)
+ #define dbg_showchan(chan) do { } while(0)
+ #endif /* CONFIG_S3C2410_DMA_DEBUG */
+ 
+-/* s3c2410_dma_stats_timeout
+- *
+- * Update DMA stats from timeout info
+-*/
+-
+-static void
+-s3c2410_dma_stats_timeout(struct s3c2410_dma_stats *stats, int val)
+-{
+-	if (stats == NULL)
+-		return;
+-
+-	if (val > stats->timeout_longest)
+-		stats->timeout_longest = val;
+-	if (val < stats->timeout_shortest)
+-		stats->timeout_shortest = val;
+-
+-	stats->timeout_avg += val;
+-}
+-
+-/* s3c2410_dma_waitforload
+- *
+- * wait for the DMA engine to load a buffer, and update the state accordingly
+-*/
+-
+-static int
+-s3c2410_dma_waitforload(struct s3c2410_dma_chan *chan, int line)
+-{
+-	int timeout = chan->load_timeout;
+-	int took;
+-
+-	if (chan->load_state != S3C2410_DMALOAD_1LOADED) {
+-		printk(KERN_ERR "dma%d: s3c2410_dma_waitforload() called in loadstate %d from line %d\n", chan->number, chan->load_state, line);
+-		return 0;
+-	}
+-
+-	if (chan->stats != NULL)
+-		chan->stats->loads++;
+-
+-	while (--timeout > 0) {
+-		if ((dma_rdreg(chan, S3C2410_DMA_DSTAT) << (32-20)) != 0) {
+-			took = chan->load_timeout - timeout;
+-
+-			s3c2410_dma_stats_timeout(chan->stats, took);
+-
+-			switch (chan->load_state) {
+-			case S3C2410_DMALOAD_1LOADED:
+-				chan->load_state = S3C2410_DMALOAD_1RUNNING;
+-				break;
+-
+-			default:
+-				printk(KERN_ERR "dma%d: unknown load_state in s3c2410_dma_waitforload() %d\n", chan->number, chan->load_state);
+-			}
+-
+-			return 1;
+-		}
+-	}
+-
+-	if (chan->stats != NULL) {
+-		chan->stats->timeout_failed++;
+-	}
+-
+-	return 0;
+-}
+-
+ /* s3c2410_dma_loadbuffer
+  *
+  * load a buffer, and update the channel state
+@@ -206,66 +142,35 @@ static inline int
+ s3c2410_dma_loadbuffer(struct s3c2410_dma_chan *chan,
+ 		       struct s3c2410_dma_buf *buf)
+ {
+-	unsigned long reload;
+-
+ 	if (buf == NULL) {
+ 		dmawarn("buffer is NULL\n");
+ 		return -EINVAL;
+ 	}
+ 
+-	pr_debug("s3c2410_chan_loadbuffer: loading buff %p (0x%08lx,0x%06x)\n",
++	pr_debug("%s: loading buff %p (0x%08lx,0x%06x)\n", __func__,
+ 		 buf, (unsigned long)buf->data, buf->size);
+ 
+ 	/* check the state of the channel before we do anything */
+ 
+-	if (chan->load_state == S3C2410_DMALOAD_1LOADED) {
+-		dmawarn("load_state is S3C2410_DMALOAD_1LOADED\n");
+-	}
+-
+-	if (chan->load_state == S3C2410_DMALOAD_1LOADED_1RUNNING) {
+-		dmawarn("state is S3C2410_DMALOAD_1LOADED_1RUNNING\n");
+-	}
++	if (chan->load_state != S3C2410_DMALOAD_NONE)
++		printk(KERN_ERR "dma%d: channel already has buffer loaded\n",
++			   chan->number);
+ 
+-	/* it would seem sensible if we are the last buffer to not bother
+-	 * with the auto-reload bit, so that the DMA engine will not try
+-	 * and load another transfer after this one has finished...
+-	 */
+-	if (chan->load_state == S3C2410_DMALOAD_NONE) {
+-		pr_debug("load_state is none, checking for noreload (next=%p)\n",
+-			 buf->next);
+-		reload = (buf->next == NULL) ? S3C2410_DCON_NORELOAD : 0;
+-	} else {
+-		//pr_debug("load_state is %d => autoreload\n", chan->load_state);
+-		reload = S3C2410_DCON_AUTORELOAD;
+-	}
+-
+-	if ((buf->data & 0xf0000000) != 0x30000000) {
++	if ((buf->data & 0xf0000000) != 0x30000000)
+ 		dmawarn("dmaload: buffer is %p\n", (void *)buf->data);
+-	}
+ 
+ 	writel(buf->data, chan->addr_reg);
+ 
+ 	dma_wrreg(chan, S3C2410_DMA_DCON,
+-		  chan->dcon | reload | (buf->size/chan->xfer_unit));
++		  chan->dcon | S3C2410_DCON_NORELOAD |
++		  (buf->size/chan->xfer_unit));
+ 
+-	chan->next = buf->next;
++	chan->curr = buf;
+ 
+ 	/* update the state of the channel */
++	chan->load_state = S3C2410_DMALOAD_1RUNNING;
+ 
+-	switch (chan->load_state) {
+-	case S3C2410_DMALOAD_NONE:
+-		chan->load_state = S3C2410_DMALOAD_1LOADED;
+-		break;
+-
+-	case S3C2410_DMALOAD_1RUNNING:
+-		chan->load_state = S3C2410_DMALOAD_1LOADED_1RUNNING;
+-		break;
+-
+-	default:
+-		dmawarn("dmaload: unknown state %d in loadbuffer\n",
+-			chan->load_state);
+-		break;
+-	}
++	buf->timestamp = jiffies;
+ 
+ 	return 0;
+ }
+@@ -345,7 +250,6 @@ static int s3c2410_dma_start(struct s3c2410_dma_chan *chan)
+ 	dbg_showchan(chan);
+ 
+ 	/* enable the channel */
+-
+ 	if (!chan->irq_enabled) {
+ 		enable_irq(chan->irq);
+ 		chan->irq_enabled = 1;
+@@ -360,14 +264,6 @@ static int s3c2410_dma_start(struct s3c2410_dma_chan *chan)
+ 
+ 	pr_debug("dma%d: %08lx to DMASKTRIG\n", chan->number, tmp);
+ 
+-#if 0
+-	/* the dma buffer loads should take care of clearing the AUTO
+-	 * reloading feature */
+-	tmp = dma_rdreg(chan, S3C2410_DMA_DCON);
+-	tmp &= ~S3C2410_DCON_NORELOAD;
+-	dma_wrreg(chan, S3C2410_DMA_DCON, tmp);
+-#endif
+-
+ 	s3c2410_dma_call_op(chan, S3C2410_DMAOP_START);
+ 
+ 	dbg_showchan(chan);
+@@ -377,43 +273,11 @@ static int s3c2410_dma_start(struct s3c2410_dma_chan *chan)
+ 	 * the first buffer is finished, the new one will be loaded onto
+ 	 * the channel */
+ 
+-	if (chan->next != NULL) {
+-		if (chan->load_state == S3C2410_DMALOAD_1LOADED) {
+-
+-			if (s3c2410_dma_waitforload(chan, __LINE__) == 0) {
+-				pr_debug("%s: buff not yet loaded, no more todo\n",
+-					 __func__);
+-			} else {
+-				chan->load_state = S3C2410_DMALOAD_1RUNNING;
+-				s3c2410_dma_loadbuffer(chan, chan->next);
+-			}
+-
+-		} else if (chan->load_state == S3C2410_DMALOAD_1RUNNING) {
+-			s3c2410_dma_loadbuffer(chan, chan->next);
+-		}
+-	}
+-
+-
+ 	local_irq_restore(flags);
+ 
+ 	return 0;
+ }
+ 
+-/* s3c2410_dma_canload
+- *
+- * work out if we can queue another buffer into the DMA engine
+-*/
+-
+-static int
+-s3c2410_dma_canload(struct s3c2410_dma_chan *chan)
+-{
+-	if (chan->load_state == S3C2410_DMALOAD_NONE ||
+-	    chan->load_state == S3C2410_DMALOAD_1RUNNING)
+-		return 1;
+-
+-	return 0;
+-}
+-
+ /* s3c2410_dma_enqueue
+  *
+  * queue an given buffer for dma transfer.
+@@ -462,47 +326,19 @@ int s3c2410_dma_enqueue(unsigned int channel, void *id,
+ 
+ 	local_irq_save(flags);
+ 
+-	if (chan->curr == NULL) {
+-		/* we've got nothing loaded... */
+-		pr_debug("%s: buffer %p queued onto empty channel\n",
+-			 __func__, buf);
+-
+-		chan->curr = buf;
+-		chan->end  = buf;
+-		chan->next = NULL;
++	if (chan->end == NULL) {
++		pr_debug("dma%d: queued buffer onto empty channel\n",
++			chan->number);
++		chan->next = buf;
++		chan->end = buf;
+ 	} else {
+-		pr_debug("dma%d: %s: buffer %p queued onto non-empty channel\n",
+-			 chan->number, __func__, buf);
+-
+-		if (chan->end == NULL)
+-			pr_debug("dma%d: %s: %p not empty, and chan->end==NULL?\n",
+-				 chan->number, __func__, chan);
+-
++		pr_debug("dma%d: queued buffer onto non-empty channel\n",
++			chan->number);
+ 		chan->end->next = buf;
+ 		chan->end = buf;
+ 	}
+ 
+-	/* if necessary, update the next buffer field */
+-	if (chan->next == NULL)
+-		chan->next = buf;
+-
+-	/* check to see if we can load a buffer */
+-	if (chan->state == S3C2410_DMA_RUNNING) {
+-		if (chan->load_state == S3C2410_DMALOAD_1LOADED && 1) {
+-			if (s3c2410_dma_waitforload(chan, __LINE__) == 0) {
+-				printk(KERN_ERR "dma%d: loadbuffer:"
+-				       "timeout loading buffer\n",
+-				       chan->number);
+-				dbg_showchan(chan);
+-				local_irq_restore(flags);
+-				return -EINVAL;
+-			}
+-		}
+-
+-		while (s3c2410_dma_canload(chan) && chan->next != NULL) {
+-			s3c2410_dma_loadbuffer(chan, chan->next);
+-		}
+-	} else if (chan->state == S3C2410_DMA_IDLE) {
++	if (chan->state == S3C2410_DMA_IDLE) {
+ 		if (chan->flags & S3C2410_DMAF_AUTOSTART) {
+ 			s3c2410_dma_ctrl(chan->number | DMACH_LOW_LEVEL,
+ 					 S3C2410_DMAOP_START);
+@@ -529,51 +365,6 @@ s3c2410_dma_freebuf(struct s3c2410_dma_buf *buf)
+ 	}
+ }
+ 
+-/* s3c2410_dma_lastxfer
+- *
+- * called when the system is out of buffers, to ensure that the channel
+- * is prepared for shutdown.
+-*/
+-
+-static inline void
+-s3c2410_dma_lastxfer(struct s3c2410_dma_chan *chan)
+-{
+-#if 0
+-	pr_debug("dma%d: s3c2410_dma_lastxfer: load_state %d\n",
+-		 chan->number, chan->load_state);
+-#endif
+-
+-	switch (chan->load_state) {
+-	case S3C2410_DMALOAD_NONE:
+-		break;
+-
+-	case S3C2410_DMALOAD_1LOADED:
+-		if (s3c2410_dma_waitforload(chan, __LINE__) == 0) {
+-				/* flag error? */
+-			printk(KERN_ERR "dma%d: timeout waiting for load (%s)\n",
+-			       chan->number, __func__);
+-			return;
+-		}
+-		break;
+-
+-	case S3C2410_DMALOAD_1LOADED_1RUNNING:
+-		/* I belive in this case we do not have anything to do
+-		 * until the next buffer comes along, and we turn off the
+-		 * reload */
+-		return;
+-
+-	default:
+-		pr_debug("dma%d: lastxfer: unhandled load_state %d with no next\n",
+-			 chan->number, chan->load_state);
+-		return;
+-
+-	}
+-
+-	/* hopefully this'll shut the damned thing up after the transfer... */
+-	dma_wrreg(chan, S3C2410_DMA_DCON, chan->dcon | S3C2410_DCON_NORELOAD);
+-}
+-
+-
+ #define dmadbg2(x...)
+ 
+ static irqreturn_t
+@@ -582,57 +373,25 @@ s3c2410_dma_irq(int irq, void *devpw)
+ 	struct s3c2410_dma_chan *chan = (struct s3c2410_dma_chan *)devpw;
+ 	struct s3c2410_dma_buf  *buf;
+ 
++	/* Check for orphaned irq */
++	if (chan->state == S3C2410_DMA_IDLE)
++		return IRQ_HANDLED;
++
+ 	buf = chan->curr;
+ 
+ 	dbg_showchan(chan);
+ 
+ 	/* modify the channel state */
+ 
+-	switch (chan->load_state) {
+-	case S3C2410_DMALOAD_1RUNNING:
+-		/* TODO - if we are running only one buffer, we probably
+-		 * want to reload here, and then worry about the buffer
+-		 * callback */
+-
+-		chan->load_state = S3C2410_DMALOAD_NONE;
+-		break;
+-
+-	case S3C2410_DMALOAD_1LOADED:
+-		/* iirc, we should go back to NONE loaded here, we
+-		 * had a buffer, and it was never verified as being
+-		 * loaded.
+-		 */
+-
++	if (chan->load_state == S3C2410_DMALOAD_1RUNNING)
+ 		chan->load_state = S3C2410_DMALOAD_NONE;
+-		break;
+-
+-	case S3C2410_DMALOAD_1LOADED_1RUNNING:
+-		/* we'll worry about checking to see if another buffer is
+-		 * ready after we've called back the owner. This should
+-		 * ensure we do not wait around too long for the DMA
+-		 * engine to start the next transfer
+-		 */
+-
+-		chan->load_state = S3C2410_DMALOAD_1LOADED;
+-		break;
+-
+-	case S3C2410_DMALOAD_NONE:
++	else
+ 		printk(KERN_ERR "dma%d: IRQ with no loaded buffer?\n",
+-		       chan->number);
+-		break;
+-
+-	default:
+-		printk(KERN_ERR "dma%d: IRQ in invalid load_state %d\n",
+-		       chan->number, chan->load_state);
+-		break;
+-	}
++			chan->number);
+ 
+ 	if (buf != NULL) {
+-		/* update the chain to make sure that if we load any more
+-		 * buffers when we call the callback function, things should
+-		 * work properly */
+-
+-		chan->curr = buf->next;
++		chan->curr = NULL;
++		chan->next = buf->next;
+ 		buf->next  = NULL;
+ 
+ 		if (buf->magic != BUF_MAGIC) {
+@@ -640,12 +399,14 @@ s3c2410_dma_irq(int irq, void *devpw)
+ 			       chan->number, __func__, buf);
+ 			return IRQ_HANDLED;
+ 		}
+-
++		pr_debug("dma%d: transfer of size %d took %u ms\n",
++			chan->number,
++			buf->size,
++			jiffies_to_msecs(jiffies - buf->timestamp));
+ 		s3c2410_dma_buffdone(chan, buf, S3C2410_RES_OK);
+ 
+ 		/* free resouces */
+ 		s3c2410_dma_freebuf(buf);
+-	} else {
+ 	}
+ 
+ 	/* only reload if the channel is still running... our buffer done
+@@ -655,53 +416,36 @@ s3c2410_dma_irq(int irq, void *devpw)
+ 	/* todo: check that when the channel is shut-down from inside this
+ 	 * function, we cope with unsetting reload, etc */
+ 
+-	if (chan->next != NULL && chan->state != S3C2410_DMA_IDLE) {
+-		unsigned long flags;
+-
+-		switch (chan->load_state) {
+-		case S3C2410_DMALOAD_1RUNNING:
+-			/* don't need to do anything for this state */
+-			break;
+-
+-		case S3C2410_DMALOAD_NONE:
+-			/* can load buffer immediately */
+-			break;
+-
+-		case S3C2410_DMALOAD_1LOADED:
+-			if (s3c2410_dma_waitforload(chan, __LINE__) == 0) {
+-				/* flag error? */
+-				printk(KERN_ERR "dma%d: timeout waiting for load (%s)\n",
+-				       chan->number, __func__);
+-				return IRQ_HANDLED;
+-			}
+-
+-			break;
+-
+-		case S3C2410_DMALOAD_1LOADED_1RUNNING:
+-			goto no_load;
+-
+-		default:
+-			printk(KERN_ERR "dma%d: unknown load_state in irq, %d\n",
+-			       chan->number, chan->load_state);
+-			return IRQ_HANDLED;
+-		}
++	if (chan->next != NULL) {
++		if (chan->state != S3C2410_DMA_IDLE) {
++			unsigned long flags;
++			unsigned long tmp;
+ 
+-		local_irq_save(flags);
+-		s3c2410_dma_loadbuffer(chan, chan->next);
+-		local_irq_restore(flags);
++			pr_debug("%s: dma%d: continuing with next buffer\n",
++				__func__, chan->number);
++			local_irq_save(flags);
++			s3c2410_dma_loadbuffer(chan, chan->next);
++			tmp = dma_rdreg(chan, S3C2410_DMA_DMASKTRIG);
++			tmp &= ~S3C2410_DMASKTRIG_STOP;
++			tmp |= S3C2410_DMASKTRIG_ON;
++			dma_wrreg(chan, S3C2410_DMA_DMASKTRIG, tmp);
++			local_irq_restore(flags);
++		} else
++			pr_debug("dma%d: buffdone callback stopped dma...\n",
++				chan->number);
+ 	} else {
+-		s3c2410_dma_lastxfer(chan);
++		/* No more buffers? So no queue */
++		chan->end = NULL;
+ 
+ 		/* see if we can stop this channel.. */
+-		if (chan->load_state == S3C2410_DMALOAD_NONE) {
+-			pr_debug("dma%d: end of transfer, stopping channel (%ld)\n",
++		if (chan->state != S3C2410_DMA_IDLE) {
++			pr_debug("dma%d: end of transfer, stopping channel (%lu)\n",
+ 				 chan->number, jiffies);
+ 			s3c2410_dma_ctrl(chan->number | DMACH_LOW_LEVEL,
+ 					 S3C2410_DMAOP_STOP);
+ 		}
+ 	}
+ 
+- no_load:
+ 	return IRQ_HANDLED;
+ }
+ 
+@@ -840,9 +584,20 @@ static int s3c2410_dma_dostop(struct s3c2410_dma_chan *chan)
+ 	s3c2410_dma_call_op(chan,  S3C2410_DMAOP_STOP);
+ 
+ 	tmp = dma_rdreg(chan, S3C2410_DMA_DMASKTRIG);
+-	tmp |= S3C2410_DMASKTRIG_STOP;
+-	//tmp &= ~S3C2410_DMASKTRIG_ON;
+-	dma_wrreg(chan, S3C2410_DMA_DMASKTRIG, tmp);
++	if (tmp & S3C2410_DMASKTRIG_ON) {
++		int retries = 1000;
++		tmp |= S3C2410_DMASKTRIG_STOP;
++		dma_wrreg(chan, S3C2410_DMA_DMASKTRIG, tmp);
++
++		while (--retries) {
++			tmp = dma_rdreg(chan, S3C2410_DMA_DMASKTRIG);
++			if (!(tmp & S3C2410_DMASKTRIG_ON))
++				break;
++		}
++
++		if (!retries)
++			pr_debug("dma%d: failed to stop??\n", chan->number);
++	}
+ 
+ #if 0
+ 	/* should also clear interrupts, according to WinCE BSP */
+@@ -860,22 +615,6 @@ static int s3c2410_dma_dostop(struct s3c2410_dma_chan *chan)
+ 	return 0;
+ }
+ 
+-static void s3c2410_dma_waitforstop(struct s3c2410_dma_chan *chan)
+-{
+-	unsigned long tmp;
+-	unsigned int timeout = 0x10000;
+-
+-	while (timeout-- > 0) {
+-		tmp = dma_rdreg(chan, S3C2410_DMA_DMASKTRIG);
+-
+-		if (!(tmp & S3C2410_DMASKTRIG_ON))
+-			return;
+-	}
+-
+-	pr_debug("dma%d: failed to stop?\n", chan->number);
+-}
+-
+-
+ /* s3c2410_dma_flush
+  *
+  * stop the channel, and remove all current and pending transfers
+@@ -917,8 +656,6 @@ static int s3c2410_dma_flush(struct s3c2410_dma_chan *chan)
+ 
+ 	dbg_showregs(chan);
+ 
+-	s3c2410_dma_waitforstop(chan);
+-
+ #if 0
+ 	/* should also clear interrupts, according to WinCE BSP */
+ 	{
+@@ -939,38 +676,8 @@ static int s3c2410_dma_flush(struct s3c2410_dma_chan *chan)
+ 
+ static int s3c2410_dma_started(struct s3c2410_dma_chan *chan)
+ {
+-	unsigned long flags;
+-
+-	local_irq_save(flags);
+-
+-	dbg_showchan(chan);
+-
+-	/* if we've only loaded one buffer onto the channel, then chec
+-	 * to see if we have another, and if so, try and load it so when
+-	 * the first buffer is finished, the new one will be loaded onto
+-	 * the channel */
+-
+-	if (chan->next != NULL) {
+-		if (chan->load_state == S3C2410_DMALOAD_1LOADED) {
+-
+-			if (s3c2410_dma_waitforload(chan, __LINE__) == 0) {
+-				pr_debug("%s: buff not yet loaded, no more todo\n",
+-					 __func__);
+-			} else {
+-				chan->load_state = S3C2410_DMALOAD_1RUNNING;
+-				s3c2410_dma_loadbuffer(chan, chan->next);
+-			}
+-
+-		} else if (chan->load_state == S3C2410_DMALOAD_1RUNNING) {
+-			s3c2410_dma_loadbuffer(chan, chan->next);
+-		}
+-	}
+-
+-
+-	local_irq_restore(flags);
+-
++	/* Do nothing */
+ 	return 0;
+-
+ }
+ 
+ int
+@@ -1045,16 +752,12 @@ int s3c2410_dma_config(unsigned int channel,
+ 	case DMACH_PCM_IN:
+ 	case DMACH_PCM_OUT:
+ 	case DMACH_MIC_IN:
++	case DMACH_SDI:
+ 	default:
+ 		dcon |= S3C2410_DCON_HANDSHAKE;
+ 		dcon |= S3C2410_DCON_SYNC_PCLK;
+ 		break;
+ 
+-	case DMACH_SDI:
+-		/* note, ensure if need HANDSHAKE or not */
+-		dcon |= S3C2410_DCON_SYNC_PCLK;
+-		break;
+-
+ 	case DMACH_XD0:
+ 	case DMACH_XD1:
+ 		dcon |= S3C2410_DCON_HANDSHAKE;
+@@ -1231,21 +934,20 @@ static int s3c2410_dma_resume(struct sys_device *dev)
+ 	struct s3c2410_dma_chan *cp = to_dma_chan(dev);
+ 	unsigned int no = cp->number | DMACH_LOW_LEVEL;
+ 
+-	/* restore channel's hardware configuration */
+ 
+ 	if (!cp->in_use)
+ 		return 0;
+ 
+-	printk(KERN_INFO "dma%d: restoring configuration\n", cp->number);
+-
+-	s3c2410_dma_config(no, cp->xfer_unit);
+-	s3c2410_dma_devconfig(no, cp->source, cp->dev_addr);
+ 
+ 	/* re-select the dma source for this channel */
+-
+ 	if (cp->map != NULL)
+ 		dma_sel.select(cp, cp->map);
+ 
++	/* restore channel's hardware configuration */
++	printk(KERN_INFO "dma%d: restoring configuration\n", cp->number);
++	s3c2410_dma_config(no, cp->xfer_unit);
++	s3c2410_dma_devconfig(no, cp->source, cp->dev_addr);
++
+ 	return 0;
+ }
+ 
+-- 
+1.7.2.2
+
diff --git a/recipes/linux/linux-2.6.35/rx1950/0006-s3cmci-minor-fixups.patch b/recipes/linux/linux-2.6.35/rx1950/0006-s3cmci-minor-fixups.patch
new file mode 100644
index 0000000..dde1d77
--- /dev/null
+++ b/recipes/linux/linux-2.6.35/rx1950/0006-s3cmci-minor-fixups.patch
@@ -0,0 +1,40 @@
+From 6c2fec9c2f1888fc177c29a37a3032f8144d2003 Mon Sep 17 00:00:00 2001
+From: Vasily Khoruzhick <anarsoul@gmail.com>
+Date: Fri, 13 Aug 2010 20:01:53 +0300
+Subject: [PATCH 06/20] s3cmci: minor fixups
+
+- It's not necessary to start DMA op manually, as we have
+autostart feature enabled
+- Restore prescaler before DMA operation, otherwise it
+takes ages to complete DMA op.
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+---
+ drivers/mmc/host/s3cmci.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/mmc/host/s3cmci.c b/drivers/mmc/host/s3cmci.c
+index 2e16e0a..5d1a8ed 100644
+--- a/drivers/mmc/host/s3cmci.c
++++ b/drivers/mmc/host/s3cmci.c
+@@ -1106,6 +1106,8 @@ static int s3cmci_prepare_dma(struct s3cmci_host *host, struct mmc_data *data)
+ 		    sg_dma_address(&data->sg[i]),
+ 		    sg_dma_len(&data->sg[i]));
+ 
++		/* Restore prescaler value */
++		writel(host->prescaler, host->base + S3C2410_SDIPRE);
+ 		res = s3c2410_dma_enqueue(host->dma, host,
+ 					  sg_dma_address(&data->sg[i]),
+ 					  sg_dma_len(&data->sg[i]));
+@@ -1116,8 +1118,6 @@ static int s3cmci_prepare_dma(struct s3cmci_host *host, struct mmc_data *data)
+ 		}
+ 	}
+ 
+-	s3c2410_dma_ctrl(host->dma, S3C2410_DMAOP_START);
+-
+ 	return 0;
+ }
+ 
+-- 
+1.7.2.2
+
diff --git a/recipes/linux/linux-2.6.35/rx1950/0007-Add-s3c-adc-battery-driver.patch b/recipes/linux/linux-2.6.35/rx1950/0007-Add-s3c-adc-battery-driver.patch
new file mode 100644
index 0000000..f0b763a
--- /dev/null
+++ b/recipes/linux/linux-2.6.35/rx1950/0007-Add-s3c-adc-battery-driver.patch
@@ -0,0 +1,530 @@
+From 874bc0df0eeddae98517190375e9e5697826f1a9 Mon Sep 17 00:00:00 2001
+From: Vasily Khoruzhick <anarsoul@gmail.com>
+Date: Wed, 16 Jun 2010 22:35:52 +0300
+Subject: [PATCH v5 3/4] Add s3c-adc-battery driver
+
+s3c-adc-battery is driver for monitoring
+and charging battery on iPAQ H1930/H1940/RX1950.
+It depends on s3c-adc driver to get battery voltage and current.
+
+Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
+---
+ drivers/power/Kconfig           |    6 +
+ drivers/power/Makefile          |    1 +
+ drivers/power/s3c_adc_battery.c |  433 +++++++++++++++++++++++++++++++++++++++
+ include/linux/s3c_adc_battery.h |   36 ++++
+ 4 files changed, 476 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/power/s3c_adc_battery.c
+ create mode 100644 include/linux/s3c_adc_battery.h
+
+diff --git a/drivers/power/Kconfig b/drivers/power/Kconfig
+index 8e9ba17..645baa5 100644
+--- a/drivers/power/Kconfig
++++ b/drivers/power/Kconfig
+@@ -136,6 +136,12 @@ config BATTERY_Z2
+ 	help
+ 	  Say Y to include support for the battery on the Zipit Z2.
+ 
++config BATTERY_S3C_ADC
++	tristate "Battery driver for Samsung ADC based monitoring"
++	depends on S3C_ADC
++	help
++	  Say Y here to enable support for iPAQ h1930/h1940/rx1950 battery
++
+ config CHARGER_PCF50633
+ 	tristate "NXP PCF50633 MBC"
+ 	depends on MFD_PCF50633
+diff --git a/drivers/power/Makefile b/drivers/power/Makefile
+index 0005080..166bcbf 100644
+--- a/drivers/power/Makefile
++++ b/drivers/power/Makefile
+@@ -33,4 +33,5 @@ obj-$(CONFIG_BATTERY_BQ27x00)	+= bq27x00_battery.o
+ obj-$(CONFIG_BATTERY_DA9030)	+= da9030_battery.o
+ obj-$(CONFIG_BATTERY_MAX17040)	+= max17040_battery.o
+ obj-$(CONFIG_BATTERY_Z2)	+= z2_battery.o
++obj-$(CONFIG_BATTERY_S3C_ADC)	+= s3c_adc_battery.o
+ obj-$(CONFIG_CHARGER_PCF50633)	+= pcf50633-charger.o
+diff --git a/drivers/power/s3c_adc_battery.c b/drivers/power/s3c_adc_battery.c
+new file mode 100644
+index 0000000..d7a0771
+--- /dev/null
++++ b/drivers/power/s3c_adc_battery.c
+@@ -0,0 +1,433 @@
++/*
++ *	iPAQ h1930/h1940/rx1950 battery controler driver
++ *	Copyright (c) Vasily Khoruzhick
++ *	Based on h1940_battery.c by Arnaud Patard
++ *
++ * This file is subject to the terms and conditions of the GNU General Public
++ * License.  See the file COPYING in the main directory of this archive for
++ * more details.
++ *
++ */
++
++#include <linux/interrupt.h>
++#include <linux/platform_device.h>
++#include <linux/power_supply.h>
++#include <linux/leds.h>
++#include <linux/gpio.h>
++#include <linux/err.h>
++#include <linux/timer.h>
++#include <linux/jiffies.h>
++#include <linux/s3c_adc_battery.h>
++#include <linux/errno.h>
++#include <linux/init.h>
++
++#include <plat/adc.h>
++
++#define BAT_POLL_INTERVAL			10000 /* ms */
++#define JITTER_DELAY				500 /* ms */
++
++struct s3c_adc_bat {
++	struct power_supply			psy;
++	struct s3c_adc_client		*client;
++	struct s3c_adc_bat_pdata	*pdata;
++	int							volt_value;
++	int							cur_value;
++	unsigned int				timestamp;
++	int							level;
++	int							status;
++	int							cable_plugged:1;
++};
++
++static struct delayed_work bat_work;
++
++static void s3c_adc_bat_ext_power_changed(struct power_supply *psy)
++{
++	schedule_delayed_work(&bat_work,
++		msecs_to_jiffies(JITTER_DELAY));
++}
++
++static enum power_supply_property s3c_adc_backup_bat_props[] = {
++	POWER_SUPPLY_PROP_VOLTAGE_NOW,
++	POWER_SUPPLY_PROP_VOLTAGE_MIN,
++	POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN,
++};
++
++static int s3c_adc_backup_bat_get_property(struct power_supply *psy,
++				enum power_supply_property psp,
++				union power_supply_propval *val)
++{
++	struct s3c_adc_bat *bat = container_of(psy, struct s3c_adc_bat, psy);
++
++	if (!bat) {
++		dev_err(psy->dev, "%s: no battery infos ?!\n", __func__);
++		return -EINVAL;
++	}
++
++	if (bat->volt_value < 0 ||
++		jiffies_to_msecs(jiffies - bat->timestamp) >
++			BAT_POLL_INTERVAL) {
++		bat->volt_value = s3c_adc_read(bat->client,
++			bat->pdata->backup_volt_channel);
++		bat->volt_value *= bat->pdata->backup_volt_mult;
++		bat->timestamp = jiffies;
++	}
++
++	switch (psp) {
++	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
++		val->intval = bat->volt_value;
++		return 0;
++	case POWER_SUPPLY_PROP_VOLTAGE_MIN:
++		val->intval = bat->pdata->backup_volt_min;
++		return 0;
++	case POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN:
++		val->intval = bat->pdata->backup_volt_max;
++		return 0;
++	default:
++		return -EINVAL;
++	}
++}
++
++static struct s3c_adc_bat backup_bat = {
++	.psy = {
++		.name		= "backup-battery",
++		.type		= POWER_SUPPLY_TYPE_BATTERY,
++		.properties	= s3c_adc_backup_bat_props,
++		.num_properties = ARRAY_SIZE(s3c_adc_backup_bat_props),
++		.get_property	= s3c_adc_backup_bat_get_property,
++		.use_for_apm	= 1,
++	},
++};
++
++static enum power_supply_property s3c_adc_main_bat_props[] = {
++	POWER_SUPPLY_PROP_STATUS,
++	POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN,
++	POWER_SUPPLY_PROP_CHARGE_EMPTY_DESIGN,
++	POWER_SUPPLY_PROP_CHARGE_NOW,
++	POWER_SUPPLY_PROP_VOLTAGE_NOW,
++	POWER_SUPPLY_PROP_CURRENT_NOW,
++};
++
++static int calc_full_volt(int volt_val, int cur_val, int impedance)
++{
++	return volt_val + cur_val * impedance / 1000;
++}
++
++static int s3c_adc_bat_get_property(struct power_supply *psy,
++				enum power_supply_property psp,
++				union power_supply_propval *val)
++{
++	struct s3c_adc_bat *bat = container_of(psy, struct s3c_adc_bat, psy);
++
++	int new_level;
++	int full_volt;
++	const struct s3c_adc_bat_thresh *lut = bat->pdata->lut_noac;
++	unsigned int lut_size = bat->pdata->lut_noac_cnt;
++
++	if (!bat) {
++		dev_err(psy->dev, "no battery infos ?!\n");
++		return -EINVAL;
++	}
++
++	if (bat->volt_value < 0 || bat->cur_value < 0 ||
++		jiffies_to_msecs(jiffies - bat->timestamp) >
++			BAT_POLL_INTERVAL) {
++		bat->volt_value = s3c_adc_read(bat->client,
++			bat->pdata->volt_channel) * bat->pdata->volt_mult;
++		bat->cur_value = s3c_adc_read(bat->client,
++			bat->pdata->current_channel) * bat->pdata->current_mult;
++		bat->timestamp = jiffies;
++	}
++
++	if (bat->cable_plugged &&
++		((bat->pdata->gpio_charge_finished < 0) ||
++		!gpio_get_value(bat->pdata->gpio_charge_finished))) {
++		lut = bat->pdata->lut_acin;
++		lut_size = bat->pdata->lut_acin_cnt;
++	}
++
++	new_level = 100000;
++	full_volt = calc_full_volt((bat->volt_value / 1000),
++		(bat->cur_value / 1000), bat->pdata->internal_impedance);
++
++	if (full_volt < calc_full_volt(lut->volt, lut->cur,
++		bat->pdata->internal_impedance)) {
++		lut_size--;
++		while (lut_size--) {
++			int lut_volt1;
++			int lut_volt2;
++
++			lut_volt1 = calc_full_volt(lut[0].volt, lut[0].cur,
++				bat->pdata->internal_impedance);
++			lut_volt2 = calc_full_volt(lut[1].volt, lut[1].cur,
++				bat->pdata->internal_impedance);
++			if (full_volt < lut_volt1 && full_volt >= lut_volt2) {
++				new_level = (lut[1].level +
++					(lut[0].level - lut[1].level) *
++					(full_volt - lut_volt2) /
++					(lut_volt1 - lut_volt2)) * 1000;
++				break;
++			}
++			new_level = lut[1].level * 1000;
++			lut++;
++		}
++	}
++
++	bat->level = new_level;
++
++	switch (psp) {
++	case POWER_SUPPLY_PROP_STATUS:
++		if (bat->pdata->gpio_charge_finished < 0)
++			val->intval = bat->level == 100000 ?
++				POWER_SUPPLY_STATUS_FULL : bat->status;
++		else
++			val->intval = bat->status;
++		return 0;
++	case POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN:
++		val->intval = 100000;
++		return 0;
++	case POWER_SUPPLY_PROP_CHARGE_EMPTY_DESIGN:
++		val->intval = 0;
++		return 0;
++	case POWER_SUPPLY_PROP_CHARGE_NOW:
++		val->intval = bat->level;
++		return 0;
++	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
++		val->intval = bat->volt_value;
++		return 0;
++	case POWER_SUPPLY_PROP_CURRENT_NOW:
++		val->intval = bat->cur_value;
++		return 0;
++	default:
++		return -EINVAL;
++	}
++}
++
++static struct s3c_adc_bat main_bat = {
++	.psy = {
++		.name				= "main-battery",
++		.type				= POWER_SUPPLY_TYPE_BATTERY,
++		.properties			= s3c_adc_main_bat_props,
++		.num_properties		= ARRAY_SIZE(s3c_adc_main_bat_props),
++		.get_property		= s3c_adc_bat_get_property,
++		.external_power_changed = s3c_adc_bat_ext_power_changed,
++		.use_for_apm	= 1,
++	},
++};
++
++static void s3c_adc_bat_work(struct work_struct *work)
++{
++	struct s3c_adc_bat *bat = &main_bat;
++	int is_charged;
++	int is_plugged;
++	static int was_plugged;
++
++	is_plugged = power_supply_am_i_supplied(&bat->psy);
++	bat->cable_plugged = is_plugged;
++	if (is_plugged != was_plugged) {
++		was_plugged = is_plugged;
++		if (is_plugged) {
++			if (bat->pdata->enable_charger)
++				bat->pdata->enable_charger();
++			bat->status = POWER_SUPPLY_STATUS_CHARGING;
++		} else {
++			if (bat->pdata->disable_charger)
++				bat->pdata->disable_charger();
++			bat->status = POWER_SUPPLY_STATUS_DISCHARGING;
++		}
++	} else {
++		if ((bat->pdata->gpio_charge_finished >= 0) && is_plugged) {
++			is_charged = gpio_get_value(
++				main_bat.pdata->gpio_charge_finished);
++			if (is_charged) {
++				if (bat->pdata->disable_charger)
++					bat->pdata->disable_charger();
++				bat->status = POWER_SUPPLY_STATUS_FULL;
++			} else {
++				if (bat->pdata->enable_charger)
++					bat->pdata->enable_charger();
++				bat->status = POWER_SUPPLY_STATUS_CHARGING;
++			}
++		}
++	}
++
++	power_supply_changed(&bat->psy);
++}
++
++static irqreturn_t s3c_adc_bat_charged(int irq, void *dev_id)
++{
++	schedule_delayed_work(&bat_work,
++		msecs_to_jiffies(JITTER_DELAY));
++	return IRQ_HANDLED;
++}
++
++static int __init s3c_adc_bat_probe(struct platform_device *pdev)
++{
++	struct s3c_adc_client	*client;
++	struct s3c_adc_bat_pdata *pdata = pdev->dev.platform_data;
++	int ret;
++
++	client = s3c_adc_register(pdev, NULL, NULL, 0);
++	if (IS_ERR(client)) {
++		dev_err(&pdev->dev, "cannot register adc\n");
++		return PTR_ERR(client);
++	}
++
++	platform_set_drvdata(pdev, client);
++
++	main_bat.client = client;
++	main_bat.pdata = pdata;
++	main_bat.volt_value = -1;
++	main_bat.cur_value = -1;
++	main_bat.cable_plugged = 0;
++	main_bat.status = POWER_SUPPLY_STATUS_DISCHARGING;
++
++	ret = power_supply_register(&pdev->dev, &main_bat.psy);
++	if (ret)
++		goto err_reg_main;
++	if (pdata->backup_volt_mult) {
++		backup_bat.client = client;
++		backup_bat.pdata = pdev->dev.platform_data;
++		backup_bat.volt_value = -1;
++		ret = power_supply_register(&pdev->dev, &backup_bat.psy);
++		if (ret)
++			goto err_reg_backup;
++	}
++
++	INIT_DELAYED_WORK(&bat_work, s3c_adc_bat_work);
++
++	if (pdata->gpio_charge_finished >= 0) {
++		ret = gpio_request(pdata->gpio_charge_finished, "charged");
++		if (ret)
++			goto err_gpio;
++
++		ret = request_irq(gpio_to_irq(pdata->gpio_charge_finished),
++				s3c_adc_bat_charged,
++				IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
++				"battery charged", NULL);
++		if (ret)
++			goto err_irq;
++	}
++
++	if (pdata->init) {
++		ret = pdata->init();
++		if (ret)
++			goto err_platform;
++	}
++
++	dev_info(&pdev->dev, "successfully loaded\n");
++	device_init_wakeup(&pdev->dev, 1);
++
++	/* Schedule timer to check current status */
++	schedule_delayed_work(&bat_work,
++		msecs_to_jiffies(JITTER_DELAY));
++
++	return 0;
++
++err_platform:
++	if (pdata->gpio_charge_finished >= 0)
++		free_irq(gpio_to_irq(pdata->gpio_charge_finished), NULL);
++err_irq:
++	if (pdata->gpio_charge_finished >= 0)
++		gpio_free(pdata->gpio_charge_finished);
++err_gpio:
++	if (pdata->backup_volt_mult)
++		power_supply_unregister(&backup_bat.psy);
++err_reg_backup:
++	power_supply_unregister(&main_bat.psy);
++err_reg_main:
++	return ret;
++}
++
++static int s3c_adc_bat_remove(struct platform_device *pdev)
++{
++	struct s3c_adc_client *client = platform_get_drvdata(pdev);
++	struct s3c_adc_bat_pdata *pdata = pdev->dev.platform_data;
++
++	power_supply_unregister(&main_bat.psy);
++	if (pdata->backup_volt_mult)
++		power_supply_unregister(&backup_bat.psy);
++
++	s3c_adc_release(client);
++
++	if (pdata->gpio_charge_finished >= 0) {
++		free_irq(gpio_to_irq(pdata->gpio_charge_finished), NULL);
++		gpio_free(pdata->gpio_charge_finished);
++	}
++
++	cancel_delayed_work(&bat_work);
++
++	if (pdata->exit)
++		pdata->exit();
++
++	return 0;
++}
++
++#ifdef CONFIG_PM
++static int s3c_adc_bat_suspend(struct platform_device *pdev,
++	pm_message_t state)
++{
++	struct s3c_adc_bat_pdata *pdata = pdev->dev.platform_data;
++
++	if (pdata->gpio_charge_finished >= 0) {
++		if (device_may_wakeup(&pdev->dev))
++			enable_irq_wake(
++				gpio_to_irq(pdata->gpio_charge_finished));
++		else {
++			disable_irq(gpio_to_irq(pdata->gpio_charge_finished));
++			main_bat.pdata->disable_charger();
++		}
++	}
++
++	return 0;
++}
++
++static int s3c_adc_bat_resume(struct platform_device *pdev)
++{
++	struct s3c_adc_bat_pdata *pdata = pdev->dev.platform_data;
++
++	if (pdata->gpio_charge_finished >= 0) {
++		if (device_may_wakeup(&pdev->dev))
++			disable_irq_wake(
++				gpio_to_irq(pdata->gpio_charge_finished));
++		else
++			enable_irq(gpio_to_irq(pdata->gpio_charge_finished));
++	}
++
++	/* Schedule timer to check current status */
++	schedule_delayed_work(&bat_work,
++		msecs_to_jiffies(JITTER_DELAY));
++
++	return 0;
++}
++#else
++#define s3c_adc_battery_suspend NULL
++#define s3c_adc_battery_resume NULL
++#endif
++
++static struct platform_driver s3c_adc_bat_driver = {
++	.driver		= {
++		.name	= "s3c-adc-battery",
++	},
++	.probe		= s3c_adc_bat_probe,
++	.remove		= s3c_adc_bat_remove,
++	.suspend	= s3c_adc_bat_suspend,
++	.resume		= s3c_adc_bat_resume,
++};
++
++
++static int __init s3c_adc_bat_init(void)
++{
++	return platform_driver_register(&s3c_adc_bat_driver);
++}
++
++static void __exit s3c_adc_bat_exit(void)
++{
++	platform_driver_unregister(&s3c_adc_bat_driver);
++}
++
++module_init(s3c_adc_bat_init);
++module_exit(s3c_adc_bat_exit);
++
++MODULE_AUTHOR("Vasily Khoruzhick <anarsoul@gmail.com>");
++MODULE_DESCRIPTION("iPAQ H1930/H1940/RX1950 battery controler driver");
++MODULE_LICENSE("GPL");
+diff --git a/include/linux/s3c_adc_battery.h b/include/linux/s3c_adc_battery.h
+new file mode 100644
+index 0000000..dbce22f
+--- /dev/null
++++ b/include/linux/s3c_adc_battery.h
+@@ -0,0 +1,36 @@
++#ifndef _S3C_ADC_BATTERY_H
++#define _S3C_ADC_BATTERY_H
++
++struct s3c_adc_bat_thresh {
++	int volt; /* mV */
++	int cur; /* mA */
++	int level; /* percent */
++};
++
++struct s3c_adc_bat_pdata {
++	int (*init)(void);
++	void (*exit)(void);
++	void (*enable_charger)(void);
++	void (*disable_charger)(void);
++
++	int gpio_charge_finished;
++
++	const struct s3c_adc_bat_thresh *lut_noac;
++	unsigned int lut_noac_cnt;
++	const struct s3c_adc_bat_thresh *lut_acin;
++	unsigned int lut_acin_cnt;
++
++	const unsigned int volt_channel;
++	const unsigned int current_channel;
++	const unsigned int backup_volt_channel;
++
++	const unsigned int volt_mult;
++	const unsigned int current_mult;
++	const unsigned int backup_volt_mult;
++	const unsigned int internal_impedance;
++
++	const unsigned int backup_volt_max;
++	const unsigned int backup_volt_min;
++};
++
++#endif
+-- 
+1.7.1.1
+
diff --git a/recipes/linux/linux-2.6.35/rx1950/defconfig b/recipes/linux/linux-2.6.35/rx1950/defconfig
new file mode 100644
index 0000000..ba0bc4d
--- /dev/null
+++ b/recipes/linux/linux-2.6.35/rx1950/defconfig
@@ -0,0 +1,1615 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.35
+# Thu Sep  9 13:39:17 2010
+#
+CONFIG_ARM=y
+CONFIG_HAVE_PWM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+CONFIG_GENERIC_GPIO=y
+CONFIG_GENERIC_TIME=y
+CONFIG_ARCH_USES_GETTIMEOFFSET=y
+CONFIG_HAVE_PROC_CPU=y
+CONFIG_NO_IOPORT=y
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
+CONFIG_NEED_DMA_MAP_STATE=y
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
+CONFIG_CROSS_COMPILE=""
+CONFIG_LOCALVERSION=""
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_HAVE_KERNEL_GZIP=y
+CONFIG_HAVE_KERNEL_LZMA=y
+CONFIG_HAVE_KERNEL_LZO=y
+CONFIG_KERNEL_GZIP=y
+# CONFIG_KERNEL_BZIP2 is not set
+# CONFIG_KERNEL_LZMA is not set
+# CONFIG_KERNEL_LZO is not set
+CONFIG_SWAP=y
+CONFIG_SYSVIPC=y
+CONFIG_SYSVIPC_SYSCTL=y
+# CONFIG_POSIX_MQUEUE is not set
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+
+#
+# RCU Subsystem
+#
+CONFIG_TREE_RCU=y
+# CONFIG_TREE_PREEMPT_RCU is not set
+# CONFIG_TINY_RCU is not set
+# CONFIG_RCU_TRACE is not set
+CONFIG_RCU_FANOUT=32
+# CONFIG_RCU_FANOUT_EXACT is not set
+# CONFIG_TREE_RCU_TRACE is not set
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=18
+# CONFIG_CGROUPS is not set
+# CONFIG_SYSFS_DEPRECATED_V2 is not set
+# CONFIG_RELAY is not set
+CONFIG_NAMESPACES=y
+# CONFIG_UTS_NS is not set
+# CONFIG_IPC_NS is not set
+# CONFIG_USER_NS is not set
+# CONFIG_PID_NS is not set
+# CONFIG_NET_NS is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE=""
+CONFIG_RD_GZIP=y
+CONFIG_RD_BZIP2=y
+CONFIG_RD_LZMA=y
+CONFIG_RD_LZO=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+# CONFIG_EMBEDDED is not set
+CONFIG_UID16=y
+CONFIG_SYSCTL_SYSCALL=y
+CONFIG_KALLSYMS=y
+# CONFIG_KALLSYMS_EXTRA_PASS is not set
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
+CONFIG_HAVE_PERF_EVENTS=y
+CONFIG_PERF_USE_VMALLOC=y
+
+#
+# Kernel Performance Events And Counters
+#
+# CONFIG_PERF_EVENTS is not set
+# CONFIG_PERF_COUNTERS is not set
+CONFIG_VM_EVENT_COUNTERS=y
+# CONFIG_COMPAT_BRK is not set
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
+CONFIG_MODULE_FORCE_LOAD=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+# CONFIG_MODVERSIONS is not set
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
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+# CONFIG_DEFAULT_DEADLINE is not set
+# CONFIG_DEFAULT_CFQ is not set
+CONFIG_DEFAULT_NOOP=y
+CONFIG_DEFAULT_IOSCHED="noop"
+# CONFIG_INLINE_SPIN_TRYLOCK is not set
+# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK is not set
+# CONFIG_INLINE_SPIN_LOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
+CONFIG_INLINE_SPIN_UNLOCK=y
+# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
+CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
+# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_READ_TRYLOCK is not set
+# CONFIG_INLINE_READ_LOCK is not set
+# CONFIG_INLINE_READ_LOCK_BH is not set
+# CONFIG_INLINE_READ_LOCK_IRQ is not set
+# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
+CONFIG_INLINE_READ_UNLOCK=y
+# CONFIG_INLINE_READ_UNLOCK_BH is not set
+CONFIG_INLINE_READ_UNLOCK_IRQ=y
+# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_WRITE_TRYLOCK is not set
+# CONFIG_INLINE_WRITE_LOCK is not set
+# CONFIG_INLINE_WRITE_LOCK_BH is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
+CONFIG_INLINE_WRITE_UNLOCK=y
+# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
+CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
+# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
+# CONFIG_MUTEX_SPIN_ON_OWNER is not set
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
+# CONFIG_ARCH_VEXPRESS is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_BCMRING is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_CNS3XXX is not set
+# CONFIG_ARCH_GEMINI is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_STMP3XXX is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_L7200 is not set
+# CONFIG_ARCH_DOVE is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_LOKI is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_MMP is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_NS9XXX is not set
+# CONFIG_ARCH_W90X900 is not set
+# CONFIG_ARCH_NUC93X is not set
+# CONFIG_ARCH_PNX4008 is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_SHMOBILE is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+CONFIG_ARCH_S3C2410=y
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_S5P6440 is not set
+# CONFIG_ARCH_S5P6442 is not set
+# CONFIG_ARCH_S5PC100 is not set
+# CONFIG_ARCH_S5PV210 is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_LH7A40X is not set
+# CONFIG_ARCH_U300 is not set
+# CONFIG_ARCH_U8500 is not set
+# CONFIG_ARCH_NOMADIK is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+# CONFIG_PLAT_SPEAR is not set
+CONFIG_PLAT_SAMSUNG=y
+
+#
+# Boot options
+#
+# CONFIG_S3C_BOOT_WATCHDOG is not set
+# CONFIG_S3C_BOOT_ERROR_RESET is not set
+CONFIG_S3C_BOOT_UART_FORCE_FIFO=y
+CONFIG_S3C_LOWLEVEL_UART_PORT=0
+CONFIG_S3C_GPIO_CFG_S3C24XX=y
+CONFIG_SAMSUNG_GPIO_EXTRA=0
+CONFIG_S3C_GPIO_SPACE=0
+CONFIG_S3C_ADC=y
+CONFIG_S3C_DEV_WDT=y
+CONFIG_S3C_DEV_NAND=y
+CONFIG_S3C_DMA=y
+
+#
+# Power management
+#
+# CONFIG_SAMSUNG_PM_DEBUG is not set
+# CONFIG_SAMSUNG_PM_CHECK is not set
+CONFIG_PLAT_S3C24XX=y
+CONFIG_CPU_LLSERIAL_S3C2440_ONLY=y
+CONFIG_CPU_LLSERIAL_S3C2440=y
+CONFIG_S3C2410_CLOCK=y
+CONFIG_S3C24XX_DCLK=y
+CONFIG_S3C24XX_PWM=y
+CONFIG_S3C24XX_GPIO_EXTRA=0
+CONFIG_S3C2410_DMA=y
+# CONFIG_S3C2410_DMA_DEBUG is not set
+
+#
+# S3C2400 Machines
+#
+CONFIG_CPU_S3C2410_DMA=y
+CONFIG_S3C2410_PM=y
+CONFIG_S3C2410_GPIO=y
+
+#
+# S3C2410 Machines
+#
+# CONFIG_ARCH_SMDK2410 is not set
+# CONFIG_ARCH_H1940 is not set
+CONFIG_PM_H1940=y
+# CONFIG_MACH_N30 is not set
+# CONFIG_ARCH_BAST is not set
+# CONFIG_MACH_OTOM is not set
+# CONFIG_MACH_AML_M5900 is not set
+# CONFIG_MACH_TCT_HAMMER is not set
+# CONFIG_MACH_VR1000 is not set
+# CONFIG_MACH_QT2410 is not set
+
+#
+# S3C2412 Machines
+#
+# CONFIG_MACH_JIVE is not set
+# CONFIG_MACH_SMDK2413 is not set
+# CONFIG_MACH_SMDK2412 is not set
+# CONFIG_MACH_VSTMS is not set
+
+#
+# S3C2416 Machines
+#
+# CONFIG_MACH_SMDK2416 is not set
+CONFIG_CPU_S3C2442=y
+CONFIG_CPU_S3C244X=y
+CONFIG_S3C2440_XTAL_16934400=y
+
+#
+# S3C2440 and S3C2442 Machines
+#
+# CONFIG_MACH_ANUBIS is not set
+# CONFIG_MACH_NEO1973_GTA02 is not set
+# CONFIG_MACH_OSIRIS is not set
+# CONFIG_MACH_RX3715 is not set
+# CONFIG_ARCH_S3C2440 is not set
+# CONFIG_MACH_NEXCODER_2440 is not set
+# CONFIG_SMDK2440_CPU2440 is not set
+# CONFIG_SMDK2440_CPU2442 is not set
+# CONFIG_MACH_AT2440EVB is not set
+# CONFIG_MACH_MINI2440 is not set
+CONFIG_MACH_RX1950=y
+
+#
+# S3C2443 Machines
+#
+# CONFIG_MACH_SMDK2443 is not set
+
+#
+# Processor Type
+#
+CONFIG_CPU_ARM920T=y
+CONFIG_CPU_32v4T=y
+CONFIG_CPU_ABRT_EV4T=y
+CONFIG_CPU_PABRT_LEGACY=y
+CONFIG_CPU_CACHE_V4WT=y
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
+CONFIG_ARM_L1_CACHE_SHIFT=5
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
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+CONFIG_PREEMPT_NONE=y
+# CONFIG_PREEMPT_VOLUNTARY is not set
+# CONFIG_PREEMPT is not set
+CONFIG_HZ=200
+CONFIG_AEABI=y
+# CONFIG_OABI_COMPAT is not set
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
+CONFIG_SPLIT_PTLOCK_CPUS=999999
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=0
+CONFIG_VIRT_TO_BUS=y
+# CONFIG_KSM is not set
+CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
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
+CONFIG_KEXEC=y
+CONFIG_ATAGS_PROC=y
+
+#
+# CPU Power Management
+#
+# CONFIG_CPU_FREQ is not set
+CONFIG_CPU_IDLE=y
+CONFIG_CPU_IDLE_GOV_LADDER=y
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_HAVE_AOUT=y
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+
+#
+# Power management options
+#
+CONFIG_PM=y
+# CONFIG_PM_DEBUG is not set
+CONFIG_PM_SLEEP=y
+CONFIG_SUSPEND_NVS=y
+CONFIG_SUSPEND=y
+CONFIG_SUSPEND_FREEZER=y
+CONFIG_APM_EMULATION=y
+# CONFIG_PM_RUNTIME is not set
+CONFIG_PM_OPS=y
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_NET=y
+
+#
+# Networking options
+#
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+# CONFIG_NET_KEY is not set
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_FIB_HASH=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+# CONFIG_IP_PNP_BOOTP is not set
+# CONFIG_IP_PNP_RARP is not set
+# CONFIG_NET_IPIP is not set
+# CONFIG_NET_IPGRE is not set
+# CONFIG_IP_MROUTE is not set
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
+# CONFIG_RDS is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_L2TP is not set
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
+CONFIG_IRDA=m
+
+#
+# IrDA protocols
+#
+# CONFIG_IRLAN is not set
+CONFIG_IRCOMM=m
+# CONFIG_IRDA_ULTRA is not set
+
+#
+# IrDA options
+#
+CONFIG_IRDA_CACHE_LAST_LSAP=y
+CONFIG_IRDA_FAST_RR=y
+# CONFIG_IRDA_DEBUG is not set
+
+#
+# Infrared-port device drivers
+#
+
+#
+# SIR device drivers
+#
+CONFIG_IRTTY_SIR=m
+
+#
+# Dongle support
+#
+# CONFIG_DONGLE is not set
+
+#
+# FIR device drivers
+#
+# CONFIG_BT is not set
+# CONFIG_AF_RXRPC is not set
+CONFIG_WIRELESS=y
+CONFIG_WEXT_CORE=y
+CONFIG_WEXT_PROC=y
+CONFIG_CFG80211=m
+# CONFIG_NL80211_TESTMODE is not set
+# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
+# CONFIG_CFG80211_REG_DEBUG is not set
+CONFIG_CFG80211_DEFAULT_PS=y
+# CONFIG_CFG80211_DEBUGFS is not set
+# CONFIG_CFG80211_INTERNAL_REGDB is not set
+CONFIG_CFG80211_WEXT=y
+CONFIG_WIRELESS_EXT_SYSFS=y
+# CONFIG_LIB80211 is not set
+CONFIG_MAC80211=m
+CONFIG_MAC80211_HAS_RC=y
+CONFIG_MAC80211_RC_MINSTREL=y
+# CONFIG_MAC80211_RC_DEFAULT_PID is not set
+CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
+CONFIG_MAC80211_RC_DEFAULT="minstrel"
+# CONFIG_MAC80211_MESH is not set
+# CONFIG_MAC80211_LEDS is not set
+# CONFIG_MAC80211_DEBUGFS is not set
+# CONFIG_MAC80211_DEBUG_MENU is not set
+# CONFIG_WIMAX is not set
+CONFIG_RFKILL=y
+CONFIG_RFKILL_LEDS=y
+CONFIG_RFKILL_INPUT=y
+# CONFIG_NET_9P is not set
+# CONFIG_CAIF is not set
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
+CONFIG_FW_LOADER=y
+# CONFIG_FIRMWARE_IN_KERNEL is not set
+CONFIG_EXTRA_FIRMWARE=""
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+CONFIG_MTD=y
+# CONFIG_MTD_DEBUG is not set
+# CONFIG_MTD_TESTS is not set
+# CONFIG_MTD_CONCAT is not set
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
+# CONFIG_SM_FTL is not set
+# CONFIG_MTD_OOPS is not set
+
+#
+# RAM/ROM/Flash chip drivers
+#
+CONFIG_MTD_CFI=y
+CONFIG_MTD_JEDECPROBE=y
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
+CONFIG_MTD_CFI_AMDSTD=y
+# CONFIG_MTD_CFI_STAA is not set
+CONFIG_MTD_CFI_UTIL=y
+# CONFIG_MTD_RAM is not set
+CONFIG_MTD_ROM=y
+# CONFIG_MTD_ABSENT is not set
+
+#
+# Mapping drivers for chip access
+#
+# CONFIG_MTD_COMPLEX_MAPPINGS is not set
+# CONFIG_MTD_PHYSMAP is not set
+# CONFIG_MTD_ARM_INTEGRATOR is not set
+# CONFIG_MTD_IMPA7 is not set
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
+CONFIG_MTD_NAND_ECC=y
+# CONFIG_MTD_NAND_ECC_SMC is not set
+CONFIG_MTD_NAND=y
+# CONFIG_MTD_NAND_VERIFY_WRITE is not set
+# CONFIG_MTD_SM_COMMON is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+CONFIG_MTD_NAND_DENALI_SCRATCH_REG_ADDR=0xFF108018
+# CONFIG_MTD_NAND_GPIO is not set
+CONFIG_MTD_NAND_IDS=y
+CONFIG_MTD_NAND_S3C2410=y
+# CONFIG_MTD_NAND_S3C2410_DEBUG is not set
+CONFIG_MTD_NAND_S3C2410_HWECC=y
+# CONFIG_MTD_NAND_S3C2410_CLKSTOP is not set
+# CONFIG_MTD_NAND_DISKONCHIP is not set
+# CONFIG_MTD_NAND_NANDSIM is not set
+# CONFIG_MTD_NAND_PLATFORM is not set
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
+# CONFIG_MTD_UBI is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+
+#
+# DRBD disabled because PROC_FS, INET or CONNECTOR not selected
+#
+# CONFIG_BLK_DEV_NBD is not set
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=1
+CONFIG_BLK_DEV_RAM_SIZE=8192
+# CONFIG_BLK_DEV_XIP is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+# CONFIG_MG_DISK is not set
+# CONFIG_MISC_DEVICES is not set
+CONFIG_HAVE_IDE=y
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
+CONFIG_SCSI_MOD=y
+# CONFIG_RAID_ATTRS is not set
+# CONFIG_SCSI is not set
+# CONFIG_SCSI_DMA is not set
+# CONFIG_SCSI_NETLINK is not set
+# CONFIG_ATA is not set
+# CONFIG_MD is not set
+CONFIG_NETDEVICES=y
+# CONFIG_DUMMY is not set
+# CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_EQUALIZER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+# CONFIG_NET_ETHERNET is not set
+# CONFIG_NETDEV_1000 is not set
+# CONFIG_NETDEV_10000 is not set
+CONFIG_WLAN=y
+# CONFIG_LIBERTAS_THINFIRM is not set
+# CONFIG_MAC80211_HWSIM is not set
+# CONFIG_ATH_COMMON is not set
+# CONFIG_B43 is not set
+# CONFIG_B43LEGACY is not set
+# CONFIG_HOSTAP is not set
+# CONFIG_IWM is not set
+# CONFIG_LIBERTAS is not set
+# CONFIG_P54_COMMON is not set
+# CONFIG_RT2X00 is not set
+# CONFIG_WL12XX is not set
+
+#
+# Enable WiMAX (Networking options) to see the WiMAX drivers
+#
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
+# CONFIG_INPUT_SPARSEKMAP is not set
+
+#
+# Userland interfaces
+#
+CONFIG_INPUT_MOUSEDEV=y
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=240
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=320
+# CONFIG_INPUT_JOYDEV is not set
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_EVBUG is not set
+
+#
+# Input Device Drivers
+#
+CONFIG_INPUT_KEYBOARD=y
+# CONFIG_KEYBOARD_ADP5588 is not set
+# CONFIG_KEYBOARD_ATKBD is not set
+# CONFIG_KEYBOARD_QT2160 is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+CONFIG_KEYBOARD_GPIO=y
+# CONFIG_KEYBOARD_TCA6416 is not set
+# CONFIG_KEYBOARD_MATRIX is not set
+# CONFIG_KEYBOARD_LM8323 is not set
+# CONFIG_KEYBOARD_MAX7359 is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_OPENCORES is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+# CONFIG_TOUCHSCREEN_AD7879_I2C is not set
+# CONFIG_TOUCHSCREEN_AD7879 is not set
+# CONFIG_TOUCHSCREEN_DYNAPRO is not set
+# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
+# CONFIG_TOUCHSCREEN_EETI is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+CONFIG_TOUCHSCREEN_S3C2410=y
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
+# CONFIG_TOUCHSCREEN_TPS6507X is not set
+# CONFIG_INPUT_MISC is not set
+
+#
+# Hardware I/O ports
+#
+CONFIG_SERIO=y
+CONFIG_SERIO_SERPORT=y
+# CONFIG_SERIO_RAW is not set
+# CONFIG_SERIO_ALTERA_PS2 is not set
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
+# CONFIG_N_GSM is not set
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+
+#
+# Non-8250 serial port support
+#
+CONFIG_SERIAL_SAMSUNG=y
+CONFIG_SERIAL_SAMSUNG_UARTS=3
+CONFIG_SERIAL_SAMSUNG_CONSOLE=y
+CONFIG_SERIAL_S3C2440=y
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+# CONFIG_SERIAL_TIMBERDALE is not set
+# CONFIG_SERIAL_ALTERA_JTAGUART is not set
+# CONFIG_SERIAL_ALTERA_UART is not set
+CONFIG_UNIX98_PTYS=y
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_IPMI_HANDLER is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+# CONFIG_RAMOOPS is not set
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+# CONFIG_I2C_COMPAT is not set
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
+# CONFIG_I2C_DESIGNWARE is not set
+# CONFIG_I2C_GPIO is not set
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_PCA_PLATFORM is not set
+CONFIG_I2C_S3C2410=m
+# CONFIG_I2C_SIMTEC is not set
+# CONFIG_I2C_XILINX is not set
+
+#
+# External I2C/SMBus adapter drivers
+#
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+
+#
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_STUB is not set
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+# CONFIG_SPI is not set
+
+#
+# PPS support
+#
+# CONFIG_PPS is not set
+CONFIG_ARCH_REQUIRE_GPIOLIB=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_SYSFS=y
+
+#
+# Memory mapped GPIO expanders:
+#
+# CONFIG_GPIO_IT8761E is not set
+
+#
+# I2C GPIO expanders:
+#
+# CONFIG_GPIO_MAX7300 is not set
+# CONFIG_GPIO_MAX732X is not set
+# CONFIG_GPIO_PCA953X is not set
+# CONFIG_GPIO_PCF857X is not set
+# CONFIG_GPIO_ADP5588 is not set
+
+#
+# PCI GPIO expanders:
+#
+
+#
+# SPI GPIO expanders:
+#
+
+#
+# AC97 GPIO expanders:
+#
+
+#
+# MODULbus GPIO expanders:
+#
+# CONFIG_W1 is not set
+CONFIG_POWER_SUPPLY=y
+# CONFIG_POWER_SUPPLY_DEBUG is not set
+CONFIG_PDA_POWER=y
+CONFIG_APM_POWER=y
+# CONFIG_TEST_POWER is not set
+# CONFIG_BATTERY_DS2760 is not set
+# CONFIG_BATTERY_DS2782 is not set
+# CONFIG_BATTERY_BQ27x00 is not set
+# CONFIG_BATTERY_MAX17040 is not set
+CONFIG_BATTERY_S3C_ADC=y
+# CONFIG_HWMON is not set
+# CONFIG_THERMAL is not set
+CONFIG_WATCHDOG=y
+# CONFIG_WATCHDOG_NOWAYOUT is not set
+
+#
+# Watchdog Device Drivers
+#
+# CONFIG_SOFT_WATCHDOG is not set
+CONFIG_S3C2410_WATCHDOG=y
+# CONFIG_MAX63XX_WATCHDOG is not set
+CONFIG_SSB_POSSIBLE=y
+
+#
+# Sonics Silicon Backplane
+#
+# CONFIG_SSB is not set
+# CONFIG_MFD_SUPPORT is not set
+CONFIG_REGULATOR=y
+# CONFIG_REGULATOR_DEBUG is not set
+# CONFIG_REGULATOR_DUMMY is not set
+# CONFIG_REGULATOR_FIXED_VOLTAGE is not set
+# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
+# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
+# CONFIG_REGULATOR_BQ24022 is not set
+# CONFIG_REGULATOR_MAX1586 is not set
+# CONFIG_REGULATOR_MAX8649 is not set
+# CONFIG_REGULATOR_MAX8660 is not set
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
+CONFIG_FB_S3C2410=y
+CONFIG_FB_S3C2410_DEBUG=y
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_MB862XX is not set
+# CONFIG_FB_BROADSHEET is not set
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CLASS_DEVICE=y
+CONFIG_LCD_PLATFORM=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_BACKLIGHT_GENERIC=y
+CONFIG_BACKLIGHT_PWM=y
+# CONFIG_BACKLIGHT_ADP8860 is not set
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
+# CONFIG_FONT_8x16 is not set
+# CONFIG_FONT_6x11 is not set
+# CONFIG_FONT_7x14 is not set
+# CONFIG_FONT_PEARL_8x8 is not set
+# CONFIG_FONT_ACORN_8x8 is not set
+CONFIG_FONT_MINI_4x6=y
+# CONFIG_FONT_SUN8x16 is not set
+# CONFIG_FONT_SUN12x22 is not set
+# CONFIG_FONT_10x18 is not set
+# CONFIG_LOGO is not set
+CONFIG_SOUND=m
+CONFIG_SOUND_OSS_CORE=y
+# CONFIG_SOUND_OSS_CORE_PRECLAIM is not set
+CONFIG_SND=m
+CONFIG_SND_TIMER=m
+CONFIG_SND_PCM=m
+CONFIG_SND_JACK=y
+# CONFIG_SND_SEQUENCER is not set
+CONFIG_SND_OSSEMUL=y
+CONFIG_SND_MIXER_OSS=m
+CONFIG_SND_PCM_OSS=m
+CONFIG_SND_PCM_OSS_PLUGINS=y
+# CONFIG_SND_DYNAMIC_MINORS is not set
+# CONFIG_SND_SUPPORT_OLD_API is not set
+# CONFIG_SND_VERBOSE_PROCFS is not set
+# CONFIG_SND_VERBOSE_PRINTK is not set
+# CONFIG_SND_DEBUG is not set
+# CONFIG_SND_RAWMIDI_SEQ is not set
+# CONFIG_SND_OPL3_LIB_SEQ is not set
+# CONFIG_SND_OPL4_LIB_SEQ is not set
+# CONFIG_SND_SBAWE_SEQ is not set
+# CONFIG_SND_EMU10K1_SEQ is not set
+# CONFIG_SND_DRIVERS is not set
+# CONFIG_SND_ARM is not set
+CONFIG_SND_SOC=m
+CONFIG_SND_S3C24XX_SOC=m
+# CONFIG_SND_S3C24XX_SOC_LN2440SBC_ALC650 is not set
+# CONFIG_SND_S3C24XX_SOC_S3C24XX_UDA134X is not set
+# CONFIG_SND_S3C24XX_SOC_SIMTEC_TLV320AIC23 is not set
+# CONFIG_SND_S3C24XX_SOC_SIMTEC_HERMES is not set
+CONFIG_SND_SOC_I2C_AND_SPI=m
+# CONFIG_SND_SOC_ALL_CODECS is not set
+# CONFIG_SOUND_PRIME is not set
+# CONFIG_HID_SUPPORT is not set
+CONFIG_USB_SUPPORT=y
+CONFIG_USB_ARCH_HAS_HCD=y
+CONFIG_USB_ARCH_HAS_OHCI=y
+# CONFIG_USB_ARCH_HAS_EHCI is not set
+# CONFIG_USB is not set
+# CONFIG_USB_MUSB_HDRC is not set
+# CONFIG_USB_GADGET_MUSB_HDRC is not set
+
+#
+# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
+#
+CONFIG_USB_GADGET=y
+# CONFIG_USB_GADGET_DEBUG_FILES is not set
+# CONFIG_USB_GADGET_DEBUG_FS is not set
+CONFIG_USB_GADGET_VBUS_DRAW=100
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
+CONFIG_USB_GADGET_S3C2410=y
+CONFIG_USB_S3C2410=y
+# CONFIG_USB_S3C2410_DEBUG is not set
+# CONFIG_USB_GADGET_M66592 is not set
+# CONFIG_USB_GADGET_AMD5536UDC is not set
+# CONFIG_USB_GADGET_FSL_QE is not set
+# CONFIG_USB_GADGET_CI13XXX is not set
+# CONFIG_USB_GADGET_NET2280 is not set
+# CONFIG_USB_GADGET_GOKU is not set
+# CONFIG_USB_GADGET_LANGWELL is not set
+# CONFIG_USB_GADGET_DUMMY_HCD is not set
+# CONFIG_USB_GADGET_DUALSPEED is not set
+# CONFIG_USB_ZERO is not set
+# CONFIG_USB_AUDIO is not set
+CONFIG_USB_ETH=y
+# CONFIG_USB_ETH_RNDIS is not set
+# CONFIG_USB_ETH_EEM is not set
+# CONFIG_USB_GADGETFS is not set
+# CONFIG_USB_FUNCTIONFS is not set
+# CONFIG_USB_FILE_STORAGE is not set
+# CONFIG_USB_MASS_STORAGE is not set
+# CONFIG_USB_G_SERIAL is not set
+# CONFIG_USB_MIDI_GADGET is not set
+# CONFIG_USB_G_PRINTER is not set
+# CONFIG_USB_CDC_COMPOSITE is not set
+# CONFIG_USB_G_NOKIA is not set
+# CONFIG_USB_G_MULTI is not set
+# CONFIG_USB_G_HID is not set
+# CONFIG_USB_G_WEBCAM is not set
+
+#
+# OTG and related infrastructure
+#
+# CONFIG_USB_GPIO_VBUS is not set
+# CONFIG_USB_ULPI is not set
+# CONFIG_NOP_USB_XCEIV is not set
+CONFIG_MMC=y
+# CONFIG_MMC_DEBUG is not set
+CONFIG_MMC_UNSAFE_RESUME=y
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
+CONFIG_MMC_S3C=y
+CONFIG_MMC_S3C_HW_SDIO_IRQ=y
+# CONFIG_MMC_S3C_PIO is not set
+CONFIG_MMC_S3C_DMA=y
+# CONFIG_MMC_S3C_PIODMA is not set
+# CONFIG_MEMSTICK is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+
+#
+# LED drivers
+#
+# CONFIG_LEDS_S3C24XX is not set
+# CONFIG_LEDS_PCA9532 is not set
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_GPIO_PLATFORM=y
+# CONFIG_LEDS_LP3944 is not set
+# CONFIG_LEDS_PCA955X is not set
+# CONFIG_LEDS_PWM is not set
+# CONFIG_LEDS_REGULATOR is not set
+# CONFIG_LEDS_BD2802 is not set
+# CONFIG_LEDS_LT3593 is not set
+CONFIG_LEDS_TRIGGERS=y
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGER_TIMER=y
+# CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
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
+# CONFIG_RTC_INTF_PROC is not set
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
+# CONFIG_RTC_DRV_BQ32K is not set
+# CONFIG_RTC_DRV_S35390A is not set
+# CONFIG_RTC_DRV_FM3130 is not set
+# CONFIG_RTC_DRV_RX8581 is not set
+# CONFIG_RTC_DRV_RX8025 is not set
+
+#
+# SPI RTC drivers
+#
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
+# CONFIG_RTC_DRV_MSM6242 is not set
+# CONFIG_RTC_DRV_BQ4802 is not set
+# CONFIG_RTC_DRV_RP5C01 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+
+#
+# on-CPU RTC drivers
+#
+CONFIG_RTC_DRV_S3C=y
+# CONFIG_DMADEVICES is not set
+# CONFIG_AUXDISPLAY is not set
+# CONFIG_UIO is not set
+CONFIG_STAGING=y
+# CONFIG_STAGING_EXCLUDE_BUILD is not set
+# CONFIG_ECHO is not set
+# CONFIG_COMEDI is not set
+# CONFIG_POHMELFS is not set
+
+#
+# RAR Register Driver
+#
+# CONFIG_IIO is not set
+# CONFIG_RAMZSWAP is not set
+# CONFIG_BATMAN_ADV is not set
+# CONFIG_FB_SM7XX is not set
+
+#
+# Texas Instruments shared transport line discipline
+#
+# CONFIG_TI_ST is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=y
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=m
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+CONFIG_EXT3_FS_XATTR=y
+# CONFIG_EXT3_FS_POSIX_ACL is not set
+# CONFIG_EXT3_FS_SECURITY is not set
+# CONFIG_EXT4_FS is not set
+CONFIG_JBD=m
+# CONFIG_JBD_DEBUG is not set
+CONFIG_FS_MBCACHE=m
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
+# CONFIG_INOTIFY is not set
+CONFIG_INOTIFY_USER=y
+# CONFIG_QUOTA is not set
+# CONFIG_AUTOFS_FS is not set
+# CONFIG_AUTOFS4_FS is not set
+CONFIG_FUSE_FS=m
+# CONFIG_CUSE is not set
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
+# CONFIG_MSDOS_FS is not set
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_CODEPAGE=866
+CONFIG_FAT_DEFAULT_IOCHARSET="utf8"
+# CONFIG_NTFS_FS is not set
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
+# CONFIG_ECRYPT_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
+# CONFIG_JFFS2_FS is not set
+# CONFIG_LOGFS is not set
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
+# CONFIG_CEPH_FS is not set
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
+CONFIG_BSD_DISKLABEL=y
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
+CONFIG_NLS_DEFAULT="utf8"
+# CONFIG_NLS_CODEPAGE_437 is not set
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
+CONFIG_NLS_CODEPAGE_866=y
+# CONFIG_NLS_CODEPAGE_869 is not set
+# CONFIG_NLS_CODEPAGE_936 is not set
+# CONFIG_NLS_CODEPAGE_950 is not set
+# CONFIG_NLS_CODEPAGE_932 is not set
+# CONFIG_NLS_CODEPAGE_949 is not set
+# CONFIG_NLS_CODEPAGE_874 is not set
+# CONFIG_NLS_ISO8859_8 is not set
+# CONFIG_NLS_CODEPAGE_1250 is not set
+CONFIG_NLS_CODEPAGE_1251=y
+# CONFIG_NLS_ASCII is not set
+# CONFIG_NLS_ISO8859_1 is not set
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
+CONFIG_NLS_UTF8=y
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
+# CONFIG_DEBUG_KERNEL is not set
+CONFIG_DEBUG_BUGVERBOSE=y
+CONFIG_DEBUG_MEMORY_INIT=y
+# CONFIG_RCU_CPU_STALL_DETECTOR is not set
+# CONFIG_LKDTM is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_SYSCTL_SYSCALL_CHECK is not set
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_TRACING_SUPPORT=y
+# CONFIG_FTRACE is not set
+# CONFIG_DYNAMIC_DEBUG is not set
+# CONFIG_ATOMIC64_SELFTEST is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+CONFIG_ARM_UNWIND=y
+CONFIG_DEBUG_USER=y
+# CONFIG_OC_ETM is not set
+CONFIG_DEBUG_S3C_UART=0
+
+#
+# Security options
+#
+CONFIG_KEYS=y
+# CONFIG_KEYS_DEBUG_PROC_KEYS is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITYFS is not set
+# CONFIG_DEFAULT_SECURITY_SELINUX is not set
+# CONFIG_DEFAULT_SECURITY_SMACK is not set
+# CONFIG_DEFAULT_SECURITY_TOMOYO is not set
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_DEFAULT_SECURITY=""
+CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
+CONFIG_CRYPTO_FIPS=y
+CONFIG_CRYPTO_ALGAPI=y
+CONFIG_CRYPTO_ALGAPI2=y
+CONFIG_CRYPTO_AEAD2=y
+CONFIG_CRYPTO_BLKCIPHER=y
+CONFIG_CRYPTO_BLKCIPHER2=y
+CONFIG_CRYPTO_HASH=y
+CONFIG_CRYPTO_HASH2=y
+CONFIG_CRYPTO_RNG=y
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
+CONFIG_CRYPTO_ECB=y
+# CONFIG_CRYPTO_LRW is not set
+# CONFIG_CRYPTO_PCBC is not set
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
+# CONFIG_CRYPTO_CRC32C is not set
+# CONFIG_CRYPTO_GHASH is not set
+# CONFIG_CRYPTO_MD4 is not set
+CONFIG_CRYPTO_MD5=y
+CONFIG_CRYPTO_MICHAEL_MIC=y
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
+CONFIG_CRYPTO_AES=y
+# CONFIG_CRYPTO_ANUBIS is not set
+CONFIG_CRYPTO_ARC4=y
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
+# CONFIG_CRYPTO_DEFLATE is not set
+# CONFIG_CRYPTO_ZLIB is not set
+# CONFIG_CRYPTO_LZO is not set
+
+#
+# Random Number Generation
+#
+CONFIG_CRYPTO_ANSI_CPRNG=y
+CONFIG_CRYPTO_HW=y
+# CONFIG_BINARY_PRINTF is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=y
+CONFIG_GENERIC_FIND_LAST_BIT=y
+CONFIG_CRC_CCITT=y
+# CONFIG_CRC16 is not set
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=y
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+CONFIG_ZLIB_INFLATE=y
+CONFIG_LZO_DECOMPRESS=y
+CONFIG_DECOMPRESS_GZIP=y
+CONFIG_DECOMPRESS_BZIP2=y
+CONFIG_DECOMPRESS_LZMA=y
+CONFIG_DECOMPRESS_LZO=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_DMA=y
+CONFIG_NLATTR=y
+CONFIG_GENERIC_ATOMIC64=y
diff --git a/recipes/linux/linux_2.6.35.bb b/recipes/linux/linux_2.6.35.bb
index 5089521..8765846 100644
--- a/recipes/linux/linux_2.6.35.bb
+++ b/recipes/linux/linux_2.6.35.bb
@@ -13,6 +13,13 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/${P}.tar.bz2;name=kernel \
            file://defconfig "
 
 SRC_URI_append_dockstar = "file://dockstar.patch"
+SRC_URI_append_rx1950 = "file://0001-s3c2410_ts-add-fake-pressure-events.patch \
+			 file://0002-s3c2410_udc-2440-dual-packet-workaround.patch \
+			 file://0003-rx1950-add-battery-device.patch \
+			 file://0004-rx1950-add-LEDs-support.patch \
+			 file://0005-s3c24xx-DMA-don-t-use-autoreload-feature.patch \
+			 file://0006-s3cmci-minor-fixups.patch \
+			 file://0007-Add-s3c-adc-battery-driver.patch"
 
 SRC_URI[kernel.md5sum] = "091abeb4684ce03d1d936851618687b6"
 SRC_URI[kernel.sha256sum] = "18b2e2c336032e366c942622b77302cb05fc034fb19018f086a4ebc9ed41bfcf"
-- 
1.7.2.2



