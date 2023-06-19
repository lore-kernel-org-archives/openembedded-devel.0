Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07612EB64DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:14 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.7393.1687180989205265745
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=YXlsra9+;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.48, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4f766777605so4334458e87.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180987; x=1689772987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rc5YxXVWCziJyAIzmh9LR6bEraCSTXLNc6o7E/xpAWI=;
        b=YXlsra9+Xn0olS3WT6UeF12u4aPbmAJrLzSvqKvivnEU7h7fq+HNLEoO0GZ6exppPH
         FArc7hIv/8hOBzOclgNsqTAaDhDxv08tFzfpR1KfozUwwxpJZ+pmj/2cWb7yH4wKOrvb
         sljfw1ArPMpilead69KOOkQ2mL7OhOzAHlfAx4CGnL6BUBCZVZM4wM9qfl1dW5MuO5yX
         F9+PWi3uLzYVaSNFxstjcJs3gAv/v59KtskvfSVCDip3FIkwY1E5yOAB69fEksHaXP8V
         q0dpcsIOXnTBmf1siFZdETLXndtLlJ9jS8qJcY8jOMZ9CbhIV6hAGCfw737xoU+t1TvK
         Ka4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180987; x=1689772987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rc5YxXVWCziJyAIzmh9LR6bEraCSTXLNc6o7E/xpAWI=;
        b=JSqeoCPMzQyZ/2gzl9TnQ2hzJvbAghxF+6ReccwS6DMAmhuXPpmuRI472agz1F7HWh
         PiJGLrsRmjBt2TP6OOz4aeC0NoItJ4dtBl97AnK/b3p8xu25GLOaTmbJ3wp8yA+J1Fky
         /Z+hHwfTXEv+mHEy1kqTAen6n8t0e9a7iWsJum3ZCURvL/XdFZfUSzxrbHg2DB1bDLXT
         fS/x8wtXf9w0uWL5/2qKDZuXDEUt+NoCD63Wt6Xj5IOV8ubs4iB7DZSLJQRco5ZBzkzJ
         PL/saOQtjOo2C7MXAVG0EnoCBs/EUqR/ioaBSWjvXff0ER2xzPqEzF7Rs5CXoH4EM3bZ
         lWXg==
X-Gm-Message-State: AC+VfDwgsTIOrEWJY5yNJIYq2WRaYCGrNOOSsygfQ9JgIVjQ/pzWEgI+
	a/IzVmr+H9xfbgw9PUDQBI/+JQ==
X-Google-Smtp-Source: ACHHUZ4dxgayH65P6pt6fHTiofibw0awvMB0bq8lUKnp9Vu3/a7BhPQtNu/ZFWT3fPZO6XAmB+VfGA==
X-Received: by 2002:a19:5e47:0:b0:4f3:b708:f554 with SMTP id z7-20020a195e47000000b004f3b708f554mr4627285lfi.47.1687180987513;
        Mon, 19 Jun 2023 06:23:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:23:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 45/54] python3-configshell-fb: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:22:05 +0200
Message-Id: <20230619132214.213417-46-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103429

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3-configshell-fb_1.1.29.bb                | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.29.bb b/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.29.bb
index 2bb196c20..7a7ecd753 100644
--- a/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.29.bb
+++ b/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.29.bb
@@ -14,4 +14,9 @@ S = "${WORKDIR}/git"
 inherit setuptools3
 PIP_INSTALL_PACKAGE = "configshell_fb"
 
-RDEPENDS:${PN} += "python3-modules python3-fcntl python3-six"
+RDEPENDS:${PN} += " \
+    python3-fcntl \
+    python3-modules \
+    python3-pyparsing \
+    python3-six \
+"
-- 
2.39.2


