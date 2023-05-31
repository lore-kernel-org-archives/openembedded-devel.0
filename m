Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8DCCC7EE39
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:51 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.9051.1685521511132656631
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=cpN2jrNe;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-30b023b0068so545356f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521540; x=1688113540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m49tZ8La15vQpIMeCL7Bz+8TuQBlZC/Cp3vb3zID+v4=;
        b=cpN2jrNeSTeKLvezaBoGZ3X3nrgGPWJMBRoH/FQK2QolgmLLRyztKx2kx5IMphF3Ia
         bvU/5wAj1qbdQ3XW/YlhZvuZV2Neng+KBKDgmuA0xmGehi81q88xc1RA/DH8azgLkKuG
         b211EsNzWZxsF6NybkDNDa2IwXYoMQAeli2yuhLeo6CNjebIlpJg4aMtw9G8gqlwPsdq
         H07DCt6QjayTS+DcnlUP+x5/c9Dl5Q/XW+4kwtB2yEuFLHS0+v6K55XjQYHx6qcubgp6
         g9YmnWJYpH0Ov9j+LpJZ89FqoViqGm+zw0DRTSmnOGuaXZunxB+X5AUO3ZgCysQTFJRF
         kBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521540; x=1688113540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m49tZ8La15vQpIMeCL7Bz+8TuQBlZC/Cp3vb3zID+v4=;
        b=PTAITg/1zRGrQrTD6a+/bZ7Vj3pZ2+gqla26AL65mwwTeeyUJC2YGbUzchS/aVPQs2
         dsSS2coPTNJMCAf6jEYw+OalLcXnGnDTGvZ2Lt9eQEZFtqzI4+4wTiwzU96cGxtbPhsF
         pfmbQQHr/KMvbynXuguLR1e8r8xbtq/BZMRzt51+UJNKB6jbhCupEfBRHVzNnLJRgcqM
         dgSZi4TqDbcGXlWZtxRryWuJiVn86FDpTdPAAQzZTLbM34iElXzlUaNZpyndHb+Ku2QP
         ORQMfzAav+k+DmaxxO5lVYATNlYTD2JdLKtQ1hSEoY30O+hIgbQdtO+5sek3m/Zq3Qzz
         4Cqw==
X-Gm-Message-State: AC+VfDwuXAr4ZEQ+6/q/0BXBKDjUNowZRSoTJFR0su1PhTgIuMyhYLgS
	wxZj7bv+KBtMUkwNHxr91I3lcq9AsNh7+HedyL0=
X-Google-Smtp-Source: ACHHUZ4ua90PE+CeI49eyh2Gy7edFbfMIyokbT+Z2+KE6eZCUo6+BPZTZK4hh1ImkQKtimlN5JpIZQ==
X-Received: by 2002:a5d:5682:0:b0:30a:c5dc:6c47 with SMTP id f2-20020a5d5682000000b0030ac5dc6c47mr3661461wrv.34.1685521540716;
        Wed, 31 May 2023 01:25:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 032/149] python3-stack-data: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:40 +0200
Message-Id: <20230531082437.10646-33-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102959

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-stack-data_0.6.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-stack-data_0.6.2.bb b/meta-python/recipes-devtools/python/python3-stack-data_0.6.2.bb
index f341cbfb4..21e4b7737 100644
--- a/meta-python/recipes-devtools/python/python3-stack-data_0.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-stack-data_0.6.2.bb
@@ -13,5 +13,7 @@ SRC_URI[sha256sum] = "32d2dd0376772d01b6cb9fc996f3c8b57a357089dec328ed4b6553d037
 RDEPENDS:${PN} = " \
     python3-asttokens \
     python3-executing \
+    python3-html \
+    python3-logging \
     python3-pure-eval \
 "
-- 
2.39.2


