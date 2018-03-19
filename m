Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 08664789CD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 20:29:30 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id t6so18278655wmt.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=+cH8ga5OrlHVNZSffTS26I8UhqM4n73MO8+Fgi7QYjo=;
	b=cTOroCj0QEiuSWM+O6fE45uKajbJr2tAUeDVuZoriFYZllCrAufQUviOC9iUZK0Q4I
	Tp4mHu5O+YrNRRTpUBOe73OND7u3jZzhzeaR39xusdXdjU/wxTsxjaC5YzefSs89och7
	M+hLhbP1FtiPzhfP3/Ix4mmIZ8LvS05DaCECFGCF2k9S0e8He8KH2//0/5tVajb692H/
	xvEjnIuCumL8YCvQU2fmxlHJU0hLPyyM7A5fQ4j3c16f2OMSzRGxk0cx4WXL5fyvwiY2
	xBb4j5QI6ZJ9Tk5mn8FI1mXHtEUnGpuXmMJXxUbduxrTcgXYV2Z+4pQzujuZi00s7XEX
	Jwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+cH8ga5OrlHVNZSffTS26I8UhqM4n73MO8+Fgi7QYjo=;
	b=oKUZs2F4zT2G7wqoJQWvWcPueVU/mkwm52BufhtJ4tmMnqkSKdOMPz00ZbIGdMSFDK
	YyGBgytPdJ6UfYEhRz0E3NmAUagOy95FiN8Xv8a1baR6LOQrgoD8r0c6YbfNPQ5cfYS8
	lOL9h9ED3sPdVUY0sRsJr53z6Br6e0Yae9RUBzZOn06N6zc5CNQE/XiLwfUxkrA1dFR8
	0oaE8+7LN9S3KAgdLF6s5hKWC7SLhf04F5FBNybt/0RmIQkoYpmYTENvMhlZ1Vz/XcLB
	tzLrC5P/HovuTgDlWEm3m6wVsi55nkja6Wzp6NUa8AoRFmID2Q+3N0FFKyi0sGexqA7w
	bP6w==
X-Gm-Message-State: AElRT7GZUNbh1BBxLprsrRHdVlmKb2SpDpMGejt2E9V3p+QnD1E9Zz3L
	gzxMTQlhleSBRBDiykgm9yEAKQ==
X-Google-Smtp-Source: AG47ELvTz4AF0gv0gwpkx1iDzgFa1qL7vIlOCmvKlTQOLcx+LiytYqeydjhshF7s1m/DeXH8lCR2kQ==
X-Received: by 10.28.141.4 with SMTP id p4mr75901wmd.59.1521491371481;
	Mon, 19 Mar 2018 13:29:31 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC08B501E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:8b50:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id j42sm47589wre.55.2018.03.19.13.29.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Mar 2018 13:29:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 21:29:01 +0100
Message-Id: <20180319202911.30760-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180319202911.30760-1-schnitzeltony@gmail.com>
References: <20180319202911.30760-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/17] libbonobo: remove
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
X-List-Received-Date: Mon, 19 Mar 2018 20:29:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

project is dead last release was 2011

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/bonobo/files/gtk-doc.m4   |  53 -------
 meta-gnome/recipes-gnome/bonobo/files/gtk-doc.make | 173 ---------------------
 meta-gnome/recipes-gnome/bonobo/libbonobo.inc      |  30 ----
 .../0001-Remove-use-of-G_DISABLE_DEPRECATED.patch  |  47 ------
 .../libbonobo/do-not-use-srcdir-variable.patch     |  24 ---
 .../libbonobo/fix-nonliteral-in-string.patch       |  26 ----
 .../recipes-gnome/bonobo/libbonobo_2.32.1.bb       |   9 --
 7 files changed, 362 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/bonobo/files/gtk-doc.m4
 delete mode 100644 meta-gnome/recipes-gnome/bonobo/files/gtk-doc.make
 delete mode 100644 meta-gnome/recipes-gnome/bonobo/libbonobo.inc
 delete mode 100644 meta-gnome/recipes-gnome/bonobo/libbonobo/0001-Remove-use-of-G_DISABLE_DEPRECATED.patch
 delete mode 100644 meta-gnome/recipes-gnome/bonobo/libbonobo/do-not-use-srcdir-variable.patch
 delete mode 100644 meta-gnome/recipes-gnome/bonobo/libbonobo/fix-nonliteral-in-string.patch
 delete mode 100644 meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb

diff --git a/meta-gnome/recipes-gnome/bonobo/files/gtk-doc.m4 b/meta-gnome/recipes-gnome/bonobo/files/gtk-doc.m4
deleted file mode 100644
index 3ec41666b..000000000
--- a/meta-gnome/recipes-gnome/bonobo/files/gtk-doc.m4
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
diff --git a/meta-gnome/recipes-gnome/bonobo/files/gtk-doc.make b/meta-gnome/recipes-gnome/bonobo/files/gtk-doc.make
deleted file mode 100644
index 354ffb7c6..000000000
--- a/meta-gnome/recipes-gnome/bonobo/files/gtk-doc.make
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
diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
deleted file mode 100644
index e4759a87c..000000000
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "Bonobo CORBA interfaces library"
-LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
-SECTION = "x11/gnome/libs"
-DEPENDS = "gnome-common-native glib-2.0 orbit2-native orbit2 intltool-native libxml2 dbus dbus-glib"
-
-inherit gnomebase gtk-doc lib_package
-
-EXTRA_OECONF += "'PERL_PATH=${USRBINPATH}/env perl'"
-ORBIT_IDL_SRC = "${STAGING_BINDIR_NATIVE}/orbit-idl-2"
-
-RDEPENDS_${PN}-bin = "${PN} perl"
-FILES_${PN} += "${libdir}/orbit-2.0/*.so ${libdir}/bonobo/monikers/*.so"
-FILES_${PN}-dbg += "${libdir}/bonobo/monikers/.debug \
-    ${libdir}/bonobo-2.0/samples/.debug ${libdir}/orbit-2.0/.debug"
-FILES_${PN}-dev += "${libdir}/orbit-2.0/*.la ${libdir}/bonobo/monikers/*.la ${libdir}/bonobo-2.0/samples"
-FILES_${PN}-staticdev += "${libdir}/orbit-2.0/*.a ${libdir}/bonobo/monikers/*.a"
-
-LEAD_SONAME = "libbonobo-2.so"
-
-PARALLEL_MAKE = ""
-
-do_compile() {
-    oe_runmake ORBIT_IDL="${ORBIT_IDL_SRC}"
-}
-
-do_install() {
-    oe_runmake ORBIT_IDL="${ORBIT_IDL_SRC}" DESTDIR="${D}" install
-}
diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo/0001-Remove-use-of-G_DISABLE_DEPRECATED.patch b/meta-gnome/recipes-gnome/bonobo/libbonobo/0001-Remove-use-of-G_DISABLE_DEPRECATED.patch
deleted file mode 100644
index 44cf1f9fa..000000000
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo/0001-Remove-use-of-G_DISABLE_DEPRECATED.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From fef13a371fc91f6d9b42518126c2a8b459fdf0e8 Mon Sep 17 00:00:00 2001
-From: Colin Walters <walters@verbum.org>
-Date: Thu, 2 May 2013 14:17:38 -0400
-Subject: [PATCH] Remove use of G_DISABLE_DEPRECATED
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This now trips up on GStaticRecMutex; I'm not going to bother to port,
-realistically no one is actively maintaining this code anymore.
-
-Upstream-Status: Applied
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- activation-server/Makefile.am |    1 -
- configure.in                  |    2 +-
- 2 files changed, 1 insertions(+), 2 deletions(-)
-
-diff --git a/activation-server/Makefile.am b/activation-server/Makefile.am
-index efb18a8..ffa90f6 100644
---- a/activation-server/Makefile.am
-+++ b/activation-server/Makefile.am
-@@ -17,7 +17,6 @@ INCLUDES=					\
- 	$(SERVER_CFLAGS)			\
- 	$(WARN_CFLAGS)				\
- 	-DSERVER_CONFDIR=\"$(sysconfdir)\"	\
--	-DG_DISABLE_DEPRECATED			\
- 	-DG_LOG_DOMAIN=\"Bonobo-Activation-Server\" \
- 	$(NULL)
- 
-diff --git a/configure.in b/configure.in
-index 70a4e26..6be2bca 100644
---- a/configure.in
-+++ b/configure.in
-@@ -132,7 +132,7 @@ AC_SUBST(SERVER_LIBS)
- AC_SUBST(SERVER_CFLAGS)
- 
- if test "$enable_maintainer_mode" = "yes"; then
--	DISABLE_DEPRECATED_CFLAGS="-DG_DISABLE_DEPRECATED -DG_DISABLE_SINGLE_INCLUDES"
-+	DISABLE_DEPRECATED_CFLAGS="-DG_DISABLE_SINGLE_INCLUDES"
- 	AC_SUBST(DISABLE_DEPRECATED_CFLAGS)
- fi
- 
--- 
-1.7.6.5
-
diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo/do-not-use-srcdir-variable.patch b/meta-gnome/recipes-gnome/bonobo/libbonobo/do-not-use-srcdir-variable.patch
deleted file mode 100644
index a20edda84..000000000
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo/do-not-use-srcdir-variable.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-| tests/Makefile.am:55: error: using '$(srcdir)' in TESTS is currently broken: '$(srcdir)/te
-st-properties.sh'
-| tests/test-activation/Makefile.am:76: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS
-' (or '*_CPPFLAGS')
-| utils/Makefile.am:9: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS
-')
-| autoreconf: automake failed with exit status: 1
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Not Submitted
-
-Index: libbonobo-2.32.1/tests/Makefile.am
-===================================================================
---- libbonobo-2.32.1.orig/tests/Makefile.am	2010-08-29 04:56:00.000000000 -0700
-+++ libbonobo-2.32.1/tests/Makefile.am	2014-04-25 15:38:22.024744384 -0700
-@@ -55,7 +55,7 @@
- 	MODELS_DIR="$(srcdir)/models"
- 
- TESTS = test-moniker$(EXEEXT) test-event-source$(EXEEXT) test-object$(EXEEXT) \
--	test-stream-mem$(EXEEXT) $(srcdir)/test-properties.sh test-storage-mem$(EXEEXT) \
-+	test-stream-mem$(EXEEXT) test-properties.sh test-storage-mem$(EXEEXT) \
- 	test-main-loop$(EXEEXT)
- 
- # TESTS += test-generic-factory.sh
diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo/fix-nonliteral-in-string.patch b/meta-gnome/recipes-gnome/bonobo/libbonobo/fix-nonliteral-in-string.patch
deleted file mode 100644
index 20db671e0..000000000
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo/fix-nonliteral-in-string.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-This checks whether the format string is a literal on the calling function. As bonobo_debug_print()
-takes already a va_list, we specify the format on the functions that call it
-The second number, which is 0 here, should then be the argument index of the variadic argument
-
-Fixed warning with clang
-
-| ../../libbonobo-2.32.1/bonobo/bonobo-debug.c:58:32: error: format string is not a string literal [-Werror,-Wformat-nonliteral]
-|         vfprintf (_bonobo_debug_file, fmt, args);
-|                                       ^~~
-| 1 error generated.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: libbonobo-2.32.1/bonobo/bonobo-debug.c
-===================================================================
---- libbonobo-2.32.1.orig/bonobo/bonobo-debug.c
-+++ libbonobo-2.32.1/bonobo/bonobo-debug.c
-@@ -47,6 +47,7 @@ bonobo_debug_init(void)
- 	  _bonobo_debug_file = stderr;
- }
- 
-+__attribute__((__format__ (printf, 2, 0)))
- void
- bonobo_debug_print (const char *name, char *fmt, ...)
- {
diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb b/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
deleted file mode 100644
index 8e00eb4d2..000000000
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require libbonobo.inc
-
-SRC_URI += "file://0001-Remove-use-of-G_DISABLE_DEPRECATED.patch \
-            file://do-not-use-srcdir-variable.patch \
-            file://fix-nonliteral-in-string.patch \
-           "
-SRC_URI[archive.md5sum] = "27fa902d4fdf6762ee010e7053aaf77b"
-SRC_URI[archive.sha256sum] = "9160d4f277646400d3bb6b4fa73636cc6d1a865a32b9d0760e1e9e6ee624976b"
-GNOME_COMPRESS_TYPE="bz2"
-- 
2.14.3


