Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2066C43334
	for <webhook@archiver.kernel.org>; Sat,  9 Jul 2022 02:53:13 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.2759.1657335188888861091
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jul 2022 19:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dcSK+n0b;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id r22so439683pgr.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jul 2022 19:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GLLL/GEu2qhcY7A6aTP0A7xgboNZ+J8vIAQCA1ZBPsw=;
        b=dcSK+n0b9B8E0wMEPxLoDh1P0y1mnZ2etr3krdytlglWchZyci8CQ8iuTvj4Rjkogh
         VLZf4mj81xiw+vM0mREK1YkofxpRbh99wfKmptqRBKDOB1zTELWfYP6n45TgxJFF9e+h
         wHWwh20Yn5N86Td2sQzPNFVZxfWtSoTpkdEUx6AXBkN+LS5ylg594EoJFEILBkbF72bv
         7zf3JS0PkMifSa3qQPDsxRioniLhNwr2/r5q2egcGDqmibzp3BX/TBnStSvqpqF6WLRn
         XbCRJJAuQsj1utSXOBBkDdc3fheDGj5LapWCLmwjfDQ+D8SUTt8eLG+fCJi/MdvPwsJS
         kFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GLLL/GEu2qhcY7A6aTP0A7xgboNZ+J8vIAQCA1ZBPsw=;
        b=waSxKetiMNT4tg7MF83LEuCYs8qW0Q5uvCdZj2pRc5LaiaEQZTII4R67psTssvljqK
         +eXOkqkdCHV87hX4wU+OPNZ6rV3mRYFc1ubuu786UW3qK9rlTuo/o4y9hrUQAlt/PUSa
         w4CiI2jsO2sQj05mqRFWZPC602O6/jFEA5XspKZTDhHqMZYYAdfxAITKHoesAE9bDjqh
         vyq/YR5EMrbWDzBdcjyOY9Oajr5nrJMhM4cBTANlmDYV5LJzIb5N1PnwG39To8/ryIDk
         TdvJh6GANYM54UBhWDYhowtQxFBjl0JajkSzADIoT03nzCER2XxQUM6AvX1NheKEeFsb
         jnGw==
X-Gm-Message-State: AJIora/y2uhL7J8GPmCkJ1SjEUYJuW7qAQiOjlnEjv27+b0KDOh7w2f7
	VGQ0QxZpMMEQ5G73o3nLVFVgA9ptOgWSDQ==
X-Google-Smtp-Source: 
 AGRyM1ulDcFSSo/rWu8q7Nt1zULoO2auINIHjJOgUcjtU5eYLsooYDyPcxa/DzBDm/DdpOkshvzEHQ==
X-Received: by 2002:a63:ef07:0:b0:415:b43b:2575 with SMTP id
 u7-20020a63ef07000000b00415b43b2575mr5838071pgh.311.1657335187960;
        Fri, 08 Jul 2022 19:53:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3bff])
        by smtp.gmail.com with ESMTPSA id
 x10-20020aa7956a000000b00528c98cc6a1sm289389pfq.158.2022.07.08.19.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 19:53:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] opencv: Link with libatomic on rv32
Date: Fri,  8 Jul 2022 19:53:05 -0700
Message-Id: <20220709025305.3156359-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 Jul 2022 02:53:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97794

Fixes
undefined reference to `__atomic_fetch_add_8'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.6.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb b/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
index cbac75e0bd..f6c10054c2 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
@@ -100,6 +100,7 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
 "
 LDFLAGS:append:mips = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
+LDFLAGS:append:riscv32 = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
 
 EXTRA_OECMAKE:append:x86 = " -DX86=ON"
 # disable sse4.1 and sse4.2 to fix 32bit build failure
-- 
2.37.0


