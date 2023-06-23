Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06369C0015E
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:39:57 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.192.1687531190785506965
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=TqX5kUwU;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.53, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fa798cf204so10524725e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531189; x=1690123189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=boAn4x11Bv91LZld2uutA6ZomADCjCpZ2huAyCKutx4=;
        b=TqX5kUwUiryFXgyB5pz+6nffriFT8sft1sBQtuymYc3bI1IfU/V+oXIaXyWDtpoJ6M
         MCdel1Gjg4HOrkP74e+Zd8OCN6rxBB14Cvpeo+cUqLw2ivecT42gXUtHeihw6L0qcohu
         YSn3zFa5q2kOM7xxoI7/y2lZrGzm6qAxCbkaaYCnu672XSTXegj45HCgtUOkfQ+Hp1t/
         qXwS1mRw0kjqmaT0JYRlZyt1sxZGhzBaue6HJ7yx3M3n5MpunJqSsP4Y0lN1WYDqDfkR
         ByYcc9lMsnRDE3Fkv62BuFStA3B5+iuCA+8m24HlKkq1t7kPjkzgZdNifxGg5ptD1MlZ
         1iXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531189; x=1690123189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=boAn4x11Bv91LZld2uutA6ZomADCjCpZ2huAyCKutx4=;
        b=L5o6dMMZ335mo93Et6TsImjg1ym0lPYVfLDMcLbLpJdmE83rQjCaOnepmIII6Voe/9
         0fjfaj+mmJOYq6P6VtMCUX8ci0yDNsPOoezIwv/wm2GgtFX4CVMhdN5l0WiM9gBghcHZ
         Q8+hTiqBZP5FPyBIJWYAGeBRIIzwYbas2kPO/s1uPmr2nfuv9r76+bkjI6+kaKa3BAxt
         4Ej3/TuW6+2NqJTvHKkIGB/NPPS9Qf/kwG6HipjvalLR5ZAqILuFn1mN+kKgxoh0N+nh
         6NwwhwbUQzOoIKSQcDy1DY02pTMVL++YBjGSIqP0JgLNb2sKqewgFotssGF3IAz+WOm5
         frsg==
X-Gm-Message-State: AC+VfDzFZ0v8LNjr5/1ei1BBb4xCvmEVlJz5QB/x0MTTMZTyC7OB1v0I
	4vlNd0S7wl4B1b3mPTDF8ru3sg==
X-Google-Smtp-Source: ACHHUZ70EylW3tJPD4eX9pNwszh1b3emylqfZNU/oJqJExgV38fHAaLY1EXQ5gHsf8b2DkDU7Qlm4w==
X-Received: by 2002:a05:600c:a3a9:b0:3fa:7a54:62ba with SMTP id hn41-20020a05600ca3a900b003fa7a5462bamr3373505wmb.26.1687531189339;
        Fri, 23 Jun 2023 07:39:49 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 18/55] python3-isort: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:38:44 +0200
Message-Id: <20230623143921.146338-19-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103514

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-isort_5.12.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.12.0.bb b/meta-python/recipes-devtools/python/python3-isort_5.12.0.bb
index 03d7a529c..d111393ea 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.12.0.bb
@@ -9,8 +9,10 @@ SRC_URI[sha256sum] = "8bef7dde241278824a6d83f44a544709b065191b95b6e50894bdc722fc
 inherit pypi python_poetry_core
 
 RDEPENDS:${PN} += " \
+    python3-compression \
     python3-datetime \
     python3-difflib \
+    python3-email \
     python3-numbers \
     python3-pprint \
     python3-profile \
-- 
2.39.2


