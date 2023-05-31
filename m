Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947F0C7EE32
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:51 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.9065.1685521549486641077
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=hyYmd7fn;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-30ad99fa586so5271504f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521548; x=1688113548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OHU/V3uztEWFXGY1YWejWKcslYXzp2gQ+8RKaO3lPU=;
        b=hyYmd7fnHbZshFm6NU7FxT4avee1GHtz+haKMh6DDPFiFzB7OyqLiby2A433ObDemL
         O30B0S4oMrz//HMFkbjaWq4ikTIvTICw0oh04Q+KbMgZLzD3+DgH0YwR3B6d1nbTlClM
         7rP1krSePuNb99/w1xZoIwDbxtmRCGl0yfOejeUf3TypGrMTwYx2uMpr8WvGb5s9eop8
         c8pJ99tw5hs1Lzsrdo/b95W/50iXcr0p6H4QQcLPYwAo9WaUzxAX28jDloQAWOff9mf/
         p020a36p+z3yIbCneweeOy/uQ8B32OwDQVkuqipNbCljGfxg2q4fB5FE5tGM6wugBq6E
         xmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521548; x=1688113548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OHU/V3uztEWFXGY1YWejWKcslYXzp2gQ+8RKaO3lPU=;
        b=iCrBFyrjlaYq/BuWW3YkfVBL64S7XE74gFPsAE/IODLJXwGq3iUxwjrJYZkB7rumCh
         kJY6Rxjx1fidfMt2hnKag6niznDS5CQ4fv6DE/OMteErqxhOmvDAg3EPNA7u9rwzFXv6
         x3K6/NAvNaX9YAcqkltYeXUGz2JIjDap1Ws1ZSyOYZ+8d0iNOxiWcRk9WDAhrhoKgTgr
         1YvBWSz9t3TQqayG+bLjtD9ufpspvPhhE298Ba2oG4zuauje/w0gS+mmREHMtTCJjRcl
         aUxKKS0gDPjfOpDwJ3vLavIpSHh13/WJQe5BNqbkHg06C8FurQprNY/fJmZaVPkq3Uiz
         VmdQ==
X-Gm-Message-State: AC+VfDxv+ePNitSgryVS8qRps0oLfl9RpJ5tVChtbfXwQxXra4khuSqs
	7nTSe3YkfA6YC20M/6PjrD0ItPEk1GZ2V3Nn0Rs=
X-Google-Smtp-Source: ACHHUZ5Tmksg3ETHcy48vKDUD0kWkAWTRrB5uLKFiJUzFDKHQ86MLBdyqD78yXvbpzhVHjl6ZXAFIA==
X-Received: by 2002:a5d:4085:0:b0:30a:e69d:7219 with SMTP id o5-20020a5d4085000000b0030ae69d7219mr3614674wrp.65.1685521548015;
        Wed, 31 May 2023 01:25:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 038/149] python3-tornado: fix coding style
Date: Wed, 31 May 2023 10:22:46 +0200
Message-Id: <20230531082437.10646-39-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102965

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Order RDEPENDS alphabetically and don't use PYTHON_PN.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3-tornado_6.3.bb               | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.3.bb b/meta-python/recipes-devtools/python/python3-tornado_6.3.bb
index df257e5d9..bceb50956 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.3.bb
@@ -11,11 +11,20 @@ SRC_URI[sha256sum] = "d68f3192936ff2c4add04dc21a436a43b4408d466746b78bb2b9d0a53a
 inherit pypi setuptools3
 
 # Requires _compression which is currently located in misc
-RDEPENDS:${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYTHON_PN}-email \
-                   ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-json ${PYTHON_PN}-certifi ${PYTHON_PN}-threading \
-                   ${PYTHON_PN}-ctypes ${PYTHON_PN}-misc"
+RDEPENDS:${PN} += " \
+    python3-certifi \
+    python3-compression \
+    python3-ctypes \
+    python3-email \
+    python3-html \
+    python3-json \
+    python3-misc \
+    python3-numbers \
+    python3-pkgutil \
+    python3-threading \
+"
 
-RDEPENDS:${PN}-test += "${PYTHON_PN}-unittest"
+RDEPENDS:${PN}-test += "python3-unittest"
 
 PACKAGES =+ "\
     ${PN}-test \
-- 
2.39.2


