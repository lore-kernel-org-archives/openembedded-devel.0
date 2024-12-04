Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42DDE7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:20:46 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.24753.1733343644672215592
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:20:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=E+npiJPG;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-434a742481aso1695835e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Dec 2024 12:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733343643; x=1733948443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7g+NGxHitN+bLXdmAW3v8MYgRQ+pIbKhoJBW5ruGKws=;
        b=E+npiJPGrAWmfZQAFQCI7enMH4S9iWmVoosH2E4acFRhF7Oc3IF+ZkYtycEjVZfS7L
         +k5FXAQfEunOzzb0hINhpYgH+rTychxaZYrIG6A6M0cJ1pA+gCTdGaP0gVQ/IdEqwV7t
         Z02KUuNrWX+4jd14AuOh1p+eLX9VmHIZ8bfACuIZ/y1lZq508e8wsbNGV3xFYGvQQzLe
         HK2VuQjPxTandC6SkwZA5FMUd2E33+jfW5juxKaRBQBsxUYW393l1jx4fMVnkUUNSqL5
         QFPZEzhod01zKBt2sGJHpM+MJxTcTfUh2YTe00eelasikR4ZegYPMqoqeSvn6YI9V9J2
         q7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733343643; x=1733948443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7g+NGxHitN+bLXdmAW3v8MYgRQ+pIbKhoJBW5ruGKws=;
        b=sb12b0EBTFVgu63a8nuMMVBF/IlRkbxGWPLYn+gKRr3F1cTCCiqoreY6Yjqpu0KHA/
         vOh3pN7RPl1aR2N2y7zUGcwiuFCcCa13u/Q6m+6yt3PAx1qO9l5yTxdfcA29WG9XT8lY
         OzLx1foHqz33mOSzdYtxdm77QBnhe6afEq045VGMnY8/EDj2UIRrbYiEpjIYkOxAwIE5
         GrU8RCi5NfPP+4aaBr7XB0b68e+NS904OL81RfwxVL+bt48FFcpQjKAvCVSkVp3IjMdd
         PVVWfFONHFIu4arE8y6DdX6lbTBt9IfcACWe98LNOgME00bhiiDknMjMnkmsj94nUsp5
         IfSA==
X-Forwarded-Encrypted: i=1; AJvYcCXQu8PyLGf/JJHWYGf9CyTsgeb2vaRGAmtEeLMDaVabzxibWY35NKVhCkOB2aj7OrUp071QB+NVtSQoisfxw+vZGgc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzMkUWqxwH8/CNGRxaNTCjbFha2o2KnnjwXPh62gEWHz64A1ppI
	kzSWTQHWYhp9P+K7QzjTFd9CGrPiybsCdKrsoudWl3X4fUDzDvoH/CBmB7bhC5Y=
X-Gm-Gg: ASbGncvuDejPOcxcEpv0TMlNUl8KU13hPMu7P2qvgwEmQeP336xefJRX5V9iyuQCZPv
	tKd7xZeHpVxFszOILSvaCvJq+P1ijukbAvIgnr9/wG1cwniUHOu9qEjvFABJZNxj8VJU2BsLUEi
	T3agIlSk8Htsrswb0Z+W3Dg0nxx80HkJNTQIsP4lO4FECgvCZl1TMREEOzLZV8frNGN/NWpf7Ev
	/dYqx4tGTTKOQ3MLEz7kuU+YrsVkNYDswjUQNPXcrvmOTnWTQ==
X-Google-Smtp-Source: AGHT+IHTi59QzliCiXx67ukkYG6bXjPAcjCh4tZAUCZ/bkIJjDPq8OClj58d8TEoyFqlAtHS8lS7Ow==
X-Received: by 2002:a05:600c:3591:b0:434:a39b:5e46 with SMTP id 5b1f17b1804b1-434d09a8916mr65998255e9.7.1733343642970;
        Wed, 04 Dec 2024 12:20:42 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:dec6:4e1e:9712:64e5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e025d994sm16106906f8f.70.2024.12.04.12.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:20:42 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH] python3-gpiod: use python_setuptools_build_meta
Date: Wed,  4 Dec 2024 21:20:35 +0100
Message-ID: <20241204202035.6968-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Dec 2024 20:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114200

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Using the setuptools3-base class somehow works for invoking the
setuptools build backend but we should actully be using
python_setuptools_build_meta.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-gpiod_2.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.2.2.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.2.2.bb
index 2df87c0e7..0c7e8ef93 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.2.2.bb
@@ -9,7 +9,7 @@ SRC_URI += "file://run-ptest"
 
 SRC_URI[sha256sum] = "aa4571f64e1070d38e4c14c491f69637ee73e23c801d3a418dde4d5410e5d53f"
 
-inherit setuptools3-base python_pep517 ptest pypi
+inherit python_setuptools_build_meta python_pep517 ptest pypi
 
 DEPENDS += " \
     libgpiod \
-- 
2.45.2


