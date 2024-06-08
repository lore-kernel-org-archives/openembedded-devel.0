Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5007C41513
	for <webhook@archiver.kernel.org>; Sat,  8 Jun 2024 04:55:15 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.912.1717822510522678135
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jun 2024 21:55:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d4ZrjH21;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-250671a1bc7so1347615fac.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 21:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717822509; x=1718427309; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JXaB9r51OOCobXgBGlhhyn5bOUpQWm2DryVk9qJvpno=;
        b=d4ZrjH21ga704dWoqWf7hSQ7ds5umgy7gLAmgvkY7p//Dcn4XtWCHbBaAkKHGWyf1v
         0dcHMWchqpvkizMUiYvzGb9ALz88VbYjZW0566SyIZZf8xAVMMocjsbKwk/krMAdUqo2
         w5/VZdLcyoir6I/reuzDEfGSg5EjUDSxd7SRoEdHaBunmyTvtC2fhNd1tJ2lFMQ2wlt3
         OCRRPMZSvISAuyUm1W4sdtP4rBYeP6WRX27FhF3217gwvS4MC0fTXDi9TXDTNgWfOxMJ
         tgoiqn1QTYuM0i4X4zq/yWjBbNt+xdiajQtMiSXNBHY1Hy89jFNgAQMMoro1fnZLXT3L
         90Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717822509; x=1718427309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JXaB9r51OOCobXgBGlhhyn5bOUpQWm2DryVk9qJvpno=;
        b=T0mhKcUVoYaECANbKLAV/f50Bj0s/yJAmuy/f1XCkCeaoVxSHau4sLbEz8jfADirHr
         ZxfmIaBugbKdEiPS7Omp7aIJ1codgtl78G9dM8I1ItAehKFIBlxdgr2ntJeo049tWGye
         Peiv+IYOjIi1X0vTjmp7cYwVeTbTW1mCBoB7UwGZme3MceNIr1OJ2TRbthcHQCJj0qwE
         R2gY3GIibrna5U4O29z/RxK0bo1l6HfcHNHQI8JXL1aU8qhaNJty2hBUn7qsMS1Z1342
         f+bH+djjfWiMLtIihbjH0jY7ateDpqWLM1bijI9fPSYF3rp0iPZFWLcjUb2/vF6tSB3I
         +rmA==
X-Gm-Message-State: AOJu0YwO4vwSBmlVjnegynHZ8FNpIQURX59u8T7wf4FUI0qCyPGfj72t
	sXwxEIw3ul9QWZhKNKF3hBQJeDnBEf7bK5ghQnG6AFBrp8LOwhDORrKJ2wub
X-Google-Smtp-Source: AGHT+IFJM0QCpQlJ0WuKzYKyJcHx6I3ls9FxCIo/Vj1DPsBBM5M0ZZUcBVSYfUGyTSznftne03KBdQ==
X-Received: by 2002:a05:6870:219c:b0:250:d5bc:7346 with SMTP id 586e51a60fabf-25464465e35mr4641770fac.3.1717822509336;
        Fri, 07 Jun 2024 21:55:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7041edb91cdsm805380b3a.213.2024.06.07.21.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 21:55:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] googlebenchmark: Update patch and its status to backport
Date: Fri,  7 Jun 2024 21:55:05 -0700
Message-ID: <20240608045506.2770978-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Jun 2024 04:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110771

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ype-conversion-to-match-function-ret.patch | 21 +++++++++----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark/0001-cycleclock-Fix-type-conversion-to-match-function-ret.patch b/meta-oe/recipes-support/googlebenchmark/googlebenchmark/0001-cycleclock-Fix-type-conversion-to-match-function-ret.patch
index d514cf192b..3017314abe 100644
--- a/meta-oe/recipes-support/googlebenchmark/googlebenchmark/0001-cycleclock-Fix-type-conversion-to-match-function-ret.patch
+++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark/0001-cycleclock-Fix-type-conversion-to-match-function-ret.patch
@@ -1,7 +1,8 @@
-From db704bcc344529039d7fb28be380658625a9c08d Mon Sep 17 00:00:00 2001
+From 7f0e99af540a333108b92d792923ec7fc9e9fad9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 28 May 2024 19:34:43 -0700
+Date: Tue, 28 May 2024 20:14:54 -0700
 Subject: [PATCH] cycleclock: Fix type conversion to match function return type
+ (#1794)
 
 fixes build with clang19
 
@@ -10,25 +11,23 @@ src/cycleclock.h:208:52: error: implicit conversion changes signedness: 'uint64_
       |   ~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
 1 error generated.
 
-Upstream-Status: Submitted [https://github.com/google/benchmark/pull/1794]
+Upstream-Status: Backport [https://github.com/google/benchmark/commit/7f0e99af540a333108b92d792923ec7fc9e9fad9]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/cycleclock.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ src/cycleclock.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/cycleclock.h b/src/cycleclock.h
-index a2584376..f96801c5 100644
+index a25843760..c657414e5 100644
 --- a/src/cycleclock.h
 +++ b/src/cycleclock.h
-@@ -205,7 +205,7 @@ inline BENCHMARK_ALWAYS_INLINE int64_t Now() {
+@@ -205,7 +205,8 @@ inline BENCHMARK_ALWAYS_INLINE int64_t Now() {
        "sub %0, zero, %0\n"
        "and %1, %1, %0\n"
        : "=r"(cycles_hi0), "=r"(cycles_lo), "=r"(cycles_hi1));
 -  return (static_cast<uint64_t>(cycles_hi1) << 32) | cycles_lo;
-+  return static_cast<int64_t>((static_cast<uint64_t>(cycles_hi1) << 32) | cycles_lo);
++  return static_cast<int64_t>((static_cast<uint64_t>(cycles_hi1) << 32) |
++                              cycles_lo);
  #else
    uint64_t cycles;
    asm volatile("rdtime %0" : "=r"(cycles));
--- 
-2.45.1
-

