Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6940.1794458697613581767
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 20:44:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=tqSXP6ku;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc751eddf25so2075943a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 20:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458697; x=1795063497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LSJSGAJPx03D7Tpd3VpFQct2bfESpAi2T5mLwdAAEZE=;
        b=tqSXP6kuAZ98EjINd3msHIORRT2pyckn17bjq18lCfncC8nDUL62i7SYnMZRy5sF9/
         Jw55wR50AsqjK1uQsBswq82K3DhZgD3b6xhcyUNaYn+0uqQo0z0gIxyzbfQQawItdZEV
         QXlVXH8KB+E06nYjEQIkuspwnKYkOovddt5jD1D3jjkSgj47kMCT36//N0zKf1MiRzUp
         kjwPfpv3/c87UwglKf0tZhVewuFsLnG+TajwW7eAAZHVEtUfwWFLOoT2vzZ2zF5MTibc
         6HiIkQdZkF8i1zHF5BQUDZQH44B08zeS+zuu4XZjpw+dcteMRklkybL3LJA7Ukb/1b/x
         nRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458697; x=1795063497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LSJSGAJPx03D7Tpd3VpFQct2bfESpAi2T5mLwdAAEZE=;
        b=OTujW7PleSQ2JT9/39eHPn5rTyZN5N+9/1pXJrvumdESyNNAN0YyF+Cpehd4SEabUb
         q9LHovfD6DfmmYkVbZrTM52Dmp+NmLNEdrfcD4KErlGz7vS6dhEBd6R6iJbI3ws9Lfws
         QJV8IAeYJXAkPT/MVIrQkbnHjQE7fn387vwKnTAMqdjTQpaGWCvDrXmHJUTo2WuKlrBp
         raIxlwae+ZqZN2BcqqDyu5bW2cLBKO63xqbZW58kA5Yu9JApoNReLiogW2I9VsXj1xRJ
         IVNPcDvT8G4DwGjcs10Hsh814EqPkD61EjC+xXTiLkHtrLbk8e6132EcXhD/PSLnBdC4
         gq5A==
X-Gm-Message-State: APuU4Z/omZCS/ZBQT5mOaRaGQQSqh+osaxLHbGI/8b5ibTnX5YklB1lR
	kYBYUfhjsJdBh0iHwo3rGuN8Flu26n+ZcXCPeZrsuEcom7lgJN4vUY5PmLKrvA==
X-Gm-Gg: AYBFou1+vyRJt5deQciTbzqTsESXmgAmbLlghrRzi2MQnjYOwSYFr3nKyufojXhgpnC
	xPCXr0GH1UdMLpo1iyChZC2oe+3s/C4GXFRQ42UyzmVJBc48oj4Rh/9udeHzKVDpi7HmL/SvVVv
	zLsrZP9vE+GB1w05jrxNfGDat65M932ktCetAOfms5lvXj63BnPAO7tpRhLjbYioECfd/lVc3gJ
	PDXO3xzlVYWnoBMYeQIYdB7YWY+vCoVxJyxXmb8Pql/MPa5OjPgGeaZgcgOb8EV1WQqdGX+6djK
	2LcXLR4ty2aGB5ELtoJ0j5T1IPLn5PjBjRnb/pZBYA7yl5rSK5FT8EaBAjE2BUH91yAFGnZJdmg
	PuW776i0SztkMgki7BEPX1s6wqU1kSz++Il5m2HR+7W2zZPsNwy7hiRA86Syt/FtPmQI6SclN5z
	RiosC/pCmNTyT1/sq0RiZfaPEkqDUqS8yZaaiUOLk1flPAfPu0W8tG8LEOy8c3VPBGs3RnrRAyh
	+lDzLOHIPQHars/mlWiXA/gYPWCrjQN+Gr48x71qzEzbzjidQxQyFQPr7fwl8pUupBAV4ioryS5
	eJl2ajrYDwm1yC4QatjLdPBfJ7W93IqVWCOGDviuMTsSgJZcE+9FfTL6g6LaQw==
X-Received: by 2002:a17:90b:3ec1:b0:3ac:74b3:a8f3 with SMTP id 98e67ed59e1d1-3b182efb251mr4119112a91.44.1794458696734;
        Wed, 11 Nov 2026 20:44:56 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d7dd5bbsm2238527a12.30.2026.11.11.20.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:44:56 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][blacksail][PATCH 10/16] python3-aiohttp: patch CVE-2026-111063
Date: Thu, 12 Nov 2026 17:44:20 +1300
Message-ID: <20261112044426.3933391-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
References: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 04:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132161
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-111063

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-aiohttp/CVE-2026-111063.patch     | 136 ++++++++++++++++++
 .../python/python3-aiohttp_3.14.3.bb          |   2 +
 2 files changed, 138 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063.patch
new file mode 100644
index 0000000000..f9654a5a9b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063.patch
@@ -0,0 +1,136 @@
+From 2dcbe838baee9938cdf4f0b7a8c682b92913bb76 Mon Sep 17 00:00:00 2001
+From: "patchback[bot]" <45432694+patchback[bot]@users.noreply.github.com>
+Date: Sun, 27 Sep 2026 21:27:34 +0100
+Subject: [PATCH] [PR #13830/e11d2836 backport][3.14] Fix secure shared cookie
+ (#13832)
+
+**This is a backport of PR #13830 as merged into master
+(e11d2836203a21bec59095498e578d37801027e7).**
+
+Co-authored-by: Sam Bull <git@sambull.org>
+(cherry picked from commit 999c356d61e966faffa97b06ab0d0455226d36c5)
+
+CVE: CVE-2026-111063
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/999c356d61e966faffa97b06ab0d0455226d36c5]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ CHANGES/13830.bugfix.rst        |  1 +
+ aiohttp/cookiejar.py            |  3 +++
+ docs/client_reference.rst       |  3 ++-
+ docs/spelling_wordlist.txt      |  1 +
+ tests/test_client_functional.py |  9 +++++++--
+ tests/test_cookiejar.py         | 28 ++++++++++++++++++++++++++++
+ 6 files changed, 42 insertions(+), 3 deletions(-)
+ create mode 100644 CHANGES/13830.bugfix.rst
+
+diff --git a/CHANGES/13830.bugfix.rst b/CHANGES/13830.bugfix.rst
+new file mode 100644
+index 000000000..2a3976924
+--- /dev/null
++++ b/CHANGES/13830.bugfix.rst
+@@ -0,0 +1 @@
++Fixed ``CookieJar.filter_cookies()`` sending shared cookies (cookies without a ``Domain`` attribute) marked ``Secure`` over unencrypted connections -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/cookiejar.py b/aiohttp/cookiejar.py
+index 2b9722470..0d2f3e05c 100644
+--- a/aiohttp/cookiejar.py
++++ b/aiohttp/cookiejar.py
+@@ -478,6 +478,9 @@ class CookieJar(AbstractCookieJar):
+         # Send shared cookie
+         key = ("", "")
+         for c in self._cookies[key].values():
++            if is_not_secure and c["secure"]:
++                continue
++
+             # Check cache first
+             if c.key in self._morsel_cache[key]:
+                 filtered[c.key] = self._morsel_cache[key][c.key]
+diff --git a/docs/client_reference.rst b/docs/client_reference.rst
+index 734201128..a237fb64b 100644
+--- a/docs/client_reference.rst
++++ b/docs/client_reference.rst
+@@ -2544,7 +2544,8 @@ Utilities
+       :param ~yarl.URL response_url: URL of response, ``None`` for *shared
+          cookies*.  Regular cookies are coupled with server's URL and
+          are sent only to this server, shared ones are sent in every
+-         client request.
++         client request (except that shared cookies marked ``Secure``
++         are only sent over encrypted connections).
+ 
+    .. method:: filter_cookies(request_url)
+ 
+diff --git a/docs/spelling_wordlist.txt b/docs/spelling_wordlist.txt
+index 24561f52d..88638bf12 100644
+--- a/docs/spelling_wordlist.txt
++++ b/docs/spelling_wordlist.txt
+@@ -369,6 +369,7 @@ un
+ unawaited
+ unclosed
+ undercounting
++unencrypted
+ unescaped
+ unhandled
+ unicode
+diff --git a/tests/test_client_functional.py b/tests/test_client_functional.py
+index 9470876d0..639ca4606 100644
+--- a/tests/test_client_functional.py
++++ b/tests/test_client_functional.py
+@@ -2909,12 +2909,17 @@ async def test_morsel_with_attributes(aiohttp_client) -> None:
+     c = http.cookies.Morsel()
+     c.set("test3", "456", "456")
+     c["httponly"] = True
+-    c["secure"] = True
+     c["max-age"] = 1000
+ 
++    # A Secure shared cookie must be withheld entirely: the test server
++    # is plain http, so it must not reach the handler at all.
++    c2: http.cookies.Morsel[str] = http.cookies.Morsel()
++    c2.set("test4", "789", "789")
++    c2["secure"] = True
++
+     app = web.Application()
+     app.router.add_get("/", handler)
+-    client = await aiohttp_client(app, cookies={"test2": c})
++    client = await aiohttp_client(app, cookies={"test2": c, "test4": c2})
+ 
+     async with client.get("/") as resp:
+         assert 200 == resp.status
+diff --git a/tests/test_cookiejar.py b/tests/test_cookiejar.py
+index 9276ff252..9f279801b 100644
+--- a/tests/test_cookiejar.py
++++ b/tests/test_cookiejar.py
+@@ -1206,6 +1206,34 @@ async def test_treat_as_secure_origin() -> None:
+     assert len(filtered_cookies) == 1
+ 
+ 
++async def test_treat_as_secure_origin_sends_secure_shared_cookie() -> None:
++    endpoint = URL("http://127.0.0.1/")
++
++    jar = CookieJar(unsafe=True, treat_as_secure_origin=[endpoint])
++    jar.update_cookies(SimpleCookie("shared-secure-cookie=first; Secure;"))
++
++    filtered_cookies = jar.filter_cookies(request_url=endpoint)
++    assert "shared-secure-cookie" in filtered_cookies
++
++
++async def test_filter_cookies_with_secure_shared_cookie() -> None:
++    """Secure shared cookies (no Domain attribute) must not be sent over cleartext."""
++    jar = CookieJar()
++    jar.update_cookies(
++        SimpleCookie("shared-secure-cookie=first; Secure; shared-cookie=second;")
++    )
++
++    filtered = jar.filter_cookies(URL("http://example.com/"))
++    assert set(filtered.keys()) == {"shared-cookie"}
++
++    filtered = jar.filter_cookies(URL("https://example.com/"))
++    assert set(filtered.keys()) == {"shared-cookie", "shared-secure-cookie"}
++
++    # The morsel cached by the https request must not bypass the Secure check.
++    filtered = jar.filter_cookies(URL("http://example.com/"))
++    assert set(filtered.keys()) == {"shared-cookie"}
++
++
+ async def test_filter_cookies_does_not_leak_memory() -> None:
+     """Test that filter_cookies doesn't create empty cookie entries.
+ 
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
index b862076869..3f97b89ef2 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b5e9e27554f71f0f132919037cb967b2"
 
 SRC_URI[sha256sum] = "9491196535a88924a60afd5b5f434b5b203b6cc616250878dbdb223a8f7844bc"
 
+SRC_URI += "file://CVE-2026-111063.patch"
+
 CVE_PRODUCT = "aiohttp:aiohttp"
 CVE_STATUS_GROUPS = "CVE_AIOHTTP_FIX_3_13_4"
 CVE_AIOHTTP_FIX_3_13_4[status] = "fixed-version: fixed in 3.13.4"
