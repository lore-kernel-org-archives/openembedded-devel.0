Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B298CC77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:11 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.9130.1685521568980446594
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=fS/x3Gg0;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-30ae4ec1ac7so2958175f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521567; x=1688113567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/A4Byb+Gj1DcbG8YS35mfvlME4RpnsU1OXNYISFSNA=;
        b=fS/x3Gg0P/j7qBgK/jZ5FfJjICvWkiAc+qIwYXMiuz68zoxJceYumGQTzQRXcNJnTN
         Gwd8QgYO0dyLAV+ifR3Vs18WJJYi1kYn8Gb1yTFbvfHPok/KEW5qJJSZi8EhSluJWvz3
         MCsyqihiNH271JcAkf2oz5HyQNV51+inuKkRFusHikGvFhZahsJhtqp4j+xnAlQozijn
         8WcHTqzMMOicSzqO3agHBNpk/N3Z/lEtA0c4KyaJJPyvJTMlDBXO5ub64T2QgcZNpynC
         kt7LKIi/LJzpfHStMNl9QQqmzI0xowRR1Ooxog0Argtd9O4lnztfVdma5kFIEpJMvt71
         GN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521567; x=1688113567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/A4Byb+Gj1DcbG8YS35mfvlME4RpnsU1OXNYISFSNA=;
        b=XiQD9h9nmqFqg60sEbQicFy1sw8YAs9CA67XRwPiJM8iTCWNuVF+NuynhNdphN5m3b
         bqiY++QPc72OlTndYjse9MvsrV2F5dJeeU4DvSwXHZMwQV/GiT71Xs4sK6FaT7NKG5hv
         fqSgBTVrBCPtb5Ouq5vHWTZpzZgwsK3Dpj4i8CkSAmbyNVP44FJnbpXMkkKY/EJTVMD9
         EfblWW9tskHIah/kypBQmA2JKFrrjV+bV6bHcVi1y9/wTo0MngVoCxuyBU8pHeaBm1ZK
         4Zt3bVhoGperTOHEmU1q0pWWc0cr0xlt79EYsGsYfBYdcnsC6R3+OuOmWvNRcP9RQ8bM
         XY7w==
X-Gm-Message-State: AC+VfDzIBGQFv8FJgWhxHSR1eE3CivmOmZSu8COIE811BNfhi55NIOdL
	kVgDK4ayk4Xpuen0n+cBvcTpcFEU397FjA3Rigw=
X-Google-Smtp-Source: ACHHUZ4csExHC2PM8Meuxpz+vTaIqA5t/1KC4bJ8hIPR8PJd44aMo7tJaAKoh/cLmxjxfRvP+OJFeA==
X-Received: by 2002:adf:f9c7:0:b0:306:b3f9:e2c9 with SMTP id w7-20020adff9c7000000b00306b3f9e2c9mr3391117wrr.6.1685521567501;
        Wed, 31 May 2023 01:26:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 055/149] python3-pydantic: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:03 +0200
Message-Id: <20230531082437.10646-56-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102982

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-pydantic_1.10.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_1.10.7.bb b/meta-python/recipes-devtools/python/python3-pydantic_1.10.7.bb
index 7392b5103..9d59cf859 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_1.10.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_1.10.7.bb
@@ -16,5 +16,6 @@ RDEPENDS:${PN} += "\
     python3-logging \
     python3-netclient \
     python3-numbers \
+    python3-profile \
     python3-typing-extensions \
 "
-- 
2.39.2


