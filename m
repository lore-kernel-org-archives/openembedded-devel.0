Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF3CC433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 03:16:11 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.1438.1657163764544873046
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 20:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nWffWfw0;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 145so16048979pga.12
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 20:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i5sflkYzod8H0SejQN9R4//95NLdaJIqgY+ItuIBM4Q=;
        b=nWffWfw0Qnoa/4KzfIZi/DhW4VmJLl4ecSe82ewaU+SX+ZYqfoMpXA76Nly/LOxOKQ
         J0kmG9lhFzdcY76J3HmxepKOVzjnf3XvNUkeyWgNDBDLaDCluEaIJUHmAEdPJozu9iBt
         XEb6qSNP+29xSEiFhR9kknI7J/gyCra9Llw+NEk1vKvLcl5Ryf6pJNW29yISgBUEzV1q
         oT2giaYQEe+P8slPxTPN8G/m9kV4PM11N4A3PVyc/ZUc/iqOt444+GeLTIuNfovN/3yt
         OjtjCg8darjkzLgZV0Laqr9ihk8hu3hQNAwG4ct0oe7mbxaU5eZML1jxGbdQ3qlUv7oo
         RPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i5sflkYzod8H0SejQN9R4//95NLdaJIqgY+ItuIBM4Q=;
        b=xU3sPY61/GF7TJr2fBkw0ywQeOlBBR+TeLX7iT0uFM9rKE97Hhw75GbbSokcgCm/mw
         e9fqFRjd+HMlldnp+UmSkQV4T4eWTM/FhbdmuL5/BKAtO1R/MDhRZVokGWCeefdbDDGx
         Hj6iUc2JYcB9Leu5MzUjjTcAkjGYEV0NnerW8GAFtEgetuZEZX/CzCZVYbLDoSFROHpE
         /L35ZOV1YJTGZ56btAG0Q8bDYLLy6ki5QX++Jxfy68X5TJgJQzyjiGrQgkSDbhifPEAm
         M3yinpyzTwz8+1Lpirjt4kDGb446aTjrkhW0132agZaciwGgjfCvrz6ofN0AjCVVUT0u
         zWrw==
X-Gm-Message-State: AJIora/O94A1p5S8fU7eUQifsa4frfre6s/+2+YAUoRnV0gLx64cWH5S
	lBZXwfLQ1HCW4yv7nZ4RZBjZPvatFDPJQQ==
X-Google-Smtp-Source: 
 AGRyM1vb/Sfk2aHcoGKC8OcDADb9sXLAdbqHSgddCdZukNDOFrAPWw/zDiUD1oEtZtrj+I7CV30MfQ==
X-Received: by 2002:a17:90b:4a47:b0:1ef:bc34:406a with SMTP id
 lb7-20020a17090b4a4700b001efbc34406amr2357088pjb.33.1657163763647;
        Wed, 06 Jul 2022 20:16:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3bff])
        by smtp.gmail.com with ESMTPSA id
 j17-20020a170902da9100b0016be7a89ac9sm7044423plx.94.2022.07.06.20.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 20:16:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] opencv: Link with libatomic on mips
Date: Wed,  6 Jul 2022 20:16:00 -0700
Message-Id: <20220707031600.440310-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 03:16:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97734

Fixes linking errors e.g.
parallel.cpp:(.text._ZN3tbb6detail2d19start_forINS1_13blocked_rangeIiEEN2cv12_GLOBAL__N_113ProxyLoopBodyEKNS1_16auto_partitionerEE8finalizeERKNS1_14execution_dataE+0xe8): undefined reference to `__atomic_fetch_add_8'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.6.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb b/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
index 46f9237753..cbac75e0bd 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
@@ -99,6 +99,8 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
 "
+LDFLAGS:append:mips = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
+
 EXTRA_OECMAKE:append:x86 = " -DX86=ON"
 # disable sse4.1 and sse4.2 to fix 32bit build failure
 # https://github.com/opencv/opencv/issues/21597
-- 
2.37.0


