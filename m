Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6854D5B874
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 22:51:50 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8041.1765839107646904199
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 14:51:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GCQI+8HH;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-63c489f1e6cso2430661a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 14:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765839106; x=1766443906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RGbGjLbxW5ciXDgvG4PLf0lS5nUVuh6jnDuUXwGR8u4=;
        b=GCQI+8HHeUe0I+E8XQ7ojYzwdtqNYvUtwWD16MlTbdyMtZFwS+OYXCtJhhc4hykwjv
         if9GuOGMXMYPEjkmTFJw7She1NVAt8VAxBQ8agYyiQOLUjIS5M28xX4T71cbCugTIkpe
         LwbjRNgsP8Wr0q3yWePc6/FCuPdkaHfIMvSPxeaIEJCSxmNakhtAGLySYH8+LSf7YXlG
         s3E4pDOf19ZQp1MS9dgRlG6JrPfQ7pWZ4xuOfYRKRkrp6kw0KJkkjabp5K2xw7WX/GIT
         P//Y9l2ImPQh6mTWuOql3psJ4msfdtwJ7ICyDYDB9vXHJiua0i47qKRqLNRmhPE+ttdO
         wzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765839106; x=1766443906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGbGjLbxW5ciXDgvG4PLf0lS5nUVuh6jnDuUXwGR8u4=;
        b=b4mAxsYAIYdOD66QDpu4jIa/qFEQDatxvecCpgajok09dM2xWhULr+qn+RzJfPK2r8
         kim4dkgMxYGW7Ix7PGqnaKoKTlEudQ7XAErPwxJo+ecWxD7LmC+zFWuAAbrK0TQbyxF8
         jRLbQA2bOzl06A/SNCa9qP5lvQCWihXbZujIAeVKeNYXourYjlJDkNyespDhn2FBG+NP
         wdCgV/Cz8ls7nu01yW/qBiZ7hecG1vJa4nNMFiY9nUuwJjAky0S/Nvk8Hhog4n6MmiPh
         w3zsQIE8+Q9Am+TyJtmoRtV3/Sd4VdBNliIHygdqsLnsjmqhbRXFJu9VuM+OfGZG3sRd
         d/9Q==
X-Gm-Message-State: AOJu0Yxxp4Kh8lGIxMS1Y1JYLNKbP+oSx6Fbn4Vs76Qj2ehNEuJ+pW2u
	DoR834noXw1P5PAiAYGRrgB0l7gkpZMC411DyiRUP+ijdVPyP+z9PyRvZ9hloQ==
X-Gm-Gg: AY/fxX6PohcI7PO/nkKnf8AlQgYMNak7t+MbB6YxOURNpN1H2Lzi05KGJNwiPEXHOQA
	wiypf0+DEsAAyVHDSp4DMXQQBuJOaG92hmwOZFesnQD/9+kq5tQlAjw8eQxZQWG0aOeS1dJ0Gs7
	24LEsM38Fssv7NTI5swQWUh3qXrKtoaC4EmMVKAVU6DASbCSo5tTfZ7xs2NfKpc5n4Epd+sdYla
	7qiJQTqJAhRrTtzX0fcFPl5cp+IWYdPPPtWszeXdvPrqi5HUJFQ8K3nb2AmHFu4YMK6/V1HY2eW
	y1g6qu+E3j75zWuIgWgldwxs1CMy3qyCWMVmoXyGtSDrY4oPJEIVeYoH0goQDWsgXstlZGCGZG6
	lJ7sRyP9vhKhYTWNle9cCXzWZ3pDT1A5uw0OgR5enpGv+8hGL1fLJm50he37le1zMXLyltNBa/2
	vQXEUKyJykMB2m0LKcyLz1giXHJRcf9AiQIxhHdQYcUiNHdsXXv0jsBVBPNIPMI+rK
X-Google-Smtp-Source: AGHT+IH9tD0d9ZCakj6AJQcFMaH5olEAUv7xwKY1SzyE4eLF58lH0D/NdqYw/cQe6PP8g5CSHxTaPg==
X-Received: by 2002:a05:6402:3086:b0:643:130b:c615 with SMTP id 4fb4d7f45d1cf-6498745b4a7mr10950958a12.6.1765839105379;
        Mon, 15 Dec 2025 14:51:45 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6498204fbb3sm14464617a12.8.2025.12.15.14.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 14:51:44 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 1/5] python3-aiohttp: upgrade 3.12.15 -> 3.12.2
Date: Mon, 15 Dec 2025 23:51:18 +0100
Message-ID: <20251215225122.2243816-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 22:51:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122670

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../{python3-aiohttp_3.12.15.bb => python3-aiohttp_3.13.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.12.15.bb => python3-aiohttp_3.13.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb
index b6344d4c68..ca188911c9 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "4fc61385e9c98d72fcdf47e6dd81833f47b2f77c114c29cd64a361be57a763a2"
+SRC_URI[sha256sum] = "40176a52c186aefef6eb3cad2cdd30cd06e3afbe88fe8ab2af9c0b90f228daca"
 
 inherit python_setuptools_build_meta pypi
 
@@ -18,8 +18,8 @@ RDEPENDS:${PN} = "\
     python3-frozenlist \
     python3-misc \
     python3-multidict \
+    python3-propcache \
     python3-yarl \
-    python3-aiodns \
 "
 
 CFLAGS:append:toolchain-gcc:arm = " -flax-vector-conversions"
-- 
2.43.0


