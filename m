Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.50599.1585576463717987073
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2020 06:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=ymYyKjSy;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.66, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f66.google.com with SMTP id g62so22047867wme.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2020 06:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w5JsFjfMVlbcRQ0jR+LABoJtXeNI2Rzra0VeDCV6R8A=;
        b=ymYyKjSy8epp62vn4cLqccQEz3svNgrP2O2fdBdhlN9P8XBqT9PpSvtI4OZIUyXMMP
         9hl+jyXAO+U7THo7fY1fmUsYlj/L+14Z3zE4wBO4/YNUZ/pxQxmv50VlwtoRUcdHvqdQ
         3nOqqkxDMZ/P5MXN45to0wTSLTUsvBBOlEmGXIOlyT8zVFMY7Hz1DMfEv/iypyCQC+vc
         LJL8/88r+dIWi/uVo/9V8O6q2BlbjgjfCv85c3/Z9NbP/qSKSXre9aoHOhggXZF25qcC
         9Si8fwXe/Zby9QvTG6n3CdoyrgqaCShDLEtFY+7Y2lREgksg5ddp8zT0ZWGqYSsOFB3R
         a5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w5JsFjfMVlbcRQ0jR+LABoJtXeNI2Rzra0VeDCV6R8A=;
        b=M3QWtYXzf97xY2UCJAwgu6lCYE0Eg+j10BjsCeyKNYszoDBAQZBcNaQPB2pnHAAfoT
         N+7prJVy8kcXG4RXn8uFTsNQOj1rRZl14g06cRTmuktg7Svj0tqr29AmjsFdiO5Ms6zp
         T8tK7h2rUAAaa2NfANV2JDlqq+k2s3tSVdUEXmollSnrFBOH6+O2rLbhcSeE9SGqkp9H
         IactVg72/NP51LxsxJx/hm9S+69CEG0mdAZMdfHGUGNltSKBg4/bLmC6JpGXAc6PqHeC
         ZWpLmp7cE8iHWiM0YNuW4a/53dz6FVESzub3t7s7IOb7Ky6hr9vZuh/1CcSeMkRILJRx
         NCSA==
X-Gm-Message-State: ANhLgQ2igzoEtT+tUfAundFYn0uO4twiPvaCIlxJuTTIBUsiDJah/O3c
	5icahIfCLRnSc2/XwAVtTpd6Rg==
X-Google-Smtp-Source: ADFU+vuyQINUWszHhAH8J0EIxa0qiFfHiiHIbEGzS+gmv31s39E3JIabHOCim2SHktYyAKzGJo0bZg==
X-Received: by 2002:a1c:de87:: with SMTP id v129mr13392927wmg.68.1585576462110;
        Mon, 30 Mar 2020 06:54:22 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id g3sm23198357wrm.66.2020.03.30.06.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 06:54:21 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] figlet: new package
Date: Mon, 30 Mar 2020 15:54:18 +0200
Message-Id: <20200330135418.26140-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This adds a recipe for figlet - a utility for creating large characters
from regular console characters. It's useful to create custom banners at
run-time.

Include native and nativesdk support in case we want to create banners
at build-time.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 ...ols-support-to-allow-easy-cross-comp.patch | 252 ++++++++++++++++++
 meta-oe/recipes-extended/figlet/figlet_git.bb |  15 ++
 2 files changed, 267 insertions(+)
 create mode 100644 meta-oe/recipes-extended/figlet/figlet/0001-build-add-autotools-support-to-allow-easy-cross-comp.patch
 create mode 100644 meta-oe/recipes-extended/figlet/figlet_git.bb

diff --git a/meta-oe/recipes-extended/figlet/figlet/0001-build-add-autotools-support-to-allow-easy-cross-comp.patch b/meta-oe/recipes-extended/figlet/figlet/0001-build-add-autotools-support-to-allow-easy-cross-comp.patch
new file mode 100644
index 000000000..4429a474d
--- /dev/null
+++ b/meta-oe/recipes-extended/figlet/figlet/0001-build-add-autotools-support-to-allow-easy-cross-comp.patch
@@ -0,0 +1,252 @@
+From 902b022c03ad6769abe4d7e6fde1df7a883857ef Mon Sep 17 00:00:00 2001
+From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
+Date: Tue, 24 Mar 2020 14:44:54 +0100
+Subject: [PATCH] build: add autotools support to allow easy cross-compilation
+
+Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
+Upstream-Status: Inappropriate [upstream uses a custom Makefile and builds on
+                                linux as well as Windows. I'm not sure autotools
+                                would be preferred as a general solution but it
+                                works well enough for yocto.]
+---
+ Makefile     | 122 ---------------------------------------------------
+ Makefile.am  |  67 ++++++++++++++++++++++++++++
+ configure.ac |  23 ++++++++++
+ 3 files changed, 90 insertions(+), 122 deletions(-)
+ delete mode 100644 Makefile
+ create mode 100644 Makefile.am
+ create mode 100644 configure.ac
+
+diff --git a/Makefile b/Makefile
+deleted file mode 100644
+index e92bcaf..0000000
+--- a/Makefile
++++ /dev/null
+@@ -1,122 +0,0 @@
+-# Makefile for figlet version 2.2.4 (26 Jan 2011)
+-# adapted from Makefile for figlet version 2.2.2 (05 July 2005)
+-# adapted from Makefile for figlet version 2.2 (15 Oct 1996)
+-# Copyright 1993, 1994,1995 Glenn Chappell and Ian Chai
+-# Copyright 1996, 1997, 1998, 1999, 2000, 2001 John Cowan
+-# Copyright 2002 Christiaan Keet
+-# Copyright 2011 Claudio Matsuoka
+-
+-# Please notice that to follow modern standards and ease third-party
+-# package creation, binaries are now installed under BINDIR, and DESTDIR
+-# is reserved for the installation pathname prefix.
+-#
+-# Please make sure BINDIR, MANDIR, DEFAULTFONTDIR and
+-#   DEFAULTFONTFILE are defined to reflect the situation
+-#   on your computer.  See README for details.
+-
+-# Don't change this even if your shell is different. The only reason
+-# for changing this is if sh is not in the same place.
+-SHELL = /bin/sh
+-
+-# The C compiler and linker to use
+-CC	= gcc
+-CFLAGS	= -g -O2 -Wall -Wno-unused-value
+-LD	= gcc
+-LDFLAGS =
+-
+-# Feature flags:
+-#   define TLF_FONTS to use TOIlet TLF fonts
+-XCFLAGS	= -DTLF_FONTS
+-
+-# Where to install files
+-prefix	= /usr/local
+-
+-# Where the executables should be put
+-BINDIR	= $(prefix)/bin
+-
+-# Where the man page should be put
+-MANDIR	= $(prefix)/man
+-
+-# Where figlet will search first for fonts (the ".flf" files).
+-DEFAULTFONTDIR = $(prefix)/share/figlet
+-# Use this definition if you can't put things in $(prefix)/share/figlet
+-#DEFAULTFONTDIR = fonts
+-
+-# The filename of the font to be used if no other is specified,
+-#   without suffix.(standard is recommended, but any other can be
+-#   used). This font file should reside in the directory specified
+-#   by DEFAULTFONTDIR.
+-DEFAULTFONTFILE = standard
+-
+-##
+-##  END OF CONFIGURATION SECTION
+-##
+-
+-VERSION	= 2.2.5
+-DIST	= figlet-$(VERSION)
+-OBJS	= figlet.o zipio.o crc.o inflate.o utf8.o
+-BINS	= figlet chkfont figlist showfigfonts
+-MANUAL	= figlet.6 chkfont.6 figlist.6 showfigfonts.6
+-DFILES	= Makefile Makefile.tc $(MANUAL) $(OBJS:.o=.c) chkfont.c getopt.c \
+-	  figlist showfigfonts CHANGES FAQ README LICENSE figfont.txt \
+-	  crc.h inflate.h zipio.h utf8.h run-tests.sh figmagic
+-
+-.c.o:
+-	$(CC) -c $(CFLAGS) $(XCFLAGS) -DDEFAULTFONTDIR=\"$(DEFAULTFONTDIR)\" \
+-		-DDEFAULTFONTFILE=\"$(DEFAULTFONTFILE)\" -o $*.o $<
+-
+-all: $(BINS)
+-
+-figlet: $(OBJS)
+-	$(LD) $(LDFLAGS) -o $@ $(OBJS)
+-
+-chkfont: chkfont.o
+-	$(LD) $(LDFLAGS) -o $@ chkfont.o
+-
+-clean:
+-	rm -f *.o *~ core figlet chkfont
+-
+-install: all
+-	mkdir -p $(DESTDIR)$(BINDIR)
+-	mkdir -p $(DESTDIR)$(MANDIR)/man6
+-	mkdir -p $(DESTDIR)$(DEFAULTFONTDIR)
+-	cp $(BINS) $(DESTDIR)$(BINDIR)
+-	cp $(MANUAL) $(DESTDIR)$(MANDIR)/man6
+-	cp fonts/*.flf $(DESTDIR)$(DEFAULTFONTDIR)
+-	cp fonts/*.flc $(DESTDIR)$(DEFAULTFONTDIR)
+-
+-dist:
+-	rm -Rf $(DIST) $(DIST).tar.gz
+-	mkdir $(DIST)/
+-	cp $(DFILES) $(DIST)/
+-	mkdir $(DIST)/fonts
+-	cp fonts/*.fl[fc] $(DIST)/fonts
+-	mkdir $(DIST)/tests
+-	cp tests/*txt tests/emboss.tlf $(DIST)/tests
+-	tar cvf - $(DIST) | gzip -9c > $(DIST).tar.gz
+-	rm -Rf $(DIST)
+-	tar xf $(DIST).tar.gz
+-	(cd $(DIST); make all check vercheck)
+-	@rm -Rf $(DIST)
+-	@echo
+-	@ls -l $(DIST).tar.gz
+-
+-check:
+-	@echo "Run tests in `pwd`"
+-	@./run-tests.sh fonts
+-	@echo
+-
+-vercheck:
+-	@printf "Infocode: "; ./figlet -I1
+-	@./figlet -v|sed -n '/Version/s/.*\(Version\)/\1/p'
+-	@printf "README: "; head -1 < README|sed 's/.*) //'
+-	@printf "FAQ: "; grep latest FAQ|sed 's/ and can.*//'
+-	@grep -h "^\.TH" *.6
+-
+-$(OBJS) chkfont.o getopt.o: Makefile
+-chkfont.o: chkfont.c
+-crc.o: crc.c crc.h
+-figlet.o: figlet.c zipio.h
+-getopt.o: getopt.c
+-inflate.o: inflate.c inflate.h
+-zipio.o: zipio.c zipio.h inflate.h crc.h
+diff --git a/Makefile.am b/Makefile.am
+new file mode 100644
+index 0000000..7feb42c
+--- /dev/null
++++ b/Makefile.am
+@@ -0,0 +1,67 @@
++AM_CFLAGS = -include $(top_builddir)/config.h -Wall -Wextra -g
++
++bin_PROGRAMS = figlet chkfont
++dist_bin_SCRIPTS = figlist showfigfonts
++
++figlet_SOURCES = figlet.c zipio.c crc.c inflate.c utf8.c
++chkfont_SOURCES = chkfont.c
++
++fontdir = $(prefix)/share/figlet
++dist_font_DATA = \
++	fonts/646-ca2.flc \
++	fonts/646-fr.flc \
++	fonts/646-no.flc \
++	fonts/8859-4.flc \
++	fonts/bubble.flf \
++	fonts/lean.flf \
++	fonts/smscript.flf \
++	fonts/utf8.flc \
++	fonts/646-ca.flc \
++	fonts/646-gb.flc \
++	fonts/646-pt2.flc \
++	fonts/8859-5.flc \
++	fonts/digital.flf \
++	fonts/mini.flf \
++	fonts/smshadow.flf \
++	fonts/646-cn.flc \
++	fonts/646-hu.flc \
++	fonts/646-pt.flc \
++	fonts/8859-7.flc \
++	fonts/frango.flc \
++	fonts/mnemonic.flf \
++	fonts/smslant.flf \
++	fonts/646-cu.flc \
++	fonts/646-irv.flc \
++	fonts/646-se2.flc \
++	fonts/8859-8.flc \
++	fonts/hz.flc \
++	fonts/moscow.flc \
++	fonts/standard.flf \
++	fonts/646-de.flc \
++	fonts/646-it.flc \
++	fonts/646-se.flc \
++	fonts/8859-9.flc \
++	fonts/ilhebrew.flc \
++	fonts/script.flf \
++	fonts/term.flf \
++	fonts/646-dk.flc \
++	fonts/646-jp.flc \
++	fonts/646-yu.flc \
++	fonts/banner.flf \
++	fonts/ivrit.flf \
++	fonts/shadow.flf \
++	fonts/upper.flc \
++	fonts/646-es2.flc \
++	fonts/646-kr.flc \
++	fonts/8859-2.flc \
++	fonts/big.flf \
++	fonts/jis0201.flc \
++	fonts/slant.flf \
++	fonts/ushebrew.flc \
++	fonts/646-es.flc \
++	fonts/646-no2.flc \
++	fonts/8859-3.flc \
++	fonts/block.flf \
++	fonts/koi8r.flc \
++	fonts/small.flf \
++	fonts/uskata.flc
+diff --git a/configure.ac b/configure.ac
+new file mode 100644
+index 0000000..72154e2
+--- /dev/null
++++ b/configure.ac
+@@ -0,0 +1,23 @@
++AC_PREREQ(2.61)
++
++AC_INIT([figlet], 2.2.5)
++
++AC_CONFIG_AUX_DIR([autostuff])
++AC_CONFIG_MACRO_DIRS([m4])
++AM_INIT_AUTOMAKE([foreign subdir-objects])
++m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
++
++AC_CONFIG_SRCDIR([figlet.c])
++AC_CONFIG_HEADER([config.h])
++
++AC_DEFINE([DEFAULTFONTDIR], ["/usr/share/figlet"], [Default font directory])
++AC_DEFINE([DEFAULTFONTFILE], ["standard"], [Default font])
++
++AM_PROG_AR
++AC_PROG_CC
++AC_PROG_INSTALL
++AC_HEADER_STDC
++
++AC_CONFIG_FILES([Makefile])
++
++AC_OUTPUT
+-- 
+2.25.0
+
diff --git a/meta-oe/recipes-extended/figlet/figlet_git.bb b/meta-oe/recipes-extended/figlet/figlet_git.bb
new file mode 100644
index 000000000..4611646b9
--- /dev/null
+++ b/meta-oe/recipes-extended/figlet/figlet_git.bb
@@ -0,0 +1,15 @@
+SUMMARY = "FIGlet is a program that creates large characters out of ordinary screen characters"
+HOMEPAGE = "http://www.figlet.org/"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1688bcd97b27704f1afcac7336409857"
+
+SRC_URI = "git://github.com/cmatsuoka/figlet.git \
+           file://0001-build-add-autotools-support-to-allow-easy-cross-comp.patch"
+SRCREV = "5bbcd7383a8c3a531299b216b0c734e1495c6db3"
+S = "${WORKDIR}/git"
+PV = "2.2.5+git${SRCPV}"
+
+inherit autotools
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

