Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4669C0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 21:21:04 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.145915.1692134460485034946
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 14:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iijYJYfL;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1bc34b32785so36977315ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 14:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692134460; x=1692739260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9xL/c+wKqdxNDJ/sOkSj/P75j6a3vTrqQnIxC7PCzu8=;
        b=iijYJYfLHwhWP7fYQypl2ISwBpTM1auvm8cRphNGdropsdVjWNoEJw0vxQzy5urCDH
         8grgpe/isiy8g2AQ8jfBvnSoo9+cvXOPGVKwJbl6PT29DJo94I+OW2KOcGLdF+rX5Ijm
         gC+IY12NOd7JuLOG4y+YOc2N3ksaRCjLlzhqUDX3yx/jQj9URzJH77rHLt2yXYIeKAUV
         y91ZK7DAqzvjM53mJAjsto9/CwziI6zoQjkLSjQvmizY8dc9L1Jk3WPnnYQT+DPmIRSH
         ifWJXf0LV8YLRS6H/SIVZQhDdkTMHyGgX8E7/996BepLpBYuFLx6fk71q2ybri0HnpCy
         pogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692134460; x=1692739260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xL/c+wKqdxNDJ/sOkSj/P75j6a3vTrqQnIxC7PCzu8=;
        b=QC/w1Yb1Pw+yrO7o14uYLRHFEGrhqLZHBsjNqTnz27aeKMmOYhJ47eCnzu/ngVokMP
         n8e/s04PXVOba4VvnzbvGpOuezJ1S+KBcnnDpPozwabO6R5UyeRlA+ptIooI1VDRfbLn
         DPROwZY1nCJibKQvhPkCA4IptwNx+Em+33qwgB6K5fmEBtypRtDbGoX/0uqUISq8ClSu
         kGRwjA5HNlxn+aqMQaXgMAdCuCvn0nR9Cw7yf+D0YxOmBxt9taeq+9a5ojBEbI+ZuMV7
         CwU7BmPYRlLJNZYFGoisficIX2lUt6Jc27tBfnJ1GFZw6ju4fZ8nXbnV1fTsJFau1N34
         K91Q==
X-Gm-Message-State: AOJu0Yxj7oYtK4TcVgiOBLmatEwKyKkLEtoRFlG8UNYG8OlACKCJdTlM
	1eo5jS3F9tdhK1IPeQqLp1g/xRAABQs=
X-Google-Smtp-Source: AGHT+IGjugAFaXfZd3gZZaixSGQlmt8KBQlCaO68qNb4oc0usuqq+82MyG70ngoZEDjBohwV4QomAA==
X-Received: by 2002:a17:902:ab17:b0:1bd:d343:f246 with SMTP id ik23-20020a170902ab1700b001bdd343f246mr61346plb.45.1692134459621;
        Tue, 15 Aug 2023 14:20:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::ed55])
        by smtp.gmail.com with ESMTPSA id je22-20020a170903265600b001bba7aab822sm11569270plb.5.2023.08.15.14.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 14:20:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] jemalloc: Unbolt clang workaroud
Date: Tue, 15 Aug 2023 14:20:57 -0700
Message-ID: <20230815212057.264244-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 21:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104367

This works well with clang 15+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...imization-with-clang-for-aligned_all.patch | 33 -------------------
 .../jemalloc/jemalloc_5.3.0.bb                |  4 ---
 2 files changed, 37 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/jemalloc/files/0001-test-Disable-optimization-with-clang-for-aligned_all.patch

diff --git a/meta-oe/recipes-devtools/jemalloc/files/0001-test-Disable-optimization-with-clang-for-aligned_all.patch b/meta-oe/recipes-devtools/jemalloc/files/0001-test-Disable-optimization-with-clang-for-aligned_all.patch
deleted file mode 100644
index 570202e800..0000000000
--- a/meta-oe/recipes-devtools/jemalloc/files/0001-test-Disable-optimization-with-clang-for-aligned_all.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 3fe67deb9fcf0ae3c2ff31a9eccb6a0a9af33b9c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 14 Jan 2022 09:47:03 -0800
-Subject: [PATCH] test: Disable optimization with clang for aligned_alloc.c
-
-Clang crashes when using glibc 2.35, it works ok with older glibc or
-musl, so its very specific problem. Its reported here
-
-https://github.com/llvm/llvm-project/issues/52765
-
-Until it is fixed, workaround the build failure
-
-Upstream-Status: Inappropriate [Workaround]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- test/integration/aligned_alloc.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/test/integration/aligned_alloc.c b/test/integration/aligned_alloc.c
-index 4375b172..6513bdd9 100644
---- a/test/integration/aligned_alloc.c
-+++ b/test/integration/aligned_alloc.c
-@@ -1,5 +1,7 @@
- #include "test/jemalloc_test.h"
- 
-+#pragma clang optimize off
-+
- #define MAXALIGN (((size_t)1) << 23)
- 
- /*
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
index 9ad83261ef..3d48bc012d 100644
--- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
@@ -16,10 +16,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ea061f8731d5e6a5761dfad951ef5f5f"
 SRC_URI = "git://github.com/jemalloc/jemalloc.git;branch=master;protocol=https \
            file://run-ptest \
            "
-
-# Workaround for https://github.com/llvm/llvm-project/issues/52765
-SRC_URI:append:libc-glibc:toolchain-clang = " file://0001-test-Disable-optimization-with-clang-for-aligned_all.patch "
-
 SRCREV = "54eaed1d8b56b1aa528be3bdd1877e59c56fa90c"
 
 S = "${WORKDIR}/git"
-- 
2.41.0


