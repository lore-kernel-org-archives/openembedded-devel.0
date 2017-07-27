Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 907C37826F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jul 2017 08:44:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6R8iVeh006595
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Jul 2017 01:44:31 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Jul 2017 01:44:31 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Jul 2017 04:44:22 -0400
Message-ID: <1f43da43b734691a93b8824a4d8daf526a6d8251.1501142861.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1501142861.git.hongxu.jia@windriver.com>
References: <cover.1501142861.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/6] tigervnc: add recipe 1.8.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Jul 2017 08:44:34 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../files/0001-tigervnc-remove-includedir.patch    |  50 ++++++++
 .../0002-do-not-build-tests-sub-directory.patch    |  29 +++++
 ...missing-dynamic-library-to-FLTK_LIBRARIES.patch |  28 +++++
 ...tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch |  62 ++++++++++
 .../recipes-graphics/tigervnc/tigervnc_1.8.0.bb    | 131 +++++++++++++++++++++
 5 files changed, 300 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0001-tigervnc-remove-includedir.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/tigervnc_1.8.0.bb

diff --git a/meta-oe/recipes-graphics/tigervnc/files/0001-tigervnc-remove-includedir.patch b/meta-oe/recipes-graphics/tigervnc/files/0001-tigervnc-remove-includedir.patch
new file mode 100644
index 0000000..12c4376
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/0001-tigervnc-remove-includedir.patch
@@ -0,0 +1,50 @@
+From 4b423cd2e5e4296abca3be553bf64d8cc287180a Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 20 Jul 2017 17:09:05 +0800
+Subject: [PATCH 1/4] tigervnc: remove includedir
+
+Upstream-Status: Pending
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+
+It fixes host contamination
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ unix/xserver/hw/vnc/Makefile.am | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/unix/xserver/hw/vnc/Makefile.am b/unix/xserver/hw/vnc/Makefile.am
+index 0d6a4ac..854f078 100644
+--- a/unix/xserver/hw/vnc/Makefile.am
++++ b/unix/xserver/hw/vnc/Makefile.am
+@@ -22,7 +22,7 @@ libvnccommon_la_SOURCES = $(HDRS) \
+ 
+ libvnccommon_la_CPPFLAGS = -DVENDOR_RELEASE="$(VENDOR_RELEASE)" \
+ 	-DVENDOR_STRING="\"$(VENDOR_STRING)\"" -I$(TIGERVNC_SRCDIR)/common -UHAVE_CONFIG_H \
+-	-I$(TIGERVNC_SRCDIR)/unix/vncconfig $(XVNC_CPPFLAGS) ${XSERVERLIBS_CFLAGS} -I$(includedir) \
++	-I$(TIGERVNC_SRCDIR)/unix/vncconfig $(XVNC_CPPFLAGS) ${XSERVERLIBS_CFLAGS} \
+ 	-I$(top_srcdir)/include
+ 
+ bin_PROGRAMS = Xvnc
+@@ -42,7 +42,7 @@ Xvnc_CPPFLAGS = $(XVNC_CPPFLAGS) -DTIGERVNC -DNO_MODULE_EXTS \
+ 	-UHAVE_CONFIG_H \
+ 	-DXFree86Server -DVENDOR_RELEASE="$(VENDOR_RELEASE)" \
+ 	-DVENDOR_STRING="\"$(VENDOR_STRING)\"" -I$(TIGERVNC_SRCDIR)/common \
+-	-I$(top_srcdir)/include ${XSERVERLIBS_CFLAGS} -I$(includedir)
++	-I$(top_srcdir)/include ${XSERVERLIBS_CFLAGS}
+ 
+ Xvnc_LDADD = $(XVNC_LIBS) libvnccommon.la $(COMMON_LIBS) \
+ 	$(XSERVER_LIBS) $(XSERVER_SYS_LIBS) $(XVNC_SYS_LIBS) -lX11
+@@ -62,7 +62,7 @@ libvnc_la_CPPFLAGS = $(XVNC_CPPFLAGS) -I$(TIGERVNC_SRCDIR)/common -UHAVE_CONFIG_
+ 	-I$(top_srcdir)/hw/xfree86/os-support \
+ 	-I$(top_srcdir)/hw/xfree86/os-support/bus \
+ 	-I$(top_srcdir)/include \
+-	${XSERVERLIBS_CFLAGS} -I$(includedir)
++	${XSERVERLIBS_CFLAGS}
+ 
+ libvnc_la_LDFLAGS = -module -avoid-version -Wl,-z,now
+ 
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch b/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
new file mode 100644
index 0000000..4e875ba
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/0002-do-not-build-tests-sub-directory.patch
@@ -0,0 +1,29 @@
+From c3460d63f0b6cd50b9a64265f420f0439e12a1d5 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 25 Apr 2017 01:36:44 -0400
+Subject: [PATCH 2/4] do not build tests sub directory
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ CMakeLists.txt | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 94ec2ef..fb72a00 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -300,9 +300,6 @@ if(BUILD_VIEWER)
+   add_subdirectory(media)
+ endif()
+ 
+-add_subdirectory(tests)
+-
+-
+ include(cmake/BuildPackages.cmake)
+ 
+ # uninstall
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-graphics/tigervnc/files/0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch b/meta-oe/recipes-graphics/tigervnc/files/0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch
new file mode 100644
index 0000000..cfb84ac
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch
@@ -0,0 +1,28 @@
+From 6369a5be2af2ed1fa443f40f48deaf318d22713e Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 20 Jul 2017 05:06:00 -0400
+Subject: [PATCH 3/4] add missing dynamic library to FLTK_LIBRARIES
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ CMakeLists.txt | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index fb72a00..5732dc8 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -246,6 +246,8 @@ if(UNIX AND NOT APPLE)
+   endif()
+ endif()
+ 
++set(FLTK_LIBRARIES ${FLTK_LIBRARIES} -lm -ldl -lpng -ljpeg)
++
+ # Check for GNUTLS library
+ option(ENABLE_GNUTLS "Enable protocol encryption and advanced authentication" ON)
+ if(ENABLE_GNUTLS)
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch b/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
new file mode 100644
index 0000000..97b0a38
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch
@@ -0,0 +1,62 @@
+From 9563b69640227da2220ee0c39077afb736cc96d1 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 20 Jul 2017 17:12:17 +0800
+Subject: [PATCH 4/4] tigervnc: add fPIC option to COMPILE_FLAGS
+
+The static libraries in Xregion/network/rdr/rfb were linked by shared
+library libvnc.so, so we should add fPIC option to COMPILE_FLAGS to fix
+relocation issue.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ common/Xregion/CMakeLists.txt | 1 +
+ common/network/CMakeLists.txt | 1 +
+ common/rdr/CMakeLists.txt     | 1 +
+ common/rfb/CMakeLists.txt     | 1 +
+ 4 files changed, 4 insertions(+)
+
+diff --git a/common/Xregion/CMakeLists.txt b/common/Xregion/CMakeLists.txt
+index 40ca97e..9411328 100644
+--- a/common/Xregion/CMakeLists.txt
++++ b/common/Xregion/CMakeLists.txt
+@@ -3,4 +3,5 @@ add_library(Xregion STATIC
+ 
+ if(UNIX)
+   libtool_create_control_file(Xregion)
++  set_target_properties(Xregion PROPERTIES COMPILE_FLAGS -fPIC)
+ endif()
+diff --git a/common/network/CMakeLists.txt b/common/network/CMakeLists.txt
+index b624c8e..6c06ec9 100644
+--- a/common/network/CMakeLists.txt
++++ b/common/network/CMakeLists.txt
+@@ -9,4 +9,5 @@ endif()
+ 
+ if(UNIX)
+   libtool_create_control_file(network)
++  set_target_properties(network PROPERTIES COMPILE_FLAGS -fPIC)
+ endif()
+diff --git a/common/rdr/CMakeLists.txt b/common/rdr/CMakeLists.txt
+index 989ba2f..20f6489 100644
+--- a/common/rdr/CMakeLists.txt
++++ b/common/rdr/CMakeLists.txt
+@@ -27,4 +27,5 @@ target_link_libraries(rdr ${RDR_LIBRARIES})
+ 
+ if(UNIX)
+   libtool_create_control_file(rdr)
++  set_target_properties(rdr PROPERTIES COMPILE_FLAGS -fPIC)
+ endif()
+diff --git a/common/rfb/CMakeLists.txt b/common/rfb/CMakeLists.txt
+index 5047e5e..88838ab 100644
+--- a/common/rfb/CMakeLists.txt
++++ b/common/rfb/CMakeLists.txt
+@@ -98,4 +98,5 @@ target_link_libraries(rfb ${RFB_LIBRARIES})
+ 
+ if(UNIX)
+   libtool_create_control_file(rfb)
++  set_target_properties(rfb PROPERTIES COMPILE_FLAGS -fPIC)
+ endif()
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.8.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.8.0.bb
new file mode 100644
index 0000000..d15bc9e
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.8.0.bb
@@ -0,0 +1,131 @@
+DESCRIPTION = "TigerVNC remote display system"
+HOMEPAGE = "http://www.tigervnc.com/"
+LICENSE = "GPLv2+"
+SECTION = "x11/utils"
+DEPENDS = "xserver-xorg gnutls jpeg libxtst gettext-native fltk"
+RDEPENDS_${PN} = "chkconfig coreutils hicolor-icon-theme"
+
+LIC_FILES_CHKSUM = "file://LICENCE.TXT;md5=75b02c2872421380bbd47781d2bd75d3"
+
+S = "${WORKDIR}/git"
+
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "x11"
+
+inherit autotools cmake
+B = "${S}"
+
+SRCREV = "4d6e1b8306a8cca8ad5e15ff8201f6ea24459cfd"
+
+SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.8-branch \
+           file://0001-tigervnc-remove-includedir.patch \
+           file://0002-do-not-build-tests-sub-directory.patch \
+           file://0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch \
+           file://0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch \
+"
+
+# Keep sync with xorg-server in oe-core
+XORG_PN ?= "xorg-server"
+XORG_PV ?= "1.19.3"
+SRC_URI += "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${XORG_PV}.tar.bz2;name=xorg"
+XORG_S = "${WORKDIR}/${XORG_PN}-${XORG_PV}"
+SRC_URI[xorg.md5sum] = "015d2fc4b9f2bfe7a626edb63a62c65e"
+SRC_URI[xorg.sha256sum] = "677a8166e03474719238dfe396ce673c4234735464d6dadf2959b600d20e5a98"
+
+# It is the directory containing the Xorg source for the
+# machine on which you are building TigerVNC.
+XSERVER_SOURCE_DIR="${S}/unix/xserver"
+
+do_patch[postfuncs] += "do_patch_xserver"
+do_patch_xserver () {
+    for subdir in Xext xkb GL hw/xquartz/bundle hw/xfree86/common; do
+        install -d ${XSERVER_SOURCE_DIR}/$subdir
+    done
+
+    for subdir in hw/dmx/doc man doc hw/dmx/doxygen; do
+        install -d ${XSERVER_SOURCE_DIR}/$subdir
+    done
+
+    sources="hw/xquartz/bundle/cpprules.in man/Xserver.man doc/smartsched \
+             hw/dmx/doxygen/doxygen.conf.in xserver.ent.in xkb/README.compiled \
+             hw/xfree86/xorgconf.cpp hw/xfree86/Xorg.sh.in"
+    for i in ${sources}; do
+        install -m 0644 ${XORG_S}/$i ${XSERVER_SOURCE_DIR}/$i;
+    done
+
+    cd ${XORG_S}
+    find . -type f | egrep '.*\.(c|h|am|ac|inc|m4|h.in|pc.in|man.pre|pl|txt)$' | \
+    xargs tar cf - | (cd ${XSERVER_SOURCE_DIR} && tar xf -)
+
+    cd ${XSERVER_SOURCE_DIR}
+    xserverpatch="${S}/unix/xserver119.patch"
+    echo "Apply $xserverpatch"
+    patch -p1 -b --suffix .vnc < $xserverpatch
+}
+
+EXTRA_OECONF = "--disable-xorg --disable-xnest --disable-xvfb --disable-dmx \
+        --disable-xwin --disable-xephyr --disable-kdrive --with-pic \
+        --disable-static --disable-xinerama \
+        --with-xkb-output=${localstatedir}/lib/xkb \
+        --disable-glx --disable-dri --disable-dri2 \
+        --disable-config-hal \
+        --disable-config-udev \
+        --without-dtrace \
+        --disable-unit-tests \
+        --disable-devel-docs \
+        --disable-selective-werror \
+        --disable-xshmfence \
+        --disable-config-udev \
+        --disable-dri3 \
+        --disable-libunwind \
+        --without-xmlto \
+        --enable-systemd-logind=no \
+        --disable-xinerama \
+        --disable-xwayland \
+"
+
+do_configure_append () {
+    olddir=`pwd`
+    cd ${XSERVER_SOURCE_DIR}
+
+    rm -rf aclocal-copy/
+    rm -f aclocal.m4
+
+    export ACLOCALDIR="${XSERVER_SOURCE_DIR}/aclocal-copy"
+    mkdir -p ${ACLOCALDIR}/
+    if [ -d ${STAGING_DATADIR_NATIVE}/aclocal ]; then
+        cp-noerror ${STAGING_DATADIR_NATIVE}/aclocal/ ${ACLOCALDIR}/
+    fi
+    if [ -d ${STAGING_DATADIR}/aclocal -a "${STAGING_DATADIR_NATIVE}/aclocal" != "${STAGING_DATADIR}/aclocal" ]; then
+        cp-noerror ${STAGING_DATADIR}/aclocal/ ${ACLOCALDIR}/
+    fi
+    ACLOCAL="aclocal --system-acdir=${ACLOCALDIR}/" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || bbfatal "autoreconf execution failed."
+    chmod +x ./configure
+    ${CACHED_CONFIGUREVARS} ./configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
+    cd $olddir
+}
+
+do_compile_append () {
+    olddir=`pwd`
+    cd ${XSERVER_SOURCE_DIR}
+
+    oe_runmake
+
+    cd $olddir
+}
+
+do_install_append() {
+    olddir=`pwd`
+    cd ${XSERVER_SOURCE_DIR}/hw/vnc
+
+    oe_runmake 'DESTDIR=${D}' install
+
+    cd $olddir
+}
+
+FILES_${PN} += " \
+    ${libdir}/xorg/modules/extensions \
+    ${datadir}/icons \
+"
+
+FILES_${PN}-dbg += "${libdir}/xorg/modules/extensions/.debug"
-- 
2.8.1


