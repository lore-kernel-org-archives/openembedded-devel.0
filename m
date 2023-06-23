Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A36C001DB
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:17 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.206.1687531210065634405
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=QPZk8Q+l;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.41, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3fa79605a3bso7402535e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531208; x=1690123208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKx455cwXVXBlS5JJWoHeUYliE00HISKGSK6rVBGNaE=;
        b=QPZk8Q+lJfERhiU9lP5cxR5GPFU9Jz0OlRNeAEeCBQh+N62yXQxZi7gtEfQAehRogn
         +OJKO0TNPNtLcEbDy6ODNXvZTFeF2vWJX1Qblyi3pwf08umZ7T5JLgIn0IbuIhf6SDqc
         tZYAu/H5eBPqqvXwlUGWQdkDUz6EF/8ONw5l580kVH1v7VmGPEhGAvzHaEeZnnIkbFYq
         fVP3w+6E01RHB5TrG+9TA9yk+iiWfsncM4EiLzCDPO5pYy1ZtTGs973Ks78MMDqBKGGq
         mAIUiZ7wR8DWKXYsOYdQKgovjH4F/6YYjPSk/DpcCgsmfALqvcVNjOD/iHPdN1sq2gUJ
         j1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531208; x=1690123208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKx455cwXVXBlS5JJWoHeUYliE00HISKGSK6rVBGNaE=;
        b=Vl7ybD+mx1UacZB+3GoOTtzGcZA5zFDG4cAzlAan1GCUGNgZFOxJmloLKFfpOIEfc9
         jytR0tKbkrswwEnJCI9bYQStsGkjZm/93huC5I+f3LNLo+zh0oZaTHOA7JsA2jYbkZua
         H+hHQbn3lWvNLgXt5WjhUNfqfyD8tNLCkz2DJD/yfs0Ru8bYSAm+xyWPpqPXF096GEsZ
         A9bDf6490V2RKZ2q6s0A+oEyJlJWubP3rFTivQDSHmrIvCCixV7WaJ+3ZKuCyHfw/5mM
         5Hsj4uojFlmE35KRMwknCxwxktNLS9UsPHTw9HRS0xdJE6DgMsmJhLkAtjompZCsFgSE
         2zyQ==
X-Gm-Message-State: AC+VfDx8cXYxQs8CwyAR9hn88XV7QCQnRDtmr4dw/M0OnVx/ARBjrH3T
	KFHNglBgHVGK39vTFjsr36Do5XhLnx+5A2TcSZ8=
X-Google-Smtp-Source: ACHHUZ5c7weC7Mw4G+V6b5xzXAxUX7cmDcwUglLsLYO/3BEASevAoehP9ZBgoTGcTI2F1U2iN0PheQ==
X-Received: by 2002:a05:600c:138c:b0:3fa:7bf0:7a81 with SMTP id u12-20020a05600c138c00b003fa7bf07a81mr2187911wmf.0.1687531208633;
        Fri, 23 Jun 2023 07:40:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 36/55] python3-attrdict3: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:39:02 +0200
Message-Id: <20230623143921.146338-37-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103532

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python3-attrdict3/python3-attrdict3_2.0.2.bb                | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python3-attrdict3/python3-attrdict3_2.0.2.bb b/meta-python/recipes-devtools/python3-attrdict3/python3-attrdict3_2.0.2.bb
index cb44ea71a..ee099c7ac 100644
--- a/meta-python/recipes-devtools/python3-attrdict3/python3-attrdict3_2.0.2.bb
+++ b/meta-python/recipes-devtools/python3-attrdict3/python3-attrdict3_2.0.2.bb
@@ -10,3 +10,5 @@ SRC_URI[sha256sum] = "004c171ca1120cc1755701db99d7fa4944afb1e68950434efdaa542513
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native"
+
+RDEPENDS:${PN} += "python3-six"
-- 
2.39.2


