Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95590C87FD1
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 17:28:16 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.5303.1754414892840462964
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Aug 2025 10:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RSn57prA;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b423036a317so3245921a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Aug 2025 10:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754414892; x=1755019692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gHmopjzD9CSk40TnBGjGGw+zoWyNL6vnTPKBD5nA/UY=;
        b=RSn57prACeC4hDvbXCurMSN5PB6kpRq5aKhm9oRocx/o0S5gltHkYom4kl51GhVIEN
         V5+6UD/N7GKm8NKAj1i+fOlinymaGTEnZKzoR3w+wStNBpYCmvVepmVnhbG5mhaNj6KG
         p0BvxcLBsR3dzItZdFxMH4QRrBGuEC9UzU7BKEup9KvC9+g5OfwDlTkYTe3pDhud7gpf
         03Qae0nQA0pnzqHVJh97umJnPciQ+yb3FoFDnsrz/qylu151FmwAFmFwPdePpC42CQEk
         LwSL8esIP7SGiGTHrQKipJKfPBCLGfCspX6miHaW6bgmXl7uLZJw4DQgpLF3dyjVJFrQ
         /BAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754414892; x=1755019692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gHmopjzD9CSk40TnBGjGGw+zoWyNL6vnTPKBD5nA/UY=;
        b=RrKLHpkB7FDjED5XEcPwP9jZdFHWe8M6OkraQxqz4aOxJ2Hh1O2uEkIRuxM3uXvTAb
         dsYRkFRo5oRWW9nq+wUiZN53IzenAOmxlTVl1yVV+6ZbP9gxjuzTxZDdbEP9EcWrKgH8
         kq9ctAcaWMyVkqUWFEpEUIEoJsdnbZM/AvMbK0kDP09Q2bqZvWhkWeT+pUVdQc9hzN8d
         AawVcu6at8thk7AWlaFiMgg7kKjs+5RaEwhh9ycvzXZv8Pi69D9N5UAbjeC6NV5gVIoh
         lTmNE2wKShbKdoQqpqL+Vpq3dQLsh+kShHVIIQDkrFBtAF5QjzEJ/YAf3UWcG5vgWS2H
         SINQ==
X-Gm-Message-State: AOJu0YzgIUECJQSBSmgYMjySILR5MsblpZyYO3RyvhoUBz94qP+MWfIS
	eO2++exL6VDbb6gP9pZ9Szxg5ZvtJ21f7EI1DKquKin8N99MMSMxyvTSJ2APKjleWe0=
X-Gm-Gg: ASbGnctSBakMjDW45mQ7TB435ZJl59S/d0W5hpvgjRPucloiuKON3gdJeVWR9YhC+k6
	iD9TyrbeRiOa+/B+eCJYfwBud3MMV/+6i12ujKcdO0QZE6dTtWXeHSEcyGJF649uo0DYa+uMVsb
	GQDX2ZN//PPOvqlcauSMkE+YeAikYxc3b2XXVpadSIOB5QMRVi0lQp3Yw8Cw7fyl7mvB+6dJlG2
	BpUpAIFOKqZel956JO6FWe1nuLi62UNwiGcr7akPCoJphalu6Ya4yR8R2222U6P64zcIfX1xXKA
	HdXPw/ON7E57BqBOnBV958ArxrE5nXgSbsS+q0vCz8a9rTKGSYa6m8oqjVdc5KVCVhUEAXoCkIg
	2R8s4BllJEHkImgbhDD/qPRN9o5vy1CkB
X-Google-Smtp-Source: AGHT+IH9xG7Ye2wAaukRafJCYg02WVBXo5R5FWA75dENfamCTaHOhQiWBleExnNJxVd95zyszF0lkg==
X-Received: by 2002:a17:90a:dfc8:b0:31f:134:94ae with SMTP id 98e67ed59e1d1-321161f0768mr19275170a91.11.1754414891785;
        Tue, 05 Aug 2025 10:28:11 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::ccc5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3216129d6b9sm715237a91.35.2025.08.05.10.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 10:28:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] spdm-utils: Remove comment about meta-clang
Date: Tue,  5 Aug 2025 10:28:09 -0700
Message-ID: <20250805172809.1524069-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Aug 2025 17:28:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118882

clang and bingen-cli are now in oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb b/meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb
index ba6ad09098..82f4b7f0fb 100644
--- a/meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb
+++ b/meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb
@@ -17,7 +17,6 @@ include spdm-utils-crates.inc
 
 SRCREV = "f67ac9e00b79f603ecbbd29928a4ecc3dec5abd5"
 
-# bindgen-cli comes from meta-clang and depends on libclang
 DEPENDS += "libspdm udev bindgen-cli-native pciutils"
 
 COMPATIBLE_HOST:riscv32 = "null"

