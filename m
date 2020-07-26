Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.20915.1595723451788782041
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 17:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=tfOvbgfe;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.54, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f54.google.com with SMTP id 140so7134701lfi.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 17:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=smBJWptg273E5RrDw9ow8pOuT9v35JRhfI5pFazDFuM=;
        b=tfOvbgfeYkn9M5RpbStBbIt0p6Y7fHI1W7dkfv9wUsM9Pg4y4wbO7+T9+tSGJu1WFt
         wf0WkK7fnrbSKzOfQ3raYDP4lJq98gCct/D6ch2K4cN7zpwJ1Xfn1PDFS1Vc8rUSkTIm
         W04S9oTMiBUj7GH3QeaWZZnQnH9wXr08i/GW7t7MDKZTS0iPZ5pcnf6qLj6v4d4kqDaz
         klmX8t1iqrUjPCgkJCy210d7EfRrBhfd4MHtcgiKzqUHmj0G2EFBMoNRAoH38ltF4gW+
         btpqvyoKnyMarO3OtYHk1Hu7D7wGmYzYHYDwqitvgnC3b6y3xp8T+Qe/f/HBk+iIN3aJ
         Nmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=smBJWptg273E5RrDw9ow8pOuT9v35JRhfI5pFazDFuM=;
        b=GnSDraq+qOHTbXfqyq/y2F8BZ/SmjjYs3uk5T4fBB1PTrrukk6LGr5DWoDyUKjXlSA
         3Ki12V7SWrwuFAq752gDFPgCtCfgmei2lmysr4evoIBwsMThTvAgCkV+CAEn9017LhEB
         ItbddErhYAL6Rkt3c5YDm41MQxu0UYqmpmGBjQe86kjAvNqufXPYLyaVuW+kP6egxBGy
         jxwo0w1aoFjHuewcZsqKJC+xHmSWdoEe8en0MmnmoPLUWhE2ZcFZq+O8YJqzuLRNo7uP
         hCjMDzTKuTFD7UHR0i9uonIGmMQtJBHEjRQQq1j/cCKBW5iX3s7Qw+qi++RCnAIWMx0c
         ZcNg==
X-Gm-Message-State: AOAM533jvX16Ayg8nl1nFQQTMxSL0mUu47KGLwnbTWpMcXfQXSw7aUlq
	2aLLSQ5xFiLPUMhfmEzCPIlNh7X8LaU=
X-Google-Smtp-Source: ABdhPJwZ4w3nci1v2LM0cPAQoxE1a6W7UCfC+5FKQMrHpIHvdtqtTG2t3jN98fe+P+F9lPOMJsc9ZQ==
X-Received: by 2002:a19:4345:: with SMTP id m5mr8382262lfj.60.1595723449390;
        Sat, 25 Jul 2020 17:30:49 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id o68sm1834349lff.57.2020.07.25.17.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 17:30:48 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] pmdk: update to 1.9
Date: Sun, 26 Jul 2020 02:30:46 +0200
Message-Id: <20200726003046.3023035-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed patches:
- 0001- was upstreamed
- 0002- is now with with passing a config option

License checksum changed due to modified copyright years.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../0001-examples-Initialize-child_idx.patch  | 47 -------------------
 ...0002-Makefile-Don-t-install-the-docs.patch | 26 ----------
 .../pmdk/{pmdk_1.8.bb => pmdk_1.9.bb}         | 11 ++---
 3 files changed, 4 insertions(+), 80 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/pmdk/files/0001-examples-Initialize-child_idx.patch
 delete mode 100644 meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
 rename meta-oe/recipes-extended/pmdk/{pmdk_1.8.bb => pmdk_1.9.bb} (73%)

diff --git a/meta-oe/recipes-extended/pmdk/files/0001-examples-Initialize-child_idx.patch b/meta-oe/recipes-extended/pmdk/files/0001-examples-Initialize-child_idx.patch
deleted file mode 100644
index 8e2b3c7cbb..0000000000
--- a/meta-oe/recipes-extended/pmdk/files/0001-examples-Initialize-child_idx.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 721a48e5397bd4ab454482041e55671eae7b189f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 11 May 2020 18:01:11 -0700
-Subject: [PATCH] examples: Initialize child_idx
-
-Assign UINT_MAX and assert it
-
-Fixes warning
-rtree_map.c:358:12: error: 'child_idx' may be used uninitialized
-in this function [-Werror=maybe-uninitialized]
-
-Upstream-Status: Submitted [https://github.com/pmem/pmdk/pull/4802]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/examples/libpmemobj/tree_map/rtree_map.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/examples/libpmemobj/tree_map/rtree_map.c b/src/examples/libpmemobj/tree_map/rtree_map.c
-index 995e22bb9..6b3ead65c 100644
---- a/src/examples/libpmemobj/tree_map/rtree_map.c
-+++ b/src/examples/libpmemobj/tree_map/rtree_map.c
-@@ -8,6 +8,7 @@
- #include <ex_common.h>
- #include <assert.h>
- #include <errno.h>
-+#include <limits.h>
- #include <stdlib.h>
- #include <stdbool.h>
- 
-@@ -320,12 +321,13 @@ has_only_one_child(TOID(struct tree_map_node) node, unsigned *child_idx)
- static void
- remove_extra_node(TOID(struct tree_map_node) *node)
- {
--	unsigned child_idx;
-+	unsigned child_idx = UINT_MAX;
- 	TOID(struct tree_map_node) tmp, tmp_child;
- 
- 	/* Our node has child with only one child. */
- 	tmp = *node;
- 	has_only_one_child(tmp, &child_idx);
-+	assert(child_idx != UINT_MAX);
- 	tmp_child = D_RO(tmp)->slots[child_idx];
- 
- 	/*
--- 
-2.26.2
-
diff --git a/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch b/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
deleted file mode 100644
index 82b96cf95e..0000000000
--- a/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 3863d8bd71d6a5638cf984f8d8f9cccac0c7f2a4 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Mon, 23 Jul 2018 11:31:17 -0700
-Subject: [PATCH] Makefile: Don't install the docs
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream-Status: Inappropriate [disable feature]
----
- Makefile | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 47a447f12..7c0f9848f 100644
---- a/Makefile
-+++ b/Makefile
-@@ -148,7 +148,6 @@ rpm dpkg: pkg-clean
- 
- install uninstall:
- 	$(MAKE) -C src $@
--	$(MAKE) -C doc $@
- 
- .PHONY: all clean clobber test check cstyle check-license install uninstall\
- 	source rpm dpkg pkg-clean pcheck check-remote format doc require-rpmem\
--- 
-2.14.4
-
diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.8.bb b/meta-oe/recipes-extended/pmdk/pmdk_1.9.bb
similarity index 73%
rename from meta-oe/recipes-extended/pmdk/pmdk_1.8.bb
rename to meta-oe/recipes-extended/pmdk/pmdk_1.9.bb
index fe7b760e22..8bb89f418c 100644
--- a/meta-oe/recipes-extended/pmdk/pmdk_1.8.bb
+++ b/meta-oe/recipes-extended/pmdk/pmdk_1.9.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Persistent Memory Development Kit"
 HOMEPAGE = "http://pmem.io"
 SECTION = "libs"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1b8430f251523f1bff0c9fb95da7e0ca"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b44ee63f162f9cdb18fff1224877aafd"
 DEPENDS = "ndctl"
 
 # Required to have the fts.h header for musl
@@ -11,12 +11,9 @@ DEPENDS_append_libc-musl = " fts"
 
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://github.com/pmem/pmdk.git \
-           file://0001-examples-Initialize-child_idx.patch \
-           file://0002-Makefile-Don-t-install-the-docs.patch \
-          "
+SRC_URI = "git://github.com/pmem/pmdk.git"
 
-SRCREV = "0245d75eaf0f6106c86a7926a45fdf2149e37eaa"
+SRCREV = "1926ffb8f3f5f0617b3b3ed32029d437c272f187"
 
 inherit autotools-brokensep pkgconfig
 
@@ -25,7 +22,7 @@ inherit autotools-brokensep pkgconfig
 # | If you meant to cross compile, use `--host'.
 #
 # Also fix #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
-EXTRA_OEMAKE = "BUILD_EXAMPLES='n' HOST_SYS='${HOST_SYS}' EXTRA_CFLAGS='${SELECTED_OPTIMIZATION}' LIB_PREFIX=${baselib}"
+EXTRA_OEMAKE = "BUILD_EXAMPLES='n' DOC='n' HOST_SYS='${HOST_SYS}' EXTRA_CFLAGS='${SELECTED_OPTIMIZATION}' LIB_PREFIX=${baselib}"
 
 # Fix the missing fts libs when using musl
 EXTRA_OEMAKE_append_libc-musl = " EXTRA_LIBS='-lfts'"
-- 
2.25.1

