Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 22F357C2E7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2019 12:36:13 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id f188so17525570wmf.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2019 04:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6VKN9eO8M/2xtnh8+MislnuioK0cxVPJErwzky5KVnU=;
	b=QH/p5mNS0tt6fvCokI6DBm3Hg15B5JIMKGV/HIlyvBbO2qHhHW0bYKo6hS0e02YJ3x
	r+vZmi0eRr/FHvza9GdwZfFl0nxEZJxSoRDI7MVntikW8v+sgmrdpiy8Z5fdqA2DpP2u
	7/YEVSicXBvVUcTXzKG0BizisTDggLl2bVcohr9sX8qoRsrgfS2OVEC+DEGW3czJjLC1
	lLzIRnrRSDZvUKNVVG6TREJgLuH/afI87qLy95xzTc277shu5qElnEkJZTAadnZXJ87u
	ZJr4v71zxOzFoypYVTt7Wps4ZdTDp/IMgGVzHLs9UGeCJgelB5fYbRJ2xcrLwINxfIZu
	FsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6VKN9eO8M/2xtnh8+MislnuioK0cxVPJErwzky5KVnU=;
	b=uCVyIVjpVhCGLZfospuuEB1uq+Dh2rNK0Mt470NcLUTq0yfTFjxvMgNkX3AoS2Nnfd
	tR4RVhd7t0e4pweB2DUewRR1nJ0cCPSNTfNfzm/xZm4c1UH0D3hJL3EwzIlfXf4mSAk5
	SPOhABBQ+1jjIUirfBMXLjrfHwrgILZTr4IdAOUyaLOPPMLL3SeDUAxRi70zOlQqDUw0
	Dsx/7uUROsch1MJI9WQTNYVv9LKidzKuII9/N3akBS61zxZgeNFPEBSSJXCeK+CPpgEc
	JA+iMXvB4k/A6/jT0tss3/Q9+Ke8CxXLrYGwmjfIW1/2rrqSIpfv+yCnJ1cLgQUdITi3
	dHbw==
X-Gm-Message-State: AJcUukfmtfFSUUffD+n8RXsNmhKjJEnCjpy0IiOeVlGSaPQr2JxJlW1c
	L46rIceMjGgoUuQik9O2nQLsCGEOFI8=
X-Google-Smtp-Source: AHgI3IZ3H20wuyty4nL4t4bW9v7g4UIejBl61nVxsRrzAqRSFvJJTQ8eKkttY/wdekf35bSVM1BZAw==
X-Received: by 2002:a1c:8010:: with SMTP id b16mr8829589wmd.57.1548765373380; 
	Tue, 29 Jan 2019 04:36:13 -0800 (PST)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18])
	by smtp.gmail.com with ESMTPSA id d4sm1378318wmb.25.2019.01.29.04.36.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Jan 2019 04:36:12 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jan 2019 12:36:06 +0000
Message-Id: <1548765366-13715-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] jq: update to 1.6
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
X-List-Received-Date: Tue, 29 Jan 2019 12:36:13 -0000

Drop backported patch as it's present in 1.6. Switch to autotools-brokensep
to avoid

| sed -e 's/\\/\\\\/g' -e 's/"/\\"/g' -e 's/^/"/' -e 's/$/\\n"/' ../jq-1.6/src/builtin.jq > src/builtin.inc
| /bin/sh: src/builtin.inc: No such file or directory

License-Update: whitespace changes
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../jq/jq/Support-without-oniguruma.patch          | 68 ----------------------
 .../recipes-devtools/jq/{jq_1.5.bb => jq_1.6.bb}   |  9 ++-
 2 files changed, 4 insertions(+), 73 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/jq/jq/Support-without-oniguruma.patch
 rename meta-oe/recipes-devtools/jq/{jq_1.5.bb => jq_1.6.bb} (75%)

diff --git a/meta-oe/recipes-devtools/jq/jq/Support-without-oniguruma.patch b/meta-oe/recipes-devtools/jq/jq/Support-without-oniguruma.patch
deleted file mode 100644
index 1dfd955f0def..000000000000
--- a/meta-oe/recipes-devtools/jq/jq/Support-without-oniguruma.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 18b4b18b41f5ed396d73449ce8d6ec408d95d6b2 Mon Sep 17 00:00:00 2001
-From: David Tolnay <dtolnay@gmail.com>
-Date: Sat, 21 Nov 2015 10:05:37 -0800
-Subject: [PATCH] Support --without-oniguruma
-
-Upstream-Status: Backport
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-
----
- configure.ac | 41 ++++++++++++++++++++---------------------
- 1 file changed, 20 insertions(+), 21 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9e2c8cf..7f6be34 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -52,27 +52,26 @@ fi
- AC_ARG_WITH([oniguruma],
-     [AS_HELP_STRING([--with-oniguruma=prefix],
-         [try this for a non-standard install prefix of the oniguruma library])],
--    [ONIGURUMAPATHSET=1],
--    [ONIGURUMAPATHSET=0])
--
--if test $ONIGURUMAPATHSET = 1; then
--  CFLAGS="$CFLAGS -I${with_oniguruma}/include"
--  LDFLAGS="$LDFLAGS -L${with_oniguruma}/lib"
--fi
--
--# check for ONIGURUMA library
--HAVE_ONIGURUMA=0
--AC_CHECK_HEADER("oniguruma.h",
--    AC_CHECK_LIB([onig],[onig_version],[LIBS="$LIBS -lonig"; HAVE_ONIGURUMA=1;]))
--
--# handle check results
--if test $HAVE_ONIGURUMA != 1; then
--    AC_MSG_NOTICE([Oniguruma was not found.])
--    AC_MSG_NOTICE([ Try setting the location using '--with-oniguruma=PREFIX' ])
--else
--    AC_DEFINE([HAVE_ONIGURUMA],1,[Define to 1 if Oniguruma is installed])
--fi
--
-+    [],
-+    [with_oniguruma=yes])
-+
-+AS_IF([test "x$with_oniguruma" != xno], [
-+    AS_IF([test "x$with_oniguruma" != xyes], [
-+        CFLAGS="$CFLAGS -I${with_oniguruma}/include"
-+        LDFLAGS="$LDFLAGS -L${with_oniguruma}/lib"
-+    ])
-+    # check for ONIGURUMA library
-+    have_oniguruma=0
-+    AC_CHECK_HEADER("oniguruma.h",
-+        AC_CHECK_LIB([onig],[onig_version],[LIBS="$LIBS -lonig"; have_oniguruma=1;]))
-+    # handle check results
-+    AS_IF([test $have_oniguruma = 1], [
-+        AC_DEFINE([HAVE_ONIGURUMA], 1, [Define to 1 if Oniguruma is installed])
-+    ], [
-+        AC_MSG_NOTICE([Oniguruma was not found.])
-+        AC_MSG_NOTICE([Try setting the location using '--with-oniguruma=PREFIX'])
-+    ])
-+])
- 
- dnl Check for valgrind
- AC_CHECK_PROGS(valgrind_cmd, valgrind)
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-devtools/jq/jq_1.5.bb b/meta-oe/recipes-devtools/jq/jq_1.6.bb
similarity index 75%
rename from meta-oe/recipes-devtools/jq/jq_1.5.bb
rename to meta-oe/recipes-devtools/jq/jq_1.6.bb
index 0f40815ccd6a..0086eae5c3f1 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.5.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.6.bb
@@ -6,16 +6,15 @@ HOMEPAGE = "https://stedolan.github.io/jq/"
 BUGTRACKER = "https://github.com/stedolan/jq/issues"
 SECTION = "utils"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=29dd0c35d7e391bb8d515eacf7592e00"
+LIC_FILES_CHKSUM = "file://COPYING;md5=15d03e360fa7399f76d5a4359fc72cbf"
 
 SRC_URI = "https://github.com/stedolan/${BPN}/releases/download/${BP}/${BP}.tar.gz \
-           file://Support-without-oniguruma.patch \
 "
 
-SRC_URI[md5sum] = "0933532b086bd8b6a41c1b162b1731f9"
-SRC_URI[sha256sum] = "c4d2bfec6436341113419debf479d833692cc5cdab7eb0326b5a4d4fbe9f493c"
+SRC_URI[md5sum] = "e68fbd6a992e36f1ac48c99bbf825d6b"
+SRC_URI[sha256sum] = "5de8c8e29aaa3fb9cc6b47bb27299f271354ebb72514e3accadc7d38b5bbaa72"
 
-inherit autotools
+inherit autotools-brokensep
 
 PACKAGECONFIG ?= "oniguruma"
 
-- 
2.7.4


