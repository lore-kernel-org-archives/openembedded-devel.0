Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 999DA7473C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:40 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id z73so8076103wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=zgDGcsjbZ75cNVoxSFDlB2xy6ozxcCsWeyfBbRWYj3A=;
	b=ue47Uhx+stHwhIDtOhCKqcXjqt6huNXXlWkW+l6x6QJ+ma8bLqpcMuBk7P5MAH0INd
	fn2FlHiPG+ZbJ2dFKKWDq+20Urh18h1oXyhi87uYK4TByuDi/KBFUP1/KBnSOW+2/hHr
	783hB2oYUZHTuDBmln9Pydpl/QmQh/PVb2k2cpvxPeIfbGc+NnOwBxiDsYhT9ZvRFJm0
	/n0hRs+EBSUWjlhO8DAJMN0mTt1IXB/xQk3IRhKhmr3fKT2ceyc52zOoZ9oO+i/Ib6X2
	8fxJq544JOrTqbqYUUk2OTzufrQxY5CWa61Kg1oVSxnautonrXDnaflnxxyO75j/Au8d
	QFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zgDGcsjbZ75cNVoxSFDlB2xy6ozxcCsWeyfBbRWYj3A=;
	b=WpZ+com3YeFT3Hghmm/nXlP+fCNBWbrTPvkZPCLDRbf53iV/cznPLtTdU7Tx2PFMBk
	BhLnRNrCtamI7l6QISl0gAbDZSYGGagknUj4cdVkchtj9sNqpo0/KeXNUOGwVhploU1i
	x9W3jIaPe/VkmHtgjFGHJO/Xe7j/TKO1bx/me4i5GQWLXxlEvZUrLSh/SusXIKSPEPXU
	v4RrjBzHaSF+26dIlWWI1JSA0HDxukoBOjz5hTmxu4bAP8Te/EMEZ4Bua+oFwP8Q2HkL
	25ooG6FZ1MJS0k3TPvPuAp445F4iRCf+47GQ6LHQZqoV+DhWzgT+O00kHPBLoE2K5ynV
	wt7w==
X-Gm-Message-State: AElRT7Ff2eJ5/SktqMypHCp7NVdSgGdw+4mU8tfKmZ+SrKf0v4JxfiZv
	Tu2cGmusGzryioC+vU54s529TA==
X-Google-Smtp-Source: AIpwx484VZuio4bGuyTq/OTvx4rczHxGBmIx/uh0OtPD0Sti07Pk+tHPeOvkVSryW4l7zajDkN5Zag==
X-Received: by 10.223.182.13 with SMTP id f13mr9324814wre.262.1522416760744;
	Fri, 30 Mar 2018 06:32:40 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:49 +0200
Message-Id: <20180330133151.25882-38-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 37/39] libsdl-ttf/libsdl2-ttf: refresh patches
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Different code bases cannot share patches cleanly. So have explict patch folder
for each version.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libsdl-ttf/files/automake_foreign.patch        | 13 -----
 .../libsdl-ttf/use.pkg-config.for.freetype2.patch  | 62 ++++++++++++++++++++++
 .../libsdl-ttf/libsdl2-ttf/automake_foreign.patch  | 21 ++++++++
 .../use.pkg-config.for.freetype2.patch             | 13 +++--
 4 files changed, 92 insertions(+), 17 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libsdl-ttf/files/automake_foreign.patch
 create mode 100644 meta-oe/recipes-support/libsdl-ttf/libsdl-ttf/use.pkg-config.for.freetype2.patch
 create mode 100644 meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf/automake_foreign.patch
 rename meta-oe/recipes-support/libsdl-ttf/{files => libsdl2-ttf}/use.pkg-config.for.freetype2.patch (83%)

diff --git a/meta-oe/recipes-support/libsdl-ttf/files/automake_foreign.patch b/meta-oe/recipes-support/libsdl-ttf/files/automake_foreign.patch
deleted file mode 100644
index 2d5bd6d91..000000000
--- a/meta-oe/recipes-support/libsdl-ttf/files/automake_foreign.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: SDL2_ttf-2.0.14/Makefile.am
-===================================================================
---- SDL2_ttf-2.0.14.orig/Makefile.am
-+++ SDL2_ttf-2.0.14/Makefile.am
-@@ -1,6 +1,8 @@
- # Makefile.am for the SDL truetype font loading library and viewer
- lib_LTLIBRARIES = libSDL2_ttf.la
- 
-+AUTOMAKE_OPTIONS = foreign
-+
- libSDL2_ttfincludedir = $(includedir)/SDL2
- libSDL2_ttfinclude_HEADERS =	\
- 	SDL_ttf.h
diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf/use.pkg-config.for.freetype2.patch b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf/use.pkg-config.for.freetype2.patch
new file mode 100644
index 000000000..1116c34d0
--- /dev/null
+++ b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf/use.pkg-config.for.freetype2.patch
@@ -0,0 +1,62 @@
+From 8cf318197eea91bec6057308befbb29426d69014 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 22 May 2014 10:59:33 +0100
+Subject: [PATCH] freetype-config was removed from oe-core in
+
+commit 5870bd272b0b077d0826fb900b251884c1c05061
+
+    binconfig-disabled: Add class and use
+
+---
+ configure.in | 38 +++++---------------------------------
+ 1 file changed, 5 insertions(+), 33 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 865075e..d7a5a81 100644
+--- a/configure.in
++++ b/configure.in
+@@ -90,39 +90,11 @@ case "$host" in
+ esac
+ AM_CONDITIONAL(USE_VERSION_RC, test x$use_version_rc = xtrue)
+ 
+-dnl Check for the FreeType 2 library
+-dnl
+-dnl Get the cflags and libraries from the freetype-config script
+-dnl
+-AC_ARG_WITH(freetype-prefix,[  --with-freetype-prefix=PFX   Prefix where FREETYPE is 
+-installed (optional)],
+-            freetype_prefix="$withval", freetype_prefix="")
+-AC_ARG_WITH(freetype-exec-prefix,[  --with-freetype-exec-prefix=PFX Exec prefix 
+-where FREETYPE is installed (optional)],
+-            freetype_exec_prefix="$withval", freetype_exec_prefix="")
+-
+-if test x$freetype_exec_prefix != x ; then
+-     freetype_args="$freetype_args --exec-prefix=$freetype_exec_prefix"
+-     if test x${FREETYPE_CONFIG+set} != xset ; then
+-        FREETYPE_CONFIG=$freetype_exec_prefix/bin/freetype-config
+-     fi
+-fi
+-if test x$freetype_prefix != x ; then
+-     freetype_args="$freetype_args --prefix=$freetype_prefix"
+-     if test x${FREETYPE_CONFIG+set} != xset ; then
+-        FREETYPE_CONFIG=$freetype_prefix/bin/freetype-config
+-     fi
+-fi
+-AC_PATH_PROG(FREETYPE_CONFIG, freetype-config, no)
+-no_freetype=""
+-if test "$FREETYPE_CONFIG" = "no" ; then
+-    AC_MSG_ERROR([
+-*** Unable to find FreeType2 library (http://www.freetype.org/)
+-])
+-else
+-    CFLAGS="$CFLAGS `$FREETYPE_CONFIG $freetypeconf_args --cflags`"
+-    LIBS="$LIBS `$FREETYPE_CONFIG $freetypeconf_args --libs`"
+-fi
++PKG_CHECK_MODULES(FREETYPE2, freetype2, 
++    CFLAGS="$CFLAGS $FREETYPE2_CFLAGS"
++    LIBS="$LIBS $FREETYPE2_LIBS",
++    AC_MSG_ERROR([*** Unable to find FreeType2 library (http://www.freetype.org/)])
++)
+ 
+ dnl Check for SDL
+ SDL_VERSION=1.2.4
diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf/automake_foreign.patch b/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf/automake_foreign.patch
new file mode 100644
index 000000000..871e6e94e
--- /dev/null
+++ b/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf/automake_foreign.patch
@@ -0,0 +1,21 @@
+From f9c4ad3a171d676e3818b8f6897f325ccf0b2203 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 9 May 2017 00:57:10 -0700
+
+---
+ Makefile.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 8166d91..8e05e49 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -2,6 +2,8 @@
+ 
+ lib_LTLIBRARIES = libSDL2_ttf.la
+ 
++AUTOMAKE_OPTIONS = foreign
++
+ libSDL2_ttfincludedir = $(includedir)/SDL2
+ libSDL2_ttfinclude_HEADERS =	\
+ 	SDL_ttf.h
diff --git a/meta-oe/recipes-support/libsdl-ttf/files/use.pkg-config.for.freetype2.patch b/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf/use.pkg-config.for.freetype2.patch
similarity index 83%
rename from meta-oe/recipes-support/libsdl-ttf/files/use.pkg-config.for.freetype2.patch
rename to meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf/use.pkg-config.for.freetype2.patch
index 8a11f6649..1dfbec6ed 100644
--- a/meta-oe/recipes-support/libsdl-ttf/files/use.pkg-config.for.freetype2.patch
+++ b/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf/use.pkg-config.for.freetype2.patch
@@ -1,13 +1,18 @@
-freetype-config was removed from oe-core in
+From e6d2c0e130811c15b5f5cc10221fae182cb8609e Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 22 May 2014 10:59:33 +0100
+Subject: [PATCH] freetype-config was removed from oe-core in
 
 commit 5870bd272b0b077d0826fb900b251884c1c05061
-Author: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date:   Thu May 22 10:59:33 2014 +0100
 
     binconfig-disabled: Add class and use
 
+---
+ configure.in | 38 +++++---------------------------------
+ 1 file changed, 5 insertions(+), 33 deletions(-)
+
 diff --git a/configure.in b/configure.in
-index 408e8d6..5f9e730 100644
+index 9b36e15..f300cae 100644
 --- a/configure.in
 +++ b/configure.in
 @@ -86,39 +86,11 @@ case "$host" in
-- 
2.14.3


