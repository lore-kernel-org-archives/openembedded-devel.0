Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1ObZxf-0006dK-A9
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 16:08:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 425EE4036DE67;
	Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 3984D4036DE66;
	Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H7CulfCIy5n8; Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id 04BBB40148CA4;
	Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1ObZxA-0006Tt-Uw; Wed, 21 Jul 2010 16:07:20 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 16:06:57 +0200
Message-Id: <1279721232-24744-7-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: henning@tarent.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Henning Heinold <h.heinold@tarent.de>
Subject: [PATCH 06/21] cup: backport from openembedded-dev
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
 recipes/cup/cup-native_0.10k.bb |   24 ++++++++++++++++++++++++
 recipes/cup/cup_0.10k.bb        |   39 +++++++++++++++++++++++++++++++++++++++
 recipes/cup/files/cup           |    5 +++++
 3 files changed, 68 insertions(+), 0 deletions(-)
 create mode 100644 recipes/cup/cup-native_0.10k.bb
 create mode 100644 recipes/cup/cup_0.10k.bb
 create mode 100755 recipes/cup/files/cup

diff --git a/recipes/cup/cup-native_0.10k.bb b/recipes/cup/cup-native_0.10k.bb
new file mode 100644
index 0000000..2eb325f
--- /dev/null
+++ b/recipes/cup/cup-native_0.10k.bb
@@ -0,0 +1,24 @@
+require cup_${PV}.bb
+
+inherit java-native
+
+DEPENDS += "virtual/java-native"
+RDEPENDS = ""
+
+do_configure() {
+	sed -i \
+		-e "s|OE_STAGING_BINDIR|${STAGING_BINDIR_NATIVE}|" \
+		-e "s|OE_STAGING_DATADIR_JAVA|${STAGING_DATADIR_JAVA_NATIVE}|" \
+		-e "s|OE_CUP_JAR|${BP}.jar|" \
+		${WORKDIR}/cup
+}
+
+do_install_append() {
+	:
+}
+
+do_stage_append() {
+  install -d ${STAGING_BINDIR}
+  install -m 0755 ${WORKDIR}/cup ${STAGING_BINDIR}
+}
+
diff --git a/recipes/cup/cup_0.10k.bb b/recipes/cup/cup_0.10k.bb
new file mode 100644
index 0000000..09d9644
--- /dev/null
+++ b/recipes/cup/cup_0.10k.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "Lexical analyzer generator for Java"
+AUTHOR = "Elliot Berk, A. Appel, C. Scott Ananian"
+
+DEPENDS = "virtual/javac-native fastjar-native"
+RDEPENDS = "java2-runtime"
+
+inherit java-library
+
+SRC_URI = "\
+	http://www.cs.princeton.edu/~appel/modern/java/CUP/java_${BPN}_v10k.tar.gz \
+	file://cup \
+	"
+
+S = "${WORKDIR}/java_cup"
+
+do_configure() {
+	sed -i \
+		-e "s|OE_STAGING_BINDIR|${bindir}|" \
+		-e "s|OE_STAGING_DATADIR_JAVA|${data_java}|" \
+		-e "s|OE_CUP_JAR|${BP}.jar|" \
+		${WORKDIR}/cup
+}
+
+do_compile() {
+	mkdir -p build
+
+	javac -d build `find . -name "*.java"`
+
+	fastjar -C build -c -f ${BP}.jar .
+}
+
+do_install_append() {
+	install -d ${D}${bindir}
+	install -m 0755 ${WORKDIR}/cup ${D}${bindir}
+}
+
+PACKAGES = "${PN}"
+
+FILES_${PN} += "${datadir_java}"
diff --git a/recipes/cup/files/cup b/recipes/cup/files/cup
new file mode 100755
index 0000000..34b4f05
--- /dev/null
+++ b/recipes/cup/files/cup
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+cp=OE_STAGING_DATADIR_JAVA/OE_CUP_JAR
+
+exec OE_STAGING_BINDIR/java -cp $cp java_cup.Main "$@"
-- 
1.7.0.4



