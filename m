Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.8708.1591356501701488686
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 04:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iV0QwKC0;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id g1so7171096edv.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Jun 2020 04:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kt2Mo9GHfa7p7j5V7YjpPwiDnR0FqKXMAqk9QYuv+3U=;
        b=iV0QwKC0rOokdl43I6ZQg8k57CIypbIEWTlknKLltVGXyecIY05Prp6GdrG8w4N1NI
         LP38hF9xAai3AxR5hAT1hUDKIvecqwNtIHuhZZ6cSgcH9ciuAw6LseKeIBhN7XukVNSe
         qhSI/GkD8IXT2Zvm0F1pyg9vaFOXGH0XRDI4bwwhy6rDjMyVfbgUi4H3pF0SIXIKiMOz
         WV6Ej7gjGD/xIElWdnXFot39voEj+ZdRAk7PBG4bPvHWYHRlGKvOnMGJCteULr3zqY3X
         0ywtPASt15kTKlm+qjqoNjLxsZh5hrWkD2hF7g2pEvf7b/+BxU7LDnmB7Xl6Fz65StHy
         fxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kt2Mo9GHfa7p7j5V7YjpPwiDnR0FqKXMAqk9QYuv+3U=;
        b=YznRaAheDxPcL9odq2uertN+HSHpe4PNyIqEFL2x8hXwUk4tRX3aHsXWrOTZ2MFWzE
         E38oAPeuEUQESFR57lvhvZ0iH5cDgvXWPOb3ueopUXeCH2DJWdgSHeZ3HThoE+hqrAut
         llLAymw0bvQ99TFD8yupqDcV4ZGj1gaxg7yvbEyrkzoTTzYlD6b7sB36lBej9bcwlbvS
         4YOrRcwewG+xSXC4ehwgpJ36s1YJkjYp30Wwu3gXCGblHvCuJoHxOYV6cZmxybxrPLUV
         0yfQck6m8tw67uY6i7FVW+ZJ3i/10+lxkfaCzXD/DFyh1grEk0IrVgrsOcNpB6/QZ4Fy
         4WtQ==
X-Gm-Message-State: AOAM531izepU/WufwSvkN99z2w2Rdpi58rsw7rg4vDAh7gYp3Hn/+wR3
	j6h7jkSnYPHo5tYMQQvh6w8909vC
X-Google-Smtp-Source: ABdhPJzuNv6RL9uzKuwh1/hM0RW8NOEImaJoFatMAP5k5koKExrFmthXhf5GliY+PIh7ruTzMar/Rg==
X-Received: by 2002:a05:6402:1486:: with SMTP id e6mr8472819edv.99.1591356499702;
        Fri, 05 Jun 2020 04:28:19 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0816493dd1634773746530.dip0.t-ipconnect.de. [2003:f0:7f08:1649:3dd1:6347:7374:6530])
        by smtp.gmail.com with ESMTPSA id 63sm4391444edm.48.2020.06.05.04.28.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 04:28:19 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/3] gtksourceview: remove forgotten files
Date: Fri,  5 Jun 2020 13:28:08 +0200
Message-Id: <20200605112808.220963-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605112808.220963-1-schnitzeltony@gmail.com>
References: <20200605112808.220963-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...fix-non-literal-format-string-issues.patch |  31 ----
 .../gtksourceview/gtksourceview2/acinclude.m4 |  90 ---------
 .../gtksourceview/gtksourceview2/gtk-doc.m4   |  53 ------
 .../gtksourceview/gtksourceview2/gtk-doc.make | 173 ------------------
 ...ppress-string-format-literal-warning.patch |  33 ----
 5 files changed, 380 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/0001-test-widget.c-fix-non-literal-format-string-issues.patch
 delete mode 100644 meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/acinclude.m4
 delete mode 100644 meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/gtk-doc.m4
 delete mode 100644 meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/gtk-doc.make
 delete mode 100644 meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/suppress-string-format-literal-warning.patch

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/0001-test-widget.c-fix-non-literal-format-string-issues.patch b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/0001-test-widget.c-fix-non-literal-format-string-issues.patch
deleted file mode 100644
index 6118b679a..000000000
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/0001-test-widget.c-fix-non-literal-format-string-issues.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 0781b218beb8ba160ea223ff3d74a4fa2abf86fa Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Apr 2017 16:21:14 -0700
-Subject: [PATCH] test-widget.c: fix non-literal format string issues
-
-clang errors out when using -Werror=format-nonliteral
-since the definition of g_strdup_vprintf() from glib-2.0
-is using va_list and clang seems to still warn where as
-gcc doesn't do that for va_list arguments
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/test-widget.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/test-widget.c b/tests/test-widget.c
-index 46f5f4e..3f2e60f 100644
---- a/tests/test-widget.c
-+++ b/tests/test-widget.c
-@@ -260,7 +260,7 @@ static const gchar *buffer_ui_description =
- 
- /* File loading code ----------------------------------------------------------------- */
- 
--static void
-+static void G_GNUC_PRINTF (2, 0)
- error_dialog (GtkWindow *parent, const gchar *msg, ...)
- {
- 	va_list ap;
--- 
-2.12.2
-
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/acinclude.m4 b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/acinclude.m4
deleted file mode 100644
index 53518fb2e..000000000
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/acinclude.m4
+++ /dev/null
@@ -1,90 +0,0 @@
-## this one is commonly used with AM_PATH_PYTHONDIR ...
-dnl AM_CHECK_PYMOD(MODNAME [,SYMBOL [,ACTION-IF-FOUND [,ACTION-IF-NOT-FOUND]]])
-dnl Check if a module containing a given symbol is visible to python.
-AC_DEFUN(AM_CHECK_PYMOD,
-[AC_REQUIRE([AM_PATH_PYTHON])
-py_mod_var=`echo $1['_']$2 | sed 'y%./+-%__p_%'`
-AC_MSG_CHECKING(for ifelse([$2],[],,[$2 in ])python module $1)
-AC_CACHE_VAL(py_cv_mod_$py_mod_var, [
-ifelse([$2],[], [prog="
-import sys
-try:
-        import $1
-except ImportError:
-        sys.exit(1)
-except:
-        sys.exit(0)
-sys.exit(0)"], [prog="
-import $1
-$1.$2"])
-if $PYTHON -c "$prog" 1>&AC_FD_CC 2>&AC_FD_CC
-  then
-    eval "py_cv_mod_$py_mod_var=yes"
-  else
-    eval "py_cv_mod_$py_mod_var=no"
-  fi
-])
-py_val=`eval "echo \`echo '$py_cv_mod_'$py_mod_var\`"`
-if test "x$py_val" != xno; then
-  AC_MSG_RESULT(yes)
-  ifelse([$3], [],, [$3
-])dnl
-else
-  AC_MSG_RESULT(no)
-  ifelse([$4], [],, [$4
-])dnl
-fi
-])
-
-dnl a macro to check for ability to create python extensions
-dnl  AM_CHECK_PYTHON_HEADERS([ACTION-IF-POSSIBLE], [ACTION-IF-NOT-POSSIBLE])
-dnl function also defines PYTHON_INCLUDES
-AC_DEFUN([AM_CHECK_PYTHON_HEADERS],
-[AC_REQUIRE([AM_PATH_PYTHON])
-AC_MSG_CHECKING(for headers required to compile python extensions)
-dnl deduce PYTHON_INCLUDES
-AC_ARG_WITH(python-includes,
-	[  --with-python-includes=DIR  path to Python includes], py_exec_prefix=$withval)
-if test x$py_exec_prefix != x; then
-PYTHON_INCLUDES="-I${py_exec_prefix}/include/python${PYTHON_VERSION}"
-else
-py_prefix=`$PYTHON -c "import sys; print sys.prefix"`
-py_exec_prefix=`$PYTHON -c "import sys; print sys.exec_prefix"`
-PYTHON_INCLUDES="-I${py_prefix}/include/python${PYTHON_VERSION}"
-if test "$py_prefix" != "$py_exec_prefix"; then
-  PYTHON_INCLUDES="$PYTHON_INCLUDES -I${py_exec_prefix}/include/python${PYTHON_VERSION}"
-fi
-fi
-AC_SUBST(PYTHON_INCLUDES)
-dnl check if the headers exist:
-save_CPPFLAGS="$CPPFLAGS"
-CPPFLAGS="$CPPFLAGS $PYTHON_INCLUDES"
-AC_TRY_CPP([#include <Python.h>],dnl
-[AC_MSG_RESULT(found)
-$1],dnl
-[AC_MSG_RESULT(not found)
-$2])
-CPPFLAGS="$save_CPPFLAGS"
-])
-
-dnl
-dnl JH_ADD_CFLAG(FLAG)
-dnl checks whether the C compiler supports the given flag, and if so, adds
-dnl it to $CFLAGS.  If the flag is already present in the list, then the
-dnl check is not performed.
-AC_DEFUN([JH_ADD_CFLAG],
-[
-case " $CFLAGS " in
-*@<:@\	\ @:>@$1@<:@\	\ @:>@*)
-  ;;
-*)
-  save_CFLAGS="$CFLAGS"
-  CFLAGS="$CFLAGS $1"
-  AC_MSG_CHECKING([whether [$]CC understands $1])
-  AC_TRY_COMPILE([], [], [jh_has_option=yes], [jh_has_option=no])
-  AC_MSG_RESULT($jh_has_option)
-  if test $jh_has_option = no; then
-    CFLAGS="$save_CFLAGS"
-  fi
-  ;;
-esac])
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/gtk-doc.m4 b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/gtk-doc.m4
deleted file mode 100644
index 3ec41666b..000000000
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/gtk-doc.m4
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
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/gtk-doc.make b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/gtk-doc.make
deleted file mode 100644
index 354ffb7c6..000000000
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/gtk-doc.make
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
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/suppress-string-format-literal-warning.patch b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/suppress-string-format-literal-warning.patch
deleted file mode 100644
index f9ae07763..000000000
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/suppress-string-format-literal-warning.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Fix build error with gcc6:
-../../gtksourceview-2.10.5/gtksourceview/gtksourceprintcompositor.c: In function 'strdup_strftime':
-../../gtksourceview-2.10.5/gtksourceview/gtksourceprintcompositor.c:1951:3: error: format not a string literal, format string not checked [-Werror=format-nonliteral]
-   tmplen = strftime (tmpbuf, tmpbufsize, locale_format, tm);
-   ^~~~~~
-
-Patch Reference:
-https://git.gnome.org/browse/glib/commit/?id=0817af40e8c74c721c30f6ef482b1f53d12044c7
-https://git.gnome.org/browse/glib/commit/?id=8cdbc7fb2c8c876902e457abe46ee18a0b134486
-
-Upstream-Status: Pending
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-
-diff -Nurp gtksourceview-2.10.5.orig/gtksourceview/gtksourceprintcompositor.c gtksourceview-2.10.5/gtksourceview/gtksourceprintcompositor.c
---- gtksourceview-2.10.5.orig/gtksourceview/gtksourceprintcompositor.c	2016-07-01 13:11:43.631173762 +0800
-+++ gtksourceview-2.10.5/gtksourceview/gtksourceprintcompositor.c	2016-07-04 13:54:18.223726343 +0800
-@@ -1913,6 +1913,8 @@ setup_pango_layouts (GtkSourcePrintCompo
-  * GLIB - Library of useful routines for C programming
-  * Copyright (C) 1995-1997  Peter Mattis, Spencer Kimball and Josh MacDonald */
- 
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wformat-nonliteral"
- static gchar *
- strdup_strftime (const gchar *format, const struct tm *tm)
- {
-@@ -1982,6 +1984,7 @@ strdup_strftime (const gchar *format, co
- 
- 	return convbuf;
- }
-+#pragma GCC diagnostic pop
- 
- static gchar *
- evaluate_format_string (GtkSourcePrintCompositor *compositor,
-- 
2.26.2

