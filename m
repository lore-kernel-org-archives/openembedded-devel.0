Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 515ADEB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:37 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.216.1687531228642539713
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=0avMezev;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.41, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f9bece8d1bso9278725e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531227; x=1690123227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REFphpDtN55f/RZJHOlsbPGf7ML8RoxFaAxJEFyU0i4=;
        b=0avMezevuELTkTuYYVKO61fJnveBcpu9axKfxMdw3AJn3EYIxDfRImy1qdcSDQZGvD
         teihWxG3U7gtBYwgjjhUmjvzOwORCcI+TSzkDNkYaFyrH6bffSvyKQsUgrjmT+cwjbZ6
         /D141kasV4RvBdpj/BeN7MOCf04k5AfipFhR6YDxsUJdvvxp/kkmBhyUmV5Tc+gIUhpt
         vtwHtHqfimn6c3noGfXS5J8b2cMTEx7xFRDc856GbGD5ivkVcF18NN9qGMogus9y4Mth
         6GE3Ev9ihSBBEUsIFef9HNKL/uQVVfSmzIJtRv4uc0npzRESQQItrxbQQFquCCL33Vjl
         ZHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531227; x=1690123227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REFphpDtN55f/RZJHOlsbPGf7ML8RoxFaAxJEFyU0i4=;
        b=PtFN69+8FI8ikMBFN737c2MBdVTUOqx/4rp45kpfewIf3+AHV/vPUEvorhaD0y9pE3
         o//otB5AaYE0hDK/B+058ddU9ptJDBv+ZC+L/FUCfaCMaHPXCCNBbTRT3U71fxCxaMF5
         KkND3pQqMErjpOnA8sj5dA+cdqSAM3sOcHdVmcQiElDOOQR4AyGOyU+x41gzJYcyx2La
         9ouqc8jQ64NUbiD2PKsSUDPscwAuRr5XvQQzeDQ3OD93c4Mzi8nyx1U/QHhARIzLRYWe
         L7m5jTPOY0uldZmKRH5IQs02aEvU9qlRR2Y9nny+pBTD3Az+/qXZXq3In+n6m/UQXMS2
         iBwg==
X-Gm-Message-State: AC+VfDyzrbt9MKzuG7WzYvbKFpaLnOjZt5GnZmO1NfXsFthY6MJB8Pxq
	X8NbKEOJcPT3Z52hTN3MkW+R/A==
X-Google-Smtp-Source: ACHHUZ4HyT1aMIboJTyaeJ6gBVNiuC1SqT9tcNCKEohL4OdQ8tzfeO6YYmLiR+03axDXyyVsZ8lGbg==
X-Received: by 2002:a7b:cb85:0:b0:3fa:7c6e:e8bf with SMTP id m5-20020a7bcb85000000b003fa7c6ee8bfmr1499143wmi.18.1687531227142;
        Fri, 23 Jun 2023 07:40:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 53/55] python3-dbus-next: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:39:19 +0200
Message-Id: <20230623143921.146338-54-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103549

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


