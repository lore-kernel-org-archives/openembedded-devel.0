Received: from [209.85.220.213] (helo=mail-fx0-f213.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MBsft-0000ej-8Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 17:46:45 +0200
Received: by fxm9 with SMTP id 9so74430fxm.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2009 08:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=AU9jeIjENG9lcJXdSpCmjU+GtD6p5CYZd7lVziRxDq4=;
	b=BaIHzkaD5Cs7IUc4+ZEAsNKPG0AIb7S1KlAwcFQGp+ALtTFyWwfs3IF0eSqisuJeqG
	cPzNDW+dBRDwjxGm2xal8Xkoq+TVnThVAa4ufYm6dBnPUMxeh//CRmHhPdfBQC6z0Wfw
	72qHdq/arktrwGo94eTZ/9QefyQ0YbtH0xc6g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=g+Ddw9b72KTq7shEYn5pt2S32CxKyByMJR2wc/G2CiAaC17G0l9l2fY/WmhewyXE/0
	3/9asDetvnhtjDfvJolZALf7ap670QfItx0Q31N/lRYWRtTd7/dv5QZkSbFjf3R1ON79
	cNQRLKWo4O+kc/oFqrGYabSi+03vFiPOfPzyA=
Received: by 10.103.221.14 with SMTP id y14mr697084muq.111.1244043465606;
	Wed, 03 Jun 2009 08:37:45 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id y2sm1419304mug.13.2009.06.03.08.37.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Jun 2009 08:37:45 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jun 2009 18:37:13 +0300
Message-Id: <1244043442-3868-4-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1244043442-3868-3-git-send-email-ihar.hrachyshka@gmail.com>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-2-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-3-git-send-email-ihar.hrachyshka@gmail.com>
Subject: [PATCH 03/12] qt4: style refinements, more generalization
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
X-List-Received-Date: Wed, 03 Jun 2009 15:46:45 -0000

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 classes/qt4e.bbclass             |    7 ++-
 recipes/qt4/qt4-embedded.inc     |   12 ++--
 recipes/qt4/qt4-tools-native.inc |    6 +-
 recipes/qt4/qt4.inc              |  104 +++++++++++++++++++-------------------
 4 files changed, 65 insertions(+), 64 deletions(-)

diff --git a/classes/qt4e.bbclass b/classes/qt4e.bbclass
index 445ecba..f72e06b 100644
--- a/classes/qt4e.bbclass
+++ b/classes/qt4e.bbclass
@@ -2,15 +2,16 @@ DEPENDS_prepend = "${@["qt4-embedded ", ""][(bb.data.getVar('PN', d, 1) == 'qt4-
 inherit qmake2
 
 QT_DIR_NAME = "qtopia"
+QT_LIBINFIX = "E"
 # override variables set by qmake-base to compile Qt/Embedded apps
 #
-export QMAKESPEC = "${STAGING_DATADIR}/qtopia/mkspecs/${TARGET_OS}-oe-g++"
-export OE_QMAKE_INCDIR_QT = "${STAGING_INCDIR}/qtopia"
+export QMAKESPEC = "${STAGING_DATADIR}/${QT_DIR_NAME}/mkspecs/${TARGET_OS}-oe-g++"
+export OE_QMAKE_INCDIR_QT = "${STAGING_INCDIR}/${QT_DIR_NAME}"
 export OE_QMAKE_LIBDIR_QT = "${STAGING_LIBDIR}"
 export OE_QMAKE_LIBS_QT = "qt"
 export OE_QMAKE_LIBS_X11 = ""
 export OE_QMAKE_EXTRA_MODULES = "network"
-EXTRA_QMAKEVARS_PRE += " QT_LIBINFIX=E "
+EXTRA_QMAKEVARS_PRE += " QT_LIBINFIX=${QT_LIBINFIX} "
 
 # Qt4 uses atomic instructions not supported in thumb mode
 ARM_INSTRUCTION_SET = "arm"
diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
index 3d986b2..26b4116 100644
--- a/recipes/qt4/qt4-embedded.inc
+++ b/recipes/qt4/qt4-embedded.inc
@@ -6,6 +6,11 @@ HOMEPAGE = "http://www.trolltech.com"
 DEPENDS += "directfb tslib"
 INC_PR = "r11"
 
+QT_BASE_NAME = "qt4-embedded"
+QT_BASE_LIB  = "libqt-embedded"
+QT_DIR_NAME = "qtopia"
+QT_LIBINFIX = "E"
+
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
            file://0001-cross-compile.patch;patch=1 \
            file://0002-fix-resinit-declaration.patch;patch=1 \
@@ -21,7 +26,7 @@ SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${
 S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
 
 QT_CONFIG_FLAGS += " \
-    -qtlibinfix E \
+    -qtlibinfix ${QT_LIBINFIX} \
     -qt-decoration-styled -plugin-decoration-default -plugin-decoration-windows \
     -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc -plugin-gfx-directfb \
     -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb \
@@ -29,11 +34,6 @@ QT_CONFIG_FLAGS += " \
     -DQT_KEYPAD_NAVIGATION \
     "
 
-QT_BASE_NAME = "qt4-embedded"
-QT_BASE_LIB  = "libqt-embedded"
-QT_DIR_NAME = "qtopia"
-QT_LIBINFIX="E"
-
 require qt4.inc
 
 inherit qt4e
diff --git a/recipes/qt4/qt4-tools-native.inc b/recipes/qt4/qt4-tools-native.inc
index a79eed4..4836a9d 100644
--- a/recipes/qt4/qt4-tools-native.inc
+++ b/recipes/qt4/qt4-tools-native.inc
@@ -22,8 +22,8 @@ EXTRA_OECONF = "-prefix ${prefix} \
                 -no-exceptions  \
                 -no-nas-sound \
                 -no-nis \
-                -verbose -release  -fast -static \
-                -qt3support "
+                -verbose -release -fast -static \
+                -qt3support"
 
 # yank default -e, otherwise we get the following error:
 # moc_qbuffer.cpp: No such file or directory
@@ -57,7 +57,7 @@ do_compile() {
 }
 
 do_stage() {
-	install -d ${STAGING_BINDIR_NATIVE}/
+    install -d ${STAGING_BINDIR_NATIVE}/
     install -m 0755 bin/qmake ${STAGING_BINDIR_NATIVE}/qmake2
     for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do
         install -m 0755 bin/${i} ${STAGING_BINDIR_NATIVE}/${i}4
diff --git a/recipes/qt4/qt4.inc b/recipes/qt4/qt4.inc
index 3deffa6..c17503d 100644
--- a/recipes/qt4/qt4.inc
+++ b/recipes/qt4/qt4.inc
@@ -1,6 +1,6 @@
 inherit qmake_base
 
-DEPENDS += " qt4-tools-native freetype jpeg libpng zlib dbus openssl glib-2.0 gstreamer gst-plugins-base"
+DEPENDS += "qt4-tools-native freetype jpeg libpng zlib dbus openssl glib-2.0 gstreamer gst-plugins-base"
 
 require qt4_arch.inc
 QT_ARCH := "${@qt_arch(d)}"
@@ -34,7 +34,7 @@ python __anonymous () {
         pkg = "${QT_BASE_LIB}"+ name.lower().replace("qt", "") + "4"
         # NOTE: the headers for QtAssistantClient are different
         incname = name.replace("QtAssistantClient", "QtAssistant")
-        bb.data.setVar("FILES_%s" % pkg, "%(pkg)s ${libdir}/lib%(name)s${QT_LIBINFIX}.so.*" % locals(), d)
+        bb.data.setVar("FILES_%s" % pkg, "${libdir}/lib%(name)s${QT_LIBINFIX}.so.*" % locals(), d)
         bb.data.setVar("FILES_%s-dev" % pkg, """${libdir}/lib%(name)s${QT_LIBINFIX}.prl
                   ${libdir}/lib%(name)s${QT_LIBINFIX}.a
                   ${libdir}/lib%(name)s${QT_LIBINFIX}.la
@@ -66,8 +66,8 @@ PACKAGES_DYNAMIC = "${QT_BASE_NAME}-plugin-*  ${QT_BASE_NAME}-translation-*"
 
 ALLOW_EMPTY_${PN} = "1"
 FILES_${PN}     = ""
-FILES_${PN}-dev = " ${includedir}/${QT_DIR_NAME}/Qt/*"
-FILES_${PN}-dbg = "${bindir}/*/.debug "
+FILES_${PN}-dev = "${includedir}/${QT_DIR_NAME}/Qt/*"
+FILES_${PN}-dbg = "${bindir}/*/.debug"
 RRECOMMENDS_${PN} = "${LIB_PACKAGES} ${OTHER_PACKAGES}"
 RRECOMMENDS_${PN}-dev = "${DEV_PACKAGES}"
 RRECOMMENDS_${PN}-dbg = "${DBG_PACKAGES}"
@@ -134,54 +134,54 @@ do_compile() {
 }
 
 python populate_packages_prepend() {
-	translation_dir = bb.data.expand('${datadir}/${QT_DIR_NAME}/translations/', d)
-	translation_name = bb.data.expand('${QT_BASE_NAME}-translation-%s', d)
-	do_split_packages(d, translation_dir, '^qt_(.*)\.qm$', translation_name, '${PN} translation for %s', extra_depends='' )
-
-	phrasebook_dir = bb.data.expand('${datadir}/${QT_DIR_NAME}/phrasebooks/', d)
-	phrasebook_name = bb.data.expand('${QT_BASE_NAME}-phrasebook-%s', d)
-	do_split_packages(d, phrasebook_dir, '^(.*)\.qph$', phrasebook_name, '${PN} phrasebook for %s', extra_depends='' )
-
-	# Package all the plugins and their -dbg version and create a meta package
-	import os
-	def qtopia_split(path, name, glob):
-		"""
-		Split the package into a normal and -dbg package and then add the
-		new packages to the meta package.
-		"""
-		plugin_dir     = bb.data.expand('${libdir}/${QT_DIR_NAME}/plugins/%s/' % path, d)
-		if not os.path.exists("%s%s" % (bb.data.expand('${D}',d), plugin_dir)):
-			bb.note("The path does not exist:", bb.data.expand('${D}', d), plugin_dir)
-			return
-
-		plugin_name    = bb.data.expand('${QT_BASE_NAME}-plugin-%s-%%s' % name, d)
-		dev_packages = []
-		dev_hook = lambda file,pkg,b,c,d:dev_packages.append((file,pkg))
-		do_split_packages(d, plugin_dir,     glob, plugin_name,     '${PN} %s for %%s' % name, extra_depends='', hook=dev_hook)
-		# Create a -dbg package as well
-		plugin_dir_dbg     = bb.data.expand('${libdir}/${QT_DIR_NAME}/plugins/%s/.debug' % path, d)
-		packages = bb.data.getVar('PACKAGES',d)
-		for (file,package) in dev_packages:
-			packages = "%s %s-dbg" % (packages, package)
-			file_name = os.path.join(plugin_dir_dbg, os.path.basename(file))
-			bb.data.setVar("FILES_%s-dbg" % package, file_name, d)
-			bb.data.setVar("DESCRIPTION_%s-dbg" % package, "${PN} %s for %s" % (name, package), d) 
-
-		bb.data.setVar('PACKAGES', packages, d)
-
-	qtopia_split('accessible',  'accessible',  '^libq(.*)\.so$')
-	qtopia_split('codecs',      'codec',       '^libq(.*)\.so$')
-	qtopia_split('decorations', 'decoration',  '^libqdecoration(.*)\.so$')
-	qtopia_split('designer',    'designer',    '^lib(.*)\.so$')
-	qtopia_split('gfxdrivers',  'gfxdriver',   '^libqgfx(.*)\.so$')
-	qtopia_split('mousedrivers','mousedriver', '^libq(.*)mousedriver\.so$')
-	qtopia_split('iconengines', 'iconengine',  '^libq(.*)\.so$')
-	qtopia_split('imageformats','imageformat', '^libq(.*)\.so$')
-	qtopia_split('inputmethods','inputmethod', '^libq(.*)\.so$')
-	qtopia_split('sqldrivers',  'sqldriver',   '^libq(.*)\.so$')
-	qtopia_split('script',      'script',      '^libqtscript(.*)\.so$')
-	qtopia_split('styles',      'style',       '^libq(.*)\.so$')
-	qtopia_split('phonon_backend',      'phonon-backend',       '^libphonon_(.*)\.so$')
+        translation_dir = bb.data.expand('${datadir}/${QT_DIR_NAME}/translations/', d)
+        translation_name = bb.data.expand('${QT_BASE_NAME}-translation-%s', d)
+        do_split_packages(d, translation_dir, '^qt_(.*)\.qm$', translation_name, '${PN} translation for %s', extra_depends='' )
+ 
+        phrasebook_dir = bb.data.expand('${datadir}/${QT_DIR_NAME}/phrasebooks/', d)
+        phrasebook_name = bb.data.expand('${QT_BASE_NAME}-phrasebook-%s', d)
+        do_split_packages(d, phrasebook_dir, '^(.*)\.qph$', phrasebook_name, '${PN} phrasebook for %s', extra_depends='' )
+ 
+        # Package all the plugins and their -dbg version and create a meta package
+        import os
+        def qtopia_split(path, name, glob):
+                """
+                Split the package into a normal and -dbg package and then add the
+                new packages to the meta package.
+                """
+                plugin_dir = bb.data.expand('${libdir}/${QT_DIR_NAME}/plugins/%s/' % path, d)
+                if not os.path.exists("%s%s" % (bb.data.expand('${D}',d), plugin_dir)):
+                        bb.note("The path does not exist:", bb.data.expand('${D}', d), plugin_dir)
+                        return
+ 
+                plugin_name = bb.data.expand('${QT_BASE_NAME}-plugin-%s-%%s' % name, d)
+                dev_packages = []
+                dev_hook = lambda file,pkg,b,c,d:dev_packages.append((file,pkg))
+                do_split_packages(d, plugin_dir, glob, plugin_name, '${PN} %s for %%s' % name, extra_depends='', hook=dev_hook)
+                # Create a -dbg package as well
+                plugin_dir_dbg = bb.data.expand('${libdir}/${QT_DIR_NAME}/plugins/%s/.debug' % path, d)
+                packages = bb.data.getVar('PACKAGES',d)
+                for (file,package) in dev_packages:
+                        packages = "%s %s-dbg" % (packages, package)
+                        file_name = os.path.join(plugin_dir_dbg, os.path.basename(file))
+                        bb.data.setVar("FILES_%s-dbg" % package, file_name, d)
+                        bb.data.setVar("DESCRIPTION_%s-dbg" % package, "${PN} %s for %s" % (name, package), d)
+
+                bb.data.setVar('PACKAGES', packages, d)
+ 
+        qtopia_split('accessible',    'accessible',    '^libq(.*)\.so$')
+        qtopia_split('codecs',        'codec',         '^libq(.*)\.so$')
+        qtopia_split('decorations',   'decoration',    '^libqdecoration(.*)\.so$')
+        qtopia_split('designer',      'designer',      '^lib(.*)\.so$')
+        qtopia_split('gfxdrivers',    'gfxdriver',     '^libqgfx(.*)\.so$')
+        qtopia_split('mousedrivers',  'mousedriver',   '^libq(.*)mousedriver\.so$')
+        qtopia_split('iconengines',   'iconengine',    '^libq(.*)\.so$')
+        qtopia_split('imageformats',  'imageformat',   '^libq(.*)\.so$')
+        qtopia_split('inputmethods',  'inputmethod',   '^libq(.*)\.so$')
+        qtopia_split('sqldrivers',    'sqldriver',     '^libq(.*)\.so$')
+        qtopia_split('script',        'script',        '^libqtscript(.*)\.so$')
+        qtopia_split('styles',        'style',         '^libq(.*)\.so$')
+        qtopia_split('phonon_backend','phonon-backend','^libphonon_(.*)\.so$')
 }
 
 do_install() {
-- 
1.6.3.1



