Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0B8E77F9AE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 06:13:47 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id b137so21423316pga.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jan 2020 22:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/SIpIgS3Bx3smM+seKKxg3sRegUlK+1P3FgUiP80gDQ=;
	b=aJ+R2QYXdvTRmgbp/YlwMFaJIZ0Tr+lQhi4VA9vw0hC4BGBPelCu4q5AZfAAnmGyGJ
	cWa4cCBWdI8b7Ka0rbAc6WLFYt34Pydy438KJr37bewL4SA2Qi1R9c6R0pLHB/eP+11c
	AYdIEDsmIAUtS+GYC5eMTX/W+hRdJR4ox+GNX46NKjvtmctx0pxZ89YiG79jLDK9PiZU
	pcTcTsp+XnSif2pJvG2uItPj15KJwdlddbwUsc7FAFyq99S0Lkxk+qhMJoYZGpQyeMgn
	esCzZU8D9zD0XxQiJIWFKjGs5X27XoFvTn91GWWZ2P16iT2r5i8AaK7fUJrfu6+anmOg
	GzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/SIpIgS3Bx3smM+seKKxg3sRegUlK+1P3FgUiP80gDQ=;
	b=nuc++un4td4ifaKuQS7wnkWy1o5okcMjJ7Ymuv8EnAY4cUw2P3HM73im8kYqZmRNwA
	69H5pYqbduom1+/zDPtYIKaUoBJmeRbvb7b+6Cs92+cQwrrIcSbmSOHemzdC1ZWkJ4Tu
	tATxfQXadjS0tPQx0Pp8MKEBDJtzN+tsrqGTAKohn83LxvZWZDzO49r7qb7IQnne2t5w
	UEHfTnj5QAlA5d81ulmzCA6Guvji5adwT5VZ1MR8E4FuwYSNThUgCjBBYoX75QHw58cd
	0vrHEzaj+GMwegDD7FGqbcwsxVAt7rQnEQ8jX9D/DkY+E981ga0ksoYhmeZRViGzCZkk
	Wxlg==
X-Gm-Message-State: APjAAAUQVS2mzIgy/ROO5A7hRDbC9a5CCxb5ORrBl2BajKcOxC8MCoMg
	/9UcCtVKTzl15bxPIFfpLRoRhcnVh8E=
X-Google-Smtp-Source: APXvYqxKYHxfzvElFp9MO+ImDKpw7CDtwVtxUFzcTV216T0mJNtAkXaeRzQZr7fNmPC8oBe8hfeA/g==
X-Received: by 2002:a63:1418:: with SMTP id u24mr84908581pgl.279.1577945624457;
	Wed, 01 Jan 2020 22:13:44 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id
	e19sm9369149pjr.10.2020.01.01.22.13.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 01 Jan 2020 22:13:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jan 2020 22:13:28 -0800
Message-Id: <20200102061330.480482-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200102061330.480482-1-raj.khem@gmail.com>
References: <20200102061330.480482-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/6] hddtemp: Fix build with latest gettext 0.20.x
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
X-List-Received-Date: Thu, 02 Jan 2020 06:13:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ame-to-configure.ac-and-use-external.patch | 14743 ++++++++++++++++
 .../hddtemp/hddtemp_0.3-beta15.bb             |     1 +
 2 files changed, 14744 insertions(+)
 create mode 100644 meta-oe/recipes-support/hddtemp/hddtemp/0001-configure.ac-Rename-to-configure.ac-and-use-external.patch

diff --git a/meta-oe/recipes-support/hddtemp/hddtemp/0001-configure.ac-Rename-to-configure.ac-and-use-external.patch b/meta-oe/recipes-support/hddtemp/hddtemp/0001-configure.ac-Rename-to-configure.ac-and-use-external.patch
new file mode 100644
index 0000000000..a06dbad1ea
--- /dev/null
+++ b/meta-oe/recipes-support/hddtemp/hddtemp/0001-configure.ac-Rename-to-configure.ac-and-use-external.patch
@@ -0,0 +1,14743 @@
+From d7e6fe2ac69333c2d943a4b8eb139373d1fb2ce2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 31 Dec 2019 18:08:09 -0800
+Subject: [PATCH] configure.ac: Rename to configure.ac and use external gettext
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 81 ++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 81 insertions(+)
+ create mode 100644 configure.ac
+
+--- /dev/null
++++ b/configure.ac
+@@ -0,0 +1,81 @@
++dnl Process this file with autoconf to produce a configure script.
++
++# Initialization
++AC_INIT
++AC_CONFIG_SRCDIR([Makefile.am])
++AC_CONFIG_HEADERS([config.h])
++
++# Determine the host and build type. The target is always a PIC.
++AC_CANONICAL_HOST
++
++AM_INIT_AUTOMAKE(hddtemp, 0.3-beta15)
++
++dnl Checks for programs.
++AC_PROG_CC
++AC_PROG_INSTALL
++
++# append the host alias to the tools for cross compiling
++AC_HEADER_STDC
++AC_CHECK_HEADERS(fcntl.h)
++AC_CHECK_HEADERS(iconv.h)
++AC_CHECK_HEADERS(netinet/in.h)
++AC_CHECK_TYPE(in_addr_t, ,[AC_DEFINE_UNQUOTED([in_addr_t], [uint32_t], [Define to 'uint32_t' if <netinet/in.h> does not define.])], [#include <netinet/in.h>])
++
++# Checks for typedefs, structures, and compiler characteristics.
++AC_C_CONST
++AC_STRUCT_TM
++
++dnl internationalization macros
++AM_GNU_GETTEXT([external])
++
++AC_CHECK_FUNCS([bindtextdomain textdomain iconv])
++
++dnl reasonable guesses for where stuff is installed
++dnl if we don't do that now, the config.h will use ${prefix}
++dnl for DEFAULT_DATABASE_PATH.
++if test "x$prefix" = "xNONE"; then
++   prefix="/usr/local"
++fi
++if test "x$exec_prefix" = "xNONE"; then
++   exec_prefix=$prefix
++fi
++
++AC_MSG_CHECKING([Location of hddtemp.db])
++DEFAULT_DATABASE_PATH=
++#db_path=\"`eval echo ${datadir}`/misc/hddtemp.db\"
++db_path=\"/usr/share/misc/hddtemp.db\"
++AC_ARG_WITH(db_path,
++               [  --with-db-path=PATH \
++                Default location of hddtemp.db file [/usr/share/misc/hddtemp.db]],
++               [  if test -d "$withval"; then
++                     AC_MSG_FAILURE([new file name for db-path])
++                  fi
++                  DEFAULT_DATABASE_PATH="\"$withval\""
++               ],
++               [  DEFAULT_DATABASE_PATH="$db_path" ])
++AC_MSG_RESULT($DEFAULT_DATABASE_PATH)
++AC_DEFINE_UNQUOTED([DEFAULT_DATABASE_PATH], [$DEFAULT_DATABASE_PATH], [Default location of drive info database])
++
++#CFLAGS="$CFLAGS -Wall -fomit-frame-pointer -Wcast-align"
++CFLAGS="$CFLAGS -Wall -W -Wcast-align"
++
++# Substitute configuration variables
++AC_CONFIG_FILES([Makefile \
++po/Makefile.in \
++m4/Makefile \
++src/Makefile \
++doc/Makefile \
++])
++AC_OUTPUT
++
++AC_MSG_RESULT([
++
++hddtemp-$VERSION is now configured for $canonical_host_type
++
++  Build:                $build
++  Host:                 $host
++  Source directory:     $srcdir
++  Installation prefix:  $prefix
++  C compiler:           $CC $CFLAGS
++
++])
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -12,7 +12,7 @@ EXTRA_DIST = config.rpath  autogen.sh \
+              README \
+              TODO
+ 	     
+-SUBDIRS = intl po m4 src doc
++SUBDIRS = po m4 src doc
+ 
+ CLEANFILES = *~
+ 
+--- a/configure.in
++++ /dev/null
+@@ -1,83 +0,0 @@
+-dnl Process this file with autoconf to produce a configure script.
+-
+-# Initialization
+-AC_INIT
+-AC_CONFIG_SRCDIR([Makefile.am])
+-AC_CONFIG_HEADERS([config.h])
+-
+-# Determine the host and build type. The target is always a PIC.
+-AC_CANONICAL_HOST
+-
+-AM_INIT_AUTOMAKE(hddtemp, 0.3-beta15)
+-
+-dnl Checks for programs.
+-AC_PROG_CC
+-AC_PROG_INSTALL
+-
+-# append the host alias to the tools for cross compiling
+-AC_HEADER_STDC
+-AC_CHECK_HEADERS(fcntl.h)
+-AC_CHECK_HEADERS(iconv.h)
+-AC_CHECK_HEADERS(netinet/in.h)
+-AC_CHECK_TYPE(in_addr_t, ,[AC_DEFINE_UNQUOTED([in_addr_t], [uint32_t], [Define to 'uint32_t' if <netinet/in.h> does not define.])], [#include <netinet/in.h>])
+-
+-# Checks for typedefs, structures, and compiler characteristics.
+-AC_C_CONST
+-AC_STRUCT_TM
+-
+-dnl internationalization macros
+-AM_GNU_GETTEXT_VERSION
+-AM_GNU_GETTEXT
+-#AM_GNU_GETTEXT([external])
+-
+-AC_CHECK_FUNCS([bindtextdomain textdomain iconv])
+-
+-dnl reasonable guesses for where stuff is installed
+-dnl if we don't do that now, the config.h will use ${prefix}
+-dnl for DEFAULT_DATABASE_PATH.
+-if test "x$prefix" = "xNONE"; then
+-   prefix="/usr/local"
+-fi
+-if test "x$exec_prefix" = "xNONE"; then
+-   exec_prefix=$prefix
+-fi
+-
+-AC_MSG_CHECKING([Location of hddtemp.db])
+-DEFAULT_DATABASE_PATH=
+-#db_path=\"`eval echo ${datadir}`/misc/hddtemp.db\"
+-db_path=\"/usr/share/misc/hddtemp.db\"
+-AC_ARG_WITH(db_path,
+-               [  --with-db-path=PATH \
+-                Default location of hddtemp.db file [/usr/share/misc/hddtemp.db]],
+-               [  if test -d "$withval"; then
+-                     AC_MSG_FAILURE([new file name for db-path])
+-                  fi
+-                  DEFAULT_DATABASE_PATH="\"$withval\"" 
+-               ],
+-               [  DEFAULT_DATABASE_PATH="$db_path" ])
+-AC_MSG_RESULT($DEFAULT_DATABASE_PATH)
+-AC_DEFINE_UNQUOTED([DEFAULT_DATABASE_PATH], [$DEFAULT_DATABASE_PATH], [Default location of drive info database])
+-
+-#CFLAGS="$CFLAGS -Wall -fomit-frame-pointer -Wcast-align"
+-CFLAGS="$CFLAGS -Wall -W -Wcast-align"
+-
+-# Substitute configuration variables
+-AC_CONFIG_FILES([Makefile  intl/Makefile \
+-po/Makefile.in \
+-m4/Makefile \
+-src/Makefile \
+-doc/Makefile \
+-])
+-AC_OUTPUT
+-
+-AC_MSG_RESULT([
+-
+-hddtemp-$VERSION is now configured for $canonical_host_type
+-
+-  Build:                $build
+-  Host:                 $host
+-  Source directory:     $srcdir
+-  Installation prefix:  $prefix
+-  C compiler:           $CC $CFLAGS
+-  
+-])
+--- a/intl/ChangeLog
++++ /dev/null
+@@ -1,4 +0,0 @@
+-2005-02-24  GNU  <bug-gnu-gettext@gnu.org>
+-
+-	* Version 0.14.2 released.
+-
+--- a/intl/Makefile.in
++++ /dev/null
+@@ -1,500 +0,0 @@
+-# Makefile for directory with message catalog handling library of GNU gettext
+-# Copyright (C) 1995-1998, 2000-2005 Free Software Foundation, Inc.
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
+-VPATH = $(srcdir)
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
+-mkinstalldirs = $(SHELL) $(MKINSTALLDIRS)
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
+--DLIBDIR=\"$(libdir)\" -DIN_LIBINTL \
+--DENABLE_RELOCATABLE=1 -DIN_LIBRARY -DINSTALLDIR=\"$(libdir)\" -DNO_XMALLOC \
+--Dset_relocation_prefix=libintl_set_relocation_prefix \
+--Drelocate=libintl_relocate \
+--DDEPENDS_ON_LIBICONV=1 @DEFS@
+-CPPFLAGS = @CPPFLAGS@
+-CFLAGS = @CFLAGS@
+-LDFLAGS = @LDFLAGS@
+-LIBS = @LIBS@
+-
+-COMPILE = $(CC) -c $(DEFS) $(INCLUDES) $(CPPFLAGS) $(CFLAGS) $(XCFLAGS)
+-
+-HEADERS = \
+-  gmo.h \
+-  gettextP.h \
+-  hash-string.h \
+-  loadinfo.h \
+-  plural-exp.h \
+-  eval-plural.h \
+-  localcharset.h \
+-  relocatable.h \
+-  xsize.h \
+-  printf-args.h printf-args.c \
+-  printf-parse.h wprintf-parse.h printf-parse.c \
+-  vasnprintf.h vasnwprintf.h vasnprintf.c \
+-  os2compat.h \
+-  libgnuintl.h.in
+-SOURCES = \
+-  bindtextdom.c \
+-  dcgettext.c \
+-  dgettext.c \
+-  gettext.c \
+-  finddomain.c \
+-  loadmsgcat.c \
+-  localealias.c \
+-  textdomain.c \
+-  l10nflist.c \
+-  explodename.c \
+-  dcigettext.c \
+-  dcngettext.c \
+-  dngettext.c \
+-  ngettext.c \
+-  plural.y \
+-  plural-exp.c \
+-  localcharset.c \
+-  relocatable.c \
+-  langprefs.c \
+-  localename.c \
+-  log.c \
+-  printf.c \
+-  osdep.c \
+-  os2compat.c \
+-  intl-compat.c
+-OBJECTS = \
+-  bindtextdom.$lo \
+-  dcgettext.$lo \
+-  dgettext.$lo \
+-  gettext.$lo \
+-  finddomain.$lo \
+-  loadmsgcat.$lo \
+-  localealias.$lo \
+-  textdomain.$lo \
+-  l10nflist.$lo \
+-  explodename.$lo \
+-  dcigettext.$lo \
+-  dcngettext.$lo \
+-  dngettext.$lo \
+-  ngettext.$lo \
+-  plural.$lo \
+-  plural-exp.$lo \
+-  localcharset.$lo \
+-  relocatable.$lo \
+-  langprefs.$lo \
+-  localename.$lo \
+-  log.$lo \
+-  printf.$lo \
+-  osdep.$lo \
+-  intl-compat.$lo
+-DISTFILES.common = Makefile.in \
+-config.charset locale.alias ref-add.sin ref-del.sin $(HEADERS) $(SOURCES)
+-DISTFILES.generated = plural.c
+-DISTFILES.normal = VERSION
+-DISTFILES.gettext = COPYING.LIB-2.0 COPYING.LIB-2.1 libintl.glibc \
+-libgnuintl.h_vms Makefile.vms \
+-libgnuintl.h.msvc-static libgnuintl.h.msvc-shared README.woe32 Makefile.msvc
+-DISTFILES.obsolete = xopen-msg.sed linux-msg.sed po2tbl.sed.in cat-compat.c \
+-COPYING.LIB-2 gettext.h libgettext.h plural-eval.c libgnuintl.h
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
+-	  $(OBJECTS) @LTLIBICONV@ @INTL_MACOSX_LIBS@ $(LIBS) -lc \
+-	  -version-info $(LTV_CURRENT):$(LTV_REVISION):$(LTV_AGE) \
+-	  -rpath $(libdir) \
+-	  -no-undefined
+-
+-# Libtool's library version information for libintl.
+-# Before making a gettext release, the gettext maintainer must change this
+-# according to the libtool documentation, section "Library interface versions".
+-# Maintainers of other packages that include the intl directory must *not*
+-# change these values.
+-LTV_CURRENT=7
+-LTV_REVISION=1
+-LTV_AGE=4
+-
+-.SUFFIXES:
+-.SUFFIXES: .c .y .o .lo .sin .sed
+-
+-.c.o:
+-	$(COMPILE) $<
+-
+-.y.c:
+-	$(YACC) $(YFLAGS) --output $@ $<
+-	rm -f $*.h
+-
+-bindtextdom.lo: $(srcdir)/bindtextdom.c
+-	$(LIBTOOL) --mode=compile $(COMPILE) $(srcdir)/bindtextdom.c
+-dcgettext.lo: $(srcdir)/dcgettext.c
+-	$(LIBTOOL) --mode=compile $(COMPILE) $(srcdir)/dcgettext.c
+-dgettext.lo: $(srcdir)/dgettext.c
+-	$(LIBTOOL) --mode=compile $(COMPILE) $(srcdir)/dgettext.c
+-gettext.lo: $(srcdir)/gettext.c
+-	$(LIBTOOL) --mode=compile $(COMPILE) $(srcdir)/gettext.c
+-finddomain.lo: $(srcdir)/finddomain.c
+-	$(LIBTOOL) --mode=compile $(COMPILE) $(srcdir)/finddomain.c
+-loadmsgcat.lo: $(srcdir)/loadmsgcat.c
+-	$(LIBTOOL) --mode=compile $(COMPILE) $(srcdir)/loadmsgcat.c
+-localealias.lo: $(srcdir)/localealias.c
+-	$(LIBTOOL) --mode=compile $(COMPILE) $(srcdir)/localealias.c
+-textdomain.lo: $(srcdir)/textdomain.c
+-	$(LIBTOOL) --mode=compile $(COMPILE) $(srcdir)/textdomain.c
+-l10nflist.lo: $(srcdir)/l10nflist.c
+-	$(LIBTOOL) --mode=compile $(COMPILE) $(srcdir)/l10nflist.c
+-explodename.lo: $(srcdir)/explodename.c
+-	$(LIBTOOL) --mode=compile $(COMPILE) $(srcdir)/explodename.c
+-dcigettext.lo: $(srcdir)/dcigettext.c
+-	$(LIBTOOL) --mode=compile $(COMPILE) $(srcdir)/dcigettext.c
+-dcngettext.lo: $(srcdir)/dcngettext.c
+-	$(LIBTOOL) --mode=compile $(COMPILE) $(srcdir)/dcngettext.c
+-dngettext.lo: $(srcdir)/dngettext.c
+-	$(LIBTOOL) --mode=compile $(COMPILE) $(srcdir)/dngettext.c
+-ngettext.lo: $(srcdir)/ngettext.c
+-	$(LIBTOOL) --mode=compile $(COMPILE) $(srcdir)/ngettext.c
+-plural.lo: $(srcdir)/plural.c
+-	$(LIBTOOL) --mode=compile $(COMPILE) $(srcdir)/plural.c
+-plural-exp.lo: $(srcdir)/plural-exp.c
+-	$(LIBTOOL) --mode=compile $(COMPILE) $(srcdir)/plural-exp.c
+-localcharset.lo: $(srcdir)/localcharset.c
+-	$(LIBTOOL) --mode=compile $(COMPILE) $(srcdir)/localcharset.c
+-relocatable.lo: $(srcdir)/relocatable.c
+-	$(LIBTOOL) --mode=compile $(COMPILE) $(srcdir)/relocatable.c
+-langprefs.lo: $(srcdir)/langprefs.c
+-	$(LIBTOOL) --mode=compile $(COMPILE) $(srcdir)/langprefs.c
+-localename.lo: $(srcdir)/localename.c
+-	$(LIBTOOL) --mode=compile $(COMPILE) $(srcdir)/localename.c
+-log.lo: $(srcdir)/log.c
+-	$(LIBTOOL) --mode=compile $(COMPILE) $(srcdir)/log.c
+-printf.lo: $(srcdir)/printf.c
+-	$(LIBTOOL) --mode=compile $(COMPILE) $(srcdir)/printf.c
+-osdep.lo: $(srcdir)/osdep.c
+-	$(LIBTOOL) --mode=compile $(COMPILE) $(srcdir)/osdep.c
+-intl-compat.lo: $(srcdir)/intl-compat.c
+-	$(LIBTOOL) --mode=compile $(COMPILE) $(srcdir)/intl-compat.c
+-
+-ref-add.sed: $(srcdir)/ref-add.sin
+-	sed -e '/^#/d' -e 's/@''PACKAGE''@/@PACKAGE@/g' $(srcdir)/ref-add.sin > t-ref-add.sed
+-	mv t-ref-add.sed ref-add.sed
+-ref-del.sed: $(srcdir)/ref-del.sin
+-	sed -e '/^#/d' -e 's/@''PACKAGE''@/@PACKAGE@/g' $(srcdir)/ref-del.sin > t-ref-del.sed
+-	mv t-ref-del.sed ref-del.sed
+-
+-INCLUDES = -I. -I$(srcdir) -I..
+-
+-libgnuintl.h: $(srcdir)/libgnuintl.h.in
+-	sed -e 's,@''HAVE_POSIX_PRINTF''@,@HAVE_POSIX_PRINTF@,g' \
+-	    -e 's,@''HAVE_ASPRINTF''@,@HAVE_ASPRINTF@,g' \
+-	    -e 's,@''HAVE_SNPRINTF''@,@HAVE_SNPRINTF@,g' \
+-	    -e 's,@''HAVE_WPRINTF''@,@HAVE_WPRINTF@,g' \
+-	  < $(srcdir)/libgnuintl.h.in > libgnuintl.h
+-
+-libintl.h: libgnuintl.h
+-	cp libgnuintl.h libintl.h
+-
+-charset.alias: $(srcdir)/config.charset
+-	$(SHELL) $(srcdir)/config.charset '@host@' > t-$@
+-	mv t-$@ $@
+-
+-check: all
+-
+-# We must not install the libintl.h/libintl.a files if we are on a
+-# system which has the GNU gettext() function in its C library or in a
+-# separate library.
+-# If you want to use the one which comes with this version of the
+-# package, you have to use `configure --with-included-gettext'.
+-install: install-exec install-data
+-install-exec: all
+-	if { test "$(PACKAGE)" = "gettext-runtime" || test "$(PACKAGE)" = "gettext-tools"; } \
+-	   && test '@USE_INCLUDED_LIBINTL@' = yes; then \
+-	  $(mkinstalldirs) $(DESTDIR)$(libdir) $(DESTDIR)$(includedir); \
+-	  $(INSTALL_DATA) libintl.h $(DESTDIR)$(includedir)/libintl.h; \
+-	  $(LIBTOOL) --mode=install \
+-	    $(INSTALL_DATA) libintl.$la $(DESTDIR)$(libdir)/libintl.$la; \
+-	  if test "@RELOCATABLE@" = yes; then \
+-	    dependencies=`sed -n -e 's,^dependency_libs=\(.*\),\1,p' < $(DESTDIR)$(libdir)/libintl.la | sed -e "s,^',," -e "s,'\$$,,"`; \
+-	    if test -n "$$dependencies"; then \
+-	      rm -f $(DESTDIR)$(libdir)/libintl.la; \
+-	    fi; \
+-	  fi; \
+-	else \
+-	  : ; \
+-	fi
+-	if test "$(PACKAGE)" = "gettext-tools" \
+-	   && test '@USE_INCLUDED_LIBINTL@' = no \
+-	   && test @GLIBC2@ != no; then \
+-	  $(mkinstalldirs) $(DESTDIR)$(libdir); \
+-	  $(LIBTOOL) --mode=install \
+-	    $(INSTALL_DATA) libgnuintl.$la $(DESTDIR)$(libdir)/libgnuintl.$la; \
+-	  rm -f $(DESTDIR)$(libdir)/preloadable_libintl.so; \
+-	  $(INSTALL_DATA) $(DESTDIR)$(libdir)/libgnuintl.so $(DESTDIR)$(libdir)/preloadable_libintl.so; \
+-	  $(LIBTOOL) --mode=uninstall \
+-	    rm -f $(DESTDIR)$(libdir)/libgnuintl.$la; \
+-	else \
+-	  : ; \
+-	fi
+-	if test '@USE_INCLUDED_LIBINTL@' = yes; then \
+-	  test @GLIBC21@ != no || $(mkinstalldirs) $(DESTDIR)$(libdir); \
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
+-	if test "$(PACKAGE)" = "gettext-tools"; then \
+-	  $(mkinstalldirs) $(DESTDIR)$(gettextsrcdir); \
+-	  $(INSTALL_DATA) VERSION $(DESTDIR)$(gettextsrcdir)/VERSION; \
+-	  $(INSTALL_DATA) ChangeLog.inst $(DESTDIR)$(gettextsrcdir)/ChangeLog; \
+-	  dists="COPYING.LIB-2.0 COPYING.LIB-2.1 $(DISTFILES.common)"; \
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
+-install-strip: install
+-
+-installdirs:
+-	if { test "$(PACKAGE)" = "gettext-runtime" || test "$(PACKAGE)" = "gettext-tools"; } \
+-	   && test '@USE_INCLUDED_LIBINTL@' = yes; then \
+-	  $(mkinstalldirs) $(DESTDIR)$(libdir) $(DESTDIR)$(includedir); \
+-	else \
+-	  : ; \
+-	fi
+-	if test "$(PACKAGE)" = "gettext-tools" \
+-	   && test '@USE_INCLUDED_LIBINTL@' = no \
+-	   && test @GLIBC2@ != no; then \
+-	  $(mkinstalldirs) $(DESTDIR)$(libdir); \
+-	else \
+-	  : ; \
+-	fi
+-	if test '@USE_INCLUDED_LIBINTL@' = yes; then \
+-	  test @GLIBC21@ != no || $(mkinstalldirs) $(DESTDIR)$(libdir); \
+-	  $(mkinstalldirs) $(DESTDIR)$(localedir); \
+-	else \
+-	  : ; \
+-	fi
+-	if test "$(PACKAGE)" = "gettext-tools"; then \
+-	  $(mkinstalldirs) $(DESTDIR)$(gettextsrcdir); \
+-	else \
+-	  : ; \
+-	fi
+-
+-# Define this as empty until I found a useful application.
+-installcheck:
+-
+-uninstall:
+-	if { test "$(PACKAGE)" = "gettext-runtime" || test "$(PACKAGE)" = "gettext-tools"; } \
+-	   && test '@USE_INCLUDED_LIBINTL@' = yes; then \
+-	  rm -f $(DESTDIR)$(includedir)/libintl.h; \
+-	  $(LIBTOOL) --mode=uninstall \
+-	    rm -f $(DESTDIR)$(libdir)/libintl.$la; \
+-	else \
+-	  : ; \
+-	fi
+-	if test "$(PACKAGE)" = "gettext-tools" \
+-	   && test '@USE_INCLUDED_LIBINTL@' = no \
+-	   && test @GLIBC2@ != no; then \
+-	  rm -f $(DESTDIR)$(libdir)/preloadable_libintl.so; \
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
+-	if test "$(PACKAGE)" = "gettext-tools"; then \
+-	  for file in VERSION ChangeLog COPYING.LIB-2.0 COPYING.LIB-2.1 $(DISTFILES.common) $(DISTFILES.generated); do \
+-	    rm -f $(DESTDIR)$(gettextsrcdir)/$$file; \
+-	  done; \
+-	else \
+-	  : ; \
+-	fi
+-
+-info dvi ps pdf html:
+-
+-$(OBJECTS): ../config.h libgnuintl.h
+-bindtextdom.$lo dcgettext.$lo dcigettext.$lo dcngettext.$lo dgettext.$lo dngettext.$lo finddomain.$lo gettext.$lo intl-compat.$lo loadmsgcat.$lo localealias.$lo ngettext.$lo textdomain.$lo: $(srcdir)/gettextP.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
+-dcigettext.$lo loadmsgcat.$lo: $(srcdir)/hash-string.h
+-explodename.$lo l10nflist.$lo: $(srcdir)/loadinfo.h
+-dcigettext.$lo loadmsgcat.$lo plural.$lo plural-exp.$lo: $(srcdir)/plural-exp.h
+-dcigettext.$lo: $(srcdir)/eval-plural.h
+-localcharset.$lo: $(srcdir)/localcharset.h
+-localealias.$lo localcharset.$lo relocatable.$lo: $(srcdir)/relocatable.h
+-printf.$lo: $(srcdir)/printf-args.h $(srcdir)/printf-args.c $(srcdir)/printf-parse.h $(srcdir)/wprintf-parse.h $(srcdir)/xsize.h $(srcdir)/printf-parse.c $(srcdir)/vasnprintf.h $(srcdir)/vasnwprintf.h $(srcdir)/vasnprintf.c
+-
+-tags: TAGS
+-
+-TAGS: $(HEADERS) $(SOURCES)
+-	here=`pwd`; cd $(srcdir) && etags -o $$here/TAGS $(HEADERS) $(SOURCES)
+-
+-ctags: CTAGS
+-
+-CTAGS: $(HEADERS) $(SOURCES)
+-	here=`pwd`; cd $(srcdir) && ctags -o $$here/CTAGS $(HEADERS) $(SOURCES)
+-
+-id: ID
+-
+-ID: $(HEADERS) $(SOURCES)
+-	here=`pwd`; cd $(srcdir) && mkid -f$$here/ID $(HEADERS) $(SOURCES)
+-
+-
+-mostlyclean:
+-	rm -f *.a *.la *.o *.obj *.lo core core.*
+-	rm -f libgnuintl.h libintl.h charset.alias ref-add.sed ref-del.sed
+-	rm -f -r .libs _libs
+-
+-clean: mostlyclean
+-
+-distclean: clean
+-	rm -f Makefile ID TAGS
+-	if test "$(PACKAGE)" = "gettext-runtime" || test "$(PACKAGE)" = "gettext-tools"; then \
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
+-	if test "$(PACKAGE)" = "gettext-tools"; then \
+-	  : ; \
+-	else \
+-	  if test "$(PACKAGE)" = "gettext-runtime"; then \
+-	    additional="$(DISTFILES.gettext)"; \
+-	  else \
+-	    additional="$(DISTFILES.normal)"; \
+-	  fi; \
+-	  $(MAKE) $(DISTFILES.common) $(DISTFILES.generated) $$additional; \
+-	  for file in ChangeLog $(DISTFILES.common) $(DISTFILES.generated) $$additional; do \
+-	    if test -f $$file; then dir=.; else dir=$(srcdir); fi; \
+-	    cp -p $$dir/$$file $(distdir); \
+-	  done; \
+-	fi
+-
+-Makefile: $(srcdir)/Makefile.in $(top_builddir)/config.status
+-	cd $(top_builddir) && $(SHELL) ./config.status
+-# This would be more efficient, but doesn't work any more with autoconf-2.57,
+-# when AC_CONFIG_FILES([intl/Makefile:somedir/Makefile.in]) is used.
+-#	cd $(top_builddir) && CONFIG_FILES=$(subdir)/$@ CONFIG_HEADERS= $(SHELL) ./config.status
+-
+-# Tell versions [3.59,3.63) of GNU make not to export all variables.
+-# Otherwise a system limit (for SysV at least) may be exceeded.
+-.NOEXPORT:
+--- a/intl/VERSION
++++ /dev/null
+@@ -1 +0,0 @@
+-GNU gettext library from gettext-0.14.2
+--- a/intl/bindtextdom.c
++++ /dev/null
+@@ -1,363 +0,0 @@
+-/* Implementation of the bindtextdomain(3) function
+-   Copyright (C) 1995-1998, 2000-2003 Free Software Foundation, Inc.
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
+-# define _nl_default_dirname libintl_nl_default_dirname
+-# define _nl_domain_bindings libintl_nl_domain_bindings
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
+-#ifdef _LIBC
+-extern const char _nl_default_dirname_internal[] attribute_hidden;
+-#else
+-# define INTUSE(name) name
+-#endif
+-
+-/* List with bindings of specific domains.  */
+-extern struct binding *_nl_domain_bindings;
+-
+-/* Lock variable to protect the global data in the gettext implementation.  */
+-__libc_rwlock_define (extern, _nl_state_lock attribute_hidden)
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
+-# define BINDTEXTDOMAIN libintl_bindtextdomain
+-# define BIND_TEXTDOMAIN_CODESET libintl_bind_textdomain_codeset
+-#endif
+-
+-/* Specifies the directory name *DIRNAMEP and the output codeset *CODESETP
+-   to be used for the DOMAINNAME message catalog.
+-   If *DIRNAMEP or *CODESETP is NULL, the corresponding attribute is not
+-   modified, only the current value is returned.
+-   If DIRNAMEP or CODESETP is NULL, the corresponding attribute is neither
+-   modified nor returned.  */
+-static void
+-set_binding_values (const char *domainname,
+-		    const char **dirnamep, const char **codesetp)
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
+-		  if (strcmp (dirname, INTUSE(_nl_default_dirname)) == 0)
+-		    result = (char *) INTUSE(_nl_default_dirname);
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
+-		      if (binding->dirname != INTUSE(_nl_default_dirname))
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
+-	*dirnamep = INTUSE(_nl_default_dirname);
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
+-	    dirname = INTUSE(_nl_default_dirname);
+-	  else
+-	    {
+-	      if (strcmp (dirname, INTUSE(_nl_default_dirname)) == 0)
+-		dirname = INTUSE(_nl_default_dirname);
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
+-	new_binding->dirname = (char *) INTUSE(_nl_default_dirname);
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
+-	  if (new_binding->dirname != INTUSE(_nl_default_dirname))
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
+-BINDTEXTDOMAIN (const char *domainname, const char *dirname)
+-{
+-  set_binding_values (domainname, &dirname, NULL);
+-  return (char *) dirname;
+-}
+-
+-/* Specify the character encoding in which the messages from the
+-   DOMAINNAME message catalog will be returned.  */
+-char *
+-BIND_TEXTDOMAIN_CODESET (const char *domainname, const char *codeset)
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
+@@ -1,638 +0,0 @@
+-#! /bin/sh
+-# Output a system dependent table of character encoding aliases.
+-#
+-#   Copyright (C) 2000-2004 Free Software Foundation, Inc.
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
+-#       name              MIME?             used by which systems
+-#   ASCII, ANSI_X3.4-1968       glibc solaris freebsd darwin
+-#   ISO-8859-1              Y   glibc aix hpux irix osf solaris freebsd darwin
+-#   ISO-8859-2              Y   glibc aix hpux irix osf solaris freebsd darwin
+-#   ISO-8859-3              Y   glibc solaris
+-#   ISO-8859-4              Y   osf solaris freebsd darwin
+-#   ISO-8859-5              Y   glibc aix hpux irix osf solaris freebsd darwin
+-#   ISO-8859-6              Y   glibc aix hpux solaris
+-#   ISO-8859-7              Y   glibc aix hpux irix osf solaris darwin
+-#   ISO-8859-8              Y   glibc aix hpux osf solaris
+-#   ISO-8859-9              Y   glibc aix hpux irix osf solaris darwin
+-#   ISO-8859-13                 glibc darwin
+-#   ISO-8859-14                 glibc
+-#   ISO-8859-15                 glibc aix osf solaris freebsd darwin
+-#   KOI8-R                  Y   glibc solaris freebsd darwin
+-#   KOI8-U                  Y   glibc freebsd darwin
+-#   KOI8-T                      glibc
+-#   CP437                       dos
+-#   CP775                       dos
+-#   CP850                       aix osf dos
+-#   CP852                       dos
+-#   CP855                       dos
+-#   CP856                       aix
+-#   CP857                       dos
+-#   CP861                       dos
+-#   CP862                       dos
+-#   CP864                       dos
+-#   CP865                       dos
+-#   CP866                       freebsd darwin dos
+-#   CP869                       dos
+-#   CP874                       woe32 dos
+-#   CP922                       aix
+-#   CP932                       aix woe32 dos
+-#   CP943                       aix
+-#   CP949                       osf woe32 dos
+-#   CP950                       woe32 dos
+-#   CP1046                      aix
+-#   CP1124                      aix
+-#   CP1125                      dos
+-#   CP1129                      aix
+-#   CP1250                      woe32
+-#   CP1251                      glibc solaris darwin woe32
+-#   CP1252                      aix woe32
+-#   CP1253                      woe32
+-#   CP1254                      woe32
+-#   CP1255                      glibc woe32
+-#   CP1256                      woe32
+-#   CP1257                      woe32
+-#   GB2312                  Y   glibc aix hpux irix solaris freebsd darwin
+-#   EUC-JP                  Y   glibc aix hpux irix osf solaris freebsd darwin
+-#   EUC-KR                  Y   glibc aix hpux irix osf solaris freebsd darwin
+-#   EUC-TW                      glibc aix hpux irix osf solaris
+-#   BIG5                    Y   glibc aix hpux osf solaris freebsd darwin
+-#   BIG5-HKSCS                  glibc solaris
+-#   GBK                         glibc aix osf solaris woe32 dos
+-#   GB18030                     glibc solaris
+-#   SHIFT_JIS               Y   hpux osf solaris freebsd darwin
+-#   JOHAB                       glibc solaris woe32
+-#   TIS-620                     glibc aix hpux osf solaris
+-#   VISCII                  Y   glibc
+-#   TCVN5712-1                  glibc
+-#   GEORGIAN-PS                 glibc
+-#   HP-ROMAN8                   hpux
+-#   HP-ARABIC8                  hpux
+-#   HP-GREEK8                   hpux
+-#   HP-HEBREW8                  hpux
+-#   HP-TURKISH8                 hpux
+-#   HP-KANA8                    hpux
+-#   DEC-KANJI                   osf
+-#   DEC-HANYU                   osf
+-#   UTF-8                   Y   glibc aix hpux osf solaris darwin
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
+-    linux-gnulibc1*)
+-	# Linux libc5 doesn't have nl_langinfo(CODESET); therefore
+-	# localcharset.c falls back to using the full locale name
+-	# from the environment variables.
+-	echo "C ASCII"
+-	echo "POSIX ASCII"
+-	for l in af af_ZA ca ca_ES da da_DK de de_AT de_BE de_CH de_DE de_LU \
+-	         en en_AU en_BW en_CA en_DK en_GB en_IE en_NZ en_US en_ZA \
+-	         en_ZW es es_AR es_BO es_CL es_CO es_DO es_EC es_ES es_GT \
+-	         es_HN es_MX es_PA es_PE es_PY es_SV es_US es_UY es_VE et \
+-	         et_EE eu eu_ES fi fi_FI fo fo_FO fr fr_BE fr_CA fr_CH fr_FR \
+-	         fr_LU ga ga_IE gl gl_ES id id_ID in in_ID is is_IS it it_CH \
+-	         it_IT kl kl_GL nl nl_BE nl_NL no no_NO pt pt_BR pt_PT sv \
+-	         sv_FI sv_SE; do
+-	  echo "$l ISO-8859-1"
+-	  echo "$l.iso-8859-1 ISO-8859-1"
+-	  echo "$l.iso-8859-15 ISO-8859-15"
+-	  echo "$l.iso-8859-15@euro ISO-8859-15"
+-	  echo "$l@euro ISO-8859-15"
+-	  echo "$l.cp-437 CP437"
+-	  echo "$l.cp-850 CP850"
+-	  echo "$l.cp-1252 CP1252"
+-	  echo "$l.cp-1252@euro CP1252"
+-	  #echo "$l.atari-st ATARI-ST" # not a commonly used encoding
+-	  echo "$l.utf-8 UTF-8"
+-	  echo "$l.utf-8@euro UTF-8"
+-	done
+-	for l in cs cs_CZ hr hr_HR hu hu_HU pl pl_PL ro ro_RO sk sk_SK sl \
+-	         sl_SI sr sr_CS sr_YU; do
+-	  echo "$l ISO-8859-2"
+-	  echo "$l.iso-8859-2 ISO-8859-2"
+-	  echo "$l.cp-852 CP852"
+-	  echo "$l.cp-1250 CP1250"
+-	  echo "$l.utf-8 UTF-8"
+-	done
+-	for l in mk mk_MK ru ru_RU; do
+-	  echo "$l ISO-8859-5"
+-	  echo "$l.iso-8859-5 ISO-8859-5"
+-	  echo "$l.koi8-r KOI8-R"
+-	  echo "$l.cp-866 CP866"
+-	  echo "$l.cp-1251 CP1251"
+-	  echo "$l.utf-8 UTF-8"
+-	done
+-	for l in ar ar_SA; do
+-	  echo "$l ISO-8859-6"
+-	  echo "$l.iso-8859-6 ISO-8859-6"
+-	  echo "$l.cp-864 CP864"
+-	  #echo "$l.cp-868 CP868" # not a commonly used encoding
+-	  echo "$l.cp-1256 CP1256"
+-	  echo "$l.utf-8 UTF-8"
+-	done
+-	for l in el el_GR gr gr_GR; do
+-	  echo "$l ISO-8859-7"
+-	  echo "$l.iso-8859-7 ISO-8859-7"
+-	  echo "$l.cp-869 CP869"
+-	  echo "$l.cp-1253 CP1253"
+-	  echo "$l.cp-1253@euro CP1253"
+-	  echo "$l.utf-8 UTF-8"
+-	  echo "$l.utf-8@euro UTF-8"
+-	done
+-	for l in he he_IL iw iw_IL; do
+-	  echo "$l ISO-8859-8"
+-	  echo "$l.iso-8859-8 ISO-8859-8"
+-	  echo "$l.cp-862 CP862"
+-	  echo "$l.cp-1255 CP1255"
+-	  echo "$l.utf-8 UTF-8"
+-	done
+-	for l in tr tr_TR; do
+-	  echo "$l ISO-8859-9"
+-	  echo "$l.iso-8859-9 ISO-8859-9"
+-	  echo "$l.cp-857 CP857"
+-	  echo "$l.cp-1254 CP1254"
+-	  echo "$l.utf-8 UTF-8"
+-	done
+-	for l in lt lt_LT lv lv_LV; do
+-	  #echo "$l BALTIC" # not a commonly used encoding, wrong encoding name
+-	  echo "$l ISO-8859-13"
+-	done
+-	for l in ru_UA uk uk_UA; do
+-	  echo "$l KOI8-U"
+-	done
+-	for l in zh zh_CN; do
+-	  #echo "$l GB_2312-80" # not a commonly used encoding, wrong encoding name
+-	  echo "$l GB2312"
+-	done
+-	for l in ja ja_JP ja_JP.EUC; do
+-	  echo "$l EUC-JP"
+-	done
+-	for l in ko ko_KR; do
+-	  echo "$l EUC-KR"
+-	done
+-	for l in th th_TH; do
+-	  echo "$l TIS-620"
+-	done
+-	for l in fa fa_IR; do
+-	  #echo "$l ISIRI-3342" # a broken encoding
+-	  echo "$l.utf-8 UTF-8"
+-	done
+-	;;
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
+-	echo "ISO8859-3 ISO-8859-3"
+-	echo "ISO8859-4 ISO-8859-4"
+-	echo "ISO8859-5 ISO-8859-5"
+-	echo "ISO8859-6 ISO-8859-6"
+-	echo "ISO8859-7 ISO-8859-7"
+-	echo "ISO8859-8 ISO-8859-8"
+-	echo "ISO8859-9 ISO-8859-9"
+-	echo "ISO8859-15 ISO-8859-15"
+-	echo "koi8-r KOI8-R"
+-	echo "ansi-1251 CP1251"
+-	echo "BIG5 BIG5"
+-	echo "Big5-HKSCS BIG5-HKSCS"
+-	echo "gb2312 GB2312"
+-	echo "GBK GBK"
+-	echo "GB18030 GB18030"
+-	echo "cns11643 EUC-TW"
+-	echo "5601 EUC-KR"
+-	echo "ko_KR.johap92 JOHAB"
+-	echo "eucJP EUC-JP"
+-	echo "PCK SHIFT_JIS"
+-	echo "TIS620.2533 TIS-620"
+-	#echo "sun_eu_greek ?" # what is this?
+-	echo "UTF-8 UTF-8"
+-	;;
+-    freebsd* | os2*)
+-	# FreeBSD 4.2 doesn't have nl_langinfo(CODESET); therefore
+-	# localcharset.c falls back to using the full locale name
+-	# from the environment variables.
+-	# Likewise for OS/2. OS/2 has XFree86 just like FreeBSD. Just
+-	# reuse FreeBSD's locale data for OS/2.
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
+-    netbsd*)
+-	echo "646 ASCII"
+-	echo "ISO8859-1 ISO-8859-1"
+-	echo "ISO8859-2 ISO-8859-2"
+-	echo "ISO8859-4 ISO-8859-4"
+-	echo "ISO8859-5 ISO-8859-5"
+-	echo "ISO8859-15 ISO-8859-15"
+-	echo "eucCN GB2312"
+-	echo "eucJP EUC-JP"
+-	echo "eucKR EUC-KR"
+-	echo "eucTW EUC-TW"
+-	echo "BIG5 BIG5"
+-	echo "SJIS SHIFT_JIS"
+-	;;
+-    darwin[56]*)
+-	# Darwin 6.8 doesn't have nl_langinfo(CODESET); therefore
+-	# localcharset.c falls back to using the full locale name
+-	# from the environment variables.
+-	echo "C ASCII"
+-	for l in en_AU en_CA en_GB en_US la_LN; do
+-	  echo "$l.US-ASCII ASCII"
+-	done
+-	for l in da_DK de_AT de_CH de_DE en_AU en_CA en_GB en_US es_ES \
+-	         fi_FI fr_BE fr_CA fr_CH fr_FR is_IS it_CH it_IT nl_BE \
+-	         nl_NL no_NO pt_PT sv_SE; do
+-	  echo "$l ISO-8859-1"
+-	  echo "$l.ISO8859-1 ISO-8859-1"
+-	  echo "$l.ISO8859-15 ISO-8859-15"
+-	done
+-	for l in la_LN; do
+-	  echo "$l.ISO8859-1 ISO-8859-1"
+-	  echo "$l.ISO8859-15 ISO-8859-15"
+-	done
+-	for l in cs_CZ hr_HR hu_HU la_LN pl_PL sl_SI; do
+-	  echo "$l.ISO8859-2 ISO-8859-2"
+-	done
+-	for l in la_LN lt_LT; do
+-	  echo "$l.ISO8859-4 ISO-8859-4"
+-	done
+-	for l in ru_RU; do
+-	  echo "$l.KOI8-R KOI8-R"
+-	  echo "$l.ISO8859-5 ISO-8859-5"
+-	  echo "$l.CP866 CP866"
+-	done
+-	for l in bg_BG; do
+-	  echo "$l.CP1251 CP1251"
+-	done
+-	echo "uk_UA.KOI8-U KOI8-U"
+-	echo "zh_TW.BIG5 BIG5"
+-	echo "zh_TW.Big5 BIG5"
+-	echo "zh_CN.EUC GB2312"
+-	echo "ja_JP.EUC EUC-JP"
+-	echo "ja_JP.SJIS SHIFT_JIS"
+-	echo "ko_KR.EUC EUC-KR"
+-	;;
+-    darwin*)
+-	# Darwin 7.5 has nl_langinfo(CODESET), but it is useless:
+-	# - It returns the empty string when LANG is set to a locale of the
+-	#   form ll_CC, although ll_CC/LC_CTYPE is a symlink to an UTF-8
+-	#   LC_CTYPE file.
+-	# - The environment variables LANG, LC_CTYPE, LC_ALL are not set by
+-	#   the system; nl_langinfo(CODESET) returns "US-ASCII" in this case.
+-	# - The documentation says:
+-	#     "... all code that calls BSD system routines should ensure
+-	#      that the const *char parameters of these routines are in UTF-8
+-	#      encoding. All BSD system functions expect their string
+-	#      parameters to be in UTF-8 encoding and nothing else."
+-	#   It also says
+-	#     "An additional caveat is that string parameters for files,
+-	#      paths, and other file-system entities must be in canonical
+-	#      UTF-8. In a canonical UTF-8 Unicode string, all decomposable
+-	#      characters are decomposed ..."
+-	#   but this is not true: You can pass non-decomposed UTF-8 strings
+-	#   to file system functions, and it is the OS which will convert
+-	#   them to decomposed UTF-8 before accessing the file system.
+-	# - The Apple Terminal application displays UTF-8 by default.
+-	# - However, other applications are free to use different encodings:
+-	#   - xterm uses ISO-8859-1 by default.
+-	#   - TextEdit uses MacRoman by default.
+-	# We prefer UTF-8 over decomposed UTF-8-MAC because one should
+-	# minimize the use of decomposed Unicode. Unfortunately, through the
+-	# Darwin file system, decomposed UTF-8 strings are leaked into user
+-	# space nevertheless.
+-	echo "* UTF-8"
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
+-	echo "# and Bruno Haible <bruno@clisp.org>."
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
+-	echo "sr_CS CP852" # CP852 or CP866 or CP855 ??
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
+-	echo "ru CP866"
+-	echo "ru_RU CP866"
+-	echo "uk CP1125"
+-	echo "uk_UA CP1125"
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
+@@ -1,56 +0,0 @@
+-/* Implementation of the dcgettext(3) function.
+-   Copyright (C) 1995-1999, 2000-2003 Free Software Foundation, Inc.
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
+-# define DCGETTEXT libintl_dcgettext
+-# define DCIGETTEXT libintl_dcigettext
+-#endif
+-
+-/* Look up MSGID in the DOMAINNAME message catalog for the current CATEGORY
+-   locale.  */
+-char *
+-DCGETTEXT (const char *domainname, const char *msgid, int category)
+-{
+-  return DCIGETTEXT (domainname, msgid, NULL, 0, 0, category);
+-}
+-
+-#ifdef _LIBC
+-/* Alias for function name in GNU C Library.  */
+-INTDEF(__dcgettext)
+-weak_alias (__dcgettext, dcgettext);
+-#endif
+--- a/intl/dcigettext.c
++++ /dev/null
+@@ -1,1258 +0,0 @@
+-/* Implementation of the internal dcigettext function.
+-   Copyright (C) 1995-1999, 2000-2005 Free Software Foundation, Inc.
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
+-# ifdef _MSC_VER
+-#  include <malloc.h>
+-#  define alloca _alloca
+-# else
+-#  if defined HAVE_ALLOCA_H || defined _LIBC
+-#   include <alloca.h>
+-#  else
+-#   ifdef _AIX
+- #pragma alloca
+-#   else
+-#    ifndef alloca
+-char *alloca ();
+-#    endif
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
+-#include <string.h>
+-
+-#if defined HAVE_UNISTD_H || defined _LIBC
+-# include <unistd.h>
+-#endif
+-
+-#include <locale.h>
+-
+-#ifdef _LIBC
+-  /* Guess whether integer division by zero raises signal SIGFPE.
+-     Set to 1 only if you know for sure.  In case of doubt, set to 0.  */
+-# if defined __alpha__ || defined __arm__ || defined __i386__ \
+-     || defined __m68k__ || defined __s390__
+-#  define INTDIV0_RAISES_SIGFPE 1
+-# else
+-#  define INTDIV0_RAISES_SIGFPE 0
+-# endif
+-#endif
+-#if !INTDIV0_RAISES_SIGFPE
+-# include <signal.h>
+-#endif
+-
+-#if defined HAVE_SYS_PARAM_H || defined _LIBC
+-# include <sys/param.h>
+-#endif
+-
+-#include "gettextP.h"
+-#include "plural-exp.h"
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
+-# define _nl_default_default_domain libintl_nl_default_default_domain
+-# define _nl_current_default_domain libintl_nl_current_default_domain
+-# define _nl_default_dirname libintl_nl_default_dirname
+-# define _nl_domain_bindings libintl_nl_domain_bindings
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
+-#  if VMS
+-#   define getcwd(buf, max) (getcwd) (buf, max, 0)
+-#  else
+-char *getcwd ();
+-#  endif
+-# endif
+-# ifndef HAVE_STPCPY
+-static char *stpcpy (char *dest, const char *src);
+-# endif
+-# ifndef HAVE_MEMPCPY
+-static void *mempcpy (void *dest, const void *src, size_t n);
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
+-#if defined _WIN32 || defined __WIN32__ || defined __CYGWIN__ || defined __EMX__ || defined __DJGPP__
+-  /* Win32, Cygwin, OS/2, DOS */
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
+-static int
+-transcmp (const void *p1, const void *p2)
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
+-#ifndef INTVARDEF
+-# define INTVARDEF(name)
+-#endif
+-#ifndef INTUSE
+-# define INTUSE(name) name
+-#endif
+-
+-/* Name of the default domain used for gettext(3) prior any call to
+-   textdomain(3).  The default value for this is "messages".  */
+-const char _nl_default_default_domain[] attribute_hidden = "messages";
+-
+-/* Value used as the default domain for gettext(3).  */
+-const char *_nl_current_default_domain attribute_hidden
+-     = _nl_default_default_domain;
+-
+-/* Contains the default location of the message catalogs.  */
+-#if defined __EMX__
+-extern const char _nl_default_dirname[];
+-#else
+-const char _nl_default_dirname[] = LOCALEDIR;
+-INTVARDEF (_nl_default_dirname)
+-#endif
+-
+-/* List with bindings of specific domains created by bindtextdomain()
+-   calls.  */
+-struct binding *_nl_domain_bindings;
+-
+-/* Prototypes for local functions.  */
+-static char *plural_lookup (struct loaded_l10nfile *domain,
+-			    unsigned long int n,
+-			    const char *translation, size_t translation_len)
+-     internal_function;
+-static const char *guess_category_value (int category,
+-					 const char *categoryname)
+-     internal_function;
+-#ifdef _LIBC
+-# include "../locale/localeinfo.h"
+-# define category_to_name(category)	_nl_category_names[category]
+-#else
+-static const char *category_to_name (int category) internal_function;
+-#endif
+-
+-
+-/* For those loosing systems which don't have `alloca' we have to add
+-   some additional code emulating it.  */
+-#ifdef HAVE_ALLOCA
+-/* Nothing has to be done.  */
+-# define freea(p) /* nothing */
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
+-      free (old->address);						      \
+-      free (old);							      \
+-    }									      \
+-  } while (0)
+-# undef alloca
+-# define alloca(size) (malloc (size))
+-# define freea(p) free (p)
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
+-# define DCIGETTEXT libintl_dcigettext
+-#endif
+-
+-/* Lock variable to protect the global data in the gettext implementation.  */
+-#ifdef _LIBC
+-__libc_rwlock_define_initialized (, _nl_state_lock attribute_hidden)
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
+-/* Get the function to evaluate the plural expression.  */
+-#include "eval-plural.h"
+-
+-/* Look up MSGID in the DOMAINNAME message catalog for the current
+-   CATEGORY locale and, if PLURAL is nonzero, search over string
+-   depending on the plural form determined by N.  */
+-char *
+-DCIGETTEXT (const char *domainname, const char *msgid1, const char *msgid2,
+-	    int plural, unsigned long int n, int category)
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
+-#ifdef _LIBC
+-  if (category < 0 || category >= __LC_LAST || category == LC_ALL)
+-    /* Bogus.  */
+-    return (plural == 0
+-	    ? (char *) msgid1
+-	    /* Use the Germanic plural rule.  */
+-	    : n == 1 ? (char *) msgid1 : (char *) msgid2);
+-#endif
+-
+-  __libc_rwlock_rdlock (_nl_state_lock);
+-
+-  /* If DOMAINNAME is NULL, we are interested in the default domain.  If
+-     CATEGORY is not LC_MESSAGES this might not make much sense but the
+-     definition left this undefined.  */
+-  if (domainname == NULL)
+-    domainname = _nl_current_default_domain;
+-
+-  /* OS/2 specific: backward compatibility with older libintl versions  */
+-#ifdef LC_MESSAGES_COMPAT
+-  if (category == LC_MESSAGES_COMPAT)
+-    category = LC_MESSAGES;
+-#endif
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
+-  freea (search);
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
+-    dirname = (char *) INTUSE(_nl_default_dirname);
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
+-	/* We cannot get the current working directory.  Don't signal an
+-	   error but simply return the default string.  */
+-	goto return_untranslated;
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
+-	break;
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
+-	      __set_errno (saved_errno);
+-
+-	      /* Now deal with plural.  */
+-	      if (plural)
+-		retval = plural_lookup (domain, n, retval, retlen);
+-
+-	      __libc_rwlock_unlock (_nl_state_lock);
+-	      return retval;
+-	    }
+-	}
+-    }
+-
+- return_untranslated:
+-  /* Return the untranslated MSGID.  */
+-  FREE_BLOCKS (block_list);
+-  __libc_rwlock_unlock (_nl_state_lock);
+-#ifndef _LIBC
+-  if (!ENABLE_SECURE)
+-    {
+-      extern void _nl_log_untranslated (const char *logfilename,
+-					const char *domainname,
+-					const char *msgid1, const char *msgid2,
+-					int plural);
+-      const char *logfilename = getenv ("GETTEXT_LOG_UNTRANSLATED");
+-
+-      if (logfilename != NULL && logfilename[0] != '\0')
+-	_nl_log_untranslated (logfilename, domainname, msgid1, msgid2, plural);
+-    }
+-#endif
+-  __set_errno (saved_errno);
+-  return (plural == 0
+-	  ? (char *) msgid1
+-	  /* Use the Germanic plural rule.  */
+-	  : n == 1 ? (char *) msgid1 : (char *) msgid2);
+-}
+-
+-
+-char *
+-internal_function
+-_nl_find_msg (struct loaded_l10nfile *domain_file,
+-	      struct binding *domainbinding, const char *msgid,
+-	      size_t *lengthp)
+-{
+-  struct loaded_domain *domain;
+-  nls_uint32 nstrings;
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
+-  nstrings = domain->nstrings;
+-
+-  /* Locate the MSGID and its translation.  */
+-  if (domain->hash_tab != NULL)
+-    {
+-      /* Use the hashing table.  */
+-      nls_uint32 len = strlen (msgid);
+-      nls_uint32 hash_val = hash_string (msgid);
+-      nls_uint32 idx = hash_val % domain->hash_size;
+-      nls_uint32 incr = 1 + (hash_val % (domain->hash_size - 2));
+-
+-      while (1)
+-	{
+-	  nls_uint32 nstr =
+-	    W (domain->must_swap_hash_tab, domain->hash_tab[idx]);
+-
+-	  if (nstr == 0)
+-	    /* Hash table entry is empty.  */
+-	    return NULL;
+-
+-	  nstr--;
+-
+-	  /* Compare msgid with the original string at index nstr.
+-	     We compare the lengths with >=, not ==, because plural entries
+-	     are represented by strings with an embedded NUL.  */
+-	  if (nstr < nstrings
+-	      ? W (domain->must_swap, domain->orig_tab[nstr].length) >= len
+-		&& (strcmp (msgid,
+-			    domain->data + W (domain->must_swap,
+-					      domain->orig_tab[nstr].offset))
+-		    == 0)
+-	      : domain->orig_sysdep_tab[nstr - nstrings].length > len
+-		&& (strcmp (msgid,
+-			    domain->orig_sysdep_tab[nstr - nstrings].pointer)
+-		    == 0))
+-	    {
+-	      act = nstr;
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
+-      top = nstrings;
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
+-  if (act < nstrings)
+-    {
+-      result = (char *)
+-	(domain->data + W (domain->must_swap, domain->trans_tab[act].offset));
+-      resultlen = W (domain->must_swap, domain->trans_tab[act].length) + 1;
+-    }
+-  else
+-    {
+-      result = (char *) domain->trans_sysdep_tab[act - nstrings].pointer;
+-      resultlen = domain->trans_sysdep_tab[act - nstrings].length;
+-    }
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
+-	  && ((domain->conv_tab =
+-		 (char **) calloc (nstrings + domain->n_sysdep_strings,
+-				   sizeof (char *)))
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
+-plural_lookup (struct loaded_l10nfile *domain, unsigned long int n,
+-	       const char *translation, size_t translation_len)
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
+-#ifndef _LIBC
+-/* Return string representation of locale CATEGORY.  */
+-static const char *
+-internal_function
+-category_to_name (int category)
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
+-#endif
+-
+-/* Guess value of current locale from value of the environment variables
+-   or system-dependent defaults.  */
+-static const char *
+-internal_function
+-guess_category_value (int category, const char *categoryname)
+-{
+-  const char *language;
+-  const char *locale;
+-#ifndef _LIBC
+-  const char *language_default;
+-  int locale_defaulted;
+-#endif
+-
+-  /* We use the settings in the following order:
+-     1. The value of the environment variable 'LANGUAGE'.  This is a GNU
+-        extension.  Its value can be a colon-separated list of locale names.
+-     2. The value of the environment variable 'LC_ALL', 'LC_xxx', or 'LANG'.
+-        More precisely, the first among these that is set to a non-empty value.
+-        This is how POSIX specifies it.  The value is a single locale name.
+-     3. A system-dependent preference list of languages.  Its value can be a
+-        colon-separated list of locale names.
+-     4. A system-dependent default locale name.
+-     This way:
+-       - System-dependent settings can be overridden by environment variables.
+-       - If the system provides both a list of languages and a default locale,
+-         the former is used.  */
+-
+-  /* Fetch the locale name, through the POSIX method of looking to `LC_ALL',
+-     `LC_xxx', and `LANG'.  On some systems this can be done by the
+-     `setlocale' function itself.  */
+-#ifdef _LIBC
+-  locale = __current_locale_name (category);
+-#else
+-  locale = _nl_locale_name_posix (category, categoryname);
+-  locale_defaulted = 0;
+-  if (locale == NULL)
+-    {
+-      locale = _nl_locale_name_default ();
+-      locale_defaulted = 1;
+-    }
+-#endif
+-
+-  /* Ignore LANGUAGE and its system-dependent analogon if the locale is set
+-     to "C" because
+-     1. "C" locale usually uses the ASCII encoding, and most international
+-	messages use non-ASCII characters. These characters get displayed
+-	as question marks (if using glibc's iconv()) or as invalid 8-bit
+-	characters (because other iconv()s refuse to convert most non-ASCII
+-	characters to ASCII). In any case, the output is ugly.
+-     2. The precise output of some programs in the "C" locale is specified
+-	by POSIX and should not depend on environment variables like
+-	"LANGUAGE" or system-dependent information.  We allow such programs
+-        to use gettext().  */
+-  if (strcmp (locale, "C") == 0)
+-    return locale;
+-
+-  /* The highest priority value is the value of the 'LANGUAGE' environment
+-     variable.  */
+-  language = getenv ("LANGUAGE");
+-  if (language != NULL && language[0] != '\0')
+-    return language;
+-#ifndef _LIBC
+-  /* The next priority value is the locale name, if not defaulted.  */
+-  if (locale_defaulted)
+-    {
+-      /* The next priority value is the default language preferences list. */
+-      language_default = _nl_language_preferences_default ();
+-      if (language_default != NULL)
+-        return language_default;
+-    }
+-  /* The least priority value is the locale name, if defaulted.  */
+-#endif
+-  return locale;
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
+-stpcpy (char *dest, const char *src)
+-{
+-  while ((*dest++ = *src++) != '\0')
+-    /* Do nothing. */ ;
+-  return dest - 1;
+-}
+-#endif
+-
+-#if !_LIBC && !HAVE_MEMPCPY
+-static void *
+-mempcpy (void *dest, const void *src, size_t n)
+-{
+-  return (void *) ((char *) memcpy (dest, src, n) + n);
+-}
+-#endif
+-
+-
+-#ifdef _LIBC
+-/* If we want to free all resources we have to do some work at
+-   program's end.  */
+-libc_freeres_fn (free_mem)
+-{
+-  void *old;
+-
+-  while (_nl_domain_bindings != NULL)
+-    {
+-      struct binding *oldp = _nl_domain_bindings;
+-      _nl_domain_bindings = _nl_domain_bindings->next;
+-      if (oldp->dirname != INTUSE(_nl_default_dirname))
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
+-#endif
+--- a/intl/dcngettext.c
++++ /dev/null
+@@ -1,57 +0,0 @@
+-/* Implementation of the dcngettext(3) function.
+-   Copyright (C) 1995-1999, 2000-2003 Free Software Foundation, Inc.
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
+-# define DCNGETTEXT libintl_dcngettext
+-# define DCIGETTEXT libintl_dcigettext
+-#endif
+-
+-/* Look up MSGID in the DOMAINNAME message catalog for the current CATEGORY
+-   locale.  */
+-char *
+-DCNGETTEXT (const char *domainname,
+-	    const char *msgid1, const char *msgid2, unsigned long int n,
+-	    int category)
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
+@@ -1,58 +0,0 @@
+-/* Implementation of the dgettext(3) function.
+-   Copyright (C) 1995-1997, 2000-2003 Free Software Foundation, Inc.
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
+-
+-#include <locale.h>
+-
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
+-# define DCGETTEXT INTUSE(__dcgettext)
+-#else
+-# define DGETTEXT libintl_dgettext
+-# define DCGETTEXT libintl_dcgettext
+-#endif
+-
+-/* Look up MSGID in the DOMAINNAME message catalog of the current
+-   LC_MESSAGES locale.  */
+-char *
+-DGETTEXT (const char *domainname, const char *msgid)
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
+@@ -1,59 +0,0 @@
+-/* Implementation of the dngettext(3) function.
+-   Copyright (C) 1995-1997, 2000-2003 Free Software Foundation, Inc.
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
+-
+-#include <locale.h>
+-
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
+-# define DNGETTEXT libintl_dngettext
+-# define DCNGETTEXT libintl_dcngettext
+-#endif
+-
+-/* Look up MSGID in the DOMAINNAME message catalog of the current
+-   LC_MESSAGES locale and skip message according to the plural form.  */
+-char *
+-DNGETTEXT (const char *domainname,
+-	   const char *msgid1, const char *msgid2, unsigned long int n)
+-{
+-  return DCNGETTEXT (domainname, msgid1, msgid2, n, LC_MESSAGES);
+-}
+-
+-#ifdef _LIBC
+-/* Alias for function name in GNU C Library.  */
+-weak_alias (__dngettext, dngettext);
+-#endif
+--- a/intl/eval-plural.h
++++ /dev/null
+@@ -1,108 +0,0 @@
+-/* Plural expression evaluation.
+-   Copyright (C) 2000-2003 Free Software Foundation, Inc.
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
+-#ifndef STATIC
+-#define STATIC static
+-#endif
+-
+-/* Evaluate the plural expression and return an index value.  */
+-STATIC
+-unsigned long int
+-internal_function
+-plural_eval (struct expression *pexp, unsigned long int n)
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
+-#if !INTDIV0_RAISES_SIGFPE
+-		if (rightarg == 0)
+-		  raise (SIGFPE);
+-#endif
+-		return leftarg / rightarg;
+-	      case module:
+-#if !INTDIV0_RAISES_SIGFPE
+-		if (rightarg == 0)
+-		  raise (SIGFPE);
+-#endif
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
+--- a/intl/explodename.c
++++ /dev/null
+@@ -1,185 +0,0 @@
+-/* Copyright (C) 1995-1998, 2000-2001, 2003 Free Software Foundation, Inc.
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
+-_nl_find_language (const char *name)
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
+-_nl_explode_name (char *name,
+-		  const char **language, const char **modifier,
+-		  const char **territory, const char **codeset,
+-		  const char **normalized_codeset, const char **special,
+-		  const char **sponsor, const char **revision)
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
+@@ -1,192 +0,0 @@
+-/* Handle list of needed message catalogs
+-   Copyright (C) 1995-1999, 2000-2001, 2003 Free Software Foundation, Inc.
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
+-_nl_find_domain (const char *dirname, char *locale,
+-		 const char *domainname, struct binding *domainbinding)
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
+-libc_freeres_fn (free_mem)
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
+-#endif
+--- a/intl/gettext.c
++++ /dev/null
+@@ -1,63 +0,0 @@
+-/* Implementation of gettext(3) function.
+-   Copyright (C) 1995, 1997, 2000-2003 Free Software Foundation, Inc.
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
+-# define DCGETTEXT INTUSE(__dcgettext)
+-#else
+-# define GETTEXT libintl_gettext
+-# define DCGETTEXT libintl_dcgettext
+-#endif
+-
+-/* Look up MSGID in the current default message catalog for the current
+-   LC_MESSAGES locale.  If not found, returns MSGID itself (the default
+-   text).  */
+-char *
+-GETTEXT (const char *msgid)
+-{
+-  return DCGETTEXT (NULL, msgid, LC_MESSAGES);
+-}
+-
+-#ifdef _LIBC
+-/* Alias for function name in GNU C Library.  */
+-weak_alias (__gettext, gettext);
+-#endif
+--- a/intl/gettextP.h
++++ /dev/null
+@@ -1,218 +0,0 @@
+-/* Header describing internals of libintl library.
+-   Copyright (C) 1995-1999, 2000-2005 Free Software Foundation, Inc.
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
+-#include "gmo.h"		/* Get nls_uint32.  */
+-
+-/* @@ end of prolog @@ */
+-
+-#ifndef internal_function
+-# define internal_function
+-#endif
+-
+-#ifndef attribute_hidden
+-# define attribute_hidden
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
+-/* In-memory representation of system dependent string.  */
+-struct sysdep_string_desc
+-{
+-  /* Length of addressed string, including the trailing NUL.  */
+-  size_t length;
+-  /* Pointer to addressed string.  */
+-  const char *pointer;
+-};
+-
+-/* The representation of an opened message catalog.  */
+-struct loaded_domain
+-{
+-  /* Pointer to memory containing the .mo file.  */
+-  const char *data;
+-  /* 1 if the memory is mmap()ed, 0 if the memory is malloc()ed.  */
+-  int use_mmap;
+-  /* Size of mmap()ed memory.  */
+-  size_t mmap_size;
+-  /* 1 if the .mo file uses a different endianness than this machine.  */
+-  int must_swap;
+-  /* Pointer to additional malloc()ed memory.  */
+-  void *malloced;
+-
+-  /* Number of static strings pairs.  */
+-  nls_uint32 nstrings;
+-  /* Pointer to descriptors of original strings in the file.  */
+-  const struct string_desc *orig_tab;
+-  /* Pointer to descriptors of translated strings in the file.  */
+-  const struct string_desc *trans_tab;
+-
+-  /* Number of system dependent strings pairs.  */
+-  nls_uint32 n_sysdep_strings;
+-  /* Pointer to descriptors of original sysdep strings.  */
+-  const struct sysdep_string_desc *orig_sysdep_tab;
+-  /* Pointer to descriptors of translated sysdep strings.  */
+-  const struct sysdep_string_desc *trans_sysdep_tab;
+-
+-  /* Size of hash table.  */
+-  nls_uint32 hash_size;
+-  /* Pointer to hash table.  */
+-  const nls_uint32 *hash_tab;
+-  /* 1 if the hash table uses a different endianness than this machine.  */
+-  int must_swap_hash_tab;
+-
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
+-#ifndef _LIBC
+-const char *_nl_language_preferences_default (void);
+-const char *_nl_locale_name_posix (int category, const char *categoryname);
+-const char *_nl_locale_name_default (void);
+-const char *_nl_locale_name (int category, const char *categoryname);
+-#endif
+-
+-struct loaded_l10nfile *_nl_find_domain (const char *__dirname, char *__locale,
+-					 const char *__domainname,
+-					 struct binding *__domainbinding)
+-     internal_function;
+-void _nl_load_domain (struct loaded_l10nfile *__domain,
+-		      struct binding *__domainbinding)
+-     internal_function;
+-void _nl_unload_domain (struct loaded_domain *__domain)
+-     internal_function;
+-const char *_nl_init_domain_conv (struct loaded_l10nfile *__domain_file,
+-				  struct loaded_domain *__domain,
+-				  struct binding *__domainbinding)
+-     internal_function;
+-void _nl_free_domain_conv (struct loaded_domain *__domain)
+-     internal_function;
+-
+-char *_nl_find_msg (struct loaded_l10nfile *domain_file,
+-		    struct binding *domainbinding, const char *msgid,
+-		    size_t *lengthp)
+-     internal_function;
+-
+-#ifdef _LIBC
+-extern char *__gettext (const char *__msgid);
+-extern char *__dgettext (const char *__domainname, const char *__msgid);
+-extern char *__dcgettext (const char *__domainname, const char *__msgid,
+-			  int __category);
+-extern char *__ngettext (const char *__msgid1, const char *__msgid2,
+-			 unsigned long int __n);
+-extern char *__dngettext (const char *__domainname,
+-			  const char *__msgid1, const char *__msgid2,
+-			  unsigned long int n);
+-extern char *__dcngettext (const char *__domainname,
+-			   const char *__msgid1, const char *__msgid2,
+-			   unsigned long int __n, int __category);
+-extern char *__dcigettext (const char *__domainname,
+-			   const char *__msgid1, const char *__msgid2,
+-			   int __plural, unsigned long int __n,
+-			   int __category);
+-extern char *__textdomain (const char *__domainname);
+-extern char *__bindtextdomain (const char *__domainname,
+-			       const char *__dirname);
+-extern char *__bind_textdomain_codeset (const char *__domainname,
+-					const char *__codeset);
+-#else
+-/* Declare the exported libintl_* functions, in a way that allows us to
+-   call them under their real name.  */
+-# undef _INTL_REDIRECT_INLINE
+-# undef _INTL_REDIRECT_MACROS
+-# define _INTL_REDIRECT_MACROS
+-# include "libgnuintl.h"
+-extern char *libintl_dcigettext (const char *__domainname,
+-				 const char *__msgid1, const char *__msgid2,
+-				 int __plural, unsigned long int __n,
+-				 int __category);
+-#endif
+-
+-/* @@ begin of epilog @@ */
+-
+-#endif /* gettextP.h  */
+--- a/intl/gmo.h
++++ /dev/null
+@@ -1,149 +0,0 @@
+-/* Description of GNU message catalog format: general file layout.
+-   Copyright (C) 1995, 1997, 2000-2002, 2004 Free Software Foundation, Inc.
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
+-#include <limits.h>
+-
+-/* @@ end of prolog @@ */
+-
+-/* The magic number of the GNU message catalog format.  */
+-#define _MAGIC 0x950412de
+-#define _MAGIC_SWAPPED 0xde120495
+-
+-/* Revision number of the currently used .mo (binary) file format.  */
+-#define MO_REVISION_NUMBER 0
+-#define MO_REVISION_NUMBER_WITH_SYSDEP_I 1
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
+-
+-  /* The following are only used in .mo files with major revision 0 or 1.  */
+-
+-  /* The number of strings pairs.  */
+-  nls_uint32 nstrings;
+-  /* Offset of table with start offsets of original strings.  */
+-  nls_uint32 orig_tab_offset;
+-  /* Offset of table with start offsets of translated strings.  */
+-  nls_uint32 trans_tab_offset;
+-  /* Size of hash table.  */
+-  nls_uint32 hash_tab_size;
+-  /* Offset of first hash table entry.  */
+-  nls_uint32 hash_tab_offset;
+-
+-  /* The following are only used in .mo files with minor revision >= 1.  */
+-
+-  /* The number of system dependent segments.  */
+-  nls_uint32 n_sysdep_segments;
+-  /* Offset of table describing system dependent segments.  */
+-  nls_uint32 sysdep_segments_offset;
+-  /* The number of system dependent strings pairs.  */
+-  nls_uint32 n_sysdep_strings;
+-  /* Offset of table with start offsets of original sysdep strings.  */
+-  nls_uint32 orig_sysdep_tab_offset;
+-  /* Offset of table with start offsets of translated sysdep strings.  */
+-  nls_uint32 trans_sysdep_tab_offset;
+-};
+-
+-/* Descriptor for static string contained in the binary .mo file.  */
+-struct string_desc
+-{
+-  /* Length of addressed string, not including the trailing NUL.  */
+-  nls_uint32 length;
+-  /* Offset of string in file.  */
+-  nls_uint32 offset;
+-};
+-
+-/* The following are only used in .mo files with minor revision >= 1.  */
+-
+-/* Descriptor for system dependent string segment.  */
+-struct sysdep_segment
+-{
+-  /* Length of addressed string, including the trailing NUL.  */
+-  nls_uint32 length;
+-  /* Offset of string in file.  */
+-  nls_uint32 offset;
+-};
+-
+-/* Descriptor for system dependent string.  */
+-struct sysdep_string
+-{
+-  /* Offset of static string segments in file.  */
+-  nls_uint32 offset;
+-  /* Alternating sequence of static and system dependent segments.
+-     The last segment is a static segment, including the trailing NUL.  */
+-  struct segment_pair
+-  {
+-    /* Size of static segment.  */
+-    nls_uint32 segsize;
+-    /* Reference to system dependent string segment, or ~0 at the end.  */
+-    nls_uint32 sysdepref;
+-  } segments[1];
+-};
+-
+-/* Marker for the end of the segments[] array.  This has the value 0xFFFFFFFF,
+-   regardless whether 'int' is 16 bit, 32 bit, or 64 bit.  */
+-#define SEGMENTS_END ((nls_uint32) ~0)
+-
+-/* @@ begin of epilog @@ */
+-
+-#endif	/* gettext.h  */
+--- a/intl/hash-string.h
++++ /dev/null
+@@ -1,48 +0,0 @@
+-/* Description of GNU message catalog format: string hashing function.
+-   Copyright (C) 1995, 1997-1998, 2000-2003 Free Software Foundation, Inc.
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
+-/* We assume to have `unsigned long int' value with at least 32 bits.  */
+-#define HASHWORDBITS 32
+-
+-
+-/* Defines the so called `hashpjw' function by P.J. Weinberger
+-   [see Aho/Sethi/Ullman, COMPILERS: Principles, Techniques and Tools,
+-   1986, 1987 Bell Telephone Laboratories, Inc.]  */
+-static inline unsigned long int
+-hash_string (const char *str_param)
+-{
+-  unsigned long int hval, g;
+-  const char *str = str_param;
+-
+-  /* Compute the hash value for the given string.  */
+-  hval = 0;
+-  while (*str != '\0')
+-    {
+-      hval <<= 4;
+-      hval += (unsigned char) *str++;
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
+@@ -1,131 +0,0 @@
+-/* intl-compat.c - Stub functions to call gettext functions from GNU gettext
+-   Library.
+-   Copyright (C) 1995, 2000-2003 Software Foundation, Inc.
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
+-
+-/* @@ end of prolog @@ */
+-
+-/* This file redirects the gettext functions (without prefix) to those
+-   defined in the included GNU libintl library (with "libintl_" prefix).
+-   It is compiled into libintl in order to make the AM_GNU_GETTEXT test
+-   of gettext <= 0.11.2 work with the libintl library >= 0.11.3 which
+-   has the redirections primarily in the <libintl.h> include file.
+-   It is also compiled into libgnuintl so that libgnuintl.so can be used
+-   as LD_PRELOADable library on glibc systems, to provide the extra
+-   features that the functions in the libc don't have (namely, logging).  */
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
+-/* When building a DLL, we must export some functions.  Note that because
+-   the functions are only defined for binary backward compatibility, we
+-   don't need to use __declspec(dllimport) in any case.  */
+-#if defined _MSC_VER && BUILDING_DLL
+-# define DLL_EXPORTED __declspec(dllexport)
+-#else
+-# define DLL_EXPORTED
+-#endif
+-
+-
+-DLL_EXPORTED
+-char *
+-gettext (const char *msgid)
+-{
+-  return libintl_gettext (msgid);
+-}
+-
+-
+-DLL_EXPORTED
+-char *
+-dgettext (const char *domainname, const char *msgid)
+-{
+-  return libintl_dgettext (domainname, msgid);
+-}
+-
+-
+-DLL_EXPORTED
+-char *
+-dcgettext (const char *domainname, const char *msgid, int category)
+-{
+-  return libintl_dcgettext (domainname, msgid, category);
+-}
+-
+-
+-DLL_EXPORTED
+-char *
+-ngettext (const char *msgid1, const char *msgid2, unsigned long int n)
+-{
+-  return libintl_ngettext (msgid1, msgid2, n);
+-}
+-
+-
+-DLL_EXPORTED
+-char *
+-dngettext (const char *domainname,
+-	   const char *msgid1, const char *msgid2, unsigned long int n)
+-{
+-  return libintl_dngettext (domainname, msgid1, msgid2, n);
+-}
+-
+-
+-DLL_EXPORTED
+-char *
+-dcngettext (const char *domainname,
+-	    const char *msgid1, const char *msgid2, unsigned long int n,
+-	    int category)
+-{
+-  return libintl_dcngettext (domainname, msgid1, msgid2, n, category);
+-}
+-
+-
+-DLL_EXPORTED
+-char *
+-textdomain (const char *domainname)
+-{
+-  return libintl_textdomain (domainname);
+-}
+-
+-
+-DLL_EXPORTED
+-char *
+-bindtextdomain (const char *domainname, const char *dirname)
+-{
+-  return libintl_bindtextdomain (domainname, dirname);
+-}
+-
+-
+-DLL_EXPORTED
+-char *
+-bind_textdomain_codeset (const char *domainname, const char *codeset)
+-{
+-  return libintl_bind_textdomain_codeset (domainname, codeset);
+-}
+--- a/intl/l10nflist.c
++++ /dev/null
+@@ -1,421 +0,0 @@
+-/* Copyright (C) 1995-1999, 2000-2004 Free Software Foundation, Inc.
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
+-static char *stpcpy (char *dest, const char *src);
+-# endif
+-#endif
+-
+-/* Pathname support.
+-   ISSLASH(C)           tests whether C is a directory separator character.
+-   IS_ABSOLUTE_PATH(P)  tests whether P is an absolute path.  If it is not,
+-                        it may be concatenated to a directory pathname.
+- */
+-#if defined _WIN32 || defined __WIN32__ || defined __CYGWIN__ || defined __EMX__ || defined __DJGPP__
+-  /* Win32, Cygwin, OS/2, DOS */
+-# define ISSLASH(C) ((C) == '/' || (C) == '\\')
+-# define HAS_DEVICE(P) \
+-    ((((P)[0] >= 'A' && (P)[0] <= 'Z') || ((P)[0] >= 'a' && (P)[0] <= 'z')) \
+-     && (P)[1] == ':')
+-# define IS_ABSOLUTE_PATH(P) (ISSLASH ((P)[0]) || HAS_DEVICE (P))
+-#else
+-  /* Unix */
+-# define ISSLASH(C) ((C) == '/')
+-# define IS_ABSOLUTE_PATH(P) ISSLASH ((P)[0])
+-#endif
+-
+-/* Define function which are usually not available.  */
+-
+-#if !defined _LIBC && !defined HAVE___ARGZ_COUNT
+-/* Returns the number of strings in ARGZ.  */
+-static size_t
+-argz_count__ (const char *argz, size_t len)
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
+-#else
+-# ifdef _LIBC
+-#  define __argz_count(argz, len) INTUSE(__argz_count) (argz, len)
+-# endif
+-#endif	/* !_LIBC && !HAVE___ARGZ_COUNT */
+-
+-#if !defined _LIBC && !defined HAVE___ARGZ_STRINGIFY
+-/* Make '\0' separated arg vector ARGZ printable by converting all the '\0's
+-   except the last into the character SEP.  */
+-static void
+-argz_stringify__ (char *argz, size_t len, int sep)
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
+-#else
+-# ifdef _LIBC
+-#  define __argz_stringify(argz, len, sep) \
+-  INTUSE(__argz_stringify) (argz, len, sep)
+-# endif
+-#endif	/* !_LIBC && !HAVE___ARGZ_STRINGIFY */
+-
+-#if !defined _LIBC && !defined HAVE___ARGZ_NEXT
+-static char *
+-argz_next__ (char *argz, size_t argz_len, const char *entry)
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
+-static inline int
+-pop (int x)
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
+-_nl_make_l10nflist (struct loaded_l10nfile **l10nfile_list,
+-		    const char *dirlist, size_t dirlist_len,
+-		    int mask, const char *language, const char *territory,
+-		    const char *codeset, const char *normalized_codeset,
+-		    const char *modifier, const char *special,
+-		    const char *sponsor, const char *revision,
+-		    const char *filename, int do_allocate)
+-{
+-  char *abs_filename;
+-  struct loaded_l10nfile **lastp;
+-  struct loaded_l10nfile *retval;
+-  char *cp;
+-  size_t dirlist_count;
+-  size_t entries;
+-  int cnt;
+-
+-  /* If LANGUAGE contains an absolute directory specification, we ignore
+-     DIRLIST.  */
+-  if (IS_ABSOLUTE_PATH (language))
+-    dirlist_len = 0;
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
+-					     ? strlen (sponsor) : 0)
+-					+ ((mask & CEN_REVISION) != 0
+-					   ? strlen (revision) + 1 : 0)) : 0)
+-				  + 1 + strlen (filename) + 1);
+-
+-  if (abs_filename == NULL)
+-    return NULL;
+-
+-  /* Construct file name.  */
+-  cp = abs_filename;
+-  if (dirlist_len > 0)
+-    {
+-      memcpy (cp, dirlist, dirlist_len);
+-      __argz_stringify (cp, dirlist_len, PATH_SEPARATOR);
+-      cp += dirlist_len;
+-      cp[-1] = '/';
+-    }
+-
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
+-  lastp = l10nfile_list;
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
+-	lastp = &retval->next;
+-      }
+-
+-  if (retval != NULL || do_allocate == 0)
+-    {
+-      free (abs_filename);
+-      return retval;
+-    }
+-
+-  dirlist_count = (dirlist_len > 0 ? __argz_count (dirlist, dirlist_len) : 1);
+-
+-  /* Allocate a new loaded_l10nfile.  */
+-  retval =
+-    (struct loaded_l10nfile *)
+-    malloc (sizeof (*retval)
+-	    + (((dirlist_count << pop (mask)) + (dirlist_count > 1 ? 1 : 0))
+-	       * sizeof (struct loaded_l10nfile *)));
+-  if (retval == NULL)
+-    return NULL;
+-
+-  retval->filename = abs_filename;
+-
+-  /* We set retval->data to NULL here; it is filled in later.
+-     Setting retval->decided to 1 here means that retval does not
+-     correspond to a real file (dirlist_count > 1) or is not worth
+-     looking up (if an unnormalized codeset was specified).  */
+-  retval->decided = (dirlist_count > 1
+-		     || ((mask & XPG_CODESET) != 0
+-			 && (mask & XPG_NORM_CODESET) != 0));
+-  retval->data = NULL;
+-
+-  retval->next = *lastp;
+-  *lastp = retval;
+-
+-  entries = 0;
+-  /* Recurse to fill the inheritance list of RETVAL.
+-     If the DIRLIST is a real list (i.e. DIRLIST_COUNT > 1), the RETVAL
+-     entry does not correspond to a real file; retval->filename contains
+-     colons.  In this case we loop across all elements of DIRLIST and
+-     across all bit patterns dominated by MASK.
+-     If the DIRLIST is a single directory or entirely redundant (i.e.
+-     DIRLIST_COUNT == 1), we loop across all bit patterns dominated by
+-     MASK, excluding MASK itself.
+-     In either case, we loop down from MASK to 0.  This has the effect
+-     that the extra bits in the locale name are dropped in this order:
+-     first the modifier, then the territory, then the codeset, then the
+-     normalized_codeset.  */
+-  for (cnt = dirlist_count > 1 ? mask : mask - 1; cnt >= 0; --cnt)
+-    if ((cnt & ~mask) == 0
+-	&& ((cnt & CEN_SPECIFIC) == 0 || (cnt & XPG_SPECIFIC) == 0)
+-	&& ((cnt & XPG_CODESET) == 0 || (cnt & XPG_NORM_CODESET) == 0))
+-      {
+-	if (dirlist_count > 1)
+-	  {
+-	    /* Iterate over all elements of the DIRLIST.  */
+-	    char *dir = NULL;
+-
+-	    while ((dir = __argz_next ((char *) dirlist, dirlist_len, dir))
+-		   != NULL)
+-	      retval->successor[entries++]
+-		= _nl_make_l10nflist (l10nfile_list, dir, strlen (dir) + 1,
+-				      cnt, language, territory, codeset,
+-				      normalized_codeset, modifier, special,
+-				      sponsor, revision, filename, 1);
+-	  }
+-	else
+-	  retval->successor[entries++]
+-	    = _nl_make_l10nflist (l10nfile_list, dirlist, dirlist_len,
+-				  cnt, language, territory, codeset,
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
+-_nl_normalize_codeset (const char *codeset, size_t name_len)
+-{
+-  int len = 0;
+-  int only_digit = 1;
+-  char *retval;
+-  char *wp;
+-  size_t cnt;
+-
+-  for (cnt = 0; cnt < name_len; ++cnt)
+-    if (isalnum ((unsigned char) codeset[cnt]))
+-      {
+-	++len;
+-
+-	if (isalpha ((unsigned char) codeset[cnt]))
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
+-	if (isalpha ((unsigned char) codeset[cnt]))
+-	  *wp++ = tolower ((unsigned char) codeset[cnt]);
+-	else if (isdigit ((unsigned char) codeset[cnt]))
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
+-stpcpy (char *dest, const char *src)
+-{
+-  while ((*dest++ = *src++) != '\0')
+-    /* Do nothing. */ ;
+-  return dest - 1;
+-}
+-#endif
+--- a/intl/langprefs.c
++++ /dev/null
+@@ -1,127 +0,0 @@
+-/* Determine the user's language preferences.
+-   Copyright (C) 2004-2005 Free Software Foundation, Inc.
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
+-/* Written by Bruno Haible <bruno@clisp.org>.  */
+-
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-#include <stdlib.h>
+-
+-#if HAVE_CFPREFERENCESCOPYAPPVALUE
+-# include <string.h>
+-# include <CFPreferences.h>
+-# include <CFPropertyList.h>
+-# include <CFArray.h>
+-# include <CFString.h>
+-#endif
+-
+-/* Determine the user's language preferences, as a colon separated list of
+-   locale names in XPG syntax
+-     language[_territory[.codeset]][@modifier]
+-   The result must not be freed; it is statically allocated.
+-   The LANGUAGE environment variable does not need to be considered; it is
+-   already taken into account by the caller.  */
+-
+-const char *
+-_nl_language_preferences_default (void)
+-{
+-#if HAVE_CFPREFERENCESCOPYAPPVALUE /* MacOS X 10.2 or newer */
+-  {
+-    /* Cache the preferences list, since CoreFoundation calls are expensive.  */
+-    static const char *cached_languages;
+-    static int cache_initialized;
+-
+-    if (!cache_initialized)
+-      {
+-	CFTypeRef preferences =
+-	  CFPreferencesCopyAppValue (CFSTR ("AppleLanguages"),
+-				     kCFPreferencesCurrentApplication);
+-	if (preferences != NULL
+-	    && CFGetTypeID (preferences) == CFArrayGetTypeID ())
+-	  {
+-	    CFArrayRef prefArray = (CFArrayRef)preferences;
+-	    int n = CFArrayGetCount (prefArray);
+-	    char buf[256];
+-	    size_t size = 0;
+-	    int i;
+-
+-	    for (i = 0; i < n; i++)
+-	      {
+-		CFTypeRef element = CFArrayGetValueAtIndex (prefArray, i);
+-		if (element != NULL
+-		    && CFGetTypeID (element) == CFStringGetTypeID ()
+-		    && CFStringGetCString ((CFStringRef)element,
+-					   buf, sizeof (buf),
+-					   kCFStringEncodingASCII))
+-		  {
+-		    size += strlen (buf) + 1;
+-		    /* Most GNU programs use msgids in English and don't ship
+-		       an en.mo message catalog.  Therefore when we see "en"
+-		       in the preferences list, arrange for gettext() to
+-		       return the msgid, and ignore all further elements of
+-		       the preferences list.  */
+-		    if (strcmp (buf, "en") == 0)
+-		      break;
+-		  }
+-		else
+-		  break;
+-	      }
+-	    if (size > 0)
+-	      {
+-		char *languages = (char *) malloc (size);
+-
+-		if (languages != NULL)
+-		  {
+-		    char *p = languages;
+-
+-		    for (i = 0; i < n; i++)
+-		      {
+-			CFTypeRef element =
+-			  CFArrayGetValueAtIndex (prefArray, i);
+-			if (element != NULL
+-		            && CFGetTypeID (element) == CFStringGetTypeID ()
+-			    && CFStringGetCString ((CFStringRef)element,
+-						   buf, sizeof (buf),
+-						   kCFStringEncodingASCII))
+-			  {
+-			    strcpy (p, buf);
+-			    p += strlen (buf);
+-			    *p++ = ':';
+-			    if (strcmp (buf, "en") == 0)
+-			      break;
+-			  }
+-			else
+-			  break;
+-		      }
+-		    *--p = '\0';
+-
+-		    cached_languages = languages;
+-		  }
+-	      }
+-	  }
+-	cache_initialized = 1;
+-      }
+-    if (cached_languages != NULL)
+-      return cached_languages;
+-  }
+-#endif
+-
+-  return NULL;
+-}
+--- a/intl/libgnuintl.h.in
++++ /dev/null
+@@ -1,383 +0,0 @@
+-/* Message catalogs for internationalization.
+-   Copyright (C) 1995-1997, 2000-2004 Free Software Foundation, Inc.
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
+-   On Solaris, <locale.h> defines __LOCALE_H (or _LOCALE_H in Solaris 2.5)
+-   then includes <libintl.h> (i.e. this file!) and then only defines
+-   LC_MESSAGES.  To avoid a redefinition warning, don't define LC_MESSAGES
+-   in this case.  */
+-#if !defined LC_MESSAGES && !(defined __LOCALE_H || (defined _LOCALE_H && defined __sun))
+-# define LC_MESSAGES 1729
+-#endif
+-
+-/* We define an additional symbol to signal that we use the GNU
+-   implementation of gettext.  */
+-#define __USE_GNU_GETTEXT 1
+-
+-/* Provide information about the supported file formats.  Returns the
+-   maximum minor revision number supported for a given major revision.  */
+-#define __GNU_GETTEXT_SUPPORTED_REVISION(major) \
+-  ((major) == 0 || (major) == 1 ? 1 : -1)
+-
+-/* Resolve a platform specific conflict on DJGPP.  GNU gettext takes
+-   precedence over _conio_gettext.  */
+-#ifdef __DJGPP__
+-# undef gettext
+-#endif
+-
+-#ifdef __cplusplus
+-extern "C" {
+-#endif
+-
+-
+-/* We redirect the functions to those prefixed with "libintl_".  This is
+-   necessary, because some systems define gettext/textdomain/... in the C
+-   library (namely, Solaris 2.4 and newer, and GNU libc 2.0 and newer).
+-   If we used the unprefixed names, there would be cases where the
+-   definition in the C library would override the one in the libintl.so
+-   shared library.  Recall that on ELF systems, the symbols are looked
+-   up in the following order:
+-     1. in the executable,
+-     2. in the shared libraries specified on the link command line, in order,
+-     3. in the dependencies of the shared libraries specified on the link
+-        command line,
+-     4. in the dlopen()ed shared libraries, in the order in which they were
+-        dlopen()ed.
+-   The definition in the C library would override the one in libintl.so if
+-   either
+-     * -lc is given on the link command line and -lintl isn't, or
+-     * -lc is given on the link command line before -lintl, or
+-     * libintl.so is a dependency of a dlopen()ed shared library but not
+-       linked to the executable at link time.
+-   Since Solaris gettext() behaves differently than GNU gettext(), this
+-   would be unacceptable.
+-
+-   The redirection happens by default through macros in C, so that &gettext
+-   is independent of the compilation unit, but through inline functions in
+-   C++, in order not to interfere with the name mangling of class fields or
+-   class methods called 'gettext'.  */
+-
+-/* The user can define _INTL_REDIRECT_INLINE or _INTL_REDIRECT_MACROS.
+-   If he doesn't, we choose the method.  A third possible method is
+-   _INTL_REDIRECT_ASM, supported only by GCC.  */
+-#if !(defined _INTL_REDIRECT_INLINE || defined _INTL_REDIRECT_MACROS)
+-# if __GNUC__ >= 2 && !defined __APPLE_CC__ && !defined __MINGW32__ && !(__GNUC__ == 2 && defined _AIX) && (defined __STDC__ || defined __cplusplus)
+-#  define _INTL_REDIRECT_ASM
+-# else
+-#  ifdef __cplusplus
+-#   define _INTL_REDIRECT_INLINE
+-#  else
+-#   define _INTL_REDIRECT_MACROS
+-#  endif
+-# endif
+-#endif
+-/* Auxiliary macros.  */
+-#ifdef _INTL_REDIRECT_ASM
+-# define _INTL_ASM(cname) __asm__ (_INTL_ASMNAME (__USER_LABEL_PREFIX__, #cname))
+-# define _INTL_ASMNAME(prefix,cnamestring) _INTL_STRINGIFY (prefix) cnamestring
+-# define _INTL_STRINGIFY(prefix) #prefix
+-#else
+-# define _INTL_ASM(cname)
+-#endif
+-
+-/* Look up MSGID in the current default message catalog for the current
+-   LC_MESSAGES locale.  If not found, returns MSGID itself (the default
+-   text).  */
+-#ifdef _INTL_REDIRECT_INLINE
+-extern char *libintl_gettext (const char *__msgid);
+-static inline char *gettext (const char *__msgid)
+-{
+-  return libintl_gettext (__msgid);
+-}
+-#else
+-#ifdef _INTL_REDIRECT_MACROS
+-# define gettext libintl_gettext
+-#endif
+-extern char *gettext (const char *__msgid)
+-       _INTL_ASM (libintl_gettext);
+-#endif
+-
+-/* Look up MSGID in the DOMAINNAME message catalog for the current
+-   LC_MESSAGES locale.  */
+-#ifdef _INTL_REDIRECT_INLINE
+-extern char *libintl_dgettext (const char *__domainname, const char *__msgid);
+-static inline char *dgettext (const char *__domainname, const char *__msgid)
+-{
+-  return libintl_dgettext (__domainname, __msgid);
+-}
+-#else
+-#ifdef _INTL_REDIRECT_MACROS
+-# define dgettext libintl_dgettext
+-#endif
+-extern char *dgettext (const char *__domainname, const char *__msgid)
+-       _INTL_ASM (libintl_dgettext);
+-#endif
+-
+-/* Look up MSGID in the DOMAINNAME message catalog for the current CATEGORY
+-   locale.  */
+-#ifdef _INTL_REDIRECT_INLINE
+-extern char *libintl_dcgettext (const char *__domainname, const char *__msgid,
+-				int __category);
+-static inline char *dcgettext (const char *__domainname, const char *__msgid,
+-			       int __category)
+-{
+-  return libintl_dcgettext (__domainname, __msgid, __category);
+-}
+-#else
+-#ifdef _INTL_REDIRECT_MACROS
+-# define dcgettext libintl_dcgettext
+-#endif
+-extern char *dcgettext (const char *__domainname, const char *__msgid,
+-			int __category)
+-       _INTL_ASM (libintl_dcgettext);
+-#endif
+-
+-
+-/* Similar to `gettext' but select the plural form corresponding to the
+-   number N.  */
+-#ifdef _INTL_REDIRECT_INLINE
+-extern char *libintl_ngettext (const char *__msgid1, const char *__msgid2,
+-			       unsigned long int __n);
+-static inline char *ngettext (const char *__msgid1, const char *__msgid2,
+-			      unsigned long int __n)
+-{
+-  return libintl_ngettext (__msgid1, __msgid2, __n);
+-}
+-#else
+-#ifdef _INTL_REDIRECT_MACROS
+-# define ngettext libintl_ngettext
+-#endif
+-extern char *ngettext (const char *__msgid1, const char *__msgid2,
+-		       unsigned long int __n)
+-       _INTL_ASM (libintl_ngettext);
+-#endif
+-
+-/* Similar to `dgettext' but select the plural form corresponding to the
+-   number N.  */
+-#ifdef _INTL_REDIRECT_INLINE
+-extern char *libintl_dngettext (const char *__domainname, const char *__msgid1,
+-				const char *__msgid2, unsigned long int __n);
+-static inline char *dngettext (const char *__domainname, const char *__msgid1,
+-			       const char *__msgid2, unsigned long int __n)
+-{
+-  return libintl_dngettext (__domainname, __msgid1, __msgid2, __n);
+-}
+-#else
+-#ifdef _INTL_REDIRECT_MACROS
+-# define dngettext libintl_dngettext
+-#endif
+-extern char *dngettext (const char *__domainname,
+-			const char *__msgid1, const char *__msgid2,
+-			unsigned long int __n)
+-       _INTL_ASM (libintl_dngettext);
+-#endif
+-
+-/* Similar to `dcgettext' but select the plural form corresponding to the
+-   number N.  */
+-#ifdef _INTL_REDIRECT_INLINE
+-extern char *libintl_dcngettext (const char *__domainname,
+-				 const char *__msgid1, const char *__msgid2,
+-				 unsigned long int __n, int __category);
+-static inline char *dcngettext (const char *__domainname,
+-				const char *__msgid1, const char *__msgid2,
+-				unsigned long int __n, int __category)
+-{
+-  return libintl_dcngettext (__domainname, __msgid1, __msgid2, __n, __category);
+-}
+-#else
+-#ifdef _INTL_REDIRECT_MACROS
+-# define dcngettext libintl_dcngettext
+-#endif
+-extern char *dcngettext (const char *__domainname,
+-			 const char *__msgid1, const char *__msgid2,
+-			 unsigned long int __n, int __category)
+-       _INTL_ASM (libintl_dcngettext);
+-#endif
+-
+-
+-/* Set the current default message catalog to DOMAINNAME.
+-   If DOMAINNAME is null, return the current default.
+-   If DOMAINNAME is "", reset to the default of "messages".  */
+-#ifdef _INTL_REDIRECT_INLINE
+-extern char *libintl_textdomain (const char *__domainname);
+-static inline char *textdomain (const char *__domainname)
+-{
+-  return libintl_textdomain (__domainname);
+-}
+-#else
+-#ifdef _INTL_REDIRECT_MACROS
+-# define textdomain libintl_textdomain
+-#endif
+-extern char *textdomain (const char *__domainname)
+-       _INTL_ASM (libintl_textdomain);
+-#endif
+-
+-/* Specify that the DOMAINNAME message catalog will be found
+-   in DIRNAME rather than in the system locale data base.  */
+-#ifdef _INTL_REDIRECT_INLINE
+-extern char *libintl_bindtextdomain (const char *__domainname,
+-				     const char *__dirname);
+-static inline char *bindtextdomain (const char *__domainname,
+-				    const char *__dirname)
+-{
+-  return libintl_bindtextdomain (__domainname, __dirname);
+-}
+-#else
+-#ifdef _INTL_REDIRECT_MACROS
+-# define bindtextdomain libintl_bindtextdomain
+-#endif
+-extern char *bindtextdomain (const char *__domainname, const char *__dirname)
+-       _INTL_ASM (libintl_bindtextdomain);
+-#endif
+-
+-/* Specify the character encoding in which the messages from the
+-   DOMAINNAME message catalog will be returned.  */
+-#ifdef _INTL_REDIRECT_INLINE
+-extern char *libintl_bind_textdomain_codeset (const char *__domainname,
+-					      const char *__codeset);
+-static inline char *bind_textdomain_codeset (const char *__domainname,
+-					     const char *__codeset)
+-{
+-  return libintl_bind_textdomain_codeset (__domainname, __codeset);
+-}
+-#else
+-#ifdef _INTL_REDIRECT_MACROS
+-# define bind_textdomain_codeset libintl_bind_textdomain_codeset
+-#endif
+-extern char *bind_textdomain_codeset (const char *__domainname,
+-				      const char *__codeset)
+-       _INTL_ASM (libintl_bind_textdomain_codeset);
+-#endif
+-
+-
+-/* Support for format strings with positions in *printf(), following the
+-   POSIX/XSI specification.
+-   Note: These replacements for the *printf() functions are visible only
+-   in source files that #include <libintl.h> or #include "gettext.h".
+-   Packages that use *printf() in source files that don't refer to _()
+-   or gettext() but for which the format string could be the return value
+-   of _() or gettext() need to add this #include.  Oh well.  */
+-
+-#if !@HAVE_POSIX_PRINTF@
+-
+-#include <stdio.h>
+-#include <stddef.h>
+-
+-/* Get va_list.  */
+-#if __STDC__ || defined __cplusplus || defined _MSC_VER
+-# include <stdarg.h>
+-#else
+-# include <varargs.h>
+-#endif
+-
+-#undef fprintf
+-#define fprintf libintl_fprintf
+-extern int fprintf (FILE *, const char *, ...);
+-#undef vfprintf
+-#define vfprintf libintl_vfprintf
+-extern int vfprintf (FILE *, const char *, va_list);
+-
+-#undef printf
+-#define printf libintl_printf
+-extern int printf (const char *, ...);
+-#undef vprintf
+-#define vprintf libintl_vprintf
+-extern int vprintf (const char *, va_list);
+-
+-#undef sprintf
+-#define sprintf libintl_sprintf
+-extern int sprintf (char *, const char *, ...);
+-#undef vsprintf
+-#define vsprintf libintl_vsprintf
+-extern int vsprintf (char *, const char *, va_list);
+-
+-#if @HAVE_SNPRINTF@
+-
+-#undef snprintf
+-#define snprintf libintl_snprintf
+-extern int snprintf (char *, size_t, const char *, ...);
+-#undef vsnprintf
+-#define vsnprintf libintl_vsnprintf
+-extern int vsnprintf (char *, size_t, const char *, va_list);
+-
+-#endif
+-
+-#if @HAVE_ASPRINTF@
+-
+-#undef asprintf
+-#define asprintf libintl_asprintf
+-extern int asprintf (char **, const char *, ...);
+-#undef vasprintf
+-#define vasprintf libintl_vasprintf
+-extern int vasprintf (char **, const char *, va_list);
+-
+-#endif
+-
+-#if @HAVE_WPRINTF@
+-
+-#undef fwprintf
+-#define fwprintf libintl_fwprintf
+-extern int fwprintf (FILE *, const wchar_t *, ...);
+-#undef vfwprintf
+-#define vfwprintf libintl_vfwprintf
+-extern int vfwprintf (FILE *, const wchar_t *, va_list);
+-
+-#undef wprintf
+-#define wprintf libintl_wprintf
+-extern int wprintf (const wchar_t *, ...);
+-#undef vwprintf
+-#define vwprintf libintl_vwprintf
+-extern int vwprintf (const wchar_t *, va_list);
+-
+-#undef swprintf
+-#define swprintf libintl_swprintf
+-extern int swprintf (wchar_t *, size_t, const wchar_t *, ...);
+-#undef vswprintf
+-#define vswprintf libintl_vswprintf
+-extern int vswprintf (wchar_t *, size_t, const wchar_t *, va_list);
+-
+-#endif
+-
+-#endif
+-
+-
+-/* Support for relocatable packages.  */
+-
+-/* Sets the original and the current installation prefix of the package.
+-   Relocation simply replaces a pathname starting with the original prefix
+-   by the corresponding pathname with the current prefix instead.  Both
+-   prefixes should be directory names without trailing slash (i.e. use ""
+-   instead of "/").  */
+-#define libintl_set_relocation_prefix libintl_set_relocation_prefix
+-extern void
+-       libintl_set_relocation_prefix (const char *orig_prefix,
+-				      const char *curr_prefix);
+-
+-
+-#ifdef __cplusplus
+-}
+-#endif
+-
+-#endif /* libintl.h */
+--- a/intl/loadinfo.h
++++ /dev/null
+@@ -1,145 +0,0 @@
+-/* Copyright (C) 1996-1999, 2000-2003 Free Software Foundation, Inc.
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
+-/* Declarations of locale dependent catalog lookup functions.
+-   Implemented in
+-
+-     localealias.c    Possibly replace a locale name by another.
+-     explodename.c    Split a locale name into its various fields.
+-     l10nflist.c      Generate a list of filenames of possible message catalogs.
+-     finddomain.c     Find and open the relevant message catalogs.
+-
+-   The main function _nl_find_domain() in finddomain.c is declared
+-   in gettextP.h.
+- */
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
+-extern const char *_nl_normalize_codeset (const char *codeset,
+-					  size_t name_len);
+-
+-/* Lookup a locale dependent file.
+-   *L10NFILE_LIST denotes a pool of lookup results of locale dependent
+-   files of the same kind, sorted in decreasing order of ->filename.
+-   DIRLIST and DIRLIST_LEN are an argz list of directories in which to
+-   look, containing at least one directory (i.e. DIRLIST_LEN > 0).
+-   MASK, LANGUAGE, TERRITORY, CODESET, NORMALIZED_CODESET, MODIFIER,
+-   SPECIAL, SPONSOR, REVISION are the pieces of the locale name, as
+-   produced by _nl_explode_name().  FILENAME is the filename suffix.
+-   The return value is the lookup result, either found in *L10NFILE_LIST,
+-   or - if DO_ALLOCATE is nonzero - freshly allocated, or possibly NULL.
+-   If the return value is non-NULL, it is added to *L10NFILE_LIST, and
+-   its ->next field denotes the chaining inside *L10NFILE_LIST, and
+-   furthermore its ->successor[] field contains a list of other lookup
+-   results from which this lookup result inherits.  */
+-extern struct loaded_l10nfile *
+-_nl_make_l10nflist (struct loaded_l10nfile **l10nfile_list,
+-		    const char *dirlist, size_t dirlist_len, int mask,
+-		    const char *language, const char *territory,
+-		    const char *codeset, const char *normalized_codeset,
+-		    const char *modifier, const char *special,
+-		    const char *sponsor, const char *revision,
+-		    const char *filename, int do_allocate);
+-
+-/* Lookup the real locale name for a locale alias NAME, or NULL if
+-   NAME is not a locale alias (but possibly a real locale name).
+-   The return value is statically allocated and must not be freed.  */
+-extern const char *_nl_expand_alias (const char *name);
+-
+-/* Split a locale name NAME into its pieces: language, modifier,
+-   territory, codeset, special, sponsor, revision.
+-   NAME gets destructively modified: NUL bytes are inserted here and
+-   there.  *LANGUAGE gets assigned NAME.  Each of *MODIFIER, *TERRITORY,
+-   *CODESET, *SPECIAL, *SPONSOR, *REVISION gets assigned either a
+-   pointer into the old NAME string, or NULL.  *NORMALIZED_CODESET
+-   gets assigned the expanded *CODESET, if it is different from *CODESET;
+-   this one is dynamically allocated and has to be freed by the caller.
+-   The return value is a bitmask, where each bit corresponds to one
+-   filled-in value:
+-     XPG_MODIFIER, CEN_AUDIENCE  for *MODIFIER,
+-     TERRITORY                   for *TERRITORY,
+-     XPG_CODESET                 for *CODESET,
+-     XPG_NORM_CODESET            for *NORMALIZED_CODESET,
+-     CEN_SPECIAL                 for *SPECIAL,
+-     CEN_SPONSOR                 for *SPONSOR,
+-     CEN_REVISION                for *REVISION.
+- */
+-extern int _nl_explode_name (char *name, const char **language,
+-			     const char **modifier, const char **territory,
+-			     const char **codeset,
+-			     const char **normalized_codeset,
+-			     const char **special, const char **sponsor,
+-			     const char **revision);
+-
+-/* Split a locale name NAME into a leading language part and all the
+-   rest.  Return a pointer to the first character after the language,
+-   i.e. to the first byte of the rest.  */
+-extern char *_nl_find_language (const char *name);
+-
+-#endif	/* loadinfo.h */
+--- a/intl/loadmsgcat.c
++++ /dev/null
+@@ -1,1420 +0,0 @@
+-/* Load needed message catalogs.
+-   Copyright (C) 1995-1999, 2000-2004 Free Software Foundation, Inc.
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
+-# undef  alloca
+-# define alloca __builtin_alloca
+-# define HAVE_ALLOCA 1
+-#else
+-# ifdef _MSC_VER
+-#  include <malloc.h>
+-#  define alloca _alloca
+-# else
+-#  if defined HAVE_ALLOCA_H || defined _LIBC
+-#   include <alloca.h>
+-#  else
+-#   ifdef _AIX
+- #pragma alloca
+-#   else
+-#    ifndef alloca
+-char *alloca ();
+-#    endif
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
+-#if defined HAVE_STDINT_H_WITH_UINTMAX || defined _LIBC
+-# include <stdint.h>
+-#endif
+-#if defined HAVE_INTTYPES_H || defined _LIBC
+-# include <inttypes.h>
+-#endif
+-
+-#include "gmo.h"
+-#include "gettextP.h"
+-#include "hash-string.h"
+-#include "plural-exp.h"
+-
+-#ifdef _LIBC
+-# include "../locale/localeinfo.h"
+-#endif
+-
+-/* Provide fallback values for macros that ought to be defined in <inttypes.h>.
+-   Note that our fallback values need not be literal strings, because we don't
+-   use them with preprocessor string concatenation.  */
+-#if !defined PRId8 || PRI_MACROS_BROKEN
+-# undef PRId8
+-# define PRId8 "d"
+-#endif
+-#if !defined PRIi8 || PRI_MACROS_BROKEN
+-# undef PRIi8
+-# define PRIi8 "i"
+-#endif
+-#if !defined PRIo8 || PRI_MACROS_BROKEN
+-# undef PRIo8
+-# define PRIo8 "o"
+-#endif
+-#if !defined PRIu8 || PRI_MACROS_BROKEN
+-# undef PRIu8
+-# define PRIu8 "u"
+-#endif
+-#if !defined PRIx8 || PRI_MACROS_BROKEN
+-# undef PRIx8
+-# define PRIx8 "x"
+-#endif
+-#if !defined PRIX8 || PRI_MACROS_BROKEN
+-# undef PRIX8
+-# define PRIX8 "X"
+-#endif
+-#if !defined PRId16 || PRI_MACROS_BROKEN
+-# undef PRId16
+-# define PRId16 "d"
+-#endif
+-#if !defined PRIi16 || PRI_MACROS_BROKEN
+-# undef PRIi16
+-# define PRIi16 "i"
+-#endif
+-#if !defined PRIo16 || PRI_MACROS_BROKEN
+-# undef PRIo16
+-# define PRIo16 "o"
+-#endif
+-#if !defined PRIu16 || PRI_MACROS_BROKEN
+-# undef PRIu16
+-# define PRIu16 "u"
+-#endif
+-#if !defined PRIx16 || PRI_MACROS_BROKEN
+-# undef PRIx16
+-# define PRIx16 "x"
+-#endif
+-#if !defined PRIX16 || PRI_MACROS_BROKEN
+-# undef PRIX16
+-# define PRIX16 "X"
+-#endif
+-#if !defined PRId32 || PRI_MACROS_BROKEN
+-# undef PRId32
+-# define PRId32 "d"
+-#endif
+-#if !defined PRIi32 || PRI_MACROS_BROKEN
+-# undef PRIi32
+-# define PRIi32 "i"
+-#endif
+-#if !defined PRIo32 || PRI_MACROS_BROKEN
+-# undef PRIo32
+-# define PRIo32 "o"
+-#endif
+-#if !defined PRIu32 || PRI_MACROS_BROKEN
+-# undef PRIu32
+-# define PRIu32 "u"
+-#endif
+-#if !defined PRIx32 || PRI_MACROS_BROKEN
+-# undef PRIx32
+-# define PRIx32 "x"
+-#endif
+-#if !defined PRIX32 || PRI_MACROS_BROKEN
+-# undef PRIX32
+-# define PRIX32 "X"
+-#endif
+-#if !defined PRId64 || PRI_MACROS_BROKEN
+-# undef PRId64
+-# define PRId64 (sizeof (long) == 8 ? "ld" : "lld")
+-#endif
+-#if !defined PRIi64 || PRI_MACROS_BROKEN
+-# undef PRIi64
+-# define PRIi64 (sizeof (long) == 8 ? "li" : "lli")
+-#endif
+-#if !defined PRIo64 || PRI_MACROS_BROKEN
+-# undef PRIo64
+-# define PRIo64 (sizeof (long) == 8 ? "lo" : "llo")
+-#endif
+-#if !defined PRIu64 || PRI_MACROS_BROKEN
+-# undef PRIu64
+-# define PRIu64 (sizeof (long) == 8 ? "lu" : "llu")
+-#endif
+-#if !defined PRIx64 || PRI_MACROS_BROKEN
+-# undef PRIx64
+-# define PRIx64 (sizeof (long) == 8 ? "lx" : "llx")
+-#endif
+-#if !defined PRIX64 || PRI_MACROS_BROKEN
+-# undef PRIX64
+-# define PRIX64 (sizeof (long) == 8 ? "lX" : "llX")
+-#endif
+-#if !defined PRIdLEAST8 || PRI_MACROS_BROKEN
+-# undef PRIdLEAST8
+-# define PRIdLEAST8 "d"
+-#endif
+-#if !defined PRIiLEAST8 || PRI_MACROS_BROKEN
+-# undef PRIiLEAST8
+-# define PRIiLEAST8 "i"
+-#endif
+-#if !defined PRIoLEAST8 || PRI_MACROS_BROKEN
+-# undef PRIoLEAST8
+-# define PRIoLEAST8 "o"
+-#endif
+-#if !defined PRIuLEAST8 || PRI_MACROS_BROKEN
+-# undef PRIuLEAST8
+-# define PRIuLEAST8 "u"
+-#endif
+-#if !defined PRIxLEAST8 || PRI_MACROS_BROKEN
+-# undef PRIxLEAST8
+-# define PRIxLEAST8 "x"
+-#endif
+-#if !defined PRIXLEAST8 || PRI_MACROS_BROKEN
+-# undef PRIXLEAST8
+-# define PRIXLEAST8 "X"
+-#endif
+-#if !defined PRIdLEAST16 || PRI_MACROS_BROKEN
+-# undef PRIdLEAST16
+-# define PRIdLEAST16 "d"
+-#endif
+-#if !defined PRIiLEAST16 || PRI_MACROS_BROKEN
+-# undef PRIiLEAST16
+-# define PRIiLEAST16 "i"
+-#endif
+-#if !defined PRIoLEAST16 || PRI_MACROS_BROKEN
+-# undef PRIoLEAST16
+-# define PRIoLEAST16 "o"
+-#endif
+-#if !defined PRIuLEAST16 || PRI_MACROS_BROKEN
+-# undef PRIuLEAST16
+-# define PRIuLEAST16 "u"
+-#endif
+-#if !defined PRIxLEAST16 || PRI_MACROS_BROKEN
+-# undef PRIxLEAST16
+-# define PRIxLEAST16 "x"
+-#endif
+-#if !defined PRIXLEAST16 || PRI_MACROS_BROKEN
+-# undef PRIXLEAST16
+-# define PRIXLEAST16 "X"
+-#endif
+-#if !defined PRIdLEAST32 || PRI_MACROS_BROKEN
+-# undef PRIdLEAST32
+-# define PRIdLEAST32 "d"
+-#endif
+-#if !defined PRIiLEAST32 || PRI_MACROS_BROKEN
+-# undef PRIiLEAST32
+-# define PRIiLEAST32 "i"
+-#endif
+-#if !defined PRIoLEAST32 || PRI_MACROS_BROKEN
+-# undef PRIoLEAST32
+-# define PRIoLEAST32 "o"
+-#endif
+-#if !defined PRIuLEAST32 || PRI_MACROS_BROKEN
+-# undef PRIuLEAST32
+-# define PRIuLEAST32 "u"
+-#endif
+-#if !defined PRIxLEAST32 || PRI_MACROS_BROKEN
+-# undef PRIxLEAST32
+-# define PRIxLEAST32 "x"
+-#endif
+-#if !defined PRIXLEAST32 || PRI_MACROS_BROKEN
+-# undef PRIXLEAST32
+-# define PRIXLEAST32 "X"
+-#endif
+-#if !defined PRIdLEAST64 || PRI_MACROS_BROKEN
+-# undef PRIdLEAST64
+-# define PRIdLEAST64 PRId64
+-#endif
+-#if !defined PRIiLEAST64 || PRI_MACROS_BROKEN
+-# undef PRIiLEAST64
+-# define PRIiLEAST64 PRIi64
+-#endif
+-#if !defined PRIoLEAST64 || PRI_MACROS_BROKEN
+-# undef PRIoLEAST64
+-# define PRIoLEAST64 PRIo64
+-#endif
+-#if !defined PRIuLEAST64 || PRI_MACROS_BROKEN
+-# undef PRIuLEAST64
+-# define PRIuLEAST64 PRIu64
+-#endif
+-#if !defined PRIxLEAST64 || PRI_MACROS_BROKEN
+-# undef PRIxLEAST64
+-# define PRIxLEAST64 PRIx64
+-#endif
+-#if !defined PRIXLEAST64 || PRI_MACROS_BROKEN
+-# undef PRIXLEAST64
+-# define PRIXLEAST64 PRIX64
+-#endif
+-#if !defined PRIdFAST8 || PRI_MACROS_BROKEN
+-# undef PRIdFAST8
+-# define PRIdFAST8 "d"
+-#endif
+-#if !defined PRIiFAST8 || PRI_MACROS_BROKEN
+-# undef PRIiFAST8
+-# define PRIiFAST8 "i"
+-#endif
+-#if !defined PRIoFAST8 || PRI_MACROS_BROKEN
+-# undef PRIoFAST8
+-# define PRIoFAST8 "o"
+-#endif
+-#if !defined PRIuFAST8 || PRI_MACROS_BROKEN
+-# undef PRIuFAST8
+-# define PRIuFAST8 "u"
+-#endif
+-#if !defined PRIxFAST8 || PRI_MACROS_BROKEN
+-# undef PRIxFAST8
+-# define PRIxFAST8 "x"
+-#endif
+-#if !defined PRIXFAST8 || PRI_MACROS_BROKEN
+-# undef PRIXFAST8
+-# define PRIXFAST8 "X"
+-#endif
+-#if !defined PRIdFAST16 || PRI_MACROS_BROKEN
+-# undef PRIdFAST16
+-# define PRIdFAST16 "d"
+-#endif
+-#if !defined PRIiFAST16 || PRI_MACROS_BROKEN
+-# undef PRIiFAST16
+-# define PRIiFAST16 "i"
+-#endif
+-#if !defined PRIoFAST16 || PRI_MACROS_BROKEN
+-# undef PRIoFAST16
+-# define PRIoFAST16 "o"
+-#endif
+-#if !defined PRIuFAST16 || PRI_MACROS_BROKEN
+-# undef PRIuFAST16
+-# define PRIuFAST16 "u"
+-#endif
+-#if !defined PRIxFAST16 || PRI_MACROS_BROKEN
+-# undef PRIxFAST16
+-# define PRIxFAST16 "x"
+-#endif
+-#if !defined PRIXFAST16 || PRI_MACROS_BROKEN
+-# undef PRIXFAST16
+-# define PRIXFAST16 "X"
+-#endif
+-#if !defined PRIdFAST32 || PRI_MACROS_BROKEN
+-# undef PRIdFAST32
+-# define PRIdFAST32 "d"
+-#endif
+-#if !defined PRIiFAST32 || PRI_MACROS_BROKEN
+-# undef PRIiFAST32
+-# define PRIiFAST32 "i"
+-#endif
+-#if !defined PRIoFAST32 || PRI_MACROS_BROKEN
+-# undef PRIoFAST32
+-# define PRIoFAST32 "o"
+-#endif
+-#if !defined PRIuFAST32 || PRI_MACROS_BROKEN
+-# undef PRIuFAST32
+-# define PRIuFAST32 "u"
+-#endif
+-#if !defined PRIxFAST32 || PRI_MACROS_BROKEN
+-# undef PRIxFAST32
+-# define PRIxFAST32 "x"
+-#endif
+-#if !defined PRIXFAST32 || PRI_MACROS_BROKEN
+-# undef PRIXFAST32
+-# define PRIXFAST32 "X"
+-#endif
+-#if !defined PRIdFAST64 || PRI_MACROS_BROKEN
+-# undef PRIdFAST64
+-# define PRIdFAST64 PRId64
+-#endif
+-#if !defined PRIiFAST64 || PRI_MACROS_BROKEN
+-# undef PRIiFAST64
+-# define PRIiFAST64 PRIi64
+-#endif
+-#if !defined PRIoFAST64 || PRI_MACROS_BROKEN
+-# undef PRIoFAST64
+-# define PRIoFAST64 PRIo64
+-#endif
+-#if !defined PRIuFAST64 || PRI_MACROS_BROKEN
+-# undef PRIuFAST64
+-# define PRIuFAST64 PRIu64
+-#endif
+-#if !defined PRIxFAST64 || PRI_MACROS_BROKEN
+-# undef PRIxFAST64
+-# define PRIxFAST64 PRIx64
+-#endif
+-#if !defined PRIXFAST64 || PRI_MACROS_BROKEN
+-# undef PRIXFAST64
+-# define PRIXFAST64 PRIX64
+-#endif
+-#if !defined PRIdMAX || PRI_MACROS_BROKEN
+-# undef PRIdMAX
+-# define PRIdMAX (sizeof (uintmax_t) == sizeof (long) ? "ld" : "lld")
+-#endif
+-#if !defined PRIiMAX || PRI_MACROS_BROKEN
+-# undef PRIiMAX
+-# define PRIiMAX (sizeof (uintmax_t) == sizeof (long) ? "li" : "lli")
+-#endif
+-#if !defined PRIoMAX || PRI_MACROS_BROKEN
+-# undef PRIoMAX
+-# define PRIoMAX (sizeof (uintmax_t) == sizeof (long) ? "lo" : "llo")
+-#endif
+-#if !defined PRIuMAX || PRI_MACROS_BROKEN
+-# undef PRIuMAX
+-# define PRIuMAX (sizeof (uintmax_t) == sizeof (long) ? "lu" : "llu")
+-#endif
+-#if !defined PRIxMAX || PRI_MACROS_BROKEN
+-# undef PRIxMAX
+-# define PRIxMAX (sizeof (uintmax_t) == sizeof (long) ? "lx" : "llx")
+-#endif
+-#if !defined PRIXMAX || PRI_MACROS_BROKEN
+-# undef PRIXMAX
+-# define PRIXMAX (sizeof (uintmax_t) == sizeof (long) ? "lX" : "llX")
+-#endif
+-#if !defined PRIdPTR || PRI_MACROS_BROKEN
+-# undef PRIdPTR
+-# define PRIdPTR \
+-  (sizeof (void *) == sizeof (long) ? "ld" : \
+-   sizeof (void *) == sizeof (int) ? "d" : \
+-   "lld")
+-#endif
+-#if !defined PRIiPTR || PRI_MACROS_BROKEN
+-# undef PRIiPTR
+-# define PRIiPTR \
+-  (sizeof (void *) == sizeof (long) ? "li" : \
+-   sizeof (void *) == sizeof (int) ? "i" : \
+-   "lli")
+-#endif
+-#if !defined PRIoPTR || PRI_MACROS_BROKEN
+-# undef PRIoPTR
+-# define PRIoPTR \
+-  (sizeof (void *) == sizeof (long) ? "lo" : \
+-   sizeof (void *) == sizeof (int) ? "o" : \
+-   "llo")
+-#endif
+-#if !defined PRIuPTR || PRI_MACROS_BROKEN
+-# undef PRIuPTR
+-# define PRIuPTR \
+-  (sizeof (void *) == sizeof (long) ? "lu" : \
+-   sizeof (void *) == sizeof (int) ? "u" : \
+-   "llu")
+-#endif
+-#if !defined PRIxPTR || PRI_MACROS_BROKEN
+-# undef PRIxPTR
+-# define PRIxPTR \
+-  (sizeof (void *) == sizeof (long) ? "lx" : \
+-   sizeof (void *) == sizeof (int) ? "x" : \
+-   "llx")
+-#endif
+-#if !defined PRIXPTR || PRI_MACROS_BROKEN
+-# undef PRIXPTR
+-# define PRIXPTR \
+-  (sizeof (void *) == sizeof (long) ? "lX" : \
+-   sizeof (void *) == sizeof (int) ? "X" : \
+-   "llX")
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
+-
+-/* We need a sign, whether a new catalog was loaded, which can be associated
+-   with all translations.  This is important if the translations are
+-   cached by one of GCC's features.  */
+-int _nl_msg_cat_cntr;
+-
+-
+-/* Expand a system dependent string segment.  Return NULL if unsupported.  */
+-static const char *
+-get_sysdep_segment_value (const char *name)
+-{
+-  /* Test for an ISO C 99 section 7.8.1 format string directive.
+-     Syntax:
+-     P R I { d | i | o | u | x | X }
+-     { { | LEAST | FAST } { 8 | 16 | 32 | 64 } | MAX | PTR }  */
+-  /* We don't use a table of 14 times 6 'const char *' strings here, because
+-     data relocations cost startup time.  */
+-  if (name[0] == 'P' && name[1] == 'R' && name[2] == 'I')
+-    {
+-      if (name[3] == 'd' || name[3] == 'i' || name[3] == 'o' || name[3] == 'u'
+-	  || name[3] == 'x' || name[3] == 'X')
+-	{
+-	  if (name[4] == '8' && name[5] == '\0')
+-	    {
+-	      if (name[3] == 'd')
+-		return PRId8;
+-	      if (name[3] == 'i')
+-		return PRIi8;
+-	      if (name[3] == 'o')
+-		return PRIo8;
+-	      if (name[3] == 'u')
+-		return PRIu8;
+-	      if (name[3] == 'x')
+-		return PRIx8;
+-	      if (name[3] == 'X')
+-		return PRIX8;
+-	      abort ();
+-	    }
+-	  if (name[4] == '1' && name[5] == '6' && name[6] == '\0')
+-	    {
+-	      if (name[3] == 'd')
+-		return PRId16;
+-	      if (name[3] == 'i')
+-		return PRIi16;
+-	      if (name[3] == 'o')
+-		return PRIo16;
+-	      if (name[3] == 'u')
+-		return PRIu16;
+-	      if (name[3] == 'x')
+-		return PRIx16;
+-	      if (name[3] == 'X')
+-		return PRIX16;
+-	      abort ();
+-	    }
+-	  if (name[4] == '3' && name[5] == '2' && name[6] == '\0')
+-	    {
+-	      if (name[3] == 'd')
+-		return PRId32;
+-	      if (name[3] == 'i')
+-		return PRIi32;
+-	      if (name[3] == 'o')
+-		return PRIo32;
+-	      if (name[3] == 'u')
+-		return PRIu32;
+-	      if (name[3] == 'x')
+-		return PRIx32;
+-	      if (name[3] == 'X')
+-		return PRIX32;
+-	      abort ();
+-	    }
+-	  if (name[4] == '6' && name[5] == '4' && name[6] == '\0')
+-	    {
+-	      if (name[3] == 'd')
+-		return PRId64;
+-	      if (name[3] == 'i')
+-		return PRIi64;
+-	      if (name[3] == 'o')
+-		return PRIo64;
+-	      if (name[3] == 'u')
+-		return PRIu64;
+-	      if (name[3] == 'x')
+-		return PRIx64;
+-	      if (name[3] == 'X')
+-		return PRIX64;
+-	      abort ();
+-	    }
+-	  if (name[4] == 'L' && name[5] == 'E' && name[6] == 'A'
+-	      && name[7] == 'S' && name[8] == 'T')
+-	    {
+-	      if (name[9] == '8' && name[10] == '\0')
+-		{
+-		  if (name[3] == 'd')
+-		    return PRIdLEAST8;
+-		  if (name[3] == 'i')
+-		    return PRIiLEAST8;
+-		  if (name[3] == 'o')
+-		    return PRIoLEAST8;
+-		  if (name[3] == 'u')
+-		    return PRIuLEAST8;
+-		  if (name[3] == 'x')
+-		    return PRIxLEAST8;
+-		  if (name[3] == 'X')
+-		    return PRIXLEAST8;
+-		  abort ();
+-		}
+-	      if (name[9] == '1' && name[10] == '6' && name[11] == '\0')
+-		{
+-		  if (name[3] == 'd')
+-		    return PRIdLEAST16;
+-		  if (name[3] == 'i')
+-		    return PRIiLEAST16;
+-		  if (name[3] == 'o')
+-		    return PRIoLEAST16;
+-		  if (name[3] == 'u')
+-		    return PRIuLEAST16;
+-		  if (name[3] == 'x')
+-		    return PRIxLEAST16;
+-		  if (name[3] == 'X')
+-		    return PRIXLEAST16;
+-		  abort ();
+-		}
+-	      if (name[9] == '3' && name[10] == '2' && name[11] == '\0')
+-		{
+-		  if (name[3] == 'd')
+-		    return PRIdLEAST32;
+-		  if (name[3] == 'i')
+-		    return PRIiLEAST32;
+-		  if (name[3] == 'o')
+-		    return PRIoLEAST32;
+-		  if (name[3] == 'u')
+-		    return PRIuLEAST32;
+-		  if (name[3] == 'x')
+-		    return PRIxLEAST32;
+-		  if (name[3] == 'X')
+-		    return PRIXLEAST32;
+-		  abort ();
+-		}
+-	      if (name[9] == '6' && name[10] == '4' && name[11] == '\0')
+-		{
+-		  if (name[3] == 'd')
+-		    return PRIdLEAST64;
+-		  if (name[3] == 'i')
+-		    return PRIiLEAST64;
+-		  if (name[3] == 'o')
+-		    return PRIoLEAST64;
+-		  if (name[3] == 'u')
+-		    return PRIuLEAST64;
+-		  if (name[3] == 'x')
+-		    return PRIxLEAST64;
+-		  if (name[3] == 'X')
+-		    return PRIXLEAST64;
+-		  abort ();
+-		}
+-	    }
+-	  if (name[4] == 'F' && name[5] == 'A' && name[6] == 'S'
+-	      && name[7] == 'T')
+-	    {
+-	      if (name[8] == '8' && name[9] == '\0')
+-		{
+-		  if (name[3] == 'd')
+-		    return PRIdFAST8;
+-		  if (name[3] == 'i')
+-		    return PRIiFAST8;
+-		  if (name[3] == 'o')
+-		    return PRIoFAST8;
+-		  if (name[3] == 'u')
+-		    return PRIuFAST8;
+-		  if (name[3] == 'x')
+-		    return PRIxFAST8;
+-		  if (name[3] == 'X')
+-		    return PRIXFAST8;
+-		  abort ();
+-		}
+-	      if (name[8] == '1' && name[9] == '6' && name[10] == '\0')
+-		{
+-		  if (name[3] == 'd')
+-		    return PRIdFAST16;
+-		  if (name[3] == 'i')
+-		    return PRIiFAST16;
+-		  if (name[3] == 'o')
+-		    return PRIoFAST16;
+-		  if (name[3] == 'u')
+-		    return PRIuFAST16;
+-		  if (name[3] == 'x')
+-		    return PRIxFAST16;
+-		  if (name[3] == 'X')
+-		    return PRIXFAST16;
+-		  abort ();
+-		}
+-	      if (name[8] == '3' && name[9] == '2' && name[10] == '\0')
+-		{
+-		  if (name[3] == 'd')
+-		    return PRIdFAST32;
+-		  if (name[3] == 'i')
+-		    return PRIiFAST32;
+-		  if (name[3] == 'o')
+-		    return PRIoFAST32;
+-		  if (name[3] == 'u')
+-		    return PRIuFAST32;
+-		  if (name[3] == 'x')
+-		    return PRIxFAST32;
+-		  if (name[3] == 'X')
+-		    return PRIXFAST32;
+-		  abort ();
+-		}
+-	      if (name[8] == '6' && name[9] == '4' && name[10] == '\0')
+-		{
+-		  if (name[3] == 'd')
+-		    return PRIdFAST64;
+-		  if (name[3] == 'i')
+-		    return PRIiFAST64;
+-		  if (name[3] == 'o')
+-		    return PRIoFAST64;
+-		  if (name[3] == 'u')
+-		    return PRIuFAST64;
+-		  if (name[3] == 'x')
+-		    return PRIxFAST64;
+-		  if (name[3] == 'X')
+-		    return PRIXFAST64;
+-		  abort ();
+-		}
+-	    }
+-	  if (name[4] == 'M' && name[5] == 'A' && name[6] == 'X'
+-	      && name[7] == '\0')
+-	    {
+-	      if (name[3] == 'd')
+-		return PRIdMAX;
+-	      if (name[3] == 'i')
+-		return PRIiMAX;
+-	      if (name[3] == 'o')
+-		return PRIoMAX;
+-	      if (name[3] == 'u')
+-		return PRIuMAX;
+-	      if (name[3] == 'x')
+-		return PRIxMAX;
+-	      if (name[3] == 'X')
+-		return PRIXMAX;
+-	      abort ();
+-	    }
+-	  if (name[4] == 'P' && name[5] == 'T' && name[6] == 'R'
+-	      && name[7] == '\0')
+-	    {
+-	      if (name[3] == 'd')
+-		return PRIdPTR;
+-	      if (name[3] == 'i')
+-		return PRIiPTR;
+-	      if (name[3] == 'o')
+-		return PRIoPTR;
+-	      if (name[3] == 'u')
+-		return PRIuPTR;
+-	      if (name[3] == 'x')
+-		return PRIxPTR;
+-	      if (name[3] == 'X')
+-		return PRIXPTR;
+-	      abort ();
+-	    }
+-	}
+-    }
+-  /* Test for a glibc specific printf() format directive flag.  */
+-  if (name[0] == 'I' && name[1] == '\0')
+-    {
+-#if defined _LIBC || __GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 2)
+-      /* The 'I' flag, in numeric format directives, replaces ASCII digits
+-	 with the 'outdigits' defined in the LC_CTYPE locale facet.  This is
+-	 used for Farsi (Persian) and maybe Arabic.  */
+-      return "I";
+-#else
+-      return "";
+-#endif
+-    }
+-  /* Other system dependent strings are not valid.  */
+-  return NULL;
+-}
+-
+-/* Initialize the codeset dependent parts of an opened message catalog.
+-   Return the header entry.  */
+-const char *
+-internal_function
+-_nl_init_domain_conv (struct loaded_l10nfile *domain_file,
+-		      struct loaded_domain *domain,
+-		      struct binding *domainbinding)
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
+-		  outcharset = _NL_CURRENT (LC_CTYPE, CODESET);
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
+-	  /* When using GNU libc >= 2.2 or GNU libiconv >= 1.5,
+-	     we want to use transliteration.  */
+-#   if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 2) || __GLIBC__ > 2 \
+-       || _LIBICONV_VERSION >= 0x0105
+-	  if (strchr (outcharset, '/') == NULL)
+-	    {
+-	      char *tmp;
+-
+-	      len = strlen (outcharset);
+-	      tmp = (char *) alloca (len + 10 + 1);
+-	      memcpy (tmp, outcharset, len);
+-	      memcpy (tmp + len, "//TRANSLIT", 10 + 1);
+-	      outcharset = tmp;
+-
+-	      domain->conv = iconv_open (outcharset, charset);
+-
+-	      freea (outcharset);
+-	    }
+-	  else
+-#   endif
+-	    domain->conv = iconv_open (outcharset, charset);
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
+-_nl_free_domain_conv (struct loaded_domain *domain)
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
+-_nl_load_domain (struct loaded_l10nfile *domain_file,
+-		 struct binding *domainbinding)
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
+-  int revision;
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
+-  domain->malloced = NULL;
+-
+-  /* Fill in the information about the available tables.  */
+-  revision = W (domain->must_swap, data->revision);
+-  /* We support only the major revisions 0 and 1.  */
+-  switch (revision >> 16)
+-    {
+-    case 0:
+-    case 1:
+-      domain->nstrings = W (domain->must_swap, data->nstrings);
+-      domain->orig_tab = (const struct string_desc *)
+-	((char *) data + W (domain->must_swap, data->orig_tab_offset));
+-      domain->trans_tab = (const struct string_desc *)
+-	((char *) data + W (domain->must_swap, data->trans_tab_offset));
+-      domain->hash_size = W (domain->must_swap, data->hash_tab_size);
+-      domain->hash_tab =
+-	(domain->hash_size > 2
+-	 ? (const nls_uint32 *)
+-	   ((char *) data + W (domain->must_swap, data->hash_tab_offset))
+-	 : NULL);
+-      domain->must_swap_hash_tab = domain->must_swap;
+-
+-      /* Now dispatch on the minor revision.  */
+-      switch (revision & 0xffff)
+-	{
+-	case 0:
+-	  domain->n_sysdep_strings = 0;
+-	  domain->orig_sysdep_tab = NULL;
+-	  domain->trans_sysdep_tab = NULL;
+-	  break;
+-	case 1:
+-	default:
+-	  {
+-	    nls_uint32 n_sysdep_strings;
+-
+-	    if (domain->hash_tab == NULL)
+-	      /* This is invalid.  These minor revisions need a hash table.  */
+-	      goto invalid;
+-
+-	    n_sysdep_strings =
+-	      W (domain->must_swap, data->n_sysdep_strings);
+-	    if (n_sysdep_strings > 0)
+-	      {
+-		nls_uint32 n_sysdep_segments;
+-		const struct sysdep_segment *sysdep_segments;
+-		const char **sysdep_segment_values;
+-		const nls_uint32 *orig_sysdep_tab;
+-		const nls_uint32 *trans_sysdep_tab;
+-		nls_uint32 n_inmem_sysdep_strings;
+-		size_t memneed;
+-		char *mem;
+-		struct sysdep_string_desc *inmem_orig_sysdep_tab;
+-		struct sysdep_string_desc *inmem_trans_sysdep_tab;
+-		nls_uint32 *inmem_hash_tab;
+-		unsigned int i, j;
+-
+-		/* Get the values of the system dependent segments.  */
+-		n_sysdep_segments =
+-		  W (domain->must_swap, data->n_sysdep_segments);
+-		sysdep_segments = (const struct sysdep_segment *)
+-		  ((char *) data
+-		   + W (domain->must_swap, data->sysdep_segments_offset));
+-		sysdep_segment_values =
+-		  alloca (n_sysdep_segments * sizeof (const char *));
+-		for (i = 0; i < n_sysdep_segments; i++)
+-		  {
+-		    const char *name =
+-		      (char *) data
+-		      + W (domain->must_swap, sysdep_segments[i].offset);
+-		    nls_uint32 namelen =
+-		      W (domain->must_swap, sysdep_segments[i].length);
+-
+-		    if (!(namelen > 0 && name[namelen - 1] == '\0'))
+-		      {
+-			freea (sysdep_segment_values);
+-			goto invalid;
+-		      }
+-
+-		    sysdep_segment_values[i] = get_sysdep_segment_value (name);
+-		  }
+-
+-		orig_sysdep_tab = (const nls_uint32 *)
+-		  ((char *) data
+-		   + W (domain->must_swap, data->orig_sysdep_tab_offset));
+-		trans_sysdep_tab = (const nls_uint32 *)
+-		  ((char *) data
+-		   + W (domain->must_swap, data->trans_sysdep_tab_offset));
+-
+-		/* Compute the amount of additional memory needed for the
+-		   system dependent strings and the augmented hash table.
+-		   At the same time, also drop string pairs which refer to
+-		   an undefined system dependent segment.  */
+-		n_inmem_sysdep_strings = 0;
+-		memneed = domain->hash_size * sizeof (nls_uint32);
+-		for (i = 0; i < n_sysdep_strings; i++)
+-		  {
+-		    int valid = 1;
+-		    size_t needs[2];
+-
+-		    for (j = 0; j < 2; j++)
+-		      {
+-			const struct sysdep_string *sysdep_string =
+-			  (const struct sysdep_string *)
+-			  ((char *) data
+-			   + W (domain->must_swap,
+-				j == 0
+-				? orig_sysdep_tab[i]
+-				: trans_sysdep_tab[i]));
+-			size_t need = 0;
+-			const struct segment_pair *p = sysdep_string->segments;
+-
+-			if (W (domain->must_swap, p->sysdepref) != SEGMENTS_END)
+-			  for (p = sysdep_string->segments;; p++)
+-			    {
+-			      nls_uint32 sysdepref;
+-
+-			      need += W (domain->must_swap, p->segsize);
+-
+-			      sysdepref = W (domain->must_swap, p->sysdepref);
+-			      if (sysdepref == SEGMENTS_END)
+-				break;
+-
+-			      if (sysdepref >= n_sysdep_segments)
+-				{
+-				  /* Invalid.  */
+-				  freea (sysdep_segment_values);
+-				  goto invalid;
+-				}
+-
+-			      if (sysdep_segment_values[sysdepref] == NULL)
+-				{
+-				  /* This particular string pair is invalid.  */
+-				  valid = 0;
+-				  break;
+-				}
+-
+-			      need += strlen (sysdep_segment_values[sysdepref]);
+-			    }
+-
+-			needs[j] = need;
+-			if (!valid)
+-			  break;
+-		      }
+-
+-		    if (valid)
+-		      {
+-			n_inmem_sysdep_strings++;
+-			memneed += needs[0] + needs[1];
+-		      }
+-		  }
+-		memneed += 2 * n_inmem_sysdep_strings
+-			   * sizeof (struct sysdep_string_desc);
+-
+-		if (n_inmem_sysdep_strings > 0)
+-		  {
+-		    unsigned int k;
+-
+-		    /* Allocate additional memory.  */
+-		    mem = (char *) malloc (memneed);
+-		    if (mem == NULL)
+-		      goto invalid;
+-
+-		    domain->malloced = mem;
+-		    inmem_orig_sysdep_tab = (struct sysdep_string_desc *) mem;
+-		    mem += n_inmem_sysdep_strings
+-			   * sizeof (struct sysdep_string_desc);
+-		    inmem_trans_sysdep_tab = (struct sysdep_string_desc *) mem;
+-		    mem += n_inmem_sysdep_strings
+-			   * sizeof (struct sysdep_string_desc);
+-		    inmem_hash_tab = (nls_uint32 *) mem;
+-		    mem += domain->hash_size * sizeof (nls_uint32);
+-
+-		    /* Compute the system dependent strings.  */
+-		    k = 0;
+-		    for (i = 0; i < n_sysdep_strings; i++)
+-		      {
+-			int valid = 1;
+-
+-			for (j = 0; j < 2; j++)
+-			  {
+-			    const struct sysdep_string *sysdep_string =
+-			      (const struct sysdep_string *)
+-			      ((char *) data
+-			       + W (domain->must_swap,
+-				    j == 0
+-				    ? orig_sysdep_tab[i]
+-				    : trans_sysdep_tab[i]));
+-			    const struct segment_pair *p =
+-			      sysdep_string->segments;
+-
+-			    if (W (domain->must_swap, p->sysdepref)
+-				!= SEGMENTS_END)
+-			      for (p = sysdep_string->segments;; p++)
+-				{
+-				  nls_uint32 sysdepref;
+-
+-				  sysdepref =
+-				    W (domain->must_swap, p->sysdepref);
+-				  if (sysdepref == SEGMENTS_END)
+-				    break;
+-
+-				  if (sysdep_segment_values[sysdepref] == NULL)
+-				    {
+-				      /* This particular string pair is
+-					 invalid.  */
+-				      valid = 0;
+-				      break;
+-				    }
+-				}
+-
+-			    if (!valid)
+-			      break;
+-			  }
+-
+-			if (valid)
+-			  {
+-			    for (j = 0; j < 2; j++)
+-			      {
+-				const struct sysdep_string *sysdep_string =
+-				  (const struct sysdep_string *)
+-				  ((char *) data
+-				   + W (domain->must_swap,
+-					j == 0
+-					? orig_sysdep_tab[i]
+-					: trans_sysdep_tab[i]));
+-				const char *static_segments =
+-				  (char *) data
+-				  + W (domain->must_swap, sysdep_string->offset);
+-				const struct segment_pair *p =
+-				  sysdep_string->segments;
+-
+-				/* Concatenate the segments, and fill
+-				   inmem_orig_sysdep_tab[k] (for j == 0) and
+-				   inmem_trans_sysdep_tab[k] (for j == 1).  */
+-
+-				struct sysdep_string_desc *inmem_tab_entry =
+-				  (j == 0
+-				   ? inmem_orig_sysdep_tab
+-				   : inmem_trans_sysdep_tab)
+-				  + k;
+-
+-				if (W (domain->must_swap, p->sysdepref)
+-				    == SEGMENTS_END)
+-				  {
+-				    /* Only one static segment.  */
+-				    inmem_tab_entry->length =
+-				      W (domain->must_swap, p->segsize);
+-				    inmem_tab_entry->pointer = static_segments;
+-				  }
+-				else
+-				  {
+-				    inmem_tab_entry->pointer = mem;
+-
+-				    for (p = sysdep_string->segments;; p++)
+-				      {
+-					nls_uint32 segsize =
+-					  W (domain->must_swap, p->segsize);
+-					nls_uint32 sysdepref =
+-					  W (domain->must_swap, p->sysdepref);
+-					size_t n;
+-
+-					if (segsize > 0)
+-					  {
+-					    memcpy (mem, static_segments, segsize);
+-					    mem += segsize;
+-					    static_segments += segsize;
+-					  }
+-
+-					if (sysdepref == SEGMENTS_END)
+-					  break;
+-
+-					n = strlen (sysdep_segment_values[sysdepref]);
+-					memcpy (mem, sysdep_segment_values[sysdepref], n);
+-					mem += n;
+-				      }
+-
+-				    inmem_tab_entry->length =
+-				      mem - inmem_tab_entry->pointer;
+-				  }
+-			      }
+-
+-			    k++;
+-			  }
+-		      }
+-		    if (k != n_inmem_sysdep_strings)
+-		      abort ();
+-
+-		    /* Compute the augmented hash table.  */
+-		    for (i = 0; i < domain->hash_size; i++)
+-		      inmem_hash_tab[i] =
+-			W (domain->must_swap_hash_tab, domain->hash_tab[i]);
+-		    for (i = 0; i < n_inmem_sysdep_strings; i++)
+-		      {
+-			const char *msgid = inmem_orig_sysdep_tab[i].pointer;
+-			nls_uint32 hash_val = hash_string (msgid);
+-			nls_uint32 idx = hash_val % domain->hash_size;
+-			nls_uint32 incr =
+-			  1 + (hash_val % (domain->hash_size - 2));
+-
+-			for (;;)
+-			  {
+-			    if (inmem_hash_tab[idx] == 0)
+-			      {
+-				/* Hash table entry is empty.  Use it.  */
+-				inmem_hash_tab[idx] = 1 + domain->nstrings + i;
+-				break;
+-			      }
+-
+-			    if (idx >= domain->hash_size - incr)
+-			      idx -= domain->hash_size - incr;
+-			    else
+-			      idx += incr;
+-			  }
+-		      }
+-
+-		    domain->n_sysdep_strings = n_inmem_sysdep_strings;
+-		    domain->orig_sysdep_tab = inmem_orig_sysdep_tab;
+-		    domain->trans_sysdep_tab = inmem_trans_sysdep_tab;
+-
+-		    domain->hash_tab = inmem_hash_tab;
+-		    domain->must_swap_hash_tab = 0;
+-		  }
+-		else
+-		  {
+-		    domain->n_sysdep_strings = 0;
+-		    domain->orig_sysdep_tab = NULL;
+-		    domain->trans_sysdep_tab = NULL;
+-		  }
+-
+-		freea (sysdep_segment_values);
+-	      }
+-	    else
+-	      {
+-		domain->n_sysdep_strings = 0;
+-		domain->orig_sysdep_tab = NULL;
+-		domain->trans_sysdep_tab = NULL;
+-	      }
+-	  }
+-	  break;
+-	}
+-      break;
+-    default:
+-      /* This is an invalid revision.  */
+-    invalid:
+-      /* This is an invalid .mo file.  */
+-      if (domain->malloced)
+-	free (domain->malloced);
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
+-  EXTRACT_PLURAL_EXPRESSION (nullentry, &domain->plural, &domain->nplurals);
+-}
+-
+-
+-#ifdef _LIBC
+-void
+-internal_function
+-_nl_unload_domain (struct loaded_domain *domain)
+-{
+-  if (domain->plural != &__gettext_germanic_plural)
+-    __gettext_free_exp (domain->plural);
+-
+-  _nl_free_domain_conv (domain);
+-
+-  if (domain->malloced)
+-    free (domain->malloced);
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
+@@ -1,409 +0,0 @@
+-/* Determine a canonical name for the current locale's character encoding.
+-
+-   Copyright (C) 2000-2004 Free Software Foundation, Inc.
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
+-/* Written by Bruno Haible <bruno@clisp.org>.  */
+-
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-/* Specification.  */
+-#include "localcharset.h"
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
+-#if defined __EMX__
+-/* Assume EMX program runs on OS/2, even if compiled under DOS.  */
+-# define OS2
+-#endif
+-
+-#if !defined WIN32
+-# if HAVE_LANGINFO_CODESET
+-#  include <langinfo.h>
+-# else
+-#  if HAVE_SETLOCALE
+-#   include <locale.h>
+-#  endif
+-# endif
+-#elif defined WIN32
+-# define WIN32_LEAN_AND_MEAN
+-# include <windows.h>
+-#endif
+-#if defined OS2
+-# define INCL_DOS
+-# include <os2.h>
+-#endif
+-
+-#if ENABLE_RELOCATABLE
+-# include "relocatable.h"
+-#else
+-# define relocate(pathname) (pathname)
+-#endif
+-
+-#if defined _WIN32 || defined __WIN32__ || defined __CYGWIN__ || defined __EMX__ || defined __DJGPP__
+-  /* Win32, Cygwin, OS/2, DOS */
+-# define ISSLASH(C) ((C) == '/' || (C) == '\\')
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
+-#if HAVE_DECL_GETC_UNLOCKED
+-# undef getc
+-# define getc getc_unlocked
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
+-#if !(defined VMS || defined WIN32)
+-      FILE *fp;
+-      const char *dir;
+-      const char *base = "charset.alias";
+-      char *file_name;
+-
+-      /* Make it possible to override the charset.alias location.  This is
+-	 necessary for running the testsuite before "make install".  */
+-      dir = getenv ("CHARSETALIASDIR");
+-      if (dir == NULL || dir[0] == '\0')
+-	dir = relocate (LIBDIR);
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
+-	  char *res_ptr = NULL;
+-	  size_t res_size = 0;
+-
+-	  for (;;)
+-	    {
+-	      int c;
+-	      char buf1[50+1];
+-	      char buf2[50+1];
+-	      size_t l1, l2;
+-	      char *old_res_ptr;
+-
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
+-	      if (fscanf (fp, "%50s %50s", buf1, buf2) < 2)
+-		break;
+-	      l1 = strlen (buf1);
+-	      l2 = strlen (buf2);
+-	      old_res_ptr = res_ptr;
+-	      if (res_size == 0)
+-		{
+-		  res_size = l1 + 1 + l2 + 1;
+-		  res_ptr = (char *) malloc (res_size + 1);
+-		}
+-	      else
+-		{
+-		  res_size += l1 + 1 + l2 + 1;
+-		  res_ptr = (char *) realloc (res_ptr, res_size + 1);
+-		}
+-	      if (res_ptr == NULL)
+-		{
+-		  /* Out of memory. */
+-		  res_size = 0;
+-		  if (old_res_ptr != NULL)
+-		    free (old_res_ptr);
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
+-#else
+-
+-# if defined VMS
+-      /* To avoid the troubles of an extra file charset.alias_vms in the
+-	 sources of many GNU packages, simply inline the aliases here.  */
+-      /* The list of encodings is taken from the OpenVMS 7.3-1 documentation
+-	 "Compaq C Run-Time Library Reference Manual for OpenVMS systems"
+-	 section 10.7 "Handling Different Character Sets".  */
+-      cp = "ISO8859-1" "\0" "ISO-8859-1" "\0"
+-	   "ISO8859-2" "\0" "ISO-8859-2" "\0"
+-	   "ISO8859-5" "\0" "ISO-8859-5" "\0"
+-	   "ISO8859-7" "\0" "ISO-8859-7" "\0"
+-	   "ISO8859-8" "\0" "ISO-8859-8" "\0"
+-	   "ISO8859-9" "\0" "ISO-8859-9" "\0"
+-	   /* Japanese */
+-	   "eucJP" "\0" "EUC-JP" "\0"
+-	   "SJIS" "\0" "SHIFT_JIS" "\0"
+-	   "DECKANJI" "\0" "DEC-KANJI" "\0"
+-	   "SDECKANJI" "\0" "EUC-JP" "\0"
+-	   /* Chinese */
+-	   "eucTW" "\0" "EUC-TW" "\0"
+-	   "DECHANYU" "\0" "DEC-HANYU" "\0"
+-	   "DECHANZI" "\0" "GB2312" "\0"
+-	   /* Korean */
+-	   "DECKOREAN" "\0" "EUC-KR" "\0";
+-# endif
+-
+-# if defined WIN32
+-      /* To avoid the troubles of installing a separate file in the same
+-	 directory as the DLL and of retrieving the DLL's directory at
+-	 runtime, simply inline the aliases here.  */
+-
+-      cp = "CP936" "\0" "GBK" "\0"
+-	   "CP1361" "\0" "JOHAB" "\0"
+-	   "CP20127" "\0" "ASCII" "\0"
+-	   "CP20866" "\0" "KOI8-R" "\0"
+-	   "CP21866" "\0" "KOI8-RU" "\0"
+-	   "CP28591" "\0" "ISO-8859-1" "\0"
+-	   "CP28592" "\0" "ISO-8859-2" "\0"
+-	   "CP28593" "\0" "ISO-8859-3" "\0"
+-	   "CP28594" "\0" "ISO-8859-4" "\0"
+-	   "CP28595" "\0" "ISO-8859-5" "\0"
+-	   "CP28596" "\0" "ISO-8859-6" "\0"
+-	   "CP28597" "\0" "ISO-8859-7" "\0"
+-	   "CP28598" "\0" "ISO-8859-8" "\0"
+-	   "CP28599" "\0" "ISO-8859-9" "\0"
+-	   "CP28605" "\0" "ISO-8859-15" "\0";
+-# endif
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
+-#if !(defined WIN32 || defined OS2)
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
+-#elif defined WIN32
+-
+-  static char buf[2 + 10 + 1];
+-
+-  /* Woe32 has a function returning the locale's codepage as a number.  */
+-  sprintf (buf, "CP%u", GetACP ());
+-  codeset = buf;
+-
+-#elif defined OS2
+-
+-  const char *locale;
+-  static char buf[2 + 10 + 1];
+-  ULONG cp[3];
+-  ULONG cplen;
+-
+-  /* Allow user to override the codeset, as set in the operating system,
+-     with standard language environment variables.  */
+-  locale = getenv ("LC_ALL");
+-  if (locale == NULL || locale[0] == '\0')
+-    {
+-      locale = getenv ("LC_CTYPE");
+-      if (locale == NULL || locale[0] == '\0')
+-	locale = getenv ("LANG");
+-    }
+-  if (locale != NULL && locale[0] != '\0')
+-    {
+-      /* If the locale name contains an encoding after the dot, return it.  */
+-      const char *dot = strchr (locale, '.');
+-
+-      if (dot != NULL)
+-	{
+-	  const char *modifier;
+-
+-	  dot++;
+-	  /* Look for the possible @... trailer and remove it, if any.  */
+-	  modifier = strchr (dot, '@');
+-	  if (modifier == NULL)
+-	    return dot;
+-	  if (modifier - dot < sizeof (buf))
+-	    {
+-	      memcpy (buf, dot, modifier - dot);
+-	      buf [modifier - dot] = '\0';
+-	      return buf;
+-	    }
+-	}
+-
+-      /* Resolve through the charset.alias file.  */
+-      codeset = locale;
+-    }
+-  else
+-    {
+-      /* OS/2 has a function returning the locale's codepage as a number.  */
+-      if (DosQueryCp (sizeof (cp), cp, &cplen))
+-	codeset = "";
+-      else
+-	{
+-	  sprintf (buf, "CP%u", cp[0]);
+-	  codeset = buf;
+-	}
+-    }
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
+-  /* Don't return an empty string.  GNU libc and GNU libiconv interpret
+-     the empty string as denoting "the locale's character encoding",
+-     thus GNU libiconv would call this function a second time.  */
+-  if (codeset[0] == '\0')
+-    codeset = "ASCII";
+-
+-  return codeset;
+-}
+--- a/intl/localcharset.h
++++ /dev/null
+@@ -1,42 +0,0 @@
+-/* Determine a canonical name for the current locale's character encoding.
+-   Copyright (C) 2000-2003 Free Software Foundation, Inc.
+-   This file is part of the GNU CHARSET Library.
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
+-#ifndef _LOCALCHARSET_H
+-#define _LOCALCHARSET_H
+-
+-
+-#ifdef __cplusplus
+-extern "C" {
+-#endif
+-
+-
+-/* Determine the current locale's character encoding, and canonicalize it
+-   into one of the canonical names listed in config.charset.
+-   The result must not be freed; it is statically allocated.
+-   If the canonical name cannot be determined, the result is a non-canonical
+-   name.  */
+-extern const char * locale_charset (void);
+-
+-
+-#ifdef __cplusplus
+-}
+-#endif
+-
+-
+-#endif /* _LOCALCHARSET_H */
+--- a/intl/locale.alias
++++ /dev/null
+@@ -1,78 +0,0 @@
+-# Locale name alias data base.
+-# Copyright (C) 1996-2001,2003 Free Software Foundation, Inc.
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
+-bokmal		nb_NO.ISO-8859-1
+-bokmål		nb_NO.ISO-8859-1
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
+-no_NO		nb_NO.ISO-8859-1
+-no_NO.ISO-8859-1 nb_NO.ISO-8859-1
+-norwegian       nb_NO.ISO-8859-1
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
+@@ -1,414 +0,0 @@
+-/* Handle aliases for locale names.
+-   Copyright (C) 1995-1999, 2000-2001, 2003 Free Software Foundation, Inc.
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
+-#if defined _LIBC || defined HAVE___FSETLOCKING
+-# include <stdio_ext.h>
+-#endif
+-#include <sys/types.h>
+-
+-#ifdef __GNUC__
+-# undef alloca
+-# define alloca __builtin_alloca
+-# define HAVE_ALLOCA 1
+-#else
+-# ifdef _MSC_VER
+-#  include <malloc.h>
+-#  define alloca _alloca
+-# else
+-#  if defined HAVE_ALLOCA_H || defined _LIBC
+-#   include <alloca.h>
+-#  else
+-#   ifdef _AIX
+- #pragma alloca
+-#   else
+-#    ifndef alloca
+-char *alloca ();
+-#    endif
+-#   endif
+-#  endif
+-# endif
+-#endif
+-
+-#include <stdlib.h>
+-#include <string.h>
+-
+-#include "gettextP.h"
+-
+-#if ENABLE_RELOCATABLE
+-# include "relocatable.h"
+-#else
+-# define relocate(pathname) (pathname)
+-#endif
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
+-# define HAVE___FSETLOCKING	1
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
+-/* Some optimizations for glibc.  */
+-#ifdef _LIBC
+-# define FEOF(fp)		feof_unlocked (fp)
+-# define FGETS(buf, n, fp)	fgets_unlocked (buf, n, fp)
+-#else
+-# define FEOF(fp)		feof (fp)
+-# define FGETS(buf, n, fp)	fgets (buf, n, fp)
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
+-#if defined _LIBC_REENTRANT || HAVE_DECL_FGETS_UNLOCKED
+-# undef fgets
+-# define fgets(buf, len, s) fgets_unlocked (buf, len, s)
+-#endif
+-#if defined _LIBC_REENTRANT || HAVE_DECL_FEOF_UNLOCKED
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
+-#ifndef _LIBC
+-# define libc_freeres_ptr(decl) decl
+-#endif
+-
+-libc_freeres_ptr (static char *string_space);
+-static size_t string_space_act;
+-static size_t string_space_max;
+-libc_freeres_ptr (static struct alias_map *map);
+-static size_t nmap;
+-static size_t maxmap;
+-
+-
+-/* Prototypes for local functions.  */
+-static size_t read_alias_file (const char *fname, int fname_len)
+-     internal_function;
+-static int extend_alias_table (void);
+-static int alias_compare (const struct alias_map *map1,
+-			  const struct alias_map *map2);
+-
+-
+-const char *
+-_nl_expand_alias (const char *name)
+-{
+-  static const char *locale_alias_path;
+-  struct alias_map *retval;
+-  const char *result = NULL;
+-  size_t added;
+-
+-#ifdef _LIBC
+-  __libc_lock_lock (lock);
+-#endif
+-
+-  if (locale_alias_path == NULL)
+-    locale_alias_path = LOCALE_ALIAS_PATH;
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
+-					       (int (*) (const void *,
+-							 const void *)
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
+-read_alias_file (const char *fname, int fname_len)
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
+-  fp = fopen (relocate (full_fname), "r");
+-  freea (full_fname);
+-  if (fp == NULL)
+-    return 0;
+-
+-#ifdef HAVE___FSETLOCKING
+-  /* No threads present.  */
+-  __fsetlocking (fp, FSETLOCKING_BYCALLER);
+-#endif
+-
+-  added = 0;
+-  while (!FEOF (fp))
+-    {
+-      /* It is a reasonable approach to use a fix buffer here because
+-	 a) we are only interested in the first two fields
+-	 b) these fields must be usable as file names and so must not
+-	    be that long
+-	 We avoid a multi-kilobyte buffer here since this would use up
+-	 stack space which we might not have if the program ran out of
+-	 memory.  */
+-      char buf[400];
+-      char *alias;
+-      char *value;
+-      char *cp;
+-
+-      if (FGETS (buf, sizeof buf, fp) == NULL)
+-	/* EOF reached.  */
+-	break;
+-
+-      cp = buf;
+-      /* Ignore leading white space.  */
+-      while (isspace ((unsigned char) cp[0]))
+-	++cp;
+-
+-      /* A leading '#' signals a comment line.  */
+-      if (cp[0] != '\0' && cp[0] != '#')
+-	{
+-	  alias = cp++;
+-	  while (cp[0] != '\0' && !isspace ((unsigned char) cp[0]))
+-	    ++cp;
+-	  /* Terminate alias name.  */
+-	  if (cp[0] != '\0')
+-	    *cp++ = '\0';
+-
+-	  /* Now look for the beginning of the value.  */
+-	  while (isspace ((unsigned char) cp[0]))
+-	    ++cp;
+-
+-	  if (cp[0] != '\0')
+-	    {
+-	      size_t alias_len;
+-	      size_t value_len;
+-
+-	      value = cp++;
+-	      while (cp[0] != '\0' && !isspace ((unsigned char) cp[0]))
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
+-
+-      /* Possibly not the whole line fits into the buffer.  Ignore
+-	 the rest of the line.  */
+-      while (strchr (buf, '\n') == NULL)
+-	if (FGETS (buf, sizeof buf, fp) == NULL)
+-	  /* Make sure the inner loop will be left.  The outer loop
+-	     will exit at the `feof' test.  */
+-	  break;
+-    }
+-
+-  /* Should we test for ferror()?  I think we have to silently ignore
+-     errors.  --drepper  */
+-  fclose (fp);
+-
+-  if (added > 0)
+-    qsort (map, nmap, sizeof (struct alias_map),
+-	   (int (*) (const void *, const void *)) alias_compare);
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
+-static int
+-alias_compare (const struct alias_map *map1, const struct alias_map *map2)
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
+--- a/intl/localename.c
++++ /dev/null
+@@ -1,1220 +0,0 @@
+-/* Determine the current selected locale.
+-   Copyright (C) 1995-1999, 2000-2005 Free Software Foundation, Inc.
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
+-/* Written by Ulrich Drepper <drepper@gnu.org>, 1995.  */
+-/* Win32 code written by Tor Lillqvist <tml@iki.fi>.  */
+-/* MacOS X code written by Bruno Haible <bruno@clisp.org>.  */
+-
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-#include <stdlib.h>
+-#include <locale.h>
+-
+-#if HAVE_CFLOCALECOPYCURRENT || HAVE_CFPREFERENCESCOPYAPPVALUE
+-# include <string.h>
+-# include <CFString.h>
+-# if HAVE_CFLOCALECOPYCURRENT
+-#  include <CFLocale.h>
+-# elif HAVE_CFPREFERENCESCOPYAPPVALUE
+-#  include <CFPreferences.h>
+-# endif
+-#endif
+-
+-#if defined _WIN32 || defined __WIN32__
+-# undef WIN32   /* avoid warning on mingw32 */
+-# define WIN32
+-#endif
+-
+-#ifdef WIN32
+-# define WIN32_LEAN_AND_MEAN
+-# include <windows.h>
+-/* List of language codes, sorted by value:
+-   0x01 LANG_ARABIC
+-   0x02 LANG_BULGARIAN
+-   0x03 LANG_CATALAN
+-   0x04 LANG_CHINESE
+-   0x05 LANG_CZECH
+-   0x06 LANG_DANISH
+-   0x07 LANG_GERMAN
+-   0x08 LANG_GREEK
+-   0x09 LANG_ENGLISH
+-   0x0a LANG_SPANISH
+-   0x0b LANG_FINNISH
+-   0x0c LANG_FRENCH
+-   0x0d LANG_HEBREW
+-   0x0e LANG_HUNGARIAN
+-   0x0f LANG_ICELANDIC
+-   0x10 LANG_ITALIAN
+-   0x11 LANG_JAPANESE
+-   0x12 LANG_KOREAN
+-   0x13 LANG_DUTCH
+-   0x14 LANG_NORWEGIAN
+-   0x15 LANG_POLISH
+-   0x16 LANG_PORTUGUESE
+-   0x17 LANG_RHAETO_ROMANCE
+-   0x18 LANG_ROMANIAN
+-   0x19 LANG_RUSSIAN
+-   0x1a LANG_CROATIAN == LANG_SERBIAN
+-   0x1b LANG_SLOVAK
+-   0x1c LANG_ALBANIAN
+-   0x1d LANG_SWEDISH
+-   0x1e LANG_THAI
+-   0x1f LANG_TURKISH
+-   0x20 LANG_URDU
+-   0x21 LANG_INDONESIAN
+-   0x22 LANG_UKRAINIAN
+-   0x23 LANG_BELARUSIAN
+-   0x24 LANG_SLOVENIAN
+-   0x25 LANG_ESTONIAN
+-   0x26 LANG_LATVIAN
+-   0x27 LANG_LITHUANIAN
+-   0x28 LANG_TAJIK
+-   0x29 LANG_FARSI
+-   0x2a LANG_VIETNAMESE
+-   0x2b LANG_ARMENIAN
+-   0x2c LANG_AZERI
+-   0x2d LANG_BASQUE
+-   0x2e LANG_SORBIAN
+-   0x2f LANG_MACEDONIAN
+-   0x30 LANG_SUTU
+-   0x31 LANG_TSONGA
+-   0x32 LANG_TSWANA
+-   0x33 LANG_VENDA
+-   0x34 LANG_XHOSA
+-   0x35 LANG_ZULU
+-   0x36 LANG_AFRIKAANS
+-   0x37 LANG_GEORGIAN
+-   0x38 LANG_FAEROESE
+-   0x39 LANG_HINDI
+-   0x3a LANG_MALTESE
+-   0x3b LANG_SAAMI
+-   0x3c LANG_GAELIC
+-   0x3d LANG_YIDDISH
+-   0x3e LANG_MALAY
+-   0x3f LANG_KAZAK
+-   0x40 LANG_KYRGYZ
+-   0x41 LANG_SWAHILI
+-   0x42 LANG_TURKMEN
+-   0x43 LANG_UZBEK
+-   0x44 LANG_TATAR
+-   0x45 LANG_BENGALI
+-   0x46 LANG_PUNJABI
+-   0x47 LANG_GUJARATI
+-   0x48 LANG_ORIYA
+-   0x49 LANG_TAMIL
+-   0x4a LANG_TELUGU
+-   0x4b LANG_KANNADA
+-   0x4c LANG_MALAYALAM
+-   0x4d LANG_ASSAMESE
+-   0x4e LANG_MARATHI
+-   0x4f LANG_SANSKRIT
+-   0x50 LANG_MONGOLIAN
+-   0x51 LANG_TIBETAN
+-   0x52 LANG_WELSH
+-   0x53 LANG_CAMBODIAN
+-   0x54 LANG_LAO
+-   0x55 LANG_BURMESE
+-   0x56 LANG_GALICIAN
+-   0x57 LANG_KONKANI
+-   0x58 LANG_MANIPURI
+-   0x59 LANG_SINDHI
+-   0x5a LANG_SYRIAC
+-   0x5b LANG_SINHALESE
+-   0x5c LANG_CHEROKEE
+-   0x5d LANG_INUKTITUT
+-   0x5e LANG_AMHARIC
+-   0x5f LANG_TAMAZIGHT
+-   0x60 LANG_KASHMIRI
+-   0x61 LANG_NEPALI
+-   0x62 LANG_FRISIAN
+-   0x63 LANG_PASHTO
+-   0x64 LANG_TAGALOG
+-   0x65 LANG_DIVEHI
+-   0x66 LANG_EDO
+-   0x67 LANG_FULFULDE
+-   0x68 LANG_HAUSA
+-   0x69 LANG_IBIBIO
+-   0x6a LANG_YORUBA
+-   0x70 LANG_IGBO
+-   0x71 LANG_KANURI
+-   0x72 LANG_OROMO
+-   0x73 LANG_TIGRINYA
+-   0x74 LANG_GUARANI
+-   0x75 LANG_HAWAIIAN
+-   0x76 LANG_LATIN
+-   0x77 LANG_SOMALI
+-   0x78 LANG_YI
+-   0x79 LANG_PAPIAMENTU
+-*/
+-/* Mingw headers don't have latest language and sublanguage codes.  */
+-# ifndef LANG_AFRIKAANS
+-# define LANG_AFRIKAANS 0x36
+-# endif
+-# ifndef LANG_ALBANIAN
+-# define LANG_ALBANIAN 0x1c
+-# endif
+-# ifndef LANG_AMHARIC
+-# define LANG_AMHARIC 0x5e
+-# endif
+-# ifndef LANG_ARABIC
+-# define LANG_ARABIC 0x01
+-# endif
+-# ifndef LANG_ARMENIAN
+-# define LANG_ARMENIAN 0x2b
+-# endif
+-# ifndef LANG_ASSAMESE
+-# define LANG_ASSAMESE 0x4d
+-# endif
+-# ifndef LANG_AZERI
+-# define LANG_AZERI 0x2c
+-# endif
+-# ifndef LANG_BASQUE
+-# define LANG_BASQUE 0x2d
+-# endif
+-# ifndef LANG_BELARUSIAN
+-# define LANG_BELARUSIAN 0x23
+-# endif
+-# ifndef LANG_BENGALI
+-# define LANG_BENGALI 0x45
+-# endif
+-# ifndef LANG_BURMESE
+-# define LANG_BURMESE 0x55
+-# endif
+-# ifndef LANG_CAMBODIAN
+-# define LANG_CAMBODIAN 0x53
+-# endif
+-# ifndef LANG_CATALAN
+-# define LANG_CATALAN 0x03
+-# endif
+-# ifndef LANG_CHEROKEE
+-# define LANG_CHEROKEE 0x5c
+-# endif
+-# ifndef LANG_DIVEHI
+-# define LANG_DIVEHI 0x65
+-# endif
+-# ifndef LANG_EDO
+-# define LANG_EDO 0x66
+-# endif
+-# ifndef LANG_ESTONIAN
+-# define LANG_ESTONIAN 0x25
+-# endif
+-# ifndef LANG_FAEROESE
+-# define LANG_FAEROESE 0x38
+-# endif
+-# ifndef LANG_FARSI
+-# define LANG_FARSI 0x29
+-# endif
+-# ifndef LANG_FRISIAN
+-# define LANG_FRISIAN 0x62
+-# endif
+-# ifndef LANG_FULFULDE
+-# define LANG_FULFULDE 0x67
+-# endif
+-# ifndef LANG_GAELIC
+-# define LANG_GAELIC 0x3c
+-# endif
+-# ifndef LANG_GALICIAN
+-# define LANG_GALICIAN 0x56
+-# endif
+-# ifndef LANG_GEORGIAN
+-# define LANG_GEORGIAN 0x37
+-# endif
+-# ifndef LANG_GUARANI
+-# define LANG_GUARANI 0x74
+-# endif
+-# ifndef LANG_GUJARATI
+-# define LANG_GUJARATI 0x47
+-# endif
+-# ifndef LANG_HAUSA
+-# define LANG_HAUSA 0x68
+-# endif
+-# ifndef LANG_HAWAIIAN
+-# define LANG_HAWAIIAN 0x75
+-# endif
+-# ifndef LANG_HEBREW
+-# define LANG_HEBREW 0x0d
+-# endif
+-# ifndef LANG_HINDI
+-# define LANG_HINDI 0x39
+-# endif
+-# ifndef LANG_IBIBIO
+-# define LANG_IBIBIO 0x69
+-# endif
+-# ifndef LANG_IGBO
+-# define LANG_IGBO 0x70
+-# endif
+-# ifndef LANG_INDONESIAN
+-# define LANG_INDONESIAN 0x21
+-# endif
+-# ifndef LANG_INUKTITUT
+-# define LANG_INUKTITUT 0x5d
+-# endif
+-# ifndef LANG_KANNADA
+-# define LANG_KANNADA 0x4b
+-# endif
+-# ifndef LANG_KANURI
+-# define LANG_KANURI 0x71
+-# endif
+-# ifndef LANG_KASHMIRI
+-# define LANG_KASHMIRI 0x60
+-# endif
+-# ifndef LANG_KAZAK
+-# define LANG_KAZAK 0x3f
+-# endif
+-# ifndef LANG_KONKANI
+-# define LANG_KONKANI 0x57
+-# endif
+-# ifndef LANG_KYRGYZ
+-# define LANG_KYRGYZ 0x40
+-# endif
+-# ifndef LANG_LAO
+-# define LANG_LAO 0x54
+-# endif
+-# ifndef LANG_LATIN
+-# define LANG_LATIN 0x76
+-# endif
+-# ifndef LANG_LATVIAN
+-# define LANG_LATVIAN 0x26
+-# endif
+-# ifndef LANG_LITHUANIAN
+-# define LANG_LITHUANIAN 0x27
+-# endif
+-# ifndef LANG_MACEDONIAN
+-# define LANG_MACEDONIAN 0x2f
+-# endif
+-# ifndef LANG_MALAY
+-# define LANG_MALAY 0x3e
+-# endif
+-# ifndef LANG_MALAYALAM
+-# define LANG_MALAYALAM 0x4c
+-# endif
+-# ifndef LANG_MALTESE
+-# define LANG_MALTESE 0x3a
+-# endif
+-# ifndef LANG_MANIPURI
+-# define LANG_MANIPURI 0x58
+-# endif
+-# ifndef LANG_MARATHI
+-# define LANG_MARATHI 0x4e
+-# endif
+-# ifndef LANG_MONGOLIAN
+-# define LANG_MONGOLIAN 0x50
+-# endif
+-# ifndef LANG_NEPALI
+-# define LANG_NEPALI 0x61
+-# endif
+-# ifndef LANG_ORIYA
+-# define LANG_ORIYA 0x48
+-# endif
+-# ifndef LANG_OROMO
+-# define LANG_OROMO 0x72
+-# endif
+-# ifndef LANG_PAPIAMENTU
+-# define LANG_PAPIAMENTU 0x79
+-# endif
+-# ifndef LANG_PASHTO
+-# define LANG_PASHTO 0x63
+-# endif
+-# ifndef LANG_PUNJABI
+-# define LANG_PUNJABI 0x46
+-# endif
+-# ifndef LANG_RHAETO_ROMANCE
+-# define LANG_RHAETO_ROMANCE 0x17
+-# endif
+-# ifndef LANG_SAAMI
+-# define LANG_SAAMI 0x3b
+-# endif
+-# ifndef LANG_SANSKRIT
+-# define LANG_SANSKRIT 0x4f
+-# endif
+-# ifndef LANG_SERBIAN
+-# define LANG_SERBIAN 0x1a
+-# endif
+-# ifndef LANG_SINDHI
+-# define LANG_SINDHI 0x59
+-# endif
+-# ifndef LANG_SINHALESE
+-# define LANG_SINHALESE 0x5b
+-# endif
+-# ifndef LANG_SLOVAK
+-# define LANG_SLOVAK 0x1b
+-# endif
+-# ifndef LANG_SOMALI
+-# define LANG_SOMALI 0x77
+-# endif
+-# ifndef LANG_SORBIAN
+-# define LANG_SORBIAN 0x2e
+-# endif
+-# ifndef LANG_SUTU
+-# define LANG_SUTU 0x30
+-# endif
+-# ifndef LANG_SWAHILI
+-# define LANG_SWAHILI 0x41
+-# endif
+-# ifndef LANG_SYRIAC
+-# define LANG_SYRIAC 0x5a
+-# endif
+-# ifndef LANG_TAGALOG
+-# define LANG_TAGALOG 0x64
+-# endif
+-# ifndef LANG_TAJIK
+-# define LANG_TAJIK 0x28
+-# endif
+-# ifndef LANG_TAMAZIGHT
+-# define LANG_TAMAZIGHT 0x5f
+-# endif
+-# ifndef LANG_TAMIL
+-# define LANG_TAMIL 0x49
+-# endif
+-# ifndef LANG_TATAR
+-# define LANG_TATAR 0x44
+-# endif
+-# ifndef LANG_TELUGU
+-# define LANG_TELUGU 0x4a
+-# endif
+-# ifndef LANG_THAI
+-# define LANG_THAI 0x1e
+-# endif
+-# ifndef LANG_TIBETAN
+-# define LANG_TIBETAN 0x51
+-# endif
+-# ifndef LANG_TIGRINYA
+-# define LANG_TIGRINYA 0x73
+-# endif
+-# ifndef LANG_TSONGA
+-# define LANG_TSONGA 0x31
+-# endif
+-# ifndef LANG_TSWANA
+-# define LANG_TSWANA 0x32
+-# endif
+-# ifndef LANG_TURKMEN
+-# define LANG_TURKMEN 0x42
+-# endif
+-# ifndef LANG_UKRAINIAN
+-# define LANG_UKRAINIAN 0x22
+-# endif
+-# ifndef LANG_URDU
+-# define LANG_URDU 0x20
+-# endif
+-# ifndef LANG_UZBEK
+-# define LANG_UZBEK 0x43
+-# endif
+-# ifndef LANG_VENDA
+-# define LANG_VENDA 0x33
+-# endif
+-# ifndef LANG_VIETNAMESE
+-# define LANG_VIETNAMESE 0x2a
+-# endif
+-# ifndef LANG_WELSH
+-# define LANG_WELSH 0x52
+-# endif
+-# ifndef LANG_XHOSA
+-# define LANG_XHOSA 0x34
+-# endif
+-# ifndef LANG_YI
+-# define LANG_YI 0x78
+-# endif
+-# ifndef LANG_YIDDISH
+-# define LANG_YIDDISH 0x3d
+-# endif
+-# ifndef LANG_YORUBA
+-# define LANG_YORUBA 0x6a
+-# endif
+-# ifndef LANG_ZULU
+-# define LANG_ZULU 0x35
+-# endif
+-# ifndef SUBLANG_ARABIC_SAUDI_ARABIA
+-# define SUBLANG_ARABIC_SAUDI_ARABIA 0x01
+-# endif
+-# ifndef SUBLANG_ARABIC_IRAQ
+-# define SUBLANG_ARABIC_IRAQ 0x02
+-# endif
+-# ifndef SUBLANG_ARABIC_EGYPT
+-# define SUBLANG_ARABIC_EGYPT 0x03
+-# endif
+-# ifndef SUBLANG_ARABIC_LIBYA
+-# define SUBLANG_ARABIC_LIBYA 0x04
+-# endif
+-# ifndef SUBLANG_ARABIC_ALGERIA
+-# define SUBLANG_ARABIC_ALGERIA 0x05
+-# endif
+-# ifndef SUBLANG_ARABIC_MOROCCO
+-# define SUBLANG_ARABIC_MOROCCO 0x06
+-# endif
+-# ifndef SUBLANG_ARABIC_TUNISIA
+-# define SUBLANG_ARABIC_TUNISIA 0x07
+-# endif
+-# ifndef SUBLANG_ARABIC_OMAN
+-# define SUBLANG_ARABIC_OMAN 0x08
+-# endif
+-# ifndef SUBLANG_ARABIC_YEMEN
+-# define SUBLANG_ARABIC_YEMEN 0x09
+-# endif
+-# ifndef SUBLANG_ARABIC_SYRIA
+-# define SUBLANG_ARABIC_SYRIA 0x0a
+-# endif
+-# ifndef SUBLANG_ARABIC_JORDAN
+-# define SUBLANG_ARABIC_JORDAN 0x0b
+-# endif
+-# ifndef SUBLANG_ARABIC_LEBANON
+-# define SUBLANG_ARABIC_LEBANON 0x0c
+-# endif
+-# ifndef SUBLANG_ARABIC_KUWAIT
+-# define SUBLANG_ARABIC_KUWAIT 0x0d
+-# endif
+-# ifndef SUBLANG_ARABIC_UAE
+-# define SUBLANG_ARABIC_UAE 0x0e
+-# endif
+-# ifndef SUBLANG_ARABIC_BAHRAIN
+-# define SUBLANG_ARABIC_BAHRAIN 0x0f
+-# endif
+-# ifndef SUBLANG_ARABIC_QATAR
+-# define SUBLANG_ARABIC_QATAR 0x10
+-# endif
+-# ifndef SUBLANG_AZERI_LATIN
+-# define SUBLANG_AZERI_LATIN 0x01
+-# endif
+-# ifndef SUBLANG_AZERI_CYRILLIC
+-# define SUBLANG_AZERI_CYRILLIC 0x02
+-# endif
+-# ifndef SUBLANG_BENGALI_INDIA
+-# define SUBLANG_BENGALI_INDIA 0x00
+-# endif
+-# ifndef SUBLANG_BENGALI_BANGLADESH
+-# define SUBLANG_BENGALI_BANGLADESH 0x01
+-# endif
+-# ifndef SUBLANG_CHINESE_MACAU
+-# define SUBLANG_CHINESE_MACAU 0x05
+-# endif
+-# ifndef SUBLANG_ENGLISH_SOUTH_AFRICA
+-# define SUBLANG_ENGLISH_SOUTH_AFRICA 0x07
+-# endif
+-# ifndef SUBLANG_ENGLISH_JAMAICA
+-# define SUBLANG_ENGLISH_JAMAICA 0x08
+-# endif
+-# ifndef SUBLANG_ENGLISH_CARIBBEAN
+-# define SUBLANG_ENGLISH_CARIBBEAN 0x09
+-# endif
+-# ifndef SUBLANG_ENGLISH_BELIZE
+-# define SUBLANG_ENGLISH_BELIZE 0x0a
+-# endif
+-# ifndef SUBLANG_ENGLISH_TRINIDAD
+-# define SUBLANG_ENGLISH_TRINIDAD 0x0b
+-# endif
+-# ifndef SUBLANG_ENGLISH_ZIMBABWE
+-# define SUBLANG_ENGLISH_ZIMBABWE 0x0c
+-# endif
+-# ifndef SUBLANG_ENGLISH_PHILIPPINES
+-# define SUBLANG_ENGLISH_PHILIPPINES 0x0d
+-# endif
+-# ifndef SUBLANG_ENGLISH_INDONESIA
+-# define SUBLANG_ENGLISH_INDONESIA 0x0e
+-# endif
+-# ifndef SUBLANG_ENGLISH_HONGKONG
+-# define SUBLANG_ENGLISH_HONGKONG 0x0f
+-# endif
+-# ifndef SUBLANG_ENGLISH_INDIA
+-# define SUBLANG_ENGLISH_INDIA 0x10
+-# endif
+-# ifndef SUBLANG_ENGLISH_MALAYSIA
+-# define SUBLANG_ENGLISH_MALAYSIA 0x11
+-# endif
+-# ifndef SUBLANG_ENGLISH_SINGAPORE
+-# define SUBLANG_ENGLISH_SINGAPORE 0x12
+-# endif
+-# ifndef SUBLANG_FRENCH_LUXEMBOURG
+-# define SUBLANG_FRENCH_LUXEMBOURG 0x05
+-# endif
+-# ifndef SUBLANG_FRENCH_MONACO
+-# define SUBLANG_FRENCH_MONACO 0x06
+-# endif
+-# ifndef SUBLANG_FRENCH_WESTINDIES
+-# define SUBLANG_FRENCH_WESTINDIES 0x07
+-# endif
+-# ifndef SUBLANG_FRENCH_REUNION
+-# define SUBLANG_FRENCH_REUNION 0x08
+-# endif
+-# ifndef SUBLANG_FRENCH_CONGO
+-# define SUBLANG_FRENCH_CONGO 0x09
+-# endif
+-# ifndef SUBLANG_FRENCH_SENEGAL
+-# define SUBLANG_FRENCH_SENEGAL 0x0a
+-# endif
+-# ifndef SUBLANG_FRENCH_CAMEROON
+-# define SUBLANG_FRENCH_CAMEROON 0x0b
+-# endif
+-# ifndef SUBLANG_FRENCH_COTEDIVOIRE
+-# define SUBLANG_FRENCH_COTEDIVOIRE 0x0c
+-# endif
+-# ifndef SUBLANG_FRENCH_MALI
+-# define SUBLANG_FRENCH_MALI 0x0d
+-# endif
+-# ifndef SUBLANG_FRENCH_MOROCCO
+-# define SUBLANG_FRENCH_MOROCCO 0x0e
+-# endif
+-# ifndef SUBLANG_FRENCH_HAITI
+-# define SUBLANG_FRENCH_HAITI 0x0f
+-# endif
+-# ifndef SUBLANG_GERMAN_LUXEMBOURG
+-# define SUBLANG_GERMAN_LUXEMBOURG 0x04
+-# endif
+-# ifndef SUBLANG_GERMAN_LIECHTENSTEIN
+-# define SUBLANG_GERMAN_LIECHTENSTEIN 0x05
+-# endif
+-# ifndef SUBLANG_KASHMIRI_INDIA
+-# define SUBLANG_KASHMIRI_INDIA 0x02
+-# endif
+-# ifndef SUBLANG_MALAY_MALAYSIA
+-# define SUBLANG_MALAY_MALAYSIA 0x01
+-# endif
+-# ifndef SUBLANG_MALAY_BRUNEI_DARUSSALAM
+-# define SUBLANG_MALAY_BRUNEI_DARUSSALAM 0x02
+-# endif
+-# ifndef SUBLANG_NEPALI_INDIA
+-# define SUBLANG_NEPALI_INDIA 0x02
+-# endif
+-# ifndef SUBLANG_PUNJABI_INDIA
+-# define SUBLANG_PUNJABI_INDIA 0x00
+-# endif
+-# ifndef SUBLANG_PUNJABI_PAKISTAN
+-# define SUBLANG_PUNJABI_PAKISTAN 0x01
+-# endif
+-# ifndef SUBLANG_ROMANIAN_ROMANIA
+-# define SUBLANG_ROMANIAN_ROMANIA 0x00
+-# endif
+-# ifndef SUBLANG_ROMANIAN_MOLDOVA
+-# define SUBLANG_ROMANIAN_MOLDOVA 0x01
+-# endif
+-# ifndef SUBLANG_SERBIAN_LATIN
+-# define SUBLANG_SERBIAN_LATIN 0x02
+-# endif
+-# ifndef SUBLANG_SERBIAN_CYRILLIC
+-# define SUBLANG_SERBIAN_CYRILLIC 0x03
+-# endif
+-# ifndef SUBLANG_SINDHI_INDIA
+-# define SUBLANG_SINDHI_INDIA 0x00
+-# endif
+-# ifndef SUBLANG_SINDHI_PAKISTAN
+-# define SUBLANG_SINDHI_PAKISTAN 0x01
+-# endif
+-# ifndef SUBLANG_SPANISH_GUATEMALA
+-# define SUBLANG_SPANISH_GUATEMALA 0x04
+-# endif
+-# ifndef SUBLANG_SPANISH_COSTA_RICA
+-# define SUBLANG_SPANISH_COSTA_RICA 0x05
+-# endif
+-# ifndef SUBLANG_SPANISH_PANAMA
+-# define SUBLANG_SPANISH_PANAMA 0x06
+-# endif
+-# ifndef SUBLANG_SPANISH_DOMINICAN_REPUBLIC
+-# define SUBLANG_SPANISH_DOMINICAN_REPUBLIC 0x07
+-# endif
+-# ifndef SUBLANG_SPANISH_VENEZUELA
+-# define SUBLANG_SPANISH_VENEZUELA 0x08
+-# endif
+-# ifndef SUBLANG_SPANISH_COLOMBIA
+-# define SUBLANG_SPANISH_COLOMBIA 0x09
+-# endif
+-# ifndef SUBLANG_SPANISH_PERU
+-# define SUBLANG_SPANISH_PERU 0x0a
+-# endif
+-# ifndef SUBLANG_SPANISH_ARGENTINA
+-# define SUBLANG_SPANISH_ARGENTINA 0x0b
+-# endif
+-# ifndef SUBLANG_SPANISH_ECUADOR
+-# define SUBLANG_SPANISH_ECUADOR 0x0c
+-# endif
+-# ifndef SUBLANG_SPANISH_CHILE
+-# define SUBLANG_SPANISH_CHILE 0x0d
+-# endif
+-# ifndef SUBLANG_SPANISH_URUGUAY
+-# define SUBLANG_SPANISH_URUGUAY 0x0e
+-# endif
+-# ifndef SUBLANG_SPANISH_PARAGUAY
+-# define SUBLANG_SPANISH_PARAGUAY 0x0f
+-# endif
+-# ifndef SUBLANG_SPANISH_BOLIVIA
+-# define SUBLANG_SPANISH_BOLIVIA 0x10
+-# endif
+-# ifndef SUBLANG_SPANISH_EL_SALVADOR
+-# define SUBLANG_SPANISH_EL_SALVADOR 0x11
+-# endif
+-# ifndef SUBLANG_SPANISH_HONDURAS
+-# define SUBLANG_SPANISH_HONDURAS 0x12
+-# endif
+-# ifndef SUBLANG_SPANISH_NICARAGUA
+-# define SUBLANG_SPANISH_NICARAGUA 0x13
+-# endif
+-# ifndef SUBLANG_SPANISH_PUERTO_RICO
+-# define SUBLANG_SPANISH_PUERTO_RICO 0x14
+-# endif
+-# ifndef SUBLANG_SWEDISH_FINLAND
+-# define SUBLANG_SWEDISH_FINLAND 0x02
+-# endif
+-# ifndef SUBLANG_TAMAZIGHT_ARABIC
+-# define SUBLANG_TAMAZIGHT_ARABIC 0x01
+-# endif
+-# ifndef SUBLANG_TAMAZIGHT_LATIN
+-# define SUBLANG_TAMAZIGHT_LATIN 0x02
+-# endif
+-# ifndef SUBLANG_TIGRINYA_ETHIOPIA
+-# define SUBLANG_TIGRINYA_ETHIOPIA 0x00
+-# endif
+-# ifndef SUBLANG_TIGRINYA_ERITREA
+-# define SUBLANG_TIGRINYA_ERITREA 0x01
+-# endif
+-# ifndef SUBLANG_URDU_PAKISTAN
+-# define SUBLANG_URDU_PAKISTAN 0x01
+-# endif
+-# ifndef SUBLANG_URDU_INDIA
+-# define SUBLANG_URDU_INDIA 0x02
+-# endif
+-# ifndef SUBLANG_UZBEK_LATIN
+-# define SUBLANG_UZBEK_LATIN 0x01
+-# endif
+-# ifndef SUBLANG_UZBEK_CYRILLIC
+-# define SUBLANG_UZBEK_CYRILLIC 0x02
+-# endif
+-#endif
+-
+-/* XPG3 defines the result of 'setlocale (category, NULL)' as:
+-   "Directs 'setlocale()' to query 'category' and return the current
+-    setting of 'local'."
+-   However it does not specify the exact format.  Neither do SUSV2 and
+-   ISO C 99.  So we can use this feature only on selected systems (e.g.
+-   those using GNU C Library).  */
+-#if defined _LIBC || (defined __GNU_LIBRARY__ && __GNU_LIBRARY__ >= 2)
+-# define HAVE_LOCALE_NULL
+-#endif
+-
+-/* Determine the current locale's name, and canonicalize it into XPG syntax
+-     language[_territory[.codeset]][@modifier]
+-   The codeset part in the result is not reliable; the locale_charset()
+-   should be used for codeset information instead.
+-   The result must not be freed; it is statically allocated.  */
+-
+-const char *
+-_nl_locale_name_posix (int category, const char *categoryname)
+-{
+-  /* Use the POSIX methods of looking to 'LC_ALL', 'LC_xxx', and 'LANG'.
+-     On some systems this can be done by the 'setlocale' function itself.  */
+-#if defined HAVE_SETLOCALE && defined HAVE_LC_MESSAGES && defined HAVE_LOCALE_NULL
+-  return setlocale (category, NULL);
+-#else
+-  const char *retval;
+-
+-  /* Setting of LC_ALL overrides all other.  */
+-  retval = getenv ("LC_ALL");
+-  if (retval != NULL && retval[0] != '\0')
+-    return retval;
+-  /* Next comes the name of the desired category.  */
+-  retval = getenv (categoryname);
+-  if (retval != NULL && retval[0] != '\0')
+-    return retval;
+-  /* Last possibility is the LANG environment variable.  */
+-  retval = getenv ("LANG");
+-  if (retval != NULL && retval[0] != '\0')
+-    return retval;
+-
+-  return NULL;
+-#endif
+-}
+-
+-const char *
+-_nl_locale_name_default (void)
+-{
+-  /* POSIX:2001 says:
+-     "All implementations shall define a locale as the default locale, to be
+-      invoked when no environment variables are set, or set to the empty
+-      string.  This default locale can be the POSIX locale or any other
+-      implementation-defined locale.  Some implementations may provide
+-      facilities for local installation administrators to set the default
+-      locale, customizing it for each location.  POSIX:2001 does not require
+-      such a facility.  */
+-
+-#if !(HAVE_CFLOCALECOPYCURRENT || HAVE_CFPREFERENCESCOPYAPPVALUE || defined(WIN32))
+-
+-  /* The system does not have a way of setting the locale, other than the
+-     POSIX specified environment variables.  We use C as default locale.  */
+-  return "C";
+-
+-#else
+-
+-  /* Return an XPG style locale name language[_territory][@modifier].
+-     Don't even bother determining the codeset; it's not useful in this
+-     context, because message catalogs are not specific to a single
+-     codeset.  */
+-
+-# if HAVE_CFLOCALECOPYCURRENT || HAVE_CFPREFERENCESCOPYAPPVALUE
+-  /* MacOS X 10.2 or newer */
+-  {
+-    /* Cache the locale name, since CoreFoundation calls are expensive.  */
+-    static const char *cached_localename;
+-
+-    if (cached_localename == NULL)
+-      {
+-	char namebuf[256];
+-#  if HAVE_CFLOCALECOPYCURRENT /* MacOS X 10.3 or newer */
+-	CFLocaleRef locale = CFLocaleCopyCurrent ();
+-	CFStringRef name = CFLocaleGetIdentifier (locale);
+-
+-	if (CFStringGetCString (name, namebuf, sizeof(namebuf),
+-				kCFStringEncodingASCII))
+-	  cached_localename = strdup (namebuf);
+-	CFRelease (locale);
+-#  elif HAVE_CFPREFERENCESCOPYAPPVALUE /* MacOS X 10.2 or newer */
+-	CFTypeRef value =
+-	  CFPreferencesCopyAppValue (CFSTR ("AppleLocale"),
+-				     kCFPreferencesCurrentApplication);
+-	if (value != NULL
+-	    && CFGetTypeID (value) == CFStringGetTypeID ()
+-	    && CFStringGetCString ((CFStringRef)value, namebuf, sizeof(namebuf),
+-				   kCFStringEncodingASCII))
+-	  cached_localename = strdup (namebuf);
+-#  endif
+-	if (cached_localename == NULL)
+-	  cached_localename = "C";
+-      }
+-    return cached_localename;
+-  }
+-
+-# endif
+-
+-# if defined(WIN32) /* WIN32 */
+-  {
+-    LCID lcid;
+-    LANGID langid;
+-    int primary, sub;
+-
+-    /* Use native Win32 API locale ID.  */
+-    lcid = GetThreadLocale ();
+-
+-    /* Strip off the sorting rules, keep only the language part.  */
+-    langid = LANGIDFROMLCID (lcid);
+-
+-    /* Split into language and territory part.  */
+-    primary = PRIMARYLANGID (langid);
+-    sub = SUBLANGID (langid);
+-
+-    /* Dispatch on language.
+-       See also http://www.unicode.org/unicode/onlinedat/languages.html .
+-       For details about languages, see http://www.ethnologue.com/ .  */
+-    switch (primary)
+-      {
+-      case LANG_AFRIKAANS: return "af_ZA";
+-      case LANG_ALBANIAN: return "sq_AL";
+-      case LANG_AMHARIC: return "am_ET";
+-      case LANG_ARABIC:
+-	switch (sub)
+-	  {
+-	  case SUBLANG_ARABIC_SAUDI_ARABIA: return "ar_SA";
+-	  case SUBLANG_ARABIC_IRAQ: return "ar_IQ";
+-	  case SUBLANG_ARABIC_EGYPT: return "ar_EG";
+-	  case SUBLANG_ARABIC_LIBYA: return "ar_LY";
+-	  case SUBLANG_ARABIC_ALGERIA: return "ar_DZ";
+-	  case SUBLANG_ARABIC_MOROCCO: return "ar_MA";
+-	  case SUBLANG_ARABIC_TUNISIA: return "ar_TN";
+-	  case SUBLANG_ARABIC_OMAN: return "ar_OM";
+-	  case SUBLANG_ARABIC_YEMEN: return "ar_YE";
+-	  case SUBLANG_ARABIC_SYRIA: return "ar_SY";
+-	  case SUBLANG_ARABIC_JORDAN: return "ar_JO";
+-	  case SUBLANG_ARABIC_LEBANON: return "ar_LB";
+-	  case SUBLANG_ARABIC_KUWAIT: return "ar_KW";
+-	  case SUBLANG_ARABIC_UAE: return "ar_AE";
+-	  case SUBLANG_ARABIC_BAHRAIN: return "ar_BH";
+-	  case SUBLANG_ARABIC_QATAR: return "ar_QA";
+-	  }
+-	return "ar";
+-      case LANG_ARMENIAN: return "hy_AM";
+-      case LANG_ASSAMESE: return "as_IN";
+-      case LANG_AZERI:
+-	switch (sub)
+-	  {
+-	  /* FIXME: Adjust this when Azerbaijani locales appear on Unix.  */
+-	  case SUBLANG_AZERI_LATIN: return "az_AZ@latin";
+-	  case SUBLANG_AZERI_CYRILLIC: return "az_AZ@cyrillic";
+-	  }
+-	return "az";
+-      case LANG_BASQUE:
+-	switch (sub)
+-	  {
+-	  case SUBLANG_DEFAULT: return "eu_ES";
+-	  }
+-	return "eu"; /* Ambiguous: could be "eu_ES" or "eu_FR".  */
+-      case LANG_BELARUSIAN: return "be_BY";
+-      case LANG_BENGALI:
+-	switch (sub)
+-	  {
+-	  case SUBLANG_BENGALI_INDIA: return "bn_IN";
+-	  case SUBLANG_BENGALI_BANGLADESH: return "bn_BD";
+-	  }
+-	return "bn";
+-      case LANG_BULGARIAN: return "bg_BG";
+-      case LANG_BURMESE: return "my_MM";
+-      case LANG_CAMBODIAN: return "km_KH";
+-      case LANG_CATALAN: return "ca_ES";
+-      case LANG_CHEROKEE: return "chr_US";
+-      case LANG_CHINESE:
+-	switch (sub)
+-	  {
+-	  case SUBLANG_CHINESE_TRADITIONAL: return "zh_TW";
+-	  case SUBLANG_CHINESE_SIMPLIFIED: return "zh_CN";
+-	  case SUBLANG_CHINESE_HONGKONG: return "zh_HK";
+-	  case SUBLANG_CHINESE_SINGAPORE: return "zh_SG";
+-	  case SUBLANG_CHINESE_MACAU: return "zh_MO";
+-	  }
+-	return "zh";
+-      case LANG_CROATIAN:       /* LANG_CROATIAN == LANG_SERBIAN
+-				 * What used to be called Serbo-Croatian
+-				 * should really now be two separate
+-				 * languages because of political reasons.
+-				 * (Says tml, who knows nothing about Serbian
+-				 * or Croatian.)
+-				 * (I can feel those flames coming already.)
+-				 */
+-	switch (sub)
+-	  {
+-	  case SUBLANG_DEFAULT: return "hr_HR";
+-	  case SUBLANG_SERBIAN_LATIN: return "sr_CS";
+-	  case SUBLANG_SERBIAN_CYRILLIC: return "sr_CS@cyrillic";
+-	  }
+-	return "hr";
+-      case LANG_CZECH: return "cs_CZ";
+-      case LANG_DANISH: return "da_DK";
+-      case LANG_DIVEHI: return "dv_MV";
+-      case LANG_DUTCH:
+-	switch (sub)
+-	  {
+-	  case SUBLANG_DUTCH: return "nl_NL";
+-	  case SUBLANG_DUTCH_BELGIAN: /* FLEMISH, VLAAMS */ return "nl_BE";
+-	  }
+-	return "nl";
+-      case LANG_EDO: return "bin_NG";
+-      case LANG_ENGLISH:
+-	switch (sub)
+-	  {
+-	  /* SUBLANG_ENGLISH_US == SUBLANG_DEFAULT. Heh. I thought
+-	   * English was the language spoken in England.
+-	   * Oh well.
+-	   */
+-	  case SUBLANG_ENGLISH_US: return "en_US";
+-	  case SUBLANG_ENGLISH_UK: return "en_GB";
+-	  case SUBLANG_ENGLISH_AUS: return "en_AU";
+-	  case SUBLANG_ENGLISH_CAN: return "en_CA";
+-	  case SUBLANG_ENGLISH_NZ: return "en_NZ";
+-	  case SUBLANG_ENGLISH_EIRE: return "en_IE";
+-	  case SUBLANG_ENGLISH_SOUTH_AFRICA: return "en_ZA";
+-	  case SUBLANG_ENGLISH_JAMAICA: return "en_JM";
+-	  case SUBLANG_ENGLISH_CARIBBEAN: return "en_GD"; /* Grenada? */
+-	  case SUBLANG_ENGLISH_BELIZE: return "en_BZ";
+-	  case SUBLANG_ENGLISH_TRINIDAD: return "en_TT";
+-	  case SUBLANG_ENGLISH_ZIMBABWE: return "en_ZW";
+-	  case SUBLANG_ENGLISH_PHILIPPINES: return "en_PH";
+-	  case SUBLANG_ENGLISH_INDONESIA: return "en_ID";
+-	  case SUBLANG_ENGLISH_HONGKONG: return "en_HK";
+-	  case SUBLANG_ENGLISH_INDIA: return "en_IN";
+-	  case SUBLANG_ENGLISH_MALAYSIA: return "en_MY";
+-	  case SUBLANG_ENGLISH_SINGAPORE: return "en_SG";
+-	  }
+-	return "en";
+-      case LANG_ESTONIAN: return "et_EE";
+-      case LANG_FAEROESE: return "fo_FO";
+-      case LANG_FARSI: return "fa_IR";
+-      case LANG_FINNISH: return "fi_FI";
+-      case LANG_FRENCH:
+-	switch (sub)
+-	  {
+-	  case SUBLANG_FRENCH: return "fr_FR";
+-	  case SUBLANG_FRENCH_BELGIAN: /* WALLOON */ return "fr_BE";
+-	  case SUBLANG_FRENCH_CANADIAN: return "fr_CA";
+-	  case SUBLANG_FRENCH_SWISS: return "fr_CH";
+-	  case SUBLANG_FRENCH_LUXEMBOURG: return "fr_LU";
+-	  case SUBLANG_FRENCH_MONACO: return "fr_MC";
+-	  case SUBLANG_FRENCH_WESTINDIES: return "fr"; /* Caribbean? */
+-	  case SUBLANG_FRENCH_REUNION: return "fr_RE";
+-	  case SUBLANG_FRENCH_CONGO: return "fr_CG";
+-	  case SUBLANG_FRENCH_SENEGAL: return "fr_SN";
+-	  case SUBLANG_FRENCH_CAMEROON: return "fr_CM";
+-	  case SUBLANG_FRENCH_COTEDIVOIRE: return "fr_CI";
+-	  case SUBLANG_FRENCH_MALI: return "fr_ML";
+-	  case SUBLANG_FRENCH_MOROCCO: return "fr_MA";
+-	  case SUBLANG_FRENCH_HAITI: return "fr_HT";
+-	  }
+-	return "fr";
+-      case LANG_FRISIAN: return "fy_NL";
+-      case LANG_FULFULDE:
+-	/* Spoken in Nigeria, Guinea, Senegal, Mali, Niger, Cameroon, Benin.  */
+-	return "ff_NG";
+-      case LANG_GAELIC:
+-	switch (sub)
+-	  {
+-	  case 0x01: /* SCOTTISH */ return "gd_GB";
+-	  case 0x02: /* IRISH */ return "ga_IE";
+-	  }
+-	return "C";
+-      case LANG_GALICIAN: return "gl_ES";
+-      case LANG_GEORGIAN: return "ka_GE";
+-      case LANG_GERMAN:
+-	switch (sub)
+-	  {
+-	  case SUBLANG_GERMAN: return "de_DE";
+-	  case SUBLANG_GERMAN_SWISS: return "de_CH";
+-	  case SUBLANG_GERMAN_AUSTRIAN: return "de_AT";
+-	  case SUBLANG_GERMAN_LUXEMBOURG: return "de_LU";
+-	  case SUBLANG_GERMAN_LIECHTENSTEIN: return "de_LI";
+-	  }
+-	return "de";
+-      case LANG_GREEK: return "el_GR";
+-      case LANG_GUARANI: return "gn_PY";
+-      case LANG_GUJARATI: return "gu_IN";
+-      case LANG_HAUSA: return "ha_NG";
+-      case LANG_HAWAIIAN:
+-	/* FIXME: Do they mean Hawaiian ("haw_US", 1000 speakers)
+-	   or Hawaii Creole English ("cpe_US", 600000 speakers)?  */
+-	return "cpe_US";
+-      case LANG_HEBREW: return "he_IL";
+-      case LANG_HINDI: return "hi_IN";
+-      case LANG_HUNGARIAN: return "hu_HU";
+-      case LANG_IBIBIO: return "nic_NG";
+-      case LANG_ICELANDIC: return "is_IS";
+-      case LANG_IGBO: return "ig_NG";
+-      case LANG_INDONESIAN: return "id_ID";
+-      case LANG_INUKTITUT: return "iu_CA";
+-      case LANG_ITALIAN:
+-	switch (sub)
+-	  {
+-	  case SUBLANG_ITALIAN: return "it_IT";
+-	  case SUBLANG_ITALIAN_SWISS: return "it_CH";
+-	  }
+-	return "it";
+-      case LANG_JAPANESE: return "ja_JP";
+-      case LANG_KANNADA: return "kn_IN";
+-      case LANG_KANURI: return "kr_NG";
+-      case LANG_KASHMIRI:
+-	switch (sub)
+-	  {
+-	  case SUBLANG_DEFAULT: return "ks_PK";
+-	  case SUBLANG_KASHMIRI_INDIA: return "ks_IN";
+-	  }
+-	return "ks";
+-      case LANG_KAZAK: return "kk_KZ";
+-      case LANG_KONKANI:
+-	/* FIXME: Adjust this when such locales appear on Unix.  */
+-	return "kok_IN";
+-      case LANG_KOREAN: return "ko_KR";
+-      case LANG_KYRGYZ: return "ky_KG";
+-      case LANG_LAO: return "lo_LA";
+-      case LANG_LATIN: return "la_VA";
+-      case LANG_LATVIAN: return "lv_LV";
+-      case LANG_LITHUANIAN: return "lt_LT";
+-      case LANG_MACEDONIAN: return "mk_MK";
+-      case LANG_MALAY:
+-	switch (sub)
+-	  {
+-	  case SUBLANG_MALAY_MALAYSIA: return "ms_MY";
+-	  case SUBLANG_MALAY_BRUNEI_DARUSSALAM: return "ms_BN";
+-	  }
+-	return "ms";
+-      case LANG_MALAYALAM: return "ml_IN";
+-      case LANG_MALTESE: return "mt_MT";
+-      case LANG_MANIPURI:
+-	/* FIXME: Adjust this when such locales appear on Unix.  */
+-	return "mni_IN";
+-      case LANG_MARATHI: return "mr_IN";
+-      case LANG_MONGOLIAN:
+-	switch (sub)
+-	  {
+-	  case SUBLANG_DEFAULT: return "mn_MN";
+-	  }
+-	return "mn"; /* Ambiguous: could be "mn_CN" or "mn_MN".  */
+-      case LANG_NEPALI:
+-	switch (sub)
+-	  {
+-	  case SUBLANG_DEFAULT: return "ne_NP";
+-	  case SUBLANG_NEPALI_INDIA: return "ne_IN";
+-	  }
+-	return "ne";
+-      case LANG_NORWEGIAN:
+-	switch (sub)
+-	  {
+-	  case SUBLANG_NORWEGIAN_BOKMAL: return "nb_NO";
+-	  case SUBLANG_NORWEGIAN_NYNORSK: return "nn_NO";
+-	  }
+-	return "no";
+-      case LANG_ORIYA: return "or_IN";
+-      case LANG_OROMO: return "om_ET";
+-      case LANG_PAPIAMENTU: return "pap_AN";
+-      case LANG_PASHTO:
+-	return "ps"; /* Ambiguous: could be "ps_PK" or "ps_AF".  */
+-      case LANG_POLISH: return "pl_PL";
+-      case LANG_PORTUGUESE:
+-	switch (sub)
+-	  {
+-	  case SUBLANG_PORTUGUESE: return "pt_PT";
+-	  /* Hmm. SUBLANG_PORTUGUESE_BRAZILIAN == SUBLANG_DEFAULT.
+-	     Same phenomenon as SUBLANG_ENGLISH_US == SUBLANG_DEFAULT. */
+-	  case SUBLANG_PORTUGUESE_BRAZILIAN: return "pt_BR";
+-	  }
+-	return "pt";
+-      case LANG_PUNJABI:
+-	switch (sub)
+-	  {
+-	  case SUBLANG_PUNJABI_INDIA: return "pa_IN"; /* Gurmukhi script */
+-	  case SUBLANG_PUNJABI_PAKISTAN: return "pa_PK"; /* Arabic script */
+-	  }
+-	return "pa";
+-      case LANG_RHAETO_ROMANCE: return "rm_CH";
+-      case LANG_ROMANIAN:
+-	switch (sub)
+-	  {
+-	  case SUBLANG_ROMANIAN_ROMANIA: return "ro_RO";
+-	  case SUBLANG_ROMANIAN_MOLDOVA: return "ro_MD";
+-	  }
+-	return "ro";
+-      case LANG_RUSSIAN:
+-	switch (sub)
+-	  {
+-	  case SUBLANG_DEFAULT: return "ru_RU";
+-	  }
+-	return "ru"; /* Ambiguous: could be "ru_RU" or "ru_UA" or "ru_MD".  */
+-      case LANG_SAAMI: /* actually Northern Sami */ return "se_NO";
+-      case LANG_SANSKRIT: return "sa_IN";
+-      case LANG_SINDHI:
+-	switch (sub)
+-	  {
+-	  case SUBLANG_SINDHI_INDIA: return "sd_IN";
+-	  case SUBLANG_SINDHI_PAKISTAN: return "sd_PK";
+-	  }
+-	return "sd";
+-      case LANG_SINHALESE: return "si_LK";
+-      case LANG_SLOVAK: return "sk_SK";
+-      case LANG_SLOVENIAN: return "sl_SI";
+-      case LANG_SOMALI: return "so_SO";
+-      case LANG_SORBIAN:
+-	/* FIXME: Adjust this when such locales appear on Unix.  */
+-	return "wen_DE";
+-      case LANG_SPANISH:
+-	switch (sub)
+-	  {
+-	  case SUBLANG_SPANISH: return "es_ES";
+-	  case SUBLANG_SPANISH_MEXICAN: return "es_MX";
+-	  case SUBLANG_SPANISH_MODERN:
+-	    return "es_ES@modern";	/* not seen on Unix */
+-	  case SUBLANG_SPANISH_GUATEMALA: return "es_GT";
+-	  case SUBLANG_SPANISH_COSTA_RICA: return "es_CR";
+-	  case SUBLANG_SPANISH_PANAMA: return "es_PA";
+-	  case SUBLANG_SPANISH_DOMINICAN_REPUBLIC: return "es_DO";
+-	  case SUBLANG_SPANISH_VENEZUELA: return "es_VE";
+-	  case SUBLANG_SPANISH_COLOMBIA: return "es_CO";
+-	  case SUBLANG_SPANISH_PERU: return "es_PE";
+-	  case SUBLANG_SPANISH_ARGENTINA: return "es_AR";
+-	  case SUBLANG_SPANISH_ECUADOR: return "es_EC";
+-	  case SUBLANG_SPANISH_CHILE: return "es_CL";
+-	  case SUBLANG_SPANISH_URUGUAY: return "es_UY";
+-	  case SUBLANG_SPANISH_PARAGUAY: return "es_PY";
+-	  case SUBLANG_SPANISH_BOLIVIA: return "es_BO";
+-	  case SUBLANG_SPANISH_EL_SALVADOR: return "es_SV";
+-	  case SUBLANG_SPANISH_HONDURAS: return "es_HN";
+-	  case SUBLANG_SPANISH_NICARAGUA: return "es_NI";
+-	  case SUBLANG_SPANISH_PUERTO_RICO: return "es_PR";
+-	  }
+-	return "es";
+-      case LANG_SUTU: return "bnt_TZ"; /* or "st_LS" or "nso_ZA"? */
+-      case LANG_SWAHILI: return "sw_KE";
+-      case LANG_SWEDISH:
+-	switch (sub)
+-	  {
+-	  case SUBLANG_DEFAULT: return "sv_SE";
+-	  case SUBLANG_SWEDISH_FINLAND: return "sv_FI";
+-	  }
+-	return "sv";
+-      case LANG_SYRIAC: return "syr_TR"; /* An extinct language.  */
+-      case LANG_TAGALOG: return "tl_PH";
+-      case LANG_TAJIK: return "tg_TJ";
+-      case LANG_TAMAZIGHT:
+-	switch (sub)
+-	  {
+-	  /* FIXME: Adjust this when Tamazight locales appear on Unix.  */
+-	  case SUBLANG_TAMAZIGHT_ARABIC: return "ber_MA@arabic";
+-	  case SUBLANG_TAMAZIGHT_LATIN: return "ber_MA@latin";
+-	  }
+-	return "ber_MA";
+-      case LANG_TAMIL:
+-	switch (sub)
+-	  {
+-	  case SUBLANG_DEFAULT: return "ta_IN";
+-	  }
+-	return "ta"; /* Ambiguous: could be "ta_IN" or "ta_LK" or "ta_SG".  */
+-      case LANG_TATAR: return "tt_RU";
+-      case LANG_TELUGU: return "te_IN";
+-      case LANG_THAI: return "th_TH";
+-      case LANG_TIBETAN: return "bo_CN";
+-      case LANG_TIGRINYA:
+-	switch (sub)
+-	  {
+-	  case SUBLANG_TIGRINYA_ETHIOPIA: return "ti_ET";
+-	  case SUBLANG_TIGRINYA_ERITREA: return "ti_ER";
+-	  }
+-	return "ti";
+-      case LANG_TSONGA: return "ts_ZA";
+-      case LANG_TSWANA: return "tn_BW";
+-      case LANG_TURKISH: return "tr_TR";
+-      case LANG_TURKMEN: return "tk_TM";
+-      case LANG_UKRAINIAN: return "uk_UA";
+-      case LANG_URDU:
+-	switch (sub)
+-	  {
+-	  case SUBLANG_URDU_PAKISTAN: return "ur_PK";
+-	  case SUBLANG_URDU_INDIA: return "ur_IN";
+-	  }
+-	return "ur";
+-      case LANG_UZBEK:
+-	switch (sub)
+-	  {
+-	  case SUBLANG_UZBEK_LATIN: return "uz_UZ";
+-	  case SUBLANG_UZBEK_CYRILLIC: return "uz_UZ@cyrillic";
+-	  }
+-	return "uz";
+-      case LANG_VENDA: return "ve_ZA";
+-      case LANG_VIETNAMESE: return "vi_VN";
+-      case LANG_WELSH: return "cy_GB";
+-      case LANG_XHOSA: return "xh_ZA";
+-      case LANG_YI: return "sit_CN";
+-      case LANG_YIDDISH: return "yi_IL";
+-      case LANG_YORUBA: return "yo_NG";
+-      case LANG_ZULU: return "zu_ZA";
+-      default: return "C";
+-      }
+-  }
+-# endif
+-#endif
+-}
+-
+-const char *
+-_nl_locale_name (int category, const char *categoryname)
+-{
+-  const char *retval;
+-
+-  retval = _nl_locale_name_posix (category, categoryname);
+-  if (retval != NULL)
+-    return retval;
+-
+-  return _nl_locale_name_default ();
+-}
+--- a/intl/log.c
++++ /dev/null
+@@ -1,98 +0,0 @@
+-/* Log file output.
+-   Copyright (C) 2003 Free Software Foundation, Inc.
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
+-/* Written by Bruno Haible <bruno@clisp.org>.  */
+-
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-#include <stdio.h>
+-#include <stdlib.h>
+-#include <string.h>
+-
+-/* Print an ASCII string with quotes and escape sequences where needed.  */
+-static void
+-print_escaped (FILE *stream, const char *str)
+-{
+-  putc ('"', stream);
+-  for (; *str != '\0'; str++)
+-    if (*str == '\n')
+-      {
+-	fputs ("\\n\"", stream);
+-	if (str[1] == '\0')
+-	  return;
+-	fputs ("\n\"", stream);
+-      }
+-    else
+-      {
+-	if (*str == '"' || *str == '\\')
+-	  putc ('\\', stream);
+-	putc (*str, stream);
+-      }
+-  putc ('"', stream);
+-}
+-
+-/* Add to the log file an entry denoting a failed translation.  */
+-void
+-_nl_log_untranslated (const char *logfilename, const char *domainname,
+-		      const char *msgid1, const char *msgid2, int plural)
+-{
+-  static char *last_logfilename = NULL;
+-  static FILE *last_logfile = NULL;
+-  FILE *logfile;
+-
+-  /* Can we reuse the last opened logfile?  */
+-  if (last_logfilename == NULL || strcmp (logfilename, last_logfilename) != 0)
+-    {
+-      /* Close the last used logfile.  */
+-      if (last_logfilename != NULL)
+-	{
+-	  if (last_logfile != NULL)
+-	    {
+-	      fclose (last_logfile);
+-	      last_logfile = NULL;
+-	    }
+-	  free (last_logfilename);
+-	  last_logfilename = NULL;
+-	}
+-      /* Open the logfile.  */
+-      last_logfilename = (char *) malloc (strlen (logfilename) + 1);
+-      if (last_logfilename == NULL)
+-	return;
+-      strcpy (last_logfilename, logfilename);
+-      last_logfile = fopen (logfilename, "a");
+-      if (last_logfile == NULL)
+-	return;
+-    }
+-  logfile = last_logfile;
+-
+-  fprintf (logfile, "domain ");
+-  print_escaped (logfile, domainname);
+-  fprintf (logfile, "\nmsgid ");
+-  print_escaped (logfile, msgid1);
+-  if (plural)
+-    {
+-      fprintf (logfile, "\nmsgid_plural ");
+-      print_escaped (logfile, msgid2);
+-      fprintf (logfile, "\nmsgstr[0] \"\"\n");
+-    }
+-  else
+-    fprintf (logfile, "\nmsgstr \"\"\n");
+-  putc ('\n', logfile);
+-}
+--- a/intl/ngettext.c
++++ /dev/null
+@@ -1,65 +0,0 @@
+-/* Implementation of ngettext(3) function.
+-   Copyright (C) 1995, 1997, 2000-2003 Free Software Foundation, Inc.
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
+-# define NGETTEXT libintl_ngettext
+-# define DCNGETTEXT libintl_dcngettext
+-#endif
+-
+-/* Look up MSGID in the current default message catalog for the current
+-   LC_MESSAGES locale.  If not found, returns MSGID itself (the default
+-   text).  */
+-char *
+-NGETTEXT (const char *msgid1, const char *msgid2, unsigned long int n)
+-{
+-  return DCNGETTEXT (NULL, msgid1, msgid2, n, LC_MESSAGES);
+-}
+-
+-#ifdef _LIBC
+-/* Alias for function name in GNU C Library.  */
+-weak_alias (__ngettext, ngettext);
+-#endif
+--- a/intl/os2compat.c
++++ /dev/null
+@@ -1,98 +0,0 @@
+-/* OS/2 compatibility functions.
+-   Copyright (C) 2001-2002 Free Software Foundation, Inc.
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
+-#define OS2_AWARE
+-#ifdef HAVE_CONFIG_H
+-#include <config.h>
+-#endif
+-
+-#include <stdlib.h>
+-#include <string.h>
+-#include <sys/param.h>
+-
+-/* A version of getenv() that works from DLLs */
+-extern unsigned long DosScanEnv (const unsigned char *pszName, unsigned char **ppszValue);
+-
+-char *
+-_nl_getenv (const char *name)
+-{
+-  unsigned char *value;
+-  if (DosScanEnv (name, &value))
+-    return NULL;
+-  else
+-    return value;
+-}
+-
+-/* A fixed size buffer.  */
+-char libintl_nl_default_dirname[MAXPATHLEN+1];
+-
+-char *_nlos2_libdir = NULL;
+-char *_nlos2_localealiaspath = NULL;
+-char *_nlos2_localedir = NULL;
+-
+-static __attribute__((constructor)) void
+-nlos2_initialize ()
+-{
+-  char *root = getenv ("UNIXROOT");
+-  char *gnulocaledir = getenv ("GNULOCALEDIR");
+-
+-  _nlos2_libdir = gnulocaledir;
+-  if (!_nlos2_libdir)
+-    {
+-      if (root)
+-        {
+-          size_t sl = strlen (root);
+-          _nlos2_libdir = (char *) malloc (sl + strlen (LIBDIR) + 1);
+-          memcpy (_nlos2_libdir, root, sl);
+-          memcpy (_nlos2_libdir + sl, LIBDIR, strlen (LIBDIR) + 1);
+-        }
+-      else
+-        _nlos2_libdir = LIBDIR;
+-    }
+-
+-  _nlos2_localealiaspath = gnulocaledir;
+-  if (!_nlos2_localealiaspath)
+-    {
+-      if (root)
+-        {
+-          size_t sl = strlen (root);
+-          _nlos2_localealiaspath = (char *) malloc (sl + strlen (LOCALE_ALIAS_PATH) + 1);
+-          memcpy (_nlos2_localealiaspath, root, sl);
+-          memcpy (_nlos2_localealiaspath + sl, LOCALE_ALIAS_PATH, strlen (LOCALE_ALIAS_PATH) + 1);
+-        }
+-     else
+-        _nlos2_localealiaspath = LOCALE_ALIAS_PATH;
+-    }
+-
+-  _nlos2_localedir = gnulocaledir;
+-  if (!_nlos2_localedir)
+-    {
+-      if (root)
+-        {
+-          size_t sl = strlen (root);
+-          _nlos2_localedir = (char *) malloc (sl + strlen (LOCALEDIR) + 1);
+-          memcpy (_nlos2_localedir, root, sl);
+-          memcpy (_nlos2_localedir + sl, LOCALEDIR, strlen (LOCALEDIR) + 1);
+-        }
+-      else
+-        _nlos2_localedir = LOCALEDIR;
+-    }
+-
+-  if (strlen (_nlos2_localedir) <= MAXPATHLEN)
+-    strcpy (libintl_nl_default_dirname, _nlos2_localedir);
+-}
+--- a/intl/os2compat.h
++++ /dev/null
+@@ -1,46 +0,0 @@
+-/* OS/2 compatibility defines.
+-   This file is intended to be included from config.h
+-   Copyright (C) 2001-2002 Free Software Foundation, Inc.
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
+-/* When included from os2compat.h we need all the original definitions */
+-#ifndef OS2_AWARE
+-
+-#undef LIBDIR
+-#define LIBDIR			_nlos2_libdir
+-extern char *_nlos2_libdir;
+-
+-#undef LOCALEDIR
+-#define LOCALEDIR		_nlos2_localedir
+-extern char *_nlos2_localedir;
+-
+-#undef LOCALE_ALIAS_PATH
+-#define LOCALE_ALIAS_PATH	_nlos2_localealiaspath
+-extern char *_nlos2_localealiaspath;
+-
+-#endif
+-
+-#undef HAVE_STRCASECMP
+-#define HAVE_STRCASECMP 1
+-#define strcasecmp stricmp
+-#define strncasecmp strnicmp
+-
+-/* We have our own getenv() which works even if library is compiled as DLL */
+-#define getenv _nl_getenv
+-
+-/* Older versions of gettext used -1 as the value of LC_MESSAGES */
+-#define LC_MESSAGES_COMPAT (-1)
+--- a/intl/osdep.c
++++ /dev/null
+@@ -1,24 +0,0 @@
+-/* OS dependent parts of libintl.
+-   Copyright (C) 2001-2002 Free Software Foundation, Inc.
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
+-#if defined __EMX__
+-# include "os2compat.c"
+-#else
+-/* Avoid AIX compiler warning.  */
+-typedef int dummy;
+-#endif
+--- a/intl/plural-exp.c
++++ /dev/null
+@@ -1,154 +0,0 @@
+-/* Expression parsing for plural form selection.
+-   Copyright (C) 2000-2001, 2003 Free Software Foundation, Inc.
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
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-#include <ctype.h>
+-#include <stdlib.h>
+-#include <string.h>
+-
+-#include "plural-exp.h"
+-
+-#if (defined __GNUC__ && !defined __APPLE_CC__) \
+-    || (defined __STDC_VERSION__ && __STDC_VERSION__ >= 199901L)
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
+-struct expression GERMANIC_PLURAL =
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
+-struct expression GERMANIC_PLURAL;
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
+-      GERMANIC_PLURAL.nargs = 2;
+-      GERMANIC_PLURAL.operation = not_equal;
+-      GERMANIC_PLURAL.val.args[0] = &plvar;
+-      GERMANIC_PLURAL.val.args[1] = &plone;
+-    }
+-}
+-
+-# define INIT_GERMANIC_PLURAL() init_germanic_plural ()
+-
+-#endif
+-
+-void
+-internal_function
+-EXTRACT_PLURAL_EXPRESSION (const char *nullentry, struct expression **pluralp,
+-			   unsigned long int *npluralsp)
+-{
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
+-	  char *endp;
+-	  unsigned long int n;
+-	  struct parse_args args;
+-
+-	  /* First get the number.  */
+-	  nplurals += 9;
+-	  while (*nplurals != '\0' && isspace ((unsigned char) *nplurals))
+-	    ++nplurals;
+-	  if (!(*nplurals >= '0' && *nplurals <= '9'))
+-	    goto no_plural;
+-#if defined HAVE_STRTOUL || defined _LIBC
+-	  n = strtoul (nplurals, &endp, 10);
+-#else
+-	  for (endp = nplurals, n = 0; *endp >= '0' && *endp <= '9'; endp++)
+-	    n = n * 10 + (*endp - '0');
+-#endif
+-	  if (nplurals == endp)
+-	    goto no_plural;
+-	  *npluralsp = n;
+-
+-	  /* Due to the restrictions bison imposes onto the interface of the
+-	     scanner function we have to put the input string and the result
+-	     passed up from the parser into the same structure which address
+-	     is passed down to the parser.  */
+-	  plural += 7;
+-	  args.cp = plural;
+-	  if (PLURAL_PARSE (&args) != 0)
+-	    goto no_plural;
+-	  *pluralp = args.res;
+-	}
+-    }
+-  else
+-    {
+-      /* By default we are using the Germanic form: singular form only
+-         for `one', the plural form otherwise.  Yes, this is also what
+-         English is using since English is a Germanic language.  */
+-    no_plural:
+-      INIT_GERMANIC_PLURAL ();
+-      *pluralp = &GERMANIC_PLURAL;
+-      *npluralsp = 2;
+-    }
+-}
+--- a/intl/plural-exp.h
++++ /dev/null
+@@ -1,118 +0,0 @@
+-/* Expression parsing and evaluation for plural form selection.
+-   Copyright (C) 2000-2003 Free Software Foundation, Inc.
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
+-#ifndef _PLURAL_EXP_H
+-#define _PLURAL_EXP_H
+-
+-#ifndef internal_function
+-# define internal_function
+-#endif
+-
+-#ifndef attribute_hidden
+-# define attribute_hidden
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
+-    module,			/* Modulo operation.  */
+-    plus,			/* Addition.  */
+-    minus,			/* Subtraction.  */
+-    less_than,			/* Comparison.  */
+-    greater_than,		/* Comparison.  */
+-    less_or_equal,		/* Comparison.  */
+-    greater_or_equal,		/* Comparison.  */
+-    equal,			/* Comparison for equality.  */
+-    not_equal,			/* Comparison for inequality.  */
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
+-/* Names for the libintl functions are a problem.  This source code is used
+-   1. in the GNU C Library library,
+-   2. in the GNU libintl library,
+-   3. in the GNU gettext tools.
+-   The function names in each situation must be different, to allow for
+-   binary incompatible changes in 'struct expression'.  Furthermore,
+-   1. in the GNU C Library library, the names have a __ prefix,
+-   2.+3. in the GNU libintl library and in the GNU gettext tools, the names
+-         must follow ANSI C and not start with __.
+-   So we have to distinguish the three cases.  */
+-#ifdef _LIBC
+-# define FREE_EXPRESSION __gettext_free_exp
+-# define PLURAL_PARSE __gettextparse
+-# define GERMANIC_PLURAL __gettext_germanic_plural
+-# define EXTRACT_PLURAL_EXPRESSION __gettext_extract_plural
+-#elif defined (IN_LIBINTL)
+-# define FREE_EXPRESSION libintl_gettext_free_exp
+-# define PLURAL_PARSE libintl_gettextparse
+-# define GERMANIC_PLURAL libintl_gettext_germanic_plural
+-# define EXTRACT_PLURAL_EXPRESSION libintl_gettext_extract_plural
+-#else
+-# define FREE_EXPRESSION free_plural_expression
+-# define PLURAL_PARSE parse_plural_expression
+-# define GERMANIC_PLURAL germanic_plural
+-# define EXTRACT_PLURAL_EXPRESSION extract_plural_expression
+-#endif
+-
+-extern void FREE_EXPRESSION (struct expression *exp)
+-     internal_function;
+-extern int PLURAL_PARSE (void *arg);
+-extern struct expression GERMANIC_PLURAL attribute_hidden;
+-extern void EXTRACT_PLURAL_EXPRESSION (const char *nullentry,
+-				       struct expression **pluralp,
+-				       unsigned long int *npluralsp)
+-     internal_function;
+-
+-#if !defined (_LIBC) && !defined (IN_LIBINTL)
+-extern unsigned long int plural_eval (struct expression *pexp,
+-				      unsigned long int n);
+-#endif
+-
+-#endif /* _PLURAL_EXP_H */
+--- a/intl/plural.c
++++ /dev/null
+@@ -1,1490 +0,0 @@
+-/* A Bison parser, made from plural.y
+-   by GNU bison 1.35.  */
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
+-# define	EQUOP2	257
+-# define	CMPOP2	258
+-# define	ADDOP2	259
+-# define	MULOP2	260
+-# define	NUMBER	261
+-
+-#line 1 "plural.y"
+-
+-/* Expression parsing for plural form selection.
+-   Copyright (C) 2000-2001, 2003 Free Software Foundation, Inc.
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
+-#include <stddef.h>
+-#include <stdlib.h>
+-#include "plural-exp.h"
+-
+-/* The main function generated by the parser is called __gettextparse,
+-   but we want it to be called PLURAL_PARSE.  */
+-#ifndef _LIBC
+-# define __gettextparse PLURAL_PARSE
+-#endif
+-
+-#define YYLEX_PARAM	&((struct parse_args *) arg)->cp
+-#define YYPARSE_PARAM	arg
+-
+-#line 49 "plural.y"
+-#ifndef YYSTYPE
+-typedef union {
+-  unsigned long int num;
+-  enum operator op;
+-  struct expression *exp;
+-} yystype;
+-# define YYSTYPE yystype
+-# define YYSTYPE_IS_TRIVIAL 1
+-#endif
+-#line 55 "plural.y"
+-
+-/* Prototypes for local functions.  */
+-static int yylex (YYSTYPE *lval, const char **pexp);
+-static void yyerror (const char *str);
+-
+-/* Allocation of expressions.  */
+-
+-static struct expression *
+-new_exp (int nargs, enum operator op, struct expression * const *args)
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
+-new_exp_0 (enum operator op)
+-{
+-  return new_exp (0, op, NULL);
+-}
+-
+-static inline struct expression *
+-new_exp_1 (enum operator op, struct expression *right)
+-{
+-  struct expression *args[1];
+-
+-  args[0] = right;
+-  return new_exp (1, op, args);
+-}
+-
+-static struct expression *
+-new_exp_2 (enum operator op, struct expression *left, struct expression *right)
+-{
+-  struct expression *args[2];
+-
+-  args[0] = left;
+-  args[1] = right;
+-  return new_exp (2, op, args);
+-}
+-
+-static inline struct expression *
+-new_exp_3 (enum operator op, struct expression *bexp,
+-	   struct expression *tbranch, struct expression *fbranch)
+-{
+-  struct expression *args[3];
+-
+-  args[0] = bexp;
+-  args[1] = tbranch;
+-  args[2] = fbranch;
+-  return new_exp (3, op, args);
+-}
+-
+-#ifndef YYDEBUG
+-# define YYDEBUG 0
+-#endif
+-
+-
+-
+-#define	YYFINAL		27
+-#define	YYFLAG		-32768
+-#define	YYNTBASE	16
+-
+-/* YYTRANSLATE(YYLEX) -- Bison token number corresponding to YYLEX. */
+-#define YYTRANSLATE(x) ((unsigned)(x) <= 261 ? yytranslate[x] : 18)
+-
+-/* YYTRANSLATE[YYLEX] -- Bison token number corresponding to YYLEX. */
+-static const char yytranslate[] =
+-{
+-       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-       2,     2,     2,    10,     2,     2,     2,     2,     5,     2,
+-      14,    15,     2,     2,     2,     2,     2,     2,     2,     2,
+-       2,     2,     2,     2,     2,     2,     2,     2,    12,     2,
+-       2,     2,     2,     3,     2,     2,     2,     2,     2,     2,
+-       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-      13,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-       2,     2,     2,     2,     4,     2,     2,     2,     2,     2,
+-       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
+-       2,     2,     2,     2,     2,     2,     1,     6,     7,     8,
+-       9,    11
+-};
+-
+-#if YYDEBUG
+-static const short yyprhs[] =
+-{
+-       0,     0,     2,     8,    12,    16,    20,    24,    28,    32,
+-      35,    37,    39
+-};
+-static const short yyrhs[] =
+-{
+-      17,     0,    17,     3,    17,    12,    17,     0,    17,     4,
+-      17,     0,    17,     5,    17,     0,    17,     6,    17,     0,
+-      17,     7,    17,     0,    17,     8,    17,     0,    17,     9,
+-      17,     0,    10,    17,     0,    13,     0,    11,     0,    14,
+-      17,    15,     0
+-};
+-
+-#endif
+-
+-#if YYDEBUG
+-/* YYRLINE[YYN] -- source line where rule number YYN was defined. */
+-static const short yyrline[] =
+-{
+-       0,   150,   158,   162,   166,   170,   174,   178,   182,   186,
+-     190,   194,   199
+-};
+-#endif
+-
+-
+-#if (YYDEBUG) || defined YYERROR_VERBOSE
+-
+-/* YYTNAME[TOKEN_NUM] -- String name of the token TOKEN_NUM. */
+-static const char *const yytname[] =
+-{
+-  "$", "error", "$undefined.", "'?'", "'|'", "'&'", "EQUOP2", "CMPOP2", 
+-  "ADDOP2", "MULOP2", "'!'", "NUMBER", "':'", "'n'", "'('", "')'", 
+-  "start", "exp", 0
+-};
+-#endif
+-
+-/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives. */
+-static const short yyr1[] =
+-{
+-       0,    16,    17,    17,    17,    17,    17,    17,    17,    17,
+-      17,    17,    17
+-};
+-
+-/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN. */
+-static const short yyr2[] =
+-{
+-       0,     1,     5,     3,     3,     3,     3,     3,     3,     2,
+-       1,     1,     3
+-};
+-
+-/* YYDEFACT[S] -- default rule to reduce with in state S when YYTABLE
+-   doesn't specify something else to do.  Zero means the default is an
+-   error. */
+-static const short yydefact[] =
+-{
+-       0,     0,    11,    10,     0,     1,     9,     0,     0,     0,
+-       0,     0,     0,     0,     0,    12,     0,     3,     4,     5,
+-       6,     7,     8,     0,     2,     0,     0,     0
+-};
+-
+-static const short yydefgoto[] =
+-{
+-      25,     5
+-};
+-
+-static const short yypact[] =
+-{
+-      -9,    -9,-32768,-32768,    -9,    34,-32768,    11,    -9,    -9,
+-      -9,    -9,    -9,    -9,    -9,-32768,    24,    39,    43,    16,
+-      26,    -3,-32768,    -9,    34,    21,    53,-32768
+-};
+-
+-static const short yypgoto[] =
+-{
+-  -32768,    -1
+-};
+-
+-
+-#define	YYLAST		53
+-
+-
+-static const short yytable[] =
+-{
+-       6,     1,     2,     7,     3,     4,    14,    16,    17,    18,
+-      19,    20,    21,    22,     8,     9,    10,    11,    12,    13,
+-      14,    26,    24,    12,    13,    14,    15,     8,     9,    10,
+-      11,    12,    13,    14,    13,    14,    23,     8,     9,    10,
+-      11,    12,    13,    14,    10,    11,    12,    13,    14,    11,
+-      12,    13,    14,    27
+-};
+-
+-static const short yycheck[] =
+-{
+-       1,    10,    11,     4,    13,    14,     9,     8,     9,    10,
+-      11,    12,    13,    14,     3,     4,     5,     6,     7,     8,
+-       9,     0,    23,     7,     8,     9,    15,     3,     4,     5,
+-       6,     7,     8,     9,     8,     9,    12,     3,     4,     5,
+-       6,     7,     8,     9,     5,     6,     7,     8,     9,     6,
+-       7,     8,     9,     0
+-};
+-#define YYPURE 1
+-
+-/* -*-C-*-  Note some compilers choke on comments on `#line' lines.  */
+-#line 3 "/usr/local/share/bison/bison.simple"
+-
+-/* Skeleton output parser for bison,
+-
+-   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002 Free Software
+-   Foundation, Inc.
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
+-/* This is the parser code that is written into each bison parser when
+-   the %semantic_parser declaration is not specified in the grammar.
+-   It was written by Richard Stallman by simplifying the hairy parser
+-   used when %semantic_parser is specified.  */
+-
+-/* All symbols defined below should begin with yy or YY, to avoid
+-   infringing on user name space.  This should be done even for local
+-   variables, as they might otherwise be expanded by user macros.
+-   There are some unavoidable exceptions within include files to
+-   define necessary library symbols; they are noted "INFRINGES ON
+-   USER NAME SPACE" below.  */
+-
+-#if ! defined (yyoverflow) || defined (YYERROR_VERBOSE)
+-
+-/* The parser invokes alloca or malloc; define the necessary symbols.  */
+-
+-# if YYSTACK_USE_ALLOCA
+-#  define YYSTACK_ALLOC alloca
+-# else
+-#  ifndef YYSTACK_USE_ALLOCA
+-#   if defined (alloca) || defined (_ALLOCA_H)
+-#    define YYSTACK_ALLOC alloca
+-#   else
+-#    ifdef __GNUC__
+-#     define YYSTACK_ALLOC __builtin_alloca
+-#    endif
+-#   endif
+-#  endif
+-# endif
+-
+-# ifdef YYSTACK_ALLOC
+-   /* Pacify GCC's `empty if-body' warning. */
+-#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
+-# else
+-#  if defined (__STDC__) || defined (__cplusplus)
+-#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
+-#   define YYSIZE_T size_t
+-#  endif
+-#  define YYSTACK_ALLOC malloc
+-#  define YYSTACK_FREE free
+-# endif
+-#endif /* ! defined (yyoverflow) || defined (YYERROR_VERBOSE) */
+-
+-
+-#if (! defined (yyoverflow) \
+-     && (! defined (__cplusplus) \
+-	 || (YYLTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))
+-
+-/* A type that is properly aligned for any stack member.  */
+-union yyalloc
+-{
+-  short yyss;
+-  YYSTYPE yyvs;
+-# if YYLSP_NEEDED
+-  YYLTYPE yyls;
+-# endif
+-};
+-
+-/* The size of the maximum gap between one aligned stack and the next.  */
+-# define YYSTACK_GAP_MAX (sizeof (union yyalloc) - 1)
+-
+-/* The size of an array large to enough to hold all stacks, each with
+-   N elements.  */
+-# if YYLSP_NEEDED
+-#  define YYSTACK_BYTES(N) \
+-     ((N) * (sizeof (short) + sizeof (YYSTYPE) + sizeof (YYLTYPE))	\
+-      + 2 * YYSTACK_GAP_MAX)
+-# else
+-#  define YYSTACK_BYTES(N) \
+-     ((N) * (sizeof (short) + sizeof (YYSTYPE))				\
+-      + YYSTACK_GAP_MAX)
+-# endif
+-
+-/* Copy COUNT objects from FROM to TO.  The source and destination do
+-   not overlap.  */
+-# ifndef YYCOPY
+-#  if 1 < __GNUC__
+-#   define YYCOPY(To, From, Count) \
+-      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
+-#  else
+-#   define YYCOPY(To, From, Count)		\
+-      do					\
+-	{					\
+-	  register YYSIZE_T yyi;		\
+-	  for (yyi = 0; yyi < (Count); yyi++)	\
+-	    (To)[yyi] = (From)[yyi];		\
+-	}					\
+-      while (0)
+-#  endif
+-# endif
+-
+-/* Relocate STACK from its old location to the new one.  The
+-   local variables YYSIZE and YYSTACKSIZE give the old and new number of
+-   elements in the stack, and YYPTR gives the new location of the
+-   stack.  Advance YYPTR to a properly aligned location for the next
+-   stack.  */
+-# define YYSTACK_RELOCATE(Stack)					\
+-    do									\
+-      {									\
+-	YYSIZE_T yynewbytes;						\
+-	YYCOPY (&yyptr->Stack, Stack, yysize);				\
+-	Stack = &yyptr->Stack;						\
+-	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAX;	\
+-	yyptr += yynewbytes / sizeof (*yyptr);				\
+-      }									\
+-    while (0)
+-
+-#endif
+-
+-
+-#if ! defined (YYSIZE_T) && defined (__SIZE_TYPE__)
+-# define YYSIZE_T __SIZE_TYPE__
+-#endif
+-#if ! defined (YYSIZE_T) && defined (size_t)
+-# define YYSIZE_T size_t
+-#endif
+-#if ! defined (YYSIZE_T)
+-# if defined (__STDC__) || defined (__cplusplus)
+-#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
+-#  define YYSIZE_T size_t
+-# endif
+-#endif
+-#if ! defined (YYSIZE_T)
+-# define YYSIZE_T unsigned int
+-#endif
+-
+-#define yyerrok		(yyerrstatus = 0)
+-#define yyclearin	(yychar = YYEMPTY)
+-#define YYEMPTY		-2
+-#define YYEOF		0
+-#define YYACCEPT	goto yyacceptlab
+-#define YYABORT 	goto yyabortlab
+-#define YYERROR		goto yyerrlab1
+-/* Like YYERROR except do call yyerror.  This remains here temporarily
+-   to ease the transition to the new meaning of YYERROR, for GCC.
+-   Once GCC version 2 has supplanted version 1, this can go.  */
+-#define YYFAIL		goto yyerrlab
+-#define YYRECOVERING()  (!!yyerrstatus)
+-#define YYBACKUP(Token, Value)					\
+-do								\
+-  if (yychar == YYEMPTY && yylen == 1)				\
+-    {								\
+-      yychar = (Token);						\
+-      yylval = (Value);						\
+-      yychar1 = YYTRANSLATE (yychar);				\
+-      YYPOPSTACK;						\
+-      goto yybackup;						\
+-    }								\
+-  else								\
+-    { 								\
+-      yyerror ("syntax error: cannot back up");			\
+-      YYERROR;							\
+-    }								\
+-while (0)
+-
+-#define YYTERROR	1
+-#define YYERRCODE	256
+-
+-
+-/* YYLLOC_DEFAULT -- Compute the default location (before the actions
+-   are run).
+-
+-   When YYLLOC_DEFAULT is run, CURRENT is set the location of the
+-   first token.  By default, to implement support for ranges, extend
+-   its range to the last symbol.  */
+-
+-#ifndef YYLLOC_DEFAULT
+-# define YYLLOC_DEFAULT(Current, Rhs, N)       	\
+-   Current.last_line   = Rhs[N].last_line;	\
+-   Current.last_column = Rhs[N].last_column;
+-#endif
+-
+-
+-/* YYLEX -- calling `yylex' with the right arguments.  */
+-
+-#if YYPURE
+-# if YYLSP_NEEDED
+-#  ifdef YYLEX_PARAM
+-#   define YYLEX		yylex (&yylval, &yylloc, YYLEX_PARAM)
+-#  else
+-#   define YYLEX		yylex (&yylval, &yylloc)
+-#  endif
+-# else /* !YYLSP_NEEDED */
+-#  ifdef YYLEX_PARAM
+-#   define YYLEX		yylex (&yylval, YYLEX_PARAM)
+-#  else
+-#   define YYLEX		yylex (&yylval)
+-#  endif
+-# endif /* !YYLSP_NEEDED */
+-#else /* !YYPURE */
+-# define YYLEX			yylex ()
+-#endif /* !YYPURE */
+-
+-
+-/* Enable debugging if requested.  */
+-#if YYDEBUG
+-
+-# ifndef YYFPRINTF
+-#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
+-#  define YYFPRINTF fprintf
+-# endif
+-
+-# define YYDPRINTF(Args)			\
+-do {						\
+-  if (yydebug)					\
+-    YYFPRINTF Args;				\
+-} while (0)
+-/* Nonzero means print parse trace.  It is left uninitialized so that
+-   multiple parsers can coexist.  */
+-int yydebug;
+-#else /* !YYDEBUG */
+-# define YYDPRINTF(Args)
+-#endif /* !YYDEBUG */
+-
+-/* YYINITDEPTH -- initial size of the parser's stacks.  */
+-#ifndef	YYINITDEPTH
+-# define YYINITDEPTH 200
+-#endif
+-
+-/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
+-   if the built-in stack extension method is used).
+-
+-   Do not make this value too large; the results are undefined if
+-   SIZE_MAX < YYSTACK_BYTES (YYMAXDEPTH)
+-   evaluated with infinite-precision integer arithmetic.  */
+-
+-#if YYMAXDEPTH == 0
+-# undef YYMAXDEPTH
+-#endif
+-
+-#ifndef YYMAXDEPTH
+-# define YYMAXDEPTH 10000
+-#endif
+-
+-#ifdef YYERROR_VERBOSE
+-
+-# ifndef yystrlen
+-#  if defined (__GLIBC__) && defined (_STRING_H)
+-#   define yystrlen strlen
+-#  else
+-/* Return the length of YYSTR.  */
+-static YYSIZE_T
+-#   if defined (__STDC__) || defined (__cplusplus)
+-yystrlen (const char *yystr)
+-#   else
+-yystrlen (yystr)
+-     const char *yystr;
+-#   endif
+-{
+-  register const char *yys = yystr;
+-
+-  while (*yys++ != '\0')
+-    continue;
+-
+-  return yys - yystr - 1;
+-}
+-#  endif
+-# endif
+-
+-# ifndef yystpcpy
+-#  if defined (__GLIBC__) && defined (_STRING_H) && defined (_GNU_SOURCE)
+-#   define yystpcpy stpcpy
+-#  else
+-/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
+-   YYDEST.  */
+-static char *
+-#   if defined (__STDC__) || defined (__cplusplus)
+-yystpcpy (char *yydest, const char *yysrc)
+-#   else
+-yystpcpy (yydest, yysrc)
+-     char *yydest;
+-     const char *yysrc;
+-#   endif
+-{
+-  register char *yyd = yydest;
+-  register const char *yys = yysrc;
+-
+-  while ((*yyd++ = *yys++) != '\0')
+-    continue;
+-
+-  return yyd - 1;
+-}
+-#  endif
+-# endif
+-#endif
+-
+-#line 315 "/usr/local/share/bison/bison.simple"
+-
+-
+-/* The user can define YYPARSE_PARAM as the name of an argument to be passed
+-   into yyparse.  The argument should have type void *.
+-   It should actually point to an object.
+-   Grammar actions can access the variable by casting it
+-   to the proper pointer type.  */
+-
+-#ifdef YYPARSE_PARAM
+-# if defined (__STDC__) || defined (__cplusplus)
+-#  define YYPARSE_PARAM_ARG void *YYPARSE_PARAM
+-#  define YYPARSE_PARAM_DECL
+-# else
+-#  define YYPARSE_PARAM_ARG YYPARSE_PARAM
+-#  define YYPARSE_PARAM_DECL void *YYPARSE_PARAM;
+-# endif
+-#else /* !YYPARSE_PARAM */
+-# define YYPARSE_PARAM_ARG
+-# define YYPARSE_PARAM_DECL
+-#endif /* !YYPARSE_PARAM */
+-
+-/* Prevent warning if -Wstrict-prototypes.  */
+-#ifdef __GNUC__
+-# ifdef YYPARSE_PARAM
+-int yyparse (void *);
+-# else
+-int yyparse (void);
+-# endif
+-#endif
+-
+-/* YY_DECL_VARIABLES -- depending whether we use a pure parser,
+-   variables are global, or local to YYPARSE.  */
+-
+-#define YY_DECL_NON_LSP_VARIABLES			\
+-/* The lookahead symbol.  */				\
+-int yychar;						\
+-							\
+-/* The semantic value of the lookahead symbol. */	\
+-YYSTYPE yylval;						\
+-							\
+-/* Number of parse errors so far.  */			\
+-int yynerrs;
+-
+-#if YYLSP_NEEDED
+-# define YY_DECL_VARIABLES			\
+-YY_DECL_NON_LSP_VARIABLES			\
+-						\
+-/* Location data for the lookahead symbol.  */	\
+-YYLTYPE yylloc;
+-#else
+-# define YY_DECL_VARIABLES			\
+-YY_DECL_NON_LSP_VARIABLES
+-#endif
+-
+-
+-/* If nonreentrant, generate the variables here. */
+-
+-#if !YYPURE
+-YY_DECL_VARIABLES
+-#endif  /* !YYPURE */
+-
+-int
+-yyparse (YYPARSE_PARAM_ARG)
+-     YYPARSE_PARAM_DECL
+-{
+-  /* If reentrant, generate the variables here. */
+-#if YYPURE
+-  YY_DECL_VARIABLES
+-#endif  /* !YYPURE */
+-
+-  register int yystate;
+-  register int yyn;
+-  int yyresult;
+-  /* Number of tokens to shift before error messages enabled.  */
+-  int yyerrstatus;
+-  /* Lookahead token as an internal (translated) token number.  */
+-  int yychar1 = 0;
+-
+-  /* Three stacks and their tools:
+-     `yyss': related to states,
+-     `yyvs': related to semantic values,
+-     `yyls': related to locations.
+-
+-     Refer to the stacks thru separate pointers, to allow yyoverflow
+-     to reallocate them elsewhere.  */
+-
+-  /* The state stack. */
+-  short	yyssa[YYINITDEPTH];
+-  short *yyss = yyssa;
+-  register short *yyssp;
+-
+-  /* The semantic value stack.  */
+-  YYSTYPE yyvsa[YYINITDEPTH];
+-  YYSTYPE *yyvs = yyvsa;
+-  register YYSTYPE *yyvsp;
+-
+-#if YYLSP_NEEDED
+-  /* The location stack.  */
+-  YYLTYPE yylsa[YYINITDEPTH];
+-  YYLTYPE *yyls = yylsa;
+-  YYLTYPE *yylsp;
+-#endif
+-
+-#if YYLSP_NEEDED
+-# define YYPOPSTACK   (yyvsp--, yyssp--, yylsp--)
+-#else
+-# define YYPOPSTACK   (yyvsp--, yyssp--)
+-#endif
+-
+-  YYSIZE_T yystacksize = YYINITDEPTH;
+-
+-
+-  /* The variables used to return semantic value and location from the
+-     action routines.  */
+-  YYSTYPE yyval;
+-#if YYLSP_NEEDED
+-  YYLTYPE yyloc;
+-#endif
+-
+-  /* When reducing, the number of symbols on the RHS of the reduced
+-     rule. */
+-  int yylen;
+-
+-  YYDPRINTF ((stderr, "Starting parse\n"));
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
+-  yyssp = yyss;
+-  yyvsp = yyvs;
+-#if YYLSP_NEEDED
+-  yylsp = yyls;
+-#endif
+-  goto yysetstate;
+-
+-/*------------------------------------------------------------.
+-| yynewstate -- Push a new state, which is found in yystate.  |
+-`------------------------------------------------------------*/
+- yynewstate:
+-  /* In all cases, when you get here, the value and location stacks
+-     have just been pushed. so pushing a state here evens the stacks.
+-     */
+-  yyssp++;
+-
+- yysetstate:
+-  *yyssp = yystate;
+-
+-  if (yyssp >= yyss + yystacksize - 1)
+-    {
+-      /* Get the current used size of the three stacks, in elements.  */
+-      YYSIZE_T yysize = yyssp - yyss + 1;
+-
+-#ifdef yyoverflow
+-      {
+-	/* Give user a chance to reallocate the stack. Use copies of
+-	   these so that the &'s don't force the real ones into
+-	   memory.  */
+-	YYSTYPE *yyvs1 = yyvs;
+-	short *yyss1 = yyss;
+-
+-	/* Each stack pointer address is followed by the size of the
+-	   data in use in that stack, in bytes.  */
+-# if YYLSP_NEEDED
+-	YYLTYPE *yyls1 = yyls;
+-	/* This used to be a conditional around just the two extra args,
+-	   but that might be undefined if yyoverflow is a macro.  */
+-	yyoverflow ("parser stack overflow",
+-		    &yyss1, yysize * sizeof (*yyssp),
+-		    &yyvs1, yysize * sizeof (*yyvsp),
+-		    &yyls1, yysize * sizeof (*yylsp),
+-		    &yystacksize);
+-	yyls = yyls1;
+-# else
+-	yyoverflow ("parser stack overflow",
+-		    &yyss1, yysize * sizeof (*yyssp),
+-		    &yyvs1, yysize * sizeof (*yyvsp),
+-		    &yystacksize);
+-# endif
+-	yyss = yyss1;
+-	yyvs = yyvs1;
+-      }
+-#else /* no yyoverflow */
+-# ifndef YYSTACK_RELOCATE
+-      goto yyoverflowlab;
+-# else
+-      /* Extend the stack our own way.  */
+-      if (yystacksize >= YYMAXDEPTH)
+-	goto yyoverflowlab;
+-      yystacksize *= 2;
+-      if (yystacksize > YYMAXDEPTH)
+-	yystacksize = YYMAXDEPTH;
+-
+-      {
+-	short *yyss1 = yyss;
+-	union yyalloc *yyptr =
+-	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
+-	if (! yyptr)
+-	  goto yyoverflowlab;
+-	YYSTACK_RELOCATE (yyss);
+-	YYSTACK_RELOCATE (yyvs);
+-# if YYLSP_NEEDED
+-	YYSTACK_RELOCATE (yyls);
+-# endif
+-# undef YYSTACK_RELOCATE
+-	if (yyss1 != yyssa)
+-	  YYSTACK_FREE (yyss1);
+-      }
+-# endif
+-#endif /* no yyoverflow */
+-
+-      yyssp = yyss + yysize - 1;
+-      yyvsp = yyvs + yysize - 1;
+-#if YYLSP_NEEDED
+-      yylsp = yyls + yysize - 1;
+-#endif
+-
+-      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
+-		  (unsigned long int) yystacksize));
+-
+-      if (yyssp >= yyss + yystacksize - 1)
+-	YYABORT;
+-    }
+-
+-  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
+-
+-  goto yybackup;
+-
+-
+-/*-----------.
+-| yybackup.  |
+-`-----------*/
+-yybackup:
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
+-      YYDPRINTF ((stderr, "Reading a token: "));
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
+-      YYDPRINTF ((stderr, "Now at end of input.\n"));
+-    }
+-  else
+-    {
+-      yychar1 = YYTRANSLATE (yychar);
+-
+-#if YYDEBUG
+-     /* We have to keep this `#if YYDEBUG', since we use variables
+-	which are defined only if `YYDEBUG' is set.  */
+-      if (yydebug)
+-	{
+-	  YYFPRINTF (stderr, "Next token is %d (%s",
+-		     yychar, yytname[yychar1]);
+-	  /* Give the individual parser a way to print the precise
+-	     meaning of a token, for further debugging info.  */
+-# ifdef YYPRINT
+-	  YYPRINT (stderr, yychar, yylval);
+-# endif
+-	  YYFPRINTF (stderr, ")\n");
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
+-  YYDPRINTF ((stderr, "Shifting token %d (%s), ",
+-	      yychar, yytname[yychar1]));
+-
+-  /* Discard the token being shifted unless it is eof.  */
+-  if (yychar != YYEOF)
+-    yychar = YYEMPTY;
+-
+-  *++yyvsp = yylval;
+-#if YYLSP_NEEDED
+-  *++yylsp = yylloc;
+-#endif
+-
+-  /* Count tokens shifted since error; after three, turn off error
+-     status.  */
+-  if (yyerrstatus)
+-    yyerrstatus--;
+-
+-  yystate = yyn;
+-  goto yynewstate;
+-
+-
+-/*-----------------------------------------------------------.
+-| yydefault -- do the default action for the current state.  |
+-`-----------------------------------------------------------*/
+-yydefault:
+-  yyn = yydefact[yystate];
+-  if (yyn == 0)
+-    goto yyerrlab;
+-  goto yyreduce;
+-
+-
+-/*-----------------------------.
+-| yyreduce -- Do a reduction.  |
+-`-----------------------------*/
+-yyreduce:
+-  /* yyn is the number of a rule to reduce with.  */
+-  yylen = yyr2[yyn];
+-
+-  /* If YYLEN is nonzero, implement the default value of the action:
+-     `$$ = $1'.
+-
+-     Otherwise, the following line sets YYVAL to the semantic value of
+-     the lookahead token.  This behavior is undocumented and Bison
+-     users should not rely upon it.  Assigning to YYVAL
+-     unconditionally makes the parser a bit smaller, and it avoids a
+-     GCC warning that YYVAL may be used uninitialized.  */
+-  yyval = yyvsp[1-yylen];
+-
+-#if YYLSP_NEEDED
+-  /* Similarly for the default location.  Let the user run additional
+-     commands if for instance locations are ranges.  */
+-  yyloc = yylsp[1-yylen];
+-  YYLLOC_DEFAULT (yyloc, (yylsp - yylen), yylen);
+-#endif
+-
+-#if YYDEBUG
+-  /* We have to keep this `#if YYDEBUG', since we use variables which
+-     are defined only if `YYDEBUG' is set.  */
+-  if (yydebug)
+-    {
+-      int yyi;
+-
+-      YYFPRINTF (stderr, "Reducing via rule %d (line %d), ",
+-		 yyn, yyrline[yyn]);
+-
+-      /* Print the symbols being reduced, and their result.  */
+-      for (yyi = yyprhs[yyn]; yyrhs[yyi] > 0; yyi++)
+-	YYFPRINTF (stderr, "%s ", yytname[yyrhs[yyi]]);
+-      YYFPRINTF (stderr, " -> %s\n", yytname[yyr1[yyn]]);
+-    }
+-#endif
+-
+-  switch (yyn) {
+-
+-case 1:
+-#line 151 "plural.y"
+-{
+-	    if (yyvsp[0].exp == NULL)
+-	      YYABORT;
+-	    ((struct parse_args *) arg)->res = yyvsp[0].exp;
+-	  }
+-    break;
+-case 2:
+-#line 159 "plural.y"
+-{
+-	    yyval.exp = new_exp_3 (qmop, yyvsp[-4].exp, yyvsp[-2].exp, yyvsp[0].exp);
+-	  }
+-    break;
+-case 3:
+-#line 163 "plural.y"
+-{
+-	    yyval.exp = new_exp_2 (lor, yyvsp[-2].exp, yyvsp[0].exp);
+-	  }
+-    break;
+-case 4:
+-#line 167 "plural.y"
+-{
+-	    yyval.exp = new_exp_2 (land, yyvsp[-2].exp, yyvsp[0].exp);
+-	  }
+-    break;
+-case 5:
+-#line 171 "plural.y"
+-{
+-	    yyval.exp = new_exp_2 (yyvsp[-1].op, yyvsp[-2].exp, yyvsp[0].exp);
+-	  }
+-    break;
+-case 6:
+-#line 175 "plural.y"
+-{
+-	    yyval.exp = new_exp_2 (yyvsp[-1].op, yyvsp[-2].exp, yyvsp[0].exp);
+-	  }
+-    break;
+-case 7:
+-#line 179 "plural.y"
+-{
+-	    yyval.exp = new_exp_2 (yyvsp[-1].op, yyvsp[-2].exp, yyvsp[0].exp);
+-	  }
+-    break;
+-case 8:
+-#line 183 "plural.y"
+-{
+-	    yyval.exp = new_exp_2 (yyvsp[-1].op, yyvsp[-2].exp, yyvsp[0].exp);
+-	  }
+-    break;
+-case 9:
+-#line 187 "plural.y"
+-{
+-	    yyval.exp = new_exp_1 (lnot, yyvsp[0].exp);
+-	  }
+-    break;
+-case 10:
+-#line 191 "plural.y"
+-{
+-	    yyval.exp = new_exp_0 (var);
+-	  }
+-    break;
+-case 11:
+-#line 195 "plural.y"
+-{
+-	    if ((yyval.exp = new_exp_0 (num)) != NULL)
+-	      yyval.exp->val.num = yyvsp[0].num;
+-	  }
+-    break;
+-case 12:
+-#line 200 "plural.y"
+-{
+-	    yyval.exp = yyvsp[-1].exp;
+-	  }
+-    break;
+-}
+-
+-#line 705 "/usr/local/share/bison/bison.simple"
+-
+-
+-  yyvsp -= yylen;
+-  yyssp -= yylen;
+-#if YYLSP_NEEDED
+-  yylsp -= yylen;
+-#endif
+-
+-#if YYDEBUG
+-  if (yydebug)
+-    {
+-      short *yyssp1 = yyss - 1;
+-      YYFPRINTF (stderr, "state stack now");
+-      while (yyssp1 != yyssp)
+-	YYFPRINTF (stderr, " %d", *++yyssp1);
+-      YYFPRINTF (stderr, "\n");
+-    }
+-#endif
+-
+-  *++yyvsp = yyval;
+-#if YYLSP_NEEDED
+-  *++yylsp = yyloc;
+-#endif
+-
+-  /* Now `shift' the result of the reduction.  Determine what state
+-     that goes to, based on the state we popped back to and the rule
+-     number reduced by.  */
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
+-
+-/*------------------------------------.
+-| yyerrlab -- here on detecting error |
+-`------------------------------------*/
+-yyerrlab:
+-  /* If not already recovering from an error, report this error.  */
+-  if (!yyerrstatus)
+-    {
+-      ++yynerrs;
+-
+-#ifdef YYERROR_VERBOSE
+-      yyn = yypact[yystate];
+-
+-      if (yyn > YYFLAG && yyn < YYLAST)
+-	{
+-	  YYSIZE_T yysize = 0;
+-	  char *yymsg;
+-	  int yyx, yycount;
+-
+-	  yycount = 0;
+-	  /* Start YYX at -YYN if negative to avoid negative indexes in
+-	     YYCHECK.  */
+-	  for (yyx = yyn < 0 ? -yyn : 0;
+-	       yyx < (int) (sizeof (yytname) / sizeof (char *)); yyx++)
+-	    if (yycheck[yyx + yyn] == yyx)
+-	      yysize += yystrlen (yytname[yyx]) + 15, yycount++;
+-	  yysize += yystrlen ("parse error, unexpected ") + 1;
+-	  yysize += yystrlen (yytname[YYTRANSLATE (yychar)]);
+-	  yymsg = (char *) YYSTACK_ALLOC (yysize);
+-	  if (yymsg != 0)
+-	    {
+-	      char *yyp = yystpcpy (yymsg, "parse error, unexpected ");
+-	      yyp = yystpcpy (yyp, yytname[YYTRANSLATE (yychar)]);
+-
+-	      if (yycount < 5)
+-		{
+-		  yycount = 0;
+-		  for (yyx = yyn < 0 ? -yyn : 0;
+-		       yyx < (int) (sizeof (yytname) / sizeof (char *));
+-		       yyx++)
+-		    if (yycheck[yyx + yyn] == yyx)
+-		      {
+-			const char *yyq = ! yycount ? ", expecting " : " or ";
+-			yyp = yystpcpy (yyp, yyq);
+-			yyp = yystpcpy (yyp, yytname[yyx]);
+-			yycount++;
+-		      }
+-		}
+-	      yyerror (yymsg);
+-	      YYSTACK_FREE (yymsg);
+-	    }
+-	  else
+-	    yyerror ("parse error; also virtual memory exhausted");
+-	}
+-      else
+-#endif /* defined (YYERROR_VERBOSE) */
+-	yyerror ("parse error");
+-    }
+-  goto yyerrlab1;
+-
+-
+-/*--------------------------------------------------.
+-| yyerrlab1 -- error raised explicitly by an action |
+-`--------------------------------------------------*/
+-yyerrlab1:
+-  if (yyerrstatus == 3)
+-    {
+-      /* If just tried and failed to reuse lookahead token after an
+-	 error, discard it.  */
+-
+-      /* return failure if at end of input */
+-      if (yychar == YYEOF)
+-	YYABORT;
+-      YYDPRINTF ((stderr, "Discarding token %d (%s).\n",
+-		  yychar, yytname[yychar1]));
+-      yychar = YYEMPTY;
+-    }
+-
+-  /* Else will try to reuse lookahead token after shifting the error
+-     token.  */
+-
+-  yyerrstatus = 3;		/* Each real token shifted decrements this */
+-
+-  goto yyerrhandle;
+-
+-
+-/*-------------------------------------------------------------------.
+-| yyerrdefault -- current state does not do anything special for the |
+-| error token.                                                       |
+-`-------------------------------------------------------------------*/
+-yyerrdefault:
+-#if 0
+-  /* This is wrong; only states that explicitly want error tokens
+-     should shift them.  */
+-
+-  /* If its default is to accept any token, ok.  Otherwise pop it.  */
+-  yyn = yydefact[yystate];
+-  if (yyn)
+-    goto yydefault;
+-#endif
+-
+-
+-/*---------------------------------------------------------------.
+-| yyerrpop -- pop the current state because it cannot handle the |
+-| error token                                                    |
+-`---------------------------------------------------------------*/
+-yyerrpop:
+-  if (yyssp == yyss)
+-    YYABORT;
+-  yyvsp--;
+-  yystate = *--yyssp;
+-#if YYLSP_NEEDED
+-  yylsp--;
+-#endif
+-
+-#if YYDEBUG
+-  if (yydebug)
+-    {
+-      short *yyssp1 = yyss - 1;
+-      YYFPRINTF (stderr, "Error: state stack now");
+-      while (yyssp1 != yyssp)
+-	YYFPRINTF (stderr, " %d", *++yyssp1);
+-      YYFPRINTF (stderr, "\n");
+-    }
+-#endif
+-
+-/*--------------.
+-| yyerrhandle.  |
+-`--------------*/
+-yyerrhandle:
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
+-  YYDPRINTF ((stderr, "Shifting error token, "));
+-
+-  *++yyvsp = yylval;
+-#if YYLSP_NEEDED
+-  *++yylsp = yylloc;
+-#endif
+-
+-  yystate = yyn;
+-  goto yynewstate;
+-
+-
+-/*-------------------------------------.
+-| yyacceptlab -- YYACCEPT comes here.  |
+-`-------------------------------------*/
+-yyacceptlab:
+-  yyresult = 0;
+-  goto yyreturn;
+-
+-/*-----------------------------------.
+-| yyabortlab -- YYABORT comes here.  |
+-`-----------------------------------*/
+-yyabortlab:
+-  yyresult = 1;
+-  goto yyreturn;
+-
+-/*---------------------------------------------.
+-| yyoverflowab -- parser overflow comes here.  |
+-`---------------------------------------------*/
+-yyoverflowlab:
+-  yyerror ("parser stack overflow");
+-  yyresult = 2;
+-  /* Fall through.  */
+-
+-yyreturn:
+-#ifndef yyoverflow
+-  if (yyss != yyssa)
+-    YYSTACK_FREE (yyss);
+-#endif
+-  return yyresult;
+-}
+-#line 205 "plural.y"
+-
+-
+-void
+-internal_function
+-FREE_EXPRESSION (struct expression *exp)
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
+-yylex (YYSTYPE *lval, const char **pexp)
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
+-yyerror (const char *str)
+-{
+-  /* Do nothing.  We don't print error messages here.  */
+-}
+--- a/intl/plural.y
++++ /dev/null
+@@ -1,381 +0,0 @@
+-%{
+-/* Expression parsing for plural form selection.
+-   Copyright (C) 2000-2001, 2003 Free Software Foundation, Inc.
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
+-#include <stddef.h>
+-#include <stdlib.h>
+-#include "plural-exp.h"
+-
+-/* The main function generated by the parser is called __gettextparse,
+-   but we want it to be called PLURAL_PARSE.  */
+-#ifndef _LIBC
+-# define __gettextparse PLURAL_PARSE
+-#endif
+-
+-#define YYLEX_PARAM	&((struct parse_args *) arg)->cp
+-#define YYPARSE_PARAM	arg
+-%}
+-%pure_parser
+-%expect 7
+-
+-%union {
+-  unsigned long int num;
+-  enum operator op;
+-  struct expression *exp;
+-}
+-
+-%{
+-/* Prototypes for local functions.  */
+-static int yylex (YYSTYPE *lval, const char **pexp);
+-static void yyerror (const char *str);
+-
+-/* Allocation of expressions.  */
+-
+-static struct expression *
+-new_exp (int nargs, enum operator op, struct expression * const *args)
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
+-new_exp_0 (enum operator op)
+-{
+-  return new_exp (0, op, NULL);
+-}
+-
+-static inline struct expression *
+-new_exp_1 (enum operator op, struct expression *right)
+-{
+-  struct expression *args[1];
+-
+-  args[0] = right;
+-  return new_exp (1, op, args);
+-}
+-
+-static struct expression *
+-new_exp_2 (enum operator op, struct expression *left, struct expression *right)
+-{
+-  struct expression *args[2];
+-
+-  args[0] = left;
+-  args[1] = right;
+-  return new_exp (2, op, args);
+-}
+-
+-static inline struct expression *
+-new_exp_3 (enum operator op, struct expression *bexp,
+-	   struct expression *tbranch, struct expression *fbranch)
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
+-FREE_EXPRESSION (struct expression *exp)
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
+-yylex (YYSTYPE *lval, const char **pexp)
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
+-yyerror (const char *str)
+-{
+-  /* Do nothing.  We don't print error messages here.  */
+-}
+--- a/intl/printf-args.c
++++ /dev/null
+@@ -1,119 +0,0 @@
+-/* Decomposed printf argument list.
+-   Copyright (C) 1999, 2002-2003 Free Software Foundation, Inc.
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
+-/* Specification.  */
+-#include "printf-args.h"
+-
+-#ifdef STATIC
+-STATIC
+-#endif
+-int
+-printf_fetchargs (va_list args, arguments *a)
+-{
+-  size_t i;
+-  argument *ap;
+-
+-  for (i = 0, ap = &a->arg[0]; i < a->count; i++, ap++)
+-    switch (ap->type)
+-      {
+-      case TYPE_SCHAR:
+-	ap->a.a_schar = va_arg (args, /*signed char*/ int);
+-	break;
+-      case TYPE_UCHAR:
+-	ap->a.a_uchar = va_arg (args, /*unsigned char*/ int);
+-	break;
+-      case TYPE_SHORT:
+-	ap->a.a_short = va_arg (args, /*short*/ int);
+-	break;
+-      case TYPE_USHORT:
+-	ap->a.a_ushort = va_arg (args, /*unsigned short*/ int);
+-	break;
+-      case TYPE_INT:
+-	ap->a.a_int = va_arg (args, int);
+-	break;
+-      case TYPE_UINT:
+-	ap->a.a_uint = va_arg (args, unsigned int);
+-	break;
+-      case TYPE_LONGINT:
+-	ap->a.a_longint = va_arg (args, long int);
+-	break;
+-      case TYPE_ULONGINT:
+-	ap->a.a_ulongint = va_arg (args, unsigned long int);
+-	break;
+-#ifdef HAVE_LONG_LONG
+-      case TYPE_LONGLONGINT:
+-	ap->a.a_longlongint = va_arg (args, long long int);
+-	break;
+-      case TYPE_ULONGLONGINT:
+-	ap->a.a_ulonglongint = va_arg (args, unsigned long long int);
+-	break;
+-#endif
+-      case TYPE_DOUBLE:
+-	ap->a.a_double = va_arg (args, double);
+-	break;
+-#ifdef HAVE_LONG_DOUBLE
+-      case TYPE_LONGDOUBLE:
+-	ap->a.a_longdouble = va_arg (args, long double);
+-	break;
+-#endif
+-      case TYPE_CHAR:
+-	ap->a.a_char = va_arg (args, int);
+-	break;
+-#ifdef HAVE_WINT_T
+-      case TYPE_WIDE_CHAR:
+-	ap->a.a_wide_char = va_arg (args, wint_t);
+-	break;
+-#endif
+-      case TYPE_STRING:
+-	ap->a.a_string = va_arg (args, const char *);
+-	break;
+-#ifdef HAVE_WCHAR_T
+-      case TYPE_WIDE_STRING:
+-	ap->a.a_wide_string = va_arg (args, const wchar_t *);
+-	break;
+-#endif
+-      case TYPE_POINTER:
+-	ap->a.a_pointer = va_arg (args, void *);
+-	break;
+-      case TYPE_COUNT_SCHAR_POINTER:
+-	ap->a.a_count_schar_pointer = va_arg (args, signed char *);
+-	break;
+-      case TYPE_COUNT_SHORT_POINTER:
+-	ap->a.a_count_short_pointer = va_arg (args, short *);
+-	break;
+-      case TYPE_COUNT_INT_POINTER:
+-	ap->a.a_count_int_pointer = va_arg (args, int *);
+-	break;
+-      case TYPE_COUNT_LONGINT_POINTER:
+-	ap->a.a_count_longint_pointer = va_arg (args, long int *);
+-	break;
+-#ifdef HAVE_LONG_LONG
+-      case TYPE_COUNT_LONGLONGINT_POINTER:
+-	ap->a.a_count_longlongint_pointer = va_arg (args, long long int *);
+-	break;
+-#endif
+-      default:
+-	/* Unknown type.  */
+-	return -1;
+-      }
+-  return 0;
+-}
+--- a/intl/printf-args.h
++++ /dev/null
+@@ -1,137 +0,0 @@
+-/* Decomposed printf argument list.
+-   Copyright (C) 1999, 2002-2003 Free Software Foundation, Inc.
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
+-#ifndef _PRINTF_ARGS_H
+-#define _PRINTF_ARGS_H
+-
+-/* Get size_t.  */
+-#include <stddef.h>
+-
+-/* Get wchar_t.  */
+-#ifdef HAVE_WCHAR_T
+-# include <stddef.h>
+-#endif
+-
+-/* Get wint_t.  */
+-#ifdef HAVE_WINT_T
+-# include <wchar.h>
+-#endif
+-
+-/* Get va_list.  */
+-#include <stdarg.h>
+-
+-
+-/* Argument types */
+-typedef enum
+-{
+-  TYPE_NONE,
+-  TYPE_SCHAR,
+-  TYPE_UCHAR,
+-  TYPE_SHORT,
+-  TYPE_USHORT,
+-  TYPE_INT,
+-  TYPE_UINT,
+-  TYPE_LONGINT,
+-  TYPE_ULONGINT,
+-#ifdef HAVE_LONG_LONG
+-  TYPE_LONGLONGINT,
+-  TYPE_ULONGLONGINT,
+-#endif
+-  TYPE_DOUBLE,
+-#ifdef HAVE_LONG_DOUBLE
+-  TYPE_LONGDOUBLE,
+-#endif
+-  TYPE_CHAR,
+-#ifdef HAVE_WINT_T
+-  TYPE_WIDE_CHAR,
+-#endif
+-  TYPE_STRING,
+-#ifdef HAVE_WCHAR_T
+-  TYPE_WIDE_STRING,
+-#endif
+-  TYPE_POINTER,
+-  TYPE_COUNT_SCHAR_POINTER,
+-  TYPE_COUNT_SHORT_POINTER,
+-  TYPE_COUNT_INT_POINTER,
+-  TYPE_COUNT_LONGINT_POINTER
+-#ifdef HAVE_LONG_LONG
+-, TYPE_COUNT_LONGLONGINT_POINTER
+-#endif
+-} arg_type;
+-
+-/* Polymorphic argument */
+-typedef struct
+-{
+-  arg_type type;
+-  union
+-  {
+-    signed char			a_schar;
+-    unsigned char		a_uchar;
+-    short			a_short;
+-    unsigned short		a_ushort;
+-    int				a_int;
+-    unsigned int		a_uint;
+-    long int			a_longint;
+-    unsigned long int		a_ulongint;
+-#ifdef HAVE_LONG_LONG
+-    long long int		a_longlongint;
+-    unsigned long long int	a_ulonglongint;
+-#endif
+-    float			a_float;
+-    double			a_double;
+-#ifdef HAVE_LONG_DOUBLE
+-    long double			a_longdouble;
+-#endif
+-    int				a_char;
+-#ifdef HAVE_WINT_T
+-    wint_t			a_wide_char;
+-#endif
+-    const char*			a_string;
+-#ifdef HAVE_WCHAR_T
+-    const wchar_t*		a_wide_string;
+-#endif
+-    void*			a_pointer;
+-    signed char *		a_count_schar_pointer;
+-    short *			a_count_short_pointer;
+-    int *			a_count_int_pointer;
+-    long int *			a_count_longint_pointer;
+-#ifdef HAVE_LONG_LONG
+-    long long int *		a_count_longlongint_pointer;
+-#endif
+-  }
+-  a;
+-}
+-argument;
+-
+-typedef struct
+-{
+-  size_t count;
+-  argument *arg;
+-}
+-arguments;
+-
+-
+-/* Fetch the arguments, putting them into a. */
+-#ifdef STATIC
+-STATIC
+-#else
+-extern
+-#endif
+-int printf_fetchargs (va_list args, arguments *a);
+-
+-#endif /* _PRINTF_ARGS_H */
+--- a/intl/printf-parse.c
++++ /dev/null
+@@ -1,537 +0,0 @@
+-/* Formatted output to strings.
+-   Copyright (C) 1999-2000, 2002-2003 Free Software Foundation, Inc.
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
+-/* Specification.  */
+-#if WIDE_CHAR_VERSION
+-# include "wprintf-parse.h"
+-#else
+-# include "printf-parse.h"
+-#endif
+-
+-/* Get size_t, NULL.  */
+-#include <stddef.h>
+-
+-/* Get intmax_t.  */
+-#if HAVE_STDINT_H_WITH_UINTMAX
+-# include <stdint.h>
+-#endif
+-#if HAVE_INTTYPES_H_WITH_UINTMAX
+-# include <inttypes.h>
+-#endif
+-
+-/* malloc(), realloc(), free().  */
+-#include <stdlib.h>
+-
+-/* Checked size_t computations.  */
+-#include "xsize.h"
+-
+-#if WIDE_CHAR_VERSION
+-# define PRINTF_PARSE wprintf_parse
+-# define CHAR_T wchar_t
+-# define DIRECTIVE wchar_t_directive
+-# define DIRECTIVES wchar_t_directives
+-#else
+-# define PRINTF_PARSE printf_parse
+-# define CHAR_T char
+-# define DIRECTIVE char_directive
+-# define DIRECTIVES char_directives
+-#endif
+-
+-#ifdef STATIC
+-STATIC
+-#endif
+-int
+-PRINTF_PARSE (const CHAR_T *format, DIRECTIVES *d, arguments *a)
+-{
+-  const CHAR_T *cp = format;		/* pointer into format */
+-  size_t arg_posn = 0;		/* number of regular arguments consumed */
+-  size_t d_allocated;			/* allocated elements of d->dir */
+-  size_t a_allocated;			/* allocated elements of a->arg */
+-  size_t max_width_length = 0;
+-  size_t max_precision_length = 0;
+-
+-  d->count = 0;
+-  d_allocated = 1;
+-  d->dir = malloc (d_allocated * sizeof (DIRECTIVE));
+-  if (d->dir == NULL)
+-    /* Out of memory.  */
+-    return -1;
+-
+-  a->count = 0;
+-  a_allocated = 0;
+-  a->arg = NULL;
+-
+-#define REGISTER_ARG(_index_,_type_) \
+-  {									\
+-    size_t n = (_index_);						\
+-    if (n >= a_allocated)						\
+-      {									\
+-	size_t memory_size;						\
+-	argument *memory;						\
+-									\
+-	a_allocated = xtimes (a_allocated, 2);				\
+-	if (a_allocated <= n)						\
+-	  a_allocated = xsum (n, 1);					\
+-	memory_size = xtimes (a_allocated, sizeof (argument));		\
+-	if (size_overflow_p (memory_size))				\
+-	  /* Overflow, would lead to out of memory.  */			\
+-	  goto error;							\
+-	memory = (a->arg						\
+-		  ? realloc (a->arg, memory_size)			\
+-		  : malloc (memory_size));				\
+-	if (memory == NULL)						\
+-	  /* Out of memory.  */						\
+-	  goto error;							\
+-	a->arg = memory;						\
+-      }									\
+-    while (a->count <= n)						\
+-      a->arg[a->count++].type = TYPE_NONE;				\
+-    if (a->arg[n].type == TYPE_NONE)					\
+-      a->arg[n].type = (_type_);					\
+-    else if (a->arg[n].type != (_type_))				\
+-      /* Ambiguous type for positional argument.  */			\
+-      goto error;							\
+-  }
+-
+-  while (*cp != '\0')
+-    {
+-      CHAR_T c = *cp++;
+-      if (c == '%')
+-	{
+-	  size_t arg_index = ARG_NONE;
+-	  DIRECTIVE *dp = &d->dir[d->count];/* pointer to next directive */
+-
+-	  /* Initialize the next directive.  */
+-	  dp->dir_start = cp - 1;
+-	  dp->flags = 0;
+-	  dp->width_start = NULL;
+-	  dp->width_end = NULL;
+-	  dp->width_arg_index = ARG_NONE;
+-	  dp->precision_start = NULL;
+-	  dp->precision_end = NULL;
+-	  dp->precision_arg_index = ARG_NONE;
+-	  dp->arg_index = ARG_NONE;
+-
+-	  /* Test for positional argument.  */
+-	  if (*cp >= '0' && *cp <= '9')
+-	    {
+-	      const CHAR_T *np;
+-
+-	      for (np = cp; *np >= '0' && *np <= '9'; np++)
+-		;
+-	      if (*np == '$')
+-		{
+-		  size_t n = 0;
+-
+-		  for (np = cp; *np >= '0' && *np <= '9'; np++)
+-		    n = xsum (xtimes (n, 10), *np - '0');
+-		  if (n == 0)
+-		    /* Positional argument 0.  */
+-		    goto error;
+-		  if (size_overflow_p (n))
+-		    /* n too large, would lead to out of memory later.  */
+-		    goto error;
+-		  arg_index = n - 1;
+-		  cp = np + 1;
+-		}
+-	    }
+-
+-	  /* Read the flags.  */
+-	  for (;;)
+-	    {
+-	      if (*cp == '\'')
+-		{
+-		  dp->flags |= FLAG_GROUP;
+-		  cp++;
+-		}
+-	      else if (*cp == '-')
+-		{
+-		  dp->flags |= FLAG_LEFT;
+-		  cp++;
+-		}
+-	      else if (*cp == '+')
+-		{
+-		  dp->flags |= FLAG_SHOWSIGN;
+-		  cp++;
+-		}
+-	      else if (*cp == ' ')
+-		{
+-		  dp->flags |= FLAG_SPACE;
+-		  cp++;
+-		}
+-	      else if (*cp == '#')
+-		{
+-		  dp->flags |= FLAG_ALT;
+-		  cp++;
+-		}
+-	      else if (*cp == '0')
+-		{
+-		  dp->flags |= FLAG_ZERO;
+-		  cp++;
+-		}
+-	      else
+-		break;
+-	    }
+-
+-	  /* Parse the field width.  */
+-	  if (*cp == '*')
+-	    {
+-	      dp->width_start = cp;
+-	      cp++;
+-	      dp->width_end = cp;
+-	      if (max_width_length < 1)
+-		max_width_length = 1;
+-
+-	      /* Test for positional argument.  */
+-	      if (*cp >= '0' && *cp <= '9')
+-		{
+-		  const CHAR_T *np;
+-
+-		  for (np = cp; *np >= '0' && *np <= '9'; np++)
+-		    ;
+-		  if (*np == '$')
+-		    {
+-		      size_t n = 0;
+-
+-		      for (np = cp; *np >= '0' && *np <= '9'; np++)
+-			n = xsum (xtimes (n, 10), *np - '0');
+-		      if (n == 0)
+-			/* Positional argument 0.  */
+-			goto error;
+-		      if (size_overflow_p (n))
+-			/* n too large, would lead to out of memory later.  */
+-			goto error;
+-		      dp->width_arg_index = n - 1;
+-		      cp = np + 1;
+-		    }
+-		}
+-	      if (dp->width_arg_index == ARG_NONE)
+-		{
+-		  dp->width_arg_index = arg_posn++;
+-		  if (dp->width_arg_index == ARG_NONE)
+-		    /* arg_posn wrapped around.  */
+-		    goto error;
+-		}
+-	      REGISTER_ARG (dp->width_arg_index, TYPE_INT);
+-	    }
+-	  else if (*cp >= '0' && *cp <= '9')
+-	    {
+-	      size_t width_length;
+-
+-	      dp->width_start = cp;
+-	      for (; *cp >= '0' && *cp <= '9'; cp++)
+-		;
+-	      dp->width_end = cp;
+-	      width_length = dp->width_end - dp->width_start;
+-	      if (max_width_length < width_length)
+-		max_width_length = width_length;
+-	    }
+-
+-	  /* Parse the precision.  */
+-	  if (*cp == '.')
+-	    {
+-	      cp++;
+-	      if (*cp == '*')
+-		{
+-		  dp->precision_start = cp - 1;
+-		  cp++;
+-		  dp->precision_end = cp;
+-		  if (max_precision_length < 2)
+-		    max_precision_length = 2;
+-
+-		  /* Test for positional argument.  */
+-		  if (*cp >= '0' && *cp <= '9')
+-		    {
+-		      const CHAR_T *np;
+-
+-		      for (np = cp; *np >= '0' && *np <= '9'; np++)
+-			;
+-		      if (*np == '$')
+-			{
+-			  size_t n = 0;
+-
+-			  for (np = cp; *np >= '0' && *np <= '9'; np++)
+-			    n = xsum (xtimes (n, 10), *np - '0');
+-			  if (n == 0)
+-			    /* Positional argument 0.  */
+-			    goto error;
+-			  if (size_overflow_p (n))
+-			    /* n too large, would lead to out of memory
+-			       later.  */
+-			    goto error;
+-			  dp->precision_arg_index = n - 1;
+-			  cp = np + 1;
+-			}
+-		    }
+-		  if (dp->precision_arg_index == ARG_NONE)
+-		    {
+-		      dp->precision_arg_index = arg_posn++;
+-		      if (dp->precision_arg_index == ARG_NONE)
+-			/* arg_posn wrapped around.  */
+-			goto error;
+-		    }
+-		  REGISTER_ARG (dp->precision_arg_index, TYPE_INT);
+-		}
+-	      else
+-		{
+-		  size_t precision_length;
+-
+-		  dp->precision_start = cp - 1;
+-		  for (; *cp >= '0' && *cp <= '9'; cp++)
+-		    ;
+-		  dp->precision_end = cp;
+-		  precision_length = dp->precision_end - dp->precision_start;
+-		  if (max_precision_length < precision_length)
+-		    max_precision_length = precision_length;
+-		}
+-	    }
+-
+-	  {
+-	    arg_type type;
+-
+-	    /* Parse argument type/size specifiers.  */
+-	    {
+-	      int flags = 0;
+-
+-	      for (;;)
+-		{
+-		  if (*cp == 'h')
+-		    {
+-		      flags |= (1 << (flags & 1));
+-		      cp++;
+-		    }
+-		  else if (*cp == 'L')
+-		    {
+-		      flags |= 4;
+-		      cp++;
+-		    }
+-		  else if (*cp == 'l')
+-		    {
+-		      flags += 8;
+-		      cp++;
+-		    }
+-#ifdef HAVE_INTMAX_T
+-		  else if (*cp == 'j')
+-		    {
+-		      if (sizeof (intmax_t) > sizeof (long))
+-			{
+-			  /* intmax_t = long long */
+-			  flags += 16;
+-			}
+-		      else if (sizeof (intmax_t) > sizeof (int))
+-			{
+-			  /* intmax_t = long */
+-			  flags += 8;
+-			}
+-		      cp++;
+-		    }
+-#endif
+-		  else if (*cp == 'z' || *cp == 'Z')
+-		    {
+-		      /* 'z' is standardized in ISO C 99, but glibc uses 'Z'
+-			 because the warning facility in gcc-2.95.2 understands
+-			 only 'Z' (see gcc-2.95.2/gcc/c-common.c:1784).  */
+-		      if (sizeof (size_t) > sizeof (long))
+-			{
+-			  /* size_t = long long */
+-			  flags += 16;
+-			}
+-		      else if (sizeof (size_t) > sizeof (int))
+-			{
+-			  /* size_t = long */
+-			  flags += 8;
+-			}
+-		      cp++;
+-		    }
+-		  else if (*cp == 't')
+-		    {
+-		      if (sizeof (ptrdiff_t) > sizeof (long))
+-			{
+-			  /* ptrdiff_t = long long */
+-			  flags += 16;
+-			}
+-		      else if (sizeof (ptrdiff_t) > sizeof (int))
+-			{
+-			  /* ptrdiff_t = long */
+-			  flags += 8;
+-			}
+-		      cp++;
+-		    }
+-		  else
+-		    break;
+-		}
+-
+-	      /* Read the conversion character.  */
+-	      c = *cp++;
+-	      switch (c)
+-		{
+-		case 'd': case 'i':
+-#ifdef HAVE_LONG_LONG
+-		  if (flags >= 16 || (flags & 4))
+-		    type = TYPE_LONGLONGINT;
+-		  else
+-#endif
+-		  if (flags >= 8)
+-		    type = TYPE_LONGINT;
+-		  else if (flags & 2)
+-		    type = TYPE_SCHAR;
+-		  else if (flags & 1)
+-		    type = TYPE_SHORT;
+-		  else
+-		    type = TYPE_INT;
+-		  break;
+-		case 'o': case 'u': case 'x': case 'X':
+-#ifdef HAVE_LONG_LONG
+-		  if (flags >= 16 || (flags & 4))
+-		    type = TYPE_ULONGLONGINT;
+-		  else
+-#endif
+-		  if (flags >= 8)
+-		    type = TYPE_ULONGINT;
+-		  else if (flags & 2)
+-		    type = TYPE_UCHAR;
+-		  else if (flags & 1)
+-		    type = TYPE_USHORT;
+-		  else
+-		    type = TYPE_UINT;
+-		  break;
+-		case 'f': case 'F': case 'e': case 'E': case 'g': case 'G':
+-		case 'a': case 'A':
+-#ifdef HAVE_LONG_DOUBLE
+-		  if (flags >= 16 || (flags & 4))
+-		    type = TYPE_LONGDOUBLE;
+-		  else
+-#endif
+-		  type = TYPE_DOUBLE;
+-		  break;
+-		case 'c':
+-		  if (flags >= 8)
+-#ifdef HAVE_WINT_T
+-		    type = TYPE_WIDE_CHAR;
+-#else
+-		    goto error;
+-#endif
+-		  else
+-		    type = TYPE_CHAR;
+-		  break;
+-#ifdef HAVE_WINT_T
+-		case 'C':
+-		  type = TYPE_WIDE_CHAR;
+-		  c = 'c';
+-		  break;
+-#endif
+-		case 's':
+-		  if (flags >= 8)
+-#ifdef HAVE_WCHAR_T
+-		    type = TYPE_WIDE_STRING;
+-#else
+-		    goto error;
+-#endif
+-		  else
+-		    type = TYPE_STRING;
+-		  break;
+-#ifdef HAVE_WCHAR_T
+-		case 'S':
+-		  type = TYPE_WIDE_STRING;
+-		  c = 's';
+-		  break;
+-#endif
+-		case 'p':
+-		  type = TYPE_POINTER;
+-		  break;
+-		case 'n':
+-#ifdef HAVE_LONG_LONG
+-		  if (flags >= 16 || (flags & 4))
+-		    type = TYPE_COUNT_LONGLONGINT_POINTER;
+-		  else
+-#endif
+-		  if (flags >= 8)
+-		    type = TYPE_COUNT_LONGINT_POINTER;
+-		  else if (flags & 2)
+-		    type = TYPE_COUNT_SCHAR_POINTER;
+-		  else if (flags & 1)
+-		    type = TYPE_COUNT_SHORT_POINTER;
+-		  else
+-		    type = TYPE_COUNT_INT_POINTER;
+-		  break;
+-		case '%':
+-		  type = TYPE_NONE;
+-		  break;
+-		default:
+-		  /* Unknown conversion character.  */
+-		  goto error;
+-		}
+-	    }
+-
+-	    if (type != TYPE_NONE)
+-	      {
+-		dp->arg_index = arg_index;
+-		if (dp->arg_index == ARG_NONE)
+-		  {
+-		    dp->arg_index = arg_posn++;
+-		    if (dp->arg_index == ARG_NONE)
+-		      /* arg_posn wrapped around.  */
+-		      goto error;
+-		  }
+-		REGISTER_ARG (dp->arg_index, type);
+-	      }
+-	    dp->conversion = c;
+-	    dp->dir_end = cp;
+-	  }
+-
+-	  d->count++;
+-	  if (d->count >= d_allocated)
+-	    {
+-	      size_t memory_size;
+-	      DIRECTIVE *memory;
+-
+-	      d_allocated = xtimes (d_allocated, 2);
+-	      memory_size = xtimes (d_allocated, sizeof (DIRECTIVE));
+-	      if (size_overflow_p (memory_size))
+-		/* Overflow, would lead to out of memory.  */
+-		goto error;
+-	      memory = realloc (d->dir, memory_size);
+-	      if (memory == NULL)
+-		/* Out of memory.  */
+-		goto error;
+-	      d->dir = memory;
+-	    }
+-	}
+-    }
+-  d->dir[d->count].dir_start = cp;
+-
+-  d->max_width_length = max_width_length;
+-  d->max_precision_length = max_precision_length;
+-  return 0;
+-
+-error:
+-  if (a->arg)
+-    free (a->arg);
+-  if (d->dir)
+-    free (d->dir);
+-  return -1;
+-}
+-
+-#undef DIRECTIVES
+-#undef DIRECTIVE
+-#undef CHAR_T
+-#undef PRINTF_PARSE
+--- a/intl/printf-parse.h
++++ /dev/null
+@@ -1,75 +0,0 @@
+-/* Parse printf format string.
+-   Copyright (C) 1999, 2002-2003 Free Software Foundation, Inc.
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
+-#ifndef _PRINTF_PARSE_H
+-#define _PRINTF_PARSE_H
+-
+-#include "printf-args.h"
+-
+-
+-/* Flags */
+-#define FLAG_GROUP	 1	/* ' flag */
+-#define FLAG_LEFT	 2	/* - flag */
+-#define FLAG_SHOWSIGN	 4	/* + flag */
+-#define FLAG_SPACE	 8	/* space flag */
+-#define FLAG_ALT	16	/* # flag */
+-#define FLAG_ZERO	32
+-
+-/* arg_index value indicating that no argument is consumed.  */
+-#define ARG_NONE	(~(size_t)0)
+-
+-/* A parsed directive.  */
+-typedef struct
+-{
+-  const char* dir_start;
+-  const char* dir_end;
+-  int flags;
+-  const char* width_start;
+-  const char* width_end;
+-  size_t width_arg_index;
+-  const char* precision_start;
+-  const char* precision_end;
+-  size_t precision_arg_index;
+-  char conversion; /* d i o u x X f e E g G c s p n U % but not C S */
+-  size_t arg_index;
+-}
+-char_directive;
+-
+-/* A parsed format string.  */
+-typedef struct
+-{
+-  size_t count;
+-  char_directive *dir;
+-  size_t max_width_length;
+-  size_t max_precision_length;
+-}
+-char_directives;
+-
+-
+-/* Parses the format string.  Fills in the number N of directives, and fills
+-   in directives[0], ..., directives[N-1], and sets directives[N].dir_start
+-   to the end of the format string.  Also fills in the arg_type fields of the
+-   arguments and the needed count of arguments.  */
+-#ifdef STATIC
+-STATIC
+-#else
+-extern
+-#endif
+-int printf_parse (const char *format, char_directives *d, arguments *a);
+-
+-#endif /* _PRINTF_PARSE_H */
+--- a/intl/printf.c
++++ /dev/null
+@@ -1,371 +0,0 @@
+-/* Formatted output to strings, using POSIX/XSI format strings with positions.
+-   Copyright (C) 2003 Free Software Foundation, Inc.
+-   Written by Bruno Haible <bruno@clisp.org>, 2003.
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
+-#ifdef __GNUC__
+-# define alloca __builtin_alloca
+-# define HAVE_ALLOCA 1
+-#else
+-# ifdef _MSC_VER
+-#  include <malloc.h>
+-#  define alloca _alloca
+-# else
+-#  if defined HAVE_ALLOCA_H || defined _LIBC
+-#   include <alloca.h>
+-#  else
+-#   ifdef _AIX
+- #pragma alloca
+-#   else
+-#    ifndef alloca
+-char *alloca ();
+-#    endif
+-#   endif
+-#  endif
+-# endif
+-#endif
+-
+-#include <stdio.h>
+-
+-#if !HAVE_POSIX_PRINTF
+-
+-#include <stdlib.h>
+-#include <string.h>
+-
+-/* When building a DLL, we must export some functions.  Note that because
+-   the functions are only defined for binary backward compatibility, we
+-   don't need to use __declspec(dllimport) in any case.  */
+-#if defined _MSC_VER && BUILDING_DLL
+-# define DLL_EXPORTED __declspec(dllexport)
+-#else
+-# define DLL_EXPORTED
+-#endif
+-
+-#define STATIC static
+-
+-/* Define auxiliary functions declared in "printf-args.h".  */
+-#include "printf-args.c"
+-
+-/* Define auxiliary functions declared in "printf-parse.h".  */
+-#include "printf-parse.c"
+-
+-/* Define functions declared in "vasnprintf.h".  */
+-#define vasnprintf libintl_vasnprintf
+-#include "vasnprintf.c"
+-#if 0 /* not needed */
+-#define asnprintf libintl_asnprintf
+-#include "asnprintf.c"
+-#endif
+-
+-DLL_EXPORTED
+-int
+-libintl_vfprintf (FILE *stream, const char *format, va_list args)
+-{
+-  if (strchr (format, '$') == NULL)
+-    return vfprintf (stream, format, args);
+-  else
+-    {
+-      size_t length;
+-      char *result = libintl_vasnprintf (NULL, &length, format, args);
+-      int retval = -1;
+-      if (result != NULL)
+-	{
+-	  if (fwrite (result, 1, length, stream) == length)
+-	    retval = length;
+-	  free (result);
+-	}
+-      return retval;
+-    }
+-}
+-
+-DLL_EXPORTED
+-int
+-libintl_fprintf (FILE *stream, const char *format, ...)
+-{
+-  va_list args;
+-  int retval;
+-
+-  va_start (args, format);
+-  retval = libintl_vfprintf (stream, format, args);
+-  va_end (args);
+-  return retval;
+-}
+-
+-DLL_EXPORTED
+-int
+-libintl_vprintf (const char *format, va_list args)
+-{
+-  return libintl_vfprintf (stdout, format, args);
+-}
+-
+-DLL_EXPORTED
+-int
+-libintl_printf (const char *format, ...)
+-{
+-  va_list args;
+-  int retval;
+-
+-  va_start (args, format);
+-  retval = libintl_vprintf (format, args);
+-  va_end (args);
+-  return retval;
+-}
+-
+-DLL_EXPORTED
+-int
+-libintl_vsprintf (char *resultbuf, const char *format, va_list args)
+-{
+-  if (strchr (format, '$') == NULL)
+-    return vsprintf (resultbuf, format, args);
+-  else
+-    {
+-      size_t length = (size_t) ~0 / (4 * sizeof (char));
+-      char *result = libintl_vasnprintf (resultbuf, &length, format, args);
+-      if (result != resultbuf)
+-	{
+-	  free (result);
+-	  return -1;
+-	}
+-      else
+-	return length;
+-    }
+-}
+-
+-DLL_EXPORTED
+-int
+-libintl_sprintf (char *resultbuf, const char *format, ...)
+-{
+-  va_list args;
+-  int retval;
+-
+-  va_start (args, format);
+-  retval = libintl_vsprintf (resultbuf, format, args);
+-  va_end (args);
+-  return retval;
+-}
+-
+-#if HAVE_SNPRINTF
+-
+-# if HAVE_DECL__SNPRINTF
+-   /* Windows.  */
+-#  define system_vsnprintf _vsnprintf
+-# else
+-   /* Unix.  */
+-#  define system_vsnprintf vsnprintf
+-# endif
+-
+-DLL_EXPORTED
+-int
+-libintl_vsnprintf (char *resultbuf, size_t length, const char *format, va_list args)
+-{
+-  if (strchr (format, '$') == NULL)
+-    return system_vsnprintf (resultbuf, length, format, args);
+-  else
+-    {
+-      size_t maxlength = length;
+-      char *result = libintl_vasnprintf (resultbuf, &length, format, args);
+-      if (result != resultbuf)
+-	{
+-	  if (maxlength > 0)
+-	    {
+-	      if (length < maxlength)
+-		abort ();
+-	      memcpy (resultbuf, result, maxlength - 1);
+-	      resultbuf[maxlength - 1] = '\0';
+-	    }
+-	  free (result);
+-	  return -1;
+-	}
+-      else
+-	return length;
+-    }
+-}
+-
+-DLL_EXPORTED
+-int
+-libintl_snprintf (char *resultbuf, size_t length, const char *format, ...)
+-{
+-  va_list args;
+-  int retval;
+-
+-  va_start (args, format);
+-  retval = libintl_vsnprintf (resultbuf, length, format, args);
+-  va_end (args);
+-  return retval;
+-}
+-
+-#endif
+-
+-#if HAVE_ASPRINTF
+-
+-DLL_EXPORTED
+-int
+-libintl_vasprintf (char **resultp, const char *format, va_list args)
+-{
+-  size_t length;
+-  char *result = libintl_vasnprintf (NULL, &length, format, args);
+-  if (result == NULL)
+-    return -1;
+-  *resultp = result;
+-  return length;
+-}
+-
+-DLL_EXPORTED
+-int
+-libintl_asprintf (char **resultp, const char *format, ...)
+-{
+-  va_list args;
+-  int retval;
+-
+-  va_start (args, format);
+-  retval = libintl_vasprintf (resultp, format, args);
+-  va_end (args);
+-  return retval;
+-}
+-
+-#endif
+-
+-#if HAVE_FWPRINTF
+-
+-#include <wchar.h>
+-
+-#define WIDE_CHAR_VERSION 1
+-
+-/* Define auxiliary functions declared in "wprintf-parse.h".  */
+-#include "printf-parse.c"
+-
+-/* Define functions declared in "vasnprintf.h".  */
+-#define vasnwprintf libintl_vasnwprintf
+-#include "vasnprintf.c"
+-#if 0 /* not needed */
+-#define asnwprintf libintl_asnwprintf
+-#include "asnprintf.c"
+-#endif
+-
+-# if HAVE_DECL__SNWPRINTF
+-   /* Windows.  */
+-#  define system_vswprintf _vsnwprintf
+-# else
+-   /* Unix.  */
+-#  define system_vswprintf vswprintf
+-# endif
+-
+-DLL_EXPORTED
+-int
+-libintl_vfwprintf (FILE *stream, const wchar_t *format, va_list args)
+-{
+-  if (wcschr (format, '$') == NULL)
+-    return vfwprintf (stream, format, args);
+-  else
+-    {
+-      size_t length;
+-      wchar_t *result = libintl_vasnwprintf (NULL, &length, format, args);
+-      int retval = -1;
+-      if (result != NULL)
+-	{
+-	  size_t i;
+-	  for (i = 0; i < length; i++)
+-	    if (fputwc (result[i], stream) == WEOF)
+-	      break;
+-	  if (i == length)
+-	    retval = length;
+-	  free (result);
+-	}
+-      return retval;
+-    }
+-}
+-
+-DLL_EXPORTED
+-int
+-libintl_fwprintf (FILE *stream, const wchar_t *format, ...)
+-{
+-  va_list args;
+-  int retval;
+-
+-  va_start (args, format);
+-  retval = libintl_vfwprintf (stream, format, args);
+-  va_end (args);
+-  return retval;
+-}
+-
+-DLL_EXPORTED
+-int
+-libintl_vwprintf (const wchar_t *format, va_list args)
+-{
+-  return libintl_vfwprintf (stdout, format, args);
+-}
+-
+-DLL_EXPORTED
+-int
+-libintl_wprintf (const wchar_t *format, ...)
+-{
+-  va_list args;
+-  int retval;
+-
+-  va_start (args, format);
+-  retval = libintl_vwprintf (format, args);
+-  va_end (args);
+-  return retval;
+-}
+-
+-DLL_EXPORTED
+-int
+-libintl_vswprintf (wchar_t *resultbuf, size_t length, const wchar_t *format, va_list args)
+-{
+-  if (wcschr (format, '$') == NULL)
+-    return system_vswprintf (resultbuf, length, format, args);
+-  else
+-    {
+-      size_t maxlength = length;
+-      wchar_t *result = libintl_vasnwprintf (resultbuf, &length, format, args);
+-      if (result != resultbuf)
+-	{
+-	  if (maxlength > 0)
+-	    {
+-	      if (length < maxlength)
+-		abort ();
+-	      memcpy (resultbuf, result, (maxlength - 1) * sizeof (wchar_t));
+-	      resultbuf[maxlength - 1] = 0;
+-	    }
+-	  free (result);
+-	  return -1;
+-	}
+-      else
+-	return length;
+-    }
+-}
+-
+-DLL_EXPORTED
+-int
+-libintl_swprintf (wchar_t *resultbuf, size_t length, const wchar_t *format, ...)
+-{
+-  va_list args;
+-  int retval;
+-
+-  va_start (args, format);
+-  retval = libintl_vswprintf (resultbuf, length, format, args);
+-  va_end (args);
+-  return retval;
+-}
+-
+-#endif
+-
+-#endif
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
+--- a/intl/relocatable.c
++++ /dev/null
+@@ -1,449 +0,0 @@
+-/* Provide relocatable packages.
+-   Copyright (C) 2003-2004 Free Software Foundation, Inc.
+-   Written by Bruno Haible <bruno@clisp.org>, 2003.
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
+-
+-/* Tell glibc's <stdio.h> to provide a prototype for getline().
+-   This must come before <config.h> because <config.h> may include
+-   <features.h>, and once <features.h> has been included, it's too late.  */
+-#ifndef _GNU_SOURCE
+-# define _GNU_SOURCE	1
+-#endif
+-
+-#ifdef HAVE_CONFIG_H
+-# include "config.h"
+-#endif
+-
+-/* Specification.  */
+-#include "relocatable.h"
+-
+-#if ENABLE_RELOCATABLE
+-
+-#include <stddef.h>
+-#include <stdio.h>
+-#include <stdlib.h>
+-#include <string.h>
+-
+-#ifdef NO_XMALLOC
+-# define xmalloc malloc
+-#else
+-# include "xalloc.h"
+-#endif
+-
+-#if defined _WIN32 || defined __WIN32__
+-# define WIN32_LEAN_AND_MEAN
+-# include <windows.h>
+-#endif
+-
+-#if DEPENDS_ON_LIBCHARSET
+-# include <libcharset.h>
+-#endif
+-#if DEPENDS_ON_LIBICONV && HAVE_ICONV
+-# include <iconv.h>
+-#endif
+-#if DEPENDS_ON_LIBINTL && ENABLE_NLS
+-# include <libintl.h>
+-#endif
+-
+-/* Faked cheap 'bool'.  */
+-#undef bool
+-#undef false
+-#undef true
+-#define bool int
+-#define false 0
+-#define true 1
+-
+-/* Pathname support.
+-   ISSLASH(C)           tests whether C is a directory separator character.
+-   IS_PATH_WITH_DIR(P)  tests whether P contains a directory specification.
+- */
+-#if defined _WIN32 || defined __WIN32__ || defined __CYGWIN__ || defined __EMX__ || defined __DJGPP__
+-  /* Win32, Cygwin, OS/2, DOS */
+-# define ISSLASH(C) ((C) == '/' || (C) == '\\')
+-# define HAS_DEVICE(P) \
+-    ((((P)[0] >= 'A' && (P)[0] <= 'Z') || ((P)[0] >= 'a' && (P)[0] <= 'z')) \
+-     && (P)[1] == ':')
+-# define IS_PATH_WITH_DIR(P) \
+-    (strchr (P, '/') != NULL || strchr (P, '\\') != NULL || HAS_DEVICE (P))
+-# define FILE_SYSTEM_PREFIX_LEN(P) (HAS_DEVICE (P) ? 2 : 0)
+-#else
+-  /* Unix */
+-# define ISSLASH(C) ((C) == '/')
+-# define IS_PATH_WITH_DIR(P) (strchr (P, '/') != NULL)
+-# define FILE_SYSTEM_PREFIX_LEN(P) 0
+-#endif
+-
+-/* Original installation prefix.  */
+-static char *orig_prefix;
+-static size_t orig_prefix_len;
+-/* Current installation prefix.  */
+-static char *curr_prefix;
+-static size_t curr_prefix_len;
+-/* These prefixes do not end in a slash.  Anything that will be concatenated
+-   to them must start with a slash.  */
+-
+-/* Sets the original and the current installation prefix of this module.
+-   Relocation simply replaces a pathname starting with the original prefix
+-   by the corresponding pathname with the current prefix instead.  Both
+-   prefixes should be directory names without trailing slash (i.e. use ""
+-   instead of "/").  */
+-static void
+-set_this_relocation_prefix (const char *orig_prefix_arg,
+-			    const char *curr_prefix_arg)
+-{
+-  if (orig_prefix_arg != NULL && curr_prefix_arg != NULL
+-      /* Optimization: if orig_prefix and curr_prefix are equal, the
+-	 relocation is a nop.  */
+-      && strcmp (orig_prefix_arg, curr_prefix_arg) != 0)
+-    {
+-      /* Duplicate the argument strings.  */
+-      char *memory;
+-
+-      orig_prefix_len = strlen (orig_prefix_arg);
+-      curr_prefix_len = strlen (curr_prefix_arg);
+-      memory = (char *) xmalloc (orig_prefix_len + 1 + curr_prefix_len + 1);
+-#ifdef NO_XMALLOC
+-      if (memory != NULL)
+-#endif
+-	{
+-	  memcpy (memory, orig_prefix_arg, orig_prefix_len + 1);
+-	  orig_prefix = memory;
+-	  memory += orig_prefix_len + 1;
+-	  memcpy (memory, curr_prefix_arg, curr_prefix_len + 1);
+-	  curr_prefix = memory;
+-	  return;
+-	}
+-    }
+-  orig_prefix = NULL;
+-  curr_prefix = NULL;
+-  /* Don't worry about wasted memory here - this function is usually only
+-     called once.  */
+-}
+-
+-/* Sets the original and the current installation prefix of the package.
+-   Relocation simply replaces a pathname starting with the original prefix
+-   by the corresponding pathname with the current prefix instead.  Both
+-   prefixes should be directory names without trailing slash (i.e. use ""
+-   instead of "/").  */
+-void
+-set_relocation_prefix (const char *orig_prefix_arg, const char *curr_prefix_arg)
+-{
+-  set_this_relocation_prefix (orig_prefix_arg, curr_prefix_arg);
+-
+-  /* Now notify all dependent libraries.  */
+-#if DEPENDS_ON_LIBCHARSET
+-  libcharset_set_relocation_prefix (orig_prefix_arg, curr_prefix_arg);
+-#endif
+-#if DEPENDS_ON_LIBICONV && HAVE_ICONV && _LIBICONV_VERSION >= 0x0109
+-  libiconv_set_relocation_prefix (orig_prefix_arg, curr_prefix_arg);
+-#endif
+-#if DEPENDS_ON_LIBINTL && ENABLE_NLS && defined libintl_set_relocation_prefix
+-  libintl_set_relocation_prefix (orig_prefix_arg, curr_prefix_arg);
+-#endif
+-}
+-
+-#if !defined IN_LIBRARY || (defined PIC && defined INSTALLDIR)
+-
+-/* Convenience function:
+-   Computes the current installation prefix, based on the original
+-   installation prefix, the original installation directory of a particular
+-   file, and the current pathname of this file.  Returns NULL upon failure.  */
+-#ifdef IN_LIBRARY
+-#define compute_curr_prefix local_compute_curr_prefix
+-static
+-#endif
+-const char *
+-compute_curr_prefix (const char *orig_installprefix,
+-		     const char *orig_installdir,
+-		     const char *curr_pathname)
+-{
+-  const char *curr_installdir;
+-  const char *rel_installdir;
+-
+-  if (curr_pathname == NULL)
+-    return NULL;
+-
+-  /* Determine the relative installation directory, relative to the prefix.
+-     This is simply the difference between orig_installprefix and
+-     orig_installdir.  */
+-  if (strncmp (orig_installprefix, orig_installdir, strlen (orig_installprefix))
+-      != 0)
+-    /* Shouldn't happen - nothing should be installed outside $(prefix).  */
+-    return NULL;
+-  rel_installdir = orig_installdir + strlen (orig_installprefix);
+-
+-  /* Determine the current installation directory.  */
+-  {
+-    const char *p_base = curr_pathname + FILE_SYSTEM_PREFIX_LEN (curr_pathname);
+-    const char *p = curr_pathname + strlen (curr_pathname);
+-    char *q;
+-
+-    while (p > p_base)
+-      {
+-	p--;
+-	if (ISSLASH (*p))
+-	  break;
+-      }
+-
+-    q = (char *) xmalloc (p - curr_pathname + 1);
+-#ifdef NO_XMALLOC
+-    if (q == NULL)
+-      return NULL;
+-#endif
+-    memcpy (q, curr_pathname, p - curr_pathname);
+-    q[p - curr_pathname] = '\0';
+-    curr_installdir = q;
+-  }
+-
+-  /* Compute the current installation prefix by removing the trailing
+-     rel_installdir from it.  */
+-  {
+-    const char *rp = rel_installdir + strlen (rel_installdir);
+-    const char *cp = curr_installdir + strlen (curr_installdir);
+-    const char *cp_base =
+-      curr_installdir + FILE_SYSTEM_PREFIX_LEN (curr_installdir);
+-
+-    while (rp > rel_installdir && cp > cp_base)
+-      {
+-	bool same = false;
+-	const char *rpi = rp;
+-	const char *cpi = cp;
+-
+-	while (rpi > rel_installdir && cpi > cp_base)
+-	  {
+-	    rpi--;
+-	    cpi--;
+-	    if (ISSLASH (*rpi) || ISSLASH (*cpi))
+-	      {
+-		if (ISSLASH (*rpi) && ISSLASH (*cpi))
+-		  same = true;
+-		break;
+-	      }
+-#if defined _WIN32 || defined __WIN32__ || defined __CYGWIN__ || defined __EMX__ || defined __DJGPP__
+-	    /* Win32, Cygwin, OS/2, DOS - case insignificant filesystem */
+-	    if ((*rpi >= 'a' && *rpi <= 'z' ? *rpi - 'a' + 'A' : *rpi)
+-		!= (*cpi >= 'a' && *cpi <= 'z' ? *cpi - 'a' + 'A' : *cpi))
+-	      break;
+-#else
+-	    if (*rpi != *cpi)
+-	      break;
+-#endif
+-	  }
+-	if (!same)
+-	  break;
+-	/* The last pathname component was the same.  opi and cpi now point
+-	   to the slash before it.  */
+-	rp = rpi;
+-	cp = cpi;
+-      }
+-
+-    if (rp > rel_installdir)
+-      /* Unexpected: The curr_installdir does not end with rel_installdir.  */
+-      return NULL;
+-
+-    {
+-      size_t curr_prefix_len = cp - curr_installdir;
+-      char *curr_prefix;
+-
+-      curr_prefix = (char *) xmalloc (curr_prefix_len + 1);
+-#ifdef NO_XMALLOC
+-      if (curr_prefix == NULL)
+-	return NULL;
+-#endif
+-      memcpy (curr_prefix, curr_installdir, curr_prefix_len);
+-      curr_prefix[curr_prefix_len] = '\0';
+-
+-      return curr_prefix;
+-    }
+-  }
+-}
+-
+-#endif /* !IN_LIBRARY || PIC */
+-
+-#if defined PIC && defined INSTALLDIR
+-
+-/* Full pathname of shared library, or NULL.  */
+-static char *shared_library_fullname;
+-
+-#if defined _WIN32 || defined __WIN32__
+-
+-/* Determine the full pathname of the shared library when it is loaded.  */
+-
+-BOOL WINAPI
+-DllMain (HINSTANCE module_handle, DWORD event, LPVOID reserved)
+-{
+-  (void) reserved;
+-
+-  if (event == DLL_PROCESS_ATTACH)
+-    {
+-      /* The DLL is being loaded into an application's address range.  */
+-      static char location[MAX_PATH];
+-
+-      if (!GetModuleFileName (module_handle, location, sizeof (location)))
+-	/* Shouldn't happen.  */
+-	return FALSE;
+-
+-      if (!IS_PATH_WITH_DIR (location))
+-	/* Shouldn't happen.  */
+-	return FALSE;
+-
+-      shared_library_fullname = strdup (location);
+-    }
+-
+-  return TRUE;
+-}
+-
+-#else /* Unix */
+-
+-static void
+-find_shared_library_fullname ()
+-{
+-#if defined __linux__ && __GLIBC__ >= 2
+-  /* Linux has /proc/self/maps. glibc 2 has the getline() function.  */
+-  FILE *fp;
+-
+-  /* Open the current process' maps file.  It describes one VMA per line.  */
+-  fp = fopen ("/proc/self/maps", "r");
+-  if (fp)
+-    {
+-      unsigned long address = (unsigned long) &find_shared_library_fullname;
+-      for (;;)
+-	{
+-	  unsigned long start, end;
+-	  int c;
+-
+-	  if (fscanf (fp, "%lx-%lx", &start, &end) != 2)
+-	    break;
+-	  if (address >= start && address <= end - 1)
+-	    {
+-	      /* Found it.  Now see if this line contains a filename.  */
+-	      while (c = getc (fp), c != EOF && c != '\n' && c != '/')
+-		continue;
+-	      if (c == '/')
+-		{
+-		  size_t size;
+-		  int len;
+-
+-		  ungetc (c, fp);
+-		  shared_library_fullname = NULL; size = 0;
+-		  len = getline (&shared_library_fullname, &size, fp);
+-		  if (len >= 0)
+-		    {
+-		      /* Success: filled shared_library_fullname.  */
+-		      if (len > 0 && shared_library_fullname[len - 1] == '\n')
+-			shared_library_fullname[len - 1] = '\0';
+-		    }
+-		}
+-	      break;
+-	    }
+-	  while (c = getc (fp), c != EOF && c != '\n')
+-	    continue;
+-	}
+-      fclose (fp);
+-    }
+-#endif
+-}
+-
+-#endif /* WIN32 / Unix */
+-
+-/* Return the full pathname of the current shared library.
+-   Return NULL if unknown.
+-   Guaranteed to work only on Linux and Woe32.  */
+-static char *
+-get_shared_library_fullname ()
+-{
+-#if !(defined _WIN32 || defined __WIN32__)
+-  static bool tried_find_shared_library_fullname;
+-  if (!tried_find_shared_library_fullname)
+-    {
+-      find_shared_library_fullname ();
+-      tried_find_shared_library_fullname = true;
+-    }
+-#endif
+-  return shared_library_fullname;
+-}
+-
+-#endif /* PIC */
+-
+-/* Returns the pathname, relocated according to the current installation
+-   directory.  */
+-const char *
+-relocate (const char *pathname)
+-{
+-#if defined PIC && defined INSTALLDIR
+-  static int initialized;
+-
+-  /* Initialization code for a shared library.  */
+-  if (!initialized)
+-    {
+-      /* At this point, orig_prefix and curr_prefix likely have already been
+-	 set through the main program's set_program_name_and_installdir
+-	 function.  This is sufficient in the case that the library has
+-	 initially been installed in the same orig_prefix.  But we can do
+-	 better, to also cover the cases that 1. it has been installed
+-	 in a different prefix before being moved to orig_prefix and (later)
+-	 to curr_prefix, 2. unlike the program, it has not moved away from
+-	 orig_prefix.  */
+-      const char *orig_installprefix = INSTALLPREFIX;
+-      const char *orig_installdir = INSTALLDIR;
+-      const char *curr_prefix_better;
+-
+-      curr_prefix_better =
+-	compute_curr_prefix (orig_installprefix, orig_installdir,
+-			     get_shared_library_fullname ());
+-      if (curr_prefix_better == NULL)
+-	curr_prefix_better = curr_prefix;
+-
+-      set_relocation_prefix (orig_installprefix, curr_prefix_better);
+-
+-      initialized = 1;
+-    }
+-#endif
+-
+-  /* Note: It is not necessary to perform case insensitive comparison here,
+-     even for DOS-like filesystems, because the pathname argument was
+-     typically created from the same Makefile variable as orig_prefix came
+-     from.  */
+-  if (orig_prefix != NULL && curr_prefix != NULL
+-      && strncmp (pathname, orig_prefix, orig_prefix_len) == 0)
+-    {
+-      if (pathname[orig_prefix_len] == '\0')
+-	/* pathname equals orig_prefix.  */
+-	return curr_prefix;
+-      if (ISSLASH (pathname[orig_prefix_len]))
+-	{
+-	  /* pathname starts with orig_prefix.  */
+-	  const char *pathname_tail = &pathname[orig_prefix_len];
+-	  char *result =
+-	    (char *) xmalloc (curr_prefix_len + strlen (pathname_tail) + 1);
+-
+-#ifdef NO_XMALLOC
+-	  if (result != NULL)
+-#endif
+-	    {
+-	      memcpy (result, curr_prefix, curr_prefix_len);
+-	      strcpy (result + curr_prefix_len, pathname_tail);
+-	      return result;
+-	    }
+-	}
+-    }
+-  /* Nothing to relocate.  */
+-  return pathname;
+-}
+-
+-#endif
+--- a/intl/relocatable.h
++++ /dev/null
+@@ -1,77 +0,0 @@
+-/* Provide relocatable packages.
+-   Copyright (C) 2003 Free Software Foundation, Inc.
+-   Written by Bruno Haible <bruno@clisp.org>, 2003.
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
+-#ifndef _RELOCATABLE_H
+-#define _RELOCATABLE_H
+-
+-#ifdef __cplusplus
+-extern "C" {
+-#endif
+-
+-
+-/* This can be enabled through the configure --enable-relocatable option.  */
+-#if ENABLE_RELOCATABLE
+-
+-/* When building a DLL, we must export some functions.  Note that because
+-   this is a private .h file, we don't need to use __declspec(dllimport)
+-   in any case.  */
+-#if defined _MSC_VER && BUILDING_DLL
+-# define RELOCATABLE_DLL_EXPORTED __declspec(dllexport)
+-#else
+-# define RELOCATABLE_DLL_EXPORTED
+-#endif
+-
+-/* Sets the original and the current installation prefix of the package.
+-   Relocation simply replaces a pathname starting with the original prefix
+-   by the corresponding pathname with the current prefix instead.  Both
+-   prefixes should be directory names without trailing slash (i.e. use ""
+-   instead of "/").  */
+-extern RELOCATABLE_DLL_EXPORTED void
+-       set_relocation_prefix (const char *orig_prefix,
+-			      const char *curr_prefix);
+-
+-/* Returns the pathname, relocated according to the current installation
+-   directory.  */
+-extern const char * relocate (const char *pathname);
+-
+-/* Memory management: relocate() leaks memory, because it has to construct
+-   a fresh pathname.  If this is a problem because your program calls
+-   relocate() frequently, think about caching the result.  */
+-
+-/* Convenience function:
+-   Computes the current installation prefix, based on the original
+-   installation prefix, the original installation directory of a particular
+-   file, and the current pathname of this file.  Returns NULL upon failure.  */
+-extern const char * compute_curr_prefix (const char *orig_installprefix,
+-					 const char *orig_installdir,
+-					 const char *curr_pathname);
+-
+-#else
+-
+-/* By default, we use the hardwired pathnames.  */
+-#define relocate(pathname) (pathname)
+-
+-#endif
+-
+-
+-#ifdef __cplusplus
+-}
+-#endif
+-
+-#endif /* _RELOCATABLE_H */
+--- a/intl/textdomain.c
++++ /dev/null
+@@ -1,141 +0,0 @@
+-/* Implementation of the textdomain(3) function.
+-   Copyright (C) 1995-1998, 2000-2003 Free Software Foundation, Inc.
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
+-# define _nl_default_default_domain libintl_nl_default_default_domain
+-# define _nl_current_default_domain libintl_nl_current_default_domain
+-#endif
+-
+-/* @@ end of prolog @@ */
+-
+-/* Name of the default text domain.  */
+-extern const char _nl_default_default_domain[] attribute_hidden;
+-
+-/* Default text domain in which entries for gettext(3) are to be found.  */
+-extern const char *_nl_current_default_domain attribute_hidden;
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
+-# define TEXTDOMAIN libintl_textdomain
+-#endif
+-
+-/* Lock variable to protect the global data in the gettext implementation.  */
+-__libc_rwlock_define (extern, _nl_state_lock attribute_hidden)
+-
+-/* Set the current default message catalog to DOMAINNAME.
+-   If DOMAINNAME is null, return the current default.
+-   If DOMAINNAME is "", reset to the default of "messages".  */
+-char *
+-TEXTDOMAIN (const char *domainname)
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
+--- a/intl/vasnprintf.c
++++ /dev/null
+@@ -1,902 +0,0 @@
+-/* vsprintf with automatic memory allocation.
+-   Copyright (C) 1999, 2002-2005 Free Software Foundation, Inc.
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
+-/* Tell glibc's <stdio.h> to provide a prototype for snprintf().
+-   This must come before <config.h> because <config.h> may include
+-   <features.h>, and once <features.h> has been included, it's too late.  */
+-#ifndef _GNU_SOURCE
+-# define _GNU_SOURCE    1
+-#endif
+-
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-#ifndef IN_LIBINTL
+-# include <alloca.h>
+-#endif
+-
+-/* Specification.  */
+-#if WIDE_CHAR_VERSION
+-# include "vasnwprintf.h"
+-#else
+-# include "vasnprintf.h"
+-#endif
+-
+-#include <stdio.h>	/* snprintf(), sprintf() */
+-#include <stdlib.h>	/* abort(), malloc(), realloc(), free() */
+-#include <string.h>	/* memcpy(), strlen() */
+-#include <errno.h>	/* errno */
+-#include <limits.h>	/* CHAR_BIT, INT_MAX */
+-#include <float.h>	/* DBL_MAX_EXP, LDBL_MAX_EXP */
+-#if WIDE_CHAR_VERSION
+-# include "wprintf-parse.h"
+-#else
+-# include "printf-parse.h"
+-#endif
+-
+-/* Checked size_t computations.  */
+-#include "xsize.h"
+-
+-/* Some systems, like OSF/1 4.0 and Woe32, don't have EOVERFLOW.  */
+-#ifndef EOVERFLOW
+-# define EOVERFLOW E2BIG
+-#endif
+-
+-#ifdef HAVE_WCHAR_T
+-# ifdef HAVE_WCSLEN
+-#  define local_wcslen wcslen
+-# else
+-   /* Solaris 2.5.1 has wcslen() in a separate library libw.so. To avoid
+-      a dependency towards this library, here is a local substitute.
+-      Define this substitute only once, even if this file is included
+-      twice in the same compilation unit.  */
+-#  ifndef local_wcslen_defined
+-#   define local_wcslen_defined 1
+-static size_t
+-local_wcslen (const wchar_t *s)
+-{
+-  const wchar_t *ptr;
+-
+-  for (ptr = s; *ptr != (wchar_t) 0; ptr++)
+-    ;
+-  return ptr - s;
+-}
+-#  endif
+-# endif
+-#endif
+-
+-#if WIDE_CHAR_VERSION
+-# define VASNPRINTF vasnwprintf
+-# define CHAR_T wchar_t
+-# define DIRECTIVE wchar_t_directive
+-# define DIRECTIVES wchar_t_directives
+-# define PRINTF_PARSE wprintf_parse
+-# define USE_SNPRINTF 1
+-# if HAVE_DECL__SNWPRINTF
+-   /* On Windows, the function swprintf() has a different signature than
+-      on Unix; we use the _snwprintf() function instead.  */
+-#  define SNPRINTF _snwprintf
+-# else
+-   /* Unix.  */
+-#  define SNPRINTF swprintf
+-# endif
+-#else
+-# define VASNPRINTF vasnprintf
+-# define CHAR_T char
+-# define DIRECTIVE char_directive
+-# define DIRECTIVES char_directives
+-# define PRINTF_PARSE printf_parse
+-# define USE_SNPRINTF (HAVE_DECL__SNPRINTF || HAVE_SNPRINTF)
+-# if HAVE_DECL__SNPRINTF
+-   /* Windows.  */
+-#  define SNPRINTF _snprintf
+-# else
+-   /* Unix.  */
+-#  define SNPRINTF snprintf
+-# endif
+-#endif
+-
+-CHAR_T *
+-VASNPRINTF (CHAR_T *resultbuf, size_t *lengthp, const CHAR_T *format, va_list args)
+-{
+-  DIRECTIVES d;
+-  arguments a;
+-
+-  if (PRINTF_PARSE (format, &d, &a) < 0)
+-    {
+-      errno = EINVAL;
+-      return NULL;
+-    }
+-
+-#define CLEANUP() \
+-  free (d.dir);								\
+-  if (a.arg)								\
+-    free (a.arg);
+-
+-  if (printf_fetchargs (args, &a) < 0)
+-    {
+-      CLEANUP ();
+-      errno = EINVAL;
+-      return NULL;
+-    }
+-
+-  {
+-    size_t buf_neededlength;
+-    CHAR_T *buf;
+-    CHAR_T *buf_malloced;
+-    const CHAR_T *cp;
+-    size_t i;
+-    DIRECTIVE *dp;
+-    /* Output string accumulator.  */
+-    CHAR_T *result;
+-    size_t allocated;
+-    size_t length;
+-
+-    /* Allocate a small buffer that will hold a directive passed to
+-       sprintf or snprintf.  */
+-    buf_neededlength =
+-      xsum4 (7, d.max_width_length, d.max_precision_length, 6);
+-#if HAVE_ALLOCA
+-    if (buf_neededlength < 4000 / sizeof (CHAR_T))
+-      {
+-	buf = (CHAR_T *) alloca (buf_neededlength * sizeof (CHAR_T));
+-	buf_malloced = NULL;
+-      }
+-    else
+-#endif
+-      {
+-	size_t buf_memsize = xtimes (buf_neededlength, sizeof (CHAR_T));
+-	if (size_overflow_p (buf_memsize))
+-	  goto out_of_memory_1;
+-	buf = (CHAR_T *) malloc (buf_memsize);
+-	if (buf == NULL)
+-	  goto out_of_memory_1;
+-	buf_malloced = buf;
+-      }
+-
+-    if (resultbuf != NULL)
+-      {
+-	result = resultbuf;
+-	allocated = *lengthp;
+-      }
+-    else
+-      {
+-	result = NULL;
+-	allocated = 0;
+-      }
+-    length = 0;
+-    /* Invariants:
+-       result is either == resultbuf or == NULL or malloc-allocated.
+-       If length > 0, then result != NULL.  */
+-
+-    /* Ensures that allocated >= needed.  Aborts through a jump to
+-       out_of_memory if needed is SIZE_MAX or otherwise too big.  */
+-#define ENSURE_ALLOCATION(needed) \
+-    if ((needed) > allocated)						     \
+-      {									     \
+-	size_t memory_size;						     \
+-	CHAR_T *memory;							     \
+-									     \
+-	allocated = (allocated > 0 ? xtimes (allocated, 2) : 12);	     \
+-	if ((needed) > allocated)					     \
+-	  allocated = (needed);						     \
+-	memory_size = xtimes (allocated, sizeof (CHAR_T));		     \
+-	if (size_overflow_p (memory_size))				     \
+-	  goto out_of_memory;						     \
+-	if (result == resultbuf || result == NULL)			     \
+-	  memory = (CHAR_T *) malloc (memory_size);			     \
+-	else								     \
+-	  memory = (CHAR_T *) realloc (result, memory_size);		     \
+-	if (memory == NULL)						     \
+-	  goto out_of_memory;						     \
+-	if (result == resultbuf && length > 0)				     \
+-	  memcpy (memory, result, length * sizeof (CHAR_T));		     \
+-	result = memory;						     \
+-      }
+-
+-    for (cp = format, i = 0, dp = &d.dir[0]; ; cp = dp->dir_end, i++, dp++)
+-      {
+-	if (cp != dp->dir_start)
+-	  {
+-	    size_t n = dp->dir_start - cp;
+-	    size_t augmented_length = xsum (length, n);
+-
+-	    ENSURE_ALLOCATION (augmented_length);
+-	    memcpy (result + length, cp, n * sizeof (CHAR_T));
+-	    length = augmented_length;
+-	  }
+-	if (i == d.count)
+-	  break;
+-
+-	/* Execute a single directive.  */
+-	if (dp->conversion == '%')
+-	  {
+-	    size_t augmented_length;
+-
+-	    if (!(dp->arg_index == ARG_NONE))
+-	      abort ();
+-	    augmented_length = xsum (length, 1);
+-	    ENSURE_ALLOCATION (augmented_length);
+-	    result[length] = '%';
+-	    length = augmented_length;
+-	  }
+-	else
+-	  {
+-	    if (!(dp->arg_index != ARG_NONE))
+-	      abort ();
+-
+-	    if (dp->conversion == 'n')
+-	      {
+-		switch (a.arg[dp->arg_index].type)
+-		  {
+-		  case TYPE_COUNT_SCHAR_POINTER:
+-		    *a.arg[dp->arg_index].a.a_count_schar_pointer = length;
+-		    break;
+-		  case TYPE_COUNT_SHORT_POINTER:
+-		    *a.arg[dp->arg_index].a.a_count_short_pointer = length;
+-		    break;
+-		  case TYPE_COUNT_INT_POINTER:
+-		    *a.arg[dp->arg_index].a.a_count_int_pointer = length;
+-		    break;
+-		  case TYPE_COUNT_LONGINT_POINTER:
+-		    *a.arg[dp->arg_index].a.a_count_longint_pointer = length;
+-		    break;
+-#ifdef HAVE_LONG_LONG
+-		  case TYPE_COUNT_LONGLONGINT_POINTER:
+-		    *a.arg[dp->arg_index].a.a_count_longlongint_pointer = length;
+-		    break;
+-#endif
+-		  default:
+-		    abort ();
+-		  }
+-	      }
+-	    else
+-	      {
+-		arg_type type = a.arg[dp->arg_index].type;
+-		CHAR_T *p;
+-		unsigned int prefix_count;
+-		int prefixes[2];
+-#if !USE_SNPRINTF
+-		size_t tmp_length;
+-		CHAR_T tmpbuf[700];
+-		CHAR_T *tmp;
+-
+-		/* Allocate a temporary buffer of sufficient size for calling
+-		   sprintf.  */
+-		{
+-		  size_t width;
+-		  size_t precision;
+-
+-		  width = 0;
+-		  if (dp->width_start != dp->width_end)
+-		    {
+-		      if (dp->width_arg_index != ARG_NONE)
+-			{
+-			  int arg;
+-
+-			  if (!(a.arg[dp->width_arg_index].type == TYPE_INT))
+-			    abort ();
+-			  arg = a.arg[dp->width_arg_index].a.a_int;
+-			  width = (arg < 0 ? (unsigned int) (-arg) : arg);
+-			}
+-		      else
+-			{
+-			  const CHAR_T *digitp = dp->width_start;
+-
+-			  do
+-			    width = xsum (xtimes (width, 10), *digitp++ - '0');
+-			  while (digitp != dp->width_end);
+-			}
+-		    }
+-
+-		  precision = 6;
+-		  if (dp->precision_start != dp->precision_end)
+-		    {
+-		      if (dp->precision_arg_index != ARG_NONE)
+-			{
+-			  int arg;
+-
+-			  if (!(a.arg[dp->precision_arg_index].type == TYPE_INT))
+-			    abort ();
+-			  arg = a.arg[dp->precision_arg_index].a.a_int;
+-			  precision = (arg < 0 ? 0 : arg);
+-			}
+-		      else
+-			{
+-			  const CHAR_T *digitp = dp->precision_start + 1;
+-
+-			  precision = 0;
+-			  while (digitp != dp->precision_end)
+-			    precision = xsum (xtimes (precision, 10), *digitp++ - '0');
+-			}
+-		    }
+-
+-		  switch (dp->conversion)
+-		    {
+-
+-		    case 'd': case 'i': case 'u':
+-# ifdef HAVE_LONG_LONG
+-		      if (type == TYPE_LONGLONGINT || type == TYPE_ULONGLONGINT)
+-			tmp_length =
+-			  (unsigned int) (sizeof (unsigned long long) * CHAR_BIT
+-					  * 0.30103 /* binary -> decimal */
+-					  * 2 /* estimate for FLAG_GROUP */
+-					 )
+-			  + 1 /* turn floor into ceil */
+-			  + 1; /* account for leading sign */
+-		      else
+-# endif
+-		      if (type == TYPE_LONGINT || type == TYPE_ULONGINT)
+-			tmp_length =
+-			  (unsigned int) (sizeof (unsigned long) * CHAR_BIT
+-					  * 0.30103 /* binary -> decimal */
+-					  * 2 /* estimate for FLAG_GROUP */
+-					 )
+-			  + 1 /* turn floor into ceil */
+-			  + 1; /* account for leading sign */
+-		      else
+-			tmp_length =
+-			  (unsigned int) (sizeof (unsigned int) * CHAR_BIT
+-					  * 0.30103 /* binary -> decimal */
+-					  * 2 /* estimate for FLAG_GROUP */
+-					 )
+-			  + 1 /* turn floor into ceil */
+-			  + 1; /* account for leading sign */
+-		      break;
+-
+-		    case 'o':
+-# ifdef HAVE_LONG_LONG
+-		      if (type == TYPE_LONGLONGINT || type == TYPE_ULONGLONGINT)
+-			tmp_length =
+-			  (unsigned int) (sizeof (unsigned long long) * CHAR_BIT
+-					  * 0.333334 /* binary -> octal */
+-					 )
+-			  + 1 /* turn floor into ceil */
+-			  + 1; /* account for leading sign */
+-		      else
+-# endif
+-		      if (type == TYPE_LONGINT || type == TYPE_ULONGINT)
+-			tmp_length =
+-			  (unsigned int) (sizeof (unsigned long) * CHAR_BIT
+-					  * 0.333334 /* binary -> octal */
+-					 )
+-			  + 1 /* turn floor into ceil */
+-			  + 1; /* account for leading sign */
+-		      else
+-			tmp_length =
+-			  (unsigned int) (sizeof (unsigned int) * CHAR_BIT
+-					  * 0.333334 /* binary -> octal */
+-					 )
+-			  + 1 /* turn floor into ceil */
+-			  + 1; /* account for leading sign */
+-		      break;
+-
+-		    case 'x': case 'X':
+-# ifdef HAVE_LONG_LONG
+-		      if (type == TYPE_LONGLONGINT || type == TYPE_ULONGLONGINT)
+-			tmp_length =
+-			  (unsigned int) (sizeof (unsigned long long) * CHAR_BIT
+-					  * 0.25 /* binary -> hexadecimal */
+-					 )
+-			  + 1 /* turn floor into ceil */
+-			  + 2; /* account for leading sign or alternate form */
+-		      else
+-# endif
+-		      if (type == TYPE_LONGINT || type == TYPE_ULONGINT)
+-			tmp_length =
+-			  (unsigned int) (sizeof (unsigned long) * CHAR_BIT
+-					  * 0.25 /* binary -> hexadecimal */
+-					 )
+-			  + 1 /* turn floor into ceil */
+-			  + 2; /* account for leading sign or alternate form */
+-		      else
+-			tmp_length =
+-			  (unsigned int) (sizeof (unsigned int) * CHAR_BIT
+-					  * 0.25 /* binary -> hexadecimal */
+-					 )
+-			  + 1 /* turn floor into ceil */
+-			  + 2; /* account for leading sign or alternate form */
+-		      break;
+-
+-		    case 'f': case 'F':
+-# ifdef HAVE_LONG_DOUBLE
+-		      if (type == TYPE_LONGDOUBLE)
+-			tmp_length =
+-			  (unsigned int) (LDBL_MAX_EXP
+-					  * 0.30103 /* binary -> decimal */
+-					  * 2 /* estimate for FLAG_GROUP */
+-					 )
+-			  + 1 /* turn floor into ceil */
+-			  + 10; /* sign, decimal point etc. */
+-		      else
+-# endif
+-			tmp_length =
+-			  (unsigned int) (DBL_MAX_EXP
+-					  * 0.30103 /* binary -> decimal */
+-					  * 2 /* estimate for FLAG_GROUP */
+-					 )
+-			  + 1 /* turn floor into ceil */
+-			  + 10; /* sign, decimal point etc. */
+-		      tmp_length = xsum (tmp_length, precision);
+-		      break;
+-
+-		    case 'e': case 'E': case 'g': case 'G':
+-		    case 'a': case 'A':
+-		      tmp_length =
+-			12; /* sign, decimal point, exponent etc. */
+-		      tmp_length = xsum (tmp_length, precision);
+-		      break;
+-
+-		    case 'c':
+-# if defined HAVE_WINT_T && !WIDE_CHAR_VERSION
+-		      if (type == TYPE_WIDE_CHAR)
+-			tmp_length = MB_CUR_MAX;
+-		      else
+-# endif
+-			tmp_length = 1;
+-		      break;
+-
+-		    case 's':
+-# ifdef HAVE_WCHAR_T
+-		      if (type == TYPE_WIDE_STRING)
+-			{
+-			  tmp_length =
+-			    local_wcslen (a.arg[dp->arg_index].a.a_wide_string);
+-
+-#  if !WIDE_CHAR_VERSION
+-			  tmp_length = xtimes (tmp_length, MB_CUR_MAX);
+-#  endif
+-			}
+-		      else
+-# endif
+-			tmp_length = strlen (a.arg[dp->arg_index].a.a_string);
+-		      break;
+-
+-		    case 'p':
+-		      tmp_length =
+-			(unsigned int) (sizeof (void *) * CHAR_BIT
+-					* 0.25 /* binary -> hexadecimal */
+-				       )
+-			  + 1 /* turn floor into ceil */
+-			  + 2; /* account for leading 0x */
+-		      break;
+-
+-		    default:
+-		      abort ();
+-		    }
+-
+-		  if (tmp_length < width)
+-		    tmp_length = width;
+-
+-		  tmp_length = xsum (tmp_length, 1); /* account for trailing NUL */
+-		}
+-
+-		if (tmp_length <= sizeof (tmpbuf) / sizeof (CHAR_T))
+-		  tmp = tmpbuf;
+-		else
+-		  {
+-		    size_t tmp_memsize = xtimes (tmp_length, sizeof (CHAR_T));
+-
+-		    if (size_overflow_p (tmp_memsize))
+-		      /* Overflow, would lead to out of memory.  */
+-		      goto out_of_memory;
+-		    tmp = (CHAR_T *) malloc (tmp_memsize);
+-		    if (tmp == NULL)
+-		      /* Out of memory.  */
+-		      goto out_of_memory;
+-		  }
+-#endif
+-
+-		/* Construct the format string for calling snprintf or
+-		   sprintf.  */
+-		p = buf;
+-		*p++ = '%';
+-		if (dp->flags & FLAG_GROUP)
+-		  *p++ = '\'';
+-		if (dp->flags & FLAG_LEFT)
+-		  *p++ = '-';
+-		if (dp->flags & FLAG_SHOWSIGN)
+-		  *p++ = '+';
+-		if (dp->flags & FLAG_SPACE)
+-		  *p++ = ' ';
+-		if (dp->flags & FLAG_ALT)
+-		  *p++ = '#';
+-		if (dp->flags & FLAG_ZERO)
+-		  *p++ = '0';
+-		if (dp->width_start != dp->width_end)
+-		  {
+-		    size_t n = dp->width_end - dp->width_start;
+-		    memcpy (p, dp->width_start, n * sizeof (CHAR_T));
+-		    p += n;
+-		  }
+-		if (dp->precision_start != dp->precision_end)
+-		  {
+-		    size_t n = dp->precision_end - dp->precision_start;
+-		    memcpy (p, dp->precision_start, n * sizeof (CHAR_T));
+-		    p += n;
+-		  }
+-
+-		switch (type)
+-		  {
+-#ifdef HAVE_LONG_LONG
+-		  case TYPE_LONGLONGINT:
+-		  case TYPE_ULONGLONGINT:
+-		    *p++ = 'l';
+-		    /*FALLTHROUGH*/
+-#endif
+-		  case TYPE_LONGINT:
+-		  case TYPE_ULONGINT:
+-#ifdef HAVE_WINT_T
+-		  case TYPE_WIDE_CHAR:
+-#endif
+-#ifdef HAVE_WCHAR_T
+-		  case TYPE_WIDE_STRING:
+-#endif
+-		    *p++ = 'l';
+-		    break;
+-#ifdef HAVE_LONG_DOUBLE
+-		  case TYPE_LONGDOUBLE:
+-		    *p++ = 'L';
+-		    break;
+-#endif
+-		  default:
+-		    break;
+-		  }
+-		*p = dp->conversion;
+-#if USE_SNPRINTF
+-		p[1] = '%';
+-		p[2] = 'n';
+-		p[3] = '\0';
+-#else
+-		p[1] = '\0';
+-#endif
+-
+-		/* Construct the arguments for calling snprintf or sprintf.  */
+-		prefix_count = 0;
+-		if (dp->width_arg_index != ARG_NONE)
+-		  {
+-		    if (!(a.arg[dp->width_arg_index].type == TYPE_INT))
+-		      abort ();
+-		    prefixes[prefix_count++] = a.arg[dp->width_arg_index].a.a_int;
+-		  }
+-		if (dp->precision_arg_index != ARG_NONE)
+-		  {
+-		    if (!(a.arg[dp->precision_arg_index].type == TYPE_INT))
+-		      abort ();
+-		    prefixes[prefix_count++] = a.arg[dp->precision_arg_index].a.a_int;
+-		  }
+-
+-#if USE_SNPRINTF
+-		/* Prepare checking whether snprintf returns the count
+-		   via %n.  */
+-		ENSURE_ALLOCATION (xsum (length, 1));
+-		result[length] = '\0';
+-#endif
+-
+-		for (;;)
+-		  {
+-		    size_t maxlen;
+-		    int count;
+-		    int retcount;
+-
+-		    maxlen = allocated - length;
+-		    count = -1;
+-		    retcount = 0;
+-
+-#if USE_SNPRINTF
+-# define SNPRINTF_BUF(arg) \
+-		    switch (prefix_count)				    \
+-		      {							    \
+-		      case 0:						    \
+-			retcount = SNPRINTF (result + length, maxlen, buf,  \
+-					     arg, &count);		    \
+-			break;						    \
+-		      case 1:						    \
+-			retcount = SNPRINTF (result + length, maxlen, buf,  \
+-					     prefixes[0], arg, &count);	    \
+-			break;						    \
+-		      case 2:						    \
+-			retcount = SNPRINTF (result + length, maxlen, buf,  \
+-					     prefixes[0], prefixes[1], arg, \
+-					     &count);			    \
+-			break;						    \
+-		      default:						    \
+-			abort ();					    \
+-		      }
+-#else
+-# define SNPRINTF_BUF(arg) \
+-		    switch (prefix_count)				    \
+-		      {							    \
+-		      case 0:						    \
+-			count = sprintf (tmp, buf, arg);		    \
+-			break;						    \
+-		      case 1:						    \
+-			count = sprintf (tmp, buf, prefixes[0], arg);	    \
+-			break;						    \
+-		      case 2:						    \
+-			count = sprintf (tmp, buf, prefixes[0], prefixes[1],\
+-					 arg);				    \
+-			break;						    \
+-		      default:						    \
+-			abort ();					    \
+-		      }
+-#endif
+-
+-		    switch (type)
+-		      {
+-		      case TYPE_SCHAR:
+-			{
+-			  int arg = a.arg[dp->arg_index].a.a_schar;
+-			  SNPRINTF_BUF (arg);
+-			}
+-			break;
+-		      case TYPE_UCHAR:
+-			{
+-			  unsigned int arg = a.arg[dp->arg_index].a.a_uchar;
+-			  SNPRINTF_BUF (arg);
+-			}
+-			break;
+-		      case TYPE_SHORT:
+-			{
+-			  int arg = a.arg[dp->arg_index].a.a_short;
+-			  SNPRINTF_BUF (arg);
+-			}
+-			break;
+-		      case TYPE_USHORT:
+-			{
+-			  unsigned int arg = a.arg[dp->arg_index].a.a_ushort;
+-			  SNPRINTF_BUF (arg);
+-			}
+-			break;
+-		      case TYPE_INT:
+-			{
+-			  int arg = a.arg[dp->arg_index].a.a_int;
+-			  SNPRINTF_BUF (arg);
+-			}
+-			break;
+-		      case TYPE_UINT:
+-			{
+-			  unsigned int arg = a.arg[dp->arg_index].a.a_uint;
+-			  SNPRINTF_BUF (arg);
+-			}
+-			break;
+-		      case TYPE_LONGINT:
+-			{
+-			  long int arg = a.arg[dp->arg_index].a.a_longint;
+-			  SNPRINTF_BUF (arg);
+-			}
+-			break;
+-		      case TYPE_ULONGINT:
+-			{
+-			  unsigned long int arg = a.arg[dp->arg_index].a.a_ulongint;
+-			  SNPRINTF_BUF (arg);
+-			}
+-			break;
+-#ifdef HAVE_LONG_LONG
+-		      case TYPE_LONGLONGINT:
+-			{
+-			  long long int arg = a.arg[dp->arg_index].a.a_longlongint;
+-			  SNPRINTF_BUF (arg);
+-			}
+-			break;
+-		      case TYPE_ULONGLONGINT:
+-			{
+-			  unsigned long long int arg = a.arg[dp->arg_index].a.a_ulonglongint;
+-			  SNPRINTF_BUF (arg);
+-			}
+-			break;
+-#endif
+-		      case TYPE_DOUBLE:
+-			{
+-			  double arg = a.arg[dp->arg_index].a.a_double;
+-			  SNPRINTF_BUF (arg);
+-			}
+-			break;
+-#ifdef HAVE_LONG_DOUBLE
+-		      case TYPE_LONGDOUBLE:
+-			{
+-			  long double arg = a.arg[dp->arg_index].a.a_longdouble;
+-			  SNPRINTF_BUF (arg);
+-			}
+-			break;
+-#endif
+-		      case TYPE_CHAR:
+-			{
+-			  int arg = a.arg[dp->arg_index].a.a_char;
+-			  SNPRINTF_BUF (arg);
+-			}
+-			break;
+-#ifdef HAVE_WINT_T
+-		      case TYPE_WIDE_CHAR:
+-			{
+-			  wint_t arg = a.arg[dp->arg_index].a.a_wide_char;
+-			  SNPRINTF_BUF (arg);
+-			}
+-			break;
+-#endif
+-		      case TYPE_STRING:
+-			{
+-			  const char *arg = a.arg[dp->arg_index].a.a_string;
+-			  SNPRINTF_BUF (arg);
+-			}
+-			break;
+-#ifdef HAVE_WCHAR_T
+-		      case TYPE_WIDE_STRING:
+-			{
+-			  const wchar_t *arg = a.arg[dp->arg_index].a.a_wide_string;
+-			  SNPRINTF_BUF (arg);
+-			}
+-			break;
+-#endif
+-		      case TYPE_POINTER:
+-			{
+-			  void *arg = a.arg[dp->arg_index].a.a_pointer;
+-			  SNPRINTF_BUF (arg);
+-			}
+-			break;
+-		      default:
+-			abort ();
+-		      }
+-
+-#if USE_SNPRINTF
+-		    /* Portability: Not all implementations of snprintf()
+-		       are ISO C 99 compliant.  Determine the number of
+-		       bytes that snprintf() has produced or would have
+-		       produced.  */
+-		    if (count >= 0)
+-		      {
+-			/* Verify that snprintf() has NUL-terminated its
+-			   result.  */
+-			if (count < maxlen && result[length + count] != '\0')
+-			  abort ();
+-			/* Portability hack.  */
+-			if (retcount > count)
+-			  count = retcount;
+-		      }
+-		    else
+-		      {
+-			/* snprintf() doesn't understand the '%n'
+-			   directive.  */
+-			if (p[1] != '\0')
+-			  {
+-			    /* Don't use the '%n' directive; instead, look
+-			       at the snprintf() return value.  */
+-			    p[1] = '\0';
+-			    continue;
+-			  }
+-			else
+-			  {
+-			    /* Look at the snprintf() return value.  */
+-			    if (retcount < 0)
+-			      {
+-				/* HP-UX 10.20 snprintf() is doubly deficient:
+-				   It doesn't understand the '%n' directive,
+-				   *and* it returns -1 (rather than the length
+-				   that would have been required) when the
+-				   buffer is too small.  */
+-				size_t bigger_need =
+-				  xsum (xtimes (allocated, 2), 12);
+-				ENSURE_ALLOCATION (bigger_need);
+-				continue;
+-			      }
+-			    else
+-			      count = retcount;
+-			  }
+-		      }
+-#endif
+-
+-		    /* Attempt to handle failure.  */
+-		    if (count < 0)
+-		      {
+-			if (!(result == resultbuf || result == NULL))
+-			  free (result);
+-			if (buf_malloced != NULL)
+-			  free (buf_malloced);
+-			CLEANUP ();
+-			errno = EINVAL;
+-			return NULL;
+-		      }
+-
+-#if !USE_SNPRINTF
+-		    if (count >= tmp_length)
+-		      /* tmp_length was incorrectly calculated - fix the
+-			 code above!  */
+-		      abort ();
+-#endif
+-
+-		    /* Make room for the result.  */
+-		    if (count >= maxlen)
+-		      {
+-			/* Need at least count bytes.  But allocate
+-			   proportionally, to avoid looping eternally if
+-			   snprintf() reports a too small count.  */
+-			size_t n =
+-			  xmax (xsum (length, count), xtimes (allocated, 2));
+-
+-			ENSURE_ALLOCATION (n);
+-#if USE_SNPRINTF
+-			continue;
+-#endif
+-		      }
+-
+-#if USE_SNPRINTF
+-		    /* The snprintf() result did fit.  */
+-#else
+-		    /* Append the sprintf() result.  */
+-		    memcpy (result + length, tmp, count * sizeof (CHAR_T));
+-		    if (tmp != tmpbuf)
+-		      free (tmp);
+-#endif
+-
+-		    length += count;
+-		    break;
+-		  }
+-	      }
+-	  }
+-      }
+-
+-    /* Add the final NUL.  */
+-    ENSURE_ALLOCATION (xsum (length, 1));
+-    result[length] = '\0';
+-
+-    if (result != resultbuf && length + 1 < allocated)
+-      {
+-	/* Shrink the allocated memory if possible.  */
+-	CHAR_T *memory;
+-
+-	memory = (CHAR_T *) realloc (result, (length + 1) * sizeof (CHAR_T));
+-	if (memory != NULL)
+-	  result = memory;
+-      }
+-
+-    if (buf_malloced != NULL)
+-      free (buf_malloced);
+-    CLEANUP ();
+-    *lengthp = length;
+-    if (length > INT_MAX)
+-      goto length_overflow;
+-    return result;
+-
+-  length_overflow:
+-    /* We could produce such a big string, but its length doesn't fit into
+-       an 'int'.  POSIX says that snprintf() fails with errno = EOVERFLOW in
+-       this case.  */
+-    if (result != resultbuf)
+-      free (result);
+-    errno = EOVERFLOW;
+-    return NULL;
+-
+-  out_of_memory:
+-    if (!(result == resultbuf || result == NULL))
+-      free (result);
+-    if (buf_malloced != NULL)
+-      free (buf_malloced);
+-  out_of_memory_1:
+-    CLEANUP ();
+-    errno = ENOMEM;
+-    return NULL;
+-  }
+-}
+-
+-#undef SNPRINTF
+-#undef USE_SNPRINTF
+-#undef PRINTF_PARSE
+-#undef DIRECTIVES
+-#undef DIRECTIVE
+-#undef CHAR_T
+-#undef VASNPRINTF
+--- a/intl/vasnprintf.h
++++ /dev/null
+@@ -1,78 +0,0 @@
+-/* vsprintf with automatic memory allocation.
+-   Copyright (C) 2002-2004 Free Software Foundation, Inc.
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
+-#ifndef _VASNPRINTF_H
+-#define _VASNPRINTF_H
+-
+-/* Get va_list.  */
+-#include <stdarg.h>
+-
+-/* Get size_t.  */
+-#include <stddef.h>
+-
+-#ifndef __attribute__
+-/* This feature is available in gcc versions 2.5 and later.  */
+-# if __GNUC__ < 2 || (__GNUC__ == 2 && __GNUC_MINOR__ < 5) || __STRICT_ANSI__
+-#  define __attribute__(Spec) /* empty */
+-# endif
+-/* The __-protected variants of `format' and `printf' attributes
+-   are accepted by gcc versions 2.6.4 (effectively 2.7) and later.  */
+-# if __GNUC__ < 2 || (__GNUC__ == 2 && __GNUC_MINOR__ < 7)
+-#  define __format__ format
+-#  define __printf__ printf
+-# endif
+-#endif
+-
+-#ifdef	__cplusplus
+-extern "C" {
+-#endif
+-
+-/* Write formatted output to a string dynamically allocated with malloc().
+-   You can pass a preallocated buffer for the result in RESULTBUF and its
+-   size in *LENGTHP; otherwise you pass RESULTBUF = NULL.
+-   If successful, return the address of the string (this may be = RESULTBUF
+-   if no dynamic memory allocation was necessary) and set *LENGTHP to the
+-   number of resulting bytes, excluding the trailing NUL.  Upon error, set
+-   errno and return NULL.
+-
+-   When dynamic memory allocation occurs, the preallocated buffer is left
+-   alone (with possibly modified contents).  This makes it possible to use
+-   a statically allocated or stack-allocated buffer, like this:
+-
+-          char buf[100];
+-          size_t len = sizeof (buf);
+-          char *output = vasnprintf (buf, &len, format, args);
+-          if (output == NULL)
+-            ... error handling ...;
+-          else
+-            {
+-              ... use the output string ...;
+-              if (output != buf)
+-                free (output);
+-            }
+-  */
+-extern char * asnprintf (char *resultbuf, size_t *lengthp, const char *format, ...)
+-       __attribute__ ((__format__ (__printf__, 3, 4)));
+-extern char * vasnprintf (char *resultbuf, size_t *lengthp, const char *format, va_list args)
+-       __attribute__ ((__format__ (__printf__, 3, 0)));
+-
+-#ifdef	__cplusplus
+-}
+-#endif
+-
+-#endif /* _VASNPRINTF_H */
+--- a/intl/vasnwprintf.h
++++ /dev/null
+@@ -1,46 +0,0 @@
+-/* vswprintf with automatic memory allocation.
+-   Copyright (C) 2002-2003 Free Software Foundation, Inc.
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
+-#ifndef _VASNWPRINTF_H
+-#define _VASNWPRINTF_H
+-
+-/* Get va_list.  */
+-#include <stdarg.h>
+-
+-/* Get wchar_t, size_t.  */
+-#include <stddef.h>
+-
+-#ifdef	__cplusplus
+-extern "C" {
+-#endif
+-
+-/* Write formatted output to a string dynamically allocated with malloc().
+-   You can pass a preallocated buffer for the result in RESULTBUF and its
+-   size in *LENGTHP; otherwise you pass RESULTBUF = NULL.
+-   If successful, return the address of the string (this may be = RESULTBUF
+-   if no dynamic memory allocation was necessary) and set *LENGTHP to the
+-   number of resulting bytes, excluding the trailing NUL.  Upon error, set
+-   errno and return NULL.  */
+-extern wchar_t * asnwprintf (wchar_t *resultbuf, size_t *lengthp, const wchar_t *format, ...);
+-extern wchar_t * vasnwprintf (wchar_t *resultbuf, size_t *lengthp, const wchar_t *format, va_list args);
+-
+-#ifdef	__cplusplus
+-}
+-#endif
+-
+-#endif /* _VASNWPRINTF_H */
+--- a/intl/wprintf-parse.h
++++ /dev/null
+@@ -1,75 +0,0 @@
+-/* Parse printf format string.
+-   Copyright (C) 1999, 2002-2003 Free Software Foundation, Inc.
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
+-#ifndef _WPRINTF_PARSE_H
+-#define _WPRINTF_PARSE_H
+-
+-#include "printf-args.h"
+-
+-
+-/* Flags */
+-#define FLAG_GROUP	 1	/* ' flag */
+-#define FLAG_LEFT	 2	/* - flag */
+-#define FLAG_SHOWSIGN	 4	/* + flag */
+-#define FLAG_SPACE	 8	/* space flag */
+-#define FLAG_ALT	16	/* # flag */
+-#define FLAG_ZERO	32
+-
+-/* arg_index value indicating that no argument is consumed.  */
+-#define ARG_NONE	(~(size_t)0)
+-
+-/* A parsed directive.  */
+-typedef struct
+-{
+-  const wchar_t* dir_start;
+-  const wchar_t* dir_end;
+-  int flags;
+-  const wchar_t* width_start;
+-  const wchar_t* width_end;
+-  size_t width_arg_index;
+-  const wchar_t* precision_start;
+-  const wchar_t* precision_end;
+-  size_t precision_arg_index;
+-  wchar_t conversion; /* d i o u x X f e E g G c s p n U % but not C S */
+-  size_t arg_index;
+-}
+-wchar_t_directive;
+-
+-/* A parsed format string.  */
+-typedef struct
+-{
+-  size_t count;
+-  wchar_t_directive *dir;
+-  size_t max_width_length;
+-  size_t max_precision_length;
+-}
+-wchar_t_directives;
+-
+-
+-/* Parses the format string.  Fills in the number N of directives, and fills
+-   in directives[0], ..., directives[N-1], and sets directives[N].dir_start
+-   to the end of the format string.  Also fills in the arg_type fields of the
+-   arguments and the needed count of arguments.  */
+-#ifdef STATIC
+-STATIC
+-#else
+-extern
+-#endif
+-int wprintf_parse (const wchar_t *format, wchar_t_directives *d, arguments *a);
+-
+-#endif /* _WPRINTF_PARSE_H */
+--- a/intl/xsize.h
++++ /dev/null
+@@ -1,109 +0,0 @@
+-/* xsize.h -- Checked size_t computations.
+-
+-   Copyright (C) 2003 Free Software Foundation, Inc.
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
+-#ifndef _XSIZE_H
+-#define _XSIZE_H
+-
+-/* Get size_t.  */
+-#include <stddef.h>
+-
+-/* Get SIZE_MAX.  */
+-#include <limits.h>
+-#if HAVE_STDINT_H
+-# include <stdint.h>
+-#endif
+-
+-/* The size of memory objects is often computed through expressions of
+-   type size_t. Example:
+-      void* p = malloc (header_size + n * element_size).
+-   These computations can lead to overflow.  When this happens, malloc()
+-   returns a piece of memory that is way too small, and the program then
+-   crashes while attempting to fill the memory.
+-   To avoid this, the functions and macros in this file check for overflow.
+-   The convention is that SIZE_MAX represents overflow.
+-   malloc (SIZE_MAX) is not guaranteed to fail -- think of a malloc
+-   implementation that uses mmap --, it's recommended to use size_overflow_p()
+-   or size_in_bounds_p() before invoking malloc().
+-   The example thus becomes:
+-      size_t size = xsum (header_size, xtimes (n, element_size));
+-      void *p = (size_in_bounds_p (size) ? malloc (size) : NULL);
+-*/
+-
+-/* Convert an arbitrary value >= 0 to type size_t.  */
+-#define xcast_size_t(N) \
+-  ((N) <= SIZE_MAX ? (size_t) (N) : SIZE_MAX)
+-
+-/* Sum of two sizes, with overflow check.  */
+-static inline size_t
+-#if __GNUC__ >= 3
+-__attribute__ ((__pure__))
+-#endif
+-xsum (size_t size1, size_t size2)
+-{
+-  size_t sum = size1 + size2;
+-  return (sum >= size1 ? sum : SIZE_MAX);
+-}
+-
+-/* Sum of three sizes, with overflow check.  */
+-static inline size_t
+-#if __GNUC__ >= 3
+-__attribute__ ((__pure__))
+-#endif
+-xsum3 (size_t size1, size_t size2, size_t size3)
+-{
+-  return xsum (xsum (size1, size2), size3);
+-}
+-
+-/* Sum of four sizes, with overflow check.  */
+-static inline size_t
+-#if __GNUC__ >= 3
+-__attribute__ ((__pure__))
+-#endif
+-xsum4 (size_t size1, size_t size2, size_t size3, size_t size4)
+-{
+-  return xsum (xsum (xsum (size1, size2), size3), size4);
+-}
+-
+-/* Maximum of two sizes, with overflow check.  */
+-static inline size_t
+-#if __GNUC__ >= 3
+-__attribute__ ((__pure__))
+-#endif
+-xmax (size_t size1, size_t size2)
+-{
+-  /* No explicit check is needed here, because for any n:
+-     max (SIZE_MAX, n) == SIZE_MAX and max (n, SIZE_MAX) == SIZE_MAX.  */
+-  return (size1 >= size2 ? size1 : size2);
+-}
+-
+-/* Multiplication of a count with an element size, with overflow check.
+-   The count must be >= 0 and the element size must be > 0.
+-   This is a macro, not an inline function, so that it works correctly even
+-   when N is of a wider tupe and N > SIZE_MAX.  */
+-#define xtimes(N, ELSIZE) \
+-  ((N) <= SIZE_MAX / (ELSIZE) ? (size_t) (N) * (ELSIZE) : SIZE_MAX)
+-
+-/* Check for overflow.  */
+-#define size_overflow_p(SIZE) \
+-  ((SIZE) == SIZE_MAX)
+-/* Check against overflow.  */
+-#define size_in_bounds_p(SIZE) \
+-  ((SIZE) != SIZE_MAX)
+-
+-#endif /* _XSIZE_H */
diff --git a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
index 4a871bf4f4..d5da2b688a 100644
--- a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
+++ b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
@@ -9,6 +9,7 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/hddtemp/hddtemp-0.3-beta15.tar.bz2 \
            file://hddtemp_0.3-beta15-52.diff \
            file://hddtemp-0.3-beta15-autodetect-717479.patch \
            file://0001-backtrace-Replace-struct-ucontext-with-ucontext_t.patch \
+           file://0001-configure.ac-Rename-to-configure.ac-and-use-external.patch \
            file://hddtemp.db \
            file://init \
 "
-- 
2.24.1


