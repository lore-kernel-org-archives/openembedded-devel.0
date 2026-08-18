Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C40DC5DF8B
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 18:15:37 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15139.1787076932485178118
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 11:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RTFFIM3m;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5978; q=dns/txt;
  s=iport01; t=1787076933; x=1788286533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zfLXM7wTd/0TsiKOHyjHFWTJAhUKIqmQyyNFHkzwayA=;
  b=RTFFIM3mDNoeYvT+kVurtkvNdj02KdPGzMvEP4X63V8lALmVPM2Yq4iw
   +/pz1kGiFOjy9ykNkZYijsB3qftz3JyBXdP72j4ME3jCc/M34Pn3nz6KP
   mIzMSmMRVZd5jNUrFOcGvmvy/RAr5NblObdJStAwllm/7hDUygRwfA8c9
   nv4CZIs9QC18A8Am4hR14Vy4CnJQQwub4D9ZzqzIemNkWlX9Zr+ssAuxQ
   YAvW7DQHPCFuJiAQaoSeMCDjRkHH/+BAbARssoP0BBXpKiZNIin1ka4FM
   Bz7tejXGup/eMgNITAmEe0luxl67yczWaniPW9gtrrwlymCKm+aTBtdPB
   w==;
X-CSE-ConnectionGUID: UsGMiHA5SYaOaipdqiQj9A==
X-CSE-MsgGUID: 71vvEeqYSP2MbgFbIL1rqA==
X-IPAS-Result: =?us-ascii?q?A0BIAgDJn4Rq/44QJK1aglmCV3ReQ0mWSgOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQwD0YCjWsCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECAQMnCwEZLRAcAwECLysjCBmDAgGCcQMDEQPEHIF5M4EBg?=
 =?us-ascii?q?ymBVNswAQsUAQWBM4Fzg0yIIl0YAYR8JxsbgXKBFYE7gi6BBU2BDwKBOBCGX?=
 =?us-ascii?q?QSCIoEMgVqRVkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDRsGBYEdg?=
 =?us-ascii?q?SiENyMZNnqBCV6BKyphARIXgQmCCgKCc4IGAgFJRQ4LGA1IESw3FBkEPm4Hj?=
 =?us-ascii?q?jgggkOBDgEqAYIFNQ6THJI+oQ8KKIN2jCGVOhozhASBV5JAklELmH2LN4JTl?=
 =?us-ascii?q?gBQhGmBaDyBWXAVgyIJShkPjiwMC4NgzDknMgIJMgEBBwIHDgMLgWiQAYF9A?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:OwFG7aoBSAn8BtX3BW/4ni0avmReBmJJZBIvgKrLsJaIsI4StFCzt
 garIBmHPqnfNjCketFxbt+/8xhSuJDdyoRlSAA9/n1jFS8WoOPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrT8Uw355wehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0ttsLkRP1
 dVFEwEESRmCn+6vwYu5G8A506zPLOGzVG8eknhkyTecCbMtRorOBv2Xo9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwtNYH49tL/Aan3Xfz5VrFuUtKMf6GnIxws327/oWDbQUozSFJ0KzxbF+
 woq+UymWw8EGdGG+AG9qFemicHFvAeiQps7QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymEzq7SpgLcDW8eQ3sZNZottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvpUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:3WdZZq4CXeGlzgTBtQPXwBDXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPI
 5bAs5D4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGthdB8MTMHfhLqWwLzM2faYEKA
 ==
X-Talos-CUID: 9a23:j2HJGWH38v7uMWavqmJa72ExG+AML0bsxVDZIle0EGdQSuy8HAo=
X-Talos-MUID: 9a23:eW7b8AaYdiIa7+BT6GbymhxvLfZT2/6LAk8jm7Qi4tOdHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,230,1779148800"; 
   d="scan'208";a="809079855"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Aug 2026 18:15:32 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id 03A66180004AA;
	Tue, 18 Aug 2026 18:15:32 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 2E33DCD02BC; Tue, 18 Aug 2026 11:15:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 05/10] python3-aiohttp: fix CVE-2026-54275
Date: Tue, 18 Aug 2026 11:15:23 -0700
Message-Id: <20260818181528.3405276-6-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260818181528.3405276-1-dkelaiya@cisco.com>
References: <20260818181528.3405276-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 18:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129237

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using
the commit shown in [1].

[1] https://github.com/aio-libs/aiohttp/commit/0ca2b6c28a25726527a8b60f25960262a91ed0e0
[2] https://github.com/advisories/GHSA-4m7w-qmgq-4wj5

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-54275.patch      | 115 ++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |   1 +
 2 files changed, 116 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54275.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54275.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54275.patch
new file mode 100644
index 0000000000..f6e748b2f6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54275.patch
@@ -0,0 +1,115 @@
+From 23328dc1950071dd1e05ac6aeb631874ef94afe3 Mon Sep 17 00:00:00 2001
+From: "J. Nick Koston" <nick@koston.org>
+Date: Sun, 7 Jun 2026 00:30:30 -0500
+Subject: [PATCH] [PR #12835/1e94b3e8 backport][3.14] Tls server hostname pool
+ key (#12847)
+
+CVE: CVE-2026-54275
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/0ca2b6c28a25726527a8b60f25960262a91ed0e0]
+
+(cherry picked from commit 0ca2b6c28a25726527a8b60f25960262a91ed0e0)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/12835.bugfix.rst        |  1 +
+ aiohttp/client_reqrep.py        |  2 ++
+ tests/test_client_functional.py | 31 +++++++++++++++++++++++++++++++
+ tests/test_client_request.py    | 16 ++++++++++++++++
+ 4 files changed, 50 insertions(+)
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
+index a9e079589..5fe83fa88 100644
+--- a/aiohttp/client_reqrep.py
++++ b/aiohttp/client_reqrep.py
+@@ -255,6 +255,7 @@ class ConnectionKey(NamedTuple):
+     proxy: Optional[URL]
+     proxy_auth: Optional[BasicAuth]
+     proxy_headers_hash: Optional[int]  # hash(CIMultiDict)
++    server_hostname: str | None = None
+ 
+ 
+ def _is_expected_content_type(
+@@ -964,6 +965,7 @@ class ClientRequest:
+                 self.proxy,
+                 self.proxy_auth,
+                 h,
++                self.server_hostname,
+             ),
+         )
+ 
+diff --git a/tests/test_client_functional.py b/tests/test_client_functional.py
+index ea31567c4..60caf6e2a 100644
+--- a/tests/test_client_functional.py
++++ b/tests/test_client_functional.py
+@@ -720,6 +720,37 @@ async def test_ssl_client(
+     assert txt == "Test message"
+ 
+ 
++async def test_server_hostname_override_not_reused(
++    aiohttp_server: AiohttpServer,
++) -> None:
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
+ @pytest.mark.skipif(
+     sys.version_info < (3, 11), reason="ssl_shutdown_timeout requires Python 3.11+"
+ )
+diff --git a/tests/test_client_request.py b/tests/test_client_request.py
+index e3cdc1c62..4c91245a5 100644
+--- a/tests/test_client_request.py
++++ b/tests/test_client_request.py
+@@ -1611,6 +1611,22 @@ async def test_connection_key_without_proxy() -> None:
+     await req.close()
+ 
+ 
++async def test_connection_key_includes_server_hostname(
++    make_request: _RequestMaker,
++) -> None:
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
+ def test_request_info_back_compat() -> None:
+     """Test RequestInfo can be created without real_url."""
+     url = URL("http://example.com")
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index a40f522e4d..c70e4d025f 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -11,6 +11,7 @@ SRC_URI += " \
     file://CVE-2026-47265.patch \
     file://CVE-2026-50269.patch \
     file://CVE-2026-54274.patch \
+    file://CVE-2026-54275.patch \
 "
 
 CVE_PRODUCT = "aiohttp"
-- 
2.35.6


