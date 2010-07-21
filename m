Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1ObZxf-0006dD-90
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 16:08:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 1FC6E40064C01;
	Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 182424036DE66;
	Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zN35Il52ayoy; Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id DC6E740064C01;
	Wed, 21 Jul 2010 16:07:22 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1ObZxA-0006Tn-Nx; Wed, 21 Jul 2010 16:07:20 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 16:06:56 +0200
Message-Id: <1279721232-24744-6-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: henning@tarent.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Henning Heinold <h.heinold@tarent.de>
Subject: [PATCH 05/21] jlex: backport from openembedded-stable
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
 recipes/jlex/files/jlex           |    5 ++++
 recipes/jlex/jlex-native_1.2.6.bb |   23 +++++++++++++++++++++
 recipes/jlex/jlex_1.2.6.bb        |   39 +++++++++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+), 0 deletions(-)
 create mode 100755 recipes/jlex/files/jlex
 create mode 100644 recipes/jlex/jlex-native_1.2.6.bb
 create mode 100644 recipes/jlex/jlex_1.2.6.bb

diff --git a/recipes/jlex/files/jlex b/recipes/jlex/files/jlex
new file mode 100755
index 0000000..7a9e756
--- /dev/null
+++ b/recipes/jlex/files/jlex
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+cp=OE_STAGING_DATADIR_JAVA/OE_JLEX_JAR
+
+exec OE_STAGING_BINDIR/java -cp $cp JLex.Main "$@"
diff --git a/recipes/jlex/jlex-native_1.2.6.bb b/recipes/jlex/jlex-native_1.2.6.bb
new file mode 100644
index 0000000..6f8194b
--- /dev/null
+++ b/recipes/jlex/jlex-native_1.2.6.bb
@@ -0,0 +1,23 @@
+require jlex_${PV}.bb
+
+inherit java-native
+
+DEPENDS += "virtual/java-native"
+RDEPENDS = ""
+
+do_configure() {
+  sed -i \
+    -e "s|OE_STAGING_BINDIR|${STAGING_BINDIR_NATIVE}|" \
+    -e "s|OE_STAGING_DATADIR_JAVA|${STAGING_DATADIR_JAVA_NATIVE}|" \
+    -e "s|OE_JLEX_JAR|${BP}.jar|" \
+    ${WORKDIR}/jlex
+}
+
+do_install_append() {
+	:
+}
+
+do_stage_append() {
+	install -d ${STAGING_BINDIR}
+	install -m 0755 jlex ${STAGING_BINDIR}
+}
diff --git a/recipes/jlex/jlex_1.2.6.bb b/recipes/jlex/jlex_1.2.6.bb
new file mode 100644
index 0000000..05401df
--- /dev/null
+++ b/recipes/jlex/jlex_1.2.6.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "Lexical analyzer generator for Java"
+AUTHOR = "Elliot Berk, A. Appel, C. Scott Ananian"
+
+DEPENDS = "fastjar-native"
+RDEPENDS = "java2-runtime"
+
+inherit java-library
+
+SRC_URI = "\
+  http://www.cs.princeton.edu/~appel/modern/java/JLex/Archive/${PV}/Main.java \
+  file://jlex \
+  "
+
+S = "${WORKDIR}"
+
+do_configure() {
+  sed -i \
+    -e "s|OE_STAGING_BINDIR|${bindir}|" \
+    -e "s|OE_STAGING_DATADIR_JAVA|${datadir_java}|" \
+    -e "s|OE_JLEX_JAR|${BP}.jar|" \
+    ${WORKDIR}/jlex
+}
+
+do_compile() {
+	mkdir -p build
+
+	javac -d build Main.java
+
+	fastjar -C build -c -f ${BP}.jar .
+}
+
+do_install_append() {
+	install -d ${D}${bindir}
+	install -m 0755 jlex ${D}${bindir}/
+}
+
+PACKAGES = "${PN}"
+
+FILES_${PN} += "${datadir_java}"
-- 
1.7.0.4



