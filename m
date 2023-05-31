Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21917C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:52 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.9143.1685521602129475363
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=jfr4QV6O;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.48, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-30ae95c4e75so3597023f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521600; x=1688113600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTDQ1PMam5WWB++yPBJOh187prHyp9MRbg8Sf+uSEwY=;
        b=jfr4QV6Oy9ttMsfo9Kop442X+bgO7y84JWZgjdSwcrqCWMWdEOTmWpFe3g1OQ9brBd
         Q3gzIsli5JnTk2BX24brFpiN1WmLOG+23t75NDjxC3lbBLJIollwQTCLxZB/aHQRnYau
         L7wHPiea+KQYpiy2ZeoYI1JxNlZ7N5T8jdyYqLuEzoL3cXEXgijMsIS0ZJq5NxNSn1d8
         XsQ/JGA8SyVGouKrq9VkXzgpK0Uby5DPteXwAY/l8MVEU8Hf21BUIfJwFLt1hJi01y77
         82bWnrvoe1dKbgOquqcvkGjJUe6XmrmAubKr4zp+WK/Q3EbRugcbyVz5IkWmqjBcF9ce
         OtuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521600; x=1688113600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTDQ1PMam5WWB++yPBJOh187prHyp9MRbg8Sf+uSEwY=;
        b=i78WK2GWaQIXHoZq52MKt/i+HLaW9h/LEnELVz0nR04QmzikwreBZ6H1Qg8RV1DH/h
         FIcx14HgjiQzv5yiO+bF7WnIE8hCXpDoG23QEXbjUiLM3CB+fQT1zHMCPkaQhpzD9Pfa
         A/gibxrBRu/kWbJyPsp4CXei3+TMdfZwiyW5q1rfzAGhBxHFA7oWWr56CBv0EFYIlcri
         Vpvi0nzgql49DlIi0AjPfU09i4prpOZ2JYY0spUk0JU5GVZ2f0d6/8x5SQdg6/BLy/Jb
         HdsoFRF2rerUQxffnoV/SD4x2Bng14CJ729gjy3Sj5MQnfNNtAlczLZecvyI7Kci+Isr
         2ZCQ==
X-Gm-Message-State: AC+VfDwwUDsfC/egjfuRcuNuHkbSzB9eHE5gz248C7SE/W/w/qMoBI2t
	rMN6YBtrfE3k7akXCjMfHcFakw==
X-Google-Smtp-Source: ACHHUZ4jYKqHWs+qjPwUsqBFhQWnabsgQyU6TtMF1s3/JNELY3H18jhCxM6OguB7yRumM1ZYhFpH+A==
X-Received: by 2002:adf:de01:0:b0:30a:e7b6:52d6 with SMTP id b1-20020adfde01000000b0030ae7b652d6mr3470099wrm.52.1685521600756;
        Wed, 31 May 2023 01:26:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 085/149] python3-jstyleson: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:33 +0200
Message-Id: <20230531082437.10646-86-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103012

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb b/meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb
index e70ce33ef..237713bf1 100644
--- a/meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb
@@ -13,3 +13,5 @@ inherit pypi setuptools3
 SRC_URI[sha256sum] = "680003f3b15a2959e4e6a351f3b858e3c07dd3e073a0d54954e34d8ea5e1308e"
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} += "python3-json"
-- 
2.39.2


