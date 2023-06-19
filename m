Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8761EEB64DC
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:33 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.7397.1687180950538054449
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=iJ1GJbNI;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3110ab7110aso3423749f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180949; x=1689772949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvG98+OLHuC8tOs8R6M50JcrJXIZNT1gN6fIdDu9DKg=;
        b=iJ1GJbNIJcon11CaJp4jfaBEVZIxMstTAoNeabat6751Swhv9aVJDhRhv2t+G/lCS4
         2Uw+YYDtevLU+i9EE4X9Z98X8jnVEiyZSBdQxi8Of5J+IKpsqLn3qj8VedtTyoIojqf5
         P+Im1ZPDdhlJuI69voleCcofZXHEKAKQYtJz8PXgapN+nqTV3tFINhPLTOiXoRzrc6fQ
         4L0E5CbN2pcBUU4caL0rnli/lxkhQKxNjRKzqz++GYfZK07TFQ+oughCQg9RMZO5ye5L
         t6eWhqFptJVmiy7YOw6pygWOdouyF30kj4+2P+COV8FeTFrR/GJbeytQFcz08h5SFM7F
         Oe/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180949; x=1689772949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvG98+OLHuC8tOs8R6M50JcrJXIZNT1gN6fIdDu9DKg=;
        b=Xrab2tbW6E01XMY6zrhpavFYRXLujKjBFMKP8IX/jxpfVHf/3htl0SKyTy+KrWRBH4
         bqyo7YjbVJBKHrBhX8SaBBEny7dclx9m6ZNMn6GZrK0/SXz9HRXC8wlPGRlgMg4X81Qu
         /09P3Xek8gw7sAQ4nmLsM+OXSIcQBvkD5qsUODiKaBVs2N5DmpIa87SPqVjZRLdbKmjs
         c5ru16PUDxUg/QCsBGPf+CG5QB3ZgGULpQfNckEFN42xUjmpbSfQulmNWB3a1DAq5Vym
         IggL+n61C+5ZpZJRXIgcQHx0/kxhlNSJeUpz5pu9aMkwMDNBTBZb6DHRxtkOS6LpQWDS
         Es1g==
X-Gm-Message-State: AC+VfDwOVDlhAarH3fY3L6EDBlGUsT7FG64jLMQzDwUepDwdRJUP9u9P
	cQ896Hoyt7tramK8Zrg7VRnMkQ==
X-Google-Smtp-Source: ACHHUZ6KOpA7fzkDOQwdE0eaWjq+aSb5pe5tXkNyxkIJxmCLEgji0aG8TKpPMDLgx1WbQ8BgC02A/Q==
X-Received: by 2002:a5d:4b07:0:b0:30a:eda0:71c5 with SMTP id v7-20020a5d4b07000000b0030aeda071c5mr6704816wrq.16.1687180949056;
        Mon, 19 Jun 2023 06:22:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 10/54] python3-path: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:21:30 +0200
Message-Id: <20230619132214.213417-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103394

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-path_16.6.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-path_16.6.0.bb b/meta-python/recipes-devtools/python/python3-path_16.6.0.bb
index 51b6574e0..095f906f0 100644
--- a/meta-python/recipes-devtools/python/python3-path_16.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-path_16.6.0.bb
@@ -14,6 +14,10 @@ DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += " \
     python3-appdirs \
+    python3-crypt \
+    python3-io \
+    python3-numbers \
+    python3-shell \
 "
 RDEPENDS:${PN}-ptest += " \
     python3-pytest \
-- 
2.39.2


