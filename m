Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1ObZxo-0006lg-Ka
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 16:08:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id A77A94036DE66;
	Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 9F9104036DE6A;
	Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LzcyADaYPvuM; Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id 3C9F640148CA4;
	Wed, 21 Jul 2010 16:07:23 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1ObZxB-0006Tz-4O; Wed, 21 Jul 2010 16:07:21 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 16:06:59 +0200
Message-Id: <1279721232-24744-9-git-send-email-heinold@inf.fu-berlin.de>
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
Subject: [PATCH 08/21] jakarta-commons: backport from openembedded-dev
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

* checksums already in conf/checksums.ini
---
 recipes/jakarta-commons/commons-beanutils_1.8.0.bb |   10 +++
 recipes/jakarta-commons/commons-cli_1.1.bb         |    7 ++
 recipes/jakarta-commons/commons-codec_1.3.bb       |    7 ++
 .../jakarta-commons/commons-collections3_3.2.1.bb  |    8 +++
 .../jakarta-commons/commons-collections_2.1.1.bb   |    6 ++
 .../jakarta-commons/commons-configuration_1.5.bb   |   19 ++++++
 recipes/jakarta-commons/commons-digester_1.8.bb    |   12 ++++
 recipes/jakarta-commons/commons-discovery_0.4.bb   |   10 +++
 recipes/jakarta-commons/commons-el_1.0.bb          |   14 +++++
 .../jakarta-commons/commons-fileupload_1.2.1.bb    |   14 +++++
 recipes/jakarta-commons/commons-httpclient_3.1.bb  |   13 ++++
 recipes/jakarta-commons/commons-io_1.4.bb          |    5 ++
 recipes/jakarta-commons/commons-jxpath_1.3.bb      |   10 +++
 recipes/jakarta-commons/commons-lang_2.4.bb        |    6 ++
 .../commons-logging-native_1.1.1.bb                |    6 ++
 recipes/jakarta-commons/commons-logging_1.1.1.bb   |   12 ++++
 .../jakarta-commons/commons-net-native_1.4.1.bb    |    7 ++
 recipes/jakarta-commons/commons-net_1.4.1.bb       |   14 +++++
 recipes/jakarta-commons/commons-pool_1.4.bb        |    5 ++
 recipes/jakarta-commons/jakarta-commons.inc        |   62 ++++++++++++++++++++
 20 files changed, 247 insertions(+), 0 deletions(-)
 create mode 100644 recipes/jakarta-commons/commons-beanutils_1.8.0.bb
 create mode 100644 recipes/jakarta-commons/commons-cli_1.1.bb
 create mode 100644 recipes/jakarta-commons/commons-codec_1.3.bb
 create mode 100644 recipes/jakarta-commons/commons-collections3_3.2.1.bb
 create mode 100644 recipes/jakarta-commons/commons-collections_2.1.1.bb
 create mode 100644 recipes/jakarta-commons/commons-configuration_1.5.bb
 create mode 100644 recipes/jakarta-commons/commons-digester_1.8.bb
 create mode 100644 recipes/jakarta-commons/commons-discovery_0.4.bb
 create mode 100644 recipes/jakarta-commons/commons-el_1.0.bb
 create mode 100644 recipes/jakarta-commons/commons-fileupload_1.2.1.bb
 create mode 100644 recipes/jakarta-commons/commons-httpclient_3.1.bb
 create mode 100644 recipes/jakarta-commons/commons-io_1.4.bb
 create mode 100644 recipes/jakarta-commons/commons-jxpath_1.3.bb
 create mode 100644 recipes/jakarta-commons/commons-lang_2.4.bb
 create mode 100644 recipes/jakarta-commons/commons-logging-native_1.1.1.bb
 create mode 100644 recipes/jakarta-commons/commons-logging_1.1.1.bb
 create mode 100644 recipes/jakarta-commons/commons-net-native_1.4.1.bb
 create mode 100644 recipes/jakarta-commons/commons-net_1.4.1.bb
 create mode 100644 recipes/jakarta-commons/commons-pool_1.4.bb
 create mode 100644 recipes/jakarta-commons/jakarta-commons.inc

diff --git a/recipes/jakarta-commons/commons-beanutils_1.8.0.bb b/recipes/jakarta-commons/commons-beanutils_1.8.0.bb
new file mode 100644
index 0000000..092752a
--- /dev/null
+++ b/recipes/jakarta-commons/commons-beanutils_1.8.0.bb
@@ -0,0 +1,10 @@
+require jakarta-commons.inc
+
+DESCRIPTION = "Static utility methods useful in manipulating Java classes that conform to the JavaBeans Specification"
+
+SRC_URI = "http://www.apache.org/dist/commons/beanutils/source/${BP}-src.tar.gz"
+
+DEPENDS += "commons-collections3 commons-logging"
+RDEPENDS = "libcommons-collections3-java libcommons-logging-java"
+
+CP = "commons-collections3 commons-logging"
diff --git a/recipes/jakarta-commons/commons-cli_1.1.bb b/recipes/jakarta-commons/commons-cli_1.1.bb
new file mode 100644
index 0000000..ca09789
--- /dev/null
+++ b/recipes/jakarta-commons/commons-cli_1.1.bb
@@ -0,0 +1,7 @@
+require jakarta-commons.inc
+
+DESCRIPTION = "Java argument parsing helper classes"
+
+SRC_URI = "http://www.apache.org/dist/commons/cli/source/${BP}-src.tar.gz"
+
+
diff --git a/recipes/jakarta-commons/commons-codec_1.3.bb b/recipes/jakarta-commons/commons-codec_1.3.bb
new file mode 100644
index 0000000..9ad18a1
--- /dev/null
+++ b/recipes/jakarta-commons/commons-codec_1.3.bb
@@ -0,0 +1,7 @@
+require jakarta-commons.inc
+
+DESCRIPTION = "Java library with simple encoder and decoders for various formats such as Base64 and Hexadecimal"
+
+SRC_URI = "http://www.apache.org/dist/commons/codec/source/${BP}-src.tar.gz"
+
+S = "${WORKDIR}/${BP}"
diff --git a/recipes/jakarta-commons/commons-collections3_3.2.1.bb b/recipes/jakarta-commons/commons-collections3_3.2.1.bb
new file mode 100644
index 0000000..dcde0c7
--- /dev/null
+++ b/recipes/jakarta-commons/commons-collections3_3.2.1.bb
@@ -0,0 +1,8 @@
+require jakarta-commons.inc
+
+DESCRIPTION = "A set of abstract data type interfaces and implementations that offer a wealth of useful functionality and a solid foundation for extending that functionality"
+
+SRC_URI = "http://www.apache.org/dist/commons/collections/source/commons-collections-${PV}-src.tar.gz"
+
+S = "${WORKDIR}/commons-collections-${PV}-src"
+
diff --git a/recipes/jakarta-commons/commons-collections_2.1.1.bb b/recipes/jakarta-commons/commons-collections_2.1.1.bb
new file mode 100644
index 0000000..23766ab
--- /dev/null
+++ b/recipes/jakarta-commons/commons-collections_2.1.1.bb
@@ -0,0 +1,6 @@
+require jakarta-commons.inc
+
+DESCRIPTION = "A set of abstract data type interfaces and implementations that offer a wealth of useful functionality and a solid foundation for extending that functionality"
+
+SRC_URI = "http://www.apache.org/dist/commons/collections/source/${BP}-src.tar.gz"
+
diff --git a/recipes/jakarta-commons/commons-configuration_1.5.bb b/recipes/jakarta-commons/commons-configuration_1.5.bb
new file mode 100644
index 0000000..b30b8d9
--- /dev/null
+++ b/recipes/jakarta-commons/commons-configuration_1.5.bb
@@ -0,0 +1,19 @@
+require jakarta-commons.inc
+
+DESCRIPTION = "Generic configuration interface for Java applications"
+
+SRC_URI = "\
+	http://www.apache.org/dist/commons/configuration/source/${BP}-src.tar.gz \
+	http://ftp.hosting-studio.de/pub/linux/apache/ant/source/apache-ant-1.7.1-src.tar.bz2 \
+"
+
+DEPENDS += "commons-logging commons-collections3 commons-beanutils commons-codec commons-digester commons-jxpath commons-lang servlet2.4"
+RDEPENDS = "libcommons-logging-java libcommons-collections3-java libcommons-beanutils-java libcommons-codec-java libcommons-digester-java libcommons-jxpath-java libcommons-lang-java libservlet2.4-java"
+
+CP = "commons-logging commons-collections3 commons-beanutils commons-codec commons-digester commons-jxpath commons-lang servlet-api-2.4"
+
+# Makes use of -sourcepath hack: We inject Ant sourcefiles into the build and remove them
+# afterwards.
+COMPILE_SOURCEPATH = "${WORKDIR}/apache-ant-1.7.1/src/main:src/java"
+
+CLEAN_PATH = "build/org/apache/tools"
diff --git a/recipes/jakarta-commons/commons-digester_1.8.bb b/recipes/jakarta-commons/commons-digester_1.8.bb
new file mode 100644
index 0000000..28bcef3
--- /dev/null
+++ b/recipes/jakarta-commons/commons-digester_1.8.bb
@@ -0,0 +1,12 @@
+require jakarta-commons.inc
+
+DESCRIPTION = "Converts XML to a Java object by a set of mapping rules."
+
+SRC_URI = "http://www.apache.org/dist/commons/digester/source/${BP}-src.tar.gz"
+
+DEPENDS += "commons-logging commons-beanutils"
+RDEPENDS = "libcommons-logging-java libcommons-beanutils-java"
+
+CP = "commons-logging commons-beanutils"
+
+FINDARGS = "-name '*.dtd'"
diff --git a/recipes/jakarta-commons/commons-discovery_0.4.bb b/recipes/jakarta-commons/commons-discovery_0.4.bb
new file mode 100644
index 0000000..a16fb5e
--- /dev/null
+++ b/recipes/jakarta-commons/commons-discovery_0.4.bb
@@ -0,0 +1,10 @@
+require jakarta-commons.inc
+
+DESCRIPTION = "discovering, or finding, implementations for pluggable interfaces"
+
+SRC_URI = "http://www.apache.org/dist/commons/discovery/source/${BP}-src.tar.gz"
+
+DEPENDS += "commons-logging"
+RDEPENDS = "libcommons-logging-java"
+
+CP = "commons-logging"
diff --git a/recipes/jakarta-commons/commons-el_1.0.bb b/recipes/jakarta-commons/commons-el_1.0.bb
new file mode 100644
index 0000000..03d2a9b
--- /dev/null
+++ b/recipes/jakarta-commons/commons-el_1.0.bb
@@ -0,0 +1,14 @@
+require jakarta-commons.inc
+
+DESCRIPTION = "Implementation of the JSP2.0 Expression Language API"
+
+SRC_URI = "http://www.apache.org/dist/commons/el/source/${BP}-src.tar.gz"
+
+DEPENDS += "jsp2.0 servlet2.4"
+RDEPENDS = "libjsp2.0-java libservlet2.4-java"
+
+CP = "jsp-api-2.0 servlet-api-2.4"
+
+FINDARGS = "\( -name '*.properties' -or -name '*.jj' \)"
+
+
diff --git a/recipes/jakarta-commons/commons-fileupload_1.2.1.bb b/recipes/jakarta-commons/commons-fileupload_1.2.1.bb
new file mode 100644
index 0000000..063a14b
--- /dev/null
+++ b/recipes/jakarta-commons/commons-fileupload_1.2.1.bb
@@ -0,0 +1,14 @@
+require jakarta-commons.inc
+
+DESCRIPTION = "Robust, high-performance, file upload capability for Java servlets and web applications"
+
+SRC_URI = "http://www.apache.org/dist/commons/fileupload/source/${BP}-src.tar.gz"
+
+DEPENDS += "commons-beanutils commons-io servlet2.3"
+RDEPENDS = "libcommons-beanutils-java libcommons-io-java libservlet2.3-java"
+
+CP = "commons-beanutils commons-io servlet-2.3"
+
+# Exclude portlet stuff from compilation like Debian does.
+COMPILE_FINDARGS = "-name '*.java' -not -wholename '*portlet*'"
+
diff --git a/recipes/jakarta-commons/commons-httpclient_3.1.bb b/recipes/jakarta-commons/commons-httpclient_3.1.bb
new file mode 100644
index 0000000..18e2980
--- /dev/null
+++ b/recipes/jakarta-commons/commons-httpclient_3.1.bb
@@ -0,0 +1,13 @@
+require jakarta-commons.inc
+
+DESCRIPTION = "Efficient, up-to-date, and feature-rich package implementing the client side of the most recent HTTP standards and recommendations"
+
+SRC_URI = "http://www.apache.org/dist/httpcomponents/commons-httpclient/source/${BP}-src.tar.gz"
+
+S = "${WORKDIR}/${BP}"
+
+DEPENDS += "commons-logging commons-codec"
+RDEPENDS = "libcommons-logging-java libcommons-codec-java"
+
+CP = "commons-logging commons-codec"
+
diff --git a/recipes/jakarta-commons/commons-io_1.4.bb b/recipes/jakarta-commons/commons-io_1.4.bb
new file mode 100644
index 0000000..76fdec8
--- /dev/null
+++ b/recipes/jakarta-commons/commons-io_1.4.bb
@@ -0,0 +1,5 @@
+require jakarta-commons.inc
+
+DESCRIPTION = "Java library with utility classes, stream implementations, file filters and endian classes"
+
+SRC_URI = "http://www.apache.org/dist/commons/io/source/${BP}-src.tar.gz"
diff --git a/recipes/jakarta-commons/commons-jxpath_1.3.bb b/recipes/jakarta-commons/commons-jxpath_1.3.bb
new file mode 100644
index 0000000..5fabef0
--- /dev/null
+++ b/recipes/jakarta-commons/commons-jxpath_1.3.bb
@@ -0,0 +1,10 @@
+require jakarta-commons.inc
+
+DESCRIPTION = "JXPath interpreter for Java"
+
+SRC_URI = "http://www.apache.org/dist/commons/jxpath/source/${BP}-src.tar.gz"
+
+DEPENDS += "commons-logging commons-collections3 commons-beanutils servlet2.3 jdom"
+RDEPENDS = "libcommons-logging-java libcommons-collections3-java libcommons-beanutils-java libservlet2.3-java libjdom-java"
+
+CP = "commons-logging commons-collections3 commons-beanutils servlet-2.3 jdom"
diff --git a/recipes/jakarta-commons/commons-lang_2.4.bb b/recipes/jakarta-commons/commons-lang_2.4.bb
new file mode 100644
index 0000000..2b7e698
--- /dev/null
+++ b/recipes/jakarta-commons/commons-lang_2.4.bb
@@ -0,0 +1,6 @@
+require jakarta-commons.inc
+
+DESCRIPTION = "Set of Java classes that provide helper methods for the standard java.lang classes"
+
+SRC_URI = "http://www.apache.org/dist/commons/lang/source/${BP}-src.tar.gz"
+
diff --git a/recipes/jakarta-commons/commons-logging-native_1.1.1.bb b/recipes/jakarta-commons/commons-logging-native_1.1.1.bb
new file mode 100644
index 0000000..8437501
--- /dev/null
+++ b/recipes/jakarta-commons/commons-logging-native_1.1.1.bb
@@ -0,0 +1,6 @@
+require commons-logging_${PV}.bb
+
+inherit java-native
+
+DEPENDS = "fastjar-native log4j1.2-native servlet2.3-native logkit-native"
+
diff --git a/recipes/jakarta-commons/commons-logging_1.1.1.bb b/recipes/jakarta-commons/commons-logging_1.1.1.bb
new file mode 100644
index 0000000..f1d94eb
--- /dev/null
+++ b/recipes/jakarta-commons/commons-logging_1.1.1.bb
@@ -0,0 +1,12 @@
+require jakarta-commons.inc
+
+DESCRIPTION = "Java Internet protocol suite library"
+
+SRC_URI = "http://www.apache.org/dist/commons/logging/source/${BP}-src.tar.gz"
+
+DEPENDS += "log4j1.2 servlet2.3 logkit"
+
+CP = "log4j-1.2 servlet-2.3 logkit"
+
+COMPILE_FINDARGS = "-name '*.java' -and -not -name '*Avalon*'"
+
diff --git a/recipes/jakarta-commons/commons-net-native_1.4.1.bb b/recipes/jakarta-commons/commons-net-native_1.4.1.bb
new file mode 100644
index 0000000..f1d39ea
--- /dev/null
+++ b/recipes/jakarta-commons/commons-net-native_1.4.1.bb
@@ -0,0 +1,7 @@
+require commons-net_${PV}.bb
+
+inherit java-native 
+
+DEPENDS = "fastjar-native oro-native"
+RDEPENDS = ""
+
diff --git a/recipes/jakarta-commons/commons-net_1.4.1.bb b/recipes/jakarta-commons/commons-net_1.4.1.bb
new file mode 100644
index 0000000..4fccea5
--- /dev/null
+++ b/recipes/jakarta-commons/commons-net_1.4.1.bb
@@ -0,0 +1,14 @@
+require jakarta-commons.inc
+
+DESCRIPTION = "Java Internet protocol suite library"
+
+SRC_URI = "http://www.apache.org/dist/commons/net/source/${BP}-src.tar.gz"
+
+S = "${WORKDIR}/${BP}"
+
+DEPENDS += "oro"
+RDEPENDS = "liboro-java"
+
+CP = "oro"
+
+MAINSOURCES = "src/java/org"
diff --git a/recipes/jakarta-commons/commons-pool_1.4.bb b/recipes/jakarta-commons/commons-pool_1.4.bb
new file mode 100644
index 0000000..152f429
--- /dev/null
+++ b/recipes/jakarta-commons/commons-pool_1.4.bb
@@ -0,0 +1,5 @@
+require jakarta-commons.inc
+
+DESCRIPTION = "Java Object-pooling API"
+
+SRC_URI = "http://www.apache.org/dist/commons/pool/source/${BP}-src.tar.gz"
diff --git a/recipes/jakarta-commons/jakarta-commons.inc b/recipes/jakarta-commons/jakarta-commons.inc
new file mode 100644
index 0000000..48cbe17
--- /dev/null
+++ b/recipes/jakarta-commons/jakarta-commons.inc
@@ -0,0 +1,62 @@
+LICENSE = "AL2.0"
+AUTHOR = "Apache Software Foundation"
+
+inherit java-library
+
+DEPENDS = "fastjar-native"
+
+S = "${WORKDIR}/${BP}-src"
+
+# Directory in which the projects sources are located.
+MAINSOURCES = "src/java"
+
+# Directories which should appear in the -sourcepath argument.
+COMPILE_SOURCEPATH = "src/java"
+
+COMPILE_FINDARGS = "-name '*.java'"
+FINDARGS = "-name '*.properties'"
+
+# Directories to be removed after compilation.
+CLEAN_PATH = ""
+
+# Some projects have a replaceable version number in their manifest template.
+do_unpackpost() {
+  if [ -d src/conf ]
+  then
+    find src/conf -exec \
+      sed -i -e "s|@version@|${PV}|" {} \;
+  fi
+}
+
+addtask unpackpost after do_unpack before do_patch
+# Compile step is very similar for Jakarta commons packages
+do_compile() {
+  mkdir -p build
+
+  if [ "${CP}" ]
+  then
+		oe_makeclasspath cp -s ${CP}
+  else
+    cp=.
+  fi
+
+  echo "javac -sourcepath ${COMPILE_SOURCEPATH} -cp $cp -d build \`find ${MAINSOURCES} ${COMPILE_FINDARGS}\`"
+  javac -sourcepath ${COMPILE_SOURCEPATH} -cp $cp -d build `find ${MAINSOURCES} ${COMPILE_FINDARGS}`
+
+  # Copy extraneous files
+  echo "(cd ${MAINSOURCES} && find . ${FINDARGS} -exec cp {} ../../build/{} \;)"
+  (cd ${MAINSOURCES} && find . ${FINDARGS} -exec cp {} ../../build/{} \;)
+
+	# Optionally remove stuff after compilation (needed for sourcepath hacks).
+	if [ ${CLEAN_PATH} ]; then
+		rm -rf ${CLEAN_PATH}
+	fi
+
+  # Some projects have manifest, some have not. This works for both.
+  if [ -f src/conf/MANIFEST.MF ]
+  then
+    fastjar -C build -c -m src/conf/MANIFEST.MF -f ${JARFILENAME} .
+  else
+    fastjar -C build -c -f ${JARFILENAME} .
+  fi
+}
-- 
1.7.0.4



