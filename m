Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A93C0C001DD
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:33 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.7355.1687180946352937579
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=GzjxQDlX;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f901f87195so16331405e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180945; x=1689772945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpDIEpn4e6QtGpaMYQ7riihpGcFSgI7YLHxqeZ3lbyI=;
        b=GzjxQDlXpkKP9FEl7ynY5Ve+dFugLD7OmeDu/Agzi24s8eH+0np+ZdxqFj9uY286zw
         MLqiQQzFSz8OOuIzftc2QFYrFWieaqoTpuPSAlAjuPC8ySVd6z5AUIizYud6w99dOZyz
         R1trC6A8l4HOy/0A6xllPV2op/TsW8OSmGbUnIQm6qmuOxoDA6h2pSNmuJBx9TD7lrug
         61Ycto7dMWCW/u/f12JWsqw8Ncceh57bzicUICg2rNWgUp/Hne7T9ETWCuw6tM32shDP
         um3IkJJDvP0b2cj91QfiXU3tzuXeXMtuN2n1CDSTyh0/E0dyxL4KS/vBb7Le6eCQVXw0
         nHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180945; x=1689772945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dpDIEpn4e6QtGpaMYQ7riihpGcFSgI7YLHxqeZ3lbyI=;
        b=dgbJzkJDHpDw8o7co1N6G5rMSAHrxu4ZJwZ7UknBCJtu7vFk9+gEvvfNyxMrCgJHxn
         yxM3ul1na0OTzcl5WqElgh9QYxN8271jTS+470jV8QKYKFJulrL7sUYOT0WMFhmUf3Jj
         yg72M8QZdHAHnkK4BZUklpQDiKcodshOX4LxBv02RadW8WIqKT6S3avtXdPgyG84biQw
         NxLCO5yp6dV7R4POEdNwa9OpsJLZNd3whkgE7qpRX/8PZ+SZkmi/dvBLRwLgdAZCUy0r
         MKDkelHeXErhwCZVpVQuVEk0H0NpRobYhLTfytqwVBNsq1b2NIdvQei9qbbvh88gfy3m
         aoqQ==
X-Gm-Message-State: AC+VfDz+0YYer3ROja+iXAwCqa4j+OUR1KZLL0mwr1llJ+fxVyV1s79h
	lu+rAm/vRbxL1hRBbMAjTsiNlw==
X-Google-Smtp-Source: ACHHUZ4EcrNfUMJd5Cj3gmBNNboejTGMI6gB12SsTXWUVSI0e4llg6TCJIkxQngQZmheBC2zh5u7KA==
X-Received: by 2002:a05:600c:22d4:b0:3f7:3634:e21b with SMTP id 20-20020a05600c22d400b003f73634e21bmr8246225wmg.2.1687180944832;
        Mon, 19 Jun 2023 06:22:24 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 06/54] python3-pako: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:21:26 +0200
Message-Id: <20230619132214.213417-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103390

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-pako_0.3.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pako_0.3.1.bb b/meta-python/recipes-devtools/python/python3-pako_0.3.1.bb
index 34cd096c9..046e6571e 100644
--- a/meta-python/recipes-devtools/python/python3-pako_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pako_0.3.1.bb
@@ -11,3 +11,10 @@ do_install:append() {
   rm -rf ${D}${prefix}/pako/LICENSE
   rm -rf ${D}${prefix}/pako
 }
+
+RDEPENDS:${PN} += " \
+    python3-appdirs \
+    python3-io \
+    python3-json \
+    python3-logging \
+"
-- 
2.39.2


