Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE4CC77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:31:12 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.9139.1685521863326746110
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=vK/2PSAG;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.43, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f6da07ff00so57740055e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521862; x=1688113862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2dYvA4SA2BAxLaNhGmYGpQTBo4yrn3iV+b4AeFb21I=;
        b=vK/2PSAG32YXRCjdYJYEq+mF7TMpi81V0QsN1sbLdB1lMdCjhVC2wfVcTZZyVaEaxo
         GI949GgnjPk2xf/l/pajBCMRhPSI/lA+UhMVO8YsasvrarYO//jplk/kPfqpR1vBvmZI
         8IjhcyMe7BP8tOChLxakZQHIM79jIsnx8npro+Nc4+uHYfJPqwSXmorHSBX1Rp3zlbhU
         fdh3vlZeo0P/VSFHZ0gOlvGkxZiztN7gc2ojNXsPiKOYikNHOf0r5gY//H/TTpkovPsf
         yO9B45pFNdHyEHala23EOfPctT0MDFEtSNeHWulThwYCNps10MoG5Thf4jbI1sG4I0LK
         9vdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521862; x=1688113862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2dYvA4SA2BAxLaNhGmYGpQTBo4yrn3iV+b4AeFb21I=;
        b=BdFLM/BdHIg0MM+8KuVr2FXpSJtUezz/skYFrW3Ugzq4z7pKqH6CSiFOC0v2+jZhbU
         u/9KNmeW0jT7GhruNsI14SSQ5RlgfSLnFk+bnpOovqRukag4DGrlWlK28MKAW9E8Yibt
         sPOlmnnAh2fQF+VXk/xOk2WlNh6EOy5JAxfiFyzLkXJ0YpIEsMK9BgPndM/j1xlzdycS
         rzHyoU6QD/g/mtOpHQs92pl/7eBUg3TdMyjkX7fxvYMMooN+npSLVcAQpwbdbX9tMGdD
         YSYqVColDJhFOsldqZ1uBVRBtmqojBDcDOlB2Ez5vfmoVu1IGoiZnmFFBMqC+/uaBAZJ
         95tA==
X-Gm-Message-State: AC+VfDyZ9wU9z+Nni9LVIV8jUYE6Ou/ZmIfTxr2iTWeNCVMIErA51Ds4
	+Lp7ku0YZxaiZGZk+8fKEX4A1bfwV2gDTEk5fsI=
X-Google-Smtp-Source: ACHHUZ4PsOZPc8AKEe97q729dA9uGdTT1y5cuB8vIxb8TvZkhiaJRmwS2+4OpXkxjvW1W3ta7LjlBg==
X-Received: by 2002:a7b:cd18:0:b0:3f4:ef34:fbc2 with SMTP id f24-20020a7bcd18000000b003f4ef34fbc2mr3977408wmj.24.1685521861875;
        Wed, 31 May 2023 01:31:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id t16-20020a1c7710000000b003f604793989sm23338288wmi.18.2023.05.31.01.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:31:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 098/149] python3-oslash: add missing run-time dependencies
Date: Wed, 31 May 2023 10:29:13 +0200
Message-Id: <20230531083004.11083-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531083004.11083-1-brgl@bgdev.pl>
References: <20230531083004.11083-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103025

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-oslash_0.6.3.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-oslash_0.6.3.bb b/meta-python/recipes-devtools/python/python3-oslash_0.6.3.bb
index d9d977b70..b926484db 100644
--- a/meta-python/recipes-devtools/python/python3-oslash_0.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-oslash_0.6.3.bb
@@ -14,8 +14,9 @@ PYPI_PACKAGE = "OSlash"
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "\
-    python3-core \
+RDEPENDS:${PN} += " \
+    python3-json \
+    python3-typing-extensions \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


