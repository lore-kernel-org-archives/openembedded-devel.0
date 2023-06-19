Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D81AC001B3
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:33 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.7394.1687180948433186323
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=ylz20qAF;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-30fcde6a73cso2867376f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180947; x=1689772947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DnMK9d/HGvPq9qreyc3lS8PxBtpM/0QmbcJcMLvEf7k=;
        b=ylz20qAFvyaor0XNYj9tcDQGXXu98OoTEmjCF1NlftIrD6n9df9Qh9S3w0HiC4jBa8
         Xr4AiKjX2fHNY8n48c+FMb2q7cKF8Gh/ruWOQ1hzCXEhE5M2M6zKnPz/SuffdFoYPz4L
         yGsXbNmCoqCsgjqmuMXWQH6h2gmed5TqO2kqX1SL/x5QLuZTTQOKr84lVLCjLOdvbxav
         XiNnQSLomV7auHjOMSIrWK8zPbj9kwCpt98sGdpcokFjZXxbuL30YVzxysiCI0SjAidk
         +PyjoZ851g5nG7OLV7x2+uUhM4e4owzLwCUlKMQzdEKReXfDyNVP5pNBfpV/7qct22iY
         s17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180947; x=1689772947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DnMK9d/HGvPq9qreyc3lS8PxBtpM/0QmbcJcMLvEf7k=;
        b=HUDQ3WIgc3bH5EDll833aePNKKrLl6EzKp9o7JETSaULrz/DfODuDgzekt1NP9KpOM
         FbAYQJq3zJsl5nxnmo4znukAz94y6pKwTz/XB0r8Md9fpv9wWsUd+xAsxaa3TQeXLsJN
         xjpi9PgX/Ck9n0eo9IAev0YV9BOibY9yk/T22qVKYWaSVIYGNRcmyO/Qxd+ZbyRGUNmT
         pH51DnTKwn7CuyJha8iaKU5fXCgZoGKFkaEj6sAU8g5OSJXYUkUphVDtcHNO4zz7fvuB
         HLQGldb4QGvs+s73ORKkt3cfoTDqkDyMpjGDr2/D9FUa0k9Pyk7YurUHt71HhldTtEZB
         ETWA==
X-Gm-Message-State: AC+VfDxUzCa++/rOpqqyCkiE813fh5uWh3mKWRKWe8EjlJUg+JmWjxwx
	YjnH0mNqRNOOg2vrIK5eTa9umQ==
X-Google-Smtp-Source: ACHHUZ4m6lAn/GJi4DEAk7xM/pvDn9TZDGqKV7YAlLysnf6Duqxpglh34mceRTxXB3+erfDgS6tzBw==
X-Received: by 2002:adf:e88b:0:b0:309:507a:3f5b with SMTP id d11-20020adfe88b000000b00309507a3f5bmr6866314wrm.8.1687180946958;
        Mon, 19 Jun 2023 06:22:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 08/54] python3-paramiko: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:21:28 +0200
Message-Id: <20230619132214.213417-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103392

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-paramiko_3.2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_3.2.0.bb b/meta-python/recipes-devtools/python/python3-paramiko_3.2.0.bb
index 2f3cf6eb7..5420a9edc 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_3.2.0.bb
@@ -14,6 +14,7 @@ CLEANBROKEN = "1"
 RDEPENDS:${PN} += " \
     python3-bcrypt \
     python3-cryptography \
+    python3-logging \
     python3-pynacl \
     python3-unixadmin \
 "
-- 
2.39.2


