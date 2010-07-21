Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1ObZxO-0006V9-96
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 16:08:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 76D4A4000786E;
	Wed, 21 Jul 2010 16:07:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 6E72440148CAA;
	Wed, 21 Jul 2010 16:07:22 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xMdXNRe1ITt6; Wed, 21 Jul 2010 16:07:22 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id 41D4D4000786E;
	Wed, 21 Jul 2010 16:07:22 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1ObZxA-0006TO-7W; Wed, 21 Jul 2010 16:07:20 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 16:06:52 +0200
Message-Id: <1279721232-24744-2-git-send-email-heinold@inf.fu-berlin.de>
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
Subject: [PATCH 01/21] ant: backport from openembedded-dev
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
X-List-Received-Date: Wed, 21 Jul 2010 14:08:26 -0000

From: Henning Heinold <h.heinold@tarent.de>

---
 conf/checksums.ini              |    4 ++
 recipes/ant/ant-native_1.7.1.bb |   64 +++++++++++++++++++++++++++++++++++++++
 recipes/ant/files/ant           |   10 ++++++
 3 files changed, 78 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ant/ant-native_1.7.1.bb
 create mode 100755 recipes/ant/files/ant

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 909ade7..2c18f2e 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -1622,6 +1622,10 @@ sha256=4dc49a7260ef90a6dc6611b7e96b9f047d507589736d4a2ad6efbe3edfc6fba6
 md5=2a44ff60456cf67bb83771cfcedb8e33
 sha256=1a2fceea38f04e6fea0c0cb8ad7312dc948004af4d9308b5e630d299d89dfb38
 
+[http://archive.apache.org/dist/ant/source/apache-ant-1.7.1-src.tar.gz] 
+md5=2a44ff60456cf67bb83771cfcedb8e33 
+sha256=1a2fceea38f04e6fea0c0cb8ad7312dc948004af4d9308b5e630d299d89dfb38
+
 [http://archive.apache.org/dist/logging/log4j/1.2.15/apache-log4j-1.2.15.tar.gz]
 md5=10f04abe4d68d5a89e8eb167e4e45e1a
 sha256=f5d9f6aa78b9156ae2de2a32d0f26507d2e73db4993d501db2e79f0bd803ab31
diff --git a/recipes/ant/ant-native_1.7.1.bb b/recipes/ant/ant-native_1.7.1.bb
new file mode 100644
index 0000000..68201d3
--- /dev/null
+++ b/recipes/ant/ant-native_1.7.1.bb
@@ -0,0 +1,64 @@
+DESCRIPTION = "Another Neat Tool - build system for Java"
+LICENSE = "AL2.0"
+
+AUTHOR = "Apache Software Foundation"
+HOMEPAGE = "http://ant.apache.org"
+
+SRC_URI = "\
+	http://archive.apache.org/dist/ant/source/apache-ant-${PV}-src.tar.gz \
+	file://ant \
+	"
+
+S = "${WORKDIR}/apache-ant-${PV}"
+
+inherit java-library java-native
+
+DEPENDS = "\
+	fastjar-native \
+	jsch-native bsf-native xalan-j-native xerces-j-native \
+	xml-commons-resolver1.1-native gnumail-native gnujaf-native \
+	bcel-native regexp-native log4j1.2-native antlr-native oro-native \
+	junit-native jdepend-native commons-net-native commons-logging-native \
+	"
+
+do_removecruft() {
+	# Removes thing that need proprietary Jar files or are otherwise problematic
+	rm -rf ${S}/src/main/org/apache/tools/ant/taskdefs/optional/image
+	rm -rf ${S}/src/main/org/apache/tools/ant/types/optional/image
+	rm -rf ${S}/src/main/org/apache/tools/ant/taskdefs/optional/ejb
+	rm -rf ${S}/src/main/org/apache/tools/ant/taskdefs/optional/scm
+	rm -rf ${S}/src/main/org/apache/tools/ant/taskdefs/optional/starteam
+	rm -rf ${S}/src/main/org/apache/tools/ant/taskdefs/optional/NetRexxC.java
+}
+
+addtask removecruft before do_patch after do_unpack
+
+do_compile() {
+  mkdir -p build
+
+  oe_makeclasspath cp -s jsch bsf xalan2 xercesImpl resolver gnumail gnujaf bcel regexp log4j1.2 antlr oro junit jdepend commons-net commons-logging
+  cp=build:$cp
+
+  find src/main -name "*.java" > java_files
+
+  javac -sourcepath src/main -cp $cp -d build @java_files
+
+  mkdir -p build/org/apache/tools/ant/types/conditions
+
+  cp -r src/resources/org build/
+  (cd src/main && find . \( -name "*.properties" -or -name "*.xml" -or -name "*.mf" \) -exec cp {} ../../build/{} \;)
+
+  echo "VERSION=${PV}" > build/org/apache/tools/ant/version.txt
+  echo "DATE=`date -R`" >> build/org/apache/tools/ant/version.txt
+
+  fastjar -C build -c -f ${JARFILENAME} .
+
+  oe_makeclasspath cp -s ecj-bootstrap jsch bsf xalan2 xercesImpl resolver gnumail gnujaf bcel regexp log4j1.2 antlr oro junit jdepend commons-net commons-logging
+  cp=${STAGING_DATADIR_JAVA_NATIVE}/ant.jar:${STAGING_DATADIR}/classpath/tools.zip:$cp
+  sed -i -e"s|@JAR_FILE@|$cp|" ${WORKDIR}/ant
+}
+
+do_stage_append() {
+	install -d ${bindir}
+	install -m 0755 ${WORKDIR}/ant ${bindir}
+}
diff --git a/recipes/ant/files/ant b/recipes/ant/files/ant
new file mode 100755
index 0000000..bb282a9
--- /dev/null
+++ b/recipes/ant/files/ant
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+export CLASSPATH
+CLASSPATH=$CLASSPATH:@JAR_FILE@
+
+if [ ! $JAVA ];then
+	JAVA=java
+fi
+
+$JAVA org.apache.tools.ant.launch.Launcher $*
-- 
1.7.0.4



