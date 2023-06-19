Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297C7EB64DA
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:24 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.7434.1687180996020460845
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=YpZy/OMl;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3112c11fdc9so1633645f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180994; x=1689772994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REFphpDtN55f/RZJHOlsbPGf7ML8RoxFaAxJEFyU0i4=;
        b=YpZy/OMlZZ1stBNwRsMuLdj5Sfb8ECUwTHoY/6xW8Wba6lWJdjRVhHMm7kQGdAEO7s
         cn2I4gkQgAEVuKGcB6fwHkWORgDBHwktjf5jiBDNkdlHJLtIiCjX/pZhNupfW+gP6CKl
         wZer1d5o+MetUmIMluZbCG1AknIRoB0vItzq46IQQTA+FcNxWp77CVcoQBA92NnHB373
         T1biRqhmo0xbiOi7GjxyCHrkodYaQJsbF+3eCHF2ikOjjgbzke8y/Tfr/YCCeDi0h7mB
         GViic83YjKhQQFwE12/Ilc7u3SEyDULUVydDzLmJGwXx2x/su3E9PYC4q16weRfWV6lp
         wIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180994; x=1689772994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REFphpDtN55f/RZJHOlsbPGf7ML8RoxFaAxJEFyU0i4=;
        b=Ytu30oNhgJQpN5jPklmXB+qe5kWL5p6fMxgZla7Q/THDkjaOyBVRrU0HPtO8B1MnY2
         DXyDFFwbQb2Czilu6HUKfSbSl6pdP6Silj3it8TokEPUvXJtH16Nj1UIIINfYL/Kd24c
         MhaJ+W0XTGlSW9AHoI9sxlRYNcI47XUcMOl2+bwLE1Wr6SXuUpxrAdTcIAeFlpILjGlS
         ynNg8XlH3v8JdvwYuJj6K0UJr54Mq3R/Fz0XKiXcfLrTFuddFil8iLix85NG1ryGa2AG
         /0pIKtUVQD15Npvmb7sGyKs5zt1aK4hQVyDKXxZrlWNTC/B57/Z8+YUjDoXOjk2cRqJg
         MD0g==
X-Gm-Message-State: AC+VfDyyQDqf1A27cwHNE5eVVVHgwW2G1FQlXExqdqhmKuzmopGfoYg2
	jyzw/hZg0ahl5AQNAWPLjt1DlQ==
X-Google-Smtp-Source: ACHHUZ4PalTY65apyR1XFykG1McAQJ6nZYjdqXgiwu84UY13zvdjysvUq5PeqcUtwFXsSEGRcnQCRw==
X-Received: by 2002:adf:f60c:0:b0:30e:3ec4:6de3 with SMTP id t12-20020adff60c000000b0030e3ec46de3mr6037784wrp.35.1687180994622;
        Mon, 19 Jun 2023 06:23:14 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:23:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 52/54] python3-dbus-next: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:22:12 +0200
Message-Id: <20230619132214.213417-53-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103436

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-dbus-next_0.2.3.bb       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-next_0.2.3.bb b/meta-python/recipes-devtools/python/python3-dbus-next_0.2.3.bb
index 3ee11b9d5..9f6aa7ed7 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-next_0.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-next_0.2.3.bb
@@ -10,3 +10,8 @@ PYPI_PACKAGE = "dbus_next"
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} += " \
+    python3-asyncio \
+    python3-xml \
+"
-- 
2.39.2


