Received: from smtp-out26.alice.it ([85.33.2.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NvJzo-00043B-2z
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 01:35:24 +0100
Received: from FBCMMO04.fbc.local ([192.168.184.135]) by smtp-out26.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 27 Mar 2010 01:31:10 +0100
Received: from FBCMCL01B07.fbc.local ([192.168.171.45]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 27 Mar 2010 01:30:50 +0100
Received: from localhost.localdomain ([87.8.251.207]) by FBCMCL01B07.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 27 Mar 2010 01:30:49 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Mar 2010 01:30:19 +0100
Message-Id: <1269649819-12028-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <d1b08f941003261705k1f97e489wa30f59d684b69a38@mail.gmail.com>
References: <d1b08f941003261705k1f97e489wa30f59d684b69a38@mail.gmail.com>
X-OriginalArrivalTime: 27 Mar 2010 00:30:49.0515 (UTC)
	FILETIME=[BFF057B0:01CACD44]
X-SA-Exim-Connect-IP: 85.33.2.26
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 307/307] [STABLE][PATCH][v2] zaurus: unbreak build of initramfs-kexecboot-image (thus others too...)
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
X-List-Received-Date: Sat, 27 Mar 2010 00:35:24 -0000

* partial sync with old .dev checkout

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus-2.6.inc            |    1 +
 conf/machine/include/zaurus-clamshell.inc      |    1 +
 recipes/kexecboot/initramfs-kexecboot-image.bb |    6 +++---
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/conf/machine/include/zaurus-2.6.inc b/conf/machine/include/zaurus-2.6.inc
index 5ce1cdc..942660a 100644
--- a/conf/machine/include/zaurus-2.6.inc
+++ b/conf/machine/include/zaurus-2.6.inc
@@ -12,6 +12,7 @@ EXTRA_IMAGECMD_jffs2 = "--little-endian --eraseblock=${ERASEBLOCKSIZE} --pad --f
 
 ZAURUS-UPDATER = "zaurus-updater"
 EXTRA_IMAGEDEPENDS += "${ZAURUS-UPDATER}"
+KEXECBOOT_IMAGEDEPENDS += "${ZAURUS-UPDATER}"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 
diff --git a/conf/machine/include/zaurus-clamshell.inc b/conf/machine/include/zaurus-clamshell.inc
index 1421630..714380e 100644
--- a/conf/machine/include/zaurus-clamshell.inc
+++ b/conf/machine/include/zaurus-clamshell.inc
@@ -4,6 +4,7 @@ UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
 EXTRA_IMAGEDEPENDS += "sharp-flash-header-c700"
+KEXECBOOT_IMAGEDEPENDS += "sharp-flash-header-c700"
 
 IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime -m favourlzo \
                    --output=${T}/${IMAGE_NAME}.rootfs.jffs2 --pad --little-endian --eraseblock=${ERASEBLOCKSIZE} -n \
diff --git a/recipes/kexecboot/initramfs-kexecboot-image.bb b/recipes/kexecboot/initramfs-kexecboot-image.bb
index 7fc2b79..a97ca34 100644
--- a/recipes/kexecboot/initramfs-kexecboot-image.bb
+++ b/recipes/kexecboot/initramfs-kexecboot-image.bb
@@ -1,7 +1,7 @@
 #initramfs image which mounts the rootfilesystem and kexecs a kernel from there
 
 ONLINE_PACKAGE_MANAGEMENT = "none"
-IMAGE_FSTYPES += " cpio.gz"
+IMAGE_FSTYPES += "cpio.gz"
 inherit image
 
 # These devices need mmcblk* to be 254 instead of 179
@@ -10,7 +10,8 @@ IMAGE_DEVICE_TABLES_h2200 = "device_table-oldmmc.txt"
 
 export IMAGE_BASENAME = "initramfs-kexecboot-image"
 
-EXTRA_IMAGEDEPENDS = ""
+KEXECBOOT_IMAGEDEPENDS ?= ""
+EXTRA_IMAGEDEPENDS = "${KEXECBOOT_IMAGEDEPENDS}"
 IMAGE_INSTALL = "kexecboot"
 IMAGE_LINGUAS = ""
 
@@ -18,4 +19,3 @@ IMAGE_LOGIN_MANAGER = ""
 IMAGE_INIT_MANAGER = ""
 IMAGE_INITSCRIPTS = ""
 IMAGE_DEV_MANAGER = ""
-#ONLINE_PACKAGE_MANAGEMENT = "none"
-- 
1.6.4.4



