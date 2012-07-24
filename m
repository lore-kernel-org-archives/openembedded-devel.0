Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1StaGV-0004CI-Uf
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jul 2012 10:14:48 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so4724362bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2012 01:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=8+EXW5lHr57SIBnkXYIWNvGPZp1EApgxHdvMR2DcWJQ=;
	b=rUJ9Pbm4ArAG0Y2vVyAVNidY3dlf/5ISLJMGj57YO8ZWIxLaMsPz5ekH0vA1I0ChUd
	0o90WjsiGzy7QZeBV9OK2RkVa7u7TLIJ+oKwpPVYOog8qYsHRF7S9ri7ZCu5z2V9umbs
	d34C4JwuvL2EkQpCV15RNXgVKtRqBHg1a+u8cCfGE5aq+yNEsEVMKZYN5TAMHP+dCdfw
	xw3Vh+8//vguqWYT7DEIC5YN4t2PtI9nlbGWy4uqpNP8hyp4HEDQrDiFBSi464yHuB30
	8kbGfjEThz6CpwnQT2Kq74T4LF1gl99MukiIJxv1BV13TzLBLwcReebwFCjF6nKswW8w
	jTcw==
Received: by 10.204.153.28 with SMTP id i28mr9355452bkw.19.1343117002260;
	Tue, 24 Jul 2012 01:03:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c18sm9651378bkv.8.2012.07.24.01.03.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jul 2012 01:03:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Jul 2012 10:02:56 +0200
Message-Id: <e2a4273475700b798b1eddc3144a022f6303c189.1343116924.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343116924.git.Martin.Jansa@gmail.com>
References: <cover.1343116924.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343116924.git.Martin.Jansa@gmail.com>
References: <cover.1343116924.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/5] orbit2: cleanup thanks to new gtk-doc.bbclass
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
X-List-Received-Date: Tue, 24 Jul 2012 08:14:48 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/orbit2/orbit2-2.14.17/gtk-doc.m4 |   53 ------
 .../orbit2/orbit2-2.14.17/gtk-doc.make             |  173 --------------------
 meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb  |   19 +--
 3 files changed, 5 insertions(+), 240 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/orbit2/orbit2-2.14.17/gtk-doc.m4
 delete mode 100644 meta-gnome/recipes-gnome/orbit2/orbit2-2.14.17/gtk-doc.make

diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2-2.14.17/gtk-doc.m4 b/meta-gnome/recipes-gnome/orbit2/orbit2-2.14.17/gtk-doc.m4
deleted file mode 100644
index 3ec4166..0000000
--- a/meta-gnome/recipes-gnome/orbit2/orbit2-2.14.17/gtk-doc.m4
+++ /dev/null
@@ -1,53 +0,0 @@
-dnl -*- mode: autoconf -*-
-
-# serial 1
-
-dnl Usage:
-dnl   GTK_DOC_CHECK([minimum-gtk-doc-version])
-AC_DEFUN([GTK_DOC_CHECK],
-[
-  AC_BEFORE([AC_PROG_LIBTOOL],[$0])dnl setup libtool first
-  AC_BEFORE([AM_PROG_LIBTOOL],[$0])dnl setup libtool first
-  dnl for overriding the documentation installation directory
-  AC_ARG_WITH(html-dir,
-    AC_HELP_STRING([--with-html-dir=PATH], [path to installed docs]),,
-    [with_html_dir='${datadir}/gtk-doc/html'])
-  HTML_DIR="$with_html_dir"
-  AC_SUBST(HTML_DIR)
-
-  dnl enable/disable documentation building
-  AC_ARG_ENABLE(gtk-doc,
-    AC_HELP_STRING([--enable-gtk-doc],
-                   [use gtk-doc to build documentation [default=no]]),,
-    enable_gtk_doc=no)
-
-  have_gtk_doc=no
-  if test -z "$PKG_CONFIG"; then
-    AC_PATH_PROG(PKG_CONFIG, pkg-config, no)
-  fi
-  if test "$PKG_CONFIG" != "no" && $PKG_CONFIG --exists gtk-doc; then
-    have_gtk_doc=yes
-  fi
-
-  dnl do we want to do a version check?
-ifelse([$1],[],,
-  [gtk_doc_min_version=$1
-  if test "$have_gtk_doc" = yes; then
-    AC_MSG_CHECKING([gtk-doc version >= $gtk_doc_min_version])
-    if $PKG_CONFIG --atleast-version $gtk_doc_min_version gtk-doc; then
-      AC_MSG_RESULT(yes)
-    else
-      AC_MSG_RESULT(no)
-      have_gtk_doc=no
-    fi
-  fi
-])
-  if test x$enable_gtk_doc = xyes; then
-    if test "$have_gtk_doc" != yes; then
-      enable_gtk_doc=no
-    fi
-  fi
-
-  AM_CONDITIONAL(ENABLE_GTK_DOC, test x$enable_gtk_doc = xyes)
-  AM_CONDITIONAL(GTK_DOC_USE_LIBTOOL, test -n "$LIBTOOL")
-])
diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2-2.14.17/gtk-doc.make b/meta-gnome/recipes-gnome/orbit2/orbit2-2.14.17/gtk-doc.make
deleted file mode 100644
index 354ffb7..0000000
--- a/meta-gnome/recipes-gnome/orbit2/orbit2-2.14.17/gtk-doc.make
+++ /dev/null
@@ -1,173 +0,0 @@
-# -*- mode: makefile -*-
-
-####################################
-# Everything below here is generic #
-####################################
-
-if GTK_DOC_USE_LIBTOOL
-GTKDOC_CC = $(LIBTOOL) --mode=compile $(CC) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
-GTKDOC_LD = $(LIBTOOL) --mode=link $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
-else
-GTKDOC_CC = $(CC) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
-GTKDOC_LD = $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
-endif
-
-# We set GPATH here; this gives us semantics for GNU make
-# which are more like other make's VPATH, when it comes to
-# whether a source that is a target of one rule is then
-# searched for in VPATH/GPATH.
-#
-GPATH = $(srcdir)
-
-TARGET_DIR=$(HTML_DIR)/$(DOC_MODULE)
-
-EXTRA_DIST = 				\
-	$(content_files)		\
-	$(HTML_IMAGES)			\
-	$(DOC_MAIN_SGML_FILE)		\
-	$(DOC_MODULE)-sections.txt	\
-	$(DOC_MODULE)-overrides.txt
-
-DOC_STAMPS=scan-build.stamp tmpl-build.stamp sgml-build.stamp html-build.stamp \
-	   $(srcdir)/tmpl.stamp $(srcdir)/sgml.stamp $(srcdir)/html.stamp
-
-SCANOBJ_FILES = 		 \
-	$(DOC_MODULE).args 	 \
-	$(DOC_MODULE).hierarchy  \
-	$(DOC_MODULE).interfaces \
-	$(DOC_MODULE).prerequisites \
-	$(DOC_MODULE).signals
-
-REPORT_FILES = \
-	$(DOC_MODULE)-undocumented.txt \
-	$(DOC_MODULE)-undeclared.txt \
-	$(DOC_MODULE)-unused.txt
-
-CLEANFILES = $(SCANOBJ_FILES) $(REPORT_FILES) $(DOC_STAMPS)
-
-if ENABLE_GTK_DOC
-all-local: html-build.stamp
-else
-all-local:
-endif
-
-docs: html-build.stamp
-
-#### scan ####
-
-scan-build.stamp: $(HFILE_GLOB) $(CFILE_GLOB)
-	@echo 'gtk-doc: Scanning header files'
-	@-chmod -R u+w $(srcdir)
-	cd $(srcdir) && \
-	  gtkdoc-scan --module=$(DOC_MODULE) --source-dir=$(DOC_SOURCE_DIR) --ignore-headers="$(IGNORE_HFILES)" $(SCAN_OPTIONS) $(EXTRA_HFILES)
-	if grep -l '^..*$$' $(srcdir)/$(DOC_MODULE).types > /dev/null 2>&1 ; then \
-	    CC="$(GTKDOC_CC)" LD="$(GTKDOC_LD)" CFLAGS="$(GTKDOC_CFLAGS)" LDFLAGS="$(GTKDOC_LIBS)" gtkdoc-scangobj $(SCANGOBJ_OPTIONS) --module=$(DOC_MODULE) --output-dir=$(srcdir) ; \
-	else \
-	    cd $(srcdir) ; \
-	    for i in $(SCANOBJ_FILES) ; do \
-               test -f $$i || touch $$i ; \
-	    done \
-	fi
-	touch scan-build.stamp
-
-$(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DOC_MODULE)-overrides.txt: scan-build.stamp
-	@true
-
-#### templates ####
-
-tmpl-build.stamp: $(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DOC_MODULE)-overrides.txt
-	@echo 'gtk-doc: Rebuilding template files'
-	@-chmod -R u+w $(srcdir)
-	cd $(srcdir) && gtkdoc-mktmpl --module=$(DOC_MODULE) $(MKTMPL_OPTIONS)
-	touch tmpl-build.stamp
-
-tmpl.stamp: tmpl-build.stamp
-	@true
-
-tmpl/*.sgml:
-	@true
-
-
-#### xml ####
-
-sgml-build.stamp: tmpl.stamp $(HFILE_GLOB) $(CFILE_GLOB) $(DOC_MODULE)-sections.txt $(srcdir)/tmpl/*.sgml $(expand_content_files)
-	@echo 'gtk-doc: Building XML'
-	@-chmod -R u+w $(srcdir)
-	cd $(srcdir) && \
-	gtkdoc-mkdb --module=$(DOC_MODULE) --source-dir=$(DOC_SOURCE_DIR) --output-format=xml --expand-content-files="$(expand_content_files)" --main-sgml-file=$(DOC_MAIN_SGML_FILE) $(MKDB_OPTIONS)
-	touch sgml-build.stamp
-
-sgml.stamp: sgml-build.stamp
-	@true
-
-#### html ####
-
-html-build.stamp: sgml.stamp $(DOC_MAIN_SGML_FILE) $(content_files)
-	@echo 'gtk-doc: Building HTML'
-	@-chmod -R u+w $(srcdir)
-	rm -rf $(srcdir)/html
-	mkdir $(srcdir)/html
-	cd $(srcdir)/html && gtkdoc-mkhtml $(DOC_MODULE) ../$(DOC_MAIN_SGML_FILE)
-	test "x$(HTML_IMAGES)" = "x" || ( cd $(srcdir) && cp $(HTML_IMAGES) html )
-	@echo 'gtk-doc: Fixing cross-references'
-	cd $(srcdir) && gtkdoc-fixxref --module-dir=html --html-dir=$(HTML_DIR) $(FIXXREF_OPTIONS)
-	touch html-build.stamp
-
-##############
-
-clean-local:
-	rm -f *~ *.bak
-	rm -rf .libs
-
-distclean-local:
-	cd $(srcdir) && \
-	  rm -rf xml $(REPORT_FILES) \
-	         $(DOC_MODULE)-decl-list.txt $(DOC_MODULE)-decl.txt
-
-maintainer-clean-local: clean
-	cd $(srcdir) && rm -rf xml html
-
-install-data-local:
-	-installfiles=`echo $(srcdir)/html/*`; \
-	if test "$$installfiles" = '$(srcdir)/html/*'; \
-	then echo '-- Nothing to install' ; \
-	else \
-	  $(mkinstalldirs) $(DESTDIR)$(TARGET_DIR); \
-	  for i in $$installfiles; do \
-	    echo '-- Installing '$$i ; \
-	    $(INSTALL_DATA) $$i $(DESTDIR)$(TARGET_DIR); \
-	  done; \
-	  echo '-- Installing $(srcdir)/html/index.sgml' ; \
-	  $(INSTALL_DATA) $(srcdir)/html/index.sgml $(DESTDIR)$(TARGET_DIR) || :; \
-	  which gtkdoc-rebase >/dev/null && \
-	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) ; \
-	fi
-	
-
-uninstall-local:
-	rm -f $(DESTDIR)$(TARGET_DIR)/*
-
-#
-# Require gtk-doc when making dist
-#
-if ENABLE_GTK_DOC
-dist-check-gtkdoc:
-else
-dist-check-gtkdoc:
-	@echo "*** gtk-doc must be installed and enabled in order to make dist"
-	@false
-endif
-
-dist-hook: dist-check-gtkdoc dist-hook-local
-	mkdir $(distdir)/tmpl
-	mkdir $(distdir)/xml
-	mkdir $(distdir)/html
-	-cp $(srcdir)/tmpl/*.sgml $(distdir)/tmpl
-	-cp $(srcdir)/xml/*.xml $(distdir)/xml
-	cp $(srcdir)/html/* $(distdir)/html
-	-cp $(srcdir)/$(DOC_MODULE).types $(distdir)/
-	-cp $(srcdir)/$(DOC_MODULE)-sections.txt $(distdir)/
-	cd $(distdir) && rm -f $(DISTCLEANFILES)
-	-gtkdoc-rebase --online --relative --html-dir=$(distdir)/html
-
-.PHONY : dist-hook-local docs
diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb
index fb7e93e..8f3e4e1 100644
--- a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb
+++ b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb
@@ -6,22 +6,20 @@ SRC_NAME = "ORBit2"
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/${SRC_NAME}/${SHRT_VER}/${SRC_NAME}-${PV}.tar.bz2 \
            file://configure-lossage.patch \
-           file://pkgconfig-fix.patch \
-	   file://gtk-doc.m4 \
-	   file://gtk-doc.make"
+           file://pkgconfig-fix.patch"
 SRC_URI[md5sum] = "10bfb957fa4a8935a0b4afaee7d71df7"
 SRC_URI[sha256sum] = "62bfce3f678f9347a19c766944e8aef7b89bc32b25ac23eb3e4c25929ce8974c"
 
-PR = "r2"
+PR = "r3"
 BBCLASSEXTEND = "native"
 
 IDL_COMPILER_DEPENDS = "orbit2-native"
 IDL_COMPILER_DEPENDS_virtclass-native = " "
-DEPENDS = "libidl popt gtk-doc ${IDL_COMPILER_DEPENDS}"
+DEPENDS = "libidl popt ${IDL_COMPILER_DEPENDS}"
 
 # IDL_COMPILER_DEPENDS_virtclass-native for some reason didn't work and orbit2-native
 # was still in orbit2-native DEPENDS causing circular dependency
-DEPENDS_virtclass-native = "libidl-native popt-native gtk-doc-native"
+DEPENDS_virtclass-native = "libidl-native popt-native"
 PARALLEL_MAKE = ""
 
 
@@ -33,14 +31,7 @@ S = "${WORKDIR}/${SRC_NAME}-${PV}"
 
 LEAD_SONAME = "libORBit-2.so"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gtk-doc
 
-EXTRA_OECONF = "--disable-gtk-doc"
 EXTRA_OEMAKE = "IDL_COMPILER='${STAGING_BINDIR_NATIVE}/orbit-idl-2'"
 EXTRA_OEMAKE_virtclass-native = " "
-
-do_configure_prepend() {
-	mkdir -p m4
-	install ${WORKDIR}/gtk-doc.m4 ./m4/
-	install ${WORKDIR}/gtk-doc.make ./
-}
-- 
1.7.8.6



