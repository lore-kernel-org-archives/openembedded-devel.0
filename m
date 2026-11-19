Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1946.1795113469405207225
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Z4hUpYG2;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so919982b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113469; x=1795718269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LSJSGAJPx03D7Tpd3VpFQct2bfESpAi2T5mLwdAAEZE=;
        b=Z4hUpYG2J8ZdSRDLcZLzOEc2RDRDm6ZG+r30u1RV4I743q1weHl9C7s+WR1u/p4k8B
         mfbEJnOYTBeSDe8LckZnAh+vqSpLyJTKf2uIhSQb7jbepdczhzdXLfdpd5GKcpENGEnW
         91nPnsqHKX+z5qsXSah8XyQk6Ph4OTqLSSsyLcDth2zTDPa4G38LaeQx/ZryLMndkF2U
         PqzIDxDihQKBrdq+CPNKdTpWbIDfrXOYsUdUT4mxV4QiN75rjonFXR5rdy1DcMgJWAT5
         HgFgIH40/pUkDY0AEptEGg2/rEfysoCnEtQ4SffvK+ussW9SG0wThz9Y7puOSmjkNeiB
         xtgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113469; x=1795718269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LSJSGAJPx03D7Tpd3VpFQct2bfESpAi2T5mLwdAAEZE=;
        b=JgzrrBhG0wIJZqibfNhuOkPGmwiwX4yRdQNjhzhmRnFakt3BeY8jRiev1WHrHJF4UN
         hEZHRJghknN73ca1Frbtw1xG5Vp+B5QHXor8xpapFNea55lXfmaL3Nqfmi5asthqB9VH
         LWRInz8R7bLeBaG6bs1CiuWHEflrP1vR6JiXbvKyNJ+osrY9DEhc0q/T4Dc9HOFd81jX
         OaktSrkATRnT7ExK3oVCT+192VxfrjeMJAiABuYxEIp8abTa9vBHVvu7Q5+iIG0dfTNS
         3XIhQc7P3BG0xlGMmCtJisdDTsb91cqUW1+fJF1QQLD0nJhLk9LIm/xhpfD6+gtkizO8
         5YnA==
X-Gm-Message-State: APuU4Z+fSOGLILPvKu3DBIo2sRIds2i4QsuBXUPFw4xA1Qe9Z8nz4GBM
	tk2umOF0osCJ2s21KXgJytmn+K/is+vU48vag9T6+2EtRFUvpj+NyWNYSbS8ZA==
X-Gm-Gg: AYBFou3RBW4JFpuR6e26W1Kh86CgaI2R3RgTBOZ0Hdb+08QCvgT+ZDnwRKYi4ctEc1f
	AveGXZOxVJU9G1mEm/BmQ9NhP0ggiA4RKw9icAwnYWOfCuqClioXUdR778WfdblmvCA9h6xc9Mi
	Gn5352AaeCBJjIxfMaicRZ+gMGpAhtUN2j0ndFUY0+IPlgldC3l0UCzc0QZZ9uNpoBFGdHXdplH
	4nTsA4ywGTMIZ2iFOrV/o1ynwH0lV12BwqpSOypt+Ter0tY/JsCX52U5j4Mq4Jn//pDIvTXSNYb
	8PJvdjBc3tr78P+iR4PGE/iF5rlHfzUEvRJJeQiXRtcaufv+5JzOYx+p9+aInVm76+xEgb97Fds
	uMKPHBFmrVzYjHKgAGD3ScYlWyNATCfHE/ytE78WlrV9Sr4T0hmAq5D322tHaI/aZOeux3q+qh3
	1p7k53OpcnS2FjvBy9t2JKzRPTT2t8dgBJ45vKoi482LqEakkfmbYu30hPTuUCyjP2BOOdiKc19
	Seim0vRym4CW2woew6H3WZGk/+Ak0N+Or7H0TTktsjGfgAdFvjz5pkZ/A18ZIr9r5jcku+PPdLA
	gGR/Q3U4IaG6Z3zF4XQ68oXvl3a4+a4cl3uoMqSDUdpgCrH01E37YlVLqY1Uig==
X-Received: by 2002:a05:6a00:3d44:b0:8a0:5eff:ad5b with SMTP id d2e1a72fcca58-8c7ddfafeecmr1358317b3a.33.1795113468690;
        Thu, 19 Nov 2026 10:37:48 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:37:48 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 45/64] python3-aiohttp: patch CVE-2026-111063
Date: Fri, 20 Nov 2026 07:33:13 +1300
Message-ID: <817f4398c2204be3d9f9ce75c424f02eb58597f6.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:37:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132735
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
