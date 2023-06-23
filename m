Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3CFEB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:39:46 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.180.1687531178331051131
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=R0Yzrx5i;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.44, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fa71e253f2so18342995e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531177; x=1690123177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nz3ncQrYlGpyNpA93bR5ob1F8dMtd4+NZvln6N5AYag=;
        b=R0Yzrx5ixIz5THxB6arc8PjxG0Aw/gjLnwIP2BLtaad4kboS94/3SJntVnUt2OEeD+
         96cuBex5ICsUgCfwHDqqkZK5SgG9xdl1ArsO9lvKtbcNNSGK7eLEs9DQMFNNnIP6UTL4
         tVJ6E4plynJtFrQgZbzLYfFCrsK8P8sKJagZ2HQKUS/dFi00RyzbYN9Z5VJb8E5NJzvx
         qbckXciydVVd+7g5qWUCmFwPxQGzolE4Nfa+8fl6BLBe+pkSP78PKv2GEhrXVQ26x0vn
         2AF9sUYxTOxTQhFq1Ouz/cXWtDRUsraC7wNX9sGJjGL28ohm1n0zeSZpJlvnwBPbXfWI
         ViOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531177; x=1690123177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nz3ncQrYlGpyNpA93bR5ob1F8dMtd4+NZvln6N5AYag=;
        b=dBYp2Fv28JxiBaI/7MxpIw1+ywFeskxC6Ib36LEMN/NWnpQ2FST12S3j6OdanlGD5s
         vQimHE+HQXuV1Oc0hwtOEuraDMBFY4F0DjZkRQkNwHSMS0xQbXEwv1PHY/C7gxjkMULt
         UwaFjcbab9D3SQY6B/uAhn5r3Bhmd0DvoAm9jeUuImpTasal4KC5ewePRACrmnt3xkR3
         s0Yg4ZzcgSEG48DzjxCg9N5g8mQUGUJzrp2zRw8WQOSIZ/BOvnLCsL4ahrgQ2z3pXiOt
         bUnedrqashN0yO31feyS9ZQgx2qmNjP3/PB/4bBaMmuW9ZBUPif+Q8DNe9hGyJVYE8CQ
         /OSw==
X-Gm-Message-State: AC+VfDz7JRR79uzTWKPKYuBKu1Nnu3glbWRrMcMSzyt1BUzQ7N9fGCgG
	j/FlD/RIShwodv1e7tbImezeIB0A/hbkWrbJQV0=
X-Google-Smtp-Source: ACHHUZ59Vx5J0+9dWfUT0M6HODgvMaQZRZUOUmJlH1ytR1+JEMdQr18oIO7JkGrQr5mKGvINqWKruw==
X-Received: by 2002:a05:600c:2942:b0:3f7:e7a2:25f6 with SMTP id n2-20020a05600c294200b003f7e7a225f6mr19334449wmd.17.1687531176861;
        Fri, 23 Jun 2023 07:39:36 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 05/55] python3-pywbem: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:38:31 +0200
Message-Id: <20230623143921.146338-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103501

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
index 6bff9844d..1ab1bde44 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
@@ -30,11 +30,13 @@ DEPENDS += " \
 RDEPENDS:${PN} += "\
     python3-datetime \
     python3-io \
+    python3-logging \
     python3-netclient \
     python3-nocasedict \
     python3-nocaselist \
     python3-ply \
     python3-pyyaml \
+    python3-requests \
     python3-six \
     python3-stringold \
     python3-threading \
-- 
2.39.2


