Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1Oh60V-0005Qt-C1
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 21:21:40 +0200
Received: by qyk11 with SMTP id 11so3511078qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 12:21:25 -0700 (PDT)
Received: by 10.224.20.2 with SMTP id d2mr5349096qab.31.1281036084801;
	Thu, 05 Aug 2010 12:21:24 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id t1sm575385qcs.21.2010.08.05.12.21.22
	(version=SSLv3 cipher=RC4-MD5); Thu, 05 Aug 2010 12:21:23 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Aug 2010 14:21:22 -0500
Message-Id: <1281036082-14000-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] linux-omap-psp_2.6.32: Move camera sensor reset
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
X-List-Received-Date: Thu, 05 Aug 2010 19:21:40 -0000

Camera reset needed to be done after applying power.

Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 ...-Move-sensor-rest-to-after-applying-power.patch |   65 ++++++++++++++++++++
 recipes/linux/linux-omap-psp_2.6.32.bb             |    1 +
 2 files changed, 66 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-omap-psp-2.6.32/cam/0001-Move-sensor-rest-to-after-applying-power.patch

diff --git a/recipes/linux/linux-omap-psp-2.6.32/cam/0001-Move-sensor-rest-to-after-applying-power.patch b/recipes/linux/linux-omap-psp-2.6.32/cam/0001-Move-sensor-rest-to-after-applying-power.patch
new file mode 100644
index 0000000..4bb327e
--- /dev/null
+++ b/recipes/linux/linux-omap-psp-2.6.32/cam/0001-Move-sensor-rest-to-after-applying-power.patch
@@ -0,0 +1,65 @@
+From f3fdd3fb4e45b75722d68e5e380c0c71f83fffcf Mon Sep 17 00:00:00 2001
+From: Steve Kipisz <s-kipisz2@ti.com>
+Date: Thu, 5 Aug 2010 10:51:11 -0500
+Subject: [PATCH] Move sensor rest to after applying power.
+
+---
+ arch/arm/mach-omap2/board-omap3beagle-camera.c |   12 ++++++++----
+ 1 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-omap3beagle-camera.c b/arch/arm/mach-omap2/board-omap3beagle-camera.c
+index 520e1d8..39ac4b7 100644
+--- a/arch/arm/mach-omap2/board-omap3beagle-camera.c
++++ b/arch/arm/mach-omap2/board-omap3beagle-camera.c
+@@ -160,8 +160,6 @@ static int mt9v113_power_set(struct v4l2_int_device *s, enum v4l2_power power)
+ 	case V4L2_POWER_ON:
+ 
+ 		isp_configure_interface(vdev->cam->isp, &mt9v113_if_config);
+-		/* Set RESET_BAR to 0 */
+-		gpio_set_value(LEOPARD_RESET_GPIO, 0);
+ 
+ 		/* turn on VDD */
+ 		regulator_enable(cam_1v8_reg);
+@@ -170,6 +168,9 @@ static int mt9v113_power_set(struct v4l2_int_device *s, enum v4l2_power power)
+ 		regulator_enable(cam_2v8_reg);
+ 		mdelay(50);
+ 
++		/* Set RESET_BAR to 0 */
++		gpio_set_value(LEOPARD_RESET_GPIO, 0);
++
+ 		/* Enable EXTCLK */
+ 		isp_set_xclk(vdev->cam->isp, MT9V113_CLK_MIN*2, CAM_USE_XCLKA);
+ 		/*
+@@ -177,8 +178,10 @@ static int mt9v113_power_set(struct v4l2_int_device *s, enum v4l2_power power)
+ 		 * ((1000000 * 70) / 6000000) = aprox 12 us.
+ 		 */
+ 		udelay(12);
++
+ 		/* Set RESET_BAR to 1 */
+ 		gpio_set_value(LEOPARD_RESET_GPIO, 1);
++
+ 		/*
+ 		 * Wait at least 100 CLK cycles (w/EXTCLK = 6MHz, or CLK_MIN):
+ 		 * ((1000000 * 100) / 6000000) = aprox 17 us.
+@@ -317,8 +320,6 @@ static int mt9t112_power_set(struct v4l2_int_device *s, enum v4l2_power power)
+ 		isp_configure_interface(vdev->cam->isp, &mt9t112_if_config);
+ #endif
+ 
+-		/* Set RESET_BAR to 0 */
+-		gpio_set_value(LEOPARD_RESET_GPIO, 0);
+ 
+ 		/* turn on VDD */
+ 		regulator_enable(cam_1v8_reg);
+@@ -330,6 +331,9 @@ static int mt9t112_power_set(struct v4l2_int_device *s, enum v4l2_power power)
+ 
+ 		mdelay(50);
+ 
++		/* Set RESET_BAR to 0 */
++		gpio_set_value(LEOPARD_RESET_GPIO, 0);
++
+ 		/* Enable EXTCLK */
+ 		isp_set_xclk(vdev->cam->isp, 24000000, CAM_USE_XCLKA);
+ 
+-- 
+1.6.6.1
+
diff --git a/recipes/linux/linux-omap-psp_2.6.32.bb b/recipes/linux/linux-omap-psp_2.6.32.bb
index 5c1287b..887e3d5 100644
--- a/recipes/linux/linux-omap-psp_2.6.32.bb
+++ b/recipes/linux/linux-omap-psp_2.6.32.bb
@@ -130,6 +130,7 @@ SRC_URI = "git://arago-project.org/git/people/sriram/ti-psp-omap.git;protocol=gi
            file://cam/0071-mt9t112-Trigger-autofocus-at-the-end-of-context-swit.patch \
            file://cam/0002-omap3beagle-camera-Fix-dual-sensor-registration.patch \
            file://cam/0003-mt9v113-Fix-State-variable-handling.patch \
+	   file://cam/0001-Move-sensor-rest-to-after-applying-power.patch \
            file://0001-BeagleBoard-Adjust-USER-button-pin-for-xM.patch \
            file://defconfig"
 
-- 
1.5.6.4



