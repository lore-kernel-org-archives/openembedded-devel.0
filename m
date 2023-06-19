Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7EFC001DE
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:33 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.7393.1687180945454921923
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=EwdeUsiU;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.43, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-311275efaf8so2122545f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180944; x=1689772944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6YOPUgYGF0B4qY3Fb2DPlWZeGZXtzHEnAbcvz7tWE0=;
        b=EwdeUsiUoXFKibsZ0LmEOatVbhCTWFIV3nDOszGVeRNf2BFso7UJBI0opUZrYB37sS
         Pn7i4h9RloVLk3fKXNK9a6xysEDjHjPyMRdx2M4N4ZSYZfCXpcbP2ui0Ho0FOY3fPkzL
         ++Pk04QgHUEzv1WlFLFJNdz4bpiOa+pIL4oiOVLiBuNg4m9W2wbXRKSsbi+PBMNnf4zy
         BFqA1dQWBeE1UXNA6JV4/n/wsZvN06KfclWcBGzq6WS3H3k5td/W8uzzRUeOM4UoelSc
         tMC2E3bOX4EzjpS66ApKWN/XiV5kJKNZhXslAqdWIb8tptKeoE85gnBz42H/d2J2PFeC
         IU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180944; x=1689772944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6YOPUgYGF0B4qY3Fb2DPlWZeGZXtzHEnAbcvz7tWE0=;
        b=PzZapupVxeAWDHbgSLh4TSyC7oaVutKynoa5YCH5TKZcgncqwAUzn3zSjLJNTBu5ZJ
         oUJXVUyAXZk32Z7pYmmusFQKnpsE6O6yjJUYQ+qKCg+WcupyRXhCCHmEEG8V6YLGlHa4
         NpzMMRyGs2yGn7a+hDwzG4B7B2PholJDCLnW65PA7LpLr2UfsYOCvPRs208NuXrju5U1
         hKxAYh4P90PwYeI5dqjoep8gqVR8WA9GKnHxhbeTnQ2Gpz2MKlIL7XrFib3jf0ZV6Qle
         hbB34WBHISO6dlT1F+W6aqP87DK4ku8UfrthvHsqRAtLyAZJ1IxUaFBqUVKfSPbwVzUN
         tvdA==
X-Gm-Message-State: AC+VfDwaQm8t1Ia98ariDdOwIn09UKS3qhcuH9q2JsULvu7pVIRXZQ5M
	JpmFNs6r7jN8laJf2yzZosYOP7HopA5JZkwEj1k=
X-Google-Smtp-Source: ACHHUZ5APOcsCbtrC3Vy9OrJPHZ0yzXeg52CjhijO1dSpVPCSMvn0fmJRv3yNkvrXY6KuBeVBfu8wQ==
X-Received: by 2002:adf:f2c2:0:b0:30f:bbf1:d195 with SMTP id d2-20020adff2c2000000b0030fbbf1d195mr5355832wrp.36.1687180943855;
        Mon, 19 Jun 2023 06:22:23 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 05/54] python3-padatious: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:21:25 +0200
Message-Id: <20230619132214.213417-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103389

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-padatious_0.4.8.bb    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb b/meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb
index 404a0170d..fef6376ef 100644
--- a/meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb
+++ b/meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb
@@ -7,3 +7,11 @@ SRC_URI[md5sum] = "7dd2f1830737dc142aa199f77dacf32e"
 SRC_URI[sha256sum] = "e471f251b94e8cadf6e4214f0f3b7b36678848aaa8c51cd5638ab23ecb716f75"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-fann2 \
+    python3-json \
+    python3-multiprocessing \
+    python3-padaos \
+    python3-xxhash \
+"
-- 
2.39.2


