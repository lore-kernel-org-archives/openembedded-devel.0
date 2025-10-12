Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B93CCA476
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 00:57:47 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.11113.1760230664558937585
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 17:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hrEqRPRF;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b60971c17acso2605910a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 17:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760230664; x=1760835464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IAMpgZ26V+cK2J0dOcDNKdHPBpnrxyPUDOv9zNYF+w4=;
        b=hrEqRPRF2zbfZilZitx5ipVIhbwjXtv3JvwwV6a0Vf28ByaIsvGJiuHP6/Z9PHcooS
         7/ofGZdcdlcPW51H9Oyx1K6FAt12S9usxzJRF1BUCA75PVwxTgGUFAIBWsvp1BXgbXoD
         WuHDecCMayDY+M76F+ipzkxouCc34l8pDvm9KSKxgzq98vZj/2ax1dRRvQ9H2QYrYOHC
         Wsk6E3j4okl5YLU/ozfLQQAYYobXe0lcM+bhEAqcSY+y6qA7MhI69b1GSsNjJ2g3oaEz
         VyWntd9u+xSQ0ea7ymNAF53zavX9Z2xHAkNh2Zjyq1SjujeGySnYje4otVjBmhyfEHoa
         DeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760230664; x=1760835464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IAMpgZ26V+cK2J0dOcDNKdHPBpnrxyPUDOv9zNYF+w4=;
        b=Q7xkmd9KkvDQN5noVJr870QFEgM/0P8FclpteDU23t//gU4ni8Rs5WFzFQVdJuzAFx
         GqSL241TFN/zwL+jXTSVpGHe2nVcIA8hqBiDLcCFU+aZsxfAWIs1dG60itLhF4VjmLES
         x2uajtX31HTiGvNGUyfBMfyJe9qV1dAfXpy6wAaUZeEO+2hqTNxqHNYUhzUlzcCHBvfn
         vYmGA6KVvZsUrtyVhu3OqBG5Jl2JoleUuq3Z5MjqJSvWSt5kpUogF8tniB1/Ukj6bpih
         asOC8QFoIAixshD3Cv2qox7CjcjRuym0o5auA9jo3L9eYh+fQ9VTHIql3KcTyYC8LTL5
         x8tg==
X-Gm-Message-State: AOJu0Yxp+19be2cN8ZbbJ8ACOnTNmpaxDh04h99E26aSU8oTxV4QGPgM
	yrFBsISPlhZOaA+Csz0khyzKa+wHz/sR9fLQbPOraBOqPRXtQo+rCRAdUTv2vg==
X-Gm-Gg: ASbGnctyMwMJZ8DDXIe94WdF88Q9rq51nuKtMVs9K4ws3YhdoOOgBkenT2JdyxzgAB2
	87vcyW3+CmfNEAANJn0sxCJC2p5jvnMuWWmoQcj8/mBk12cC9xWncgYKKLbS3D/5iLqa7/MBqYa
	1fUYPJpK3WewxOoqJyBcx1Qs+8tinX2UtFbLl5X/x0hNwxZeURTzehdcnoNW2v77GRTT3lZBLcL
	z6nosb3WUq92aozitjjNGt1Vl7iyePLKyijZr+RUfv/Eq7IyJ5Xm3XiiykCICAiLWcf45bKe9r/
	z/shpnY0R2vuVuiNdzIhQQ24U8QaCxWMLehTMhTwaH4ljv6uhx2X/SQEPNIo/Mb0tBZ/NGt7Sl4
	HMSiLvY9qzbW/q6SdMPo1nzt26flf/Z5yowncp9voPYJlnVVz2QifdGA=
X-Google-Smtp-Source: AGHT+IG/X1WFVZrvtsxa0A/Zln7v0VgtofA5cRvpdbC3ouwRnGJ8BrFYi9ltlN3+oKABxfI6I01hMA==
X-Received: by 2002:a05:6a21:999d:b0:262:8bce:33bd with SMTP id adf61e73a8af0-32da83de67bmr23076270637.28.1760230663628;
        Sat, 11 Oct 2025 17:57:43 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b7411fcf0sm1522447a91.4.2025.10.11.17.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 17:57:43 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/2] python3-django: Upgrade 5.2.6 -> 5.2.7
Date: Sun, 12 Oct 2025 13:57:35 +1300
Message-ID: <20251012005736.3294355-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Oct 2025 00:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120514

Release notes:
https://docs.djangoproject.com/en/5.2/releases/5.2.7/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-django_5.2.6.bb => python3-django_5.2.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.6.bb => python3-django_5.2.7.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.6.bb b/meta-python/recipes-devtools/python/python3-django_5.2.7.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-django_5.2.6.bb
rename to meta-python/recipes-devtools/python/python3-django_5.2.7.bb
index 644d825705..a0589d9916 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.7.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "da5e00372763193d73cecbf71084a3848458cecf4cee36b9a1e8d318d114a87b"
+SRC_URI[sha256sum] = "e0f6f12e2551b1716a95a63a1366ca91bbcd7be059862c1b18f989b1da356cdd"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \

