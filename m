Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4CVg-0006uI-GL
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Aug 2012 17:06:21 +0200
Received: by daks35 with SMTP id s35so806409dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2012 07:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=RdKhVxme70xH8cmQ0c1pKzXduMHsuqyIC62p4FS4oNs=;
	b=0FjHcmpT3Xumb3gFJfwfJ54d4dmLwvLmUK1+fhT6uYfIe+CK2f2WF8lsYRfxal5Zh9
	xfXIk+Y83ZHdHgoas4sNHwaJ/C8mowpGjCo+GZ5i8qKu3jj7QHnArfHMXDDQBqpbb6nL
	QKntaa7dHNNRVZg+mF4AwNcvbviQhD+LmffyTJYnM8zLomKf7b89g7t/opUNrDAw5OIH
	wDPiqaudIBOAdMUzUmc8zowDL6BM3bVxYbEOu2rpvoAquS0m94Qfc/owRxF8mSS/vX7m
	EzbFAMjPSDe880bzpPIjOZCRo+VaqdIE3cXfJoKbEI8OpAgL74lypma24cXGEz5yc6Sf
	gSTA==
Received: by 10.68.220.201 with SMTP id py9mr53290778pbc.137.1345647254472;
	Wed, 22 Aug 2012 07:54:14 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ox5sm3844742pbc.75.2012.08.22.07.54.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Aug 2012 07:54:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Aug 2012 07:53:43 -0700
Message-Id: <1345647223-12473-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-java][PATCH] classpath-0.99: Remove unused automake.patch
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
X-List-Received-Date: Wed, 22 Aug 2012 15:06:21 -0000

This was meant for 0.98 which has been removed
0.99 was not using it at all

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../classpath/classpath-0.98/automake.patch        |  100 --------------------
 recipes-core/classpath/classpath.inc               |    2 +-
 recipes-core/classpath/classpath_0.99.bb           |    1 -
 3 files changed, 1 insertion(+), 102 deletions(-)
 delete mode 100644 recipes-core/classpath/classpath-0.98/automake.patch

diff --git a/recipes-core/classpath/classpath-0.98/automake.patch b/recipes-core/classpath/classpath-0.98/automake.patch
deleted file mode 100644
index da86300..0000000
--- a/recipes-core/classpath/classpath-0.98/automake.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-Fix build with automake 1.12
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: classpath-0.98/examples/Makefile.am
-===================================================================
---- classpath-0.98.orig/examples/Makefile.am	2012-07-17 17:35:05.428405912 -0700
-+++ classpath-0.98/examples/Makefile.am	2012-07-17 17:36:28.008405840 -0700
-@@ -96,9 +96,9 @@
- endif
- 
- $(EXAMPLE_ZIP): $(EXAMPLE_JAVA_FILES)
--	@mkdir_p@ classes/gnu/classpath/examples/icons
-+	@MKDIR_P@ classes/gnu/classpath/examples/icons
- 	cp $(EXAMPLE_ICONS) classes/gnu/classpath/examples/icons
--	@mkdir_p@ classes/gnu/classpath/examples/swing
-+	@MKDIR_P@ classes/gnu/classpath/examples/swing
- 	cp $(EXAMPLE_HTML) classes/gnu/classpath/examples/swing
- 	$(JCOMPILER) -d classes $(EXAMPLE_JAVA_FILES) 
- 	(cd classes; \
-Index: classpath-0.98/lib/Makefile.am
-===================================================================
---- classpath-0.98.orig/lib/Makefile.am	2012-07-17 17:35:05.448405923 -0700
-+++ classpath-0.98/lib/Makefile.am	2012-07-17 17:36:44.728405932 -0700
-@@ -83,18 +83,18 @@
- resources: copy-vmresources.sh
- 	@list=`cd $(top_srcdir)/resource && $(FIND) gnu java javax org -name \*\.properties -print -o -name \*\.css -print`; for p in $$list; do \
-           dirname=`dirname $$p`; \
--          if ! test -d "$$dirname"; then @mkdir_p@ "$$dirname"; fi; \
-+          if ! test -d "$$dirname"; then @MKDIR_P@ "$$dirname"; fi; \
- 	  cp $(top_srcdir)/resource/$$p $$p; \
- 	done
- 	@list=`cd $(top_srcdir)/resource && $(FIND) META-INF -name CVS -prune -o -name .svn -prune -o -name \*\.in -prune -o -type f -print`; for p in $$list; do \
-           dirname=`dirname $$p`; \
--          if ! test -d "$$dirname"; then @mkdir_p@ "$$dirname"; fi; \
-+          if ! test -d "$$dirname"; then @MKDIR_P@ "$$dirname"; fi; \
- 	  cp $(top_srcdir)/resource/$$p $$p; \
- 	done
- 	@$(SHELL) ./copy-vmresources.sh
- 	@list=`cd $(top_srcdir) && $(FIND) gnu/javax/swing/plaf/gtk/icons -name *.png -type f -print`; for p in $$list; do \
-           dirname=`dirname $$p`; \
--          if ! test -d "$$dirname"; then @mkdir_p@ "$$dirname"; fi; \
-+          if ! test -d "$$dirname"; then @MKDIR_P@ "$$dirname"; fi; \
- 	  cp $(top_srcdir)/$$p $$p; \
- 	done
- 	touch resources
-@@ -102,7 +102,7 @@
- classes: genclasses
- 
- $(top_builddir)/gnu/java/locale/LocaleData.java: $(top_srcdir)/scripts/generate-locale-list.sh 
--	@mkdir_p@ $(top_builddir)/gnu/java/locale
-+	@MKDIR_P@ $(top_builddir)/gnu/java/locale
- 	$(top_srcdir)/scripts/generate-locale-list.sh > $(top_builddir)/gnu/java/locale/LocaleData.java
- 
- genclasses: gen-classlist.sh standard.omit $(top_builddir)/gnu/java/locale/LocaleData.java gen-xpath-parser
-@@ -160,7 +160,7 @@
- 	-rm -rf lists
- 
- dist-hook:
--	@mkdir_p@ $(distdir)
-+	@MKDIR_P@ $(distdir)
- 	cp -pdfR $(top_srcdir)/gnu $(top_srcdir)/java $(top_srcdir)/javax $(top_srcdir)/org $(top_srcdir)/sun $(top_srcdir)/vm $(top_srcdir)/resource $(distdir)/..
- # Delete not wanted files.
- 	$(FIND) $(distdir)/../gnu $(distdir)/../java $(distdir)/../javax $(distdir)/../org $(distdir)/../sun $(distdir)/../vm $(distdir)/../resource -name CVS -print | xargs rm -fr
-Index: classpath-0.98/tools/Makefile.am
-===================================================================
---- classpath-0.98.orig/tools/Makefile.am	2012-07-17 17:35:05.456405922 -0700
-+++ classpath-0.98/tools/Makefile.am	2012-07-17 17:37:00.828405721 -0700
-@@ -312,11 +312,11 @@
- # so they get also included.
- $(TOOLS_ZIP): $(ALL_TOOLS_FILES)
- 	@rm -rf classes asm
--	@mkdir_p@ classes asm 
-+	@MKDIR_P@ classes asm 
- if CREATE_GJDOC
- if CREATE_GJDOC_PARSER
- ## Generate antlr sources.
--	@mkdir_p@ $(gjdoc_gendir)/gnu/classpath/tools/gjdoc/expr
-+	@MKDIR_P@ $(gjdoc_gendir)/gnu/classpath/tools/gjdoc/expr
- 	$(ANTLR) -o $(gjdoc_gendir)/gnu/classpath/tools/gjdoc/expr/ \
- 	  $(srcdir)/gnu/classpath/tools/gjdoc/expr/java-expression.g
- endif
-@@ -346,7 +346,7 @@
- 	       sun/rmi/rmic $(GJDOC_EX) -name \*.properties -print -o -name \*.jav -print`; \
- 	for p in $$list; do \
- 	  dirname=classes/`dirname $$p`; \
--	  if ! test -d "$$dirname"; then @mkdir_p@ "$$dirname"; fi; \
-+	  if ! test -d "$$dirname"; then @MKDIR_P@ "$$dirname"; fi; \
- 	  echo "  cp $(srcdir)/resource/$$p classes/$$p"; \
- 	  cp $(srcdir)/resource/$$p classes/$$p; \
- 	done
-@@ -354,7 +354,7 @@
- ## Copy over gjdoc resource files.
- 	for res in $(gjdoc_resources); do \
- 	  dir=classes/`dirname $$res`; \
--	  if ! test -d "$$dir"; then @mkdir_p@ "$$dir"; fi; \
-+	  if ! test -d "$$dir"; then @MKDIR_P@ "$$dir"; fi; \
- 	  echo "  cp $(srcdir)/resource/gnu/classpath/tools/gjdoc/$$res classes/$$res"; \
- 	  cp $(srcdir)/resource/gnu/classpath/tools/gjdoc/$$res classes/$$res; \
- 	done 
diff --git a/recipes-core/classpath/classpath.inc b/recipes-core/classpath/classpath.inc
index 4c3174b..df23b4b 100644
--- a/recipes-core/classpath/classpath.inc
+++ b/recipes-core/classpath/classpath.inc
@@ -21,7 +21,7 @@ RPROVIDES_${PN} = "${PBN}"
 RPROVIDES_${PN}-common = "${PBN}-common"
 RPROVIDES_${PN}-gtk = "${PBN}-awt"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/classpath/classpath-${PV}.tar.gz"
 
diff --git a/recipes-core/classpath/classpath_0.99.bb b/recipes-core/classpath/classpath_0.99.bb
index b1e4089..ee38992 100644
--- a/recipes-core/classpath/classpath_0.99.bb
+++ b/recipes-core/classpath/classpath_0.99.bb
@@ -8,7 +8,6 @@ SRC_URI += " \
             file://autotools.patch \
             file://miscompilation.patch \
             file://toolwrapper-exithook.patch \
-            file://automake.patch \
            "
 
 SRC_URI[md5sum] = "0ae1571249172acd82488724a3b8acb4"
-- 
1.7.9.5



