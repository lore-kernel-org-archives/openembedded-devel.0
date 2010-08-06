Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OhNXz-0000nN-Aq
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 16:05:55 +0200
Received: by pvg6 with SMTP id 6so2925pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Aug 2010 07:05:11 -0700 (PDT)
Received: by 10.143.15.4 with SMTP id s4mr2846484wfi.192.1281103511303;
	Fri, 06 Aug 2010 07:05:11 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id z1sm1469932wfd.3.2010.08.06.07.05.08
	(version=SSLv3 cipher=RC4-MD5); Fri, 06 Aug 2010 07:05:09 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Aug 2010 09:05:07 -0500
Message-Id: <1281103507-14888-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
In-Reply-To: <1281099635-11724-1-git-send-email-jkridner@beagleboard.org>
References: <1281099635-11724-1-git-send-email-jkridner@beagleboard.org>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] linux-omap-psp: Add camera bootarg
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
X-List-Received-Date: Fri, 06 Aug 2010 14:06:24 -0000


Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 conf/machine/include/omap3.inc                     |    2 +-
 .../cam/0001-omap3beagle-Add-camera-bootarg.patch  |  108 ++++++++++++++++++++
 recipes/linux/linux-omap-psp_2.6.32.bb             |    1 +
 3 files changed, 110 insertions(+), 1 deletions(-)
 create mode 100644 recipes/linux/linux-omap-psp-2.6.32/cam/0001-omap3beagle-Add-camera-bootarg.patch

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 7c30288..0b8e42e 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -3,7 +3,7 @@ SOC_FAMILY = "omap3"
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r86"
+MACHINE_KERNEL_PR = "r87"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes/linux/linux-omap-psp-2.6.32/cam/0001-omap3beagle-Add-camera-bootarg.patch b/recipes/linux/linux-omap-psp-2.6.32/cam/0001-omap3beagle-Add-camera-bootarg.patch
new file mode 100644
index 0000000..0d93cee
--- /dev/null
+++ b/recipes/linux/linux-omap-psp-2.6.32/cam/0001-omap3beagle-Add-camera-bootarg.patch
@@ -0,0 +1,108 @@
+From c14444442ebdb0c717931557bebbeab314e44bf3 Mon Sep 17 00:00:00 2001
+From: Sergio Aguirre <saaguirre@ti.com>
+Date: Thu, 22 Jul 2010 15:38:43 -0500
+Subject: [PATCH 1/2] omap3beagle: Add camera bootarg
+
+This adds a new 'camera' bootarg, with (so far) 2 new possible types:
+- lbcmvga: Leopard Board Camera Module: MT9V113 VGA
+- lbcm3m1: Leopard Board Camera Module: MT9T111 3MP
+
+Also, cleans up a little bit the current i2c2 bus init code.
+
+Signed-off-by: Sergio Aguirre <saaguirre@ti.com>
+---
+ arch/arm/mach-omap2/board-omap3beagle.c |   42 +++++++++++++++++++++++++------
+ 1 files changed, 34 insertions(+), 8 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-omap3beagle.c b/arch/arm/mach-omap2/board-omap3beagle.c
+index f93616b..2677b41 100644
+--- a/arch/arm/mach-omap2/board-omap3beagle.c
++++ b/arch/arm/mach-omap2/board-omap3beagle.c
+@@ -89,6 +89,7 @@ extern struct mt9t112_platform_data mt9t112_pdata;
+ #define NAND_BLOCK_SIZE		SZ_128K
+ 
+ char expansionboard_name[16];
++char cameraboard_name[16];
+ 
+ #if defined(CONFIG_ENC28J60) || defined(CONFIG_ENC28J60_MODULE)
+ 
+@@ -595,13 +596,16 @@ static struct i2c_board_info __initdata beagle_zippy_i2c2_boardinfo[] = {
+ static struct i2c_board_info __initdata beagle_zippy_i2c2_boardinfo[] = {};
+ #endif
+ 
+-static struct i2c_board_info __initdata beagle_i2c2_boardinfo[] = {
++static struct i2c_board_info __initdata beagle_lbcmvga_i2c2_boardinfo[] = {
+ #if defined(CONFIG_VIDEO_MT9V113) || defined(CONFIG_VIDEO_MT9V113_MODULE)
+ 	{
+ 		I2C_BOARD_INFO("mt9v113", MT9V113_I2C_ADDR),
+ 		.platform_data	= &mt9v113_pdata,
+ 	},
+ #endif
++};
++
++static struct i2c_board_info __initdata beagle_lbcm3m1_i2c2_boardinfo[] = {
+ #if defined(CONFIG_VIDEO_MT9T112) || defined(CONFIG_VIDEO_MT9T112_MODULE)
+ 	{
+ 		I2C_BOARD_INFO("mt9t112", MT9T112_I2C_ADDR),
+@@ -614,15 +618,27 @@ static int __init omap3_beagle_i2c_init(void)
+ {
+ 	omap_register_i2c_bus(1, 2600, beagle_i2c1_boardinfo,
+ 			ARRAY_SIZE(beagle_i2c1_boardinfo));
+-	if(!strcmp(expansionboard_name, "zippy") || !strcmp(expansionboard_name, "zippy2"))
+-	{
+-		printk(KERN_INFO "Beagle expansionboard: registering i2c2 bus for zippy/zippy2\n");
++
++	if (!strcmp(expansionboard_name, "zippy") ||
++	   !strcmp(expansionboard_name, "zippy2")) {
++		printk(KERN_INFO "Beagle expansionboard:"
++				 " registering i2c2 bus for zippy/zippy2\n");
+ 		omap_register_i2c_bus(2, 400,  beagle_zippy_i2c2_boardinfo,
+ 				ARRAY_SIZE(beagle_zippy_i2c2_boardinfo));
+-	} else
+-	{
+-		omap_register_i2c_bus(2, 400,  beagle_i2c2_boardinfo,
+-				ARRAY_SIZE(beagle_i2c2_boardinfo));
++	} else {
++		if (!strcmp(cameraboard_name, "lbcmvga")) {
++			printk(KERN_INFO "Beagle cameraboard:"
++					 " registering i2c2 bus for lbcmvga\n");
++			omap_register_i2c_bus(2, 400,  beagle_lbcmvga_i2c2_boardinfo,
++					ARRAY_SIZE(beagle_lbcmvga_i2c2_boardinfo));
++		} else if (!strcmp(cameraboard_name, "lbcm3m1")) {
++			printk(KERN_INFO "Beagle cameraboard:"
++					 " registering i2c2 bus for lbcm3m1\n");
++			omap_register_i2c_bus(2, 400,  beagle_lbcm3m1_i2c2_boardinfo,
++					ARRAY_SIZE(beagle_lbcm3m1_i2c2_boardinfo));
++		} else {
++			omap_register_i2c_bus(2, 400, NULL, 0);
++		}
+ 	}
+ 	/* Bus 3 is attached to the DVI port where devices like the pico DLP
+ 	 * projector don't work reliably with 400kHz */
+@@ -825,6 +841,15 @@ static int __init expansionboard_setup(char *str)
+ 	return 0;
+ }
+ 
++static int __init cameraboard_setup(char *str)
++{
++	if (!str)
++		return -EINVAL;
++	strncpy(cameraboard_name, str, 16);
++	printk(KERN_INFO "Beagle cameraboard: %s\n", cameraboard_name);
++	return 0;
++}
++
+ static void __init omap3_beagle_init(void)
+ {
+ 	omap3_mux_init(board_mux, OMAP_PACKAGE_CBB);
+@@ -915,6 +940,7 @@ static void __init omap3_beagle_map_io(void)
+ }
+ 
+ early_param("buddy", expansionboard_setup);
++early_param("camera", cameraboard_setup);
+ 
+ MACHINE_START(OMAP3_BEAGLE, "OMAP3 Beagle Board")
+ 	/* Maintainer: Syed Mohammed Khasim - http://beagleboard.org */
+-- 
+1.6.3.3
+
diff --git a/recipes/linux/linux-omap-psp_2.6.32.bb b/recipes/linux/linux-omap-psp_2.6.32.bb
index 887e3d5..03706cd 100644
--- a/recipes/linux/linux-omap-psp_2.6.32.bb
+++ b/recipes/linux/linux-omap-psp_2.6.32.bb
@@ -132,6 +132,7 @@ SRC_URI = "git://arago-project.org/git/people/sriram/ti-psp-omap.git;protocol=gi
            file://cam/0003-mt9v113-Fix-State-variable-handling.patch \
 	   file://cam/0001-Move-sensor-rest-to-after-applying-power.patch \
            file://0001-BeagleBoard-Adjust-USER-button-pin-for-xM.patch \
+	   file://0001-omap3beagle-Add-camera-bootarg.patch \
            file://defconfig"
 
 SRC_URI_append_beagleboard = " file://logo_linux_clut224.ppm \
-- 
1.5.6.4



