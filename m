Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1ObZxq-0006dK-Ix
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 16:08:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id F0FE64036DE6C;
	Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id E92B94036DE6D;
	Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5GX9RWqvPZpA; Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id B1A584036DE6C;
	Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1ObZxB-0006UD-HN; Wed, 21 Jul 2010 16:07:21 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 16:07:04 +0200
Message-Id: <1279721232-24744-14-git-send-email-heinold@inf.fu-berlin.de>
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
Subject: [PATCH 13/21] xalan-j: backport from openembedded-dev
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
X-List-Received-Date: Wed, 21 Jul 2010 14:08:32 -0000

From: Henning Heinold <h.heinold@tarent.de>

* checksum already in conf/checksums.ini
---
 recipes/xalan-j/xalan-j-native_2.7.1.bb |   14 +++++++
 recipes/xalan-j/xalan-j_2.7.1.bb        |   57 +++++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+), 0 deletions(-)
 create mode 100644 recipes/xalan-j/xalan-j-native_2.7.1.bb
 create mode 100644 recipes/xalan-j/xalan-j_2.7.1.bb

diff --git a/recipes/xalan-j/xalan-j-native_2.7.1.bb b/recipes/xalan-j/xalan-j-native_2.7.1.bb
new file mode 100644
index 0000000..371362a
--- /dev/null
+++ b/recipes/xalan-j/xalan-j-native_2.7.1.bb
@@ -0,0 +1,14 @@
+require xalan-j_${PV}.bb
+
+DEPENDS = "\
+	fastjar-native \
+	xerces-j-native regexp-native jlex-native cup-native jaxp1.3-native bcel-native \
+	"
+
+inherit java-native
+
+
+do_install_append() {
+	:
+}
+
diff --git a/recipes/xalan-j/xalan-j_2.7.1.bb b/recipes/xalan-j/xalan-j_2.7.1.bb
new file mode 100644
index 0000000..2d6d885
--- /dev/null
+++ b/recipes/xalan-j/xalan-j_2.7.1.bb
@@ -0,0 +1,57 @@
+DESCRIPTION = "Java XSLT processor"
+LICENSE = "AL2.0"
+
+AUTHOR = "Apache Software Foundation"
+HOMEPAGE = "http://xml.apache.org/xalan-j
+
+DEPENDS = "fastjar-native xerces-j regexp jlex cup jaxp1.3 bcel"
+
+SRC_URI = "\
+	http://archive.apache.org/dist/xml/${BPN}/${BPN}_2_7_1-src.tar.gz \
+	http://archive.apache.org/dist/jakarta/bsf/source/bsf-src-2.4.0.tar.gz \
+	"
+
+S = "${WORKDIR}/${BPN}_2_7_1"
+
+inherit java-library
+
+JPN = "libxalan2-java"
+
+JARFILENAME = "xalan2-${PV}.jar"
+ALTJARFILENAMES = "xalan2.jar"
+
+do_compile() {
+  mkdir -p build
+
+  oe_makeclasspath cp -s xercesImpl regexp jlex cup bcel jaxp-1.3
+	scp="src:${WORKDIR}/bsf-2.4.0/src"
+
+  javac -J-Xmx512M -sourcepath $scp -cp $cp -d build `find src -name \*.java`
+  (cd src && find org -name "*.properties" -exec cp {} ../build/{} \;)
+
+  # Remove BSF classes
+  rm -rf build-xalan/org/apache/bsf
+
+  mkdir -p build-serializer/org/apache/xml
+  mv build/org/apache/xml/serializer build-serializer/org/apache/xml
+
+  fastjar -C build -c -f ${JARFILENAME} .
+  fastjar -C build-serializer -c -f serializer-${PV}.jar .
+}
+
+do_install_append() {
+  oe_jarinstall serializer-${PV}.jar serializer.jar
+
+  # Like Debian we provide a symlink called xml-apis pointing to the JAXP
+  # classes.
+  ln -sf ${D}${datadir_java}/xml-apis.jar jaxp-1.3.jar
+}
+
+do_stage_append() {
+	oe_jarinstall -s serializer-${PV}.jar serializer.jar
+}
+
+PACKAGES = "libxalan2-serializer-java ${JPN}"
+
+FILES_libxalan2-serializer-java = "${datadir_java}/serializer*.jar"
+
-- 
1.7.0.4



