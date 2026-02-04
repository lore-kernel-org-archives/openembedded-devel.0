Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A55E9D416
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 16:29:38 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24637.1770222570784365606
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 08:29:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XnDSXRpz;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4807068eacbso59457495e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 08:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770222569; x=1770827369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0poR2kUSbCsdx8dbzV8fYNFDd4ioGjCw4zOOARr/w0=;
        b=XnDSXRpzOxRe89Hdo2tzD4A7kE2sXdLEFQKizPqNh3Ft8ksvSekUVVKtHqzjt4TDcP
         vbh7HGwKqcPkWqPJRBnvG4sOP4NyNxJ4AiGYdkng14+FUUSIHtBcyw7Q+Z8feBGW7YcO
         UbqrZvGcV92So3JkmhNetjbFCm/emS2Js13XFWLcKqvMYmiYYLPPJ1i07u5eBfaTDmUP
         sWyOx2viAEQ+twJkgY3yI0C9pze7L/12fAk3+W/QYx6i9QhecWiDRKBYJTptXQOPxpLK
         H+iW36nziYKPzSlze4s2S54gtH66O9vDzfSKvvHDov8rDyaVWFioCl7sMXHD/cosaeZH
         YCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770222569; x=1770827369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t0poR2kUSbCsdx8dbzV8fYNFDd4ioGjCw4zOOARr/w0=;
        b=fGlKUJmV9FMwLyn+/6GsfN7BfoNS6vfgDiIZJJvzUzCQBxfOkI9jHpiN/ctmz/FeOZ
         eT5kl4WNeCJ9aaBNC0TgyhujmofUd4djpbIXs9d+T14IKE7YjcV+6+o684232FwcTtn/
         7/6r/e/DiXhTysQscb1UuGs+5nyi+EWwhawHTQ1AAuYRCqZ4bgP5j/8E/8ac2upAZe/7
         kg/WbdfFp2Jj1Ui4ZbrOCoZ+7Sq0J3CK9DCXPdVe82pvaoB9Ppej3LjbZWgmxLzhDx3s
         ieX0kLtr7ggRtRw+fLNpxRgJ49AUgIwBK1is4S+00hO9v2tBYXLdyUwQkbIuoDUBnpfo
         7uMw==
X-Gm-Message-State: AOJu0YyvzZarlnTdQXOcqFgoehwgHJWUgRKL6jdawQ4hTAufEE0NgbVC
	w8t51O64rjJe9nBR59B9S25/Ulmi730/jETK6YiEPg+8xDFG2AWxd3nTcWP0Jg==
X-Gm-Gg: AZuq6aJu5afYS+jeJEZgYdgeNY946hV5w7nVCsibyQjmVz6kWN18n0CsxXblE88fzyd
	ZIzrDc/HXCjPDQg3EjtMUQ0Ai5AwSWIF6sxy5uuEqHsOcHM1SbwcsU3JrLWlxuZ1+7CJeVBnMZv
	B1xnMa/WMeK+UNZ/7TlPpI8DkZHrVDIajkWKYjHpWtJpL0KMoVxudkmr07iDQDWKmdg6jfgQUFs
	iDP954QV/quM/DAlGgT0eNHoHkr0RIaxQ7OlHNFbd8HcYvxjJJgCkDYsVupYxtzibI9ao7sdsgc
	OLqVkikXyMLFltAtTsuQOvRZKAOhVQ4UlMCv9BxAjCd2LSFkdqlUfmBf8qTjakSFs1JW6DFC7EH
	NGokKZf1NEzuAlFi3hNPIXqU2ONEJzif4IFgdRsmHLaT0ttB3mvZ3Dih7rWHGjPM7gerdxa/ni8
	cISvEcSjV6
X-Received: by 2002:a05:600c:1c28:b0:477:7925:f7fb with SMTP id 5b1f17b1804b1-4830e93203cmr54405675e9.10.1770222568980;
        Wed, 04 Feb 2026 08:29:28 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830ec6fc89sm23293325e9.6.2026.02.04.08.29.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 08:29:28 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 5/7] python3-aiohttp: patch CVE-2025-69228
Date: Wed,  4 Feb 2026 17:29:20 +0100
Message-ID: <20260204162924.3042284-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260204162924.3042284-1-skandigraun@gmail.com>
References: <20260204162924.3042284-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 16:29:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124140

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-69228

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-aiohttp/CVE-2025-69228.patch      | 47 +++++++++++++++++++
 .../python/python3-aiohttp_3.12.15.bb         |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69228.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69228.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69228.patch
new file mode 100644
index 0000000000..74e383ea1b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69228.patch
@@ -0,0 +1,47 @@
+From 8426e0e6df8a3481c7482d4fbce749bfe77e2e44 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sat, 3 Jan 2026 02:48:45 +0000
+Subject: [PATCH] Enforce client_max_size over entire multipart form (#11889)
+ (#11908)
+
+From: Sam Bull <git@sambull.org>
+
+(cherry picked from commit ed90718fab5d34c127a283e10385f19440df7dd0)
+
+CVE: CVE-2025-69228
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/b7dbd35375aedbcd712cbae8ad513d56d11cce60]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ aiohttp/web_request.py       | 2 +-
+ tests/test_web_functional.py | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/aiohttp/web_request.py b/aiohttp/web_request.py
+index 96222b0..b5fa40c 100644
+--- a/aiohttp/web_request.py
++++ b/aiohttp/web_request.py
+@@ -721,8 +721,8 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+             multipart = await self.multipart()
+             max_size = self._client_max_size
+ 
++            size = 0
+             while (field := await multipart.next()) is not None:
+-                size = 0
+                 field_ct = field.headers.get(hdrs.CONTENT_TYPE)
+ 
+                 if isinstance(field, BodyPartReader):
+diff --git a/tests/test_web_functional.py b/tests/test_web_functional.py
+index c33b3ce..8ec237b 100644
+--- a/tests/test_web_functional.py
++++ b/tests/test_web_functional.py
+@@ -1705,8 +1705,8 @@ async def test_app_max_client_size(aiohttp_client) -> None:
+     await resp.release()
+ 
+ 
+-async def test_app_max_client_size_adjusted(aiohttp_client) -> None:
+-    async def handler(request):
++async def test_app_max_client_size_adjusted(aiohttp_client: AiohttpClient) -> None:
++    async def handler(request: web.Request) -> web.Response:
+         await request.post()
+         return web.Response(body=b"ok")
+ 
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
index 644c07153d..55ff57d05c 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://CVE-2025-69224.patch \
             file://CVE-2025-69225.patch \
             file://CVE-2025-69226.patch \
             file://CVE-2025-69227.patch \
+            file://CVE-2025-69228.patch \
 "
 SRC_URI[sha256sum] = "4fc61385e9c98d72fcdf47e6dd81833f47b2f77c114c29cd64a361be57a763a2"
 

