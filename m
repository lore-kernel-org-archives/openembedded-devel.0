Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 21ACE77F70
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 May 2017 23:26:04 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 May 2017 16:26:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,377,1491289200"; d="scan'208";a="1172470278"
Received: from wrath.jf.intel.com ([10.54.70.7])
	by fmsmga002.fm.intel.com with ESMTP; 21 May 2017 16:26:06 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 May 2017 16:25:52 -0700
Message-Id: <20170521232555.30221-2-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170521232555.30221-1-timothy.t.orling@linux.intel.com>
References: <20170521232555.30221-1-timothy.t.orling@linux.intel.com>
Subject: [meta-java][master][pyro][PATCH 1/4] xom: unblacklist and update to v1.2.10
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
X-List-Received-Date: Sun, 21 May 2017 23:26:08 -0000

- License checksum changed (updated year)
- Add SUMMARY and expand DESCRIPTION
- Clone jaxen dependency from github, update to v1.1.6
- Move SRC_URI checksums to recommended location in recipe
- Add virtual/javac-native to DEPENDS for RSS

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../04_remove_sun_import.patch                     |  0
 recipes-core/xml-commons/xom_1.1.bb                | 54 ----------------------
 recipes-core/xml-commons/xom_1.2.10.bb             | 50 ++++++++++++++++++++
 3 files changed, 50 insertions(+), 54 deletions(-)
 rename recipes-core/xml-commons/{xom-1.1 => xom-1.2.10}/04_remove_sun_import.patch (100%)
 delete mode 100644 recipes-core/xml-commons/xom_1.1.bb
 create mode 100644 recipes-core/xml-commons/xom_1.2.10.bb

diff --git a/recipes-core/xml-commons/xom-1.1/04_remove_sun_import.patch b/recipes-core/xml-commons/xom-1.2.10/04_remove_sun_import.patch
similarity index 100%
rename from recipes-core/xml-commons/xom-1.1/04_remove_sun_import.patch
rename to recipes-core/xml-commons/xom-1.2.10/04_remove_sun_import.patch
diff --git a/recipes-core/xml-commons/xom_1.1.bb b/recipes-core/xml-commons/xom_1.1.bb
deleted file mode 100644
index c37965b..0000000
--- a/recipes-core/xml-commons/xom_1.1.bb
+++ /dev/null
@@ -1,54 +0,0 @@
-DESCRIPTION = "Tree-based API for processing XML with Java"
-LICENSE = "LGPL-2.1"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=456080cf80cd56d4d58118c1d10d824f"
-
-HOMEPAGE = "http://xom.nu"
-
-SRC_URI = "\
-	http://www.cafeconleche.org/XOM/${P}-src.tar.gz;name=archive \
-	http://dist.codehaus.org/jaxen/distributions/jaxen-1.1.1-src.tar.gz;name=jaxen \
-	file://04_remove_sun_import.patch \
-	"
-
-# DEBUG: Executing shell function do_compile
-# ----------
-# 1. ERROR in src/nu/xom/UnicodeUtil.java (at line 0)
-# 	/* Copyright 2005 Elliotte Rusty Harold
-# 	^
-# Internal compiler error: java.lang.StackOverflowError at org.eclipse.jdt.internal.compiler.ast.Expression.checkNPE(Expression.java:511)
-# ----------
-# Exception in thread "main" java.lang.StackOverflowError
-#    at org.eclipse.jdt.internal.compiler.ast.Expression.checkNPE(Expression.java:511)
-PNBLACKLIST[xom] ?= "BROKEN: do_compile fails with internal javac error"
-
-S = "${WORKDIR}/XOM"
-
-inherit java-library
-
-DEPENDS = "fastjar-native xerces-j xalan-j"
-
-do_compile() {
-    mkdir -p build
-
-    oe_makeclasspath cp -s xercesImpl xalan2
-    cp=build:$cp
-
-    scp="${WORKDIR}/jaxen-1.1.1/src/java/main"
-
-    javac -sourcepath src:$scp -cp $cp -d build `find src -name "*.java" -and -not \( -wholename "*tests*" -or -wholename "*samples*" -or -wholename "*tools*" \)`
-    javac -sourcepath fatsrc:$scp -cp $cp -d build `find fatsrc -name "*.java" -and -not \( -wholename "*tests*" -or -wholename "*samples*" -or -wholename "*tools*" \)`
-    javac -sourcepath src15:$scp -cp $cp -d build `find src15 -name "*.java" -and -not \( -wholename "*tests*" -or -wholename "*samples*" -or -wholename "*tools*" \)`
-
-    (cd src && find . -name "*.properties" -exec cp {} ../build/{} \;)
-
-    # Remove Jaxen classes from build
-    rm -rf build/org/jaxen
-    rm -rf build/org/w3c
-
-    fastjar -C build -c -f ${JARFILENAME} .
-}
-
-SRC_URI[archive.md5sum] = "e5ae82568d7b1faeb950140c34fbbcb1"
-SRC_URI[archive.sha256sum] = "d648fd1f7b7437123afa63df06f6a6409a0487c99ca8f8beba75aaa474d65818"
-SRC_URI[jaxen.md5sum] = "b598ae6b7e765a92e13667b0a80392f4"
-SRC_URI[jaxen.sha256sum] = "f24ae604a20da87e3716bb1d441c483e56479eaef4e99888f41be06059790bca"
diff --git a/recipes-core/xml-commons/xom_1.2.10.bb b/recipes-core/xml-commons/xom_1.2.10.bb
new file mode 100644
index 0000000..0e923d4
--- /dev/null
+++ b/recipes-core/xml-commons/xom_1.2.10.bb
@@ -0,0 +1,50 @@
+SUMMARY = "Tree-based API for processing XML with Java"
+DESCRIPTION = "XML object model which is a tree-based API for processing XML \
+with Java that strives for correctness, simplicity, and performance."
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3f18f166096348ef9d457214a2484816"
+
+HOMEPAGE = "http://xom.nu"
+
+# jaxen recipe depends on xom, avoid circular dependency
+# upstream jaxen moved to github, do not count on ephemeral github archives
+SRCNAME_jaxen = "jaxen"
+SRCREV_jaxen = "7d7755ac8b19daa2ff6f319f432b864cc72d89b6"
+PV_jaxen = "1.1.6"
+
+SRC_URI = "\
+	http://www.cafeconleche.org/XOM/${P}-src.tar.gz;name=archive \
+	git://github.com/codehaus/${SRCNAME_jaxen};name=jaxen \
+	file://04_remove_sun_import.patch \
+"
+SRC_URI[archive.md5sum] = "9f3a2ae827a9f6826fe76e4b7b0c22b3"
+SRC_URI[archive.sha256sum] = "39985c2debb8044005fd07b09cb06f10e75652b3c048c9b4431434215332bc85"
+
+S = "${WORKDIR}/XOM"
+
+inherit java-library
+
+DEPENDS = "fastjar-native virtual/javac-native xerces-j xalan-j"
+
+do_compile() {
+    mkdir -p build
+
+    oe_makeclasspath cp -s xercesImpl xalan2
+    cp=build:$cp
+
+    mv ${WORKDIR}/git/jaxen ${WORKDIR}/jaxen-${PV_jaxen}
+    rm -rf ${WORKDIR}/git
+    scp="${WORKDIR}/jaxen-${PV_jaxen}/src/java/main"
+
+    javac -sourcepath src:$scp -cp $cp -d build `find src -name "*.java" -and -not \( -wholename "*tests*" -or -wholename "*samples*" -or -wholename "*tools*" \)`
+    javac -sourcepath fatsrc:$scp -cp $cp -d build `find fatsrc -name "*.java" -and -not \( -wholename "*tests*" -or -wholename "*samples*" -or -wholename "*tools*" \)`
+    javac -sourcepath src15:$scp -cp $cp -d build `find src15 -name "*.java" -and -not \( -wholename "*tests*" -or -wholename "*samples*" -or -wholename "*tools*" \)`
+
+    (cd src && find . -name "*.properties" -exec cp {} ../build/{} \;)
+
+    # Remove Jaxen classes from build
+    rm -rf build/org/jaxen
+    rm -rf build/org/w3c
+
+    fastjar -C build -c -f ${JARFILENAME} .
+}
-- 
2.9.4


