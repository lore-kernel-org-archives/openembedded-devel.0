Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D3B1B77F70
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 May 2017 23:26:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 May 2017 16:26:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,377,1491289200"; d="scan'208";a="1172470303"
Received: from wrath.jf.intel.com ([10.54.70.7])
	by fmsmga002.fm.intel.com with ESMTP; 21 May 2017 16:26:12 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 May 2017 16:25:54 -0700
Message-Id: <20170521232555.30221-4-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170521232555.30221-1-timothy.t.orling@linux.intel.com>
References: <20170521232555.30221-1-timothy.t.orling@linux.intel.com>
Subject: [meta-java][master][pyro][PATCH 3/4] dom4j: unblacklist and fix build
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
X-List-Received-Date: Sun, 21 May 2017 23:26:10 -0000

- Add SUMMARY and expand DESCRIPTION
- Update HOMEPAGE
- Update URI for jaxme
- Add LIC_FILE_CHECKSUM
- Fix path for 'find org ...'
- Move SRC_URI checksums to recommended location in recipe
- Add virtual/javac-native to DEPENDS for RSS

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 recipes-core/xml-commons/dom4j_1.6.1.bb | 29 ++++++++++++++---------------
 recipes-core/xml-commons/jaxen_1.1.6.bb |  2 +-
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/recipes-core/xml-commons/dom4j_1.6.1.bb b/recipes-core/xml-commons/dom4j_1.6.1.bb
index 19dca74..97c9947 100644
--- a/recipes-core/xml-commons/dom4j_1.6.1.bb
+++ b/recipes-core/xml-commons/dom4j_1.6.1.bb
@@ -1,17 +1,22 @@
+SUMMARY = "A simple and flexible library for working with XML, XPath and XSLT"
 DESCRIPTION = "dom4j is a simple and flexible Java library for working with XML, XPath and XSLT"
 LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3f752b663f2a821c3b32482fc6aece3c"
 
-HOMEPAGE = "http://dom4j.org"
+HOMEPAGE = "http://dom4j.github.io"
 
-DEPENDS = "fastjar-native xerces-j xalan-j xpp2 xpp3 jaxen"
+DEPENDS = "fastjar-native virtual/javac-native \
+           xerces-j xalan-j xpp2 xpp3 jaxen"
 
 SRC_URI = "\
-	${SOURCEFORGE_MIRROR}/dom4j/${P}.tar.gz;name=archive \
-	http://apache.org/dist/ws/jaxme/source/ws-jaxme-0.5.2-src.tar.gz;name=jaxme \
-	file://debian.patch \
-	"
-
-PNBLACKLIST[dom4j] ?= "BROKEN: indirectly depends on broken 'xom'"
+        ${SOURCEFORGE_MIRROR}/dom4j/${P}.tar.gz;name=archive \
+        http://archive.apache.org/dist/ws/jaxme/source/ws-jaxme-0.5.2-src.tar.gz;name=jaxme \
+        file://debian.patch \
+"
+SRC_URI[archive.md5sum] = "1e7ef6d20939315714de4a8502f27b2d"
+SRC_URI[archive.sha256sum] = "01b4abf86bce337a2a900bf121b3107320ba63b4c0f352e1922fbec6e0736c6f"
+SRC_URI[jaxme.md5sum] = "084ebfe4a816058f8ff6bd731fa70df4"
+SRC_URI[jaxme.sha256sum] = "0415d721259acf95c564fb84606bb17f6227c1cc444e89b78d1cd9903c1c88dc"
 
 inherit java-library
 
@@ -22,16 +27,10 @@ do_compile() {
 	scp="src/java:${WORKDIR}/ws-jaxme-0.5.2/src/api"
 
   javac -sourcepath $scp -cp $cp -d build `find src/java -name "*.java" -and -not -wholename "*datatype*"`
-  (cd src && find org -name "*.properties" -exec cp {} ../build/{} \;)
+  (cd src/java && find org -name "*.properties" -exec cp {} ../../build/{} \;)
 
 	rm -rf build/org/w3c
 	rm -rf build/javax
 
   fastjar -C build -c -f ${JARFILENAME} .
 }
-
-
-SRC_URI[archive.md5sum] = "1e7ef6d20939315714de4a8502f27b2d"
-SRC_URI[archive.sha256sum] = "01b4abf86bce337a2a900bf121b3107320ba63b4c0f352e1922fbec6e0736c6f"
-SRC_URI[jaxme.md5sum] = "084ebfe4a816058f8ff6bd731fa70df4"
-SRC_URI[jaxme.sha256sum] = "0415d721259acf95c564fb84606bb17f6227c1cc444e89b78d1cd9903c1c88dc"
diff --git a/recipes-core/xml-commons/jaxen_1.1.6.bb b/recipes-core/xml-commons/jaxen_1.1.6.bb
index 2e313fa..d75ce75 100644
--- a/recipes-core/xml-commons/jaxen_1.1.6.bb
+++ b/recipes-core/xml-commons/jaxen_1.1.6.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a2e66c2e2482aa23c11342f1469fa3b6"
 
 HOMEPAGE = "http://jaxen.org/"
 
-DEPENDS = "fastjar-native xerces-j xom"
+DEPENDS = "fastjar-native virtual/javac-native xerces-j xom"
 
 # upstream has moved to github, do not rely on ephemeral tarball, use git
 SRCREV = "7d7755ac8b19daa2ff6f319f432b864cc72d89b6"
-- 
2.9.4


