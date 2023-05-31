Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAABC83005
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:21 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.9055.1685521520800913305
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=1XC7CXz5;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f60804faf4so39526585e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521519; x=1688113519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQjF77WF4IlNg9QLNnv+crupQV2TN0/hsv/gIGAjglw=;
        b=1XC7CXz5z6ofvA8EDn1piwB0kimwGUNfTNpaYsUENdz+98rdV66oTo5447LyfKM8QY
         h49K0PBpKGQaFTC+K+a1tZdn25Rx6FVctDVOFoGwL5qa6UizIV7ClyVC2KquOyKLUqrt
         qYEEyJ8Xm5/zXe+Y0oEqxLtegiwL0m5T3ExVd8Z7ccKXjfspJaKlOyb+mmphnWzCPjQb
         5cxbX57IDumXG2X/GV57kTXRvyJte1DWnvEIW5Ed3TJlWyPlVjRJ4k70HqNgghKYZUk3
         EfPRiZr4vgRsaYasHhHFgY0+OyTQzQecUvUBkQ+B3nIq804im0ztCsNpqtT95R4mNltK
         gwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521519; x=1688113519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wQjF77WF4IlNg9QLNnv+crupQV2TN0/hsv/gIGAjglw=;
        b=EX2CwkGoKvPtYXa67LBEX8i8Y5Uf2kkqpsNwIqWSxXk0d8m6TylBEhPX5aCZmiBRnv
         YAJ4+7s9KQMy+r4QJUu0QnC+k8TI/rzLqfLAxdR3ROke2HJ794L98j/qqzkRwftySfMQ
         bNZcsTK7QzWuAxKGYEZ/bGbN/NtW7cfixj/YCHINYMC1ABAvXV1MVoxXdX4gnGDyuRqJ
         hWSlcCflhExn3bGtMyFFblerJLRDQOkYS9BcDIQgdWAIT87Nx+G9EF4PjoV1fw1IkOPg
         kHKjLq8H4sQ/YF+f6AitfqcoPjH/J3mNjsVAJLr8dn1cx3BkcTr5gfa3HLGo5g0mgtmg
         vHLg==
X-Gm-Message-State: AC+VfDwzE5l7xmn0JFTQ+ykwXjAU2JKSmhNsJYdO92dEgFQ9tHjoJ5m5
	pvqnUxkXqYQDvkoCsfQnICHrTQ==
X-Google-Smtp-Source: ACHHUZ6fmV/+44jm52cAgj+K9PA2n4Zq8eG5jkhG6YHI5J5Z3AHq9/+9CizVD+U3N2ptAleaiH7AKA==
X-Received: by 2002:a7b:cc05:0:b0:3f6:938:1001 with SMTP id f5-20020a7bcc05000000b003f609381001mr3484457wmh.8.1685521519378;
        Wed, 31 May 2023 01:25:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 012/149] python3-pyrad: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:20 +0200
Message-Id: <20230531082437.10646-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102939

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-pyrad_2.4.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb b/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
index bce1e2fd1..801233a02 100644
--- a/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
@@ -9,3 +9,11 @@ SRC_URI[sha256sum] = "057de4b7e89d8da57ba782c1bde45c63ebee720ae2c0b0a69beaff15c4
 SRC_URI += "file://use-poetry-core.patch"
 
 inherit pypi python_poetry_core
+
+RDEPENDS:${PN} += " \
+    python3-crypt \
+    python3-io \
+    python3-logging \
+    python3-netaddr \
+    python3-six \
+"
-- 
2.39.2


