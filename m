Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N35h0-0004pj-Qa
	for openembedded-devel@openembedded.org; Wed, 28 Oct 2009 11:23:53 +0100
Received: (qmail 10214 invoked by uid 813007); 28 Oct 2009 10:22:45 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 28 Oct 2009 10:22:45 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Oct 2009 11:25:24 +0100
Message-Id: <1256725524-28431-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.5
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Robert Schuster <robertschuster@fsfe.org>
Subject: [STABLE][PATCH] jsp2.0 5.5.26: New recipe (from Jalimo SVN). servlet2.3 4.1.37: Dito. servlet2.3-native 4.1.37: Dito. servlet2.4 5.5.26: Dito.
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
X-List-Received-Date: Wed, 28 Oct 2009 10:23:54 -0000

From: Robert Schuster <robertschuster@fsfe.org>

---
 recipes/servlet-api/jsp2.0_5.5.26.bb            |   42 +++++++++++++++++++++++
 recipes/servlet-api/servlet2.3-native_4.1.37.bb |    4 ++
 recipes/servlet-api/servlet2.3_4.1.37.bb        |   41 ++++++++++++++++++++++
 recipes/servlet-api/servlet2.4_5.5.26.bb        |   38 ++++++++++++++++++++
 4 files changed, 125 insertions(+), 0 deletions(-)
 create mode 100644 recipes/servlet-api/jsp2.0_5.5.26.bb
 create mode 100644 recipes/servlet-api/servlet2.3-native_4.1.37.bb
 create mode 100644 recipes/servlet-api/servlet2.3_4.1.37.bb
 create mode 100644 recipes/servlet-api/servlet2.4_5.5.26.bb

diff --git a/recipes/servlet-api/jsp2.0_5.5.26.bb b/recipes/servlet-api/jsp2.0_5.5.26.bb
new file mode 100644
index 0000000..6a5f3b6
--- /dev/null
+++ b/recipes/servlet-api/jsp2.0_5.5.26.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "Java Server Page (JSP) API 2.0 (from Tomcat 5.5)"
+LICENSE = "AL2.0"
+AUTHOR = "Apache Software Foundation"
+
+SRC_URI = "http://archive.apache.org/dist/tomcat/tomcat-5/v${PV}/src/apache-tomcat-${PV}-src.tar.gz"
+
+S = "${WORKDIR}/apache-tomcat-${PV}-src/servletapi/jsr152"
+
+inherit java-library
+
+DEPENDS = "fastjar-native servlet2.4"
+RDEPENDS = "libservlet2.4-java"
+
+# Value of implementation.revision in build.xml
+IMPL_REVISION = "public_draft"
+
+JARFILENAME = "jsp-api-2.0.${IMPL_REVISION}.jar"
+ALTJARFILENAMES = "jsp-api-2.0.jar jsp-api.jar"
+
+do_unpackpost() {
+  sed -i -e "s|@implementation.version@|${IMPL_REVISION}|" src/etc/manifest
+}
+
+addtask unpackpost after do_unpack before do_patch
+
+do_compile() {
+  mkdir -p build
+
+  oe_makeclasspath cp -s servlet-api-2.4`
+  javac -sourcepath src/share -d build -cp $cp `find src/share/javax -name \*.java`
+
+  # Copy extraneous files according to build.xml's compile task
+  (cd src/share && find . -name "*.properties" -exec cp {} ../../build/{} \;)
+
+  mkdir -p build/javax/servlet/jsp/resources
+  cp src/share/dtd/jsp*.dtd build/javax/servlet/jsp/resources
+  cp src/share/dtd/jsp*.xsd build/javax/servlet/jsp/resources
+  cp src/share/dtd/web-jsp*.dtd build/javax/servlet/jsp/resources
+  cp src/share/dtd/web-jsp*.xsd build/javax/servlet/jsp/resources
+
+  fastjar -C build -c -m src/etc/manifest -f ${JARFILENAME} .
+}
diff --git a/recipes/servlet-api/servlet2.3-native_4.1.37.bb b/recipes/servlet-api/servlet2.3-native_4.1.37.bb
new file mode 100644
index 0000000..c06f5f4
--- /dev/null
+++ b/recipes/servlet-api/servlet2.3-native_4.1.37.bb
@@ -0,0 +1,4 @@
+require servlet2.3_${PV}.bb
+
+inherit java-native
+
diff --git a/recipes/servlet-api/servlet2.3_4.1.37.bb b/recipes/servlet-api/servlet2.3_4.1.37.bb
new file mode 100644
index 0000000..6176161
--- /dev/null
+++ b/recipes/servlet-api/servlet2.3_4.1.37.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "Servlet API 2.3 (from Tomcat 4.1)"
+LICENSE = "AL2.0"
+AUTHOR = "Apache Software Foundation"
+
+SRC_URI = "http://archive.apache.org/dist/tomcat/tomcat-4/v${PV}/src/apache-tomcat-${PV}-src.tar.gz"
+
+inherit java-library
+
+S = "${WORKDIR}/apache-tomcat-${PV}-src/servletapi"
+
+DEPENDS = "fastjar-native"
+
+# Value of implementation.revision in build.xml
+IMPL_REVISION = "1"
+
+JARFILENAME = "servlet-2.3.${IMPL_REVISION}.jar"
+ALTJARFILENAMES = "servlet-2.3.jar servlet2.3.jar"
+
+do_unpackpost() {
+  sed -i -e "s|@implementation.version@|${IMPL_REVISION}|" src/etc/manifest
+}
+
+addtask unpackpost after do_unpack before do_patch
+
+do_compile() {
+  mkdir -p build
+
+  javac -sourcepath src/share -d build `find src/share/javax -name \*.java`
+
+  # Copy extraneous files according to build.xml's compile task
+  (cd src/share && find . -name "*.properties" -exec cp {} ../../build/{} \;)
+
+  mkdir -p build/javax/servlet/resources
+  cp src/share/dtd/web-app*.dtd build/javax/servlet/resources
+
+  mkdir -p build/javax/servlet/jsp/resources
+  cp src/share/dtd/web-jsptaglibrary*.dtd build/javax/servlet/jsp/resources
+  cp src/share/dtd/jspxml.* build/javax/servlet/jsp/resources
+
+  fastjar -C build -c -m src/etc/manifest -f ${JARFILENAME} .
+}
diff --git a/recipes/servlet-api/servlet2.4_5.5.26.bb b/recipes/servlet-api/servlet2.4_5.5.26.bb
new file mode 100644
index 0000000..c4af1ab
--- /dev/null
+++ b/recipes/servlet-api/servlet2.4_5.5.26.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "Servlet API 2.4 (from Tomcat 5.5)"
+LICENSE = "AL2.0"
+AUTHOR = "Apache Software Foundation"
+
+SRC_URI = "http://archive.apache.org/dist/tomcat/tomcat-5/v${PV}/src/apache-tomcat-${PV}-src.tar.gz"
+
+S = "${WORKDIR}/apache-tomcat-${PV}-src/servletapi/jsr154"
+
+inherit java-library
+
+DEPENDS = "fastjar-native"
+
+# Value of implementation.revision in build.xml
+IMPL_REVISION = "1"
+
+JARFILENAME = "servlet-api-2.4.${IMPL_REVISION}.jar"
+ALTJARFILENAMES = "servlet-api-2.4.jar servlet-api.jar servlet2.4.jar"
+
+do_unpackpost() {
+  sed -i -e "s|2.3.@implementation.version@|2.4.${IMPL_REVISION}|" src/etc/manifest
+}
+
+addtask unpackpost after do_unpack before do_patch
+
+do_compile() {
+  mkdir -p build
+
+  javac -sourcepath src/share -d build `find src/share/javax -name \*.java`
+
+  # Copy extraneous files according to build.xml's compile task
+  (cd src/share && find . -name "*.properties" -exec cp {} ../../build/{} \;)
+
+  mkdir -p build/javax/servlet/resources
+  cp src/share/dtd/jsp*.dtd build/javax/servlet/resources
+  cp src/share/dtd/web-jsp*.dtd build/javax/servlet/resources
+
+  fastjar -C build -c -m src/etc/manifest -f ${JARFILENAME} .
+}
-- 
1.6.4.3





