Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5F5986FFF7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2016 11:56:10 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2016 04:56:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498925"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:56:12 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 May 2016 14:57:01 +0300
Message-Id: <8a8d970888e731be1ff4d552b344a4754d5563e3.1464090710.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
References: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
References: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 8/8] gnome-doc-utils-stub: add a recipe
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
X-List-Received-Date: Tue, 24 May 2016 11:56:10 -0000

Real gnome-doc-utils can no longer be build (because
it requires both python 2 and libxml2, which can only be
build for one version of Python), so a stub recipe which
provides just m4 macros is provided, and usage of
gnome-doc-utils is disabled where needed.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-extended/gparted/gparted_0.24.0.bb     |   2 +-
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb         |   1 +
 .../0001-Remove-help-directory-from-build.patch    |  29 +
 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb     |  12 +-
 .../gnome-control-center_2.32.1.bb                 |   1 +
 .../gnome-desktop/gnome-desktop_2.32.1.bb          |   1 +
 .../0001-Add-gnome-doc-utils.make.patch            | 730 +++++++++++++++++++++
 .../gnome-panel/gnome-panel_2.32.1.bb              |   4 +-
 .../0001-Drop-help-directory-from-build.patch      |  25 +
 meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb   |   7 +-
 meta-oe/recipes-devtools/geany/geany_1.27.bb       |   4 +-
 meta-oe/recipes-devtools/glade/glade3_3.8.5.bb     |   6 +-
 .../gnome-doc-utils-stub/files/gnome-doc-utils.m4  |  61 ++
 .../gnome-doc-utils-stub_1.0.bb                    |  18 +
 14 files changed, 882 insertions(+), 19 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gedit/files/0001-Remove-help-directory-from-build.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Add-gnome-doc-utils.make.patch
 create mode 100644 meta-gnome/recipes-gnome/gthumb/files/0001-Drop-help-directory-from-build.patch
 create mode 100644 meta-oe/recipes-gnome/gnome-doc-utils-stub/files/gnome-doc-utils.m4
 create mode 100644 meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb

diff --git a/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb b/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
index 2f38977..c1666a3 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
 SRC_URI[md5sum] = "b8480274c68876acff5965d4346710e7"
 SRC_URI[sha256sum] = "02398ab33894a59b0bd8707e598c46d8bb56f1413cd54de48eed61e2920ecd60"
 
-DEPENDS = "glib-2.0 gtkmm parted gnome-doc-utils-native"
+DEPENDS = "glib-2.0 gtkmm parted gnome-doc-utils"
 
 do_install_append() {
     # Add a script which checks if polkit is installed.
diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index 259c609..9ede2f5 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -34,6 +34,7 @@ EXTRA_OECONF = " \
 
 do_configure_prepend() {
     sed -i -e "s:\bdocs::g" ${S}/Makefile.am
+    rm -f ${S}/m4/gnome-doc-utils.m4
 }
 
 do_install_prepend() {
diff --git a/meta-gnome/recipes-gnome/gedit/files/0001-Remove-help-directory-from-build.patch b/meta-gnome/recipes-gnome/gedit/files/0001-Remove-help-directory-from-build.patch
new file mode 100644
index 0000000..4ad57ef
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gedit/files/0001-Remove-help-directory-from-build.patch
@@ -0,0 +1,29 @@
+From 1d2e6165e3154e27ecde329a40c05f0880afb9e0 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 17 May 2016 14:14:03 +0300
+Subject: [PATCH] Remove help directory from build
+
+It hardcodes the use of xml2po utility, which is provided by obsolete gnome-doc-utils
+
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Makefile.am | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index e57b203..a88152d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -3,9 +3,6 @@ ACLOCAL_AMFLAGS = -I m4
+ 
+ SUBDIRS = gedit pixmaps po data plugin-loaders plugins docs tests win32 osx
+ 
+-if !OS_OSX
+-SUBDIRS += help
+-endif
+ 
+ distuninstallcheck_listfiles = find . -type f -print | grep -v scrollkeeper
+ 
+-- 
+2.8.1
+
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
index 1c7b7e3..4ae5bbb 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
@@ -3,12 +3,13 @@ SECTION = "x11/gnome"
 LICENSE = "GPLv2+"
 PR = "r2"
 
-DEPENDS = "gvfs enchant gconf gnome-doc-utils gnome-doc-utils-native glib-2.0 gtk+ gtksourceview2 iso-codes"
+DEPENDS = "gvfs enchant gconf gnome-doc-utils glib-2.0 gtk+ gtksourceview2 iso-codes"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit gnome gettext pythonnative
-SRC_URI+= "file://0001-workaround-void-pointer-arithmetic.patch"
+SRC_URI+= "file://0001-workaround-void-pointer-arithmetic.patch \
+           file://0001-Remove-help-directory-from-build.patch"
 SRC_URI[archive.md5sum] = "e1eecb0a92a1a363b3d375ec5ac0fb3b"
 SRC_URI[archive.sha256sum] = "a561fe3dd1d199baede1bd07c4ee65f06fc7c494dd4d3327117f04149a608e3c"
 GNOME_COMPRESS_TYPE="bz2"
@@ -16,13 +17,6 @@ GNOME_COMPRESS_TYPE="bz2"
 EXTRA_OECONF = "--disable-scrollkeeper \
                 --enable-gvfs-metadata"
 
-do_configure_prepend() {
-    cd ${S}
-    gnome-doc-common --copy || true
-    gnome-doc-prepare --force --copy || true
-    cd ${B}
-}
-
 FILES_${PN} += "${libdir}/gedit-2/plugin* ${datadir}/gedit-2"
 FILES_${PN}-dbg += "${libdir}/gedit-2/plugin-loaders/.debug ${libdir}/gedit-2/plugins/.debug"
 
diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
index 86b913b..dfb8133 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
@@ -16,6 +16,7 @@ LDFLAGS += "-lgthread-2.0 -lxml2"
 
 do_configure_prepend() {
     sed -i s:help::g ${S}/Makefile.am
+    rm -r ${S}/m4/gnome-doc-utils.m4
 }
 do_install_append() {
     rm -rf ${D}${datadir}/mime
diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
index 703c397..d5f6035 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
@@ -18,6 +18,7 @@ EXTRA_OECONF = "--disable-scrollkeeper --disable-desktop-docs --disable-gnome-ab
 
 do_configure_prepend () {
     sed -i -e s:^#!@PYTHON@:#!${bindir}/python: ${S}/gnome-about/gnome-about.in
+    rm -f ${S}/m4/gnome-doc-utils.m4
 }
 
 PACKAGES =+ "libgnome-desktop"
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Add-gnome-doc-utils.make.patch b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Add-gnome-doc-utils.make.patch
new file mode 100644
index 0000000..fdcccb9
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Add-gnome-doc-utils.make.patch
@@ -0,0 +1,730 @@
+From 7345730ac882ee5a493254e5cf9162c96c648ef2 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 17 May 2016 14:40:33 +0300
+Subject: [PATCH] Add gnome-doc-utils.make
+
+Since the sources are taken from git, the file is absent
+(and is installed by tools from gnome-doc-utils which
+are no longer provided).
+
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gnome-doc-utils.make | 706 +++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 706 insertions(+)
+ create mode 100644 gnome-doc-utils.make
+
+diff --git a/gnome-doc-utils.make b/gnome-doc-utils.make
+new file mode 100644
+index 0000000..b2e0fa1
+--- /dev/null
++++ b/gnome-doc-utils.make
+@@ -0,0 +1,706 @@
++# gnome-doc-utils.make - make magic for building documentation
++# Copyright (C) 2004-2005 Shaun McCance <shaunm@gnome.org>
++#
++# This program is free software; you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation; either version 2 of the License, or
++# (at your option) any later version.
++#
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++#
++# You should have received a copy of the GNU General Public License
++# along with this program; if not, write to the Free Software Foundation,
++# Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
++#
++# As a special exception to the GNU General Public License, if you
++# distribute this file as part of a program that contains a
++# configuration script generated by Autoconf, you may include it under
++# the same distribution terms that you use for the rest of that program.
++
++################################################################################
++## @@ Generating Header Files
++
++## @ DOC_H_FILE
++## The name of the header file to generate
++DOC_H_FILE ?=
++
++## @ DOC_H_DOCS
++## The input DocBook files for generating the header file
++DOC_H_DOCS ?=
++
++$(DOC_H_FILE): $(DOC_H_DOCS);
++	@rm -f $@.tmp; touch $@.tmp;
++	echo 'const gchar* documentation_credits[] = {' >> $@.tmp
++	list='$(DOC_H_DOCS)'; for doc in $$list; do \
++	  xmlpath="`echo $$doc | sed -e 's/^\(.*\/\).*/\1/' -e '/\//!s/.*//'`:$(srcdir)/`echo $$doc | sed -e 's/^\(.*\/\).*/\1/' -e '/\//!s/.*//'`"; \
++	  if ! test -f "$$doc"; then doc="$(srcdir)/$$doc"; fi; \
++	  xsltproc -nonet --path "$$xmlpath" $(_credits) $$doc; \
++	done | sort | uniq \
++	  | awk 'BEGIN{s=""}{n=split($$0,w,"<");if(s!=""&&s!=substr(w[1],1,length(w[1])-1)){print s};if(n>1){print $$0;s=""}else{s=$$0}};END{if(s!=""){print s}}' \
++	  | sed -e 's/\\/\\\\/' -e 's/"/\\"/' -e 's/\(.*\)/\t"\1",/' >> $@.tmp
++	echo '	NULL' >> $@.tmp
++	echo '};' >> $@.tmp
++	echo >> $@.tmp
++	list='$(DOC_H_DOCS)'; for doc in $$list; do \
++	  xmlpath="`echo $$doc | sed -e 's/^\(.*\/\).*/\1/' -e '/\//!s/.*//'`:$(srcdir)/`echo $$doc | sed -e 's/^\(.*\/\).*/\1/' -e '/\//!s/.*//'`"; \
++	  if ! test -f "$$doc"; then doc="$(srcdir)/$$doc"; fi; \
++	  docid=`echo "$$doc" | sed -e 's/.*\/\([^/]*\)\.xml/\1/' \
++	    | sed -e 's/[^a-zA-Z_]/_/g' | tr 'a-z' 'A-Z'`; \
++	  echo $$xmlpath; \
++	  ids=`xsltproc -nonet --xinclude --path "$$xmlpath" $(_ids) $$doc`; \
++	  for id in $$ids; do \
++	    echo '#define HELP_'`echo $$docid`'_'`echo $$id \
++	      | sed -e 's/[^a-zA-Z_]/_/g' | tr 'a-z' 'A-Z'`' "'$$id'"' >> $@.tmp; \
++	  done; \
++	  echo >> $@.tmp; \
++	done;
++	cp $@.tmp $@ && rm -f $@.tmp
++
++dist-check-gdu:
++if !HAVE_GNOME_DOC_UTILS
++	@echo "*** GNOME Doc Utils must be installed in order to make dist"
++	@false
++endif
++
++.PHONY: dist-doc-header
++dist-doc-header: $(DOC_H_FILE)
++	@if test -f "$(DOC_H_FILE)"; then d=; else d="$(srcdir)/"; fi; \
++	echo "$(INSTALL_DATA) $${d}$(DOC_H_FILE) $(distdir)/$(DOC_H_FILE)"; \
++	$(INSTALL_DATA) "$${d}$(DOC_H_FILE)" "$(distdir)/$(DOC_H_FILE)";
++
++doc-dist-hook: dist-check-gdu $(if $(DOC_H_FILE),dist-doc-header)
++
++.PHONY: clean-doc-header
++_clean_doc_header = $(if $(DOC_H_FILE),clean-doc-header)
++clean-local: $(_clean_doc_header)
++distclean-local: $(_clean_doc_header)
++mostlyclean-local: $(_clean_doc_header)
++maintainer-clean-local: $(_clean_doc_header)
++clean-doc-header:
++	rm -f $(DOC_H_FILE)
++
++all: $(DOC_H_FILE)
++
++
++################################################################################
++## @@ Generating Documentation Files
++
++## @ DOC_MODULE
++## The name of the document being built
++DOC_MODULE ?=
++
++## @ DOC_ID
++## The unique identifier for a Mallard document
++DOC_ID ?=
++
++## @ DOC_PAGES
++## Page files in a Mallard document
++DOC_PAGES ?=
++
++## @ DOC_ENTITIES
++## Files included with a SYSTEM entity
++DOC_ENTITIES ?=
++
++## @ DOC_INCLUDES
++## Files included with XInclude
++DOC_INCLUDES ?=
++
++## @ DOC_FIGURES
++## Figures and other external data
++DOC_FIGURES ?=
++
++## @ DOC_FORMATS
++## The default formats to be built and installed
++DOC_FORMATS ?= docbook
++_DOC_REAL_FORMATS = $(if $(DOC_USER_FORMATS),$(DOC_USER_FORMATS),$(DOC_FORMATS))
++
++## @ DOC_LINGUAS
++## The languages this document is translated into
++DOC_LINGUAS ?=
++_DOC_REAL_LINGUAS = $(if $(filter environment,$(origin LINGUAS)),		\
++	$(filter $(LINGUAS),$(DOC_LINGUAS)),					\
++	$(DOC_LINGUAS))
++
++_DOC_ABS_SRCDIR = @abs_srcdir@
++
++
++################################################################################
++## Variables for Bootstrapping
++
++_xml2po ?= `which xml2po`
++_xml2po_mode = $(if $(DOC_ID),mallard,docbook)
++
++_db2html ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2html gnome-doc-utils`
++_db2omf  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2omf gnome-doc-utils`
++_chunks  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
++_credits ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
++_ids ?= ${PKG_CONFIG_SYSROOT_DIR}$(shell $(PKG_CONFIG) --variable xmldir gnome-doc-utils)/gnome/xslt/docbook/utils/ids.xsl
++
++if ENABLE_SK
++_ENABLE_SK = true
++_skpkgdatadir ?= `scrollkeeper-config --pkgdatadir`
++_sklocalstatedir ?= `scrollkeeper-config --pkglocalstatedir`
++_skcontentslist ?= $(_skpkgdatadir)/Templates/C/scrollkeeper_cl.xml
++endif
++
++
++################################################################################
++## Support for automake silent-rules
++GDU_V_XML2PO=$(GDU__v_XML2PO_$(V))
++GDU__v_XML2PO_=$(GDU__v_XML2PO_$(AM_DEFAULT_VERBOSITY))
++GDU__v_XML2PO_0=@echo "  XML2PO" $@;
++
++GDU_V_MSGFMT=$(GDU__v_MSGFMT_$(V))
++GDU__v_MSGFMT_=$(GDU__v_MSGFMT_$(AM_DEFAULT_VERBOSITY))
++GDU__v_MSGFMT_0=@echo "  MSGFMT" $@;
++
++GDU_V_DB2OMF=$(GDU__v_DB2OMF_$(V))
++GDU__v_DB2OMF_=$(GDU__v_DB2OMF_$(AM_DEFAULT_VERBOSITY))
++GDU__v_DB2OMF_0=@echo "  DB2OMF" $@;
++
++GDU_V_DB2HTM=$(GDU__v_DB2HTM_$(V))
++GDU__v_DB2HTM_=$(GDU__v_DB2HTM_$(AM_DEFAULT_VERBOSITY))
++GDU__v_DB2HTM_0=@echo "  DB2HTM" $@;
++
++################################################################################
++## @@ Rules for OMF Files
++
++db2omf_args =									\
++	--stringparam db2omf.basename $(DOC_MODULE)				\
++	--stringparam db2omf.format $(3)					\
++	--stringparam db2omf.dtd						\
++	$(shell xmllint --format $(2) | grep -h PUBLIC | head -n 1 		\
++		| sed -e 's/.*PUBLIC \(\"[^\"]*\"\).*/\1/')			\
++	--stringparam db2omf.lang $(notdir $(patsubst %/$(notdir $(2)),%,$(2)))	\
++	--stringparam db2omf.omf_dir "$(OMF_DIR)"				\
++	--stringparam db2omf.help_dir "$(HELP_DIR)"				\
++	--stringparam db2omf.omf_in "$(_DOC_OMF_IN)"				\
++	$(if $(_ENABLE_SK),							\
++	  --stringparam db2omf.scrollkeeper_cl "$(_skcontentslist)")		\
++	$(_db2omf) $(2)
++
++## @ _DOC_OMF_IN
++## The OMF input file
++_DOC_OMF_IN = $(if $(DOC_MODULE),$(wildcard $(_DOC_ABS_SRCDIR)/$(DOC_MODULE).omf.in))
++
++## @ _DOC_OMF_DB
++## The OMF files for DocBook output
++_DOC_OMF_DB = $(if $(_DOC_OMF_IN),						\
++	$(foreach lc,C $(_DOC_REAL_LINGUAS),$(DOC_MODULE)-$(lc).omf))
++
++$(_DOC_OMF_DB) : $(_DOC_OMF_IN)
++$(_DOC_OMF_DB) : $(DOC_MODULE)-%.omf : %/$(DOC_MODULE).xml
++	@test "x$(_ENABLE_SK)" != "xtrue" -o -f "$(_skcontentslist)" || {	\
++	  echo "The file '$(_skcontentslist)' does not exist." >&2;		\
++	  echo "Please check your ScrollKeeper installation." >&2;		\
++	  exit 1; }
++	$(GDU_V_DB2OMF)xsltproc -nonet -o $@ $(call db2omf_args,$@,$<,'docbook') || { rm -f "$@"; exit 1; }
++
++## @ _DOC_OMF_HTML
++## The OMF files for HTML output
++_DOC_OMF_HTML = $(if $(_DOC_OMF_IN),						\
++	$(foreach lc,C $(_DOC_REAL_LINGUAS),$(DOC_MODULE)-html-$(lc).omf))
++
++$(_DOC_OMF_HTML) : $(_DOC_OMF_IN)
++$(_DOC_OMF_HTML) : $(DOC_MODULE)-html-%.omf : %/$(DOC_MODULE).xml
++if ENABLE_SK
++	@test "x$(_ENABLE_SK)" != "xtrue" -o -f "$(_skcontentslist)" || {	\
++	  echo "The file '$(_skcontentslist)' does not exist" >&2;		\
++	  echo "Please check your ScrollKeeper installation." >&2;		\
++	  exit 1; }
++endif
++	$(GDU_V_DB2OMF)xsltproc -nonet -o $@ $(call db2omf_args,$@,$<,'xhtml') || { rm -f "$@"; exit 1; }
++
++## @ _DOC_OMF_ALL
++## All OMF output files to be built
++# FIXME
++_DOC_OMF_ALL =									\
++	$(if $(filter docbook,$(_DOC_REAL_FORMATS)),$(_DOC_OMF_DB))		\
++	$(if $(filter html HTML,$(_DOC_REAL_FORMATS)),$(_DOC_OMF_HTML))
++
++.PHONY: omf
++omf: $(_DOC_OMF_ALL)
++
++
++################################################################################
++## @@ C Locale Documents
++
++## @ _DOC_C_MODULE
++## The top-level documentation file in the C locale
++_DOC_C_MODULE = $(if $(DOC_MODULE),C/$(DOC_MODULE).xml)
++
++## @ _DOC_C_PAGES
++## Page files in a Mallard document in the C locale
++_DOC_C_PAGES = $(foreach page,$(DOC_PAGES),C/$(page))
++
++## @ _DOC_C_ENTITIES
++## Files included with a SYSTEM entity in the C locale
++_DOC_C_ENTITIES = $(foreach ent,$(DOC_ENTITIES),C/$(ent))
++
++## @ _DOC_C_XINCLUDES
++## Files included with XInclude in the C locale
++_DOC_C_INCLUDES = $(foreach inc,$(DOC_INCLUDES),C/$(inc))
++
++## @ _DOC_C_DOCS
++## All documentation files in the C locale
++_DOC_C_DOCS =								\
++	$(_DOC_C_ENTITIES)	$(_DOC_C_INCLUDES)			\
++	$(_DOC_C_PAGES)		$(_DOC_C_MODULE)
++
++## @ _DOC_C_DOCS_NOENT
++## All documentation files in the C locale,
++## except files included with a SYSTEM entity
++_DOC_C_DOCS_NOENT =							\
++	$(_DOC_C_MODULE)	$(_DOC_C_INCLUDES)			\
++	$(_DOC_C_PAGES)
++
++## @ _DOC_C_FIGURES
++## All figures and other external data in the C locale
++_DOC_C_FIGURES = $(if $(DOC_FIGURES),					\
++	$(foreach fig,$(DOC_FIGURES),C/$(fig)),				\
++	$(patsubst $(srcdir)/%,%,$(wildcard $(srcdir)/C/figures/*.png)))
++
++## @ _DOC_C_HTML
++## All HTML documentation in the C locale
++# FIXME: probably have to shell escape to determine the file names
++_DOC_C_HTML = $(foreach f,						\
++	$(shell xsltproc -nonet --xinclude 					\
++	  --stringparam db.chunk.basename "$(DOC_MODULE)"		\
++	  $(_chunks) "C/$(DOC_MODULE).xml"),				\
++	C/$(f).xhtml)
++
++###############################################################################
++## @@ Other Locale Documentation
++
++## @ _DOC_POFILES
++## The .po files used for translating the document
++_DOC_POFILES = $(if $(DOC_MODULE)$(DOC_ID),					\
++	$(foreach lc,$(_DOC_REAL_LINGUAS),$(lc)/$(lc).po))
++
++.PHONY: po
++po: $(_DOC_POFILES)
++
++## @ _DOC_MOFILES
++## The .mo files used for translating the document
++_DOC_MOFILES = $(patsubst %.po,%.mo,$(_DOC_POFILES))
++
++.PHONY: mo
++mo: $(_DOC_MOFILES)
++
++## @ _DOC_LC_MODULES
++## The top-level documentation files in all other locales
++_DOC_LC_MODULES = $(if $(DOC_MODULE),						\
++	$(foreach lc,$(_DOC_REAL_LINGUAS),$(lc)/$(DOC_MODULE).xml))
++
++## @ _DOC_LC_PAGES
++## Page files in a Mallard document in all other locales
++_DOC_LC_PAGES =									\
++	$(foreach lc,$(_DOC_REAL_LINGUAS),$(foreach page,$(_DOC_C_PAGES),	\
++		$(lc)/$(notdir $(page)) ))
++
++## @ _DOC_LC_XINCLUDES
++## Files included with XInclude in all other locales
++_DOC_LC_INCLUDES =								\
++	$(foreach lc,$(_DOC_REAL_LINGUAS),$(foreach inc,$(_DOC_C_INCLUDES),	\
++		$(lc)/$(notdir $(inc)) ))
++
++## @ _DOC_LC_HTML
++## All HTML documentation in all other locales
++# FIXME: probably have to shell escape to determine the file names
++_DOC_LC_HTML =									\
++	$(foreach lc,$(_DOC_REAL_LINGUAS),$(foreach doc,$(_DOC_C_HTML),		\
++		$(lc)/$(notdir $(doc)) ))
++
++## @ _DOC_LC_DOCS
++## All documentation files in all other locales
++_DOC_LC_DOCS =									\
++	$(_DOC_LC_MODULES)	$(_DOC_LC_INCLUDES)	$(_DOC_LC_PAGES)	\
++	$(if $(filter html HTML,$(_DOC_REAL_FORMATS)),$(_DOC_LC_HTML))
++
++## @ _DOC_LC_FIGURES
++## All figures and other external data in all other locales
++_DOC_LC_FIGURES = $(foreach lc,$(_DOC_REAL_LINGUAS),				\
++	$(patsubst C/%,$(lc)/%,$(_DOC_C_FIGURES)) )
++
++_DOC_SRC_FIGURES =								\
++	$(foreach fig,$(_DOC_C_FIGURES), $(foreach lc,C $(_DOC_REAL_LINGUAS),	\
++		$(wildcard $(srcdir)/$(lc)/$(patsubst C/%,%,$(fig))) ))
++
++$(_DOC_POFILES):
++	@if ! test -d $(dir $@); then \
++	  echo "mkdir $(dir $@)"; \
++	  mkdir "$(dir $@)"; \
++	fi
++	@if test ! -f $@ -a -f $(srcdir)/$@; then \
++	  echo "cp $(srcdir)/$@ $@"; \
++	  cp "$(srcdir)/$@" "$@"; \
++	fi;
++	@docs=; \
++	list='$(_DOC_C_DOCS_NOENT)'; for doc in $$list; do \
++	  docs="$$docs $(_DOC_ABS_SRCDIR)/$$doc"; \
++	done; \
++	if ! test -f $@; then \
++	  echo "(cd $(dir $@) && \
++	    $(_xml2po) -m $(_xml2po_mode) -e $$docs > $(notdir $@).tmp && \
++	    cp $(notdir $@).tmp $(notdir $@) && rm -f $(notdir $@).tmp)"; \
++	  (cd $(dir $@) && \
++	    $(_xml2po) -m $(_xml2po_mode) -e $$docs > $(notdir $@).tmp && \
++	    cp $(notdir $@).tmp $(notdir $@) && rm -f $(notdir $@).tmp); \
++	else \
++	  echo "(cd $(dir $@) && \
++	    $(_xml2po) -m $(_xml2po_mode) -e -u $(notdir $@) $$docs)"; \
++	  (cd $(dir $@) && \
++	    $(_xml2po) -m $(_xml2po_mode) -e -u $(notdir $@) $$docs); \
++	fi
++
++$(_DOC_MOFILES): %.mo: %.po
++	$(AM_V_at)if ! test -d $(dir $@); then mkdir "$(dir $@)"; fi
++	$(GDU_V_MSGFMT)msgfmt -o $@ $<
++
++# FIXME: fix the dependancy
++# FIXME: hook xml2po up
++$(_DOC_LC_DOCS) : $(_DOC_MOFILES)
++$(_DOC_LC_DOCS) : $(_DOC_C_DOCS)
++	$(AM_V_at)if ! test -d $(dir $@); then mkdir $(dir $@); fi
++	$(GDU_V_XML2PO)if [ -f "C/$(notdir $@)" ]; then d="../"; else d="$(_DOC_ABS_SRCDIR)/"; fi; \
++	mo="$(dir $@)$(patsubst %/$(notdir $@),%,$@).mo"; \
++	if [ -f "$${mo}" ]; then mo="../$${mo}"; else mo="$(_DOC_ABS_SRCDIR)/$${mo}"; fi; \
++	(cd $(dir $@) && \
++	  $(_xml2po) -m $(_xml2po_mode) -e -t "$${mo}" \
++	    "$${d}C/$(notdir $@)" > $(notdir $@).tmp && \
++	    cp $(notdir $@).tmp $(notdir $@) && rm -f $(notdir $@).tmp)
++
++## @ _DOC_POT
++## A pot file
++_DOC_POT = $(if $(DOC_MODULE),$(DOC_MODULE).pot,$(if $(DOC_ID),$(DOC_ID).pot))
++.PHONY: pot
++pot: $(_DOC_POT)
++$(_DOC_POT): $(_DOC_C_DOCS_NOENT)
++	$(GDU_V_XML2PO)$(_xml2po) -m $(_xml2po_mode) -e -o $@ $^
++
++
++################################################################################
++## @@ All Documentation
++
++## @ _DOC_HTML_ALL
++## All HTML documentation, only if it's built
++_DOC_HTML_ALL = $(if $(filter html HTML,$(_DOC_REAL_FORMATS)), \
++	$(_DOC_C_HTML) $(_DOC_LC_HTML))
++
++_DOC_HTML_TOPS = $(foreach lc,C $(_DOC_REAL_LINGUAS),$(lc)/$(DOC_MODULE).xhtml)
++
++$(_DOC_HTML_TOPS): $(_DOC_C_DOCS) $(_DOC_LC_DOCS)
++	$(GDU_V_DB2HTM)xsltproc -nonet -o $@ --xinclude --param db.chunk.chunk_top "false()" --stringparam db.chunk.basename "$(DOC_MODULE)" --stringparam db.chunk.extension ".xhtml" $(_db2html) $(patsubst %.xhtml,%.xml,$@)
++
++
++################################################################################
++## All
++
++all:							\
++	$(_DOC_C_DOCS)		$(_DOC_LC_DOCS)		\
++	$(_DOC_OMF_ALL)		$(_DOC_DSK_ALL)		\
++	$(_DOC_HTML_ALL)	$(_DOC_POFILES)
++
++
++################################################################################
++## Clean
++
++.PHONY: clean-doc-omf clean-doc-dsk clean-doc-lc clean-doc-dir
++
++clean-doc-omf: ; rm -f $(_DOC_OMF_DB) $(_DOC_OMF_HTML)
++clean-doc-dsk: ; rm -f $(_DOC_DSK_DB) $(_DOC_DSK_HTML)
++clean-doc-lc:
++	rm -f $(_DOC_LC_DOCS)
++	rm -f $(_DOC_MOFILES)
++	@list='$(_DOC_POFILES)'; for po in $$list; do \
++	  if ! test "$$po" -ef "$(srcdir)/$$po"; then \
++	    echo "rm -f $$po"; \
++	    rm -f "$$po"; \
++	  fi; \
++	done
++#	.xml2.po.mo cleaning is obsolete as of 0.18.1 and could be removed in 0.20.x
++	@for lc in C $(_DOC_REAL_LINGUAS); do \
++	  if test -f "$$lc/.xml2po.mo"; then \
++	    echo "rm -f $$lc/.xml2po.mo"; \
++	    rm -f "$$lc/.xml2po.mo"; \
++	  fi; \
++	done
++clean-doc-dir: clean-doc-lc
++	@for lc in C $(_DOC_REAL_LINGUAS); do \
++	  for dir in `find $$lc -depth -type d`; do \
++	    if ! test $$dir -ef $(srcdir)/$$dir; then \
++	      echo "rmdir $$dir"; \
++	      rmdir "$$dir"; \
++	   fi; \
++	  done; \
++	done
++
++_clean_omf = $(if $(_DOC_OMF_IN),clean-doc-omf)
++_clean_dsk = $(if $(_DOC_DSK_IN),clean-doc-dsk)
++_clean_lc  = $(if $(_DOC_REAL_LINGUAS),clean-doc-lc)
++_clean_dir = $(if $(DOC_MODULE)$(DOC_ID),clean-doc-dir)
++
++clean-local:						\
++	$(_clean_omf)		$(_clean_dsk)		\
++	$(_clean_lc)		$(_clean_dir)
++distclean-local:					\
++	$(_clean_omf)		$(_clean_dsk)		\
++	$(_clean_lc)		$(_clean_dir)
++mostlyclean-local:					\
++	$(_clean_omf)		$(_clean_dsk)		\
++	$(_clean_lc)		$(_clean_dir)
++maintainer-clean-local:					\
++	$(_clean_omf)		$(_clean_dsk)		\
++	$(_clean_lc)		$(_clean_dir)
++
++
++
++################################################################################
++## Dist
++
++.PHONY: dist-doc-docs dist-doc-pages dist-doc-figs dist-doc-omf dist-doc-dsk
++doc-dist-hook: 						\
++	$(if $(DOC_MODULE)$(DOC_ID),dist-doc-docs)	\
++	$(if $(_DOC_C_FIGURES),dist-doc-figs)		\
++	$(if $(_DOC_OMF_IN),dist-doc-omf)
++#	$(if $(_DOC_DSK_IN),dist-doc-dsk)
++
++dist-doc-docs: $(_DOC_C_DOCS) $(_DOC_LC_DOCS) $(_DOC_POFILES)
++	@for lc in C $(_DOC_REAL_LINGUAS); do \
++	  echo " $(mkinstalldirs) $(distdir)/$$lc"; \
++	  $(mkinstalldirs) "$(distdir)/$$lc"; \
++	done
++	@list='$(_DOC_C_DOCS)'; \
++	for doc in $$list; do \
++	  if test -f "$$doc"; then d=; else d="$(srcdir)/"; fi; \
++	    docdir=`echo $$doc | sed -e 's/^\(.*\/\).*/\1/' -e '/\//!s/.*//'`; \
++	    if ! test -d "$(distdir)/$$docdir"; then \
++	      echo "$(mkinstalldirs) $(distdir)/$$docdir"; \
++	      $(mkinstalldirs) "$(distdir)/$$docdir"; \
++	    fi; \
++	  echo "$(INSTALL_DATA) $$d$$doc $(distdir)/$$doc"; \
++	  $(INSTALL_DATA) "$$d$$doc" "$(distdir)/$$doc"; \
++	done
++	@list='$(_DOC_LC_DOCS)'; \
++	for doc in $$list; do \
++	  if test -f "$$doc"; then d=; else d="$(srcdir)/"; fi; \
++	    docdir=`echo $$doc | sed -e 's/^\(.*\/\).*/\1/' -e '/\//!s/.*//'`; \
++	    if ! test -d "$(distdir)/$$docdir"; then \
++	      echo "$(mkinstalldirs) $(distdir)/$$docdir"; \
++	      $(mkinstalldirs) "$(distdir)/$$docdir"; \
++	    fi; \
++	  echo "$(INSTALL_DATA) $$d$$doc $(distdir)/$$doc"; \
++	  $(INSTALL_DATA) "$$d$$doc" "$(distdir)/$$doc"; \
++	done
++	@list='$(_DOC_POFILES)'; \
++	for doc in $$list; do \
++	  if test -f "$$doc"; then d=; else d="$(srcdir)/"; fi; \
++	    docdir=`echo $$doc | sed -e 's/^\(.*\/\).*/\1/' -e '/\//!s/.*//'`; \
++	    if ! test -d "$(distdir)/$$docdir"; then \
++	      echo "$(mkinstalldirs) $(distdir)/$$docdir"; \
++	      $(mkinstalldirs) "$(distdir)/$$docdir"; \
++	    fi; \
++	  echo "$(INSTALL_DATA) $$d$$doc $(distdir)/$$doc"; \
++	  $(INSTALL_DATA) "$$d$$doc" "$(distdir)/$$doc"; \
++	done
++
++dist-doc-figs: $(_DOC_SRC_FIGURES)
++	@list='$(_DOC_C_FIGURES) $(_DOC_LC_FIGURES)'; \
++	for fig in $$list; do \
++	  if test -f "$$fig"; then d=; else d="$(srcdir)/"; fi; \
++	  if test -f "$$d$$fig"; then \
++	    figdir=`echo $$fig | sed -e 's/^\(.*\/\).*/\1/' -e '/\//!s/.*//'`; \
++	    if ! test -d "$(distdir)/$$figdir"; then \
++	      echo "$(mkinstalldirs) $(distdir)/$$figdir"; \
++	      $(mkinstalldirs) "$(distdir)/$$figdir"; \
++	    fi; \
++	    echo "$(INSTALL_DATA) $$d$$fig $(distdir)/$$fig"; \
++	    $(INSTALL_DATA) "$$d$$fig" "$(distdir)/$$fig"; \
++	  fi; \
++	done;
++
++dist-doc-omf:
++	@if test -f "$(_DOC_OMF_IN)"; then d=; else d="$(srcdir)/"; fi; \
++	echo "$(INSTALL_DATA) $$d$(_DOC_OMF_IN) $(distdir)/$(notdir $(_DOC_OMF_IN))"; \
++	$(INSTALL_DATA) "$$d$(_DOC_OMF_IN)" "$(distdir)/$(notdir $(_DOC_OMF_IN))"
++
++dist-doc-dsk:
++	@if test -f "$(_DOC_DSK_IN)"; then d=; else d="$(srcdir)/"; fi; \
++	echo "$(INSTALL_DATA) $$d$(_DOC_DSK_IN) $(distdir)/$(notdir $(_DOC_DSK_IN))"; \
++	$(INSTALL_DATA) "$$d$(_DOC_DSK_IN)" "$(distdir)/$(notdir $(_DOC_DSK_IN))"
++
++
++
++################################################################################
++## Check
++
++.PHONY: check-doc-docs check-doc-omf
++check:							\
++	$(if $(DOC_MODULE),check-doc-docs)		\
++	$(if $(DOC_ID),check-doc-pages)			\
++	$(if $(_DOC_OMF_IN),check-doc-omf)
++
++check-doc-docs: $(_DOC_C_DOCS) $(_DOC_LC_DOCS)
++	@for lc in C $(_DOC_REAL_LINGUAS); do \
++	  if test -f "$$lc"; \
++	    then d=; \
++	    xmlpath="$$lc"; \
++	  else \
++	    d="$(srcdir)/"; \
++	    xmlpath="$$lc:$(srcdir)/$$lc"; \
++	  fi; \
++	  echo "xmllint --noout --noent --path $$xmlpath --xinclude --postvalid $$d$$lc/$(DOC_MODULE).xml"; \
++	  xmllint --noout --noent --path "$$xmlpath" --xinclude --postvalid "$$d$$lc/$(DOC_MODULE).xml"; \
++	done
++
++check-doc-pages: $(_DOC_C_PAGES) $(_DOC_LC_PAGES)
++	for lc in C $(_DOC_REAL_LINGUAS); do \
++	  if test -f "$$lc"; \
++	    then d=; \
++	    xmlpath="$$lc"; \
++	  else \
++	    d="$(srcdir)/"; \
++	    xmlpath="$$lc:$(srcdir)/$$lc"; \
++	  fi; \
++	  for page in $(DOC_PAGES); do \
++	    echo "xmllint --noout --noent --path $$xmlpath --xinclude $$d$$lc/$$page"; \
++	    xmllint --noout --noent --path "$$xmlpath" --xinclude "$$d$$lc/$$page"; \
++	  done; \
++	done
++
++check-doc-omf: $(_DOC_OMF_ALL)
++	@list='$(_DOC_OMF_ALL)'; for omf in $$list; do \
++	  echo "xmllint --noout --xinclude --dtdvalid 'http://scrollkeeper.sourceforge.net/dtds/scrollkeeper-omf-1.0/scrollkeeper-omf.dtd' $$omf"; \
++	  xmllint --noout --xinclude --dtdvalid 'http://scrollkeeper.sourceforge.net/dtds/scrollkeeper-omf-1.0/scrollkeeper-omf.dtd' $$omf; \
++	done
++
++
++
++################################################################################
++## Install
++
++.PHONY: install-doc-docs install-doc-html install-doc-figs install-doc-omf install-doc-dsk
++
++_doc_install_dir = $(if $(DOC_ID),$(DOC_ID),$(DOC_MODULE))
++
++install-data-local:					\
++	$(if $(DOC_MODULE)$(DOC_ID),install-doc-docs)	\
++	$(if $(_DOC_HTML_ALL),install-doc-html)		\
++	$(if $(_DOC_C_FIGURES),install-doc-figs)	\
++	$(if $(_DOC_OMF_IN),install-doc-omf)
++#	$(if $(_DOC_DSK_IN),install-doc-dsk)
++
++install-doc-docs:
++	@for lc in C $(_DOC_REAL_LINGUAS); do \
++	  echo "$(mkinstalldirs) $(DESTDIR)$(HELP_DIR)/$(_doc_install_dir)/$$lc"; \
++	  $(mkinstalldirs) $(DESTDIR)$(HELP_DIR)/$(_doc_install_dir)/$$lc; \
++	done
++	@list='$(_DOC_C_DOCS)'; for doc in $$list; do \
++	  if test -f "$$doc"; then d=; else d="$(srcdir)/"; fi; \
++	  docdir="$$lc/"`echo $$doc | sed -e 's/^\(.*\/\).*/\1/' -e '/\//!s/.*//'`; \
++	  docdir="$(DESTDIR)$(HELP_DIR)/$(_doc_install_dir)/$$docdir"; \
++	  if ! test -d "$$docdir"; then \
++	    echo "$(mkinstalldirs) $$docdir"; \
++	    $(mkinstalldirs) "$$docdir"; \
++	  fi; \
++	  echo "$(INSTALL_DATA) $$d$$doc $(DESTDIR)$(HELP_DIR)/$(_doc_install_dir)/$$doc"; \
++	  $(INSTALL_DATA) $$d$$doc $(DESTDIR)$(HELP_DIR)/$(_doc_install_dir)/$$doc; \
++	done
++	@list='$(_DOC_LC_DOCS)'; for doc in $$list; do \
++	  if test -f "$$doc"; then d=; else d="$(srcdir)/"; fi; \
++	  docdir="$$lc/"`echo $$doc | sed -e 's/^\(.*\/\).*/\1/' -e '/\//!s/.*//'`; \
++	  docdir="$(DESTDIR)$(HELP_DIR)/$(_doc_install_dir)/$$docdir"; \
++	  if ! test -d "$$docdir"; then \
++	    echo "$(mkinstalldirs) $$docdir"; \
++	    $(mkinstalldirs) "$$docdir"; \
++	  fi; \
++	  echo "$(INSTALL_DATA) $$d$$doc $(DESTDIR)$(HELP_DIR)/$(_doc_install_dir)/$$doc"; \
++	  $(INSTALL_DATA) $$d$$doc $(DESTDIR)$(HELP_DIR)/$(_doc_install_dir)/$$doc; \
++	done
++
++install-doc-figs:
++	@list='$(patsubst C/%,%,$(_DOC_C_FIGURES))'; for fig in $$list; do \
++	  for lc in C $(_DOC_REAL_LINGUAS); do \
++	    figsymlink=false; \
++	    if test -f "$$lc/$$fig"; then \
++	      figfile="$$lc/$$fig"; \
++	    elif test -f "$(srcdir)/$$lc/$$fig"; then \
++	      figfile="$(srcdir)/$$lc/$$fig"; \
++	    else \
++	      figsymlink=true; \
++	    fi; \
++	    figdir="$$lc/"`echo $$fig | sed -e 's/^\(.*\/\).*/\1/' -e '/\//!s/.*//'`; \
++	    figdir="$(DESTDIR)$(HELP_DIR)/$(_doc_install_dir)/$$figdir"; \
++	    if ! test -d "$$figdir"; then \
++	      echo "$(mkinstalldirs) $$figdir"; \
++	      $(mkinstalldirs) "$$figdir"; \
++	    fi; \
++	    figbase=`echo $$fig | sed -e 's/^.*\///'`; \
++	    if $$figsymlink; then \
++	      echo "cd $$figdir && $(LN_S) -f ../../C/$$fig $$figbase"; \
++	      ( cd "$$figdir" && $(LN_S) -f "../../C/$$fig" "$$figbase" ); \
++	    else \
++	      echo "$(INSTALL_DATA) $$figfile $$figdir$$figbase"; \
++	      $(INSTALL_DATA) "$$figfile" "$$figdir$$figbase"; \
++	    fi; \
++	  done; \
++	done
++
++install-doc-html:
++	echo install-html
++
++install-doc-omf:
++	$(mkinstalldirs) $(DESTDIR)$(OMF_DIR)/$(_doc_install_dir)
++	@list='$(_DOC_OMF_ALL)'; for omf in $$list; do \
++	  echo "$(INSTALL_DATA) $$omf $(DESTDIR)$(OMF_DIR)/$(_doc_install_dir)/$$omf"; \
++	  $(INSTALL_DATA) $$omf $(DESTDIR)$(OMF_DIR)/$(_doc_install_dir)/$$omf; \
++	done
++	@if test "x$(_ENABLE_SK)" = "xtrue"; then \
++	  echo "scrollkeeper-update -p $(DESTDIR)$(_sklocalstatedir) -o $(DESTDIR)$(OMF_DIR)/$(_doc_install_dir)"; \
++	  scrollkeeper-update -p "$(DESTDIR)$(_sklocalstatedir)" -o "$(DESTDIR)$(OMF_DIR)/$(_doc_install_dir)"; \
++	fi;
++
++install-doc-dsk:
++	echo install-dsk
++
++
++
++################################################################################
++## Uninstall
++
++.PHONY: uninstall-doc-docs uninstall-doc-html uninstall-doc-figs uninstall-doc-omf uninstall-doc-dsk
++uninstall-local:					\
++	$(if $(DOC_MODULE)$(DOC_ID),uninstall-doc-docs)	\
++	$(if $(_DOC_HTML_ALL),uninstall-doc-html)	\
++	$(if $(_DOC_C_FIGURES),uninstall-doc-figs)	\
++	$(if $(_DOC_OMF_IN),uninstall-doc-omf)
++#	$(if $(_DOC_DSK_IN),uninstall-doc-dsk)
++
++uninstall-doc-docs:
++	@list='$(_DOC_C_DOCS)'; for doc in $$list; do \
++	  echo " rm -f $(DESTDIR)$(HELP_DIR)/$(_doc_install_dir)/$$doc"; \
++	  rm -f "$(DESTDIR)$(HELP_DIR)/$(_doc_install_dir)/$$doc"; \
++	done
++	@list='$(_DOC_LC_DOCS)'; for doc in $$list; do \
++	  echo " rm -f $(DESTDIR)$(HELP_DIR)/$(_doc_install_dir)/$$doc"; \
++	  rm -f "$(DESTDIR)$(HELP_DIR)/$(_doc_install_dir)/$$doc"; \
++	done
++
++uninstall-doc-figs:
++	@list='$(_DOC_C_FIGURES) $(_DOC_LC_FIGURES)'; for fig in $$list; do \
++	  echo "rm -f $(DESTDIR)$(HELP_DIR)/$(_doc_install_dir)/$$fig"; \
++	  rm -f "$(DESTDIR)$(HELP_DIR)/$(_doc_install_dir)/$$fig"; \
++	done;
++
++uninstall-doc-omf:
++	@list='$(_DOC_OMF_ALL)'; for omf in $$list; do \
++	  if test "x$(_ENABLE_SK)" = "xtrue"; then \
++	    echo "scrollkeeper-uninstall -p $(_sklocalstatedir) $(DESTDIR)$(OMF_DIR)/$(_doc_install_dir)/$$omf"; \
++	    scrollkeeper-uninstall -p "$(_sklocalstatedir)" "$(DESTDIR)$(OMF_DIR)/$(_doc_install_dir)/$$omf"; \
++	  fi; \
++	  echo "rm -f $(DESTDIR)$(OMF_DIR)/$(_doc_install_dir)/$$omf"; \
++	  rm -f "$(DESTDIR)$(OMF_DIR)/$(_doc_install_dir)/$$omf"; \
++	done
+-- 
+2.8.1
+
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
index 9be2ec1..0f7cb59 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
@@ -9,7 +9,7 @@ SECTION = "x11/gnome"
 
 PR = "r7"
 
-DEPENDS = "gnome-doc-utils-native gconf glib-2.0 gnome-desktop gtk+ \
+DEPENDS = "gnome-doc-utils gconf glib-2.0 gnome-desktop gtk+ \
            pango libwnck gnome-menus cairo libgweather dbus dbus-glib \
 	   librsvg libcanberra"
 RDEPENDS_${PN} = "python"
@@ -19,6 +19,7 @@ inherit gtk-doc gnome autotools-brokensep gettext pkgconfig gconf gobject-intros
 SRCREV = "8292bd2b8a36df7eed3c760899400790cde68590"
 SRC_URI = "git://git.gnome.org/gnome-panel;branch=gnome-2-32 \
            file://0001-Fix-build-with-gcc-5.patch \
+           file://0001-Add-gnome-doc-utils.make.patch \
 	  "
 
 S = "${WORKDIR}/git"
@@ -29,7 +30,6 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[networkmanager] = "--enable-network-manager,--disable-network-manager,networkmanager"
 
 do_configure_prepend() {
-    gnome-doc-prepare --automake
     sed -i -e s:help:: ${S}/Makefile.am
     sed -i -e s:^#!@PYTHON@:#!/usr/bin/python: ${S}/gnome-panel/gnome-panel-add.in
 }
diff --git a/meta-gnome/recipes-gnome/gthumb/files/0001-Drop-help-directory-from-build.patch b/meta-gnome/recipes-gnome/gthumb/files/0001-Drop-help-directory-from-build.patch
new file mode 100644
index 0000000..d116968
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gthumb/files/0001-Drop-help-directory-from-build.patch
@@ -0,0 +1,25 @@
+From 48cb878cb724e7a509260f014db6365510b8b541 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 17 May 2016 14:05:29 +0300
+Subject: [PATCH] Drop help directory from build
+
+It hardcodes the use of xml2po tool form gnome-doc-utils
+
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index d056875..3fc4a41 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,4 +1,4 @@
+-SUBDIRS = m4 copy-n-paste data po gthumb extensions tests help
++SUBDIRS = m4 copy-n-paste data po gthumb extensions tests
+ 
+ ACLOCAL_AMFLAGS = -I m4
+ AMCFLAGS = -fPIC -DPIC
+-- 
+2.8.1
+
diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
index 0bf1321..d22d5da 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
@@ -14,7 +14,12 @@ SRC_URI[archive.md5sum] = "97fc13221b0c5d80c27a2e25a3a3ac6f"
 SRC_URI[archive.sha256sum] = "cf809695230ab8892a078be454a42ade865754c72ec1da7c3d74d4310de54f1d"
 GNOME_COMPRESS_TYPE="bz2"
 
-SRC_URI += "file://parallel.patch"
+SRC_URI += "file://parallel.patch \
+            file://0001-Drop-help-directory-from-build.patch"
+
+do_configure_prepend () {
+    rm -r ${S}/m4/gnome-doc-utils.m4
+}
 
 do_install_append () {
     rm -f ${D}${libdir}/${BPN}/extensions/*.a
diff --git a/meta-oe/recipes-devtools/geany/geany_1.27.bb b/meta-oe/recipes-devtools/geany/geany_1.27.bb
index 686222a..15b21da 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.27.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.27.bb
@@ -2,7 +2,7 @@ SUMMARY = "A fast and lightweight IDE"
 HOMEPAGE = "http://www.geany.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bd7b2c994af21d318bd2cd3b3f80c2d5"
-DEPENDS = "gtk+ python-docutils-native"
+DEPENDS = "gtk+ python3-docutils-native"
 
 inherit autotools pkgconfig perlnative pythonnative
 
@@ -14,3 +14,5 @@ SRC_URI[md5sum] = "7c23f835f45def89d10884c1343fa29e"
 SRC_URI[sha256sum] = "846ff699a5944c5c3c068ae0199d4c13946a668bfc6d03f8c79765667c20cadf"
 
 FILES_${PN} += "${datadir}/icons"
+
+EXTRA_OECONF = "--disable-html-docs"
diff --git a/meta-oe/recipes-devtools/glade/glade3_3.8.5.bb b/meta-oe/recipes-devtools/glade/glade3_3.8.5.bb
index 4e7ef9b..dcc0cbe 100644
--- a/meta-oe/recipes-devtools/glade/glade3_3.8.5.bb
+++ b/meta-oe/recipes-devtools/glade/glade3_3.8.5.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=aabe87591cb8ae0f3c68be6977bb5522 \
                     file://COPYING.GPL;md5=9ac2e7cff1ddaf48b6eab6028f23ef88 \
                     file://COPYING.LGPL;md5=252890d9eee26aab7b432e8b8a616475"
-DEPENDS = "gtk+ gnome-doc-utils-native gnome-common libxml2"
+DEPENDS = "gtk+ gnome-doc-utils gnome-common libxml2"
 
 inherit autotools pkgconfig pythonnative
 
@@ -18,10 +18,6 @@ EXTRA_OECONF += "--disable-scrollkeeper"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gnome] = "--enable-gnome,--disable-gnome,libbonoboui libgnomeui"
 
-do_configure_prepend() {
-    sed -i '/^if HAVE_GNOME_DOC_UTILS/,/^endif/d' ${S}/Makefile.am
-}
-
 FILES_${PN} += "${datadir}/icons"
 FILES_${PN}-dbg += "${libdir}/glade3/modules/.debug"
 FILES_${PN}-dev += "${libdir}/glade3/modules/*.la"
diff --git a/meta-oe/recipes-gnome/gnome-doc-utils-stub/files/gnome-doc-utils.m4 b/meta-oe/recipes-gnome/gnome-doc-utils-stub/files/gnome-doc-utils.m4
new file mode 100644
index 0000000..f8d160a
--- /dev/null
+++ b/meta-oe/recipes-gnome/gnome-doc-utils-stub/files/gnome-doc-utils.m4
@@ -0,0 +1,61 @@
+dnl Do not call GNOME_DOC_DEFINES directly.  It is split out from
+dnl GNOME_DOC_INIT to allow gnome-doc-utils to bootstrap off itself.
+AC_DEFUN([GNOME_DOC_DEFINES],
+[
+AC_ARG_WITH([help-dir],
+  AC_HELP_STRING([--with-help-dir=DIR], [path to help docs]),,
+  [with_help_dir='${datadir}/gnome/help'])
+HELP_DIR="$with_help_dir"
+AC_SUBST(HELP_DIR)
+
+AC_ARG_WITH([omf-dir],
+  AC_HELP_STRING([--with-omf-dir=DIR], [path to OMF files]),,
+  [with_omf_dir='${datadir}/omf'])
+OMF_DIR="$with_omf_dir"
+AC_SUBST(OMF_DIR)
+
+AC_ARG_WITH([help-formats],
+  AC_HELP_STRING([--with-help-formats=FORMATS], [list of formats]),,
+  [with_help_formats=''])
+DOC_USER_FORMATS="$with_help_formats"
+AC_SUBST(DOC_USER_FORMATS)
+
+AC_ARG_ENABLE([scrollkeeper],
+	[AC_HELP_STRING([--disable-scrollkeeper],
+			[do not make updates to the scrollkeeper database])],,
+	enable_scrollkeeper=yes)
+AM_CONDITIONAL([ENABLE_SK],[test "$gdu_cv_have_gdu" = "yes" -a "$enable_scrollkeeper" = "yes"])
+
+dnl disable scrollkeeper automatically for distcheck
+DISTCHECK_CONFIGURE_FLAGS="--disable-scrollkeeper $DISTCHECK_CONFIGURE_FLAGS"
+AC_SUBST(DISTCHECK_CONFIGURE_FLAGS)
+
+AM_CONDITIONAL([HAVE_GNOME_DOC_UTILS],[test "$gdu_cv_have_gdu" = "yes"])
+])
+
+# GNOME_DOC_INIT ([MINIMUM-VERSION],[ACTION-IF-FOUND],[ACTION-IF-NOT-FOUND])
+#
+AC_DEFUN([GNOME_DOC_INIT],
+[AC_REQUIRE([AC_PROG_LN_S])dnl
+
+if test -z "$AM_DEFAULT_VERBOSITY"; then
+  AM_DEFAULT_VERBOSITY=1
+fi
+AC_SUBST([AM_DEFAULT_VERBOSITY])
+
+ifelse([$1],,[gdu_cv_version_required=0.3.2],[gdu_cv_version_required=$1])
+
+AC_MSG_CHECKING([gnome-doc-utils >= $gdu_cv_version_required])
+PKG_CHECK_EXISTS([gnome-doc-utils >= $gdu_cv_version_required],
+	[gdu_cv_have_gdu=yes],[gdu_cv_have_gdu=no])
+
+if test "$gdu_cv_have_gdu" = "yes"; then
+	AC_MSG_RESULT([yes])
+	ifelse([$2],,[:],[$2])
+else
+	AC_MSG_RESULT([no])
+	ifelse([$3],,[:],[$3])
+fi
+
+GNOME_DOC_DEFINES
+])
diff --git a/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb b/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
new file mode 100644
index 0000000..d6da51b
--- /dev/null
+++ b/meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Stub implementation of gnome-doc-utils"
+DESCRIPTION = "This recipe provides m4 macros from gnome-doc-utils project, so \
+that dependent recipes can build. Gnome-doc-utils itself is no longer packaged because \
+it requires libxml2 and python 2 at the same time, which can no longer be satisfied. "
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 \
+                    file://${COREBASE}/meta/files/common-licenses/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780"
+SRC_URI = "file://gnome-doc-utils.m4"
+
+PROVIDES = "gnome-doc-utils"
+
+do_install_append() {
+        install -d ${D}${datadir}/aclocal/
+        install ${WORKDIR}/gnome-doc-utils.m4 ${D}${datadir}/aclocal/
+}
+
+FILES_${PN} += "${datadir}"
+
-- 
2.8.1


