Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qz9TI-00053y-M1
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 17:46:28 +0200
Received: by mail-fx0-f47.google.com with SMTP id 11so871094fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 08:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=jEOsQgvjdyk5XFD7UtZ8m13pWegQdbFc5RwWXCabF4o=;
	b=gLgDnKQ1OYgvA9MqnEAgYBfzg/zQkf+r+9uHP5EZP87CzIxVRJG1svmj0we1Knv9bJ
	D+mfET7o9ly9R4RC4MljJqpDtNnpd89W85uyp4DzCvklUy66BCFNqQLtDETa9rG2DdDP
	K3OEi0GYis42pqTQj9cP5kgOsSu+YzuaDEZIY=
Received: by 10.223.99.91 with SMTP id t27mr519343fan.56.1314891695180;
	Thu, 01 Sep 2011 08:41:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c4sm123837fac.35.2011.09.01.08.41.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Sep 2011 08:41:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Sep 2011 17:39:15 +0200
Message-Id: <84d8c0ad4788234968a758f12a0c1b0132d11254.1314891222.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <d5fa6ed7bc46990f2652da9019d9531de1cd443d.1314891222.git.Martin.Jansa@gmail.com>
References: <d5fa6ed7bc46990f2652da9019d9531de1cd443d.1314891222.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1314891222.git.Martin.Jansa@gmail.com>
References: <cover.1314891222.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld][PATCH 08/10] kexecboot: import from meta-zaurus
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
X-List-Received-Date: Thu, 01 Sep 2011 15:46:28 -0000

* from rev 36ad029194d2b57efa07896b5cda3231bc71f357 in meta-smartphone repo
  http://git.shr-project.org/git/?p=meta-smartphone.git;a=commit;h=36ad029194d2b57efa07896b5cda3231bc71f357

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-bsp/kexecboot/kexecboot-cfg/icon.xpm |   43 ++++++++++++++++++
 recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb   |   56 +++++++++++++++++++++++
 recipes-bsp/kexecboot/kexecboot-klibc_git.bb |   12 +++++
 recipes-bsp/kexecboot/kexecboot.inc          |   61 ++++++++++++++++++++++++++
 recipes-bsp/kexecboot/kexecboot_git.bb       |    9 ++++
 5 files changed, 181 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/kexecboot/kexecboot-cfg/icon.xpm
 create mode 100644 recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
 create mode 100644 recipes-bsp/kexecboot/kexecboot-klibc_git.bb
 create mode 100644 recipes-bsp/kexecboot/kexecboot.inc
 create mode 100644 recipes-bsp/kexecboot/kexecboot_git.bb

diff --git a/recipes-bsp/kexecboot/kexecboot-cfg/icon.xpm b/recipes-bsp/kexecboot/kexecboot-cfg/icon.xpm
new file mode 100644
index 0000000..6e6fd77
--- /dev/null
+++ b/recipes-bsp/kexecboot/kexecboot-cfg/icon.xpm
@@ -0,0 +1,43 @@
+/* XPM */
+static char * icon_xpm[] = {
+"32 32 8 1",
+" 	c None",
+".	c #D6DBDE",
+"+	c #9BA6AE",
+"@	c #60727D",
+"#	c #B8BFC5",
+"$	c #A9E8F6",
+"%	c #12BCE4",
+"&	c #57D2EC",
+"                                ",
+"                                ",
+"                                ",
+"           .++@@@@++.           ",
+"         +@@@@@@@@@@@@+         ",
+"       #@@@@@@@@@@@@@@@@#       ",
+"      +@@@@@@@@@@@@@@@@@@+      ",
+"    .@@@@@@@@++##+@@@@@@@@@.    ",
+"    @@@@@@@.        .@@@@@@@    ",
+"   +@@@@@+    $$$$    #@@@@@+   ",
+"  #@@@@@.  $%%%%%%%%$  .@@@@@#  ",
+"  @@@@@.  &%%%%%%%%%%&  .@@@@@  ",
+" #@@@@+  %%%%%%%%%%%%%%  +@@@@# ",
+" @@@@@  &%%%%%%%%%%%%%%&  @@@@@ ",
+".@@@@. $%%%%%&   $%%%%%&  .@@@@.",
+"+@@@@  %%%%%    $%%%%%&    @@@@+",
+"+@@@+  %%%%$   $%%%%%&  $$ +@@@+",
+"@@@@+ $%%%%   $%%%%%&  $%$ +@@@@",
+"@@@@# &%%%&   &%%%%&  $%%& #@@@@",
+"@@@@. &%%%&   %%%%&  $%%%& .@@@@",
+"@@@@# $%%%&   &%%&   &%%%$ #@@@@",
+"+@@@+ $%%%%          %%%%$ +@@@+",
+"+@@@@  %%%%&        &%%%%  @@@@+",
+"#@@@@  &%%%%&      &%%%%&  @@@@#",
+" @@@@+  %%%%%%&$$&%%%%%%  +@@@@ ",
+" +@@@@. $%%%%%%%%%%%%%%$ .@@@@+ ",
+" .@@@@@  $%%%%%%%%%%%%$  @@@@@. ",
+"  #++++.   &%%%%%%%%&   .++++#  ",
+"            $&&%%&&$            ",
+"                                ",
+"                                ",
+"                                "};
diff --git a/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb b/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
new file mode 100644
index 0000000..24dd2a4
--- /dev/null
+++ b/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
@@ -0,0 +1,56 @@
+DESCRIPTION = "Configuration file for kexecboot"
+SECTION = "base"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+PR = "r12"
+
+SRC_URI = "file://icon.xpm"
+
+CMDLINE ?= ""
+CMDLINE_DEBUG ?= "${@base_conditional('DISTRO_TYPE', 'release', 'quiet', 'debug',d)}"
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
+LABEL=${DISTRO}-${MACHINE}
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
diff --git a/recipes-bsp/kexecboot/kexecboot-klibc_git.bb b/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
new file mode 100644
index 0000000..22ef7de
--- /dev/null
+++ b/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
@@ -0,0 +1,12 @@
+RDEPENDS_${PN} = "kexec-klibc"
+PV = "0.5.9"
+PR = "r7+gitr${SRCREV}"
+
+SRC_URI = "git://git.linuxtogo.org/home/groups/kexecboot/kexecboot.git;protocol=git "
+SRCREV = "14e6d1a3641a749e4408fda1eadffe4f396b0279"
+S = "${WORKDIR}/git"
+
+# the binary is statically linked against klibc
+inherit klibc
+
+require kexecboot.inc
diff --git a/recipes-bsp/kexecboot/kexecboot.inc b/recipes-bsp/kexecboot/kexecboot.inc
new file mode 100644
index 0000000..b76abcc
--- /dev/null
+++ b/recipes-bsp/kexecboot/kexecboot.inc
@@ -0,0 +1,61 @@
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
+#
+# Zaurus clamshells looks better at 480x480
+
+EXTRA_OECONF_akita = "--enable-zaurus --enable-delay=2 --enable-evdev-rate=1000,250 --enable-fbui-width=480"
+EXTRA_OECONF_c7x0 = "--enable-zaurus --enable-delay=2 --enable-evdev-rate=1000,250 --enable-fbui-width=480"
+EXTRA_OECONF_spitz = "--enable-zaurus --enable-delay=3 --enable-evdev-rate=1000,250 --enable-fbui-width=480"
+EXTRA_OECONF_poodle = "--enable-zaurus --enable-delay=2 --enable-evdev-rate=1000,250"
+EXTRA_OECONF_tosa = "--enable-zaurus --enable-delay=2 --enable-evdev-rate=1000,250"
+EXTRA_OECONF_collie = "--enable-delay=2 --enable-evdev-rate=1000,250"
+
+do_install () {
+        install -d ${D}${bindir}
+        install -m 0755 kexecboot ${D}${bindir}/
+        install -d ${D}/proc
+        install -d ${D}/mnt
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+FILES_${PN} += " ${bindir}/kexecboot /init /proc /mnt"
+
+pkg_postinst_${PN} () {
+        ln -sf ${bindir}/kexecboot $D/init
+}
diff --git a/recipes-bsp/kexecboot/kexecboot_git.bb b/recipes-bsp/kexecboot/kexecboot_git.bb
new file mode 100644
index 0000000..264d8e2
--- /dev/null
+++ b/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -0,0 +1,9 @@
+RDEPENDS_${PN} = "kexec"
+PV = "0.5.9"
+PR = "r7+gitr${SRCREV}"
+
+SRC_URI = "git://git.linuxtogo.org/home/groups/kexecboot/kexecboot.git;protocol=git "
+SRCREV = "14e6d1a3641a749e4408fda1eadffe4f396b0279"
+S = "${WORKDIR}/git"
+
+require kexecboot.inc
-- 
1.7.6.1



