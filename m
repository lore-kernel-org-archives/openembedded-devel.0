Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1ObZxs-0006mP-M7
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 16:08:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 0FDBB4036DE68;
	Wed, 21 Jul 2010 16:07:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 07E144036DE6D;
	Wed, 21 Jul 2010 16:07:24 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z0CCl3In5PiF; Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id B64914036DE68;
	Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1ObZxB-0006U4-8a; Wed, 21 Jul 2010 16:07:21 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 16:07:01 +0200
Message-Id: <1279721232-24744-11-git-send-email-heinold@inf.fu-berlin.de>
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
Subject: [PATCH 10/21] xml-commons: backport from openembedded-dev
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
X-List-Received-Date: Wed, 21 Jul 2010 14:08:38 -0000

From: Henning Heinold <h.heinold@tarent.de>

* checksums already in conf/checksums.ini
---
 recipes/xml-commons/jaxp1.3-native_1.3.04.bb       |    4 ++
 recipes/xml-commons/jaxp1.3_1.3.04.bb              |   24 +++++++++++++
 .../xml-commons-resolver1.1-native_1.2.bb          |    6 +++
 recipes/xml-commons/xml-commons-resolver1.1_1.2.bb |   35 ++++++++++++++++++++
 4 files changed, 69 insertions(+), 0 deletions(-)
 create mode 100644 recipes/xml-commons/jaxp1.3-native_1.3.04.bb
 create mode 100644 recipes/xml-commons/jaxp1.3_1.3.04.bb
 create mode 100644 recipes/xml-commons/xml-commons-resolver1.1-native_1.2.bb
 create mode 100644 recipes/xml-commons/xml-commons-resolver1.1_1.2.bb

diff --git a/recipes/xml-commons/jaxp1.3-native_1.3.04.bb b/recipes/xml-commons/jaxp1.3-native_1.3.04.bb
new file mode 100644
index 0000000..ae94b80
--- /dev/null
+++ b/recipes/xml-commons/jaxp1.3-native_1.3.04.bb
@@ -0,0 +1,4 @@
+require jaxp1.3_${PV}.bb
+
+inherit java-native
+
diff --git a/recipes/xml-commons/jaxp1.3_1.3.04.bb b/recipes/xml-commons/jaxp1.3_1.3.04.bb
new file mode 100644
index 0000000..f66ae57
--- /dev/null
+++ b/recipes/xml-commons/jaxp1.3_1.3.04.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Java XML parser and transformer APIs (DOM, SAX, JAXP, TrAX)"
+LICENSES = "AL2.0 W3C Public Domain"
+AUTHOR = "Apache Software Foundation"
+
+SRC_URI = "http://archive.apache.org/dist/xml/commons/source/xml-commons-external-${PV}-src.tar.gz"
+
+inherit java-library
+
+S = "${WORKDIR}"
+
+DEPENDS = "fastjar-native"
+
+JARFILENAME = "jaxp-1.3.jar"
+ALTJARFILENAMES = "xml-apis.jar"
+
+do_compile() {
+  mkdir -p build/license
+  javac -d build `find javax org -name \*.java`
+
+  cp LICENSE.*.txt README.*.txt build/license
+
+  fastjar -c -m manifest.commons -f ${JARFILENAME} -C build .
+}
+
diff --git a/recipes/xml-commons/xml-commons-resolver1.1-native_1.2.bb b/recipes/xml-commons/xml-commons-resolver1.1-native_1.2.bb
new file mode 100644
index 0000000..382be43
--- /dev/null
+++ b/recipes/xml-commons/xml-commons-resolver1.1-native_1.2.bb
@@ -0,0 +1,6 @@
+require xml-commons-resolver1.1_${PV}.bb
+
+inherit java-native
+
+DEPENDS = "fastjar-native jaxp1.3-native"
+
diff --git a/recipes/xml-commons/xml-commons-resolver1.1_1.2.bb b/recipes/xml-commons/xml-commons-resolver1.1_1.2.bb
new file mode 100644
index 0000000..9059dba
--- /dev/null
+++ b/recipes/xml-commons/xml-commons-resolver1.1_1.2.bb
@@ -0,0 +1,35 @@
+DESCRIPTION = "Library to resolve various public or system identifiers into accessible URLs (Java)"
+LICENSES = "AL2.0"
+AUTHOR = "Apache Software Foundation"
+
+SRC_URI = "http://archive.apache.org/dist/xml/commons/xml-commons-resolver-${PV}.tar.gz"
+
+inherit java-library
+
+S = "${WORKDIR}/xml-commons-resolver-${PV}"
+
+DEPENDS = "fastjar-native jaxp1.3"
+
+do_unpackpost() {
+  find src -exec \
+    sed -i -e "s|@impl.name@|XmlResolver|" \
+           -e "s|@impl.version@|1.2|" {} \;
+}
+
+addtask unpackpost after do_unpack before do_patch
+
+JARFILENAME = "resolver.jar"
+ALTJARFILENAMES = ""
+
+do_compile() {
+  mkdir -p build
+
+  cp=${STAGING_DATADIR_JAVA}/jaxp1.3.jar
+
+  javac -sourcepath src -d build -classpath $cp `find src -name "*.java" -and -not  -wholename "*tests*"`
+
+  (cd src && find org -name "*.xml" -o -name "*.txt" -o -name "*.src" -exec cp {} ../build/{} \;)
+
+  fastjar -C build -c -m src/manifest.resolver -f ${JARFILENAME} org
+}
+
-- 
1.7.0.4



