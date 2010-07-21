Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1ObZxU-0006VB-FP
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 16:08:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id CEBCD4036DE65;
	Wed, 21 Jul 2010 16:07:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id C6A0440064C01;
	Wed, 21 Jul 2010 16:07:22 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4x0AVfEAlS5K; Wed, 21 Jul 2010 16:07:22 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id 9922740148CA4;
	Wed, 21 Jul 2010 16:07:22 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1ObZxA-0006TU-GW; Wed, 21 Jul 2010 16:07:20 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 16:06:54 +0200
Message-Id: <1279721232-24744-4-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: henning@tarent.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Henning Heinold <h.heinold@tarent.de>
Subject: [PATCH 03/21] rhino: backpoprt from openembedded-dev
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
X-List-Received-Date: Wed, 21 Jul 2010 14:08:04 -0000

From: Henning Heinold <h.heinold@tarent.de>

* checksum is already in conf/checksums.ini
---
 recipes/mozilla/rhino-native_1.7r1.bb |    5 ++++
 recipes/mozilla/rhino/rhino           |    8 ++++++
 recipes/mozilla/rhino/rhino-jsc       |    8 ++++++
 recipes/mozilla/rhino_1.7r1.bb        |   42 +++++++++++++++++++++++++++++++++
 4 files changed, 63 insertions(+), 0 deletions(-)
 create mode 100644 recipes/mozilla/rhino-native_1.7r1.bb
 create mode 100644 recipes/mozilla/rhino/rhino
 create mode 100644 recipes/mozilla/rhino/rhino-jsc
 create mode 100644 recipes/mozilla/rhino_1.7r1.bb

diff --git a/recipes/mozilla/rhino-native_1.7r1.bb b/recipes/mozilla/rhino-native_1.7r1.bb
new file mode 100644
index 0000000..1b56360
--- /dev/null
+++ b/recipes/mozilla/rhino-native_1.7r1.bb
@@ -0,0 +1,5 @@
+require rhino_${PV}.bb
+
+inherit java-native
+
+RDEPENDS_${PN} = ""
diff --git a/recipes/mozilla/rhino/rhino b/recipes/mozilla/rhino/rhino
new file mode 100644
index 0000000..e2f87f6
--- /dev/null
+++ b/recipes/mozilla/rhino/rhino
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+if [ ! $JAVA ]; then
+	JAVA=java
+fi
+
+$JAVA -jar /usr/share/java/js.jar $@
+
diff --git a/recipes/mozilla/rhino/rhino-jsc b/recipes/mozilla/rhino/rhino-jsc
new file mode 100644
index 0000000..d5f50e8
--- /dev/null
+++ b/recipes/mozilla/rhino/rhino-jsc
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+if [ ! $JAVA ]; then
+	JAVA=java
+fi
+
+$JAVA -cp .:/usr/share/java/js.jar org.mozilla.javascript.tools.jsc.Main $@
+
diff --git a/recipes/mozilla/rhino_1.7r1.bb b/recipes/mozilla/rhino_1.7r1.bb
new file mode 100644
index 0000000..e926870
--- /dev/null
+++ b/recipes/mozilla/rhino_1.7r1.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "Lexical analyzer generator for Java"
+
+LICENSE = "GPL MPL"
+
+DEPENDS = "fastjar-native"
+
+inherit java-library
+
+SRC_URI = "\
+	ftp://ftp.mozilla.org/pub/mozilla.org/js/rhino1_7R1.zip \
+	file://rhino \
+	file://rhino-jsc \
+	"
+
+S = "${WORKDIR}/rhino1_7R1"
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
-- 
1.7.0.4



