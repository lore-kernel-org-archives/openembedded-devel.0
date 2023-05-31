Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A6AC7EE24
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:31 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.9135.1685521587208093128
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=hllUpmFL;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.52, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-30c199195f0so204955f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521586; x=1688113586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTaIRTwDIBybU6z4EgZ6HbnB3qI8hu+LSC9xnAdjF+k=;
        b=hllUpmFLODVplT76MmFZzMTw8PPo2+6oBeggZ1Ro+oqTs7AD1BMxttf98N9FU5cij/
         fceVq2pp5vBZEXybdYJlMctnmEthUc6trHvIn8Fr7+MUwdG4v0UO4ryu44er3XzOw9dp
         loug9mTteoROIUxlIGXpTfR5/6GP0dq+YRjphdyi4JsVQhej5hfLM2xL7MiypsnxXoJv
         NeVhI5gZ/VhuHAm73R6s8lah4zfNecyYxKaj/LvuuUwWkCEjTy7qEw3pZTKHRZUkjeV/
         O3E0mcfyPebeOEBuXJUcHKgBFIfvtICnCVx6/ol2aUVLsBDmqtsw1uxUstGAd2ykyLHK
         weEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521586; x=1688113586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTaIRTwDIBybU6z4EgZ6HbnB3qI8hu+LSC9xnAdjF+k=;
        b=k8sQM+kVfJjF/9wVc+kArXbHX3OoTL7nctG3VzDxZvGSQAWA+86en56FCtYOX0PAZu
         vAsCS53tQr1f5UCeqKHUEEWf1QdBRxseet/T498yMNZW/Cn/bxVGpsEoIJ1rLb323uCf
         4g0uRHTNHU3qHSwqKD7QqI7U+14NOjzsATzo5ETlJjM4VKTDeFliD+ERiy+1Xt8kOeod
         /LPHejVocVo165tIxn8oGZzBvDM//mJTyxl61GPNmg9zqFi3nTUOIw+YGoyd9kUbGRMK
         a2+JJCEkt3xbSoAYgXZS8glnBhDMG7+IqcYefKpaiqEpKYcKcifKks/DeE1s5pvXgEA7
         O+uQ==
X-Gm-Message-State: AC+VfDz8F1Z8UqOZqN4gXKsw6S4qA3VZTe26llJDgU2l2VKMaiB93aJW
	gOv6zbw2Zow1MdNmR6/kneA2rw==
X-Google-Smtp-Source: ACHHUZ6KW8NBrvUGyx2prtJrvipp+H2vXVtXwtyG9kZ8Sdj3bAylKw60hlJ6ND8JOLfc8hgTB6V4fg==
X-Received: by 2002:adf:ce90:0:b0:307:a36b:e7b1 with SMTP id r16-20020adfce90000000b00307a36be7b1mr4240837wrn.5.1685521585823;
        Wed, 31 May 2023 01:26:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 071/149] python3-pylyrics: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:19 +0200
Message-Id: <20230531082437.10646-72-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102998

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-pylyrics_1.1.0.bb     | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb
index 207751c45..1ac95e8be 100644
--- a/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb
@@ -9,4 +9,10 @@ SRC_URI[sha256sum] = "c5f36e8ef0ed3b487a9242ce34c19f9684e418a5bbffd5d367dc1d1604
 PYPI_PACKAGE = "PyLyrics"
 PYPI_PACKAGE_EXT = "zip"
 
-inherit pypi setuptools3
\ No newline at end of file
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-beautifulsoup4 \
+    python3-classes \
+    python3-requests \
+"
-- 
2.39.2


