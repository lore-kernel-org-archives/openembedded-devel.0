Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685FDE748EE
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 08:49:22 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.56255.1696150159521964642
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Oct 2023 01:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nc4E+gqy;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-690d8c05784so12573604b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Oct 2023 01:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696150158; x=1696754958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2kqn6tyAZ0XL9TChYKge79+cSMBLCtHuEl4F1gE6GAk=;
        b=nc4E+gqybdPm92JmoOPGaXGAPLDdkOVidLUQywkeuh65RN5SVyadhlGnEg9tGhSThD
         9/c2DKSEB6qEqc90Th1w2S2wwsDeJvIKKGg0z/GDzSfsdXpSh13VdznccrO42LmWUS93
         ptIzpz4aygz9KzFYuH5YZ0Ej2rZ2wDxiIAmgBSFuEVSK8Lpu3eGybDgDYlWVqjxy0ZiK
         8FQtKSKVHIs1akyvTM//g5AuGsSK8QQxTrh9BsNFURCU8nsykwP0u19DEC6LiMWH9NQi
         WjMa/VWWsqO8haw8k0BPClUq2DcQ1vol0VEsBmdznRXdRZ8KiPNMzkrkE44xDh4EXHEQ
         bpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696150158; x=1696754958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2kqn6tyAZ0XL9TChYKge79+cSMBLCtHuEl4F1gE6GAk=;
        b=OKnVx1ktBf5pyyP2Kv6V/Kdss5I4Ef8mR7srzsrmiTMQT/VMETdacE0Re5hep/rXU9
         SFDkwEwz+x7G1xH28/jsjmgmf8OQldAbVlKyVjrYLTvxAJ9/dO7vlgb5VhtFiyTvTerH
         Bx/8ec4AWe0PxSjROD4538xo8SYAbGTHXnVxkusif0W96aED2k5RcKl+KRYKWHyvI3t8
         uEn89gcLv+9F25S8bkN1RyuXsAfPnEeRHWGnfN/NpZ0nm8JbSISdC7wh+yKAVB+44OVa
         DiiC/u9pJUYN0DKbtJVkuBj9u6Odr9II3sZu2erYUW6In2AjNE3LegQGcHKm+YUH2plE
         Hnbg==
X-Gm-Message-State: AOJu0YzWadHxkGUNMdd+L52oDH2SKfRPq8xcZIlN7TCu9qONU1rapvbt
	SrGOYWOVh5dbdi9VVcArMdMNMl2dSiy2aQ==
X-Google-Smtp-Source: AGHT+IGpj7AsrTDSA1JRW5z5M2u7kV9TzGSFcPjvHrrrjK88+7usRrSPtMg2VFKi9xPCp6tr5/Fd1w==
X-Received: by 2002:a05:6a20:7287:b0:15e:a8:6bb4 with SMTP id o7-20020a056a20728700b0015e00a86bb4mr8971698pzk.8.1696150158443;
        Sun, 01 Oct 2023 01:49:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id g24-20020a1709029f9800b001b8943b37a5sm8779199plq.24.2023.10.01.01.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 01:49:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] fftw: Fix ptest result reporting
Date: Sun,  1 Oct 2023 01:49:13 -0700
Message-ID: <20231001084914.3056272-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Oct 2023 08:49:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105292

Fixes
  AssertionError:-
  ptests which had no test results:
  ['fftw']

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/fftw/fftw/run-ptest | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/fftw/fftw/run-ptest b/meta-oe/recipes-support/fftw/fftw/run-ptest
index 6d8dd96f02..45641c3277 100644
--- a/meta-oe/recipes-support/fftw/fftw/run-ptest
+++ b/meta-oe/recipes-support/fftw/fftw/run-ptest
@@ -10,19 +10,19 @@ cd ../fftwl
 /usr/bin/perl -w ./check.pl  -r -c=30 -v `pwd`/benchl
 fftwl_result=$?
 
-echo -n "fftw  test result:"
+echo -n "fftw  test result: "
 if [ $fftw_result  = "0" ]; then
 	echo PASSED
 else
 	echo FAILED
 fi
-echo -n "fftwf test result:"
+echo -n "fftwf test result: "
 if [ $fftwf_result = "0" ]; then
 	echo PASSED
 else
 	echo FAILED
 fi
-echo -n "fftwl test result:"
+echo -n "fftwl test result: "
 if [ $fftwl_result = "0" ]; then
 	echo PASSED
 else
-- 
2.42.0


