Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QY0m8-0006tJ-BI
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Jun 2011 21:01:44 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jun 2011 11:58:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,386,1304319600"; d="scan'208";a="17843555"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.16.245])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2011 11:58:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jun 2011 19:57:53 +0100
Message-Id: <6b59e5c689dd1963371df90cc749d2f7c5b969da.1308417391.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1308417391.git.paul.eggleton@linux.intel.com>
References: <cover.1308417391.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1308417391.git.paul.eggleton@linux.intel.com>
References: <cover.1308417391.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe] [PATCH 2/3] qmake2: remove qmake2 recipe
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
X-List-Received-Date: Sat, 18 Jun 2011 19:01:44 -0000

This is a leftover from oe-dev and is not needed by anything in meta-oe -
qmake is being build as part of qt4-tools-native.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-qt/qt4/qmake2-sdk/linux-oe-qmake.conf  |    1 -
 meta-oe/recipes-qt/qt4/qmake2.inc                  |   69 --------------------
 meta-oe/recipes-qt/qt4/qmake2/linux-oe-qmake.conf  |    1 -
 meta-oe/recipes-qt/qt4/qmake2_2.10a.bb             |   60 -----------------
 4 files changed, 0 insertions(+), 131 deletions(-)
 delete mode 100644 meta-oe/recipes-qt/qt4/qmake2-sdk/linux-oe-qmake.conf
 delete mode 100644 meta-oe/recipes-qt/qt4/qmake2.inc
 delete mode 100644 meta-oe/recipes-qt/qt4/qmake2/linux-oe-qmake.conf
 delete mode 100644 meta-oe/recipes-qt/qt4/qmake2_2.10a.bb

diff --git a/meta-oe/recipes-qt/qt4/qmake2-sdk/linux-oe-qmake.conf b/meta-oe/recipes-qt/qt4/qmake2-sdk/linux-oe-qmake.conf
deleted file mode 100644
index f58481a..0000000
--- a/meta-oe/recipes-qt/qt4/qmake2-sdk/linux-oe-qmake.conf
+++ /dev/null
@@ -1 +0,0 @@
-include(../linux-g++/qmake.conf)
diff --git a/meta-oe/recipes-qt/qt4/qmake2.inc b/meta-oe/recipes-qt/qt4/qmake2.inc
deleted file mode 100644
index f2631b5..0000000
--- a/meta-oe/recipes-qt/qt4/qmake2.inc
+++ /dev/null
@@ -1,69 +0,0 @@
-DESCRIPTION = "TrollTech Makefile Generator"
-PRIORITY = "optional"
-HOMEPAGE = "http://www.trolltech.com"
-SECTION = "devel"
-LICENSE = "GPL"
-PR = "r12"
-
-# We call 'moc' during the build 
-DEPENDS = "qt4-tools-native"
-
-QTVER = "qt-embedded-linux-opensource-src-${QTVERSION}"
-
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/${QTVER}.tar.bz2 \
-           file://0001-fix-mkspecs.patch \
-           file://qt-config.patch \
-           file://use-lflags-last.patch \
-           file://linux-oe-qmake.conf"
-S = "${WORKDIR}/${QTVER}"
-
-inherit autotools  
-
-CROSSHACK = "true"
-CROSSHACK_virtclass-native = ""
-CROSSHACK_virtclass-nativesdk = ""
-
-export CROSSHACK
-export QTDIR = "${S}"
-EXTRA_OEMAKE = "-e"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-do_configure() {
-
-    # Make sure we regenerate all Makefiles 
-    find ${S} -name "Makefile" | xargs rm
-    # Install the OE build templates
-    for template in linux-oe-g++ linux-uclibc-oe-g++ linux-gnueabi-oe-g++ linux-uclibceabi-oe-g++
-    do
-        install -d ${S}/mkspecs/$template
-        install -m 0644 ${WORKDIR}/linux-oe-qmake.conf ${S}/mkspecs/$template/qmake.conf
-        ln -sf ../linux-g++/qplatformdefs.h ${S}/mkspecs/$template/qplatformdefs.h
-    done
-
-    QMAKESPEC=
-    PLATFORM=${HOST_OS}-oe-g++
-    export PLATFORM
-    export OE_QMAKE_CC="${CC}"
-    export OE_QMAKE_CFLAGS="${CFLAGS}"
-    export OE_QMAKE_CXX="${CXX}"
-    export OE_QMAKE_CXXFLAGS="-fno-exceptions -fno-rtti ${CXXFLAGS}"
-    export OE_QMAKE_LDFLAGS="${LDFLAGS}"
-    export OE_QMAKE_LINK="${CCLD}"
-    export OE_QMAKE_AR="${AR}"
-    export OE_QMAKE_STRIP="${STRIP}"
-    export OE_QMAKE_UIC="${STAGING_BINDIR_NATIVE}/uic4"
-    export OE_QMAKE_MOC="${STAGING_BINDIR_NATIVE}/moc4"
-    export QMAKE_MOC="${STAGING_BINDIR_NATIVE}/moc4"
-    export OE_QMAKE_RCC="${STAGING_BINDIR_NATIVE}/rcc4"
-    export QMAKE_RCC="${STAGING_BINDIR_NATIVE}/rcc4"
-    export OE_QMAKE_QMAKE="${STAGING_BINDIR_NATIVE}/qmake"
-    export OE_QMAKE_RPATH="-Wl,-rpath-link,"
-    echo yes | ./configure -prefix ${STAGING_DIR_NATIVE}/qt4 ${EXTRA_OECONF} || die "Configuring qt failed"
-}
-
-do_compile() {
-    :
-}
-
-FILES_${PN} += "${datadir}/qt4/"
diff --git a/meta-oe/recipes-qt/qt4/qmake2/linux-oe-qmake.conf b/meta-oe/recipes-qt/qt4/qmake2/linux-oe-qmake.conf
deleted file mode 100644
index f58481a..0000000
--- a/meta-oe/recipes-qt/qt4/qmake2/linux-oe-qmake.conf
+++ /dev/null
@@ -1 +0,0 @@
-include(../linux-g++/qmake.conf)
diff --git a/meta-oe/recipes-qt/qt4/qmake2_2.10a.bb b/meta-oe/recipes-qt/qt4/qmake2_2.10a.bb
deleted file mode 100644
index 3602a7f..0000000
--- a/meta-oe/recipes-qt/qt4/qmake2_2.10a.bb
+++ /dev/null
@@ -1,60 +0,0 @@
-QTVERSION="4.4.3"
-FILESDIR += "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/qmake2"
-
-BBCLASSEXTEND = "native nativesdk"
-
-require ${PN}.inc
-
-SRC_URI += "file://qmake-hack.diff"
-
-do_install() {
-    install -d ${D}/${bindir}
-    install -m 0755 bin/qmake ${D}/${bindir}/qmake2
-    install -m 0755 bin/qmake ${D}/${bindir}/qmake-qt4
-    install -d ${D}/${datadir}/qt4
-    install -d ${D}/${datadir}/qtopia
-
-    script="${D}/${datadir}/qtopia/environment-setup"
-    touch $script
-    echo 'export QT_DIR_NAME=qtopia' >> $script
-    echo 'export QT_LIBINFIX=E' >> $script
-    echo 'export OE_QMAKE_AR=ar' >> $script
-    echo 'export OE_QMAKE_CC=gcc' >> $script
-    echo 'export OE_QMAKE_CXX=g++' >> $script
-    echo 'export OE_QMAKE_LINK=g++' >> $script
-    echo 'export OE_QMAKE_LIBDIR_QT=${libdir}' >> $script
-    echo 'export OE_QMAKE_INCDIR_QT=${includedir}/qtopia' >> $script
-    echo 'export OE_QMAKE_MOC=${bindir}/moc' >> $script
-    echo 'export OE_QMAKE_UIC=${bindir}/uic' >> $script
-    echo 'export OE_QMAKE_UIC3=${bindir}/uic3' >> $script
-    echo 'export OE_QMAKE_RCC=${bindir}/rcc' >> $script
-    echo 'export OE_QMAKE_QDBUSCPP2XML=${bindir}/qdbuscpp2xml' >> $script
-    echo 'export OE_QMAKE_QDBUSXML2CPP=${bindir}/qdbusxml2cpp' >> $script
-    echo 'export OE_QMAKE_QT_CONFIG=${datadir}/qtopia/mkspecs/qconfig.pri' >> $script
-    echo 'export QMAKESPEC=${datadir}/qtopia/mkspecs/linux-g++' >> $script
-
-    script="${D}/${datadir}/qt4/environment-setup"
-    touch $script
-    echo 'export OE_QMAKE_AR=ar' >> $script
-    echo 'export OE_QMAKE_CC=gcc' >> $script
-    echo 'export OE_QMAKE_CXX=g++' >> $script
-    echo 'export OE_QMAKE_LINK=g++' >> $script
-    echo 'export OE_QMAKE_LIBDIR_QT=${libdir}' >> $script
-    echo 'export OE_QMAKE_INCDIR_QT=${includedir}/qt4' >> $script
-    echo 'export OE_QMAKE_MOC=${bindir}/moc' >> $script
-    echo 'export OE_QMAKE_UIC=${bindir}/uic' >> $script
-    echo 'export OE_QMAKE_UIC3=${bindir}/uic3' >> $script
-    echo 'export OE_QMAKE_RCC=${bindir}/rcc' >> $script
-    echo 'export OE_QMAKE_QDBUSCPP2XML=${bindir}/qdbuscpp2xml' >> $script
-    echo 'export OE_QMAKE_QDBUSXML2CPP=${bindir}/qdbusxml2cpp' >> $script
-    echo 'export OE_QMAKE_QT_CONFIG=${datadir}/qt4/mkspecs/qconfig.pri' >> $script
-    echo 'export QMAKESPEC=${datadir}/qt4/mkspecs/linux-g++' >> $script
-
-    chmod 0755 ${D}${datadir}/qt*/environment-setup
-}
-
-FILES_${PN} += "${datadir}/qt*/environment-setup"
-
-
-SRC_URI[md5sum] = "9a639aec44a1e4c70040117183d247a3"
-SRC_URI[sha256sum] = "05d06b93f95092f1318634fca24f0c2d0a1252c9f1dc2fbb427b07e8ecbb4f39"
-- 
1.7.4.1



