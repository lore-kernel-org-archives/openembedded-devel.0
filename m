Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81BE7EE49A5
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 05:13:07 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.4591.1692594785630102826
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Aug 2023 22:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=sRSJOtnl;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1bdbf10333bso22984915ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Aug 2023 22:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692594785; x=1693199585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UVn4kPynvXPyeWFGmum2YOfgRkTgD8EJfwdF8+A1WFc=;
        b=sRSJOtnlcRd0BLf84+LcS6ZqpM2fiEX1jUCw9TPKHhO1nM87Voy7crbqL3PExnzySV
         XmEzGB3TFtJMQEReyC+Tg61oDVAnu2FL56L6UB4lORjQgeRxtdvg76QRBHcYKDiabU/q
         4aNTb0p3gO6R0egbi1rJCUkhpCWI3WwjCWIkq+CfKQyv3Zjs2xyfGFDstp2cr4Eyz/ax
         AQM2yy8dNTVnqWaYnTRIL3tJSoDjDa7hvmBnfVnNysu/uFxtKZLddFDYZfEOmG3bJQrD
         2HD/+lzaoyVnIT94QmYkzhJMz87n9eV43JBtoskL4PWb0XgxMwXCyYrokzbWuXMlrF85
         LeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692594785; x=1693199585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UVn4kPynvXPyeWFGmum2YOfgRkTgD8EJfwdF8+A1WFc=;
        b=RQBxIPA2IDA25hWdRjyWtzg791vOfANG7bU8pNRkKWuHBbo81JScZ9QueKdAbVW38P
         O5VURyUNkF8gfWtHBGFjuSiOl/JEZkDFNFFAMOW0C4YMrVgSH+tu+c6IzJJpCN4Hg8P8
         J6+jzTchLumu+RMyulflrDEzhk/59hekmTAVD6JUOVtXPhGO32hk3rw+1RH1qBLmIoBd
         xjmzILNInYC8A0jDq3pV5rJ7rGVV6Doh1331kara7C2xzUcJIEAmGnpLC4N5oBETZzPB
         okNLW5gFLvXot+5wF3al/WtwvGM2CVE3FwtpQ+HnY7Q8zySGsHYfz+gHT6tgsDmk49OM
         QWWg==
X-Gm-Message-State: AOJu0Ywp4vcDrGWxjnehJzGvQgf652FKIommu2jPusNP8xJD5nESJj54
	du7Vf0Cs1QID2IG1pk3qvq//JAZkR83hyg==
X-Google-Smtp-Source: AGHT+IG38x41bLaHYidTI5+mXryGgi/hNb69HiidsJ/rEY2WKW1xE3JXs2UKmTAFwwE9GtUalu01rQ==
X-Received: by 2002:a17:902:b94b:b0:1b8:a65f:b49d with SMTP id h11-20020a170902b94b00b001b8a65fb49dmr5077066pls.12.1692594784614;
        Sun, 20 Aug 2023 22:13:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::e31a])
        by smtp.gmail.com with ESMTPSA id v4-20020a170902b7c400b001b243a20f26sm5991483plz.273.2023.08.20.22.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 22:13:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] liburing: Upgrade to 2.4 release
Date: Sun, 20 Aug 2023 22:13:02 -0700
Message-ID: <20230821051302.1518212-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Aug 2023 05:13:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104504

- Upgrade to latest release 2.4 [1]
- Drop a patch available in 2.4 release
- Backport a parallel build race fix

[1] https://github.com/axboe/liburing/releases/tag/liburing-2.4
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ure-on-.-configure-make-shuffle-2836.patch | 34 ++++++++++++++
 ...-test-Remove-unused-linux-errqueue.h.patch | 47 -------------------
 .../{liburing_2.3.bb => liburing_2.4.bb}      |  5 +-
 3 files changed, 36 insertions(+), 50 deletions(-)
 create mode 100644 meta-oe/recipes-support/liburing/liburing/0001-Fixes-build-failure-on-.-configure-make-shuffle-2836.patch
 delete mode 100644 meta-oe/recipes-support/liburing/liburing/0001-examples-test-Remove-unused-linux-errqueue.h.patch
 rename meta-oe/recipes-support/liburing/{liburing_2.3.bb => liburing_2.4.bb} (89%)

diff --git a/meta-oe/recipes-support/liburing/liburing/0001-Fixes-build-failure-on-.-configure-make-shuffle-2836.patch b/meta-oe/recipes-support/liburing/liburing/0001-Fixes-build-failure-on-.-configure-make-shuffle-2836.patch
new file mode 100644
index 0000000000..0cf8548e4c
--- /dev/null
+++ b/meta-oe/recipes-support/liburing/liburing/0001-Fixes-build-failure-on-.-configure-make-shuffle-2836.patch
@@ -0,0 +1,34 @@
+From c34dca74854cb6e7f2b09affa2a4ab0145e62371 Mon Sep 17 00:00:00 2001
+From: Kartik Mahajan <stonebrakert6@gmail.com>
+Date: Fri, 30 Jun 2023 11:34:07 +0530
+Subject: [PATCH] Fixes build failure on ./configure && make
+ --shuffle=2836571325
+
+./configure && make --shuffle=2836571325 fails.
+The build fails on parallel builds for me and above command reproduces it.
+Note that --shuffle options is available on make version >= 4.4
+Target ffi_libname in src/Makefile should have a additional dependency
+upon $(liburing_sobjs)
+
+Upstream-Status: Backport [https://github.com/axboe/liburing/commit/c34dca74854cb6e7f2b09affa2a4ab0145e62371]
+Signed-off-by: Kartik Mahajan <stonebrakert6@gmail.com>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index c4c28cb..7832095 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -81,7 +81,7 @@ liburing-ffi.a: $(liburing_objs) $(liburing_ffi_objs)
+ $(libname): $(liburing_sobjs) liburing.map
+ 	$(QUIET_CC)$(CC) $(SO_CFLAGS) -shared -Wl,--version-script=liburing.map -Wl,-soname=$(soname) -o $@ $(liburing_sobjs) $(LINK_FLAGS)
+ 
+-$(ffi_libname): $(liburing_ffi_objs) $(liburing_ffi_sobjs) liburing-ffi.map
++$(ffi_libname): $(liburing_ffi_objs) $(liburing_ffi_sobjs) $(liburing_sobjs) liburing-ffi.map
+ 	$(QUIET_CC)$(CC) $(SO_CFLAGS) -shared -Wl,--version-script=liburing-ffi.map -Wl,-soname=$(ffi_soname) -o $@ $(liburing_sobjs) $(liburing_ffi_sobjs) $(LINK_FLAGS)
+ 
+ install: $(all_targets)
+-- 
+2.41.0
+
diff --git a/meta-oe/recipes-support/liburing/liburing/0001-examples-test-Remove-unused-linux-errqueue.h.patch b/meta-oe/recipes-support/liburing/liburing/0001-examples-test-Remove-unused-linux-errqueue.h.patch
deleted file mode 100644
index 21aaf8d991..0000000000
--- a/meta-oe/recipes-support/liburing/liburing/0001-examples-test-Remove-unused-linux-errqueue.h.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 0fbcc44fe1fb2dc6807660b2cff1c2995add095b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 18 Feb 2023 18:01:22 -0800
-Subject: [PATCH] examples,test: Remove unused linux/errqueue.h
-
-This header is not needed therefore remove it, this cleanup also helps
-compiling on musl/clang
-
-/usr/include/linux/errqueue.h:57:20: error: array has incomplete element typ
-e 'struct timespec'
-        struct timespec ts[3];
-                          ^
-
-Upstream-Status: Submitted [https://github.com/axboe/liburing/pull/798]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- examples/send-zerocopy.c | 1 -
- test/send-zerocopy.c     | 1 -
- 2 files changed, 2 deletions(-)
-
-diff --git a/examples/send-zerocopy.c b/examples/send-zerocopy.c
-index 6092af9..cf1fa8b 100644
---- a/examples/send-zerocopy.c
-+++ b/examples/send-zerocopy.c
-@@ -13,7 +13,6 @@
- #include <string.h>
- 
- #include <arpa/inet.h>
--#include <linux/errqueue.h>
- #include <linux/if_packet.h>
- #include <linux/ipv6.h>
- #include <linux/socket.h>
-diff --git a/test/send-zerocopy.c b/test/send-zerocopy.c
-index 86a31cd..5d578c6 100644
---- a/test/send-zerocopy.c
-+++ b/test/send-zerocopy.c
-@@ -11,7 +11,6 @@
- #include <string.h>
- 
- #include <arpa/inet.h>
--#include <linux/errqueue.h>
- #include <linux/if_packet.h>
- #include <linux/ipv6.h>
- #include <linux/socket.h>
--- 
-2.39.2
-
diff --git a/meta-oe/recipes-support/liburing/liburing_2.3.bb b/meta-oe/recipes-support/liburing/liburing_2.4.bb
similarity index 89%
rename from meta-oe/recipes-support/liburing/liburing_2.3.bb
rename to meta-oe/recipes-support/liburing/liburing_2.4.bb
index 7d8c2f596d..e5dba70df0 100644
--- a/meta-oe/recipes-support/liburing/liburing_2.3.bb
+++ b/meta-oe/recipes-support/liburing/liburing_2.4.bb
@@ -10,12 +10,11 @@ LICENSE = "LGPL-2.1-only | MIT"
 LIC_FILES_CHKSUM = "file://README;beginline=41;endline=44;md5=2b0e9926530c269f5ae95560370195af"
 
 SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https \
-           file://0001-examples-test-Remove-unused-linux-errqueue.h.patch"
+           file://0001-Fixes-build-failure-on-.-configure-make-shuffle-2836.patch"
 SRC_URI:append:libc-musl:riscv64 = " file://0001-do-not-build-examples.patch "
 SRC_URI:append:libc-musl:riscv32 = " file://0001-do-not-build-examples.patch "
-SRCREV = "f5cac78e621ab452d3035902085f66d2bf73243b"
+SRCREV = "298c083d75ecde5a8833366167b3b6abff0c8d39"
 
-PV .= "+2.4+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 DEPENDS:append:libc-musl = " libucontext"
-- 
2.41.0


