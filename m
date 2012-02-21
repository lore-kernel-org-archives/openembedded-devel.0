Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RzyAp-00030I-NO
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 23:27:03 +0100
Received: from mizar.localdomain (87.5.51.74) by smtp206.alice.it (8.6.023.02)
	id 4F1836AD04437E74; Tue, 21 Feb 2012 23:18:44 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Feb 2012 23:18:34 +0100
Message-Id: <1329862714-18595-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1329783724-10816-3-git-send-email-andrea.adami@gmail.com>
References: <1329783724-10816-3-git-send-email-andrea.adami@gmail.com>
Subject: [meta-oe][PATCH v2 6/6] meta-initramfs: add linux-kexecboot_3.1 from meta-handheld
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
X-List-Received-Date: Tue, 21 Feb 2012 22:27:03 -0000

* and add revised linux-kexecboot.inc

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-kernel/linux/linux-kexecboot.inc       |  124 ++++++++++++++++++++
 .../recipes-kernel/linux/linux-kexecboot_3.1.bb    |   13 ++
 2 files changed, 137 insertions(+), 0 deletions(-)
 create mode 100644 meta-initramfs/recipes-kernel/linux/linux-kexecboot.inc
 create mode 100644 meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.1.bb

diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot.inc b/meta-initramfs/recipes-kernel/linux/linux-kexecboot.inc
new file mode 100644
index 0000000..19c5ea9
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/linux/linux-kexecboot.inc
@@ -0,0 +1,124 @@
+DESCRIPTION = "Linux Kernel"
+SECTION = "kernel"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+INC_PR = "r2"
+
+inherit kernel siteinfo
+
+DEPENDS += "xz-native"
+
+# Set the verbosity of kernel messages during runtime
+# You can define CMDLINE_DEBUG in your local.conf or distro.conf to override this behaviour
+# Note that you need i.e. loglevel=3 and master console on serial to protect bootlogo
+CMDLINE_DEBUG ?= "loglevel=3"
+
+PACKAGES = ""
+PROVIDES = ""
+
+KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-kexecboot-${PV}-${PR}-${MACHINE}"
+KERNEL_IMAGE_SYMLINK_NAME = "${KERNEL_IMAGETYPE}-kexecboot-${MACHINE}"
+
+LOCALVERSION ?= ""
+
+# we want the smallest size
+INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
+
+kernel_conf_variable() {
+        CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_$1[ =]/d;"
+        if test "$2" = "n"
+        then
+                echo "# CONFIG_$1 is not set" >> ${S}/.config
+        else
+                echo "CONFIG_$1=$2" >> ${S}/.config
+        fi
+}
+
+do_configure_prepend() {
+
+        echo "" > ${S}/.config
+        CONF_SED_SCRIPT=""
+
+        #
+        # CONFIG_CMDLINE mangling
+        #
+        kernel_conf_variable CMDLINE_BOOL y
+        kernel_conf_variable CMDLINE "\"${CMDLINE} ${CMDLINE_DEBUG}\""
+
+        # mips and x86
+        kernel_conf_variable CMDLINE_OVERRIDE y
+
+        # sh only
+        kernel_conf_variable CMDLINE_OVERWRITE y
+        kernel_conf_variable CMDLINE_EXTEND n
+
+        #
+        # endian support
+        #
+        if [ "${SITEINFO_ENDIANNESS}" = "be" ]; then
+                kernel_conf_variable CPU_BIG_ENDIAN y
+        fi
+
+        #
+        # logo support, if you supply logo_linux_clut224.ppm in SRC_URI, then it is going to be used
+        #
+        if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then
+                install -m 0644 ${WORKDIR}/logo_linux_clut224.ppm drivers/video/logo/logo_linux_clut224.ppm
+                kernel_conf_variable LOGO y
+                kernel_conf_variable LOGO_LINUX_CLUT224 y
+        fi
+
+        # When enabling thumb for userspace we also need thumb support in the kernel
+        if [ "${ARM_INSTRUCTION_SET}" = "thumb" ] ; then
+                kernel_conf_variable ARM_THUMB y
+        fi
+
+        kernel_conf_variable LOCALVERSION "\"${LOCALVERSION}\""
+        kernel_conf_variable LOCALVERSION_AUTO n
+
+        # Force sane defaults for kexec-enabled kernels and keep size small
+        kernel_conf_variable BLK_DEV_INITRD y
+        kernel_conf_variable KEXEC y
+        CONF_SED_SCRIPT="$CONF_SED_SCRIPT /=m/d;"
+        kernel_conf_variable MODULES n
+        if ${@base_contains("CMDLINE_DEBUG", "debug", "true", "false", d)}; then
+                kernel_conf_variable DEBUG_LL y
+                kernel_conf_variable PRINTK y
+                kernel_conf_variable EARLY_PRINTK y
+                kernel_conf_variable BUG y
+                kernel_conf_variable DEBUG_ERRORS y
+                kernel_conf_variable DEBUG_BUGVERBOSE y
+                kernel_conf_variable DEBUG_KERNEL y
+        else
+                kernel_conf_variable DEBUG_ERRORS n
+                kernel_conf_variable DEBUG_BUGVERBOSE n
+                kernel_conf_variable DEBUG_KERNEL n
+        fi
+
+        # Force lzma for arm kernels only
+        if [ "${ARCH}" = "arm" ] ; then
+                CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_KERNEL/d;"
+                CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_RD/d;"
+                CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_INITRAMFS_COMPRESSION/d;"
+                CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_INITRAMFS_SOURCE/d;"
+                kernel_conf_variable KERNEL_LZMA y
+                kernel_conf_variable RD_LZMA y
+                kernel_conf_variable INITRAMFS_COMPRESSION_LZMA y
+                kernel_conf_variable INITRAMFS_SOURCE "\"initramfs.cpio.lzma\""
+        fi
+
+        sed -e "${CONF_SED_SCRIPT}" \
+                        < '${WORKDIR}/defconfig' >>'${S}/.config'
+
+        yes '' | oe_runmake oldconfig
+}
+
+do_populate_sysroot() {
+        :
+}
+
+do_install() {
+        :
+}
+
diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.1.bb b/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.1.bb
new file mode 100644
index 0000000..b045ff7
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.1.bb
@@ -0,0 +1,13 @@
+require linux-kexecboot.inc
+
+PR = "${INC_PR}.8"
+S = "${WORKDIR}/linux-${PV}"
+
+SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
+           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.10.bz2;apply=yes;name=stablepatch \
+           "
+
+SRC_URI[kernel.md5sum] = "8d43453f8159b2332ad410b19d86a931"
+SRC_URI[kernel.sha256sum] = "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
+SRC_URI[stablepatch.md5sum] = "a8e1c25a93a685ec2a1c3a808715fe9d"
+SRC_URI[stablepatch.sha256sum] = "f25126052d1a083a415ddd313b40c7fcdb3742f40474cb4a826af7e43fee29d3"
-- 
1.7.3.4



