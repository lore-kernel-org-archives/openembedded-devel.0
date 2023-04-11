Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0130CC77B6F
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 13:16:22 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.13174.1681218977102755358
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Apr 2023 06:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=vCAjjFU0;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f45.google.com with SMTP id q5so4501668wmo.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Apr 2023 06:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1681218975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W8OuAji0GGONUL6hvNv1CnbeRSaPvxOvO/yCmhwA1Ns=;
        b=vCAjjFU0/rpUKX2gtzRUIa0gPngujGdOBDIhAV51BFCqLWh0RxHABqbkVeJ2kj012E
         xuW7d6+0LOuR5bUM+g4/KN7PaqAN787W5kAiZ3mhQi7tJQkPprjeIJ3RxcRKq/4R3WXB
         5EI8uPLAHornYPWQsr4OJSE/T7RKv+1z40Z1g+4ZVETilx2Hl9Lg44Xq+gc8raKsT87T
         ncxfSdEbUKsxmzhQBXfizJR9rnUKtciSsM8vEtw6sgCOHZMCGxfSt9J2dBif6v9J5Va3
         uz9dP6qdhRIOVGoBvRKOxnqtS6pmnsWWpLZ3/7h0PZX69gLX3LA0N2+8Svb8pRhYRwpi
         CxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681218975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W8OuAji0GGONUL6hvNv1CnbeRSaPvxOvO/yCmhwA1Ns=;
        b=PLs7UVALdlNVK7hpAd3ma6taZd3Ow5T0XBQxL7bRbs7X/OyhuDQ2f38MRu0TLcAHKO
         rupjEJ8R81JYadEfQInfxuVX1446EYe2zUpNyDd7iqZWzl1Dw4o4w2Y5h1im6MsND+83
         9AurCQ+acJU0T+PKOFEfLChscI4PB+QtZ6JRbddSHgqiu9Tbi58pZeo4py2vC0wB4FY6
         cjBTGxdX7N7mjWfNRlpLjNLlXS4YnNQHxHfkpyohg6W94Hvff47B76hY1zpGJYS4OoQB
         4hhjheg+rPw6qNUOFL3ynbw9XSk3QyofC72tlK1KuS4+qeZG0w/XEg4pGOAr7ysNWxrM
         Busw==
X-Gm-Message-State: AAQBX9esxOx8S2poeK0jsLdVi4ZPJfSpUNkX3PGcZnYpTdvX/kpl9N/u
	fU3ir9Jvzgw3OACwYpJzcZCKXA==
X-Google-Smtp-Source: AKy350ZVO7MQT2W4Ote5+OlSUcOd3IyrNDcFz6NxhESHGcfz+UVD2wdZ3jbpg1t+UzItERzRYb7+HA==
X-Received: by 2002:a05:600c:ad2:b0:3ee:4f92:907b with SMTP id c18-20020a05600c0ad200b003ee4f92907bmr8943223wmr.14.1681218975454;
        Tue, 11 Apr 2023 06:16:15 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a099:fc1d:c99a:bfc3])
        by smtp.gmail.com with ESMTPSA id f6-20020a1cc906000000b003eeb1d6a470sm16910619wmb.13.2023.04.11.06.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 06:16:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH] python3-gpiod: don't hardcode the project version in recipe
Date: Tue, 11 Apr 2023 15:16:09 +0200
Message-Id: <20230411131609.401957-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Apr 2023 13:16:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102058

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use the provided PV variable when referring to project's version.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-gpiod_2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.0.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.0.bb
index 18cf8ae8b..93b7b935c 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.0.bb
@@ -13,7 +13,7 @@ require recipes-support/libgpiod/libgpiod-src.inc
 SRC_URI += "file://run-ptest"
 
 SRC_URI[sha256sum] = "f74cbf82038b3cb98ebeb25bce55ee2553be28194002d2a9889b9268cce2dd07"
-S = "${WORKDIR}/libgpiod-2.0/bindings/python"
+S = "${WORKDIR}/libgpiod-${PV}/bindings/python"
 
 inherit setuptools3 ptest
 
-- 
2.37.2


