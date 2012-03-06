Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S53FP-0002NX-Hl
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 23:52:47 +0100
Received: from mizar.localdomain (87.14.251.210) by smtp205.alice.it
	(8.6.023.02) id 4F421F7B01EC432E; Tue, 6 Mar 2012 23:44:13 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2012 23:44:04 +0100
Message-Id: <1331073844-5052-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1331073844-5052-1-git-send-email-andrea.adami@gmail.com>
References: <1331073844-5052-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 3/3] linux_(3.1|3.2|git): simplify and embed the linux-${PV}.inc
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
X-List-Received-Date: Tue, 06 Mar 2012 22:52:47 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-3.1.inc |   19 -------------------
 recipes-kernel/linux/linux-3.2.inc |   20 --------------------
 recipes-kernel/linux/linux-git.inc |   23 -----------------------
 recipes-kernel/linux/linux_3.1.bb  |   22 ++++++++++++++++++++--
 recipes-kernel/linux/linux_3.2.bb  |   23 ++++++++++++++++++++++-
 recipes-kernel/linux/linux_git.bb  |   26 +++++++++++++++++++++++++-
 6 files changed, 67 insertions(+), 66 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-3.1.inc
 delete mode 100644 recipes-kernel/linux/linux-3.2.inc
 delete mode 100644 recipes-kernel/linux/linux-git.inc

diff --git a/recipes-kernel/linux/linux-3.1.inc b/recipes-kernel/linux/linux-3.1.inc
deleted file mode 100644
index 34bf4a8..0000000
--- a/recipes-kernel/linux/linux-3.1.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.10.bz2;apply=yes;name=stablepatch \
-           file://defconfig \
-           file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
-           "
-
-SRC_URI_append_collie = " \
-                         file://0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch \
-                         file://locomo_kbd_tweak-r2.patch \
-                         "
-
-SRC_URI_append_poodle = " \
-                         file://locomo_kbd_tweak-r2.patch \
-                         "
-
-SRC_URI[kernel.md5sum] = "8d43453f8159b2332ad410b19d86a931"
-SRC_URI[kernel.sha256sum] = "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
-SRC_URI[stablepatch.md5sum] = "a8e1c25a93a685ec2a1c3a808715fe9d"
-SRC_URI[stablepatch.sha256sum] = "f25126052d1a083a415ddd313b40c7fcdb3742f40474cb4a826af7e43fee29d3"
diff --git a/recipes-kernel/linux/linux-3.2.inc b/recipes-kernel/linux/linux-3.2.inc
deleted file mode 100644
index 6cb7fad..0000000
--- a/recipes-kernel/linux/linux-3.2.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.9.bz2;apply=yes;name=stablepatch \
-           file://defconfig \
-           file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
-           "
-
-SRC_URI_append_collie = " \
-                         file://0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch \
-                         file://locomo_kbd_tweak-r2.patch \
-                         file://collie_remove_irq_to_gpio.patch \
-                         "
-
-SRC_URI_append_poodle = " \
-                         file://locomo_kbd_tweak-r2.patch \
-                         "
-
-SRC_URI[kernel.md5sum] = "8d43453f8159b2332ad410b19d86a931"
-SRC_URI[kernel.sha256sum] = "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
-SRC_URI[stablepatch.md5sum] = "4610f3e62a5446422d1e81a90ab3cd06"
-SRC_URI[stablepatch.sha256sum] = "7836685dee161a4ffaf887b8e2f8dd3cb7712e690d0942fefb1db09bb6ad3871"
diff --git a/recipes-kernel/linux/linux-git.inc b/recipes-kernel/linux/linux-git.inc
deleted file mode 100644
index 32a6d47..0000000
--- a/recipes-kernel/linux/linux-git.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-KERNEL_RELEASE = "3.2.0-rc7"
-OLD_KERNEL_RELEASE = "3.1.99"
-PV = "${OLD_KERNEL_RELEASE}+${KERNEL_RELEASE}+gitr${SRCPV}"
-
-SRCREV = "371de6e4e0042adf4f9b54c414154f57414ddd37"
-
-CMDLINE_DEBUG = "debug"
-
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git;protocol=git;branch=master \
-           file://defconfig"
-S = "${WORKDIR}/git"
-
-do_configure_prepend() {
-#otherwise it gets extra '+' "2.6.37+"
-#because:
-#$ scripts/setlocalversion . => +
-#$ make kernelversion => 2.6.37
-#$ make kernelrelease => 2.6.37+
-  rm -rf ${S}/.git
-}
-
-# Mark archs/machines that this kernel supports
-DEFAULT_PREFERENCE = "-2"
diff --git a/recipes-kernel/linux/linux_3.1.bb b/recipes-kernel/linux/linux_3.1.bb
index c8e2a39..5e9a714 100644
--- a/recipes-kernel/linux/linux_3.1.bb
+++ b/recipes-kernel/linux/linux_3.1.bb
@@ -1,10 +1,23 @@
 require linux.inc
-require linux-${PV}.inc
 
 PR = "${INC_PR}.9"
-
 COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz|h1940)"
 
+SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
+           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.10.bz2;apply=yes;name=stablepatch \
+           file://defconfig \
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
 SRC_URI_append_h1940 = " \
                         file://0001-s3c24xx-DMA-don-t-use-autoreload-feature.patch \
                         file://0002-s3cmci-minor-fixups.patch \
@@ -19,3 +32,8 @@ SRC_URI_append_h1940 = " \
                         file://0011-ARM-h1940-add-IR-switch.patch \
                         file://0012-ARM-h1940-increase-oversampling-shift.patch \
                         "
+
+SRC_URI[kernel.md5sum] = "8d43453f8159b2332ad410b19d86a931"
+SRC_URI[kernel.sha256sum] = "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
+SRC_URI[stablepatch.md5sum] = "a8e1c25a93a685ec2a1c3a808715fe9d"
+SRC_URI[stablepatch.sha256sum] = "f25126052d1a083a415ddd313b40c7fcdb3742f40474cb4a826af7e43fee29d3"
diff --git a/recipes-kernel/linux/linux_3.2.bb b/recipes-kernel/linux/linux_3.2.bb
index a44804a..2c23bb6 100644
--- a/recipes-kernel/linux/linux_3.2.bb
+++ b/recipes-kernel/linux/linux_3.2.bb
@@ -1,4 +1,25 @@
 require linux.inc
-require linux-${PV}.inc
 
 PR = "${INC_PR}.3"
+COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
+
+SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
+           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.9.bz2;apply=yes;name=stablepatch \
+           file://defconfig \
+           file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
+           "
+
+SRC_URI_append_collie = " \
+                         file://0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch \
+                         file://locomo_kbd_tweak-r2.patch \
+                         file://collie_remove_irq_to_gpio.patch \
+                         "
+
+SRC_URI_append_poodle = " \
+                         file://locomo_kbd_tweak-r2.patch \
+                         "
+
+SRC_URI[kernel.md5sum] = "8d43453f8159b2332ad410b19d86a931"
+SRC_URI[kernel.sha256sum] = "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
+SRC_URI[stablepatch.md5sum] = "4610f3e62a5446422d1e81a90ab3cd06"
+SRC_URI[stablepatch.sha256sum] = "7836685dee161a4ffaf887b8e2f8dd3cb7712e690d0942fefb1db09bb6ad3871"
diff --git a/recipes-kernel/linux/linux_git.bb b/recipes-kernel/linux/linux_git.bb
index 620c4e4..00d2d52 100644
--- a/recipes-kernel/linux/linux_git.bb
+++ b/recipes-kernel/linux/linux_git.bb
@@ -1,7 +1,31 @@
 require linux.inc
-require linux-git.inc
 
 PR = "${INC_PR}.0"
+COMPATIBLE_MACHINE = "spitz"
+
+DEFAULT_PREFERENCE = "-2"
+
+KERNEL_RELEASE = "3.2.0-rc7"
+OLD_KERNEL_RELEASE = "3.1.99"
+PV = "${OLD_KERNEL_RELEASE}+${KERNEL_RELEASE}+gitr${SRCPV}"
+
+SRCREV = "371de6e4e0042adf4f9b54c414154f57414ddd37"
+
+CMDLINE_DEBUG = "debug"
+
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git;protocol=git;branch=master \
+           file://defconfig"
+
+S = "${WORKDIR}/git"
+
+do_configure_prepend() {
+#otherwise it gets extra '+' "2.6.37+"
+#because:
+#$ scripts/setlocalversion . => +
+#$ make kernelversion => 2.6.37
+#$ make kernelrelease => 2.6.37+
+  rm -rf ${S}/.git
+}
 
 SRC_URI_append_akita = " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 "
 SRC_URI_append_c7x0 = " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 "
-- 
1.7.3.4



