Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5332FEB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 07:35:23 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.5886.1686728119109497137
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jun 2023 00:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Cf7e/HKb;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b3d8aa2c17so16361895ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jun 2023 00:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686728118; x=1689320118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WncpsRtY0pG8DaKXUqowlZeVRuxtmyx/fL7VZE5ZEhQ=;
        b=Cf7e/HKbkUuk5+qtfRdFQ+2WnGl5M0tVS1jBRWc/kLdr+qDWklv/P2esHNGrNHUfne
         J0oZIpf/OYqi6TgeohbTeI34XrEpZT0Nd+srzk1pM/NRwcdB2kQEn90yjkrMYelV6feD
         MW1enVnx7zJKeSiSttqpb+ID7hrOZA+ISsv9DuLUQKA2eQgA976BG6bgjxvRniz79ILU
         cRWTZh91YvChNeZdPmOJ1GiaXOUivJgbC9Zcw4IQG66nqmDS47SrOvAi6/RkdrSEC6Nw
         QFHGfPNDz27sQQuhThgmVkpVWrSTmyYoxOUgxkAD9MFAoXXJX6mFJI2tgEBsFcgBhJC0
         SjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686728118; x=1689320118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WncpsRtY0pG8DaKXUqowlZeVRuxtmyx/fL7VZE5ZEhQ=;
        b=czzC3ebqaB3OHgLLHdIO+KaLxOo6QRSSw1oVca8lNeTtoXjS1BM55fWck2ruI5IPT5
         NFPRq0dBF+zBjMIr0uELBxk6gayCTwhy8kNmEW0O3fjpNopa9/5HpqXM7ydChzxwIrCx
         QWCMD3MEI9Cuxhd0X2R1fmF3SUVDOWzXF+Rqf6tfgUfs0AsMggqEhCMXC4rigmKlzGJB
         6XTKKZpZdWQHh3BOu3KTw++8USjwRxMcdDgqxBX8L4l3Mmdeh2yRRQ1+Y4TU8XgXuK7T
         C4vWbehozMcXRcQNHPfTYfMrNIrirsQZVjuhohWDdsxpdJPLJHopuDBRp9D3dpsalGKn
         +6NQ==
X-Gm-Message-State: AC+VfDwngJPcft0BDlkI/0sUSr9mkP2FLL+K+qI5deWMVJYmHG41sdyQ
	Q+dOFxcv/v+ZTCltZ2GrU0U4qrQbPbE=
X-Google-Smtp-Source: ACHHUZ7e132jNvCbzYzlfApFIbUMMMPT63mv9Q2BRQfyRNZ98WvpnzgQSIP1gOseSXMLfZt3Gq2KAg==
X-Received: by 2002:a17:903:187:b0:1b3:f8db:6f0e with SMTP id z7-20020a170903018700b001b3f8db6f0emr2396755plg.43.1686728118131;
        Wed, 14 Jun 2023 00:35:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id d10-20020a170902b70a00b001afd6647a77sm11524091pls.155.2023.06.14.00.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 00:35:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-oe][PATCH] libtracefs: Fix build with clang+musl
Date: Wed, 14 Jun 2023 00:35:15 -0700
Message-ID: <20230614073515.324313-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jun 2023 07:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103279

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-missing-headers-for-syscall-and-SYS.patch | 31 +++++++++++++++++++
 .../libtracefs/libtracefs_1.7.0.bb            |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/libtracefs/libtracefs/0001-tracefs-perf-Add-missing-headers-for-syscall-and-SYS.patch

diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs/0001-tracefs-perf-Add-missing-headers-for-syscall-and-SYS.patch b/meta-oe/recipes-kernel/libtracefs/libtracefs/0001-tracefs-perf-Add-missing-headers-for-syscall-and-SYS.patch
new file mode 100644
index 0000000000..a24dd1315b
--- /dev/null
+++ b/meta-oe/recipes-kernel/libtracefs/libtracefs/0001-tracefs-perf-Add-missing-headers-for-syscall-and-SYS.patch
@@ -0,0 +1,31 @@
+From f539d96ef4a34ad23d33c552d1770ab429b0220e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 14 Jun 2023 00:24:36 -0700
+Subject: [PATCH] tracefs-perf: Add missing headers for syscall() and SYS_*
+ defines
+
+These headers are needed to provide prototype definitions for functions
+e.g. close(), syscall(), getpagesize(), getpid()
+
+The issue is observed with clang-16+ compiler on musl systems
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-trace-devel/20230614072759.316154-1-raj.khem@gmail.com/T/#u]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/tracefs-perf.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/tracefs-perf.c b/src/tracefs-perf.c
+index 96d12cd..62c1508 100644
+--- a/src/tracefs-perf.c
++++ b/src/tracefs-perf.c
+@@ -1,4 +1,5 @@
+-#include <asm/unistd.h>
++#include <unistd.h>
++#include <sys/syscall.h>
+ #include <sys/mman.h>
+ #include <signal.h>
+ #include <linux/perf_event.h>
+-- 
+2.41.0
+
diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.7.0.bb b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.7.0.bb
index 77556d9126..9a408ba13c 100644
--- a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.7.0.bb
+++ b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.7.0.bb
@@ -12,6 +12,7 @@ DEPENDS = "libtraceevent bison-native flex-native"
 SRCREV = "aebab37379d0fbadc702d64aca0fe5cf18676404"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=${BPN};protocol=https \
            file://0001-makefile-Do-not-preserve-ownership-in-cp-command.patch \
+           file://0001-tracefs-perf-Add-missing-headers-for-syscall-and-SYS.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.41.0


