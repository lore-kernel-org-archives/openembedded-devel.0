Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Rzdcj-0004Pd-W9
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 01:30:30 +0100
Received: from mizar.localdomain (87.5.51.74) by smtp207.alice.it (8.6.023.02)
	id 4F05A6650581A86B; Tue, 21 Feb 2012 01:22:13 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Feb 2012 01:21:55 +0100
Message-Id: <4260ae51ceb9afe4111d63140db0bbc186898cca.1329780628.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1329780628.git.andrea.adami@gmail.com>
References: <cover.1329780628.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1329780628.git.andrea.adami@gmail.com>
References: <cover.1329780628.git.andrea.adami@gmail.com>
Subject: [meta-oe][PATCH 4/6] meta-initramfs: add initramfs-kexecboot images from meta-handheld
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
X-List-Received-Date: Tue, 21 Feb 2012 00:30:30 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../images/initramfs-kexecboot-image.bb            |   28 ++++++++++++++++++++
 .../images/initramfs-kexecboot-klibc-image.bb      |    5 +++
 2 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
 create mode 100644 meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb

diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
new file mode 100644
index 0000000..f306fb5
--- /dev/null
+++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
@@ -0,0 +1,28 @@
+# Initramfs image providing kexecboot
+# a linux as bootloader implementation
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
+
+# avoid circular dependencies
+EXTRA_IMAGEDEPENDS = ""
+
+IMAGE_INSTALL = "kexec kexecboot"
+
+# Do not pollute the initrd image with rootfs features
+IMAGE_FEATURES = ""
+
+export IMAGE_BASENAME = "initramfs-kexecboot-image"
+
+IMAGE_LINGUAS = ""
+IMAGE_LOGIN_MANAGER = ""
+IMAGE_INIT_MANAGER = ""
+IMAGE_INITSCRIPTS = ""
+IMAGE_DEV_MANAGER = ""
+
+FEED_DEPLOYDIR_BASE_URI = ""
+ONLINE_PACKAGE_MANAGEMENT = "none"
+
+inherit image
diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
new file mode 100644
index 0000000..e81f9ee
--- /dev/null
+++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
@@ -0,0 +1,5 @@
+require initramfs-kexecboot-image.bb
+
+IMAGE_INSTALL = "kexec-klibc kexecboot-klibc"
+
+export IMAGE_BASENAME = "initramfs-kexecboot-klibc-image"
-- 
1.7.3.4



