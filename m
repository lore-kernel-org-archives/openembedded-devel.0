Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36134.1795583900563826640
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=SDIeffD9;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8238; q=dns/txt;
  s=iport01; t=1795583900; x=1796793500;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ox72XccmWIEf0iYIBvZlsAWeuabGwmUDn9XuoYgZH/o=;
  b=SDIeffD9VOEkdjoGi8RMAne/BjnbRMxUdlYzwRYgjLFbjuNP9El4z4Nb
   lXZzTc9sOtJp7oVj7N2qgDLlvX7lXjsKHoUNgRrvTcc3aEMIpcdtUE+Gc
   R1lPhO9N+liJ94yVtwObZl7NmCAjxvXFA1Y4RJvj9MRUWfSMW0mcERi25
   PinENr/HbWbHSwecF/qiRjC7Ga5rcX6RJhRQbKOcwo+q1OUEQA88+62Kp
   5mRQLJQARoC1LqlnBuYTcBFcFsVi5IbBEMUWWLE/xr+QU6dFQN3Mj1TZQ
   LDpMQHvRACf9FqN0DC1UHDfA1d1JqkZLUBxwV9Q1XcvODVhICIJjDfVMO
   Q==;
X-CSE-ConnectionGUID: tpkEol/zSTyGWGzlb4KlQw==
X-CSE-MsgGUID: SlrtbXpeQFqvFO3Lyp/dKw==
X-IPAS-Result: =?us-ascii?q?A0BJAgAsbAZr/9JK/pBaglmCGD91YENJA5ZIA5FQjFmBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGEP0YCjiICJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIvKyMIGYIqWAGCdAMRugSBe?=
 =?us-ascii?q?TOBAYMpAUNBUNszAQsUAYE4hUKIJV0YAYR+JxsbgXKBFYE7gi+BBYFcAQECA?=
 =?us-ascii?q?YEkEYZuBIIigQyBVI0TAoFJiFJIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BI?=
 =?us-ascii?q?zsXgQcbBgWBHIEegRKBA12BKyhdASGBCIF1AoJRggACAUlBDgdFUwklQxJHJ?=
 =?us-ascii?q?CIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAcJC8FGSY8GwqBDCcdH?=
 =?us-ascii?q?hkOAikGFiELNBgNSBEsNxUZBD5uB5QTgwsQDm0JCgETEgQCf1VTBRwCMJJnk?=
 =?us-ascii?q?B+CIaERCiiDeYwklToaM4QEgVelFwuYfYJZhiiCNoJTlVcqUIRqgWg8gVlwF?=
 =?us-ascii?q?YMiCUoZD44uCwuBFAECgkmFE1HIdyYyAgEIAy8BAQcCBw4DC4FokAABJ4FWA?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:jwp8PK2GLSezt5KU3/bD5YRwkn2cJEfYwER7XKvMYLTBsI5bpzAHn
 2tLUTrSbqmIajGkfdtzb4ux/UgBv5PRzNVhSws43Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ef3b9ANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcuaTpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGEFk1EIocvfRMPXBhy
 tMKLDpRTRS6mLfjqF67YrEEasULJcTxeYdasXZ6wHSBXLAtQIvIROPB4towMDUY35wSW6yDO
 4xGNXw1NUyojx5nYj/7DLoyn+qsj3juehVTqUmeouw85G27IAlZjuC2boGKKoXiqcN9pUKCu
 mj252nALAgEGvvE7SudtX6Pmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0UtdKVul/4waXx++MskCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:64tZ/6HY5YIwjz2PpLqEyseALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: =?us-ascii?q?9a23=3AkaFCEWlvCbPyCVhmu9Dx1+WMlArXOWHFz1rXJwi?=
 =?us-ascii?q?qMlp4Z4K6W1uapIBgqtU7zg=3D=3D?=
X-Talos-MUID: 9a23:HocJPAgGEi8c4YeCFi6PE8MpD8Ny/66eEE00v4wYle7fET1ofDu+k2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60363781"
Received: from aer-l-core-09.cisco.com ([144.254.74.210])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:18:16 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-09.cisco.com (Postfix) with ESMTPS id 559FA180001F5;
	Wed, 25 Nov 2026 05:18:16 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 80F16CBF21E; Tue, 24 Nov 2026 21:18:13 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 5/9] python3-aiohttp: fix CVE-2026-111065
Date: Tue, 24 Nov 2026 21:18:07 -0800
Message-Id: <20261125051811.2524271-6-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125051811.2524271-1-dkelaiya@cisco.com>
References: <20261125051811.2524271-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132972
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the upstream cookie overflow and response cleanup fix [1]
to aiohttp 3.9.5, as identified by [2]. Clamp positive Max-Age values
before float conversion and expire nonpositive values immediately.

Close a received response if subsequent processing fails so a
malformed cookie cannot exhaust the connection pool. Include the
upstream extreme Max-Age and connection-release regression tests.
Adapt the response annotation, cookie-update test hook and root-path
keys to 3.9.5. Raise the test error only for nonempty cookies because
this client invokes update_cookies() even for clean responses.

[1] https://github.com/aio-libs/aiohttp/commit/9dd8eaf4e31f1237ef2c1574a8c82a739fca5805
[2] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-6cjc-53gc-5rqm

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-111065.patch     | 171 ++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |   1 +
 2 files changed, 172 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111065.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111065.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111065.patch
new file mode 100644
index 0000000000..916afb87ca
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111065.patch
@@ -0,0 +1,171 @@
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
+- Use the existing Optional spelling for the response variable.
+- Use update_cookies() and SimpleCookie() in the regression tests,
+  retaining the older "/" expiration key.
+- Raise the test cookie error only for nonempty cookies; this client
+  invokes update_cookies() even when a response has no Set-Cookie.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/13677.bugfix.rst        |  1 +
+ aiohttp/client.py               |  5 ++++
+ aiohttp/cookiejar.py            | 10 ++++++-
+ tests/test_client_functional.py | 46 +++++++++++++++++++++++++++++++++
+ tests/test_cookiejar.py         | 22 ++++++++++++++++
+ 5 files changed, 83 insertions(+), 1 deletion(-)
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
+index 4674b19..2e88917 100644
+--- a/aiohttp/client.py
++++ b/aiohttp/client.py
+@@ -509,6 +509,7 @@ class ClientSession:
+             await trace.send_request_start(method, url.update_query(params), headers)
+ 
+         timer = tm.timer()
++        resp: Optional[ClientResponse] = None
+         try:
+             with timer:
+                 while True:
+@@ -727,6 +728,10 @@ class ClientSession:
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
+index 4f694b6..b69e9e2 100644
+--- a/aiohttp/cookiejar.py
++++ b/aiohttp/cookiejar.py
+@@ -340,7 +340,15 @@ class CookieJar(AbstractCookieJar):
+             if max_age:
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
+index 649e766..d695638 100644
+--- a/tests/test_client_functional.py
++++ b/tests/test_client_functional.py
+@@ -2400,6 +2400,52 @@ async def test_set_cookies_max_age_overflow(aiohttp_client) -> None:
+                 assert int(cookie["max-age"]) == int(overflow)
+ 
+ 
++async def test_connection_released_when_cookie_processing_fails(
++    aiohttp_client: AiohttpClient,
++) -> None:
++    class EvilJar(aiohttp.CookieJar):
++        def update_cookies(
++            self, cookies: Any, response_url: URL = URL()
++        ) -> None:
++            if cookies:
++                raise RuntimeError("boom")
++            super().update_cookies(cookies, response_url)
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
+index df59759..3c9933b 100644
+--- a/tests/test_cookiejar.py
++++ b/tests/test_cookiejar.py
+@@ -1176,3 +1176,25 @@ async def test_save_load_json_secure_cookies(tmp_path: Path) -> None:
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
++    jar.update_cookies(SimpleCookie(f"sid=x; Max-Age={'9' * 309}"), url)
++
++    assert "sid" in jar.filter_cookies(url)
++    assert jar._expirations[("example.com", "/", "sid")] == CookieJar.MAX_TIME
++
++
++async def test_update_cookies_negative_max_age_beyond_float_range_expires() -> None:
++    """A negative Max-Age below float min must expire the cookie, not raise."""
++    url = URL("https://example.com/")
++    jar = CookieJar()
++
++    jar.update_cookies(SimpleCookie(f"sid=x; Max-Age=-{'9' * 309}"), url)
++
++    assert "sid" not in jar.filter_cookies(url)
++    assert len(jar) == 0
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index 59e9f74e89..8d7fe9f8dd 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -42,6 +42,7 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2026-111748_p2.patch \
            file://CVE-2026-111066_p1.patch \
            file://CVE-2026-111066_p2.patch \
+           file://CVE-2026-111065.patch \
            "
 
 CVE_STATUS[CVE-2026-34515] = "not-applicable-platform: Vulnerability only affects applications running on Windows"
-- 
2.35.6
