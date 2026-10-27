Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14653.1793092849151680832
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=NkqnMFYK;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so26929015e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092847; x=1793697647; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ix/4334WzUzfdmRE3GfdRSiZz1oWYknfOv9NrWKZM2A=;
        b=NkqnMFYKC6Cx74/yJhBUMyPxqsXvQhkk0We46JLZpK8+5PDJ0K7O2cNvKMkujUr7Uw
         UJA1fyGCCvA/RDT4WKRvV8rdSND39W15yuS4jvbT+ubaZMuNIZEl3jU+9FeLz+baPo6/
         LVT8BAqj9MWy9KxS5hqWmICzoOkGvCkgfkvDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092847; x=1793697647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ix/4334WzUzfdmRE3GfdRSiZz1oWYknfOv9NrWKZM2A=;
        b=cWqMTVjfsenQR6VziKr9DwtAATEPwmNEIR7hPtUn6t/85D78Ly1ypGUdLKIjZqpR6v
         /C1nlqsIxflCHT9Kraq4YsEgsaW+3YiQW5YYUDl5v8d3nknPM+wGsJiDhYNDClp+CNlq
         8i7dbCA4gwg+VOxI9CkNNGFyVZmM+Wvf4DzPA8zztqqxAX80/52EVj+GyK/8FC9xWeZ8
         8fgRJcw5EzzHVIvAc0ygowR5AqGXudfYDSnO3kp13AGQ8WhFXS4YFpXm+YZ+Gn5xbQ0j
         CTEwMZSz9yoHqSD8Fm3/YyDkr2MxbimN5qE/pHLDGR2IKGEe26g76IFOodwlP/KXq6HF
         9lVA==
X-Gm-Message-State: AFq9FYLvPGWniTrypoZXvvln6sLTgfN4U6qO7QzwqDiz2t9f0vSrfrXO
	cDpunzJd/DJkNnFYL6/ZE5Us7qzEPv9RWAdZr0nCX+i2T9s0Fuigg0uNR5ZpMJ8Ri04wyWrsbjE
	dBa6f
X-Gm-Gg: AYBFou0JYqjLUyRghNrctd5fUmCFoWnClZHriuls3V/+vewIAPLPWBVT3uX/M01uwhc
	vJHPKk1A1S1XcVfnKNh69QzJS/nsMvEcFaR5vtf0F2tR6ubISBr9Q6JP92fRFtdVpbuMpfRz5Nz
	DhyUjoKPVlmnpHony5wYl614c5XLPFlYK2fhlloPh5q5ib6cZ4Ed/r7rETaSpZHHTDtB1WHwSNR
	s36c5mV4xR1x8CZrUiUuiG+46v6XsmtVCVU3n3a7zQNmRBVjt76tYKk+dFJPfwYpJy1vBM165W5
	fuLjhbuI5W0tke1FEebah1J7JrfSLIKa6cJiilYQetoeq9p4tFgDRu3qEHm2B57ploiCZ/r/8m3
	WvJO2t+xccK1EM32wnU2U79pOqUbQPkR7bp+1Fwgm8hu7sHwOb/6cwkEEn8YeXycBXlBmQAWL72
	r1eZuG082LB6NetqU6VKyRfL1BbMt4KcZwMNdlyNsptDn/iYhJbSrB+L377H6oryMv8h2Nun7mk
	DJ2fWszkxvo5I06ou2YYRrhqiy00+8DKwM0/AyVoS3zYgANKNY81xq17F+liFfwhCtcr9F7d7BQ
	DtfeIe8HTP2Y+GUmR+mdCyff8Qch0tcWwGhNbWKFasuhAWt9euyjD/z+xDmJB2JxDcblT0mw9s3
	0OxYpg48NA6/OWSgLwbtfjtMTVw==
X-Received: by 2002:a05:600c:37cc:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4a35acb990emr170805005e9.33.1793092847450;
        Tue, 27 Oct 2026 02:20:47 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:46 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 15/61] python3-pycares: Upgrade 5.0.1 -> 5.2.1
Date: Tue, 27 Oct 2026 11:19:42 +0200
Message-ID: <20261027092028.782979-15-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131479
Content-Type: text/plain; charset="utf-8"

Upgrade to release 5.2.1:

- Bump c-ares to version 1.34.9

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pycares_5.0.1.bb => python3-pycares_5.2.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycares_5.0.1.bb => python3-pycares_5.2.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pycares_5.0.1.bb b/meta-python/recipes-devtools/python/python3-pycares_5.2.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pycares_5.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pycares_5.2.1.bb
index 8a0536ff24..ccbf13728d 100644
--- a/meta-python/recipes-devtools/python/python3-pycares_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pycares_5.2.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/saghul/pycares"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1538fcaea82ebf2313ed648b96c69b1"
 
-SRC_URI[sha256sum] = "5a3c249c830432631439815f9a818463416f2a8cbdb1e988e78757de9ae75081"
+SRC_URI[sha256sum] = "3e89edc56a3745046676207958bf3dbf2971c5df0d64de9f7a893eba8bf255b4"
 
 
 inherit pypi python_setuptools_build_meta
-- 
2.47.3

