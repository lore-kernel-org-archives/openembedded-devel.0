Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E39C001DB
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:39:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.180.1687531187649962383
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=gegzahnb;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.43, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f9b627c1b8so9062795e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531186; x=1690123186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RWkscWwcJiGiZqsv/oZvn88jVfdVXZStS6T1N435zQ=;
        b=gegzahnbUxMPQGnHFfYy2EwXOWfZuUQ2k6405ng0LHvTc8myTmUIiV/BN80jyVLjLe
         7BxAoSW1MT9zO/x/CkXt0gyTNLeqBU6P+OBS081rLURJLnEzQ6aE+mO2Dr/amZ2Udk2w
         asIRv9u8PLCF6znhFsAWp3vnxrnrxqufbqh/GzrAI7CfBoLkIjM/R2WApbUdKEPCZ7hR
         G9QxuxiPVit7cCsVDx4YkOkqeUSLpEOB86JxYF/cxG2fzNZ0nmkrK5hYLLD3ssHxBcUV
         /DerYRv27/ZGeU9aGTuqW/RzP7v0dUqWHHCI82gt6o1ZiehJdXC68EgBpPY37IuErq6S
         MQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531186; x=1690123186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RWkscWwcJiGiZqsv/oZvn88jVfdVXZStS6T1N435zQ=;
        b=Ml5UXcFvyVV2xxvaxpQqf9buxYhX9+cPHS9JjvaF51dYZHiNsmBDIc5uq054X4c1kZ
         qlyUWLwDhlAx4gVfREoIWjr84JZofNxpGrFSmqxUYaPi9sGANKCXdSWZLYlJ8+9+isEq
         nz8faf/TIn5UYndLKRkA7+Pq5tx20zxQgNdbm9NGxAk1++4M8CG5r/xGR1Uy6DUIVEqe
         nnmZs9kLjdVP99GS8ct48P/Muz6f4AOxJoIRYVoJEETZf8tQARHnfSTjzh3Npn9zc5m8
         2BvCUdN+EmRJGMCpW/+YV+P7ne9fn4RVgbrFpd+lG8PdhBKc74ms77Penhrh8yhbNzVn
         Tkbg==
X-Gm-Message-State: AC+VfDyH51o2tkYg7iyx87ukiHmUnDjbvdWeMvPlNGYsXs2gJYck6EQS
	clw1Ww1v5MRX2I7t1OpXXrZoPA==
X-Google-Smtp-Source: ACHHUZ60bhY7EclCzIrrch0RJSr8GgdH11krUmodty4xfRmfq4wJTWbxAgrUtP1fcNJMWtICmYOTdQ==
X-Received: by 2002:a05:600c:ada:b0:3f9:bb9:e3be with SMTP id c26-20020a05600c0ada00b003f90bb9e3bemr14238728wmr.41.1687531186192;
        Fri, 23 Jun 2023 07:39:46 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 15/55] python3-flask-user: fix coding style
Date: Fri, 23 Jun 2023 16:38:41 +0200
Message-Id: <20230623143921.146338-16-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103511

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


