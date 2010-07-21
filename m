Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1ObZxv-0006mq-1R
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 16:08:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 618524036DE6D;
	Wed, 21 Jul 2010 16:07:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 5A1394036DE75;
	Wed, 21 Jul 2010 16:07:28 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 01oDp+XgZVlb; Wed, 21 Jul 2010 16:07:28 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id 26E1D4036DE6D;
	Wed, 21 Jul 2010 16:07:28 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1ObZxB-0006Tw-29; Wed, 21 Jul 2010 16:07:21 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 16:06:58 +0200
Message-Id: <1279721232-24744-8-git-send-email-heinold@inf.fu-berlin.de>
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
Subject: [PATCH 07/21] classpathx: backport from openembedded-dev
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

* checksums alreasy in conf/checksums.ini
---
 recipes/classpathx/gnujaf-1.1.1/datadir_java.patch |   23 +++++++++++
 recipes/classpathx/gnujaf-native_1.1.1.bb          |    3 +
 recipes/classpathx/gnujaf_1.1.1.bb                 |   35 ++++++++++++++++
 .../classpathx/gnumail-1.1.2/datadir_java.patch    |   25 ++++++++++++
 recipes/classpathx/gnumail-native_1.1.2.bb         |   10 +++++
 recipes/classpathx/gnumail_1.1.2.bb                |   42 ++++++++++++++++++++
 6 files changed, 138 insertions(+), 0 deletions(-)
 create mode 100644 recipes/classpathx/gnujaf-1.1.1/datadir_java.patch
 create mode 100644 recipes/classpathx/gnujaf-native_1.1.1.bb
 create mode 100644 recipes/classpathx/gnujaf_1.1.1.bb
 create mode 100644 recipes/classpathx/gnumail-1.1.2/datadir_java.patch
 create mode 100644 recipes/classpathx/gnumail-native_1.1.2.bb
 create mode 100644 recipes/classpathx/gnumail_1.1.2.bb

diff --git a/recipes/classpathx/gnujaf-1.1.1/datadir_java.patch b/recipes/classpathx/gnujaf-1.1.1/datadir_java.patch
new file mode 100644
index 0000000..807a1cb
--- /dev/null
+++ b/recipes/classpathx/gnujaf-1.1.1/datadir_java.patch
@@ -0,0 +1,23 @@
+Index: activation-1.1.1/Makefile.am
+===================================================================
+--- activation-1.1.1.orig/Makefile.am	2008-03-01 10:30:06.000000000 +0100
++++ activation-1.1.1/Makefile.am	2008-03-01 10:31:04.000000000 +0100
+@@ -7,6 +7,8 @@
+ JAVADOC = @JAVADOC@
+ JAVADOCFLAGS = @JAVADOCFLAGS@
+ 
++JARDIR = $(datadir)/java
++
+ src = @srcdir@/source
+ dst = classes
+ doc = @srcdir@/docs
+@@ -92,7 +94,7 @@
+ 	$(RM) config.log config.status
+ 
+ install-data-local:
+-	@srcdir@/mkinstalldirs $(DESTDIR)/$(datadir)/java
+-	$(INSTALL_DATA) $(activation_jar) $(DESTDIR)/$(datadir)/java
++	@srcdir@/mkinstalldirs $(DESTDIR)/$(JARDIR)
++	$(INSTALL_DATA) $(activation_jar) $(DESTDIR)/$(JARDIR)
+ 
+ # End of Makefile.am
diff --git a/recipes/classpathx/gnujaf-native_1.1.1.bb b/recipes/classpathx/gnujaf-native_1.1.1.bb
new file mode 100644
index 0000000..0e3e485
--- /dev/null
+++ b/recipes/classpathx/gnujaf-native_1.1.1.bb
@@ -0,0 +1,3 @@
+require gnujaf_${PV}.bb
+
+inherit java-native
diff --git a/recipes/classpathx/gnujaf_1.1.1.bb b/recipes/classpathx/gnujaf_1.1.1.bb
new file mode 100644
index 0000000..1ae4717
--- /dev/null
+++ b/recipes/classpathx/gnujaf_1.1.1.bb
@@ -0,0 +1,35 @@
+DESCRIPTION = "Provides a mean to type data and locate components suitable for performing various kinds of action on it."
+LICENSE = "GPL + library exception"
+AUTHOR = "GNU ClasspathX"
+
+SRC_URI = "\
+  http://ftp.gnu.org/gnu/classpathx/activation-${PV}.tar.gz \
+  file://datadir_java.patch;patch=1 \
+  "
+
+# java-library must be last (it defines do_stage)
+inherit autotools java-library
+
+S = "${WORKDIR}/activation-${PV}"
+
+DEPENDS = "fastjar-native"
+
+export JAVAC = "javac"
+
+# Fake javadoc
+export JAVADOC = "true"
+
+JARFILENAME = "activation-${PV}.jar"
+ALTJARFILENAMES = "activation.jar gnujaf.jar"
+
+do_compile() {
+  mkdir -p build
+
+  javac -sourcepath source -d build `find source -name "*.java"`
+
+  fastjar -C build -c -f ${JARFILENAME} .
+}
+
+do_install() {
+  java_install
+}
diff --git a/recipes/classpathx/gnumail-1.1.2/datadir_java.patch b/recipes/classpathx/gnumail-1.1.2/datadir_java.patch
new file mode 100644
index 0000000..50e908d
--- /dev/null
+++ b/recipes/classpathx/gnumail-1.1.2/datadir_java.patch
@@ -0,0 +1,25 @@
+Index: mail-1.1.2/Makefile.am
+===================================================================
+--- mail-1.1.2.orig/Makefile.am	2008-03-01 11:13:36.000000000 +0100
++++ mail-1.1.2/Makefile.am	2008-03-01 11:17:49.000000000 +0100
+@@ -7,6 +7,8 @@
+ JAVADOC = @JAVADOC@
+ JAVADOCFLAGS = @JAVADOCFLAGS@
+ 
++JARDIR = $(datadir)/java
++
+ src = @srcdir@/source
+ dst = classes
+ doc = @srcdir@/docs
+@@ -433,8 +435,8 @@
+ 	rm -rf $(gnumail_jar) $(providers_jar) META-INF $(dst) $(doc)
+ 
+ install-data-local:
+-	@srcdir@/mkinstalldirs $(DESTDIR)/$(datadir)/java
+-	$(INSTALL_DATA) $(gnumail_jar) $(DESTDIR)/$(datadir)/java
+-	$(INSTALL_DATA) $(providers_jar) $(DESTDIR)/$(datadir)/java
++	@srcdir@/mkinstalldirs $(DESTDIR)/$(JARDIR)
++	$(INSTALL_DATA) $(gnumail_jar) $(DESTDIR)/$(JARDIR)
++	$(INSTALL_DATA) $(providers_jar) $(DESTDIR)/$(JARDIR)
+ 
+ # End of Makefile.am
diff --git a/recipes/classpathx/gnumail-native_1.1.2.bb b/recipes/classpathx/gnumail-native_1.1.2.bb
new file mode 100644
index 0000000..5d547b7
--- /dev/null
+++ b/recipes/classpathx/gnumail-native_1.1.2.bb
@@ -0,0 +1,10 @@
+require gnumail_${PV}.bb
+
+inherit native
+
+DEPENDS = "fastjar-native gnujaf-native inetlib-native"
+
+EXTRA_OECONF = "\
+  --with-inetlib-jar=${STAGING_DATADIR}/java \
+  --with-activation-jar=${STAGING_DATADIR}/java \
+  "
diff --git a/recipes/classpathx/gnumail_1.1.2.bb b/recipes/classpathx/gnumail_1.1.2.bb
new file mode 100644
index 0000000..4e67558
--- /dev/null
+++ b/recipes/classpathx/gnumail_1.1.2.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "GNU's free implementation of the JavaMail API specification"
+LICENSE = "GPL + library exception"
+AUTHOR = "GNU ClasspathX"
+
+SRC_URI = "\
+  http://ftp.gnu.org/gnu/classpathx/mail-${PV}.tar.gz \
+  file://datadir_java.patch;patch=1 \
+  "
+
+inherit java-library autotools
+
+S = "${WORKDIR}/mail-${PV}"
+
+DEPENDS = "fastjar-native gnujaf inetlib"
+
+export JAVAC = "${STAGING_BINDIR_NATIVE}/javac"
+export JAVA = "${STAGING_BINDIR_NATIVE}/java"
+
+# Fake javadoc
+export JAVADOC = "true"
+
+EXTRA_OECONF = "\
+  --with-inetlib-jar=${STAGING_DATADIR_JAVA} \
+  --with-activation-jar=${STAGING_DATADIR_JAVA} \
+  "
+
+do_compile() {
+  oe_runmake \
+    JARDIR=${datadir_java} \
+    gnumail_jar=${JARFILENAME} \
+    providers_jar=${P}-providers.jar
+}
+
+do_install() {
+  java_install
+  oe_jarinstall ${P}-providers.jar ${PN}-providers.jar
+}
+
+do_stage() {
+  java_stage
+  oe_jarinstall -s ${P}-providers.jar ${PN}-providers.jar
+}
-- 
1.7.0.4



