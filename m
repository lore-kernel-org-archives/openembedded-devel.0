Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5CEC6FD1F
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 17:58:00 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.2257.1711389476499433862
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 10:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JGf1aU/B;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e8f51d0bf0so3667523b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 10:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389476; x=1711994276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3oAqYk00ugfvD4/4WR4bZdQezEfbrlmHnW8+9FeSXE=;
        b=JGf1aU/BNIVKv52IybcltbfgyY066HvRJumgjDxZsUO06B6DUMdE10zDUwfga++Q9Z
         xMUErZAiUUKRZ5pZPInAhcyRSg4EpjMHBh4Sq1e6kbpgLMsSfvchEusNU2f6C5/QeokC
         6zq6ugovJ6RdngJbywhFtgob2/lUTTh421Pb+5lmh8DVtVb8EvMxiAjPt36MFwu4qnJ/
         fyTKt95ADyRsuJLaM7RtwGIls7+6R9pv1xWgqxFraDL7HHn6EWfz2Xt6SExUxrIxTLBz
         SB6SJogghB1hhqJ/fHvOM+x2Pya/He7jAOZRzT1BhQhSlfSn6ZQhNXMQsUIltLZ7uHfE
         6BKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389476; x=1711994276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3oAqYk00ugfvD4/4WR4bZdQezEfbrlmHnW8+9FeSXE=;
        b=lTSF9lhrZ2n0geYCwxZDTDE6/N2oYMFNz3q7qu539E28SenbcaNjkV2DL3dsWXTGnw
         xtqWAy76LW/sUlHDTlY2FXGnkTas+bCpROayPYLYU627jgLVPkFdNxEKjCArb/bhRMqS
         QdF2muZSNfPVBqnTxcS9fO0D8h55xw9tQVYraHcMA/Y/8qqc+1wz1IEX75rnFpp8xi1v
         jY3gOacXttlJWYxquspJuI6EDOtc/lTyTN+kU95woZLOzMCNPkjO//zKr4C7HUw3rS2n
         hyD1uMFjUcTWhyrX5wo9gZYQAKK1vlCuRsLTnW5dLr/sTQlPloWJrFGIWIHwa1p5KnFN
         kmUw==
X-Gm-Message-State: AOJu0Yzqty1F8ih1T+rp9LxOeeoST4HdlKdq7FfIXdujSc6cgBpNh8LU
	GsxTu6T1MmETrUZcYGyPO1aP6PTXXFj3wCsPugs7q5wXmb2YHMRnkLMpvtP6
X-Google-Smtp-Source: AGHT+IETKdzY4kDzCwFmCJv9Pk8b8z32KfZZmDUMvN6MczZCA/aCNm46Uj6JCT3XjkTvYyVg7Jq4LA==
X-Received: by 2002:a05:6a21:a58a:b0:1a3:c3fd:8e03 with SMTP id gd10-20020a056a21a58a00b001a3c3fd8e03mr632004pzc.38.1711389475601;
        Mon, 25 Mar 2024 10:57:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5eba])
        by smtp.gmail.com with ESMTPSA id p10-20020a17090a930a00b0029c61521eb5sm10295228pjo.43.2024.03.25.10.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:57:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 2/2] xfstests: Fix build with musl >= 1.2.5
Date: Mon, 25 Mar 2024 10:57:53 -0700
Message-ID: <20240325175753.3507115-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325175753.3507115-1-raj.khem@gmail.com>
References: <20240325175753.3507115-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 17:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109597

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-libgen.h-for-basename-API-prototype.patch | 84 +++++++++++++++++++
 ...X_ATTR_-defines-from-musl-sys-stat.h.patch | 42 ++++++++++
 .../xfstests/xfstests_2024.03.03.bb           |  2 +
 3 files changed, 128 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests/0001-include-libgen.h-for-basename-API-prototype.patch
 create mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests/0002-Add-missing-STATX_ATTR_-defines-from-musl-sys-stat.h.patch

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-include-libgen.h-for-basename-API-prototype.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-include-libgen.h-for-basename-API-prototype.patch
new file mode 100644
index 0000000000..1f7ae32f04
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-include-libgen.h-for-basename-API-prototype.patch
@@ -0,0 +1,84 @@
+From 37caab7a43da5ede0ff1eb700f0257a213ac4b18 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 25 Mar 2024 10:46:50 -0700
+Subject: [PATCH 1/2] include libgen.h for basename API prototype
+
+basename prototype has been removed from string.h from latest musl [1]
+compilers e.g. clang-18 flags the absense of prototype as error. therefore
+include libgen.h for providing it.
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: [https://lore.kernel.org/fstests/20240325175323.3450750-1-raj.khem@gmail.com/T/#t]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/splice-test.c                   | 1 +
+ src/stat_test.c                     | 1 +
+ src/t_ext4_dax_inline_corruption.c  | 1 +
+ src/t_ext4_dax_journal_corruption.c | 1 +
+ src/t_mmap_collision.c              | 1 +
+ 5 files changed, 5 insertions(+)
+
+diff --git a/src/splice-test.c b/src/splice-test.c
+index eb863673..7b7094f5 100644
+--- a/src/splice-test.c
++++ b/src/splice-test.c
+@@ -11,6 +11,7 @@
+ #include <unistd.h>
+ #include <fcntl.h>
+ #include <err.h>
++#include <libgen.h>
+ 
+ #include <stdlib.h>
+ #include <stdio.h>
+diff --git a/src/stat_test.c b/src/stat_test.c
+index 95cfdc4f..77e1acdd 100644
+--- a/src/stat_test.c
++++ b/src/stat_test.c
+@@ -4,6 +4,7 @@
+  * Written by David Howells (dhowells@redhat.com)
+  */
+ 
++#include <libgen.h>
+ #include <stdarg.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+diff --git a/src/t_ext4_dax_inline_corruption.c b/src/t_ext4_dax_inline_corruption.c
+index e1a39a6c..a40c5df5 100644
+--- a/src/t_ext4_dax_inline_corruption.c
++++ b/src/t_ext4_dax_inline_corruption.c
+@@ -2,6 +2,7 @@
+ /* Copyright (c) 2018 Intel Corporation. */
+ #include <errno.h>
+ #include <fcntl.h>
++#include <libgen.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/src/t_ext4_dax_journal_corruption.c b/src/t_ext4_dax_journal_corruption.c
+index ba7a96e4..53be10c2 100644
+--- a/src/t_ext4_dax_journal_corruption.c
++++ b/src/t_ext4_dax_journal_corruption.c
+@@ -2,6 +2,7 @@
+ /* Copyright (c) 2018 Intel Corporation. */
+ #include <errno.h>
+ #include <fcntl.h>
++#include <libgen.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/src/t_mmap_collision.c b/src/t_mmap_collision.c
+index c872f4e2..d9315fcf 100644
+--- a/src/t_mmap_collision.c
++++ b/src/t_mmap_collision.c
+@@ -15,6 +15,7 @@
+  */
+ #include <errno.h>
+ #include <fcntl.h>
++#include <libgen.h>
+ #include <pthread.h>
+ #include <stdbool.h>
+ #include <stdio.h>
+-- 
+2.44.0
+
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Add-missing-STATX_ATTR_-defines-from-musl-sys-stat.h.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Add-missing-STATX_ATTR_-defines-from-musl-sys-stat.h.patch
new file mode 100644
index 0000000000..20095c86ab
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Add-missing-STATX_ATTR_-defines-from-musl-sys-stat.h.patch
@@ -0,0 +1,42 @@
+From 052818e91314b797d96d87672c60f6784160f935 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 25 Mar 2024 10:50:59 -0700
+Subject: [PATCH 2/2] Add missing STATX_ATTR_* defines from musl sys/stat.h
+
+These defines are not provided by sys/stat.h on musl but are
+in glibc's sys/stat.h, therefore to compile the tests on musl
+based systems add the missing defines from linux/stat.h
+if they are not provided
+
+Upstream-Status: Submitted [https://lore.kernel.org/fstests/20240325175323.3450750-2-raj.khem@gmail.com/T/#u]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/statx.h | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/src/statx.h b/src/statx.h
+index 3f239d79..12599f5b 100644
+--- a/src/statx.h
++++ b/src/statx.h
+@@ -12,6 +12,18 @@
+ #define AT_STATX_DONT_SYNC      0x4000  /* - Don't sync attributes with the server */
+ #endif
+ 
++#ifndef STATX_ATTR_COMPRESSED
++#define STATX_ATTR_COMPRESSED		0x00000004 /* [I] File is compressed by the fs */
++#define STATX_ATTR_IMMUTABLE		0x00000010 /* [I] File is marked immutable */
++#define STATX_ATTR_APPEND		0x00000020 /* [I] File is append-only */
++#define STATX_ATTR_NODUMP		0x00000040 /* [I] File is not to be dumped */
++#define STATX_ATTR_ENCRYPTED		0x00000800 /* [I] File requires key to decrypt in fs */
++#define STATX_ATTR_AUTOMOUNT		0x00001000 /* Dir: Automount trigger */
++#define STATX_ATTR_MOUNT_ROOT		0x00002000 /* Root of a mount */
++#define STATX_ATTR_VERITY		0x00100000 /* [I] Verity protected file */
++#define STATX_ATTR_DAX			0x00200000 /* File is currently in DAX state */
++#endif
++
+ #ifndef AT_NO_AUTOMOUNT
+ #define AT_NO_AUTOMOUNT		0x800	/* Suppress terminal automount traversal */
+ #endif
+-- 
+2.44.0
+
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.bb
index 2d5fedb417..c8a80523dd 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.bb
@@ -10,6 +10,8 @@ SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master \
            git://github.com/amir73il/unionmount-testsuite.git;branch=master;protocol=https;name=unionmount;destsuffix=unionmount-testsuite \
            file://0001-add-missing-FTW_-macros-when-not-available-in-libc.patch \
            file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
+           file://0001-include-libgen.h-for-basename-API-prototype.patch \
+           file://0002-Add-missing-STATX_ATTR_-defines-from-musl-sys-stat.h.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.44.0


