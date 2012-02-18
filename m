Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Ryrq8-0006IE-1E
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Feb 2012 22:29:08 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 76ECF22325A8;
	Sat, 18 Feb 2012 22:20:54 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 09D8622325A7;
	Sat, 18 Feb 2012 22:20:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g229046026.adsl.alicedsl.de
	[92.229.46.26]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Sat, 18 Feb 2012 22:20:50 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 200853C4C1; Sat, 18 Feb 2012 22:20:45 +0100 (CET)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Feb 2012 22:20:18 +0100
Message-Id: <1329600022-8027-9-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.9
In-Reply-To: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH 08/12][oe-classic] rhino: add version 1.7r2
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
X-List-Received-Date: Sat, 18 Feb 2012 21:29:08 -0000


Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 recipes/mozilla/rhino-native_1.7r2.bb |    5 +++
 recipes/mozilla/rhino_1.7r2.bb        |   45 +++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 recipes/mozilla/rhino-native_1.7r2.bb
 create mode 100644 recipes/mozilla/rhino_1.7r2.bb

diff --git a/recipes/mozilla/rhino-native_1.7r2.bb b/recipes/mozilla/rhino-native_1.7r2.bb
new file mode 100644
index 0000000..1b56360
--- /dev/null
+++ b/recipes/mozilla/rhino-native_1.7r2.bb
@@ -0,0 +1,5 @@
+require rhino_${PV}.bb
+
+inherit java-native
+
+RDEPENDS_${PN} = ""
diff --git a/recipes/mozilla/rhino_1.7r2.bb b/recipes/mozilla/rhino_1.7r2.bb
new file mode 100644
index 0000000..0e9e14e
--- /dev/null
+++ b/recipes/mozilla/rhino_1.7r2.bb
@@ -0,0 +1,45 @@
+DESCRIPTION = "Lexical analyzer generator for Java"
+
+LICENSE = "GPL MPL"
+
+DEPENDS = "fastjar-native"
+
+inherit java-library
+
+SRC_URI = "\
+	ftp://ftp.mozilla.org/pub/mozilla.org/js/rhino1_7R2.zip \
+	file://rhino \
+	file://rhino-jsc \
+	"
+
+S = "${WORKDIR}/rhino1_7R2"
+
+PACKAGES = "${JPN} rhino"
+
+FILES_${PN} = "${bindir}/rhino ${bindir}/rhino-jsc"
+RDEPENDS_${PN} = "java2-runtime ${JPN}"
+
+do_compile() {
+  mkdir -p build
+
+	# Compatibility fix for jamvm which has non-genericised
+  # java.lang classes. :(
+	bcp_arg="-bootclasspath ${STAGING_DATADIR_NATIVE}/classpath/glibj.zip"
+
+  javac $bcp_arg -source 1.5 -sourcepath src -d build `find src -name "*.java"`
+
+	mkdir -p build/org/mozilla/javascript/resources
+	cp src/org/mozilla/javascript/resources/*.properties build/org/mozilla/javascript/resources
+
+  fastjar -m ${S}/src/manifest -C build -c -f ${JARFILENAME} .
+}
+
+do_install_append() {
+	install -d ${D}${bindir}
+
+	install -m 0755 ${WORKDIR}/rhino ${D}${bindir}
+	install -m 0755 ${WORKDIR}/rhino-jsc ${D}${bindir}
+}
+
+SRC_URI[md5sum] = "40d0a9abec8169e42920214b37fa8e0e"
+SRC_URI[sha256sum] = "677f7dc1b67a1587bc03974d5f0720474a56b8f29835e1d860739908df8462dc"
-- 
1.7.9


