Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 74BD6718E1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2015 05:54:10 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id l15so2622586wiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 21:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=hxUMi8YaUVQMZP2wLj7dDM3fZu7KyPCHmR712uKBaDw=;
	b=u41RHZ9O+z7LSBKrP1rG78/tJLgCL/ASUoO80Lj/X31UlRXiHwEXmfTiuM0wk1s3HQ
	x9SaQ7NhKQSaU/e3cHTb9yT4/mvewqAflndcXpIabkYfQ4nbDOerazLPNgyW9rnwXjxz
	+ouXN1xawccSZz/SwoVqqqE9J33N63EcjxjlAXop4C3lQJajzklmxbQCGGDLYJb0UwYT
	LeDUb53Aw5VKvLT1ENJqiPCVW3RhZHneOIJNaBpbBhJ8k7umWBzrfz1HHSiWqg7U1n7N
	CqwjCqja17gbMzTG5AHJQlcEBPQW0y6raRPXRs44vDx6wfnm3OnBmnISsXVPxS3EhEnS
	5uyg==
X-Received: by 10.180.75.199 with SMTP id e7mr33808854wiw.21.1422338050579;
	Mon, 26 Jan 2015 21:54:10 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-254-85.hsi05.unitymediagroup.de. [176.198.254.85])
	by mx.google.com with ESMTPSA id
	gm10sm16610857wib.19.2015.01.26.21.54.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jan 2015 21:54:09 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jan 2015 06:53:52 +0100
Message-Id: <1422338033-18521-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
References: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 4/5] qt5-creator: add 3.3.0 of qt-creator
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
X-List-Received-Date: Tue, 27 Jan 2015 05:54:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* this is the first version which dropped qt4 support
* rename recipe to avoid conflicts with meta-oe's qt-creator
* Desktop file was based on [1]

[1] http://pkgs.fedoraproject.org/cgit/qt-creator.git/tree/qtcreator.desktop

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...t-creator-to-build-on-arm-aarch32-and-aar.patch | 94 ++++++++++++++++++++++
 recipes-qt/qt5/qt5-creator/qtcreator.desktop.in    | 10 +++
 recipes-qt/qt5/qt5-creator_3.3.0.bb                | 87 ++++++++++++++++++++
 3 files changed, 191 insertions(+)
 create mode 100644 recipes-qt/qt5/qt5-creator/0001-Fix-Allow-qt-creator-to-build-on-arm-aarch32-and-aar.patch
 create mode 100644 recipes-qt/qt5/qt5-creator/qtcreator.desktop.in
 create mode 100644 recipes-qt/qt5/qt5-creator_3.3.0.bb

diff --git a/recipes-qt/qt5/qt5-creator/0001-Fix-Allow-qt-creator-to-build-on-arm-aarch32-and-aar.patch b/recipes-qt/qt5/qt5-creator/0001-Fix-Allow-qt-creator-to-build-on-arm-aarch32-and-aar.patch
new file mode 100644
index 0000000..3ed8bc4
--- /dev/null
+++ b/recipes-qt/qt5/qt5-creator/0001-Fix-Allow-qt-creator-to-build-on-arm-aarch32-and-aar.patch
@@ -0,0 +1,94 @@
+From 748174788b318c6316e6d41ce323306120223e02 Mon Sep 17 00:00:00 2001
+From: Greg Nietsky <gregory@distrotech.co.za>
+Date: Tue, 4 Mar 2014 11:33:40 +0200
+Subject: [PATCH 1/2] Fix: Allow qt-creator to build on arm aarch32 and aarch64
+
+Botan is imported hardwired for x86 this small patch allows it
+too operate on arm other platforms could be added.
+
+Task-number: QTCREATORBUG-8107
+Change-Id: Iddea28f21c9fa1afd2fdd5d16a44e6c96a516a7a
+---
+ src/libs/3rdparty/botan/botan.cpp | 16 +++++++++++++++-
+ src/libs/3rdparty/botan/botan.h   |  2 ++
+ 2 files changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/src/libs/3rdparty/botan/botan.cpp b/src/libs/3rdparty/botan/botan.cpp
+index b7a9ddf..c5b9826 100644
+--- a/src/libs/3rdparty/botan/botan.cpp
++++ b/src/libs/3rdparty/botan/botan.cpp
+@@ -1101,6 +1101,8 @@ class Montgomery_Exponentiator : public Modular_Exponentiator
+ 
+ #if (BOTAN_MP_WORD_BITS != 32)
+    #error The mp_x86_32 module requires that BOTAN_MP_WORD_BITS == 32
++#elif !defined(BOTAN_TARGET_CPU_IS_X86_FAMILY)
++typedef Botan::u64bit dword;
+ #endif
+ 
+ #ifdef Q_OS_UNIX
+@@ -1118,6 +1120,7 @@ extern "C" {
+ */
+ inline word word_madd2(word a, word b, word* c)
+    {
++#if defined(BOTAN_TARGET_CPU_IS_X86_FAMILY)
+    asm(
+       ASM("mull %[b]")
+       ASM("addl %[c],%[a]")
+@@ -1127,6 +1130,11 @@ inline word word_madd2(word a, word b, word* c)
+       : "0"(a), "1"(b), [c]"g"(*c) : "cc");
+ 
+    return a;
++#else
++   dword z = (dword)a * b + *c;
++   *c = (word)(z >> BOTAN_MP_WORD_BITS);
++   return (word)z;
++#endif
+    }
+ 
+ /*
+@@ -1134,6 +1142,7 @@ inline word word_madd2(word a, word b, word* c)
+ */
+ inline word word_madd3(word a, word b, word c, word* d)
+    {
++#if defined(BOTAN_TARGET_CPU_IS_X86_FAMILY)
+    asm(
+       ASM("mull %[b]")
+ 
+@@ -1147,6 +1156,11 @@ inline word word_madd3(word a, word b, word c, word* d)
+       : "0"(a), "1"(b), [c]"g"(c), [d]"g"(*d) : "cc");
+ 
+    return a;
++#else
++   dword z = (dword)a * b + c + *d;
++   *d = (word)(z >> BOTAN_MP_WORD_BITS);
++   return (word)z;
++#endif
+    }
+ 
+ }
+@@ -2315,7 +2329,7 @@ namespace Botan {
+ 
+ extern "C" {
+ 
+-#ifdef Q_OS_UNIX
++#if defined(Q_OS_UNIX) && defined(BOTAN_TARGET_CPU_IS_X86_FAMILY)
+ /*
+ * Helper Macros for x86 Assembly
+ */
+diff --git a/src/libs/3rdparty/botan/botan.h b/src/libs/3rdparty/botan/botan.h
+index 2981d2c..1c8d828 100644
+--- a/src/libs/3rdparty/botan/botan.h
++++ b/src/libs/3rdparty/botan/botan.h
+@@ -82,7 +82,9 @@
+ #endif
+ 
+ #define BOTAN_TARGET_CPU_IS_LITTLE_ENDIAN
++#if !defined(__arm__) && !defined(__aarch64__)
+ #define BOTAN_TARGET_CPU_IS_X86_FAMILY
++#endif
+ #define BOTAN_TARGET_UNALIGNED_MEMORY_ACCESS_OK 1
+ 
+ #if defined(BOTAN_TARGET_CPU_IS_LITTLE_ENDIAN) || \
+-- 
+1.8.3.1
+
diff --git a/recipes-qt/qt5/qt5-creator/qtcreator.desktop.in b/recipes-qt/qt5/qt5-creator/qtcreator.desktop.in
new file mode 100644
index 0000000..64f7c6b
--- /dev/null
+++ b/recipes-qt/qt5/qt5-creator/qtcreator.desktop.in
@@ -0,0 +1,10 @@
+[Desktop Entry]
+Type=Application
+Exec=sh -c "PATH=$PATH:@QT5_QMAKE@ qtcreator %F"
+Name=Qt Creator
+GenericName=C++ IDE for developing Qt applications
+X-KDE-StartupNotify=true
+Icon=QtProject-qtcreator
+Terminal=false
+Categories=Development;IDE;Qt;
+MimeType=text/x-c++src;text/x-c++hdr;text/x-xsrc;application/x-designer;application/vnd.nokia.qt.qmakeprofile;application/vnd.nokia.xml.qt.resource;
diff --git a/recipes-qt/qt5/qt5-creator_3.3.0.bb b/recipes-qt/qt5/qt5-creator_3.3.0.bb
new file mode 100644
index 0000000..76f9982
--- /dev/null
+++ b/recipes-qt/qt5/qt5-creator_3.3.0.bb
@@ -0,0 +1,87 @@
+SUMMARY = "Qt Creator is a new cross-platform Qt IDE"
+
+# Note:
+# The toolchain auto detection does not work completely yet. To compile/debug
+# open menu 'Tools/Options and select 'Build & Run'. In tab 'Kits' select 'Desktop'
+# 'Compiler/Manage...' and add local gcc'. At 'Debugger' select
+# 'System GDB at /usr/bin/gdb.
+
+HOMEPAGE = "https://qt-project.org/"
+LICENSE = "LGPLv2.1 | GPLv3"
+LIC_FILES_CHKSUM = " \
+    file://LGPL_EXCEPTION.TXT;md5=eb6c371255e1262c55ae9b652a90b528 \
+    file://LICENSE.LGPLv21;md5=243b725d71bb5df4a1e5920b344b86ad \
+    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+"
+
+inherit qmake5
+
+DEPENDS = "qtbase qtscript qtwebkit qtxmlpatterns qtx11extras qtdeclarative qttools qttools-native qtsvg"
+
+SRC_URI = " \
+    http://download.qt.io/official_releases/qtcreator/3.3/${PV}/qt-creator-opensource-src-${PV}.tar.gz \
+    file://0001-Fix-Allow-qt-creator-to-build-on-arm-aarch32-and-aar.patch \
+    file://qtcreator.desktop.in \
+"
+SRC_URI[md5sum] = "5e33988908282c779f2e6e4dca2bba3e"
+SRC_URI[sha256sum] = "27a5c8815fab95f959134047f8315686de4de6f99b0bedfd46b5dedae390525a"
+
+S = "${WORKDIR}/qt-creator-opensource-src-${PV}"
+
+EXTRA_QMAKEVARS_PRE += "IDE_LIBRARY_BASENAME=${baselib}/${QT_DIR_NAME}"
+
+do_configure_prepend() {
+    # causes gcc infinite loop with 4.9.x for arm targets similar to
+    # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61033
+    export DO_NOT_BUILD_QMLDESIGNER=1
+}
+
+do_configure_append() {
+    # Find native tools
+    sed -i 's:${STAGING_BINDIR}.*/lrelease:${STAGING_BINDIR_NATIVE}/${QT_DIR_NAME}/lrelease:g' ${B}/share/qtcreator/translations/Makefile
+    sed -i 's:${STAGING_BINDIR}.*/qdoc:${STAGING_BINDIR_NATIVE}/${QT_DIR_NAME}/qdoc:g' ${B}/Makefile
+
+    # see qtbase-native.inc
+    # sed -i 's:QT_INSTALL_DOCS=${docdir}:QT_INSTALL_DOCS=${STAGING_DATADIR_NATIVE}/${QT_DIR_NAME}/doc:g' ${B}/Makefile
+}
+
+do_compile_append() {
+    # build docs
+    #oe_runmake docs_online
+}
+
+do_install() {
+    oe_runmake install INSTALL_ROOT=${D}${prefix}
+    oe_runmake install_inst_qch_docs INSTALL_ROOT=${D}${prefix}
+    # install desktop and ensure that qt-creator finds qmake
+    install -d ${D}${datadir}/applications
+    install -m 0644 ${WORKDIR}/qtcreator.desktop.in ${D}${datadir}/applications/qtcreator.desktop
+    sed -i 's:@QT5_QMAKE@:${bindir}/${QT_DIR_NAME}:g' ${D}${datadir}/applications/qtcreator.desktop
+}
+
+FILES_${PN} += " \
+    ${datadir}/qtcreator \
+    ${datadir}/icons \
+    ${libdir}/${QT_DIR_NAME}/qtcreator \
+"
+FILES_${PN}-dbg += " \
+    ${libdir}/${QT_DIR_NAME}/qtcreator/.debug \
+    ${libdir}/${QT_DIR_NAME}/qtcreator/plugins/.debug \
+    ${libdir}/${QT_DIR_NAME}/qtcreator/plugins/qbs/plugins/.debug \
+"
+
+FILES_${PN}-dev += " \
+    ${libdir}/${QT_DIR_NAME}/qtcreator/*${SOLIBSDEV} \
+"
+
+RDEPENDS_${PN} += "perl"
+RCONFLICTS_${PN} = "qt-creator"
+
+# To give best user experience out of the box..
+RRECOMMENDS_${PN} += " \
+    packagegroup-qt5-toolchain-target \
+    binutils \
+    ccache \
+    gcc-symlinks \
+    gdb \
+"
-- 
1.8.3.1


