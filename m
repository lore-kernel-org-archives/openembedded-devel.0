Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S004o-0007Ym-PG
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 01:28:58 +0100
Received: from mizar.localdomain (87.5.51.74) by smtp209.alice.it (8.6.023.02)
	id 4EF08A6306DCBCF7; Wed, 22 Feb 2012 01:20:41 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2012 01:20:32 +0100
Message-Id: <1329870032-4952-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1329870032-4952-1-git-send-email-andrea.adami@gmail.com>
References: <1329870032-4952-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-oe][PATCH 1/1] meta-initramfs: import linux-kexecboot_3.2 and _git from meta-handheld
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
X-List-Received-Date: Wed, 22 Feb 2012 00:28:58 -0000

* bump PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-kernel/linux/linux-git.inc  |   23 ++++++++++++++++++++
 .../recipes-kernel/linux/linux-kexecboot_3.2.bb    |   13 +++++++++++
 .../recipes-kernel/linux/linux-kexecboot_git.bb    |   23 ++++++++++++++++++++
 3 files changed, 59 insertions(+), 0 deletions(-)
 create mode 100644 meta-initramfs/recipes-kernel/linux/linux-git.inc
 create mode 100644 meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb
 create mode 100644 meta-initramfs/recipes-kernel/linux/linux-kexecboot_git.bb

diff --git a/meta-initramfs/recipes-kernel/linux/linux-git.inc b/meta-initramfs/recipes-kernel/linux/linux-git.inc
new file mode 100644
index 0000000..32a6d47
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/linux/linux-git.inc
@@ -0,0 +1,23 @@
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
+
+# Mark archs/machines that this kernel supports
+DEFAULT_PREFERENCE = "-2"
diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb b/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb
new file mode 100644
index 0000000..3207429
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb
@@ -0,0 +1,13 @@
+require linux-kexecboot.inc
+
+PR = "${INC_PR}.1"
+S = "${WORKDIR}/linux-${PV}"
+
+SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
+           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.1.bz2;apply=yes;name=stablepatch \
+           "
+
+SRC_URI[kernel.md5sum] = "7ceb61f87c097fc17509844b71268935"
+SRC_URI[kernel.sha256sum] = "c881fc2b53cf0da7ca4538aa44623a7de043a41f76fd5d0f51a31f6ed699d463"
+SRC_URI[stablepatch.md5sum] = "31fc34340f11118873463a1d59d47b7f"
+SRC_URI[stablepatch.sha256sum] = "e9a26dc5faa309ae5172e3c65081fa98b60befab160fb14d9a75816bbde15626"
diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot_git.bb b/meta-initramfs/recipes-kernel/linux/linux-kexecboot_git.bb
new file mode 100644
index 0000000..b1fc75b
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/linux/linux-kexecboot_git.bb
@@ -0,0 +1,23 @@
+require linux-kexecboot.inc
+
+PR = "${INC_PR}.1"
+
+KERNEL_RELEASE = "3.2.0-rc7"
+OLD_KERNEL_RELEASE = "3.1.99"
+PV = "${OLD_KERNEL_RELEASE}+${KERNEL_RELEASE}+gitr${SRCPV}"
+
+SRCREV = "371de6e4e0042adf4f9b54c414154f57414ddd37"
+
+CMDLINE_DEBUG = "debug"
+
+S = "${WORKDIR}/git"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git;protocol=git;branch=master"
+
+do_configure_prepend() {
+#otherwise it gets extra '+' "2.6.37+"
+#because:
+#$ scripts/setlocalversion . => +
+#$ make kernelversion => 2.6.37
+#$ make kernelrelease => 2.6.37+
+  rm -rf ${S}/.git
+}
-- 
1.7.3.4



