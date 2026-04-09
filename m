Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE37F31E29
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 15:25:27 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.131116.1775738321996199771
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 05:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=lQ9nQy5t;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48896199cbaso8605135e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 05:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1775738320; x=1776343120; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wrw/RVdcSbiOFMMnDpC6gbsnWdBLniguhJ756v1KL4s=;
        b=lQ9nQy5tcTxPcRQIoZganSvaLViCO6/Sjgugz48N8eZVaKbWHy5x/hf5yJU9o0mCig
         YR5HCIaemuzNjbRwS/yG5L13oeLehGgbLTh+fPH3lvWPNiLU0uF90Ub3j6i7EZ6D8Leq
         lY0Wdas8nGLfRbtopZ4jfcOB3Lpu6ozrEA07c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775738320; x=1776343120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wrw/RVdcSbiOFMMnDpC6gbsnWdBLniguhJ756v1KL4s=;
        b=dOndyZLVvqMAOvgnOOjqflpvcUAuULS1hxRSAnZ01MeQ6mrreQikrxt/Kxrwz8igC5
         UjHZ3kuFPFRACpgdDwAsZ3AbGyBO2QIe4VgxSotAfMywtr9FE1UF30XpgxiTJXrmBEgz
         aADkw+t17wkariA2l28WJvRocHJvV/J/lDmPyjauj0BmaJYiI3sd+veIt7Ut3GMayo0P
         qwbu9Hdw47qhLBoLx7PLbqEE6AqQaaHtsJQd7E47ZKLVusR6Ojj1tvLWru3uKVhqougk
         yxU+dk75a/YlkKx1LwwmMEr8jJrP0oNb/VqkRSW2DoAXynrvrsLeWfIexhk4rGB5m0u5
         NiWw==
X-Gm-Message-State: AOJu0YwE+qIVv2WbcRt96BiprJc0uvQkJMWanHaF8I7Zzl3qNSG6M9/s
	suPs1N3zcwN1y9DLoL9n245XCp/6uUwOW3WF4SBojjOzM8MJ75lU/0lMdkSkskkSvZB9lHuU8Hh
	DA1Uw
X-Gm-Gg: AeBDietEZ6HU0uTsYn6osQNiOjngEp7Csz9ibSTkmYKs5IzyLja35/eQQ7VSMD/w57w
	qFjQHOQSxvfQpDR6MBM8KKdniKAHxfFHNPcjaiZq2qkt4f0EilMX7sDGaAK+qDz3sY6LTnO0Oq2
	uVXcJJJyqxBDKy5b+j0dt9TQZ0eLbjH3xxLh03UWw/bt/IN3Nf/qiJahDElDfUII1ons0duefkO
	GsiFPq7NyE8KgIkcaMhZtfwKdefpfBu3A8lDgIQXJPBG94dfJPxnOjaB/PL2DnVuUirUcFZx41d
	8IwoXX4ryspaix6EJgIaYB08vh8ROhnNJhVujCy8XdZ8EWlx1Ad7Vk+CuYFPUllKe68Wmbdy7E8
	Pxe/LwHhd9Upgy5likLZ98x6Rm0KYAJrW3ZX2cGRfFxji5MJvM96pDaOYTqDFTmzAslNF8ImwQW
	RZnwxKgVs5XXwIa3lhl30pVTs76OEwhYPvjs/o
X-Received: by 2002:a05:600c:1554:b0:488:a639:b787 with SMTP id 5b1f17b1804b1-488ccfb7907mr48609565e9.11.1775738319900;
        Thu, 09 Apr 2026 05:38:39 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ccfb7912sm47703805e9.0.2026.04.09.05.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 05:38:39 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-aiofiles: Upgrade 24.1.0 -> 25.1.0
Date: Thu,  9 Apr 2026 15:38:35 +0300
Message-ID: <20260409123837.3650532-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 15:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126196

Upgrade to release 25.1.0:

- Switch to uv + add Python v3.14 support.
- Add ruff formatter and linter.
- Drop Python 3.8 support. If you require it, use version 24.1.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-aiofiles_24.1.0.bb => python3-aiofiles_25.1.0.bb} | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiofiles_24.1.0.bb => python3-aiofiles_25.1.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-aiofiles_24.1.0.bb b/meta-python/recipes-devtools/python/python3-aiofiles_25.1.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-aiofiles_24.1.0.bb
rename to meta-python/recipes-devtools/python/python3-aiofiles_25.1.0.bb
index 1e9ebdf97d..26cc9e81f3 100644
--- a/meta-python/recipes-devtools/python/python3-aiofiles_24.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiofiles_25.1.0.bb
@@ -4,12 +4,16 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[sha256sum] = "22a075c9e5a3810f0c2e48f3008c94d68c65d763b9b03857924c99e57355166c"
+SRC_URI[sha256sum] = "a8d728f0a29de45dc521f18f07297428d56992a742f0cd2701ba86e44d23d5b2"
 
 PYPI_PACKAGE = "aiofiles"
 
 inherit pypi python_hatchling
 
+DEPENDS += "\
+    python3-hatch-vcs-native \
+"
+
 RDEPENDS:${PN} = "\
     python3-asyncio \
 "
-- 
2.47.3


