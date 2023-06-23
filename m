Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FDEBC0015E
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:07 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.192.1687531201305563393
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=pEG43fy+;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.44, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-31272fcedf6so709350f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531200; x=1690123200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EabY0OX1D0cQmX0ekl4GX8rIm0PgCGyjI/HURupXWj8=;
        b=pEG43fy+GZ2Z9Y6yDAYuXNtRyDH4u/jDj2u48cGa0zFL5rKmvjuzr5i9onPIo8u6iL
         iNq3MSLMzxppQh5Xz9+z0x8JiOQTBsecgSmXtN0QQDjpK1R3ipL6rh6NL+QwxjHeZu6p
         +CHBBCDbAR/PgniMEXourlVFXZaxHDZtNP/OJd+TGqDDuu5bcvZB3ScH6VmfcFpqoeN3
         uGFQO6cjTpltASc/Cd5WnBpsBSIeoMsX0kwZLUrgsbwkvj6Sn+o9rpIcxwrIHAguqjdE
         rL9ei90v7F1cZ3bAVe1q5M0AOMlsJVRzxnW8346nW+wxkQcZXnDnNTFqiFs/m42E8+Hx
         39yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531200; x=1690123200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EabY0OX1D0cQmX0ekl4GX8rIm0PgCGyjI/HURupXWj8=;
        b=UdtYkhEHKt0UhQuNa1BFTo1pdEiEPo5DVtfHT69Z1HHiF4DfA1PX77F7wL/2fIkmTs
         wthOmRq694pcx1nzN+D3cC7cRVi01a80xrpd96TVUAv7nykuGB+GwbnnTg+fDLeAHcCU
         xyx4PRLJQtCN30b3/G+8I/7EEfcYtW2wVFAOQ9Pc3Y8djBpFu1mE24y+aIEQY5PvSdzE
         BL+LQG/1QhksihfLKuYuaRunID0t+pXeZavEqbetxdiAu9Nwo+voecPovdjSQkU2x7ng
         MqLSC4R/9qwHV+I70qq3xpm3MY8wpRb1gNFAkpCqea2YOsZK3AL40mV6kCkOwCREbl4p
         XxJA==
X-Gm-Message-State: AC+VfDzHDorKcCQg1+bsokK8asVUyoIXn61akaWNd/BwycUkTXJg5Om5
	VPvdBN1rTjy+YJlyuneFM+VPlg==
X-Google-Smtp-Source: ACHHUZ7jt9rzeh1OkSb8JzsyhBGeGNZPxtzDIfSHLr1afUyHqvfYrEZ0885+HwWH95QhffsKb2cH0g==
X-Received: by 2002:a5d:45c6:0:b0:30a:e81f:ef32 with SMTP id b6-20020a5d45c6000000b0030ae81fef32mr16429981wrs.13.1687531199852;
        Fri, 23 Jun 2023 07:39:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 28/55] python3-flask-mail: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:38:54 +0200
Message-Id: <20230623143921.146338-29-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103524

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-flask-mail_0.9.1.bb      | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb b/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
index aaf02a23b..1aca3a161 100644
--- a/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
@@ -11,4 +11,7 @@ PYPI_PACKAGE = "Flask-Mail"
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} = "python3-flask"
+RDEPENDS:${PN} = " \
+    python3-blinker \
+    python3-flask \
+"
-- 
2.39.2


