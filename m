Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 175DD77DCD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:29:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v86JTdK1027102
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2017 12:29:39 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 12:29:39 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Sep 2017 14:23:07 -0500
Message-ID: <1504725809-12825-10-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/31] telepathy-python: Move to meta-python, requires python-dbus
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
X-List-Received-Date: Wed, 06 Sep 2017 19:29:38 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../telepathy-python-0.15.19/parallel_make.patch   | 43 ----------------------
 .../remove_duplicate_install.patch                 | 26 -------------
 .../telepathy-python_fix_for_automake_1.12.patch   | 26 -------------
 .../telepathy/telepathy-python_0.15.19.bb          | 32 ----------------
 .../telepathy-python-0.15.19/parallel_make.patch   | 43 ++++++++++++++++++++++
 .../remove_duplicate_install.patch                 | 26 +++++++++++++
 .../telepathy-python_fix_for_automake_1.12.patch   | 26 +++++++++++++
 .../telepathy/telepathy-python_0.15.19.bb          | 32 ++++++++++++++++
 8 files changed, 127 insertions(+), 127 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch
 delete mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch
 delete mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch
 delete mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
 create mode 100644 meta-python/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch
 create mode 100644 meta-python/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch
 create mode 100644 meta-python/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch
 create mode 100644 meta-python/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch b/meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch
deleted file mode 100644
index 2488246..0000000
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Add dependency of __init__.py
-
-Tasks must be done after exec of __init__, which creates the
-src/_generated directory that tasks are based on.
-
-Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
-
-Upstream-Status: Submitted
-(However it seems that this project is out of maintanence.)
-
-diff -ruN telepathy-python-0.15.19-orig/src/Makefile.am telepathy-python-0.15.19/src/Makefile.am
---- telepathy-python-0.15.19-orig/src/Makefile.am	2011-03-10 08:51:49.000000000 +0800
-+++ telepathy-python-0.15.19/src/Makefile.am	2011-03-10 08:54:45.000000000 +0800
-@@ -39,17 +39,17 @@
- XSLTPROC_OPTS = --nonet --novalid --xinclude
- tools_dir = $(top_srcdir)/tools
- 
--_generated/interfaces.py: $(tools_dir)/python-interfaces-generator.xsl $(wildcard $(spec_dir)/*.xml)
-+_generated/interfaces.py: _generated/__init__.py $(tools_dir)/python-interfaces-generator.xsl $(wildcard $(spec_dir)/*.xml)
- 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROC_OPTS) -o $@ \
- 	    $(tools_dir)/python-interfaces-generator.xsl \
- 	    $(spec_dir)/all.xml
- 
--_generated/constants.py: $(tools_dir)/python-constants-generator.xsl $(wildcard $(spec_dir)/*.xml)
-+_generated/constants.py: _generated/__init__.py $(tools_dir)/python-constants-generator.xsl $(wildcard $(spec_dir)/*.xml)
- 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROC_OPTS) -o $@ \
- 	    $(tools_dir)/python-constants-generator.xsl \
- 	    $(spec_dir)/all.xml
- 
--_generated/errors.py: $(tools_dir)/python-errors-generator.xsl $(wildcard $(spec_dir)/*.xml)
-+_generated/errors.py: _generated/__init__.py $(tools_dir)/python-errors-generator.xsl $(wildcard $(spec_dir)/*.xml)
- 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROC_OPTS) -o $@ \
- 	    $(tools_dir)/python-errors-generator.xsl \
- 	    $(spec_dir)/all.xml
-@@ -58,7 +58,7 @@
- 	$(AM_V_GEN)$(mkdir_p) $(dir $@)
- 	@echo "# Placeholder for package" > $@
- 
--_generated/%.py: $(tools_dir)/spec-to-python.xsl $(spec_dir)/%.xml
-+_generated/%.py: _generated/__init__.py $(tools_dir)/spec-to-python.xsl $(spec_dir)/%.xml
- 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROC_OPTS) -o $@ \
- 	    $(tools_dir)/spec-to-python.xsl \
- 	    $(spec_dir)/$*.xml
diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch b/meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch
deleted file mode 100644
index df95a4c..0000000
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-commit f6c67662145de889055a86a6b3b12c70a45fc8d5
-Author: Dongxiao Xu <dongxiao.xu@intel.com>
-Date:   Wed Sep 7 16:02:20 2011 +0800
-
-    Avoid duplicated installation of errors.py
-    
-    newer version of autotools don't seem to like listing files to install
-    twice. Remove one errors.py from the installation list.
-    
-    Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
-    
-    Upstream-Status: Inappropirate [upstream inactive]
-    
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 5c27dfe..7536e43 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -11,7 +11,7 @@ telepathy_PYTHON = \
- 
- # telepathy._generated.* auto-generated modules
- spec_dir = $(top_srcdir)/spec
--spec_files := $(patsubst $(spec_dir)%.xml,_generated%.py,$(wildcard $(spec_dir)/*.xml))
-+spec_files := $(filter-out _generated/errors.py, $(patsubst $(spec_dir)%.xml,_generated%.py,$(wildcard $(spec_dir)/*.xml)))
- 
- BUILT_SOURCES = \
- 	_generated/interfaces.py \
diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch b/meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch
deleted file mode 100644
index f613fdc..0000000
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Upstream-Status: Pending
-
-automake 1.12 has deprecated use of mkdir_p, and it recommends
-use of MKDIR_P instead. Changed the code to avoid these kind 
-of warning-errors.
-
-| make[1]: _generated/: Command not found
-| make[1]: *** [_generated/__init__.py] Error 127
-| make[1]: Leaving directory `/srv/home/nitin/builds2/build0/tmp/work/i586-poky-linux/telepathy-python-0.15.19-r4/telepathy-python-0.15.19/src'
-| make: *** [all-recursive] Error 1
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/07/10
-Index: telepathy-python-0.15.19/src/Makefile.am
-===================================================================
---- telepathy-python-0.15.19.orig/src/Makefile.am
-+++ telepathy-python-0.15.19/src/Makefile.am
-@@ -55,7 +55,7 @@ _generated/errors.py: _generated/__init_
- 	    $(spec_dir)/all.xml
- 
- _generated/__init__.py:
--	$(AM_V_GEN)$(mkdir_p) $(dir $@)
-+	$(AM_V_GEN)$(MKDIR_P) $(dir $@)
- 	@echo "# Placeholder for package" > $@
- 
- _generated/%.py: _generated/__init__.py $(tools_dir)/spec-to-python.xsl $(spec_dir)/%.xml
diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
deleted file mode 100644
index b7aea24..0000000
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "Telepathy IM framework - Python package"
-HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/utils.py;beginline=1;endline=17;md5=9a07d1a9791a7429a14e7b25c6c86822"
-
-DEPENDS = "libxslt-native"
-RDEPENDS_${PN} += "python-dbus"
-
-SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
-           file://parallel_make.patch \
-           file://remove_duplicate_install.patch \
-           file://telepathy-python_fix_for_automake_1.12.patch"
-
-PR = "r6"
-
-inherit autotools pythonnative
-
-SRC_URI[md5sum] = "f7ca25ab3c88874015b7e9728f7f3017"
-SRC_URI[sha256sum] = "244c0e1bf4bbd78ae298ea659fe10bf3a73738db550156767cc2477aedf72376"
-
-FILES_${PN} += "\
-    ${libdir}/python*/site-packages/telepathy/*.py \
-    ${libdir}/python*/site-packages/telepathy/*/*.py \
-"
-
-do_install_append () {
-    rm -f ${D}${libdir}/python*/site-packages/telepathy/*.pyc
-    rm -f ${D}${libdir}/python*/site-packages/telepathy/*.pyo
-    rm -f ${D}${libdir}/python*/site-packages/telepathy/*/*.pyc
-    rm -f ${D}${libdir}/python*/site-packages/telepathy/*/*.pyo
-}
diff --git a/meta-python/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch b/meta-python/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch
new file mode 100644
index 0000000..2488246
--- /dev/null
+++ b/meta-python/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch
@@ -0,0 +1,43 @@
+Add dependency of __init__.py
+
+Tasks must be done after exec of __init__, which creates the
+src/_generated directory that tasks are based on.
+
+Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
+
+Upstream-Status: Submitted
+(However it seems that this project is out of maintanence.)
+
+diff -ruN telepathy-python-0.15.19-orig/src/Makefile.am telepathy-python-0.15.19/src/Makefile.am
+--- telepathy-python-0.15.19-orig/src/Makefile.am	2011-03-10 08:51:49.000000000 +0800
++++ telepathy-python-0.15.19/src/Makefile.am	2011-03-10 08:54:45.000000000 +0800
+@@ -39,17 +39,17 @@
+ XSLTPROC_OPTS = --nonet --novalid --xinclude
+ tools_dir = $(top_srcdir)/tools
+ 
+-_generated/interfaces.py: $(tools_dir)/python-interfaces-generator.xsl $(wildcard $(spec_dir)/*.xml)
++_generated/interfaces.py: _generated/__init__.py $(tools_dir)/python-interfaces-generator.xsl $(wildcard $(spec_dir)/*.xml)
+ 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROC_OPTS) -o $@ \
+ 	    $(tools_dir)/python-interfaces-generator.xsl \
+ 	    $(spec_dir)/all.xml
+ 
+-_generated/constants.py: $(tools_dir)/python-constants-generator.xsl $(wildcard $(spec_dir)/*.xml)
++_generated/constants.py: _generated/__init__.py $(tools_dir)/python-constants-generator.xsl $(wildcard $(spec_dir)/*.xml)
+ 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROC_OPTS) -o $@ \
+ 	    $(tools_dir)/python-constants-generator.xsl \
+ 	    $(spec_dir)/all.xml
+ 
+-_generated/errors.py: $(tools_dir)/python-errors-generator.xsl $(wildcard $(spec_dir)/*.xml)
++_generated/errors.py: _generated/__init__.py $(tools_dir)/python-errors-generator.xsl $(wildcard $(spec_dir)/*.xml)
+ 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROC_OPTS) -o $@ \
+ 	    $(tools_dir)/python-errors-generator.xsl \
+ 	    $(spec_dir)/all.xml
+@@ -58,7 +58,7 @@
+ 	$(AM_V_GEN)$(mkdir_p) $(dir $@)
+ 	@echo "# Placeholder for package" > $@
+ 
+-_generated/%.py: $(tools_dir)/spec-to-python.xsl $(spec_dir)/%.xml
++_generated/%.py: _generated/__init__.py $(tools_dir)/spec-to-python.xsl $(spec_dir)/%.xml
+ 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROC_OPTS) -o $@ \
+ 	    $(tools_dir)/spec-to-python.xsl \
+ 	    $(spec_dir)/$*.xml
diff --git a/meta-python/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch b/meta-python/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch
new file mode 100644
index 0000000..df95a4c
--- /dev/null
+++ b/meta-python/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch
@@ -0,0 +1,26 @@
+commit f6c67662145de889055a86a6b3b12c70a45fc8d5
+Author: Dongxiao Xu <dongxiao.xu@intel.com>
+Date:   Wed Sep 7 16:02:20 2011 +0800
+
+    Avoid duplicated installation of errors.py
+    
+    newer version of autotools don't seem to like listing files to install
+    twice. Remove one errors.py from the installation list.
+    
+    Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
+    
+    Upstream-Status: Inappropirate [upstream inactive]
+    
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 5c27dfe..7536e43 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -11,7 +11,7 @@ telepathy_PYTHON = \
+ 
+ # telepathy._generated.* auto-generated modules
+ spec_dir = $(top_srcdir)/spec
+-spec_files := $(patsubst $(spec_dir)%.xml,_generated%.py,$(wildcard $(spec_dir)/*.xml))
++spec_files := $(filter-out _generated/errors.py, $(patsubst $(spec_dir)%.xml,_generated%.py,$(wildcard $(spec_dir)/*.xml)))
+ 
+ BUILT_SOURCES = \
+ 	_generated/interfaces.py \
diff --git a/meta-python/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch b/meta-python/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch
new file mode 100644
index 0000000..f613fdc
--- /dev/null
+++ b/meta-python/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch
@@ -0,0 +1,26 @@
+Upstream-Status: Pending
+
+automake 1.12 has deprecated use of mkdir_p, and it recommends
+use of MKDIR_P instead. Changed the code to avoid these kind 
+of warning-errors.
+
+| make[1]: _generated/: Command not found
+| make[1]: *** [_generated/__init__.py] Error 127
+| make[1]: Leaving directory `/srv/home/nitin/builds2/build0/tmp/work/i586-poky-linux/telepathy-python-0.15.19-r4/telepathy-python-0.15.19/src'
+| make: *** [all-recursive] Error 1
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/07/10
+Index: telepathy-python-0.15.19/src/Makefile.am
+===================================================================
+--- telepathy-python-0.15.19.orig/src/Makefile.am
++++ telepathy-python-0.15.19/src/Makefile.am
+@@ -55,7 +55,7 @@ _generated/errors.py: _generated/__init_
+ 	    $(spec_dir)/all.xml
+ 
+ _generated/__init__.py:
+-	$(AM_V_GEN)$(mkdir_p) $(dir $@)
++	$(AM_V_GEN)$(MKDIR_P) $(dir $@)
+ 	@echo "# Placeholder for package" > $@
+ 
+ _generated/%.py: _generated/__init__.py $(tools_dir)/spec-to-python.xsl $(spec_dir)/%.xml
diff --git a/meta-python/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb b/meta-python/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
new file mode 100644
index 0000000..b7aea24
--- /dev/null
+++ b/meta-python/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Telepathy IM framework - Python package"
+HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+                    file://src/utils.py;beginline=1;endline=17;md5=9a07d1a9791a7429a14e7b25c6c86822"
+
+DEPENDS = "libxslt-native"
+RDEPENDS_${PN} += "python-dbus"
+
+SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
+           file://parallel_make.patch \
+           file://remove_duplicate_install.patch \
+           file://telepathy-python_fix_for_automake_1.12.patch"
+
+PR = "r6"
+
+inherit autotools pythonnative
+
+SRC_URI[md5sum] = "f7ca25ab3c88874015b7e9728f7f3017"
+SRC_URI[sha256sum] = "244c0e1bf4bbd78ae298ea659fe10bf3a73738db550156767cc2477aedf72376"
+
+FILES_${PN} += "\
+    ${libdir}/python*/site-packages/telepathy/*.py \
+    ${libdir}/python*/site-packages/telepathy/*/*.py \
+"
+
+do_install_append () {
+    rm -f ${D}${libdir}/python*/site-packages/telepathy/*.pyc
+    rm -f ${D}${libdir}/python*/site-packages/telepathy/*.pyo
+    rm -f ${D}${libdir}/python*/site-packages/telepathy/*/*.pyc
+    rm -f ${D}${libdir}/python*/site-packages/telepathy/*/*.pyo
+}
-- 
1.8.3.1


