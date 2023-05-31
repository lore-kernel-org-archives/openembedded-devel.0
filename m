Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D7EC7EE2F
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:21 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.9103.1685521515596542212
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=UteURdHA;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.52, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-30ae4ec1ac7so2957323f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521514; x=1688113514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=noyn1ktXHfb7BnbZn3QRbL2Pj5F3SJf6Szb+9FImbe0=;
        b=UteURdHA9WbbnwwEZn0EMqzniMIgIFBfFtlKv39QsmWL00x8DDzRPAVWmvbQKglEqq
         h7iKqMRW5xn6UJOrZkKVcJ3xINqJrPUJvCzOZkq5f/BEdYyrHAC7bkc1QefzuANPPDJL
         cjWoTi6Ctei8A0KEd4l4VD4hGLihIEshUPpnUlw1zmurDWlnZEHBohd17JGpoD3CWKRs
         0lsU2Xyh/1Rmhk3e8FHCit8hFhYvT7cCzPWS5eIlvAc9eF1fghpghROuOjQ9+vXzLKYz
         ZrWyXxnUruKRqQuKNTL3dQPfp5TJo9WKXtQq5P+5yl+JqVSnAwYCS66gTCHljui9F0pt
         /E5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521514; x=1688113514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=noyn1ktXHfb7BnbZn3QRbL2Pj5F3SJf6Szb+9FImbe0=;
        b=XO2wx7DtezR48sAtMjBMtMHVKdUBlgbafcamVhkvR4fWK/TW527dTvBF0MB6vltQ4x
         HNZ6b+E6zs19x0uGnumE6M+tMY7JS0rsUIBCdmVz+LQsMy3ev7eqKqYRiR5sumKAjlJ5
         JA9h46FxC1QOKM/4XPBczjIWrCn3YenLxaM6/zb4B8TM9nvDZqK9kV/3g+iV0/Zs952B
         zobNRDc2wjXFh30XywPmlFyyUhmjy6cESfRT6viPJ/JqYAC0Eys/KxLVXBTaPrV5mkZ/
         IAmD3x0vlim+XMSsnSSH0up0PEymu2r8hkNDaU1nwlSjBjbvNuqDJzqvHJ9mkfk928a0
         Azsg==
X-Gm-Message-State: AC+VfDzHaLHUGBcA7/WoteXwO1bW13u6cQbhKT4q5cwRUVDrr1DasmT8
	c/f0nVn2jKOR+nze9d5xxJtdNA==
X-Google-Smtp-Source: ACHHUZ78cGoV0numeD6ZbpFmfeZzmuABpZyAziQrZYl7RgQAbK9jLE876Zhp6sij/uHtTRuTn9OXEw==
X-Received: by 2002:adf:fd8a:0:b0:30a:b842:9ef0 with SMTP id d10-20020adffd8a000000b0030ab8429ef0mr3195773wrr.12.1685521514107;
        Wed, 31 May 2023 01:25:14 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 007/149] python3-mock: cleanup RDEPENDS
Date: Wed, 31 May 2023 10:22:15 +0200
Message-Id: <20230531082437.10646-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102934

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Drop PYTHON_PN, improve coding-style and order the dependencies
alphabetically.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-mock_5.0.2.bb  | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-mock_5.0.2.bb b/meta-python/recipes-devtools/python/python3-mock_5.0.2.bb
index 633b6f277..6753d2cbf 100644
--- a/meta-python/recipes-devtools/python/python3-mock_5.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-mock_5.0.2.bb
@@ -6,11 +6,13 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=de9dfbf780446b18aab11f00baaf5b7e"
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "${PYTHON_PN}-prettytable \
-            ${PYTHON_PN}-cmd2 \
-            ${PYTHON_PN}-pyparsing \
-            ${PYTHON_PN}-mccabe \
-            ${PYTHON_PN}-pep8 \
-            ${PYTHON_PN}-pyflakes"
+RDEPENDS:${PN} += " \
+    python3-cmd2 \
+    python3-mccabe \
+    python3-pep8 \
+    python3-prettytable \
+    python3-pyflakes \
+    python3-pyparsing \
+"
 
 SRC_URI[sha256sum] = "06f18d7d65b44428202b145a9a36e99c2ee00d1eb992df0caf881d4664377891"
-- 
2.39.2


