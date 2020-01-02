Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id CA9C37FBFA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 17:47:49 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id az3so18058553plb.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 09:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=yfDzZgJNcCv7HWtWHB0XlBenwXmMKmf5CmGvcyslUmY=;
	b=N0lCg989HQzNfAMjzwEvgoM6BxiaFdSawpd6iOtOdxpwFBDTcPjG1e0bnkGf0AZNj+
	I+uP3eF5fxLJMgLM34ZCtnwotRnKZrsEGPp71nYhqRB/fbw1IMCg4bdikZgCNxS7tnSq
	OW95Nvq11eNi3QBBaqTf9KPw4dju5sDJ32MrnX46IFVKS/YiW0shVH31S+FrBdZu/9Ps
	YEp7RTI5oTyK46RiuxWyNxGTDN5d8rrkkK5eV8tM8BdO3eQR2D+k0c3GG/L9VJCe6vGO
	SN0LjlYfPLAC1lMIrr96tP9OYjEsRVWJJKc1FQPQ/fl5pqtVDiHYAgbiCVrXQcBUbjg3
	Q92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yfDzZgJNcCv7HWtWHB0XlBenwXmMKmf5CmGvcyslUmY=;
	b=Pacip/eJVW2/8LWyHwTwID8l7+3USIAxY+Vxz8VoPcU9XAp7vgRkVFWW0LSvnkm0HC
	qMv4CaaoIyazccGrryt35nK1oJHrMFCIHz6rjTJdKFB+MoINiqbvCI0vm40zLItGK8y1
	gkF+5TT8o4zAu/ZnhxBcelcLJ6PbT+qmPMkubWeEcP+7NRNm/AVssb0BYlvhdhmn1o7B
	w+S+geVU4FRFPN3JDEniwR4FNP0eCNrZLbuwGrT/m/2hzZm+DCM6iKjkdQJ6b3NtIL5G
	0jKEXsRoCM0U6s1fFYvCfKJDQhH08PBhowu+rNnsicWD18JGYUXaose/KmLsVcWUNSNX
	D8vw==
X-Gm-Message-State: APjAAAXy0nlCGAxJvaxfc4WInR5VNExggv6jJMBP4mRCzBVdznxclB6a
	4oF5L+a0x3CZPVwCGiICcy2R21CMXMM=
X-Google-Smtp-Source: APXvYqykZpETX61Sw08FFfeXdTfpZMFQFeyOoxuAIDwADD3i8s4TC26sNOUoweVtRjC5r8scWvx1Ig==
X-Received: by 2002:a17:902:968b:: with SMTP id
	n11mr80229346plp.120.1577987270146; 
	Thu, 02 Jan 2020 09:47:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id
	l14sm58566815pgt.42.2020.01.02.09.47.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 09:47:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 09:47:41 -0800
Message-Id: <20200102174742.2228874-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200102174742.2228874-1-raj.khem@gmail.com>
References: <20200102174742.2228874-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 3/4] hddtemp: Fix build with latest gettext 0.20.x
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
X-List-Received-Date: Thu, 02 Jan 2020 17:47:49 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Do not remove intl/ directory

 ...ame-to-configure.ac-and-use-external.patch | 703 ++++++++++++++++++
 .../hddtemp/hddtemp_0.3-beta15.bb             |   1 +
 2 files changed, 704 insertions(+)
 create mode 100644 meta-oe/recipes-support/hddtemp/hddtemp/0001-configure.ac-Rename-to-configure.ac-and-use-external.patch

diff --git a/meta-oe/recipes-support/hddtemp/hddtemp/0001-configure.ac-Rename-to-configure.ac-and-use-external.patch b/meta-oe/recipes-support/hddtemp/hddtemp/0001-configure.ac-Rename-to-configure.ac-and-use-external.patch
new file mode 100644
index 0000000000..d2de0bbe61
--- /dev/null
+++ b/meta-oe/recipes-support/hddtemp/hddtemp/0001-configure.ac-Rename-to-configure.ac-and-use-external.patch
@@ -0,0 +1,703 @@
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


