Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BA5BA77F73
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 May 2017 23:26:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 May 2017 16:26:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,377,1491289200"; d="scan'208";a="1172470292"
Received: from wrath.jf.intel.com ([10.54.70.7])
	by fmsmga002.fm.intel.com with ESMTP; 21 May 2017 16:26:09 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 May 2017 16:25:53 -0700
Message-Id: <20170521232555.30221-3-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170521232555.30221-1-timothy.t.orling@linux.intel.com>
References: <20170521232555.30221-1-timothy.t.orling@linux.intel.com>
Subject: [meta-java][master][pyro][PATCH 2/4] jaxen: unblacklist and update to v1.1.6
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

- Add SUMMARY and expand DESCRIPTION
- Upstream moved to github, use git not ephemeral archive tarball
- Fix path for 'find org ...'
- Move SRC_URI checksums to recommended location in recipe
- Add virtual/javac-native to DEPENDS for RSS

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 recipes-core/xml-commons/jaxen_1.1.1.bb | 35 -----------------------------
 recipes-core/xml-commons/jaxen_1.1.6.bb | 40 +++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 35 deletions(-)
 delete mode 100644 recipes-core/xml-commons/jaxen_1.1.1.bb
 create mode 100644 recipes-core/xml-commons/jaxen_1.1.6.bb

diff --git a/recipes-core/xml-commons/jaxen_1.1.1.bb b/recipes-core/xml-commons/jaxen_1.1.1.bb
deleted file mode 100644
index 4853683..0000000
--- a/recipes-core/xml-commons/jaxen_1.1.1.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "XPath library written in Java"
-LICENSE = "BSD"
-
-HOMEPAGE = "http://jaxen.codehaus.org/"
-
-DEPENDS = "fastjar-native xerces-j xom"
-
-SRC_URI = "\
-	http://dist.codehaus.org/jaxen/distributions/jaxen-${PV}-src.tar.gz;name=archive \
-	http://www.jdom.org/dist/binary/archive/jdom-1.1.tar.gz;name=jdom \
-	"
-
-PNBLACKLIST[jaxen] ?= "BROKEN: depends on broken 'xom'"
-
-inherit java-library
-
-do_compile() {
-  mkdir -p build
-
-  oe_makeclasspath cp -s xercesImpl xom
-	scp="src/java/main:${WORKDIR}/jdom-1.1/src/java"
-
-  javac -sourcepath $scp -cp $cp -d build `find src/java/main -name "*.java" -and -not -wholename "*dom4j*"`
-  (cd src && find org -name "*.properties" -exec cp {} ../build/{} \;)
-
-	rm -rf build/org/jdom
-
-  fastjar -C build -c -f ${JARFILENAME} .
-}
-
-
-SRC_URI[archive.md5sum] = "b598ae6b7e765a92e13667b0a80392f4"
-SRC_URI[archive.sha256sum] = "f24ae604a20da87e3716bb1d441c483e56479eaef4e99888f41be06059790bca"
-SRC_URI[jdom.md5sum] = "22745cbaaddb12884ed8ee09083d8fe2"
-SRC_URI[jdom.sha256sum] = "a13549087141be24ad176b659afdc2c675f1ffa5288ff999a193d6d44a282056"
diff --git a/recipes-core/xml-commons/jaxen_1.1.6.bb b/recipes-core/xml-commons/jaxen_1.1.6.bb
new file mode 100644
index 0000000..2e313fa
--- /dev/null
+++ b/recipes-core/xml-commons/jaxen_1.1.6.bb
@@ -0,0 +1,40 @@
+SUMMARY = "XPath library written in Java"
+DESCRIPTION = "Adaptable to many different object models, including \
+DOM, XOM, dom4j, and JDOM. Is it also possible to write adapters that \
+treat non-XML trees such as compiled Java byte code or Java beans as XML, \
+thus enabling you to query these trees with XPath too.\
+"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a2e66c2e2482aa23c11342f1469fa3b6"
+
+HOMEPAGE = "http://jaxen.org/"
+
+DEPENDS = "fastjar-native xerces-j xom"
+
+# upstream has moved to github, do not rely on ephemeral tarball, use git
+SRCREV = "7d7755ac8b19daa2ff6f319f432b864cc72d89b6"
+
+SRC_URI = "\
+        git://github.com/codehaus/${BPN} \
+        http://www.jdom.org/dist/binary/archive/jdom-1.1.tar.gz;name=jdom \
+"
+SRC_URI[jdom.md5sum] = "22745cbaaddb12884ed8ee09083d8fe2"
+SRC_URI[jdom.sha256sum] = "a13549087141be24ad176b659afdc2c675f1ffa5288ff999a193d6d44a282056"
+
+S = "${WORKDIR}/git/jaxen"
+
+inherit java-library
+
+do_compile() {
+  mkdir -p build
+
+  oe_makeclasspath cp -s xercesImpl xom
+	scp="src/java/main:${WORKDIR}/jdom-1.1/src/java"
+
+  javac -sourcepath $scp -cp $cp -d build `find src/java/main -name "*.java" -and -not -wholename "*dom4j*"`
+  (cd src/java/main && find org -name "*.properties" -exec cp {} ../../../build/{} \;)
+
+	rm -rf build/org/jdom
+
+  fastjar -C build -c -f ${JARFILENAME} .
+}
-- 
2.9.4


