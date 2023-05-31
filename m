Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD73DC7EE39
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:01 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.9066.1685521550326919156
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=xzc6YKGs;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-30ae69ef78aso513406f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521551; x=1688113551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzIuLAazwMToARaV6C0Yq5BEDf9g+jPbqbaO0zF9eJ0=;
        b=xzc6YKGsz3MoPGtjD854cG/yRWVRRBXbz5g6vbGNSpqv/uHtyPE/6/WdjKaydC0wwp
         Nk+EcZ6WotH9Ft5LWxwL2/w0A1lvvvSBfEp9cYcEFblCcdERrBK1ucMVywHsUBVYnCs7
         8vz+uMVl10ERu2vVAJ0EutXGndHUdhM56MQzrisc1dbjeGWkJHYOOHgg9D0roqDnz739
         zcng/Cv8JLl/N5jPN/UiqYPX4viNduCHr8aaTMSj4uD4ihFo4dzotqf16dB88YVGk/gz
         4LIKMMV2mjx8k/un1TyVKYK8WXe3Xkt4FdHYzx9cdsgTqFoHK4aMRtjOIEcn0Q9WE6O1
         h6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521551; x=1688113551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzIuLAazwMToARaV6C0Yq5BEDf9g+jPbqbaO0zF9eJ0=;
        b=UQqmeHYiScUMj9oAS9uL1nLcRswAKFLgqAU1wCY7gcIWIQiPDLArNZXbrmCRQs+mCq
         UGuHKZVq2oWNWqB9Smc/iZ+P5UyA7dEQIjf7Lyz74kHbFyYfqnawo+4rzRlbitL1xNT0
         3me1LIRlq9c7YPjY2J07qp/UwxudPZsqvXdEb5LMUDXtoeAnTcBSW9AT2GXJP+PMVdyJ
         f6gWa6//TLDSgaCheSfAUGzhEwKy4iFYAF+NdiBJUijWDYGQz0F3Nkpo9cm+tZFQc0kg
         VoSeYmJ4YzHx+m+OKwBbB/zTNEzrzik6DMsV7gbMvHU56mOuH0B73afbscU0jg3jwnVh
         /7tg==
X-Gm-Message-State: AC+VfDz5xRURNk10JNw+gv/Wve+m612yyetOQpu7dUJg1QsuPpaC1z1r
	j0tUcrxup2L5grqVRDtIs90mrA==
X-Google-Smtp-Source: ACHHUZ4U22PHmJ7SDCq+h+sLa2tUOclfk26+km0v3j6qJBpNrSJ9AH+DN9EyNRYBvgWolxs4AUh9Dw==
X-Received: by 2002:adf:e7c5:0:b0:309:33c4:52df with SMTP id e5-20020adfe7c5000000b0030933c452dfmr4198673wrn.30.1685521551343;
        Wed, 31 May 2023 01:25:51 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 041/149] python3-trustme: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:49 +0200
Message-Id: <20230531082437.10646-42-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102968

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-trustme_0.9.0.bb       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb b/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb
index 641512c46..6f31aea0e 100644
--- a/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb
@@ -14,6 +14,13 @@ SRC_URI += " \
 	file://run-ptest \
 "
 
+RDEPENDS:${PN} += " \
+    python3-cryptography \
+    python3-datetime \
+    python3-idna \
+    python3-io \
+"
+
 RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
 	${PYTHON_PN}-service-identity \
-- 
2.39.2


