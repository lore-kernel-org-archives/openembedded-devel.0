Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C59C7EE37
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:11 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.9072.1685521571340824839
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=KYhXl/lq;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f603d4bc5bso55969555e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521570; x=1688113570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o86u8U+FtvH+U6XOWSYBeOdNUnmBcviI3kvpU3O4klI=;
        b=KYhXl/lqIiX3Dz+Rh7gUX5D4MUHzBsssZLnopH3NI83FiVCpEBINPEDfKBlFAfiZYh
         jB5yEZlTdRBkq4uRG6RMY0PRat86unb/Ub8XQq6dFlBjGPzCc7Ma5n2CYlDcD2eB9Iga
         EVFIfaBIy7b4sXlN3Aw+GZZjRGIQQnhQm0ztXiKgID/9YICUJSilRBeH4X5i3nrBlN01
         JG2lAyVG2cqzHGH4ku1EfIarNrpY291Jl4vwZ29Yzwf4WIIA+6tW4Ke1kMmspD0fn85U
         dJ3FTnpApCUUeTM07aIPeObCCeO0qHtUEkY5xtcMOWO7lDWJgp0PxY2QAl6rnERM6lHJ
         NY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521570; x=1688113570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o86u8U+FtvH+U6XOWSYBeOdNUnmBcviI3kvpU3O4klI=;
        b=OlIlswhjv2djwg6t3IAYd21R6AAA1oOHuzcLCbntlBEZwJsX7qjrKew/3thWycvXAw
         3bN5H3cpQzXeJIdlwjK2eZ08prqx3xznAU38HCY4PX7mhkMPnl3Z7x+DItCmyOAwmqqi
         WK4Kr66VepXx2+MWzgeCNXiMnrClkAgAS+BcZnMeiAT7otL3U/sGwD8Ok/oSYaYKTUY2
         CAcTysIRXDPfBOdIUeBBnlodrfkAsLBLdygf6z2ErTUNDVLTinbtRmcqRqf82oSvZcR/
         rn4QCWdxbqqo2hwmoDriTIV0wk5mw3VMp6xnyEZfHwD7EC8dqaLhUlqfZojHVVeo33tp
         IxTw==
X-Gm-Message-State: AC+VfDwMvZDo2gi/C9FD4ThOAIi1Na4C8FaIhJ8hO+a4ef1hN0VGNPvb
	UsLnP5gFVyz2riPCrKDa3zy3ng==
X-Google-Smtp-Source: ACHHUZ5o8qAwmx6DIYlJ+40ObVLHuz5e+PrEtBzv9OpSnhFmITX5HJG//7H6PLy3OFkb55NpbZ0aWA==
X-Received: by 2002:a5d:42cd:0:b0:30a:ebe2:5e44 with SMTP id t13-20020a5d42cd000000b0030aebe25e44mr3111281wrr.67.1685521569877;
        Wed, 31 May 2023 01:26:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 057/149] python3-redis: fix coding style
Date: Wed, 31 May 2023 10:23:05 +0200
Message-Id: <20230531082437.10646-58-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102984

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Don't use PYTHON_PN, order includes alphabetically and fix whitespaces.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-redis_4.5.5.bb     | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-redis_4.5.5.bb b/meta-python/recipes-devtools/python/python3-redis_4.5.5.bb
index 40210b5e2..056a31398 100644
--- a/meta-python/recipes-devtools/python/python3-redis_4.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_4.5.5.bb
@@ -8,9 +8,9 @@ SRC_URI[sha256sum] = "dc87a0bdef6c8bfe1ef1e1c40be7034390c2ae02d92dcd0c7ca1729443
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-cryptography \
-    ${PYTHON_PN}-packaging \
-    ${PYTHON_PN}-asyncio \
+RDEPENDS:${PN} += " \
+    python3-asyncio \
+    python3-cryptography \
+    python3-datetime \
+    python3-packaging \
 "
-- 
2.39.2


