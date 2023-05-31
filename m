Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4B7C7EE31
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:41 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.9114.1685521535842053355
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=vEsyr+3v;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.41, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4eed764a10cso5945797e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521534; x=1688113534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFLXTB1eOd3XfuJ8cgFNBHC36wTi8M5645ZThKCtwnw=;
        b=vEsyr+3v4UA1mqFIDaYFunukFkMQD5r7Uf6aG25FgF4mhaJUjyl/Dr+ErPzpvD5b7F
         ZgFBuCYEeoQVZAjbt4KN7KEoV190l8mAJTuyzlDU5EJiFxRJmrdy0DAtqq2y0ni9SSmJ
         7Qo+h/tmEBHgLn6DXxcA0vJ+8Z7JsWWbBetY2eaSBig/sGT4GrxvezZKL7tuITGumk1p
         7oEGw/zG9GbwUHWzzqKCW59kSfXo2kKfAgydSofVv6PrK9UJt+tghzWMP/QPrz351Ah+
         IXzKMPsyDSe0DhkTkIydaYPjpfkg5E6qzZFzcQbfT4U9K4ESiYeyel1W4Tw3uDu/o729
         iuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521534; x=1688113534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFLXTB1eOd3XfuJ8cgFNBHC36wTi8M5645ZThKCtwnw=;
        b=EmMlUP038qm+bXKvDBNoGDOiTgGTh2LqOV+xdi3p1L8pwvlBorDye79Qele6oMKa7q
         Iy5y4uRceLps0fk7c/8tOB67TG5TgsLjTard5uaoJpnVW0dk2gTtGrZNtpN8Q6v75tkO
         64BNAFZqEttZWmdx2h3pjLnGGhGiCRcPUvTpjX8IMLaTseZd+cdu1/G1YmgoCZidFm+2
         21lYjq75Szs1gt4smqWYHkTmKqPtdwZPi7ARMxlbttfbmRbr/RG+WaGbMJQ/ZALrtCwC
         pvUNarz39m8xBJ87CIRw7teiHBqfrm80fPrbs+ilzz5GI7MjyHJJ/ZOLNYo8yS7jDHut
         FGRg==
X-Gm-Message-State: AC+VfDzRk/QjMMY4q6FUaBrqjrIITAEa2WUu1DBkPYpglrLJpt7+y2dF
	CfiF2xA9TKJ6d5BpOkNlb/8fRYesaBXEn8oe4YQ=
X-Google-Smtp-Source: ACHHUZ60KcF9jmAPoDRSVKTM+Vc6LkpNSqF0aNFlDswrVLeFOtWRLEYK/rWXlRk1getmPfDYeylp0A==
X-Received: by 2002:a19:7001:0:b0:4f4:dd5d:f3d9 with SMTP id h1-20020a197001000000b004f4dd5df3d9mr1956961lfc.58.1685521534159;
        Wed, 31 May 2023 01:25:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 026/149] python3-service-identity: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:34 +0200
Message-Id: <20230531082437.10646-27-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102953

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3-service-identity_21.1.0.bb               | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
index 0210a5de2..2d4145ef1 100644
--- a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
@@ -14,6 +14,12 @@ SRC_URI += " \
 	file://run-ptest \
 "
 
+RDEPENDS:${PN} += " \
+    python3-attr \
+    python3-cryptography \
+    python3-pyasn1-modules \
+"
+
 RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
 "
-- 
2.39.2


