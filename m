Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.7175.1589247378312903600
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2020 18:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j7cIFPas;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id x2so5586786pfx.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2020 18:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nXqmbX/V6JKg4via1Z9RqWVGA7DxFXNjTVSOzRoHuG4=;
        b=j7cIFPas5jfKqwiFHCuCTXifT4Ib5q9ik0ryclYyYWe9fiXx74WRFi1GsMMkPxYXhg
         Kn3yCHhnVNe3urslKzNNdOTzGMudPqfh70VsDDusQIYIr3RmkaExe39QG2QwdindS5zA
         MIdku0CqAJK1grvcZPvOOJE5KXR+B5+gPUi8iz0jaF3943nFP6VcZ5mVNPjRZkfdvhde
         s64hwfDTArhn/pcUWsgFahRD2kx4/VX2H40PVnXy/udk/4dNRnV9f11+6OvS2nP6oQvb
         dwIrVbuiL/Ek6o0gOwNrAbQPC2NYHpf37IPIkN2t4iUJkszVqZQeRt2QfHrixGYDwEha
         qX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nXqmbX/V6JKg4via1Z9RqWVGA7DxFXNjTVSOzRoHuG4=;
        b=gDaawt5snMLm8zZt6ZC8efHKSKSmrqrA9Ao5COWYU4Ek3TC5awkLIDpOCbSDnBUg0E
         QPAqmCyUapfM8lvwqmZBt/SjOvg7OESgTCi3aCLmE2n/mIK0To445yhxOnDa2r+69li9
         9SE82WgiLzqI4v/ZnsmouDif23s+gUEHt0wYk6aL1Pf0oDi9vjEuCyihvoYGaGPiETe8
         xnCOsgID/2/1RpduLEQaQh60SYs0bwVYc6afNNltxA4bCg4+lo9DCB1Xv9Lmisz4OTIN
         TLFskcgbIASgPXV0d9G29bFBHaMipGxQGcxNloDoawoBiAWcRUnV+Y1GiRT6abv6MzZm
         X6YA==
X-Gm-Message-State: AGi0PuYVzz91jXi7L2BHEiiOgjDryw1H1dduYx7IahAcFhCzXB6T3xiT
	Ixm9Lltn3RPjyqezmNACPyrDHrPsxQg=
X-Google-Smtp-Source: APiQypL0EP+7uzS4nsa7P1IP6BZrW8ABAVI1VVl7+RT/Td8POUb/7VccK9/ClaRiSh4/DOOYyABc8w==
X-Received: by 2002:aa7:8619:: with SMTP id p25mr18477376pfn.105.1589247377178;
        Mon, 11 May 2020 18:36:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::8caf])
        by smtp.gmail.com with ESMTPSA id i72sm10898675pfe.104.2020.05.11.18.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 18:36:16 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] pmdk: Update to 1.8
Date: Mon, 11 May 2020 18:36:13 -0700
Message-Id: <20200512013613.230627-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Licence-Update: Update copyright headers and drop jeamalloc [1]

* Drop upstreamed patch
* Drop jemalloc patch, its no longer applicable
* Fix build with gcc10

[1] https://github.com/pmem/pmdk/commit/bd13816e7c784430343bcc2a7b53314ab998bf62#diff-9879d6db96fd29134fc802214163b95a

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-examples-Initialize-child_idx.patch  | 30 +++++++++++++++++
 ...c.cfg-Specify-the-host-when-building.patch | 29 ----------------
 ...reeBSD__-to-control-secure_getenv-de.patch | 33 -------------------
 .../pmdk/{pmdk_1.7.bb => pmdk_1.8.bb}         | 11 ++++---
 4 files changed, 37 insertions(+), 66 deletions(-)
 create mode 100644 meta-oe/recipes-extended/pmdk/files/0001-examples-Initialize-child_idx.patch
 delete mode 100644 meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
 delete mode 100644 meta-oe/recipes-extended/pmdk/files/0001-os_posix-Use-__FreeBSD__-to-control-secure_getenv-de.patch
 rename meta-oe/recipes-extended/pmdk/{pmdk_1.7.bb => pmdk_1.8.bb} (82%)

diff --git a/meta-oe/recipes-extended/pmdk/files/0001-examples-Initialize-child_idx.patch b/meta-oe/recipes-extended/pmdk/files/0001-examples-Initialize-child_idx.patch
new file mode 100644
index 0000000000..3fa0aa11fb
--- /dev/null
+++ b/meta-oe/recipes-extended/pmdk/files/0001-examples-Initialize-child_idx.patch
@@ -0,0 +1,30 @@
+From c9952e450b278e4c11d49e05b702ea574b9444eb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 11 May 2020 18:01:11 -0700
+Subject: [PATCH] examples: Initialize child_idx
+
+Fixes warning
+rtree_map.c:358:12: error: 'child_idx' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+
+Upstream-Status: Submitted [https://github.com/pmem/pmdk/pull/4802]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/examples/libpmemobj/tree_map/rtree_map.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/examples/libpmemobj/tree_map/rtree_map.c b/src/examples/libpmemobj/tree_map/rtree_map.c
+index 995e22bb9..38ebaae48 100644
+--- a/src/examples/libpmemobj/tree_map/rtree_map.c
++++ b/src/examples/libpmemobj/tree_map/rtree_map.c
+@@ -320,7 +320,7 @@ has_only_one_child(TOID(struct tree_map_node) node, unsigned *child_idx)
+ static void
+ remove_extra_node(TOID(struct tree_map_node) *node)
+ {
+-	unsigned child_idx;
++	unsigned child_idx = 0;
+ 	TOID(struct tree_map_node) tmp, tmp_child;
+ 
+ 	/* Our node has child with only one child. */
+-- 
+2.26.2
+
diff --git a/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch b/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
deleted file mode 100644
index ca2a1f6430..0000000000
--- a/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 231eb4c75fbfaaf90bca7702bdaf55cf701a3527 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Mon, 23 Jul 2018 11:23:39 -0700
-Subject: [PATCH] jemalloc/jemalloc.cfg: Specify the host when building
- jemalloc
-
-To avoid this error:
-    configure: error: cannot run C compiled programs.
-    If you meant to cross compile, use `--host'.
-when cross compiling specify the host when configuring jemalloc.
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream-Status: Inappropriate [configuration]
----
- src/jemalloc/jemalloc.cfg | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/jemalloc/jemalloc.cfg b/src/jemalloc/jemalloc.cfg
-index 196129de6..79ebbab1c 100644
---- a/src/jemalloc/jemalloc.cfg
-+++ b/src/jemalloc/jemalloc.cfg
-@@ -3,3 +3,4 @@
- --with-private-namespace=je_vmem_
- --disable-xmalloc
- --disable-munmap
-+--host=${HOST_SYS}
--- 
-2.14.4
-
diff --git a/meta-oe/recipes-extended/pmdk/files/0001-os_posix-Use-__FreeBSD__-to-control-secure_getenv-de.patch b/meta-oe/recipes-extended/pmdk/files/0001-os_posix-Use-__FreeBSD__-to-control-secure_getenv-de.patch
deleted file mode 100644
index 33f25b6a6b..0000000000
--- a/meta-oe/recipes-extended/pmdk/files/0001-os_posix-Use-__FreeBSD__-to-control-secure_getenv-de.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 7d0732d69a774e28bc46b8b487d9f61bdd8afbff Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 6 Oct 2019 18:15:44 -0700
-Subject: [PATCH] os_posix: Use __FreeBSD__ to control secure_getenv definition
-
-__USE_GNU does not cover all Linux platforms, e.g. when using musl as C
-library, __USE_GNU may not be defined but it does provide secure_getenv
-so instead of narrowing the else condition, lets speicifically check for
-FreeBSD being the platform, since that seems to be the intention here
-anyway
-
-Upstream-Status: Submitted [https://github.com/pmem/pmdk/pull/3999]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/common/os_posix.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/common/os_posix.c b/src/common/os_posix.c
-index a9a37ef84..052db2383 100644
---- a/src/common/os_posix.c
-+++ b/src/common/os_posix.c
-@@ -346,7 +346,7 @@ os_setenv(const char *name, const char *value, int overwrite)
- /*
-  * secure_getenv -- provide GNU secure_getenv for FreeBSD
-  */
--#ifndef __USE_GNU
-+#if defined(__FreeBSD__)
- static char *
- secure_getenv(const char *name)
- {
--- 
-2.23.0
-
diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.7.bb b/meta-oe/recipes-extended/pmdk/pmdk_1.8.bb
similarity index 82%
rename from meta-oe/recipes-extended/pmdk/pmdk_1.7.bb
rename to meta-oe/recipes-extended/pmdk/pmdk_1.8.bb
index f5066da0d8..fe7b760e22 100644
--- a/meta-oe/recipes-extended/pmdk/pmdk_1.7.bb
+++ b/meta-oe/recipes-extended/pmdk/pmdk_1.8.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Persistent Memory Development Kit"
 HOMEPAGE = "http://pmem.io"
 SECTION = "libs"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7db1106255a1baa80391fd2e21eebab7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1b8430f251523f1bff0c9fb95da7e0ca"
 DEPENDS = "ndctl"
 
 # Required to have the fts.h header for musl
@@ -12,12 +12,11 @@ DEPENDS_append_libc-musl = " fts"
 S = "${WORKDIR}/git"
 
 SRC_URI = "git://github.com/pmem/pmdk.git \
-           file://0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch \
+           file://0001-examples-Initialize-child_idx.patch \
            file://0002-Makefile-Don-t-install-the-docs.patch \
-           file://0001-os_posix-Use-__FreeBSD__-to-control-secure_getenv-de.patch \
           "
 
-SRCREV = "bc5e309485df61c452d08367e4b13ba9dfed5071"
+SRCREV = "0245d75eaf0f6106c86a7926a45fdf2149e37eaa"
 
 inherit autotools-brokensep pkgconfig
 
@@ -31,6 +30,10 @@ EXTRA_OEMAKE = "BUILD_EXAMPLES='n' HOST_SYS='${HOST_SYS}' EXTRA_CFLAGS='${SELECT
 # Fix the missing fts libs when using musl
 EXTRA_OEMAKE_append_libc-musl = " EXTRA_LIBS='-lfts'"
 
+do_configure_prepend() {
+	touch .skip-doc
+}
+
 do_install() {
 	oe_runmake prefix=${prefix} DESTDIR=${D} install
 
-- 
2.26.2

