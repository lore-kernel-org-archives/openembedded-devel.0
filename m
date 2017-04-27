Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id BB12F71A82
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 12:30:54 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v3RCUsNV008024
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 14:30:54 +0200
Received: from dev.sbt.siemens.com ([139.16.73.49])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v3RCUspD022092;
	Thu, 27 Apr 2017 14:30:54 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Apr 2017 14:30:41 +0200
Message-Id: <1493296241-22050-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] thrift: refactor recipe
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
X-List-Received-Date: Thu, 27 Apr 2017 12:30:56 -0000

- use release tarball instead of git
- move libevent, python and glib into PACKAGECONFIG
- add NOTICE file to copyright check
- split into multiple packages
  - libthrift for libaries
  - thrift-compiler for compiler
  - thrift pulls in everything as before

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../recipes-connectivity/thrift/thrift_0.9.3.bb    | 47 ++++++++++++++++++----
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
index 905e561..9baeed1 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
@@ -3,18 +3,19 @@ DESCRIPTION =  "A software framework, for scalable cross-language services devel
 HOMEPAGE = "https://thrift.apache.org/"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e4ed21f679b2aafef26eac82ab0c2cbf"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e4ed21f679b2aafef26eac82ab0c2cbf \
+                    file://NOTICE;md5=115f49498b66b494b0472658f2bfe80b"
 
-DEPENDS = "thrift-native boost python libevent flex-native bison-native \
-           glib-2.0 openssl"
+DEPENDS = "thrift-native boost flex-native bison-native openssl"
 
-SRC_URI = "git://git-wip-us.apache.org/repos/asf/thrift.git;protocol=https \
+SRC_URI = "http://mirror.switch.ch/mirror/apache/dist/thrift/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-Forcibly-disable-check-for-Qt5.patch \
            file://0001-THRIFT-3828-In-cmake-avoid-use-of-both-quoted-paths-.patch \
            file://0002-THRIFT-3831-in-test-cpp-explicitly-use-signed-char.patch \
 "
-SRCREV = "61b8a29b0704ccd81b520f2300f5d1bb261fea3e"
-S = "${WORKDIR}/git"
+
+SRC_URI[md5sum] = "88d667a8ae870d5adeca8cb7d6795442"
+SRC_URI[sha256sum] = "b0740a070ac09adde04d43e852ce4c320564a292f26521c46b78e0641564969e"
 
 BBCLASSEXTEND = "native nativesdk"
 
@@ -25,12 +26,44 @@ export STAGING_LIBDIR
 export BUILD_SYS
 export HOST_SYS
 
-EXTRA_OECMAKE = "-DWITH_QT4=OFF -DWITH_QT5=OFF -DBUILD_JAVA=OFF"
+EXTRA_OECMAKE = " \
+    -DBUILD_LIBRARIES=ON \
+    -DBUILD_COMPILER=ON \
+    -DBUILD_TESTING=OFF \
+    -DBUILD_EXAMPLES=OFF \
+    -DBUILD_TUTORIALS=OFF \
+    -DWITH_CPP=ON \
+    -DWITH_JAVA=OFF \
+    -DWITH_STATIC_LIB=ON \
+    -DWITH_SHARED_LIB=ON \
+    -DWITH_OPENSSL=ON \
+    -DWITH_QT4=OFF \
+    -DWITH_QT5=OFF \
+"
+
 EXTRA_OECMAKE_append_class-native = "\
              -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF -DWITH_CPP=OFF"
 EXTRA_OECMAKE_append_class-nativesdk = "\
              -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF -DWITH_PYTHON=OFF"
 
+PACKAGECONFIG ??= "libevent glib python"
+PACKAGECONFIG[libevent] = "-DWITH_LIBEVENT=ON,-DWITH_LIBEVENT=OFF,libevent,"
+PACKAGECONFIG[python] = "-DWITH_PYTHON=ON,-DWITH_PYTHON=OFF,python,"
+PACKAGECONFIG[glib] = "-DWITH_C_GLIB=ON,-DWITH_C_GLIB=OFF,glib-2.0 ,"
+
 do_install_append () {
     ln -sf thrift ${D}/${bindir}/thrift-compiler
 }
+
+LEAD_SONAME = "libthrift.so.${PV}"
+
+# thrift packages
+PACKAGE_BEFORE_PN = "${PN}-compiler lib${BPN}"
+FILES_lib${BPN} = "${libdir}/*.so.*"
+FILES_${PN}-compiler = "${bindir}/*"
+
+# The thrift packages just pulls in some default dependencies but is otherwise empty
+RRECOMMENDS_${PN} = "${PN}-compiler lib${BPN}"
+ALLOW_EMPTY_${PN} = "1"
+RRECOMMENDS_${PN}_class-native = ""
+RRECOMMENDS_${PN}_class-nativesdk = ""
-- 
2.1.4


