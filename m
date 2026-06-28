Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F471C43327
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:16 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69135.1782634326694742647
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LTH/TDa9;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30c09f29b64so1641728eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634326; x=1783239126; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FyLEkzYCLyyoWiFJAWSFYdIvU051oeYxi9CskyVYs1I=;
        b=LTH/TDa93xT0YR7NKdXzrXUmGRgkKN61PZhbkFfQLH6EGETXbza93z13wCmL++0hKP
         n8yadUiW/KzFQkIE77D9qRFlVCSmTlqpuPJN0IlqvH8xn7V5XyXouTqs9ZvDx0varL7J
         I5vMd+slqApMeYO1qkGgmKvJF7lHSDI/DiYSW0pvkV8nl25++2RmkmWCIQXsFx+DMvj7
         Cq5noAOH65gN6zP05cSW9z3DMDSE2vVeSxE6nM6c9ZdA3A3xPJdcufgMl0nQIFGwY2+b
         KbKll92iIf/bZ3MHx4o4pSPoblz8/y9iW+mzh4zgagQNoOQkvxzKA51u12xi5lr93KaJ
         WLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634326; x=1783239126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FyLEkzYCLyyoWiFJAWSFYdIvU051oeYxi9CskyVYs1I=;
        b=efvoqmUv9AcufGN+Kcz7w8bLTk3Gkoo3qvTRGTA4coeXIsB55vcujueXC241Qd+gnp
         Pqbj9Y4386Xv/ePa43pb49GUKsvLabQC4NnEcwkvu7y39G/aVZqNCuGUPFD4ryaX1aYV
         /+affNo7jZf16bGTZS2b4/+SWjOk8/hN3a6vO+c27inUI6J9PFjQIQ36UY05IBbN/4oF
         9AxDoxgEnLeY5ornhGpPC3VcUbhZGqt15N7QhhLwaQCULoAxgksQN6VJFzmEmFeb5AwD
         kQKzUvEEcw/q+WyAYQ5sTC7/wJLvvP5TPh94evHzxRXOVwKtbehz7wZOdfI8p6Qex4lj
         PBoA==
X-Gm-Message-State: AOJu0YyuLmWkFZZ/YtMwzUaUBKXMgZBU/0HCauLNAulqfo1L9CHBqzWR
	dHxyOcNfn7KinldSBgGjBqwMygnEJGcJPJxzc+sT7SReWauh3/6ITv74vIbBh9AzRihr1g==
X-Gm-Gg: AfdE7cktbZ3tBpotVM/KdY5Okuv8I/QPZheX8KF9VDmq/10EElMr96rxDH7YfhKYN4z
	BxdinL1X8KFuh6ZqDcvtsCEM35nw4epl9GPuVIi0N3CzH70jqO1JdMGhjmkF+oy+RVVFx+b5dc2
	TRYS0mD59mgFgZDFeNqHwFqEmOe7Ophk2O2LJDgD0ISFDFfmxaDfXfuhh1Q601uzQ1fJTaqyCH+
	UtjKOJioQ4RADsasGK/nL0rBJfZnlQJiobXuRyC5zNEjKz9dfuyX/ezwVHoo34ryHiUv8Akh14D
	IfMkyadbv4JF5zyeiVUxwAfbaT8H2fhDeFIgILK1gNnlxkKsR/Hyx2/A7qdq0skcSP1wscd9Axf
	mv4/jKcjtqquxpiat5usJ1f+m+abfJm2llXk+n9OK5jeOeOfPpBpS9VhwJrTMiBbXmijD6Nsd+L
	hnSzS3WlayJ2tnHExuTYAKO7w+HSXLdUA6fCp+2Sp2+JYu51LhrvdORGySuRGBvRfXvBitwdmwJ
	gy4LrrarEmHUcmk2DqCqZkHixgdW5V7FV1x8D/p+z5BZrXizrkwgT8STM0eOiEvKJpCLR6k+nOv
	2CHrJqPAAUc87vNcpiG0BLF/D9LGQTd1A+SoOZWo
X-Received: by 2002:a05:7301:750f:b0:30e:3424:511a with SMTP id 5a478bee46e88-30e342451cbmr2729338eec.18.1782634325901;
        Sun, 28 Jun 2026 01:12:05 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 044/128] libabigail: upgrade 2.5 -> 2.10
Date: Sun, 28 Jun 2026 01:09:55 -0700
Message-ID: <20260628081122.178348-44-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127854

libabigail 2.10 requires libxxhash >= 0.8.0, so add xxhash to DEPENDS.
Drop 0001-Check-for-correct-fts-module.patch, which is merged in 2.10.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-Check-for-correct-fts-module.patch   | 91 -------------------
 .../{libabigail_2.5.bb => libabigail_2.10.bb} |  5 +-
 2 files changed, 2 insertions(+), 94 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/libabigail/libabigail/0001-Check-for-correct-fts-module.patch
 rename meta-oe/recipes-devtools/libabigail/{libabigail_2.5.bb => libabigail_2.10.bb} (70%)

diff --git a/meta-oe/recipes-devtools/libabigail/libabigail/0001-Check-for-correct-fts-module.patch b/meta-oe/recipes-devtools/libabigail/libabigail/0001-Check-for-correct-fts-module.patch
deleted file mode 100644
index 7c500e0b54..0000000000
--- a/meta-oe/recipes-devtools/libabigail/libabigail/0001-Check-for-correct-fts-module.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 0db4af09f1bf4456527b5f6ec60fc1305e770c4c Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 9 Jul 2024 15:19:35 +0100
-Subject: [PATCH] configure.ac: improve fts checks
-
-The current code checks explicitly for musl and if so uses pkg-config to
-find fts-standalone. This is suboptimal because musl may not be the only
-libc to need a standalone fts implementation, and fts-standalone is an
-old gentoo-specific name[1] so libabigail won't build on any other system
-against musl.
-
-Instead, use AC_SEARCH_LIBS to look for fts_open in libc then libfts. Do
-this before the check for behaviour just in case someone has a standalone
-and broken implementation.  I assume that the standalone fts is installed
-on the standard search path, which should be a fair assumption.
-
-As we're not using pkg-config anymore the required link flags are now in
-LIBS, so remove all instances of FTS_CFLAGS and FTS_LIBS.
-
-[1] https://gitweb.gentoo.org/repo/gentoo.git/commit/sys-libs/fts-standalone?id=a403fe6c61d1aaeecd58d521f3def2f6d3513449
-
-Upstream-Status: Submitted [https://sourceware.org/pipermail/libabigail/2024q3/005973.html]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- configure.ac      | 9 ++++-----
- src/Makefile.am   | 4 ++--
- tools/Makefile.am | 2 --
- 3 files changed, 6 insertions(+), 9 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index e118a9c0..0aff2ec2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -281,6 +281,10 @@ fi
- 
- AC_SUBST(VISIBILITY_FLAGS)
- 
-+# glibc and BSD include fts into their libc, but musl does not so check if we
-+# need to explicitly link to the standalone musl-fts.
-+AC_SEARCH_LIBS([fts_open], [fts])
-+
- dnl Older glibc had a broken fts that didn't work with Large File Systems.
- dnl We want the version that can handler LFS, but include workaround if we
- dnl get a bad one. Add define to CFLAGS (not AC_DEFINE it) since we need to
-@@ -295,11 +299,6 @@ AS_IF([test "x$ac_cv_bad_fts" = "xyes"],
-       [CFLAGS="$CFLAGS -DBAD_FTS=1",
-        CXXFLAGS="$CXXFLAGS -DBAD_FTS=1"])
- 
--dnl On musl, we need to find fts-standalone
--AS_CASE(
--  [${host_os}], [*-musl*], [
--    PKG_CHECK_MODULES([FTS], [fts-standalone])
--])
- 
- dnl Check for dependency: libelf, libdw, libebl (elfutils)
- dnl Note that we need to use at least elfutils 0.159 but
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 3044c136..1c98bf84 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -52,12 +52,12 @@ if BTF_READER
- libabigail_la_SOURCES += abg-btf-reader.cc
- endif
- 
--libabigail_la_LIBADD = $(DEPS_LIBS) $(FTS_LIBS)
-+libabigail_la_LIBADD = $(DEPS_LIBS)
- libabigail_la_LDFLAGS = -lpthread -Wl,--as-needed -no-undefined -version-info $(LIBABIGAIL_SO_CURRENT):$(LIBABIGAIL_SO_REVISION):$(LIBABIGAIL_SO_AGE)
- 
- CUSTOM_MACROS = -DABIGAIL_ROOT_SYSTEM_LIBDIR=\"${libdir}\"
- 
- AM_CPPFLAGS=\
--$(CUSTOM_MACROS) $(DEPS_CPPFLAGS) $(FTS_CFLAGS) \
-+$(CUSTOM_MACROS) $(DEPS_CPPFLAGS) \
- -Wall -I$(abs_top_srcdir) -I$(abs_top_srcdir)/include \
- -I$(abs_top_builddir)/include -I$(abs_top_builddir)
-diff --git a/tools/Makefile.am b/tools/Makefile.am
-index cbb5ce10..ea2d300c 100644
---- a/tools/Makefile.am
-+++ b/tools/Makefile.am
-@@ -41,8 +41,6 @@ abicompatdir = $(bindir)
- 
- abipkgdiff_SOURCES = abipkgdiff.cc
- abipkgdiffdir = $(bindir)
--abipkgdiff_CPPFLAGS = $(FTS_CFLAGS)
--abipkgdiff_LDADD = $(FTS_LIBS)
- abipkgdiff_LDFLAGS = $(abs_top_builddir)/src/libabigail.la -pthread
- 
- kmidiff_SOURCES = kmidiff.cc
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-devtools/libabigail/libabigail_2.5.bb b/meta-oe/recipes-devtools/libabigail/libabigail_2.10.bb
similarity index 70%
rename from meta-oe/recipes-devtools/libabigail/libabigail_2.5.bb
rename to meta-oe/recipes-devtools/libabigail/libabigail_2.10.bb
index 5c262d2880..5a84fd6848 100644
--- a/meta-oe/recipes-devtools/libabigail/libabigail_2.5.bb
+++ b/meta-oe/recipes-devtools/libabigail/libabigail_2.10.bb
@@ -5,11 +5,10 @@ LICENSE = "Apache-2.0-with-LLVM-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0bcd48c3bdfef0c9d9fd17726e4b7dab"
 
 SRC_URI = "http://mirrors.kernel.org/sourceware/${BPN}/${BP}.tar.xz \
-           file://0001-Check-for-correct-fts-module.patch \
            "
-SRC_URI[sha256sum] = "7cfc4e9b00ae38d87fb0c63beabb32b9cbf9ce410e52ceeb5ad5b3c5beb111f3"
+SRC_URI[sha256sum] = "0cc10e6471398330e001b9fe37f1e8c5108a9ab632b08ca9634d6c64bc380b78"
 
-DEPENDS = "elfutils libxml2"
+DEPENDS = "elfutils libxml2 xxhash"
 DEPENDS:append:libc-musl = " fts"
 
 inherit autotools pkgconfig lib_package

