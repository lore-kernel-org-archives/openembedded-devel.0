Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Sgl42-0005z0-3w
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jun 2012 01:08:54 +0200
Received: from mizar.localdomain (79.21.254.221) by smtp208.alice.it
	(8.6.023.02) id 4F056E8512F6CDFE; Tue, 19 Jun 2012 00:58:13 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jun 2012 00:58:06 +0200
Message-Id: <1340060286-28769-4-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1340060286-28769-1-git-send-email-andrea.adami@gmail.com>
References: <1340060286-28769-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-oe][meta-initramfs][PATCH 4/4] linux-kexecboot: remove all, now we use linux-yocto-tiny-kexecboot
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
X-List-Received-Date: Mon, 18 Jun 2012 23:08:54 -0000

* The linux-yocto-tiny-kexecboot recipe can be extended and support
* more devices migrating the patches and renaming the defconfig as
* done for Sharp Zaurus devices.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-kernel/linux/linux-kexecboot.inc       |  124 --------------------
 .../recipes-kernel/linux/linux-kexecboot_3.1.bb    |   13 --
 .../recipes-kernel/linux/linux-kexecboot_3.2.bb    |   13 --
 .../recipes-kernel/linux/linux-kexecboot_git.bb    |   23 ----
 4 files changed, 0 insertions(+), 173 deletions(-)
 delete mode 100644 meta-initramfs/recipes-kernel/linux/linux-kexecboot.inc
 delete mode 100644 meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.1.bb
 delete mode 100644 meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb
 delete mode 100644 meta-initramfs/recipes-kernel/linux/linux-kexecboot_git.bb

diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot.inc b/meta-initramfs/recipes-kernel/linux/linux-kexecboot.inc
deleted file mode 100644
index 19c5ea9..0000000
--- a/meta-initramfs/recipes-kernel/linux/linux-kexecboot.inc
+++ /dev/null
@@ -1,124 +0,0 @@
-DESCRIPTION = "Linux Kernel"
-SECTION = "kernel"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
-
-INC_PR = "r2"
-
-inherit kernel siteinfo
-
-DEPENDS += "xz-native"
-
-# Set the verbosity of kernel messages during runtime
-# You can define CMDLINE_DEBUG in your local.conf or distro.conf to override this behaviour
-# Note that you need i.e. loglevel=3 and master console on serial to protect bootlogo
-CMDLINE_DEBUG ?= "loglevel=3"
-
-PACKAGES = ""
-PROVIDES = ""
-
-KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-kexecboot-${PV}-${PR}-${MACHINE}"
-KERNEL_IMAGE_SYMLINK_NAME = "${KERNEL_IMAGETYPE}-kexecboot-${MACHINE}"
-
-LOCALVERSION ?= ""
-
-# we want the smallest size
-INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
-
-kernel_conf_variable() {
-        CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_$1[ =]/d;"
-        if test "$2" = "n"
-        then
-                echo "# CONFIG_$1 is not set" >> ${S}/.config
-        else
-                echo "CONFIG_$1=$2" >> ${S}/.config
-        fi
-}
-
-do_configure_prepend() {
-
-        echo "" > ${S}/.config
-        CONF_SED_SCRIPT=""
-
-        #
-        # CONFIG_CMDLINE mangling
-        #
-        kernel_conf_variable CMDLINE_BOOL y
-        kernel_conf_variable CMDLINE "\"${CMDLINE} ${CMDLINE_DEBUG}\""
-
-        # mips and x86
-        kernel_conf_variable CMDLINE_OVERRIDE y
-
-        # sh only
-        kernel_conf_variable CMDLINE_OVERWRITE y
-        kernel_conf_variable CMDLINE_EXTEND n
-
-        #
-        # endian support
-        #
-        if [ "${SITEINFO_ENDIANNESS}" = "be" ]; then
-                kernel_conf_variable CPU_BIG_ENDIAN y
-        fi
-
-        #
-        # logo support, if you supply logo_linux_clut224.ppm in SRC_URI, then it is going to be used
-        #
-        if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then
-                install -m 0644 ${WORKDIR}/logo_linux_clut224.ppm drivers/video/logo/logo_linux_clut224.ppm
-                kernel_conf_variable LOGO y
-                kernel_conf_variable LOGO_LINUX_CLUT224 y
-        fi
-
-        # When enabling thumb for userspace we also need thumb support in the kernel
-        if [ "${ARM_INSTRUCTION_SET}" = "thumb" ] ; then
-                kernel_conf_variable ARM_THUMB y
-        fi
-
-        kernel_conf_variable LOCALVERSION "\"${LOCALVERSION}\""
-        kernel_conf_variable LOCALVERSION_AUTO n
-
-        # Force sane defaults for kexec-enabled kernels and keep size small
-        kernel_conf_variable BLK_DEV_INITRD y
-        kernel_conf_variable KEXEC y
-        CONF_SED_SCRIPT="$CONF_SED_SCRIPT /=m/d;"
-        kernel_conf_variable MODULES n
-        if ${@base_contains("CMDLINE_DEBUG", "debug", "true", "false", d)}; then
-                kernel_conf_variable DEBUG_LL y
-                kernel_conf_variable PRINTK y
-                kernel_conf_variable EARLY_PRINTK y
-                kernel_conf_variable BUG y
-                kernel_conf_variable DEBUG_ERRORS y
-                kernel_conf_variable DEBUG_BUGVERBOSE y
-                kernel_conf_variable DEBUG_KERNEL y
-        else
-                kernel_conf_variable DEBUG_ERRORS n
-                kernel_conf_variable DEBUG_BUGVERBOSE n
-                kernel_conf_variable DEBUG_KERNEL n
-        fi
-
-        # Force lzma for arm kernels only
-        if [ "${ARCH}" = "arm" ] ; then
-                CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_KERNEL/d;"
-                CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_RD/d;"
-                CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_INITRAMFS_COMPRESSION/d;"
-                CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_INITRAMFS_SOURCE/d;"
-                kernel_conf_variable KERNEL_LZMA y
-                kernel_conf_variable RD_LZMA y
-                kernel_conf_variable INITRAMFS_COMPRESSION_LZMA y
-                kernel_conf_variable INITRAMFS_SOURCE "\"initramfs.cpio.lzma\""
-        fi
-
-        sed -e "${CONF_SED_SCRIPT}" \
-                        < '${WORKDIR}/defconfig' >>'${S}/.config'
-
-        yes '' | oe_runmake oldconfig
-}
-
-do_populate_sysroot() {
-        :
-}
-
-do_install() {
-        :
-}
-
diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.1.bb b/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.1.bb
deleted file mode 100644
index b045ff7..0000000
--- a/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.1.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require linux-kexecboot.inc
-
-PR = "${INC_PR}.8"
-S = "${WORKDIR}/linux-${PV}"
-
-SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.10.bz2;apply=yes;name=stablepatch \
-           "
-
-SRC_URI[kernel.md5sum] = "8d43453f8159b2332ad410b19d86a931"
-SRC_URI[kernel.sha256sum] = "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
-SRC_URI[stablepatch.md5sum] = "a8e1c25a93a685ec2a1c3a808715fe9d"
-SRC_URI[stablepatch.sha256sum] = "f25126052d1a083a415ddd313b40c7fcdb3742f40474cb4a826af7e43fee29d3"
diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb b/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb
deleted file mode 100644
index 8cb19aa..0000000
--- a/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require linux-kexecboot.inc
-
-PR = "${INC_PR}.5"
-S = "${WORKDIR}/linux-${PV}"
-
-SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.12.bz2;apply=yes;name=stablepatch \
-           "
-
-SRC_URI[kernel.md5sum] = "7ceb61f87c097fc17509844b71268935"
-SRC_URI[kernel.sha256sum] = "c881fc2b53cf0da7ca4538aa44623a7de043a41f76fd5d0f51a31f6ed699d463"
-SRC_URI[stablepatch.md5sum] = "377a6d731cd246aaa0c0f6a432b7aece"
-SRC_URI[stablepatch.sha256sum] = "c6991964901ef7797cca09ff9d1b4ed7abda27e2796ad55cad09a266eaaebb5d"
diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot_git.bb b/meta-initramfs/recipes-kernel/linux/linux-kexecboot_git.bb
deleted file mode 100644
index b1fc75b..0000000
--- a/meta-initramfs/recipes-kernel/linux/linux-kexecboot_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require linux-kexecboot.inc
-
-PR = "${INC_PR}.1"
-
-KERNEL_RELEASE = "3.2.0-rc7"
-OLD_KERNEL_RELEASE = "3.1.99"
-PV = "${OLD_KERNEL_RELEASE}+${KERNEL_RELEASE}+gitr${SRCPV}"
-
-SRCREV = "371de6e4e0042adf4f9b54c414154f57414ddd37"
-
-CMDLINE_DEBUG = "debug"
-
-S = "${WORKDIR}/git"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git;protocol=git;branch=master"
-
-do_configure_prepend() {
-#otherwise it gets extra '+' "2.6.37+"
-#because:
-#$ scripts/setlocalversion . => +
-#$ make kernelversion => 2.6.37
-#$ make kernelrelease => 2.6.37+
-  rm -rf ${S}/.git
-}
-- 
1.7.3.4



