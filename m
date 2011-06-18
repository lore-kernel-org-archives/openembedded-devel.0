Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QY0m7-0006tJ-KC
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Jun 2011 21:01:43 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jun 2011 11:58:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,386,1304319600"; d="scan'208";a="17843556"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.16.245])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2011 11:58:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jun 2011 19:57:54 +0100
Message-Id: <c11e790625a51b8a32a13b9de6bcb22cd0a767f6.1308417391.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1308417391.git.paul.eggleton@linux.intel.com>
References: <cover.1308417391.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1308417391.git.paul.eggleton@linux.intel.com>
References: <cover.1308417391.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe] [PATCH 3/3] qt4: remove qt4-tools-sdk
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
X-List-Received-Date: Sat, 18 Jun 2011 19:01:43 -0000

qt4-tools-sdk has been replaced by qt4-tools-nativesdk in oe-core.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-qt/qt4/qt4-tools-sdk.inc      |   88 -------------------------
 meta-oe/recipes-qt/qt4/qt4-tools-sdk_4.7.2.bb |    8 --
 2 files changed, 0 insertions(+), 96 deletions(-)
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-tools-sdk.inc
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-tools-sdk_4.7.2.bb

diff --git a/meta-oe/recipes-qt/qt4/qt4-tools-sdk.inc b/meta-oe/recipes-qt/qt4/qt4-tools-sdk.inc
deleted file mode 100644
index 1bcfed0..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-tools-sdk.inc
+++ /dev/null
@@ -1,88 +0,0 @@
-DESCRIPTION = "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
-DEPENDS = "zlib-native dbus-native"
-SECTION = "libs"
-HOMEPAGE = "http://www.trolltech.com"
-PRIORITY = "optional"
-LICENSE = "LGPLv2.1 GPLv3"
-
-INC_PR = "r2"
-
-FILESPATHPKG =. "qt-${PV}:"
-inherit nativesdk
-
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
-           file://configure-lflags.patch \
-           file://compile.test-lflags.patch \
-           file://qt-config.patch \
-           file://g++.conf \
-           file://linux.conf"
-
-S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
-
-
-# FIXME: make it work with "${STAGING_BINDIR_NATIVE}/pkg-config --cflags dbus-1"
-EXTRA_OECONF = "-prefix ${prefix} \
-                -qt-libjpeg -qt-gif -system-zlib \
-                -no-libjpeg -no-libpng -no-libmng -no-libtiff \
-                -no-accessibility \
-                -no-cups \
-                -no-exceptions  \
-                -no-nas-sound \
-                -no-nis -no-openssl \
-                -verbose -release -fast -static \
-                -embedded -no-freetype -no-glib -no-iconv \
-                -qt3support \
-                -I${STAGING_DIR_NATIVE}/usr/include \
-                -I${STAGING_DIR_NATIVE}/usr/include/dbus-1.0 \
-                -I${STAGING_DIR_NATIVE}/usr/lib/dbus-1.0/include"
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
-  src/tools/bootstrap \
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
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 bin/qmake ${D}${bindir}/qmake2
-    for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do
-        install -m 0755 bin/${i} ${D}${bindir}/${i}4
-    done
-
-	(cd ${D}${bindir}; \
-	ln -s qmake2 qmake; \
-	for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do \
-		ln -s ${i}4 ${i}; \
-	done)
-
-	# make a symbolic link to mkspecs for compatibility with Nokia's SDK
-	# and QTCreator
-	(cd ${D}${bindir}/..; ln -s ${TARGET_SYS}/usr/share/qtopia/mkspecs mkspecs;)
-}
-
diff --git a/meta-oe/recipes-qt/qt4/qt4-tools-sdk_4.7.2.bb b/meta-oe/recipes-qt/qt4/qt4-tools-sdk_4.7.2.bb
deleted file mode 100644
index c86ac2a..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-tools-sdk_4.7.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require qt4-tools-sdk.inc
-
-PR = "${INC_PR}.0"
-
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI[md5sum] = "66b992f5c21145df08c99d21847f4fdb"
-SRC_URI[sha256sum] = "d4783b524b90bcd270ccf6e7a30d5fb51696c47eb5de49ebc2d553cd3eb49336"
-- 
1.7.4.1



