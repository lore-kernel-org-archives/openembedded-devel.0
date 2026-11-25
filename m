Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41239.1795611515719801577
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 04:58:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cenkeV06;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb61185057so37123595e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 04:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795611514; x=1796216314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uUrGkfzkoJU7fy8RiORiEIs8g/lUjD1MxJXU+yWGrJM=;
        b=cenkeV06MS63nsoTNyOUzfW1YmCnXOVxy0I7Z97Msl48ELQ2nvaaLYuKDFmCBmYnhf
         WciRnempL2yli6StlLeNTNk/GjpuAd30tMBl99ACCuQB4nFa2MQloLaYzl489jItUSQh
         dthiYb5u/82RoiuWlyfpjetHt4E6NEbnfz7Xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611514; x=1796216314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uUrGkfzkoJU7fy8RiORiEIs8g/lUjD1MxJXU+yWGrJM=;
        b=1Y5i/UsxCq5enR9JRWWAZ8HmC8flxQyussPAtSY/isblnjE8oslAbeSXinPROH1rZb
         IrPK2BK3ddWRKLqFXtmrVF5fxz7TgIMm9MUVrTG2y76aS6uT9Am9VBWJjqH4eQ9HyuS+
         pw9/ff+c3O22r7N2GAsfZJmsQnejJXEKHiByaFj8TYD72oP2afZbxe23phDdVR867KeR
         JizMoCzwc9CVGQ4ES3V3oKRv/DGYlMQlJWTvWEhWiYeKf5ZLzDFOSuEW16Iyl4bTm378
         /LGAA94rLI+ys5X8gAfTibHt8cchP5UQdPN1I40rzG1Ji+2XFEMFWaOVJ1/cyVVyI8z0
         U3bw==
X-Gm-Message-State: APuU4Z/BjSJH+tODZCIF3rsLxGHXZMMdsy5150R+dYQChCXgC7+TCDpU
	jqMVqLr1I54YKZxF0fr03XQE5Z9BF9ogCGVgMXboApbvI57/4GypaZLcaedRIuHXIaFkZ1Kbme0
	QgaCn
X-Gm-Gg: AZFdTZf8fZiP1KjjmTye3LZRQBUV4dW8j3gTHt8YyvZf+/XEmad8muxv2SwsB0GXRc6
	JQdPAoY2wf53IT8a4atrnU1DEY+ZDdmNS5+U4Ms6sqoUIdtP2scThW3NmVx6WCl2rxoiUdMbhXa
	8ZJYW3ZgY4pWdNxYxdKe6thSHioxoi+NnmuklHwZsrYurizKAghcPgdU/79Cs4qLevGkuTDyTG2
	Pzyg3ll5Y+A0pa9/+IgI2YBv2JPyabdkZJGDrutAgyXaePbaad75WE+Mur9g5TbFEzWJ3DheECL
	dqlOHosdEAkmAOUWYrt8iErhUfiL6FPrA9W0V0IzkzBM92t22ZT5f6AaIN2sKrmjZMnIJoDV8xw
	kHSzQvBJGJwYQm92V62MT9JqLFeTrz6v2TSX0sMKIKTHMAQB7gELnX/Q+0LBNsH8zfbUxj61IoM
	xDzo2D0h3ZAGPNf2SLEl2zX0lNvcGA0inCJRBurOS7c8438NIeQFKkZV9eLyIoLYDY5yrxKagBn
	xT/+pFFcMEnZr4s7/2FXc9L4HhzYiGUHQyGU1Vej40nbwZAWlKNAV5ezHQMP9O6OZx7oTmid1px
	1b3mH/80lVxTOL9Luqszg74cxWxnpCNECaKBKH5PKy/OzL5GXhCh9qgKqYWS2ZxnJ/q7VAAtS0z
	p2b0W5BL709DgAsIUc8uuAP4WATMri3icE/7h4APUVBP1u3iYV/MOG9mxLFX380eXGjiyFeebGh
	A=
X-Received: by 2002:a05:600c:4f07:b0:4bb:5dbf:af06 with SMTP id 5b1f17b1804b1-4bb88804d58mr422045585e9.9.1795611513932;
        Wed, 25 Nov 2026 04:58:33 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm32919300f8f.40.2026.11.25.04.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:58:33 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 8/8] python3-wheezy-template: Upgrade 3.2.5 -> 3.2.6
Date: Wed, 25 Nov 2026 14:58:24 +0200
Message-ID: <20261125125824.1799066-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125125824.1799066-1-leon.anavi@konsulko.com>
References: <20261125125824.1799066-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 12:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133081
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.2.6:

- refactor: modernize type hints and string formatting.
- chore(comp): silence mypy errors and sort exports.
- test(engine): fail when traceback test raises nothing.
- fix: line numbers in tracebacks are off by one.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...heezy-template_3.2.5.bb => python3-wheezy-template_3.2.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-wheezy-template_3.2.5.bb => python3-wheezy-template_3.2.6.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-wheezy-template_3.2.5.bb b/meta-python/recipes-devtools/python/python3-wheezy-template_3.2.6.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-wheezy-template_3.2.5.bb
rename to meta-python/recipes-devtools/python/python3-wheezy-template_3.2.6.bb
index 08bb7ee983..f52bc04d0a 100644
--- a/meta-python/recipes-devtools/python/python3-wheezy-template_3.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-wheezy-template_3.2.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/akornatskyy/wheezy.template"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fa10554c46b94944529c6a886cf85631"
 
-SRC_URI[sha256sum] = "c7c0bf85af0f70ca2ef4b6ea9a74ef372f73392aa17bea0d885dcba7356d0867"
+SRC_URI[sha256sum] = "a00429a7bd1cb83fb6a4a5b67c486a08c8ac5a58e96bc9de7d806f9b1918f7df"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

