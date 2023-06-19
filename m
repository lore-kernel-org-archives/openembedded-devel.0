Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC0C2C3DA40
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:03 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.7387.1687180979185455530
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=DBa6YD2N;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-31109cd8d8cso3158696f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180977; x=1689772977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AR6XW7flIsx14c+SthcS0r2Gev+52bwFSqtj7HMP3N8=;
        b=DBa6YD2N3gntkrRPtYnEVZ6xwSEMdFAo/TPRC5h+4HN6NZNVKFOWBfYa5BzzoQtXXD
         H0pLtMXgWgraS/HSx0Kv8aZYO1kLA2KcNQ1XEPlkRy76FzUtv1djZn3nrOUEg9bZj5Fv
         aSoeAFzqjYrtP8lr9tAebnMUYYyabUF7V/EjSjCzcfRhvH71rjQMEd6idXy/ZqCTRxeb
         n2WSTLtkMOMUAsTbTjlUnLfA7jx2imN4WhSNtagKCAsHVSFTt62KINhijj1lUEmuKTtN
         3SNlkr6k30gVxWyqjBxxlqDSQzr7d1H2B9Ah3gmcZHpbA1CSSlwtS5gpOZTxP+GJJt8y
         YVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180977; x=1689772977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AR6XW7flIsx14c+SthcS0r2Gev+52bwFSqtj7HMP3N8=;
        b=g/+Wh7ErXrwQISHU4i8OCvBeIviCMJjy008OYec4MRh3SO5P5Vtelkb5SMGwHsQFrD
         q5PIMW0WqPgv8oHb/cf0is/eDbd1yWu8lAe0l4g/1IK5jCOT4BhvtoH8MBn1ac3o1sMg
         BO3RP2cWjzxP/Cr9uI2daYBpVu6SPVKjnpyiHvhYw3ZobD2VFLLrW+Se3Kcnyzgwo+F2
         CzJUMphjXo4sw+jElzRbY8faH7b3Zoqlea4SWdBHz81YMEFWnwx5iQZi8X04D9zQjYBC
         QydZmHLv3mktXiWdH3N4LhOvphA+sLpa98avXqwCfKXfOf85zLV7Wk1BcXkbzZIdvx3c
         TbNA==
X-Gm-Message-State: AC+VfDwELUiY/TM0MbPufcKuHVVxa0JL1VqSHsgh7t7yGWfIkc9ff32C
	8n1WwDVWXzlnQJgB1urRuxCbBw==
X-Google-Smtp-Source: ACHHUZ7Lyw4RAR1sfrOjoytny/U+5SdIGA7a3jPOvKNFGK/a5OGSGk6YkzwPahyrmy7ZbYBiRPcb/w==
X-Received: by 2002:a05:6000:136b:b0:312:74b3:87b9 with SMTP id q11-20020a056000136b00b0031274b387b9mr1043724wrz.10.1687180977743;
        Mon, 19 Jun 2023 06:22:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 36/54] python3-betamax: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:21:56 +0200
Message-Id: <20230619132214.213417-37-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103420

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-betamax_0.8.1.bb        | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb b/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb
index e3c5e7a3a..feb9ab3e2 100644
--- a/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb
@@ -13,9 +13,13 @@ SRC_URI[sha256sum] = "5bf004ceffccae881213fb722f34517166b84a34919b92ffc14d1dbd05
 
 inherit pypi setuptools3 ptest
 
+RDEPENDS:${PN} += " \
+    python3-requests \
+    python3-unittest \
+"
+
 RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-requests \
 "
 
 do_install_ptest() {
-- 
2.39.2


