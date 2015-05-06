Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id F1C8C73C5B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2015 03:45:50 +0000 (UTC)
Received: by iecnq11 with SMTP id nq11so4946444iec.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 May 2015 20:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S3aAg7p0p53mzjA9vluZsXUlBz2nnG2FLm09LKOeVZY=;
	b=ZuqP9QKJmy9u8Yg1xeJqZiKwcwyIx/wmyagmrwyUwurePf9Rc/7cCiJRcCIz2Zna20
	Vwk9YL8pWYiFqjqKpDrskDe1658K2Z7Vj4iu/T3rvMXnJQpit4JyneNmhRF+cmHLAB+R
	l8qx0zvXHautZbrFzqA2yhXxVqGgpQcV9Bsh8Ab0UptPhj9EZzEMvNLvcWNhOZG6qtty
	iyhw6U1fjVvwhB9Zb7YwHmu3+1K6VrG8RNC1mocRQjIC4QWlZCYbe9QneYQN4GGJybq4
	9RyEyJKrx9qisB5zBb+1rLFjQc0dqEXGUC7ugpu+Fi0sLT7Bh6dL4kAtVLb4LwBIKb8k
	nD8Q==
X-Received: by 10.50.78.199 with SMTP id d7mr797715igx.18.1430883951830;
	Tue, 05 May 2015 20:45:51 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id fm3sm64325igb.1.2015.05.05.20.45.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 May 2015 20:45:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 May 2015 20:45:43 -0700
Message-Id: <1430883943-30031-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1430883943-30031-1-git-send-email-raj.khem@gmail.com>
References: <1430883943-30031-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 8/8] gtkmathview: Use git for SRC_URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 May 2015 03:45:51 -0000

Drop upstreamed patches
Fix cross compile and compiling with newer g++

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-include-cstdio-to-get-printf-definitions.patch | 28 ++++++++++
 .../mml-widget/gtkmathview/mathview-gcc43x.diff    | 63 ----------------------
 .../mml-widget/gtkmathview/mathview-gcc47x.diff    | 48 -----------------
 .../mml-widget/gtkmathview/qualify-lookup.diff     | 13 -----
 .../mml-widget/gtkmathview/use_hostcxx.patch       | 18 +++++++
 .../mml-widget/gtkmathview_0.8.0.bb                | 17 +++---
 6 files changed, 55 insertions(+), 132 deletions(-)
 create mode 100644 meta-oe/recipes-extended/mml-widget/gtkmathview/0001-include-cstdio-to-get-printf-definitions.patch
 delete mode 100644 meta-oe/recipes-extended/mml-widget/gtkmathview/mathview-gcc43x.diff
 delete mode 100644 meta-oe/recipes-extended/mml-widget/gtkmathview/mathview-gcc47x.diff
 delete mode 100644 meta-oe/recipes-extended/mml-widget/gtkmathview/qualify-lookup.diff
 create mode 100644 meta-oe/recipes-extended/mml-widget/gtkmathview/use_hostcxx.patch

diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview/0001-include-cstdio-to-get-printf-definitions.patch b/meta-oe/recipes-extended/mml-widget/gtkmathview/0001-include-cstdio-to-get-printf-definitions.patch
new file mode 100644
index 0000000..c5814bf
--- /dev/null
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview/0001-include-cstdio-to-get-printf-definitions.patch
@@ -0,0 +1,28 @@
+From c92890c5e18bb6ee23bdb14074bacf306dd9428f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 5 May 2015 20:35:01 -0700
+Subject: [PATCH] include cstdio to get printf definitions
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/engine/boxml/BoxMLHOVElement.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/engine/boxml/BoxMLHOVElement.cc b/src/engine/boxml/BoxMLHOVElement.cc
+index 1a2812c..96c9eea 100644
+--- a/src/engine/boxml/BoxMLHOVElement.cc
++++ b/src/engine/boxml/BoxMLHOVElement.cc
+@@ -21,7 +21,7 @@
+ // <http://www.gnu.org/licenses/>.
+ 
+ #include <config.h>
+-
++#include <cstdio>
+ #include "BoxMLAttributeSignatures.hh"
+ #include "BoxMLHOVElement.hh"
+ #include "BoxMLHElement.hh"
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview/mathview-gcc43x.diff b/meta-oe/recipes-extended/mml-widget/gtkmathview/mathview-gcc43x.diff
deleted file mode 100644
index fcc52c1..0000000
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview/mathview-gcc43x.diff
+++ /dev/null
@@ -1,63 +0,0 @@
---- /tmp/mathVariantAux.cc	2008-07-13 15:56:56.000000000 +0200
-+++ gtkmathview-0.8.0/src/engine/mathml/mathVariantAux.cc	2008-07-13 15:57:46.893198000 +0200
-@@ -20,6 +20,8 @@
- 
- #include <cassert>
- 
-+#include <string.h>
-+
- #include "mathVariantAux.hh"
- 
- static MathVariantAttributes vattr[] = {
---- /tmp/T1_FontDataBase.cc	2008-07-13 16:25:24.000000000 +0200
-+++ gtkmathview-0.8.0/src/backend/ps/T1_FontDataBase.cc	2008-07-13 16:25:47.123198000 +0200
-@@ -20,6 +20,7 @@
- #include <config.h>
- #include <map>
- #include <string>
-+#include <string.h>
- #include <stdlib.h>
- #include <iostream>
- #include <list>
---- /tmp/SMS.cc	2008-07-13 16:27:23.000000000 +0200
-+++ gtkmathview-0.8.0/mathmlsvg/SMS.cc	2008-07-13 16:27:41.543198000 +0200
-@@ -19,6 +19,7 @@
- #include <config.h>
- 
- #include <sstream>
-+#include <string.h>
- #include "defs.h"
- #include "AbstractLogger.hh"
- #include "ValueConversion.hh"
---- /tmp/main.cc	2008-07-13 16:29:11.000000000 +0200
-+++ gtkmathview-0.8.0/mathmlsvg/main.cc	2008-07-13 16:29:28.813198000 +0200
-@@ -20,7 +20,7 @@
- 
- #include <cassert>
- #include <fstream>
--
-+#include <string.h>
- #include <popt.h>
- 
- // needed for old versions of GCC, must come before String.hh!
---- /tmp/main.cc	2008-07-13 16:30:11.000000000 +0200
-+++ gtkmathview-0.8.0/mathmlps/main.cc	2008-07-13 16:30:33.183198000 +0200
-@@ -20,7 +20,7 @@
- 
- #include <cassert>
- #include <fstream>
--
-+#include <string.h>
- #include <popt.h>
- 
- // needed for old versions of GCC, must come before String.hh!
---- gtkmathview-0.8.0.orig/src/common/AbstractLogger.cc	2007-08-17 12:02:45.000000000 +0200
-+++ gtkmathview-0.8.0/src/common/AbstractLogger.cc	2010-02-01 10:19:46.000000000 +0100
-@@ -19,6 +19,7 @@
- #include <config.h>
- 
- #include <stdarg.h>
-+#include <stdio.h>
- 
- #include "AbstractLogger.hh"
- 
diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview/mathview-gcc47x.diff b/meta-oe/recipes-extended/mml-widget/gtkmathview/mathview-gcc47x.diff
deleted file mode 100644
index 11b7260..0000000
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview/mathview-gcc47x.diff
+++ /dev/null
@@ -1,48 +0,0 @@
-../../../src/frontend/common/TemplateBuilder.hh:50:113: warning: 'linkerAssoc' was not declared in this scope, and no declarations were found by argument-dependent lookup at the point of instantiation [-fpermissive]
-../../../src/frontend/common/TemplateBuilder.hh:50:113: note: declarations in dependent base 'custom_reader_Builder' are not found by unqualified lookup
-../../../src/frontend/common/TemplateBuilder.hh:50:113: note: use 'this->linkerAssoc' instead
-../../../src/frontend/common/TemplateBuilder.hh:54:111: error: redeclaration of 'SmartPtr<BoxMLDecorElement> elem'
-../../../src/frontend/common/TemplateBuilder.hh:50:49: error: 'SmartPtr<BoxMLDecorElement> elem' previously declared here
-../../../src/frontend/common/TemplateBuilder.hh:55:2: warning: 'linkerAdd' was not declared in this scope, and no declarations were found by argument-dependent lookup at the point of instantiation [-fpermissive]
-../../../src/frontend/common/TemplateBuilder.hh:55:2: note: declarations in dependent base 'custom_reader_Builder' are not found by unqualified lookup
-../../../src/frontend/common/TemplateBuilder.hh:55:2: note: use 'this->linkerAdd' instead
-
---- gtkmathview-0.8.0.orig/src/frontend/common/TemplateBuilder.hh	2007-08-17 12:02:34.000000000 +0200
-+++ gtkmathview-0.8.0/src/frontend/common/TemplateBuilder.hh	2012-04-30 11:45:07.000000000 +0200
-@@ -47,12 +47,13 @@
-   SmartPtr<typename ElementBuilder::type>
-   getElement(const typename Model::Element& el) const
-   {
--    if (SmartPtr<typename ElementBuilder::type> elem = smart_cast<typename ElementBuilder::type>(linkerAssoc(el)))
-+    SmartPtr<typename ElementBuilder::type> elem = NULL;
-+    if (elem = smart_cast<typename ElementBuilder::type>(this->linkerAssoc(el)))
-       return elem;
-     else
-       {
--	SmartPtr<typename ElementBuilder::type> elem = ElementBuilder::type::create(ElementBuilder::getContext(*this));
--	linkerAdd(el, elem);
-+	elem = ElementBuilder::type::create(ElementBuilder::getContext(*this));
-+	this->linkerAdd(el, elem);
- 	return elem;
-       }
-   }
---- gtkmathview-0.8.0.orig/mathmlsvg/main.cc	2012-04-30 11:35:19.000000000 +0200
-+++ gtkmathview-0.8.0/mathmlsvg/main.cc	2012-04-30 11:51:19.000000000 +0200
-@@ -20,6 +20,7 @@
- 
- #include <cassert>
- #include <fstream>
-+#include <unistd.h>
- #include <string.h>
- #include <popt.h>
- 
---- gtkmathview-0.8.0.orig/mathmlps/main.cc	2012-04-30 11:35:19.000000000 +0200
-+++ gtkmathview-0.8.0/mathmlps/main.cc	2012-04-30 11:50:57.000000000 +0200
-@@ -20,6 +20,7 @@
- 
- #include <cassert>
- #include <fstream>
-+#include <unistd.h>
- #include <string.h>
- #include <popt.h>
- 
diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview/qualify-lookup.diff b/meta-oe/recipes-extended/mml-widget/gtkmathview/qualify-lookup.diff
deleted file mode 100644
index 1d48950..0000000
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview/qualify-lookup.diff
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: gtkmathview-0.8.0/src/frontend/common/TemplateElementIterator.hh
-===================================================================
---- gtkmathview-0.8.0.orig/src/frontend/common/TemplateElementIterator.hh
-+++ gtkmathview-0.8.0/src/frontend/common/TemplateElementIterator.hh
-@@ -43,7 +43,7 @@ protected:
-   findValidNodeForward(const typename Model::Node& p0) const
-   {
-     for (typename Model::Node p = p0; p; p = Model::getNextSibling(p))
--      if (valid(p)) return Model::asElement(p);
-+      if (this->valid(p)) return Model::asElement(p);
-     return typename Model::Element();
-   }
-     
diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview/use_hostcxx.patch b/meta-oe/recipes-extended/mml-widget/gtkmathview/use_hostcxx.patch
new file mode 100644
index 0000000..3fe6328
--- /dev/null
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview/use_hostcxx.patch
@@ -0,0 +1,18 @@
+Use build_cc to compile the programs to run on build host
+helps with cross compiling
+
+Upstream-Status: Inappropriate [Cross-compiled OE specific]
+
+diff --git a/src/common/mathvariants/Makefile.am b/src/common/mathvariants/Makefile.am
+index 636ccf0..ed9921d 100644
+--- a/src/common/mathvariants/Makefile.am
++++ b/src/common/mathvariants/Makefile.am
+@@ -52,7 +52,7 @@ XSLTPROC = xsltproc
+ %.cc : %_gen.cc $(srcdir)/variant.top $(srcdir)/variant.bot
+ 	cat $(srcdir)/variant.top >$@
+ 	$(XSLTPROC) --novalid --param temp "false()" $(srcdir)/extract.xsl $(<:%_gen.cc=$(srcdir)/xml/%.xml) >>$@
+-	$(CXX) -o $(@:%.cc=%) -I$(top_builddir)/auto $<
++	$(BUILD_CXX) -o $(@:%.cc=%) -I$(top_builddir)/auto $<
+ 	echo "Char32 " >>$@
+ 	basename map_variant_$@ .cc | tr "-" "_" >>$@
+ 	echo "(Char32 ch)" >>$@
diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
index 65b07f5..2dbec7d 100644
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
@@ -5,16 +5,17 @@ LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 
 PR = "r3"
+SRCREV = "0bc2cfa0a47aed2c8a63abd989cb8da4dcceb2ec"
+PV = "0.8.0+git${SRCPV}"
 
-SRC_URI = "http://helm.cs.unibo.it/mml-widget/sources/${BP}.tar.gz \
-           file://mathview-gcc43x.diff \
-           file://mathview-gcc47x.diff \
-           file://qualify-lookup.diff \
-"
-SRC_URI[md5sum] = "b53564e553728d4b69f7d366dfeb5299"
-SRC_URI[sha256sum] = "1dc30175da6a3c560a7d62d1abe1c2f9829d988e6f1a7c5e766544575c558c43"
+SRC_URI = "git://github.com/GNOME/gtkmathview.git \
+           file://use_hostcxx.patch \
+	   file://0001-include-cstdio-to-get-printf-definitions.patch \
+          "
 
-inherit autotools-brokensep pkgconfig
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
 
 do_configure_prepend() {
     sed -i -e s:AM_BINRELOC::g ${S}/configure.ac
-- 
2.1.4


