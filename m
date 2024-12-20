Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26E2E7718B
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 18:06:01 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.1333.1734717956373320844
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Dec 2024 10:05:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=HC6/M8Jo;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434b3e32e9dso23757345e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 10:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734717955; x=1735322755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9/FUbhQnjYXV5TE2gBwwd2Y1XhedwUQspah6mDy1nMo=;
        b=HC6/M8JoTCU9s0CeUNGZf/tcKPg6AwoQCF07GnYBOJxJrjQzF/6oz/UViI8BfiF69X
         y3XSNcJbxvpVC8L0buJbEN598UAALKud8hsQmqkNrheuhwyoa0EcTxId4LjuYK0N3Som
         ZScIGO4wzKEV245kTf8HFzUp2+1ggsl/2sYmKwLbjwGyX7LtfINOKf7qlvPZikDgEyOm
         swCTBABoH71A9FRLE7XN5ByirVmsCSXL/33+t8NDr0yTvKP0riLYqp4o/Lve9nrsQzbK
         3638H5XUxCa0BFomcqLszK6If1mDLZIIGFXsZulXg80N7DEiiv7MaBp30csJreE2kUnj
         Mvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734717955; x=1735322755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/FUbhQnjYXV5TE2gBwwd2Y1XhedwUQspah6mDy1nMo=;
        b=RtDDURhy2lA4g75H3reujoak84+XruCGcLqu0dTPeBrO13UMQq7KsCImIJS/8XYid+
         74W5WQOVn1IbEfwbe3KG2zEYpWtVq9S2GYlYkHUmzkK+67+51s6+6GPD0SYuMJd1/KZj
         ikmiWWWx+0t4+4xhyeRhVxilIFetNiz1vAxXvoeHro3g06dOuxMjPXB9N+cioi6iAapi
         lUXfg9LTr37RoAK25BIF3SDWU5y7PeVnpyHrnZORAxnhwQ80/YG3WT4DZr5dQxTIskeV
         z5qAY2kqcw93cXQXc43lVHpML/vlRDUpygem6D4hiLFFvgGkgs+EbifydILGuncg2qG7
         3rLw==
X-Forwarded-Encrypted: i=1; AJvYcCXIV3tlqO52ZigpCloyNfbUI2+nm7E2/d3r8AUsq4a9PpdqqJRFCfsZrGu4Tn3exMi6z0CIboiYY8ynY+Pej/hHOmk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzoLxbD6wUzA8EnxYqh8DAydRUL+zDveDuGMdV77rSYlcTlJEcP
	Kr74gMxGqJxu1ZkHZu39ODD+POuHaQEovXYMxjg+9rEYHaDbvQSnSJf/JC8VNnk=
X-Gm-Gg: ASbGncsFWhRMMbHlyICjiyywJiAATYr5IHTBCoi0PqpLst5AIEaQ1hLe2rGjkryVN+r
	AJGLn4EDi3VfrGM5p5odFizdnFxbIzG1mzrV963/FdUyqXDKBx1nORt2j/kV/RIe3z5T5NDYmiY
	yLD0sFWfdAzUPj4NyQY7F09Ox2Y6brCF8Nw5k4UTtRRaKRDOdDi4g0dumFqnSlbDgfvf025ozfV
	MwhwFQO6NXyCk62z/jch7Cl5TOaD20VSFRA32PcwQEEpkYHKsiGgBhE
X-Google-Smtp-Source: AGHT+IHtPEKQGVX6VQb9fw76EjQZugPL6P9MMLlAfUzuflwlrOEZSxAZFbFShcIyKpUP8LSYH/S7BA==
X-Received: by 2002:a05:6000:178c:b0:386:3560:477f with SMTP id ffacd0b85a97d-38a221f1852mr3726926f8f.23.1734717954682;
        Fri, 20 Dec 2024 10:05:54 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:72db:1014:577a:9e6b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43665cd9c29sm30447085e9.14.2024.12.20.10.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 10:05:54 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH] python3-gpiod: update v2.2.2 -> v2.2.3
Date: Fri, 20 Dec 2024 19:05:51 +0100
Message-ID: <20241220180551.110039-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 18:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114450

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Small bugfix release addressing a potential crash due to a bad usage of
PyDict_Next() in the C extension.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/{python3-gpiod_2.2.2.bb => python3-gpiod_2.2.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gpiod_2.2.2.bb => python3-gpiod_2.2.3.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.2.2.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.2.3.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-gpiod_2.2.2.bb
rename to meta-python/recipes-devtools/python/python3-gpiod_2.2.3.bb
index a7c4ee52c..58908ad0d 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.2.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=241;endline=241;md5=f5ddb56912b7f2
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "aa4571f64e1070d38e4c14c491f69637ee73e23c801d3a418dde4d5410e5d53f"
+SRC_URI[sha256sum] = "b916c3741dfc4dbcf6224b39e50765f672b137896287715709d49e9f063304c5"
 
 inherit python_setuptools_build_meta python_pep517 ptest pypi
 
-- 
2.45.2


