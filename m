Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DA4C54E76
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 02:11:00 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.3483.1700187058408986644
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 18:10:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=1MJPAYv5;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.222.171, mailfrom: brgl@bgdev.pl)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-778a6c440faso80279785a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 18:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700187057; x=1700791857; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eT/TGAvESzNBBzG96Gef9/BUs68rN1G10yZZWDBFmqU=;
        b=1MJPAYv593mwJkoPgstJONM+jvEx7j07xBhFUa98so++nqd/SXTz2OHgW+q1wwJANg
         MMkGJZj33OgEHAVTbGAlGUIic1rYRh/cHn/wWQl41T6m8rjqEWO1XcGiuqlg4wFLjhkx
         85CI0HraR6+sD4V+1eZOOuS2OcFerzn3SXnT78uW6YYHh+wLKWXNzY2JCvpu2K3X10Sn
         8/cU4321VTO990Lrfad819VuLF43UeyKFsGj8cpwYEIAiqQs0m+jL0ZyaHwwr8JD1+lN
         lCPWMVeTULFtrXAZA0+YBTqajXOQUYl2hTAdvFgLKlJCjSJ1ZjNO8x6pAAlGuJgx5uCt
         C8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700187057; x=1700791857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eT/TGAvESzNBBzG96Gef9/BUs68rN1G10yZZWDBFmqU=;
        b=B2ohQ/zJ9m2WcParVMN6dmNSdNAqhN+RHpdFrj4SmKwzzGUcrGr6b3In8HBkQqyNvz
         Sx77n94mdzchzmu/n/iJdus/ZlW9FlEa7kR3Pc/cSfpfGcPMdav8MDmxcaZB8d6An+Oj
         FjzYJ6xMDcDKTJI8wL4YZs5Ye8Q6WTth8ANjILxB3gmp+KofE/OX6tOCxul6d1cE0yh0
         +zXaweh6zana7TPYVolbWT8mTGypMrd4cwZd3jyJo1Ify3NGdzroxxIziDxRxivo6uXk
         1+7IziC/xR8owXAZ+QzolzhLOKim71bcYqd0JwMFRf4EFpif0SxVccsPBR/shPkdcYNq
         4VLQ==
X-Gm-Message-State: AOJu0YwSJCfZNhgD71dddhlUyA9OSEOkH0/BkcS/6hDMlxDCkInX+52D
	6D/L4f0wvv9NYGTRvPluvDwTBA==
X-Google-Smtp-Source: AGHT+IHtxSkiBSV5cr398LAvhePG2JyOklZCtSYmVj4CJCx3X4xrYylduqDcel68PaPqC/C8SbrjUw==
X-Received: by 2002:a05:620a:410b:b0:778:bb39:7d34 with SMTP id j11-20020a05620a410b00b00778bb397d34mr10718632qko.36.1700187057339;
        Thu, 16 Nov 2023 18:10:57 -0800 (PST)
Received: from brgl-uxlite.. (wsip-72-203-213-120.dc.dc.cox.net. [72.203.213.120])
        by smtp.gmail.com with ESMTPSA id i5-20020a05620a144500b007757868e75csm261811qkl.117.2023.11.16.18.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 18:10:56 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] python3-gpiod: fix the required version of libgpiod
Date: Fri, 17 Nov 2023 03:10:55 +0100
Message-Id: <20231117021055.23607-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 02:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106845

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This version of python3-gpiod requires libgpiod v2.1 so fix RDEPENDS.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-gpiod_2.1.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.1.3.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.1.3.bb
index 310694ade..0dbb38d20 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.1.3.bb
@@ -16,7 +16,7 @@ DEPENDS += " \
     python3-setuptools-native \
 "
 RDEPENDS:${PN} += " \
-    libgpiod (>= 2.0) \
+    libgpiod (>= 2.1) \
     python3-datetime \
     python3-profile \
 "
-- 
2.40.1


