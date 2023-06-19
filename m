Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A983CC001DF
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:33 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.7358.1687180947378063416
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=ScMLzSaa;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.44, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-31126037f41so3107091f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180946; x=1689772946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZXQ1wUTZSMpjFvhqfTN84qCP2nVXOhiBXKw41582Uk=;
        b=ScMLzSaa7sGUHNBbIdxEzJeOKxZ353nOEkVfp7dVjExEDwuxhIhgApz+Ki9W+3hxn2
         vOMKLiRb8Xzkn5n+CvuFvLh2sOAZWBFzFkM7yMPX8jrd8I47S1Y8JeXyjARdhZAbRrkZ
         Gs7TP2xJR1tyBqcut8k7S8ozg8tCZzLbTcLLF8DspkI9MDk151dZcV69S2bLLJ9iV/OM
         wfamnjocar6S0637JdMEOFqXm74ZSSEb85MDg/kgZKGVzuPRwVjPY0sat4HS1WJ+Hd+A
         7aKGu6USGlcq6OnBGSbocsMzPdEKfCHRnPxXg/UOa332xHVwYqzVqS/YcPah6GeEj492
         cn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180946; x=1689772946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZXQ1wUTZSMpjFvhqfTN84qCP2nVXOhiBXKw41582Uk=;
        b=Lvly0EdloYX9k8WNYZ81PdxNZbQJsFRZSQH5Bz40mVnaQroDL4hZThn2bbHtRDaCBI
         D5Zd0YsSbjs1FFD+qBg0AI0oNHw5R5RgczO9eDwEcFQUzKN+DB6+9xd7TY9kxR+bTDkA
         JgXmjTdJQRA8hJ5R+1HsvK1D7qS6M7WXgjb3ZcCciYupZzcs5wBaZnUo1tscmQSoAHHM
         84IBm0hx5I9ZJ9CFnnOmvkd36tsDH0jTDuIK4WkQbK8KAN4M9IosFkjKspqMhwLrM1dF
         zXbJC+PctJK468quGE9IWHUv4Hm+HtGqBUto57gV2/X9mTz2nOQyZ/dlby2X5GOvFn0Y
         m+6g==
X-Gm-Message-State: AC+VfDwwuCZ8Taa7evtz6FH008Sf09DvX5H349xoKwcn8SqwXl/ZrsFf
	yhMttRm2fthfYCOodbM5L91fXdmD2BKatvxJ648=
X-Google-Smtp-Source: ACHHUZ6jbgommZoLdrV2RSrvSPm/OK3U0VXrCdWvct9u5tgXPU4TUy21UnKEjJCqE87Ho+LS97aCEg==
X-Received: by 2002:a5d:63c5:0:b0:30f:c21c:b9b5 with SMTP id c5-20020a5d63c5000000b0030fc21cb9b5mr7559594wrw.50.1687180945787;
        Mon, 19 Jun 2023 06:22:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 07/54] python3-paramiko: stop using PYTHON_PN
Date: Mon, 19 Jun 2023 15:21:27 +0200
Message-Id: <20230619132214.213417-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103391

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support python2 so stop using PYTHON_PN and use python3
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-paramiko_3.2.0.bb  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_3.2.0.bb b/meta-python/recipes-devtools/python/python3-paramiko_3.2.0.bb
index f2d8bfe44..2f3cf6eb7 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_3.2.0.bb
@@ -11,9 +11,9 @@ inherit pypi setuptools3
 
 CLEANBROKEN = "1"
 
-RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-bcrypt \
-    ${PYTHON_PN}-cryptography \
-    ${PYTHON_PN}-pynacl \
-    ${PYTHON_PN}-unixadmin \
+RDEPENDS:${PN} += " \
+    python3-bcrypt \
+    python3-cryptography \
+    python3-pynacl \
+    python3-unixadmin \
 "
-- 
2.39.2


