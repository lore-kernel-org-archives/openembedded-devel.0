Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21ACC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 12:39:36 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.67081.1722515966564606246
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Aug 2024 05:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=r1lSVcXD;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.50, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so60431075e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Aug 2024 05:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722515965; x=1723120765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKf4kPDjcW3aRiAv6UyYRenNv1JSUTlox+WkSwsirco=;
        b=r1lSVcXDXgH5H9ajlrtybWp8iCRae46kiwFktjMh13U9CT59Ry75LGc4dcwHoUE4lx
         3E6v/Oen8WGB5kDD+0zBiqU3eS6/N2teXQ+uXr48mgUrCyrSj7dkSrjXDzK96DaqYcf7
         tzElWD5zcwd6qDmkstibo/6P2h2YLJI8Qaxu0BUXFJ4HEFP32kIL2nGr7JgWZBuELtUF
         +6SqOXb841CMgN3BXHOxAAFfP0QokBlVzKnafilCr16jtMFdBJfw5Bep3xtD8E2ZyqaC
         vPLupuKVJgZIa2hvAyGmwhRjSf5jejCSAnGFNAtE8I5VcNnYSGzKrFytZW+v11CQF/yb
         55rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722515965; x=1723120765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKf4kPDjcW3aRiAv6UyYRenNv1JSUTlox+WkSwsirco=;
        b=Z/D3VmLuHknMSxk4JBIWGhmTPZbKqwLmaB7iQwdCfbs+H1IJiLBCBW7YblUsAcKw6B
         1rc+AxJki4N1VyS5XOvuSkB1+/fbN/MOb84jzZKQccFY8Tq0w9dcOYkhSno484Fl+Ue6
         OCcmLPxNV/cBhStI/uHhhc0wdaH5fsoOCiBdNptxEb+iWT5GS+z2P6aT4EGEyb3FrGXg
         9mgB6930oeJpUviKGOVS2jk0cPdo2uchaGvIQzIoqB5RmX9jx2R+D/+J3X+zBKFBowqo
         nK7cfPmE4kBWocVIqp5r28hcSZq9PSZPdZRg7VjTaa92m2E5eoaMWUlwk5DhG7RgPAEC
         xkzw==
X-Forwarded-Encrypted: i=1; AJvYcCUB675N8iAxNGpM+xrBObh48e6B9tSeexLLQJ39iykLPxMoQMElY7zkih+lRSS60aBiSGV9bPqTkYYiVfx4SistwACxaNPaEAdX5pmXtqwURiBUv6gZE/UNnA==
X-Gm-Message-State: AOJu0YyOTG+Mi2JqWmsxBGkExCGqIHvsuU7txhRST+/HGkVa0kaZ8JU4
	tGsP3XuffR17LPYq8385R1Y+HTZWHSI6tfg7PoTevr0vagUQU94bNXrfpiUZxic=
X-Google-Smtp-Source: AGHT+IFGYHkkAJmIvXNkFasxUbZfbW2GZZTfXfADnlKxTBDav4PfZpbEXXG+EsJ4NBP/YvYGII9h6Q==
X-Received: by 2002:a05:600c:1f96:b0:426:6822:5aa8 with SMTP id 5b1f17b1804b1-428af963366mr26973105e9.18.1722515964994;
        Thu, 01 Aug 2024 05:39:24 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9895:bf13:f4de:f316])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb223f6sm57650315e9.45.2024.08.01.05.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 05:39:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 2/2] python3-gpiod: update v2.2.0 -> v2.2.1
Date: Thu,  1 Aug 2024 14:39:19 +0200
Message-ID: <20240801123919.124678-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801123919.124678-1-brgl@bgdev.pl>
References: <20240801123919.124678-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Aug 2024 12:39:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111493

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bug fixes:
- fix requesting lines by name with multiple entries
- fix a use-after-free bug in python bindings
- fix passing the event clock property to line requests in python bindings

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/{python3-gpiod_2.2.0.bb => python3-gpiod_2.2.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gpiod_2.2.0.bb => python3-gpiod_2.2.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.2.0.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.2.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-gpiod_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-gpiod_2.2.1.bb
index c89fc7e92..8e1cbf849 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.2.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=237;endline=237;md5=f5ddb56912b7f2
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "4447f05ab42a9ea596e548a9a65389aa84bf61c95dc7a78074bb9c5f8f6a6b35"
+SRC_URI[sha256sum] = "802dad3a89016339a231c462c6da2d56c820f5fb11519728ff86cdff0a16da96"
 
 inherit setuptools3-base python_pep517 ptest pypi
 
-- 
2.43.0


