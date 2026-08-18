Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36B5C5DF82
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 18:15:35 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15271.1787076933814970910
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 11:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=M0+oa52w;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13577; q=dns/txt;
  s=iport01; t=1787076933; x=1788286533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9j1C0MEoD6qAQi2ne/WUkGVE1aX/ioma3IqyiJhHKcs=;
  b=M0+oa52wxecV4MUtQ4gWKu0W4cQMMhTxIiQ7WMrqqEsm/clyqN8Ijpkt
   qD+eKPEs77SYLwR28cMu1I/m7W3Zlx+b4Zcsnu2E1eGFLiOg+tjdJZOF8
   mZVKsJK0lA6vQivcza4p2t7hge/DfEzwCEf1EPtlyr+QB3drHtIZ7DKlF
   f7CZg+edo6fUv11e113wMx4F3xsiknFf1+oh9A0OYbS/EeHMVHKpsAFFk
   9m2HNeiVG10amA2YtA0obT//XzB8wpMA1KHgOea6O6A4uT3TQINbkPcWe
   ov5pzP06HDrF9mE6u2FT69c405CbCyfkq1vBJvlgQk4MBwomeWIptdDpW
   g==;
X-CSE-ConnectionGUID: 2LJuUFIDQ9mKqWyQbZjM9Q==
X-CSE-MsgGUID: CJiMdX54Q5uQ4O9aPzFCzw==
X-IPAS-Result: =?us-ascii?q?A0BKAgDJn4Rq/5EQJK1aHgEBCxIMggULgld0XkNJlkoDg?=
 =?us-ascii?q?ROQN4xRFIFqDwEBAQ9EDQQBAYQ/RgKNawImNAkOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBCgEBBQEBAQIBBwWBDhOGTw2GWgECAQMnCwEYAS0QHAMBAi8rIwgZGYJpA?=
 =?us-ascii?q?YJ0AxHEH4F5M4EBgygBgVTbMAELFAEFgTOFP4giXRgBgkmCMycbG4FygRWBO?=
 =?us-ascii?q?4E4doEFgVwCgUcBhl0EgiKBDIFagS2QKUiBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBDRsGBYEdgSiENyMZNnqBCV6BKyphARIXgQmCCgKCc4IGAgFJR?=
 =?us-ascii?q?Q4LGA1IESw3FBkEPm4HjjggggsEIgsHWAEILQEbDwEiXSE1AhEbBjEOApMOk?=
 =?us-ascii?q?kqBNZ9aCiiDdowhlToaM4VbpRELmH2OCpU0AkpQhGmBaDyBWXAVO4JnCUoZD?=
 =?us-ascii?q?1eNYYNrzDknMgIJMgEBBwIHDgMLgWiRHmABAQ?=
IronPort-Data: A9a23:i9v4Ea6hfjoAKLQySSEsVwxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 jFKX2iAO62CNGSjft92PYvk8k0Ov8LRmN9qGwJprSk0Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOe9/RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajJNtPrYwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eZ6k659tZIE13p
 Pk7MQ8cVxqxhcfn+efuIgVsrpxLwMjDNYcbvDRkiDreF/tjGcCFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP0An1lQ/UPrSmM+khXT7ejxJoXqepLE85C7YywkZPL3FYICKIYfXGpUN9qqej
 knk/kH1MkxGDYGC8Gaio3uUlMHkjzyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBUCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3uz8Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:UPbCFKsClY9q52wi0CWg0fPJ7skDrtV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAa2SS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jczpy1iZNNXJ77V1TLu
 vl2vZ6
X-Talos-CUID: =?us-ascii?q?9a23=3AGwonYWoeqJy1hwlvZiQ1x2XmUZoBUGDg4lb8Gh6?=
 =?us-ascii?q?9Kn9WWYSfe121qZoxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Ai0CkSg8hQYLVlP2OFcl58HiQf+xK4oGiOB1RqMg?=
 =?us-ascii?q?bgpWjZCVIKRm2niviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,230,1779148800"; 
   d="scan'208";a="827335780"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Aug 2026 18:15:32 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id F096118000203;
	Tue, 18 Aug 2026 18:15:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 34B40CD02BD; Tue, 18 Aug 2026 11:15:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 06/10] python3-aiohttp: fix CVE-2026-54276
Date: Tue, 18 Aug 2026 11:15:24 -0700
Message-Id: <20260818181528.3405276-7-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260818181528.3405276-1-dkelaiya@cisco.com>
References: <20260818181528.3405276-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 18:15:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129243

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using
the commit shown in [1].

[1] https://github.com/aio-libs/aiohttp/commit/38d16060037e1bfcd6d677abababa3c2a4bb58fa
[2] https://github.com/advisories/GHSA-hpj7-wq8m-9hgp

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-54276.patch      | 287 ++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |   1 +
 2 files changed, 288 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54276.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54276.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54276.patch
new file mode 100644
index 0000000000..7d7fc0785a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54276.patch
@@ -0,0 +1,287 @@
+From cc464f0ffe7ac8054f3992f8f53bb78b66632aca Mon Sep 17 00:00:00 2001
+From: "patchback[bot]" <45432694+patchback[bot]@users.noreply.github.com>
+Date: Sun, 7 Jun 2026 00:30:39 -0500
+Subject: [PATCH] [PR #12825/cb1d6a53 backport][3.14] Scope
+ DigestAuthMiddleware credentials to the request origin (#12839)
+
+CVE: CVE-2026-54276
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/38d16060037e1bfcd6d677abababa3c2a4bb58fa]
+
+Co-authored-by: J. Nick Koston <nick@koston.org>
+Co-authored-by: J. Nick Koston <nick@home-assistant.io>
+(cherry picked from commit 38d16060037e1bfcd6d677abababa3c2a4bb58fa)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/12825.bugfix.rst                    |   1 +
+ aiohttp/client_middleware_digest_auth.py    |  21 +++
+ docs/client_reference.rst                   |  14 ++
+ tests/test_client_middleware_digest_auth.py | 170 ++++++++++++++++++++
+ 4 files changed, 206 insertions(+)
+ create mode 100644 CHANGES/12825.bugfix.rst
+
+diff --git a/CHANGES/12825.bugfix.rst b/CHANGES/12825.bugfix.rst
+new file mode 100644
+index 000000000..88d1bfe8c
+--- /dev/null
++++ b/CHANGES/12825.bugfix.rst
+@@ -0,0 +1 @@
++Scoped :class:`~aiohttp.DigestAuthMiddleware` credentials to the origin of the first request it handles, so a redirect to a different origin no longer triggers a digest response computed from the configured credentials; a challenge from another origin is only answered when that origin falls within a protection space advertised by the anchor origin through the RFC 7616 ``domain`` directive -- by :user:`bdraco`.
+diff --git a/aiohttp/client_middleware_digest_auth.py b/aiohttp/client_middleware_digest_auth.py
+index d7f2f1eb9..a818e57cd 100644
+--- a/aiohttp/client_middleware_digest_auth.py
++++ b/aiohttp/client_middleware_digest_auth.py
+@@ -171,6 +171,15 @@ class DigestAuthMiddleware:
+     - Includes replay attack protection with client nonce count tracking
+     - Supports preemptive authentication per RFC 7616 Section 3.6
+ 
++    Origin scoping:
++    The credentials are scoped to the origin of the first request the
++    middleware handles. A request to a different origin is passed through
++    untouched, so it never receives a digest response computed from those
++    credentials, unless that origin falls within a protection space the
++    anchor origin advertised through the RFC 7616 ``domain`` directive. Make
++    the first request through the middleware against the intended origin, as
++    the anchor is pinned to it and not reset for the life of the instance.
++
+     Standards compliance:
+     - RFC 7616: HTTP Digest Access Authentication (primary reference)
+     - RFC 2617: HTTP Authentication (deprecated by RFC 7616)
+@@ -207,6 +216,8 @@ class DigestAuthMiddleware:
+         self._preemptive: bool = preemptive
+         # Set of URLs defining the protection space
+         self._protection_space: List[str] = []
++        # Origin the credentials are scoped to; set on the first request.
++        self._origin: URL | None = None
+ 
+     async def _encode(
+         self, method: str, url: URL, body: Union[Payload, Literal[b""]]
+@@ -454,6 +465,16 @@ class DigestAuthMiddleware:
+         self, request: ClientRequest, handler: ClientHandlerType
+     ) -> ClientResponse:
+         """Run the digest auth middleware."""
++        # Credentials are scoped to the first request's origin. Other origins
++        # pass through untouched unless a challenge from the anchor origin
++        # advertised them via RFC 7616 domain; mirrors aiohttp stripping
++        # Authorization on cross-origin redirects.
++        origin = request.url.origin()
++        if self._origin is None:
++            self._origin = origin
++        elif origin != self._origin and not self._in_protection_space(request.url):
++            return await handler(request)
++
+         response = None
+         for retry_count in range(2):
+             # Apply authorization header if:
+diff --git a/docs/client_reference.rst b/docs/client_reference.rst
+index 374796f40..63ee375ca 100644
+--- a/docs/client_reference.rst
++++ b/docs/client_reference.rst
+@@ -2367,6 +2367,16 @@ Utilities
+    The server may still respond with a 401 status and ``stale=true`` if the nonce
+    has expired, in which case the middleware will automatically retry with the new nonce.
+ 
++   **Origin scoping**
++
++   The credentials are scoped to the origin of the first request the middleware
++   handles. A request to a different origin is passed through untouched, so it
++   never receives a digest response computed from those credentials, unless that
++   origin falls within a protection space the anchor origin advertised through
++   the RFC 7616 ``domain`` directive. Make the first request through the
++   middleware against the intended origin, as the anchor is pinned to it and not
++   reset for the life of the instance.
++
+    To disable preemptive authentication and require a 401 challenge for every request,
+    set ``preemptive=False``::
+ 
+@@ -2392,6 +2402,10 @@ Utilities
+    .. versionadded:: 3.12
+    .. versionchanged:: 3.12.8
+       Added ``preemptive`` parameter to enable/disable preemptive authentication.
++   .. versionchanged:: 3.14.1
++      Credentials are scoped to the origin of the first request the middleware
++      handles; other origins are passed through untouched unless covered by an
++      RFC 7616 ``domain`` directive from the anchor origin.
+ 
+ 
+ .. class:: CookieJar(*, unsafe=False, quote_cookie=True, treat_as_secure_origin = [])
+diff --git a/tests/test_client_middleware_digest_auth.py b/tests/test_client_middleware_digest_auth.py
+index 65e7d667e..03fab2691 100644
+--- a/tests/test_client_middleware_digest_auth.py
++++ b/tests/test_client_middleware_digest_auth.py
+@@ -1156,6 +1156,176 @@ async def test_preemptive_auth_without_domain_uses_origin(
+     )  # Second request - preemptive auth (entire origin)
+ 
+ 
++async def test_does_not_answer_cross_origin_redirect_challenge(
++    aiohttp_server: AiohttpServer,
++) -> None:
++    """A cross-origin redirect target must not receive a digest response.
++
++    aiohttp strips the Authorization header on cross-origin redirects; the
++    digest middleware must not re-add one for the redirect target, otherwise
++    the configured credentials leak to an origin the caller never targeted.
++    """
++    target_auth_headers: list[str | None] = []
++
++    async def target_handler(request: Request) -> Response:
++        auth_header = request.headers.get(hdrs.AUTHORIZATION)
++        target_auth_headers.append(auth_header)
++        assert auth_header is None
++        return Response(
++            status=401,
++            headers={
++                hdrs.WWW_AUTHENTICATE: 'Digest realm="evil", nonce="cross-origin"'
++            },
++        )
++
++    target_app = Application()
++    target_app.router.add_get("/", target_handler)
++    target_server = await aiohttp_server(target_app)
++
++    async def source_handler(request: Request) -> Response:
++        return Response(
++            status=302, headers={hdrs.LOCATION: str(target_server.make_url("/"))}
++        )
++
++    source_app = Application()
++    source_app.router.add_get("/", source_handler)
++    source_server = await aiohttp_server(source_app)
++
++    digest_auth = DigestAuthMiddleware("victim", "secret")
++    async with (
++        ClientSession(middlewares=(digest_auth,)) as session,
++        session.get(source_server.make_url("/")) as response,
++    ):
++        await response.text()
++
++    assert target_auth_headers == [None]
++
++
++async def test_answers_same_origin_redirect_challenge(
++    aiohttp_server: AiohttpServer,
++) -> None:
++    """A same-origin redirect that issues a challenge must still authenticate."""
++    auth_headers: list[str | None] = []
++
++    async def handler(request: Request) -> Response:
++        if request.path == "/start":
++            return Response(status=302, headers={hdrs.LOCATION: "/protected"})
++        auth_header = request.headers.get(hdrs.AUTHORIZATION)
++        auth_headers.append(auth_header)
++        if auth_header is None:
++            return Response(
++                status=401,
++                headers={hdrs.WWW_AUTHENTICATE: 'Digest realm="good", nonce="abc"'},
++            )
++        return Response(text="OK")
++
++    app = Application()
++    app.router.add_get("/start", handler)
++    app.router.add_get("/protected", handler)
++    server = await aiohttp_server(app)
++
++    digest_auth = DigestAuthMiddleware("user", "pass")
++    async with (
++        ClientSession(middlewares=(digest_auth,)) as session,
++        session.get(server.make_url("/start")) as response,
++    ):
++        assert response.status == 200
++        assert await response.text() == "OK"
++
++    assert auth_headers[0] is None
++    assert auth_headers[1] is not None
++    assert auth_headers[1].startswith("Digest")
++
++
++async def test_answers_cross_origin_within_domain_protection_space(
++    aiohttp_server: AiohttpServer,
++) -> None:
++    """A different origin advertised via the ``domain`` directive is honored.
++
++    RFC 7616 allows a challenge to define a protection space spanning other
++    servers through the ``domain`` directive. The anchor origin vouches for
++    those URIs, so preemptive auth to them is expected.
++    """
++    other_auth_headers: list[str | None] = []
++
++    async def other_handler(request: Request) -> Response:
++        other_auth_headers.append(request.headers.get(hdrs.AUTHORIZATION))
++        return Response(text="other")
++
++    other_app = Application()
++    other_app.router.add_get("/", other_handler)
++    other_server = await aiohttp_server(other_app)
++    other_origin = str(other_server.make_url("/").origin())
++
++    async def anchor_handler(request: Request) -> Response:
++        if request.headers.get(hdrs.AUTHORIZATION) is None:
++            challenge = f'Digest realm="anchor", nonce="n1", domain="{other_origin}/"'
++            return Response(status=401, headers={hdrs.WWW_AUTHENTICATE: challenge})
++        return Response(text="anchor")
++
++    anchor_app = Application()
++    anchor_app.router.add_get("/", anchor_handler)
++    anchor_server = await aiohttp_server(anchor_app)
++
++    digest_auth = DigestAuthMiddleware("user", "pass")
++    async with ClientSession(middlewares=(digest_auth,)) as session:
++        async with session.get(anchor_server.make_url("/")) as response:
++            assert response.status == 200
++        async with session.get(other_server.make_url("/")) as response:
++            assert response.status == 200
++
++    assert other_auth_headers[0] is not None
++    assert other_auth_headers[0].startswith("Digest")
++
++
++async def test_does_not_answer_cross_origin_challenge_without_redirect(
++    aiohttp_server: AiohttpServer,
++) -> None:
++    """Origin scoping applies to any cross-origin request, not just redirects.
++
++    After authenticating against the anchor origin, a direct request to a
++    different origin that issues its own challenge must not be answered with a
++    digest response computed from the configured credentials.
++    """
++    other_auth_headers: list[str | None] = []
++
++    async def other_handler(request: Request) -> Response:
++        auth_header = request.headers.get(hdrs.AUTHORIZATION)
++        other_auth_headers.append(auth_header)
++        assert auth_header is None
++        return Response(
++            status=401,
++            headers={hdrs.WWW_AUTHENTICATE: 'Digest realm="evil", nonce="x"'},
++        )
++
++    other_app = Application()
++    other_app.router.add_get("/", other_handler)
++    other_server = await aiohttp_server(other_app)
++
++    async def anchor_handler(request: Request) -> Response:
++        if request.headers.get(hdrs.AUTHORIZATION) is None:
++            return Response(
++                status=401,
++                headers={hdrs.WWW_AUTHENTICATE: 'Digest realm="anchor", nonce="n1"'},
++            )
++        return Response(text="anchor")
++
++    anchor_app = Application()
++    anchor_app.router.add_get("/", anchor_handler)
++    anchor_server = await aiohttp_server(anchor_app)
++
++    digest_auth = DigestAuthMiddleware("user", "pass")
++    async with ClientSession(middlewares=(digest_auth,)) as session:
++        async with session.get(anchor_server.make_url("/")) as response:
++            assert response.status == 200
++        async with session.get(other_server.make_url("/")) as response:
++            assert response.status == 401
++
++    # The other origin only ever saw the unauthenticated request; the
++    # middleware never answered its challenge.
++    assert other_auth_headers == [None]
++
++
+ @pytest.mark.parametrize(
+     ("status", "headers", "expected"),
+     [
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index c70e4d025f..3c07933200 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -12,6 +12,7 @@ SRC_URI += " \
     file://CVE-2026-50269.patch \
     file://CVE-2026-54274.patch \
     file://CVE-2026-54275.patch \
+    file://CVE-2026-54276.patch \
 "
 
 CVE_PRODUCT = "aiohttp"
-- 
2.35.6


