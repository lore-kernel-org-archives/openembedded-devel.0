Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121F6C001DE
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:39:57 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.195.1687531193596540308
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=iNJrAXGW;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.41, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f122ff663eso916189e87.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531191; x=1690123191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdYZvjBUxegsyTO1z6GYz7vIppXNQ+kLlroY60zAvDg=;
        b=iNJrAXGW+i9yffQU1aaxv2aN6PB2o+xKSpaMOiTBobtCcb1oH+1k7Kgo7J4WPWmHGZ
         VIQ4F/giMeR7Y3kn+/6H57HR4twPEliF1sbk9OYmTDogq1tyOIP9OvS6bggmfT0PPF9L
         9EmTjmP/iqm549GY9Ml2IERwquFJBRlI80kTWhcNlZH3XSMe98fY3nUilEvPClKrCMix
         liRJspcAFvdIkDiEcG+e/kHdGN7YoPvAtsEJrUqWzc1zSxfZLGVLN+20QWv8SEcHeufI
         o0HVRNaACdkoYejrTkotjb1Cp2AYBXZoYIMC/iRT/b5eDBz1eiNLRIHR/VeTDYWuNQ98
         iypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531191; x=1690123191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdYZvjBUxegsyTO1z6GYz7vIppXNQ+kLlroY60zAvDg=;
        b=TN3Yv0a+pWRzJ36k+zp+b+LRxbNaWKHUgcZxeWpnnKoWjkWGYywLBzZQ+WHRfEVtPF
         Bfn3Ms3ApONZPja6jtaiNaPEOruaqxxPVzAXbHA0/TZO7MTbVewupfuxV5E3tD+oGCkn
         BLG8w5msGzoqvGk+wiY2sUcTgL2mFClwK9D7RAT0pe8P56NFxwjfg9TsXUTD/z+oqCz4
         jZuO+OfatLp5iiR0gwGlzC5B5EItyK5Kd+xUigbAiYyV4hLzcZ88IskyPXGWxzNhyuO3
         iGbQCOvxHGnlK4bu9wJH1qG9mMDwHycdJKePvrB8RqAMOn+cCJbn2OZzzwJrM+3z5m04
         4cCw==
X-Gm-Message-State: AC+VfDzrTG8Bg/woqBybqPPkyPNcVkjusc17oHZ377eu0jHyMy8GLRmO
	4lINq5QZyFo2jVH5LkOmIlwlgw==
X-Google-Smtp-Source: ACHHUZ46/1X8AeX9NS1BvTr/3b+onAGjqV4DevjRQguccFM9JYzxE80dD5UCEchJNIBYCdonlAM51Q==
X-Received: by 2002:a05:6512:3121:b0:4f9:52f3:276d with SMTP id p1-20020a056512312100b004f952f3276dmr7058082lfd.9.1687531191465;
        Fri, 23 Jun 2023 07:39:51 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 20/55] python3-isodate: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:38:46 +0200
Message-Id: <20230623143921.146338-21-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103516

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb b/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb
index 722ea3af3..c65083b77 100644
--- a/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb
@@ -7,6 +7,7 @@ SRC_URI[sha256sum] = "48c5881de7e8b0a0d648cb024c8062dc84e7b840ed81e864c7614fd3c1
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
+    python3-numbers \
     python3-six \
 "
 
-- 
2.39.2


