Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 934 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 06 Jan 2016 13:31:03 UTC
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 5F38D731D3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jan 2016 13:31:03 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id u06DFQoR028266
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Jan 2016 14:15:26 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.77.211])
	by mail3.siemens.de (8.15.1/8.15.1) with ESMTP id u06DFQfi028269;
	Wed, 6 Jan 2016 14:15:26 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Jan 2016 14:14:58 +0100
Message-Id: <1452086098-31513-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] poco: Add recipe for POCO C++ library
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
X-List-Received-Date: Wed, 06 Jan 2016 13:31:05 -0000

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 ...dation-library-version-back-to-SHARED_LIB.patch |  35 +++++++
 meta-oe/recipes-support/poco/poco/run-ptest        |   9 ++
 meta-oe/recipes-support/poco/poco_1.6.1.bb         | 108 +++++++++++++++++++++
 3 files changed, 152 insertions(+)
 create mode 100644 meta-oe/recipes-support/poco/poco-1.6.1/0001-Change-Foundation-library-version-back-to-SHARED_LIB.patch
 create mode 100644 meta-oe/recipes-support/poco/poco/run-ptest
 create mode 100644 meta-oe/recipes-support/poco/poco_1.6.1.bb

diff --git a/meta-oe/recipes-support/poco/poco-1.6.1/0001-Change-Foundation-library-version-back-to-SHARED_LIB.patch b/meta-oe/recipes-support/poco/poco-1.6.1/0001-Change-Foundation-library-version-back-to-SHARED_LIB.patch
new file mode 100644
index 0000000..f65bb15
--- /dev/null
+++ b/meta-oe/recipes-support/poco/poco-1.6.1/0001-Change-Foundation-library-version-back-to-SHARED_LIB.patch
@@ -0,0 +1,35 @@
+From cec5a43151a11d8afbb5dd50caf4e22fb89c6340 Mon Sep 17 00:00:00 2001
+From: Mike Gelfand <mikedld@mikedld.com>
+Date: Sun, 20 Sep 2015 03:08:19 +0300
+Subject: [PATCH] Change Foundation library version back to
+ SHARED_LIBRARY_VERSION
+
+Foundation is the only library using PROJECT_VERSION as library version,
+the change accidentally introduced by commit b69fafb84c. This causes
+difference in library being linked to (libPocoFoundation.31.dylib on Mac)
+and library returned by $<TARGET_FILE:Poco::Foundation> for imported
+target (libPocoFoundation.1.6.1.dylib), causing inconvenience. Also, this
+differs from autoconf-based builds where only "31" (soversion) library is
+being created and not "1.6.1" (project version) one.
+
+Upstream-Status: Backport from 1.6.2
+---
+ Foundation/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Foundation/CMakeLists.txt b/Foundation/CMakeLists.txt
+index c1dd25f..25f401c 100644
+--- a/Foundation/CMakeLists.txt
++++ b/Foundation/CMakeLists.txt
+@@ -108,7 +108,7 @@ add_library( "${LIBNAME}" ${LIB_MODE} ${SRCS})
+ add_library( "${POCO_LIBNAME}" ALIAS "${LIBNAME}")
+ set_target_properties( "${LIBNAME}"
+     PROPERTIES
+-    VERSION ${PROJECT_VERSION} SOVERSION ${SHARED_LIBRARY_VERSION}
++    VERSION ${SHARED_LIBRARY_VERSION} SOVERSION ${SHARED_LIBRARY_VERSION}
+     OUTPUT_NAME ${POCO_LIBNAME}
+     DEFINE_SYMBOL Foundation_EXPORTS
+     )
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-support/poco/poco/run-ptest b/meta-oe/recipes-support/poco/poco/run-ptest
new file mode 100644
index 0000000..c479f7a
--- /dev/null
+++ b/meta-oe/recipes-support/poco/poco/run-ptest
@@ -0,0 +1,9 @@
+#!/bin/sh
+while read runner; do
+  pushd . >/dev/null
+  cd bin
+  echo Testing $runner
+  ./$runner-testrunner -all
+  popd >/dev/null
+done < testrunners
+
diff --git a/meta-oe/recipes-support/poco/poco_1.6.1.bb b/meta-oe/recipes-support/poco/poco_1.6.1.bb
new file mode 100644
index 0000000..9822186
--- /dev/null
+++ b/meta-oe/recipes-support/poco/poco_1.6.1.bb
@@ -0,0 +1,108 @@
+SUMMARY = "Modern, powerful open source cross-platform C++ class libraries"
+DESCRIPTION = "Modern, powerful open source C++ class libraries and frameworks for building network- and internet-based applications that run on desktop, server, mobile and embedded systems."
+SECTION = "libs"
+HOMEPAGE = "http://pocoproject.org/"
+LICENSE = "BSL-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4267f48fc738f50380cbeeb76f95cebc"
+
+# These dependencies are required by Foundation
+DEPENDS = "libpcre zlib"
+
+inherit cmake ptest
+
+BBCLASSEXTEND = "native"
+
+SRC_URI = " \
+    https://github.com/pocoproject/poco/archive/poco-${PV}-release.tar.gz \
+    file://0001-Change-Foundation-library-version-back-to-SHARED_LIB.patch \
+    file://run-ptest \
+   "
+
+SRC_URI[md5sum] = "208872b13d282dfb0f0580fc11df96f3"
+SRC_URI[sha256sum] = "08bc0a9bae4fb793eb694ad5ec7742c179bad48a286ae614682483021043658b"
+
+S = "${WORKDIR}/poco-poco-${PV}-release"
+
+EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=RelWithDebInfo -DPOCO_UNBUNDLED=ON \
+                 ${@bb.utils.contains('PTEST_ENABLED', '1', '-DENABLE_TESTS=ON ', '', d)}"
+
+# For the native build we want to use the bundled version
+EXTRA_OECMAKE_append_class-native = " -DPOCO_UNBUNDLED=OFF"
+
+# do not use rpath
+EXTRA_OECMAKE_append = " -DCMAKE_SKIP_RPATH=ON"
+
+# By default the most commonly used poco components are built
+# Foundation is built anyway and doesn't need to be listed explicitly
+# these don't have dependencies outside oe-core
+PACKAGECONFIG ??= "XML JSON MongoDB PDF Util Net NetSSL Crypto Data DataSQLite Zip"
+
+PACKAGECONFIG[XML] = "-DENABLE_XML=ON,-DENABLE_XML=OFF,expat"
+PACKAGECONFIG[JSON] = "-DENABLE_JSON=ON,-DENABLE_JSON=OFF"
+PACKAGECONFIG[MongoDB] = "-DENABLE_MONGODB=ON,-DENABLE_MONGODB=OFF"
+PACKAGECONFIG[PDF] = "-DENABLE_PDF=ON,-DENABLE_PDF=OFF,zlib"
+PACKAGECONFIG[Util] = "-DENABLE_UTIL=ON,-DENABLE_UTIL=OFF"
+PACKAGECONFIG[Net] = "-DENABLE_NET=ON,-DENABLE_NET=OFF"
+PACKAGECONFIG[NetSSL] = "-DENABLE_NETSSL=ON,-DENABLE_NETSSL=OFF,openssl"
+PACKAGECONFIG[Crypto] = "-DENABLE_CRYPTO=ON,-DENABLE_CRYPTO=OFF,openssl"
+PACKAGECONFIG[Data] = "-DENABLE_DATA=ON,-DENABLE_DATA=OFF"
+PACKAGECONFIG[DataSQLite] = "-DENABLE_DATA_SQLITE=ON,-DENABLE_DATA_SQLITE=OFF,sqlite3"
+PACKAGECONFIG[Zip] = "-DENABLE_ZIP=ON,-DENABLE_ZIP=OFF"
+
+# Additional components not build by default,
+# they might have dependencies not included in oe-core
+# or they don't work on all architectures
+PACKAGECONFIG[mod_poco] = "-DENABLE_APACHECONNECTOR=ON,-DENABLE_APACHECONNECTOR=OFF,apr apache2"
+PACKAGECONFIG[CppParser] = "-DENABLE_CPPPARSER=ON,-DENABLE_CPPPARSER=OFF"
+PACKAGECONFIG[DataMySQL] = "-DENABLE_DATA_MYSQL=ON,-DENABLE_DATA_MYSQL=OFF,mariadb"
+PACKAGECONFIG[DataODBC] = "-DENABLE_DATA_ODBC=ON,-DENABLE_DATA_ODBC=OFF,libiodbc"
+PACKAGECONFIG[PageCompiler] = "-DENABLE_PAGECOMPILER=ON,-DENABLE_PAGECOMPILER=OFF"
+PACKAGECONFIG[PageCompilerFile2Page] = "-DENABLE_PAGECOMPILER_FILE2PAGE=ON,-DENABLE_PAGECOMPILER_FILE2PAGE=OFF"
+PACKAGECONFIG[SevenZip] = "-DENABLE_SEVENZIP=ON,-DENABLE_SEVENZIP=OFF"
+
+# Make a package for each library
+PACKAGES = "${PN}-dbg ${POCO_PACKAGES}"
+python __anonymous () {
+    packages = []
+    testrunners = []
+    components = d.getVar("PACKAGECONFIG", True).split()
+    components.append("Foundation")
+    for lib in components:
+        pkg = ("poco-%s" % lib.lower()).replace("_","")
+        packages.append(pkg)
+        if not d.getVar("FILES_%s" % pkg, True):
+            d.setVar("FILES_%s" % pkg, "${libdir}/libPoco%s.so.*" % lib)
+        testrunners.append("%s" % lib)
+
+    d.setVar("POCO_PACKAGES", " ".join(packages))
+    d.setVar("POCO_TESTRUNNERS", "\n".join(testrunners))
+}
+
+# "poco" is a metapackage which pulls in all Poco components
+PACKAGES += "${PN}"
+RRECOMMENDS_${PN} += "${POCO_PACKAGES}"
+RRECOMMENDS_${PN}_class-native = ""
+ALLOW_EMPTY_${PN} = "1"
+
+# -dev last to pick up the remaining stuff
+PACKAGES += "${PN}-dev ${PN}-staticdev"
+FILES_${PN}-dev = "${includedir} ${libdir}/libPoco*.so ${libdir}/cmake"
+FILES_${PN}-staticdev = "${libdir}/libPoco*.a"
+
+# ptest support
+FILES_${PN}-dbg += "${PTEST_PATH}/bin/.debug"
+
+# cppunit is only built if tests are enabled
+PACKAGES += "${PN}-cppunit"
+FILES_${PN}-cppunit += "${libdir}/libCppUnit.so*"
+ALLOW_EMPTY_${PN}-cppunit = "1"
+
+RDEPENDS_${PN}-ptest += "${PN}-cppunit"
+
+do_install_ptest () {
+       cp -rf ${B}/bin/ ${D}${PTEST_PATH}
+       cp -f ${B}/lib/libCppUnit.so* ${D}${libdir}
+       cp -rf ${B}/*/testsuite/data ${D}${PTEST_PATH}/bin/
+       find "${D}${PTEST_PATH}" -executable -exec chrpath -d {} \;
+       echo "${POCO_TESTRUNNERS}" > "${D}${PTEST_PATH}/testrunners"
+}
-- 
2.1.4


