Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1ObZxm-0006lh-Hr
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 16:08:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id AB31D4036DE6B;
	Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id A378340148CA4;
	Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zesl1+b4zruO; Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id 4EF9A4036DE66;
	Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1ObZxB-0006U1-6P; Wed, 21 Jul 2010 16:07:21 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 16:07:00 +0200
Message-Id: <1279721232-24744-10-git-send-email-heinold@inf.fu-berlin.de>
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
Subject: [PATCH 09/21] jakarta-libs: backport from openembedded-dev
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

* checksums already in conf/checksums.ini
---
 .../avalon-framework-api-native_4.3.bb             |    4 +++
 recipes/jakarta-libs/avalon-framework-api_4.3.bb   |   28 ++++++++++++++++++++
 recipes/jakarta-libs/bsf-native_2.4.0.bb           |    8 +++++
 recipes/jakarta-libs/bsf_2.4.0.bb                  |   24 +++++++++++++++++
 recipes/jakarta-libs/log4j1.2-native_1.2.15.bb     |    6 ++++
 recipes/jakarta-libs/log4j1.2_1.2.15.bb            |   27 +++++++++++++++++++
 recipes/jakarta-libs/logkit-native_1.2.2.bb        |    6 ++++
 recipes/jakarta-libs/logkit_1.2.2.bb               |   25 +++++++++++++++++
 recipes/jakarta-libs/oro-native_2.0.8.bb           |    4 +++
 recipes/jakarta-libs/oro_2.0.8.bb                  |   19 +++++++++++++
 recipes/jakarta-libs/poi_3.0.bb                    |   24 +++++++++++++++++
 recipes/jakarta-libs/regexp-native_1.5.bb          |    4 +++
 recipes/jakarta-libs/regexp_1.5.bb                 |   19 +++++++++++++
 13 files changed, 198 insertions(+), 0 deletions(-)
 create mode 100644 recipes/jakarta-libs/avalon-framework-api-native_4.3.bb
 create mode 100644 recipes/jakarta-libs/avalon-framework-api_4.3.bb
 create mode 100644 recipes/jakarta-libs/bsf-native_2.4.0.bb
 create mode 100644 recipes/jakarta-libs/bsf_2.4.0.bb
 create mode 100644 recipes/jakarta-libs/log4j1.2-native_1.2.15.bb
 create mode 100644 recipes/jakarta-libs/log4j1.2_1.2.15.bb
 create mode 100644 recipes/jakarta-libs/logkit-native_1.2.2.bb
 create mode 100644 recipes/jakarta-libs/logkit_1.2.2.bb
 create mode 100644 recipes/jakarta-libs/oro-native_2.0.8.bb
 create mode 100644 recipes/jakarta-libs/oro_2.0.8.bb
 create mode 100644 recipes/jakarta-libs/poi_3.0.bb
 create mode 100644 recipes/jakarta-libs/regexp-native_1.5.bb
 create mode 100644 recipes/jakarta-libs/regexp_1.5.bb

diff --git a/recipes/jakarta-libs/avalon-framework-api-native_4.3.bb b/recipes/jakarta-libs/avalon-framework-api-native_4.3.bb
new file mode 100644
index 0000000..6733b34
--- /dev/null
+++ b/recipes/jakarta-libs/avalon-framework-api-native_4.3.bb
@@ -0,0 +1,4 @@
+require avalon-framework-api_${PV}.bb
+
+inherit java-native
+
diff --git a/recipes/jakarta-libs/avalon-framework-api_4.3.bb b/recipes/jakarta-libs/avalon-framework-api_4.3.bb
new file mode 100644
index 0000000..74ec2c4
--- /dev/null
+++ b/recipes/jakarta-libs/avalon-framework-api_4.3.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Common way for components to be created, initialized, configured, started. (API-only)"
+LICENSE = "AL2.0"
+AUTHOR = "Apache Software Foundation"
+
+SRC_URI = "\
+	http://www.apache.org/dist/excalibur/avalon-framework/source/${BP}-src.tar.gz \
+	http://www.apache.org/dist/avalon/logkit/source/logkit-1.2.2-src.tar.gz \
+	"
+
+inherit java-library
+
+DEPENDS = "fastjar-native"
+
+do_compile() {
+  mkdir -p build
+
+	#	Allow reaching method definitions from logkit (stupid cyclic dependency).
+	srcpath=src/java:${WORKDIR}/logkit-1.2.2-dev/src/java
+
+  javac -sourcepath $srcpath -d build `find src/java -name "*.java"`
+
+	# Remove classes that belong to logkit ...
+	rm -rf ${S}/build/org/apache/log
+
+  fastjar -C build -c -f ${JARFILENAME} .
+}
+
+
diff --git a/recipes/jakarta-libs/bsf-native_2.4.0.bb b/recipes/jakarta-libs/bsf-native_2.4.0.bb
new file mode 100644
index 0000000..9b3c1dd
--- /dev/null
+++ b/recipes/jakarta-libs/bsf-native_2.4.0.bb
@@ -0,0 +1,8 @@
+require bsf_${PV}.bb
+
+S = "${WORKDIR}/bsf-${PV}"
+
+inherit java-native
+
+DEPENDS = "fastjar-native jacl-native commons-logging-native rhino-native xalan-j-native bcel-native"
+
diff --git a/recipes/jakarta-libs/bsf_2.4.0.bb b/recipes/jakarta-libs/bsf_2.4.0.bb
new file mode 100644
index 0000000..e853ea1
--- /dev/null
+++ b/recipes/jakarta-libs/bsf_2.4.0.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Bean Scripting Framework package"
+LICENSES = "AL2.0"
+AUTHOR = "Apache Software Foundation"
+
+SRC_URI = "http://archive.apache.org/dist/jakarta/bsf/source/bsf-src-${PV}.tar.gz"
+
+inherit java-library
+
+DEPENDS = "fastjar-native jacl commons-logging rhino xalan-j bcel"
+
+do_compile() {
+  mkdir -p build
+
+  oe_makeclasspath cp -s commons-logging jacl rhino bcel xalan2
+  
+	# Remove netrexx and jython support
+  rm -Rf src/org/apache/bsf/engines/netrexx
+  rm -Rf src/org/apache/bsf/engines/jython
+
+  javac -sourcepath src -cp $cp -d build `find src -name "*.java"`
+
+  fastjar -C build -c -f ${JARFILENAME} .
+}
+
diff --git a/recipes/jakarta-libs/log4j1.2-native_1.2.15.bb b/recipes/jakarta-libs/log4j1.2-native_1.2.15.bb
new file mode 100644
index 0000000..49ccee1
--- /dev/null
+++ b/recipes/jakarta-libs/log4j1.2-native_1.2.15.bb
@@ -0,0 +1,6 @@
+require log4j1.2_${PV}.bb
+
+inherit java-native
+
+DEPENDS = "fastjar-native gnumail-native gnujaf-native"
+
diff --git a/recipes/jakarta-libs/log4j1.2_1.2.15.bb b/recipes/jakarta-libs/log4j1.2_1.2.15.bb
new file mode 100644
index 0000000..cb83afd
--- /dev/null
+++ b/recipes/jakarta-libs/log4j1.2_1.2.15.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Java library to help the programmer output log statements to a variety of output targets"
+LICENSE = "AL2.0"
+AUTHOR = "Apache Software Foundation"
+
+SRC_URI = "http://archive.apache.org/dist/logging/log4j/${PV}/apache-log4j-${PV}.tar.gz"
+
+inherit java-library
+
+S = "${WORKDIR}/apache-log4j-${PV}"
+
+DEPENDS = "fastjar-native gnumail gnujaf"
+
+JARFILENAME = "log4j-${PV}.jar"
+ALTJARFILENAMES = "log4j-1.2.jar log4j1.2.jar"
+
+do_compile() {
+  mkdir -p build
+
+  oe_makeclasspath cp -s activation gnumail
+
+  # Built everything but the JMS and JMX classes (like in Debian)
+	javac -sourcepath src/main/java -cp $cp -d build `find src/main/java -name "*.java" -and -not \( -iwholename "*jms*" -or -iwholename "*jmx*" \)`
+
+  cp -r src/main/resources/* build/
+
+  fastjar -C build -c -f ${JARFILENAME} .
+}
diff --git a/recipes/jakarta-libs/logkit-native_1.2.2.bb b/recipes/jakarta-libs/logkit-native_1.2.2.bb
new file mode 100644
index 0000000..479f597
--- /dev/null
+++ b/recipes/jakarta-libs/logkit-native_1.2.2.bb
@@ -0,0 +1,6 @@
+require logkit_${PV}.bb
+
+inherit java-native
+
+DEPENDS = "fastjar-native oro-native servlet2.3-native gnumail-native gnujaf-native log4j1.2-native avalon-framework-api-native"
+
diff --git a/recipes/jakarta-libs/logkit_1.2.2.bb b/recipes/jakarta-libs/logkit_1.2.2.bb
new file mode 100644
index 0000000..58d496c
--- /dev/null
+++ b/recipes/jakarta-libs/logkit_1.2.2.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Logging toolkit designed for secure performance orientated logging in Java applications"
+LICENSE = "AL2.0"
+AUTHOR = "Apache Software Foundation"
+
+SRC_URI = "http://www.apache.org/dist/avalon/logkit/source/${BP}-src.tar.gz"
+
+inherit java-library
+
+S = "${WORKDIR}/${BP}-dev"
+
+DEPENDS = "fastjar-native oro servlet2.3 gnumail gnujaf log4j1.2 avalon-framework-api"
+
+do_compile() {
+  mkdir -p build
+
+  oe_makeclasspath cp -s oro servlet-2.3 activation gnumail log4j-1.2 avalon-framework-api
+
+  # Built everything but the JMS and JMX classes (like in Debian)
+  javac -encoding ISO8859-1 -sourcepath src/java -cp $cp -d build \
+    `find src/java -name \*.java -and -not \( -iwholename "*jms*" -or -wholename "*test*" \)`
+
+  (cd src/java && find . -name "*.properties" -exec cp {} ../../build/{} \;)
+
+  fastjar -C build -c -f ${JARFILENAME} .
+}
diff --git a/recipes/jakarta-libs/oro-native_2.0.8.bb b/recipes/jakarta-libs/oro-native_2.0.8.bb
new file mode 100644
index 0000000..2630ed9
--- /dev/null
+++ b/recipes/jakarta-libs/oro-native_2.0.8.bb
@@ -0,0 +1,4 @@
+require oro_${PV}.bb
+
+inherit java-native
+
diff --git a/recipes/jakarta-libs/oro_2.0.8.bb b/recipes/jakarta-libs/oro_2.0.8.bb
new file mode 100644
index 0000000..47ee9f2
--- /dev/null
+++ b/recipes/jakarta-libs/oro_2.0.8.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Perl5-compatible regular expressions library for Java"
+LICENSE = "AL2.0"
+AUTHOR = "Apache Software Foundation"
+
+SRC_URI = "http://www.apache.org/dist/jakarta/oro/source/jakarta-${BP}.tar.gz"
+
+inherit java-library
+
+S = "${WORKDIR}/jakarta-${BP}"
+
+DEPENDS = "fastjar-native"
+
+do_compile() {
+  mkdir -p build
+
+  javac -sourcepath src/java -d build `find src/java -name \*.java`
+
+  fastjar -C build -c -f ${JARFILENAME} org
+}
diff --git a/recipes/jakarta-libs/poi_3.0.bb b/recipes/jakarta-libs/poi_3.0.bb
new file mode 100644
index 0000000..9538861
--- /dev/null
+++ b/recipes/jakarta-libs/poi_3.0.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Java library for manipulating various file formats based upon Microsoft's OLE 2 Compound Document"
+LICENSE = "AL2.0"
+AUTHOR = "Apache Software Foundation"
+
+SRC_URI = "http://www.apache.org/dist/jakarta/poi/release/src/${BPN}-src-${PV}-FINAL-20070503.tar.gz"
+
+S = "${WORKDIR}/${BPN}-3.0-rc4"
+
+inherit java-library
+
+DEPENDS = "fastjar-native commons-collections3 commons-logging commons-lang commons-beanutils log4j1.2 xalan-j"
+
+do_compile() {
+  mkdir -p build
+
+  oe_makeclasspath cp -s commons-collections3 commons-logging commons-lang commons-beanutils log4j-1.2 xalan2
+
+  javac -sourcepath src/java -cp $cp -d build \
+    `find src/java -name \*.java`
+
+  (cd src/java && find . -name "*.properties" -exec cp {} ../../build/{} \;)
+
+  fastjar -C build -c -f ${JARFILENAME} .
+}
diff --git a/recipes/jakarta-libs/regexp-native_1.5.bb b/recipes/jakarta-libs/regexp-native_1.5.bb
new file mode 100644
index 0000000..679da37
--- /dev/null
+++ b/recipes/jakarta-libs/regexp-native_1.5.bb
@@ -0,0 +1,4 @@
+require regexp_${PV}.bb
+
+inherit java-native
+
diff --git a/recipes/jakarta-libs/regexp_1.5.bb b/recipes/jakarta-libs/regexp_1.5.bb
new file mode 100644
index 0000000..9ae6c35
--- /dev/null
+++ b/recipes/jakarta-libs/regexp_1.5.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Java Regular Expression package"
+LICENSE = "AL2.0"
+AUTHOR = "Apache Software Foundation"
+
+SRC_URI = "http://archive.apache.org/dist/jakarta/regexp/source/jakarta-${BP}.tar.gz"
+
+inherit java-library
+
+S = "${WORKDIR}/jakarta-${BP}"
+
+DEPENDS = "fastjar-native"
+
+do_compile() {
+  mkdir -p build
+
+  javac -sourcepath src/java -d build `find src/java -name \*.java`
+
+  fastjar -C build -c -f ${JARFILENAME} .
+}
-- 
1.7.0.4



