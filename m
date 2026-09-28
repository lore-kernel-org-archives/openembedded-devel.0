Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD57CA5FA3
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:43:44 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63549.1790617412936066334
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KATvy/pY;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6558; q=dns/txt;
  s=iport01; t=1790617412; x=1791827012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tbgtSRDzx7tmgQ0w4Js6uLWmUnFwqAvVSRa534WBZzE=;
  b=KATvy/pYMazeB3+BUzGhuLGTpgW2BSVs6LVqge3IRSFLhfKNNg7XRxVz
   Rxa43u0ZSTx6EwhVvuDsOhoc+3iPisj8ho0OEZLR3B6XHxaKthrB3Wgl7
   w9oN7IIL1/yy165VJg50FdJPaZ7p6EmQjxBOGyyjriVgbGibNia9xeNc0
   a9X2TNGZA5glxxmhv2Dr4ujB78wkkzXh4pP7GkYPTTLMGgxFnBeerkFhL
   7ADzjJYei/7pxjgiVlmcAzoRUfj67XPyuSWdE8ysnIGQ1jxTl98FBcWAW
   jBVAxndDywCzmuCkBtvr0mZw5zZagjWIyNq61ZT1Wb4Fn1Ij7vbocwjuR
   w==;
X-CSE-ConnectionGUID: JosnDB8jTWKAEGXBsnm5ig==
X-CSE-MsgGUID: qUmAod/UT065ktTJGAvDew==
X-IPAS-Result: =?us-ascii?q?A0AAAwC9prpq/5L/Ja1aglmCV3VgQ0mWSgOeGoF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQwD0YCjgkCJjYHDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBAgEDJwsBGS0QHAMBAi8rIwgZgwIBgnEDAxEDwkKBeTOBA?=
 =?us-ascii?q?YMqPwJDUNsyAQsUAYE4gXODTYgjXRgBRIQ4JxsbgXKCUIE4doEFTYEPAQGBO?=
 =?us-ascii?q?BCGXQSCIoEMgVqTQ0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBBxsGB?=
 =?us-ascii?q?YEdgSCCGSMZNnqBCV6BKylgARAXgQeCBwKCVIIBAgFJQw4HRVMJJUEKEkcmI?=
 =?us-ascii?q?ggSCQETGjALgSE4QQkoERgNSBEsNxUZBD5uB5AuHoJlgQ4BKgGCFCYOpVqhD?=
 =?us-ascii?q?woog3aMIpU6GjOEBIFXkkCSVAuYfY4KlgBQhGmBbwcugUcLB3AVgyIJShkPj?=
 =?us-ascii?q?i0MC4NggX+DFMcmJzICCTIBAQcCBw4DC4FokAGBfQEB?=
IronPort-Data: A9a23:Np2lyah5JPykPPmQR9P7EulyX161MBEKZh0ujC45NGQN5FlHY01je
 htvC2qHMvuLNmv1LY1zPtzg80kG7ZXSytQ3Twdprn01RCpjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxMuvjT8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU6/f1xLUse9
 8AnCxkgQSCpnOSznbO0H7wEasQLdKEHPasFsX1miDWcBvE8TNWbEuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgl/5JEWxI9EglHzcDBcoVOErII84nPYy0p6172F3N/9J4bVG5kJzhnEz
 o7A133EBzgdOJui9WLbr3Gwus3gtD3XVZ1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YQLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:pggGmqu9AeGONL7c4B6Oh0jM7skDVNV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaDZ2JK2xCe36m+oocfng+OaYE
X-Talos-CUID: 9a23:96LHTWAxM3VsOG76Ewtg70g4MJAnTkL+5Vr/E2WjD2M0SbLAHA==
X-Talos-MUID: 9a23:ybn47wvgxsmZkPOTRM2nnQxnHcBkpJmSUB5Qkok6meatKwB9JGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,128,1787011200"; 
   d="scan'208";a="527644874"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Sep 2026 17:43:32 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id EA2BD18000238;
	Mon, 28 Sep 2026 17:43:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 4DF9BCBEFBF; Mon, 28 Sep 2026 10:43:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 09/13] python3-aiohttp: fix CVE-2026-54275
Date: Mon, 28 Sep 2026 10:43:19 -0700
Message-Id: <20260928174323.1810308-10-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260928174323.1810308-1-dkelaiya@cisco.com>
References: <20260928174323.1810308-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 17:43:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130447

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the reviewed upstream fix shown in [1]. The
advisory identifying the fix is referenced in [2].

[1] https://github.com/aio-libs/aiohttp/commit/0ca2b6c28a25726527a8b60f25960262a91ed0e0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-54275

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-54275.patch      | 124 ++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |   1 +
 2 files changed, 125 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54275.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54275.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54275.patch
new file mode 100644
index 0000000000..21528ccb07
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54275.patch
@@ -0,0 +1,124 @@
+From 87daca6e11c2123c04d737bde7ddef35a154b272 Mon Sep 17 00:00:00 2001
+From: "J. Nick Koston" <nick@koston.org>
+Date: Sun, 7 Jun 2026 00:30:30 -0500
+Subject: [PATCH] [PR #12835/1e94b3e8 backport][3.14] Tls server hostname pool
+ key (#12847)
+
+CVE: CVE-2026-54275
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/0ca2b6c28a25726527a8b60f25960262a91ed0e0]
+
+Backport Changes:
+- Upstream uses a NamedTuple ConnectionKey with PEP 604 union
+  annotations; aiohttp 3.9.5 uses an attr.s class, so server_hostname
+  is added with the equivalent Optional[str] annotation and included
+  in its constructor.
+- aiohttp 3.9.5 does not define the newer AiohttpServer or
+  _RequestMaker test aliases, so their fixture annotations are
+  omitted. The request-key test is synchronous because this branch's
+  make_request fixture returns ClientRequest directly.
+
+(cherry picked from commit 0ca2b6c28a25726527a8b60f25960262a91ed0e0)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/12835.bugfix.rst        |  1 +
+ aiohttp/client_reqrep.py        |  2 ++
+ tests/test_client_functional.py | 29 +++++++++++++++++++++++++++++
+ tests/test_client_request.py    | 14 ++++++++++++++
+ 4 files changed, 46 insertions(+)
+ create mode 100644 CHANGES/12835.bugfix.rst
+
+diff --git a/CHANGES/12835.bugfix.rst b/CHANGES/12835.bugfix.rst
+new file mode 100644
+index 000000000..84a8ae006
+--- /dev/null
++++ b/CHANGES/12835.bugfix.rst
+@@ -0,0 +1 @@
++Included the per-request ``server_hostname`` override in the :class:`~aiohttp.TCPConnector` connection pool key, so a pooled TLS connection is no longer reused for a request that sets ``server_hostname`` to a different value -- by :user:`bdraco`.
+diff --git a/aiohttp/client_reqrep.py b/aiohttp/client_reqrep.py
+index afe719da1..9abfc79de 100644
+--- a/aiohttp/client_reqrep.py
++++ b/aiohttp/client_reqrep.py
+@@ -220,6 +220,7 @@ class ConnectionKey:
+     proxy: Optional[URL]
+     proxy_auth: Optional[BasicAuth]
+     proxy_headers_hash: Optional[int]  # hash(CIMultiDict)
++    server_hostname: Optional[str] = None
+ 
+ 
+ def _is_expected_content_type(
+@@ -377,6 +378,7 @@ class ClientRequest:
+             self.proxy,
+             self.proxy_auth,
+             h,
++            self.server_hostname,
+         )
+ 
+     @property
+diff --git a/tests/test_client_functional.py b/tests/test_client_functional.py
+index 2c531d7d3..40c551ffa 100644
+--- a/tests/test_client_functional.py
++++ b/tests/test_client_functional.py
+@@ -462,6 +462,35 @@ async def test_ssl_client(
+     assert txt == "Test message"
+ 
+ 
++async def test_server_hostname_override_not_reused(aiohttp_server) -> None:
++    """A pooled TLS connection must not be reused for a different server_hostname."""
++    trustme = pytest.importorskip("trustme")
++
++    ca = trustme.CA()
++    cert = ca.issue_cert("first.example")
++    server_ctx = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
++    cert.configure_cert(server_ctx)
++    client_ctx = ssl.create_default_context(purpose=ssl.Purpose.SERVER_AUTH)
++    ca.configure_trust(client_ctx)
++
++    async def handler(request: web.Request) -> web.Response:
++        return web.Response(text="ok")
++
++    app = web.Application()
++    app.router.add_route("GET", "/", handler)
++    server = await aiohttp_server(app, ssl=server_ctx)
++    url = server.make_url("/")
++
++    connector = aiohttp.TCPConnector(ssl=client_ctx, limit=1, limit_per_host=1)
++    async with aiohttp.ClientSession(connector=connector) as session:
++        async with session.get(url, server_hostname="first.example") as resp:
++            assert resp.status == 200
++            await resp.read()
++
++        with pytest.raises(aiohttp.ClientConnectorCertificateError):
++            await session.get(url, server_hostname="second.example")
++
++
+ async def test_tcp_connector_fingerprint_ok(
+     aiohttp_server,
+     aiohttp_client,
+diff --git a/tests/test_client_request.py b/tests/test_client_request.py
+index 6084f6854..0ef6e92d6 100644
+--- a/tests/test_client_request.py
++++ b/tests/test_client_request.py
+@@ -1326,6 +1326,20 @@ def test_insecure_fingerprint_sha1(loop) -> None:
+         Fingerprint(hashlib.sha1(b"foo").digest())
+ 
+ 
++def test_connection_key_includes_server_hostname(make_request) -> None:
++    """A server_hostname override must be part of the connection reuse key."""
++    url = URL("https://127.0.0.1:8443/")
++    none_req = make_request("GET", url)
++    first = make_request("GET", url, server_hostname="first.example")
++    first_again = make_request("GET", url, server_hostname="first.example")
++    second = make_request("GET", url, server_hostname="second.example")
++
++    assert first.connection_key.server_hostname == "first.example"
++    assert first.connection_key != none_req.connection_key
++    assert first.connection_key != second.connection_key
++    assert first.connection_key == first_again.connection_key
++
++
+ def test_loose_cookies_types(loop) -> None:
+     req = ClientRequest("get", URL("http://python.org"), loop=loop)
+     morsel = Morsel()
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index 5710e38943..42402f799b 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -30,6 +30,7 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2026-47265.patch \
            file://CVE-2026-50269.patch \
            file://CVE-2026-54274.patch \
+           file://CVE-2026-54275.patch \
            "
 
 CVE_STATUS[CVE-2026-34515] = "not-applicable-platform: Vulnerability only affects applications running on Windows"
-- 
2.35.6


