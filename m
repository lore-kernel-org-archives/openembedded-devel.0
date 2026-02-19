Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BEDBE9A03B
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 10:09:04 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10807.1771495742421384339
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Feb 2026 02:09:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=PlqpaHIB;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-481188b7760so6306825e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 02:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771495740; x=1772100540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FBmIY769kE7tYY+FYSyh6kPJJ1VKqzzVOdziRYTRK2I=;
        b=PlqpaHIBAFKavCJhIbP2GaB6uK/JvjEMomvfAExcTx/fsbHjjchbb+PredQVg/0uqf
         NMU/Lb4ZWNjICFCEIWr5i59jeeXU60ub/thQF4HgIYIyY9maRC45JGLXGYLiG9NvLGHn
         Ih4ZDTXWAoiHGVAj0patSylFZQsE0QmF6uFuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771495740; x=1772100540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBmIY769kE7tYY+FYSyh6kPJJ1VKqzzVOdziRYTRK2I=;
        b=beR7QVjraRaqwZPWgoNyv/50V2eiL+JyyvJ/vn1fxhhs5Lq+Myjgx2bHPiyBD7zrHa
         Fe/1Ao36MVtOt4clUCWEg9eZMIlCz0LI9pDImrYqHi4qSh32PVQNodvBgtaMUpkE3EbV
         3xU9l51ZW2EHkblIAPXcNutRLil7mUyM9fXnJaXCNwqNAXYI75NvyjHXtdYLdOVHRuHa
         07B25yc5gGF6WgKLWSqihB9fo1EhjEWqml4g9bi7poI2tHVHAZwmW6RwgV/mgspCbfov
         LMpxsZvC6tW5L+LdeunM8tOj6fFYvEqxaZUPqrwyPQ9efeodX+T29WgeGAK6sz4WtGkI
         Gk6A==
X-Gm-Message-State: AOJu0YyuQ2iw/4/k+NWAJpdnaXszZ5HRYtGyQthVc6NmO1PQo2txVJbL
	ga08RlA2KyEfTB01OtztueJj1pswdeOj0yQQVx0qmabMELBcHb8OJ5IQHKcbcfVC7d4EHOoJJ+a
	b1oZa
X-Gm-Gg: AZuq6aJJnBp8F6z/UBgHECfvSd+gTL3pyc97xIt26fu71D0IGgMvwmVqM1M9TRNswT2
	EOzafY8oQwBk+gEd7X5Q8zJlI/egqB92HI8C9ixEnr1rOD0KkaSqaFEmnmwIbFRbQJWxAq69GJs
	qOqkwIDzpa5u01N5DkhK9+TAUel8cz7k7v+9JZ806s0zs2LcdhZIQPR4PBgi7U8A2y9m5hDtmn3
	njBg/tw03JqwJyqkM+RNliDzcmi/2pQrNnwEfuBUNgQC8et2+ojacjsZS157IyDLNMbHBRfxYbp
	hG1V7vsPiia4/IMqU3CAYWLa71eCKSJRB/IDxpBwvHC3+hYLS0KiUpSB/iBmtkZa/1EUqn25nN4
	QYOAMEgzZCwOfe2puobHmMUEMascBLOKhCQfkaEsA0Ku/71hNjL8tzpz5nVP3zNxVZEffdfGY1K
	yLRhfMhs5gdsMD46Ibv4aR+GoreVwexfwMSb12
X-Received: by 2002:a05:600c:19ce:b0:477:89d5:fdb2 with SMTP id 5b1f17b1804b1-4839e63ead7mr31516555e9.14.1771495740054;
        Thu, 19 Feb 2026 02:09:00 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5ebd1bsm712340465e9.6.2026.02.19.02.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 02:08:59 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-engineio: Upgrade 4.9.0 -> 4.13.1
Date: Thu, 19 Feb 2026 12:08:55 +0200
Message-ID: <20260219100857.3498767-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 10:09:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124501

Upgrade to release 4.13.1:

- Document that a process can have only one custom JSON module
- Switch to Furo documentation template

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-engineio_4.9.0.bb => python3-engineio_4.13.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_4.9.0.bb => python3-engineio_4.13.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.9.0.bb b/meta-python/recipes-devtools/python/python3-engineio_4.13.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-engineio_4.9.0.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.13.1.bb
index 790d1b44cf..f8bb87dfde 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.13.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=42d0a9e728978f0eeb759c3be91536b8"
 
 inherit pypi python_setuptools_build_meta
 
-PYPI_PACKAGE = "python-engineio"
+PYPI_PACKAGE = "python_engineio"
 
 RDEPENDS:${PN} += " \
 	python3-netclient \
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
 	python3-asyncio \
 "
 
-SRC_URI[sha256sum] = "e87459c15638e567711fd156e6f9c4a402668871bed79523f0ecfec744729ec7"
+SRC_URI[sha256sum] = "0a853fcef52f5b345425d8c2b921ac85023a04dfcf75d7b74696c61e940fd066"
-- 
2.47.3


