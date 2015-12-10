Return-Path: <erkka.kaaria@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5D16960616
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Dec 2015 08:45:17 +0000 (UTC)
MIME-Version: 1.0
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Dec 2015 00:45:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,407,1444719600"; d="scan'208";a="838302071"
Received: from ekaaria-xps-8300.fi.intel.com ([10.237.68.35])
	by orsmga001.jf.intel.com with ESMTP; 10 Dec 2015 00:45:16 -0800
From: =?UTF-8?q?Erkka=20K=C3=A4=C3=A4ri=C3=A4?= <erkka.kaaria@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Dec 2015 10:45:45 +0200
Message-Id: <1449737145-27963-1-git-send-email-erkka.kaaria@intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [meta-java][PATCH] gnumail: Fix race condition in makefile
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Dec 2015 08:45:20 -0000
Content-Type: multipart/mixed; boundary="===============3610547508517624890=="

--===============3610547508517624890==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Parallel make does not handle multiple javac invocations correctly, as javac
compiles any uncompiled dependencies on its own. This leads to a race condition
where make may see incomplete class files and incorrectly assume that the
class files has already been compiled. This ultimately causes incomplete class
files to be included in one of the jars, causing build failures later one when
javac attempts to use such class file.

This issue is fixed by patching the makefile so that only one instance of javac
is invoked, which compiles all the java files in one go.

Signed-off-by: Erkka K채채ri채 <erkka.kaaria@intel.com>
---
 .../fix_makefile_race_condition.patch              | 129 +++++++++++++++++++++
 recipes-core/classpathx/gnumail_1.1.2.bb           |   1 +
 2 files changed, 130 insertions(+)
 create mode 100644 recipes-core/classpathx/gnumail-1.1.2/fix_makefile_race_condition.patch

diff --git a/recipes-core/classpathx/gnumail-1.1.2/fix_makefile_race_condition.patch b/recipes-core/classpathx/gnumail-1.1.2/fix_makefile_race_condition.patch
new file mode 100644
index 0000000..40f3e5a
--- /dev/null
+++ b/recipes-core/classpathx/gnumail-1.1.2/fix_makefile_race_condition.patch
@@ -0,0 +1,129 @@
+From b47573456292e90988b661fe3d81c900462d7687 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Erkka=20K=C3=A4=C3=A4ri=C3=A4?= <erkka.kaaria@intel.com>
+Date: Thu, 10 Dec 2015 08:58:21 +0200
+Subject: [PATCH] gnumail: Fix race condition in makefile
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Parallel make does not handle multiple javac invocations correctly, as javac
+compiles any uncompiled dependencies on its own. This leads to a race condition
+where make may see incomplete class files and incorrectly assume that the class
+file has already been compiled. This ultimately causes incomplete class files
+to be included in one of the jars, causing build failures later on when javac
+attempts to use such class file.
+
+This issue is fixed by patching the makefile in such way that only one instance
+of javac is invoked, which compiles all the java files in one go.
+
+Upstream-Status: Inappropriate [dead project]
+
+Signed-off-by: Erkka K채채ri채 <erkka.kaaria@intel.com>
+---
+ Makefile.am | 70 +++++++++----------------------------------------------------
+ 1 file changed, 10 insertions(+), 60 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 8116b55..5c78dbc 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -295,18 +295,6 @@ classpath = $(src):$(activation_jar):$(inetlib_jar):$(jsse_jar)
+ # Targets
+ BUILT_SOURCES = $(gnumail_jar) $(providers_jar)
+ 
+-#쥶XTRA_DIST = jarcompiler $(API_JAVASRC) $(GNU_SRC) $(MAIL_META)
+-
+-gnumail_classes = $(patsubst $(src)/%.java, $(dst)/%.class, $(gnumail_sources))
+-util_classes = $(patsubst $(src)/%.java, $(dst)/%.class, $(util_sources))
+-provider_classes = $(patsubst $(src)/%.java, $(dst)/%.class, $(provider_sources))
+-smtp_classes = $(patsubst $(src)/%.java, $(dst)/%.class, $(smtp_sources))
+-imap_classes = $(patsubst $(src)/%.java, $(dst)/%.class, $(imap_sources))
+-pop3_classes = $(patsubst $(src)/%.java, $(dst)/%.class, $(pop3_sources))
+-nntp_classes = $(patsubst $(src)/%.java, $(dst)/%.class, $(nntp_sources))
+-mbox_classes = $(patsubst $(src)/%.java, $(dst)/%.class, $(mbox_sources))
+-maildir_classes = $(patsubst $(src)/%.java, $(dst)/%.class, $(maildir_sources))
+-
+ META-INF:
+ 	mkdir -p META-INF
+ 
+@@ -361,16 +349,14 @@ $(dst):
+ 
+ # Jars
+ 
+-$(gnumail_jar): $(dst) $(gnumail_meta) $(gnumail_classes) $(util_classes)
++$(gnumail_jar): $(dst) $(gnumail_meta) build_sources
+ 	$(JAR) cfm $(gnumail_jar) $(manifest_mf) \
+ 		$(gnumail_meta) \
+ 		-C $(dst) javax \
+ 		-C $(dst) gnu/mail/handler \
+ 		-C $(dst) gnu/mail/util 
+ 
+-$(providers_jar): $(dst) $(providers_meta) $(provider_classes) $(smtp_classes) \
+-	$(imap_classes) $(pop3_classes) $(nntp_classes) $(mbox_classes) \
+-	$(maildir_classes)
++$(providers_jar): $(dst) $(providers_meta) build_sources
+ 	$(JAR) cfm $(providers_jar) $(manifest_mf) \
+ 		$(providers_meta) \
+ 		-C $(dst) gnu/mail/providers \
+@@ -378,50 +364,14 @@ $(providers_jar): $(dst) $(providers_meta) $(provider_classes) $(smtp_classes) \
+ 
+ # Compilation
+ 
+-#gnumail: util $(gnumail_classes)
+-
+-$(gnumail_classes): $(dst)/%.class: $(src)/%.java
+-	$(JAVAC) $(JAVACFLAGS) -classpath $(classpath) -d $(dst) $<
+-
+-#util: $(util_classes)
+-
+-$(util_classes): $(dst)/%.class: $(src)/%.java
+-	$(JAVAC) $(JAVACFLAGS) -classpath $(classpath) -d $(dst) $<
+-
+-#provider_util: $(gnumail_jar) $(provider_classes)
+-
+-$(provider_classes): $(dst)/%.class: $(src)/%.java
+-	$(JAVAC) $(JAVACFLAGS) -classpath $(classpath) -d $(dst) $<
+-
+-#smtp: provider_util $(smtp_classes)
+-
+-$(smtp_classes): $(dst)/%.class: $(src)/%.java
+-	$(JAVAC) $(JAVACFLAGS) -classpath $(classpath) -d $(dst) $<
+-
+-#imap: provider_util $(imap_classes)
+-
+-$(imap_classes): $(dst)/%.class: $(src)/%.java
+-	$(JAVAC) $(JAVACFLAGS) -classpath $(classpath) -d $(dst) $<
+-
+-#pop3: provider_util $(pop3_classes)
+-
+-$(pop3_classes): $(dst)/%.class: $(src)/%.java
+-	$(JAVAC) $(JAVACFLAGS) -classpath $(classpath) -d $(dst) $<
+-
+-#nntp: provider_util $(nntp_classes)
+-
+-$(nntp_classes): $(dst)/%.class: $(src)/%.java
+-	$(JAVAC) $(JAVACFLAGS) -classpath $(classpath) -d $(dst) $<
+-
+-#mbox: provider_util $(mbox_classes)
+-
+-$(mbox_classes): $(dst)/%.class: $(src)/%.java
+-	$(JAVAC) $(JAVACFLAGS) -classpath $(classpath) -d $(dst) $<
+-
+-#maildir: provider_util $(maildir_classes)
+-
+-$(maildir_classes): $(dst)/%.class: $(src)/%.java
+-	$(JAVAC) $(JAVACFLAGS) -classpath $(classpath) -d $(dst) $<
++build_sources: $(gnumail_sources) $(util_sources) $(provider_sources) \
++		$(smtp_sources) $(imap_sources) $(pop3_sources) $(nntp_sources) \
++		$(mbox_sources) $(maildir_sources)
++	$(JAVAC) $(JAVACFLAGS) -classpath $(classpath) -d $(dst) \
++		$(gnumail_sources) $(util_sources) $(provider_sources) \
++		$(smtp_sources) $(imap_sources) $(pop3_sources) \
++		$(nntp_sources) $(mbox_sources) $(maildir_sources)
++	touch build_sources
+ 
+ # Javadoc
+ javadoc:
+-- 
+2.1.4
+
diff --git a/recipes-core/classpathx/gnumail_1.1.2.bb b/recipes-core/classpathx/gnumail_1.1.2.bb
index 41417c0..b498c2b 100644
--- a/recipes-core/classpathx/gnumail_1.1.2.bb
+++ b/recipes-core/classpathx/gnumail_1.1.2.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=14bc6ee8b2e2b409be599212867d126e"
 
 SRC_URI = "http://ftp.gnu.org/gnu/classpathx/mail-${PV}.tar.gz \
            file://datadir_java.patch \
+           file://fix_makefile_race_condition.patch \
           "
 
 inherit java-library java-bootstrap-components autotools
-- 
2.1.4

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki 
Business Identity Code: 0357606 - 4 
Domiciled in Helsinki 

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

--===============3610547508517624890==--
