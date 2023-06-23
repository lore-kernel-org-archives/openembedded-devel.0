Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE45CC3DA40
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:39:56 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.181.1687531188730233576
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=g2lb80Eu;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f9002a1a39so8026355e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531187; x=1690123187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IV9pk5OAWxyTyiznoOwMi/gLRZ63ZDvh63LPA3wYuZE=;
        b=g2lb80Euvln0i9EagN67xmTrJIfuON9kOwsswrY7Oh0nl6WYKHM4Xc6JIdFZO+zv6s
         HbBIVu6AwIoSucolfoDZDD5SRehjvU70yeSf/qRfyJBp5D1MVWzeL/x9LUL8uZ3nlL0v
         qGgWy94r/imYOHsb0eHwF7+KRkrRxemoJG62NgJFMKaUgpuI4lJ7AwY3C4QVW/pilttX
         4OirnX7pCkDtEgCePoPxBTOADlJhifjjJ1QRobSb3pboxR8QHsxlDckGXYyWnCeQVOz8
         ivtdsi+Y4Lq5YBz6TNFJ6qjOjEpK7LCaKYPVTgqF76j5/T4RA0YH8ULChQwyTGf95QJF
         jzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531187; x=1690123187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IV9pk5OAWxyTyiznoOwMi/gLRZ63ZDvh63LPA3wYuZE=;
        b=kATkb5eNDhS+CqH9J1S2n8HZcfWKeKcE4orMWA/qSRSVeHdRmGbpwWjRQb/5R4WKf+
         +W/52KkOfvkNZo7+L/7XUg3itHTdm+k47kRlWtxqkSOKKFmg0Jq8jjMlI+NQug+YOXOu
         uEXR5GBtMf+46CGb5CqYQUTvDockwXGU/TZO1lydpNBwGq/FfGDTAc/MzUog0/F+DFO2
         23ZY9rh2/KcX/aqKsEeIrl8jmLYXjsNeF/ZwA2tuliaI2441XJQCxyMgjW2Pj51ssyGe
         Q4YTQrvBVV07LZrZLXoq4t/vx6FwV+IFk/rmwKQDdogpvg6oDOwIj20tSgracVkFMeYr
         cEfQ==
X-Gm-Message-State: AC+VfDxshlYraCA2ESAX1XsgnjgHde9hfzU2sTWdYhO/XK/CUyRuTmMZ
	4btjaYHjbeImaR8SLQhgBNAMKg==
X-Google-Smtp-Source: ACHHUZ60Ild4+TN5QNolWop/VlSbqE9DW8ZnF465XIGuzWQFlM3/4ff8lcz9+253/OAXSU772LOO0Q==
X-Received: by 2002:a7b:ce12:0:b0:3f9:b9d6:8af6 with SMTP id m18-20020a7bce12000000b003f9b9d68af6mr3814351wmc.25.1687531187102;
        Fri, 23 Jun 2023 07:39:47 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 16/55] python3-flask-user: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:38:42 +0200
Message-Id: <20230623143921.146338-17-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103512

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-flask-user_0.6.19.bb       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
index a1b15c99c..ac449361a 100644
--- a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
@@ -15,7 +15,10 @@ inherit pypi setuptools3
 
 RDEPENDS:${PN} = " \
     python3-babel \
+    python3-blinker \
     python3-flask \
     python3-flask-login \
     python3-flask-mail \
+    python3-flask-wtf \
+    python3-passlib \
 "
-- 
2.39.2


