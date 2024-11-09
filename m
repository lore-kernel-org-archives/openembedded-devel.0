Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AABEDD5E36D
	for <webhook@archiver.kernel.org>; Sat,  9 Nov 2024 13:29:36 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.16607.1731158973999955842
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Nov 2024 05:29:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=DbG28M4c;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d4a5ecc44so1966633f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Nov 2024 05:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731158972; x=1731763772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fa9WhTlchJ0a6nzDvFnTFGlbjcxRvwKAmo5PeCMRUpw=;
        b=DbG28M4c+rKmkqG7hJA4B1Y6f9xjc5johxAd9F3C6MJniEI6UrSw4BMfgz0nUaysOs
         ASkvlwtJPNTaipd7/fGXuGN1fj+R/9n4MVLtdlf3o/h4fow3qjgeSotPieOCI57EiHKv
         cyGS3A1IUSO/9ZB68/OTfrm72dqfDOKM4S1TSXc5fRt8eDkn3BmbpqHTq8QKlOhIkQOt
         tEkQjwdQvyuLw4+YKqcASr0VwAAtk4Ry6qLeYLBgg8pQXtRuYx6QuaQB16UdDkCX6LUp
         7YuXb5RUBzlG+XuZiN7FqTREj3NNytV/tie+O8mKeDHWRqgPTyHR+jYOTPx7Ff4zbeE0
         tGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731158972; x=1731763772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fa9WhTlchJ0a6nzDvFnTFGlbjcxRvwKAmo5PeCMRUpw=;
        b=ueYpgarjKPH6ybVg3Ptxd8+0mTNTuuT9lLGHEJkGvJQ6SKLW8BxjEtzeq/AQaZGcUk
         XKMnmadaSck4oE6k7TvLZaZe0q+psRFkXO83du4d5s7VOLEVoTZaEdxOKmxzyQ9kyeLk
         z9bKgWK97rdN3naVC+DQofUN3nw5pFyCAD147GJMr4zuyTF83MtJ+leIl7GnPaHIAIvN
         Knf1mHvreQZO8mOj5wy6Us6ZT8wk2vlj2qHMuAdQSN7Nc+wXzQa1ugn/Wla5uEMVEgbe
         Q35pEuACN/lwvtlY57NnNe+lPn9jY2UIunPJlZwU6ua9nDBsKC8htsHG5AGdohfjNykz
         jxoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpzYFQvmdkwsKF616m0VUzJD+CnUywVO8XerJ00WwSR+Jjpa20+M5NWkQdzDXtlrQSsVbaiV5yKKjK1DgtAYkU7UE=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwHL2n9o8Swxg/sQrm/7YJ70+Ltefq+4gyG1odmM3WKbnlYdqvc
	LMpzm4WBW6pjWAU6PZR02R7e4YGr6Gov7Ra6fwm9rQ6euwrxz9+3HMixxaZnsEs=
X-Google-Smtp-Source: AGHT+IHQrSUm2mXS1aLpz4LEqnKcP+tjzoZc3Kdrx5iMfIzS5mqx3uZ2Rq7XX+iQuD96N2EA2bsusg==
X-Received: by 2002:a05:6000:4025:b0:381:d014:9bdd with SMTP id ffacd0b85a97d-381f186df92mr5622228f8f.23.1731158972252;
        Sat, 09 Nov 2024 05:29:32 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3194:2330:43bb:8a9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa70a2ccsm148534975e9.31.2024.11.09.05.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 05:29:31 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH] python3-fuse: new recipe
Date: Sat,  9 Nov 2024 14:29:24 +0100
Message-ID: <20241109132924.4334-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 Nov 2024 13:29:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113771

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a recipe for fuse-python - the official python3 bindings for
libfuse2.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-fuse_1.0.8.bb    | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-fuse_1.0.8.bb

diff --git a/meta-python/recipes-devtools/python/python3-fuse_1.0.8.bb b/meta-python/recipes-devtools/python/python3-fuse_1.0.8.bb
new file mode 100644
index 000000000..3dd1d1442
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-fuse_1.0.8.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Python bindings for libfuse2."
+
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
+
+inherit setuptools3 pypi pkgconfig
+
+SRC_URI[sha256sum] = "6d27023207162ae82145b42cb5e26ef11b2eccc60c8b85f5528fee3e94475187"
+
+DEPENDS = "fuse python3-setuptools-native"
+
+PYPI_PACKAGE = "fuse_python"
-- 
2.45.2


