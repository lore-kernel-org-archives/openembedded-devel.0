Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD5B7C38A2C
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web08.21512.1649623548591003445
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=GRm0Bz1u;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.54, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f54.google.com with SMTP id t25so23369298lfg.7
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZipxGd8m2SPt1q28PenOD376oKnQYzH3eFOQFWb7bTE=;
        b=GRm0Bz1uUMzJJFbRwoSkMc3ukoWJOJTKPRoSzXrtwkI3z1Pb25zXr7/bGSyy9811+x
         YzfFQlblUaK7sGlpm5LlOe2QTYWD0lZ86VgAph0L4ZrV7qIdcbAow2ZDhr8G3qkXFcMY
         l09YouaLJwtbdk5Jnkqw2eQpYUHj/IgIUgbZZLh2+G6qSXjF+Ua3sfAkBksv2n5yHNla
         ZGB3LXt+UhSHbr1oU7b+0pJlszNCq0cNIRHsI+M4+7PKhHeFCItcyOcLNbbOky8e4msT
         KRErwBWbUSKw7mL7JiLCdh5o6k8b0ikEdupw+R33hL6yTPg7leh9Zw9wW/ZeH2m8ZFFB
         XMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZipxGd8m2SPt1q28PenOD376oKnQYzH3eFOQFWb7bTE=;
        b=Wq1qDsLrtMK3c/aGxR7VtKKlZ2IfHSI1lC61+Wz2kER47ciqVtCPox0xo0Kb6aBezD
         KKTjHs/OLvnGygxdX5aWds79kuu1dWD69Iyo/jNEPQ3PedHpKH9cyiSjvz61OAAFXa6T
         Fr2kTVL2QDGucpnIMqzJYXEsVSDP5kZ589FZbbe1/yzbnAI1HbTWfeh0rEDNDi/bFBY4
         VOgfJ3eOJ4OnSbZcC28HycdYSXb+4GIWCAld9SzcEB4Mfjg7yVU9CHF8fTQn7GkVAXEZ
         DKkE4vo2t+uvXaZUdy8KrGl8F3WeUvNTKSHpV2Lx5xyDfM7tZiiFBjQqPMWXN83ITfXb
         lXkQ==
X-Gm-Message-State: AOAM532kOdAmWmWnquXymBNXeVRbx5I87ZUA1iBcwjgBsaeO36lcWRFa
	rREhMh2PZ28gThr3mGiHR2cIWv2uCTODG+1p
X-Google-Smtp-Source: 
 ABdhPJyAx6mdRmmCaEEH1mXSPHVUDOV0hC/kuFzUNbwg8IxYZ+Qsn5V7eLETb2xoGl9H3KiiMFUGrg==
X-Received: by 2002:a05:6512:22c4:b0:46b:a241:3f55 with SMTP id
 g4-20020a05651222c400b0046ba2413f55mr2842741lfu.677.1649623546514;
        Sun, 10 Apr 2022 13:45:46 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 g15-20020a2ea4af000000b0024b5b4ffcb8sm492448ljm.139.2022.04.10.13.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:45:46 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-bidict: update to 0.22.0
Date: Sun, 10 Apr 2022 22:45:44 +0200
Message-Id: <20220410204544.4048446-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96533

License-Update: copyright years updated.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-bidict_0.21.4.bb => python3-bidict_0.22.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bidict_0.21.4.bb => python3-bidict_0.22.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-bidict_0.21.4.bb b/meta-python/recipes-devtools/python/python3-bidict_0.22.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-bidict_0.21.4.bb
rename to meta-python/recipes-devtools/python/python3-bidict_0.22.0.bb
index a154bfba4..088931d14 100644
--- a/meta-python/recipes-devtools/python/python3-bidict_0.21.4.bb
+++ b/meta-python/recipes-devtools/python/python3-bidict_0.22.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "The bidirectional mapping library for Python."
 DESCRIPTION = "The bidirectional mapping library for Python."
 HOMEPAGE = "https://bidict.readthedocs.io/"
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9741c346eef56131163e13b9db1241b3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=858e74278ef3830d46481172ae03c819"
 
-SRC_URI[sha256sum] = "42c84ffbe6f8de898af6073b4be9ea7ccedcd78d3474aa844c54e49d5a079f6f"
+SRC_URI[sha256sum] = "5c826b3e15e97cc6e615de295756847c282a79b79c5430d3bfc909b1ac9f5bd8"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


