Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36181.1795583900815576708
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Wc1OPS73;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=16930; q=dns/txt;
  s=iport01; t=1795583901; x=1796793501;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oT5pHQk9Emw5jieJxzmDN59cAy466KnCPrtFVOiLi2Y=;
  b=Wc1OPS73ZLs5cZWbd+WCTGla85K7r4UsKz9Hr6tlfnYF8DLo/GHR3AD5
   r1WFtkAIcPVW8LQhJt+Fim0LhEW3RFAhqvLQN+FS64kFhyVMUwl7/kL1S
   H9QPIHqSJ/FhidZN4MALnvECdJzAUsmu7+5XrpH5HpL1+8wFIJMln5EsR
   LnhzsABHdVyBRAAHyZRhhc9NB5vfOXpq1Yqa2ieej6Lt/4sR6qbHg/bqS
   RGYwEMI0N7SvGkht5fB7Gw5NYn4OVS460xu+2djjiwkWGte7dKVxcTqX6
   559vxH+PZi+7a89rOLRWQfZ2eZoCpkyFtSub1SEzN16lGIp9lbmSWuRFx
   Q==;
X-CSE-ConnectionGUID: aR6ipp5oRQazU/CzhYjRug==
X-CSE-MsgGUID: OpsE337aSlqaEJMikN6h6g==
X-IPAS-Result: =?us-ascii?q?A0BNAgCpbAZr/8xK/pBaglmCV3VgQ0kDlkgDgx2bDIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEZLRAcAgEBAi8kByMIGYMCAYJxAwMRRrk9g?=
 =?us-ascii?q?XkzgQGDKoFU2zMBCxQBgTiBc4NPiCVdGAFEhDoIHxsbgXKBFYE7gi+BBYFcA?=
 =?us-ascii?q?oFIhl4Egg0VgQyBVIECgiCJcQKBSYhSSIEeA1ksAVUTDQoLBwWBaAM1EioVb?=
 =?us-ascii?q?jIdgSM7F4EHGwYFgRyBHoESgQNdgSsoXQEhgQiBdQKCUYIAAgFJQQ4HRVMJJ?=
 =?us-ascii?q?UMSRyQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHCQvBRkmPBsKg?=
 =?us-ascii?q?QwnHR4ZDgIpBhYhCzQYDUgRLDcVGQQ+bgeUE4MbASw0LQEqAQR7IYEHAQQGA?=
 =?us-ascii?q?QcBDQIckn2QHYIhoREKKIN5jCSVOhozhVulFwuYfYs3glOCYQaGHYxJHBhQh?=
 =?us-ascii?q?GqBaDyBWXAVO4JnCUoZD2GNWINrhWTIdyYyAgkDLwEBBwIHDgMLgWiQACyBU?=
 =?us-ascii?q?gEB?=
IronPort-Data: A9a23:XDcBXqCoPJAFsRVW/37iw5YqxClBgxIJ4kV8jS/XYbTApGh0g2NVz
 2tKXj3TPq2IYTDwe41wa4qzoB9TsZ7dnddlOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCC+G+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb/gGYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEys8wDVkuYIoiw+9lPCZl5
 /wpKgoQYUXW7w626OrTpuhEj8k5ac2uN4QFtzQ4lnfSDO0tRtbIRKCiCd1whWtswJoTQbCBO
 4xDMWYHgBfoO3WjPn8bC586lea5j1H0ciZTrxSeoq9fD237klYgjeO2aIa9ltqiYt1Osx3D+
 Wv9+33wLzM/Nd+5lzrb/Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTWValrP2Rjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxMGHt4VGOog5UTVkezf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ22FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:rAQl6K3nHeBE0e2TsSzkggqjBJAkLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPGdXg2UK1XYANu5deXcGPTV7OQ==
X-Talos-CUID: =?us-ascii?q?9a23=3A8RWs82idTEeAZ/vtxc72PwIvHDJue0eDzW/Ifki?=
 =?us-ascii?q?CMG97dfq+W1+h+pl5nJ87?=
X-Talos-MUID: 9a23:HsXD9AsZukdZ0R0dG82noyl5GZwzvK2VDFkEvLcjusqiaywuNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62953304"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:18:16 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id 62BF81800020F;
	Wed, 25 Nov 2026 05:18:16 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 8E4D5CBEF8A; Tue, 24 Nov 2026 21:18:13 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 7/9] python3-aiohttp: fix CVE-2026-111063
Date: Tue, 24 Nov 2026 21:18:09 -0800
Message-Id: <20261125051811.2524271-8-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125051811.2524271-1-dkelaiya@cisco.com>
References: <20261125051811.2524271-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132974
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the Secure shared-cookie fix [1] to aiohttp 3.9.5, as
identified by [3]. Check Secure before the shared-cookie branch
adds the cookie to the outgoing set.

Include the trusted-origin correction [2] so per-request cookies
honor the session jar's treat_as_secure_origin policy. Keep the
existing constructor defaults for the temporary cookie jar.

[1] https://github.com/aio-libs/aiohttp/commit/999c356d61e966faffa97b06ab0d0455226d36c5
[2] https://github.com/aio-libs/aiohttp/commit/95081f8a353be2873643ab6dd74904ca413e45e0
[3] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-494j-54xm-rwp3

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-111063_p1.patch  | 122 +++++++++
 .../python3-aiohttp/CVE-2026-111063_p2.patch  | 257 ++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |   2 +
 3 files changed, 381 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063_p2.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063_p1.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063_p1.patch
new file mode 100644
index 0000000000..417103af7a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063_p1.patch
@@ -0,0 +1,122 @@
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
+Backport Changes:
+- Guard the existing shared-cookie branch in filter_cookies();
+  aiohttp 3.9.5 does not have a morsel cache.
+- Omit the upstream cache regression because aiohttp 3.9.5 has no
+  morsel cache. This also drops its ordinary HTTPS delivery check.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/13830.bugfix.rst        |  1 +
+ aiohttp/cookiejar.py            |  2 ++
+ docs/client_reference.rst       |  3 ++-
+ docs/spelling_wordlist.txt      |  1 +
+ tests/test_client_functional.py |  9 +++++++--
+ tests/test_cookiejar.py         | 10 ++++++++++
+ 6 files changed, 23 insertions(+), 3 deletions(-)
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
+index cb5593c..59ace3a 100644
+--- a/aiohttp/cookiejar.py
++++ b/aiohttp/cookiejar.py
+@@ -398,6 +398,8 @@ class CookieJar(AbstractCookieJar):
+ 
+             # Send shared cookies
+             if not domain:
++                if is_not_secure and cookie["secure"]:
++                    continue
+                 filtered[name] = cookie.value
+                 continue
+ 
+diff --git a/docs/client_reference.rst b/docs/client_reference.rst
+index 49a2dfe..38b0833 100644
+--- a/docs/client_reference.rst
++++ b/docs/client_reference.rst
+@@ -1924,7 +1924,8 @@ Utilities
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
+index 3fb6d35..e0703d9 100644
+--- a/docs/spelling_wordlist.txt
++++ b/docs/spelling_wordlist.txt
+@@ -331,6 +331,7 @@ UI
+ un
+ unawaited
+ unclosed
++unencrypted
+ unhandled
+ unicode
+ unittest
+diff --git a/tests/test_client_functional.py b/tests/test_client_functional.py
+index d695638..e18348d 100644
+--- a/tests/test_client_functional.py
++++ b/tests/test_client_functional.py
+@@ -2290,12 +2290,17 @@ async def test_morsel_with_attributes(aiohttp_client) -> None:
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
+index d9cb5b2..8f852eb 100644
+--- a/tests/test_cookiejar.py
++++ b/tests/test_cookiejar.py
+@@ -1018,6 +1018,16 @@ async def test_save_load_json_roundtrip(
+     assert saved_cookies == loaded_cookies
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
+ async def test_save_load_json_preserves_host_only_scope(tmp_path: Path) -> None:
+     """Verify save/load keeps host-only cookies off subdomains."""
+     file_path = tmp_path / "host_only.json"
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063_p2.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063_p2.patch
new file mode 100644
index 0000000000..0d8e90eea0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063_p2.patch
@@ -0,0 +1,257 @@
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
+- Keep Union annotations and drop the unused List import. Pass only
+  trusted origins to the temporary jar. The 3.9.5 API has no public
+  unsafe or quote_cookie properties.
+- Place the property beside existing methods and documentation;
+  the newer public cookie-inspection sections do not exist.
+- Import the existing AiohttpServer test fixture type.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/13833.bugfix.rst        |  1 +
+ aiohttp/abc.py                  |  5 ++++
+ aiohttp/client.py               |  6 +++-
+ aiohttp/cookiejar.py            | 27 ++++++++++-------
+ docs/client_reference.rst       | 13 +++++++--
+ tests/test_client_functional.py | 51 ++++++++++++++++++++++++++++++++-
+ tests/test_cookiejar.py         |  3 +-
+ 7 files changed, 91 insertions(+), 15 deletions(-)
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
+index ee83899..7dfbf5c 100644
+--- a/aiohttp/abc.py
++++ b/aiohttp/abc.py
+@@ -146,6 +146,11 @@ class AbstractCookieJar(Sized, IterableBase):
+     def __init__(self, *, loop: Optional[asyncio.AbstractEventLoop] = None) -> None:
+         self._loop = get_running_loop(loop)
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
+index 2e88917..103858a 100644
+--- a/aiohttp/client.py
++++ b/aiohttp/client.py
+@@ -540,7 +540,11 @@ class ClientSession:
+                     all_cookies = self._cookie_jar.filter_cookies(url)
+ 
+                     if cookies is not None:
+-                        tmp_cookie_jar = CookieJar()
++                        tmp_cookie_jar = CookieJar(
++                            treat_as_secure_origin=frozenset(
++                                self._cookie_jar.treat_as_secure_origin
++                            ),
++                        )
+                         tmp_cookie_jar.update_cookies(cookies)
+                         req_cookies = tmp_cookie_jar.filter_cookies(url)
+                         if req_cookies:
+diff --git a/aiohttp/cookiejar.py b/aiohttp/cookiejar.py
+index 59ace3a..60131c9 100644
+--- a/aiohttp/cookiejar.py
++++ b/aiohttp/cookiejar.py
+@@ -16,7 +16,6 @@ from typing import (  # noqa
+     Dict,
+     Iterable,
+     Iterator,
+-    List,
+     Mapping,
+     Optional,
+     Set,
+@@ -117,7 +116,7 @@ class CookieJar(AbstractCookieJar):
+         *,
+         unsafe: bool = False,
+         quote_cookie: bool = True,
+-        treat_as_secure_origin: Union[StrOrURL, List[StrOrURL], None] = None,
++        treat_as_secure_origin: Union[StrOrURL, Iterable[StrOrURL], None] = None,
+         loop: Optional[asyncio.AbstractEventLoop] = None,
+     ) -> None:
+         super().__init__(loop=loop)
+@@ -129,20 +128,28 @@ class CookieJar(AbstractCookieJar):
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
+         self._next_expiration: float = ceil(time.time())
+         self._expirations: Dict[Tuple[str, str, str], float] = {}
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
+index 38b0833..5bb290e 100644
+--- a/docs/client_reference.rst
++++ b/docs/client_reference.rst
+@@ -1901,7 +1901,7 @@ Utilities
+       .. versionadded:: 3.7
+ 
+    :param treat_as_secure_origin: (optional) Mark origins as secure
+-                                  for cookies marked as Secured. Possible types are
++                                  for cookies marked as Secured.
+ 
+                                   Possible types are:
+ 
+@@ -1925,7 +1925,8 @@ Utilities
+          cookies*.  Regular cookies are coupled with server's URL and
+          are sent only to this server, shared ones are sent in every
+          client request (except that shared cookies marked ``Secure``
+-         are only sent over encrypted connections).
++         are only sent over encrypted connections or to origins listed
++         in *treat_as_secure_origin*).
+ 
+    .. method:: filter_cookies(request_url)
+ 
+@@ -1969,6 +1970,14 @@ Utilities
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
+index e18348d..d321d82 100644
+--- a/tests/test_client_functional.py
++++ b/tests/test_client_functional.py
+@@ -30,7 +30,7 @@ from aiohttp.abc import AbstractResolver
+ from aiohttp.client_exceptions import TooManyRedirects
+ from aiohttp.compression_utils import DEFAULT_MAX_DECOMPRESS_SIZE, HAS_BROTLI
+ from aiohttp.http_exceptions import DecompressSizeError
+-from aiohttp.pytest_plugin import AiohttpClient, TestClient
++from aiohttp.pytest_plugin import AiohttpClient, AiohttpServer, TestClient
+ from aiohttp.test_utils import unused_port
+ 
+ 
+@@ -2306,6 +2306,55 @@ async def test_morsel_with_attributes(aiohttp_client) -> None:
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
+ async def test_set_cookies(aiohttp_client) -> None:
+     async def handler(request):
+         ret = web.Response()
+diff --git a/tests/test_cookiejar.py b/tests/test_cookiejar.py
+index 8f852eb..f248de5 100644
+--- a/tests/test_cookiejar.py
++++ b/tests/test_cookiejar.py
+@@ -732,6 +732,7 @@ class TestCookieJarSafe(TestCookieJarBase):
+ async def test_dummy_cookie_jar() -> None:
+     cookie = SimpleCookie("foo=bar; Domain=example.com;")
+     dummy_jar = DummyCookieJar()
++    assert dummy_jar.treat_as_secure_origin == frozenset()
+     assert len(dummy_jar) == 0
+     dummy_jar.update_cookies(cookie)
+     assert len(dummy_jar) == 0
+@@ -847,7 +848,7 @@ async def test_pickle_format(cookies_to_send) -> None:
+ )
+ async def test_treat_as_secure_origin_init(url) -> None:
+     jar = CookieJar(unsafe=True, treat_as_secure_origin=url)
+-    assert jar._treat_as_secure_origin == [URL("http://127.0.0.1")]
++    assert jar.treat_as_secure_origin == frozenset({URL("http://127.0.0.1")})
+ 
+ 
+ async def test_treat_as_secure_origin() -> None:
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index 16ec0a603b..f86a594669 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -44,6 +44,8 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2026-111066_p2.patch \
            file://CVE-2026-111065.patch \
            file://CVE-2026-111064.patch \
+           file://CVE-2026-111063_p1.patch \
+           file://CVE-2026-111063_p2.patch \
            "
 
 CVE_STATUS[CVE-2026-34515] = "not-applicable-platform: Vulnerability only affects applications running on Windows"
-- 
2.35.6

