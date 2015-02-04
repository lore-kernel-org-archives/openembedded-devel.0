Return-Path: <danismostlikely@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2A0A565D00
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Feb 2015 18:38:29 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id b16so6101889igk.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Feb 2015 10:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=6PqB9wfeUpq3oi65YmH1rrVomayG0RmHurle+hHHKv4=;
	b=nfuHdwzqTEHywtn7/fOhyyGcudJTO4GrVapzKto34Hu0FiUV/yB1TFfvMYUNkerbTu
	JXy4kRe5Lzf8spqZqFj/kv2hks4bbHYk+YkGAZXQ3mMOSP2Rrgk7PByYqtILsaCWStYN
	UC990/lBH3qG64fcyl6si96r969ZVpUOQGScZRrK7FjeQaS66diugw6OaIIh26CFLfrr
	faDQdPEW3+1m809Q+WMuw7wpz4nNEpPmgg7tQ0BqZQZ3lmzdrRiYdPVtWK78P03QCkEL
	/udMUiI8WYI4FJY12it4KfE+1TpiSLJdXndwiEKn+58xGlz0TJR9lUCcaryGSQjxGiyk
	bBDA==
X-Received: by 10.42.102.5 with SMTP id g5mr3149976ico.74.1423075110862;
	Wed, 04 Feb 2015 10:38:30 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74])
	by mx.google.com with ESMTPSA id yq1sm1478329igb.21.2015.02.04.10.38.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Feb 2015 10:38:30 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Feb 2015 12:38:28 -0600
Message-Id: <1423075108-24559-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][PATCH 1/5] xserver-nodm-init: only enable for runlevel 5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Feb 2015 18:38:32 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

Runlevel 5 is traditionally graphical. If it starts in runlevel 2
or 3 systemd gets confused and adds it as a dependency of the
multi-user target, not just the graphical target.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 .../xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm         | 9 +++++++++
 .../recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb  | 4 ++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm
index d2e2f86..5d7e8a2 100755
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm
@@ -1,4 +1,13 @@
 #!/bin/sh
+#
+### BEGIN INIT INFO
+# Provides: xserver
+# Required-Start: $local_fs $remote_fs dbus
+# Required-Stop: $local_fs $remote_fs
+# Default-Start:     5
+# Default-Stop:      0 1 2 3 6
+### END INIT INFO
+
 
 . /etc/init.d/functions
 
diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
index 47470fb..f9bf007 100644
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
@@ -15,8 +15,8 @@ S = "${WORKDIR}"
 inherit allarch update-rc.d systemd
 
 INITSCRIPT_NAME = "xserver-nodm"
-INITSCRIPT_PARAMS = "start 01 5 2 . stop 01 0 1 6 ."
-INITSCRIPT_PARAMS_shr = "start 90 5 2 . stop 90 0 1 6 ."
+INITSCRIPT_PARAMS = "start 01 5 . stop 01 0 1 2 3 6 ."
+INITSCRIPT_PARAMS_shr = "start 90 5 . stop 90 0 1 2 3 6 ."
 
 do_install() {
     install -d ${D}${sysconfdir}/init.d
-- 
2.1.0


From 326102dab4af209f6e171ee5773b1eae91e1fdf8 Mon Sep 17 00:00:00 2001
From: Dan McGregor <danismostlikely@gmail.com>
Date: Tue, 3 Feb 2015 18:46:42 -0600
Subject: [meta-oe][PATCH 2/5] lxdm: RDEPEND on libsvg-gtk
To: openembedded-devel@lists.openembedded.org

From: Dan McGregor <dan.mcgregor@usask.ca>

The theme uses svg files. If libsvg-gtk isn't available lxdm
still runs, but throws a bunch of pixbuf errors.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
index a3dcc1b..66dc269 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
@@ -70,7 +70,7 @@ done
 sed -i "s:last_langs=.*$:last_langs=$langs:g" $D${localstatedir}/lib/lxdm/lxdm.conf
 }
 
-RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-loginuid', '', d)} setxkbmap bash"
+RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-loginuid', '', d)} setxkbmap bash librsvg-gtk"
 
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
-- 
2.1.0


From 9a238ca43caf0989b4ace91926500493741e6e02 Mon Sep 17 00:00:00 2001
From: Dan McGregor <danismostlikely@gmail.com>
Date: Tue, 3 Feb 2015 18:46:42 -0600
Subject: [meta-oe][PATCH 3/5] emacs: Un-blacklist, seems to work fine with new
 qemu
To: openembedded-devel@lists.openembedded.org

From: Dan McGregor <dan.mcgregor@usask.ca>

I've only tested the build with armv7 and x86, but the build
doesn't segfault anymore. The last time this was tested was
with qemu 1.5, we're now using 2.1.

While here, don't copy stuff from the sysroot into the qemu tree
just use the sysroot itself.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta-oe/recipes-support/emacs/emacs.inc     | 89 +----------------------------
 meta-oe/recipes-support/emacs/emacs_23.4.bb |  2 -
 2 files changed, 2 insertions(+), 89 deletions(-)

diff --git a/meta-oe/recipes-support/emacs/emacs.inc b/meta-oe/recipes-support/emacs/emacs.inc
index a1a4965..e052c5e 100644
--- a/meta-oe/recipes-support/emacs/emacs.inc
+++ b/meta-oe/recipes-support/emacs/emacs.inc
@@ -14,14 +14,13 @@ X11DEPENDS = " \
     libx11 libxau libxcomposite libxcursor libxdamage libxdmcp libxext libxfixes \
     libxft libxpm libxrandr libxrender \
     gdk-pixbuf glib-2.0 gtk+ pango libxcb harfbuzz icu \
-" 
+"
 
 EXTRA_OECONF =  "--without-sound --with-crt-dir=${STAGING_LIBDIR} "
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[x11] = "--with-x-toolkit=gtk,--without-x --without-dbus,${X11DEPENDS}"
 
-
 inherit autotools
 
 PACKAGES =+ "${PN}-el"
@@ -33,15 +32,13 @@ FILES_${PN} += "${datadir}/emacs ${datadir}/icons"
 
 FILES_${PN}-dbg += "${libexecdir}/emacs/*/*/.debug ${datadir}/emacs/*/*/.debug"
 
-TREEDIR = "${WORKDIR}/qemu-treedir"
-
 QEMUARCH= "${TARGET_ARCH}"
 QEMUARCH_i486 = "i386"
 QEMUARCH_i586 = "i386"
 QEMUARCH_i686 = "i386"
 
 # Large stack is required at least on x86_64 host, otherwise random segfaults appear:
-QEMU = "qemu-${QEMUARCH} ${QEMU_OPTIONS} -s 1048576 -L ${TREEDIR} "
+QEMU = "qemu-${QEMUARCH} ${QEMU_OPTIONS} -s 1048576 -L ${STAGING_DIR_HOST} "
 
 export LOGNAME = "$(whoami)"
 
@@ -52,88 +49,6 @@ do_compile_prepend() {
     ln -sf ../src/emacs lisp/emacs
     ln -sf ../src/emacs lib-src/emacs
     ln -sf ../src/emacs leim/emacs
-#copy STAGING_DIR_TARGET and libgcc_s.so* to WORKDIR/qemu-treedir #copied code from glibc-package.bbclass
-    treedir=${TREEDIR}
-    if [ -e $treedir ];then
-        rm -rf $treedir
-    fi
-    
-    mkdir -p $treedir/${base_libdir}
-
-    if [ -f ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so ]; then
-        cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so $treedir/${base_libdir}
-    fi
-    if [ -f ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so.* ]; then
-        cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so.* $treedir/${base_libdir}
-    fi
-    # stupid hack, but without it, it tries to use /usr/lib/libc.so from host and fails
-    # temacs: error while loading shared libraries: /usr/lib/libc.so: ELF file version does not match current one
-    if [ ! -f $treedir/${base_libdir}/libc.so ]; then
-        ln -s libc.so.6 $treedir/${base_libdir}/libc.so
-    fi
-
-    # copy only as much stuff as we need
-    # before: 5.5G   ../../qemu-treedir/
-    # after:   17M   ../../qemu-treedir/
-    cp -pPR \
-    ${STAGING_DIR_TARGET}/${base_libdir}/ld-* \
-    ${STAGING_DIR_TARGET}/${base_libdir}/libc.* \
-    ${STAGING_DIR_TARGET}/${base_libdir}/libc-* \
-    ${STAGING_DIR_TARGET}/${base_libdir}/libm-* \
-    ${STAGING_DIR_TARGET}/${base_libdir}/libm.* \
-    ${STAGING_DIR_TARGET}/${base_libdir}/libtinfo.so.* \
-    ${STAGING_DIR_TARGET}/${base_libdir}/libresolv* \
-    ${STAGING_DIR_TARGET}/${base_libdir}/libdl* \
-    ${STAGING_DIR_TARGET}/${base_libdir}/librt* \
-    ${STAGING_DIR_TARGET}/${base_libdir}/libgcc_s.so.* \
-    ${STAGING_DIR_TARGET}/${base_libdir}/libpthread* $treedir/${base_libdir}/
-
-    if [ ! -z "${@base_contains('PACKAGECONFIG', 'x11', 'x11', '', d)}" ] ; then
-        echo "X11 build enabled"
-        # copy only as much stuff as we need
-        # before: 5.5G   ../../qemu-treedir/
-        # after:   86M   ../../qemu-treedir/
-        cp -pPR \
-        ${STAGING_DIR_TARGET}/${base_libdir}/libuuid.so.* \
-        ${STAGING_DIR_TARGET}/${base_libdir}/libz.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libICE.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libSM.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libatk-1.0.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libcairo.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libdbus-1.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libdbus-glib-1.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libexpat.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libffi.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libfontconfig.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libfreetype.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libgconf-2.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libgif.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libjpeg.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/liblzma.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libpixman-1.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libpng1*.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/librsvg-2.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libstdc++.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libtiff.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libxml2.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libcroco-0.6.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libharfbuzz.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libicule.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libicuuc.so.* \
-        ${STAGING_DIR_TARGET}/${libdir}/libicudata.so.* $treedir/${base_libdir}/
-
-        # X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes Xft Xpm Xrandr Xrender
-        cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libX*.so.* $treedir/${base_libdir}/
-
-        # gdk-x11 gdk_pixbuf gio glib gmodule gobject gthread gtk-x11
-        cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libg*-2.0.so.* $treedir/${base_libdir}/
-
-        # pango pangocairo pangoft2
-        cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libpango*-1.0.so.* $treedir/${base_libdir}/
-
-        # xcb-render xcb-shm xcb
-        cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libxcb*.so.* $treedir/${base_libdir}/
-    fi
 }
 
 do_install_append() {
diff --git a/meta-oe/recipes-support/emacs/emacs_23.4.bb b/meta-oe/recipes-support/emacs/emacs_23.4.bb
index a324828..36e8f0c 100644
--- a/meta-oe/recipes-support/emacs/emacs_23.4.bb
+++ b/meta-oe/recipes-support/emacs/emacs_23.4.bb
@@ -2,8 +2,6 @@ require emacs.inc
 
 PR = "r4"
 
-PNBLACKLIST[emacs] ?= "qemu: uncaught target signal 11 (Segmentation fault) - core dumped"
-
 SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=tarball \
            file://use-qemu.patch \
            file://nostdlib-unwind.patch \
-- 
2.1.0


From 09961c681ffd5bd98d5f96ee6a82a710386e119a Mon Sep 17 00:00:00 2001
From: Dan McGregor <danismostlikely@gmail.com>
Date: Tue, 3 Feb 2015 18:46:42 -0600
Subject: [meta-gnome][PATCH 4/5] gdm: Only start in runlevel 5
To: openembedded-devel@lists.openembedded.org

From: Dan McGregor <dan.mcgregor@usask.ca>

Runlevel 5 is traditionally graphical. If it starts in runlevel 2
or 3 systemd gets confused and adds it as a dependency of the
multi-user target, not just the graphical target.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta-gnome/recipes-gnome/gdm/gdm/gdm       | 4 ++--
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm/gdm b/meta-gnome/recipes-gnome/gdm/gdm/gdm
index 43eae95..bb5b418 100755
--- a/meta-gnome/recipes-gnome/gdm/gdm/gdm
+++ b/meta-gnome/recipes-gnome/gdm/gdm/gdm
@@ -4,8 +4,8 @@
 # Should-Start:      console-screen acpid dbus hal network-manager
 # Required-Start:    $local_fs $remote_fs
 # Required-Stop:     $local_fs $remote_fs
-# Default-Start:     2 3 4 5
-# Default-Stop:      0 1 6
+# Default-Start:     5
+# Default-Stop:      0 1 2 3 6
 # Short-Description: GNOME Display Manager
 # Description:       Debian init script for the GNOME Display Manager
 ### END INIT INFO
diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index b2ae9ac..fcd51ff 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -88,7 +88,7 @@ RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "gdm.service"
 
 INITSCRIPT_NAME = "gdm"
-INITSCRIPT_PARAMS = "start 99 5 2 . stop 20 0 1 6 ."
+INITSCRIPT_PARAMS = "start 99 5 . stop 20 0 1 2 3 6 ."
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --no-create-home --home ${localstatedir}/lib/gdm --user-group gdm"
-- 
2.1.0


From 4dbe8a0bc32d09ea82726d78cfd1292a3a6b3719 Mon Sep 17 00:00:00 2001
From: Dan McGregor <danismostlikely@gmail.com>
Date: Tue, 3 Feb 2015 18:46:42 -0600
Subject: [meta-initramfs][PATCH 5/5] dracut: recipe cleanup
To: openembedded-devel@lists.openembedded.org

From: Dan McGregor <dan.mcgregor@usask.ca>

Split out bash-completion data
Update RDEPENDS: getopt is util-linux-getopt now
Use distro_features_check to require systemd
Recommend busybox

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 .../recipes-devtools/dracut/dracut_git.bb          | 25 ++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index ea55a4d..8ef0749 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -4,6 +4,8 @@ DESCRIPTION = "Dracut is an event driven initramfs infrastructure. dracut (the t
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
+PACKAGES =+ "${PN}-bash-completion"
+
 PE = "1"
 PV = "038"
 
@@ -13,8 +15,10 @@ SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git"
 
 S = "${WORKDIR}/git"
 
-do_configure() {
-    ./configure --prefix=${prefix} \
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "systemd"
+
+EXTRA_OECONF = "--prefix=${prefix} \
                 --libdir=${libdir} \
                 --datadir=${datadir} \
                 --sysconfdir=${sysconfdir} \
@@ -23,20 +27,29 @@ do_configure() {
                 --bindir=${bindir} \
                 --includedir=${includedir} \
                 --localstatedir=${localstatedir} \
+                --systemdsystemunitdir=${systemd_unitdir}/system"
+
+do_configure() {
+    ./configure ${EXTRA_OECONF}
 }
 
 do_install() {
     oe_runmake install DESTDIR=${D}
 }
 
-FILES_${PN} += "${datadir}/bash-completion \ 
-                ${libdir}/kernel \
+FILES_${PN}-bash-completion = "${datadir}/bash-completion"
+
+FILES_${PN} += " ${libdir}/kernel \
+                ${systemd_unitdir} \
                "
+CONFFILES_${PN} += "${sysconfdir}/dracut.conf"
+
+RDEPENDS_${PN} = "systemd findutils cpio util-linux-blkid util-linux-getopt util-linux bash ldd"
+RDEPENDS_${PN}-bash-completion = "bash-completion"
 
-# 'getopt' is in the util-linux main package
-RDEPENDS_${PN} = "systemd findutils cpio util-linux-blkid util-linux bash ldd"
 # This could be optimized a bit, but let's avoid non-booting systems :)
 RRECOMMENDS_${PN} = " \
                      kernel-modules \
+                     busybox \
                      coreutils \ 
                     "
-- 
2.1.0


