Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975C7C021A9
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 05:43:57 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.13384.1739857427611357238
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Feb 2025 21:43:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SjsOLUCi;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22114b800f7so37525495ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 21:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739857426; x=1740462226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ryq0w9GJm0oaot0nF4P/Swxnh99KMjKLxMCBo2xQJLA=;
        b=SjsOLUCiYt3Cqbq6mW2sGqaZeI5eA912RYaKCx61iNtvVdtIVGrDaH/ZzT8wlQThVr
         eJ8wcW8kbNENKzNw/W92h0Kbh8Obw2IkM/+fFHag9LjEjPYwfhsKPApB7ioIhUqAhbqX
         PkbnUazdUeK403RUyQ9csO99CePOM84k6/FsRXFzBl/5ym4bXEKekQfDVArTNP7X5GdZ
         cCqsJPlyWbJdXKkAScF0QGnEmF6aH1Q06t1n1NjeuaEPpx2HmO5kuuPyP/ep7TNtAEyC
         moLG4vibDmcrz2pRu5AAXh3/YVktprtJ+VziWmDLFc62Pk9I5E7YFR0vtl+05VG+YdGu
         xvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739857426; x=1740462226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ryq0w9GJm0oaot0nF4P/Swxnh99KMjKLxMCBo2xQJLA=;
        b=rYYMLlEai8Wlnv/udKh67JFnUch4Hizqf+3fPRcVpNPVhvDxVwtr3v+qrcLnlnK4zO
         aDWDWwq69A95lL67As+k/MjRe3l/I4VzX36ksaSQoYhnkbiEAojVl5Kbxio1dzZFKMyr
         dFbedJsereJUMY91/rwCRSGwKkrAofMW16s5dmrMJefHiK4USgnerj/ZcjYhV7t6YXRa
         +zAWLEKhKilj2ERYOkAYLNsb/rcC1sMldpGUeJ2ERfBQziiTtCBaO+nBsCpAydemHrp7
         SamuAaoxcbBOaq/1p1OjlAmHT0p86HgzDErre38mejWp7JbkkQ5Cn+GnPpV2cUzoADJv
         SggA==
X-Gm-Message-State: AOJu0YwfV24TlNjAKVDqIyqB9FUYNJv/9MSYOWvc2YQUnRX99bfUB5Dh
	HmKTY2cvDb0K6WosYEunT3DKLYwfQ5jIeXREkARoyzgPH5nce2cuanGgXGh1
X-Gm-Gg: ASbGncu02FWIOhWrB0SX9+nFFBAC0ylTnA3PZoTgzycNvkI4EJNEXuyrgFgh9HSm5K9
	4uLYc6QgYiDpOSmw42tS8HYMBRCHM0mZ1HrDf7ngB6lcuNV9gK1kMO6v4nX1gv9mIiBGkUcdgo0
	lJ75B5Eg76fiA+2Gt4ylXtUY1Bz8G8gbdFjtEr4MoKbK2T7z3Lpt45825bt0h1TowwoZoPBdPLa
	bpypGWjBwtE3usl2Z4p95yzEvJ0yTT/GFw3C5A7Fe1eSlUYDvhFOBqA7O0A2zJD9+aZ9KJzdi91
	JKc63eI=
X-Google-Smtp-Source: AGHT+IF0p61A1i3bQZtfD9nLTg3rSdjNZPh9lGzadH7PmgKTC398eZvvWwEDdstv7sp3cdqV9QE/2w==
X-Received: by 2002:a05:6a00:8585:b0:732:623d:2cc5 with SMTP id d2e1a72fcca58-732623d2e5bmr15758723b3a.10.1739857426333;
        Mon, 17 Feb 2025 21:43:46 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::dd76])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73285a7bfbfsm2276217b3a.154.2025.02.17.21.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 21:43:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] liburing: Upgrade to 2.9
Date: Mon, 17 Feb 2025 21:43:41 -0800
Message-ID: <20250218054344.2476688-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Feb 2025 05:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115516

Drop upstreamed patches, fix build with latest musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ibc.c-only-when-CONFIG_NOLIBC-is-set.patch | 43 -------------------
 ...1-test-Drop-including-error.h-header.patch | 27 ------------
 ...ncluding-missing-string.h-for-memcpy.patch | 39 +++++++++++++++++
 ...-Include-poll.h-instead-of-sys-poll..patch | 32 --------------
 .../{liburing_2.7.bb => liburing_2.9.bb}      |  6 +--
 5 files changed, 41 insertions(+), 106 deletions(-)
 delete mode 100644 meta-oe/recipes-support/liburing/liburing/0001-test-Compile-nolibc.c-only-when-CONFIG_NOLIBC-is-set.patch
 delete mode 100644 meta-oe/recipes-support/liburing/liburing/0001-test-Drop-including-error.h-header.patch
 create mode 100644 meta-oe/recipes-support/liburing/liburing/0001-test-Including-missing-string.h-for-memcpy.patch
 delete mode 100644 meta-oe/recipes-support/liburing/liburing/0002-ooo-file-unreg.c-Include-poll.h-instead-of-sys-poll..patch
 rename meta-oe/recipes-support/liburing/{liburing_2.7.bb => liburing_2.9.bb} (83%)

diff --git a/meta-oe/recipes-support/liburing/liburing/0001-test-Compile-nolibc.c-only-when-CONFIG_NOLIBC-is-set.patch b/meta-oe/recipes-support/liburing/liburing/0001-test-Compile-nolibc.c-only-when-CONFIG_NOLIBC-is-set.patch
deleted file mode 100644
index 90f028b856..0000000000
--- a/meta-oe/recipes-support/liburing/liburing/0001-test-Compile-nolibc.c-only-when-CONFIG_NOLIBC-is-set.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 7ea4e55a91e6d5564c6de762c2d1afc78ff9cfd3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 16 Sep 2024 22:58:38 +0000
-Subject: [PATCH] test: Compile nolibc.c only when CONFIG_NOLIBC is set
-
-building nolibc.c fails for non nolibc targets
-
-Fixes
-In file included from nolibc.c:33:
-./../src/lib.h:20:2: error: "This arch doesn't support building liburing without libc"
-   20 | #error "This arch doesn't support building liburing without libc"
-      |  ^
-1 error generated.
-
-Upstream-Status: Backport [https://github.com/axboe/liburing/commit/a182f62c01f981cd9dd508ec952fbc975b263e3d]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- test/Makefile | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/test/Makefile b/test/Makefile
-index 0538a75..0dfecb8 100644
---- a/test/Makefile
-+++ b/test/Makefile
-@@ -126,7 +126,6 @@ test_srcs := \
- 	msg-ring-overflow.c \
- 	multicqes_drain.c \
- 	no-mmap-inval.c \
--	nolibc.c \
- 	nop-all-sizes.c \
- 	nop.c \
- 	ooo-file-unreg.c \
-@@ -221,6 +220,10 @@ test_srcs := \
- all_targets :=
- include ../Makefile.quiet
- 
-+ifeq ($(CONFIG_NOLIBC),y)
-+	test_srcs += nolibc.c
-+endif
-+
- ifdef CONFIG_HAVE_STATX
- 	test_srcs += statx.c
- else ifdef CONFIG_HAVE_GLIBC_STATX
diff --git a/meta-oe/recipes-support/liburing/liburing/0001-test-Drop-including-error.h-header.patch b/meta-oe/recipes-support/liburing/liburing/0001-test-Drop-including-error.h-header.patch
deleted file mode 100644
index 62ca78a1ed..0000000000
--- a/meta-oe/recipes-support/liburing/liburing/0001-test-Drop-including-error.h-header.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 684bcb2a8795fd399d6c164e51459a2785057b1c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 17 Sep 2024 09:56:42 -0700
-Subject: [PATCH 1/2] test: Drop including error.h header
-
-There is no error APIs being used in this test, therefore
-drop including it, this also makes it portable to musl
-systems which do not have error.h
-
-Upstream-Status: Submitted [https://github.com/axboe/liburing/pull/1233]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- test/init-mem.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/test/init-mem.c b/test/init-mem.c
-index 6f9a02a..f512190 100644
---- a/test/init-mem.c
-+++ b/test/init-mem.c
-@@ -13,7 +13,6 @@
- #include <netinet/udp.h>
- #include <arpa/inet.h>
- #include <net/if.h>
--#include <error.h>
- 
- #include "liburing.h"
- #include "helpers.h"
diff --git a/meta-oe/recipes-support/liburing/liburing/0001-test-Including-missing-string.h-for-memcpy.patch b/meta-oe/recipes-support/liburing/liburing/0001-test-Including-missing-string.h-for-memcpy.patch
new file mode 100644
index 0000000000..f744812a3f
--- /dev/null
+++ b/meta-oe/recipes-support/liburing/liburing/0001-test-Including-missing-string.h-for-memcpy.patch
@@ -0,0 +1,39 @@
+From c55874bc28f66d606527b940d4bd0f266bbaaa2c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Feb 2025 11:51:19 -0800
+Subject: [PATCH] test: Including missing string.h for memcpy
+
+Fixes
+accept-test.c:39:2: error: call to undeclared library function 'memcpy' with type 'void *(void *, const void *, unsigned long)'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+
+Upstream-Status: Submitted [https://github.com/axboe/liburing/pull/1351]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/232c93d07b74.c | 1 +
+ test/accept-test.c  | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/test/232c93d07b74.c b/test/232c93d07b74.c
+index d3053b9..d5677d3 100644
+--- a/test/232c93d07b74.c
++++ b/test/232c93d07b74.c
+@@ -10,6 +10,7 @@
+ #include <stdlib.h>
+ #include <stdint.h>
+ #include <assert.h>
++#include <string.h>
+ 
+ #include <pthread.h>
+ #include <errno.h>
+diff --git a/test/accept-test.c b/test/accept-test.c
+index 99f6080..142b2de 100644
+--- a/test/accept-test.c
++++ b/test/accept-test.c
+@@ -7,6 +7,7 @@
+ #include <sys/socket.h>
+ #include <sys/un.h>
+ #include <assert.h>
++#include <string.h>
+ #include "liburing.h"
+ #include "helpers.h"
+ 
diff --git a/meta-oe/recipes-support/liburing/liburing/0002-ooo-file-unreg.c-Include-poll.h-instead-of-sys-poll..patch b/meta-oe/recipes-support/liburing/liburing/0002-ooo-file-unreg.c-Include-poll.h-instead-of-sys-poll..patch
deleted file mode 100644
index 8a1d542502..0000000000
--- a/meta-oe/recipes-support/liburing/liburing/0002-ooo-file-unreg.c-Include-poll.h-instead-of-sys-poll..patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From d06433ff1a1905436cfcde80e22ee51bd9591536 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 17 Sep 2024 09:59:31 -0700
-Subject: [PATCH 2/2] ooo-file-unreg.c: Include poll.h instead of sys/poll.h
-
-This fixes a warning e.g.
-
-In file included from ooo-file-unreg.c:12:
-/mnt/b/yoe/master/build/tmp/work/riscv32-yoe-linux-musl/liburing/2.7/recipe-sysroot/usr/include/sys/poll.h:1:2: warning: redirecting incorrect #include <sys/poll.h> to <poll.h> [-W#warnings]
-    1 | #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
-      |  ^
-1 warning generated.
-
-Upstream-Status: Submitted [https://github.com/axboe/liburing/pull/1233]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- test/ooo-file-unreg.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/test/ooo-file-unreg.c b/test/ooo-file-unreg.c
-index d76e0fb..dd6ea55 100644
---- a/test/ooo-file-unreg.c
-+++ b/test/ooo-file-unreg.c
-@@ -9,7 +9,7 @@
- #include <sys/socket.h>
- #include <unistd.h>
- #include <stdlib.h>
--#include <sys/poll.h>
-+#include <poll.h>
- 
- #include "liburing.h"
- #include "helpers.h"
diff --git a/meta-oe/recipes-support/liburing/liburing_2.7.bb b/meta-oe/recipes-support/liburing/liburing_2.9.bb
similarity index 83%
rename from meta-oe/recipes-support/liburing/liburing_2.7.bb
rename to meta-oe/recipes-support/liburing/liburing_2.9.bb
index b10fe40ca0..e17d829c3d 100644
--- a/meta-oe/recipes-support/liburing/liburing_2.7.bb
+++ b/meta-oe/recipes-support/liburing/liburing_2.9.bb
@@ -10,10 +10,8 @@ LICENSE = "LGPL-2.1-only | MIT"
 LIC_FILES_CHKSUM = "file://README;beginline=41;endline=44;md5=2b0e9926530c269f5ae95560370195af"
 
 SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https \
-           file://0001-test-Compile-nolibc.c-only-when-CONFIG_NOLIBC-is-set.patch \
-           file://0001-test-Drop-including-error.h-header.patch \
-           file://0002-ooo-file-unreg.c-Include-poll.h-instead-of-sys-poll..patch"
-SRCREV = "5227d48b28ad8671e61d444b72678da584d2e6c3"
+           file://0001-test-Including-missing-string.h-for-memcpy.patch"
+SRCREV = "08468cc3830185c75f9e7edefd88aa01e5c2f8ab"
 
 S = "${WORKDIR}/git"
 

