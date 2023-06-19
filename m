Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48B7C0015E
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:43 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.7405.1687180960026656322
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=d4UPCoE1;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3110ab7110aso3423959f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180958; x=1689772958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytIQ581RNTNTFHKmiOB6/MI45UzpvSdpkK/8kX+tFvU=;
        b=d4UPCoE1JQNTXl+wAoNdn8mx+Xws6Py1PT/oiEYVdaD80zcCyBF7FEGJRfhqLb+jQT
         e3fefLRtsA3b5DoK/Zw7HnvlmtIOaOWnys14OlFaJNWuT/eQHqlDaZ+wcHAIjT+PsPjN
         oziF5qfuGYxGe9Y8FBfIh1FqNwBGljJWAbXctz/QMcrS5OJJDXG1xa5qrfW/zfUFGpRT
         SNV5+uVAdKeW4s4+SB194var4QxNQAk6X4HfKIxihciTkU2Eh5hWEvjZeeIfBZZQrYlE
         r+JQQCCOfToYkgS9oy4IsJfdyqw/x00OD/WkGge1FzGDF5+b8HbfH/krnctKfg8Nklr1
         7Pjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180958; x=1689772958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytIQ581RNTNTFHKmiOB6/MI45UzpvSdpkK/8kX+tFvU=;
        b=hz6wQ4Ls0Tl30IMDPOC3SjWc9OBbLJnlZR1xDV26gGrvGug0Z5HpA47rxEBCrJzI7v
         gVsRb08ARv7kF6VbC7g1PYqW4On2GwmwNGZT0b3GWZsnJ2BfPOdRpEDLOzV7NsDuVCDi
         OwORiae+uhMaaibxwK46K1K1HlwU3QlhsHX4bQwoPsKw7SgClAXp8OzkkHtRJJp9i0DF
         uBzbN6jpxQWkO17vDP98niLU9DWmMLbmBslTYILn0xpfvHswCiJDW3DKeRFZfSPUbVWp
         f3JxhI7wS0lWXAsPgcg7il8KnIu5+pr+78FRtwavVgj1MlNVQvmgjXWaQWU/UmMWhRQ9
         /urA==
X-Gm-Message-State: AC+VfDyb2+EKO2ysz72k55b6pt73NiY1ZhFggNE2NOvXQd329aB3lp9d
	FDduw7AekJH4yVu9+eijQLxYRQ==
X-Google-Smtp-Source: ACHHUZ6ss3PLLURb1fHQD7W3AT8bjCsbza589heqnYBQaw+viKpQRtWtKpwqMBmnu1AR19cdjvyaLQ==
X-Received: by 2002:adf:dfca:0:b0:30e:432b:c54 with SMTP id q10-20020adfdfca000000b0030e432b0c54mr7658610wrn.18.1687180958567;
        Mon, 19 Jun 2023 06:22:38 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 18/54] python3-isodate: stop using PYTHON_PN
Date: Mon, 19 Jun 2023 15:21:38 +0200
Message-Id: <20230619132214.213417-19-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103402

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support python2 so use python3 explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb b/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb
index 2a5dcfca3..722ea3af3 100644
--- a/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "48c5881de7e8b0a0d648cb024c8062dc84e7b840ed81e864c7614fd3c1
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-six \
+    python3-six \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


