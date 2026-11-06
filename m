Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1308.1793950038054130967
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 23:27:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=R9jWJc4R;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=16986; q=dns/txt;
  s=iport01; t=1793950038; x=1795159638;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=567aiopc1a9k4iALwzxhOAmCip3i2clPQlo9Art7Wuw=;
  b=R9jWJc4R4gR8XqV8uBKgeeca/PHHyi7IR2ZoaKAmWzC/qsTk73po7Vaq
   uN0lBayItHxDJpRZi6FVBwFIimoC4yHUTeRda9ydvJn1LDmbOgZKEUKKT
   twlOoD3lxuu8kyxamv/Q1jFkPkzuLrWR13G4iDnU6/dDZsBK/7zub5pZk
   TSqPYqWwN+t/m25yB5SVcBC3BNLvzdBmQzPBFAB50EwStGoL1IJ4CHcKi
   h8t9Cc5ZFjIVyttL+eiC38uZnPwMQmYnlPrv5mrU5JddqCDe4Q98yGOpo
   n4S+h5nDBzIR6607rEFZP5N2luLjsW0U0DT54vt/ePnEoshKzcWV80FBH
   A==;
X-CSE-ConnectionGUID: svxaopVbRiu5xSfmBS81bA==
X-CSE-MsgGUID: 2S8GvHaFRFOw2BxCJENx3A==
X-IPAS-Result: =?us-ascii?q?A0BJAgDmf+1q/47/Ja1aglmCV3VgQ0kDlkgDgx2bBIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOHQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEZLRAcAgEBAi8kByMIGYMCAYJxAwMRRrtMg?=
 =?us-ascii?q?XkzgQGDKoFU2zMBCxQBgTiBc4NNiCNdGAFEhDkIHxsbgXKBFYE7gi6BBYFcA?=
 =?us-ascii?q?oFIhl4Egg0VgQyBWoEDgiKJcwKBUYZ5SIEeA1ksAVUTDQoLBwWBaAM1EioVb?=
 =?us-ascii?q?jIdgSM+F4EHGwYFgR2BHoESgQddgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJ?=
 =?us-ascii?q?UMSRyQiCBIJARMaLAqBGjU8CSY/FQxkCxoFYQgCDQx0ORAwHiQvBRwmPhsKL?=
 =?us-ascii?q?xgNSBEsNxUZBD5uB5I9gxIBLDQtASoBBHshgQcBBAYBBwENApMZkj+hEQoog?=
 =?us-ascii?q?3iMJJU6GjOFW6UWC5h9hVODLoI2glOCYQaGHYx9A02EaYFoPIFZcBU7gmcJS?=
 =?us-ascii?q?hkPYY1Yg2uFZMZNJjICCQMvAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:QP0wHas2JPTFIuBJoe95eI1oK+fnVAZfMUV32f8akzHdYApBsoF/q
 tZmKWuAMquJY2T3ftsgaIXn/U5Q6pGHz9ZrHgc4/nswFi5EgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvb9Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw4fhnCGZWy
 /YiKS1QfiuNgsiNkOuxY7w57igjBJGD0II3oHpsy3TdSP0hW52GG/iM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtNYH49tL/Aan3Xfz5VrFuUtKMf6GnIxws327/oWDbQUoHWGZwNxRbG+
 woq+UyjOUE1KvyW5wCr1W32rP/kvw7dSNk7QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZNZottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:2CnOL65IPj6Y5YTb+QPXwOrXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: 9a23:bYePx2GG7JMsblLKqmJ86l4dHdgbeEfc0SrAGEG9I105Ebe8HAo=
X-Talos-MUID: 9a23:z6DlKQVW97tuHMHq/GXX1B58FM5G2YqJFxongb4klu+UbgUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="544103865"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 07:27:17 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id D9EA41800036A;
	Fri,  6 Nov 2026 07:27:16 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 3892CCBF234; Thu,  5 Nov 2026 23:27:16 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 6/7] python3-aiohttp: fix CVE-2026-111063
Date: Thu,  5 Nov 2026 23:27:01 -0800
Message-Id: <20261106072702.502813-7-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106072702.502813-1-dkelaiya@cisco.com>
References: <20261106072702.502813-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 06 Nov 2026 07:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131969
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the Secure shared-cookie fix [1] to aiohttp 3.13.5, as
identified by [3]. Apply the Secure check before looking up cached
shared morsels so an earlier HTTPS request cannot bypass it.

Include the upstream trusted-origin correction [2] so per-request
cookies retain the session jar's treat_as_secure_origin policy.
The default property keeps existing custom cookie jars compatible.
Include the upstream cookie and client regression tests.

[1] https://github.com/aio-libs/aiohttp/commit/999c356d61e966faffa97b06ab0d0455226d36c5
[2] https://github.com/aio-libs/aiohttp/commit/95081f8a353be2873643ab6dd74904ca413e45e0
[3] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-494j-54xm-rwp3

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-111063_p1.patch  | 137 ++++++++++
 .../python3-aiohttp/CVE-2026-111063_p2.patch  | 244 ++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |   2 +
 3 files changed, 383 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063_p2.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063_p1.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063_p1.patch
new file mode 100644
index 0000000000..f66cdf7d53
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063_p1.patch
@@ -0,0 +1,137 @@
+From 999c356d61e966faffa97b06ab0d0455226d36c5 Mon Sep 17 00:00:00 2001
+From: "patchback[bot]" <45432694+patchback[bot]@users.noreply.github.com>
+Date: Sun, 27 Sep 2026 21:27:34 +0100
+Subject: [PATCH] [PR #13830/e11d2836 backport][3.14] Fix secure shared cookie
+ (#13832)
+
+**This is a backport of PR #13830 as merged into master
+(e11d2836203a21bec59095498e578d37801027e7).**
+
+Co-authored-by: Sam Bull <git@sambull.org>
+
+CVE: CVE-2026-111063
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/999c356d61e966faffa97b06ab0d0455226d36c5]
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
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
+index 0000000..2a39769
+--- /dev/null
++++ b/CHANGES/13830.bugfix.rst
+@@ -0,0 +1 @@
++Fixed ``CookieJar.filter_cookies()`` sending shared cookies (cookies without a ``Domain`` attribute) marked ``Secure`` over unencrypted connections -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/cookiejar.py b/aiohttp/cookiejar.py
+index 6712b90..78630b5 100644
+--- a/aiohttp/cookiejar.py
++++ b/aiohttp/cookiejar.py
+@@ -471,6 +471,9 @@ class CookieJar(AbstractCookieJar):
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
+index 63ee375..24f9088 100644
+--- a/docs/client_reference.rst
++++ b/docs/client_reference.rst
+@@ -2464,7 +2464,8 @@ Utilities
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
+index e429f8c..e04017c 100644
+--- a/docs/spelling_wordlist.txt
++++ b/docs/spelling_wordlist.txt
+@@ -350,6 +350,7 @@ un
+ unawaited
+ unclosed
+ undercounting
++unencrypted
+ unescaped
+ unhandled
+ unicode
+diff --git a/tests/test_client_functional.py b/tests/test_client_functional.py
+index 3415b83..a92d008 100644
+--- a/tests/test_client_functional.py
++++ b/tests/test_client_functional.py
+@@ -2843,12 +2843,17 @@ async def test_morsel_with_attributes(aiohttp_client) -> None:
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
+index 9a061a3..d4bfdcc 100644
+--- a/tests/test_cookiejar.py
++++ b/tests/test_cookiejar.py
+@@ -1155,6 +1155,34 @@ async def test_treat_as_secure_origin() -> None:
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
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063_p2.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063_p2.patch
new file mode 100644
index 0000000000..b71f531a36
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063_p2.patch
@@ -0,0 +1,244 @@
+From 95081f8a353be2873643ab6dd74904ca413e45e0 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Mon, 28 Sep 2026 00:38:13 +0100
+Subject: [PATCH] Fix treat_as_secure_origin on request cookies (#13833)
+ (#13836)
+
+(cherry picked from commit 6bc84990f2a6429667f741d97f5da22884b8a8d3)
+
+CVE: CVE-2026-111063
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/95081f8a353be2873643ab6dd74904ca413e45e0]
+
+Backport Changes:
+- Apply to aiohttp 3.13.5 and retain its Union type spelling.
+- Pass trusted origins through the existing quote_cookie constructor
+  context without adding the newer unsafe inspection API.
+- Add the property documentation beside the existing attributes;
+  the newer public cookie-inspection sections are absent.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/13833.bugfix.rst        |  1 +
+ aiohttp/abc.py                  |  5 ++++
+ aiohttp/client.py               |  5 +++-
+ aiohttp/cookiejar.py            | 26 +++++++++++------
+ docs/client_reference.rst       | 13 +++++++--
+ tests/test_client_functional.py | 49 +++++++++++++++++++++++++++++++++
+ tests/test_cookiejar.py         |  3 +-
+ 7 files changed, 89 insertions(+), 13 deletions(-)
+ create mode 100644 CHANGES/13833.bugfix.rst
+
+diff --git a/CHANGES/13833.bugfix.rst b/CHANGES/13833.bugfix.rst
+new file mode 100644
+index 0000000..2d0f96c
+--- /dev/null
++++ b/CHANGES/13833.bugfix.rst
+@@ -0,0 +1 @@
++Fixed per-request cookies (the ``cookies`` argument of a request method) marked ``Secure`` not being sent to origins listed in ``CookieJar``'s ``treat_as_secure_origin`` -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/abc.py b/aiohttp/abc.py
+index faf0957..82afc6c 100644
+--- a/aiohttp/abc.py
++++ b/aiohttp/abc.py
+@@ -182,6 +182,11 @@ class AbstractCookieJar(Sized, IterableBase):
+     def quote_cookie(self) -> bool:
+         """Return True if cookies should be quoted."""
+ 
++    @property
++    def treat_as_secure_origin(self) -> frozenset[URL]:
++        """Return origins considered secure even over cleartext connections."""
++        return frozenset()
++
+     @abstractmethod
+     def clear(self, predicate: Optional[ClearCookiePredicate] = None) -> None:
+         """Clear all cookies if no predicate is passed."""
+diff --git a/aiohttp/client.py b/aiohttp/client.py
+index f404b55..1eae60a 100644
+--- a/aiohttp/client.py
++++ b/aiohttp/client.py
+@@ -692,7 +692,10 @@ class ClientSession:
+ 
+                     if cookies is not None:
+                         tmp_cookie_jar = CookieJar(
+-                            quote_cookie=self._cookie_jar.quote_cookie
++                            quote_cookie=self._cookie_jar.quote_cookie,
++                            treat_as_secure_origin=frozenset(
++                                self._cookie_jar.treat_as_secure_origin
++                            ),
+                         )
+                         tmp_cookie_jar.update_cookies(cookies)
+                         req_cookies = tmp_cookie_jar.filter_cookies(url)
+diff --git a/aiohttp/cookiejar.py b/aiohttp/cookiejar.py
+index 78630b5..3b2c490 100644
+--- a/aiohttp/cookiejar.py
++++ b/aiohttp/cookiejar.py
+@@ -129,7 +129,7 @@ class CookieJar(AbstractCookieJar):
+         *,
+         unsafe: bool = False,
+         quote_cookie: bool = True,
+-        treat_as_secure_origin: Union[StrOrURL, List[StrOrURL], None] = None,
++        treat_as_secure_origin: Union[StrOrURL, Iterable[StrOrURL], None] = None,
+         loop: Optional[asyncio.AbstractEventLoop] = None,
+     ) -> None:
+         super().__init__(loop=loop)
+@@ -144,17 +144,20 @@ class CookieJar(AbstractCookieJar):
+         self._unsafe = unsafe
+         self._quote_cookie = quote_cookie
+         if treat_as_secure_origin is None:
+-            treat_as_secure_origin = []
++            self._treat_as_secure_origin: frozenset[URL] = frozenset()
+         elif isinstance(treat_as_secure_origin, URL):
+-            treat_as_secure_origin = [treat_as_secure_origin.origin()]
++            self._treat_as_secure_origin = frozenset({treat_as_secure_origin.origin()})
+         elif isinstance(treat_as_secure_origin, str):
+-            treat_as_secure_origin = [URL(treat_as_secure_origin).origin()]
++            self._treat_as_secure_origin = frozenset(
++                {URL(treat_as_secure_origin).origin()}
++            )
+         else:
+-            treat_as_secure_origin = [
+-                URL(url).origin() if isinstance(url, str) else url.origin()
+-                for url in treat_as_secure_origin
+-            ]
+-        self._treat_as_secure_origin = treat_as_secure_origin
++            self._treat_as_secure_origin = frozenset(
++                {
++                    URL(url).origin() if isinstance(url, str) else url.origin()
++                    for url in treat_as_secure_origin
++                }
++            )
+         self._expire_heap: List[Tuple[float, Tuple[str, str, str]]] = []
+         self._expirations: Dict[Tuple[str, str, str], float] = {}
+ 
+@@ -162,6 +165,11 @@ class CookieJar(AbstractCookieJar):
+     def quote_cookie(self) -> bool:
+         return self._quote_cookie
+ 
++    @property
++    def treat_as_secure_origin(self) -> frozenset[URL]:
++        """Return origins considered secure even over cleartext connections."""
++        return self._treat_as_secure_origin
++
+     def save(self, file_path: PathLike) -> None:
+         """Save cookies to a file using JSON format.
+ 
+diff --git a/docs/client_reference.rst b/docs/client_reference.rst
+index 24f9088..353047d 100644
+--- a/docs/client_reference.rst
++++ b/docs/client_reference.rst
+@@ -2441,7 +2441,7 @@ Utilities
+       .. versionadded:: 3.7
+ 
+    :param treat_as_secure_origin: (optional) Mark origins as secure
+-                                  for cookies marked as Secured. Possible types are
++                                  for cookies marked as Secured.
+ 
+                                   Possible types are:
+ 
+@@ -2465,7 +2465,8 @@ Utilities
+          cookies*.  Regular cookies are coupled with server's URL and
+          are sent only to this server, shared ones are sent in every
+          client request (except that shared cookies marked ``Secure``
+-         are only sent over encrypted connections).
++         are only sent over encrypted connections or to origins listed
++         in *treat_as_secure_origin*).
+ 
+    .. method:: filter_cookies(request_url)
+ 
+@@ -2521,6 +2522,14 @@ Utilities
+ 
+       .. versionadded:: 4.0
+ 
++   .. attribute:: treat_as_secure_origin
++
++      A :class:`frozenset` of :class:`~yarl.URL` origins that are
++      treated as secure even when the connection is not encrypted, as
++      configured by the *treat_as_secure_origin* parameter.
++
++      .. versionadded:: 3.14.4
++
+ 
+ .. class:: DummyCookieJar(*, loop=None)
+ 
+diff --git a/tests/test_client_functional.py b/tests/test_client_functional.py
+index a92d008..e0bb02e 100644
+--- a/tests/test_client_functional.py
++++ b/tests/test_client_functional.py
+@@ -2859,6 +2859,55 @@ async def test_morsel_with_attributes(aiohttp_client) -> None:
+         assert 200 == resp.status
+ 
+ 
++async def test_request_secure_cookie_treat_as_secure_origin(
++    aiohttp_server: AiohttpServer, aiohttp_client: AiohttpClient
++) -> None:
++    """Per-request Secure cookies must honor the session jar's trusted origins."""
++
++    async def handler(request: web.Request) -> web.Response:
++        assert request.cookies.get("auth") == "token"
++        return web.Response()
++
++    app = web.Application()
++    app.router.add_get("/", handler)
++    server = await aiohttp_server(app)
++
++    jar = aiohttp.CookieJar(unsafe=True, treat_as_secure_origin=[server.make_url("/")])
++    client = await aiohttp_client(server, cookie_jar=jar)  # type: ignore[var-annotated]
++
++    c: http.cookies.Morsel[str] = http.cookies.Morsel()
++    c.set("auth", "token", "token")
++    c["secure"] = True
++
++    async with client.get("/", cookies={"auth": c}) as resp:
++        assert resp.status == 200
++
++
++async def test_request_secure_cookie_not_sent_over_http(
++    aiohttp_client: AiohttpClient,
++) -> None:
++    """A per-request Secure cookie is only sent to the jar's trusted origins."""
++
++    async def handler(request: web.Request) -> web.Response:
++        assert request.cookies.keys() == {"plain"}
++        return web.Response()
++
++    app = web.Application()
++    app.router.add_get("/", handler)
++    # The trusted origin never matches the test server, so the Secure
++    # cookie must still be withheld from this plain-http request.
++    jar = aiohttp.CookieJar(treat_as_secure_origin=[URL("http://example.com")])
++    client = await aiohttp_client(app, cookie_jar=jar)
++
++    c: http.cookies.Morsel[str] = http.cookies.Morsel()
++    c.set("auth", "token", "token")
++    c["secure"] = True
++
++    cookies: dict[str, str | http.cookies.Morsel[str]] = {"auth": c, "plain": "ok"}
++    async with client.get("/", cookies=cookies) as resp:
++        assert resp.status == 200
++
++
+ async def test_set_cookies(
+     aiohttp_client: AiohttpClient, caplog: pytest.LogCaptureFixture
+ ) -> None:
+diff --git a/tests/test_cookiejar.py b/tests/test_cookiejar.py
+index d4bfdcc..4c7107c 100644
+--- a/tests/test_cookiejar.py
++++ b/tests/test_cookiejar.py
+@@ -830,6 +830,7 @@ async def test_dummy_cookie_jar() -> None:
+     cookie = SimpleCookie("foo=bar; Domain=example.com;")
+     dummy_jar = DummyCookieJar()
+     assert dummy_jar.quote_cookie is True
++    assert dummy_jar.treat_as_secure_origin == frozenset()
+     assert len(dummy_jar) == 0
+     dummy_jar.update_cookies(cookie)
+     assert len(dummy_jar) == 0
+@@ -1134,7 +1135,7 @@ async def test_pickle_format(cookies_to_send) -> None:
+ )
+ async def test_treat_as_secure_origin_init(url) -> None:
+     jar = CookieJar(unsafe=True, treat_as_secure_origin=url)
+-    assert jar._treat_as_secure_origin == [URL("http://127.0.0.1")]
++    assert jar.treat_as_secure_origin == frozenset({URL("http://127.0.0.1")})
+ 
+ 
+ async def test_treat_as_secure_origin() -> None:
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index 10817e6f34..c6167ef607 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -29,6 +29,8 @@ SRC_URI += " \
     file://CVE-2026-111065.patch \
     file://CVE-2026-111748_p1.patch \
     file://CVE-2026-111748_p2.patch \
+    file://CVE-2026-111063_p1.patch \
+    file://CVE-2026-111063_p2.patch \
 "
 
 CVE_PRODUCT = "aiohttp:aiohttp"
-- 
2.35.6
