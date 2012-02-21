Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Rzde3-00054f-T0
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 01:31:52 +0100
Received: from mizar.localdomain (87.5.51.74) by smtp207.alice.it (8.6.023.02)
	id 4F05A6650581AD4F; Tue, 21 Feb 2012 01:23:35 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Feb 2012 01:23:23 +0100
Message-Id: <80501fec145b56fc5ee808a0a48a9b749b94c06d.1329780587.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1329780587.git.andrea.adami@gmail.com>
References: <cover.1329780587.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1329780587.git.andrea.adami@gmail.com>
References: <cover.1329780587.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 1/3] meta-handheld: recipe moved to meta-initramfs, add bbappends
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
X-List-Received-Date: Tue, 21 Feb 2012 00:31:52 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/kexecboot/kexecboot-cfg/icon.xpm       |   43 --------------
 recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb         |   61 -------------------
 recipes-bsp/kexecboot/kexecboot-handhelds.inc      |    6 ++
 recipes-bsp/kexecboot/kexecboot-klibc_git.bb       |   12 ----
 recipes-bsp/kexecboot/kexecboot-klibc_git.bbappend |    3 +
 recipes-bsp/kexecboot/kexecboot.inc                |   62 --------------------
 recipes-bsp/kexecboot/kexecboot_git.bb             |    9 ---
 recipes-bsp/kexecboot/kexecboot_git.bbappend       |    3 +
 8 files changed, 12 insertions(+), 187 deletions(-)
 delete mode 100644 recipes-bsp/kexecboot/kexecboot-cfg/icon.xpm
 delete mode 100644 recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
 create mode 100644 recipes-bsp/kexecboot/kexecboot-handhelds.inc
 delete mode 100644 recipes-bsp/kexecboot/kexecboot-klibc_git.bb
 create mode 100644 recipes-bsp/kexecboot/kexecboot-klibc_git.bbappend
 delete mode 100644 recipes-bsp/kexecboot/kexecboot.inc
 delete mode 100644 recipes-bsp/kexecboot/kexecboot_git.bb
 create mode 100644 recipes-bsp/kexecboot/kexecboot_git.bbappend

diff --git a/recipes-bsp/kexecboot/kexecboot-cfg/icon.xpm b/recipes-bsp/kexecboot/kexecboot-cfg/icon.xpm
deleted file mode 100644
index 6e6fd77..0000000
--- a/recipes-bsp/kexecboot/kexecboot-cfg/icon.xpm
+++ /dev/null
@@ -1,43 +0,0 @@
-/* XPM */
-static char * icon_xpm[] = {
-"32 32 8 1",
-" 	c None",
-".	c #D6DBDE",
-"+	c #9BA6AE",
-"@	c #60727D",
-"#	c #B8BFC5",
-"$	c #A9E8F6",
-"%	c #12BCE4",
-"&	c #57D2EC",
-"                                ",
-"                                ",
-"                                ",
-"           .++@@@@++.           ",
-"         +@@@@@@@@@@@@+         ",
-"       #@@@@@@@@@@@@@@@@#       ",
-"      +@@@@@@@@@@@@@@@@@@+      ",
-"    .@@@@@@@@++##+@@@@@@@@@.    ",
-"    @@@@@@@.        .@@@@@@@    ",
-"   +@@@@@+    $$$$    #@@@@@+   ",
-"  #@@@@@.  $%%%%%%%%$  .@@@@@#  ",
-"  @@@@@.  &%%%%%%%%%%&  .@@@@@  ",
-" #@@@@+  %%%%%%%%%%%%%%  +@@@@# ",
-" @@@@@  &%%%%%%%%%%%%%%&  @@@@@ ",
-".@@@@. $%%%%%&   $%%%%%&  .@@@@.",
-"+@@@@  %%%%%    $%%%%%&    @@@@+",
-"+@@@+  %%%%$   $%%%%%&  $$ +@@@+",
-"@@@@+ $%%%%   $%%%%%&  $%$ +@@@@",
-"@@@@# &%%%&   &%%%%&  $%%& #@@@@",
-"@@@@. &%%%&   %%%%&  $%%%& .@@@@",
-"@@@@# $%%%&   &%%&   &%%%$ #@@@@",
-"+@@@+ $%%%%          %%%%$ +@@@+",
-"+@@@@  %%%%&        &%%%%  @@@@+",
-"#@@@@  &%%%%&      &%%%%&  @@@@#",
-" @@@@+  %%%%%%&$$&%%%%%%  +@@@@ ",
-" +@@@@. $%%%%%%%%%%%%%%$ .@@@@+ ",
-" .@@@@@  $%%%%%%%%%%%%$  @@@@@. ",
-"  #++++.   &%%%%%%%%&   .++++#  ",
-"            $&&%%&&$            ",
-"                                ",
-"                                ",
-"                                "};
diff --git a/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb b/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
deleted file mode 100644
index 84c1116..0000000
--- a/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
+++ /dev/null
@@ -1,61 +0,0 @@
-DESCRIPTION = "Configuration file for kexecboot"
-SECTION = "base"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
-
-PR = "r13"
-
-INHIBIT_DEFAULT_DEPS = "1"
-
-SRC_URI = "file://icon.xpm"
-
-CMDLINE ?= ""
-CMDLINE_DEBUG ?= "${@base_conditional('DISTRO_TYPE', 'release', 'quiet', 'debug',d)}"
-
-# Note: for qvga the label is currently limited to about 24 chars
-KEXECBOOT_LABEL ?= "${@d.getVar('DISTRO', True) or d.getVar('DISTRO_VERSION', True)}-${MACHINE}"
-
-do_configure_prepend () {
-    install -m 0644 ${WORKDIR}/icon.xpm ${S}
-}
-
-do_install_prepend () {
-echo '# First kernel stanza.
-# Specify full kernel path on target.
-KERNEL=/boot/${KERNEL_IMAGETYPE}
-
-# Show this label in kexecboot menu.
-LABEL=${KEXECBOOT_LABEL}
-#
-# Append this tags to the kernel cmdline.
-APPEND=${CMDLINE} ${CMDLINE_DEBUG}
-#
-# Specify optional initrd/initramfs.
-# INITRD=/boot/initramfs.cpio.gz
-#
-# Specify full path for a custom icon for the menu-item.
-# If not set, use device-icons as default (NAND, SD, CF, ...).
-# ICON=/boot/icon.xpm
-#
-# Priority of item in kexecboot menu.
-# Items with highest priority will be shown at top of menu.
-# Default: 0 (lowest, ordered by device ordering)
-# PRIORITY=10
-#
-#
-# Second kernel stanza.
-# KERNEL=/boot/${KERNEL_IMAGETYPE}-test
-# LABEL=${DISTRO}-${MACHINE}-test
-# APPEND=${CMDLINE}
-#' >> ${S}/boot.cfg
-}
-
-do_install () {
-        install -d ${D}/boot
-        install -m 0644 boot.cfg ${D}/boot/boot.cfg
-        install -m 0644 icon.xpm ${D}/boot/icon.xpm
-}
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-FILES_${PN} += "/boot/*"
diff --git a/recipes-bsp/kexecboot/kexecboot-handhelds.inc b/recipes-bsp/kexecboot/kexecboot-handhelds.inc
new file mode 100644
index 0000000..ab3deca
--- /dev/null
+++ b/recipes-bsp/kexecboot/kexecboot-handhelds.inc
@@ -0,0 +1,6 @@
+EXTRA_OECONF_akita = "--enable-zaurus --enable-delay=2 --enable-evdev-rate=1000,250 --enable-fbui-width=480"
+EXTRA_OECONF_c7x0 = "--enable-zaurus --enable-delay=2 --enable-evdev-rate=1000,250 --enable-fbui-width=480"
+EXTRA_OECONF_spitz = "--enable-zaurus --enable-delay=3 --enable-evdev-rate=1000,250 --enable-fbui-width=480"
+EXTRA_OECONF_poodle = "--enable-zaurus --enable-delay=2 --enable-evdev-rate=1000,250"
+EXTRA_OECONF_tosa = "--enable-zaurus --enable-delay=2 --enable-evdev-rate=1000,250"
+EXTRA_OECONF_collie = "--enable-delay=2 --enable-evdev-rate=1000,250"
diff --git a/recipes-bsp/kexecboot/kexecboot-klibc_git.bb b/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
deleted file mode 100644
index 0d6d00f..0000000
--- a/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-RDEPENDS_${PN} = "kexec-klibc"
-PV = "0.5.9"
-PR = "r8+gitr${SRCREV}"
-
-SRC_URI = "git://git.linuxtogo.org/home/groups/kexecboot/kexecboot.git;protocol=git "
-SRCREV = "8f1d3cc3d9c650c6a6c88f83071185d6ee0ef9c7"
-S = "${WORKDIR}/git"
-
-# the binary is statically linked against klibc
-inherit klibc
-
-require kexecboot.inc
diff --git a/recipes-bsp/kexecboot/kexecboot-klibc_git.bbappend b/recipes-bsp/kexecboot/kexecboot-klibc_git.bbappend
new file mode 100644
index 0000000..61ba802
--- /dev/null
+++ b/recipes-bsp/kexecboot/kexecboot-klibc_git.bbappend
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+require kexecboot-handhelds.inc
diff --git a/recipes-bsp/kexecboot/kexecboot.inc b/recipes-bsp/kexecboot/kexecboot.inc
deleted file mode 100644
index 3a7fd9f..0000000
--- a/recipes-bsp/kexecboot/kexecboot.inc
+++ /dev/null
@@ -1,62 +0,0 @@
-###########################
-# Configure options:
-#
-#  --enable-static-linking compile kexecboot as static executable [default=no]
-#  --enable-fbui           support framebuffer menu [default=yes]
-#  --enable-fbui-width     limit FB UI width to specified value [default=no]
-#  --enable-fbui-height    limit FB UI height to specified value [default=no]
-#  --enable-textui         support console text user interface [default=no]
-#  --enable-cfgfiles       support config files [default=yes]
-#  --enable-icons          support custom icons (depends on fbui) [default=yes]
-#  --enable-zaurus         compile Sharp Zaurus specific code [default=no]
-#  --enable-zimage         compile with zImage support [default=yes]
-#  --enable-uimage         compile with uImage support [default=no]
-#  --enable-machine-kernel look for machine-specific zImage kernel [default=no]
-#  --enable-devices-recreating
-#                          enable devices re-creating [default=yes]
-#  --enable-debug          enable debug output [default=no]
-#  --enable-host-debug     allow for non-destructive executing of kexecboot on
-#                            host system [default=no]
-#  --enable-numkeys        enable menu item selection by keys [0-9] [default=yes]
-#  --enable-bg-buffer      enable buffer for pre-drawed FB GUI background
-#
-#  --enable-timeout        allow to boot 1st kernel after timeout in seconds
-#                            [default=no]
-#  --enable-delay          specify delay before device scanning, allowing
-#                            initialization of old CF/SD cards [default=1]
-#  --enable-bpp            enable support of specified bpp modes
-#                            (all,32,24,18,16,4,2,1) [default=all]
-#  --enable-evdev-rate     change evdev (keyboard/mouse) repeat rate
-#                            in milliseconds e.g. "1000,250" [default=no]
-#  --with-kexec-binary     look for kexec binary at path
-#                            [default="/usr/sbin/kexec"]
-##########################
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-inherit autotools
-
-#
-# Zaurus clamshells looks better at 480x480
-
-EXTRA_OECONF_akita = "--enable-zaurus --enable-delay=2 --enable-evdev-rate=1000,250 --enable-fbui-width=480"
-EXTRA_OECONF_c7x0 = "--enable-zaurus --enable-delay=2 --enable-evdev-rate=1000,250 --enable-fbui-width=480"
-EXTRA_OECONF_spitz = "--enable-zaurus --enable-delay=3 --enable-evdev-rate=1000,250 --enable-fbui-width=480"
-EXTRA_OECONF_poodle = "--enable-zaurus --enable-delay=2 --enable-evdev-rate=1000,250"
-EXTRA_OECONF_tosa = "--enable-zaurus --enable-delay=2 --enable-evdev-rate=1000,250"
-EXTRA_OECONF_collie = "--enable-delay=2 --enable-evdev-rate=1000,250"
-
-do_install () {
-        install -d ${D}${bindir}
-        install -m 0755 kexecboot ${D}${bindir}/
-        install -d ${D}/proc
-        install -d ${D}/mnt
-        install -d ${D}/dev
-}
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-FILES_${PN} += " ${bindir}/kexecboot /init /proc /mnt /dev"
-
-pkg_postinst_${PN} () {
-        ln -sf ${bindir}/kexecboot $D/init
-}
diff --git a/recipes-bsp/kexecboot/kexecboot_git.bb b/recipes-bsp/kexecboot/kexecboot_git.bb
deleted file mode 100644
index 1341461..0000000
--- a/recipes-bsp/kexecboot/kexecboot_git.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-RDEPENDS_${PN} = "kexec"
-PV = "0.5.9"
-PR = "r8+gitr${SRCREV}"
-
-SRC_URI = "git://git.linuxtogo.org/home/groups/kexecboot/kexecboot.git;protocol=git "
-SRCREV = "8f1d3cc3d9c650c6a6c88f83071185d6ee0ef9c7"
-S = "${WORKDIR}/git"
-
-require kexecboot.inc
diff --git a/recipes-bsp/kexecboot/kexecboot_git.bbappend b/recipes-bsp/kexecboot/kexecboot_git.bbappend
new file mode 100644
index 0000000..61ba802
--- /dev/null
+++ b/recipes-bsp/kexecboot/kexecboot_git.bbappend
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+require kexecboot-handhelds.inc
-- 
1.7.3.4



