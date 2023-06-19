Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D488EC001B3
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:43 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.7367.1687180955311367965
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=uyuwblBF;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3113da5260dso967326f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180954; x=1689772954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RWkscWwcJiGiZqsv/oZvn88jVfdVXZStS6T1N435zQ=;
        b=uyuwblBFI6g1z3wtOfSYOUqBvB2EsUCjqfzulrlr+vdaEEdCkdgIA4gJBshVRhU7Xd
         khjquWPH+v/20SPCNZ2RkSArrOgnkIte4ibyXa0Haqz8N0dMvTOP/SXZ2TY+8FYobml6
         wJu4iFTAvaONofRPdwRz8K9AkGxJCR4AJFpgfxHfnY9SW0LbWmxb91Tj9mqwSGsTDVdQ
         KKbibT//kTLumwG0cImC/5O1Ku6+9gJHcsyNrwwn17zoccGaPhHw0P6v+EnaNn6vjwE4
         KNxYommbDp79FTSr2qY6KbYDHBCNMBpaA5Er4Rh0vC9YRyBduIZf7l2+ZQ0qz0Ejo1i0
         uCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180954; x=1689772954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RWkscWwcJiGiZqsv/oZvn88jVfdVXZStS6T1N435zQ=;
        b=Hr3d/0vs2Tb2My++X/PmYFhAd/PZeT7zCsxVnqwDk7uBKJ1HKtd0cEeDHbIrSI5ei3
         Mk3LbkjfK+lDkB1uW+M0oo7MYBJ+DVk0sE/8J6LN+sgsdGW6cgHbnMXMmgAyrOmM2GT5
         sZITDSAJKmGPIiza9PMf2NZvqtlbfF7WhTFoZ5k06tgZNJLCheFvXEnJiVwqPcJ1YcJQ
         siHPre6jxj5QfGrtioN3U3KyzuIB23vwY78Mr6fOfXV7YrXz7NH3W1gu+OLZZOlAwqiH
         ZAjweJ6+IkAjd94/8V9vUvw0zbLjDuQm0DXf3AUJj6vm9z14TnswqZRFvl+2RzEsUHis
         tqUw==
X-Gm-Message-State: AC+VfDwbk0C6248g8j0GAORjzqlD1TyP9rdU3Zpbhj2sMfwSLFbbZ0uv
	vBwPYSN8gs71xqDzyUoa06UicQ==
X-Google-Smtp-Source: ACHHUZ5uoWHg1KMiJIU+GLU8bcOwSkNnlvjaJCdAcY81VIYKWZTboED/cjKWqY3+cZXmZ7tPbp1Pzg==
X-Received: by 2002:adf:df89:0:b0:30f:cdbd:f990 with SMTP id z9-20020adfdf89000000b0030fcdbdf990mr6354049wrl.53.1687180953840;
        Mon, 19 Jun 2023 06:22:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 14/54] python3-flask-user: fix coding style
Date: Mon, 19 Jun 2023 15:21:34 +0200
Message-Id: <20230619132214.213417-15-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103398

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Stop using PYTHON_PN, make indentation and line breaks consistent and
order dependencies alphabetically.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3-flask-user_0.6.19.bb                | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
index fbacf2e99..a1b15c99c 100644
--- a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
@@ -13,7 +13,9 @@ PYPI_PACKAGE = "Flask-User"
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} = "${PYTHON_PN}-flask \
-    ${PYTHON_PN}-flask-login \
-    ${PYTHON_PN}-flask-mail \
-    ${PYTHON_PN}-babel"
+RDEPENDS:${PN} = " \
+    python3-babel \
+    python3-flask \
+    python3-flask-login \
+    python3-flask-mail \
+"
-- 
2.39.2


