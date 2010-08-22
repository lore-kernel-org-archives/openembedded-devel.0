Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OnHMn-0000TP-18
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Aug 2010 22:42:25 +0200
Received: by qwa26 with SMTP id 26so1626220qwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 13:41:44 -0700 (PDT)
Received: by 10.224.67.81 with SMTP id q17mr2766302qai.102.1282509704682;
	Sun, 22 Aug 2010 13:41:44 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id l8sm6127913qck.30.2010.08.22.13.41.43
	(version=SSLv3 cipher=RC4-MD5); Sun, 22 Aug 2010 13:41:43 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Aug 2010 15:41:40 -0500
Message-Id: <1282509701-7944-2-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
In-Reply-To: <1282509701-7944-1-git-send-email-jkridner@beagleboard.org>
References: <1282509701-7944-1-git-send-email-jkridner@beagleboard.org>
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] u-boot: beagleboard: use user.scr when no boot.scr
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
X-List-Received-Date: Sun, 22 Aug 2010 20:42:25 -0000

Even if the USER button isn't pressed.  Still don't default to ramdisk
unless the USER button is pressed.

Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 ...rd-try-user.scr-even-if-USER-isn-t-presse.patch |   63 ++++++++++++++++++++
 recipes/u-boot/u-boot_git.bb                       |    3 +-
 2 files changed, 65 insertions(+), 1 deletions(-)
 create mode 100644 recipes/u-boot/u-boot-git/beagleboard/0001-beagleboard-try-user.scr-even-if-USER-isn-t-presse.patch

diff --git a/recipes/u-boot/u-boot-git/beagleboard/0001-beagleboard-try-user.scr-even-if-USER-isn-t-presse.patch b/recipes/u-boot/u-boot-git/beagleboard/0001-beagleboard-try-user.scr-even-if-USER-isn-t-presse.patch
new file mode 100644
index 0000000..ebc1831
--- /dev/null
+++ b/recipes/u-boot/u-boot-git/beagleboard/0001-beagleboard-try-user.scr-even-if-USER-isn-t-presse.patch
@@ -0,0 +1,63 @@
+From dcbcbcded81e92a30081663371e2bd458ecccaba Mon Sep 17 00:00:00 2001
+From: Jason Kridner <jkridner@beagleboard.org>
+Date: Fri, 20 Aug 2010 15:40:33 -0500
+Subject: [PATCH] beagleboard: try user.scr, even if USER isn't pressed
+
+But only do so after looking for boot.scr.
+
+Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
+---
+ include/configs/omap3_beagle.h |   33 ++++++++++++++++-----------------
+ 1 files changed, 16 insertions(+), 17 deletions(-)
+
+diff --git a/include/configs/omap3_beagle.h b/include/configs/omap3_beagle.h
+index 6bc992c..978b41a 100644
+--- a/include/configs/omap3_beagle.h
++++ b/include/configs/omap3_beagle.h
+@@ -272,27 +272,26 @@
+ 			"setenv bootscr user.scr;" \
+ 			"if run loadbootscript; then " \
+ 				"run bootscript; " \
+-			"else " \
+-				"if run loaduimage; then " \
+-					"if run loadramdisk; then " \
+-						"run ramboot; " \
+-					"else " \
+-						"run mmcboot; " \
+-					"fi; " \
+-				"fi; " \
+ 			"fi; " \
+-		"else " \
+-			"setenv bootscr boot.scr; " \
+-			"if run loadbootscript; then " \
+-				"run bootscript; " \
+-			"else " \
+-				"if run loaduimage; then " \
+-					"run mmcboot; " \
+-				"else run nandboot; " \
++			"if run loaduimage; then " \
++				"if run loadramdisk; then " \
++					"run ramboot; " \
+ 				"fi; " \
++				"run mmcboot; " \
+ 			"fi; " \
+ 		"fi; " \
+-	"else run nandboot; fi"
++		"if run loadbootscript; then " \
++			"run bootscript; " \
++		"fi; " \
++		"setenv bootscr user.scr;" \
++		"if run loadbootscript; then " \
++			"run bootscript; " \
++		"fi; " \
++		"if run loaduimage; then " \
++			"run mmcboot; " \
++		"fi; " \
++	"fi; " \
++	"run nandboot;"
+ 
+ #define CONFIG_AUTO_COMPLETE		1
+ /*
+-- 
+1.5.6.4
+
diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
index ae47ee5..90978f8 100644
--- a/recipes/u-boot/u-boot_git.bb
+++ b/recipes/u-boot/u-boot_git.bb
@@ -1,5 +1,5 @@
 require u-boot.inc
-PR ="r67"
+PR ="r68"
 
 FILESPATHPKG =. "u-boot-git:"
 
@@ -73,6 +73,7 @@ SRC_URI_beagleboard = "git://www.denx.de/git/u-boot.git;protocol=git \
                        file://0046-BeagleBoard-Add-camera-to-default-bootargs.patch \
 		       file://0001-BeagleBoard-move-ramdisk-parameters.patch \
 		       file://0001-beagleboard-improved-boot-env-var-setting.patch \
+		       file://0001-beagleboard-try-user.scr-even-if-USER-isn-t-presse.patch \
                        file://fw_env.config \
 "
 SRCREV_beagleboard = "ca6e1c136ddb720c3bb2cc043b99f7f06bc46c55"
-- 
1.5.6.4



