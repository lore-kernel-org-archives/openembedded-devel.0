Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562D1C7EE45
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:21 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.9052.1685521512126489578
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=inkXCwu5;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f6ef9a928fso37699165e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521510; x=1688113510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPkpcUl4OAsDdOGJGBESaNLYtJByHDiZvYZUxfUr6cs=;
        b=inkXCwu5virBX9zf1ge12c/sZZUKfw5ImYGVeEZKd7gh10i0yna0xKBM8Qxjr7B+ao
         2m8CisPqYfBCu9d+ZSHXRY38etXNwVhGYvyRyjrmp22TkJMnnREK1QPaTfxAxDEDUE00
         3z7HiDmXfEMBRnhH1H2ZPbY5FS6T01GsNM+X7//ikVwl7YgX0eflSmQXK5VAlTUxwHQg
         ABX5nbvwuU2+EcbTJ8Wg2NiTSJRfCAyvO0LCN1CsrqpvSC8ADZAYOW2JbtpyAoUC9Vky
         lFnjIQAy7rvnquBETkXkc0Z0AprJdq6H51acqS0ioIdl+xBiw+zBJ7YRUhEV2dgIdt0v
         pYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521510; x=1688113510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPkpcUl4OAsDdOGJGBESaNLYtJByHDiZvYZUxfUr6cs=;
        b=bA/Ln1EDD4O4EWQSCbGshZziOA2AWYZSgBx3DsGjh31Mf4F3juOqHkjUJy8Knw3HQ2
         xKOtfTroU0q0d/CEh0L3Jm7qHdcf1bS9Vk3qYkQtt4kmvJStdI09Y2nBOyvOpiC4b4Zw
         JANwiWRzrdVXG7mqoH/zhr0JqZJkqQgk5cRnr4TjolrsXtjK4YmOGXkUCqUk+B2pLG/8
         MwSLwhqtXeWSc8X8qIij/AYfoQVAzyrCOPnDjAoYalLvWdv7w7f310RSZJQ4AVyn5BSr
         gUPWIjS6i7z/aTEyYO8vBQRf4RvI1pPu5Q59uTnCxzBmTLB2kvEZg/Sam11NeEFbhfFP
         ppYA==
X-Gm-Message-State: AC+VfDysdC/5ZPetvO7FB7/ueiAnbyjvR4kG1izhllE1hLijVQ/Tf/JA
	MetSyACT23pQUKwxNEDr7EG8vg==
X-Google-Smtp-Source: ACHHUZ6GLsu3tSYhMiLgvfo+6Q5kJprRJhtgKffEkC4C2p715HQE58qCZChH+h38suxBluabhApz/A==
X-Received: by 2002:a1c:f710:0:b0:3f6:683:627e with SMTP id v16-20020a1cf710000000b003f60683627emr3649477wmh.9.1685521510445;
        Wed, 31 May 2023 01:25:10 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 003/149] python3-pywbem: drop unneeded class from RDEPENDS
Date: Wed, 31 May 2023 10:22:11 +0200
Message-Id: <20230531082437.10646-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102930

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The native package has the same dependencies. Even if normally they are
satisfied by python3-native, we should still use a global RDEPENDS.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
index 71af06881..8b0383cf6 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
@@ -27,7 +27,7 @@ DEPENDS += " \
     ${PYTHON_PN}-wheel-native \
 "
 
-RDEPENDS:${PN}:class-target += "\
+RDEPENDS:${PN} += "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-netclient \
-- 
2.39.2


