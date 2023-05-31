Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C32AC77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:41 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.9112.1685521531203203716
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=hpx6PhKf;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-30ae141785bso4565514f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521529; x=1688113529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNDh5KU5ygLY1cr4VWyLSRS8cMxnxdgmbLBKEHRBpj0=;
        b=hpx6PhKfZEwNHj8g6Z0z6L0JmM76FSbj20gZIn7ASRWKGf+OesPT6Y2jQjltClBfgF
         mPi1D0PTDmU/PL45Beinr0jMmN9VIQY2xjXTrXhsnks8gOCtg8N2M4WK6PnIA2UlbfS+
         WQLZQg2kEzWNGlnTR5zuQU8pVUAj6zfnxtvwf09OT9BjtGUB1arkvSdRw+Skwxar9KN5
         pmDDXFAoZeifK1li3Mqstok7u0R90A07Cv8HXXuiPnCQYk93jhU2Z+PMQYmp5KrsgWbO
         n0X9cBGD+A2pE+gFPaqomi5GnZchZdKB87mauP6OYfqu7D0umAIIKhOiR/d6ljeQ6Lw8
         ZsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521529; x=1688113529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNDh5KU5ygLY1cr4VWyLSRS8cMxnxdgmbLBKEHRBpj0=;
        b=Q/4vB1VHTeFqn8qLNkmi95vD4oImaj6cHb8YzZ95NLmAeM9rpiIEssmZyGWXib8Dbj
         1qnUbcavSJ7XYNI+sPtKblOEmiSKiH+/2jkXgKEjqO6aAwPmTk+D0yoDHFR2/t7meFra
         Syly8Og3yKM3u+ZOxtRAu/EEQfkJ7lX1r5Trgk0MSdtoT0oN2wWfNeqH5t/Fqy4SJF+U
         9FqQNkWIqBQBT6DyKBNJzF06jmIyGh3yaK8MTobxfSIDNYm+g67Wrg0/PV3SmsA/Sd4e
         VWVbOQim9C7zgTeUoAHgeYyx/xPykIhY4+axMjkeTRmAC9JWxQ6AXs2tXsu4z0Yh+Mwr
         C0dg==
X-Gm-Message-State: AC+VfDz1067NG6B3Qfu0BS3jWIko9XcE9pqmNBHf55lbkY48d4YIksRa
	Sq+RaKg4aGFSpjx82ElU5yoLTpfgpRDxDDKwLs4=
X-Google-Smtp-Source: ACHHUZ5TJKcVw1euRS6/qjxsc94hj/2mV6FokJWwsregs+ut9Cat2Z7DL0M5w3qGDBFT7cbw57MjJQ==
X-Received: by 2002:a5d:5546:0:b0:306:2cc8:a337 with SMTP id g6-20020a5d5546000000b003062cc8a337mr3658564wrw.45.1685521529804;
        Wed, 31 May 2023 01:25:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 021/149] python3-editor: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:29 +0200
Message-Id: <20230531082437.10646-22-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102948

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-editor_1.0.4.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb b/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
index dffc36169..335461c43 100644
--- a/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
@@ -10,3 +10,8 @@ PYPI_PACKAGE = "python-editor"
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} += " \
+    python3-io \
+    python3-setuptools \
+"
-- 
2.39.2


