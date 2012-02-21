Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RzydY-0003zI-DR
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 23:56:44 +0100
Received: from mizar.localdomain (87.5.51.74) by smtp205.alice.it (8.6.023.02)
	id 4F421F7B00405EA9; Tue, 21 Feb 2012 23:48:25 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Feb 2012 23:48:16 +0100
Message-Id: <1329864496-27641-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <ef8b93c13cabd9e766e7f4d96df14710b36c3b87.1329780587.git.andrea.adami@gmail.com>
References: <ef8b93c13cabd9e766e7f4d96df14710b36c3b87.1329780587.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH v3 3/3] remove linux-kexecboot_3.1, now in meta-initramfs
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
X-List-Received-Date: Tue, 21 Feb 2012 22:56:44 -0000

* add .bbappend
* bump PR and INC_PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-kexecboot_3.1.bb       |    7 ----
 recipes-kernel/linux/linux-kexecboot_3.1.bbappend |   36 +++++++++++++++++++++
 2 files changed, 36 insertions(+), 7 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-kexecboot_3.1.bb
 create mode 100644 recipes-kernel/linux/linux-kexecboot_3.1.bbappend

diff --git a/recipes-kernel/linux/linux-kexecboot_3.1.bb b/recipes-kernel/linux/linux-kexecboot_3.1.bb
deleted file mode 100644
index 28dc370..0000000
--- a/recipes-kernel/linux/linux-kexecboot_3.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require linux-kexecboot.inc
-require linux-${PV}.inc
-
-PR = "${INC_PR}.7"
-S = "${WORKDIR}/linux-${PV}"
-
-COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
diff --git a/recipes-kernel/linux/linux-kexecboot_3.1.bbappend b/recipes-kernel/linux/linux-kexecboot_3.1.bbappend
new file mode 100644
index 0000000..74d63bb
--- /dev/null
+++ b/recipes-kernel/linux/linux-kexecboot_3.1.bbappend
@@ -0,0 +1,36 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/linux-kexecboot-${PV}:${THISDIR}/files:"
+
+COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
+
+# Note we set loglevel=3 and master console on serial to protect bootlogo.
+CMDLINE_c7x0 = "console=tty1 console=ttyS0,115200n8"
+CMDLINE_tosa = "console=tty1 console=ttyS0,115200n8"
+CMDLINE_poodle = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
+CMDLINE_akita = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
+CMDLINE_collie = "console=tty1 console=ttySA0,115200n8 fbcon=rotate:1 mem=64M"
+CMDLINE_spitz = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
+
+# Zaurus machines need kernel size-check.
+KERNEL_IMAGE_MAXSIZE_akita = "1294336"
+KERNEL_IMAGE_MAXSIZE_c7x0 = "1294336"
+KERNEL_IMAGE_MAXSIZE_collie = "1048576"
+KERNEL_IMAGE_MAXSIZE_poodle = "1294336"
+KERNEL_IMAGE_MAXSIZE_tosa = "1294336"
+KERNEL_IMAGE_MAXSIZE_spitz = "1294336"
+
+LOGO_SIZE ?= "."
+
+SRC_URI += "file://defconfig \
+           file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
+           "
+
+SRC_URI_append_collie = " \
+                         file://0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch \
+                         file://locomo_kbd_tweak-r2.patch \
+                         "
+
+SRC_URI_append_poodle = " \
+                         file://locomo_kbd_tweak-r2.patch \
+                         "
+
+
-- 
1.7.3.4



