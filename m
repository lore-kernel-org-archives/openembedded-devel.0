Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SL19M-00088a-N4
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2012 01:52:32 +0200
Received: from mizar.localdomain (82.58.229.52) by smtp207.alice.it
	(8.6.023.02) id 4F05A6650C36FC65; Fri, 20 Apr 2012 01:43:03 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Apr 2012 01:41:52 +0200
Message-Id: <1334878912-24226-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-initramfs] [PATCH] linux-yocto-tiny-kexecboot: initial commit of version 3.2
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
X-List-Received-Date: Thu, 19 Apr 2012 23:52:32 -0000

* this is the skeleton for .bbappend recipes
* residing in the BSP layers

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-tiny-kexecboot_3.2.bb        |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bb

diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bb
new file mode 100644
index 0000000..edf8f3f
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bb
@@ -0,0 +1,17 @@
+require recipes-kernel/linux/linux-yocto-tiny_3.2.bb
+
+PACKAGES = ""
+PROVIDES = ""
+
+KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${PV}-${PR}-${MACHINE}"
+KERNEL_IMAGE_SYMLINK_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${MACHINE}"
+
+INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
+
+do_populate_sysroot() {
+        :
+}
+
+do_install() {
+        :
+}
-- 
1.7.3.4



