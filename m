Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052DBC04A94
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:39:47 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.167.1687531177428788920
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=HQxU/fVG;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f8fe9dc27aso8055995e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531176; x=1690123176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOqzopYaD/5zZzqEgYwF2Ne0JuLo+KpUFi8ezhpd8s0=;
        b=HQxU/fVGji8cUTiyOZrpt6c2Jczn5PRp2FxGkddAvYXZv3qY0H8lewwsMMtOLRZ3GQ
         aNZFfU1TvPmO5jVYx0kVVqG+9Tie+QKLZqLYxwNAxE2JTfiB7boM+VMIkWi4AGcBUE6F
         6Aiowxh/8mdqY+8diZlwH/hqgp/wpEa2jD0dhbWy9WfKsfnF8/yFYgyYazR81Ec9z89f
         EIB4nNkDKJUhU3SFgPW9t79/GAg1cKp0YENGLfcso0wNsDISjIWFj4KsZO7lR3/Os/c2
         843Yxtelr2YubvXv9E/OCupBttDLIsEFHuGI+4TdC6DNdh8TUofptWgFy+dfyLuSK7/j
         SIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531176; x=1690123176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOqzopYaD/5zZzqEgYwF2Ne0JuLo+KpUFi8ezhpd8s0=;
        b=Doee1KqW2uGYLV9/fK8jaeP5zKjOHHb9Ql78r2WIr4CGvLLUur+5EZnC1eCk2l169w
         gFXUN5dw9ykXzx7O0J+52/5VECLTeKLHSgOgpkKbM+xrJvPnRauV2//WTW/tJR+fYcDQ
         OZYlqqzKnaFZPcIV2Jawl1upVt2Jy24GoC5HiduX9UQxTs2rB1AMFpvdrXLB4mZB7SoK
         blIYsbTHZ6074m6Wq6w45VtEKWrv6j1wTv6prpaTsaX3PpJUmxz3JoN9+lt4zN+VoEI+
         e74fnnNmsBTMg9dTZqKgQCftuveG4TS0fqcY9zfKHF7enqdTSR3WGgGUeTa7AM3FyNno
         uDaQ==
X-Gm-Message-State: AC+VfDxuY+UGbB+koOp2UhzljhfUjRef1y2RNze1/ncFBtGzmWMuGJw5
	eGoclQNSD7zTnxjHgN5tNbpbTg==
X-Google-Smtp-Source: ACHHUZ7RYmcIvIDZQM8Sn0Tcdi3XNKDadd3fphhMXzqoAHle7EoaN7g0eeFHGzVn5X/Th5BHy7lzJw==
X-Received: by 2002:a7b:c84f:0:b0:3fa:8044:74c9 with SMTP id c15-20020a7bc84f000000b003fa804474c9mr376881wml.27.1687531175982;
        Fri, 23 Jun 2023 07:39:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 04/55] python3-pywbem: order RDEPENDS alphabetically
Date: Fri, 23 Jun 2023 16:38:30 +0200
Message-Id: <20230623143921.146338-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103500

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Order run-time dependencies for clarity.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
index c84576382..6bff9844d 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
@@ -31,6 +31,8 @@ RDEPENDS:${PN} += "\
     python3-datetime \
     python3-io \
     python3-netclient \
+    python3-nocasedict \
+    python3-nocaselist \
     python3-ply \
     python3-pyyaml \
     python3-six \
@@ -38,8 +40,6 @@ RDEPENDS:${PN} += "\
     python3-threading \
     python3-unixadmin \
     python3-xml \
-    python3-nocasedict \
-    python3-nocaselist \
     python3-yamlloader \
 "
 
-- 
2.39.2


