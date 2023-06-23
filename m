Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20E0C001DB
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:39:46 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.171.1687531181209967682
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=qxW29LUH;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.176, mailfrom: brgl@bgdev.pl)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b46d4e1b0aso12173491fa.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531179; x=1690123179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZXQ1wUTZSMpjFvhqfTN84qCP2nVXOhiBXKw41582Uk=;
        b=qxW29LUHd/bju73/2bxtz+UhRHGmfWm87vEZ9SaEqQlUlcPoAamgcOaYYCPTujQ9fS
         Jo0GMwhW3vBPjKQItBOovxikdwXYYg5eoTDRCI7yfteQ0O7llLV2FoPNfMSICyX4wCgG
         arZzIWOBTXLQ0daeINpSQtmDmjkHjLScdS0EZxh+LGdmTY7FfAsKJCTOuuHCAj2UjXyh
         nKJ3qy1OnjAqO+aJoRZxiCd7gEzJ4IgWOLoqjbNEK6mYKjZTFsdiDjcac8e2BNW8QRBk
         6emK3W2e2aQCzn7Z9BLGzpb5mfQsifl5YYQr9otfkqyTf0V6CTpqEu7zwRxW8mMj5Cbs
         U9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531179; x=1690123179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZXQ1wUTZSMpjFvhqfTN84qCP2nVXOhiBXKw41582Uk=;
        b=hFJImATZvoSA6DCUOpZQRm0lXb1fZc7Kghn0S/Z1Pn1VB8rEjU50VX0wJMM1sr47PI
         beNalb2IsQRzZYgl0XWbIkmuTBggLhh+bJ/tTO6m8Dg4f4MGnitr2lAkEzWPrfPukYxU
         NYynMxvsFWs42KCL4WoiE74VOaHpT1fXIafdffg8QftZOMLGlH4PT4Ug+R03h0n+KkwO
         XoABqbGOmRbiFO7j/tFWFr4MLylwzQbCiauMddVCRZ5Bpo1amqmoLIVniwFaozmD570i
         kzu0ovDH6ZOKIiE7eOBlkhsljPlcRKRWu8o/Q0S98hBFdYbUYZ2QLZqM8Jm2XMgMgkCv
         QwBg==
X-Gm-Message-State: AC+VfDw0lUF4MaAMzh4s7zsjPbuiJouTuADaG9SaOIK5hLQuizK86qL3
	Mo4PlUIX51F/gYXp7vr/LVWYGKfBTdA2tISZQl4=
X-Google-Smtp-Source: ACHHUZ6YuGjLsLAheycl9PoMIdGW2ep0WofwnPTf6mgwoWujnxM07Cg0JDtyyDyqg/mhR/exfPxZkA==
X-Received: by 2002:a05:6512:607:b0:4f8:6f40:477b with SMTP id b7-20020a056512060700b004f86f40477bmr11045851lfe.25.1687531179509;
        Fri, 23 Jun 2023 07:39:39 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 08/55] python3-paramiko: stop using PYTHON_PN
Date: Fri, 23 Jun 2023 16:38:34 +0200
Message-Id: <20230623143921.146338-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103504

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


