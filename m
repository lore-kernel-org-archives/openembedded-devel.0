Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4ECEB64DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:24 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.7398.1687180997990993429
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=fdw8T2/t;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f909853509so14408475e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180996; x=1689772996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bunr4iG+CswrOC968S2iOc2D5Ek6mWr2w+YzPbbUdfA=;
        b=fdw8T2/t8P7wBXTyS/e7HocrdG6sX27ZyWQyrv4YvqQiDZzeQ/Avt+H49e9ReHKOIP
         PxBD5c0KssRf8ZYmk7dh59US3pGS26JRXtoZhFmQDqNDIRRvPxwrZxeQtTcZabi1G4WL
         +9mm7OcDAb+RhlsrvVEbffB32FYgPrty0lnFYh2f7Y+53/ibop/pO1EQYEng2NBV81IY
         saYLWdD0y46AIkXJ6ciAZ6UVgLwUecgtsVaQbrTmptLQdl0MNdiqQKmQKf5IkUbXg8cI
         tAOxNnJLbjGYamLESGa387P6PuhUXZssA43pxnUd3kqSHrZSKIpBTKCh6Mt+XSR8jBnU
         iwxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180996; x=1689772996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bunr4iG+CswrOC968S2iOc2D5Ek6mWr2w+YzPbbUdfA=;
        b=bodZOgHTGW8iAsPe/ChTzfOcUcephoyqQqDJKw7tN9zNai7na5OKYm3s8potqwdtQP
         vXIQxlqM3zmfSr7iz6XLX5QRc+htWZUANEIlIyFM5Be7Q1GG8fQVN0cPmareo/r1mi/K
         SgDuiwqnYC7vI/8i+UMzp24CKafU405/BntH1hp7g2WJRw08K5wlqyBhL5CQUsxuRKTZ
         jSvBuhM7sLuuUIjTBCdpOF7jbCQGt+QNa/rE8DgHQXMSDvOMdql+Bz8fe95ZolRKpBsX
         H21Pe5/PcrfVNR1evjyAWrVOrBIbxFS4Cz58Z0Hx+hQhMAa39Ndc22aDHkjmDhwRhUeb
         9dsA==
X-Gm-Message-State: AC+VfDyG6EvWJFKghqQ7quTIdjhHrCs+Gq8+7+lIImZLPMFVMtQLv3jL
	wWOEn8H/14qOuiJx736SjWBushIUaYtSUCaJces=
X-Google-Smtp-Source: ACHHUZ7TNV7h5oJEUycOLflDqd2GTtsMsCFtnJhUpWS6Lxv4TMI0BXaT9jyMnff42K7+LCcce4Fdvw==
X-Received: by 2002:a5d:5444:0:b0:30f:c7da:57e1 with SMTP id w4-20020a5d5444000000b0030fc7da57e1mr6383951wrv.34.1687180996591;
        Mon, 19 Jun 2023 06:23:16 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:23:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 54/54] python3-setuptools-scm-git-archive: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:22:14 +0200
Message-Id: <20230619132214.213417-55-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103438

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3-setuptools-scm-git-archive_1.1.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm-git-archive_1.1.bb b/meta-python/recipes-devtools/python/python3-setuptools-scm-git-archive_1.1.bb
index 472c4eb1c..2068871d9 100644
--- a/meta-python/recipes-devtools/python/python3-setuptools-scm-git-archive_1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-setuptools-scm-git-archive_1.1.bb
@@ -11,5 +11,6 @@ PYPI_PACKAGE = "setuptools_scm_git_archive"
 PYPI_SRC_URI = "https://files.pythonhosted.org/packages/7e/2c/0c15b29a1b5940250bfdc4a4f53272e35cd7cf8a34159291b6b4ec9eb291/${PYPI_ARCHIVE_NAME}"
 
 DEPENDS += "python3-setuptools-scm-native"
+RDEPENDS:${PN} += "python3-setuptools-scm"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


