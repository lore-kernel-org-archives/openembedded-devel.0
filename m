Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 469006E630
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 07:40:45 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w4G7ejZN000414
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 09:40:45 +0200
Received: from dev.vm6.ccp.siemens.com ([167.87.162.109])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w4G7eXjr003594;
	Wed, 16 May 2018 09:40:34 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 6C21310D8B93;
	Wed, 16 May 2018 09:40:32 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 May 2018 09:39:48 +0200
Message-Id: <20180516073948.1565-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH v2] poco: update to 1.9.0
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
X-List-Received-Date: Wed, 16 May 2018 07:40:46 -0000

Enable the new Encodings and Redis packages by default.

Splitting into sub packages now uses PACKAGES_DYNAMIC instead of the
custom logic used before.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-oe/recipes-support/poco/poco_1.8.0.1.bb | 106 ---------------------------
 meta-oe/recipes-support/poco/poco_1.9.0.bb   |  36 ++++-----
 2 files changed, 13 insertions(+), 129 deletions(-)
 delete mode 100644 meta-oe/recipes-support/poco/poco_1.8.0.1.bb

diff --git a/meta-oe/recipes-support/poco/poco_1.8.0.1.bb b/meta-oe/recipes-support/poco/poco_1.8.0.1.bb
deleted file mode 100644
index 160b4d391..000000000
--- a/meta-oe/recipes-support/poco/poco_1.8.0.1.bb
+++ /dev/null
@@ -1,106 +0,0 @@
-SUMMARY = "Modern, powerful open source cross-platform C++ class libraries"
-DESCRIPTION = "Modern, powerful open source C++ class libraries and frameworks for building network- and internet-based applications that run on desktop, server, mobile and embedded systems."
-SECTION = "libs"
-HOMEPAGE = "http://pocoproject.org/"
-LICENSE = "BSL-1.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4267f48fc738f50380cbeeb76f95cebc"
-
-# These dependencies are required by Foundation
-DEPENDS = "libpcre zlib"
-
-inherit cmake ptest
-
-BBCLASSEXTEND = "native"
-
-SRCREV = "af527ab21fca5ab2659285408aec9920ed7c7b17"
-SRC_URI = " \
-    git://github.com/pocoproject/poco.git \
-    file://run-ptest \
-   "
-
-S = "${WORKDIR}/git"
-
-EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=RelWithDebInfo -DPOCO_UNBUNDLED=ON \
-                  -DZLIB_LIBRARY_RELEASE:STRING=z -DPCRE_LIBRARY:STRING=pcre \
-                 ${@bb.utils.contains('PTEST_ENABLED', '1', '-DENABLE_TESTS=ON ', '', d)}"
-
-# For the native build we want to use the bundled version
-EXTRA_OECMAKE_append_class-native = " -DPOCO_UNBUNDLED=OFF"
-
-# do not use rpath
-EXTRA_OECMAKE_append = " -DCMAKE_SKIP_RPATH=ON"
-
-# By default the most commonly used poco components are built
-# Foundation is built anyway and doesn't need to be listed explicitly
-# these don't have dependencies outside oe-core
-PACKAGECONFIG ??= "XML JSON MongoDB PDF Util Net NetSSL Crypto Data DataSQLite Zip"
-
-PACKAGECONFIG[XML] = "-DENABLE_XML=ON -DEXPAT_LIBRARY:STRING=expat,-DENABLE_XML=OFF,expat"
-PACKAGECONFIG[JSON] = "-DENABLE_JSON=ON,-DENABLE_JSON=OFF"
-PACKAGECONFIG[MongoDB] = "-DENABLE_MONGODB=ON,-DENABLE_MONGODB=OFF"
-PACKAGECONFIG[PDF] = "-DENABLE_PDF=ON,-DENABLE_PDF=OFF,zlib"
-PACKAGECONFIG[Util] = "-DENABLE_UTIL=ON,-DENABLE_UTIL=OFF"
-PACKAGECONFIG[Net] = "-DENABLE_NET=ON,-DENABLE_NET=OFF"
-PACKAGECONFIG[NetSSL] = "-DENABLE_NETSSL=ON -DOPENSSL_SSL_LIBRARY:STRING=ssl -DOPENSSL_CRYPTO_LIBRARY:STRING=crypto,-DENABLE_NETSSL=OFF,openssl"
-PACKAGECONFIG[Crypto] = "-DENABLE_CRYPTO=ON -DOPENSSL_SSL_LIBRARY:STRING=ssl -DOPENSSL_CRYPTO_LIBRARY:STRING=crypto,-DENABLE_CRYPTO=OFF,openssl"
-PACKAGECONFIG[Data] = "-DENABLE_DATA=ON,-DENABLE_DATA=OFF"
-PACKAGECONFIG[DataSQLite] = "-DENABLE_DATA_SQLITE=ON -DSQLITE3_LIBRARY:STRING=sqlite3,-DENABLE_DATA_SQLITE=OFF,sqlite3"
-PACKAGECONFIG[Zip] = "-DENABLE_ZIP=ON,-DENABLE_ZIP=OFF"
-
-# Additional components not build by default,
-# they might have dependencies not included in oe-core
-# or they don't work on all architectures
-PACKAGECONFIG[mod_poco] = "-DENABLE_APACHECONNECTOR=ON,-DENABLE_APACHECONNECTOR=OFF,apr apache2"
-PACKAGECONFIG[CppParser] = "-DENABLE_CPPPARSER=ON,-DENABLE_CPPPARSER=OFF"
-PACKAGECONFIG[DataMySQL] = "-DENABLE_DATA_MYSQL=ON -DMYSQL_LIB:STRING=mysqlclient_r,-DENABLE_DATA_MYSQL=OFF,mariadb"
-PACKAGECONFIG[DataODBC] = "-DENABLE_DATA_ODBC=ON,-DENABLE_DATA_ODBC=OFF,libiodbc"
-PACKAGECONFIG[PageCompiler] = "-DENABLE_PAGECOMPILER=ON,-DENABLE_PAGECOMPILER=OFF"
-PACKAGECONFIG[PageCompilerFile2Page] = "-DENABLE_PAGECOMPILER_FILE2PAGE=ON,-DENABLE_PAGECOMPILER_FILE2PAGE=OFF"
-PACKAGECONFIG[SevenZip] = "-DENABLE_SEVENZIP=ON,-DENABLE_SEVENZIP=OFF"
-
-# Make a package for each library
-PACKAGES = "${PN}-dbg ${POCO_PACKAGES}"
-python __anonymous () {
-    packages = []
-    testrunners = []
-    components = d.getVar("PACKAGECONFIG").split()
-    components.append("Foundation")
-    for lib in components:
-        pkg = ("poco-%s" % lib.lower()).replace("_","")
-        packages.append(pkg)
-        if not d.getVar("FILES_%s" % pkg):
-            d.setVar("FILES_%s" % pkg, "${libdir}/libPoco%s.so.*" % lib)
-        testrunners.append("%s" % lib)
-
-    d.setVar("POCO_PACKAGES", " ".join(packages))
-    d.setVar("POCO_TESTRUNNERS", "\n".join(testrunners))
-}
-
-# "poco" is a metapackage which pulls in all Poco components
-PACKAGES += "${PN}"
-RRECOMMENDS_${PN} += "${POCO_PACKAGES}"
-RRECOMMENDS_${PN}_class-native = ""
-ALLOW_EMPTY_${PN} = "1"
-
-# -dev last to pick up the remaining stuff
-PACKAGES += "${PN}-dev ${PN}-staticdev"
-FILES_${PN}-dev = "${includedir} ${libdir}/libPoco*.so ${libdir}/cmake"
-FILES_${PN}-staticdev = "${libdir}/libPoco*.a"
-
-# ptest support
-FILES_${PN}-dbg += "${PTEST_PATH}/bin/.debug"
-
-# cppunit is only built if tests are enabled
-PACKAGES += "${PN}-cppunit"
-FILES_${PN}-cppunit += "${libdir}/libCppUnit.so*"
-ALLOW_EMPTY_${PN}-cppunit = "1"
-
-RDEPENDS_${PN}-ptest += "${PN}-cppunit"
-
-do_install_ptest () {
-       cp -rf ${B}/bin/ ${D}${PTEST_PATH}
-       cp -f ${B}/lib/libCppUnit.so* ${D}${libdir}
-       cp -rf ${B}/*/testsuite/data ${D}${PTEST_PATH}/bin/
-       find "${D}${PTEST_PATH}" -executable -exec chrpath -d {} \;
-       echo "${POCO_TESTRUNNERS}" > "${D}${PTEST_PATH}/testrunners"
-}
diff --git a/meta-oe/recipes-support/poco/poco_1.9.0.bb b/meta-oe/recipes-support/poco/poco_1.9.0.bb
index 1a804b1ae..71b1533d7 100644
--- a/meta-oe/recipes-support/poco/poco_1.9.0.bb
+++ b/meta-oe/recipes-support/poco/poco_1.9.0.bb
@@ -60,40 +60,30 @@ PACKAGECONFIG[PageCompiler] = "-DENABLE_PAGECOMPILER=ON,-DENABLE_PAGECOMPILER=OF
 PACKAGECONFIG[PageCompilerFile2Page] = "-DENABLE_PAGECOMPILER_FILE2PAGE=ON,-DENABLE_PAGECOMPILER_FILE2PAGE=OFF"
 PACKAGECONFIG[SevenZip] = "-DENABLE_SEVENZIP=ON,-DENABLE_SEVENZIP=OFF"
 
-# Make a package for each library
-PACKAGES = "${PN}-dbg ${POCO_PACKAGES}"
-python __anonymous () {
+python populate_packages_prepend () {
+    poco_libdir = d.expand('${libdir}')
+    pn = d.getVar("PN")
     packages = []
     testrunners = []
-    components = d.getVar("PACKAGECONFIG").split()
-    components.append("Foundation")
-    for lib in components:
-        pkg = ("poco-%s" % lib.lower()).replace("_","")
+
+    def hook(f, pkg, file_regex, output_pattern, modulename):
         packages.append(pkg)
-        if not d.getVar("FILES_%s" % pkg):
-            d.setVar("FILES_%s" % pkg, "${libdir}/libPoco%s.so.*" % lib)
-        testrunners.append("%s" % lib)
+        testrunners.append(modulename)
+
+    do_split_packages(d, poco_libdir, '^libPoco(.*)\.so\..*$',
+                    'poco-%s', 'Poco %s component', extra_depends='', prepend=True, hook=hook)
 
-    d.setVar("POCO_PACKAGES", " ".join(packages))
+    d.setVar("RRECOMMENDS_%s" % pn, " ".join(packages))
     d.setVar("POCO_TESTRUNNERS", "\n".join(testrunners))
 }
 
+PACKAGES_DYNAMIC = "poco-.*"
+
 # "poco" is a metapackage which pulls in all Poco components
-PACKAGES += "${PN}"
-RRECOMMENDS_${PN} += "${POCO_PACKAGES}"
-RRECOMMENDS_${PN}_class-native = ""
 ALLOW_EMPTY_${PN} = "1"
 
-# -dev last to pick up the remaining stuff
-PACKAGES += "${PN}-dev ${PN}-staticdev"
-FILES_${PN}-dev = "${includedir} ${libdir}/libPoco*.so ${libdir}/cmake"
-FILES_${PN}-staticdev = "${libdir}/libPoco*.a"
-
-# ptest support
-FILES_${PN}-dbg += "${PTEST_PATH}/bin/.debug"
-
 # cppunit is only built if tests are enabled
-PACKAGES += "${PN}-cppunit"
+PACKAGE_BEFORE_PN += "${PN}-cppunit"
 FILES_${PN}-cppunit += "${libdir}/libCppUnit.so*"
 ALLOW_EMPTY_${PN}-cppunit = "1"
 
-- 
2.11.0


