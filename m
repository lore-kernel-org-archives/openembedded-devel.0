Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2DCEE0AD5
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 10:34:11 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2678.1770460449329835709
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 02:34:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eiZ3CqI8;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-436317c80f7so388867f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 02:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770460448; x=1771065248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3rGFwaQJ7bAJbzVROmnwqyx/j/aQvzUIBQZY2xy1+rU=;
        b=eiZ3CqI8/bAkTsnd4X17xD9djLEU0LgSHAEtSCNXFQ1ry3ov+t2XChWZelcFFEm7z7
         pWnDDYfuE6bslTHBwLZR7o8tb0dctbcZmIAgkws8Sb9eWVszzDvosl2upLVhf5C8Byat
         r09FPk/f0u9Jz78Aqoma7CUodUdohtfH9k6UKaGhxseuk+FfMlcRaCME4wD2Xnc3BTlJ
         5d9RwOJ3AN9HQL/Zobw57CI/pSr0BrkpO3C1VWqtOqePRTnkDYQsAb43vwpTSPOVkVQ4
         CG2jI/Qac2PauaIj/G1QxMfDl0QuZf7d2yI1qevqda8sNSmcBksy2YFZ+3IBKyDhkiZp
         salg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460448; x=1771065248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3rGFwaQJ7bAJbzVROmnwqyx/j/aQvzUIBQZY2xy1+rU=;
        b=n+/VXJ/LNWLaTjaBBETiRV9hZ0ngHMVxvcP2N6StasunWTlxzGo6skSXOhfY3OAxSa
         621cCkpoKtxHb04+7lgXrjSKkp3JY+xLWbCE13Pv56+6DlzT1uyIfPvwY8JcpuHMfYdX
         ofW5zkSfvIdtwlG0Zp4C70Db8GSvt0JQZJFQ6Ox7ZDKWjIAO0594Cf77PqqBTDvckZ3b
         6c9ATnFfmN663lErOctYSAIUv0nCXW4AP70WheB6CR873aCWIsRqLASA2vMk9yHZFtgp
         xIuKWUgY+INyvx4tZwCurLgsGgs3kJQVNGX0/jU+N9GflPKtx2q5TnZ6+X5xUv1CyvXp
         Zdzg==
X-Gm-Message-State: AOJu0YyJeDtixwtE4bM2Rbg8e2Ytvz6fUL9G9JumbErs0HUyAyeNdA/1
	CUQctj15/dm6LbcfjNmXJqvzJAXJvuD9Vl87xDKW+Z/+OYiaQlRmq3eoig3dUg==
X-Gm-Gg: AZuq6aLQcd1rzAC//lx9KLc7SZGvWkPX5ymzrkPbImzPGZ6B9fhF8rdhPgBQ5l1eqU/
	d/EfrpMWd3cR37znbGukxyCyrUku7H4iY34EnMv+yROpAql9rGbSUSWY6YtRAa8VVXBwtkzxb8I
	+SD8YVrdjDjOcuZzB2YzHtY0tH3tGQ/0BXCD8pNzQONM+UvIpk0kOThuAxXGyPu+XT+pNl/l7L/
	NbwUdKQTl+eUUtXqkbyHRSxOEeNqI27TN9fHZryhFF7AVd69MmHY584OXEW8+fbJNLWWZ4sChJ1
	h9H2j9ZqBzaKhcy+TjnUscgMoTPhQLQtdn0XS53w9wQh8HLRVsTzYmiXxbg2WDtfJuKu1jEhfe9
	RhiKoNWARLpxEb97c88klywJrgbtC+yYLck5Qe0wq6DGSaMVnCJDNSGR1qGk8SrvsW76qHuQWCU
	m6Ku0I3sNnx4pOwUFLoZI=
X-Received: by 2002:a05:6000:288b:b0:430:fd0e:a502 with SMTP id ffacd0b85a97d-436209c9865mr13631435f8f.22.1770460447577;
        Sat, 07 Feb 2026 02:34:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629664632sm12077622f8f.0.2026.02.07.02.34.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:34:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 10/15] python3-aiohttp: patch CVE-2025-69228
Date: Sat,  7 Feb 2026 11:33:52 +0100
Message-ID: <20260207103359.4177243-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207103359.4177243-1-skandigraun@gmail.com>
References: <20260207103359.4177243-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 10:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124251

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-69228

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-aiohttp/CVE-2025-69228.patch      | 48 +++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69228.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69228.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69228.patch
new file mode 100644
index 0000000000..9a473b1328
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69228.patch
@@ -0,0 +1,48 @@
+From dd79eafcc7ad5429bb769de5fd5c0178e6064be7 Mon Sep 17 00:00:00 2001
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
+index d565557..b3d6141 100644
+--- a/aiohttp/web_request.py
++++ b/aiohttp/web_request.py
+@@ -712,9 +712,9 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+             multipart = await self.multipart()
+             max_size = self._client_max_size
+ 
++            size = 0
+             field = await multipart.next()
+             while field is not None:
+-                size = 0
+                 field_ct = field.headers.get(hdrs.CONTENT_TYPE)
+ 
+                 if isinstance(field, BodyPartReader):
+diff --git a/tests/test_web_functional.py b/tests/test_web_functional.py
+index ee61537..96dcd1c 100644
+--- a/tests/test_web_functional.py
++++ b/tests/test_web_functional.py
+@@ -1641,8 +1641,8 @@ async def test_app_max_client_size(aiohttp_client) -> None:
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
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index f2332065ea..84a9f2e668 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2025-53643.patch \
            file://CVE-2025-69225.patch \
            file://CVE-2025-69226.patch \
+           file://CVE-2025-69228.patch \
            "
 
 PYPI_PACKAGE = "aiohttp"

