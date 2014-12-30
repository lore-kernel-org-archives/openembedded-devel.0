Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 86B1E72651
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Dec 2014 13:54:44 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id a1so20619726wgh.23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Dec 2014 05:54:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=x1cgHGsy/LCg1KDd2dG+H2x1tbBMKfO1Cp4oZA4v+tE=;
	b=Rud/0KKLYog7ebWfWIaqpJxcOj19ZJ00lfH9xwVqWn3cHa0EmRSvGYS/LBxtwPk+vM
	u4wDXLrdo3dZRH1N1e5thcTYK7vS2q7bNT+qwriFuHRLX3ToTuo1JLklgLn1WUCn+hKa
	HjjU1lqkwOQQWn9rloT8A6SFx4qzDxcoxKiq/LzgWhg4LJep5EoBh2F3mGs8kCEm9GMB
	+AddWW+3WcymnX4kpK86Iud2SU9eCE0S0JfTdunhS7PFq7Y9XASkIYzqEyMuVrONtpWB
	JVLp3rEXZUrwavqvYk+W6qZBwcGg3dFtCKBx801g8mmRJFEm8jbaShljvemSDPLBHUDk
	DbPA==
X-Gm-Message-State: ALoCoQnQvp9lBAZJeTyllLDm9rHthcY7TTNAmXgLzdK5/QsxZn17DMwD4/aUH/4Gi6AUKuB/6iNb
X-Received: by 10.194.61.18 with SMTP id l18mr122262519wjr.42.1419947684091;
	Tue, 30 Dec 2014 05:54:44 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	gb10sm28759925wjb.21.2014.12.30.05.54.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Dec 2014 05:54:43 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Dec 2014 13:53:34 +0000
Message-Id: <1419947615-27947-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1419947615-27947-1-git-send-email-ross.burton@intel.com>
References: <1419947615-27947-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/5] telepathy-python: add (moved from oe-core)
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
X-List-Received-Date: Tue, 30 Dec 2014 13:54:48 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../telepathy-python-0.15.19/parallel_make.patch   |   43 ++++++++++++++++++++
 .../remove_duplicate_install.patch                 |   26 ++++++++++++
 .../telepathy-python_fix_for_automake_1.12.patch   |   26 ++++++++++++
 .../telepathy/telepathy-python_0.15.19.bb          |   32 +++++++++++++++
 4 files changed, 127 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch
 create mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch
 create mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch
 create mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch b/meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch
new file mode 100644
index 0000000..2488246
--- /dev/null
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch
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
diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch b/meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch
new file mode 100644
index 0000000..df95a4c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch
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
diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch b/meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch
new file mode 100644
index 0000000..f613fdc
--- /dev/null
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch
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
diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
new file mode 100644
index 0000000..1716702
--- /dev/null
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
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
+    "
+
+do_install_append () {
+	rm -f ${D}${libdir}/python*/site-packages/telepathy/*.pyc
+	rm -f ${D}${libdir}/python*/site-packages/telepathy/*.pyo
+	rm -f ${D}${libdir}/python*/site-packages/telepathy/*/*.pyc
+	rm -f ${D}${libdir}/python*/site-packages/telepathy/*/*.pyo
+}
-- 
1.7.10.4


