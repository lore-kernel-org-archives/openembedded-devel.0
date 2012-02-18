Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Ryrq5-0006Gq-Nr
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Feb 2012 22:29:05 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 2F7EC22325AA;
	Sat, 18 Feb 2012 22:20:52 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B96F822325A9;
	Sat, 18 Feb 2012 22:20:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g229046026.adsl.alicedsl.de
	[92.229.46.26]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Sat, 18 Feb 2012 22:20:49 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id E98123C4BE; Sat, 18 Feb 2012 22:20:44 +0100 (CET)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Feb 2012 22:20:15 +0100
Message-Id: <1329600022-8027-6-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.9
In-Reply-To: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH 05/12][oe-classic] ecj-inital: rename recipe to ecj-initial-native
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Feb 2012 21:29:05 -0000


Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 recipes/cacao/cacao-native.inc                     |    2 +-
 recipes/classpath/classpath-native.inc             |    2 +-
 recipes/ecj/ecj-initial-native.bb                  |   35 ++++++++++++++++++++
 recipes/ecj/ecj-initial.bb                         |   35 --------------------
 recipes/jamvm/jamvm-native.inc                     |    2 +-
 .../openjdk-langtools-native_0.0+jdk7-b31.bb       |    2 +-
 6 files changed, 39 insertions(+), 39 deletions(-)
 create mode 100644 recipes/ecj/ecj-initial-native.bb
 delete mode 100644 recipes/ecj/ecj-initial.bb

diff --git a/recipes/cacao/cacao-native.inc b/recipes/cacao/cacao-native.inc
index 8501634..aceee2b 100644
--- a/recipes/cacao/cacao-native.inc
+++ b/recipes/cacao/cacao-native.inc
@@ -4,7 +4,7 @@ LICENSE  = "GPL"
 PRIORITY = "optional"
 SECTION  = "interpreters"
 
-DEPENDS = "zlib-native libtool-native classpath-native ecj-initial fastjar-native"
+DEPENDS = "zlib-native libtool-native classpath-native ecj-initial-native fastjar-native"
 
 PROVIDES = "virtual/java-native"
 
diff --git a/recipes/classpath/classpath-native.inc b/recipes/classpath/classpath-native.inc
index a3ff439..0ebf608 100644
--- a/recipes/classpath/classpath-native.inc
+++ b/recipes/classpath/classpath-native.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "GNU Classpath standard Java libraries - For native Java-dependent programs"
 HOMEPAGE = "http://www.gnu.org/software/classpath/"
 LICENSE = "Classpath"
-DEPENDS = "ecj-initial fastjar-native zip-native"
+DEPENDS = "ecj-initial-native fastjar-native zip-native"
 
 inherit autotools native
 
diff --git a/recipes/ecj/ecj-initial-native.bb b/recipes/ecj/ecj-initial-native.bb
new file mode 100644
index 0000000..1809cd6
--- /dev/null
+++ b/recipes/ecj/ecj-initial-native.bb
@@ -0,0 +1,35 @@
+# ECJ as a bootstrap compiler is a drop-in replacement for Sun's javac. It offers no more
+# and no less features.
+
+# This variant runs on the initial (not Java5-compatible runtime).
+
+DESCRIPTION = "JDT Core Batch Compiler - Bootstrap variant"
+HOMEPAGE = "http://www.eclipse.org/"
+LICENSE = "EPL"
+
+DEPENDS = "libecj-bootstrap"
+
+PR = "r2"
+
+SRC_URI = "file://ecj-initial.in"
+
+NATIVE_INSTALL_WORKS = "1"
+
+S = "${WORKDIR}"
+
+inherit native
+
+JAR = "ecj-bootstrap.jar"
+
+do_compile() {
+  # Create the start script
+  echo "#!/bin/sh" > ecj-initial
+  echo "ECJ_JAR=${STAGING_DATADIR}/java/${JAR}" >> ecj-initial
+  echo "RUNTIME=java-initial" >> ecj-initial
+  cat ecj-initial.in >> ecj-initial
+}
+
+do_install() {
+  install -d ${D}${bindir}
+  install -m 755 ${S}/ecj-initial ${D}${bindir}
+}
diff --git a/recipes/ecj/ecj-initial.bb b/recipes/ecj/ecj-initial.bb
deleted file mode 100644
index 1809cd6..0000000
--- a/recipes/ecj/ecj-initial.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-# ECJ as a bootstrap compiler is a drop-in replacement for Sun's javac. It offers no more
-# and no less features.
-
-# This variant runs on the initial (not Java5-compatible runtime).
-
-DESCRIPTION = "JDT Core Batch Compiler - Bootstrap variant"
-HOMEPAGE = "http://www.eclipse.org/"
-LICENSE = "EPL"
-
-DEPENDS = "libecj-bootstrap"
-
-PR = "r2"
-
-SRC_URI = "file://ecj-initial.in"
-
-NATIVE_INSTALL_WORKS = "1"
-
-S = "${WORKDIR}"
-
-inherit native
-
-JAR = "ecj-bootstrap.jar"
-
-do_compile() {
-  # Create the start script
-  echo "#!/bin/sh" > ecj-initial
-  echo "ECJ_JAR=${STAGING_DATADIR}/java/${JAR}" >> ecj-initial
-  echo "RUNTIME=java-initial" >> ecj-initial
-  cat ecj-initial.in >> ecj-initial
-}
-
-do_install() {
-  install -d ${D}${bindir}
-  install -m 755 ${S}/ecj-initial ${D}${bindir}
-}
diff --git a/recipes/jamvm/jamvm-native.inc b/recipes/jamvm/jamvm-native.inc
index 853c38d..ce227aa 100644
--- a/recipes/jamvm/jamvm-native.inc
+++ b/recipes/jamvm/jamvm-native.inc
@@ -1,6 +1,6 @@
 require jamvm.inc 
 
-DEPENDS = "zlib-native classpath-native ecj-initial libffi-native"
+DEPENDS = "zlib-native classpath-native ecj-initial-native libffi-native"
 RDEPENDS_${PN} = ""
 
 PROVIDES = "virtual/java-native"
diff --git a/recipes/openjdk-langtools/openjdk-langtools-native_0.0+jdk7-b31.bb b/recipes/openjdk-langtools/openjdk-langtools-native_0.0+jdk7-b31.bb
index 39b6dd9..45af116 100644
--- a/recipes/openjdk-langtools/openjdk-langtools-native_0.0+jdk7-b31.bb
+++ b/recipes/openjdk-langtools/openjdk-langtools-native_0.0+jdk7-b31.bb
@@ -4,7 +4,7 @@ LICENSE  = "GPL"
 
 PR = "r3"
 
-DEPENDS = "classpath-native fastjar-native ecj-initial virtual/java-native"
+DEPENDS = "classpath-native fastjar-native ecj-initial-native virtual/java-native"
 
 S = "${WORKDIR}/icepick-0.0+hg20080118"
 
-- 
1.7.9


