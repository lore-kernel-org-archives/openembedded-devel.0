Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A75EC001DD
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:04 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.7418.1687180974532840243
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=ms6Jts2/;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f900cd3f96so22034835e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180973; x=1689772973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8eTdc6efvFddz8183su0/Lq8XOMbCyz+Rpft10zuXk8=;
        b=ms6Jts2/dNvrH5BgXq1f4RCgZrXAZmrrfeOxuKh0tuJ+/vCH0jvoGoN20jISCeDf35
         KRPfAp62t7aWpRU+mUxzAZB31EDXrwA6lD2QzTRuoyCxC42kq9fDmNjrV3w2OoxxEFKs
         gF3sKCEbpk24c6Lz7YmTM1tJafUZAFYLQFTmJZGsMiFmbf+1bFs+L4IcW8DgZ4wF/9fF
         51YC4Yvy/pfz0Dbxiz9LfPe73A+DPxJNUjI0Mu8bdv+2Kr/7CEYHCyVhB4Eg1kEBbWhv
         YZdFGXtJ8odBhmPcH1eBxqtCNF0eueOOR1d7P3NnVA0QKYcPTlfldN0KcpiUZ09e3UWE
         vGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180973; x=1689772973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8eTdc6efvFddz8183su0/Lq8XOMbCyz+Rpft10zuXk8=;
        b=KBhf6WZ3haavcawlkubLSsx4FMRun1MHLg7nLAYIIjhMPDeRP7mhT+vhZW+dE6QGeT
         9Q40o8XKCz4WAjs1vOQyqU1slN4sNrbhMMC1MWO0u+zIpDiK8sS7L+MvGLuJJTvHPXL4
         StRnVlfBzN2xKZCIjI4EqR42R0nEX+UVJzOIE6wIjGAwuQpUztf1ujVqHVca9gnBqwqe
         HfinV3JS4BhYW7upFu+XfRjrOyuebQ0YW/ZBvDcDJliOJYw/ni0sRvPRRAglqYr40tLj
         oC3b5xN4zG66TYnXR+ImlBNVJWOvBF3hDSeZiyNrKLH6vpzsChFtMJ7e8ctoVMQzsqmx
         fluA==
X-Gm-Message-State: AC+VfDzLa3W0stI3Tiq0QhuSLUaHxShXdvi/wK/4a3dAu7E6ajlrs6hQ
	jJOBuChx1SY901KjnpN+a38qsg==
X-Google-Smtp-Source: ACHHUZ4qqd4V/T40u47OOIzmOspXNVDygOuKMpbXMZaCSpmKlw1g8l+x1O769fTmCXe9bFskRiyssw==
X-Received: by 2002:a05:600c:2296:b0:3f7:e535:ff3b with SMTP id 22-20020a05600c229600b003f7e535ff3bmr7199519wmf.3.1687180973070;
        Mon, 19 Jun 2023 06:22:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 31/54] python3-aioserial: fix coding style
Date: Mon, 19 Jun 2023 15:21:51 +0200
Message-Id: <20230619132214.213417-32-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103415

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Stop using PYTHON_PN, fix whitespaces, drop python3-core from RDEPENDS.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-aioserial_1.3.1.bb       | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb b/meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb
index 7ef47a2f8..6419aa9c9 100755
--- a/meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb
@@ -11,7 +11,6 @@ SRC_URI[sha256sum] = "702bf03b0eb84b8ef2d8dac5cb925e1e685dce98f77b125569bc6fd2b3
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-pyserial \
+RDEPENDS:${PN} += " \
+    python3-pyserial \
 "
-- 
2.39.2


