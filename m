Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0763BEB64DC
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:14 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.7395.1687180991030286998
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:23:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=K28J0H9/;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-311153ec442so2551187f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180989; x=1689772989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KDapf7ZOWRQnic/fdbmpYeQrbSlSsL1XexP0upGyZA=;
        b=K28J0H9/OeHwUuOk5mL+Zm5CHushJYgv6IOjdZcpAe/LOT8mcVdY6psUUrwz3IAqpf
         H5kOVqrblWG/hkCO+XgEJiXVrAcswr2PJNpK3wYcekwOYdHesg1SsFdn0icA9mSeRiqo
         qYGtLJWJpzFxn+emZkZdM7Oytx/adsGnAqbs/PWDIBOuy9DGTnEBkbvGUvWNu+/d++Gm
         vGnHXE29HI/HVedlncy9MXL+GBGxb/5JOoJ2r5kbUDALpb85V6TPPZCUqjdGAsljPrjd
         UMBuSQALhx4grponwgWffhEoGUcWhXew9dk5DhT6tfR4y4nkv+lDS+/kaXKBmT0Y3qH0
         WTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180989; x=1689772989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KDapf7ZOWRQnic/fdbmpYeQrbSlSsL1XexP0upGyZA=;
        b=IkhRPh4GgXYSC/hQ/oPrVwKiIQbvM3mI748w6Dxg74XR0ZfEqi9w0a9zF4IRYeaNdU
         YsHOZv+kJu9IFmjX32CgkrXDr5IavBNTDVRR+ciCSZfyM0XqQ3O0RJDVkSV9UUBXNNGq
         sQgufhVVVG4hPM9RB9Z2CcIWzYBmfg22NO4JgT+uG8Eh5yPzIRNMmVIQecvBOMdsNFoi
         AUVljI4c8gezWxueJFQuHt+or3P0MLGHWyhiUblOzNonuZdToIadrfwZjYNqsPrjjPG7
         yD028HKu2cN+ePJF+uir+01Nw2f5KodB4iQYvvMHYGF1IUc/tA2TFLaw/ZQ8fJ0lOrQ3
         b/cw==
X-Gm-Message-State: AC+VfDwtJpE/Vd070FOPv4h3qLKD3X7uVwWx8mRT1l5tIrbqvfMBBP36
	JyFJn21k7SD0fIpZQarqpn9nag==
X-Google-Smtp-Source: ACHHUZ4huuOXpBuEbxYWHGElbMGi4lnj6hjvDS/kSIB7ogFv6aFMC9UPaPyF1ctSfYCnOZ+ZDN3pyg==
X-Received: by 2002:a05:6000:12c8:b0:311:2888:9f95 with SMTP id l8-20020a05600012c800b0031128889f95mr6485896wrx.23.1687180989539;
        Mon, 19 Jun 2023 06:23:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:23:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 47/54] python3-custom-inherit: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:22:07 +0200
Message-Id: <20230619132214.213417-48-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103431

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-custom-inherit_2.3.1.bb  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.1.bb b/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.1.bb
index c0e10448e..8ff3b9e3d 100644
--- a/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-custom-inherit_2.3.1.bb
@@ -8,3 +8,8 @@ PYPI_PACKAGE = "custom_inherit"
 SRC_URI[sha256sum] = "a0d104847b4cc1ae24e00061fc2e11da8766b019bf4c8c753822347366c8c49f"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-json \
+    python3-stringold \
+"
-- 
2.39.2


