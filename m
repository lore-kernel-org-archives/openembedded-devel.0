Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62346C001DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:27 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.214.1687531218674188281
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=ZlNxf1f6;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f8fcaa31c7so10289075e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531217; x=1690123217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvNxztIufpGejwga39A13HR0pTuvQYg4b3Y2x3BSmfc=;
        b=ZlNxf1f60ExXhvB1rZSPAjNuVMfLY9CJJg+XwF9g7qfyhOAMVFCkRfEtoZlP7fla68
         2ZnjoVaQmbZkB/6xY9ZPjtKluxJQPAKccXJTAS2vjgVOfj25lSXDrYVK315nCPPP8rZX
         MN+y9vSW0Xuv37VA5l/P0rpsAI+83KQxNzMzD09j+VdKLMmJoABE3xFaruvOiXE7htMs
         J/9Poh+UHKV2EPjYHh1EViaDzmGRyR544jRellqnH4W3yH5BKPuYPQLPVO/x5xUL6Uf0
         tnJaLaQQMc/dAngESHN5cBAdm1N+7SzBtdua5coq4SLLGSu60bnjHmSy3debF0a4HCfv
         G/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531217; x=1690123217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvNxztIufpGejwga39A13HR0pTuvQYg4b3Y2x3BSmfc=;
        b=Pb6e4Jc9vDEjDD2XEWGAc+XQI1GA8kBf90b7kpRq3ROjW/Cz8o4GaYwkj+wb/sNxtf
         5Kf44D+35zsrwWugJpbROyO64U6VFBkgtBNxiGVYuKdUGgR/Fs2yzVWAAmNZtp9TuUaT
         4C4IezJ60UkeSfy+/L4D9tFyhqT67OG5tz/dXJqwB1wgVDQgQajcMFMm4rY3sorT70d7
         q445d4Z7waTiexP8/obDy+OJwMEE8OjBMAUXAqUU6p482+kw9x2o3GgQBFYjxCUvTQTl
         eTaQNUl8wNN37+jY9dIIEU0pzMH8chmbzakpdAFc1D5BcYFX7ql+kUKa714NLAzt0MCd
         CLOA==
X-Gm-Message-State: AC+VfDxayzfak9NLi3HeaTo87q65/INBioSakkayr88837070Vs4/oAC
	9jrQY4v9CK1OT+KgZt6qsDq3pQ==
X-Google-Smtp-Source: ACHHUZ7iwKtgPByYBskDoBLWO2EpDN8Kg1VlJINGMV/IXkj/Kt1kQZMnIlpwyttRerCRadhVozIMYQ==
X-Received: by 2002:a05:600c:22c6:b0:3f9:b244:c294 with SMTP id 6-20020a05600c22c600b003f9b244c294mr15904925wmg.35.1687531217247;
        Fri, 23 Jun 2023 07:40:17 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 44/55] python3-configobj: fix coding style
Date: Fri, 23 Jun 2023 16:39:10 +0200
Message-Id: <20230623143921.146338-45-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103540

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Stop using PYTHON_PN, fix whitespaces.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-configobj_5.0.8.bb        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb
index b8b5e6f89..fa9424a51 100644
--- a/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb
@@ -8,6 +8,6 @@ SRC_URI[sha256sum] = "6f704434a07dc4f4dc7c9a745172c1cad449feb548febd9f7fe362629c
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "\
-	${PYTHON_PN}-six \
+RDEPENDS:${PN} += " \
+    python3-six \
 "
-- 
2.39.2


