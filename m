Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B369CAC58F
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 17:10:10 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.26255.1726593001892020585
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Sep 2024 10:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ogmu+HaU;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2daaa9706a9so4817093a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 10:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726593001; x=1727197801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rk6IrQiP0hlglhOpqYjgGAOd81J/ka0qa1x7bDKYHL4=;
        b=Ogmu+HaUCdPdZvwNG6MYtmdH3Sfzt26da6DxbM3y75/jIhzxYIuWJpnkOgl1xYvOnV
         cwmeW+ulqN9mrHGy9SloZCR7Trs/gVpILt8h0gKipA+vuAZPvw0pmXzuyQVlLGNwYJj1
         YabJsu3iKeqpaZUu3Pksh13/LGX8LLCumq5DorJwGXzItVPagXEOYEMuTSp1t10GpeU+
         Ily496AHbmIbivYQv0R9umm/n4MfW3BiQm0SnYE23vmuN4GkiX7k1Gr2cwoGQdUuhSEn
         dvGayXi43EqWNRkA97GTObJCI96OOzxOWwqj+VvnhHvAukpJLo6lGO7MVAr9xZVpCXVu
         hU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726593001; x=1727197801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rk6IrQiP0hlglhOpqYjgGAOd81J/ka0qa1x7bDKYHL4=;
        b=UvUpadhwHFpFDzh7zCHNKAtv/ENN5FRMNuLukWzSnv6aaBh+EKIffmLXrDvBcW3u6m
         Fir9oBnnoqC+uTqP6CR7pufuCh5bMcFddAd4yBP75MGuXHX7wNXDQ9OS8eqhR23xKBBr
         AVPe9HIV8ZBNNxbbrNFt6yc3gmdqB3Hs0odfDtG7i7sLPgP15GA6Bs+dRjG2E48NbVpD
         H8H1yyLyY5aZm3qZOqFJnor4+Dn5myVKYRYXtV+XtjTgDlc3Lpgx5UwwdtlMN77uCxMM
         6lfs1YUVoO+T7W2RTeJuN4UfTVRiBNwyqulwFR1BQ0BctqmRD/epOZJtpNmWh1Ax53ll
         ul5Q==
X-Gm-Message-State: AOJu0YwMbslrysN6PCb37jurcQQ9xDJBIysFgVjFM0QtGf6d5O54RDgk
	Y9onR66KwhpxUv2n+pRybH35YqfNTAjwG6dZCymH/xh7KaHEBt8dS/MBpxnf
X-Google-Smtp-Source: AGHT+IGFpRKm2WHnoO4ZkpSwSq3InIGfifCgCh84myftFV+R6d9X6jNAxJl+LbWjhdgWZKT+x+DDlw==
X-Received: by 2002:a17:90a:b38d:b0:2dd:4f6b:638d with SMTP id 98e67ed59e1d1-2dd4f6b6801mr3014000a91.17.1726593000857;
        Tue, 17 Sep 2024 10:10:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::2c8d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbcfdbf93bsm7525340a91.54.2024.09.17.10.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 10:09:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] liburing: Upgrade to 2.7 and fix build on riscv32
Date: Tue, 17 Sep 2024 10:09:57 -0700
Message-ID: <20240917170957.764179-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 17:10:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112346

Fix build regression with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix build failure on musl

 ...ibc.c-only-when-CONFIG_NOLIBC-is-set.patch | 43 +++++++++++++++++++
 ...1-test-Drop-including-error.h-header.patch | 27 ++++++++++++
 ...-Include-poll.h-instead-of-sys-poll..patch | 32 ++++++++++++++
 .../{liburing_2.6.bb => liburing_2.7.bb}      | 10 +++--
 4 files changed, 109 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/liburing/liburing/0001-test-Compile-nolibc.c-only-when-CONFIG_NOLIBC-is-set.patch
 create mode 100644 meta-oe/recipes-support/liburing/liburing/0001-test-Drop-including-error.h-header.patch
 create mode 100644 meta-oe/recipes-support/liburing/liburing/0002-ooo-file-unreg.c-Include-poll.h-instead-of-sys-poll..patch
 rename meta-oe/recipes-support/liburing/{liburing_2.6.bb => liburing_2.7.bb} (75%)

diff --git a/meta-oe/recipes-support/liburing/liburing/0001-test-Compile-nolibc.c-only-when-CONFIG_NOLIBC-is-set.patch b/meta-oe/recipes-support/liburing/liburing/0001-test-Compile-nolibc.c-only-when-CONFIG_NOLIBC-is-set.patch
new file mode 100644
index 0000000000..90f028b856
--- /dev/null
+++ b/meta-oe/recipes-support/liburing/liburing/0001-test-Compile-nolibc.c-only-when-CONFIG_NOLIBC-is-set.patch
@@ -0,0 +1,43 @@
+From 7ea4e55a91e6d5564c6de762c2d1afc78ff9cfd3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 16 Sep 2024 22:58:38 +0000
+Subject: [PATCH] test: Compile nolibc.c only when CONFIG_NOLIBC is set
+
+building nolibc.c fails for non nolibc targets
+
+Fixes
+In file included from nolibc.c:33:
+./../src/lib.h:20:2: error: "This arch doesn't support building liburing without libc"
+   20 | #error "This arch doesn't support building liburing without libc"
+      |  ^
+1 error generated.
+
+Upstream-Status: Backport [https://github.com/axboe/liburing/commit/a182f62c01f981cd9dd508ec952fbc975b263e3d]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/Makefile | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/test/Makefile b/test/Makefile
+index 0538a75..0dfecb8 100644
+--- a/test/Makefile
++++ b/test/Makefile
+@@ -126,7 +126,6 @@ test_srcs := \
+ 	msg-ring-overflow.c \
+ 	multicqes_drain.c \
+ 	no-mmap-inval.c \
+-	nolibc.c \
+ 	nop-all-sizes.c \
+ 	nop.c \
+ 	ooo-file-unreg.c \
+@@ -221,6 +220,10 @@ test_srcs := \
+ all_targets :=
+ include ../Makefile.quiet
+ 
++ifeq ($(CONFIG_NOLIBC),y)
++	test_srcs += nolibc.c
++endif
++
+ ifdef CONFIG_HAVE_STATX
+ 	test_srcs += statx.c
+ else ifdef CONFIG_HAVE_GLIBC_STATX
diff --git a/meta-oe/recipes-support/liburing/liburing/0001-test-Drop-including-error.h-header.patch b/meta-oe/recipes-support/liburing/liburing/0001-test-Drop-including-error.h-header.patch
new file mode 100644
index 0000000000..62ca78a1ed
--- /dev/null
+++ b/meta-oe/recipes-support/liburing/liburing/0001-test-Drop-including-error.h-header.patch
@@ -0,0 +1,27 @@
+From 684bcb2a8795fd399d6c164e51459a2785057b1c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 17 Sep 2024 09:56:42 -0700
+Subject: [PATCH 1/2] test: Drop including error.h header
+
+There is no error APIs being used in this test, therefore
+drop including it, this also makes it portable to musl
+systems which do not have error.h
+
+Upstream-Status: Submitted [https://github.com/axboe/liburing/pull/1233]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/init-mem.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/test/init-mem.c b/test/init-mem.c
+index 6f9a02a..f512190 100644
+--- a/test/init-mem.c
++++ b/test/init-mem.c
+@@ -13,7 +13,6 @@
+ #include <netinet/udp.h>
+ #include <arpa/inet.h>
+ #include <net/if.h>
+-#include <error.h>
+ 
+ #include "liburing.h"
+ #include "helpers.h"
diff --git a/meta-oe/recipes-support/liburing/liburing/0002-ooo-file-unreg.c-Include-poll.h-instead-of-sys-poll..patch b/meta-oe/recipes-support/liburing/liburing/0002-ooo-file-unreg.c-Include-poll.h-instead-of-sys-poll..patch
new file mode 100644
index 0000000000..8a1d542502
--- /dev/null
+++ b/meta-oe/recipes-support/liburing/liburing/0002-ooo-file-unreg.c-Include-poll.h-instead-of-sys-poll..patch
@@ -0,0 +1,32 @@
+From d06433ff1a1905436cfcde80e22ee51bd9591536 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 17 Sep 2024 09:59:31 -0700
+Subject: [PATCH 2/2] ooo-file-unreg.c: Include poll.h instead of sys/poll.h
+
+This fixes a warning e.g.
+
+In file included from ooo-file-unreg.c:12:
+/mnt/b/yoe/master/build/tmp/work/riscv32-yoe-linux-musl/liburing/2.7/recipe-sysroot/usr/include/sys/poll.h:1:2: warning: redirecting incorrect #include <sys/poll.h> to <poll.h> [-W#warnings]
+    1 | #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
+      |  ^
+1 warning generated.
+
+Upstream-Status: Submitted [https://github.com/axboe/liburing/pull/1233]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/ooo-file-unreg.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/ooo-file-unreg.c b/test/ooo-file-unreg.c
+index d76e0fb..dd6ea55 100644
+--- a/test/ooo-file-unreg.c
++++ b/test/ooo-file-unreg.c
+@@ -9,7 +9,7 @@
+ #include <sys/socket.h>
+ #include <unistd.h>
+ #include <stdlib.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ 
+ #include "liburing.h"
+ #include "helpers.h"
diff --git a/meta-oe/recipes-support/liburing/liburing_2.6.bb b/meta-oe/recipes-support/liburing/liburing_2.7.bb
similarity index 75%
rename from meta-oe/recipes-support/liburing/liburing_2.6.bb
rename to meta-oe/recipes-support/liburing/liburing_2.7.bb
index fc3fe1cac1..b10fe40ca0 100644
--- a/meta-oe/recipes-support/liburing/liburing_2.6.bb
+++ b/meta-oe/recipes-support/liburing/liburing_2.7.bb
@@ -9,8 +9,11 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-only | MIT"
 LIC_FILES_CHKSUM = "file://README;beginline=41;endline=44;md5=2b0e9926530c269f5ae95560370195af"
 
-SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https"
-SRCREV = "f7dcc1ea60819475dffd3a45059e16f04381bee7"
+SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https \
+           file://0001-test-Compile-nolibc.c-only-when-CONFIG_NOLIBC-is-set.patch \
+           file://0001-test-Drop-including-error.h-header.patch \
+           file://0002-ooo-file-unreg.c-Include-poll.h-instead-of-sys-poll..patch"
+SRCREV = "5227d48b28ad8671e61d444b72678da584d2e6c3"
 
 S = "${WORKDIR}/git"
 
@@ -19,10 +22,11 @@ XCFLAGS = "-pthread"
 XCFLAGS:append:libc-musl = " -lucontext"
 
 USELIBC = ""
-# clang-18 on RV64 emits memset for arch/riscv64/syscall.h provided __do_syscall4 macro
+# clang-18+ on RV64 emits memset for arch/riscv64/syscall.h provided __do_syscall4 macro
 # this does not happen for gcc or older clang, so link with libc since we need memset API
 # -fno-builtin-memset does not help
 USELIBC:riscv64:toolchain-clang = "--use-libc"
+USELIBC:riscv32 = "--use-libc"
 EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'LDFLAGS=${LDFLAGS}' 'XCFLAGS=${XCFLAGS}' 'BUILDDIR=${S}'"
 do_configure() {
     ${S}/configure --prefix=${prefix} --libdir=${libdir} --libdevdir=${libdir} --mandir=${mandir} --datadir=${datadir} --includedir=${includedir} ${USELIBC}

