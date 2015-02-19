Return-Path: <danismostlikely@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2D3C873617
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 18:35:37 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id z20so11461737igj.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 10:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=o7nFiFmm9QskXQakAy9Mm+dJ/w6nqU83d2PqePVT+1k=;
	b=e4Er+juVrfZkWxcWpQV61TSzGA7EIqelSDHtyTDGtA42JsfJvob96A58SMJn8/f6+X
	3w27NkwrAg6tlVcPxTu50kpOfJPIc47M5/0G7+QY2MGRUo07pUJw6DB+H2fYthi0UgLB
	DJBFvgfQqlrnVprDjhcV0ZHozoIWvFBz5T6L2Owsh0s0dpOwLw1Kva3slRwJDDSD/ak9
	16PQ66MYWdU1+0UKXT0CsrkWWH3sgIwO+SxFsvJmMRSlSe5/dn/gqpJDW7akyHpwrwuK
	LMXvnRkOEgYNxgwOK/Rzx/YaUMsgY63iJmV4dsPIqs6jMYNtRkFlRa6/WcGEspsLD7O/
	8f1g==
X-Received: by 10.107.32.14 with SMTP id g14mr8372816iog.3.1424370937891;
	Thu, 19 Feb 2015 10:35:37 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74]) by mx.google.com with ESMTPSA id
	f11sm15446317iof.16.2015.02.19.10.35.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Feb 2015 10:35:37 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Feb 2015 12:35:34 -0600
Message-Id: <1424370934-9288-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.3.0.dirty
Subject: [meta-oe][PATCH v3] emacs: Un-blacklist, seems to work fine with new qemu
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
X-List-Received-Date: Thu, 19 Feb 2015 18:35:39 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

I've only tested the build with armv7 and x86, but the build
doesn't segfault anymore. The last time this was tested was
with qemu 1.5, we're now using 2.1.

While here, don't copy stuff from the sysroot into the qemu tree
just use the sysroot itself.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 .../emacs/emacs-23.4/emacs-xgselect.patch          | 26 ++++++
 meta-oe/recipes-support/emacs/emacs.inc            | 98 ++--------------------
 meta-oe/recipes-support/emacs/emacs_23.4.bb        |  3 +-
 3 files changed, 36 insertions(+), 91 deletions(-)
 create mode 100644 meta-oe/recipes-support/emacs/emacs-23.4/emacs-xgselect.patch

diff --git a/meta-oe/recipes-support/emacs/emacs-23.4/emacs-xgselect.patch b/meta-oe/recipes-support/emacs/emacs-23.4/emacs-xgselect.patch
new file mode 100644
index 0000000..c103dfa
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/emacs-23.4/emacs-xgselect.patch
@@ -0,0 +1,26 @@
+diff -up emacs-23.4/src/xgselect.c.xgselect emacs-23.4/src/xgselect.c
+--- emacs-23.4/src/xgselect.c.xgselect	2011-11-25 14:05:03.963372281 +0100
++++ emacs-23.4/src/xgselect.c	2011-11-25 14:06:49.798049160 +0100
+@@ -53,12 +53,17 @@ xg_select (max_fds, rfds, wfds, efds, ti
+   g_main_context_pending (context);
+ 
+   do {
+-    if (n_gfds > gfds_size) 
++    if (n_gfds > gfds_size)
+       {
+-        while (n_gfds > gfds_size) 
+-          gfds_size *= 2;
+-        xfree (gfds);
+-        gfds = xmalloc (sizeof (*gfds) * gfds_size);
++	if (gfds_size == 0)
++	  xgselect_initialize ();
++	else
++	  {
++	    while (n_gfds > gfds_size)
++	      gfds_size *= 2;
++	    xfree (gfds);
++	    gfds = xmalloc (sizeof (*gfds) * gfds_size);
++	  }
+       }
+ 
+     n_gfds = g_main_context_query (context,
diff --git a/meta-oe/recipes-support/emacs/emacs.inc b/meta-oe/recipes-support/emacs/emacs.inc
index a1a4965..694e3c5 100644
--- a/meta-oe/recipes-support/emacs/emacs.inc
+++ b/meta-oe/recipes-support/emacs/emacs.inc
@@ -6,7 +6,7 @@ SECTION = "editor"
 # and it needs to run some generated binaries..
 DEPENDS += "qemu-native"
 
-DEPENDS +=" liblockfile"
+DEPENDS +=" liblockfile ncurses"
 
 X11DEPENDS = " \
     libice libsm atk cairo dbus expat libffi fontconfig freetype gconf giflib \
@@ -14,17 +14,19 @@ X11DEPENDS = " \
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
 
-PACKAGES =+ "${PN}-el"
+PACKAGES =+ "${PN}-el ${PN}-grep-changelog"
+
+RDEPENDS_${PN}-grep-changelog += "perl"
+FILES_${PN}-grep-changelog += "${bindir}/grep-changelog"
 
 FILES_${PN}-el = "${datadir}/emacs/*/*/*.el.gz \
                   ${datadir}/emacs/*/*/*/*.el.gz"
@@ -33,15 +35,15 @@ FILES_${PN} += "${datadir}/emacs ${datadir}/icons"
 
 FILES_${PN}-dbg += "${libexecdir}/emacs/*/*/.debug ${datadir}/emacs/*/*/.debug"
 
-TREEDIR = "${WORKDIR}/qemu-treedir"
-
 QEMUARCH= "${TARGET_ARCH}"
 QEMUARCH_i486 = "i386"
 QEMUARCH_i586 = "i386"
 QEMUARCH_i686 = "i386"
 
+QEMU_OPTIONS ?= ""
+
 # Large stack is required at least on x86_64 host, otherwise random segfaults appear:
-QEMU = "qemu-${QEMUARCH} ${QEMU_OPTIONS} -s 1048576 -L ${TREEDIR} "
+QEMU = "qemu-${QEMUARCH} ${QEMU_OPTIONS} -s 1048576 -L ${STAGING_DIR_HOST} "
 
 export LOGNAME = "$(whoami)"
 
@@ -52,88 +54,6 @@ do_compile_prepend() {
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
index a324828..005fcf7 100644
--- a/meta-oe/recipes-support/emacs/emacs_23.4.bb
+++ b/meta-oe/recipes-support/emacs/emacs_23.4.bb
@@ -2,9 +2,8 @@ require emacs.inc
 
 PR = "r4"
 
-PNBLACKLIST[emacs] ?= "qemu: uncaught target signal 11 (Segmentation fault) - core dumped"
-
 SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=tarball \
+           file://emacs-xgselect.patch \
            file://use-qemu.patch \
            file://nostdlib-unwind.patch \
 "
-- 
2.3.0.dirty


