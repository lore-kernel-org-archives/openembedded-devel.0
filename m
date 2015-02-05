Return-Path: <danismostlikely@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id C8CD371E61
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:23:06 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id h15so28525254igd.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QSCz7wYzePcGCmO/Nji52Eid9zseAqfJ6nTW/hciuxQ=;
	b=CUvnJ4iCd089RUkytN2U9AvwL+UCx0WptEn45OMEs/GgPwSE1S/hxHwRakLzRNghw+
	oNuD+c9zunsZZ3TMbOzogQE/sLLnvuf2yzM11dYXqz4cMsu26ZxWgidVaB1CEIT+RAV+
	QaTxbkTOm9dGoxa2hQGmFzrri2aGzszMxMyvh7xO5ABm/z8qSww7Pe9eGvwBP2uI2amx
	sZ9fKc+BVGG0hdM//vp3pSLVksYEZ1JHkIE6LDATbicuRJz4hn98H6iMrgK5lWdBE3Fs
	JxWITWy4dlo+WLzSVyrBtSOQAatxGa92uFC4PZU3GvGIVe7JomUgDgAxC8xZ/AK3zUHE
	7/Qw==
X-Received: by 10.43.63.13 with SMTP id xc13mr7869274icb.19.1423153387317;
	Thu, 05 Feb 2015 08:23:07 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74])
	by mx.google.com with ESMTPSA id e3sm11364947igg.16.2015.02.05.08.23.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Feb 2015 08:23:06 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Feb 2015 10:23:04 -0600
Message-Id: <1423153384-25662-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423075209-24723-1-git-send-email-danismostlikely@gmail.com>
References: <1423075209-24723-1-git-send-email-danismostlikely@gmail.com>
Subject: [meta-oe][PATCH v2 3/5] emacs: Un-blacklist, seems to work fine with new qemu
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
X-List-Received-Date: Thu, 05 Feb 2015 16:23:17 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

I've only tested the build with armv7 and x86, but the build
doesn't segfault anymore. The last time this was tested was
with qemu 1.5, we're now using 2.1.

While here, don't copy stuff from the sysroot into the qemu tree
just use the sysroot itself.

Also disable X11 support by default. There is still an issue
seen by multiple people where an emacs built with X11 support
will hang when run outside of X.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta-oe/recipes-support/emacs/emacs.inc     | 91 +----------------------------
 meta-oe/recipes-support/emacs/emacs_23.4.bb |  2 -
 2 files changed, 3 insertions(+), 90 deletions(-)

diff --git a/meta-oe/recipes-support/emacs/emacs.inc b/meta-oe/recipes-support/emacs/emacs.inc
index a1a4965..c1d50f2 100644
--- a/meta-oe/recipes-support/emacs/emacs.inc
+++ b/meta-oe/recipes-support/emacs/emacs.inc
@@ -14,14 +14,13 @@ X11DEPENDS = " \
     libx11 libxau libxcomposite libxcursor libxdamage libxdmcp libxext libxfixes \
     libxft libxpm libxrandr libxrender \
     gdk-pixbuf glib-2.0 gtk+ pango libxcb harfbuzz icu \
-" 
+"
 
 EXTRA_OECONF =  "--without-sound --with-crt-dir=${STAGING_LIBDIR} "
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= ""
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


