Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id A641C7487D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 11:53:01 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w4GBr25W014155
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 13:53:02 +0200
Received: from dev.vm6.ccp.siemens.com ([167.87.137.240])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w4GBr0l6019045;
	Wed, 16 May 2018 13:53:01 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 1561310F2E20;
	Wed, 16 May 2018 13:52:59 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 May 2018 13:52:02 +0200
Message-Id: <20180516115202.7504-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH v3] poco: update to 1.9.0
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
X-List-Received-Date: Wed, 16 May 2018 11:53:03 -0000

Enable the new Encodings and Redis packages by default.

Splitting into sub packages now uses PACKAGES_DYNAMIC instead of the
custom logic used before.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../poco/{poco_1.8.0.1.bb => poco_1.9.0.bb}        | 42 +++++++++-------------
 1 file changed, 17 insertions(+), 25 deletions(-)
 rename meta-oe/recipes-support/poco/{poco_1.8.0.1.bb => poco_1.9.0.bb} (79%)

diff --git a/meta-oe/recipes-support/poco/poco_1.8.0.1.bb b/meta-oe/recipes-support/poco/poco_1.9.0.bb
similarity index 79%
rename from meta-oe/recipes-support/poco/poco_1.8.0.1.bb
rename to meta-oe/recipes-support/poco/poco_1.9.0.bb
index 160b4d391..1016caef7 100644
--- a/meta-oe/recipes-support/poco/poco_1.8.0.1.bb
+++ b/meta-oe/recipes-support/poco/poco_1.9.0.bb
@@ -12,7 +12,7 @@ inherit cmake ptest
 
 BBCLASSEXTEND = "native"
 
-SRCREV = "af527ab21fca5ab2659285408aec9920ed7c7b17"
+SRCREV = "94966785a8f9ad0191dffd075ebd67826e6e4b6d"
 SRC_URI = " \
     git://github.com/pocoproject/poco.git \
     file://run-ptest \
@@ -33,7 +33,7 @@ EXTRA_OECMAKE_append = " -DCMAKE_SKIP_RPATH=ON"
 # By default the most commonly used poco components are built
 # Foundation is built anyway and doesn't need to be listed explicitly
 # these don't have dependencies outside oe-core
-PACKAGECONFIG ??= "XML JSON MongoDB PDF Util Net NetSSL Crypto Data DataSQLite Zip"
+PACKAGECONFIG ??= "XML JSON MongoDB PDF Util Net NetSSL Crypto Data DataSQLite Zip Encodings Redis"
 
 PACKAGECONFIG[XML] = "-DENABLE_XML=ON -DEXPAT_LIBRARY:STRING=expat,-DENABLE_XML=OFF,expat"
 PACKAGECONFIG[JSON] = "-DENABLE_JSON=ON,-DENABLE_JSON=OFF"
@@ -46,6 +46,8 @@ PACKAGECONFIG[Crypto] = "-DENABLE_CRYPTO=ON -DOPENSSL_SSL_LIBRARY:STRING=ssl -DO
 PACKAGECONFIG[Data] = "-DENABLE_DATA=ON,-DENABLE_DATA=OFF"
 PACKAGECONFIG[DataSQLite] = "-DENABLE_DATA_SQLITE=ON -DSQLITE3_LIBRARY:STRING=sqlite3,-DENABLE_DATA_SQLITE=OFF,sqlite3"
 PACKAGECONFIG[Zip] = "-DENABLE_ZIP=ON,-DENABLE_ZIP=OFF"
+PACKAGECONFIG[Encodings] = "-DENABLE_ENCODINGS=ON,-DENABLE_ENCODINGS=OFF"
+PACKAGECONFIG[Redis] = "-DENABLE_REDIS=ON,-DENABLE_REDIS=OFF"
 
 # Additional components not build by default,
 # they might have dependencies not included in oe-core
@@ -58,40 +60,30 @@ PACKAGECONFIG[PageCompiler] = "-DENABLE_PAGECOMPILER=ON,-DENABLE_PAGECOMPILER=OF
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
+PACKAGES =+ "${PN}-cppunit"
 FILES_${PN}-cppunit += "${libdir}/libCppUnit.so*"
 ALLOW_EMPTY_${PN}-cppunit = "1"
 
-- 
2.11.0


