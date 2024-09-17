Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47F3C021A2
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 06:04:36 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.14905.1726553070772937607
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Sep 2024 23:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V8RVDySQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fc47abc040so41036095ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Sep 2024 23:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726553070; x=1727157870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7s3mzFf49Vh2wGiiFTLUBFUu6IAGfQ9X4mp8qolh5w=;
        b=V8RVDySQ9+kHjJapCNz7118oqbyrHahqkYuJ9/2yzzpmGR1UpaWfNqJdTHlCDQg70S
         9hqNVPN3MicB8+79TvMbbml9CRAM88U1RX/gnaOQuLZDl/xEg7uoCLxIjclc35KSv1QA
         I30eU2g2LDkPYZC3RYuEbJwGMpi/GCPrl6pPpDvJfv3DMFFGlyln5Bgs1TRtEuSnI6EH
         zd2Qt66qzldasPGNSBwmTtBBrwQ1Pe/ytlHnkkBiw+Zi1069uIydX3PcEqW0l8e17cx8
         d66UkD386UJ0Sa62dA/13+hTlNC/KbWlJOuyoHE0u5guWHmP5VLv02h/vcHuXaUsEk3O
         p1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726553070; x=1727157870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7s3mzFf49Vh2wGiiFTLUBFUu6IAGfQ9X4mp8qolh5w=;
        b=cvmb6jo+ymw183kKdya+VW2RSlv5As2xbY+hblEjTUbNcItsEm2m25Ir63bG8LiQQY
         Hg4O9XER5yIB1FYaHO/Q1Q1RuzcEjHP3RYYQReRrXlDcJRS80WIF9VnjRU+frETB6gnm
         lJbEDBRc2wqVgM9rGMGz7/mKATlPuWsGADP4Wmh6qO4fQI9uZbvljiMYDIcV0a+qz1XE
         XAllXb9n/4P97389k0N/WXI1yzoDAyf2PkYuW6xodLUL2NA2zqcK0Pr32La/VRMHuuTa
         sPsH093yFW3u6BQP7qYFtwIVvvZLXrmgmrd2wEJgYLakN7F7zbro54mQ+3YPjF4FK8VM
         eaXw==
X-Gm-Message-State: AOJu0Yx8s4fgoR+EFB6ohgW3BFzSsByII9JyaYZhRThf7FyEjQnA2vF5
	LRK7DB+aV4Zb1gph+0fda6UzzEckehHY/ct+Q0xCMZenZ3VoyQp5f3W4WZo3
X-Google-Smtp-Source: AGHT+IFhS40b9RyVecgVXeWGu7ZOFS3b7hmTBHzMKnPw6irSDNsQRZTSPjleg/kIP6r1tW2Rn9YbXg==
X-Received: by 2002:a17:902:ea0b:b0:206:ae0b:bfb6 with SMTP id d9443c01a7336-2076e412914mr246696145ad.40.1726553069796;
        Mon, 16 Sep 2024 23:04:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079475df17sm44294645ad.298.2024.09.16.23.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 23:04:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/12] liburing: Upgrade to 2.7 and fix build on riscv32
Date: Mon, 16 Sep 2024 23:04:15 -0700
Message-ID: <20240917060424.1692067-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240917060424.1692067-1-raj.khem@gmail.com>
References: <20240917060424.1692067-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 06:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112329

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ibc.c-only-when-CONFIG_NOLIBC-is-set.patch | 43 +++++++++++++++++++
 .../{liburing_2.6.bb => liburing_2.7.bb}      |  8 ++--
 2 files changed, 48 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/liburing/liburing/0001-test-Compile-nolibc.c-only-when-CONFIG_NOLIBC-is-set.patch
 rename meta-oe/recipes-support/liburing/{liburing_2.6.bb => liburing_2.7.bb} (83%)

diff --git a/meta-oe/recipes-support/liburing/liburing/0001-test-Compile-nolibc.c-only-when-CONFIG_NOLIBC-is-set.patch b/meta-oe/recipes-support/liburing/liburing/0001-test-Compile-nolibc.c-only-when-CONFIG_NOLIBC-is-set.patch
new file mode 100644
index 0000000000..32e788123d
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
+Upstream-Status: Submitted [https://github.com/axboe/liburing/pull/1232]
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
diff --git a/meta-oe/recipes-support/liburing/liburing_2.6.bb b/meta-oe/recipes-support/liburing/liburing_2.7.bb
similarity index 83%
rename from meta-oe/recipes-support/liburing/liburing_2.6.bb
rename to meta-oe/recipes-support/liburing/liburing_2.7.bb
index fc3fe1cac1..7ef182ffae 100644
--- a/meta-oe/recipes-support/liburing/liburing_2.6.bb
+++ b/meta-oe/recipes-support/liburing/liburing_2.7.bb
@@ -9,8 +9,9 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-only | MIT"
 LIC_FILES_CHKSUM = "file://README;beginline=41;endline=44;md5=2b0e9926530c269f5ae95560370195af"
 
-SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https"
-SRCREV = "f7dcc1ea60819475dffd3a45059e16f04381bee7"
+SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https \
+           file://0001-test-Compile-nolibc.c-only-when-CONFIG_NOLIBC-is-set.patch"
+SRCREV = "5227d48b28ad8671e61d444b72678da584d2e6c3"
 
 S = "${WORKDIR}/git"
 
@@ -19,10 +20,11 @@ XCFLAGS = "-pthread"
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

