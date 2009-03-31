Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1Lokke-0001HD-7H
	for openembedded-devel@lists.linuxtogo.org;
	Tue, 31 Mar 2009 22:40:04 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 6357F189477; Tue, 31 Mar 2009 22:40:13 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.linuxtogo.org
Date: Tue, 31 Mar 2009 22:40:13 +0200
Message-Id: <1238532013-3047-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] linux-omap 2.6.29: update mmc regulator patch
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
X-List-Received-Date: Tue, 31 Mar 2009 20:40:04 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 ...add-regulator-info-to-get-the-microSD-slo.patch |   46 ++++++--------------
 recipes/linux/linux-omap_2.6.29.bb                 |    2 +-
 2 files changed, 14 insertions(+), 34 deletions(-)

diff --git a/recipes/linux/linux-omap-2.6.29/0001-board-ldp-add-regulator-info-to-get-the-microSD-slo.patch b/recipes/linux/linux-omap-2.6.29/0001-board-ldp-add-regulator-info-to-get-the-microSD-slo.patch
index ddee308..49045f7 100644
--- a/recipes/linux/linux-omap-2.6.29/0001-board-ldp-add-regulator-info-to-get-the-microSD-slo.patch
+++ b/recipes/linux/linux-omap-2.6.29/0001-board-ldp-add-regulator-info-to-get-the-microSD-slo.patch
@@ -1,17 +1,20 @@
-From 0561e7124500418e913a3b91ddc09d4bd8dc5032 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@beagleboard.org>
+From 7efa7cc5b807cb840c62b5bf54bf47181c9b95a6 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@openembedded.org>
 Date: Mon, 30 Mar 2009 15:21:37 +0200
-Subject: [PATCH] ARM: OMAP: board-ldp: add regulator info to get the microSD slot working again
+Subject: [PATCH v2] ARM: OMAP: board-ldp: add regulator info to get the microSD slot working again
 
 The ldp board was left behind when other boards got updated. The ldp info was copied from the beagleboard board file and s/beagle/ldp/g
 
+Changes since v1:
+ * dropped vsim portion since only 4 pins are hooked up
+
 Signed-off-by: Koen Kooi <koen@beagleboard.org>
 ---
- arch/arm/mach-omap2/board-ldp.c |   55 +++++++++++++++++++++++++++++++++++++++
- 1 files changed, 55 insertions(+), 0 deletions(-)
+ arch/arm/mach-omap2/board-ldp.c |   32 ++++++++++++++++++++++++++++++++
+ 1 files changed, 32 insertions(+), 0 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-ldp.c b/arch/arm/mach-omap2/board-ldp.c
-index 30926b0..faf62f8 100644
+index 30926b0..19a5c15 100644
 --- a/arch/arm/mach-omap2/board-ldp.c
 +++ b/arch/arm/mach-omap2/board-ldp.c
 @@ -22,6 +22,7 @@
@@ -22,7 +25,7 @@ index 30926b0..faf62f8 100644
  #include <linux/i2c/twl4030.h>
  
  #include <mach/hardware.h>
-@@ -450,7 +451,17 @@ static struct twl4030_script *twl4030_scripts[] __initdata = {
+@@ -450,7 +451,16 @@ static struct twl4030_script *twl4030_scripts[] __initdata = {
  	&wrst_script,
  };
  
@@ -31,7 +34,6 @@ index 30926b0..faf62f8 100644
 +	 * devices' drivers should be managing these.
 +	 */
 +	{ .resource = RES_VMMC1, },
-+	{ .resource = RES_VSIM, },
 +	{ 0, },
 +};
 +
@@ -40,7 +42,7 @@ index 30926b0..faf62f8 100644
  	.scripts	= twl4030_scripts,
  	.size		= ARRAY_SIZE(twl4030_scripts),
  };
-@@ -474,6 +485,44 @@ static struct twl4030_madc_platform_data ldp_madc_data = {
+@@ -474,6 +484,25 @@ static struct twl4030_madc_platform_data ldp_madc_data = {
  	.irq_line	= 1,
  };
  
@@ -48,10 +50,6 @@ index 30926b0..faf62f8 100644
 +	.supply			= "vmmc",
 +};
 +
-+static struct regulator_consumer_supply ldp_vsim_supply = {
-+	.supply			= "vmmc_aux",
-+};
-+
 +/* VMMC1 for MMC1 pins CMD, CLK, DAT0..DAT3 (20 mA, plus card == max 220 mA) */
 +static struct regulator_init_data ldp_vmmc1 = {
 +	.constraints = {
@@ -67,41 +65,23 @@ index 30926b0..faf62f8 100644
 +	.consumer_supplies	= &ldp_vmmc1_supply,
 +};
 +
-+/* VSIM for MMC1 pins DAT4..DAT7 (2 mA, plus card == max 50 mA) */
-+static struct regulator_init_data ldp_vsim = {
-+	.constraints = {
-+		.min_uV			= 1800000,
-+		.max_uV			= 3000000,
-+		.valid_modes_mask	= REGULATOR_MODE_NORMAL
-+					| REGULATOR_MODE_STANDBY,
-+		.valid_ops_mask		= REGULATOR_CHANGE_VOLTAGE
-+					| REGULATOR_CHANGE_MODE
-+					| REGULATOR_CHANGE_STATUS,
-+	},
-+	.num_consumer_supplies	= 1,
-+	.consumer_supplies	= &ldp_vsim_supply,
-+};
-+
  static struct twl4030_platform_data ldp_twldata = {
  	.irq_base	= TWL4030_IRQ_BASE,
  	.irq_end	= TWL4030_IRQ_END,
-@@ -483,6 +532,8 @@ static struct twl4030_platform_data ldp_twldata = {
+@@ -483,6 +512,7 @@ static struct twl4030_platform_data ldp_twldata = {
  	.madc		= &ldp_madc_data,
  	.usb		= &ldp_usb_data,
  	.power		= &sdp3430_t2scripts_data,
 +	.vmmc1		= &ldp_vmmc1,
-+	.vsim		= &ldp_vsim,
  	.gpio		= &ldp_gpio_data,
  	.keypad		= &ldp_kp_twl4030_data,
  };
-@@ -530,6 +581,10 @@ static void __init omap_ldp_init(void)
+@@ -530,6 +560,8 @@ static void __init omap_ldp_init(void)
  	omap_serial_init();
  	usb_musb_init();
  	twl4030_mmc_init(mmc);
 +	/* link regulators to MMC adapters */
 +	ldp_vmmc1_supply.dev = mmc[0].dev;
-+	ldp_vsim_supply.dev = mmc[0].dev;
-+	
  }
  
  static void __init omap_ldp_map_io(void)
diff --git a/recipes/linux/linux-omap_2.6.29.bb b/recipes/linux/linux-omap_2.6.29.bb
index 86827fd..f5c20ba 100644
--- a/recipes/linux/linux-omap_2.6.29.bb
+++ b/recipes/linux/linux-omap_2.6.29.bb
@@ -10,7 +10,7 @@ DEFAULT_PREFERENCE = "-1"
 
 SRCREV = "90e758af52ba803cba233fabee81176d99589f09"
 
-PR = "r1+gitr${SRCREV}"
+PR = "r2+gitr${SRCREV}"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
 	   file://defconfig"
-- 
1.5.6.5



