Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1QJAP8-00041q-Al
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 22:16:38 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 0FC91799012; Sun,  8 May 2011 22:13:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from localhost (dslb-088-070-129-150.pools.arcor-ip.net
	[88.70.129.150]) by gravedo.de (Postfix) with ESMTPSA id 049AA798D6F;
	Sun,  8 May 2011 22:13:51 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 May 2011 22:13:48 +0200
Message-Id: <1304885628-32679-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <4DC6DA66.8090609@gravedo.de>
References: <4DC6DA66.8090609@gravedo.de>
Subject: [PATCH] qt4-native: introduce the native version of qt4 and remove old qt4-tools-native
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
X-List-Received-Date: Sun, 08 May 2011 20:16:38 -0000

The new recipe is based on the qt4-tool-native one but it even installs the libraries of
qt4 and not only the tools like moc/rcc. It will not increase the build time as most
libraries are already build for the qt4-tool-native but not staged.

This commit removes the old qt4-tools-native too. All versions provided by
qt4-tools-native are even supported by qt4-native so it is a drop-in replacement.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/qt4/qt4-native.inc            |   65 +++++++++++++++++++++++++++
 recipes/qt4/qt4-native_4.5.2.bb       |   24 ++++++++++
 recipes/qt4/qt4-native_4.6.3.bb       |   13 +++++
 recipes/qt4/qt4-native_4.7.2.bb       |   19 ++++++++
 recipes/qt4/qt4-tools-native.inc      |   78 ---------------------------------
 recipes/qt4/qt4-tools-native_4.5.2.bb |   24 ----------
 recipes/qt4/qt4-tools-native_4.6.3.bb |   13 -----
 recipes/qt4/qt4-tools-native_4.7.2.bb |   21 ---------
 8 files changed, 121 insertions(+), 136 deletions(-)
 create mode 100644 recipes/qt4/qt4-native.inc
 create mode 100644 recipes/qt4/qt4-native_4.5.2.bb
 create mode 100644 recipes/qt4/qt4-native_4.6.3.bb
 create mode 100644 recipes/qt4/qt4-native_4.7.2.bb
 delete mode 100644 recipes/qt4/qt4-tools-native.inc
 delete mode 100644 recipes/qt4/qt4-tools-native_4.5.2.bb
 delete mode 100644 recipes/qt4/qt4-tools-native_4.6.3.bb
 delete mode 100644 recipes/qt4/qt4-tools-native_4.7.2.bb

diff --git a/recipes/qt4/qt4-native.inc b/recipes/qt4/qt4-native.inc
new file mode 100644
index 0000000..8039ff1
--- /dev/null
+++ b/recipes/qt4/qt4-native.inc
@@ -0,0 +1,65 @@
+DESCRIPTION = "Native version Qt/[X11|Mac|Embedded]"
+DEPENDS = "zlib-native dbus-native"
+SECTION = "libs"
+HOMEPAGE = "http://www.trolltech.com"
+PRIORITY = "optional"
+LICENSE = "GPL"
+PROVIDES = "qt4-tools-native"
+
+INC_PR = "r0"
+
+inherit native
+
+SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+           file://qt-config.patch \
+           file://g++.conf \
+           file://linux.conf"
+S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
+
+EXTRA_OECONF = "-prefix ${prefix} \
+                -L ${STAGING_LIBDIR_NATIVE} \
+                -I ${STAGING_INCDIR_NATIVE} \
+                -qt-libjpeg -qt-gif -system-zlib \
+                -no-libjpeg -no-libpng -no-libmng -no-libtiff \
+                -no-accessibility \
+                -no-cups \
+                -no-nas-sound \
+                -no-nis -no-openssl \
+                -verbose -release \
+                -embedded -no-freetype -no-glib -no-iconv \
+                -exceptions -xmlpatterns \
+                -qt3support"
+
+# yank default -e, otherwise we get the following error:
+# moc_qbuffer.cpp: No such file or directory
+EXTRA_OEMAKE = " "
+
+do_configure() {
+   (echo o; echo yes) | ./configure ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
+}
+
+TOBUILD = "\
+  src/tools/moc \
+  src/corelib \
+  src/xml \
+  src/network \
+  src/tools/uic \
+  src/tools/rcc \
+  src/xmlpatterns \
+  src/testlib \
+  src/qt3support \
+"
+
+do_compile() {
+    for i in ${TOBUILD}; do
+        cd ${S}/$i && oe_runmake CC="${CC}" CXX="${CXX}"
+    done
+}
+
+NATIVE_INSTALL_WORKS = "1"
+
+do_install() {
+    for i in ${TOBUILD}; do
+        cd ${S}/$i && oe_runmake install INSTALL_ROOT=${D}
+    done
+}
diff --git a/recipes/qt4/qt4-native_4.5.2.bb b/recipes/qt4/qt4-native_4.5.2.bb
new file mode 100644
index 0000000..8a94694
--- /dev/null
+++ b/recipes/qt4/qt4-native_4.5.2.bb
@@ -0,0 +1,24 @@
+require qt4-native.inc
+
+# Older releases have different source archive name, than .inc
+SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
+           file://configure-lflags.patch \
+           file://qt-config.patch \
+           file://g++.conf \
+           file://linux.conf"
+
+S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
+
+EXTRA_OECONF += " -fast -qt-freetype"
+
+do_configure() {
+   (echo o; echo yes) | LFLAGS="-L${STAGING_LIBDIR_NATIVE}" ./configure ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
+}
+
+LICENSE = "LGPLv2.1 GPLv3"
+PR = "${INC_PR}.2"
+
+TOBUILD := "src/tools/bootstrap ${TOBUILD}"
+
+SRC_URI[md5sum] = "62186345c609a72b89f16d83bc7a130f"
+SRC_URI[sha256sum] = "272301a27e2f7bcd44c8d09f496e1c749c80b86d9489ea9c30bb265bf2dd02fc"
diff --git a/recipes/qt4/qt4-native_4.6.3.bb b/recipes/qt4/qt4-native_4.6.3.bb
new file mode 100644
index 0000000..b0c9bcb
--- /dev/null
+++ b/recipes/qt4/qt4-native_4.6.3.bb
@@ -0,0 +1,13 @@
+DEFAULT_PREFERENCE = "-1"
+
+require qt4-native.inc
+LICENSE = "LGPLv2.1 GPLv3"
+PR = "${INC_PR}.0"
+
+EXTRA_OECONF += " -no-fast -silent -no-rpath"
+
+TOBUILD := "src/tools/bootstrap ${TOBUILD}"
+
+SRC_URI[md5sum] = "5c69f16d452b0bb3d44bc3c10556c072"
+SRC_URI[sha256sum] = "f4e0ada8d4d516bbb8600a3ee7d9046c9c79e38cd781df9ffc46d8f16acd1768"
+
diff --git a/recipes/qt4/qt4-native_4.7.2.bb b/recipes/qt4/qt4-native_4.7.2.bb
new file mode 100644
index 0000000..7e98035
--- /dev/null
+++ b/recipes/qt4/qt4-native_4.7.2.bb
@@ -0,0 +1,19 @@
+require qt4-native.inc
+LICENSE = "LGPLv2.1 GPLv3"
+
+PR = "${INC_PR}.0"
+
+# Find the g++.conf/linux.conf in the right directory.
+FILESPATHPKG =. "qt-${PV}:"
+SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+           file://qt-config.patch \
+           file://g++.conf \
+           file://linux.conf"
+S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
+
+EXTRA_OECONF += " -no-fast -silent -no-rpath"
+
+TOBUILD := "src/tools/bootstrap ${TOBUILD}"
+
+SRC_URI[md5sum] = "66b992f5c21145df08c99d21847f4fdb"
+SRC_URI[sha256sum] = "d4783b524b90bcd270ccf6e7a30d5fb51696c47eb5de49ebc2d553cd3eb49336"
diff --git a/recipes/qt4/qt4-tools-native.inc b/recipes/qt4/qt4-tools-native.inc
deleted file mode 100644
index 4a0ccce..0000000
--- a/recipes/qt4/qt4-tools-native.inc
+++ /dev/null
@@ -1,78 +0,0 @@
-DESCRIPTION = "Native tools for Qt/[X11|Mac|Embedded] version 4.x"
-DEPENDS = "zlib-native dbus-native"
-SECTION = "libs"
-HOMEPAGE = "http://www.trolltech.com"
-PRIORITY = "optional"
-LICENSE = "GPL"
-
-INC_PR = "r10"
-
-inherit native
-
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
-           file://qt-config.patch \
-           file://g++.conf \
-           file://linux.conf"
-S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
-
-EXTRA_OECONF = "-prefix ${prefix} \
-                -L ${STAGING_LIBDIR_NATIVE} \
-                -I ${STAGING_INCDIR_NATIVE} \
-                -qt-libjpeg -qt-gif -system-zlib \
-                -no-libjpeg -no-libpng -no-libmng -no-libtiff \
-                -no-accessibility \
-                -no-cups \
-                -no-exceptions  \
-                -no-nas-sound \
-                -no-nis -no-openssl \
-                -verbose -release -static \
-                -embedded -no-freetype -no-glib -no-iconv \
-                -qt3support"
-
-# yank default -e, otherwise we get the following error:
-# moc_qbuffer.cpp: No such file or directory
-EXTRA_OEMAKE = " "
-
-do_configure() {
-   (echo o; echo yes) | ./configure ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
-}
-
-TOBUILD = "\
-  src/tools/moc \
-  src/corelib \
-  src/sql \
-  src/dbus \
-  src/qt3support \
-  src/xml \
-  src/tools/uic \
-  src/tools/rcc \
-  src/network \
-  src/gui \
-  src/tools/uic3 \
-  tools/linguist/lrelease \
-  tools/linguist/lupdate \
-  tools/qdbus \
-"
-
-do_compile() {
-    for i in ${TOBUILD}; do
-        cd ${S}/$i && oe_runmake CC="${CC}" CXX="${CXX}"
-    done
-}
-
-NATIVE_INSTALL_WORKS = "1"
-
-do_install() {
-    install -d ${D}${bindir}/
-    install -m 0755 bin/qmake ${D}${bindir}/qmake2
-    for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do
-        install -m 0755 bin/${i} ${D}${bindir}/${i}4
-    done
-    
-    install -d ${D}${datadir}/qt4/
-    cp -PfR mkspecs ${D}${datadir}/qt4/
-    ln -sf linux-g++ ${D}${datadir}/qt4/mkspecs/${BUILD_OS}-oe-g++
-    cp -f ${WORKDIR}/g++.conf ${WORKDIR}/linux.conf ${D}${datadir}/qt4/mkspecs/common/
-
-    install -m 0644 tools/porting/src/q3porting.xml ${D}${datadir}/qt4/
-}
diff --git a/recipes/qt4/qt4-tools-native_4.5.2.bb b/recipes/qt4/qt4-tools-native_4.5.2.bb
deleted file mode 100644
index 206e486..0000000
--- a/recipes/qt4/qt4-tools-native_4.5.2.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-require qt4-tools-native.inc
-
-# Older releases have different source archive name, than .inc
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
-           file://configure-lflags.patch \
-           file://qt-config.patch \
-           file://g++.conf \
-           file://linux.conf"
-
-S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
-
-EXTRA_OECONF += " -fast -qt-freetype"
-
-do_configure() {
-   (echo o; echo yes) | LFLAGS="-L${STAGING_LIBDIR_NATIVE}" ./configure ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
-}
-
-LICENSE = "LGPLv2.1 GPLv3"
-PR = "${INC_PR}.2"
-
-TOBUILD := "src/tools/bootstrap ${TOBUILD}"
-
-SRC_URI[md5sum] = "62186345c609a72b89f16d83bc7a130f"
-SRC_URI[sha256sum] = "272301a27e2f7bcd44c8d09f496e1c749c80b86d9489ea9c30bb265bf2dd02fc"
diff --git a/recipes/qt4/qt4-tools-native_4.6.3.bb b/recipes/qt4/qt4-tools-native_4.6.3.bb
deleted file mode 100644
index a188157..0000000
--- a/recipes/qt4/qt4-tools-native_4.6.3.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-DEFAULT_PREFERENCE = "-1"
-
-require qt4-tools-native.inc
-LICENSE = "LGPLv2.1 GPLv3"
-PR = "${INC_PR}.0"
-
-EXTRA_OECONF += " -no-fast -silent -no-rpath"
-
-TOBUILD := "src/tools/bootstrap ${TOBUILD}"
-
-SRC_URI[md5sum] = "5c69f16d452b0bb3d44bc3c10556c072"
-SRC_URI[sha256sum] = "f4e0ada8d4d516bbb8600a3ee7d9046c9c79e38cd781df9ffc46d8f16acd1768"
-
diff --git a/recipes/qt4/qt4-tools-native_4.7.2.bb b/recipes/qt4/qt4-tools-native_4.7.2.bb
deleted file mode 100644
index 7dbb569..0000000
--- a/recipes/qt4/qt4-tools-native_4.7.2.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DEFAULT_PREFERENCE = "-1"
-
-require qt4-tools-native.inc
-LICENSE = "LGPLv2.1 GPLv3"
-
-PR = "${INC_PR}.0"
-
-# Find the g++.conf/linux.conf in the right directory.
-FILESPATHPKG =. "qt-${PV}:"
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
-           file://qt-config.patch \
-           file://g++.conf \
-           file://linux.conf"
-S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
-
-EXTRA_OECONF += " -no-fast -silent -no-rpath"
-
-TOBUILD := "src/tools/bootstrap ${TOBUILD}"
-
-SRC_URI[md5sum] = "66b992f5c21145df08c99d21847f4fdb"
-SRC_URI[sha256sum] = "d4783b524b90bcd270ccf6e7a30d5fb51696c47eb5de49ebc2d553cd3eb49336"
-- 
1.7.4.1



