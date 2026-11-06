Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1305.1793950037539436545
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 23:27:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fr8hpXgT;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7991; q=dns/txt;
  s=iport01; t=1793950037; x=1795159637;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CvgLTEh/jGMSxMOfEELYfJshAIso41F/h605AYXoV0c=;
  b=fr8hpXgTa90dNz4qZ8y3IEvIrR+nqOMYHANnFK+GwLBiQjLuS6QwMIOp
   V4tzdq+awtgjLKAFE1hINizSDEay1V/wtG/S4f1nSNRkypeRXxJQzzrpi
   kr/JO/66D97opAr4LQGUMCjvIeykBSUEbzzHyljXv1+Hun5P03lL4jXQW
   0eQK9e23jwIG6iU2y4bF5NFaVoIzA8DfEO8nIt46DAeJv+JqpmVVCU6u4
   NnJLSAiwyubN700XynaKurFi4L5hYbb8CYtRWR3Z4fZ38LD8qgjbaG0eX
   ueR9BpUWnZlta4PF8JsILZsyhdMBaxXN8GL8wk/U07UsnHn0HukJO+Jg0
   Q==;
X-CSE-ConnectionGUID: lRmkQrGATxa0RLIRTMbT+w==
X-CSE-MsgGUID: 034ESAt2St+Go0rqDfN5EQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgBpgO1q/5X/Ja1aglmCGD91YENJA5ZIA54hgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4dAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLARgBLRAcAwECLysjCBmCKlgBgnQDEbwTgXkzg?=
 =?us-ascii?q?QGDKQFDQVDbMwELFAGBOIVAiCNdGAGEfScbG4FygRWBO4IugQWBXAEBAgGBJ?=
 =?us-ascii?q?BGGbgSCIoEMgVqBA4wVAoFRhnlIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQcbBgWBHYEegRKBB12BKyhdASGBCIF2AoJRggACAUlBDgdFUwklQxJHJ?=
 =?us-ascii?q?CIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHQ5EDAeJC8FHCY+GwovGA1IE?=
 =?us-ascii?q?Sw3FRkEPm4Hkj2DAhAOdgoBExIEAn9VUwUcAjCSZwOQHYIhoREKKIN4jCSVO?=
 =?us-ascii?q?hozhVulFguYfYkBgjaCU5YBUIRpgWg8gVlwFTuCZwlKGQ+OLgsLgRQBAoJJh?=
 =?us-ascii?q?RNRxk0mMgIBCAMvAQEHAgcOAwuBaJAAASeBVgEB?=
IronPort-Data: A9a23:DXoDtqtTH27I9JK2Fm+SuiZdQefnVAZfMUV32f8akzHdYApBsoF/q
 tZmKW2FafrZYWqme9klbdi/9k8DsJDVx4NhSAdkpXhkQX4SgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvb9Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw/txyAlhU2
 tUkODlVVDSivd6Tyo74Vbw57igjBJGD0II3oHpsy3TdSP0hW52GGv+M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtGYH49tL/Aan3Xfz5VrFuUtKMf6GnIxws327/oWDbQUoHWGZoKzh7J/
 Aoq+UyhWU03D/WDkwGZsV2r3vXWsS3dBa8rQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sYMpottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:xw/v7KFxAmCzVx6MpLqEyseALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: =?us-ascii?q?9a23=3AtXU8c2hP+hfyWo3XkdqDThF7PzJudkfYz07KDGa?=
 =?us-ascii?q?EGW8xcpm0c2O18p8njJ87?=
X-Talos-MUID: 9a23:wEWJGQoIAh+GyeLTo6Eez2k5aOpTyrj0M1xOvpJeodCoOwotFg7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="544778092"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 07:27:16 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 83B06180001C9;
	Fri,  6 Nov 2026 07:27:16 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 2FF36CBF204; Thu,  5 Nov 2026 23:27:16 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 4/7] python3-aiohttp: fix CVE-2026-111065
Date: Thu,  5 Nov 2026 23:26:59 -0800
Message-Id: <20261106072702.502813-5-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106072702.502813-1-dkelaiya@cisco.com>
References: <20261106072702.502813-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 06 Nov 2026 07:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131965
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the upstream cookie overflow and response cleanup fix [1]
to aiohttp 3.13.5, as identified by [2]. Clamp positive Max-Age values
before float conversion and expire nonpositive values immediately.

Close a received response if subsequent processing fails so a
malformed cookie cannot exhaust the connection pool. Include the
upstream extreme Max-Age and connection-release regression tests.
Adapt the response annotation and imports to the existing code.

[1] https://github.com/aio-libs/aiohttp/commit/9dd8eaf4e31f1237ef2c1574a8c82a739fca5805
[2] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-6cjc-53gc-5rqm

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-111065.patch     | 176 ++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |   1 +
 2 files changed, 177 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111065.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111065.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111065.patch
new file mode 100644
index 0000000000..5ee6a44dff
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111065.patch
@@ -0,0 +1,176 @@
+From 9dd8eaf4e31f1237ef2c1574a8c82a739fca5805 Mon Sep 17 00:00:00 2001
+From: "patchback[bot]" <45432694+patchback[bot]@users.noreply.github.com>
+Date: Wed, 9 Sep 2026 14:43:30 +0100
+Subject: [PATCH] [PR #13677/9e08ba02 backport][3.14] Fix cookie overflow
+ (#13679)
+
+**This is a backport of PR #13677 as merged into master
+(9e08ba02abe573ce9e4cc541d4e3c3646adb43a7).**
+
+---------
+
+Co-authored-by: Sam Bull <git@sambull.org>
+
+CVE: CVE-2026-111065
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/9dd8eaf4e31f1237ef2c1574a8c82a739fca5805]
+
+Backport Changes:
+- Use the existing Optional type spelling for the response variable.
+- Add Sequence to the existing typing imports for the regression test.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/13677.bugfix.rst        |  1 +
+ aiohttp/client.py               |  5 ++++
+ aiohttp/cookiejar.py            | 10 +++++++-
+ tests/test_client_functional.py | 45 +++++++++++++++++++++++++++++++++
+ tests/test_cookiejar.py         | 22 ++++++++++++++++
+ 5 files changed, 82 insertions(+), 1 deletion(-)
+ create mode 100644 CHANGES/13677.bugfix.rst
+
+diff --git a/CHANGES/13677.bugfix.rst b/CHANGES/13677.bugfix.rst
+new file mode 100644
+index 0000000..bea67cb
+--- /dev/null
++++ b/CHANGES/13677.bugfix.rst
+@@ -0,0 +1 @@
++Fixed a possible ``OverflowError`` on cookies and a connection not being closed properly -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/client.py b/aiohttp/client.py
+index 8cd9add..f404b55 100644
+--- a/aiohttp/client.py
++++ b/aiohttp/client.py
+@@ -628,6 +628,7 @@ class ClientSession:
+             await trace.send_request_start(method, url.update_query(params), headers)
+ 
+         timer = tm.timer()
++        resp: Optional[ClientResponse] = None
+         try:
+             with timer:
+                 # https://www.rfc-editor.org/rfc/rfc9112.html#name-retrying-requests
+@@ -939,6 +940,10 @@ class ClientSession:
+                 handle.cancel()
+                 handle = None
+ 
++            if resp is not None:
++                # A failure occurred after the response was received.
++                resp.close()
++
+             for trace in traces:
+                 await trace.send_request_exception(
+                     method, url.update_query(params), headers, e
+diff --git a/aiohttp/cookiejar.py b/aiohttp/cookiejar.py
+index c5e5b09..6712b90 100644
+--- a/aiohttp/cookiejar.py
++++ b/aiohttp/cookiejar.py
+@@ -410,7 +410,15 @@ class CookieJar(AbstractCookieJar):
+             if max_age := cookie["max-age"]:
+                 try:
+                     delta_seconds = int(max_age)
+-                    max_age_expiration = min(time.time() + delta_seconds, self.MAX_TIME)
++                    # https://datatracker.ietf.org/doc/html/rfc6265#section-5.2.2
++                    if delta_seconds <= 0:
++                        max_age_expiration = 0.0
++                    else:
++                        # Cap first to protect against OverflowError on next line.
++                        delta_seconds = min(delta_seconds, self.MAX_TIME)
++                        max_age_expiration = min(
++                            time.time() + delta_seconds, self.MAX_TIME
++                        )
+                     self._expire_cookie(max_age_expiration, domain, path, name)
+                 except ValueError:
+                     cookie["max-age"] = ""
+diff --git a/tests/test_client_functional.py b/tests/test_client_functional.py
+index 60caf6e..3415b83 100644
+--- a/tests/test_client_functional.py
++++ b/tests/test_client_functional.py
+@@ -23,6 +23,7 @@ from typing import (
+     List,
+     NoReturn,
+     Optional,
++    Sequence,
+     Type,
+ )
+ from unittest import mock
+@@ -2978,6 +2979,50 @@ async def test_set_cookies_max_age_overflow(aiohttp_client) -> None:
+                 assert int(cookie["max-age"]) == int(overflow)
+ 
+ 
++async def test_connection_released_when_cookie_processing_fails(
++    aiohttp_client: AiohttpClient,
++) -> None:
++    class EvilJar(aiohttp.CookieJar):
++        def update_cookies_from_headers(
++            self, headers: Sequence[str], response_url: URL
++        ) -> None:
++            raise RuntimeError("boom")
++
++    hold = asyncio.Event()
++
++    async def hostile(request: web.Request) -> web.StreamResponse:
++        ret = web.StreamResponse()
++        ret.content_length = 2
++        ret.set_cookie("sid", "x")
++        await ret.prepare(request)
++        await ret.write(b"x")
++        await hold.wait()
++        assert False
++
++    async def clean(request: web.Request) -> web.Response:
++        return web.Response()
++
++    app = web.Application()
++    app.router.add_get("/hostile", hostile)
++    app.router.add_get("/clean", clean)
++    connector = aiohttp.TCPConnector(limit=1)
++    client = await aiohttp_client(app, connector=connector, cookie_jar=EvilJar())
++
++    try:
++        for _ in range(2):
++            with pytest.raises(RuntimeError, match="boom") as excinfo:
++                await client.get("/hostile")
++            assert not connector._acquired
++            del excinfo
++
++        # The single connector slot is free again: an unaffected request
++        # succeeds instead of waiting forever for a connection.
++        async with client.get("/clean") as resp:
++            assert resp.status == 200
++    finally:
++        hold.set()
++
++
+ async def test_request_conn_error() -> None:
+     client = aiohttp.ClientSession()
+     with pytest.raises(aiohttp.ClientConnectionError):
+diff --git a/tests/test_cookiejar.py b/tests/test_cookiejar.py
+index 5779df9..f3719a7 100644
+--- a/tests/test_cookiejar.py
++++ b/tests/test_cookiejar.py
+@@ -2005,3 +2005,25 @@ async def test_save_load_json_secure_cookies(tmp_path: Path) -> None:
+     assert cookie["secure"] is True
+     assert cookie["httponly"] is True
+     assert cookie["domain"] == "example.com"
++
++
++async def test_update_cookies_max_age_beyond_float_range_is_clamped() -> None:
++    """A hostile Max-Age larger than float max must clamp, not raise OverflowError."""
++    url = URL("https://example.com/")
++    jar = CookieJar()
++
++    jar.update_cookies_from_headers([f"sid=x; Max-Age={'9' * 309}"], url)
++
++    assert "sid" in jar.filter_cookies(url)
++    assert jar._expirations[("example.com", "", "sid")] == CookieJar.MAX_TIME
++
++
++async def test_update_cookies_negative_max_age_beyond_float_range_expires() -> None:
++    """A negative Max-Age below float min must expire the cookie, not raise."""
++    url = URL("https://example.com/")
++    jar = CookieJar()
++
++    jar.update_cookies_from_headers([f"sid=x; Max-Age=-{'9' * 309}"], url)
++
++    assert "sid" not in jar.filter_cookies(url)
++    assert len(jar) == 0
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index 17398ab323..e2ac1eda3a 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -26,6 +26,7 @@ SRC_URI += " \
     file://CVE-2026-111066_p2.patch \
     file://CVE-2026-111750.patch \
     file://CVE-2026-111749.patch \
+    file://CVE-2026-111065.patch \
 "
 
 CVE_PRODUCT = "aiohttp:aiohttp"
-- 
2.35.6

