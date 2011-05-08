Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1QJ7Jg-0002jV-3n
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 18:58:48 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id EB902799012; Sun,  8 May 2011 18:56:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from localhost (dslb-088-070-129-150.pools.arcor-ip.net
	[88.70.129.150]) by gravedo.de (Postfix) with ESMTPSA id 5F86B798D6F;
	Sun,  8 May 2011 18:56:03 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 May 2011 18:55:59 +0200
Message-Id: <1304873759-20379-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <4DC6CA02.1000009@gravedo.de>
References: <4DC6CA02.1000009@gravedo.de>
Subject: [PATCH] qt4-native: introduce the native version of qt4
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
X-List-Received-Date: Sun, 08 May 2011 16:58:48 -0000

The new recipe is based on the qt4-tool-native one but it even installs the libraries of
qt4 and not only the tools like moc/rcc. It will not increase the build time as most
libraries are already build for the qt4-tool-native but not staged.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/qt4/qt4-native.inc      |   68 +++++++++++++++++++++++++++++++++++++++
 recipes/qt4/qt4-native_4.7.2.bb |   19 +++++++++++
 2 files changed, 87 insertions(+), 0 deletions(-)
 create mode 100644 recipes/qt4/qt4-native.inc
 create mode 100644 recipes/qt4/qt4-native_4.7.2.bb

diff --git a/recipes/qt4/qt4-native.inc b/recipes/qt4/qt4-native.inc
new file mode 100644
index 0000000..ee702e9
--- /dev/null
+++ b/recipes/qt4/qt4-native.inc
@@ -0,0 +1,68 @@
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
+  src/sql \
+  src/xml \
+  src/network \
+  src/tools/uic \
+  src/tools/rcc \
+  src/xmlpatterns \
+  src/dbus \
+  src/gui \
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
-- 
1.7.4.1



