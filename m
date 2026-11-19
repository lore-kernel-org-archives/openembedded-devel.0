Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1898.1795113471875619374
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=kugwcANC;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd69954c755so47529a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113471; x=1795718271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SAF7qDbL8eA6kMUKZU8F1PSUIQVQEg3hxxtPho6fm+0=;
        b=kugwcANCU+1Oc1HWK7UUlwzZ/8ijaBwks54zp4swgWjpBfXVf41vx0FVNqD1mEHGrO
         /PRPr3pqzayftuYv/KLjGfeDdfeo+CJkeWAXkZb5A9lmldT8A8zKMm6H6Elo6ONfaIWC
         rpC66sSVs/p+QPp762/kXU7LgecXmf/tRndln/GnX2HR+hTO1FMSygPO2QPjwGmAtJQh
         r+WH6TgAsMX7FYp3rqXj7NlJRKJpDFmDPKZMVnhZ02uV8mqjmAioSWtsDcxycpAwJknh
         Y8lX0St/1sOwuORZu3SeOV3lwQ+uPWSYjCK/P3GcZW5YtRj5PRkmq2ek1qbiwKahRCAI
         1Ilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113471; x=1795718271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SAF7qDbL8eA6kMUKZU8F1PSUIQVQEg3hxxtPho6fm+0=;
        b=pD77NehFvDC8WV3ptFdah/lggHw/c5KvRCOkcfcCznlZLuOlustf3G4SW3prhNxYRs
         FeJpBT/iCfE4o9vd7+WM3kFtGucfBGkmgoDIk9HUewtwe7k5TpHVROid0YzAplaGnNMQ
         9RBO32EkcOEyezQmaOyLSK3ml7mgtGG3bpETm/21hU9jAMJv+zNmKQUtEZ5yIG2X4XMq
         HAiqUVtoonBCyvawtwgv3Lcbs8vVU/RrY3G3WzTP9ysuahAio1gn/hsxnzdI1Ec9Tcbm
         dD9q4wm9nvpaaVU88bvTF8RLJbDzQn4/VnVBI8MinO9EODX7uBQLSWMytE2nMrE6BBQR
         QgoA==
X-Gm-Message-State: APuU4Z9aQatMHoeh1eVEvC1qgtki7NzMq08J/zOBNuj4IjlgB/v8za++
	BBOs3XUgLg/6GHvpvHA8tx0iGWk3QfhB1a4GhDfnC7FiMrmDv/rlNH3XPNtaig==
X-Gm-Gg: AYBFou29gfz9kt084a2no+3DB+inOgHLwKn/InNqE1TAMbiVtKUGzgq4VQzbzJVpl0n
	JoXBEI72vPhYUY+VMcKdnrUVjm9eABUBjcb4Jv4yLAb3lqiVodv4T2pWpovLDz69iSg6CnwNHVT
	+LJkn0/EvLW32Gwp0cJIWmwUMk5ARoyAh9AXTHMo9ItMsrOiNN9MF01XlO3Urz1gZ90ouhFAFYF
	Dpl5oTxjt+vh2dZflqI8FuOiDVdJPrLeq8LRsZjq+rw+NdT8Di62I9WRk5EcQnny9sGDc67OJsR
	5AW65F1OAB4tXENc1czWW68XO5JQGG4TGFSDXuZyhyLLR4NyOtR1aiFgv1/T3zWZWEl+w3t/W0p
	XLAPwGy0m/D6geZD7vblpNxyiQX/YDqg/l3bJJC/f90tR+IIziag66JFHnMUrAb/sIjjhocVDxA
	Zb7suUTON+Nwl9OodWzW/lSZIP/i6vaLeuNlOad9ByA8fNscaza/A5wRSGnKa878oDBTIPyXKEH
	0FHltsOdc+cjqUiKev4mGAePSdyvU1fiepkRYEdZ2myqP656AUXmNw8b3Vmavu7wBSn+k5srR/l
	I4PY10wLfaxODxxYxPKGcIaUPval+NkWdzAjk4roC5HK3cnc9Tc99zQmSOb+/w==
X-Received: by 2002:a05:6a20:a128:b0:3eb:af80:78c4 with SMTP id adf61e73a8af0-401493a6873mr592753637.3.1795113471148;
        Thu, 19 Nov 2026 10:37:51 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:37:50 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 46/64] python3-aiohttp: patch CVE-2026-111065
Date: Fri, 20 Nov 2026 07:33:14 +1300
Message-ID: <b06e0a035ce5a39561b3dd0526cce70f24eaf4af.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:37:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132736
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-111065

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-aiohttp/CVE-2026-111065.patch     | 172 ++++++++++++++++++
 .../python/python3-aiohttp_3.14.3.bb          |   4 +-
 2 files changed, 175 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111065.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111065.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111065.patch
new file mode 100644
index 0000000000..affe7e62a9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111065.patch
@@ -0,0 +1,172 @@
+From 16a92b236b34f86d3873e29292b78159dd3ff19f Mon Sep 17 00:00:00 2001
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
+(cherry picked from commit 9dd8eaf4e31f1237ef2c1574a8c82a739fca5805)
+
+CVE: CVE-2026-111065
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/9dd8eaf4e31f1237ef2c1574a8c82a739fca5805]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ CHANGES/13677.bugfix.rst        |  1 +
+ aiohttp/client.py               |  5 ++++
+ aiohttp/cookiejar.py            | 10 ++++++-
+ tests/test_client_functional.py | 46 ++++++++++++++++++++++++++++++++-
+ tests/test_cookiejar.py         | 22 ++++++++++++++++
+ 5 files changed, 82 insertions(+), 2 deletions(-)
+ create mode 100644 CHANGES/13677.bugfix.rst
+
+diff --git a/CHANGES/13677.bugfix.rst b/CHANGES/13677.bugfix.rst
+new file mode 100644
+index 000000000..bea67cba7
+--- /dev/null
++++ b/CHANGES/13677.bugfix.rst
+@@ -0,0 +1 @@
++Fixed a possible ``OverflowError`` on cookies and a connection not being closed properly -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/client.py b/aiohttp/client.py
+index 12f236d6c..df9fbd8c9 100644
+--- a/aiohttp/client.py
++++ b/aiohttp/client.py
+@@ -697,6 +697,7 @@ class ClientSession:
+ 
+         timer = tm.timer()
+         req: ClientRequest | None = None
++        resp: ClientResponse | None = None
+         try:
+             with timer:
+                 # https://www.rfc-editor.org/rfc/rfc9112.html#name-retrying-requests
+@@ -1020,6 +1021,10 @@ class ClientSession:
+                 handle.cancel()
+                 handle = None
+ 
++            if resp is not None:
++                # A failure occurred after the response was received.
++                resp.close()
++
+             if req is not None and req._body is not None:
+                 await req._body.close()
+ 
+diff --git a/aiohttp/cookiejar.py b/aiohttp/cookiejar.py
+index 0d2f3e05c..b949cc118 100644
+--- a/aiohttp/cookiejar.py
++++ b/aiohttp/cookiejar.py
+@@ -425,7 +425,15 @@ class CookieJar(AbstractCookieJar):
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
+index 639ca4606..f07104b81 100644
+--- a/tests/test_client_functional.py
++++ b/tests/test_client_functional.py
+@@ -15,7 +15,7 @@ import tarfile
+ import time
+ import zipfile
+ import zlib
+-from collections.abc import AsyncIterator, Awaitable, Callable
++from collections.abc import AsyncIterator, Awaitable, Callable, Sequence
+ from contextlib import suppress
+ from typing import Any, NoReturn
+ from unittest import mock
+@@ -3050,6 +3050,50 @@ async def test_set_cookies_max_age_overflow(aiohttp_client) -> None:
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
+index 9f279801b..be6da2a5f 100644
+--- a/tests/test_cookiejar.py
++++ b/tests/test_cookiejar.py
+@@ -2069,3 +2069,25 @@ async def test_cookie_jar_unsafe_property() -> None:
+ 
+     jar_unsafe = CookieJar(unsafe=True)
+     assert jar_unsafe.unsafe is True
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
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
index 3f97b89ef2..f3bb555408 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b5e9e27554f71f0f132919037cb967b2"
 
 SRC_URI[sha256sum] = "9491196535a88924a60afd5b5f434b5b203b6cc616250878dbdb223a8f7844bc"
 
-SRC_URI += "file://CVE-2026-111063.patch"
+SRC_URI += "file://CVE-2026-111063.patch \
+            file://CVE-2026-111065.patch \
+"
 
 CVE_PRODUCT = "aiohttp:aiohttp"
 CVE_STATUS_GROUPS = "CVE_AIOHTTP_FIX_3_13_4"
