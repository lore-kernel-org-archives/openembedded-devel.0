Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 349F377F70
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 May 2017 23:26:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 May 2017 16:26:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,377,1491289200"; d="scan'208";a="1172470308"
Received: from wrath.jf.intel.com ([10.54.70.7])
	by fmsmga002.fm.intel.com with ESMTP; 21 May 2017 16:26:15 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 May 2017 16:25:55 -0700
Message-Id: <20170521232555.30221-5-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170521232555.30221-1-timothy.t.orling@linux.intel.com>
References: <20170521232555.30221-1-timothy.t.orling@linux.intel.com>
Subject: [meta-java][master][pyro][PATCH 4/4] jdom: unblacklist and update to v1.1.3
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
X-List-Received-Date: Sun, 21 May 2017 23:26:14 -0000

    - Add SUMMARY and expand DESCRIPTION
    - Add LIC_FILES_CHECKSUM
    - Move SRC_URI checksums to recommended location in recipe
    - Add virtual/javac-native to DEPENDS for RSS

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 recipes-core/xml-commons/jdom_1.1.3.bb | 25 +++++++++++++++++++++++++
 recipes-core/xml-commons/jdom_1.1.bb   | 28 ----------------------------
 2 files changed, 25 insertions(+), 28 deletions(-)
 create mode 100644 recipes-core/xml-commons/jdom_1.1.3.bb
 delete mode 100644 recipes-core/xml-commons/jdom_1.1.bb

diff --git a/recipes-core/xml-commons/jdom_1.1.3.bb b/recipes-core/xml-commons/jdom_1.1.3.bb
new file mode 100644
index 0000000..80b836a
--- /dev/null
+++ b/recipes-core/xml-commons/jdom_1.1.3.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Parses, manipulates, and outputs XML using standard Java constructs"
+DESCRIPTION = "JDOM aims to provide a complete, Java-based solution for \
+accessing, manipulating, and outputting XML data from Java code."
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=897c700e4c122d8f4ef8f6d253a6f744"
+
+HOMEPAGE = "http://jdom.org/"
+
+DEPENDS = "fastjar-native virtual/javac-native jaxen"
+
+SRC_URI = "http://www.jdom.org/dist/source/archive/jdom-${PV}.tar.gz" 
+SRC_URI[md5sum] = "dc8391e84cfdb170fcd8279aa370019f"
+SRC_URI[sha256sum] = "d471718c4ac7a1a2f10715b93cb3fcd2ecbab60384b73ad1c089712e47bd8d1f"
+
+inherit java-library
+
+do_compile() {
+  mkdir -p build
+
+  oe_makeclasspath cp -s jaxen
+
+  javac -sourcepath src/java -cp $cp -d build `find src/java -name "*.java"`
+
+  fastjar -C build -c -f ${JARFILENAME} .
+}
diff --git a/recipes-core/xml-commons/jdom_1.1.bb b/recipes-core/xml-commons/jdom_1.1.bb
deleted file mode 100644
index 4867e82..0000000
--- a/recipes-core/xml-commons/jdom_1.1.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "Parses, manipulates, and outputs XML using standard Java constructs"
-LICENSE = "BSD"
-
-HOMEPAGE = "http://jdom.org/"
-
-DEPENDS = "fastjar-native jaxen"
-
-SRC_URI = "\
-	http://www.jdom.org/dist/binary/archive/jdom-${PV}.tar.gz \
-	"
-
-PNBLACKLIST[jdom] ?= "BROKEN: indirectly depends on broken 'xom'"
-
-inherit java-library
-
-do_compile() {
-  mkdir -p build
-
-  oe_makeclasspath cp -s jaxen
-
-  javac -sourcepath src/java -cp $cp -d build `find src/java -name "*.java"`
-
-  fastjar -C build -c -f ${JARFILENAME} .
-}
-
-
-SRC_URI[md5sum] = "22745cbaaddb12884ed8ee09083d8fe2"
-SRC_URI[sha256sum] = "a13549087141be24ad176b659afdc2c675f1ffa5288ff999a193d6d44a282056"
-- 
2.9.4


