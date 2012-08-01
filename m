Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwhTe-0005jX-QB
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2012 00:33:14 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so5030562wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Aug 2012 15:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=6w8I7qTJXp561AAyL5QXlrv//BTH5pwExAz0K96CW0w=;
	b=DHG704nrVy5OWDT8BAN8dSBiyJGqOVKY4hwG7x5DMADOFtrhwtbJNPPGxnMQsBrfPX
	X1S+JR+eSB1FzvVfuN9un+g+bkNp2JQfF4rakJv0aYIA7yp8xCA2B4UUkUHIcy8pfM2g
	qKge4GhPWs2hmC6XyKAr2u7eQRE7U+JPXLwY62rs60UniyyWRcRcFjmDGJRM+J5CzU4X
	gicrEyTwQJ9FRxEKCNv4YMxGx4dBVMXGQQEC8zl3Nydv324otqoU6LLg/4JhGxC+77tV
	yxeBexf5lHgA1sMB5G7acTbmEh1GhW01LC+u/T2oSKG+mA9qWNh4MUSijx7TvtSYl91g
	pdsA==
Received: by 10.216.131.196 with SMTP id m46mr10156424wei.35.1343859698310;
	Wed, 01 Aug 2012 15:21:38 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ep14sm37079031wid.0.2012.08.01.15.21.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 15:21:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Aug 2012 00:21:00 +0200
Message-Id: <611769698e021c8cb86fb4f740c6891901332f8c.1343859304.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343859304.git.Martin.Jansa@gmail.com>
References: <cover.1343859304.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343859304.git.Martin.Jansa@gmail.com>
References: <cover.1343859304.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/8] emacs: copy only needed stuff to qemu-treedir, not whole sysroot
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
X-List-Received-Date: Wed, 01 Aug 2012 22:33:14 -0000

* my typical sysroot is huge (5.5G) and only 86M is really needed
  we can also copy copy whole
  ${STAGING_DIR_TARGET}/${libdir}/lib*.so.*
  ${STAGING_DIR_TARGET}/${base_libdir}/l*
  but that is still quite big (3.2G)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs.inc |   74 ++++++++++++++++++++++++++----
 1 files changed, 64 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-support/emacs/emacs.inc b/meta-oe/recipes-support/emacs/emacs.inc
index 150658e..61761e8 100644
--- a/meta-oe/recipes-support/emacs/emacs.inc
+++ b/meta-oe/recipes-support/emacs/emacs.inc
@@ -50,18 +50,72 @@ do_compile_prepend() {
 	if [ -e $treedir ];then
 		rm -rf $treedir
 	fi
-	mkdir $treedir
-	cp -pPR ${STAGING_DIR_TARGET}/* $treedir
-	if [ -f ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/libgcc_s.so ]; then
-                cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/libgcc_s.so $treedir/lib
-        fi
-        if [ -f ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/libgcc_s.so.* ]; then
-                cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/libgcc_s.so.* $treedir/lib
-        fi
+
+	# copy only as much stuff as we need
+	# before: 5.5G   ../../qemu-treedir/
+	# after:   86M   ../../qemu-treedir/
+	mkdir -p $treedir/${base_libdir}
+	cp -pPR \
+	${STAGING_DIR_TARGET}/${base_libdir}/ld-* \
+	${STAGING_DIR_TARGET}/${base_libdir}/libc.* \
+	${STAGING_DIR_TARGET}/${base_libdir}/libc-* \
+	${STAGING_DIR_TARGET}/${base_libdir}/libm-* \
+	${STAGING_DIR_TARGET}/${base_libdir}/libm.* \
+	${STAGING_DIR_TARGET}/${base_libdir}/libtinfo.so.* \
+	${STAGING_DIR_TARGET}/${base_libdir}/libresolv* \
+	${STAGING_DIR_TARGET}/${base_libdir}/libdl* \
+	${STAGING_DIR_TARGET}/${base_libdir}/librt* \
+	${STAGING_DIR_TARGET}/${base_libdir}/libresolv* \
+	${STAGING_DIR_TARGET}/${base_libdir}/libgcc_s.so.* \
+	${STAGING_DIR_TARGET}/${base_libdir}/libuuid.so.* \
+	${STAGING_DIR_TARGET}/${base_libdir}/libpthread* $treedir/${base_libdir}/
+
+	cp -pPR \
+	${STAGING_DIR_TARGET}/${libdir}/libICE.so.* \
+	${STAGING_DIR_TARGET}/${libdir}/libSM.so.* \
+	${STAGING_DIR_TARGET}/${libdir}/libatk-1.0.so.* \
+	${STAGING_DIR_TARGET}/${libdir}/libcairo.so.* \
+	${STAGING_DIR_TARGET}/${libdir}/libdbus-1.so.* \
+	${STAGING_DIR_TARGET}/${libdir}/libdbus-glib-1.so.* \
+	${STAGING_DIR_TARGET}/${libdir}/libexpat.so.* \
+	${STAGING_DIR_TARGET}/${libdir}/libffi.so.* \
+	${STAGING_DIR_TARGET}/${libdir}/libfontconfig.so.* \
+	${STAGING_DIR_TARGET}/${libdir}/libfreetype.so.* \
+	${STAGING_DIR_TARGET}/${libdir}/libgconf-2.so.* \
+	${STAGING_DIR_TARGET}/${libdir}/libgif.so.* \
+	${STAGING_DIR_TARGET}/${libdir}/libjpeg.so.* \
+	${STAGING_DIR_TARGET}/${libdir}/liblzma.so.* \
+	${STAGING_DIR_TARGET}/${libdir}/libpixman-1.so.* \
+	${STAGING_DIR_TARGET}/${libdir}/libpng12.so.* \
+	${STAGING_DIR_TARGET}/${libdir}/librsvg-2.so.* \
+	${STAGING_DIR_TARGET}/${libdir}/libstdc++.so.* \
+	${STAGING_DIR_TARGET}/${libdir}/libtiff.so.* \
+	${STAGING_DIR_TARGET}/${libdir}/libxml2.so.* \
+	${STAGING_DIR_TARGET}/${libdir}/libz.so.* $treedir/${base_libdir}/
+
+	# X11 Xau Xcomposite Xcursor Xdamage Xdmcp Xext Xfixes Xft Xpm Xrandr Xrender
+	cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libX*.so.* $treedir/${base_libdir}/
+
+	# gdk-x11 gdk_pixbuf gio glib gmodule gobject gthread gtk-x11
+	cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libg*-2.0.so.* $treedir/${base_libdir}/
+
+	# pango pangocairo pangoft2
+	cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libpango*-1.0.so.* $treedir/${base_libdir}/
+
+	# xcb-render xcb-shm xcb
+	cp -pPR ${STAGING_DIR_TARGET}/${libdir}/libxcb*.so.* $treedir/${base_libdir}/
+
+	#cp -pPR ${STAGING_DIR_TARGET}/* $treedir
+	if [ -f ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so ]; then
+		cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so $treedir/lib
+	fi
+	if [ -f ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so.* ]; then
+		cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/${base_libdir}/libgcc_s.so.* $treedir/lib
+	fi
 	# stupid hack, but without it, it tries to use /usr/lib/libc.so from host and fails
 	# temacs: error while loading shared libraries: /usr/lib/libc.so: ELF file version does not match current one
-	if [ ! -f $treedir/lib/libc.so ]; then
-		ln -s libc.so.6 $treedir/lib/libc.so
+	if [ ! -f $treedir/${base_libdir}/libc.so ]; then
+		ln -s libc.so.6 $treedir/${base_libdir}/libc.so
 	fi
 }
 
-- 
1.7.8.6



