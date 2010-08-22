Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OnHMl-0000TN-D1
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Aug 2010 22:42:08 +0200
Received: by qyk4 with SMTP id 4so5187316qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 13:41:43 -0700 (PDT)
Received: by 10.229.52.38 with SMTP id f38mr1565404qcg.224.1282509703190;
	Sun, 22 Aug 2010 13:41:43 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id l8sm6127913qck.30.2010.08.22.13.41.41
	(version=SSLv3 cipher=RC4-MD5); Sun, 22 Aug 2010 13:41:42 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Aug 2010 15:41:39 -0500
Message-Id: <1282509701-7944-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] u-boot: beagleboard: improve env var setting
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
X-List-Received-Date: Sun, 22 Aug 2010 20:42:08 -0000

I was running out of room for all the arguments.  This should help.

Conflicts:

	recipes/u-boot/u-boot_git.bb

Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 ...beagleboard-improved-boot-env-var-setting.patch |   63 ++++++++++++++++++++
 recipes/u-boot/u-boot_git.bb                       |    3 +-
 2 files changed, 65 insertions(+), 1 deletions(-)
 create mode 100644 recipes/u-boot/u-boot-git/beagleboard/0001-beagleboard-improved-boot-env-var-setting.patch

diff --git a/recipes/u-boot/u-boot-git/beagleboard/0001-beagleboard-improved-boot-env-var-setting.patch b/recipes/u-boot/u-boot-git/beagleboard/0001-beagleboard-improved-boot-env-var-setting.patch
new file mode 100644
index 0000000..2e0afdf
--- /dev/null
+++ b/recipes/u-boot/u-boot-git/beagleboard/0001-beagleboard-improved-boot-env-var-setting.patch
@@ -0,0 +1,63 @@
+From 4d44d40658a2f0a499aa2d90e58167838efccfa4 Mon Sep 17 00:00:00 2001
+From: Jason Kridner <jkridner@beagleboard.org>
+Date: Wed, 18 Aug 2010 16:38:24 -0500
+Subject: [PATCH] beagleboard: improved boot env var setting
+
+* Enabled evaluation of expressions with 'setexpr'
+* Made room for a 64MB ramdisk by moving from 0x81600000 to 0x81000000
+* Removed expression from 'ramroot' that wouldn't be evaluated
+* Doubled console I/O buffer size from 256 to 512
+* Doubled maximum command arguments size from 16 to 32
+
+Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
+---
+ include/configs/omap3_beagle.h |    9 +++++----
+ 1 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/include/configs/omap3_beagle.h b/include/configs/omap3_beagle.h
+index 4f5c1d4..6bc992c 100644
+--- a/include/configs/omap3_beagle.h
++++ b/include/configs/omap3_beagle.h
+@@ -152,6 +152,7 @@
+ #define CONFIG_CMD_NAND		/* NAND support			*/
+ #define CONFIG_CMD_LED		/* LED support			*/
+ #define CONFIG_VIDEO_OMAP3	/* DSS Support			*/
++#define CONFIG_CMD_SETEXPR	/* Evaluate expressions		*/
+ 
+ #undef CONFIG_CMD_FLASH		/* flinfo, erase, protect	*/
+ #undef CONFIG_CMD_FPGA		/* FPGA configuration Support	*/
+@@ -201,7 +202,7 @@
+ 
+ #define CONFIG_EXTRA_ENV_SETTINGS \
+ 	"loadaddr=0x80200000\0" \
+-	"rdaddr=0x81600000\0" \
++	"rdaddr=0x81000000\0" \
+ 	"usbtty=cdc_acm\0" \
+ 	"console=ttyS2,115200n8\0" \
+ 	"optargs=\0" \
+@@ -217,7 +218,7 @@
+ 	"mmcrootfstype=ext3 rootwait\0" \
+ 	"nandroot=/dev/mtdblock4 rw\0" \
+ 	"nandrootfstype=jffs2\0" \
+-	"ramroot=/dev/ram0 rw ramdisk_size=65536 initrd=${rdaddr},64M\0" \
++	"ramroot=/dev/ram0 rw ramdisk_size=65536 initrd=0x81000000,64M\0" \
+ 	"ramrootfstype=ext2\0" \
+ 	"mmcargs=setenv bootargs console=${console} " \
+ 		"${optargs} " \
+@@ -301,11 +302,11 @@
+ #define CONFIG_SYS_HUSH_PARSER		/* use "hush" command parser */
+ #define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
+ #define CONFIG_SYS_PROMPT		"OMAP3 beagleboard.org # "
+-#define CONFIG_SYS_CBSIZE		256	/* Console I/O Buffer Size */
++#define CONFIG_SYS_CBSIZE		512	/* Console I/O Buffer Size */
+ /* Print Buffer Size */
+ #define CONFIG_SYS_PBSIZE		(CONFIG_SYS_CBSIZE + \
+ 					sizeof(CONFIG_SYS_PROMPT) + 16)
+-#define CONFIG_SYS_MAXARGS		16	/* max number of command args */
++#define CONFIG_SYS_MAXARGS		32	/* max number of command args */
+ /* Boot Argument Buffer Size */
+ #define CONFIG_SYS_BARGSIZE		(CONFIG_SYS_CBSIZE)
+ 
+-- 
+1.5.6.4
+
diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
index f82f570..ae47ee5 100644
--- a/recipes/u-boot/u-boot_git.bb
+++ b/recipes/u-boot/u-boot_git.bb
@@ -1,5 +1,5 @@
 require u-boot.inc
-PR ="r64"
+PR ="r67"
 
 FILESPATHPKG =. "u-boot-git:"
 
@@ -72,6 +72,7 @@ SRC_URI_beagleboard = "git://www.denx.de/git/u-boot.git;protocol=git \
                        file://0045-BeagleBoard-Enable-pullups-on-i2c2.patch \
                        file://0046-BeagleBoard-Add-camera-to-default-bootargs.patch \
 		       file://0001-BeagleBoard-move-ramdisk-parameters.patch \
+		       file://0001-beagleboard-improved-boot-env-var-setting.patch \
                        file://fw_env.config \
 "
 SRCREV_beagleboard = "ca6e1c136ddb720c3bb2cc043b99f7f06bc46c55"
-- 
1.5.6.4



