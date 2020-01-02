Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 99F2E7FC46
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 06:13:45 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id x8so21423098pgk.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jan 2020 22:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tvgjDITOnXIf1yYE9cWFqCn+F7yzUSs2lpKZLIevdJw=;
	b=mItJcHgGhfbSq6X2HXF1XPVQwhQrtx25ZGMTXhZExnWXfSPNwOsYuRsg0hDjp89hrh
	ySOmNNJX5q8B0He/HLWI9f0KuEJd7QwE57hvtN3/B+9oKnKuh5xTd+on8A6TLFPyoCsj
	Gjuj2l+eH+cEtXGPSfzyXm4GQU/+D08z/LOFR9DJLpRN5doZGe5OY5Ro+mIDruhjprNM
	SC8sHQ2Qn4Bp+62z6PP6++eJuQ+nHL/bE1XzHCxkiLOAVVRcR6+cpJsaYi9wUA1QLTnu
	566wdCLdpiSrklyOu54t32NVEwD/SfnlFdYSx46ujsrOWZRDOTQXHiBuvMqoD2duFgnb
	XL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tvgjDITOnXIf1yYE9cWFqCn+F7yzUSs2lpKZLIevdJw=;
	b=X34+Lchq99/JlFyaATiHxSuAvlyfBv/0I553CgWC8A+okVzhbx2IQONTquqiPDIc1B
	MjRhePCPACxm778GWsF+uVIiaTdCuMToY6Bh6zzB21yVT75wY2lZPYM1CVp8CKIvwu9g
	6f6HBt0aOmDDv0YcsNgYZ4+A4bzZkaa6Z/9s2Gono1qiqhbExxhjjPPfjuwIgcq87H8p
	DXabWK344KijAd/LR9BYK/Qs1tOJ3OkePtuYsw6z+wYJPPsbTD7Y6AmT5MpkokqFPydD
	XnS0/wP1cuuDKzlSSdGGjcIv5fFnUuzNIAYCZH9mYXMR9TGv0ruGYCYxcNjr1oPvq/rD
	CcIw==
X-Gm-Message-State: APjAAAXQxt7nn6M2egzVdooR2DixzJOyNACjCuWygobcRSgnXJCFNqy+
	t+KwHzxJqT9cI4UAVE31YTuedExr41w=
X-Google-Smtp-Source: APXvYqzTEXXEw2V0tUYHe2zLrlXB8jvvwiquYnnNmoQJZZtsTxgXgGvEi4NaJazYFFFEQphTe+Ae8g==
X-Received: by 2002:a63:dd58:: with SMTP id g24mr48442189pgj.102.1577945622395;
	Wed, 01 Jan 2020 22:13:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id
	e19sm9369149pjr.10.2020.01.01.22.13.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 01 Jan 2020 22:13:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jan 2020 22:13:27 -0800
Message-Id: <20200102061330.480482-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200102061330.480482-1-raj.khem@gmail.com>
References: <20200102061330.480482-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/6] gtkperf: Fix build with latest gettext 0.20.x
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
X-List-Received-Date: Thu, 02 Jan 2020 06:13:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gtkperf/gtkperf/gettext.patch             | 7801 +++++++++++++++++
 .../recipes-graphics/gtkperf/gtkperf_0.40.bb  |    1 +
 2 files changed, 7802 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gtkperf/gtkperf/gettext.patch

diff --git a/meta-oe/recipes-graphics/gtkperf/gtkperf/gettext.patch b/meta-oe/recipes-graphics/gtkperf/gtkperf/gettext.patch
new file mode 100644
index 0000000000..cde5621683
--- /dev/null
+++ b/meta-oe/recipes-graphics/gtkperf/gtkperf/gettext.patch
@@ -0,0 +1,7801 @@
+Fix build with gettext 0.20.x
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -3,7 +3,7 @@
+ ## If you don't want it to overwrite it,
+ ## 	Please disable it in the Anjuta project configuration
+ 
+-SUBDIRS = intl po src pixmaps
++SUBDIRS = po src pixmaps
+ 
+ gtkperfdocdir = ${prefix}/doc/gtkperf
+ gtkperfdoc_DATA = \
+--- a/configure.in
++++ b/configure.in
+@@ -31,8 +31,7 @@ AC_DEFINE_UNQUOTED(GETTEXT_PACKAGE, "$GE
+ 
+ dnl Languages which your application supports
+ ALL_LINGUAS=""
+-AM_GNU_GETTEXT
+-AM_GNU_GETTEXT_VERSION(0.10.40)
++AM_GNU_GETTEXT([external])
+ 
+ dnl Set PACKAGE_LOCALE_DIR in config.h.
+ if test "x${prefix}" = "xNONE"; then
+@@ -100,7 +99,6 @@ AC_DEFINE_UNQUOTED(PACKAGE_SOURCE_DIR, "
+ 
+ AC_OUTPUT([
+ Makefile
+-intl/Makefile
+ po/Makefile.in
+ src/Makefile
+ pixmaps/Makefile
+--- a/intl/ChangeLog
++++ /dev/null
+@@ -1,4 +0,0 @@
+-2001-09-13  GNU  <bug-gnu-utils@gnu.org>
+-
+-	* Version 0.10.40 released.
+-
+--- a/intl/Makefile.in
++++ /dev/null
+@@ -1,313 +0,0 @@
+-# Makefile for directory with message catalog handling in GNU NLS Utilities.
+-# Copyright (C) 1995-1998, 2000, 2001 Free Software Foundation, Inc.
+-#
+-# This program is free software; you can redistribute it and/or modify it
+-# under the terms of the GNU Library General Public License as published
+-# by the Free Software Foundation; either version 2, or (at your option)
+-# any later version.
+-#
+-# This program is distributed in the hope that it will be useful,
+-# but WITHOUT ANY WARRANTY; without even the implied warranty of
+-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-# Library General Public License for more details.
+-#
+-# You should have received a copy of the GNU Library General Public
+-# License along with this program; if not, write to the Free Software
+-# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-# USA.
+-
+-PACKAGE = @PACKAGE@
+-VERSION = @VERSION@
+-
+-SHELL = /bin/sh
+-
+-srcdir = @srcdir@
+-top_srcdir = @top_srcdir@
+-top_builddir = ..
+-VPATH = @srcdir@
+-
+-prefix = @prefix@
+-exec_prefix = @exec_prefix@
+-transform = @program_transform_name@
+-libdir = @libdir@
+-includedir = @includedir@
+-datadir = @datadir@
+-localedir = $(datadir)/locale
+-gettextsrcdir = $(datadir)/gettext/intl
+-aliaspath = $(localedir)
+-subdir = intl
+-
+-INSTALL = @INSTALL@
+-INSTALL_DATA = @INSTALL_DATA@
+-MKINSTALLDIRS = @MKINSTALLDIRS@
+-mkinstalldirs = $(SHELL) `case "$(MKINSTALLDIRS)" in /*) echo "$(MKINSTALLDIRS)" ;; *) echo "$(top_builddir)/$(MKINSTALLDIRS)" ;; esac`
+-
+-l = @INTL_LIBTOOL_SUFFIX_PREFIX@
+-
+-AR = ar
+-CC = @CC@
+-LIBTOOL = @LIBTOOL@
+-RANLIB = @RANLIB@
+-YACC = @INTLBISON@ -y -d
+-YFLAGS = --name-prefix=__gettext
+-
+-DEFS = -DLOCALEDIR=\"$(localedir)\" -DLOCALE_ALIAS_PATH=\"$(aliaspath)\" \
+--DLIBDIR=\"$(libdir)\" @DEFS@
+-CPPFLAGS = @CPPFLAGS@
+-CFLAGS = @CFLAGS@
+-LDFLAGS = @LDFLAGS@
+-
+-COMPILE = $(CC) -c $(DEFS) $(INCLUDES) $(CPPFLAGS) $(CFLAGS) $(XCFLAGS)
+-
+-HEADERS = $(COMHDRS) libgnuintl.h libgettext.h loadinfo.h
+-COMHDRS = gettext.h gettextP.h hash-string.h
+-SOURCES = $(COMSRCS) intl-compat.c
+-COMSRCS = bindtextdom.c dcgettext.c dgettext.c gettext.c \
+-finddomain.c loadmsgcat.c localealias.c textdomain.c l10nflist.c \
+-explodename.c dcigettext.c dcngettext.c dngettext.c ngettext.c plural.y \
+-localcharset.c
+-OBJECTS = @INTLOBJS@ bindtextdom.$lo dcgettext.$lo dgettext.$lo gettext.$lo \
+-finddomain.$lo loadmsgcat.$lo localealias.$lo textdomain.$lo l10nflist.$lo \
+-explodename.$lo dcigettext.$lo dcngettext.$lo dngettext.$lo ngettext.$lo \
+-plural.$lo localcharset.$lo
+-GETTOBJS = intl-compat.$lo
+-DISTFILES.common = Makefile.in \
+-config.charset locale.alias ref-add.sin ref-del.sin $(HEADERS) $(SOURCES)
+-DISTFILES.generated = plural.c
+-DISTFILES.normal = VERSION
+-DISTFILES.gettext = COPYING.LIB-2 COPYING.LIB-2.1 libintl.glibc
+-DISTFILES.obsolete = xopen-msg.sed linux-msg.sed po2tbl.sed.in cat-compat.c
+-
+-# Libtool's library version information for libintl.
+-# Before making a gettext release, the gettext maintainer must change this
+-# according to the libtool documentation, section "Library interface versions".
+-# Maintainers of other packages that include the intl directory must *not*
+-# change these values.
+-LTV_CURRENT=1
+-LTV_REVISION=1
+-LTV_AGE=0
+-
+-.SUFFIXES:
+-.SUFFIXES: .c .y .o .lo .sin .sed
+-.c.o:
+-	$(COMPILE) $<
+-.c.lo:
+-	$(LIBTOOL) --mode=compile $(COMPILE) $<
+-
+-.y.c:
+-	$(YACC) $(YFLAGS) --output $@ $<
+-	rm -f $*.h
+-
+-.sin.sed:
+-	sed -e '/^#/d' -e 's/@''PACKAGE''@/@PACKAGE@/g' $< > t-$@
+-	mv t-$@ $@
+-
+-INCLUDES = -I.. -I. -I$(top_srcdir)/intl
+-
+-all: all-@USE_INCLUDED_LIBINTL@
+-all-yes: libintl.$la libintl.h charset.alias ref-add.sed ref-del.sed
+-all-no: all-no-@BUILD_INCLUDED_LIBINTL@
+-all-no-yes: libgnuintl.$la
+-all-no-no:
+-
+-libintl.a libgnuintl.a: $(OBJECTS)
+-	rm -f $@
+-	$(AR) cru $@ $(OBJECTS)
+-	$(RANLIB) $@
+-
+-libintl.la libgnuintl.la: $(OBJECTS)
+-	$(LIBTOOL) --mode=link \
+-	  $(CC) $(CPPFLAGS) $(CFLAGS) $(XCFLAGS) $(LDFLAGS) -o $@ \
+-	  $(OBJECTS) @LIBICONV@ \
+-	  -version-info $(LTV_CURRENT):$(LTV_REVISION):$(LTV_AGE) \
+-	  -rpath $(libdir) \
+-	  -no-undefined
+-
+-libintl.h: libgnuintl.h
+-	cp $(srcdir)/libgnuintl.h libintl.h
+-
+-charset.alias: config.charset
+-	$(SHELL) $(srcdir)/config.charset '@host@' > t-$@
+-	mv t-$@ $@
+-
+-check: all
+-
+-# This installation goal is only used in GNU gettext.  Packages which
+-# only use the library should use install instead.
+-
+-# We must not install the libintl.h/libintl.a files if we are on a
+-# system which has the GNU gettext() function in its C library or in a
+-# separate library.
+-# If you want to use the one which comes with this version of the
+-# package, you have to use `configure --with-included-gettext'.
+-install: install-exec install-data
+-install-exec: all
+-	if test "$(PACKAGE)" = "gettext" \
+-	   && test '@INTLOBJS@' = '$(GETTOBJS)'; then \
+-	  $(mkinstalldirs) $(DESTDIR)$(libdir) $(DESTDIR)$(includedir); \
+-	  $(INSTALL_DATA) libintl.h $(DESTDIR)$(includedir)/libintl.h; \
+-	  $(LIBTOOL) --mode=install \
+-	    $(INSTALL_DATA) libintl.$la $(DESTDIR)$(libdir)/libintl.$la; \
+-	else \
+-	  : ; \
+-	fi
+-	if test '@USE_INCLUDED_LIBINTL@' = yes; then \
+-	  $(mkinstalldirs) $(DESTDIR)$(libdir); \
+-	  temp=$(DESTDIR)$(libdir)/t-charset.alias; \
+-	  dest=$(DESTDIR)$(libdir)/charset.alias; \
+-	  if test -f $(DESTDIR)$(libdir)/charset.alias; then \
+-	    orig=$(DESTDIR)$(libdir)/charset.alias; \
+-	    sed -f ref-add.sed $$orig > $$temp; \
+-	    $(INSTALL_DATA) $$temp $$dest; \
+-	    rm -f $$temp; \
+-	  else \
+-	    if test @GLIBC21@ = no; then \
+-	      orig=charset.alias; \
+-	      sed -f ref-add.sed $$orig > $$temp; \
+-	      $(INSTALL_DATA) $$temp $$dest; \
+-	      rm -f $$temp; \
+-	    fi; \
+-	  fi; \
+-	  $(mkinstalldirs) $(DESTDIR)$(localedir); \
+-	  test -f $(DESTDIR)$(localedir)/locale.alias \
+-	    && orig=$(DESTDIR)$(localedir)/locale.alias \
+-	    || orig=$(srcdir)/locale.alias; \
+-	  temp=$(DESTDIR)$(localedir)/t-locale.alias; \
+-	  dest=$(DESTDIR)$(localedir)/locale.alias; \
+-	  sed -f ref-add.sed $$orig > $$temp; \
+-	  $(INSTALL_DATA) $$temp $$dest; \
+-	  rm -f $$temp; \
+-	else \
+-	  : ; \
+-	fi
+-install-data: all
+-	if test "$(PACKAGE)" = "gettext"; then \
+-	  $(mkinstalldirs) $(DESTDIR)$(gettextsrcdir); \
+-	  $(INSTALL_DATA) VERSION $(DESTDIR)$(gettextsrcdir)/VERSION; \
+-	  $(INSTALL_DATA) ChangeLog.inst $(DESTDIR)$(gettextsrcdir)/ChangeLog; \
+-	  dists="COPYING.LIB-2 COPYING.LIB-2.1 $(DISTFILES.common)"; \
+-	  for file in $$dists; do \
+-	    $(INSTALL_DATA) $(srcdir)/$$file \
+-			    $(DESTDIR)$(gettextsrcdir)/$$file; \
+-	  done; \
+-	  chmod a+x $(DESTDIR)$(gettextsrcdir)/config.charset; \
+-	  dists="$(DISTFILES.generated)"; \
+-	  for file in $$dists; do \
+-	    if test -f $$file; then dir=.; else dir=$(srcdir); fi; \
+-	    $(INSTALL_DATA) $$dir/$$file \
+-			    $(DESTDIR)$(gettextsrcdir)/$$file; \
+-	  done; \
+-	  dists="$(DISTFILES.obsolete)"; \
+-	  for file in $$dists; do \
+-	    rm -f $(DESTDIR)$(gettextsrcdir)/$$file; \
+-	  done; \
+-	else \
+-	  : ; \
+-	fi
+-
+-# Define this as empty until I found a useful application.
+-installcheck:
+-
+-uninstall:
+-	if test "$(PACKAGE)" = "gettext" \
+-	   && test '@INTLOBJS@' = '$(GETTOBJS)'; then \
+-	  rm -f $(DESTDIR)$(includedir)/libintl.h; \
+-	  $(LIBTOOL) --mode=uninstall \
+-	    rm -f $(DESTDIR)$(libdir)/libintl.$la; \
+-	else \
+-	  : ; \
+-	fi
+-	if test '@USE_INCLUDED_LIBINTL@' = yes; then \
+-	  if test -f $(DESTDIR)$(libdir)/charset.alias; then \
+-	    temp=$(DESTDIR)$(libdir)/t-charset.alias; \
+-	    dest=$(DESTDIR)$(libdir)/charset.alias; \
+-	    sed -f ref-del.sed $$dest > $$temp; \
+-	    if grep '^# Packages using this file: $$' $$temp > /dev/null; then \
+-	      rm -f $$dest; \
+-	    else \
+-	      $(INSTALL_DATA) $$temp $$dest; \
+-	    fi; \
+-	    rm -f $$temp; \
+-	  fi; \
+-	  if test -f $(DESTDIR)$(localedir)/locale.alias; then \
+-	    temp=$(DESTDIR)$(localedir)/t-locale.alias; \
+-	    dest=$(DESTDIR)$(localedir)/locale.alias; \
+-	    sed -f ref-del.sed $$dest > $$temp; \
+-	    if grep '^# Packages using this file: $$' $$temp > /dev/null; then \
+-	      rm -f $$dest; \
+-	    else \
+-	      $(INSTALL_DATA) $$temp $$dest; \
+-	    fi; \
+-	    rm -f $$temp; \
+-	  fi; \
+-	else \
+-	  : ; \
+-	fi
+-	if test "$(PACKAGE)" = "gettext"; then \
+-	  for file in VERSION ChangeLog COPYING.LIB-2 COPYING.LIB-2.1 $(DISTFILES.common) $(DISTFILES.generated); do \
+-	    rm -f $(DESTDIR)$(gettextsrcdir)/$$file; \
+-	  done; \
+-	else \
+-	  : ; \
+-	fi
+-
+-info dvi:
+-
+-$(OBJECTS): ../config.h libgnuintl.h
+-bindtextdom.$lo finddomain.$lo loadmsgcat.$lo: gettextP.h gettext.h loadinfo.h
+-dcgettext.$lo: gettextP.h gettext.h hash-string.h loadinfo.h
+-
+-tags: TAGS
+-
+-TAGS: $(HEADERS) $(SOURCES)
+-	here=`pwd`; cd $(srcdir) && etags -o $$here/TAGS $(HEADERS) $(SOURCES)
+-
+-id: ID
+-
+-ID: $(HEADERS) $(SOURCES)
+-	here=`pwd`; cd $(srcdir) && mkid -f$$here/ID $(HEADERS) $(SOURCES)
+-
+-
+-mostlyclean:
+-	rm -f *.a *.la *.o *.lo core core.*
+-	rm -f libintl.h charset.alias ref-add.sed ref-del.sed
+-	rm -f -r .libs _libs
+-
+-clean: mostlyclean
+-
+-distclean: clean
+-	rm -f Makefile ID TAGS
+-	if test "$(PACKAGE)" = gettext; then \
+-	  rm -f ChangeLog.inst $(DISTFILES.normal); \
+-	else \
+-	  : ; \
+-	fi
+-
+-maintainer-clean: distclean
+-	@echo "This command is intended for maintainers to use;"
+-	@echo "it deletes files that may require special tools to rebuild."
+-
+-
+-# GNU gettext needs not contain the file `VERSION' but contains some
+-# other files which should not be distributed in other packages.
+-distdir = ../$(PACKAGE)-$(VERSION)/$(subdir)
+-dist distdir: Makefile
+-	if test "$(PACKAGE)" = gettext; then \
+-	  additional="$(DISTFILES.gettext)"; \
+-	else \
+-	  additional="$(DISTFILES.normal)"; \
+-	fi; \
+-	$(MAKE) $(DISTFILES.common) $(DISTFILES.generated) $$additional; \
+-	for file in ChangeLog $(DISTFILES.common) $(DISTFILES.generated) $$additional; do \
+-	  if test -f $$file; then dir=.; else dir=$(srcdir); fi; \
+-	  ln $$dir/$$file $(distdir) 2> /dev/null \
+-	    || cp -p $$dir/$$file $(distdir); \
+-	done
+-
+-Makefile: Makefile.in ../config.status
+-	cd .. \
+-	  && CONFIG_FILES=$(subdir)/$@ CONFIG_HEADERS= $(SHELL) ./config.status
+-
+-# Tell versions [3.59,3.63) of GNU make not to export all variables.
+-# Otherwise a system limit (for SysV at least) may be exceeded.
+-.NOEXPORT:
+--- a/intl/VERSION
++++ /dev/null
+@@ -1 +0,0 @@
+-GNU gettext library from gettext-0.10.40
+--- a/intl/bindtextdom.c
++++ /dev/null
+@@ -1,369 +0,0 @@
+-/* Implementation of the bindtextdomain(3) function
+-   Copyright (C) 1995-1998, 2000, 2001 Free Software Foundation, Inc.
+-
+-   This program is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU Library General Public License as published
+-   by the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Library General Public License for more details.
+-
+-   You should have received a copy of the GNU Library General Public
+-   License along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-   USA.  */
+-
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-#include <stddef.h>
+-#include <stdlib.h>
+-#include <string.h>
+-
+-#ifdef _LIBC
+-# include <libintl.h>
+-#else
+-# include "libgnuintl.h"
+-#endif
+-#include "gettextP.h"
+-
+-#ifdef _LIBC
+-/* We have to handle multi-threaded applications.  */
+-# include <bits/libc-lock.h>
+-#else
+-/* Provide dummy implementation if this is outside glibc.  */
+-# define __libc_rwlock_define(CLASS, NAME)
+-# define __libc_rwlock_wrlock(NAME)
+-# define __libc_rwlock_unlock(NAME)
+-#endif
+-
+-/* The internal variables in the standalone libintl.a must have different
+-   names than the internal variables in GNU libc, otherwise programs
+-   using libintl.a cannot be linked statically.  */
+-#if !defined _LIBC
+-# define _nl_default_dirname _nl_default_dirname__
+-# define _nl_domain_bindings _nl_domain_bindings__
+-#endif
+-
+-/* Some compilers, like SunOS4 cc, don't have offsetof in <stddef.h>.  */
+-#ifndef offsetof
+-# define offsetof(type,ident) ((size_t)&(((type*)0)->ident))
+-#endif
+-
+-/* @@ end of prolog @@ */
+-
+-/* Contains the default location of the message catalogs.  */
+-extern const char _nl_default_dirname[];
+-
+-/* List with bindings of specific domains.  */
+-extern struct binding *_nl_domain_bindings;
+-
+-/* Lock variable to protect the global data in the gettext implementation.  */
+-__libc_rwlock_define (extern, _nl_state_lock)
+-
+-
+-/* Names for the libintl functions are a problem.  They must not clash
+-   with existing names and they should follow ANSI C.  But this source
+-   code is also used in GNU C Library where the names have a __
+-   prefix.  So we have to make a difference here.  */
+-#ifdef _LIBC
+-# define BINDTEXTDOMAIN __bindtextdomain
+-# define BIND_TEXTDOMAIN_CODESET __bind_textdomain_codeset
+-# ifndef strdup
+-#  define strdup(str) __strdup (str)
+-# endif
+-#else
+-# define BINDTEXTDOMAIN bindtextdomain__
+-# define BIND_TEXTDOMAIN_CODESET bind_textdomain_codeset__
+-#endif
+-
+-/* Prototypes for local functions.  */
+-static void set_binding_values PARAMS ((const char *domainname,
+-					const char **dirnamep,
+-					const char **codesetp));
+-     
+-/* Specifies the directory name *DIRNAMEP and the output codeset *CODESETP
+-   to be used for the DOMAINNAME message catalog.
+-   If *DIRNAMEP or *CODESETP is NULL, the corresponding attribute is not
+-   modified, only the current value is returned.
+-   If DIRNAMEP or CODESETP is NULL, the corresponding attribute is neither
+-   modified nor returned.  */
+-static void
+-set_binding_values (domainname, dirnamep, codesetp)
+-     const char *domainname;
+-     const char **dirnamep;
+-     const char **codesetp;
+-{
+-  struct binding *binding;
+-  int modified;
+-
+-  /* Some sanity checks.  */
+-  if (domainname == NULL || domainname[0] == '\0')
+-    {
+-      if (dirnamep)
+-	*dirnamep = NULL;
+-      if (codesetp)
+-	*codesetp = NULL;
+-      return;
+-    }
+-
+-  __libc_rwlock_wrlock (_nl_state_lock);
+-
+-  modified = 0;
+-
+-  for (binding = _nl_domain_bindings; binding != NULL; binding = binding->next)
+-    {
+-      int compare = strcmp (domainname, binding->domainname);
+-      if (compare == 0)
+-	/* We found it!  */
+-	break;
+-      if (compare < 0)
+-	{
+-	  /* It is not in the list.  */
+-	  binding = NULL;
+-	  break;
+-	}
+-    }
+-
+-  if (binding != NULL)
+-    {
+-      if (dirnamep)
+-	{
+-	  const char *dirname = *dirnamep;
+-
+-	  if (dirname == NULL)
+-	    /* The current binding has be to returned.  */
+-	    *dirnamep = binding->dirname;
+-	  else
+-	    {
+-	      /* The domain is already bound.  If the new value and the old
+-		 one are equal we simply do nothing.  Otherwise replace the
+-		 old binding.  */
+-	      char *result = binding->dirname;
+-	      if (strcmp (dirname, result) != 0)
+-		{
+-		  if (strcmp (dirname, _nl_default_dirname) == 0)
+-		    result = (char *) _nl_default_dirname;
+-		  else
+-		    {
+-#if defined _LIBC || defined HAVE_STRDUP
+-		      result = strdup (dirname);
+-#else
+-		      size_t len = strlen (dirname) + 1;
+-		      result = (char *) malloc (len);
+-		      if (__builtin_expect (result != NULL, 1))
+-			memcpy (result, dirname, len);
+-#endif
+-		    }
+-
+-		  if (__builtin_expect (result != NULL, 1))
+-		    {
+-		      if (binding->dirname != _nl_default_dirname)
+-			free (binding->dirname);
+-
+-		      binding->dirname = result;
+-		      modified = 1;
+-		    }
+-		}
+-	      *dirnamep = result;
+-	    }
+-	}
+-
+-      if (codesetp)
+-	{
+-	  const char *codeset = *codesetp;
+-
+-	  if (codeset == NULL)
+-	    /* The current binding has be to returned.  */
+-	    *codesetp = binding->codeset;
+-	  else
+-	    {
+-	      /* The domain is already bound.  If the new value and the old
+-		 one are equal we simply do nothing.  Otherwise replace the
+-		 old binding.  */
+-	      char *result = binding->codeset;
+-	      if (result == NULL || strcmp (codeset, result) != 0)
+-		{
+-#if defined _LIBC || defined HAVE_STRDUP
+-		  result = strdup (codeset);
+-#else
+-		  size_t len = strlen (codeset) + 1;
+-		  result = (char *) malloc (len);
+-		  if (__builtin_expect (result != NULL, 1))
+-		    memcpy (result, codeset, len);
+-#endif
+-
+-		  if (__builtin_expect (result != NULL, 1))
+-		    {
+-		      if (binding->codeset != NULL)
+-			free (binding->codeset);
+-
+-		      binding->codeset = result;
+-		      binding->codeset_cntr++;
+-		      modified = 1;
+-		    }
+-		}
+-	      *codesetp = result;
+-	    }
+-	}
+-    }
+-  else if ((dirnamep == NULL || *dirnamep == NULL)
+-	   && (codesetp == NULL || *codesetp == NULL))
+-    {
+-      /* Simply return the default values.  */
+-      if (dirnamep)
+-	*dirnamep = _nl_default_dirname;
+-      if (codesetp)
+-	*codesetp = NULL;
+-    }
+-  else
+-    {
+-      /* We have to create a new binding.  */
+-      size_t len = strlen (domainname) + 1;
+-      struct binding *new_binding =
+-	(struct binding *) malloc (offsetof (struct binding, domainname) + len);
+-
+-      if (__builtin_expect (new_binding == NULL, 0))
+-	goto failed;
+-
+-      memcpy (new_binding->domainname, domainname, len);
+-
+-      if (dirnamep)
+-	{
+-	  const char *dirname = *dirnamep;
+-
+-	  if (dirname == NULL)
+-	    /* The default value.  */
+-	    dirname = _nl_default_dirname;
+-	  else
+-	    {
+-	      if (strcmp (dirname, _nl_default_dirname) == 0)
+-		dirname = _nl_default_dirname;
+-	      else
+-		{
+-		  char *result;
+-#if defined _LIBC || defined HAVE_STRDUP
+-		  result = strdup (dirname);
+-		  if (__builtin_expect (result == NULL, 0))
+-		    goto failed_dirname;
+-#else
+-		  size_t len = strlen (dirname) + 1;
+-		  result = (char *) malloc (len);
+-		  if (__builtin_expect (result == NULL, 0))
+-		    goto failed_dirname;
+-		  memcpy (result, dirname, len);
+-#endif
+-		  dirname = result;
+-		}
+-	    }
+-	  *dirnamep = dirname;
+-	  new_binding->dirname = (char *) dirname;
+-	}
+-      else
+-	/* The default value.  */
+-	new_binding->dirname = (char *) _nl_default_dirname;
+-
+-      new_binding->codeset_cntr = 0;
+-
+-      if (codesetp)
+-	{
+-	  const char *codeset = *codesetp;
+-
+-	  if (codeset != NULL)
+-	    {
+-	      char *result;
+-
+-#if defined _LIBC || defined HAVE_STRDUP
+-	      result = strdup (codeset);
+-	      if (__builtin_expect (result == NULL, 0))
+-		goto failed_codeset;
+-#else
+-	      size_t len = strlen (codeset) + 1;
+-	      result = (char *) malloc (len);
+-	      if (__builtin_expect (result == NULL, 0))
+-		goto failed_codeset;
+-	      memcpy (result, codeset, len);
+-#endif
+-	      codeset = result;
+-	      new_binding->codeset_cntr++;
+-	    }
+-	  *codesetp = codeset;
+-	  new_binding->codeset = (char *) codeset;
+-	}
+-      else
+-	new_binding->codeset = NULL;
+-
+-      /* Now enqueue it.  */
+-      if (_nl_domain_bindings == NULL
+-	  || strcmp (domainname, _nl_domain_bindings->domainname) < 0)
+-	{
+-	  new_binding->next = _nl_domain_bindings;
+-	  _nl_domain_bindings = new_binding;
+-	}
+-      else
+-	{
+-	  binding = _nl_domain_bindings;
+-	  while (binding->next != NULL
+-		 && strcmp (domainname, binding->next->domainname) > 0)
+-	    binding = binding->next;
+-
+-	  new_binding->next = binding->next;
+-	  binding->next = new_binding;
+-	}
+-
+-      modified = 1;
+-
+-      /* Here we deal with memory allocation failures.  */
+-      if (0)
+-	{
+-	failed_codeset:
+-	  if (new_binding->dirname != _nl_default_dirname)
+-	    free (new_binding->dirname);
+-	failed_dirname:
+-	  free (new_binding);
+-	failed:
+-	  if (dirnamep)
+-	    *dirnamep = NULL;
+-	  if (codesetp)
+-	    *codesetp = NULL;
+-	}
+-    }
+-
+-  /* If we modified any binding, we flush the caches.  */
+-  if (modified)
+-    ++_nl_msg_cat_cntr;
+-
+-  __libc_rwlock_unlock (_nl_state_lock);
+-}
+-
+-/* Specify that the DOMAINNAME message catalog will be found
+-   in DIRNAME rather than in the system locale data base.  */
+-char *
+-BINDTEXTDOMAIN (domainname, dirname)
+-     const char *domainname;
+-     const char *dirname;
+-{
+-  set_binding_values (domainname, &dirname, NULL);
+-  return (char *) dirname;
+-}
+-
+-/* Specify the character encoding in which the messages from the
+-   DOMAINNAME message catalog will be returned.  */
+-char *
+-BIND_TEXTDOMAIN_CODESET (domainname, codeset)
+-     const char *domainname;
+-     const char *codeset;
+-{
+-  set_binding_values (domainname, NULL, &codeset);
+-  return (char *) codeset;
+-}
+-
+-#ifdef _LIBC
+-/* Aliases for function names in GNU C Library.  */
+-weak_alias (__bindtextdomain, bindtextdomain);
+-weak_alias (__bind_textdomain_codeset, bind_textdomain_codeset);
+-#endif
+--- a/intl/config.charset
++++ /dev/null
+@@ -1,438 +0,0 @@
+-#! /bin/sh
+-# Output a system dependent table of character encoding aliases.
+-#
+-#   Copyright (C) 2000-2001 Free Software Foundation, Inc.
+-#
+-#   This program is free software; you can redistribute it and/or modify it
+-#   under the terms of the GNU Library General Public License as published
+-#   by the Free Software Foundation; either version 2, or (at your option)
+-#   any later version.
+-#
+-#   This program is distributed in the hope that it will be useful,
+-#   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-#   Library General Public License for more details.
+-#
+-#   You should have received a copy of the GNU Library General Public
+-#   License along with this program; if not, write to the Free Software
+-#   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-#   USA.
+-#
+-# The table consists of lines of the form
+-#    ALIAS  CANONICAL
+-#
+-# ALIAS is the (system dependent) result of "nl_langinfo (CODESET)".
+-# ALIAS is compared in a case sensitive way.
+-#
+-# CANONICAL is the GNU canonical name for this character encoding.
+-# It must be an encoding supported by libiconv. Support by GNU libc is
+-# also desirable. CANONICAL is case insensitive. Usually an upper case
+-# MIME charset name is preferred.
+-# The current list of GNU canonical charset names is as follows.
+-#
+-#       name                         used by which systems         a MIME name?
+-#   ASCII, ANSI_X3.4-1968     glibc solaris freebsd
+-#   ISO-8859-1                glibc aix hpux irix osf solaris freebsd   yes
+-#   ISO-8859-2                glibc aix hpux irix osf solaris freebsd   yes
+-#   ISO-8859-3                glibc                                     yes
+-#   ISO-8859-4                osf solaris freebsd                       yes
+-#   ISO-8859-5                glibc aix hpux irix osf solaris freebsd   yes
+-#   ISO-8859-6                glibc aix hpux solaris                    yes
+-#   ISO-8859-7                glibc aix hpux irix osf solaris           yes
+-#   ISO-8859-8                glibc aix hpux osf solaris                yes
+-#   ISO-8859-9                glibc aix hpux irix osf solaris           yes
+-#   ISO-8859-13               glibc
+-#   ISO-8859-15               glibc aix osf solaris freebsd
+-#   KOI8-R                    glibc solaris freebsd                     yes
+-#   KOI8-U                    glibc freebsd                             yes
+-#   CP437                     dos
+-#   CP775                     dos
+-#   CP850                     aix osf dos
+-#   CP852                     dos
+-#   CP855                     dos
+-#   CP856                     aix
+-#   CP857                     dos
+-#   CP861                     dos
+-#   CP862                     dos
+-#   CP864                     dos
+-#   CP865                     dos
+-#   CP866                     freebsd dos
+-#   CP869                     dos
+-#   CP874                     win32 dos
+-#   CP922                     aix
+-#   CP932                     aix win32 dos
+-#   CP943                     aix
+-#   CP949                     osf win32 dos
+-#   CP950                     win32 dos
+-#   CP1046                    aix
+-#   CP1124                    aix
+-#   CP1129                    aix
+-#   CP1250                    win32
+-#   CP1251                    glibc win32
+-#   CP1252                    aix win32
+-#   CP1253                    win32
+-#   CP1254                    win32
+-#   CP1255                    win32
+-#   CP1256                    win32
+-#   CP1257                    win32
+-#   GB2312                    glibc aix hpux irix solaris freebsd       yes
+-#   EUC-JP                    glibc aix hpux irix osf solaris freebsd   yes
+-#   EUC-KR                    glibc aix hpux irix osf solaris freebsd   yes
+-#   EUC-TW                    glibc aix hpux irix osf solaris
+-#   BIG5                      glibc aix hpux osf solaris freebsd        yes
+-#   BIG5-HKSCS                glibc
+-#   GBK                       aix osf win32 dos
+-#   GB18030                   glibc
+-#   SHIFT_JIS                 hpux osf solaris freebsd                  yes
+-#   JOHAB                     glibc win32
+-#   TIS-620                   glibc aix hpux osf solaris
+-#   VISCII                    glibc                                     yes
+-#   HP-ROMAN8                 hpux
+-#   HP-ARABIC8                hpux
+-#   HP-GREEK8                 hpux
+-#   HP-HEBREW8                hpux
+-#   HP-TURKISH8               hpux
+-#   HP-KANA8                  hpux
+-#   DEC-KANJI                 osf
+-#   DEC-HANYU                 osf
+-#   UTF-8                     glibc aix hpux osf solaris                yes
+-#
+-# Note: Names which are not marked as being a MIME name should not be used in
+-# Internet protocols for information interchange (mail, news, etc.).
+-#
+-# Note: ASCII and ANSI_X3.4-1968 are synonymous canonical names. Applications
+-# must understand both names and treat them as equivalent.
+-#
+-# The first argument passed to this file is the canonical host specification,
+-#    CPU_TYPE-MANUFACTURER-OPERATING_SYSTEM
+-# or
+-#    CPU_TYPE-MANUFACTURER-KERNEL-OPERATING_SYSTEM
+-
+-host="$1"
+-os=`echo "$host" | sed -e 's/^[^-]*-[^-]*-\(.*\)$/\1/'`
+-echo "# This file contains a table of character encoding aliases,"
+-echo "# suitable for operating system '${os}'."
+-echo "# It was automatically generated from config.charset."
+-# List of references, updated during installation:
+-echo "# Packages using this file: "
+-case "$os" in
+-    linux* | *-gnu*)
+-	# With glibc-2.1 or newer, we don't need any canonicalization,
+-	# because glibc has iconv and both glibc and libiconv support all
+-	# GNU canonical names directly. Therefore, the Makefile does not
+-	# need to install the alias file at all.
+-	# The following applies only to glibc-2.0.x and older libcs.
+-	echo "ISO_646.IRV:1983 ASCII"
+-	;;
+-    aix*)
+-	echo "ISO8859-1 ISO-8859-1"
+-	echo "ISO8859-2 ISO-8859-2"
+-	echo "ISO8859-5 ISO-8859-5"
+-	echo "ISO8859-6 ISO-8859-6"
+-	echo "ISO8859-7 ISO-8859-7"
+-	echo "ISO8859-8 ISO-8859-8"
+-	echo "ISO8859-9 ISO-8859-9"
+-	echo "ISO8859-15 ISO-8859-15"
+-	echo "IBM-850 CP850"
+-	echo "IBM-856 CP856"
+-	echo "IBM-921 ISO-8859-13"
+-	echo "IBM-922 CP922"
+-	echo "IBM-932 CP932"
+-	echo "IBM-943 CP943"
+-	echo "IBM-1046 CP1046"
+-	echo "IBM-1124 CP1124"
+-	echo "IBM-1129 CP1129"
+-	echo "IBM-1252 CP1252"
+-	echo "IBM-eucCN GB2312"
+-	echo "IBM-eucJP EUC-JP"
+-	echo "IBM-eucKR EUC-KR"
+-	echo "IBM-eucTW EUC-TW"
+-	echo "big5 BIG5"
+-	echo "GBK GBK"
+-	echo "TIS-620 TIS-620"
+-	echo "UTF-8 UTF-8"
+-	;;
+-    hpux*)
+-	echo "iso88591 ISO-8859-1"
+-	echo "iso88592 ISO-8859-2"
+-	echo "iso88595 ISO-8859-5"
+-	echo "iso88596 ISO-8859-6"
+-	echo "iso88597 ISO-8859-7"
+-	echo "iso88598 ISO-8859-8"
+-	echo "iso88599 ISO-8859-9"
+-	echo "iso885915 ISO-8859-15"
+-	echo "roman8 HP-ROMAN8"
+-	echo "arabic8 HP-ARABIC8"
+-	echo "greek8 HP-GREEK8"
+-	echo "hebrew8 HP-HEBREW8"
+-	echo "turkish8 HP-TURKISH8"
+-	echo "kana8 HP-KANA8"
+-	echo "tis620 TIS-620"
+-	echo "big5 BIG5"
+-	echo "eucJP EUC-JP"
+-	echo "eucKR EUC-KR"
+-	echo "eucTW EUC-TW"
+-	echo "hp15CN GB2312"
+-	#echo "ccdc ?" # what is this?
+-	echo "SJIS SHIFT_JIS"
+-	echo "utf8 UTF-8"
+-	;;
+-    irix*)
+-	echo "ISO8859-1 ISO-8859-1"
+-	echo "ISO8859-2 ISO-8859-2"
+-	echo "ISO8859-5 ISO-8859-5"
+-	echo "ISO8859-7 ISO-8859-7"
+-	echo "ISO8859-9 ISO-8859-9"
+-	echo "eucCN GB2312"
+-	echo "eucJP EUC-JP"
+-	echo "eucKR EUC-KR"
+-	echo "eucTW EUC-TW"
+-	;;
+-    osf*)
+-	echo "ISO8859-1 ISO-8859-1"
+-	echo "ISO8859-2 ISO-8859-2"
+-	echo "ISO8859-4 ISO-8859-4"
+-	echo "ISO8859-5 ISO-8859-5"
+-	echo "ISO8859-7 ISO-8859-7"
+-	echo "ISO8859-8 ISO-8859-8"
+-	echo "ISO8859-9 ISO-8859-9"
+-	echo "ISO8859-15 ISO-8859-15"
+-	echo "cp850 CP850"
+-	echo "big5 BIG5"
+-	echo "dechanyu DEC-HANYU"
+-	echo "dechanzi GB2312"
+-	echo "deckanji DEC-KANJI"
+-	echo "deckorean EUC-KR"
+-	echo "eucJP EUC-JP"
+-	echo "eucKR EUC-KR"
+-	echo "eucTW EUC-TW"
+-	echo "GBK GBK"
+-	echo "KSC5601 CP949"
+-	echo "sdeckanji EUC-JP"
+-	echo "SJIS SHIFT_JIS"
+-	echo "TACTIS TIS-620"
+-	echo "UTF-8 UTF-8"
+-	;;
+-    solaris*)
+-	echo "646 ASCII"
+-	echo "ISO8859-1 ISO-8859-1"
+-	echo "ISO8859-2 ISO-8859-2"
+-	echo "ISO8859-4 ISO-8859-4"
+-	echo "ISO8859-5 ISO-8859-5"
+-	echo "ISO8859-6 ISO-8859-6"
+-	echo "ISO8859-7 ISO-8859-7"
+-	echo "ISO8859-8 ISO-8859-8"
+-	echo "ISO8859-9 ISO-8859-9"
+-	echo "ISO8859-15 ISO-8859-15"
+-	echo "koi8-r KOI8-R"
+-	echo "BIG5 BIG5"
+-	echo "gb2312 GB2312"
+-	echo "cns11643 EUC-TW"
+-	echo "5601 EUC-KR"
+-	echo "eucJP EUC-JP"
+-	echo "PCK SHIFT_JIS"
+-	echo "TIS620.2533 TIS-620"
+-	#echo "sun_eu_greek ?" # what is this?
+-	echo "UTF-8 UTF-8"
+-	;;
+-    freebsd*)
+-	# FreeBSD 4.2 doesn't have nl_langinfo(CODESET); therefore
+-	# localcharset.c falls back to using the full locale name
+-	# from the environment variables.
+-	echo "C ASCII"
+-	echo "US-ASCII ASCII"
+-	for l in la_LN lt_LN; do
+-	  echo "$l.ASCII ASCII"
+-	done
+-	for l in da_DK de_AT de_CH de_DE en_AU en_CA en_GB en_US es_ES \
+-	         fi_FI fr_BE fr_CA fr_CH fr_FR is_IS it_CH it_IT la_LN \
+-	         lt_LN nl_BE nl_NL no_NO pt_PT sv_SE; do
+-	  echo "$l.ISO_8859-1 ISO-8859-1"
+-	  echo "$l.DIS_8859-15 ISO-8859-15"
+-	done
+-	for l in cs_CZ hr_HR hu_HU la_LN lt_LN pl_PL sl_SI; do
+-	  echo "$l.ISO_8859-2 ISO-8859-2"
+-	done
+-	for l in la_LN lt_LT; do
+-	  echo "$l.ISO_8859-4 ISO-8859-4"
+-	done
+-	for l in ru_RU ru_SU; do
+-	  echo "$l.KOI8-R KOI8-R"
+-	  echo "$l.ISO_8859-5 ISO-8859-5"
+-	  echo "$l.CP866 CP866"
+-	done
+-	echo "uk_UA.KOI8-U KOI8-U"
+-	echo "zh_TW.BIG5 BIG5"
+-	echo "zh_TW.Big5 BIG5"
+-	echo "zh_CN.EUC GB2312"
+-	echo "ja_JP.EUC EUC-JP"
+-	echo "ja_JP.SJIS SHIFT_JIS"
+-	echo "ja_JP.Shift_JIS SHIFT_JIS"
+-	echo "ko_KR.EUC EUC-KR"
+-	;;
+-    beos*)
+-	# BeOS has a single locale, and it has UTF-8 encoding.
+-	echo "* UTF-8"
+-	;;
+-    msdosdjgpp*)
+-	# DJGPP 2.03 doesn't have nl_langinfo(CODESET); therefore
+-	# localcharset.c falls back to using the full locale name
+-	# from the environment variables.
+-	echo "#"
+-	echo "# The encodings given here may not all be correct."
+-	echo "# If you find that the encoding given for your language and"
+-	echo "# country is not the one your DOS machine actually uses, just"
+-	echo "# correct it in this file, and send a mail to"
+-	echo "# Juan Manuel Guerrero <st001906@hrz1.hrz.tu-darmstadt.de>"
+-	echo "# and Bruno Haible <haible@clisp.cons.org>."
+-	echo "#"
+-	echo "C ASCII"
+-	# ISO-8859-1 languages
+-	echo "ca CP850"
+-	echo "ca_ES CP850"
+-	echo "da CP865"    # not CP850 ??
+-	echo "da_DK CP865" # not CP850 ??
+-	echo "de CP850"
+-	echo "de_AT CP850"
+-	echo "de_CH CP850"
+-	echo "de_DE CP850"
+-	echo "en CP850"
+-	echo "en_AU CP850" # not CP437 ??
+-	echo "en_CA CP850"
+-	echo "en_GB CP850"
+-	echo "en_NZ CP437"
+-	echo "en_US CP437"
+-	echo "en_ZA CP850" # not CP437 ??
+-	echo "es CP850"
+-	echo "es_AR CP850"
+-	echo "es_BO CP850"
+-	echo "es_CL CP850"
+-	echo "es_CO CP850"
+-	echo "es_CR CP850"
+-	echo "es_CU CP850"
+-	echo "es_DO CP850"
+-	echo "es_EC CP850"
+-	echo "es_ES CP850"
+-	echo "es_GT CP850"
+-	echo "es_HN CP850"
+-	echo "es_MX CP850"
+-	echo "es_NI CP850"
+-	echo "es_PA CP850"
+-	echo "es_PY CP850"
+-	echo "es_PE CP850"
+-	echo "es_SV CP850"
+-	echo "es_UY CP850"
+-	echo "es_VE CP850"
+-	echo "et CP850"
+-	echo "et_EE CP850"
+-	echo "eu CP850"
+-	echo "eu_ES CP850"
+-	echo "fi CP850"
+-	echo "fi_FI CP850"
+-	echo "fr CP850"
+-	echo "fr_BE CP850"
+-	echo "fr_CA CP850"
+-	echo "fr_CH CP850"
+-	echo "fr_FR CP850"
+-	echo "ga CP850"
+-	echo "ga_IE CP850"
+-	echo "gd CP850"
+-	echo "gd_GB CP850"
+-	echo "gl CP850"
+-	echo "gl_ES CP850"
+-	echo "id CP850"    # not CP437 ??
+-	echo "id_ID CP850" # not CP437 ??
+-	echo "is CP861"    # not CP850 ??
+-	echo "is_IS CP861" # not CP850 ??
+-	echo "it CP850"
+-	echo "it_CH CP850"
+-	echo "it_IT CP850"
+-	echo "lt CP775"
+-	echo "lt_LT CP775"
+-	echo "lv CP775"
+-	echo "lv_LV CP775"
+-	echo "nb CP865"    # not CP850 ??
+-	echo "nb_NO CP865" # not CP850 ??
+-	echo "nl CP850"
+-	echo "nl_BE CP850"
+-	echo "nl_NL CP850"
+-	echo "nn CP865"    # not CP850 ??
+-	echo "nn_NO CP865" # not CP850 ??
+-	echo "no CP865"    # not CP850 ??
+-	echo "no_NO CP865" # not CP850 ??
+-	echo "pt CP850"
+-	echo "pt_BR CP850"
+-	echo "pt_PT CP850"
+-	echo "sv CP850"
+-	echo "sv_SE CP850"
+-	# ISO-8859-2 languages
+-	echo "cs CP852"
+-	echo "cs_CZ CP852"
+-	echo "hr CP852"
+-	echo "hr_HR CP852"
+-	echo "hu CP852"
+-	echo "hu_HU CP852"
+-	echo "pl CP852"
+-	echo "pl_PL CP852"
+-	echo "ro CP852"
+-	echo "ro_RO CP852"
+-	echo "sk CP852"
+-	echo "sk_SK CP852"
+-	echo "sl CP852"
+-	echo "sl_SI CP852"
+-	echo "sq CP852"
+-	echo "sq_AL CP852"
+-	echo "sr CP852"    # CP852 or CP866 or CP855 ??
+-	echo "sr_YU CP852" # CP852 or CP866 or CP855 ??
+-	# ISO-8859-3 languages
+-	echo "mt CP850"
+-	echo "mt_MT CP850"
+-	# ISO-8859-5 languages
+-	echo "be CP866"
+-	echo "be_BE CP866"
+-	echo "bg CP866"    # not CP855 ??
+-	echo "bg_BG CP866" # not CP855 ??
+-	echo "mk CP866"    # not CP855 ??
+-	echo "mk_MK CP866" # not CP855 ??
+-	echo "ru KOI8-R"    # not CP866 ??
+-	echo "ru_RU KOI8-R" # not CP866 ??
+-	# ISO-8859-6 languages
+-	echo "ar CP864"
+-	echo "ar_AE CP864"
+-	echo "ar_DZ CP864"
+-	echo "ar_EG CP864"
+-	echo "ar_IQ CP864"
+-	echo "ar_IR CP864"
+-	echo "ar_JO CP864"
+-	echo "ar_KW CP864"
+-	echo "ar_MA CP864"
+-	echo "ar_OM CP864"
+-	echo "ar_QA CP864"
+-	echo "ar_SA CP864"
+-	echo "ar_SY CP864"
+-	# ISO-8859-7 languages
+-	echo "el CP869"
+-	echo "el_GR CP869"
+-	# ISO-8859-8 languages
+-	echo "he CP862"
+-	echo "he_IL CP862"
+-	# ISO-8859-9 languages
+-	echo "tr CP857"
+-	echo "tr_TR CP857"
+-	# Japanese
+-	echo "ja CP932"
+-	echo "ja_JP CP932"
+-	# Chinese
+-	echo "zh_CN GBK"
+-	echo "zh_TW CP950" # not CP938 ??
+-	# Korean
+-	echo "kr CP949"    # not CP934 ??
+-	echo "kr_KR CP949" # not CP934 ??
+-	# Thai
+-	echo "th CP874"
+-	echo "th_TH CP874"
+-	# Other
+-	echo "eo CP850"
+-	echo "eo_EO CP850"
+-	;;
+-esac
+--- a/intl/dcgettext.c
++++ /dev/null
+@@ -1,58 +0,0 @@
+-/* Implementation of the dcgettext(3) function.
+-   Copyright (C) 1995-1999, 2000, 2001 Free Software Foundation, Inc.
+-
+-   This program is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU Library General Public License as published
+-   by the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Library General Public License for more details.
+-
+-   You should have received a copy of the GNU Library General Public
+-   License along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-   USA.  */
+-
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-#include "gettextP.h"
+-#ifdef _LIBC
+-# include <libintl.h>
+-#else
+-# include "libgnuintl.h"
+-#endif
+-
+-/* @@ end of prolog @@ */
+-
+-/* Names for the libintl functions are a problem.  They must not clash
+-   with existing names and they should follow ANSI C.  But this source
+-   code is also used in GNU C Library where the names have a __
+-   prefix.  So we have to make a difference here.  */
+-#ifdef _LIBC
+-# define DCGETTEXT __dcgettext
+-# define DCIGETTEXT __dcigettext
+-#else
+-# define DCGETTEXT dcgettext__
+-# define DCIGETTEXT dcigettext__
+-#endif
+-
+-/* Look up MSGID in the DOMAINNAME message catalog for the current CATEGORY
+-   locale.  */
+-char *
+-DCGETTEXT (domainname, msgid, category)
+-     const char *domainname;
+-     const char *msgid;
+-     int category;
+-{
+-  return DCIGETTEXT (domainname, msgid, NULL, 0, 0, category);
+-}
+-
+-#ifdef _LIBC
+-/* Alias for function name in GNU C Library.  */
+-weak_alias (__dcgettext, dcgettext);
+-#endif
+--- a/intl/dcigettext.c
++++ /dev/null
+@@ -1,1259 +0,0 @@
+-/* Implementation of the internal dcigettext function.
+-   Copyright (C) 1995-1999, 2000, 2001 Free Software Foundation, Inc.
+-
+-   This program is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU Library General Public License as published
+-   by the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Library General Public License for more details.
+-
+-   You should have received a copy of the GNU Library General Public
+-   License along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-   USA.  */
+-
+-/* Tell glibc's <string.h> to provide a prototype for mempcpy().
+-   This must come before <config.h> because <config.h> may include
+-   <features.h>, and once <features.h> has been included, it's too late.  */
+-#ifndef _GNU_SOURCE
+-# define _GNU_SOURCE	1
+-#endif
+-
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-#include <sys/types.h>
+-
+-#ifdef __GNUC__
+-# define alloca __builtin_alloca
+-# define HAVE_ALLOCA 1
+-#else
+-# if defined HAVE_ALLOCA_H || defined _LIBC
+-#  include <alloca.h>
+-# else
+-#  ifdef _AIX
+- #pragma alloca
+-#  else
+-#   ifndef alloca
+-char *alloca ();
+-#   endif
+-#  endif
+-# endif
+-#endif
+-
+-#include <errno.h>
+-#ifndef errno
+-extern int errno;
+-#endif
+-#ifndef __set_errno
+-# define __set_errno(val) errno = (val)
+-#endif
+-
+-#include <stddef.h>
+-#include <stdlib.h>
+-
+-#include <string.h>
+-#if !HAVE_STRCHR && !defined _LIBC
+-# ifndef strchr
+-#  define strchr findex
+-# endif
+-#endif
+-
+-#if defined HAVE_UNISTD_H || defined _LIBC
+-# include <unistd.h>
+-#endif
+-
+-#include <locale.h>
+-
+-#if defined HAVE_SYS_PARAM_H || defined _LIBC
+-# include <sys/param.h>
+-#endif
+-
+-#include "gettextP.h"
+-#ifdef _LIBC
+-# include <libintl.h>
+-#else
+-# include "libgnuintl.h"
+-#endif
+-#include "hash-string.h"
+-
+-/* Thread safetyness.  */
+-#ifdef _LIBC
+-# include <bits/libc-lock.h>
+-#else
+-/* Provide dummy implementation if this is outside glibc.  */
+-# define __libc_lock_define_initialized(CLASS, NAME)
+-# define __libc_lock_lock(NAME)
+-# define __libc_lock_unlock(NAME)
+-# define __libc_rwlock_define_initialized(CLASS, NAME)
+-# define __libc_rwlock_rdlock(NAME)
+-# define __libc_rwlock_unlock(NAME)
+-#endif
+-
+-/* Alignment of types.  */
+-#if defined __GNUC__ && __GNUC__ >= 2
+-# define alignof(TYPE) __alignof__ (TYPE)
+-#else
+-# define alignof(TYPE) \
+-    ((int) &((struct { char dummy1; TYPE dummy2; } *) 0)->dummy2)
+-#endif
+-
+-/* The internal variables in the standalone libintl.a must have different
+-   names than the internal variables in GNU libc, otherwise programs
+-   using libintl.a cannot be linked statically.  */
+-#if !defined _LIBC
+-# define _nl_default_default_domain _nl_default_default_domain__
+-# define _nl_current_default_domain _nl_current_default_domain__
+-# define _nl_default_dirname _nl_default_dirname__
+-# define _nl_domain_bindings _nl_domain_bindings__
+-#endif
+-
+-/* Some compilers, like SunOS4 cc, don't have offsetof in <stddef.h>.  */
+-#ifndef offsetof
+-# define offsetof(type,ident) ((size_t)&(((type*)0)->ident))
+-#endif
+-
+-/* @@ end of prolog @@ */
+-
+-#ifdef _LIBC
+-/* Rename the non ANSI C functions.  This is required by the standard
+-   because some ANSI C functions will require linking with this object
+-   file and the name space must not be polluted.  */
+-# define getcwd __getcwd
+-# ifndef stpcpy
+-#  define stpcpy __stpcpy
+-# endif
+-# define tfind __tfind
+-#else
+-# if !defined HAVE_GETCWD
+-char *getwd ();
+-#  define getcwd(buf, max) getwd (buf)
+-# else
+-char *getcwd ();
+-# endif
+-# ifndef HAVE_STPCPY
+-static char *stpcpy PARAMS ((char *dest, const char *src));
+-# endif
+-# ifndef HAVE_MEMPCPY
+-static void *mempcpy PARAMS ((void *dest, const void *src, size_t n));
+-# endif
+-#endif
+-
+-/* Amount to increase buffer size by in each try.  */
+-#define PATH_INCR 32
+-
+-/* The following is from pathmax.h.  */
+-/* Non-POSIX BSD systems might have gcc's limits.h, which doesn't define
+-   PATH_MAX but might cause redefinition warnings when sys/param.h is
+-   later included (as on MORE/BSD 4.3).  */
+-#if defined _POSIX_VERSION || (defined HAVE_LIMITS_H && !defined __GNUC__)
+-# include <limits.h>
+-#endif
+-
+-#ifndef _POSIX_PATH_MAX
+-# define _POSIX_PATH_MAX 255
+-#endif
+-
+-#if !defined PATH_MAX && defined _PC_PATH_MAX
+-# define PATH_MAX (pathconf ("/", _PC_PATH_MAX) < 1 ? 1024 : pathconf ("/", _PC_PATH_MAX))
+-#endif
+-
+-/* Don't include sys/param.h if it already has been.  */
+-#if defined HAVE_SYS_PARAM_H && !defined PATH_MAX && !defined MAXPATHLEN
+-# include <sys/param.h>
+-#endif
+-
+-#if !defined PATH_MAX && defined MAXPATHLEN
+-# define PATH_MAX MAXPATHLEN
+-#endif
+-
+-#ifndef PATH_MAX
+-# define PATH_MAX _POSIX_PATH_MAX
+-#endif
+-
+-/* Pathname support.
+-   ISSLASH(C)           tests whether C is a directory separator character.
+-   IS_ABSOLUTE_PATH(P)  tests whether P is an absolute path.  If it is not,
+-                        it may be concatenated to a directory pathname.
+-   IS_PATH_WITH_DIR(P)  tests whether P contains a directory specification.
+- */
+-#if defined _WIN32 || defined __WIN32__ || defined __EMX__ || defined __DJGPP__
+-  /* Win32, OS/2, DOS */
+-# define ISSLASH(C) ((C) == '/' || (C) == '\\')
+-# define HAS_DEVICE(P) \
+-    ((((P)[0] >= 'A' && (P)[0] <= 'Z') || ((P)[0] >= 'a' && (P)[0] <= 'z')) \
+-     && (P)[1] == ':')
+-# define IS_ABSOLUTE_PATH(P) (ISSLASH ((P)[0]) || HAS_DEVICE (P))
+-# define IS_PATH_WITH_DIR(P) \
+-    (strchr (P, '/') != NULL || strchr (P, '\\') != NULL || HAS_DEVICE (P))
+-#else
+-  /* Unix */
+-# define ISSLASH(C) ((C) == '/')
+-# define IS_ABSOLUTE_PATH(P) ISSLASH ((P)[0])
+-# define IS_PATH_WITH_DIR(P) (strchr (P, '/') != NULL)
+-#endif
+-
+-/* XPG3 defines the result of `setlocale (category, NULL)' as:
+-   ``Directs `setlocale()' to query `category' and return the current
+-     setting of `local'.''
+-   However it does not specify the exact format.  Neither do SUSV2 and
+-   ISO C 99.  So we can use this feature only on selected systems (e.g.
+-   those using GNU C Library).  */
+-#if defined _LIBC || (defined __GNU_LIBRARY__ && __GNU_LIBRARY__ >= 2)
+-# define HAVE_LOCALE_NULL
+-#endif
+-
+-/* This is the type used for the search tree where known translations
+-   are stored.  */
+-struct known_translation_t
+-{
+-  /* Domain in which to search.  */
+-  char *domainname;
+-
+-  /* The category.  */
+-  int category;
+-
+-  /* State of the catalog counter at the point the string was found.  */
+-  int counter;
+-
+-  /* Catalog where the string was found.  */
+-  struct loaded_l10nfile *domain;
+-
+-  /* And finally the translation.  */
+-  const char *translation;
+-  size_t translation_length;
+-
+-  /* Pointer to the string in question.  */
+-  char msgid[ZERO];
+-};
+-
+-/* Root of the search tree with known translations.  We can use this
+-   only if the system provides the `tsearch' function family.  */
+-#if defined HAVE_TSEARCH || defined _LIBC
+-# include <search.h>
+-
+-static void *root;
+-
+-# ifdef _LIBC
+-#  define tsearch __tsearch
+-# endif
+-
+-/* Function to compare two entries in the table of known translations.  */
+-static int transcmp PARAMS ((const void *p1, const void *p2));
+-static int
+-transcmp (p1, p2)
+-     const void *p1;
+-     const void *p2;
+-{
+-  const struct known_translation_t *s1;
+-  const struct known_translation_t *s2;
+-  int result;
+-
+-  s1 = (const struct known_translation_t *) p1;
+-  s2 = (const struct known_translation_t *) p2;
+-
+-  result = strcmp (s1->msgid, s2->msgid);
+-  if (result == 0)
+-    {
+-      result = strcmp (s1->domainname, s2->domainname);
+-      if (result == 0)
+-	/* We compare the category last (though this is the cheapest
+-	   operation) since it is hopefully always the same (namely
+-	   LC_MESSAGES).  */
+-	result = s1->category - s2->category;
+-    }
+-
+-  return result;
+-}
+-#endif
+-
+-/* Name of the default domain used for gettext(3) prior any call to
+-   textdomain(3).  The default value for this is "messages".  */
+-const char _nl_default_default_domain[] = "messages";
+-
+-/* Value used as the default domain for gettext(3).  */
+-const char *_nl_current_default_domain = _nl_default_default_domain;
+-
+-/* Contains the default location of the message catalogs.  */
+-const char _nl_default_dirname[] = LOCALEDIR;
+-
+-/* List with bindings of specific domains created by bindtextdomain()
+-   calls.  */
+-struct binding *_nl_domain_bindings;
+-
+-/* Prototypes for local functions.  */
+-static char *plural_lookup PARAMS ((struct loaded_l10nfile *domain,
+-				    unsigned long int n,
+-				    const char *translation,
+-				    size_t translation_len))
+-     internal_function;
+-static unsigned long int plural_eval PARAMS ((struct expression *pexp,
+-					      unsigned long int n))
+-     internal_function;
+-static const char *category_to_name PARAMS ((int category)) internal_function;
+-static const char *guess_category_value PARAMS ((int category,
+-						 const char *categoryname))
+-     internal_function;
+-
+-
+-/* For those loosing systems which don't have `alloca' we have to add
+-   some additional code emulating it.  */
+-#ifdef HAVE_ALLOCA
+-/* Nothing has to be done.  */
+-# define ADD_BLOCK(list, address) /* nothing */
+-# define FREE_BLOCKS(list) /* nothing */
+-#else
+-struct block_list
+-{
+-  void *address;
+-  struct block_list *next;
+-};
+-# define ADD_BLOCK(list, addr)						      \
+-  do {									      \
+-    struct block_list *newp = (struct block_list *) malloc (sizeof (*newp));  \
+-    /* If we cannot get a free block we cannot add the new element to	      \
+-       the list.  */							      \
+-    if (newp != NULL) {							      \
+-      newp->address = (addr);						      \
+-      newp->next = (list);						      \
+-      (list) = newp;							      \
+-    }									      \
+-  } while (0)
+-# define FREE_BLOCKS(list)						      \
+-  do {									      \
+-    while (list != NULL) {						      \
+-      struct block_list *old = list;					      \
+-      list = list->next;						      \
+-      free (old);							      \
+-    }									      \
+-  } while (0)
+-# undef alloca
+-# define alloca(size) (malloc (size))
+-#endif	/* have alloca */
+-
+-
+-#ifdef _LIBC
+-/* List of blocks allocated for translations.  */
+-typedef struct transmem_list
+-{
+-  struct transmem_list *next;
+-  char data[ZERO];
+-} transmem_block_t;
+-static struct transmem_list *transmem_list;
+-#else
+-typedef unsigned char transmem_block_t;
+-#endif
+-
+-
+-/* Names for the libintl functions are a problem.  They must not clash
+-   with existing names and they should follow ANSI C.  But this source
+-   code is also used in GNU C Library where the names have a __
+-   prefix.  So we have to make a difference here.  */
+-#ifdef _LIBC
+-# define DCIGETTEXT __dcigettext
+-#else
+-# define DCIGETTEXT dcigettext__
+-#endif
+-
+-/* Lock variable to protect the global data in the gettext implementation.  */
+-#ifdef _LIBC
+-__libc_rwlock_define_initialized (, _nl_state_lock)
+-#endif
+-
+-/* Checking whether the binaries runs SUID must be done and glibc provides
+-   easier methods therefore we make a difference here.  */
+-#ifdef _LIBC
+-# define ENABLE_SECURE __libc_enable_secure
+-# define DETERMINE_SECURE
+-#else
+-# ifndef HAVE_GETUID
+-#  define getuid() 0
+-# endif
+-# ifndef HAVE_GETGID
+-#  define getgid() 0
+-# endif
+-# ifndef HAVE_GETEUID
+-#  define geteuid() getuid()
+-# endif
+-# ifndef HAVE_GETEGID
+-#  define getegid() getgid()
+-# endif
+-static int enable_secure;
+-# define ENABLE_SECURE (enable_secure == 1)
+-# define DETERMINE_SECURE \
+-  if (enable_secure == 0)						      \
+-    {									      \
+-      if (getuid () != geteuid () || getgid () != getegid ())		      \
+-	enable_secure = 1;						      \
+-      else								      \
+-	enable_secure = -1;						      \
+-    }
+-#endif
+-
+-/* Look up MSGID in the DOMAINNAME message catalog for the current
+-   CATEGORY locale and, if PLURAL is nonzero, search over string
+-   depending on the plural form determined by N.  */
+-char *
+-DCIGETTEXT (domainname, msgid1, msgid2, plural, n, category)
+-     const char *domainname;
+-     const char *msgid1;
+-     const char *msgid2;
+-     int plural;
+-     unsigned long int n;
+-     int category;
+-{
+-#ifndef HAVE_ALLOCA
+-  struct block_list *block_list = NULL;
+-#endif
+-  struct loaded_l10nfile *domain;
+-  struct binding *binding;
+-  const char *categoryname;
+-  const char *categoryvalue;
+-  char *dirname, *xdomainname;
+-  char *single_locale;
+-  char *retval;
+-  size_t retlen;
+-  int saved_errno;
+-#if defined HAVE_TSEARCH || defined _LIBC
+-  struct known_translation_t *search;
+-  struct known_translation_t **foundp = NULL;
+-  size_t msgid_len;
+-#endif
+-  size_t domainname_len;
+-
+-  /* If no real MSGID is given return NULL.  */
+-  if (msgid1 == NULL)
+-    return NULL;
+-
+-  __libc_rwlock_rdlock (_nl_state_lock);
+-
+-  /* If DOMAINNAME is NULL, we are interested in the default domain.  If
+-     CATEGORY is not LC_MESSAGES this might not make much sense but the
+-     definition left this undefined.  */
+-  if (domainname == NULL)
+-    domainname = _nl_current_default_domain;
+-
+-#if defined HAVE_TSEARCH || defined _LIBC
+-  msgid_len = strlen (msgid1) + 1;
+-
+-  /* Try to find the translation among those which we found at
+-     some time.  */
+-  search = (struct known_translation_t *)
+-	   alloca (offsetof (struct known_translation_t, msgid) + msgid_len);
+-  memcpy (search->msgid, msgid1, msgid_len);
+-  search->domainname = (char *) domainname;
+-  search->category = category;
+-
+-  foundp = (struct known_translation_t **) tfind (search, &root, transcmp);
+-  if (foundp != NULL && (*foundp)->counter == _nl_msg_cat_cntr)
+-    {
+-      /* Now deal with plural.  */
+-      if (plural)
+-	retval = plural_lookup ((*foundp)->domain, n, (*foundp)->translation,
+-				(*foundp)->translation_length);
+-      else
+-	retval = (char *) (*foundp)->translation;
+-
+-      __libc_rwlock_unlock (_nl_state_lock);
+-      return retval;
+-    }
+-#endif
+-
+-  /* Preserve the `errno' value.  */
+-  saved_errno = errno;
+-
+-  /* See whether this is a SUID binary or not.  */
+-  DETERMINE_SECURE;
+-
+-  /* First find matching binding.  */
+-  for (binding = _nl_domain_bindings; binding != NULL; binding = binding->next)
+-    {
+-      int compare = strcmp (domainname, binding->domainname);
+-      if (compare == 0)
+-	/* We found it!  */
+-	break;
+-      if (compare < 0)
+-	{
+-	  /* It is not in the list.  */
+-	  binding = NULL;
+-	  break;
+-	}
+-    }
+-
+-  if (binding == NULL)
+-    dirname = (char *) _nl_default_dirname;
+-  else if (IS_ABSOLUTE_PATH (binding->dirname))
+-    dirname = binding->dirname;
+-  else
+-    {
+-      /* We have a relative path.  Make it absolute now.  */
+-      size_t dirname_len = strlen (binding->dirname) + 1;
+-      size_t path_max;
+-      char *ret;
+-
+-      path_max = (unsigned int) PATH_MAX;
+-      path_max += 2;		/* The getcwd docs say to do this.  */
+-
+-      for (;;)
+-	{
+-	  dirname = (char *) alloca (path_max + dirname_len);
+-	  ADD_BLOCK (block_list, dirname);
+-
+-	  __set_errno (0);
+-	  ret = getcwd (dirname, path_max);
+-	  if (ret != NULL || errno != ERANGE)
+-	    break;
+-
+-	  path_max += path_max / 2;
+-	  path_max += PATH_INCR;
+-	}
+-
+-      if (ret == NULL)
+-	{
+-	  /* We cannot get the current working directory.  Don't signal an
+-	     error but simply return the default string.  */
+-	  FREE_BLOCKS (block_list);
+-	  __libc_rwlock_unlock (_nl_state_lock);
+-	  __set_errno (saved_errno);
+-	  return (plural == 0
+-		  ? (char *) msgid1
+-		  /* Use the Germanic plural rule.  */
+-		  : n == 1 ? (char *) msgid1 : (char *) msgid2);
+-	}
+-
+-      stpcpy (stpcpy (strchr (dirname, '\0'), "/"), binding->dirname);
+-    }
+-
+-  /* Now determine the symbolic name of CATEGORY and its value.  */
+-  categoryname = category_to_name (category);
+-  categoryvalue = guess_category_value (category, categoryname);
+-
+-  domainname_len = strlen (domainname);
+-  xdomainname = (char *) alloca (strlen (categoryname)
+-				 + domainname_len + 5);
+-  ADD_BLOCK (block_list, xdomainname);
+-
+-  stpcpy (mempcpy (stpcpy (stpcpy (xdomainname, categoryname), "/"),
+-		  domainname, domainname_len),
+-	  ".mo");
+-
+-  /* Creating working area.  */
+-  single_locale = (char *) alloca (strlen (categoryvalue) + 1);
+-  ADD_BLOCK (block_list, single_locale);
+-
+-
+-  /* Search for the given string.  This is a loop because we perhaps
+-     got an ordered list of languages to consider for the translation.  */
+-  while (1)
+-    {
+-      /* Make CATEGORYVALUE point to the next element of the list.  */
+-      while (categoryvalue[0] != '\0' && categoryvalue[0] == ':')
+-	++categoryvalue;
+-      if (categoryvalue[0] == '\0')
+-	{
+-	  /* The whole contents of CATEGORYVALUE has been searched but
+-	     no valid entry has been found.  We solve this situation
+-	     by implicitly appending a "C" entry, i.e. no translation
+-	     will take place.  */
+-	  single_locale[0] = 'C';
+-	  single_locale[1] = '\0';
+-	}
+-      else
+-	{
+-	  char *cp = single_locale;
+-	  while (categoryvalue[0] != '\0' && categoryvalue[0] != ':')
+-	    *cp++ = *categoryvalue++;
+-	  *cp = '\0';
+-
+-	  /* When this is a SUID binary we must not allow accessing files
+-	     outside the dedicated directories.  */
+-	  if (ENABLE_SECURE && IS_PATH_WITH_DIR (single_locale))
+-	    /* Ingore this entry.  */
+-	    continue;
+-	}
+-
+-      /* If the current locale value is C (or POSIX) we don't load a
+-	 domain.  Return the MSGID.  */
+-      if (strcmp (single_locale, "C") == 0
+-	  || strcmp (single_locale, "POSIX") == 0)
+-	{
+-	  FREE_BLOCKS (block_list);
+-	  __libc_rwlock_unlock (_nl_state_lock);
+-	  __set_errno (saved_errno);
+-	  return (plural == 0
+-		  ? (char *) msgid1
+-		  /* Use the Germanic plural rule.  */
+-		  : n == 1 ? (char *) msgid1 : (char *) msgid2);
+-	}
+-
+-
+-      /* Find structure describing the message catalog matching the
+-	 DOMAINNAME and CATEGORY.  */
+-      domain = _nl_find_domain (dirname, single_locale, xdomainname, binding);
+-
+-      if (domain != NULL)
+-	{
+-	  retval = _nl_find_msg (domain, binding, msgid1, &retlen);
+-
+-	  if (retval == NULL)
+-	    {
+-	      int cnt;
+-
+-	      for (cnt = 0; domain->successor[cnt] != NULL; ++cnt)
+-		{
+-		  retval = _nl_find_msg (domain->successor[cnt], binding,
+-					 msgid1, &retlen);
+-
+-		  if (retval != NULL)
+-		    {
+-		      domain = domain->successor[cnt];
+-		      break;
+-		    }
+-		}
+-	    }
+-
+-	  if (retval != NULL)
+-	    {
+-	      /* Found the translation of MSGID1 in domain DOMAIN:
+-		 starting at RETVAL, RETLEN bytes.  */
+-	      FREE_BLOCKS (block_list);
+-	      __set_errno (saved_errno);
+-#if defined HAVE_TSEARCH || defined _LIBC
+-	      if (foundp == NULL)
+-		{
+-		  /* Create a new entry and add it to the search tree.  */
+-		  struct known_translation_t *newp;
+-
+-		  newp = (struct known_translation_t *)
+-		    malloc (offsetof (struct known_translation_t, msgid)
+-			    + msgid_len + domainname_len + 1);
+-		  if (newp != NULL)
+-		    {
+-		      newp->domainname =
+-			mempcpy (newp->msgid, msgid1, msgid_len);
+-		      memcpy (newp->domainname, domainname, domainname_len + 1);
+-		      newp->category = category;
+-		      newp->counter = _nl_msg_cat_cntr;
+-		      newp->domain = domain;
+-		      newp->translation = retval;
+-		      newp->translation_length = retlen;
+-
+-		      /* Insert the entry in the search tree.  */
+-		      foundp = (struct known_translation_t **)
+-			tsearch (newp, &root, transcmp);
+-		      if (foundp == NULL
+-			  || __builtin_expect (*foundp != newp, 0))
+-			/* The insert failed.  */
+-			free (newp);
+-		    }
+-		}
+-	      else
+-		{
+-		  /* We can update the existing entry.  */
+-		  (*foundp)->counter = _nl_msg_cat_cntr;
+-		  (*foundp)->domain = domain;
+-		  (*foundp)->translation = retval;
+-		  (*foundp)->translation_length = retlen;
+-		}
+-#endif
+-	      /* Now deal with plural.  */
+-	      if (plural)
+-		retval = plural_lookup (domain, n, retval, retlen);
+-
+-	      __libc_rwlock_unlock (_nl_state_lock);
+-	      return retval;
+-	    }
+-	}
+-    }
+-  /* NOTREACHED */
+-}
+-
+-
+-char *
+-internal_function
+-_nl_find_msg (domain_file, domainbinding, msgid, lengthp)
+-     struct loaded_l10nfile *domain_file;
+-     struct binding *domainbinding;
+-     const char *msgid;
+-     size_t *lengthp;
+-{
+-  struct loaded_domain *domain;
+-  size_t act;
+-  char *result;
+-  size_t resultlen;
+-
+-  if (domain_file->decided == 0)
+-    _nl_load_domain (domain_file, domainbinding);
+-
+-  if (domain_file->data == NULL)
+-    return NULL;
+-
+-  domain = (struct loaded_domain *) domain_file->data;
+-
+-  /* Locate the MSGID and its translation.  */
+-  if (domain->hash_size > 2 && domain->hash_tab != NULL)
+-    {
+-      /* Use the hashing table.  */
+-      nls_uint32 len = strlen (msgid);
+-      nls_uint32 hash_val = hash_string (msgid);
+-      nls_uint32 idx = hash_val % domain->hash_size;
+-      nls_uint32 incr = 1 + (hash_val % (domain->hash_size - 2));
+-
+-      while (1)
+-	{
+-	  nls_uint32 nstr = W (domain->must_swap, domain->hash_tab[idx]);
+-
+-	  if (nstr == 0)
+-	    /* Hash table entry is empty.  */
+-	    return NULL;
+-
+-	  /* Compare msgid with the original string at index nstr-1.
+-	     We compare the lengths with >=, not ==, because plural entries
+-	     are represented by strings with an embedded NUL.  */
+-	  if (W (domain->must_swap, domain->orig_tab[nstr - 1].length) >= len
+-	      && (strcmp (msgid,
+-			  domain->data + W (domain->must_swap,
+-					    domain->orig_tab[nstr - 1].offset))
+-		  == 0))
+-	    {
+-	      act = nstr - 1;
+-	      goto found;
+-	    }
+-
+-	  if (idx >= domain->hash_size - incr)
+-	    idx -= domain->hash_size - incr;
+-	  else
+-	    idx += incr;
+-	}
+-      /* NOTREACHED */
+-    }
+-  else
+-    {
+-      /* Try the default method:  binary search in the sorted array of
+-	 messages.  */
+-      size_t top, bottom;
+-
+-      bottom = 0;
+-      top = domain->nstrings;
+-      while (bottom < top)
+-	{
+-	  int cmp_val;
+-
+-	  act = (bottom + top) / 2;
+-	  cmp_val = strcmp (msgid, (domain->data
+-				    + W (domain->must_swap,
+-					 domain->orig_tab[act].offset)));
+-	  if (cmp_val < 0)
+-	    top = act;
+-	  else if (cmp_val > 0)
+-	    bottom = act + 1;
+-	  else
+-	    goto found;
+-	}
+-      /* No translation was found.  */
+-      return NULL;
+-    }
+-
+- found:
+-  /* The translation was found at index ACT.  If we have to convert the
+-     string to use a different character set, this is the time.  */
+-  result = ((char *) domain->data
+-	    + W (domain->must_swap, domain->trans_tab[act].offset));
+-  resultlen = W (domain->must_swap, domain->trans_tab[act].length) + 1;
+-
+-#if defined _LIBC || HAVE_ICONV
+-  if (domain->codeset_cntr
+-      != (domainbinding != NULL ? domainbinding->codeset_cntr : 0))
+-    {
+-      /* The domain's codeset has changed through bind_textdomain_codeset()
+-	 since the message catalog was initialized or last accessed.  We
+-	 have to reinitialize the converter.  */
+-      _nl_free_domain_conv (domain);
+-      _nl_init_domain_conv (domain_file, domain, domainbinding);
+-    }
+-
+-  if (
+-# ifdef _LIBC
+-      domain->conv != (__gconv_t) -1
+-# else
+-#  if HAVE_ICONV
+-      domain->conv != (iconv_t) -1
+-#  endif
+-# endif
+-      )
+-    {
+-      /* We are supposed to do a conversion.  First allocate an
+-	 appropriate table with the same structure as the table
+-	 of translations in the file, where we can put the pointers
+-	 to the converted strings in.
+-	 There is a slight complication with plural entries.  They
+-	 are represented by consecutive NUL terminated strings.  We
+-	 handle this case by converting RESULTLEN bytes, including
+-	 NULs.  */
+-
+-      if (domain->conv_tab == NULL
+-	  && ((domain->conv_tab = (char **) calloc (domain->nstrings,
+-						    sizeof (char *)))
+-	      == NULL))
+-	/* Mark that we didn't succeed allocating a table.  */
+-	domain->conv_tab = (char **) -1;
+-
+-      if (__builtin_expect (domain->conv_tab == (char **) -1, 0))
+-	/* Nothing we can do, no more memory.  */
+-	goto converted;
+-
+-      if (domain->conv_tab[act] == NULL)
+-	{
+-	  /* We haven't used this string so far, so it is not
+-	     translated yet.  Do this now.  */
+-	  /* We use a bit more efficient memory handling.
+-	     We allocate always larger blocks which get used over
+-	     time.  This is faster than many small allocations.   */
+-	  __libc_lock_define_initialized (static, lock)
+-# define INITIAL_BLOCK_SIZE	4080
+-	  static unsigned char *freemem;
+-	  static size_t freemem_size;
+-
+-	  const unsigned char *inbuf;
+-	  unsigned char *outbuf;
+-	  int malloc_count;
+-# ifndef _LIBC
+-	  transmem_block_t *transmem_list = NULL;
+-# endif
+-
+-	  __libc_lock_lock (lock);
+-
+-	  inbuf = (const unsigned char *) result;
+-	  outbuf = freemem + sizeof (size_t);
+-
+-	  malloc_count = 0;
+-	  while (1)
+-	    {
+-	      transmem_block_t *newmem;
+-# ifdef _LIBC
+-	      size_t non_reversible;
+-	      int res;
+-
+-	      if (freemem_size < sizeof (size_t))
+-		goto resize_freemem;
+-
+-	      res = __gconv (domain->conv,
+-			     &inbuf, inbuf + resultlen,
+-			     &outbuf,
+-			     outbuf + freemem_size - sizeof (size_t),
+-			     &non_reversible);
+-
+-	      if (res == __GCONV_OK || res == __GCONV_EMPTY_INPUT)
+-		break;
+-
+-	      if (res != __GCONV_FULL_OUTPUT)
+-		{
+-		  __libc_lock_unlock (lock);
+-		  goto converted;
+-		}
+-
+-	      inbuf = result;
+-# else
+-#  if HAVE_ICONV
+-	      const char *inptr = (const char *) inbuf;
+-	      size_t inleft = resultlen;
+-	      char *outptr = (char *) outbuf;
+-	      size_t outleft;
+-
+-	      if (freemem_size < sizeof (size_t))
+-		goto resize_freemem;
+-
+-	      outleft = freemem_size - sizeof (size_t);
+-	      if (iconv (domain->conv,
+-			 (ICONV_CONST char **) &inptr, &inleft,
+-			 &outptr, &outleft)
+-		  != (size_t) (-1))
+-		{
+-		  outbuf = (unsigned char *) outptr;
+-		  break;
+-		}
+-	      if (errno != E2BIG)
+-		{
+-		  __libc_lock_unlock (lock);
+-		  goto converted;
+-		}
+-#  endif
+-# endif
+-
+-	    resize_freemem:
+-	      /* We must allocate a new buffer or resize the old one.  */
+-	      if (malloc_count > 0)
+-		{
+-		  ++malloc_count;
+-		  freemem_size = malloc_count * INITIAL_BLOCK_SIZE;
+-		  newmem = (transmem_block_t *) realloc (transmem_list,
+-							 freemem_size);
+-# ifdef _LIBC
+-		  if (newmem != NULL)
+-		    transmem_list = transmem_list->next;
+-		  else
+-		    {
+-		      struct transmem_list *old = transmem_list;
+-
+-		      transmem_list = transmem_list->next;
+-		      free (old);
+-		    }
+-# endif
+-		}
+-	      else
+-		{
+-		  malloc_count = 1;
+-		  freemem_size = INITIAL_BLOCK_SIZE;
+-		  newmem = (transmem_block_t *) malloc (freemem_size);
+-		}
+-	      if (__builtin_expect (newmem == NULL, 0))
+-		{
+-		  freemem = NULL;
+-		  freemem_size = 0;
+-		  __libc_lock_unlock (lock);
+-		  goto converted;
+-		}
+-
+-# ifdef _LIBC
+-	      /* Add the block to the list of blocks we have to free
+-                 at some point.  */
+-	      newmem->next = transmem_list;
+-	      transmem_list = newmem;
+-
+-	      freemem = newmem->data;
+-	      freemem_size -= offsetof (struct transmem_list, data);
+-# else
+-	      transmem_list = newmem;
+-	      freemem = newmem;
+-# endif
+-
+-	      outbuf = freemem + sizeof (size_t);
+-	    }
+-
+-	  /* We have now in our buffer a converted string.  Put this
+-	     into the table of conversions.  */
+-	  *(size_t *) freemem = outbuf - freemem - sizeof (size_t);
+-	  domain->conv_tab[act] = (char *) freemem;
+-	  /* Shrink freemem, but keep it aligned.  */
+-	  freemem_size -= outbuf - freemem;
+-	  freemem = outbuf;
+-	  freemem += freemem_size & (alignof (size_t) - 1);
+-	  freemem_size = freemem_size & ~ (alignof (size_t) - 1);
+-
+-	  __libc_lock_unlock (lock);
+-	}
+-
+-      /* Now domain->conv_tab[act] contains the translation of all
+-	 the plural variants.  */
+-      result = domain->conv_tab[act] + sizeof (size_t);
+-      resultlen = *(size_t *) domain->conv_tab[act];
+-    }
+-
+- converted:
+-  /* The result string is converted.  */
+-
+-#endif /* _LIBC || HAVE_ICONV */
+-
+-  *lengthp = resultlen;
+-  return result;
+-}
+-
+-
+-/* Look up a plural variant.  */
+-static char *
+-internal_function
+-plural_lookup (domain, n, translation, translation_len)
+-     struct loaded_l10nfile *domain;
+-     unsigned long int n;
+-     const char *translation;
+-     size_t translation_len;
+-{
+-  struct loaded_domain *domaindata = (struct loaded_domain *) domain->data;
+-  unsigned long int index;
+-  const char *p;
+-
+-  index = plural_eval (domaindata->plural, n);
+-  if (index >= domaindata->nplurals)
+-    /* This should never happen.  It means the plural expression and the
+-       given maximum value do not match.  */
+-    index = 0;
+-
+-  /* Skip INDEX strings at TRANSLATION.  */
+-  p = translation;
+-  while (index-- > 0)
+-    {
+-#ifdef _LIBC
+-      p = __rawmemchr (p, '\0');
+-#else
+-      p = strchr (p, '\0');
+-#endif
+-      /* And skip over the NUL byte.  */
+-      p++;
+-
+-      if (p >= translation + translation_len)
+-	/* This should never happen.  It means the plural expression
+-	   evaluated to a value larger than the number of variants
+-	   available for MSGID1.  */
+-	return (char *) translation;
+-    }
+-  return (char *) p;
+-}
+-
+-
+-/* Function to evaluate the plural expression and return an index value.  */
+-static unsigned long int
+-internal_function
+-plural_eval (pexp, n)
+-     struct expression *pexp;
+-     unsigned long int n;
+-{
+-  switch (pexp->nargs)
+-    {
+-    case 0:
+-      switch (pexp->operation)
+-	{
+-	case var:
+-	  return n;
+-	case num:
+-	  return pexp->val.num;
+-	default:
+-	  break;
+-	}
+-      /* NOTREACHED */
+-      break;
+-    case 1:
+-      {
+-	/* pexp->operation must be lnot.  */
+-	unsigned long int arg = plural_eval (pexp->val.args[0], n);
+-	return ! arg;
+-      }
+-    case 2:
+-      {
+-	unsigned long int leftarg = plural_eval (pexp->val.args[0], n);
+-	if (pexp->operation == lor)
+-	  return leftarg || plural_eval (pexp->val.args[1], n);
+-	else if (pexp->operation == land)
+-	  return leftarg && plural_eval (pexp->val.args[1], n);
+-	else
+-	  {
+-	    unsigned long int rightarg = plural_eval (pexp->val.args[1], n);
+-
+-	    switch (pexp->operation)
+-	      {
+-	      case mult:
+-		return leftarg * rightarg;
+-	      case divide:
+-		return leftarg / rightarg;
+-	      case module:
+-		return leftarg % rightarg;
+-	      case plus:
+-		return leftarg + rightarg;
+-	      case minus:
+-		return leftarg - rightarg;
+-	      case less_than:
+-		return leftarg < rightarg;
+-	      case greater_than:
+-		return leftarg > rightarg;
+-	      case less_or_equal:
+-		return leftarg <= rightarg;
+-	      case greater_or_equal:
+-		return leftarg >= rightarg;
+-	      case equal:
+-		return leftarg == rightarg;
+-	      case not_equal:
+-		return leftarg != rightarg;
+-	      default:
+-		break;
+-	      }
+-	  }
+-	/* NOTREACHED */
+-	break;
+-      }
+-    case 3:
+-      {
+-	/* pexp->operation must be qmop.  */
+-	unsigned long int boolarg = plural_eval (pexp->val.args[0], n);
+-	return plural_eval (pexp->val.args[boolarg ? 1 : 2], n);
+-      }
+-    }
+-  /* NOTREACHED */
+-  return 0;
+-}
+-
+-
+-/* Return string representation of locale CATEGORY.  */
+-static const char *
+-internal_function
+-category_to_name (category)
+-     int category;
+-{
+-  const char *retval;
+-
+-  switch (category)
+-  {
+-#ifdef LC_COLLATE
+-  case LC_COLLATE:
+-    retval = "LC_COLLATE";
+-    break;
+-#endif
+-#ifdef LC_CTYPE
+-  case LC_CTYPE:
+-    retval = "LC_CTYPE";
+-    break;
+-#endif
+-#ifdef LC_MONETARY
+-  case LC_MONETARY:
+-    retval = "LC_MONETARY";
+-    break;
+-#endif
+-#ifdef LC_NUMERIC
+-  case LC_NUMERIC:
+-    retval = "LC_NUMERIC";
+-    break;
+-#endif
+-#ifdef LC_TIME
+-  case LC_TIME:
+-    retval = "LC_TIME";
+-    break;
+-#endif
+-#ifdef LC_MESSAGES
+-  case LC_MESSAGES:
+-    retval = "LC_MESSAGES";
+-    break;
+-#endif
+-#ifdef LC_RESPONSE
+-  case LC_RESPONSE:
+-    retval = "LC_RESPONSE";
+-    break;
+-#endif
+-#ifdef LC_ALL
+-  case LC_ALL:
+-    /* This might not make sense but is perhaps better than any other
+-       value.  */
+-    retval = "LC_ALL";
+-    break;
+-#endif
+-  default:
+-    /* If you have a better idea for a default value let me know.  */
+-    retval = "LC_XXX";
+-  }
+-
+-  return retval;
+-}
+-
+-/* Guess value of current locale from value of the environment variables.  */
+-static const char *
+-internal_function
+-guess_category_value (category, categoryname)
+-     int category;
+-     const char *categoryname;
+-{
+-  const char *language;
+-  const char *retval;
+-
+-  /* The highest priority value is the `LANGUAGE' environment
+-     variable.  But we don't use the value if the currently selected
+-     locale is the C locale.  This is a GNU extension.  */
+-  language = getenv ("LANGUAGE");
+-  if (language != NULL && language[0] == '\0')
+-    language = NULL;
+-
+-  /* We have to proceed with the POSIX methods of looking to `LC_ALL',
+-     `LC_xxx', and `LANG'.  On some systems this can be done by the
+-     `setlocale' function itself.  */
+-#if defined _LIBC || (defined HAVE_SETLOCALE && defined HAVE_LC_MESSAGES && defined HAVE_LOCALE_NULL)
+-  retval = setlocale (category, NULL);
+-#else
+-  /* Setting of LC_ALL overwrites all other.  */
+-  retval = getenv ("LC_ALL");
+-  if (retval == NULL || retval[0] == '\0')
+-    {
+-      /* Next comes the name of the desired category.  */
+-      retval = getenv (categoryname);
+-      if (retval == NULL || retval[0] == '\0')
+-	{
+-	  /* Last possibility is the LANG environment variable.  */
+-	  retval = getenv ("LANG");
+-	  if (retval == NULL || retval[0] == '\0')
+-	    /* We use C as the default domain.  POSIX says this is
+-	       implementation defined.  */
+-	    return "C";
+-	}
+-    }
+-#endif
+-
+-  return language != NULL && strcmp (retval, "C") != 0 ? language : retval;
+-}
+-
+-/* @@ begin of epilog @@ */
+-
+-/* We don't want libintl.a to depend on any other library.  So we
+-   avoid the non-standard function stpcpy.  In GNU C Library this
+-   function is available, though.  Also allow the symbol HAVE_STPCPY
+-   to be defined.  */
+-#if !_LIBC && !HAVE_STPCPY
+-static char *
+-stpcpy (dest, src)
+-     char *dest;
+-     const char *src;
+-{
+-  while ((*dest++ = *src++) != '\0')
+-    /* Do nothing. */ ;
+-  return dest - 1;
+-}
+-#endif
+-
+-#if !_LIBC && !HAVE_MEMPCPY
+-static void *
+-mempcpy (dest, src, n)
+-     void *dest;
+-     const void *src;
+-     size_t n;
+-{
+-  return (void *) ((char *) memcpy (dest, src, n) + n);
+-}
+-#endif
+-
+-
+-#ifdef _LIBC
+-/* If we want to free all resources we have to do some work at
+-   program's end.  */
+-static void __attribute__ ((unused))
+-free_mem (void)
+-{
+-  void *old;
+-
+-  while (_nl_domain_bindings != NULL)
+-    {
+-      struct binding *oldp = _nl_domain_bindings;
+-      _nl_domain_bindings = _nl_domain_bindings->next;
+-      if (oldp->dirname != _nl_default_dirname)
+-	/* Yes, this is a pointer comparison.  */
+-	free (oldp->dirname);
+-      free (oldp->codeset);
+-      free (oldp);
+-    }
+-
+-  if (_nl_current_default_domain != _nl_default_default_domain)
+-    /* Yes, again a pointer comparison.  */
+-    free ((char *) _nl_current_default_domain);
+-
+-  /* Remove the search tree with the known translations.  */
+-  __tdestroy (root, free);
+-  root = NULL;
+-
+-  while (transmem_list != NULL)
+-    {
+-      old = transmem_list;
+-      transmem_list = transmem_list->next;
+-      free (old);
+-    }
+-}
+-
+-text_set_element (__libc_subfreeres, free_mem);
+-#endif
+--- a/intl/dcngettext.c
++++ /dev/null
+@@ -1,60 +0,0 @@
+-/* Implementation of the dcngettext(3) function.
+-   Copyright (C) 1995-1999, 2000, 2001 Free Software Foundation, Inc.
+-
+-   This program is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU Library General Public License as published
+-   by the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Library General Public License for more details.
+-
+-   You should have received a copy of the GNU Library General Public
+-   License along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-   USA.  */
+-
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-#include "gettextP.h"
+-#ifdef _LIBC
+-# include <libintl.h>
+-#else
+-# include "libgnuintl.h"
+-#endif
+-
+-/* @@ end of prolog @@ */
+-
+-/* Names for the libintl functions are a problem.  They must not clash
+-   with existing names and they should follow ANSI C.  But this source
+-   code is also used in GNU C Library where the names have a __
+-   prefix.  So we have to make a difference here.  */
+-#ifdef _LIBC
+-# define DCNGETTEXT __dcngettext
+-# define DCIGETTEXT __dcigettext
+-#else
+-# define DCNGETTEXT dcngettext__
+-# define DCIGETTEXT dcigettext__
+-#endif
+-
+-/* Look up MSGID in the DOMAINNAME message catalog for the current CATEGORY
+-   locale.  */
+-char *
+-DCNGETTEXT (domainname, msgid1, msgid2, n, category)
+-     const char *domainname;
+-     const char *msgid1;
+-     const char *msgid2;
+-     unsigned long int n;
+-     int category;
+-{
+-  return DCIGETTEXT (domainname, msgid1, msgid2, 1, n, category);
+-}
+-
+-#ifdef _LIBC
+-/* Alias for function name in GNU C Library.  */
+-weak_alias (__dcngettext, dcngettext);
+-#endif
+--- a/intl/dgettext.c
++++ /dev/null
+@@ -1,59 +0,0 @@
+-/* Implementation of the dgettext(3) function.
+-   Copyright (C) 1995-1997, 2000, 2001 Free Software Foundation, Inc.
+-
+-   This program is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU Library General Public License as published
+-   by the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Library General Public License for more details.
+-
+-   You should have received a copy of the GNU Library General Public
+-   License along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-   USA.  */
+-
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-#include <locale.h>
+-
+-#include "gettextP.h"
+-#ifdef _LIBC
+-# include <libintl.h>
+-#else
+-# include "libgnuintl.h"
+-#endif
+-
+-/* @@ end of prolog @@ */
+-
+-/* Names for the libintl functions are a problem.  They must not clash
+-   with existing names and they should follow ANSI C.  But this source
+-   code is also used in GNU C Library where the names have a __
+-   prefix.  So we have to make a difference here.  */
+-#ifdef _LIBC
+-# define DGETTEXT __dgettext
+-# define DCGETTEXT __dcgettext
+-#else
+-# define DGETTEXT dgettext__
+-# define DCGETTEXT dcgettext__
+-#endif
+-
+-/* Look up MSGID in the DOMAINNAME message catalog of the current
+-   LC_MESSAGES locale.  */
+-char *
+-DGETTEXT (domainname, msgid)
+-     const char *domainname;
+-     const char *msgid;
+-{
+-  return DCGETTEXT (domainname, msgid, LC_MESSAGES);
+-}
+-
+-#ifdef _LIBC
+-/* Alias for function name in GNU C Library.  */
+-weak_alias (__dgettext, dgettext);
+-#endif
+--- a/intl/dngettext.c
++++ /dev/null
+@@ -1,61 +0,0 @@
+-/* Implementation of the dngettext(3) function.
+-   Copyright (C) 1995-1997, 2000, 2001 Free Software Foundation, Inc.
+-
+-   This program is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU Library General Public License as published
+-   by the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Library General Public License for more details.
+-
+-   You should have received a copy of the GNU Library General Public
+-   License along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-   USA.  */
+-
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-#include <locale.h>
+-
+-#include "gettextP.h"
+-#ifdef _LIBC
+-# include <libintl.h>
+-#else
+-# include "libgnuintl.h"
+-#endif
+-
+-/* @@ end of prolog @@ */
+-
+-/* Names for the libintl functions are a problem.  They must not clash
+-   with existing names and they should follow ANSI C.  But this source
+-   code is also used in GNU C Library where the names have a __
+-   prefix.  So we have to make a difference here.  */
+-#ifdef _LIBC
+-# define DNGETTEXT __dngettext
+-# define DCNGETTEXT __dcngettext
+-#else
+-# define DNGETTEXT dngettext__
+-# define DCNGETTEXT dcngettext__
+-#endif
+-
+-/* Look up MSGID in the DOMAINNAME message catalog of the current
+-   LC_MESSAGES locale and skip message according to the plural form.  */
+-char *
+-DNGETTEXT (domainname, msgid1, msgid2, n)
+-     const char *domainname;
+-     const char *msgid1;
+-     const char *msgid2;
+-     unsigned long int n;
+-{
+-  return DCNGETTEXT (domainname, msgid1, msgid2, n, LC_MESSAGES);
+-}
+-
+-#ifdef _LIBC
+-/* Alias for function name in GNU C Library.  */
+-weak_alias (__dngettext, dngettext);
+-#endif
+--- a/intl/explodename.c
++++ /dev/null
+@@ -1,192 +0,0 @@
+-/* Copyright (C) 1995-1998, 2000, 2001 Free Software Foundation, Inc.
+-   Contributed by Ulrich Drepper <drepper@gnu.ai.mit.edu>, 1995.
+-
+-   This program is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU Library General Public License as published
+-   by the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Library General Public License for more details.
+-
+-   You should have received a copy of the GNU Library General Public
+-   License along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-   USA.  */
+-
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-#include <stdlib.h>
+-#include <string.h>
+-#include <sys/types.h>
+-
+-#include "loadinfo.h"
+-
+-/* On some strange systems still no definition of NULL is found.  Sigh!  */
+-#ifndef NULL
+-# if defined __STDC__ && __STDC__
+-#  define NULL ((void *) 0)
+-# else
+-#  define NULL 0
+-# endif
+-#endif
+-
+-/* @@ end of prolog @@ */
+-
+-char *
+-_nl_find_language (name)
+-     const char *name;
+-{
+-  while (name[0] != '\0' && name[0] != '_' && name[0] != '@'
+-	 && name[0] != '+' && name[0] != ',')
+-    ++name;
+-
+-  return (char *) name;
+-}
+-
+-
+-int
+-_nl_explode_name (name, language, modifier, territory, codeset,
+-		  normalized_codeset, special, sponsor, revision)
+-     char *name;
+-     const char **language;
+-     const char **modifier;
+-     const char **territory;
+-     const char **codeset;
+-     const char **normalized_codeset;
+-     const char **special;
+-     const char **sponsor;
+-     const char **revision;
+-{
+-  enum { undecided, xpg, cen } syntax;
+-  char *cp;
+-  int mask;
+-
+-  *modifier = NULL;
+-  *territory = NULL;
+-  *codeset = NULL;
+-  *normalized_codeset = NULL;
+-  *special = NULL;
+-  *sponsor = NULL;
+-  *revision = NULL;
+-
+-  /* Now we determine the single parts of the locale name.  First
+-     look for the language.  Termination symbols are `_' and `@' if
+-     we use XPG4 style, and `_', `+', and `,' if we use CEN syntax.  */
+-  mask = 0;
+-  syntax = undecided;
+-  *language = cp = name;
+-  cp = _nl_find_language (*language);
+-
+-  if (*language == cp)
+-    /* This does not make sense: language has to be specified.  Use
+-       this entry as it is without exploding.  Perhaps it is an alias.  */
+-    cp = strchr (*language, '\0');
+-  else if (cp[0] == '_')
+-    {
+-      /* Next is the territory.  */
+-      cp[0] = '\0';
+-      *territory = ++cp;
+-
+-      while (cp[0] != '\0' && cp[0] != '.' && cp[0] != '@'
+-	     && cp[0] != '+' && cp[0] != ',' && cp[0] != '_')
+-	++cp;
+-
+-      mask |= TERRITORY;
+-
+-      if (cp[0] == '.')
+-	{
+-	  /* Next is the codeset.  */
+-	  syntax = xpg;
+-	  cp[0] = '\0';
+-	  *codeset = ++cp;
+-
+-	  while (cp[0] != '\0' && cp[0] != '@')
+-	    ++cp;
+-
+-	  mask |= XPG_CODESET;
+-
+-	  if (*codeset != cp && (*codeset)[0] != '\0')
+-	    {
+-	      *normalized_codeset = _nl_normalize_codeset (*codeset,
+-							   cp - *codeset);
+-	      if (strcmp (*codeset, *normalized_codeset) == 0)
+-		free ((char *) *normalized_codeset);
+-	      else
+-		mask |= XPG_NORM_CODESET;
+-	    }
+-	}
+-    }
+-
+-  if (cp[0] == '@' || (syntax != xpg && cp[0] == '+'))
+-    {
+-      /* Next is the modifier.  */
+-      syntax = cp[0] == '@' ? xpg : cen;
+-      cp[0] = '\0';
+-      *modifier = ++cp;
+-
+-      while (syntax == cen && cp[0] != '\0' && cp[0] != '+'
+-	     && cp[0] != ',' && cp[0] != '_')
+-	++cp;
+-
+-      mask |= XPG_MODIFIER | CEN_AUDIENCE;
+-    }
+-
+-  if (syntax != xpg && (cp[0] == '+' || cp[0] == ',' || cp[0] == '_'))
+-    {
+-      syntax = cen;
+-
+-      if (cp[0] == '+')
+-	{
+- 	  /* Next is special application (CEN syntax).  */
+-	  cp[0] = '\0';
+-	  *special = ++cp;
+-
+-	  while (cp[0] != '\0' && cp[0] != ',' && cp[0] != '_')
+-	    ++cp;
+-
+-	  mask |= CEN_SPECIAL;
+-	}
+-
+-      if (cp[0] == ',')
+-	{
+- 	  /* Next is sponsor (CEN syntax).  */
+-	  cp[0] = '\0';
+-	  *sponsor = ++cp;
+-
+-	  while (cp[0] != '\0' && cp[0] != '_')
+-	    ++cp;
+-
+-	  mask |= CEN_SPONSOR;
+-	}
+-
+-      if (cp[0] == '_')
+-	{
+- 	  /* Next is revision (CEN syntax).  */
+-	  cp[0] = '\0';
+-	  *revision = ++cp;
+-
+-	  mask |= CEN_REVISION;
+-	}
+-    }
+-
+-  /* For CEN syntax values it might be important to have the
+-     separator character in the file name, not for XPG syntax.  */
+-  if (syntax == xpg)
+-    {
+-      if (*territory != NULL && (*territory)[0] == '\0')
+-	mask &= ~TERRITORY;
+-
+-      if (*codeset != NULL && (*codeset)[0] == '\0')
+-	mask &= ~XPG_CODESET;
+-
+-      if (*modifier != NULL && (*modifier)[0] == '\0')
+-	mask &= ~XPG_MODIFIER;
+-    }
+-
+-  return mask;
+-}
+--- a/intl/finddomain.c
++++ /dev/null
+@@ -1,198 +0,0 @@
+-/* Handle list of needed message catalogs
+-   Copyright (C) 1995-1999, 2000, 2001 Free Software Foundation, Inc.
+-   Written by Ulrich Drepper <drepper@gnu.org>, 1995.
+-
+-   This program is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU Library General Public License as published
+-   by the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Library General Public License for more details.
+-
+-   You should have received a copy of the GNU Library General Public
+-   License along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-   USA.  */
+-
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-#include <stdio.h>
+-#include <sys/types.h>
+-#include <stdlib.h>
+-#include <string.h>
+-
+-#if defined HAVE_UNISTD_H || defined _LIBC
+-# include <unistd.h>
+-#endif
+-
+-#include "gettextP.h"
+-#ifdef _LIBC
+-# include <libintl.h>
+-#else
+-# include "libgnuintl.h"
+-#endif
+-
+-/* @@ end of prolog @@ */
+-/* List of already loaded domains.  */
+-static struct loaded_l10nfile *_nl_loaded_domains;
+-
+-
+-/* Return a data structure describing the message catalog described by
+-   the DOMAINNAME and CATEGORY parameters with respect to the currently
+-   established bindings.  */
+-struct loaded_l10nfile *
+-internal_function
+-_nl_find_domain (dirname, locale, domainname, domainbinding)
+-     const char *dirname;
+-     char *locale;
+-     const char *domainname;
+-     struct binding *domainbinding;
+-{
+-  struct loaded_l10nfile *retval;
+-  const char *language;
+-  const char *modifier;
+-  const char *territory;
+-  const char *codeset;
+-  const char *normalized_codeset;
+-  const char *special;
+-  const char *sponsor;
+-  const char *revision;
+-  const char *alias_value;
+-  int mask;
+-
+-  /* LOCALE can consist of up to four recognized parts for the XPG syntax:
+-
+-		language[_territory[.codeset]][@modifier]
+-
+-     and six parts for the CEN syntax:
+-
+-	language[_territory][+audience][+special][,[sponsor][_revision]]
+-
+-     Beside the first part all of them are allowed to be missing.  If
+-     the full specified locale is not found, the less specific one are
+-     looked for.  The various parts will be stripped off according to
+-     the following order:
+-		(1) revision
+-		(2) sponsor
+-		(3) special
+-		(4) codeset
+-		(5) normalized codeset
+-		(6) territory
+-		(7) audience/modifier
+-   */
+-
+-  /* If we have already tested for this locale entry there has to
+-     be one data set in the list of loaded domains.  */
+-  retval = _nl_make_l10nflist (&_nl_loaded_domains, dirname,
+-			       strlen (dirname) + 1, 0, locale, NULL, NULL,
+-			       NULL, NULL, NULL, NULL, NULL, domainname, 0);
+-  if (retval != NULL)
+-    {
+-      /* We know something about this locale.  */
+-      int cnt;
+-
+-      if (retval->decided == 0)
+-	_nl_load_domain (retval, domainbinding);
+-
+-      if (retval->data != NULL)
+-	return retval;
+-
+-      for (cnt = 0; retval->successor[cnt] != NULL; ++cnt)
+-	{
+-	  if (retval->successor[cnt]->decided == 0)
+-	    _nl_load_domain (retval->successor[cnt], domainbinding);
+-
+-	  if (retval->successor[cnt]->data != NULL)
+-	    break;
+-	}
+-      return cnt >= 0 ? retval : NULL;
+-      /* NOTREACHED */
+-    }
+-
+-  /* See whether the locale value is an alias.  If yes its value
+-     *overwrites* the alias name.  No test for the original value is
+-     done.  */
+-  alias_value = _nl_expand_alias (locale);
+-  if (alias_value != NULL)
+-    {
+-#if defined _LIBC || defined HAVE_STRDUP
+-      locale = strdup (alias_value);
+-      if (locale == NULL)
+-	return NULL;
+-#else
+-      size_t len = strlen (alias_value) + 1;
+-      locale = (char *) malloc (len);
+-      if (locale == NULL)
+-	return NULL;
+-
+-      memcpy (locale, alias_value, len);
+-#endif
+-    }
+-
+-  /* Now we determine the single parts of the locale name.  First
+-     look for the language.  Termination symbols are `_' and `@' if
+-     we use XPG4 style, and `_', `+', and `,' if we use CEN syntax.  */
+-  mask = _nl_explode_name (locale, &language, &modifier, &territory,
+-			   &codeset, &normalized_codeset, &special,
+-			   &sponsor, &revision);
+-
+-  /* Create all possible locale entries which might be interested in
+-     generalization.  */
+-  retval = _nl_make_l10nflist (&_nl_loaded_domains, dirname,
+-			       strlen (dirname) + 1, mask, language, territory,
+-			       codeset, normalized_codeset, modifier, special,
+-			       sponsor, revision, domainname, 1);
+-  if (retval == NULL)
+-    /* This means we are out of core.  */
+-    return NULL;
+-
+-  if (retval->decided == 0)
+-    _nl_load_domain (retval, domainbinding);
+-  if (retval->data == NULL)
+-    {
+-      int cnt;
+-      for (cnt = 0; retval->successor[cnt] != NULL; ++cnt)
+-	{
+-	  if (retval->successor[cnt]->decided == 0)
+-	    _nl_load_domain (retval->successor[cnt], domainbinding);
+-	  if (retval->successor[cnt]->data != NULL)
+-	    break;
+-	}
+-    }
+-
+-  /* The room for an alias was dynamically allocated.  Free it now.  */
+-  if (alias_value != NULL)
+-    free (locale);
+-
+-  /* The space for normalized_codeset is dynamically allocated.  Free it.  */
+-  if (mask & XPG_NORM_CODESET)
+-    free ((void *) normalized_codeset);
+-
+-  return retval;
+-}
+-
+-
+-#ifdef _LIBC
+-static void __attribute__ ((unused))
+-free_mem (void)
+-{
+-  struct loaded_l10nfile *runp = _nl_loaded_domains;
+-
+-  while (runp != NULL)
+-    {
+-      struct loaded_l10nfile *here = runp;
+-      if (runp->data != NULL)
+-	_nl_unload_domain ((struct loaded_domain *) runp->data);
+-      runp = runp->next;
+-      free ((char *) here->filename);
+-      free (here);
+-    }
+-}
+-
+-text_set_element (__libc_subfreeres, free_mem);
+-#endif
+--- a/intl/gettext.c
++++ /dev/null
+@@ -1,64 +0,0 @@
+-/* Implementation of gettext(3) function.
+-   Copyright (C) 1995, 1997, 2000, 2001 Free Software Foundation, Inc.
+-
+-   This program is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU Library General Public License as published
+-   by the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Library General Public License for more details.
+-
+-   You should have received a copy of the GNU Library General Public
+-   License along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-   USA.  */
+-
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-#ifdef _LIBC
+-# define __need_NULL
+-# include <stddef.h>
+-#else
+-# include <stdlib.h>		/* Just for NULL.  */
+-#endif
+-
+-#include "gettextP.h"
+-#ifdef _LIBC
+-# include <libintl.h>
+-#else
+-# include "libgnuintl.h"
+-#endif
+-
+-/* @@ end of prolog @@ */
+-
+-/* Names for the libintl functions are a problem.  They must not clash
+-   with existing names and they should follow ANSI C.  But this source
+-   code is also used in GNU C Library where the names have a __
+-   prefix.  So we have to make a difference here.  */
+-#ifdef _LIBC
+-# define GETTEXT __gettext
+-# define DCGETTEXT __dcgettext
+-#else
+-# define GETTEXT gettext__
+-# define DCGETTEXT dcgettext__
+-#endif
+-
+-/* Look up MSGID in the current default message catalog for the current
+-   LC_MESSAGES locale.  If not found, returns MSGID itself (the default
+-   text).  */
+-char *
+-GETTEXT (msgid)
+-     const char *msgid;
+-{
+-  return DCGETTEXT (NULL, msgid, LC_MESSAGES);
+-}
+-
+-#ifdef _LIBC
+-/* Alias for function name in GNU C Library.  */
+-weak_alias (__gettext, gettext);
+-#endif
+--- a/intl/gettext.h
++++ /dev/null
+@@ -1,102 +0,0 @@
+-/* Description of GNU message catalog format: general file layout.
+-   Copyright (C) 1995, 1997, 2000, 2001 Free Software Foundation, Inc.
+-
+-   This program is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU Library General Public License as published
+-   by the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Library General Public License for more details.
+-
+-   You should have received a copy of the GNU Library General Public
+-   License along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-   USA.  */
+-
+-#ifndef _GETTEXT_H
+-#define _GETTEXT_H 1
+-
+-#if HAVE_LIMITS_H || _LIBC
+-# include <limits.h>
+-#endif
+-
+-/* @@ end of prolog @@ */
+-
+-/* The magic number of the GNU message catalog format.  */
+-#define _MAGIC 0x950412de
+-#define _MAGIC_SWAPPED 0xde120495
+-
+-/* Revision number of the currently used .mo (binary) file format.  */
+-#define MO_REVISION_NUMBER 0
+-
+-/* The following contortions are an attempt to use the C preprocessor
+-   to determine an unsigned integral type that is 32 bits wide.  An
+-   alternative approach is to use autoconf's AC_CHECK_SIZEOF macro, but
+-   as of version autoconf-2.13, the AC_CHECK_SIZEOF macro doesn't work
+-   when cross-compiling.  */
+-
+-#if __STDC__
+-# define UINT_MAX_32_BITS 4294967295U
+-#else
+-# define UINT_MAX_32_BITS 0xFFFFFFFF
+-#endif
+-
+-/* If UINT_MAX isn't defined, assume it's a 32-bit type.
+-   This should be valid for all systems GNU cares about because
+-   that doesn't include 16-bit systems, and only modern systems
+-   (that certainly have <limits.h>) have 64+-bit integral types.  */
+-
+-#ifndef UINT_MAX
+-# define UINT_MAX UINT_MAX_32_BITS
+-#endif
+-
+-#if UINT_MAX == UINT_MAX_32_BITS
+-typedef unsigned nls_uint32;
+-#else
+-# if USHRT_MAX == UINT_MAX_32_BITS
+-typedef unsigned short nls_uint32;
+-# else
+-#  if ULONG_MAX == UINT_MAX_32_BITS
+-typedef unsigned long nls_uint32;
+-#  else
+-  /* The following line is intended to throw an error.  Using #error is
+-     not portable enough.  */
+-  "Cannot determine unsigned 32-bit data type."
+-#  endif
+-# endif
+-#endif
+-
+-
+-/* Header for binary .mo file format.  */
+-struct mo_file_header
+-{
+-  /* The magic number.  */
+-  nls_uint32 magic;
+-  /* The revision number of the file format.  */
+-  nls_uint32 revision;
+-  /* The number of strings pairs.  */
+-  nls_uint32 nstrings;
+-  /* Offset of table with start offsets of original strings.  */
+-  nls_uint32 orig_tab_offset;
+-  /* Offset of table with start offsets of translation strings.  */
+-  nls_uint32 trans_tab_offset;
+-  /* Size of hashing table.  */
+-  nls_uint32 hash_tab_size;
+-  /* Offset of first hashing entry.  */
+-  nls_uint32 hash_tab_offset;
+-};
+-
+-struct string_desc
+-{
+-  /* Length of addressed string.  */
+-  nls_uint32 length;
+-  /* Offset of string in file.  */
+-  nls_uint32 offset;
+-};
+-
+-/* @@ begin of epilog @@ */
+-
+-#endif	/* gettext.h  */
+--- a/intl/gettextP.h
++++ /dev/null
+@@ -1,252 +0,0 @@
+-/* Header describing internals of libintl library.
+-   Copyright (C) 1995-1999, 2000, 2001 Free Software Foundation, Inc.
+-   Written by Ulrich Drepper <drepper@cygnus.com>, 1995.
+-
+-   This program is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU Library General Public License as published
+-   by the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Library General Public License for more details.
+-
+-   You should have received a copy of the GNU Library General Public
+-   License along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-   USA.  */
+-
+-#ifndef _GETTEXTP_H
+-#define _GETTEXTP_H
+-
+-#include <stddef.h>		/* Get size_t.  */
+-
+-#ifdef _LIBC
+-# include "../iconv/gconv_int.h"
+-#else
+-# if HAVE_ICONV
+-#  include <iconv.h>
+-# endif
+-#endif
+-
+-#include "loadinfo.h"
+-
+-#include "gettext.h"		/* Get nls_uint32.  */
+-
+-/* @@ end of prolog @@ */
+-
+-#ifndef PARAMS
+-# if __STDC__
+-#  define PARAMS(args) args
+-# else
+-#  define PARAMS(args) ()
+-# endif
+-#endif
+-
+-#ifndef internal_function
+-# define internal_function
+-#endif
+-
+-/* Tell the compiler when a conditional or integer expression is
+-   almost always true or almost always false.  */
+-#ifndef HAVE_BUILTIN_EXPECT
+-# define __builtin_expect(expr, val) (expr)
+-#endif
+-
+-#ifndef W
+-# define W(flag, data) ((flag) ? SWAP (data) : (data))
+-#endif
+-
+-
+-#ifdef _LIBC
+-# include <byteswap.h>
+-# define SWAP(i) bswap_32 (i)
+-#else
+-static inline nls_uint32
+-SWAP (i)
+-     nls_uint32 i;
+-{
+-  return (i << 24) | ((i & 0xff00) << 8) | ((i >> 8) & 0xff00) | (i >> 24);
+-}
+-#endif
+-
+-
+-/* This is the representation of the expressions to determine the
+-   plural form.  */
+-struct expression
+-{
+-  int nargs;			/* Number of arguments.  */
+-  enum operator
+-  {
+-    /* Without arguments:  */
+-    var,			/* The variable "n".  */
+-    num,			/* Decimal number.  */
+-    /* Unary operators:  */
+-    lnot,			/* Logical NOT.  */
+-    /* Binary operators:  */
+-    mult,			/* Multiplication.  */
+-    divide,			/* Division.  */
+-    module,			/* Module operation.  */
+-    plus,			/* Addition.  */
+-    minus,			/* Subtraction.  */
+-    less_than,			/* Comparison.  */
+-    greater_than,		/* Comparison.  */
+-    less_or_equal,		/* Comparison.  */
+-    greater_or_equal,		/* Comparison.  */
+-    equal,			/* Comparision for equality.  */
+-    not_equal,			/* Comparision for inequality.  */
+-    land,			/* Logical AND.  */
+-    lor,			/* Logical OR.  */
+-    /* Ternary operators:  */
+-    qmop			/* Question mark operator.  */
+-  } operation;
+-  union
+-  {
+-    unsigned long int num;	/* Number value for `num'.  */
+-    struct expression *args[3];	/* Up to three arguments.  */
+-  } val;
+-};
+-
+-/* This is the data structure to pass information to the parser and get
+-   the result in a thread-safe way.  */
+-struct parse_args
+-{
+-  const char *cp;
+-  struct expression *res;
+-};
+-
+-
+-/* The representation of an opened message catalog.  */
+-struct loaded_domain
+-{
+-  const char *data;
+-  int use_mmap;
+-  size_t mmap_size;
+-  int must_swap;
+-  nls_uint32 nstrings;
+-  struct string_desc *orig_tab;
+-  struct string_desc *trans_tab;
+-  nls_uint32 hash_size;
+-  nls_uint32 *hash_tab;
+-  int codeset_cntr;
+-#ifdef _LIBC
+-  __gconv_t conv;
+-#else
+-# if HAVE_ICONV
+-  iconv_t conv;
+-# endif
+-#endif
+-  char **conv_tab;
+-
+-  struct expression *plural;
+-  unsigned long int nplurals;
+-};
+-
+-/* We want to allocate a string at the end of the struct.  But ISO C
+-   doesn't allow zero sized arrays.  */
+-#ifdef __GNUC__
+-# define ZERO 0
+-#else
+-# define ZERO 1
+-#endif
+-
+-/* A set of settings bound to a message domain.  Used to store settings
+-   from bindtextdomain() and bind_textdomain_codeset().  */
+-struct binding
+-{
+-  struct binding *next;
+-  char *dirname;
+-  int codeset_cntr;	/* Incremented each time codeset changes.  */
+-  char *codeset;
+-  char domainname[ZERO];
+-};
+-
+-/* A counter which is incremented each time some previous translations
+-   become invalid.
+-   This variable is part of the external ABI of the GNU libintl.  */
+-extern int _nl_msg_cat_cntr;
+-
+-struct loaded_l10nfile *_nl_find_domain PARAMS ((const char *__dirname,
+-						 char *__locale,
+-						 const char *__domainname,
+-					      struct binding *__domainbinding))
+-     internal_function;
+-void _nl_load_domain PARAMS ((struct loaded_l10nfile *__domain,
+-			      struct binding *__domainbinding))
+-     internal_function;
+-void _nl_unload_domain PARAMS ((struct loaded_domain *__domain))
+-     internal_function;
+-const char *_nl_init_domain_conv PARAMS ((struct loaded_l10nfile *__domain_file,
+-					  struct loaded_domain *__domain,
+-					  struct binding *__domainbinding))
+-     internal_function;
+-void _nl_free_domain_conv PARAMS ((struct loaded_domain *__domain))
+-     internal_function;
+-
+-char *_nl_find_msg PARAMS ((struct loaded_l10nfile *domain_file,
+-			    struct binding *domainbinding,
+-			    const char *msgid, size_t *lengthp))
+-     internal_function;
+-
+-#ifdef _LIBC
+-extern char *__gettext PARAMS ((const char *__msgid));
+-extern char *__dgettext PARAMS ((const char *__domainname,
+-				 const char *__msgid));
+-extern char *__dcgettext PARAMS ((const char *__domainname,
+-				  const char *__msgid, int __category));
+-extern char *__ngettext PARAMS ((const char *__msgid1, const char *__msgid2,
+-				 unsigned long int __n));
+-extern char *__dngettext PARAMS ((const char *__domainname,
+-				  const char *__msgid1, const char *__msgid2,
+-				  unsigned long int n));
+-extern char *__dcngettext PARAMS ((const char *__domainname,
+-				   const char *__msgid1, const char *__msgid2,
+-				   unsigned long int __n, int __category));
+-extern char *__dcigettext PARAMS ((const char *__domainname,
+-				   const char *__msgid1, const char *__msgid2,
+-				   int __plural, unsigned long int __n,
+-				   int __category));
+-extern char *__textdomain PARAMS ((const char *__domainname));
+-extern char *__bindtextdomain PARAMS ((const char *__domainname,
+-				       const char *__dirname));
+-extern char *__bind_textdomain_codeset PARAMS ((const char *__domainname,
+-						const char *__codeset));
+-#else
+-extern char *gettext__ PARAMS ((const char *__msgid));
+-extern char *dgettext__ PARAMS ((const char *__domainname,
+-				 const char *__msgid));
+-extern char *dcgettext__ PARAMS ((const char *__domainname,
+-				  const char *__msgid, int __category));
+-extern char *ngettext__ PARAMS ((const char *__msgid1, const char *__msgid2,
+-				 unsigned long int __n));
+-extern char *dngettext__ PARAMS ((const char *__domainname,
+-				  const char *__msgid1, const char *__msgid2,
+-				  unsigned long int __n));
+-extern char *dcngettext__ PARAMS ((const char *__domainname,
+-				   const char *__msgid1, const char *__msgid2,
+-				   unsigned long int __n, int __category));
+-extern char *dcigettext__ PARAMS ((const char *__domainname,
+-				   const char *__msgid1, const char *__msgid2,
+-				   int __plural, unsigned long int __n,
+-				   int __category));
+-extern char *textdomain__ PARAMS ((const char *__domainname));
+-extern char *bindtextdomain__ PARAMS ((const char *__domainname,
+-				       const char *__dirname));
+-extern char *bind_textdomain_codeset__ PARAMS ((const char *__domainname,
+-						const char *__codeset));
+-#endif
+-
+-#ifdef _LIBC
+-extern void __gettext_free_exp PARAMS ((struct expression *exp))
+-     internal_function;
+-extern int __gettextparse PARAMS ((void *arg));
+-#else
+-extern void gettext_free_exp__ PARAMS ((struct expression *exp))
+-     internal_function;
+-extern int gettextparse__ PARAMS ((void *arg));
+-#endif
+-
+-/* @@ begin of epilog @@ */
+-
+-#endif /* gettextP.h  */
+--- a/intl/hash-string.h
++++ /dev/null
+@@ -1,59 +0,0 @@
+-/* Description of GNU message catalog format: string hashing function.
+-   Copyright (C) 1995, 1997, 1998, 2000, 2001 Free Software Foundation, Inc.
+-
+-   This program is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU Library General Public License as published
+-   by the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Library General Public License for more details.
+-
+-   You should have received a copy of the GNU Library General Public
+-   License along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-   USA.  */
+-
+-/* @@ end of prolog @@ */
+-
+-#ifndef PARAMS
+-# if __STDC__
+-#  define PARAMS(Args) Args
+-# else
+-#  define PARAMS(Args) ()
+-# endif
+-#endif
+-
+-/* We assume to have `unsigned long int' value with at least 32 bits.  */
+-#define HASHWORDBITS 32
+-
+-
+-/* Defines the so called `hashpjw' function by P.J. Weinberger
+-   [see Aho/Sethi/Ullman, COMPILERS: Principles, Techniques and Tools,
+-   1986, 1987 Bell Telephone Laboratories, Inc.]  */
+-static unsigned long int hash_string PARAMS ((const char *__str_param));
+-
+-static inline unsigned long int
+-hash_string (str_param)
+-     const char *str_param;
+-{
+-  unsigned long int hval, g;
+-  const char *str = str_param;
+-
+-  /* Compute the hash value for the given string.  */
+-  hval = 0;
+-  while (*str != '\0')
+-    {
+-      hval <<= 4;
+-      hval += (unsigned long int) *str++;
+-      g = hval & ((unsigned long int) 0xf << (HASHWORDBITS - 4));
+-      if (g != 0)
+-	{
+-	  hval ^= g >> (HASHWORDBITS - 8);
+-	  hval ^= g;
+-	}
+-    }
+-  return hval;
+-}
+--- a/intl/intl-compat.c
++++ /dev/null
+@@ -1,166 +0,0 @@
+-/* intl-compat.c - Stub functions to call gettext functions from GNU gettext
+-   Library.
+-   Copyright (C) 1995, 2000, 2001 Software Foundation, Inc.
+-
+-   This program is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU Library General Public License as published
+-   by the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Library General Public License for more details.
+-
+-   You should have received a copy of the GNU Library General Public
+-   License along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-   USA.  */
+-
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-#include "libgnuintl.h"
+-#include "gettextP.h"
+-
+-/* @@ end of prolog @@ */
+-
+-/* This file redirects the gettext functions (without prefix or suffix) to
+-   those defined in the included GNU gettext library (with "__" suffix).
+-   It is compiled into libintl when the included GNU gettext library is
+-   configured --with-included-gettext.
+-
+-   This redirection works also in the case that the system C library or
+-   the system libintl library contain gettext/textdomain/... functions.
+-   If it didn't, we would need to add preprocessor level redirections to
+-   libgnuintl.h of the following form:
+-
+-#    define gettext gettext__
+-#    define dgettext dgettext__
+-#    define dcgettext dcgettext__
+-#    define ngettext ngettext__
+-#    define dngettext dngettext__
+-#    define dcngettext dcngettext__
+-#    define textdomain textdomain__
+-#    define bindtextdomain bindtextdomain__
+-#    define bind_textdomain_codeset bind_textdomain_codeset__
+-
+-   How does this redirection work? There are two cases.
+-   A. When libintl.a is linked into an executable, it works because
+-      functions defined in the executable always override functions in
+-      the shared libraries.
+-   B. When libintl.so is used, it works because
+-      1. those systems defining gettext/textdomain/... in the C library
+-         (namely, Solaris 2.4 and newer, and GNU libc 2.0 and newer) are
+-         ELF systems and define these symbols as weak, thus explicitly
+-         letting other shared libraries override it.
+-      2. those systems defining gettext/textdomain/... in a standalone
+-         libintl.so library (namely, Solaris 2.3 and newer) have this
+-         shared library in /usr/lib, and the linker will search /usr/lib
+-         *after* the directory where the GNU gettext library is installed.
+-
+-   A third case, namely when libintl.a is linked into a shared library
+-   whose name is not libintl.so, is not supported. In this case, on
+-   Solaris, when -lintl precedes the linker option for the shared library
+-   containing GNU gettext, the system's gettext would indeed override
+-   the GNU gettext. Anyone doing this kind of stuff must be clever enough
+-   to 1. compile libintl.a with -fPIC, 2. remove -lintl from his linker
+-   command line.  */
+-
+-
+-#undef gettext
+-#undef dgettext
+-#undef dcgettext
+-#undef ngettext
+-#undef dngettext
+-#undef dcngettext
+-#undef textdomain
+-#undef bindtextdomain
+-#undef bind_textdomain_codeset
+-
+-
+-char *
+-gettext (msgid)
+-     const char *msgid;
+-{
+-  return gettext__ (msgid);
+-}
+-
+-
+-char *
+-dgettext (domainname, msgid)
+-     const char *domainname;
+-     const char *msgid;
+-{
+-  return dgettext__ (domainname, msgid);
+-}
+-
+-
+-char *
+-dcgettext (domainname, msgid, category)
+-     const char *domainname;
+-     const char *msgid;
+-     int category;
+-{
+-  return dcgettext__ (domainname, msgid, category);
+-}
+-
+-
+-char *
+-ngettext (msgid1, msgid2, n)
+-     const char *msgid1;
+-     const char *msgid2;
+-     unsigned long int n;
+-{
+-  return ngettext__ (msgid1, msgid2, n);
+-}
+-
+-
+-char *
+-dngettext (domainname, msgid1, msgid2, n)
+-     const char *domainname;
+-     const char *msgid1;
+-     const char *msgid2;
+-     unsigned long int n;
+-{
+-  return dngettext__ (domainname, msgid1, msgid2, n);
+-}
+-
+-
+-char *
+-dcngettext (domainname, msgid1, msgid2, n, category)
+-     const char *domainname;
+-     const char *msgid1;
+-     const char *msgid2;
+-     unsigned long int n;
+-     int category;
+-{
+-  return dcngettext__ (domainname, msgid1, msgid2, n, category);
+-}
+-
+-
+-char *
+-textdomain (domainname)
+-     const char *domainname;
+-{
+-  return textdomain__ (domainname);
+-}
+-
+-
+-char *
+-bindtextdomain (domainname, dirname)
+-     const char *domainname;
+-     const char *dirname;
+-{
+-  return bindtextdomain__ (domainname, dirname);
+-}
+-
+-
+-char *
+-bind_textdomain_codeset (domainname, codeset)
+-     const char *domainname;
+-     const char *codeset;
+-{
+-  return bind_textdomain_codeset__ (domainname, codeset);
+-}
+--- a/intl/l10nflist.c
++++ /dev/null
+@@ -1,405 +0,0 @@
+-/* Copyright (C) 1995-1999, 2000, 2001 Free Software Foundation, Inc.
+-   Contributed by Ulrich Drepper <drepper@gnu.ai.mit.edu>, 1995.
+-
+-   This program is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU Library General Public License as published
+-   by the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Library General Public License for more details.
+-
+-   You should have received a copy of the GNU Library General Public
+-   License along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-   USA.  */
+-
+-/* Tell glibc's <string.h> to provide a prototype for stpcpy().
+-   This must come before <config.h> because <config.h> may include
+-   <features.h>, and once <features.h> has been included, it's too late.  */
+-#ifndef _GNU_SOURCE
+-# define _GNU_SOURCE	1
+-#endif
+-
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-#include <string.h>
+-#if !HAVE_STRCHR && !defined _LIBC
+-# ifndef strchr
+-#  define strchr index
+-# endif
+-#endif
+-
+-#if defined _LIBC || defined HAVE_ARGZ_H
+-# include <argz.h>
+-#endif
+-#include <ctype.h>
+-#include <sys/types.h>
+-#include <stdlib.h>
+-
+-#include "loadinfo.h"
+-
+-/* On some strange systems still no definition of NULL is found.  Sigh!  */
+-#ifndef NULL
+-# if defined __STDC__ && __STDC__
+-#  define NULL ((void *) 0)
+-# else
+-#  define NULL 0
+-# endif
+-#endif
+-
+-/* @@ end of prolog @@ */
+-
+-#ifdef _LIBC
+-/* Rename the non ANSI C functions.  This is required by the standard
+-   because some ANSI C functions will require linking with this object
+-   file and the name space must not be polluted.  */
+-# ifndef stpcpy
+-#  define stpcpy(dest, src) __stpcpy(dest, src)
+-# endif
+-#else
+-# ifndef HAVE_STPCPY
+-static char *stpcpy PARAMS ((char *dest, const char *src));
+-# endif
+-#endif
+-
+-/* Define function which are usually not available.  */
+-
+-#if !defined _LIBC && !defined HAVE___ARGZ_COUNT
+-/* Returns the number of strings in ARGZ.  */
+-static size_t argz_count__ PARAMS ((const char *argz, size_t len));
+-
+-static size_t
+-argz_count__ (argz, len)
+-     const char *argz;
+-     size_t len;
+-{
+-  size_t count = 0;
+-  while (len > 0)
+-    {
+-      size_t part_len = strlen (argz);
+-      argz += part_len + 1;
+-      len -= part_len + 1;
+-      count++;
+-    }
+-  return count;
+-}
+-# undef __argz_count
+-# define __argz_count(argz, len) argz_count__ (argz, len)
+-#endif	/* !_LIBC && !HAVE___ARGZ_COUNT */
+-
+-#if !defined _LIBC && !defined HAVE___ARGZ_STRINGIFY
+-/* Make '\0' separated arg vector ARGZ printable by converting all the '\0's
+-   except the last into the character SEP.  */
+-static void argz_stringify__ PARAMS ((char *argz, size_t len, int sep));
+-
+-static void
+-argz_stringify__ (argz, len, sep)
+-     char *argz;
+-     size_t len;
+-     int sep;
+-{
+-  while (len > 0)
+-    {
+-      size_t part_len = strlen (argz);
+-      argz += part_len;
+-      len -= part_len + 1;
+-      if (len > 0)
+-	*argz++ = sep;
+-    }
+-}
+-# undef __argz_stringify
+-# define __argz_stringify(argz, len, sep) argz_stringify__ (argz, len, sep)
+-#endif	/* !_LIBC && !HAVE___ARGZ_STRINGIFY */
+-
+-#if !defined _LIBC && !defined HAVE___ARGZ_NEXT
+-static char *argz_next__ PARAMS ((char *argz, size_t argz_len,
+-				  const char *entry));
+-
+-static char *
+-argz_next__ (argz, argz_len, entry)
+-     char *argz;
+-     size_t argz_len;
+-     const char *entry;
+-{
+-  if (entry)
+-    {
+-      if (entry < argz + argz_len)
+-        entry = strchr (entry, '\0') + 1;
+-
+-      return entry >= argz + argz_len ? NULL : (char *) entry;
+-    }
+-  else
+-    if (argz_len > 0)
+-      return argz;
+-    else
+-      return 0;
+-}
+-# undef __argz_next
+-# define __argz_next(argz, len, entry) argz_next__ (argz, len, entry)
+-#endif	/* !_LIBC && !HAVE___ARGZ_NEXT */
+-
+-
+-/* Return number of bits set in X.  */
+-static int pop PARAMS ((int x));
+-
+-static inline int
+-pop (x)
+-     int x;
+-{
+-  /* We assume that no more than 16 bits are used.  */
+-  x = ((x & ~0x5555) >> 1) + (x & 0x5555);
+-  x = ((x & ~0x3333) >> 2) + (x & 0x3333);
+-  x = ((x >> 4) + x) & 0x0f0f;
+-  x = ((x >> 8) + x) & 0xff;
+-
+-  return x;
+-}
+-
+-
+-struct loaded_l10nfile *
+-_nl_make_l10nflist (l10nfile_list, dirlist, dirlist_len, mask, language,
+-		    territory, codeset, normalized_codeset, modifier, special,
+-		    sponsor, revision, filename, do_allocate)
+-     struct loaded_l10nfile **l10nfile_list;
+-     const char *dirlist;
+-     size_t dirlist_len;
+-     int mask;
+-     const char *language;
+-     const char *territory;
+-     const char *codeset;
+-     const char *normalized_codeset;
+-     const char *modifier;
+-     const char *special;
+-     const char *sponsor;
+-     const char *revision;
+-     const char *filename;
+-     int do_allocate;
+-{
+-  char *abs_filename;
+-  struct loaded_l10nfile *last = NULL;
+-  struct loaded_l10nfile *retval;
+-  char *cp;
+-  size_t entries;
+-  int cnt;
+-
+-  /* Allocate room for the full file name.  */
+-  abs_filename = (char *) malloc (dirlist_len
+-				  + strlen (language)
+-				  + ((mask & TERRITORY) != 0
+-				     ? strlen (territory) + 1 : 0)
+-				  + ((mask & XPG_CODESET) != 0
+-				     ? strlen (codeset) + 1 : 0)
+-				  + ((mask & XPG_NORM_CODESET) != 0
+-				     ? strlen (normalized_codeset) + 1 : 0)
+-				  + (((mask & XPG_MODIFIER) != 0
+-				      || (mask & CEN_AUDIENCE) != 0)
+-				     ? strlen (modifier) + 1 : 0)
+-				  + ((mask & CEN_SPECIAL) != 0
+-				     ? strlen (special) + 1 : 0)
+-				  + (((mask & CEN_SPONSOR) != 0
+-				      || (mask & CEN_REVISION) != 0)
+-				     ? (1 + ((mask & CEN_SPONSOR) != 0
+-					     ? strlen (sponsor) + 1 : 0)
+-					+ ((mask & CEN_REVISION) != 0
+-					   ? strlen (revision) + 1 : 0)) : 0)
+-				  + 1 + strlen (filename) + 1);
+-
+-  if (abs_filename == NULL)
+-    return NULL;
+-
+-  retval = NULL;
+-  last = NULL;
+-
+-  /* Construct file name.  */
+-  memcpy (abs_filename, dirlist, dirlist_len);
+-  __argz_stringify (abs_filename, dirlist_len, PATH_SEPARATOR);
+-  cp = abs_filename + (dirlist_len - 1);
+-  *cp++ = '/';
+-  cp = stpcpy (cp, language);
+-
+-  if ((mask & TERRITORY) != 0)
+-    {
+-      *cp++ = '_';
+-      cp = stpcpy (cp, territory);
+-    }
+-  if ((mask & XPG_CODESET) != 0)
+-    {
+-      *cp++ = '.';
+-      cp = stpcpy (cp, codeset);
+-    }
+-  if ((mask & XPG_NORM_CODESET) != 0)
+-    {
+-      *cp++ = '.';
+-      cp = stpcpy (cp, normalized_codeset);
+-    }
+-  if ((mask & (XPG_MODIFIER | CEN_AUDIENCE)) != 0)
+-    {
+-      /* This component can be part of both syntaces but has different
+-	 leading characters.  For CEN we use `+', else `@'.  */
+-      *cp++ = (mask & CEN_AUDIENCE) != 0 ? '+' : '@';
+-      cp = stpcpy (cp, modifier);
+-    }
+-  if ((mask & CEN_SPECIAL) != 0)
+-    {
+-      *cp++ = '+';
+-      cp = stpcpy (cp, special);
+-    }
+-  if ((mask & (CEN_SPONSOR | CEN_REVISION)) != 0)
+-    {
+-      *cp++ = ',';
+-      if ((mask & CEN_SPONSOR) != 0)
+-	cp = stpcpy (cp, sponsor);
+-      if ((mask & CEN_REVISION) != 0)
+-	{
+-	  *cp++ = '_';
+-	  cp = stpcpy (cp, revision);
+-	}
+-    }
+-
+-  *cp++ = '/';
+-  stpcpy (cp, filename);
+-
+-  /* Look in list of already loaded domains whether it is already
+-     available.  */
+-  last = NULL;
+-  for (retval = *l10nfile_list; retval != NULL; retval = retval->next)
+-    if (retval->filename != NULL)
+-      {
+-	int compare = strcmp (retval->filename, abs_filename);
+-	if (compare == 0)
+-	  /* We found it!  */
+-	  break;
+-	if (compare < 0)
+-	  {
+-	    /* It's not in the list.  */
+-	    retval = NULL;
+-	    break;
+-	  }
+-
+-	last = retval;
+-      }
+-
+-  if (retval != NULL || do_allocate == 0)
+-    {
+-      free (abs_filename);
+-      return retval;
+-    }
+-
+-  retval = (struct loaded_l10nfile *)
+-    malloc (sizeof (*retval) + (__argz_count (dirlist, dirlist_len)
+-				* (1 << pop (mask))
+-				* sizeof (struct loaded_l10nfile *)));
+-  if (retval == NULL)
+-    return NULL;
+-
+-  retval->filename = abs_filename;
+-  retval->decided = (__argz_count (dirlist, dirlist_len) != 1
+-		     || ((mask & XPG_CODESET) != 0
+-			 && (mask & XPG_NORM_CODESET) != 0));
+-  retval->data = NULL;
+-
+-  if (last == NULL)
+-    {
+-      retval->next = *l10nfile_list;
+-      *l10nfile_list = retval;
+-    }
+-  else
+-    {
+-      retval->next = last->next;
+-      last->next = retval;
+-    }
+-
+-  entries = 0;
+-  /* If the DIRLIST is a real list the RETVAL entry corresponds not to
+-     a real file.  So we have to use the DIRLIST separation mechanism
+-     of the inner loop.  */
+-  cnt = __argz_count (dirlist, dirlist_len) == 1 ? mask - 1 : mask;
+-  for (; cnt >= 0; --cnt)
+-    if ((cnt & ~mask) == 0
+-	&& ((cnt & CEN_SPECIFIC) == 0 || (cnt & XPG_SPECIFIC) == 0)
+-	&& ((cnt & XPG_CODESET) == 0 || (cnt & XPG_NORM_CODESET) == 0))
+-      {
+-	/* Iterate over all elements of the DIRLIST.  */
+-	char *dir = NULL;
+-
+-	while ((dir = __argz_next ((char *) dirlist, dirlist_len, dir))
+-	       != NULL)
+-	  retval->successor[entries++]
+-	    = _nl_make_l10nflist (l10nfile_list, dir, strlen (dir) + 1, cnt,
+-				  language, territory, codeset,
+-				  normalized_codeset, modifier, special,
+-				  sponsor, revision, filename, 1);
+-      }
+-  retval->successor[entries] = NULL;
+-
+-  return retval;
+-}
+-
+-/* Normalize codeset name.  There is no standard for the codeset
+-   names.  Normalization allows the user to use any of the common
+-   names.  The return value is dynamically allocated and has to be
+-   freed by the caller.  */
+-const char *
+-_nl_normalize_codeset (codeset, name_len)
+-     const char *codeset;
+-     size_t name_len;
+-{
+-  int len = 0;
+-  int only_digit = 1;
+-  char *retval;
+-  char *wp;
+-  size_t cnt;
+-
+-  for (cnt = 0; cnt < name_len; ++cnt)
+-    if (isalnum (codeset[cnt]))
+-      {
+-	++len;
+-
+-	if (isalpha (codeset[cnt]))
+-	  only_digit = 0;
+-      }
+-
+-  retval = (char *) malloc ((only_digit ? 3 : 0) + len + 1);
+-
+-  if (retval != NULL)
+-    {
+-      if (only_digit)
+-	wp = stpcpy (retval, "iso");
+-      else
+-	wp = retval;
+-
+-      for (cnt = 0; cnt < name_len; ++cnt)
+-	if (isalpha (codeset[cnt]))
+-	  *wp++ = tolower (codeset[cnt]);
+-	else if (isdigit (codeset[cnt]))
+-	  *wp++ = codeset[cnt];
+-
+-      *wp = '\0';
+-    }
+-
+-  return (const char *) retval;
+-}
+-
+-
+-/* @@ begin of epilog @@ */
+-
+-/* We don't want libintl.a to depend on any other library.  So we
+-   avoid the non-standard function stpcpy.  In GNU C Library this
+-   function is available, though.  Also allow the symbol HAVE_STPCPY
+-   to be defined.  */
+-#if !_LIBC && !HAVE_STPCPY
+-static char *
+-stpcpy (dest, src)
+-     char *dest;
+-     const char *src;
+-{
+-  while ((*dest++ = *src++) != '\0')
+-    /* Do nothing. */ ;
+-  return dest - 1;
+-}
+-#endif
+--- a/intl/libgettext.h
++++ /dev/null
+@@ -1,49 +0,0 @@
+-/* Convenience header for conditional use of GNU <libintl.h>.
+-   Copyright (C) 1995-1998, 2000, 2001 Free Software Foundation, Inc.
+-
+-   This program is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU Library General Public License as published
+-   by the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Library General Public License for more details.
+-
+-   You should have received a copy of the GNU Library General Public
+-   License along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-   USA.  */
+-
+-#ifndef _LIBGETTEXT_H
+-#define _LIBGETTEXT_H 1
+-
+-/* NLS can be disabled through the configure --disable-nls option.  */
+-#if ENABLE_NLS
+-
+-/* Get declarations of GNU message catalog functions.  */
+-# include <libintl.h>
+-
+-#else
+-
+-# define gettext(Msgid) (Msgid)
+-# define dgettext(Domainname, Msgid) (Msgid)
+-# define dcgettext(Domainname, Msgid, Category) (Msgid)
+-# define ngettext(Msgid1, Msgid2, N) \
+-    ((N) == 1 ? (char *) (Msgid1) : (char *) (Msgid2))
+-# define dngettext(Domainname, Msgid1, Msgid2, N) \
+-    ((N) == 1 ? (char *) (Msgid1) : (char *) (Msgid2))
+-# define dcngettext(Domainname, Msgid1, Msgid2, N, Category) \
+-    ((N) == 1 ? (char *) (Msgid1) : (char *) (Msgid2))
+-# define textdomain(Domainname) ((char *) (Domainname))
+-# define bindtextdomain(Domainname, Dirname) ((char *) (Dirname))
+-# define bind_textdomain_codeset(Domainname, Codeset) ((char *) (Codeset))
+-
+-#endif
+-
+-/* For automatical extraction of messages sometimes no real
+-   translation is needed.  Instead the string itself is the result.  */
+-#define gettext_noop(Str) (Str)
+-
+-#endif /* _LIBGETTEXT_H */
+--- a/intl/libgnuintl.h
++++ /dev/null
+@@ -1,128 +0,0 @@
+-/* Message catalogs for internationalization.
+-   Copyright (C) 1995-1997, 2000, 2001 Free Software Foundation, Inc.
+-
+-   This program is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU Library General Public License as published
+-   by the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Library General Public License for more details.
+-
+-   You should have received a copy of the GNU Library General Public
+-   License along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-   USA.  */
+-
+-#ifndef _LIBINTL_H
+-#define _LIBINTL_H	1
+-
+-#include <locale.h>
+-
+-/* The LC_MESSAGES locale category is the category used by the functions
+-   gettext() and dgettext().  It is specified in POSIX, but not in ANSI C.
+-   On systems that don't define it, use an arbitrary value instead.
+-   On Solaris, <locale.h> defines __LOCALE_H then includes <libintl.h> (i.e.
+-   this file!) and then only defines LC_MESSAGES.  To avoid a redefinition
+-   warning, don't define LC_MESSAGES in this case.  */
+-#if !defined LC_MESSAGES && !defined __LOCALE_H
+-# define LC_MESSAGES 1729
+-#endif
+-
+-/* We define an additional symbol to signal that we use the GNU
+-   implementation of gettext.  */
+-#define __USE_GNU_GETTEXT 1
+-
+-/* Resolve a platform specific conflict on DJGPP.  GNU gettext takes
+-   precedence over _conio_gettext.  */
+-#ifdef __DJGPP__
+-# undef gettext
+-# define gettext gettext
+-#endif
+-
+-#ifndef PARAMS
+-# if __STDC__ || defined __cplusplus
+-#  define PARAMS(args) args
+-# else
+-#  define PARAMS(args) ()
+-# endif
+-#endif
+-
+-#ifdef __cplusplus
+-extern "C" {
+-#endif
+-
+-/* Look up MSGID in the current default message catalog for the current
+-   LC_MESSAGES locale.  If not found, returns MSGID itself (the default
+-   text).  */
+-extern char *gettext PARAMS ((const char *__msgid));
+-
+-/* Look up MSGID in the DOMAINNAME message catalog for the current
+-   LC_MESSAGES locale.  */
+-extern char *dgettext PARAMS ((const char *__domainname, const char *__msgid));
+-
+-/* Look up MSGID in the DOMAINNAME message catalog for the current CATEGORY
+-   locale.  */
+-extern char *dcgettext PARAMS ((const char *__domainname, const char *__msgid,
+-				int __category));
+-
+-
+-/* Similar to `gettext' but select the plural form corresponding to the
+-   number N.  */
+-extern char *ngettext PARAMS ((const char *__msgid1, const char *__msgid2,
+-			       unsigned long int __n));
+-
+-/* Similar to `dgettext' but select the plural form corresponding to the
+-   number N.  */
+-extern char *dngettext PARAMS ((const char *__domainname, const char *__msgid1,
+-				const char *__msgid2, unsigned long int __n));
+-
+-/* Similar to `dcgettext' but select the plural form corresponding to the
+-   number N.  */
+-extern char *dcngettext PARAMS ((const char *__domainname, const char *__msgid1,
+-				 const char *__msgid2, unsigned long int __n,
+-				 int __category));
+-
+-
+-/* Set the current default message catalog to DOMAINNAME.
+-   If DOMAINNAME is null, return the current default.
+-   If DOMAINNAME is "", reset to the default of "messages".  */
+-extern char *textdomain PARAMS ((const char *__domainname));
+-
+-/* Specify that the DOMAINNAME message catalog will be found
+-   in DIRNAME rather than in the system locale data base.  */
+-extern char *bindtextdomain PARAMS ((const char *__domainname,
+-				     const char *__dirname));
+-
+-/* Specify the character encoding in which the messages from the
+-   DOMAINNAME message catalog will be returned.  */
+-extern char *bind_textdomain_codeset PARAMS ((const char *__domainname,
+-					      const char *__codeset));
+-
+-
+-/* Optimized version of the functions above.  */
+-#if defined __OPTIMIZED
+-/* These are macros, but could also be inline functions.  */
+-
+-# define gettext(msgid)							      \
+-  dgettext (NULL, msgid)
+-
+-# define dgettext(domainname, msgid)					      \
+-  dcgettext (domainname, msgid, LC_MESSAGES)
+-
+-# define ngettext(msgid1, msgid2, n)					      \
+-  dngettext (NULL, msgid1, msgid2, n)
+-
+-# define dngettext(domainname, msgid1, msgid2, n)			      \
+-  dcngettext (domainname, msgid1, msgid2, n, LC_MESSAGES)
+-
+-#endif /* Optimizing. */
+-
+-
+-#ifdef __cplusplus
+-}
+-#endif
+-
+-#endif /* libintl.h */
+--- a/intl/loadinfo.h
++++ /dev/null
+@@ -1,109 +0,0 @@
+-/* Copyright (C) 1996-1999, 2000, 2001 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+-   Contributed by Ulrich Drepper <drepper@cygnus.com>, 1996.
+-
+-   This program is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU Library General Public License as published
+-   by the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Library General Public License for more details.
+-
+-   You should have received a copy of the GNU Library General Public
+-   License along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-   USA.  */
+-
+-#ifndef _LOADINFO_H
+-#define _LOADINFO_H	1
+-
+-#ifndef PARAMS
+-# if __STDC__
+-#  define PARAMS(args) args
+-# else
+-#  define PARAMS(args) ()
+-# endif
+-#endif
+-
+-#ifndef internal_function
+-# define internal_function
+-#endif
+-
+-/* Tell the compiler when a conditional or integer expression is
+-   almost always true or almost always false.  */
+-#ifndef HAVE_BUILTIN_EXPECT
+-# define __builtin_expect(expr, val) (expr)
+-#endif
+-
+-/* Separator in PATH like lists of pathnames.  */
+-#if defined _WIN32 || defined __WIN32__ || defined __EMX__ || defined __DJGPP__
+-  /* Win32, OS/2, DOS */
+-# define PATH_SEPARATOR ';'
+-#else
+-  /* Unix */
+-# define PATH_SEPARATOR ':'
+-#endif
+-
+-/* Encoding of locale name parts.  */
+-#define CEN_REVISION		1
+-#define CEN_SPONSOR		2
+-#define CEN_SPECIAL		4
+-#define XPG_NORM_CODESET	8
+-#define XPG_CODESET		16
+-#define TERRITORY		32
+-#define CEN_AUDIENCE		64
+-#define XPG_MODIFIER		128
+-
+-#define CEN_SPECIFIC	(CEN_REVISION|CEN_SPONSOR|CEN_SPECIAL|CEN_AUDIENCE)
+-#define XPG_SPECIFIC	(XPG_CODESET|XPG_NORM_CODESET|XPG_MODIFIER)
+-
+-
+-struct loaded_l10nfile
+-{
+-  const char *filename;
+-  int decided;
+-
+-  const void *data;
+-
+-  struct loaded_l10nfile *next;
+-  struct loaded_l10nfile *successor[1];
+-};
+-
+-
+-/* Normalize codeset name.  There is no standard for the codeset
+-   names.  Normalization allows the user to use any of the common
+-   names.  The return value is dynamically allocated and has to be
+-   freed by the caller.  */
+-extern const char *_nl_normalize_codeset PARAMS ((const char *codeset,
+-						  size_t name_len));
+-
+-extern struct loaded_l10nfile *
+-_nl_make_l10nflist PARAMS ((struct loaded_l10nfile **l10nfile_list,
+-			    const char *dirlist, size_t dirlist_len, int mask,
+-			    const char *language, const char *territory,
+-			    const char *codeset,
+-			    const char *normalized_codeset,
+-			    const char *modifier, const char *special,
+-			    const char *sponsor, const char *revision,
+-			    const char *filename, int do_allocate));
+-
+-
+-extern const char *_nl_expand_alias PARAMS ((const char *name));
+-
+-/* normalized_codeset is dynamically allocated and has to be freed by
+-   the caller.  */
+-extern int _nl_explode_name PARAMS ((char *name, const char **language,
+-				     const char **modifier,
+-				     const char **territory,
+-				     const char **codeset,
+-				     const char **normalized_codeset,
+-				     const char **special,
+-				     const char **sponsor,
+-				     const char **revision));
+-
+-extern char *_nl_find_language PARAMS ((const char *name));
+-
+-#endif	/* loadinfo.h */
+--- a/intl/loadmsgcat.c
++++ /dev/null
+@@ -1,567 +0,0 @@
+-/* Load needed message catalogs.
+-   Copyright (C) 1995-1999, 2000, 2001 Free Software Foundation, Inc.
+-
+-   This program is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU Library General Public License as published
+-   by the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Library General Public License for more details.
+-
+-   You should have received a copy of the GNU Library General Public
+-   License along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-   USA.  */
+-
+-/* Tell glibc's <string.h> to provide a prototype for mempcpy().
+-   This must come before <config.h> because <config.h> may include
+-   <features.h>, and once <features.h> has been included, it's too late.  */
+-#ifndef _GNU_SOURCE
+-# define _GNU_SOURCE    1
+-#endif
+-
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-#include <ctype.h>
+-#include <errno.h>
+-#include <fcntl.h>
+-#include <sys/types.h>
+-#include <sys/stat.h>
+-
+-#ifdef __GNUC__
+-# define alloca __builtin_alloca
+-# define HAVE_ALLOCA 1
+-#else
+-# if defined HAVE_ALLOCA_H || defined _LIBC
+-#  include <alloca.h>
+-# else
+-#  ifdef _AIX
+- #pragma alloca
+-#  else
+-#   ifndef alloca
+-char *alloca ();
+-#   endif
+-#  endif
+-# endif
+-#endif
+-
+-#include <stdlib.h>
+-#include <string.h>
+-
+-#if defined HAVE_UNISTD_H || defined _LIBC
+-# include <unistd.h>
+-#endif
+-
+-#ifdef _LIBC
+-# include <langinfo.h>
+-# include <locale.h>
+-#endif
+-
+-#if (defined HAVE_MMAP && defined HAVE_MUNMAP && !defined DISALLOW_MMAP) \
+-    || (defined _LIBC && defined _POSIX_MAPPED_FILES)
+-# include <sys/mman.h>
+-# undef HAVE_MMAP
+-# define HAVE_MMAP	1
+-#else
+-# undef HAVE_MMAP
+-#endif
+-
+-#include "gettext.h"
+-#include "gettextP.h"
+-
+-#ifdef _LIBC
+-# include "../locale/localeinfo.h"
+-#endif
+-
+-/* @@ end of prolog @@ */
+-
+-#ifdef _LIBC
+-/* Rename the non ISO C functions.  This is required by the standard
+-   because some ISO C functions will require linking with this object
+-   file and the name space must not be polluted.  */
+-# define open   __open
+-# define close  __close
+-# define read   __read
+-# define mmap   __mmap
+-# define munmap __munmap
+-#endif
+-
+-/* Names for the libintl functions are a problem.  They must not clash
+-   with existing names and they should follow ANSI C.  But this source
+-   code is also used in GNU C Library where the names have a __
+-   prefix.  So we have to make a difference here.  */
+-#ifdef _LIBC
+-# define PLURAL_PARSE __gettextparse
+-#else
+-# define PLURAL_PARSE gettextparse__
+-#endif
+-
+-/* For those losing systems which don't have `alloca' we have to add
+-   some additional code emulating it.  */
+-#ifdef HAVE_ALLOCA
+-# define freea(p) /* nothing */
+-#else
+-# define alloca(n) malloc (n)
+-# define freea(p) free (p)
+-#endif
+-
+-/* For systems that distinguish between text and binary I/O.
+-   O_BINARY is usually declared in <fcntl.h>. */
+-#if !defined O_BINARY && defined _O_BINARY
+-  /* For MSC-compatible compilers.  */
+-# define O_BINARY _O_BINARY
+-# define O_TEXT _O_TEXT
+-#endif
+-#ifdef __BEOS__
+-  /* BeOS 5 has O_BINARY and O_TEXT, but they have no effect.  */
+-# undef O_BINARY
+-# undef O_TEXT
+-#endif
+-/* On reasonable systems, binary I/O is the default.  */
+-#ifndef O_BINARY
+-# define O_BINARY 0
+-#endif
+-
+-/* We need a sign, whether a new catalog was loaded, which can be associated
+-   with all translations.  This is important if the translations are
+-   cached by one of GCC's features.  */
+-int _nl_msg_cat_cntr;
+-
+-#if (defined  __GNUC__ && !defined __APPLE_CC__ ) \
+-    || (!defined __sun &&  __STDC_VERSION__ && __STDC_VERSION__ >= 199901L)
+-
+-/* These structs are the constant expression for the germanic plural
+-   form determination.  It represents the expression  "n != 1".  */
+-static const struct expression plvar =
+-{
+-  .nargs = 0,
+-  .operation = var,
+-};
+-static const struct expression plone =
+-{
+-  .nargs = 0,
+-  .operation = num,
+-  .val =
+-  {
+-    .num = 1
+-  }
+-};
+-static struct expression germanic_plural =
+-{
+-  .nargs = 2,
+-  .operation = not_equal,
+-  .val =
+-  {
+-    .args =
+-    {
+-      [0] = (struct expression *) &plvar,
+-      [1] = (struct expression *) &plone
+-    }
+-  }
+-};
+-
+-# define INIT_GERMANIC_PLURAL()
+-
+-#else
+-
+-/* For compilers without support for ISO C 99 struct/union initializers:
+-   Initialization at run-time.  */
+-
+-static struct expression plvar;
+-static struct expression plone;
+-static struct expression germanic_plural;
+-
+-static void
+-init_germanic_plural ()
+-{
+-  if (plone.val.num == 0)
+-    {
+-      plvar.nargs = 0;
+-      plvar.operation = var;
+-
+-      plone.nargs = 0;
+-      plone.operation = num;
+-      plone.val.num = 1;
+-
+-      germanic_plural.nargs = 2;
+-      germanic_plural.operation = not_equal;
+-      germanic_plural.val.args[0] = &plvar;
+-      germanic_plural.val.args[1] = &plone;
+-    }
+-}
+-
+-# define INIT_GERMANIC_PLURAL() init_germanic_plural ()
+-
+-#endif
+-
+-
+-/* Initialize the codeset dependent parts of an opened message catalog.
+-   Return the header entry.  */
+-const char *
+-internal_function
+-_nl_init_domain_conv (domain_file, domain, domainbinding)
+-     struct loaded_l10nfile *domain_file;
+-     struct loaded_domain *domain;
+-     struct binding *domainbinding;
+-{
+-  /* Find out about the character set the file is encoded with.
+-     This can be found (in textual form) in the entry "".  If this
+-     entry does not exist or if this does not contain the `charset='
+-     information, we will assume the charset matches the one the
+-     current locale and we don't have to perform any conversion.  */
+-  char *nullentry;
+-  size_t nullentrylen;
+-
+-  /* Preinitialize fields, to avoid recursion during _nl_find_msg.  */
+-  domain->codeset_cntr =
+-    (domainbinding != NULL ? domainbinding->codeset_cntr : 0);
+-#ifdef _LIBC
+-  domain->conv = (__gconv_t) -1;
+-#else
+-# if HAVE_ICONV
+-  domain->conv = (iconv_t) -1;
+-# endif
+-#endif
+-  domain->conv_tab = NULL;
+-
+-  /* Get the header entry.  */
+-  nullentry = _nl_find_msg (domain_file, domainbinding, "", &nullentrylen);
+-
+-  if (nullentry != NULL)
+-    {
+-#if defined _LIBC || HAVE_ICONV
+-      const char *charsetstr;
+-
+-      charsetstr = strstr (nullentry, "charset=");
+-      if (charsetstr != NULL)
+-	{
+-	  size_t len;
+-	  char *charset;
+-	  const char *outcharset;
+-
+-	  charsetstr += strlen ("charset=");
+-	  len = strcspn (charsetstr, " \t\n");
+-
+-	  charset = (char *) alloca (len + 1);
+-# if defined _LIBC || HAVE_MEMPCPY
+-	  *((char *) mempcpy (charset, charsetstr, len)) = '\0';
+-# else
+-	  memcpy (charset, charsetstr, len);
+-	  charset[len] = '\0';
+-# endif
+-
+-	  /* The output charset should normally be determined by the
+-	     locale.  But sometimes the locale is not used or not correctly
+-	     set up, so we provide a possibility for the user to override
+-	     this.  Moreover, the value specified through
+-	     bind_textdomain_codeset overrides both.  */
+-	  if (domainbinding != NULL && domainbinding->codeset != NULL)
+-	    outcharset = domainbinding->codeset;
+-	  else
+-	    {
+-	      outcharset = getenv ("OUTPUT_CHARSET");
+-	      if (outcharset == NULL || outcharset[0] == '\0')
+-		{
+-# ifdef _LIBC
+-		  outcharset = (*_nl_current[LC_CTYPE])->values[_NL_ITEM_INDEX (CODESET)].string;
+-# else
+-#  if HAVE_ICONV
+-		  extern const char *locale_charset (void);
+-		  outcharset = locale_charset ();
+-#  endif
+-# endif
+-		}
+-	    }
+-
+-# ifdef _LIBC
+-	  /* We always want to use transliteration.  */
+-	  outcharset = norm_add_slashes (outcharset, "TRANSLIT");
+-	  charset = norm_add_slashes (charset, NULL);
+-	  if (__gconv_open (outcharset, charset, &domain->conv,
+-			    GCONV_AVOID_NOCONV)
+-	      != __GCONV_OK)
+-	    domain->conv = (__gconv_t) -1;
+-# else
+-#  if HAVE_ICONV
+-	  /* When using GNU libiconv, we want to use transliteration.  */
+-#   if _LIBICONV_VERSION >= 0x0105
+-	  len = strlen (outcharset);
+-	  {
+-	    char *tmp = (char *) alloca (len + 10 + 1);
+-	    memcpy (tmp, outcharset, len);
+-	    memcpy (tmp + len, "//TRANSLIT", 10 + 1);
+-	    outcharset = tmp;
+-	  }
+-#   endif
+-	  domain->conv = iconv_open (outcharset, charset);
+-#   if _LIBICONV_VERSION >= 0x0105
+-	  freea (outcharset);
+-#   endif
+-#  endif
+-# endif
+-
+-	  freea (charset);
+-	}
+-#endif /* _LIBC || HAVE_ICONV */
+-    }
+-
+-  return nullentry;
+-}
+-
+-/* Frees the codeset dependent parts of an opened message catalog.  */
+-void
+-internal_function
+-_nl_free_domain_conv (domain)
+-     struct loaded_domain *domain;
+-{
+-  if (domain->conv_tab != NULL && domain->conv_tab != (char **) -1)
+-    free (domain->conv_tab);
+-
+-#ifdef _LIBC
+-  if (domain->conv != (__gconv_t) -1)
+-    __gconv_close (domain->conv);
+-#else
+-# if HAVE_ICONV
+-  if (domain->conv != (iconv_t) -1)
+-    iconv_close (domain->conv);
+-# endif
+-#endif
+-}
+-
+-/* Load the message catalogs specified by FILENAME.  If it is no valid
+-   message catalog do nothing.  */
+-void
+-internal_function
+-_nl_load_domain (domain_file, domainbinding)
+-     struct loaded_l10nfile *domain_file;
+-     struct binding *domainbinding;
+-{
+-  int fd;
+-  size_t size;
+-#ifdef _LIBC
+-  struct stat64 st;
+-#else
+-  struct stat st;
+-#endif
+-  struct mo_file_header *data = (struct mo_file_header *) -1;
+-  int use_mmap = 0;
+-  struct loaded_domain *domain;
+-  const char *nullentry;
+-
+-  domain_file->decided = 1;
+-  domain_file->data = NULL;
+-
+-  /* Note that it would be useless to store domainbinding in domain_file
+-     because domainbinding might be == NULL now but != NULL later (after
+-     a call to bind_textdomain_codeset).  */
+-
+-  /* If the record does not represent a valid locale the FILENAME
+-     might be NULL.  This can happen when according to the given
+-     specification the locale file name is different for XPG and CEN
+-     syntax.  */
+-  if (domain_file->filename == NULL)
+-    return;
+-
+-  /* Try to open the addressed file.  */
+-  fd = open (domain_file->filename, O_RDONLY | O_BINARY);
+-  if (fd == -1)
+-    return;
+-
+-  /* We must know about the size of the file.  */
+-  if (
+-#ifdef _LIBC
+-      __builtin_expect (fstat64 (fd, &st) != 0, 0)
+-#else
+-      __builtin_expect (fstat (fd, &st) != 0, 0)
+-#endif
+-      || __builtin_expect ((size = (size_t) st.st_size) != st.st_size, 0)
+-      || __builtin_expect (size < sizeof (struct mo_file_header), 0))
+-    {
+-      /* Something went wrong.  */
+-      close (fd);
+-      return;
+-    }
+-
+-#ifdef HAVE_MMAP
+-  /* Now we are ready to load the file.  If mmap() is available we try
+-     this first.  If not available or it failed we try to load it.  */
+-  data = (struct mo_file_header *) mmap (NULL, size, PROT_READ,
+-					 MAP_PRIVATE, fd, 0);
+-
+-  if (__builtin_expect (data != (struct mo_file_header *) -1, 1))
+-    {
+-      /* mmap() call was successful.  */
+-      close (fd);
+-      use_mmap = 1;
+-    }
+-#endif
+-
+-  /* If the data is not yet available (i.e. mmap'ed) we try to load
+-     it manually.  */
+-  if (data == (struct mo_file_header *) -1)
+-    {
+-      size_t to_read;
+-      char *read_ptr;
+-
+-      data = (struct mo_file_header *) malloc (size);
+-      if (data == NULL)
+-	return;
+-
+-      to_read = size;
+-      read_ptr = (char *) data;
+-      do
+-	{
+-	  long int nb = (long int) read (fd, read_ptr, to_read);
+-	  if (nb <= 0)
+-	    {
+-#ifdef EINTR
+-	      if (nb == -1 && errno == EINTR)
+-		continue;
+-#endif
+-	      close (fd);
+-	      return;
+-	    }
+-	  read_ptr += nb;
+-	  to_read -= nb;
+-	}
+-      while (to_read > 0);
+-
+-      close (fd);
+-    }
+-
+-  /* Using the magic number we can test whether it really is a message
+-     catalog file.  */
+-  if (__builtin_expect (data->magic != _MAGIC && data->magic != _MAGIC_SWAPPED,
+-			0))
+-    {
+-      /* The magic number is wrong: not a message catalog file.  */
+-#ifdef HAVE_MMAP
+-      if (use_mmap)
+-	munmap ((caddr_t) data, size);
+-      else
+-#endif
+-	free (data);
+-      return;
+-    }
+-
+-  domain = (struct loaded_domain *) malloc (sizeof (struct loaded_domain));
+-  if (domain == NULL)
+-    return;
+-  domain_file->data = domain;
+-
+-  domain->data = (char *) data;
+-  domain->use_mmap = use_mmap;
+-  domain->mmap_size = size;
+-  domain->must_swap = data->magic != _MAGIC;
+-
+-  /* Fill in the information about the available tables.  */
+-  switch (W (domain->must_swap, data->revision))
+-    {
+-    case 0:
+-      domain->nstrings = W (domain->must_swap, data->nstrings);
+-      domain->orig_tab = (struct string_desc *)
+-	((char *) data + W (domain->must_swap, data->orig_tab_offset));
+-      domain->trans_tab = (struct string_desc *)
+-	((char *) data + W (domain->must_swap, data->trans_tab_offset));
+-      domain->hash_size = W (domain->must_swap, data->hash_tab_size);
+-      domain->hash_tab = (nls_uint32 *)
+-	((char *) data + W (domain->must_swap, data->hash_tab_offset));
+-      break;
+-    default:
+-      /* This is an invalid revision.  */
+-#ifdef HAVE_MMAP
+-      if (use_mmap)
+-	munmap ((caddr_t) data, size);
+-      else
+-#endif
+-	free (data);
+-      free (domain);
+-      domain_file->data = NULL;
+-      return;
+-    }
+-
+-  /* Now initialize the character set converter from the character set
+-     the file is encoded with (found in the header entry) to the domain's
+-     specified character set or the locale's character set.  */
+-  nullentry = _nl_init_domain_conv (domain_file, domain, domainbinding);
+-
+-  /* Also look for a plural specification.  */
+-  if (nullentry != NULL)
+-    {
+-      const char *plural;
+-      const char *nplurals;
+-
+-      plural = strstr (nullentry, "plural=");
+-      nplurals = strstr (nullentry, "nplurals=");
+-      if (plural == NULL || nplurals == NULL)
+-	goto no_plural;
+-      else
+-	{
+-	  /* First get the number.  */
+-	  char *endp;
+-	  unsigned long int n;
+-	  struct parse_args args;
+-
+-	  nplurals += 9;
+-	  while (*nplurals != '\0' && isspace (*nplurals))
+-	    ++nplurals;
+-#if defined HAVE_STRTOUL || defined _LIBC
+-	  n = strtoul (nplurals, &endp, 10);
+-#else
+-	  for (endp = nplurals, n = 0; *endp >= '0' && *endp <= '9'; endp++)
+-	    n = n * 10 + (*endp - '0');
+-#endif
+-	  domain->nplurals = n;
+-	  if (nplurals == endp)
+-	    goto no_plural;
+-
+-	  /* Due to the restrictions bison imposes onto the interface of the
+-	     scanner function we have to put the input string and the result
+-	     passed up from the parser into the same structure which address
+-	     is passed down to the parser.  */
+-	  plural += 7;
+-	  args.cp = plural;
+-	  if (PLURAL_PARSE (&args) != 0)
+-	    goto no_plural;
+-	  domain->plural = args.res;
+-	}
+-    }
+-  else
+-    {
+-      /* By default we are using the Germanic form: singular form only
+-         for `one', the plural form otherwise.  Yes, this is also what
+-         English is using since English is a Germanic language.  */
+-    no_plural:
+-      INIT_GERMANIC_PLURAL ();
+-      domain->plural = &germanic_plural;
+-      domain->nplurals = 2;
+-    }
+-}
+-
+-
+-#ifdef _LIBC
+-void
+-internal_function
+-_nl_unload_domain (domain)
+-     struct loaded_domain *domain;
+-{
+-  if (domain->plural != &germanic_plural)
+-    __gettext_free_exp (domain->plural);
+-
+-  _nl_free_domain_conv (domain);
+-
+-# ifdef _POSIX_MAPPED_FILES
+-  if (domain->use_mmap)
+-    munmap ((caddr_t) domain->data, domain->mmap_size);
+-  else
+-# endif	/* _POSIX_MAPPED_FILES */
+-    free ((void *) domain->data);
+-
+-  free (domain);
+-}
+-#endif
+--- a/intl/localcharset.c
++++ /dev/null
+@@ -1,271 +0,0 @@
+-/* Determine a canonical name for the current locale's character encoding.
+-
+-   Copyright (C) 2000-2001 Free Software Foundation, Inc.
+-
+-   This program is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU Library General Public License as published
+-   by the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Library General Public License for more details.
+-
+-   You should have received a copy of the GNU Library General Public
+-   License along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-   USA.  */
+-
+-/* Written by Bruno Haible <haible@clisp.cons.org>.  */
+-
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-#if HAVE_STDDEF_H
+-# include <stddef.h>
+-#endif
+-
+-#include <stdio.h>
+-#if HAVE_STRING_H
+-# include <string.h>
+-#else
+-# include <strings.h>
+-#endif
+-#if HAVE_STDLIB_H
+-# include <stdlib.h>
+-#endif
+-
+-#if defined _WIN32 || defined __WIN32__
+-# undef WIN32   /* avoid warning on mingw32 */
+-# define WIN32
+-#endif
+-
+-#ifndef WIN32
+-# if HAVE_LANGINFO_CODESET
+-#  include <langinfo.h>
+-# else
+-#  if HAVE_SETLOCALE
+-#   include <locale.h>
+-#  endif
+-# endif
+-#else /* WIN32 */
+-# define WIN32_LEAN_AND_MEAN
+-# include <windows.h>
+-#endif
+-
+-#ifndef DIRECTORY_SEPARATOR
+-# define DIRECTORY_SEPARATOR '/'
+-#endif
+-
+-#ifndef ISSLASH
+-# define ISSLASH(C) ((C) == DIRECTORY_SEPARATOR)
+-#endif
+-
+-/* The following static variable is declared 'volatile' to avoid a
+-   possible multithread problem in the function get_charset_aliases. If we
+-   are running in a threaded environment, and if two threads initialize
+-   'charset_aliases' simultaneously, both will produce the same value,
+-   and everything will be ok if the two assignments to 'charset_aliases'
+-   are atomic. But I don't know what will happen if the two assignments mix.  */
+-#if __STDC__ != 1
+-# define volatile /* empty */
+-#endif
+-/* Pointer to the contents of the charset.alias file, if it has already been
+-   read, else NULL.  Its format is:
+-   ALIAS_1 '\0' CANONICAL_1 '\0' ... ALIAS_n '\0' CANONICAL_n '\0' '\0'  */
+-static const char * volatile charset_aliases;
+-
+-/* Return a pointer to the contents of the charset.alias file.  */
+-static const char *
+-get_charset_aliases ()
+-{
+-  const char *cp;
+-
+-  cp = charset_aliases;
+-  if (cp == NULL)
+-    {
+-#ifndef WIN32
+-      FILE *fp;
+-      const char *dir = LIBDIR;
+-      const char *base = "charset.alias";
+-      char *file_name;
+-
+-      /* Concatenate dir and base into freshly allocated file_name.  */
+-      {
+-	size_t dir_len = strlen (dir);
+-	size_t base_len = strlen (base);
+-	int add_slash = (dir_len > 0 && !ISSLASH (dir[dir_len - 1]));
+-	file_name = (char *) malloc (dir_len + add_slash + base_len + 1);
+-	if (file_name != NULL)
+-	  {
+-	    memcpy (file_name, dir, dir_len);
+-	    if (add_slash)
+-	      file_name[dir_len] = DIRECTORY_SEPARATOR;
+-	    memcpy (file_name + dir_len + add_slash, base, base_len + 1);
+-	  }
+-      }
+-
+-      if (file_name == NULL || (fp = fopen (file_name, "r")) == NULL)
+-	/* Out of memory or file not found, treat it as empty.  */
+-	cp = "";
+-      else
+-	{
+-	  /* Parse the file's contents.  */
+-	  int c;
+-	  char buf1[50+1];
+-	  char buf2[50+1];
+-	  char *res_ptr = NULL;
+-	  size_t res_size = 0;
+-	  size_t l1, l2;
+-
+-	  for (;;)
+-	    {
+-	      c = getc (fp);
+-	      if (c == EOF)
+-		break;
+-	      if (c == '\n' || c == ' ' || c == '\t')
+-		continue;
+-	      if (c == '#')
+-		{
+-		  /* Skip comment, to end of line.  */
+-		  do
+-		    c = getc (fp);
+-		  while (!(c == EOF || c == '\n'));
+-		  if (c == EOF)
+-		    break;
+-		  continue;
+-		}
+-	      ungetc (c, fp);
+-	      if (fscanf(fp, "%50s %50s", buf1, buf2) < 2)
+-		break;
+-	      l1 = strlen (buf1);
+-	      l2 = strlen (buf2);
+-	      if (res_size == 0)
+-		{
+-		  res_size = l1 + 1 + l2 + 1;
+-		  res_ptr = malloc (res_size + 1);
+-		}
+-	      else
+-		{
+-		  res_size += l1 + 1 + l2 + 1;
+-		  res_ptr = realloc (res_ptr, res_size + 1);
+-		}
+-	      if (res_ptr == NULL)
+-		{
+-		  /* Out of memory. */
+-		  res_size = 0;
+-		  break;
+-		}
+-	      strcpy (res_ptr + res_size - (l2 + 1) - (l1 + 1), buf1);
+-	      strcpy (res_ptr + res_size - (l2 + 1), buf2);
+-	    }
+-	  fclose (fp);
+-	  if (res_size == 0)
+-	    cp = "";
+-	  else
+-	    {
+-	      *(res_ptr + res_size) = '\0';
+-	      cp = res_ptr;
+-	    }
+-	}
+-
+-      if (file_name != NULL)
+-	free (file_name);
+-
+-#else /* WIN32 */
+-
+-      /* To avoid the troubles of installing a separate file in the same
+-	 directory as the DLL and of retrieving the DLL's directory at
+-	 runtime, simply inline the aliases here.  */
+-
+-      cp = "CP936" "\0" "GBK" "\0"
+-	   "CP1361" "\0" "JOHAB" "\0";
+-#endif
+-
+-      charset_aliases = cp;
+-    }
+-
+-  return cp;
+-}
+-
+-/* Determine the current locale's character encoding, and canonicalize it
+-   into one of the canonical names listed in config.charset.
+-   The result must not be freed; it is statically allocated.
+-   If the canonical name cannot be determined, the result is a non-canonical
+-   name.  */
+-
+-#ifdef STATIC
+-STATIC
+-#endif
+-const char *
+-locale_charset ()
+-{
+-  const char *codeset;
+-  const char *aliases;
+-
+-#ifndef WIN32
+-
+-# if HAVE_LANGINFO_CODESET
+-
+-  /* Most systems support nl_langinfo (CODESET) nowadays.  */
+-  codeset = nl_langinfo (CODESET);
+-
+-# else
+-
+-  /* On old systems which lack it, use setlocale or getenv.  */
+-  const char *locale = NULL;
+-
+-  /* But most old systems don't have a complete set of locales.  Some
+-     (like SunOS 4 or DJGPP) have only the C locale.  Therefore we don't
+-     use setlocale here; it would return "C" when it doesn't support the
+-     locale name the user has set.  */
+-#  if HAVE_SETLOCALE && 0
+-  locale = setlocale (LC_CTYPE, NULL);
+-#  endif
+-  if (locale == NULL || locale[0] == '\0')
+-    {
+-      locale = getenv ("LC_ALL");
+-      if (locale == NULL || locale[0] == '\0')
+-	{
+-	  locale = getenv ("LC_CTYPE");
+-	  if (locale == NULL || locale[0] == '\0')
+-	    locale = getenv ("LANG");
+-	}
+-    }
+-
+-  /* On some old systems, one used to set locale = "iso8859_1". On others,
+-     you set it to "language_COUNTRY.charset". In any case, we resolve it
+-     through the charset.alias file.  */
+-  codeset = locale;
+-
+-# endif
+-
+-#else /* WIN32 */
+-
+-  static char buf[2 + 10 + 1];
+-
+-  /* Win32 has a function returning the locale's codepage as a number.  */
+-  sprintf (buf, "CP%u", GetACP ());
+-  codeset = buf;
+-
+-#endif
+-
+-  if (codeset == NULL)
+-    /* The canonical name cannot be determined.  */
+-    codeset = "";
+-
+-  /* Resolve alias. */
+-  for (aliases = get_charset_aliases ();
+-       *aliases != '\0';
+-       aliases += strlen (aliases) + 1, aliases += strlen (aliases) + 1)
+-    if (strcmp (codeset, aliases) == 0
+-	|| (aliases[0] == '*' && aliases[1] == '\0'))
+-      {
+-	codeset = aliases + strlen (aliases) + 1;
+-	break;
+-      }
+-
+-  return codeset;
+-}
+--- a/intl/locale.alias
++++ /dev/null
+@@ -1,78 +0,0 @@
+-# Locale name alias data base.
+-# Copyright (C) 1996,1997,1998,1999,2000,2001 Free Software Foundation, Inc.
+-#
+-# This program is free software; you can redistribute it and/or modify it
+-# under the terms of the GNU Library General Public License as published
+-# by the Free Software Foundation; either version 2, or (at your option)
+-# any later version.
+-#
+-# This program is distributed in the hope that it will be useful,
+-# but WITHOUT ANY WARRANTY; without even the implied warranty of
+-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-# Library General Public License for more details.
+-#
+-# You should have received a copy of the GNU Library General Public
+-# License along with this program; if not, write to the Free Software
+-# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-# USA.
+-
+-# The format of this file is the same as for the corresponding file of
+-# the X Window System, which normally can be found in
+-#	/usr/lib/X11/locale/locale.alias
+-# A single line contains two fields: an alias and a substitution value.
+-# All entries are case independent.
+-
+-# Note: This file is far from being complete.  If you have a value for
+-# your own site which you think might be useful for others too, share
+-# it with the rest of us.  Send it using the `glibcbug' script to
+-# bugs@gnu.org.
+-
+-# Packages using this file: 
+-
+-bokmal		no_NO.ISO-8859-1
+-bokmål		no_NO.ISO-8859-1
+-catalan		ca_ES.ISO-8859-1
+-croatian	hr_HR.ISO-8859-2
+-czech		cs_CZ.ISO-8859-2
+-danish          da_DK.ISO-8859-1
+-dansk		da_DK.ISO-8859-1
+-deutsch		de_DE.ISO-8859-1
+-dutch		nl_NL.ISO-8859-1
+-eesti		et_EE.ISO-8859-1
+-estonian	et_EE.ISO-8859-1
+-finnish         fi_FI.ISO-8859-1
+-français	fr_FR.ISO-8859-1
+-french		fr_FR.ISO-8859-1
+-galego		gl_ES.ISO-8859-1
+-galician	gl_ES.ISO-8859-1
+-german		de_DE.ISO-8859-1
+-greek           el_GR.ISO-8859-7
+-hebrew          he_IL.ISO-8859-8
+-hrvatski	hr_HR.ISO-8859-2
+-hungarian       hu_HU.ISO-8859-2
+-icelandic       is_IS.ISO-8859-1
+-italian         it_IT.ISO-8859-1
+-japanese	ja_JP.eucJP
+-japanese.euc	ja_JP.eucJP
+-ja_JP		ja_JP.eucJP
+-ja_JP.ujis	ja_JP.eucJP
+-japanese.sjis	ja_JP.SJIS
+-korean		ko_KR.eucKR
+-korean.euc 	ko_KR.eucKR
+-ko_KR		ko_KR.eucKR
+-lithuanian      lt_LT.ISO-8859-13
+-nb_NO		no_NO.ISO-8859-1
+-nb_NO.ISO-8859-1 no_NO.ISO-8859-1
+-norwegian       no_NO.ISO-8859-1
+-nynorsk		nn_NO.ISO-8859-1
+-polish          pl_PL.ISO-8859-2
+-portuguese      pt_PT.ISO-8859-1
+-romanian        ro_RO.ISO-8859-2
+-russian         ru_RU.ISO-8859-5
+-slovak          sk_SK.ISO-8859-2
+-slovene         sl_SI.ISO-8859-2
+-slovenian       sl_SI.ISO-8859-2
+-spanish         es_ES.ISO-8859-1
+-swedish         sv_SE.ISO-8859-1
+-thai		th_TH.TIS-620
+-turkish         tr_TR.ISO-8859-9
+--- a/intl/localealias.c
++++ /dev/null
+@@ -1,404 +0,0 @@
+-/* Handle aliases for locale names.
+-   Copyright (C) 1995-1999, 2000, 2001 Free Software Foundation, Inc.
+-
+-   This program is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU Library General Public License as published
+-   by the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Library General Public License for more details.
+-
+-   You should have received a copy of the GNU Library General Public
+-   License along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-   USA.  */
+-
+-/* Tell glibc's <string.h> to provide a prototype for mempcpy().
+-   This must come before <config.h> because <config.h> may include
+-   <features.h>, and once <features.h> has been included, it's too late.  */
+-#ifndef _GNU_SOURCE
+-# define _GNU_SOURCE    1
+-#endif
+-
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-#include <ctype.h>
+-#include <stdio.h>
+-#include <sys/types.h>
+-
+-#ifdef __GNUC__
+-# define alloca __builtin_alloca
+-# define HAVE_ALLOCA 1
+-#else
+-# if defined HAVE_ALLOCA_H || defined _LIBC
+-#  include <alloca.h>
+-# else
+-#  ifdef _AIX
+- #pragma alloca
+-#  else
+-#   ifndef alloca
+-char *alloca ();
+-#   endif
+-#  endif
+-# endif
+-#endif
+-
+-#include <stdlib.h>
+-
+-#include <string.h>
+-#if !HAVE_STRCHR && !defined _LIBC
+-# ifndef strchr
+-#  define strchr index
+-# endif
+-#endif
+-
+-#include "gettextP.h"
+-
+-/* @@ end of prolog @@ */
+-
+-#ifdef _LIBC
+-/* Rename the non ANSI C functions.  This is required by the standard
+-   because some ANSI C functions will require linking with this object
+-   file and the name space must not be polluted.  */
+-# define strcasecmp __strcasecmp
+-
+-# ifndef mempcpy
+-#  define mempcpy __mempcpy
+-# endif
+-# define HAVE_MEMPCPY	1
+-
+-/* We need locking here since we can be called from different places.  */
+-# include <bits/libc-lock.h>
+-
+-__libc_lock_define_initialized (static, lock);
+-#endif
+-
+-#ifndef internal_function
+-# define internal_function
+-#endif
+-
+-/* For those losing systems which don't have `alloca' we have to add
+-   some additional code emulating it.  */
+-#ifdef HAVE_ALLOCA
+-# define freea(p) /* nothing */
+-#else
+-# define alloca(n) malloc (n)
+-# define freea(p) free (p)
+-#endif
+-
+-#if defined _LIBC_REENTRANT || defined HAVE_FGETS_UNLOCKED
+-# undef fgets
+-# define fgets(buf, len, s) fgets_unlocked (buf, len, s)
+-#endif
+-#if defined _LIBC_REENTRANT || defined HAVE_FEOF_UNLOCKED
+-# undef feof
+-# define feof(s) feof_unlocked (s)
+-#endif
+-
+-
+-struct alias_map
+-{
+-  const char *alias;
+-  const char *value;
+-};
+-
+-
+-static char *string_space;
+-static size_t string_space_act;
+-static size_t string_space_max;
+-static struct alias_map *map;
+-static size_t nmap;
+-static size_t maxmap;
+-
+-
+-/* Prototypes for local functions.  */
+-static size_t read_alias_file PARAMS ((const char *fname, int fname_len))
+-     internal_function;
+-static int extend_alias_table PARAMS ((void));
+-static int alias_compare PARAMS ((const struct alias_map *map1,
+-				  const struct alias_map *map2));
+-
+-
+-const char *
+-_nl_expand_alias (name)
+-    const char *name;
+-{
+-  static const char *locale_alias_path = LOCALE_ALIAS_PATH;
+-  struct alias_map *retval;
+-  const char *result = NULL;
+-  size_t added;
+-
+-#ifdef _LIBC
+-  __libc_lock_lock (lock);
+-#endif
+-
+-  do
+-    {
+-      struct alias_map item;
+-
+-      item.alias = name;
+-
+-      if (nmap > 0)
+-	retval = (struct alias_map *) bsearch (&item, map, nmap,
+-					       sizeof (struct alias_map),
+-					       (int (*) PARAMS ((const void *,
+-								 const void *))
+-						) alias_compare);
+-      else
+-	retval = NULL;
+-
+-      /* We really found an alias.  Return the value.  */
+-      if (retval != NULL)
+-	{
+-	  result = retval->value;
+-	  break;
+-	}
+-
+-      /* Perhaps we can find another alias file.  */
+-      added = 0;
+-      while (added == 0 && locale_alias_path[0] != '\0')
+-	{
+-	  const char *start;
+-
+-	  while (locale_alias_path[0] == PATH_SEPARATOR)
+-	    ++locale_alias_path;
+-	  start = locale_alias_path;
+-
+-	  while (locale_alias_path[0] != '\0'
+-		 && locale_alias_path[0] != PATH_SEPARATOR)
+-	    ++locale_alias_path;
+-
+-	  if (start < locale_alias_path)
+-	    added = read_alias_file (start, locale_alias_path - start);
+-	}
+-    }
+-  while (added != 0);
+-
+-#ifdef _LIBC
+-  __libc_lock_unlock (lock);
+-#endif
+-
+-  return result;
+-}
+-
+-
+-static size_t
+-internal_function
+-read_alias_file (fname, fname_len)
+-     const char *fname;
+-     int fname_len;
+-{
+-  FILE *fp;
+-  char *full_fname;
+-  size_t added;
+-  static const char aliasfile[] = "/locale.alias";
+-
+-  full_fname = (char *) alloca (fname_len + sizeof aliasfile);
+-#ifdef HAVE_MEMPCPY
+-  mempcpy (mempcpy (full_fname, fname, fname_len),
+-	   aliasfile, sizeof aliasfile);
+-#else
+-  memcpy (full_fname, fname, fname_len);
+-  memcpy (&full_fname[fname_len], aliasfile, sizeof aliasfile);
+-#endif
+-
+-  fp = fopen (full_fname, "r");
+-  freea (full_fname);
+-  if (fp == NULL)
+-    return 0;
+-
+-  added = 0;
+-  while (!feof (fp))
+-    {
+-      /* It is a reasonable approach to use a fix buffer here because
+-	 a) we are only interested in the first two fields
+-	 b) these fields must be usable as file names and so must not
+-	    be that long
+-       */
+-      char buf[BUFSIZ];
+-      char *alias;
+-      char *value;
+-      char *cp;
+-
+-      if (fgets (buf, sizeof buf, fp) == NULL)
+-	/* EOF reached.  */
+-	break;
+-
+-      /* Possibly not the whole line fits into the buffer.  Ignore
+-	 the rest of the line.  */
+-      if (strchr (buf, '\n') == NULL)
+-	{
+-	  char altbuf[BUFSIZ];
+-	  do
+-	    if (fgets (altbuf, sizeof altbuf, fp) == NULL)
+-	      /* Make sure the inner loop will be left.  The outer loop
+-		 will exit at the `feof' test.  */
+-	      break;
+-	  while (strchr (altbuf, '\n') == NULL);
+-	}
+-
+-      cp = buf;
+-      /* Ignore leading white space.  */
+-      while (isspace (cp[0]))
+-	++cp;
+-
+-      /* A leading '#' signals a comment line.  */
+-      if (cp[0] != '\0' && cp[0] != '#')
+-	{
+-	  alias = cp++;
+-	  while (cp[0] != '\0' && !isspace (cp[0]))
+-	    ++cp;
+-	  /* Terminate alias name.  */
+-	  if (cp[0] != '\0')
+-	    *cp++ = '\0';
+-
+-	  /* Now look for the beginning of the value.  */
+-	  while (isspace (cp[0]))
+-	    ++cp;
+-
+-	  if (cp[0] != '\0')
+-	    {
+-	      size_t alias_len;
+-	      size_t value_len;
+-
+-	      value = cp++;
+-	      while (cp[0] != '\0' && !isspace (cp[0]))
+-		++cp;
+-	      /* Terminate value.  */
+-	      if (cp[0] == '\n')
+-		{
+-		  /* This has to be done to make the following test
+-		     for the end of line possible.  We are looking for
+-		     the terminating '\n' which do not overwrite here.  */
+-		  *cp++ = '\0';
+-		  *cp = '\n';
+-		}
+-	      else if (cp[0] != '\0')
+-		*cp++ = '\0';
+-
+-	      if (nmap >= maxmap)
+-		if (__builtin_expect (extend_alias_table (), 0))
+-		  return added;
+-
+-	      alias_len = strlen (alias) + 1;
+-	      value_len = strlen (value) + 1;
+-
+-	      if (string_space_act + alias_len + value_len > string_space_max)
+-		{
+-		  /* Increase size of memory pool.  */
+-		  size_t new_size = (string_space_max
+-				     + (alias_len + value_len > 1024
+-					? alias_len + value_len : 1024));
+-		  char *new_pool = (char *) realloc (string_space, new_size);
+-		  if (new_pool == NULL)
+-		    return added;
+-
+-		  if (__builtin_expect (string_space != new_pool, 0))
+-		    {
+-		      size_t i;
+-
+-		      for (i = 0; i < nmap; i++)
+-			{
+-			  map[i].alias += new_pool - string_space;
+-			  map[i].value += new_pool - string_space;
+-			}
+-		    }
+-
+-		  string_space = new_pool;
+-		  string_space_max = new_size;
+-		}
+-
+-	      map[nmap].alias = memcpy (&string_space[string_space_act],
+-					alias, alias_len);
+-	      string_space_act += alias_len;
+-
+-	      map[nmap].value = memcpy (&string_space[string_space_act],
+-					value, value_len);
+-	      string_space_act += value_len;
+-
+-	      ++nmap;
+-	      ++added;
+-	    }
+-	}
+-    }
+-
+-  /* Should we test for ferror()?  I think we have to silently ignore
+-     errors.  --drepper  */
+-  fclose (fp);
+-
+-  if (added > 0)
+-    qsort (map, nmap, sizeof (struct alias_map),
+-	   (int (*) PARAMS ((const void *, const void *))) alias_compare);
+-
+-  return added;
+-}
+-
+-
+-static int
+-extend_alias_table ()
+-{
+-  size_t new_size;
+-  struct alias_map *new_map;
+-
+-  new_size = maxmap == 0 ? 100 : 2 * maxmap;
+-  new_map = (struct alias_map *) realloc (map, (new_size
+-						* sizeof (struct alias_map)));
+-  if (new_map == NULL)
+-    /* Simply don't extend: we don't have any more core.  */
+-    return -1;
+-
+-  map = new_map;
+-  maxmap = new_size;
+-  return 0;
+-}
+-
+-
+-#ifdef _LIBC
+-static void __attribute__ ((unused))
+-free_mem (void)
+-{
+-  if (string_space != NULL)
+-    free (string_space);
+-  if (map != NULL)
+-    free (map);
+-}
+-text_set_element (__libc_subfreeres, free_mem);
+-#endif
+-
+-
+-static int
+-alias_compare (map1, map2)
+-     const struct alias_map *map1;
+-     const struct alias_map *map2;
+-{
+-#if defined _LIBC || defined HAVE_STRCASECMP
+-  return strcasecmp (map1->alias, map2->alias);
+-#else
+-  const unsigned char *p1 = (const unsigned char *) map1->alias;
+-  const unsigned char *p2 = (const unsigned char *) map2->alias;
+-  unsigned char c1, c2;
+-
+-  if (p1 == p2)
+-    return 0;
+-
+-  do
+-    {
+-      /* I know this seems to be odd but the tolower() function in
+-	 some systems libc cannot handle nonalpha characters.  */
+-      c1 = isupper (*p1) ? tolower (*p1) : *p1;
+-      c2 = isupper (*p2) ? tolower (*p2) : *p2;
+-      if (c1 == '\0')
+-	break;
+-      ++p1;
+-      ++p2;
+-    }
+-  while (c1 == c2);
+-
+-  return c1 - c2;
+-#endif
+-}
+--- a/intl/ngettext.c
++++ /dev/null
+@@ -1,68 +0,0 @@
+-/* Implementation of ngettext(3) function.
+-   Copyright (C) 1995, 1997, 2000, 2001 Free Software Foundation, Inc.
+-
+-   This program is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU Library General Public License as published
+-   by the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Library General Public License for more details.
+-
+-   You should have received a copy of the GNU Library General Public
+-   License along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-   USA.  */
+-
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-#ifdef _LIBC
+-# define __need_NULL
+-# include <stddef.h>
+-#else
+-# include <stdlib.h>		/* Just for NULL.  */
+-#endif
+-
+-#include "gettextP.h"
+-#ifdef _LIBC
+-# include <libintl.h>
+-#else
+-# include "libgnuintl.h"
+-#endif
+-
+-#include <locale.h>
+-
+-/* @@ end of prolog @@ */
+-
+-/* Names for the libintl functions are a problem.  They must not clash
+-   with existing names and they should follow ANSI C.  But this source
+-   code is also used in GNU C Library where the names have a __
+-   prefix.  So we have to make a difference here.  */
+-#ifdef _LIBC
+-# define NGETTEXT __ngettext
+-# define DCNGETTEXT __dcngettext
+-#else
+-# define NGETTEXT ngettext__
+-# define DCNGETTEXT dcngettext__
+-#endif
+-
+-/* Look up MSGID in the current default message catalog for the current
+-   LC_MESSAGES locale.  If not found, returns MSGID itself (the default
+-   text).  */
+-char *
+-NGETTEXT (msgid1, msgid2, n)
+-     const char *msgid1;
+-     const char *msgid2;
+-     unsigned long int n;
+-{
+-  return DCNGETTEXT (NULL, msgid1, msgid2, n, LC_MESSAGES);
+-}
+-
+-#ifdef _LIBC
+-/* Alias for function name in GNU C Library.  */
+-weak_alias (__ngettext, ngettext);
+-#endif
+--- a/intl/plural.c
++++ /dev/null
+@@ -1,1326 +0,0 @@
+-
+-/*  A Bison parser, made from plural.y
+-    by GNU Bison version 1.28  */
+-
+-#define YYBISON 1  /* Identify Bison output.  */
+-
+-#define yyparse __gettextparse
+-#define yylex __gettextlex
+-#define yyerror __gettexterror
+-#define yylval __gettextlval
+-#define yychar __gettextchar
+-#define yydebug __gettextdebug
+-#define yynerrs __gettextnerrs
+-#define	EQUOP2	257
+-#define	CMPOP2	258
+-#define	ADDOP2	259
+-#define	MULOP2	260
+-#define	NUMBER	261
+-
+-#line 1 "plural.y"
+-
+-/* Expression parsing for plural form selection.
+-   Copyright (C) 2000, 2001 Free Software Foundation, Inc.
+-   Written by Ulrich Drepper <drepper@cygnus.com>, 2000.
+-
+-   This program is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU Library General Public License as published
+-   by the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Library General Public License for more details.
+-
+-   You should have received a copy of the GNU Library General Public
+-   License along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-   USA.  */
+-
+-/* The bison generated parser uses alloca.  AIX 3 forces us to put this
+-   declaration at the beginning of the file.  The declaration in bison's
+-   skeleton file comes too late.  This must come before <config.h>
+-   because <config.h> may include arbitrary system headers.  */
+-#if defined _AIX && !defined __GNUC__
+- #pragma alloca
+-#endif
+-
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-#include <stdlib.h>
+-#include "gettextP.h"
+-
+-/* Names for the libintl functions are a problem.  They must not clash
+-   with existing names and they should follow ANSI C.  But this source
+-   code is also used in GNU C Library where the names have a __
+-   prefix.  So we have to make a difference here.  */
+-#ifdef _LIBC
+-# define FREE_EXPRESSION __gettext_free_exp
+-#else
+-# define FREE_EXPRESSION gettext_free_exp__
+-# define __gettextparse gettextparse__
+-#endif
+-
+-#define YYLEX_PARAM	&((struct parse_args *) arg)->cp
+-#define YYPARSE_PARAM	arg
+-
+-#line 53 "plural.y"
+-typedef union {
+-  unsigned long int num;
+-  enum operator op;
+-  struct expression *exp;
+-} YYSTYPE;
+-#line 59 "plural.y"
+-
+-/* Prototypes for local functions.  */
+-static struct expression *new_exp PARAMS ((int nargs, enum operator op,
+-					   struct expression * const *args));
+-static inline struct expression *new_exp_0 PARAMS ((enum operator op));
+-static inline struct expression *new_exp_1 PARAMS ((enum operator op,
+-						   struct expression *right));
+-static struct expression *new_exp_2 PARAMS ((enum operator op,
+-					     struct expression *left,
+-					     struct expression *right));
+-static inline struct expression *new_exp_3 PARAMS ((enum operator op,
+-						   struct expression *bexp,
+-						   struct expression *tbranch,
+-						   struct expression *fbranch));
+-static int yylex PARAMS ((YYSTYPE *lval, const char **pexp));
+-static void yyerror PARAMS ((const char *str));
+-
+-/* Allocation of expressions.  */
+-
+-static struct expression *
+-new_exp (nargs, op, args)
+-     int nargs;
+-     enum operator op;
+-     struct expression * const *args;
+-{
+-  int i;
+-  struct expression *newp;
+-
+-  /* If any of the argument could not be malloc'ed, just return NULL.  */
+-  for (i = nargs - 1; i >= 0; i--)
+-    if (args[i] == NULL)
+-      goto fail;
+-
+-  /* Allocate a new expression.  */
+-  newp = (struct expression *) malloc (sizeof (*newp));
+-  if (newp != NULL)
+-    {
+-      newp->nargs = nargs;
+-      newp->operation = op;
+-      for (i = nargs - 1; i >= 0; i--)
+-	newp->val.args[i] = args[i];
+-      return newp;
+-    }
+-
+- fail:
+-  for (i = nargs - 1; i >= 0; i--)
+-    FREE_EXPRESSION (args[i]);
+-
+-  return NULL;
+-}
+-
+-static inline struct expression *
+-new_exp_0 (op)
+-     enum operator op;
+-{
+-  return new_exp (0, op, NULL);
+-}
+-
+-static inline struct expression *
+-new_exp_1 (op, right)
+-     enum operator op;
+-     struct expression *right;
+-{
+-  struct expression *args[1];
+-
+-  args[0] = right;
+-  return new_exp (1, op, args);
+-}
+-
+-static struct expression *
+-new_exp_2 (op, left, right)
+-     enum operator op;
+-     struct expression *left;
+-     struct expression *right;
+-{
+-  struct expression *args[2];
+-
+-  args[0] = left;
+-  args[1] = right;
+-  return new_exp (2, op, args);
+-}
+-
+-static inline struct expression *
+-new_exp_3 (op, bexp, tbranch, fbranch)
+-     enum operator op;
+-     struct expression *bexp;
+-     struct expression *tbranch;
+-     struct expression *fbranch;
+-{
+-  struct expression *args[3];
+-
+-  args[0] = bexp;
+-  args[1] = tbranch;
+-  args[2] = fbranch;
+-  return new_exp (3, op, args);
+-}
+-
+-#include <stdio.h>
+-
+-#ifndef __cplusplus
+-#ifndef __STDC__
+-#define const
+-#endif
+-#endif
+-
+-
+-
+-#define	YYFINAL		27
+-#define	YYFLAG		-32768
+-#define	YYNTBASE	16
+-
+-#define YYTRANSLATE(x) ((unsigned)(x) <= 261 ? yytranslate[x] : 18)
+-
+-static const char yytranslate[] = {     0,
+-     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-     2,     2,    10,     2,     2,     2,     2,     5,     2,    14,
+-    15,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-     2,     2,     2,     2,     2,     2,     2,    12,     2,     2,
+-     2,     2,     3,     2,     2,     2,     2,     2,     2,     2,
+-     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-     2,     2,     2,     2,     2,     2,     2,     2,     2,    13,
+-     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-     2,     2,     2,     4,     2,     2,     2,     2,     2,     2,
+-     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-     2,     2,     2,     2,     2,     1,     6,     7,     8,     9,
+-    11
+-};
+-
+-#if YYDEBUG != 0
+-static const short yyprhs[] = {     0,
+-     0,     2,     8,    12,    16,    20,    24,    28,    32,    35,
+-    37,    39
+-};
+-
+-static const short yyrhs[] = {    17,
+-     0,    17,     3,    17,    12,    17,     0,    17,     4,    17,
+-     0,    17,     5,    17,     0,    17,     6,    17,     0,    17,
+-     7,    17,     0,    17,     8,    17,     0,    17,     9,    17,
+-     0,    10,    17,     0,    13,     0,    11,     0,    14,    17,
+-    15,     0
+-};
+-
+-#endif
+-
+-#if YYDEBUG != 0
+-static const short yyrline[] = { 0,
+-   178,   186,   190,   194,   198,   202,   206,   210,   214,   218,
+-   222,   227
+-};
+-#endif
+-
+-
+-#if YYDEBUG != 0 || defined (YYERROR_VERBOSE)
+-
+-static const char * const yytname[] = {   "$","error","$undefined.","'?'","'|'",
+-"'&'","EQUOP2","CMPOP2","ADDOP2","MULOP2","'!'","NUMBER","':'","'n'","'('","')'",
+-"start","exp", NULL
+-};
+-#endif
+-
+-static const short yyr1[] = {     0,
+-    16,    17,    17,    17,    17,    17,    17,    17,    17,    17,
+-    17,    17
+-};
+-
+-static const short yyr2[] = {     0,
+-     1,     5,     3,     3,     3,     3,     3,     3,     2,     1,
+-     1,     3
+-};
+-
+-static const short yydefact[] = {     0,
+-     0,    11,    10,     0,     1,     9,     0,     0,     0,     0,
+-     0,     0,     0,     0,    12,     0,     3,     4,     5,     6,
+-     7,     8,     0,     2,     0,     0,     0
+-};
+-
+-static const short yydefgoto[] = {    25,
+-     5
+-};
+-
+-static const short yypact[] = {    -9,
+-    -9,-32768,-32768,    -9,    34,-32768,    11,    -9,    -9,    -9,
+-    -9,    -9,    -9,    -9,-32768,    24,    39,    43,    16,    26,
+-    -3,-32768,    -9,    34,    21,    53,-32768
+-};
+-
+-static const short yypgoto[] = {-32768,
+-    -1
+-};
+-
+-
+-#define	YYLAST		53
+-
+-
+-static const short yytable[] = {     6,
+-     1,     2,     7,     3,     4,    14,    16,    17,    18,    19,
+-    20,    21,    22,     8,     9,    10,    11,    12,    13,    14,
+-    26,    24,    12,    13,    14,    15,     8,     9,    10,    11,
+-    12,    13,    14,    13,    14,    23,     8,     9,    10,    11,
+-    12,    13,    14,    10,    11,    12,    13,    14,    11,    12,
+-    13,    14,    27
+-};
+-
+-static const short yycheck[] = {     1,
+-    10,    11,     4,    13,    14,     9,     8,     9,    10,    11,
+-    12,    13,    14,     3,     4,     5,     6,     7,     8,     9,
+-     0,    23,     7,     8,     9,    15,     3,     4,     5,     6,
+-     7,     8,     9,     8,     9,    12,     3,     4,     5,     6,
+-     7,     8,     9,     5,     6,     7,     8,     9,     6,     7,
+-     8,     9,     0
+-};
+-#define YYPURE 1
+-
+-/* -*-C-*-  Note some compilers choke on comments on `#line' lines.  */
+-#line 3 "/home/haible/gnu/arch/linuxlibc6/share/bison.simple"
+-/* This file comes from bison-1.28.  */
+-
+-/* Skeleton output parser for bison,
+-   Copyright (C) 1984, 1989, 1990 Free Software Foundation, Inc.
+-
+-   This program is free software; you can redistribute it and/or modify
+-   it under the terms of the GNU General Public License as published by
+-   the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-   GNU General Public License for more details.
+-
+-   You should have received a copy of the GNU General Public License
+-   along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330,
+-   Boston, MA 02111-1307, USA.  */
+-
+-/* As a special exception, when this file is copied by Bison into a
+-   Bison output file, you may use that output file without restriction.
+-   This special exception was added by the Free Software Foundation
+-   in version 1.24 of Bison.  */
+-
+-/* This is the parser code that is written into each bison parser
+-  when the %semantic_parser declaration is not specified in the grammar.
+-  It was written by Richard Stallman by simplifying the hairy parser
+-  used when %semantic_parser is specified.  */
+-
+-#ifndef YYSTACK_USE_ALLOCA
+-#ifdef alloca
+-#define YYSTACK_USE_ALLOCA
+-#else /* alloca not defined */
+-#ifdef __GNUC__
+-#define YYSTACK_USE_ALLOCA
+-#define alloca __builtin_alloca
+-#else /* not GNU C.  */
+-#if (!defined (__STDC__) && defined (sparc)) || defined (__sparc__) || defined (__sparc) || defined (__sgi) || (defined (__sun) && defined (__i386))
+-#define YYSTACK_USE_ALLOCA
+-#include <alloca.h>
+-#else /* not sparc */
+-/* We think this test detects Watcom and Microsoft C.  */
+-/* This used to test MSDOS, but that is a bad idea
+-   since that symbol is in the user namespace.  */
+-#if (defined (_MSDOS) || defined (_MSDOS_)) && !defined (__TURBOC__)
+-#if 0 /* No need for malloc.h, which pollutes the namespace;
+-	 instead, just don't use alloca.  */
+-#include <malloc.h>
+-#endif
+-#else /* not MSDOS, or __TURBOC__ */
+-#if defined(_AIX)
+-/* I don't know what this was needed for, but it pollutes the namespace.
+-   So I turned it off.   rms, 2 May 1997.  */
+-/* #include <malloc.h>  */
+- #pragma alloca
+-#define YYSTACK_USE_ALLOCA
+-#else /* not MSDOS, or __TURBOC__, or _AIX */
+-#if 0
+-#ifdef __hpux /* haible@ilog.fr says this works for HPUX 9.05 and up,
+-		 and on HPUX 10.  Eventually we can turn this on.  */
+-#define YYSTACK_USE_ALLOCA
+-#define alloca __builtin_alloca
+-#endif /* __hpux */
+-#endif
+-#endif /* not _AIX */
+-#endif /* not MSDOS, or __TURBOC__ */
+-#endif /* not sparc */
+-#endif /* not GNU C */
+-#endif /* alloca not defined */
+-#endif /* YYSTACK_USE_ALLOCA not defined */
+-
+-#ifdef YYSTACK_USE_ALLOCA
+-#define YYSTACK_ALLOC alloca
+-#else
+-#define YYSTACK_ALLOC malloc
+-#endif
+-
+-/* Note: there must be only one dollar sign in this file.
+-   It is replaced by the list of actions, each action
+-   as one case of the switch.  */
+-
+-#define yyerrok		(yyerrstatus = 0)
+-#define yyclearin	(yychar = YYEMPTY)
+-#define YYEMPTY		-2
+-#define YYEOF		0
+-#define YYACCEPT	goto yyacceptlab
+-#define YYABORT 	goto yyabortlab
+-#define YYERROR		goto yyerrlab1
+-/* Like YYERROR except do call yyerror.
+-   This remains here temporarily to ease the
+-   transition to the new meaning of YYERROR, for GCC.
+-   Once GCC version 2 has supplanted version 1, this can go.  */
+-#define YYFAIL		goto yyerrlab
+-#define YYRECOVERING()  (!!yyerrstatus)
+-#define YYBACKUP(token, value) \
+-do								\
+-  if (yychar == YYEMPTY && yylen == 1)				\
+-    { yychar = (token), yylval = (value);			\
+-      yychar1 = YYTRANSLATE (yychar);				\
+-      YYPOPSTACK;						\
+-      goto yybackup;						\
+-    }								\
+-  else								\
+-    { yyerror ("syntax error: cannot back up"); YYERROR; }	\
+-while (0)
+-
+-#define YYTERROR	1
+-#define YYERRCODE	256
+-
+-#ifndef YYPURE
+-#define YYLEX		yylex()
+-#endif
+-
+-#ifdef YYPURE
+-#ifdef YYLSP_NEEDED
+-#ifdef YYLEX_PARAM
+-#define YYLEX		yylex(&yylval, &yylloc, YYLEX_PARAM)
+-#else
+-#define YYLEX		yylex(&yylval, &yylloc)
+-#endif
+-#else /* not YYLSP_NEEDED */
+-#ifdef YYLEX_PARAM
+-#define YYLEX		yylex(&yylval, YYLEX_PARAM)
+-#else
+-#define YYLEX		yylex(&yylval)
+-#endif
+-#endif /* not YYLSP_NEEDED */
+-#endif
+-
+-/* If nonreentrant, generate the variables here */
+-
+-#ifndef YYPURE
+-
+-int	yychar;			/*  the lookahead symbol		*/
+-YYSTYPE	yylval;			/*  the semantic value of the		*/
+-				/*  lookahead symbol			*/
+-
+-#ifdef YYLSP_NEEDED
+-YYLTYPE yylloc;			/*  location data for the lookahead	*/
+-				/*  symbol				*/
+-#endif
+-
+-int yynerrs;			/*  number of parse errors so far       */
+-#endif  /* not YYPURE */
+-
+-#if YYDEBUG != 0
+-int yydebug;			/*  nonzero means print parse trace	*/
+-/* Since this is uninitialized, it does not stop multiple parsers
+-   from coexisting.  */
+-#endif
+-
+-/*  YYINITDEPTH indicates the initial size of the parser's stacks	*/
+-
+-#ifndef	YYINITDEPTH
+-#define YYINITDEPTH 200
+-#endif
+-
+-/*  YYMAXDEPTH is the maximum size the stacks can grow to
+-    (effective only if the built-in stack extension method is used).  */
+-
+-#if YYMAXDEPTH == 0
+-#undef YYMAXDEPTH
+-#endif
+-
+-#ifndef YYMAXDEPTH
+-#define YYMAXDEPTH 10000
+-#endif
+-
+-/* Define __yy_memcpy.  Note that the size argument
+-   should be passed with type unsigned int, because that is what the non-GCC
+-   definitions require.  With GCC, __builtin_memcpy takes an arg
+-   of type size_t, but it can handle unsigned int.  */
+-
+-#if __GNUC__ > 1		/* GNU C and GNU C++ define this.  */
+-#define __yy_memcpy(TO,FROM,COUNT)	__builtin_memcpy(TO,FROM,COUNT)
+-#else				/* not GNU C or C++ */
+-#ifndef __cplusplus
+-
+-/* This is the most reliable way to avoid incompatibilities
+-   in available built-in functions on various systems.  */
+-static void
+-__yy_memcpy (to, from, count)
+-     char *to;
+-     char *from;
+-     unsigned int count;
+-{
+-  register char *f = from;
+-  register char *t = to;
+-  register int i = count;
+-
+-  while (i-- > 0)
+-    *t++ = *f++;
+-}
+-
+-#else /* __cplusplus */
+-
+-/* This is the most reliable way to avoid incompatibilities
+-   in available built-in functions on various systems.  */
+-static void
+-__yy_memcpy (char *to, char *from, unsigned int count)
+-{
+-  register char *t = to;
+-  register char *f = from;
+-  register int i = count;
+-
+-  while (i-- > 0)
+-    *t++ = *f++;
+-}
+-
+-#endif
+-#endif
+-
+-#line 217 "/home/haible/gnu/arch/linuxlibc6/share/bison.simple"
+-
+-/* The user can define YYPARSE_PARAM as the name of an argument to be passed
+-   into yyparse.  The argument should have type void *.
+-   It should actually point to an object.
+-   Grammar actions can access the variable by casting it
+-   to the proper pointer type.  */
+-
+-#ifdef YYPARSE_PARAM
+-#ifdef __cplusplus
+-#define YYPARSE_PARAM_ARG void *YYPARSE_PARAM
+-#define YYPARSE_PARAM_DECL
+-#else /* not __cplusplus */
+-#define YYPARSE_PARAM_ARG YYPARSE_PARAM
+-#define YYPARSE_PARAM_DECL void *YYPARSE_PARAM;
+-#endif /* not __cplusplus */
+-#else /* not YYPARSE_PARAM */
+-#define YYPARSE_PARAM_ARG
+-#define YYPARSE_PARAM_DECL
+-#endif /* not YYPARSE_PARAM */
+-
+-/* Prevent warning if -Wstrict-prototypes.  */
+-#ifdef __GNUC__
+-#ifdef YYPARSE_PARAM
+-int yyparse (void *);
+-#else
+-int yyparse (void);
+-#endif
+-#endif
+-
+-int
+-yyparse(YYPARSE_PARAM_ARG)
+-     YYPARSE_PARAM_DECL
+-{
+-  register int yystate;
+-  register int yyn;
+-  register short *yyssp;
+-  register YYSTYPE *yyvsp;
+-  int yyerrstatus;	/*  number of tokens to shift before error messages enabled */
+-  int yychar1 = 0;		/*  lookahead token as an internal (translated) token number */
+-
+-  short	yyssa[YYINITDEPTH];	/*  the state stack			*/
+-  YYSTYPE yyvsa[YYINITDEPTH];	/*  the semantic value stack		*/
+-
+-  short *yyss = yyssa;		/*  refer to the stacks thru separate pointers */
+-  YYSTYPE *yyvs = yyvsa;	/*  to allow yyoverflow to reallocate them elsewhere */
+-
+-#ifdef YYLSP_NEEDED
+-  YYLTYPE yylsa[YYINITDEPTH];	/*  the location stack			*/
+-  YYLTYPE *yyls = yylsa;
+-  YYLTYPE *yylsp;
+-
+-#define YYPOPSTACK   (yyvsp--, yyssp--, yylsp--)
+-#else
+-#define YYPOPSTACK   (yyvsp--, yyssp--)
+-#endif
+-
+-  int yystacksize = YYINITDEPTH;
+-  int yyfree_stacks = 0;
+-
+-#ifdef YYPURE
+-  int yychar;
+-  YYSTYPE yylval;
+-  int yynerrs;
+-#ifdef YYLSP_NEEDED
+-  YYLTYPE yylloc;
+-#endif
+-#endif
+-
+-  YYSTYPE yyval;		/*  the variable used to return		*/
+-				/*  semantic values from the action	*/
+-				/*  routines				*/
+-
+-  int yylen;
+-
+-#if YYDEBUG != 0
+-  if (yydebug)
+-    fprintf(stderr, "Starting parse\n");
+-#endif
+-
+-  yystate = 0;
+-  yyerrstatus = 0;
+-  yynerrs = 0;
+-  yychar = YYEMPTY;		/* Cause a token to be read.  */
+-
+-  /* Initialize stack pointers.
+-     Waste one element of value and location stack
+-     so that they stay on the same level as the state stack.
+-     The wasted elements are never initialized.  */
+-
+-  yyssp = yyss - 1;
+-  yyvsp = yyvs;
+-#ifdef YYLSP_NEEDED
+-  yylsp = yyls;
+-#endif
+-
+-/* Push a new state, which is found in  yystate  .  */
+-/* In all cases, when you get here, the value and location stacks
+-   have just been pushed. so pushing a state here evens the stacks.  */
+-yynewstate:
+-
+-  *++yyssp = yystate;
+-
+-  if (yyssp >= yyss + yystacksize - 1)
+-    {
+-      /* Give user a chance to reallocate the stack */
+-      /* Use copies of these so that the &'s don't force the real ones into memory. */
+-      YYSTYPE *yyvs1 = yyvs;
+-      short *yyss1 = yyss;
+-#ifdef YYLSP_NEEDED
+-      YYLTYPE *yyls1 = yyls;
+-#endif
+-
+-      /* Get the current used size of the three stacks, in elements.  */
+-      int size = yyssp - yyss + 1;
+-
+-#ifdef yyoverflow
+-      /* Each stack pointer address is followed by the size of
+-	 the data in use in that stack, in bytes.  */
+-#ifdef YYLSP_NEEDED
+-      /* This used to be a conditional around just the two extra args,
+-	 but that might be undefined if yyoverflow is a macro.  */
+-      yyoverflow("parser stack overflow",
+-		 &yyss1, size * sizeof (*yyssp),
+-		 &yyvs1, size * sizeof (*yyvsp),
+-		 &yyls1, size * sizeof (*yylsp),
+-		 &yystacksize);
+-#else
+-      yyoverflow("parser stack overflow",
+-		 &yyss1, size * sizeof (*yyssp),
+-		 &yyvs1, size * sizeof (*yyvsp),
+-		 &yystacksize);
+-#endif
+-
+-      yyss = yyss1; yyvs = yyvs1;
+-#ifdef YYLSP_NEEDED
+-      yyls = yyls1;
+-#endif
+-#else /* no yyoverflow */
+-      /* Extend the stack our own way.  */
+-      if (yystacksize >= YYMAXDEPTH)
+-	{
+-	  yyerror("parser stack overflow");
+-	  if (yyfree_stacks)
+-	    {
+-	      free (yyss);
+-	      free (yyvs);
+-#ifdef YYLSP_NEEDED
+-	      free (yyls);
+-#endif
+-	    }
+-	  return 2;
+-	}
+-      yystacksize *= 2;
+-      if (yystacksize > YYMAXDEPTH)
+-	yystacksize = YYMAXDEPTH;
+-#ifndef YYSTACK_USE_ALLOCA
+-      yyfree_stacks = 1;
+-#endif
+-      yyss = (short *) YYSTACK_ALLOC (yystacksize * sizeof (*yyssp));
+-      __yy_memcpy ((char *)yyss, (char *)yyss1,
+-		   size * (unsigned int) sizeof (*yyssp));
+-      yyvs = (YYSTYPE *) YYSTACK_ALLOC (yystacksize * sizeof (*yyvsp));
+-      __yy_memcpy ((char *)yyvs, (char *)yyvs1,
+-		   size * (unsigned int) sizeof (*yyvsp));
+-#ifdef YYLSP_NEEDED
+-      yyls = (YYLTYPE *) YYSTACK_ALLOC (yystacksize * sizeof (*yylsp));
+-      __yy_memcpy ((char *)yyls, (char *)yyls1,
+-		   size * (unsigned int) sizeof (*yylsp));
+-#endif
+-#endif /* no yyoverflow */
+-
+-      yyssp = yyss + size - 1;
+-      yyvsp = yyvs + size - 1;
+-#ifdef YYLSP_NEEDED
+-      yylsp = yyls + size - 1;
+-#endif
+-
+-#if YYDEBUG != 0
+-      if (yydebug)
+-	fprintf(stderr, "Stack size increased to %d\n", yystacksize);
+-#endif
+-
+-      if (yyssp >= yyss + yystacksize - 1)
+-	YYABORT;
+-    }
+-
+-#if YYDEBUG != 0
+-  if (yydebug)
+-    fprintf(stderr, "Entering state %d\n", yystate);
+-#endif
+-
+-  goto yybackup;
+- yybackup:
+-
+-/* Do appropriate processing given the current state.  */
+-/* Read a lookahead token if we need one and don't already have one.  */
+-/* yyresume: */
+-
+-  /* First try to decide what to do without reference to lookahead token.  */
+-
+-  yyn = yypact[yystate];
+-  if (yyn == YYFLAG)
+-    goto yydefault;
+-
+-  /* Not known => get a lookahead token if don't already have one.  */
+-
+-  /* yychar is either YYEMPTY or YYEOF
+-     or a valid token in external form.  */
+-
+-  if (yychar == YYEMPTY)
+-    {
+-#if YYDEBUG != 0
+-      if (yydebug)
+-	fprintf(stderr, "Reading a token: ");
+-#endif
+-      yychar = YYLEX;
+-    }
+-
+-  /* Convert token to internal form (in yychar1) for indexing tables with */
+-
+-  if (yychar <= 0)		/* This means end of input. */
+-    {
+-      yychar1 = 0;
+-      yychar = YYEOF;		/* Don't call YYLEX any more */
+-
+-#if YYDEBUG != 0
+-      if (yydebug)
+-	fprintf(stderr, "Now at end of input.\n");
+-#endif
+-    }
+-  else
+-    {
+-      yychar1 = YYTRANSLATE(yychar);
+-
+-#if YYDEBUG != 0
+-      if (yydebug)
+-	{
+-	  fprintf (stderr, "Next token is %d (%s", yychar, yytname[yychar1]);
+-	  /* Give the individual parser a way to print the precise meaning
+-	     of a token, for further debugging info.  */
+-#ifdef YYPRINT
+-	  YYPRINT (stderr, yychar, yylval);
+-#endif
+-	  fprintf (stderr, ")\n");
+-	}
+-#endif
+-    }
+-
+-  yyn += yychar1;
+-  if (yyn < 0 || yyn > YYLAST || yycheck[yyn] != yychar1)
+-    goto yydefault;
+-
+-  yyn = yytable[yyn];
+-
+-  /* yyn is what to do for this token type in this state.
+-     Negative => reduce, -yyn is rule number.
+-     Positive => shift, yyn is new state.
+-       New state is final state => don't bother to shift,
+-       just return success.
+-     0, or most negative number => error.  */
+-
+-  if (yyn < 0)
+-    {
+-      if (yyn == YYFLAG)
+-	goto yyerrlab;
+-      yyn = -yyn;
+-      goto yyreduce;
+-    }
+-  else if (yyn == 0)
+-    goto yyerrlab;
+-
+-  if (yyn == YYFINAL)
+-    YYACCEPT;
+-
+-  /* Shift the lookahead token.  */
+-
+-#if YYDEBUG != 0
+-  if (yydebug)
+-    fprintf(stderr, "Shifting token %d (%s), ", yychar, yytname[yychar1]);
+-#endif
+-
+-  /* Discard the token being shifted unless it is eof.  */
+-  if (yychar != YYEOF)
+-    yychar = YYEMPTY;
+-
+-  *++yyvsp = yylval;
+-#ifdef YYLSP_NEEDED
+-  *++yylsp = yylloc;
+-#endif
+-
+-  /* count tokens shifted since error; after three, turn off error status.  */
+-  if (yyerrstatus) yyerrstatus--;
+-
+-  yystate = yyn;
+-  goto yynewstate;
+-
+-/* Do the default action for the current state.  */
+-yydefault:
+-
+-  yyn = yydefact[yystate];
+-  if (yyn == 0)
+-    goto yyerrlab;
+-
+-/* Do a reduction.  yyn is the number of a rule to reduce with.  */
+-yyreduce:
+-  yylen = yyr2[yyn];
+-  if (yylen > 0)
+-    yyval = yyvsp[1-yylen]; /* implement default value of the action */
+-
+-#if YYDEBUG != 0
+-  if (yydebug)
+-    {
+-      int i;
+-
+-      fprintf (stderr, "Reducing via rule %d (line %d), ",
+-	       yyn, yyrline[yyn]);
+-
+-      /* Print the symbols being reduced, and their result.  */
+-      for (i = yyprhs[yyn]; yyrhs[i] > 0; i++)
+-	fprintf (stderr, "%s ", yytname[yyrhs[i]]);
+-      fprintf (stderr, " -> %s\n", yytname[yyr1[yyn]]);
+-    }
+-#endif
+-
+-
+-  switch (yyn) {
+-
+-case 1:
+-#line 179 "plural.y"
+-{
+-	    if (yyvsp[0].exp == NULL)
+-	      YYABORT;
+-	    ((struct parse_args *) arg)->res = yyvsp[0].exp;
+-	  ;
+-    break;}
+-case 2:
+-#line 187 "plural.y"
+-{
+-	    yyval.exp = new_exp_3 (qmop, yyvsp[-4].exp, yyvsp[-2].exp, yyvsp[0].exp);
+-	  ;
+-    break;}
+-case 3:
+-#line 191 "plural.y"
+-{
+-	    yyval.exp = new_exp_2 (lor, yyvsp[-2].exp, yyvsp[0].exp);
+-	  ;
+-    break;}
+-case 4:
+-#line 195 "plural.y"
+-{
+-	    yyval.exp = new_exp_2 (land, yyvsp[-2].exp, yyvsp[0].exp);
+-	  ;
+-    break;}
+-case 5:
+-#line 199 "plural.y"
+-{
+-	    yyval.exp = new_exp_2 (yyvsp[-1].op, yyvsp[-2].exp, yyvsp[0].exp);
+-	  ;
+-    break;}
+-case 6:
+-#line 203 "plural.y"
+-{
+-	    yyval.exp = new_exp_2 (yyvsp[-1].op, yyvsp[-2].exp, yyvsp[0].exp);
+-	  ;
+-    break;}
+-case 7:
+-#line 207 "plural.y"
+-{
+-	    yyval.exp = new_exp_2 (yyvsp[-1].op, yyvsp[-2].exp, yyvsp[0].exp);
+-	  ;
+-    break;}
+-case 8:
+-#line 211 "plural.y"
+-{
+-	    yyval.exp = new_exp_2 (yyvsp[-1].op, yyvsp[-2].exp, yyvsp[0].exp);
+-	  ;
+-    break;}
+-case 9:
+-#line 215 "plural.y"
+-{
+-	    yyval.exp = new_exp_1 (lnot, yyvsp[0].exp);
+-	  ;
+-    break;}
+-case 10:
+-#line 219 "plural.y"
+-{
+-	    yyval.exp = new_exp_0 (var);
+-	  ;
+-    break;}
+-case 11:
+-#line 223 "plural.y"
+-{
+-	    if ((yyval.exp = new_exp_0 (num)) != NULL)
+-	      yyval.exp->val.num = yyvsp[0].num;
+-	  ;
+-    break;}
+-case 12:
+-#line 228 "plural.y"
+-{
+-	    yyval.exp = yyvsp[-1].exp;
+-	  ;
+-    break;}
+-}
+-   /* the action file gets copied in in place of this dollarsign */
+-#line 543 "/home/haible/gnu/arch/linuxlibc6/share/bison.simple"
+-
+-  yyvsp -= yylen;
+-  yyssp -= yylen;
+-#ifdef YYLSP_NEEDED
+-  yylsp -= yylen;
+-#endif
+-
+-#if YYDEBUG != 0
+-  if (yydebug)
+-    {
+-      short *ssp1 = yyss - 1;
+-      fprintf (stderr, "state stack now");
+-      while (ssp1 != yyssp)
+-	fprintf (stderr, " %d", *++ssp1);
+-      fprintf (stderr, "\n");
+-    }
+-#endif
+-
+-  *++yyvsp = yyval;
+-
+-#ifdef YYLSP_NEEDED
+-  yylsp++;
+-  if (yylen == 0)
+-    {
+-      yylsp->first_line = yylloc.first_line;
+-      yylsp->first_column = yylloc.first_column;
+-      yylsp->last_line = (yylsp-1)->last_line;
+-      yylsp->last_column = (yylsp-1)->last_column;
+-      yylsp->text = 0;
+-    }
+-  else
+-    {
+-      yylsp->last_line = (yylsp+yylen-1)->last_line;
+-      yylsp->last_column = (yylsp+yylen-1)->last_column;
+-    }
+-#endif
+-
+-  /* Now "shift" the result of the reduction.
+-     Determine what state that goes to,
+-     based on the state we popped back to
+-     and the rule number reduced by.  */
+-
+-  yyn = yyr1[yyn];
+-
+-  yystate = yypgoto[yyn - YYNTBASE] + *yyssp;
+-  if (yystate >= 0 && yystate <= YYLAST && yycheck[yystate] == *yyssp)
+-    yystate = yytable[yystate];
+-  else
+-    yystate = yydefgoto[yyn - YYNTBASE];
+-
+-  goto yynewstate;
+-
+-yyerrlab:   /* here on detecting error */
+-
+-  if (! yyerrstatus)
+-    /* If not already recovering from an error, report this error.  */
+-    {
+-      ++yynerrs;
+-
+-#ifdef YYERROR_VERBOSE
+-      yyn = yypact[yystate];
+-
+-      if (yyn > YYFLAG && yyn < YYLAST)
+-	{
+-	  int size = 0;
+-	  char *msg;
+-	  int x, count;
+-
+-	  count = 0;
+-	  /* Start X at -yyn if nec to avoid negative indexes in yycheck.  */
+-	  for (x = (yyn < 0 ? -yyn : 0);
+-	       x < (sizeof(yytname) / sizeof(char *)); x++)
+-	    if (yycheck[x + yyn] == x)
+-	      size += strlen(yytname[x]) + 15, count++;
+-	  msg = (char *) malloc(size + 15);
+-	  if (msg != 0)
+-	    {
+-	      strcpy(msg, "parse error");
+-
+-	      if (count < 5)
+-		{
+-		  count = 0;
+-		  for (x = (yyn < 0 ? -yyn : 0);
+-		       x < (sizeof(yytname) / sizeof(char *)); x++)
+-		    if (yycheck[x + yyn] == x)
+-		      {
+-			strcat(msg, count == 0 ? ", expecting `" : " or `");
+-			strcat(msg, yytname[x]);
+-			strcat(msg, "'");
+-			count++;
+-		      }
+-		}
+-	      yyerror(msg);
+-	      free(msg);
+-	    }
+-	  else
+-	    yyerror ("parse error; also virtual memory exceeded");
+-	}
+-      else
+-#endif /* YYERROR_VERBOSE */
+-	yyerror("parse error");
+-    }
+-
+-  goto yyerrlab1;
+-yyerrlab1:   /* here on error raised explicitly by an action */
+-
+-  if (yyerrstatus == 3)
+-    {
+-      /* if just tried and failed to reuse lookahead token after an error, discard it.  */
+-
+-      /* return failure if at end of input */
+-      if (yychar == YYEOF)
+-	YYABORT;
+-
+-#if YYDEBUG != 0
+-      if (yydebug)
+-	fprintf(stderr, "Discarding token %d (%s).\n", yychar, yytname[yychar1]);
+-#endif
+-
+-      yychar = YYEMPTY;
+-    }
+-
+-  /* Else will try to reuse lookahead token
+-     after shifting the error token.  */
+-
+-  yyerrstatus = 3;		/* Each real token shifted decrements this */
+-
+-  goto yyerrhandle;
+-
+-yyerrdefault:  /* current state does not do anything special for the error token. */
+-
+-#if 0
+-  /* This is wrong; only states that explicitly want error tokens
+-     should shift them.  */
+-  yyn = yydefact[yystate];  /* If its default is to accept any token, ok.  Otherwise pop it.*/
+-  if (yyn) goto yydefault;
+-#endif
+-
+-yyerrpop:   /* pop the current state because it cannot handle the error token */
+-
+-  if (yyssp == yyss) YYABORT;
+-  yyvsp--;
+-  yystate = *--yyssp;
+-#ifdef YYLSP_NEEDED
+-  yylsp--;
+-#endif
+-
+-#if YYDEBUG != 0
+-  if (yydebug)
+-    {
+-      short *ssp1 = yyss - 1;
+-      fprintf (stderr, "Error: state stack now");
+-      while (ssp1 != yyssp)
+-	fprintf (stderr, " %d", *++ssp1);
+-      fprintf (stderr, "\n");
+-    }
+-#endif
+-
+-yyerrhandle:
+-
+-  yyn = yypact[yystate];
+-  if (yyn == YYFLAG)
+-    goto yyerrdefault;
+-
+-  yyn += YYTERROR;
+-  if (yyn < 0 || yyn > YYLAST || yycheck[yyn] != YYTERROR)
+-    goto yyerrdefault;
+-
+-  yyn = yytable[yyn];
+-  if (yyn < 0)
+-    {
+-      if (yyn == YYFLAG)
+-	goto yyerrpop;
+-      yyn = -yyn;
+-      goto yyreduce;
+-    }
+-  else if (yyn == 0)
+-    goto yyerrpop;
+-
+-  if (yyn == YYFINAL)
+-    YYACCEPT;
+-
+-#if YYDEBUG != 0
+-  if (yydebug)
+-    fprintf(stderr, "Shifting error token, ");
+-#endif
+-
+-  *++yyvsp = yylval;
+-#ifdef YYLSP_NEEDED
+-  *++yylsp = yylloc;
+-#endif
+-
+-  yystate = yyn;
+-  goto yynewstate;
+-
+- yyacceptlab:
+-  /* YYACCEPT comes here.  */
+-  if (yyfree_stacks)
+-    {
+-      free (yyss);
+-      free (yyvs);
+-#ifdef YYLSP_NEEDED
+-      free (yyls);
+-#endif
+-    }
+-  return 0;
+-
+- yyabortlab:
+-  /* YYABORT comes here.  */
+-  if (yyfree_stacks)
+-    {
+-      free (yyss);
+-      free (yyvs);
+-#ifdef YYLSP_NEEDED
+-      free (yyls);
+-#endif
+-    }
+-  return 1;
+-}
+-#line 233 "plural.y"
+-
+-
+-void
+-internal_function
+-FREE_EXPRESSION (exp)
+-     struct expression *exp;
+-{
+-  if (exp == NULL)
+-    return;
+-
+-  /* Handle the recursive case.  */
+-  switch (exp->nargs)
+-    {
+-    case 3:
+-      FREE_EXPRESSION (exp->val.args[2]);
+-      /* FALLTHROUGH */
+-    case 2:
+-      FREE_EXPRESSION (exp->val.args[1]);
+-      /* FALLTHROUGH */
+-    case 1:
+-      FREE_EXPRESSION (exp->val.args[0]);
+-      /* FALLTHROUGH */
+-    default:
+-      break;
+-    }
+-
+-  free (exp);
+-}
+-
+-
+-static int
+-yylex (lval, pexp)
+-     YYSTYPE *lval;
+-     const char **pexp;
+-{
+-  const char *exp = *pexp;
+-  int result;
+-
+-  while (1)
+-    {
+-      if (exp[0] == '\0')
+-	{
+-	  *pexp = exp;
+-	  return YYEOF;
+-	}
+-
+-      if (exp[0] != ' ' && exp[0] != '\t')
+-	break;
+-
+-      ++exp;
+-    }
+-
+-  result = *exp++;
+-  switch (result)
+-    {
+-    case '0': case '1': case '2': case '3': case '4':
+-    case '5': case '6': case '7': case '8': case '9':
+-      {
+-	unsigned long int n = result - '0';
+-	while (exp[0] >= '0' && exp[0] <= '9')
+-	  {
+-	    n *= 10;
+-	    n += exp[0] - '0';
+-	    ++exp;
+-	  }
+-	lval->num = n;
+-	result = NUMBER;
+-      }
+-      break;
+-
+-    case '=':
+-      if (exp[0] == '=')
+-	{
+-	  ++exp;
+-	  lval->op = equal;
+-	  result = EQUOP2;
+-	}
+-      else
+-	result = YYERRCODE;
+-      break;
+-
+-    case '!':
+-      if (exp[0] == '=')
+-	{
+-	  ++exp;
+-	  lval->op = not_equal;
+-	  result = EQUOP2;
+-	}
+-      break;
+-
+-    case '&':
+-    case '|':
+-      if (exp[0] == result)
+-	++exp;
+-      else
+-	result = YYERRCODE;
+-      break;
+-
+-    case '<':
+-      if (exp[0] == '=')
+-	{
+-	  ++exp;
+-	  lval->op = less_or_equal;
+-	}
+-      else
+-	lval->op = less_than;
+-      result = CMPOP2;
+-      break;
+-
+-    case '>':
+-      if (exp[0] == '=')
+-	{
+-	  ++exp;
+-	  lval->op = greater_or_equal;
+-	}
+-      else
+-	lval->op = greater_than;
+-      result = CMPOP2;
+-      break;
+-
+-    case '*':
+-      lval->op = mult;
+-      result = MULOP2;
+-      break;
+-
+-    case '/':
+-      lval->op = divide;
+-      result = MULOP2;
+-      break;
+-
+-    case '%':
+-      lval->op = module;
+-      result = MULOP2;
+-      break;
+-
+-    case '+':
+-      lval->op = plus;
+-      result = ADDOP2;
+-      break;
+-
+-    case '-':
+-      lval->op = minus;
+-      result = ADDOP2;
+-      break;
+-
+-    case 'n':
+-    case '?':
+-    case ':':
+-    case '(':
+-    case ')':
+-      /* Nothing, just return the character.  */
+-      break;
+-
+-    case ';':
+-    case '\n':
+-    case '\0':
+-      /* Be safe and let the user call this function again.  */
+-      --exp;
+-      result = YYEOF;
+-      break;
+-
+-    default:
+-      result = YYERRCODE;
+-#if YYDEBUG != 0
+-      --exp;
+-#endif
+-      break;
+-    }
+-
+-  *pexp = exp;
+-
+-  return result;
+-}
+-
+-
+-static void
+-yyerror (str)
+-     const char *str;
+-{
+-  /* Do nothing.  We don't print error messages here.  */
+-}
+--- a/intl/plural.y
++++ /dev/null
+@@ -1,413 +0,0 @@
+-%{
+-/* Expression parsing for plural form selection.
+-   Copyright (C) 2000, 2001 Free Software Foundation, Inc.
+-   Written by Ulrich Drepper <drepper@cygnus.com>, 2000.
+-
+-   This program is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU Library General Public License as published
+-   by the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Library General Public License for more details.
+-
+-   You should have received a copy of the GNU Library General Public
+-   License along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-   USA.  */
+-
+-/* The bison generated parser uses alloca.  AIX 3 forces us to put this
+-   declaration at the beginning of the file.  The declaration in bison's
+-   skeleton file comes too late.  This must come before <config.h>
+-   because <config.h> may include arbitrary system headers.  */
+-#if defined _AIX && !defined __GNUC__
+- #pragma alloca
+-#endif
+-
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-#include <stdlib.h>
+-#include "gettextP.h"
+-
+-/* Names for the libintl functions are a problem.  They must not clash
+-   with existing names and they should follow ANSI C.  But this source
+-   code is also used in GNU C Library where the names have a __
+-   prefix.  So we have to make a difference here.  */
+-#ifdef _LIBC
+-# define FREE_EXPRESSION __gettext_free_exp
+-#else
+-# define FREE_EXPRESSION gettext_free_exp__
+-# define __gettextparse gettextparse__
+-#endif
+-
+-#define YYLEX_PARAM	&((struct parse_args *) arg)->cp
+-#define YYPARSE_PARAM	arg
+-%}
+-%pure_parser
+-%expect 10
+-
+-%union {
+-  unsigned long int num;
+-  enum operator op;
+-  struct expression *exp;
+-}
+-
+-%{
+-/* Prototypes for local functions.  */
+-static struct expression *new_exp PARAMS ((int nargs, enum operator op,
+-					   struct expression * const *args));
+-static inline struct expression *new_exp_0 PARAMS ((enum operator op));
+-static inline struct expression *new_exp_1 PARAMS ((enum operator op,
+-						   struct expression *right));
+-static struct expression *new_exp_2 PARAMS ((enum operator op,
+-					     struct expression *left,
+-					     struct expression *right));
+-static inline struct expression *new_exp_3 PARAMS ((enum operator op,
+-						   struct expression *bexp,
+-						   struct expression *tbranch,
+-						   struct expression *fbranch));
+-static int yylex PARAMS ((YYSTYPE *lval, const char **pexp));
+-static void yyerror PARAMS ((const char *str));
+-
+-/* Allocation of expressions.  */
+-
+-static struct expression *
+-new_exp (nargs, op, args)
+-     int nargs;
+-     enum operator op;
+-     struct expression * const *args;
+-{
+-  int i;
+-  struct expression *newp;
+-
+-  /* If any of the argument could not be malloc'ed, just return NULL.  */
+-  for (i = nargs - 1; i >= 0; i--)
+-    if (args[i] == NULL)
+-      goto fail;
+-
+-  /* Allocate a new expression.  */
+-  newp = (struct expression *) malloc (sizeof (*newp));
+-  if (newp != NULL)
+-    {
+-      newp->nargs = nargs;
+-      newp->operation = op;
+-      for (i = nargs - 1; i >= 0; i--)
+-	newp->val.args[i] = args[i];
+-      return newp;
+-    }
+-
+- fail:
+-  for (i = nargs - 1; i >= 0; i--)
+-    FREE_EXPRESSION (args[i]);
+-
+-  return NULL;
+-}
+-
+-static inline struct expression *
+-new_exp_0 (op)
+-     enum operator op;
+-{
+-  return new_exp (0, op, NULL);
+-}
+-
+-static inline struct expression *
+-new_exp_1 (op, right)
+-     enum operator op;
+-     struct expression *right;
+-{
+-  struct expression *args[1];
+-
+-  args[0] = right;
+-  return new_exp (1, op, args);
+-}
+-
+-static struct expression *
+-new_exp_2 (op, left, right)
+-     enum operator op;
+-     struct expression *left;
+-     struct expression *right;
+-{
+-  struct expression *args[2];
+-
+-  args[0] = left;
+-  args[1] = right;
+-  return new_exp (2, op, args);
+-}
+-
+-static inline struct expression *
+-new_exp_3 (op, bexp, tbranch, fbranch)
+-     enum operator op;
+-     struct expression *bexp;
+-     struct expression *tbranch;
+-     struct expression *fbranch;
+-{
+-  struct expression *args[3];
+-
+-  args[0] = bexp;
+-  args[1] = tbranch;
+-  args[2] = fbranch;
+-  return new_exp (3, op, args);
+-}
+-
+-%}
+-
+-/* This declares that all operators have the same associativity and the
+-   precedence order as in C.  See [Harbison, Steele: C, A Reference Manual].
+-   There is no unary minus and no bitwise operators.
+-   Operators with the same syntactic behaviour have been merged into a single
+-   token, to save space in the array generated by bison.  */
+-%right '?'		/*   ?		*/
+-%left '|'		/*   ||		*/
+-%left '&'		/*   &&		*/
+-%left EQUOP2		/*   == !=	*/
+-%left CMPOP2		/*   < > <= >=	*/
+-%left ADDOP2		/*   + -	*/
+-%left MULOP2		/*   * / %	*/
+-%right '!'		/*   !		*/
+-
+-%token <op> EQUOP2 CMPOP2 ADDOP2 MULOP2
+-%token <num> NUMBER
+-%type <exp> exp
+-
+-%%
+-
+-start:	  exp
+-	  {
+-	    if ($1 == NULL)
+-	      YYABORT;
+-	    ((struct parse_args *) arg)->res = $1;
+-	  }
+-	;
+-
+-exp:	  exp '?' exp ':' exp
+-	  {
+-	    $$ = new_exp_3 (qmop, $1, $3, $5);
+-	  }
+-	| exp '|' exp
+-	  {
+-	    $$ = new_exp_2 (lor, $1, $3);
+-	  }
+-	| exp '&' exp
+-	  {
+-	    $$ = new_exp_2 (land, $1, $3);
+-	  }
+-	| exp EQUOP2 exp
+-	  {
+-	    $$ = new_exp_2 ($2, $1, $3);
+-	  }
+-	| exp CMPOP2 exp
+-	  {
+-	    $$ = new_exp_2 ($2, $1, $3);
+-	  }
+-	| exp ADDOP2 exp
+-	  {
+-	    $$ = new_exp_2 ($2, $1, $3);
+-	  }
+-	| exp MULOP2 exp
+-	  {
+-	    $$ = new_exp_2 ($2, $1, $3);
+-	  }
+-	| '!' exp
+-	  {
+-	    $$ = new_exp_1 (lnot, $2);
+-	  }
+-	| 'n'
+-	  {
+-	    $$ = new_exp_0 (var);
+-	  }
+-	| NUMBER
+-	  {
+-	    if (($$ = new_exp_0 (num)) != NULL)
+-	      $$->val.num = $1;
+-	  }
+-	| '(' exp ')'
+-	  {
+-	    $$ = $2;
+-	  }
+-	;
+-
+-%%
+-
+-void
+-internal_function
+-FREE_EXPRESSION (exp)
+-     struct expression *exp;
+-{
+-  if (exp == NULL)
+-    return;
+-
+-  /* Handle the recursive case.  */
+-  switch (exp->nargs)
+-    {
+-    case 3:
+-      FREE_EXPRESSION (exp->val.args[2]);
+-      /* FALLTHROUGH */
+-    case 2:
+-      FREE_EXPRESSION (exp->val.args[1]);
+-      /* FALLTHROUGH */
+-    case 1:
+-      FREE_EXPRESSION (exp->val.args[0]);
+-      /* FALLTHROUGH */
+-    default:
+-      break;
+-    }
+-
+-  free (exp);
+-}
+-
+-
+-static int
+-yylex (lval, pexp)
+-     YYSTYPE *lval;
+-     const char **pexp;
+-{
+-  const char *exp = *pexp;
+-  int result;
+-
+-  while (1)
+-    {
+-      if (exp[0] == '\0')
+-	{
+-	  *pexp = exp;
+-	  return YYEOF;
+-	}
+-
+-      if (exp[0] != ' ' && exp[0] != '\t')
+-	break;
+-
+-      ++exp;
+-    }
+-
+-  result = *exp++;
+-  switch (result)
+-    {
+-    case '0': case '1': case '2': case '3': case '4':
+-    case '5': case '6': case '7': case '8': case '9':
+-      {
+-	unsigned long int n = result - '0';
+-	while (exp[0] >= '0' && exp[0] <= '9')
+-	  {
+-	    n *= 10;
+-	    n += exp[0] - '0';
+-	    ++exp;
+-	  }
+-	lval->num = n;
+-	result = NUMBER;
+-      }
+-      break;
+-
+-    case '=':
+-      if (exp[0] == '=')
+-	{
+-	  ++exp;
+-	  lval->op = equal;
+-	  result = EQUOP2;
+-	}
+-      else
+-	result = YYERRCODE;
+-      break;
+-
+-    case '!':
+-      if (exp[0] == '=')
+-	{
+-	  ++exp;
+-	  lval->op = not_equal;
+-	  result = EQUOP2;
+-	}
+-      break;
+-
+-    case '&':
+-    case '|':
+-      if (exp[0] == result)
+-	++exp;
+-      else
+-	result = YYERRCODE;
+-      break;
+-
+-    case '<':
+-      if (exp[0] == '=')
+-	{
+-	  ++exp;
+-	  lval->op = less_or_equal;
+-	}
+-      else
+-	lval->op = less_than;
+-      result = CMPOP2;
+-      break;
+-
+-    case '>':
+-      if (exp[0] == '=')
+-	{
+-	  ++exp;
+-	  lval->op = greater_or_equal;
+-	}
+-      else
+-	lval->op = greater_than;
+-      result = CMPOP2;
+-      break;
+-
+-    case '*':
+-      lval->op = mult;
+-      result = MULOP2;
+-      break;
+-
+-    case '/':
+-      lval->op = divide;
+-      result = MULOP2;
+-      break;
+-
+-    case '%':
+-      lval->op = module;
+-      result = MULOP2;
+-      break;
+-
+-    case '+':
+-      lval->op = plus;
+-      result = ADDOP2;
+-      break;
+-
+-    case '-':
+-      lval->op = minus;
+-      result = ADDOP2;
+-      break;
+-
+-    case 'n':
+-    case '?':
+-    case ':':
+-    case '(':
+-    case ')':
+-      /* Nothing, just return the character.  */
+-      break;
+-
+-    case ';':
+-    case '\n':
+-    case '\0':
+-      /* Be safe and let the user call this function again.  */
+-      --exp;
+-      result = YYEOF;
+-      break;
+-
+-    default:
+-      result = YYERRCODE;
+-#if YYDEBUG != 0
+-      --exp;
+-#endif
+-      break;
+-    }
+-
+-  *pexp = exp;
+-
+-  return result;
+-}
+-
+-
+-static void
+-yyerror (str)
+-     const char *str;
+-{
+-  /* Do nothing.  We don't print error messages here.  */
+-}
+--- a/intl/ref-add.sin
++++ /dev/null
+@@ -1,31 +0,0 @@
+-# Add this package to a list of references stored in a text file.
+-#
+-#   Copyright (C) 2000 Free Software Foundation, Inc.
+-#
+-#   This program is free software; you can redistribute it and/or modify it
+-#   under the terms of the GNU Library General Public License as published
+-#   by the Free Software Foundation; either version 2, or (at your option)
+-#   any later version.
+-#
+-#   This program is distributed in the hope that it will be useful,
+-#   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-#   Library General Public License for more details.
+-#
+-#   You should have received a copy of the GNU Library General Public
+-#   License along with this program; if not, write to the Free Software
+-#   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-#   USA.
+-#
+-# Written by Bruno Haible <haible@clisp.cons.org>.
+-#
+-/^# Packages using this file: / {
+-  s/# Packages using this file://
+-  ta
+-  :a
+-  s/ @PACKAGE@ / @PACKAGE@ /
+-  tb
+-  s/ $/ @PACKAGE@ /
+-  :b
+-  s/^/# Packages using this file:/
+-}
+--- a/intl/ref-del.sin
++++ /dev/null
+@@ -1,26 +0,0 @@
+-# Remove this package from a list of references stored in a text file.
+-#
+-#   Copyright (C) 2000 Free Software Foundation, Inc.
+-#
+-#   This program is free software; you can redistribute it and/or modify it
+-#   under the terms of the GNU Library General Public License as published
+-#   by the Free Software Foundation; either version 2, or (at your option)
+-#   any later version.
+-#
+-#   This program is distributed in the hope that it will be useful,
+-#   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-#   Library General Public License for more details.
+-#
+-#   You should have received a copy of the GNU Library General Public
+-#   License along with this program; if not, write to the Free Software
+-#   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-#   USA.
+-#
+-# Written by Bruno Haible <haible@clisp.cons.org>.
+-#
+-/^# Packages using this file: / {
+-  s/# Packages using this file://
+-  s/ @PACKAGE@ / /
+-  s/^/# Packages using this file:/
+-}
+--- a/intl/textdomain.c
++++ /dev/null
+@@ -1,142 +0,0 @@
+-/* Implementation of the textdomain(3) function.
+-   Copyright (C) 1995-1998, 2000, 2001 Free Software Foundation, Inc.
+-
+-   This program is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU Library General Public License as published
+-   by the Free Software Foundation; either version 2, or (at your option)
+-   any later version.
+-
+-   This program is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Library General Public License for more details.
+-
+-   You should have received a copy of the GNU Library General Public
+-   License along with this program; if not, write to the Free Software
+-   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
+-   USA.  */
+-
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-#include <stdlib.h>
+-#include <string.h>
+-
+-#ifdef _LIBC
+-# include <libintl.h>
+-#else
+-# include "libgnuintl.h"
+-#endif
+-#include "gettextP.h"
+-
+-#ifdef _LIBC
+-/* We have to handle multi-threaded applications.  */
+-# include <bits/libc-lock.h>
+-#else
+-/* Provide dummy implementation if this is outside glibc.  */
+-# define __libc_rwlock_define(CLASS, NAME)
+-# define __libc_rwlock_wrlock(NAME)
+-# define __libc_rwlock_unlock(NAME)
+-#endif
+-
+-/* The internal variables in the standalone libintl.a must have different
+-   names than the internal variables in GNU libc, otherwise programs
+-   using libintl.a cannot be linked statically.  */
+-#if !defined _LIBC
+-# define _nl_default_default_domain _nl_default_default_domain__
+-# define _nl_current_default_domain _nl_current_default_domain__
+-#endif
+-
+-/* @@ end of prolog @@ */
+-
+-/* Name of the default text domain.  */
+-extern const char _nl_default_default_domain[];
+-
+-/* Default text domain in which entries for gettext(3) are to be found.  */
+-extern const char *_nl_current_default_domain;
+-
+-
+-/* Names for the libintl functions are a problem.  They must not clash
+-   with existing names and they should follow ANSI C.  But this source
+-   code is also used in GNU C Library where the names have a __
+-   prefix.  So we have to make a difference here.  */
+-#ifdef _LIBC
+-# define TEXTDOMAIN __textdomain
+-# ifndef strdup
+-#  define strdup(str) __strdup (str)
+-# endif
+-#else
+-# define TEXTDOMAIN textdomain__
+-#endif
+-
+-/* Lock variable to protect the global data in the gettext implementation.  */
+-__libc_rwlock_define (extern, _nl_state_lock)
+-
+-/* Set the current default message catalog to DOMAINNAME.
+-   If DOMAINNAME is null, return the current default.
+-   If DOMAINNAME is "", reset to the default of "messages".  */
+-char *
+-TEXTDOMAIN (domainname)
+-     const char *domainname;
+-{
+-  char *new_domain;
+-  char *old_domain;
+-
+-  /* A NULL pointer requests the current setting.  */
+-  if (domainname == NULL)
+-    return (char *) _nl_current_default_domain;
+-
+-  __libc_rwlock_wrlock (_nl_state_lock);
+-
+-  old_domain = (char *) _nl_current_default_domain;
+-
+-  /* If domain name is the null string set to default domain "messages".  */
+-  if (domainname[0] == '\0'
+-      || strcmp (domainname, _nl_default_default_domain) == 0)
+-    {
+-      _nl_current_default_domain = _nl_default_default_domain;
+-      new_domain = (char *) _nl_current_default_domain;
+-    }
+-  else if (strcmp (domainname, old_domain) == 0)
+-    /* This can happen and people will use it to signal that some
+-       environment variable changed.  */
+-    new_domain = old_domain;
+-  else
+-    {
+-      /* If the following malloc fails `_nl_current_default_domain'
+-	 will be NULL.  This value will be returned and so signals we
+-	 are out of core.  */
+-#if defined _LIBC || defined HAVE_STRDUP
+-      new_domain = strdup (domainname);
+-#else
+-      size_t len = strlen (domainname) + 1;
+-      new_domain = (char *) malloc (len);
+-      if (new_domain != NULL)
+-	memcpy (new_domain, domainname, len);
+-#endif
+-
+-      if (new_domain != NULL)
+-	_nl_current_default_domain = new_domain;
+-    }
+-
+-  /* We use this possibility to signal a change of the loaded catalogs
+-     since this is most likely the case and there is no other easy we
+-     to do it.  Do it only when the call was successful.  */
+-  if (new_domain != NULL)
+-    {
+-      ++_nl_msg_cat_cntr;
+-
+-      if (old_domain != new_domain && old_domain != _nl_default_default_domain)
+-	free (old_domain);
+-    }
+-
+-  __libc_rwlock_unlock (_nl_state_lock);
+-
+-  return new_domain;
+-}
+-
+-#ifdef _LIBC
+-/* Alias for function name in GNU C Library.  */
+-weak_alias (__textdomain, textdomain);
+-#endif
diff --git a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
index 6fe258271d..b4d94ff6a2 100644
--- a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
+++ b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
@@ -7,6 +7,7 @@ SRC_URI = "http://prdownloads.sourceforge.net/${BPN}/${BPN}_${PV}.tar.gz \
            file://Makevars \
            file://0001-Include-stdlib.h-for-exit-API.patch \
            file://0002-timing.c-Fix-format-security-errors.patch \
+           file://gettext.patch \
            "
 
 SRC_URI[md5sum] = "4331dde4bb83865e15482885fcb0cc53"
-- 
2.24.1


