Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OlRsX-0004xi-DX
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 21:31:40 +0200
Received: by wwb22 with SMTP id 22so5115wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 12:30:58 -0700 (PDT)
Received: by 10.227.151.195 with SMTP id d3mr5981947wbw.170.1282073457879;
	Tue, 17 Aug 2010 12:30:57 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id p42sm4333294weq.36.2010.08.17.12.30.56
	(version=SSLv3 cipher=RC4-MD5); Tue, 17 Aug 2010 12:30:57 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Aug 2010 14:30:55 -0500
Message-Id: <1282073455-11905-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] u-boot: increase SD clock speed hack
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
X-List-Received-Date: Tue, 17 Aug 2010 19:31:40 -0000


Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 ...-OMAP3-MMC-hack-to-always-use-48MHz-clock.patch |   30 ++++++++++++++++++++
 recipes/u-boot/u-boot_git.bb                       |    3 +-
 2 files changed, 32 insertions(+), 1 deletions(-)
 create mode 100644 recipes/u-boot/u-boot-git/beagleboard/0001-OMAP3-MMC-hack-to-always-use-48MHz-clock.patch

diff --git a/recipes/u-boot/u-boot-git/beagleboard/0001-OMAP3-MMC-hack-to-always-use-48MHz-clock.patch b/recipes/u-boot/u-boot-git/beagleboard/0001-OMAP3-MMC-hack-to-always-use-48MHz-clock.patch
new file mode 100644
index 0000000..9a85615
--- /dev/null
+++ b/recipes/u-boot/u-boot-git/beagleboard/0001-OMAP3-MMC-hack-to-always-use-48MHz-clock.patch
@@ -0,0 +1,30 @@
+From 10392e88ff1be6314884ea3c9e675849efdef195 Mon Sep 17 00:00:00 2001
+From: Jason Kridner <jkridner@beagleboard.org>
+Date: Tue, 17 Aug 2010 14:26:32 -0500
+Subject: [PATCH] OMAP3: MMC: hack to always use 48MHz clock
+
+Steve Kipisz tested this with several cards and will propose a longer
+term fix in the future, but this provides a huge speed increase for
+loading a big ramdisk image.
+
+Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
+---
+ drivers/mmc/omap3_mmc.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/mmc/omap3_mmc.c b/drivers/mmc/omap3_mmc.c
+index bf650ba..c6bc6b5 100644
+--- a/drivers/mmc/omap3_mmc.c
++++ b/drivers/mmc/omap3_mmc.c
+@@ -139,7 +139,7 @@ unsigned char mmc_clock_config(unsigned int iclk, unsigned short clk_div)
+ 		val = MMC_400kHz_CLK;
+ 		break;
+ 	case CLK_MISC:
+-		val = clk_div;
++		val = 2; /* always use 48MHz (hack, but works so far) */
+ 		break;
+ 	default:
+ 		return 0;
+-- 
+1.5.6.4
+
diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
index 5a46961..16d19d4 100644
--- a/recipes/u-boot/u-boot_git.bb
+++ b/recipes/u-boot/u-boot_git.bb
@@ -1,5 +1,5 @@
 require u-boot.inc
-PR ="r64"
+PR ="r65"
 
 FILESPATHPKG =. "u-boot-git:"
 
@@ -72,6 +72,7 @@ SRC_URI_beagleboard = "git://www.denx.de/git/u-boot.git;protocol=git \
                        file://0045-BeagleBoard-Enable-pullups-on-i2c2.patch \
                        file://0046-BeagleBoard-Add-camera-to-default-bootargs.patch \
 		       file://0001-BeagleBoard-move-ramdisk-parameters.patch \
+		       file://0001-OMAP3-MMC-hack-to-always-use-48MHz-clock.patch \
                        file://fw_env.config \
 "
 SRCREV_beagleboard = "ca6e1c136ddb720c3bb2cc043b99f7f06bc46c55"
-- 
1.5.6.4



