Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S004o-0007Ym-Gg
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 01:28:58 +0100
Received: from mizar.localdomain (87.5.51.74) by smtp209.alice.it (8.6.023.02)
	id 4EF08A6306DCBCBE; Wed, 22 Feb 2012 01:20:39 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2012 01:20:31 +0100
Message-Id: <1329870032-4952-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld][PATCH 1/1] linux-kexecboot_3.2 and _git: remove and add .bbappend
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

* recipes are now in meta-initramfs

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-core/udev/udev/touchscreen.rules          |   21 ---
 recipes-core/udev/udev_173.bbappend               |    5 -
 recipes-kernel/linux/linux-kexecboot.inc          |  150 ---------------------
 recipes-kernel/linux/linux-kexecboot_3.2.bb       |    5 -
 recipes-kernel/linux/linux-kexecboot_3.2.bbappend |   38 +++++
 recipes-kernel/linux/linux-kexecboot_git.bb       |    4 -
 recipes-kernel/linux/linux-kexecboot_git.bbappend |   38 +++++
 7 files changed, 76 insertions(+), 185 deletions(-)
 delete mode 100644 recipes-core/udev/udev/touchscreen.rules
 delete mode 100644 recipes-core/udev/udev_173.bbappend
 delete mode 100644 recipes-kernel/linux/linux-kexecboot.inc
 delete mode 100644 recipes-kernel/linux/linux-kexecboot_3.2.bb
 create mode 100644 recipes-kernel/linux/linux-kexecboot_3.2.bbappend
 delete mode 100644 recipes-kernel/linux/linux-kexecboot_git.bb
 create mode 100644 recipes-kernel/linux/linux-kexecboot_git.bbappend

diff --git a/recipes-core/udev/udev/touchscreen.rules b/recipes-core/udev/udev/touchscreen.rules
deleted file mode 100644
index b2307cf..0000000
--- a/recipes-core/udev/udev/touchscreen.rules
+++ /dev/null
@@ -1,21 +0,0 @@
-# There are a number of modifiers that are allowed to be used in some
-# of the different fields. They provide the following subsitutions:
-#
-# %n the "kernel number" of the device.
-#    For example, 'sda3' has a "kernel number" of '3'
-# %e the smallest number for that name which does not matches an existing node
-# %k the kernel name for the device
-# %M the kernel major number for the device
-# %m the kernel minor number for the device
-# %b the bus id for the device
-# %c the string returned by the PROGRAM
-# %s{filename} the content of a sysfs attribute
-# %% the '%' char itself
-#
-
-# Create a symlink to any touchscreen input device
-SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="input:*-e0*,3,*a0,1,*18,*", SYMLINK+="input/touchscreen0"
-SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="ads7846", SYMLINK+="input/touchscreen0"
-# This one is necessary for h1940
-SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="input:*-e0*,3,*a0,1,*", SYMLINK+="input/touchscreen0"
-
diff --git a/recipes-core/udev/udev_173.bbappend b/recipes-core/udev/udev_173.bbappend
deleted file mode 100644
index 4770c5b..0000000
--- a/recipes-core/udev/udev_173.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PRINC = "1"
-
diff --git a/recipes-kernel/linux/linux-kexecboot.inc b/recipes-kernel/linux/linux-kexecboot.inc
deleted file mode 100644
index b2758a6..0000000
--- a/recipes-kernel/linux/linux-kexecboot.inc
+++ /dev/null
@@ -1,150 +0,0 @@
-DESCRIPTION = "Linux Kernel"
-SECTION = "kernel"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
-
-INC_PR = "r1"
-
-inherit kernel siteinfo
-
-# FILESEXTRAPATHS cannot be used, because it puts extra paths before FILESPATH and we need it at the end
-# only as fallback for patches available only in linux-PV dir and ie defconfigs needs to go from linux-kexecboot-PV
-FILESPATH_append = ":${FILE_DIRNAME}/linux-${PV}"
-
-DEPENDS += "xz-native"
-
-# Kernel bootlogo is distro-specific (default is OE logo).
-# Logo resolution (qvga, vga, ...) is machine-specific.
-LOGO_SIZE ?= "."
-# To use this, add file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 or similar
-# to your kernel recipe, and then structure your logos for each resolution
-# accordingly.
-
-# Set the verbosity of kernel messages during runtime
-# You can define CMDLINE_DEBUG in your local.conf or distro.conf to override this behaviour
-CMDLINE_DEBUG ?= "loglevel=3"
-
-# Note how we set loglevel=3 and master console on serial to protect bootlogo.
-CMDLINE_c7x0 = "console=tty1 console=ttyS0,115200n8"
-CMDLINE_tosa = "console=tty1 console=ttyS0,115200n8"
-CMDLINE_poodle = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
-CMDLINE_akita = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
-CMDLINE_collie = "console=tty1 console=ttySA0,115200n8 fbcon=rotate:1 mem=64M"
-CMDLINE_spitz = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
-
-PACKAGES = ""
-PROVIDES = ""
-
-# Zaurus machines need kernel size-check
-KERNEL_IMAGE_MAXSIZE_akita = "1294336"
-KERNEL_IMAGE_MAXSIZE_c7x0 = "1294336"
-KERNEL_IMAGE_MAXSIZE_collie = "1048576"
-KERNEL_IMAGE_MAXSIZE_poodle = "1294336"
-KERNEL_IMAGE_MAXSIZE_tosa = "1294336"
-KERNEL_IMAGE_MAXSIZE_spitz = "1294336"
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
diff --git a/recipes-kernel/linux/linux-kexecboot_3.2.bb b/recipes-kernel/linux/linux-kexecboot_3.2.bb
deleted file mode 100644
index 8b4b9ce..0000000
--- a/recipes-kernel/linux/linux-kexecboot_3.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require linux-kexecboot.inc
-require linux-${PV}.inc
-
-PR = "${INC_PR}.0"
-S = "${WORKDIR}/linux-${PV}"
diff --git a/recipes-kernel/linux/linux-kexecboot_3.2.bbappend b/recipes-kernel/linux/linux-kexecboot_3.2.bbappend
new file mode 100644
index 0000000..375dcdd
--- /dev/null
+++ b/recipes-kernel/linux/linux-kexecboot_3.2.bbappend
@@ -0,0 +1,38 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/linux-kexecboot-${PV}:${THISDIR}/files:"
+
+DEFAULT_PREFERENCE = "-1"
+#COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
+COMPATIBLE_MACHINE = "(spitz)"
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
diff --git a/recipes-kernel/linux/linux-kexecboot_git.bb b/recipes-kernel/linux/linux-kexecboot_git.bb
deleted file mode 100644
index 5671b4f..0000000
--- a/recipes-kernel/linux/linux-kexecboot_git.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require linux-kexecboot.inc
-require linux-git.inc
-
-PR = "${INC_PR}.0"
diff --git a/recipes-kernel/linux/linux-kexecboot_git.bbappend b/recipes-kernel/linux/linux-kexecboot_git.bbappend
new file mode 100644
index 0000000..1acab8a
--- /dev/null
+++ b/recipes-kernel/linux/linux-kexecboot_git.bbappend
@@ -0,0 +1,38 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/linux-kexecboot-${PV}:${THISDIR}/files:"
+
+DEFAULT_PREFERENCE = "-2"
+#COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
+COMPATIBLE_MACHINE = "(spitz)"
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



