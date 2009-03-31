Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1Lokkb-0001Fp-HI
	for openembedded-devel@lists.linuxtogo.org;
	Tue, 31 Mar 2009 22:40:01 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id A2B3F189477; Tue, 31 Mar 2009 22:40:10 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.linuxtogo.org
Date: Tue, 31 Mar 2009 22:40:10 +0200
Message-Id: <1238532010-2811-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] linux-omap: add patch to fix mmc support and update defconfig
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
X-List-Received-Date: Tue, 31 Mar 2009 20:40:02 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 ...add-regulator-info-to-get-the-microSD-slo.patch |  110 ++++++++++++++++++++
 recipes/linux/linux-omap-2.6.29/omapzoom/defconfig |    6 +-
 recipes/linux/linux-omap_2.6.29.bb                 |    3 +-
 3 files changed, 115 insertions(+), 4 deletions(-)
 create mode 100644 recipes/linux/linux-omap-2.6.29/0001-board-ldp-add-regulator-info-to-get-the-microSD-slo.patch

diff --git a/recipes/linux/linux-omap-2.6.29/0001-board-ldp-add-regulator-info-to-get-the-microSD-slo.patch b/recipes/linux/linux-omap-2.6.29/0001-board-ldp-add-regulator-info-to-get-the-microSD-slo.patch
new file mode 100644
index 0000000..ddee308
--- /dev/null
+++ b/recipes/linux/linux-omap-2.6.29/0001-board-ldp-add-regulator-info-to-get-the-microSD-slo.patch
@@ -0,0 +1,110 @@
+From 0561e7124500418e913a3b91ddc09d4bd8dc5032 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@beagleboard.org>
+Date: Mon, 30 Mar 2009 15:21:37 +0200
+Subject: [PATCH] ARM: OMAP: board-ldp: add regulator info to get the microSD slot working again
+
+The ldp board was left behind when other boards got updated. The ldp info was copied from the beagleboard board file and s/beagle/ldp/g
+
+Signed-off-by: Koen Kooi <koen@beagleboard.org>
+---
+ arch/arm/mach-omap2/board-ldp.c |   55 +++++++++++++++++++++++++++++++++++++++
+ 1 files changed, 55 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-ldp.c b/arch/arm/mach-omap2/board-ldp.c
+index 30926b0..faf62f8 100644
+--- a/arch/arm/mach-omap2/board-ldp.c
++++ b/arch/arm/mach-omap2/board-ldp.c
+@@ -22,6 +22,7 @@
+ #include <linux/clk.h>
+ #include <linux/spi/spi.h>
+ #include <linux/spi/ads7846.h>
++#include <linux/regulator/machine.h>
+ #include <linux/i2c/twl4030.h>
+ 
+ #include <mach/hardware.h>
+@@ -450,7 +451,17 @@ static struct twl4030_script *twl4030_scripts[] __initdata = {
+ 	&wrst_script,
+ };
+ 
++static const struct twl4030_resconfig ldp_resconfig[] = {
++	/* disable regulators that u-boot left enabled; the
++	 * devices' drivers should be managing these.
++	 */
++	{ .resource = RES_VMMC1, },
++	{ .resource = RES_VSIM, },
++	{ 0, },
++};
++
+ static struct twl4030_power_data sdp3430_t2scripts_data __initdata = {
++	.resource_config	= ldp_resconfig,
+ 	.scripts	= twl4030_scripts,
+ 	.size		= ARRAY_SIZE(twl4030_scripts),
+ };
+@@ -474,6 +485,44 @@ static struct twl4030_madc_platform_data ldp_madc_data = {
+ 	.irq_line	= 1,
+ };
+ 
++static struct regulator_consumer_supply ldp_vmmc1_supply = {
++	.supply			= "vmmc",
++};
++
++static struct regulator_consumer_supply ldp_vsim_supply = {
++	.supply			= "vmmc_aux",
++};
++
++/* VMMC1 for MMC1 pins CMD, CLK, DAT0..DAT3 (20 mA, plus card == max 220 mA) */
++static struct regulator_init_data ldp_vmmc1 = {
++	.constraints = {
++		.min_uV			= 1850000,
++		.max_uV			= 3150000,
++		.valid_modes_mask	= REGULATOR_MODE_NORMAL
++					| REGULATOR_MODE_STANDBY,
++		.valid_ops_mask		= REGULATOR_CHANGE_VOLTAGE
++					| REGULATOR_CHANGE_MODE
++					| REGULATOR_CHANGE_STATUS,
++	},
++	.num_consumer_supplies	= 1,
++	.consumer_supplies	= &ldp_vmmc1_supply,
++};
++
++/* VSIM for MMC1 pins DAT4..DAT7 (2 mA, plus card == max 50 mA) */
++static struct regulator_init_data ldp_vsim = {
++	.constraints = {
++		.min_uV			= 1800000,
++		.max_uV			= 3000000,
++		.valid_modes_mask	= REGULATOR_MODE_NORMAL
++					| REGULATOR_MODE_STANDBY,
++		.valid_ops_mask		= REGULATOR_CHANGE_VOLTAGE
++					| REGULATOR_CHANGE_MODE
++					| REGULATOR_CHANGE_STATUS,
++	},
++	.num_consumer_supplies	= 1,
++	.consumer_supplies	= &ldp_vsim_supply,
++};
++
+ static struct twl4030_platform_data ldp_twldata = {
+ 	.irq_base	= TWL4030_IRQ_BASE,
+ 	.irq_end	= TWL4030_IRQ_END,
+@@ -483,6 +532,8 @@ static struct twl4030_platform_data ldp_twldata = {
+ 	.madc		= &ldp_madc_data,
+ 	.usb		= &ldp_usb_data,
+ 	.power		= &sdp3430_t2scripts_data,
++	.vmmc1		= &ldp_vmmc1,
++	.vsim		= &ldp_vsim,
+ 	.gpio		= &ldp_gpio_data,
+ 	.keypad		= &ldp_kp_twl4030_data,
+ };
+@@ -530,6 +581,10 @@ static void __init omap_ldp_init(void)
+ 	omap_serial_init();
+ 	usb_musb_init();
+ 	twl4030_mmc_init(mmc);
++	/* link regulators to MMC adapters */
++	ldp_vmmc1_supply.dev = mmc[0].dev;
++	ldp_vsim_supply.dev = mmc[0].dev;
++	
+ }
+ 
+ static void __init omap_ldp_map_io(void)
+-- 
+1.6.2
+
diff --git a/recipes/linux/linux-omap-2.6.29/omapzoom/defconfig b/recipes/linux/linux-omap-2.6.29/omapzoom/defconfig
index 194ec72..d2d2ee5 100644
--- a/recipes/linux/linux-omap-2.6.29/omapzoom/defconfig
+++ b/recipes/linux/linux-omap-2.6.29/omapzoom/defconfig
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Linux kernel version: 2.6.29-omap1
-# Mon Mar 30 12:32:35 2009
+# Mon Mar 30 15:25:29 2009
 #
 CONFIG_ARM=y
 CONFIG_SYS_SUPPORTS_APM_EMULATION=y
@@ -1773,8 +1773,8 @@ CONFIG_DETECT_SOFTLOCKUP=y
 # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
 CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=0
 CONFIG_SCHED_DEBUG=y
-# CONFIG_SCHEDSTATS is not set
-# CONFIG_TIMER_STATS is not set
+CONFIG_SCHEDSTATS=y
+CONFIG_TIMER_STATS=y
 # CONFIG_DEBUG_OBJECTS is not set
 # CONFIG_DEBUG_SLAB is not set
 # CONFIG_DEBUG_RT_MUTEXES is not set
diff --git a/recipes/linux/linux-omap_2.6.29.bb b/recipes/linux/linux-omap_2.6.29.bb
index cf1a93c..86827fd 100644
--- a/recipes/linux/linux-omap_2.6.29.bb
+++ b/recipes/linux/linux-omap_2.6.29.bb
@@ -10,7 +10,7 @@ DEFAULT_PREFERENCE = "-1"
 
 SRCREV = "90e758af52ba803cba233fabee81176d99589f09"
 
-PR = "r0+gitr${SRCREV}"
+PR = "r1+gitr${SRCREV}"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
 	   file://defconfig"
@@ -21,6 +21,7 @@ SRC_URI_append = " \
            file://read_die_ids.patch;patch=1 \
            file://fix-install.patch;patch=1 \
            file://DSS2.diff;patch=1 \
+           file://0001-board-ldp-add-regulator-info-to-get-the-microSD-slo.patch;patch=1 \
 "
 
 
-- 
1.5.6.5



