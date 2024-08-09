Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC117C52D7C
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 15:49:16 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.87201.1723218547472349296
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 08:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nKh0YrzI;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso16037575e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 08:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723218545; x=1723823345; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6vCjeVs7Fqea8LJ44Gl1fHatOGCEOgUaiwipOuQ2Xs=;
        b=nKh0YrzIx/mANCYAnRRijwklSkeasqsvEskeZZyFRy1iYG3O93+5E5xLPSMZ7wTu5m
         NaZQOeEpp5kNMnz29jSOo5LLyTa5xHb3Vf2x/r+0stPj1ajG070rUv6fbkw4RXe7kTwp
         xtofjJPfpf2cEIN1PYvuBSsFu8YQXBEta8pCTUjGMvPy8AXqx1ZKMDyv+uLHpxWcLpd7
         1XAtL2PiKGwWH7QuxZ6Wj2fF3PCoLh02Ko8+WWF4wNx3Rt0m6KHe6DwaT4EEjq4LE5kD
         QYybJiMLQowX6pZw7qiOj99aCjnvn6/lcPWT9JWm9l2wmCqwTZQSGOJUzwOXPtlCtf0B
         S4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723218545; x=1723823345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6vCjeVs7Fqea8LJ44Gl1fHatOGCEOgUaiwipOuQ2Xs=;
        b=ZI8SOfZXWoQZvSFSOyjlTjHm4UZbADK3x/AGre4/2YAtDFudhfkc9kGtyTjrkNUcL+
         hrDNtKB6EPsPi+3ML61HX/LInWhryEIMtHAv+jfNAA8sg9axeCINqbF2JMyW6Lbs/8+8
         mtuKKdj4pWMaKsofV+62qQ0m2S5TQ56cUn5a8JkK/+2/3o7mBV2bhRz5Eaqwj7E9o4dl
         BEC4aGKfzRGRpJQlPcKvifMp4sEIx6WlYYe55ur1JNJv/u2Rskrjk1h8TU7+UlI4YJCB
         Xx15umvel3PMI0ZEIMCIEaEd9iOxJPngvMsq66YNHWkClwIiqiGMSvUd6G1arr3e6quY
         oozQ==
X-Gm-Message-State: AOJu0YzATCCDx9hLGlJN9qSa/Dp3/amcvj1XLuWbXCnEwCy2Ue2wlCKV
	cdD2CfMSFDOajOpv9vBxxP1kYgs8P0f6R1FEp6GUsyLBeqd9hRyrMs2OUe0z
X-Google-Smtp-Source: AGHT+IFlDn3/L4zEieCJ5qwNNRrDjKL1doKuEkA9x0uLVq8B91FcSakrY6cPT8sNNeaqRrDVKoxEJA==
X-Received: by 2002:a05:600c:4eca:b0:428:2502:75b5 with SMTP id 5b1f17b1804b1-429c3a1c462mr14800605e9.11.1723218545383;
        Fri, 09 Aug 2024 08:49:05 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c738eb4sm81195555e9.14.2024.08.09.08.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 08:49:04 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 11/13] python3-django: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 18:48:28 +0300
Message-Id: <20240809154830.14927-11-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240809154830.14927-1-alperyasinak1@gmail.com>
References: <20240809154830.14927-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 15:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111707

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-django-5.0.6-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-django_5.0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.6.bb b/meta-python/recipes-devtools/python/python3-django_5.0.6.bb
index 69b25742d..513032876 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.6.bb
@@ -1,5 +1,5 @@
 require python-django.inc
-inherit setuptools3
+inherit python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "ff1b61005004e476e0aeea47c7f79b85864c70124030e95146315396f1e7951f"
 
-- 
2.25.1


