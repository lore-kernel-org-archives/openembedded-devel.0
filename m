Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Rzdcl-0004Pd-BE
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 01:30:31 +0100
Received: from mizar.localdomain (87.5.51.74) by smtp207.alice.it (8.6.023.02)
	id 4F05A6650581A887; Tue, 21 Feb 2012 01:22:15 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Feb 2012 01:21:56 +0100
Message-Id: <f00dfb824dfcab58a0b261b718c409a17d7e0bc5.1329780628.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1329780628.git.andrea.adami@gmail.com>
References: <cover.1329780628.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1329780628.git.andrea.adami@gmail.com>
References: <cover.1329780628.git.andrea.adami@gmail.com>
Subject: [meta-oe][PATCH 5/6] meta-initramfs: add kexecboot recipes from meta-handheld
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
X-List-Received-Date: Tue, 21 Feb 2012 00:30:31 -0000

* (purged from device specific settings)

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb     |   61 ++++++++++++++++++++
 .../recipes-bsp/kexecboot/kexecboot-klibc_git.bb   |   12 ++++
 meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc |   54 +++++++++++++++++
 .../recipes-bsp/kexecboot/kexecboot_git.bb         |    9 +++
 4 files changed, 136 insertions(+), 0 deletions(-)
 create mode 100644 meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
 create mode 100644 meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
 create mode 100644 meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc
 create mode 100644 meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
new file mode 100644
index 0000000..84c1116
--- /dev/null
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
@@ -0,0 +1,61 @@
+DESCRIPTION = "Configuration file for kexecboot"
+SECTION = "base"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+PR = "r13"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+SRC_URI = "file://icon.xpm"
+
+CMDLINE ?= ""
+CMDLINE_DEBUG ?= "${@base_conditional('DISTRO_TYPE', 'release', 'quiet', 'debug',d)}"
+
+# Note: for qvga the label is currently limited to about 24 chars
+KEXECBOOT_LABEL ?= "${@d.getVar('DISTRO', True) or d.getVar('DISTRO_VERSION', True)}-${MACHINE}"
+
+do_configure_prepend () {
+    install -m 0644 ${WORKDIR}/icon.xpm ${S}
+}
+
+do_install_prepend () {
+echo '# First kernel stanza.
+# Specify full kernel path on target.
+KERNEL=/boot/${KERNEL_IMAGETYPE}
+
+# Show this label in kexecboot menu.
+LABEL=${KEXECBOOT_LABEL}
+#
+# Append this tags to the kernel cmdline.
+APPEND=${CMDLINE} ${CMDLINE_DEBUG}
+#
+# Specify optional initrd/initramfs.
+# INITRD=/boot/initramfs.cpio.gz
+#
+# Specify full path for a custom icon for the menu-item.
+# If not set, use device-icons as default (NAND, SD, CF, ...).
+# ICON=/boot/icon.xpm
+#
+# Priority of item in kexecboot menu.
+# Items with highest priority will be shown at top of menu.
+# Default: 0 (lowest, ordered by device ordering)
+# PRIORITY=10
+#
+#
+# Second kernel stanza.
+# KERNEL=/boot/${KERNEL_IMAGETYPE}-test
+# LABEL=${DISTRO}-${MACHINE}-test
+# APPEND=${CMDLINE}
+#' >> ${S}/boot.cfg
+}
+
+do_install () {
+        install -d ${D}/boot
+        install -m 0644 boot.cfg ${D}/boot/boot.cfg
+        install -m 0644 icon.xpm ${D}/boot/icon.xpm
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+FILES_${PN} += "/boot/*"
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
new file mode 100644
index 0000000..0d6d00f
--- /dev/null
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
@@ -0,0 +1,12 @@
+RDEPENDS_${PN} = "kexec-klibc"
+PV = "0.5.9"
+PR = "r8+gitr${SRCREV}"
+
+SRC_URI = "git://git.linuxtogo.org/home/groups/kexecboot/kexecboot.git;protocol=git "
+SRCREV = "8f1d3cc3d9c650c6a6c88f83071185d6ee0ef9c7"
+S = "${WORKDIR}/git"
+
+# the binary is statically linked against klibc
+inherit klibc
+
+require kexecboot.inc
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc b/meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc
new file mode 100644
index 0000000..a205904
--- /dev/null
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc
@@ -0,0 +1,54 @@
+###########################
+# Configure options:
+#
+#  --enable-static-linking compile kexecboot as static executable [default=no]
+#  --enable-fbui           support framebuffer menu [default=yes]
+#  --enable-fbui-width     limit FB UI width to specified value [default=no]
+#  --enable-fbui-height    limit FB UI height to specified value [default=no]
+#  --enable-textui         support console text user interface [default=no]
+#  --enable-cfgfiles       support config files [default=yes]
+#  --enable-icons          support custom icons (depends on fbui) [default=yes]
+#  --enable-zaurus         compile Sharp Zaurus specific code [default=no]
+#  --enable-zimage         compile with zImage support [default=yes]
+#  --enable-uimage         compile with uImage support [default=no]
+#  --enable-machine-kernel look for machine-specific zImage kernel [default=no]
+#  --enable-devices-recreating
+#                          enable devices re-creating [default=yes]
+#  --enable-debug          enable debug output [default=no]
+#  --enable-host-debug     allow for non-destructive executing of kexecboot on
+#                            host system [default=no]
+#  --enable-numkeys        enable menu item selection by keys [0-9] [default=yes]
+#  --enable-bg-buffer      enable buffer for pre-drawed FB GUI background
+#
+#  --enable-timeout        allow to boot 1st kernel after timeout in seconds
+#                            [default=no]
+#  --enable-delay          specify delay before device scanning, allowing
+#                            initialization of old CF/SD cards [default=1]
+#  --enable-bpp            enable support of specified bpp modes
+#                            (all,32,24,18,16,4,2,1) [default=all]
+#  --enable-evdev-rate     change evdev (keyboard/mouse) repeat rate
+#                            in milliseconds e.g. "1000,250" [default=no]
+#  --with-kexec-binary     look for kexec binary at path
+#                            [default="/usr/sbin/kexec"]
+##########################
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+inherit autotools
+
+EXTRA_OECONF = "--enable-delay=2 --enable-evdev-rate=1000,250"
+
+do_install () {
+        install -d ${D}${bindir}
+        install -m 0755 kexecboot ${D}${bindir}/
+        install -d ${D}/proc
+        install -d ${D}/mnt
+        install -d ${D}/dev
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+FILES_${PN} += " ${bindir}/kexecboot /init /proc /mnt /dev"
+
+pkg_postinst_${PN} () {
+        ln -sf ${bindir}/kexecboot $D/init
+}
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
new file mode 100644
index 0000000..1341461
--- /dev/null
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -0,0 +1,9 @@
+RDEPENDS_${PN} = "kexec"
+PV = "0.5.9"
+PR = "r8+gitr${SRCREV}"
+
+SRC_URI = "git://git.linuxtogo.org/home/groups/kexecboot/kexecboot.git;protocol=git "
+SRCREV = "8f1d3cc3d9c650c6a6c88f83071185d6ee0ef9c7"
+S = "${WORKDIR}/git"
+
+require kexecboot.inc
-- 
1.7.3.4



