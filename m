Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03DAC7EE2F
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:01 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.9115.1685521536521548193
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=ubYXyxaD;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-30a1fdde3d6so5486218f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521554; x=1688113554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=no3z0kv6QOH+Ba3gTuV+dI1lzPJNvVORT/O4b7LoG/I=;
        b=ubYXyxaD0/ZTsIzJ1D1Jw2dLxMXzHNm+H42KDh6fun3JP1AVqtcatp7E2bFpfaoljj
         quTnIrUuDCbm+hmws28JLByRVeS0Q3QQ2JOL6IZ63zKh+i3ksEPLl2Dv9BSDQsZABi3H
         kY0qIzMiX+qA04lpfmiGcDYkHNXvx4/KYMxm03DIvcKOAuthZnSjYIkVHaYDE3axNpwl
         XBQg7Z0bibjGVUJUdOB5xI5tkjpTFZh1zHU0KqLYqdYEtHElou6Xrk4kKQcbAydQoX3r
         bh9JfrUgVZ+QsnhhfGEdIpgztSHMqe5Fu9190wSsteKLnM/uDZ6FAfumf9cWc2Y8V49E
         biBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521554; x=1688113554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=no3z0kv6QOH+Ba3gTuV+dI1lzPJNvVORT/O4b7LoG/I=;
        b=hlQv1aSGai061YWEIwbx8hAzh/PncLP+DimItE7V8UANMxdWuti7bgmsY90DWRahZW
         4OyBoDU5vQY6s4F1E8jAVIDBxsD5jFMg1DFOHHqWsrhSeiBWZrcbwfeBcHexvKg5c3Au
         CCLe2yse5aZIWlIea080V6I/1U1mq6/j6Cb44cZphvRZ1griZpJniyC7qLkrOysCHKIy
         QXCCi5HYXCf+nnKWcvlJOoA/jTNlVUriBvfIxhtj2HbVTD/s4Wo+z7EHJYqWGjLcmsZf
         txXumNBIsgxjpfO263tqLl/5LUBzndXuMYDChQ672faL0V4nQmuHu4cdNkF8ChPohzKc
         3ylw==
X-Gm-Message-State: AC+VfDxmsAyjgpmN4J3Sckf9tJLs5/AH8K1h3Q8hFBdj8T27F7UFt35x
	2R1zCSYT1n+44ep2wAs/jqWHCpm0RCycuJ01pVY=
X-Google-Smtp-Source: ACHHUZ4ETWYPZCnSzAhJxYGoFCYyaqmI3P+k9e28Zf+4aPbza6AiqwTs9iVVXrdtH2AU7SyKFzwYsA==
X-Received: by 2002:adf:d851:0:b0:304:8147:f0ba with SMTP id k17-20020adfd851000000b003048147f0bamr3828302wrl.3.1685521554685;
        Wed, 31 May 2023 01:25:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 044/149] python3-web3: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:52 +0200
Message-Id: <20230531082437.10646-45-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102971

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-web3_6.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.3.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.3.0.bb
index 3c617b216..088bfd504 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.3.0.bb
@@ -13,6 +13,8 @@ RDEPENDS:${PN} += " \
     python3-distutils \
     python3-eth-account \
     python3-idna \
+    python3-jsonschema \
+    python3-google-api-core \
     python3-lru-dict \
     python3-requests \
     python3-setuptools \
-- 
2.39.2


