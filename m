Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743F9C433FE
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 08:08:28 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.16151.1647763707310460544
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EhoYQj7d;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id q11so10273337pln.11
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Gop99z4LcJLNjyBmzppxNym/1px0DN5Ja/5fAHTDQg=;
        b=EhoYQj7d2S/H5POIQ9woqOV5d++GpQpnB4uhWPXZUuUPsddbkgkEsWmSbHh/4UtMbm
         OAU4QQQfr2SM+r//HSfElxUzIfZXPnxoRe87Sh+FhRIVXexlnsM6M8wcJeR9hPmdXP/F
         WYn1+Rq4vrIsLFBFjECU/xEnxpamwKvipa5KOn9SY9vfycfijRN9Pqal51b0vtdNes96
         3M75nb+4bUCzAz9mzoNYokOEP44oM4Dkf6gJRKWJe+g5+kqrS5JxOGRZCel9xwRhmdul
         yOydD/EsGux9a/WxKh8Goz9W4Wuy/WlBmTPQLyP58vkmmRTFyvu+KFBKzdVEsSoyOhsJ
         //4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Gop99z4LcJLNjyBmzppxNym/1px0DN5Ja/5fAHTDQg=;
        b=kGUeV6AzUBiX13jmcpfm7RfqWsLT6LKEq3u4LVQIuSLjud0EFghIqb9fzPZox30/g2
         94TclymYHLhOV1va1AE0nPB1PK+bL52khl4gGNdiQ/NvrxPnqo3r2s1UiRYygVYZVa5Z
         r6dVJIEL3am72bS7ahMxPCtAsh9WC3g5R9d4LKzxuW8dK8Ke3WPz8HpYo4wef5Z3suAX
         KlYqsE/Bo54lFFiTdpCRv1N4llfGJwchzOxrf7FHGoi0dV2H+b+mCGDXgOvUvABxgPw6
         1p/kFT49VIxjJhT4925xk31gEp1ib99uS/2RN+E26Hqm0pH0aT3Irf7i8vNq45xBiHaX
         vgWQ==
X-Gm-Message-State: AOAM532yIWWy82p8UYuGx7ImIKQx42YX0UPCJ11gy/hsraoWKsEL44uP
	078nzrfEtHpdeQlVZGArZgJkp3KyOXIhwg==
X-Google-Smtp-Source: 
 ABdhPJyYdHHC9mh+yzHl8QSsTEYPAfQ6lOq66xUO5718ZAT7tGjLzHQfkOrt6wWnwBPqpeGX6wdObQ==
X-Received: by 2002:a17:90a:8405:b0:1bc:d521:b2c9 with SMTP id
 j5-20020a17090a840500b001bcd521b2c9mr30497795pjn.119.1647763706288;
        Sun, 20 Mar 2022 01:08:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 s6-20020a056a0008c600b004f667b8a6b6sm15607763pfu.193.2022.03.20.01.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 01:08:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 12/17] duktape: Upgrade to 2.7.0
Date: Sun, 20 Mar 2022 01:08:10 -0700
Message-Id: <20220320080815.825928-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320080815.825928-1-raj.khem@gmail.com>
References: <20220320080815.825928-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 08:08:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96076

License-Update: Update copyright years [1]
Drop upstreamed patch
Define LIBDIR so it can compile on all platforms

[1] https://github.com/svaarala/duktape/commit/d51a1ffae6b99b798db9ad1512f845d31ff63813

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{duktape_2.6.0.bb => duktape_2.7.0.bb}    |  11 +-
 .../0001-Support-makefile-variables.patch     | 297 ------------------
 2 files changed, 5 insertions(+), 303 deletions(-)
 rename meta-oe/recipes-extended/duktape/{duktape_2.6.0.bb => duktape_2.7.0.bb} (62%)
 delete mode 100644 meta-oe/recipes-extended/duktape/files/0001-Support-makefile-variables.patch

diff --git a/meta-oe/recipes-extended/duktape/duktape_2.6.0.bb b/meta-oe/recipes-extended/duktape/duktape_2.7.0.bb
similarity index 62%
rename from meta-oe/recipes-extended/duktape/duktape_2.6.0.bb
rename to meta-oe/recipes-extended/duktape/duktape_2.7.0.bb
index 95df28ef2b..be233764c9 100644
--- a/meta-oe/recipes-extended/duktape/duktape_2.6.0.bb
+++ b/meta-oe/recipes-extended/duktape/duktape_2.7.0.bb
@@ -2,13 +2,12 @@ SUMMARY = "Duktape embeddable Javascript engine"
 DESCRIPTION = "Duktape is an embeddable Javascript engine, with a focus on portability and compact footprint."
 HOMEPAGE = "https://duktape.org"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c83446610de1f63c7ca60cfcc82dec9d"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b7825df97b52f926fc71300f7880408"
 
-SRC_URI = "https://duktape.org/duktape-${PV}.tar.xz \
-           file://0001-Support-makefile-variables.patch \
-"
-SRC_URI[md5sum] = "01ee8ecf3dd5c6504543c8679661bb20"
-SRC_URI[sha256sum] = "96f4a05a6c84590e53b18c59bb776aaba80a205afbbd92b82be609ba7fe75fa7"
+SRC_URI = "https://duktape.org/duktape-${PV}.tar.xz"
+SRC_URI[sha256sum] = "90f8d2fa8b5567c6899830ddef2c03f3c27960b11aca222fa17aa7ac613c2890"
+
+EXTRA_OEMAKE = "INSTALL_PREFIX='${prefix}' DESTDIR='${D}' LIBDIR=${base_libdir}"
 
 do_compile () {
     oe_runmake -f Makefile.sharedlibrary INSTALL_PREFIX="${prefix}" DESTDIR="${D}"
diff --git a/meta-oe/recipes-extended/duktape/files/0001-Support-makefile-variables.patch b/meta-oe/recipes-extended/duktape/files/0001-Support-makefile-variables.patch
deleted file mode 100644
index f3fe40bc46..0000000000
--- a/meta-oe/recipes-extended/duktape/files/0001-Support-makefile-variables.patch
+++ /dev/null
@@ -1,297 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Luca Boccassi <luca.boccassi@microsoft.com>
-Date: Mon, 17 Jan 2022 18:12:03 +0000
-Subject: [PATCH] Support makefile variables
-
-Makefile*: use CFLAGS/CPPFLAGS/LDFLAGS
-Makefile*: allow compiler and install variables to be overridden
-Makefile.sharedlibrary: allow destdir and libdir to be overridden
-Makefile.sharedlibrary: generate pkg-config file
-
-Forwarded: https://github.com/svaarala/duktape/pull/2457
----
- Makefile.cmdline       |  5 ++--
- Makefile.codepage      |  5 ++--
- Makefile.dukdebug      |  5 ++--
- Makefile.eval          |  5 ++--
- Makefile.eventloop     |  5 ++--
- Makefile.hello         |  5 ++--
- Makefile.jsoncbor      |  5 ++--
- Makefile.jxpretty      |  5 ++--
- Makefile.sandbox       |  5 ++--
- Makefile.sharedlibrary | 48 ++++++++++++++++++++-----------
- duktape.pc.in          | 10 +++++++
- 11 files changed, 68 insertions(+), 35 deletions(-)
- create mode 100644 duktape.pc.in
-
-diff --git a/Makefile.cmdline b/Makefile.cmdline
-index 235566b8..0b020510 100644
---- a/Makefile.cmdline
-+++ b/Makefile.cmdline
-@@ -8,7 +8,8 @@ DUKTAPE_SOURCES = src/duktape.c
- CMDLINE_SOURCES = \
- 	examples/cmdline/duk_cmdline.c
- 
--CC = gcc
-+CC ?= gcc
-+CC := $(CC)
- CCOPTS = -Os -pedantic -std=c99 -Wall -fstrict-aliasing -fomit-frame-pointer
- CCOPTS += -I./examples/cmdline -I./src   # duktape.h and duk_config.h must be in include path
- CCLIBS = -lm
-@@ -40,7 +41,7 @@ CMDLINE_SOURCES += extras/module-duktape/duk_module_duktape.c
- # http://wiki.duktape.org/Configuring.html
- 
- duk: $(DUKTAPE_SOURCES) $(CMDLINE_SOURCES)
--	$(CC) -o $@ $(DEFINES) $(CCOPTS) $(DUKTAPE_SOURCES) $(CMDLINE_SOURCES) $(CCLIBS)
-+	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $(DEFINES) $(CCOPTS) $(DUKTAPE_SOURCES) $(CMDLINE_SOURCES) $(CCLIBS)
- 
- linenoise/linenoise.c: linenoise
- linenoise:
-diff --git a/Makefile.codepage b/Makefile.codepage
-index f6ef1582..29fa6ffc 100644
---- a/Makefile.codepage
-+++ b/Makefile.codepage
-@@ -1,6 +1,7 @@
--CC = gcc
-+CC ?= gcc
-+CC := $(CC)
- 
- codepage:
--	$(CC) -o $@ -std=c99 -O2 -Wall -Wextra -Isrc/ \
-+	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ -std=c99 -O2 -Wall -Wextra -Isrc/ \
- 		src/duktape.c examples/codepage-conv/duk_codepage_conv.c \
- 		examples/codepage-conv/test.c -lm
-diff --git a/Makefile.dukdebug b/Makefile.dukdebug
-index 9fafcc3f..aa289d2e 100644
---- a/Makefile.dukdebug
-+++ b/Makefile.dukdebug
-@@ -10,7 +10,8 @@ CMDLINE_SOURCES = \
- 	examples/cmdline/duk_cmdline.c \
- 	examples/debug-trans-socket/duk_trans_socket_unix.c
- 
--CC = gcc
-+CC ?= gcc
-+CC := $(CC)
- CCOPTS = -Os -pedantic -std=c99 -Wall -fstrict-aliasing -fomit-frame-pointer
- CCOPTS += -I./prep -I./examples/cmdline -I./examples/debug-trans-socket
- CCOPTS += -DDUK_CMDLINE_DEBUGGER_SUPPORT     # enable --debugger in ./duk
-@@ -38,4 +39,4 @@ duk: $(CMDLINE_SOURCES)
- 		-DDUK_USE_INTERRUPT_COUNTER \
- 		-DDUK_USE_DEBUGGER_DUMPHEAP \
- 		-DDUK_USE_DEBUGGER_INSPECT
--	$(CC) -o $@ $(DEFINES) $(CCOPTS) $(DUKTAPE_SOURCES) $(CMDLINE_SOURCES) $(CCLIBS)
-+	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $(DEFINES) $(CCOPTS) $(DUKTAPE_SOURCES) $(CMDLINE_SOURCES) $(CCLIBS)
-diff --git a/Makefile.eval b/Makefile.eval
-index 530f74a8..ce831a69 100644
---- a/Makefile.eval
-+++ b/Makefile.eval
-@@ -2,8 +2,9 @@
- #  Example Makefile for building the eval example
- #
- 
--CC = gcc
-+CC ?= gcc
-+CC := $(CC)
- 
- eval:
--	$(CC) -o $@ -std=c99 -O2 -Wall -Wextra -Isrc/ \
-+	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ -std=c99 -O2 -Wall -Wextra -Isrc/ \
- 		src/duktape.c examples/eval/eval.c -lm
-diff --git a/Makefile.eventloop b/Makefile.eventloop
-index 1a75587b..ab1b2f72 100644
---- a/Makefile.eventloop
-+++ b/Makefile.eventloop
-@@ -2,14 +2,15 @@
- #  Example Makefile for building the eventloop example
- #
- 
--CC = gcc
-+CC ?= gcc
-+CC := $(CC)
- 
- evloop:
- 	@echo "NOTE: The eventloop is an example intended to be used on Linux"
- 	@echo "      or other common UNIX variants.  It is not fully portable."
- 	@echo ""
- 
--	$(CC) -o $@ -std=c99 -Wall -Wextra -O2 -Isrc \
-+	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ -std=c99 -Wall -Wextra -O2 -Isrc \
- 		examples/eventloop/main.c \
- 		examples/eventloop/c_eventloop.c \
- 		examples/eventloop/poll.c \
-diff --git a/Makefile.hello b/Makefile.hello
-index c12b8e09..61269337 100644
---- a/Makefile.hello
-+++ b/Makefile.hello
-@@ -13,7 +13,8 @@ DUKTAPE_SOURCES = src/duktape.c
- # Compiler options are quite flexible.  GCC versions have a significant impact
- # on the size of -Os code, e.g. gcc-4.6 is much worse than gcc-4.5.
- 
--CC = gcc
-+CC ?= gcc
-+CC := $(CC)
- CCOPTS = -Os -pedantic -std=c99 -Wall -fstrict-aliasing -fomit-frame-pointer
- CCOPTS += -I./src  # for combined sources
- CCLIBS = -lm
-@@ -29,4 +30,4 @@ DEFINES =
- # For debugging, use -O0 -g -ggdb, and don't add -fomit-frame-pointer
- 
- hello: $(DUKTAPE_SOURCES) examples/hello/hello.c
--	$(CC) -o $@ $(DEFINES) $(CCOPTS) $(DUKTAPE_SOURCES) examples/hello/hello.c $(CCLIBS)
-+	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $(DEFINES) $(CCOPTS) $(DUKTAPE_SOURCES) examples/hello/hello.c $(CCLIBS)
-diff --git a/Makefile.jsoncbor b/Makefile.jsoncbor
-index 30387a2f..8f234004 100644
---- a/Makefile.jsoncbor
-+++ b/Makefile.jsoncbor
-@@ -2,9 +2,10 @@
- #  Example Makefile for building the jsoncbor example
- #
- 
--CC = gcc
-+CC ?= gcc
-+CC := $(CC)
- 
- jsoncbor:
--	$(CC) -o $@ -std=c99 -Wall -Wextra -O2 -Isrc -Iextras/cbor \
-+	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ -std=c99 -Wall -Wextra -O2 -Isrc -Iextras/cbor \
- 		src/duktape.c extras/cbor/duk_cbor.c extras/cbor/jsoncbor.c \
- 		-lm
-diff --git a/Makefile.jxpretty b/Makefile.jxpretty
-index 7ab00cec..aa53aa8b 100644
---- a/Makefile.jxpretty
-+++ b/Makefile.jxpretty
-@@ -2,9 +2,10 @@
- #  Example Makefile for building the jxpretty example
- #
- 
--CC = gcc
-+CC ?= gcc
-+CC := $(CC)
- 
- jxpretty:
--	$(CC) -o $@ -std=c99 -Wall -Wextra -O2 -Isrc \
-+	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ -std=c99 -Wall -Wextra -O2 -Isrc \
- 		src/duktape.c examples/jxpretty/jxpretty.c \
- 		-lm
-diff --git a/Makefile.sandbox b/Makefile.sandbox
-index 26bb5ffc..d1d69ce4 100644
---- a/Makefile.sandbox
-+++ b/Makefile.sandbox
-@@ -2,8 +2,9 @@
- #  Example Makefile for building the sandbox example
- #
- 
--CC = gcc
-+CC ?= gcc
-+CC := $(CC)
- 
- sandbox:
--	$(CC) -o $@ -std=c99 -O2 -Wall -Wextra -Isrc/ \
-+	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ -std=c99 -O2 -Wall -Wextra -Isrc/ \
- 		src/duktape.c examples/sandbox/sandbox.c -lm
-diff --git a/Makefile.sharedlibrary b/Makefile.sharedlibrary
-index ace206a1..11620aa7 100644
---- a/Makefile.sharedlibrary
-+++ b/Makefile.sharedlibrary
-@@ -24,7 +24,9 @@
- # convention is to set soname version to (100*MAJOR + MINOR), e.g. 104 for
- # Duktape 1.4.x, so that it gets automatically bumped for major and minor
- # releases (potentially binary incompatible), but not for patch releases.
-+# The formatted version is used for the pkg-config file.
- DUK_VERSION = 20600
-+DUK_VERSION_FORMATTED = 2.6.0
- SONAME_VERSION = 206
- REAL_VERSION = $(SONAME_VERSION).$(DUK_VERSION)
- 
-@@ -45,44 +45,58 @@ else
- endif
- 
- # Change to actual path for actual distribution packaging.
--INSTALL_PREFIX = /usr/local
-+INSTALL_PREFIX ?= /usr/local
-+INSTALL_PREFIX := $(INSTALL_PREFIX)
-+DESTDIR ?=
-+DESTDIR := $(DESTDIR)
-+LIBDIR ?= /lib
-+LIBDIR := $(LIBDIR)
- 
- # The 'noline' variant may be more appropriate for some distributions; it
- # doesn't have #line directives in the combined source.
- DUKTAPE_SRCDIR = ./src
- #DUKTAPE_SRCDIR = ./src-noline
- 
--CC = gcc
-+CC ?= gcc
-+CC := $(CC)
- 
- .PHONY: all
--all: libduktape.$(SO_REALNAME_SUFFIX) libduktaped.$(SO_REALNAME_SUFFIX)
-+all: libduktape.$(SO_REALNAME_SUFFIX) libduktaped.$(SO_REALNAME_SUFFIX) duktape.pc
- 
- # If the default duk_config.h is not suitable for the distribution, modify it
- # before compiling the shared library and copy the same, edited duk_config.h
- # to $INSTALL_PREFIX/include on installation.
- 
- libduktape.$(SO_REALNAME_SUFFIX):
--	$(CC) -shared -fPIC -Wall -Wextra -Os -Wl,$(LD_SONAME_ARG),libduktape.$(SO_SONAME_SUFFIX) \
-+	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -shared -fPIC -Wall -Wextra -Os -Wl,$(LD_SONAME_ARG),libduktape.$(SO_SONAME_SUFFIX) \
- 		-o $@ $(DUKTAPE_SRCDIR)/duktape.c
- 
- libduktaped.$(SO_REALNAME_SUFFIX):
--	$(CC) -shared -fPIC -g -Wall -Wextra -Os -Wl,$(LD_SONAME_ARG),libduktaped.$(SO_SONAME_SUFFIX) \
-+	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -shared -fPIC -g -Wall -Wextra -Os -Wl,$(LD_SONAME_ARG),libduktaped.$(SO_SONAME_SUFFIX) \
- 		-o $@ $(DUKTAPE_SRCDIR)/duktape.c
- 
-+duktape.pc:
-+	sed -e "s|@PREFIX@|$(INSTALL_PREFIX)|" \
-+		-e "s|@LIBDIR@|$(LIBDIR)|" \
-+		-e "s|@VERSION@|$(DUK_VERSION_FORMATTED)|" \
-+		duktape.pc.in \
-+		> duktape.pc
-+
- # Symlinks depend on platform conventions.
- .PHONY: install
--install: libduktape.$(SO_REALNAME_SUFFIX) libduktaped.$(SO_REALNAME_SUFFIX)
--	mkdir -p $(INSTALL_PREFIX)/lib/
--	cp $+ $(INSTALL_PREFIX)/lib/
--	rm -f $(INSTALL_PREFIX)/lib/libduktape.so $(INSTALL_PREFIX)/lib/libduktape.$(SO_SONAME_SUFFIX)
--	ln -s libduktape.$(SO_REALNAME_SUFFIX) $(INSTALL_PREFIX)/lib/libduktape.so
--	ln -s libduktape.$(SO_REALNAME_SUFFIX) $(INSTALL_PREFIX)/lib/libduktape.$(SO_SONAME_SUFFIX)
--	rm -f $(INSTALL_PREFIX)/lib/libduktaped.so $(INSTALL_PREFIX)/lib/libduktaped.$(SO_SONAME_SUFFIX)
--	ln -s libduktaped.$(SO_REALNAME_SUFFIX) $(INSTALL_PREFIX)/lib/libduktaped.so
--	ln -s libduktaped.$(SO_REALNAME_SUFFIX) $(INSTALL_PREFIX)/lib/libduktaped.$(SO_SONAME_SUFFIX)
--	mkdir -p $(INSTALL_PREFIX)/include/
--	cp $(DUKTAPE_SRCDIR)/duktape.h $(DUKTAPE_SRCDIR)/duk_config.h $(INSTALL_PREFIX)/include/
-+install: libduktape.$(SO_REALNAME_SUFFIX) libduktaped.$(SO_REALNAME_SUFFIX) duktape.pc
-+	mkdir -p $(DESTDIR)$(INSTALL_PREFIX)$(LIBDIR)/pkgconfig
-+	cp $+ $(DESTDIR)$(INSTALL_PREFIX)$(LIBDIR)/
-+	rm -f $(DESTDIR)$(INSTALL_PREFIX)$(LIBDIR)/libduktape.so $(DESTDIR)$(INSTALL_PREFIX)$(LIBDIR)/libduktape.$(SO_SONAME_SUFFIX)
-+	ln -s libduktape.$(SO_REALNAME_SUFFIX) $(DESTDIR)$(INSTALL_PREFIX)$(LIBDIR)/libduktape.so
-+	ln -s libduktape.$(SO_REALNAME_SUFFIX) $(DESTDIR)$(INSTALL_PREFIX)$(LIBDIR)/libduktape.$(SO_SONAME_SUFFIX)
-+	rm -f $(DESTDIR)$(INSTALL_PREFIX)$(LIBDIR)/libduktaped.so $(DESTDIR)$(INSTALL_PREFIX)$(LIBDIR)/libduktaped.$(SO_SONAME_SUFFIX)
-+	ln -s libduktaped.$(SO_REALNAME_SUFFIX) $(DESTDIR)$(INSTALL_PREFIX)$(LIBDIR)/libduktaped.so
-+	ln -s libduktaped.$(SO_REALNAME_SUFFIX) $(DESTDIR)$(INSTALL_PREFIX)$(LIBDIR)/libduktaped.$(SO_SONAME_SUFFIX)
-+	mv $(DESTDIR)$(INSTALL_PREFIX)$(LIBDIR)/duktape.pc $(DESTDIR)$(INSTALL_PREFIX)$(LIBDIR)/pkgconfig/
-+	mkdir -p $(DESTDIR)$(INSTALL_PREFIX)/include/
-+	cp $(DUKTAPE_SRCDIR)/duktape.h $(DUKTAPE_SRCDIR)/duk_config.h $(DESTDIR)$(INSTALL_PREFIX)/include/
- 
- CCOPTS = -I./examples/cmdline
- duk:
--	$(CC) $(CCOPTS) -I$(INSTALL_PREFIX)/include -L$(INSTALL_PREFIX)/lib -Wall -Wextra -Os -o $@ ./examples/cmdline/duk_cmdline.c -lduktape -lm
-+	$(CC) $(CCOPTS) -I$(INSTALL_PREFIX)/include -L$(INSTALL_PREFIX)$(LIBDIR) -Wall -Wextra -Os -o $@ ./examples/cmdline/duk_cmdline.c -lduktape -lm
-diff --git a/duktape.pc.in b/duktape.pc.in
-new file mode 100644
-index 00000000..0985c67e
---- /dev/null
-+++ b/duktape.pc.in
-@@ -0,0 +1,10 @@
-+prefix=@PREFIX@
-+exec_prefix=${prefix}
-+libdir=${prefix}@LIBDIR@
-+includedir=${prefix}/include
-+
-+Name: duktape
-+Description: Embeddable Javascript engine
-+Version: @VERSION@
-+Libs: -L${libdir} -lduktape
-+Cflags: -I${includedir}
-- 
2.35.1


