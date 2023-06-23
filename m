Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4444FEB64DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:27 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.213.1687531218229639535
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=kqWzqjBL;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.54, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4f86bc35f13so953909e87.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531216; x=1690123216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2P+b3SinEgWfzktVTTinG6FLz4mbyoofycGhpLD4GwE=;
        b=kqWzqjBL1zxOmr9EPlokhSik1BXfggxjQr0vJVNDyJzGQm2ScsdT3gYl7fEeQpIMcG
         d2tRTUsdPlxZbctT5nxUzyAH74oAecBAmGA+BIdYtDED0V2Rsxz0BustVIolIxnunokW
         t308RCk6CUBMOdc7VkxE8J2qJjqnWhvRaZpKC16Kw1Gc1VtsSYulceFfYNR+1NvGX8D3
         Yw6AkiOaPWUr1wbtcnbacKUwdzfj0l9KcnOce42pSms2EUknu1OupQ7RVph0iaLJiK3a
         pon4X5omsRprIMl4lC9NYS25Pc8oYDnnHUFV90lemJEHR2buOg1WOn5haiRIfXbkKm4g
         v2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531216; x=1690123216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2P+b3SinEgWfzktVTTinG6FLz4mbyoofycGhpLD4GwE=;
        b=gfJ670GJA2SzYwg0Gx0UMCkpSHNKJwX4PD1oahjQpENzZzH6peiOP3GCCUzFhVwKz0
         D85ttrjG8vh6zHW0z9bMDn2Cog6qU7Aeye/D768moCCl/ooHfEV1fFUAS4AQ/Ef98U+6
         fUsFM0icSuzHTl7zc1vTRmUlteELPFMXhxxKLG9KWsWFcpKPKAFDA2QwxlsIBR3pzT/4
         1MgAtzGHFisfWtv4BEQ3IqCg5DPmnhlm4bZUaPW5egMGw4K1JMW5hjB19TOiJAv63Dfj
         iHKfv5mKLRWEvAOCRyqLOz5VKX0dMGsKB/YPEeQaPPM9DVvhZVrVixQY9MP7lm/M6pey
         /tNg==
X-Gm-Message-State: AC+VfDxkhlyxrQ2VrlCcZ9g85P0ZjvqjcMwMj+016EusZkgCpmL1UayZ
	HVLslJQ7ifp20JqWUm3pw2wu47RKu8m01dmjmSU=
X-Google-Smtp-Source: ACHHUZ5LdTJopfyDFF+36dKfUZno6UQaiZ8wyxXm7QRruk2qsninHOIhhkKcpiYEVLa0GPp72NEwCw==
X-Received: by 2002:a19:380f:0:b0:4f8:5af4:73f1 with SMTP id f15-20020a19380f000000b004f85af473f1mr11166623lfa.32.1687531216479;
        Fri, 23 Jun 2023 07:40:16 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 43/55] python3-colorzero: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:39:09 +0200
Message-Id: <20230623143921.146338-44-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103539

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-colorzero_2.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-colorzero_2.0.bb b/meta-python/recipes-devtools/python/python3-colorzero_2.0.bb
index 1a331d13f..fc1615e67 100644
--- a/meta-python/recipes-devtools/python/python3-colorzero_2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-colorzero_2.0.bb
@@ -7,7 +7,10 @@ HOMEPAGE = " https://github.com/waveform80/colorzero "
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ae6c62710c0646f3c60d1ad812ea9bf9"
 
-RDEPENDS:${PN} = "python3-image"
+RDEPENDS:${PN} += " \
+    python3-image \
+    python3-numbers \
+"
 
 SRC_URI[sha256sum] = "e7d5a5c26cd0dc37b164ebefc609f388de24f8593b659191e12d85f8f9d5eb58"
 
-- 
2.39.2


