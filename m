Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7030BC52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 10:49:28 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.30648.1723027762713543826
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 03:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B7qsKxBU;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso11167185e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 03:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723027761; x=1723632561; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJVL6dMGBdw9hNlxgyCq6CWw9p6R0B+g1IK4yxTBYRM=;
        b=B7qsKxBUIJH+RX//lWfhkhoA1yKxJXfNlGGg2ATun0CsZzM5Tm43XntOtdAbq7rVU8
         xX+43wq/H1E7gcU4M8D6PsHP16i7qOjWtkaBqb4herdANtcgO/lnTsic5DwnIVusbecF
         e739GgZUo7+/SbK9R7OGi9v7aNwLhyIjmqCCG9retL7UIgnvCpts5LVxBopJPgitFuk0
         r6e8OT95B0CVftFDObNUGkXW+SDXwBbXJEaxMRMYrPN6FASVi3fBmLxDW9+ehFsCBSvh
         JyDhwtgnmFxxTgW9eWdL1nFKMa0f/EB+AbfacqCLuYM/JlJHfJ82kvvIXsJwyw13mwoN
         t86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723027761; x=1723632561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJVL6dMGBdw9hNlxgyCq6CWw9p6R0B+g1IK4yxTBYRM=;
        b=Nn994BSgl3ai1tHNoKWc14Q0vnE1r2epCS5dw2/pq6z7D3UlZPvQk0yXmkCujOocVn
         faoANdRpEtKw76koV5kkTGI5fSHLsgIAsawezFy/qmBrq48ujWGTZ2E0tGLKIYBP8UZG
         cbgrkV0+/Bq7SB/9YZr0sFJghtRncRk/qpkKqHPNzfHJJvOq3QbhPsdN8hjqOQTOA7t2
         b/iKRRsauSZf5XBTc1eO3tid3T0VGu4r8ZiuCWPp5t9uGnF7f69RObzthcqkMjTPrQbA
         ryESRvYdUI5CyBvSQcnJj1vduHE+wCYeAGDkqKhiub9j14pLs8rTSgtTl+It1eEymY0x
         ARkA==
X-Gm-Message-State: AOJu0YzTkgAUbTKDl/Nbpl+PbrSSjhIRh6ZMqh6O5FCrXLiZ2N1T7uOW
	98D6mv9ch8dNdHThKQ7h+TKHcXccqyoX0SANCJ+31Xz84yLINj9xjozEfWh+
X-Google-Smtp-Source: AGHT+IFk2Xkbbj5zcm93crNzw3sBD04gECqEjmUDUUM9RhAO6iGg1W/Rj5znuZ7YiOsZ2cKHfM1yLg==
X-Received: by 2002:adf:e6c7:0:b0:368:6f19:cbf5 with SMTP id ffacd0b85a97d-36bbc0ffb40mr12013227f8f.31.1723027270458;
        Wed, 07 Aug 2024 03:41:10 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbcf1dfc3sm15521681f8f.31.2024.08.07.03.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 03:41:09 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-classes: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 13:41:03 +0300
Message-Id: <20240807104103.13523-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 10:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111608

The project has a proper pyproject.toml which declares the poetry.core.masonry.api PEP-517 backend.

Fix:

WARNING: python3-classes-0.4.1-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with poetry.core.masonry.api, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-classes_0.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-classes_0.4.1.bb b/meta-python/recipes-devtools/python/python3-classes_0.4.1.bb
index d9240e138..8daf82481 100644
--- a/meta-python/recipes-devtools/python/python3-classes_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-classes_0.4.1.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=155fbcc756c8ae5265d252d23e20908f"
 
 SRC_URI[sha256sum] = "4de4fdd6c5c38607bbd8ad76703d7cc4dbe007cfa78e8ef1f62fc6ac55303e23"
 
-inherit pypi setuptools3
+inherit pypi python_poetry_core
 
 RDEPENDS:${PN} += "python3-typing-extensions"
-- 
2.25.1


