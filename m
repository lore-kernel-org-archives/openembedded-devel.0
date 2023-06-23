Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28132EB64DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:17 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.203.1687531209226014910
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=3ndgga4y;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f90a7325f6so8811665e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531207; x=1690123207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RMTkYCCkoQsxtT1YQ1yl9FgfORATtsVQPdK6vF8CbM=;
        b=3ndgga4ypYlJFKnaUIVnqfKoWyxOJ7ocDboop4yFWeuw9IJfaWuO+EXRznh+6e5QfD
         v0VWwLF/RuksdA5zfMWCiOvLeHZZkv3s57sNMSWhi0pZjmV20DOfQ9rU0vWvrhYA9kSZ
         Re4VVQbd1PG/t1jumWmZHSzK9Sr3p4GiNKp1BRKDoDr8gR24rYQVL1HPK8jFGl4uADNf
         pfGKnuZRZV1DYf6FO+YHlgjfm0MM1RESaaWVtSgFP7FikLgRARSz6m079SiVBtoazgIr
         fS3j9LR3NhgwubH7RavfM0bKFJ2ngCGOAe4y49/C2GcdscFt23oQDsJxrkvhDWWA9uFC
         aXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531207; x=1690123207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7RMTkYCCkoQsxtT1YQ1yl9FgfORATtsVQPdK6vF8CbM=;
        b=ZvEdr46s2NsYfvL2nUbqDI1OXFGGfB2N4Omths4ONZJWKV/HDNjNuPso1q0TQ9PtSq
         81P3RkZPcQQgu3zWCHhBKzAs47baWtNqG8ED2tSaoLzQC129FpS6tSryS1120kCBs+yR
         3yuAz+NVK+pxJmP1WO/s3ayGWBMUZFh/PN8ggsFsvA8Jj7UI8zr1HegDEnj4hBUotTHN
         V8KZm25XzwB5neCZKiIT4vS9dflknaNBHsFpWzLOnmErGxYbgUJfno+NNnRt2cFk9Mr6
         lSpiisAkGy0E+tvnm09foOJb3tksnI+vM3V8VdYmjWSzdaoefHFzuaeVFMefomnWibdI
         DG+A==
X-Gm-Message-State: AC+VfDzUjApvs6x3DWF7Q0s073TmpMOVRXNje0rM5/mofH/LkEe7cNXk
	Mc5Hm7E7Jsw4VtQA0TQJp0h+yA==
X-Google-Smtp-Source: ACHHUZ5uz6bkf9EIdAaOoWRgGwvfujcs5zXuInMWiQYQ85JmX6AF+871ZCxJLugzt/jdQ+SRP5A+Wg==
X-Received: by 2002:a1c:ed08:0:b0:3f7:f584:5796 with SMTP id l8-20020a1ced08000000b003f7f5845796mr20263818wmh.2.1687531207759;
        Fri, 23 Jun 2023 07:40:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 35/55] python3-asyncio-throttle: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:39:01 +0200
Message-Id: <20230623143921.146338-36-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103531

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-asyncio-throttle_1.0.2.bb   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-asyncio-throttle_1.0.2.bb b/meta-python/recipes-devtools/python/python3-asyncio-throttle_1.0.2.bb
index 1f907511a..040e70940 100644
--- a/meta-python/recipes-devtools/python/python3-asyncio-throttle_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncio-throttle_1.0.2.bb
@@ -7,3 +7,5 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7906e56b70808e1ade6ca05e0bb48d5"
 SRC_URI[sha256sum] = "2675282e99d9129ecc446f917e174bc205c65e36c602aa18603b4948567fcbd4"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-asyncio"
-- 
2.39.2


