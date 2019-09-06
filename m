Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 47ABF7C426
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 17:57:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Q4yB6LS4z4q
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 19:57:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567792627;
	bh=8N8JL9g/GM+1GUAIWNa6iDqvZ56CRkMm0SXgaKnP6kU=;
	h=From:To:Subject:Date:From;
	b=PkxsotMg8U2HXWMozOQsq30i+HIWW/Csz4UX7x8OofcueZaBM+ribmyqVd1dAUVD4
	WSIBxR3FkCWEi84VApjto5keDfb6FhU24HXKg6obLRGHMjSpWVz6wLOLkJ3IvkftPH
	OSoFBIVirJmtbJOUizBFHBuuHCvf23wtqwVFRwcmR9wbD8mjhOVYvPXfmj00RlTZJw
	8gRRyC2xIv0rGIewSzQNpDFmj/3vkQmjvFdEgb3t/pzlodcB5GI+hzFYzdNRMBgrAy
	Sr8776bgA1kQ3eOSkS1nflzsxRJRI1GwTQyEYpCofjE1KWP4Gbjb4lh5x7GC5LHU21
	z9YtgfSYmJ6CAwretg1urMInSNQbDsTNQjheTIrODqYwX71fBhXyWEmo/ItuSGqdNG
	UkNbDzMwk0fh00C2vSlrXoNCh8aA0NO5J8UOYUy5eYta9d1BRMg3biHwTotoAVdcQl
	w1x9pqHor5I0f5Vtl/QDDErP1uNWWpCCdt6EliqwoQlb7k5qvRhVTmhGPagd8Gx8iH
	4YZLhHK9wVhHxLfRqozSRKWm8PJkyGldaz8/oUfk+CSAb3D17JIPAS7ZQ+W1RLKk+A
	hYkrLA/NBLHDWkFCGEy99pLO82RluyTna7yczinYcJcBNfm0EGEAhd6LZqnWJiBt0F
	5jCcvTkz1r5zJbwMKiiaMLl8=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Sep 2019 20:57:05 +0300
Message-Id: <20190906175705.9551-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] dejagnu: Remove, moved to oe-core
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
X-List-Received-Date: Fri, 06 Sep 2019 17:57:07 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  2 +-
 .../dejagnu/dejagnu/configure.patch           | 45 -------------------
 .../recipes-devtools/dejagnu/dejagnu_1.4.4.bb | 14 ------
 3 files changed, 1 insertion(+), 60 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/dejagnu/dejagnu/configure.patch
 delete mode 100644 meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index c77a1e54e..84a0df1d2 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -104,7 +104,7 @@ RDEPENDS_packagegroup-meta-oe-dbs ="\
 RDEPENDS_packagegroup-meta-oe-devtools ="\
     android-tools android-tools-conf bootchart breakpad \
     capnproto cgdb cscope ctags \
-    debootstrap dejagnu dmalloc flatbuffers \
+    debootstrap dmalloc flatbuffers \
     giflib icon-slicer iptraf-ng jq jsoncpp jsonrpc json-spirit \
     kconfig-frontends lemon libedit libgee libsombok3 \
     libubox log4cplus lshw ltrace lua mcpp memstat mercurial \
diff --git a/meta-oe/recipes-devtools/dejagnu/dejagnu/configure.patch b/meta-oe/recipes-devtools/dejagnu/dejagnu/configure.patch
deleted file mode 100644
index 2eb8af713..000000000
--- a/meta-oe/recipes-devtools/dejagnu/dejagnu/configure.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Index: dejagnu-1.4.4/configure.in
-===================================================================
---- dejagnu-1.4.4.orig/configure.in	2014-07-18 07:05:49.997481207 +0000
-+++ dejagnu-1.4.4/configure.in	2014-07-18 07:05:50.085481210 +0000
-@@ -1,10 +1,10 @@
- dnl Process this file with autoconf to produce a configure script.
- AC_PREREQ(2.13)
--AC_INIT(runtest.exp)
-+AC_INIT(dejagnu, 1.4.4)
- dnl AC_CONFIG_AUX_DIR(..)
- 
- dnl These are required by automake
--AM_INIT_AUTOMAKE(dejagnu, 1.4.4)
-+AM_INIT_AUTOMAKE([foreign])
- AM_MAINTAINER_MODE
- AC_PROG_MAKE_SET
- 
-Index: dejagnu-1.4.4/example/calc/configure.in
-===================================================================
---- dejagnu-1.4.4.orig/example/calc/configure.in	2002-04-26 03:32:40.000000000 +0000
-+++ dejagnu-1.4.4/example/calc/configure.in	2014-07-18 07:11:59.085491266 +0000
-@@ -1,8 +1,8 @@
- dnl Process this file with autoconf to produce a configure script.
- AC_PREREQ(2.5)
--AC_INIT(calc.c)
-+AC_INIT(calc, 1.1)
- AM_CONFIG_HEADER(calc.h)
--AM_INIT_AUTOMAKE(calc, 1.1)
-+AM_INIT_AUTOMAKE([foreign])
- 
- AC_PROG_CC
- AC_PROG_INSTALL
-Index: dejagnu-1.4.4/example/hello/configure.in
-===================================================================
---- dejagnu-1.4.4.orig/example/hello/configure.in	2002-08-31 05:46:16.000000000 +0000
-+++ dejagnu-1.4.4/example/hello/configure.in	2014-07-18 07:12:23.721491937 +0000
-@@ -25,7 +25,7 @@
- # ------------------------------------------------------------------------
- 
- AC_INIT(helloworld, demo-version, philip.wilsey@ieee.org)
--AM_INIT_AUTOMAKE(helloworld, demo-version)
-+AM_INIT_AUTOMAKE([foreign])
- 
- #AC_CONFIG_SRCDIR([hello.cc])
- #AC_CONFIG_HEADER([config.h])
diff --git a/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb b/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
deleted file mode 100644
index 63726b232..000000000
--- a/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "GNU unit testing framework, written in Expect and Tcl"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
-SECTION = "devel"
-
-inherit autotools
-
-SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
-           file://configure.patch"
-
-SRC_URI[md5sum] = "053f18fd5d00873de365413cab17a666"
-SRC_URI[sha256sum] = "d0fbedef20fb0843318d60551023631176b27ceb1e11de7468a971770d0e048d"
-
-BBCLASSEXTEND = "native"
-- 
2.17.1


