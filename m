Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8AAD4A60A
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 07:38:24 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1313.1768549098520326051
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 23:38:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xbf6M91w;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4801d24d91bso8884405e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 23:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768549097; x=1769153897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQ6jcz4dCVPnvoKvibp0rFJ49HKvQt/0U0STNgbmmEQ=;
        b=Xbf6M91wCGUyZgwar5maLrXYGLQidTSszD6rCRd9Ew5w8MtWqTIj6z22aQj/lHuUBp
         V1v1l/i48PlOX9g6Fn3WprHptRfsaKxJK74rPX7FUh3Myp3WYMSEfq1I7OnHaR/JOZvv
         B4ofGA3gLwNeazFLd06cICAQQ6RpxnSny6tVVc/vdaDdbx5O3I/byp26JrantYTmgcDZ
         /1VJ2aAWnh7kIo8jcxrKrOJDm8eRKegUOqXPSpQnnHzIjyWE8FkWVrWszI5zRrBd1nor
         iDKHGBgNHTmOc6QMxKAZ28hwFichfHcsNW3fRU/islE+UxWJrnl6PgSkq1rK4aITvpc1
         7bnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768549097; x=1769153897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qQ6jcz4dCVPnvoKvibp0rFJ49HKvQt/0U0STNgbmmEQ=;
        b=VeevRL/aBtxhBtyEDv9A18GuZWLO2p2jFf6NucRU3Ya+YquJFrO98zGQEZCLfGhzM4
         ti0Zqq2jC5j6vz9OkLc2Jv9NYGjj8+TpOd3ZMmmQy+Nbd3HkgueeYdseJ9Y+ERFRfz9F
         oHrqOOPk6BhgEtIMnybwxVX8rSLV4j4OAa5oaR1HT0F8xKa1AJtiD1fG/rVMIc6F/PEL
         yKherMxcfkO54ptwZRLg5ufqtduj9zX8vtY22k+o3dMIBDOwwABj/SO7ZTeu2t7/NhpL
         Fm7+Lq4kyzTroCyTmrI95OfOejPdYf6v30/FILtAJ6IimDsLwO6B2T2ieblXNzp1EsD1
         XdJA==
X-Gm-Message-State: AOJu0Yybt8vSEQFeXzxurNup3d7q/3pwGhF4aab7hfu3WwrkIMjLKVHI
	orqBXtRyOm2Wovb+Kt0PDy51RzcciqE5e4kuqrH9Pjr3GQ5LbX7xGByan1tSCg==
X-Gm-Gg: AY/fxX5K+ahG5ttBSwmNiCiY4M4sDWFXtorxeojHw5POrp8MYkhMcvv+1c1Kz7787Qv
	lqQ/t7Ocx4iplkVI/1ghsrv656TksXL4xeKblfO5bLl+Rs9x2/ajFskPGLcks+NOj7zdhgjbruI
	f/bnAVB9uOQrG5xK2ZVA+DasGTN0nJi8Y2xQgTBibDMzj3XUIUdUT9btRahRMziVv8+KqNQdMIy
	c89c5nSQMXD7eR/8Ixm8x/ZhlXw61te6J9ezNl0BxlFqCaMF7UIsmz0szKskhF+JWlo1TItIhyF
	FP8GP1JE2SH7u4bADMx6QzVYY84Z9zYwD/Uy4R50eCNPDiqsF5xvUEn66VKZ5WP7lI3Rb9B0pSB
	LKSa5h/GaFb854BBGTRheXmCQf/T27WbZQjH9WFQNPCjyuPLMgtQMYf7GbW0yuhVzE7BJEZv73c
	/8nhpMMPfm
X-Received: by 2002:a05:600c:890b:b0:47a:935f:61a0 with SMTP id 5b1f17b1804b1-4801fd3bdbemr13537335e9.0.1768549096738;
        Thu, 15 Jan 2026 23:38:16 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm84992495e9.12.2026.01.15.23.38.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 23:38:15 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 4/6] python3-werkzeug: upgrade 2.1.1 -> 2.1.2
Date: Fri, 16 Jan 2026 08:38:08 +0100
Message-ID: <20260116073810.3290097-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116073810.3290097-1-skandigraun@gmail.com>
References: <20260116073810.3290097-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 07:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123524

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
==========
    The development server does not set Transfer-Encoding: chunked for 1xx, 204, 304, and HEAD responses.
    Response HTML for exceptions and redirects starts with <!doctype html> and <html lang=en>.
    Fix ability to set some cache_control attributes to False.
    Disable keep-alive connections in the development server, which are not supported sufficiently by Python’s http.server.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0704ebad0d31eec1737e0313b0f221085a9e8166)

Rebased patches in Kirkstone.
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python/python3-werkzeug/CVE-2023-23934.patch            | 3 +--
 .../python/python3-werkzeug/CVE-2023-25577.patch            | 6 +++---
 ...{python3-werkzeug_2.1.1.bb => python3-werkzeug_2.1.2.bb} | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_2.1.1.bb => python3-werkzeug_2.1.2.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.patch b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.patch
index 3a0f4324a1..69c3e3e56c 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.patch
+++ b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.patch
@@ -33,9 +33,8 @@ index 6e809ba..13ef75b 100644
      resource use.
 +-   A cookie header that starts with ``=`` is treated as an empty key and discarded,
 +    rather than stripping the leading ``==``.
-+
  
- Version 2.1.1
+ Version 2.1.2
  -------------
 diff --git a/src/werkzeug/_internal.py b/src/werkzeug/_internal.py
 index a8b3523..d6290ba 100644
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-25577.patch b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-25577.patch
index 61551d8fca..351f939b78 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-25577.patch
+++ b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-25577.patch
@@ -25,15 +25,15 @@ index a351d7c..6e809ba 100644
 +++ b/CHANGES.rst
 @@ -1,5 +1,10 @@
  .. currentmodule:: werkzeug
-
+ 
 +-   Specify a maximum number of multipart parts, default 1000, after which a
 +    ``RequestEntityTooLarge`` exception is raised on parsing. This mitigates a DoS
 +    attack where a larger number of form/file parts would result in disproportionate
 +    resource use.
 +
- Version 2.1.1
+ Version 2.1.2
  -------------
-
+ 
 diff --git a/docs/request_data.rst b/docs/request_data.rst
 index 83c6278..e55841e 100644
 --- a/docs/request_data.rst
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.2.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_2.1.2.bb
index 0a18a48406..3c50d19173 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.2.bb
@@ -18,7 +18,7 @@ SRC_URI += "file://CVE-2023-25577.patch \
             file://CVE-2024-34069-0002.patch \
             file://CVE-2024-49767.patch"
 
-SRC_URI[sha256sum] = "f8e89a20aeabbe8a893c24a461d3ee5dad2123b05cc6abd73ceed01d39c3ae74"
+SRC_URI[sha256sum] = "1ce08e8093ed67d638d63879fd1ba3735817f7a80de3674d293f5984f25fb6e6"
 
 inherit pypi setuptools3
 

