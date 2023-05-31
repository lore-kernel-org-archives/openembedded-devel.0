Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF05C7EE31
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:52 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.9090.1685521604177201209
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=oVMpiSGM;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f6e1394060so40687425e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521602; x=1688113602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrsRKTlmsbEvV63nf9glI2a3zUCW5iA2fpMRNrgCAq0=;
        b=oVMpiSGMxPVJ7S15EenBy3eklCGbqwz9YGM6JNONUoXZYbEJ/3VL9kxklbJOxzo099
         EKGfAm1qY+zfH2xA3Yh7WVUiVZzzonTiLe1nJfoXawSaAPmQLJgQDmG125WBuO1K/Ug7
         RqiUfq2qg8E9wkSZ8uhG6HwpgiWCpXyFOuiikIDyioGKBs3VoKWBJuj0LihPV1pz522w
         dWC8TjslbZ7zfmHL81hpfGlXST7ZuggVsatj4tCpK/jSBkvRrb4VpjTXhHufP1Nm/LYa
         lrQv42Ly6xrcjeZ8d27qkkYO1GmvvRaPBuleBBPa4d1sPPqme9HdpdY+n83LJKS2Wvcc
         R3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521602; x=1688113602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JrsRKTlmsbEvV63nf9glI2a3zUCW5iA2fpMRNrgCAq0=;
        b=CsmxkWZz8SrIGvRaRlJiOeylC/tPlaDytuyMQ7UYK8Q+ShWLtKvWW0idPLsYJf4glY
         MOUQrNLHFPKd7zYv6iHRLfVgJoLmAqGqoLSQxtySSmzpyBXGckI4/IO4fjY6QpSBMoPq
         AHDtHNh/Ce5IKfYsCVJ0teRXCRs04WwdPv950eW7ySKUjmcrGYBcm8qEy2Zr33sCy3+e
         6Qhx+lww3jwB49VRJgbQgclcz7CTFPBTrrzLA7ep5i5Ciy6eISFYhJPJWLCVhIhwkdXT
         e5GdL8oPOxV02v0I6yAZI5GLttYtWuG4HIBbFoqDZgcy571xnzIGcLQb1Yd78gKrveZS
         Dntg==
X-Gm-Message-State: AC+VfDwNw9rsbWWf1eJ9Es5PT+mkr4M5CyVXmv3TikSiwJUbJV7wpFN/
	P6fmWkJ/9Kx7LS+Zy+/pG64r+Q==
X-Google-Smtp-Source: ACHHUZ7j+K1Qs3r7Tp17ckdtRvEu+y+HvG1Vz2cpvd+xCn05fuoi7CbsIFYJ26V8h4Esns3odSFKRw==
X-Received: by 2002:adf:ed47:0:b0:306:41d3:fca8 with SMTP id u7-20020adfed47000000b0030641d3fca8mr3786335wro.69.1685521602718;
        Wed, 31 May 2023 01:26:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 087/149] python3-libevdev: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:35 +0200
Message-Id: <20230531082437.10646-88-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103014

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-libevdev_0.11.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-libevdev_0.11.bb b/meta-python/recipes-devtools/python/python3-libevdev_0.11.bb
index c728cd0ff..27e336710 100644
--- a/meta-python/recipes-devtools/python/python3-libevdev_0.11.bb
+++ b/meta-python/recipes-devtools/python/python3-libevdev_0.11.bb
@@ -11,3 +11,8 @@ SRC_URI[sha256sum] = "e9ca006a4df2488a60bd9a740011ee948d81904be2364f017e56016950
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "libevdev"
+
+RDEPENDS:${PN} += " \
+    libevdev \
+    python3-ctypes \
+"
-- 
2.39.2


