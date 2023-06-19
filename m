Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A712CEB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:43 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.7408.1687180962150965352
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=NdVrV8v1;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f904dcc1e2so23481665e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180960; x=1689772960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNTc1XeJP4nB7NNgqPFp+J2URTz5gzK5D/kywteCEY0=;
        b=NdVrV8v1/YIttfRgk6b08kLygnuHzkVNem6qLdYRGnlH8ke3JNJWXz82KX53d0nCie
         FPGKh601aWNvtB1l9Xz2KRZfts5R17BlAow/qgC+GPWgDO2xMFZrsIwTxmr4jMbhUSvS
         rwj4VTVvbi0L/Bf4lwpTfHaGPoCq+8hzMqdRhuBJ3MVkUWDyZRLBcBGM/SzbhB8sRph4
         ojovVIh9bUkiZ3sur2YOG297BC4JjJhdEmKuZ8j5j8vwUz2W01vBfSQ8L0Q/tDvqbY7T
         zFHSWdbcZs8GymdpmeWYMSBN08TnACm+4bVSDOEdQgu651MEk/lhYuf+X9mF/RcDXEHN
         7ZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180960; x=1689772960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNTc1XeJP4nB7NNgqPFp+J2URTz5gzK5D/kywteCEY0=;
        b=ML2A0/SyDXvybS20x7/3h4gSjBCWEzd6hsTzLgFihDBAB0KSaQ+uzyPMayal34Jzl7
         1fE0T0AzTK2XqdNdD6CBsU1/QipuECRjIVlD6LggbwxoAeAwI2NEKQYmNCXOOi+B3Eyc
         kO2KZpqTfGPgE2L9TK8e0E2uzkeKNwDnpK7b1OkN5n+hYjTURXV4qzXUcwQsgLV8vAWt
         CkSjOCJw1G08f90k7Xysh/0ILxYcH7A3Ktjx4Hk2Nql+tqfIRzsFlBTqvHzAEU8soBrl
         /YqJr6HzoasBVJEL8M70uxHcFQ3QXmlMhM5mz4NQK5jG0Z10lZBOX1tanrNRX2nzduq1
         8mIg==
X-Gm-Message-State: AC+VfDwKywwcFmW6fkCgccoQVpJX51my4RFaqejkjcjjBNcVfED1ANKx
	aSbhJDud+zHop6HGo95lcHlk3Q==
X-Google-Smtp-Source: ACHHUZ4s5Zhphbexwm5/OQ7NJhHK59tj57nIlvKczb4sHl1ENJpxMlSgmsX7YRIWHtMgo/iv9q49UQ==
X-Received: by 2002:a5d:6a84:0:b0:311:b44:2d70 with SMTP id s4-20020a5d6a84000000b003110b442d70mr7153722wru.3.1687180960725;
        Mon, 19 Jun 2023 06:22:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 20/54] python-idna-ssl: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:21:40 +0200
Message-Id: <20230619132214.213417-21-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103404

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python-idna-ssl.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-idna-ssl.inc b/meta-python/recipes-devtools/python/python-idna-ssl.inc
index e74bbd7c6..356a3873e 100644
--- a/meta-python/recipes-devtools/python/python-idna-ssl.inc
+++ b/meta-python/recipes-devtools/python/python-idna-ssl.inc
@@ -8,3 +8,8 @@ SRC_URI[sha256sum] = "a933e3bb13da54383f9e8f35dc4f9cb9eb9b3b78c6b36f311254d6d0d9
 
 PYPI_PACKAGE = "idna-ssl"
 inherit pypi
+
+RDEPENDS:${PN} += " \
+    python3-idna \
+    python3-io \
+"
-- 
2.39.2


