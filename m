Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB48BEB64DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:03 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.7423.1687180980314821991
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=cgmFmPS4;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.43, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-31126037f41so3107818f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180979; x=1689772979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6A5ky8pD2NP5EsqaLLI2a21g5Js69afU7FDwvgY5wkY=;
        b=cgmFmPS4PEPOlepRA9UTlqv6qpwrX8U+KtBBwsNSjvk5OLGrgv49Z/YjzQ9uQXYfQo
         o7PvdZA8mSc277PQ3QU4TfAArjy5YcVwqaiNZGa2qQJbSaKwSoeyk9eszAP9Y6AkeilY
         cImfHlsGOiZ5k7rL/FPxFj5ZV880b+yPCVZvR2v3w6+E+0glyHCWEW5Y9Nu7oKTA2c+4
         6VAit2be9vTqNWib3OWZj4TdLOBH6LMWjBHVsObaw+PTSpBEqj+/OOdZ8KkEfC2TMciE
         bLrQ44dwvC2PsaDs9qE50ZNBKzaaE9clzREWyNQ4wfh8ZGDm1icjFY3TRIkuKVZf1v9L
         EJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180979; x=1689772979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6A5ky8pD2NP5EsqaLLI2a21g5Js69afU7FDwvgY5wkY=;
        b=J5EuvYaY+x4WkcS205fHGCGd0UOx0POfRCHN1V0YAXb0fjl9b5jdBwXJnzZJUT4Y43
         KPifh4WOy0ppLgFfK4ojtQLbH3YAWJ2bfX9tMWvA0Mm9iEw9tUWXUf/sn/vr0FrJVHtS
         /a2Ia63h7HceKwV3ZYq8CQT2U3vOp1VW5LInN2Uj/SQccQo5DbZjJnzUeJN7DrKSE8LI
         LKCOFM7zQ3tm6oVFbkZKBJVhSpTnd1EQcqLibWdbsb91eovPmMd8xDG9BoPg3o1p/2lR
         7KTi3KnqPQW2AXWKOSiQAseIRRljBu/u0UG5mxZk/icYZGy6Ize5bziI2fqZVSGtDAKK
         Pk6g==
X-Gm-Message-State: AC+VfDyH/hdj43ldEshkRVpiLPSmAPI0d9RXhShmJmr3tljq44ZWdhj7
	9l6WliMPIqZsqCCoHC0gzV9uzvB0bC7X3xBqLiI=
X-Google-Smtp-Source: ACHHUZ4Gma6//4mbZt8Sp5GzFCzmqNITgJsnBLMF/I0H2dimxFP/HV7YiHDixIcc5THBlonUO5bKKA==
X-Received: by 2002:a5d:5255:0:b0:30e:4714:bc93 with SMTP id k21-20020a5d5255000000b0030e4714bc93mr7546199wrc.5.1687180978902;
        Mon, 19 Jun 2023 06:22:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 37/54] python3-binwalk: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:21:57 +0200
Message-Id: <20230619132214.213417-38-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103421

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-binwalk_2.3.3.bb      | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb b/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb
index 362efa275..1a55a3e4a 100644
--- a/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb
@@ -14,4 +14,10 @@ S = "${WORKDIR}/git"
 
 inherit setuptools3
 
-RDEPENDS:${PN} += "python3-core"
+RDEPENDS:${PN} += " \
+    python3-compression \
+    python3-logging \
+    python3-netserver \
+    python3-setuptools \
+    python3-stringold \
+"
-- 
2.39.2


