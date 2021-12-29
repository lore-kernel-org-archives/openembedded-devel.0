Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A522C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Dec 2021 03:20:19 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.46868.1640748016650140531
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 19:20:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AhfzRQyF;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 a11-20020a17090a854b00b001b11aae38d6so18706079pjw.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 19:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HmIDcO1XWIB6TlbqD4fNheXBIF6BXY2AS0qKjG5miGM=;
        b=AhfzRQyF9D0hQYk2IjQetuKprF81psSLgwVqPRDY9zuSVv9GSeBf6dO9fz9jtuZwi4
         PJ4tqpNYs1EWDRaJacEkQVlzOaFHykYYjSv/R9lIpT7iyJHLJ4l1UB9JrKVsvx1FpaKd
         ClkCCFAWeH1EAKxvT5cB1D6x/B3uU0OZu1WNtBijaWyco5VrN4KjDF/m+rNiK9cBwVcR
         rlIY/k4bVy4liH9omcHb5aUEb+jbo6yqZYqtuhdbT085p0PeqwohK1kyuY8nqwMUkEV0
         9nKwVpBsQKAHSpQWQn/PlhVsgBqdE7YxtLxB19DJkxZGP3NLdYyVMPl3a5VEzkURe92A
         sBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HmIDcO1XWIB6TlbqD4fNheXBIF6BXY2AS0qKjG5miGM=;
        b=0cGMNAYhOlqJIHqJxV7ab5/y2gyBGcKi35k35bf9Hfy9ZEeScFb4eMdkm8MJ93cS0I
         m0XB/e7epborbh/pm5WEBqyqPR5n8nrLTDuLvDNSSV7mvV+jLshZdMa3Xy1N/oH5O4ft
         NUlrwWG20DKpJN3ZXNmEIgGfACExa6wtrholONKNrMPWQoVxMoHRTNsSv4CqncItKSPV
         UxCfQGYjd+AGqBNItDG5iBX4JGbRYsWKo2qJjiortFu6l0EQn2Xcaz29YbesyJLPttbm
         crwx35G8st6ram5Lj54k1J+9u1UyFTPY+kqXIN06UnBFnsMb6eDCeWAPzHQYWkI4F76B
         XxbA==
X-Gm-Message-State: AOAM533PN3m4rvGdhvxGGMuRLz6wAoiKIfcrNq57BpWtkWyOnubgq34h
	OvamQCPcx/3xGX8tiiblkfixMEF4rNrSkQ==
X-Google-Smtp-Source: 
 ABdhPJzhXdv6NJ0RkKLkcbowKLZBkfHH6izPyzYLSOdglsmjq1Q8ZyfCOIBrvEQk6KLSimbd5thyVw==
X-Received: by 2002:a17:90a:fd95:: with SMTP id
 cx21mr30211269pjb.54.1640748015930;
        Tue, 28 Dec 2021 19:20:15 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 x6sm19038125pge.50.2021.12.28.19.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 19:20:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] tbb: Disable LTO on rv64
Date: Tue, 28 Dec 2021 19:20:13 -0800
Message-Id: <20211229032013.57537-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Dec 2021 03:20:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94559

ABI mismatches still happen with clang on rv64 as well so disable
LTO for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../tbb/tbb/0001-Disable-LTO-on-clang-riscv32.patch           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/tbb/tbb/0001-Disable-LTO-on-clang-riscv32.patch b/meta-oe/recipes-support/tbb/tbb/0001-Disable-LTO-on-clang-riscv32.patch
index 093c828fe6..662065635d 100644
--- a/meta-oe/recipes-support/tbb/tbb/0001-Disable-LTO-on-clang-riscv32.patch
+++ b/meta-oe/recipes-support/tbb/tbb/0001-Disable-LTO-on-clang-riscv32.patch
@@ -1,7 +1,7 @@
 From 95a5c97122b7c5bdeba61f2e890bae9a961dd4bf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 8 Dec 2021 10:01:22 -0800
-Subject: [PATCH] Disable LTO on clang/riscv32
+Subject: [PATCH] Disable LTO on clang/riscv
 
 With clang in OE LTO does not work as it does not seem to carry right
 target info and mixes ABIs
@@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # Enabling LTO on Android causes the NDK bug.
  # NDK throws the warning: "argument unused during compilation: '-Wa,--noexecstack'"
 -if (NOT ANDROID_PLATFORM AND BUILD_SHARED_LIBS)
-+if (NOT ANDROID_PLATFORM AND BUILD_SHARED_LIBS AND NOT CMAKE_SYSTEM_PROCESSOR MATCHES "(riscv32|arm)")
++if (NOT ANDROID_PLATFORM AND BUILD_SHARED_LIBS AND NOT CMAKE_SYSTEM_PROCESSOR MATCHES "(riscv32|riscv64|arm)")
      set(TBB_IPO_COMPILE_FLAGS $<$<NOT:$<CONFIG:Debug>>:-flto>)
      set(TBB_IPO_LINK_FLAGS $<$<NOT:$<CONFIG:Debug>>:-flto>)
  endif()
-- 
2.34.1


