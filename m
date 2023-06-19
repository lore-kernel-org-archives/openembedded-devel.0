Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED218EB64DA
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:13 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.7397.1687180993082099215
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:23:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=eAt025e1;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3111547c8f9so4061552f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180991; x=1689772991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4WIZaxajiAKJCcooxrxMC2bfhQwlVw3PfIh4SZrJzM=;
        b=eAt025e12F/m1RCwZiSLWLd3DDy5SwYC685yHzsg7d27dL63I+2B8NlZE1sFt4yjj9
         o0eTCB8Sa4eiaxfpZdxOtbOSyTSSYIc2NzZ+re5YwF66OqUpC3QPOq7lyt6a4pOvkorB
         5QkZRVnd6cn9HtkiKzEU3NSRgL9944XY0CYAUmPdxOY6vjIM78INio/89+g6qtPzlMmo
         bJDklwOGG9wemFV1AHjIwUozpAwbX7ADFrg7V1gGj/zquHAnUD2cpJ2peRmEKc6BtHh7
         EefvYtGEopKlUlDvZYdcEmJ1eV7OdeXyXT5RNgjJOu5n3ckN8C2LjqnIW9ZBPr2Z+fQs
         sJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180991; x=1689772991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4WIZaxajiAKJCcooxrxMC2bfhQwlVw3PfIh4SZrJzM=;
        b=dq7PTDZsuOkmGnTLebDBqkW1hfBQPLRv6i0gW/FiYpr+sx8m2snc2n07AF9DgQjFvU
         UvWa3ZfNP538okASAyOXEuzLI3Kr+5woAWHPvgQwAkj071B4BaHnFiBes5vkL6Si7Vtn
         m3rv7ZNsg5fyagudggIQFG53PUqzNfuOArUJF7sCyvFgV3hN+Nv3RDJhvFiipkKOdXUe
         j9L2vyWC0WHLGK/QCDb9ViZ7FMr8PvEI4jvAhHonVErl22S3QGQ8uiUC6/FCDOpIuXGk
         CXwJaABnzksjZEJTtLCpn3/Teq39dteWQFBhZUckThVUF/m2+8GbcOmRZxnqn5MLLZ+A
         Qj5w==
X-Gm-Message-State: AC+VfDzVBpg47vsd5V6+vlniywJZPdVY1DoeNADjLRIkUEX1gGyqQm+8
	q5aPK6HruDE05wg5yj2ghu39Zw==
X-Google-Smtp-Source: ACHHUZ6bWwmtK7ibGqIdkAcn/k4ep0owE/hen6IiwHaVd+LzD+vRGqFkunTy0O8KfX6QroqlXt12kQ==
X-Received: by 2002:adf:db47:0:b0:30f:c6c3:e6d9 with SMTP id f7-20020adfdb47000000b0030fc6c3e6d9mr8127702wrj.46.1687180991661;
        Mon, 19 Jun 2023 06:23:11 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:23:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 49/54] python3-dateparser: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:22:09 +0200
Message-Id: <20230619132214.213417-50-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103433

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-dateparser_1.1.8.bb        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-dateparser_1.1.8.bb b/meta-python/recipes-devtools/python/python3-dateparser_1.1.8.bb
index 13e8b184d..8b890fb22 100644
--- a/meta-python/recipes-devtools/python/python3-dateparser_1.1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-dateparser_1.1.8.bb
@@ -13,6 +13,9 @@ CLEANBROKEN = "1"
 
 RDEPENDS:${PN} += " \
     python3-dateutil \
+    python3-logging \
+    python3-pytz \
+    python3-regex \
     python3-ruamel-yaml \
     python3-tzlocal \
 "
-- 
2.39.2


