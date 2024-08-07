Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55760C3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 10:31:08 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.30246.1723026659636455733
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 03:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ddJX+RBU;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42816ca782dso12061185e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 03:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723026658; x=1723631458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rWGqpiSRgLgfAaqBCEOpzLs8Qiu0k08MHS6OIf3Hwck=;
        b=ddJX+RBUQUrgHfGBlpZF8Txl5xfodFevGwWCPsQhe22jCgZdhO5vs0N1Fs/23YXWQ4
         3+hvmtmalhgtqIPn/xm7yiG5fHKHSxM40qtWuBDcT+1Cr/TRAR5BIQ4BH33CsC2DbWvG
         VRVOIaiNWJQ+krdfezA1QoKuyKZWIQM+tV+1dqpuhDwGK793ItRO+Z3AXXDkhINJEobW
         s3hA8CmbYFzZqUYnY2aMVG1ab4FkunfC0SgRwRETPimVjAPxlKoMyHfjXEwG3hRh8Kv4
         XJFcXIz8GYRs0R2jDPdv59E0TnEBm7p46pJLJ7Y5gNXwd77v7E1TryFRobQiTbud71QV
         zjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723026658; x=1723631458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWGqpiSRgLgfAaqBCEOpzLs8Qiu0k08MHS6OIf3Hwck=;
        b=mmTH3oWWUGBKej5MOa47ytkdxSPC2H6o1W46CGXaB3MEgQrT6p9dwhGbpxRnkzYxEZ
         l8Kn3Xe/vCLoMvus6VVD9prYfMPhGJ1EL2th1HbD+hlkJzbhA5hEP2T2hO65sWFgsNFg
         /i36E0gcvwDsKEt6CgcH4H+IFzapsVLXah0dnKO0jWnmJrHG92xo+FpTe+3yi0VegE0t
         GxOVM3CGuVsp0cBppN8g9vjqLXkvOnwMF1Bbwa1pxun+BaQXCYKQ1DWPxkSJarOAQaUh
         cCKCZMje67ui3+V4fPzxdKPIzyWxDts+jnFWDb15SwgIJksz4CpNNDGDyI8EsNRISDwX
         tfgg==
X-Gm-Message-State: AOJu0YyrHQyyWrNLRBatEEXafLp+cIB0FFPW+P5/lYgEREMWLVRvE66Q
	6HNAPxhwwXuBQmRQr5HhHu/7IVwYjI4DK/KJ7tMAsLUZ4N/HYKRJGD1yAt0w
X-Google-Smtp-Source: AGHT+IG/jUn+N/xwXLfbTAVjK7K5z8DCzgZ/67HfPvmSe+oQMZQT9OA+bTlKAcPm1LqZN8dRUrUeTw==
X-Received: by 2002:a05:600c:3b9b:b0:426:5f8f:51a4 with SMTP id 5b1f17b1804b1-428e6af4d9fmr114021915e9.12.1723026657286;
        Wed, 07 Aug 2024 03:30:57 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290566c0d8sm11522215e9.0.2024.08.07.03.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 03:30:56 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-lazy: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 13:30:42 +0300
Message-Id: <20240807103042.8973-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 10:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111607

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fixes:

WARNING: python3-lazy-1.6-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-lazy_1.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-lazy_1.6.bb b/meta-python/recipes-devtools/python/python3-lazy_1.6.bb
index 97517f89a..222489302 100644
--- a/meta-python/recipes-devtools/python/python3-lazy_1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy_1.6.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7df3865e8640604acfa474235d2db76b"
 
 SRC_URI[sha256sum] = "7127324ec709e8324f08cb4611c1abe01776bda53bb9ce68dc5dfa46ca0ed3e9"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
-- 
2.25.1


