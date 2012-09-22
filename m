Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TFRVk-0008SN-0U
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Sep 2012 17:20:52 +0200
Received: by weyt44 with SMTP id t44so1272295wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Sep 2012 08:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=CqVWUiheIxzJD7ezeBQpiClsvG9PWCw53TOKR/kJpjE=;
	b=w6alUQMbg5QS9j8O7Sz7e+5rTHRgIujqtYnBfSEE/qXaHgiDA4/plfO0Knpb91NKuU
	gWTxS3sjA3gmg/kdr+minDB2VeRs9QC41StOqe4IQDxU9QdxBzJeiYf7fY/Vlr066A5K
	qb7Usx5sjbN0VoLGcsEa2Ohw+5J+r02soz4fm2kvNKwX2hWCnnG/7BkAZoXRI8hcKecQ
	n5JCZ3JOQBvy/UwfPB+YXgBygxO6xY3dSwU73T2Tn99ZmLhAucLhKqCs9x4g0bgdIiHY
	WKDbUvhCJEqpKdhNL0sEG4pp6JucpmuPG+MNNfqQ1C6eiZb18HYnLg6VuL+Utr3SXny+
	xGLg==
Received: by 10.180.84.169 with SMTP id a9mr3543465wiz.8.1348326486952;
	Sat, 22 Sep 2012 08:08:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k2sm4607788wiz.7.2012.09.22.08.08.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 08:08:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Sep 2012 17:07:42 +0200
Message-Id: <c988ce5518967d3acd0edd5d71a44963f08dae7a.1348320947.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1348320947.git.Martin.Jansa@gmail.com>
References: <cover.1348320947.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1348320947.git.Martin.Jansa@gmail.com>
References: <cover.1348320947.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/3] emacs: fix X11DEPENDS and build without x11 enabled at all
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
X-List-Received-Date: Sat, 22 Sep 2012 15:20:52 -0000

* also added copy for libcroco
  librsvg is linked to it by default after
  http://git.openembedded.org/openembedded-core/commit/?id=e177f1475c55c7d0bf3e2752e6502a7e8577a075

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs.inc     | 114 +++++++++++++++-------------
 meta-oe/recipes-support/emacs/emacs_23.4.bb |   2 +-
 2 files changed, 64 insertions(+), 52 deletions(-)

diff --git a/meta-oe/recipes-support/emacs/emacs.inc b/meta-oe/recipes-support/emacs/emacs.inc
index 61761e8..b7a7b75 100644
--- a/meta-oe/recipes-support/emacs/emacs.inc
+++ b/meta-oe/recipes-support/emacs/emacs.inc
@@ -8,7 +8,13 @@ DEPENDS += "qemu-native"
 
 DEPENDS +=" liblockfile"
 
-X11DEPENDS = "gtk+ libungif dbus"
+X11DEPENDS = " \
+  libice libsm atk cairo dbus expat libffi fontconfig freetype gconf giflib \
+  jpeg xz pixman libpng librsvg tiff libcroco \
+  libx11 libxau libxcomposite libxcursor libxdamage libxdmcp libxext libxfixes \
+  libxft libxpm libxrandr libxrender \
+  gdk-pixbuf glib-2.0 gtk+ pango libxcb \
+" 
 
 EXTRA_OECONF =  "--without-sound --with-crt-dir=${STAGING_LIBDIR} "
 
@@ -50,11 +56,24 @@ do_compile_prepend() {
 	if [ -e $treedir ];then
 		rm -rf $treedir
 	fi
+	
+	mkdir -p $treedir/${base_libdir}
+
+	if [ -f ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so ]; then
+		cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so $treedir/${base_libdir}
+	fi
+	if [ -f ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so.* ]; then
+		cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so.* $treedir/${base_libdir}
+	fi
+	# stupid hack, but without it, it tries to use /usr/lib/libc.so from host and fails
+	# temacs: error while loading shared libraries: /usr/lib/libc.so: ELF file version does not match current one
+	if [ ! -f $treedir/${base_libdir}/libc.so ]; then
+		ln -s libc.so.6 $treedir/${base_libdir}/libc.so
+	fi
 
 	# copy only as much stuff as we need
 	# before: 5.5G   ../../qemu-treedir/
-	# after:   86M   ../../qemu-treedir/
-	mkdir -p $treedir/${base_libdir}
+	# after:   17M   ../../qemu-treedir/
 	cp -pPR \
 	${STAGING_DIR_TARGET}/${base_libdir}/ld-* \
 	${STAGING_DIR_TARGET}/${base_libdir}/libc.* \
@@ -65,57 +84,50 @@ do_compile_prepend() {
 	${STAGING_DIR_TARGET}/${base_libdir}/libresolv* \
 	${STAGING_DIR_TARGET}/${base_libdir}/libdl* \
 	${STAGING_DIR_TARGET}/${base_libdir}/librt* \
-	${STAGING_DIR_TARGET}/${base_libdir}/libresolv* \
 	${STAGING_DIR_TARGET}/${base_libdir}/libgcc_s.so.* \
-	${STAGING_DIR_TARGET}/${base_libdir}/libuuid.so.* \
 	${STAGING_DIR_TARGET}/${base_libdir}/libpthread* $treedir/${base_libdir}/
 
-	cp -pPR \
-	${STAGING_DIR_TARGET}/${libdir}/libICE.so.* \
-	${STAGING_DIR_TARGET}/${libdir}/libSM.so.* \
-	${STAGING_DIR_TARGET}/${libdir}/libatk-1.0.so.* \
-	${STAGING_DIR_TARGET}/${libdir}/libcairo.so.* \
-	${STAGING_DIR_TARGET}/${libdir}/libdbus-1.so.* \
-	${STAGING_DIR_TARGET}/${libdir}/libdbus-glib-1.so.* \
-	${STAGING_DIR_TARGET}/${libdir}/libexpat.so.* \
-	${STAGING_DIR_TARGET}/${libdir}/libffi.so.* \
-	${STAGING_DIR_TARGET}/${libdir}/libfontconfig.so.* \
-	${STAGING_DIR_TARGET}/${libdir}/libfreetype.so.* \
-	${STAGING_DIR_TARGET}/${libdir}/libgconf-2.so.* \
-	${STAGING_DIR_TARGET}/${libdir}/libgif.so.* \
-	${STAGING_DIR_TARGET}/${libdir}/libjpeg.so.* \
-	${STAGING_DIR_TARGET}/${libdir}/liblzma.so.* \
-	${STAGING_DIR_TARGET}/${libdir}/libpixman-1.so.* \
-	${STAGING_DIR_TARGET}/${libdir}/libpng12.so.* \
-	${STAGING_DIR_TARGET}/${libdir}/librsvg-2.so.* \
-	${STAGING_DIR_TARGET}/${libdir}/libstdc++.so.* \
-	${STAGING_DIR_TARGET}/${libdir}/libtiff.so.* \
-	${STAGING_DIR_TARGET}/${libdir}/libxml2.so.* \
-	${STAGING_DIR_TARGET}/${libdir}/libz.so.* $treedir/${base_libdir}/
-
-	# X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes Xft Xpm Xrandr Xrender
-	cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libX*.so.* $treedir/${base_libdir}/
-
-	# gdk-x11 gdk_pixbuf gio glib gmodule gobject gthread gtk-x11
-	cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libg*-2.0.so.* $treedir/${base_libdir}/
-
-	# pango pangocairo pangoft2
-	cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libpango*-1.0.so.* $treedir/${base_libdir}/
-
-	# xcb-render xcb-shm xcb
-	cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libxcb*.so.* $treedir/${base_libdir}/
-
-	#cp -pPR ${STAGING_DIR_TARGET}/* $treedir
-	if [ -f ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so ]; then
-		cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so $treedir/lib
-	fi
-	if [ -f ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so.* ]; then
-		cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so.* $treedir/lib
-	fi
-	# stupid hack, but without it, it tries to use /usr/lib/libc.so from host and fails
-	# temacs: error while loading shared libraries: /usr/lib/libc.so: ELF file version does not match current one
-	if [ ! -f $treedir/${base_libdir}/libc.so ]; then
-		ln -s libc.so.6 $treedir/${base_libdir}/libc.so
+	if [ ! -z "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" ] ; then
+		echo "X11 build enabled"
+		# copy only as much stuff as we need
+		# before: 5.5G   ../../qemu-treedir/
+		# after:   86M   ../../qemu-treedir/
+		cp -pPR \
+		${STAGING_DIR_TARGET}/${base_libdir}/libuuid.so.* \
+		${STAGING_DIR_TARGET}/${libdir}/libICE.so.* \
+		${STAGING_DIR_TARGET}/${libdir}/libSM.so.* \
+		${STAGING_DIR_TARGET}/${libdir}/libatk-1.0.so.* \
+		${STAGING_DIR_TARGET}/${libdir}/libcairo.so.* \
+		${STAGING_DIR_TARGET}/${libdir}/libdbus-1.so.* \
+		${STAGING_DIR_TARGET}/${libdir}/libdbus-glib-1.so.* \
+		${STAGING_DIR_TARGET}/${libdir}/libexpat.so.* \
+		${STAGING_DIR_TARGET}/${libdir}/libffi.so.* \
+		${STAGING_DIR_TARGET}/${libdir}/libfontconfig.so.* \
+		${STAGING_DIR_TARGET}/${libdir}/libfreetype.so.* \
+		${STAGING_DIR_TARGET}/${libdir}/libgconf-2.so.* \
+		${STAGING_DIR_TARGET}/${libdir}/libgif.so.* \
+		${STAGING_DIR_TARGET}/${libdir}/libjpeg.so.* \
+		${STAGING_DIR_TARGET}/${libdir}/liblzma.so.* \
+		${STAGING_DIR_TARGET}/${libdir}/libpixman-1.so.* \
+		${STAGING_DIR_TARGET}/${libdir}/libpng12.so.* \
+		${STAGING_DIR_TARGET}/${libdir}/librsvg-2.so.* \
+		${STAGING_DIR_TARGET}/${libdir}/libstdc++.so.* \
+		${STAGING_DIR_TARGET}/${libdir}/libtiff.so.* \
+		${STAGING_DIR_TARGET}/${libdir}/libxml2.so.* \
+		${STAGING_DIR_TARGET}/${libdir}/libcroco-0.6.so.* \
+		${STAGING_DIR_TARGET}/${libdir}/libz.so.* $treedir/${base_libdir}/
+
+		# X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes Xft Xpm Xrandr Xrender
+		cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libX*.so.* $treedir/${base_libdir}/
+
+		# gdk-x11 gdk_pixbuf gio glib gmodule gobject gthread gtk-x11
+		cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libg*-2.0.so.* $treedir/${base_libdir}/
+
+		# pango pangocairo pangoft2
+		cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libpango*-1.0.so.* $treedir/${base_libdir}/
+
+		# xcb-render xcb-shm xcb
+		cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libxcb*.so.* $treedir/${base_libdir}/
 	fi
 }
 
diff --git a/meta-oe/recipes-support/emacs/emacs_23.4.bb b/meta-oe/recipes-support/emacs/emacs_23.4.bb
index 65cc3a3..5ad5644 100644
--- a/meta-oe/recipes-support/emacs/emacs_23.4.bb
+++ b/meta-oe/recipes-support/emacs/emacs_23.4.bb
@@ -1,6 +1,6 @@
 require emacs.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=tarball \
            file://use-qemu.patch \
-- 
1.7.12



