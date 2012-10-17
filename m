Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TOPdd-0000x4-J7
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Oct 2012 11:10:05 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so331304wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2012 01:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=JLhJnJTHfCG/o5VewrwuGArgKwGP0XYYDYm3h9/8xE4=;
	b=H01e0uXWlu5ENXU0QvN3dfvgyF+F5IMimOBrLjVRzgUOgfg0oA3w0Z9gWt6Koqvy9d
	M3ji7KNHz3syj7sbbB29a4SZEo5WeZYJy3GIscH1A9BUUCFvfeprjl9qk/jf21wghdEe
	l9GSa2wgQYxRfpdGqeAEX20dpNdKetLlh2yMj/crKA0EiNh0pOEpfu9i1/k1/3rd0suw
	Ayp/ohi33c5ykYVJCacD44HR19abN8PcUMVQZnyETuCrd4vnx0DBVO8xAGPGvyhbQEg0
	vqkQxS16B392u2XpIrtPX4nV3YlLMKfHcyl7h043XilfOZo8yVezGvXplkL9ZosbY5dj
	/IYw==
Received: by 10.180.8.134 with SMTP id r6mr2541324wia.18.1350464207766;
	Wed, 17 Oct 2012 01:56:47 -0700 (PDT)
Received: from s-stirtzel-linux.zera.local
	(ip-109-91-251-94.unitymediagroup.de. [109.91.251.94])
	by mx.google.com with ESMTPS id ei1sm26512318wid.7.2012.10.17.01.56.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Oct 2012 01:56:46 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Oct 2012 10:55:32 +0200
Message-Id: <1350464132-3965-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe] Maliit: Add initial recipes
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
X-List-Received-Date: Wed, 17 Oct 2012 09:10:05 -0000

Maliit is a Qt based virtual keyboard under liberal license (LGPLv2.1 / BSD)
The inputmethod framework from Qt is used and it supports gtk-immodules.
It can also be used without dependencies to GTK+ (separate package for GTK+)

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 ...INSTALL_PRF-to-allow-the-build-with-opene.patch |   34 ++++++++
 ...LUGIN_PATH-to-allow-openembedded-to-build.patch |   34 ++++++++
 .../recipes-support/maliit/maliit-framework_git.bb |   86 ++++++++++++++++++++
 .../recipes-support/maliit/maliit-plugins_git.bb   |   34 ++++++++
 4 files changed, 188 insertions(+)
 create mode 100644 meta-oe/recipes-support/maliit/maliit-framework/0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch
 create mode 100644 meta-oe/recipes-support/maliit/maliit-framework/0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch
 create mode 100644 meta-oe/recipes-support/maliit/maliit-framework_git.bb
 create mode 100644 meta-oe/recipes-support/maliit/maliit-plugins_git.bb

diff --git a/meta-oe/recipes-support/maliit/maliit-framework/0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch b/meta-oe/recipes-support/maliit/maliit-framework/0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch
new file mode 100644
index 0000000..acd9a57
--- /dev/null
+++ b/meta-oe/recipes-support/maliit/maliit-framework/0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch
@@ -0,0 +1,34 @@
+From 33554f9b3fd493c7e28617fd01466ffa87251f27 Mon Sep 17 00:00:00 2001
+From: Samuel Stirtzel <s.stirtzel@googlemail.com>
+Date: Wed, 1 Aug 2012 13:21:51 +0200
+Subject: [PATCH] Fix MALIIT_INSTALL_PRF to allow the build with openembedded
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
+---
+ config.pri |    8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/config.pri b/config.pri
+index b037b8c..43409f3 100644
+--- a/config.pri
++++ b/config.pri
+@@ -161,9 +161,11 @@ contains(QT_MAJOR_VERSION, 4) {
+     QT_WIDGETS = gui widgets
+ }
+ 
+-MALIIT_INSTALL_PRF = $$[QT_INSTALL_DATA]/mkspecs/features
+-local-install {
+-    MALIIT_INSTALL_PRF = $$replace(MALIIT_INSTALL_PRF, $$[QT_INSTALL_PREFIX], $$PREFIX)
++isEmpty(MALIIT_INSTALL_PRF) {
++    MALIIT_INSTALL_PRF = $$[QT_INSTALL_DATA]/mkspecs/features
++    local-install {
++        MALIIT_INSTALL_PRF = $$replace(MALIIT_INSTALL_PRF, $$[QT_INSTALL_PREFIX], $$PREFIX)
++    }
+ }
+ 
+ defineTest(outputFile) {
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-support/maliit/maliit-framework/0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch b/meta-oe/recipes-support/maliit/maliit-framework/0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch
new file mode 100644
index 0000000..830e6de
--- /dev/null
+++ b/meta-oe/recipes-support/maliit/maliit-framework/0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch
@@ -0,0 +1,34 @@
+From fb6acbd2af9ed288c1c4f4200fc73d8d9955486a Mon Sep 17 00:00:00 2001
+From: Samuel Stirtzel <s.stirtzel@googlemail.com>
+Date: Wed, 1 Aug 2012 13:33:10 +0200
+Subject: [PATCH] Fix QT_IM_PLUGIN_PATH to allow openembedded to build Maliit
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
+---
+ input-context/input-context.pri |   10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/input-context/input-context.pri b/input-context/input-context.pri
+index d94e6a3..d460e70 100644
+--- a/input-context/input-context.pri
++++ b/input-context/input-context.pri
+@@ -25,8 +25,10 @@ for(OPTION,$$list($$lower($$COV_OPTION))){
+ 
+ QMAKE_CLEAN += $$OBJECTS_DIR/*.gcno $$OBJECTS_DIR/*.gcda
+ 
+-QT_IM_PLUGIN_PATH = $$[QT_INSTALL_PLUGINS]/inputmethods
+-QT_PREFIX = $$[QT_INSTALL_PREFIX]
+-local-install {
+-    QT_IM_PLUGIN_PATH = $$replace(QT_IM_PLUGIN_PATH, $$QT_PREFIX, $$PREFIX)
++isEmpty(QT_IM_PLUGIN_PATH) {
++    QT_IM_PLUGIN_PATH = $$[QT_INSTALL_PLUGINS]/inputmethods
++    QT_PREFIX = $$[QT_INSTALL_PREFIX]
++    local-install {
++        QT_IM_PLUGIN_PATH = $$replace(QT_IM_PLUGIN_PATH, $$QT_PREFIX, $$PREFIX)
++    }
+ }
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bb b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
new file mode 100644
index 0000000..3f50d1b
--- /dev/null
+++ b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
@@ -0,0 +1,86 @@
+DESCRIPTION = "A virtual keyboard for touch-screen based user interfaces"
+HOMEPAGE = "https://wiki.maliit.org/Main_Page"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=5c917f6ce94ceb8d8d5e16e2fca5b9ad"
+
+inherit autotools qt4x11
+
+
+SRC_URI = "git://gitorious.org/maliit/maliit-framework.git;branch=master \
+    file://0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch \
+    file://0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch \
+    "
+
+SRCREV = "750842dec74a9b17dca91ef779c4fc5a43c4d9dc"
+PV = "0.92.3+git${SRCPV}"
+
+
+PACKAGES =+ "\
+    ${PN}-gtk \
+    "
+
+# Maliit needs Qt configured with -accessibility, a patch for that was already sent and will get merged in post 1.2.
+RDEPENDS_${PN} = "qt4-plugin-inputmethod-imsw-multi libqtsvg4"
+
+RRECOMMENDS_${PN} = "maliit-plugins"
+
+
+FILES_${PN} += "\
+    ${libdir}/maliit/plugins-*/factories/libmaliit-plugins-quick-factory-*.so \
+    ${libdir}/qt4/plugins/inputmethods/*.so \
+    "
+
+FILES_${PN}-dbg += "\
+    ${libdir}/maliit-framework-tests \
+    ${libdir}/gtk-*/*/immodules/.debug \
+    ${libdir}/maliit/plugins-*/factories/.debug \
+    ${libdir}/qt4/plugins/.debug \
+    ${libdir}/qt4/plugins/inputmethods/.debug \
+    "
+
+FILES_${PN}-dev += "${datadir}/qt4"
+
+FILES_${PN}-gtk +="\
+    ${bindir}/maliit-exampleapp-gtk* \
+    \
+    ${libdir}/gtk-*/*/immodules/libim-maliit.so\
+    "
+
+EXTRA_QMAKEVARS_PRE = "\
+    PREFIX=${prefix} \
+    LIBDIR=${libdir} \
+    QT_IM_PLUGIN_PATH=${libdir}/qt4/plugins/inputmethods \
+    MALIIT_INSTALL_PRF=${datadir}/qt4/mkspecs/features \
+    SCHEMADIR=${sysconfdir}/gconf/schemas \
+    CONFIG+=disable-gconf \
+    CONFIG+=disable-gtk-cache-update \
+    CONFIG+=local-install \
+    "
+
+do_install() {
+    cd ${S} && (INSTALL_ROOT=${D} oe_runmake install)
+
+    #Fix absolute paths
+    cd ${D}/${datadir}/qt4/mkspecs/features && sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ./maliit-framework.prf
+    cd ${D}/${datadir}/qt4/mkspecs/features && sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ./maliit-plugins.prf
+}
+
+
+
+# Update the inputmethod modules in gtk
+pkg_postinst_${PN}-gtk() {
+if [ "x$D" != "x" ]; then
+    exit 1
+fi
+gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
+}
+
+pkg_postrm_${PN}-gtk() {
+if [ "x$D" != "x" ]; then
+    exit 1
+fi
+gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
+}
+
+S= "${WORKDIR}/git"
diff --git a/meta-oe/recipes-support/maliit/maliit-plugins_git.bb b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
new file mode 100644
index 0000000..932c0ae
--- /dev/null
+++ b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Plugins for a virtual keyboard for touch-screen based user interfaces"
+HOMEPAGE = "https://wiki.maliit.org/Main_Page"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f29b21caa8e460097bfad9c026a33621"
+
+inherit autotools qt4x11
+
+DEPENDS = "maliit-framework"
+
+SRC_URI = "git://gitorious.org/maliit/maliit-plugins.git;branch=master"
+
+SRCREV = "0760e585df494b394df1b887e5138ffef19c481f"
+PV = "0.92.3+git${SRCPV}"
+
+EXTRA_QMAKEVARS_PRE = "\
+    PREFIX=${prefix} \
+    LIBDIR=${libdir} \
+    "
+
+FILES_${PN} += "\
+    ${libdir}/maliit \
+    ${datadir} \
+    "
+
+FILES_${PN}-dbg += "\
+    ${libdir}/maliit/plugins-*/.debug \
+    "
+
+S= "${WORKDIR}/git"
+
+do_install() {
+  cd ${S} && (INSTALL_ROOT=${D} oe_runmake install)
+}
\ No newline at end of file
-- 
1.7.9.5



