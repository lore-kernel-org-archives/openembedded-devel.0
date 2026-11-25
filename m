Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36200.1795584015266199700
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:20:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jZM2PiJ4;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=22821; q=dns/txt;
  s=iport01; t=1795584015; x=1796793615;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=vFCUlu7hwxmyNjKkKObceCSmlQsddkCkfhJa1o8x4WU=;
  b=jZM2PiJ4b5SIYmKljSCxoRapCqGerSkdB8JCyK3A2Sil8+bXRdJajcvP
   45/loNF+qg4eMCzj2fGOlyQErLmBprxFPOV2Bq1iB/vqMBi9egvEPMhd7
   VLzCgElVYKRGTpFsp2NYT+XVj92lA/NjToUpnOI7N0QWm2fRuAB9pQB6H
   Iy+y22kDUZnsr/o7brO7eVfwytfEya8DiobLBj88nES4KYj6ddEXVyi7Q
   ZtD2klHIbhJB/lc0Pazm9I4HNx1OqbXdfKAv4Ff4o6vFA7oqgKRZNUuX4
   6gfpIQwnfIzubLnP/cPDhRYuSe07HyA9M5BOoP/gyNlSZIaZzG7HjdH0k
   Q==;
X-CSE-ConnectionGUID: UqJfJpv/RK2aQHZKGECXOw==
X-CSE-MsgGUID: TpdDWCdMTyKwG4pxObr0Zg==
X-IPAS-Result: =?us-ascii?q?A0BMAgAGbgZr/8pK/pBagRWBRIIYP3VhQkkDlCeCIQOBE?=
 =?us-ascii?q?5A9jFmBfg8BAQEPRA0EAQGEP0YCTxWNPgImNAkOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMaDQsBGAE9HAMBAi8rIwgZgipYA?=
 =?us-ascii?q?YJ0AgERugGBeTOBAYMpAYFU2zMBCxQBgTiFQoglXRgBRIQ6JxsbgXKBFYE7g?=
 =?us-ascii?q?Tl2gQVLAYEQAoEtCxAJhlUEgg0VgQyBVIEChTUDhlkCgUmIUkiBHgNZLAFVE?=
 =?us-ascii?q?w0KCwcFgWgDNRIqFW4yHYEjOxeBBxsGBYEcgR6BEoEDXYErKF4hgQiBdQKCU?=
 =?us-ascii?q?YIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0O?=
 =?us-ascii?q?RAwHCQvBRkmPBsKgQwnHR4ZDgIpBhYhCzQYDUgRLDcVGQQ+bgeUE4MbATAMJ?=
 =?us-ascii?q?AkKGgEKBhoBgQUvNBwoEQcEkxsBB5AVgiGhEQoog3mMJJU6GjOEBIFXkkOSV?=
 =?us-ascii?q?AuWGoJjjgqFVo9fTANNhGqBaDyBWXAVO4JnCUoZD4RRiVoOC4NggjaBUYFHy?=
 =?us-ascii?q?Q0jNQIJAy8BAQcCBw4DC4FokAABASYEgVIBAQ?=
IronPort-Data: A9a23:SwTn9Kg83T41CGlgZJNhTSR3X161NxEKZh0ujC45NGQN5FlHY01je
 htvXT2BOP+KMGD9Ktl/OYzipEkHuZXXyt5nHgtpry00FypjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn/SMhvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvje8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUl48R5I3lQs
 sY7cjk0TiKgqM+d8JWkH7wEasQLdKEHPasWt2slyXTSCuwrBMiaBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcXYD/7C7pm9AusrnDkazRCrVuPjaE2+GPUigd21dABNfKLII3SFZwMxy50o
 Er652jVPToWEeCO6iWqrmq8oeXVxRH0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz5RvIzu/f5ByUQzBdCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:nnCb06/3wHGMyTZhH7luk+D0I+orL9Y04lQ7vn2ZLiYlFvBw+P
 rBoB1273LJYXMqKRIdcLO7Scy9qA3nlKKdiLN5VdzJYOClghrLEGgI1+TfKlPbdxEWjtQ86Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: =?us-ascii?q?9a23=3AkmDONmrXj8OHhtYI4Pv7OBfmUf08UHP/1GmXGWz?=
 =?us-ascii?q?iAF9Jep66ZHSg37wxxg=3D=3D?=
X-Talos-MUID: 9a23:nxQBDgYRqmHhmeBTiyfgqA5JOOJU8oexJxwVgbIMoZG2Onkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="62908111"
Received: from aer-l-core-01.cisco.com ([144.254.74.202])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:20:11 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-01.cisco.com (Postfix) with ESMTPS id C151D79520
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:20:10 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 78791CBF223; Tue, 24 Nov 2026 21:20:09 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 04/10] python3-aiohttp: fix CVE-2026-128126
Date: Tue, 24 Nov 2026 21:20:00 -0800
Message-Id: <20261125052006.3116497-5-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125052006.3116497-1-asparmar@cisco.com>
References: <20261125052006.3116497-1-asparmar@cisco.com>
MIME-Version: 1.0
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-01.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132979
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the form field count limit for CVE-2026-128126 from
the upstream stable branch [1].

Bound the number of URL-encoded and multipart form fields accepted by a
request and return HTTP 413 when the limit is exceeded.

[1] https://github.com/aio-libs/aiohttp/commit/615fec3d4f088f30d2ee72cad760152e92aa1c53
[2] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-xgw8-8ccx-rmqh

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../python3-aiohttp/CVE-2026-128126.patch     | 599 ++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |   1 +
 2 files changed, 600 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128126.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128126.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128126.patch
new file mode 100644
index 0000000000..ac29cc6e2a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128126.patch
@@ -0,0 +1,599 @@
+From 9560840e8b61ccd1cb7c0ba4930f4921d5a37a1f Mon Sep 17 00:00:00 2001
+From: "J. Nick Koston" <nick@koston.org>
+Date: Wed, 16 Sep 2026 11:27:29 -0500
+Subject: [PATCH] [PR #13738/8b010057 backport][3.14] Add client_max_fields
+ option to Application (#13741)
+
+Fixes
+#123
+
+CVE: CVE-2026-128126
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/615fec3d4f088f30d2ee72cad760152e92aa1c53]
+
+Backport Changes:
+- Retain parse_qsl and use its max_num_fields argument because the
+  current yarl dependency has no query_to_pairs API. Preserve blank
+  values and charset decoding without upgrading that dependency.
+- Adapt the changelog to describe the field limit without claiming a
+  parser switch. Omit upstream versionadded directives because they do
+  not describe this backport.
+- Supply actual_size to HTTPRequestEntityTooLarge, as required by the
+  existing exception constructor, and retain the existing type context.
+- Use the existing StreamReader buffer size in the URL-encoded tests;
+  DEFAULT_CHUNK_SIZE is not available in the current helpers module.
+- Omit the AGENTS.md hunk: that upstream developer-documentation file
+  is absent and is unrelated to the form-field limit.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ CHANGES/13738.feature.rst    |   7 ++
+ aiohttp/test_utils.py        |  10 ++-
+ aiohttp/web_app.py           |   4 +
+ aiohttp/web_request.py       |  43 ++++++++--
+ docs/web_advanced.rst        |   5 +-
+ docs/web_quickstart.rst      |   6 +-
+ docs/web_reference.rst       |  25 +++++-
+ tests/test_web_functional.py |  59 +++++++++++++-
+ tests/test_web_request.py    | 147 +++++++++++++++++++++++++++++++++++
+ 9 files changed, 293 insertions(+), 13 deletions(-)
+ create mode 100644 CHANGES/13738.feature.rst
+
+diff --git a/CHANGES/13738.feature.rst b/CHANGES/13738.feature.rst
+new file mode 100644
+index 0000000..2aec51e
+--- /dev/null
++++ b/CHANGES/13738.feature.rst
+@@ -0,0 +1,7 @@
++Added the ``client_max_fields`` argument to
++:class:`~aiohttp.web.Application` (default ``1000``) to cap the number
++of URL-encoded and multipart form fields accepted by
++:meth:`~aiohttp.web.BaseRequest.post`. Forms with more than
++1000 fields now receive a ``413`` response unless the cap is raised;
++``0`` disables the limit. Empty URL-encoded segments also count
++toward the limit -- by :user:`bdraco`.
+diff --git a/aiohttp/test_utils.py b/aiohttp/test_utils.py
+index 34b77d4..a0dd261 100644
+--- a/aiohttp/test_utils.py
++++ b/aiohttp/test_utils.py
+@@ -676,6 +676,7 @@ def make_mocked_request(
+     payload: StreamReader = EMPTY_PAYLOAD,
+     sslcontext: Optional[SSLContext] = None,
+     client_max_size: int = 1024**2,
++    client_max_fields: int = 1000,
+     loop: Any = ...,
+ ) -> Request:
+     """Creates mocked web.Request testing purposes.
+@@ -750,7 +751,14 @@ def make_mocked_request(
+     protocol.writer = writer
+ 
+     req = Request(
+-        message, payload, protocol, writer, task, loop, client_max_size=client_max_size
++        message,
++        payload,
++        protocol,
++        writer,
++        task,
++        loop,
++        client_max_size=client_max_size,
++        client_max_fields=client_max_fields,
+     )
+ 
+     match_info = UrlMappingMatchInfo(
+diff --git a/aiohttp/web_app.py b/aiohttp/web_app.py
+index 619c008..3ac8545 100644
+--- a/aiohttp/web_app.py
++++ b/aiohttp/web_app.py
+@@ -114,6 +114,7 @@ class Application(MutableMapping[Union[str, AppKey[Any]], Any]):
+             "_on_shutdown",
+             "_on_cleanup",
+             "_client_max_size",
++            "_client_max_fields",
+             "_cleanup_ctx",
+         ]
+     )
+@@ -126,6 +127,7 @@ class Application(MutableMapping[Union[str, AppKey[Any]], Any]):
+         middlewares: Iterable[Middleware] = (),
+         handler_args: Optional[Mapping[str, Any]] = None,
+         client_max_size: int = 1024**2,
++        client_max_fields: int = 1000,
+         loop: Optional[asyncio.AbstractEventLoop] = None,
+         debug: Any = ...,  # mypy doesn't support ellipsis
+     ) -> None:
+@@ -173,6 +175,7 @@ class Application(MutableMapping[Union[str, AppKey[Any]], Any]):
+         self._on_startup.append(self._cleanup_ctx._on_startup)
+         self._on_cleanup.append(self._cleanup_ctx._on_cleanup)
+         self._client_max_size = client_max_size
++        self._client_max_fields = client_max_fields
+ 
+     def __init_subclass__(cls: Type["Application"]) -> None:
+         warnings.warn(
+@@ -508,6 +511,7 @@ class Application(MutableMapping[Union[str, AppKey[Any]], Any]):
+             task,
+             self._loop,
+             client_max_size=self._client_max_size,
++            client_max_fields=self._client_max_fields,
+         )
+ 
+     def _prepare_middleware(self) -> Iterator[Tuple[Middleware, bool]]:
+diff --git a/aiohttp/web_request.py b/aiohttp/web_request.py
+index 6e9de9a..ca6e7c4 100644
+--- a/aiohttp/web_request.py
++++ b/aiohttp/web_request.py
+@@ -147,6 +147,14 @@ _FORWARDED_PAIR_RE: Final[Pattern[str]] = re.compile(_FORWARDED_PAIR)
+ ############################################################
+ 
+ 
++def _too_many_fields(max_fields: int) -> HTTPRequestEntityTooLarge:
++    return HTTPRequestEntityTooLarge(
++        max_fields,
++        max_fields + 1,
++        text=f"Maximum number of form fields {max_fields} exceeded.",
++    )
++
++
+ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+ 
+     POST_METHODS = {
+@@ -173,6 +181,7 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+             "_cache",
+             "_task",
+             "_client_max_size",
++            "_client_max_fields",
+             "_loop",
+             "_transport_sslcontext",
+             "_transport_peername",
+@@ -191,6 +200,7 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+         loop: asyncio.AbstractEventLoop,
+         *,
+         client_max_size: int = 1024**2,
++        client_max_fields: int = 1000,
+         state: Optional[Dict[str, Any]] = None,
+         scheme: Optional[str] = None,
+         host: Optional[str] = None,
+@@ -233,6 +243,7 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+         self._state = {} if state is None else state
+         self._task = task
+         self._client_max_size = client_max_size
++        self._client_max_fields = client_max_fields
+         self._loop = loop
+ 
+         self._transport_sslcontext = protocol.ssl_context
+@@ -251,6 +262,7 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+         host: Union[str, _SENTINEL] = sentinel,
+         remote: Union[str, _SENTINEL] = sentinel,
+         client_max_size: Union[int, _SENTINEL] = sentinel,
++        client_max_fields: Union[int, _SENTINEL] = sentinel,
+     ) -> "BaseRequest":
+         """Clone itself with replacement some attributes.
+ 
+@@ -287,6 +299,8 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+             kwargs["remote"] = remote
+         if client_max_size is sentinel:
+             client_max_size = self._client_max_size
++        if client_max_fields is sentinel:
++            client_max_fields = self._client_max_fields
+ 
+         return self.__class__(
+             message,
+@@ -296,6 +310,7 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+             self._task,
+             self._loop,
+             client_max_size=client_max_size,
++            client_max_fields=client_max_fields,
+             state=self._state.copy(),
+             **kwargs,
+         )
+@@ -322,6 +337,10 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+     def client_max_size(self) -> int:
+         return self._client_max_size
+ 
++    @property
++    def client_max_fields(self) -> int:
++        return self._client_max_fields
++
+     @reify
+     def message(self) -> RawRequestMessage:
+         warnings.warn("Request.message is deprecated", DeprecationWarning, stacklevel=3)
+@@ -757,11 +776,13 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+             self._post = MultiDictProxy(MultiDict())
+             return self._post
+ 
+-        out: MultiDict[Union[str, bytes, FileField]] = MultiDict()
++        out: MultiDict[Union[str, bytes, FileField]]
+ 
+         if content_type == "multipart/form-data":
++            out = MultiDict()
+             multipart = await self.multipart()
+             max_size = self._client_max_size
++            max_fields = self._client_max_fields
+ 
+             payload = self._payload
+             while (field := await multipart.next()) is not None:
+@@ -771,6 +792,8 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+                     raise HTTPRequestEntityTooLarge(
+                         max_size=max_size, actual_size=payload.total_bytes
+                     )
++                if 0 < max_fields <= len(out):
++                    raise _too_many_fields(max_fields)
+ 
+                 field_ct = field.headers.get(hdrs.CONTENT_TYPE)
+ 
+@@ -850,17 +873,23 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+                     raise ValueError(
+                         "To decode nested multipart you need to use custom reader",
+                     )
++        elif not (data := await self.read()):
++            out = MultiDict()
+         else:
+-            data = await self.read()
+-            if data:
+-                charset = self.charset or "utf-8"
+-                out.extend(
++            charset = self.charset or "utf-8"
++            query = data.rstrip().decode(charset)
++            max_fields = self._client_max_fields
++            try:
++                out = MultiDict(
+                     parse_qsl(
+-                        data.rstrip().decode(charset),
++                        query,
+                         keep_blank_values=True,
++                        max_num_fields=max_fields if max_fields > 0 else None,
+                         encoding=charset,
+                     )
+                 )
++            except ValueError:
++                raise _too_many_fields(max_fields) from None
+ 
+         self._post = MultiDictProxy(out)
+         return self._post
+@@ -935,6 +964,7 @@ class Request(BaseRequest):
+         host: Union[str, _SENTINEL] = sentinel,
+         remote: Union[str, _SENTINEL] = sentinel,
+         client_max_size: Union[int, _SENTINEL] = sentinel,
++        client_max_fields: Union[int, _SENTINEL] = sentinel,
+     ) -> "Request":
+         ret = super().clone(
+             method=method,
+@@ -944,6 +974,7 @@ class Request(BaseRequest):
+             host=host,
+             remote=remote,
+             client_max_size=client_max_size,
++            client_max_fields=client_max_fields,
+         )
+         new_ret = cast(Request, ret)
+         new_ret._match_info = self._match_info
+diff --git a/docs/web_advanced.rst b/docs/web_advanced.rst
+index 0912327..766c07f 100644
+--- a/docs/web_advanced.rst
++++ b/docs/web_advanced.rst
+@@ -1255,8 +1255,9 @@ That's why *aiohttp server* should setup *forwarded* headers in custom
+ middleware in tight conjunction with *reverse proxy configuration*.
+ 
+ For changing :attr:`BaseRequest.scheme` :attr:`BaseRequest.host`
+-:attr:`BaseRequest.remote` and :attr:`BaseRequest.client_max_size`
+-the middleware might use :meth:`BaseRequest.clone`.
++:attr:`BaseRequest.remote`, :attr:`BaseRequest.client_max_size` and
++:attr:`BaseRequest.client_max_fields` the middleware might use
++:meth:`BaseRequest.clone`.
+ 
+ .. seealso::
+ 
+diff --git a/docs/web_quickstart.rst b/docs/web_quickstart.rst
+index 2d8c336..6ebe2bc 100644
+--- a/docs/web_quickstart.rst
++++ b/docs/web_quickstart.rst
+@@ -480,8 +480,10 @@ To access form data with ``"POST"`` method use
+ :meth:`aiohttp.web.BaseRequest.post` accepts both
+ ``'application/x-www-form-urlencoded'`` and ``'multipart/form-data'``
+ form's data encoding (e.g. ``<form enctype="multipart/form-data">``).
+-It stores files data in temporary directory. If `client_max_size` is
+-specified `post` raises `ValueError` exception.
++It stores files data in temporary directory. If the body exceeds
++`client_max_size` or the form has more than `client_max_fields` fields
++(1000 by default, `0` disables the cap), `post` raises
++``HTTPRequestEntityTooLarge`` exception.
+ For efficiency use :meth:`aiohttp.web.BaseRequest.multipart`, It is especially effective
+ for uploading large files (:ref:`aiohttp-web-file-upload`).
+ 
+diff --git a/docs/web_reference.rst b/docs/web_reference.rst
+index ddb43e8..f48ecc1 100644
+--- a/docs/web_reference.rst
++++ b/docs/web_reference.rst
+@@ -157,6 +157,15 @@ and :ref:`aiohttp-web-signals` handlers.
+ 
+       Read-only :class:`int` property.
+ 
++   .. attribute:: client_max_fields
++
++      The maximum number of form fields accepted by :meth:`~BaseRequest.post`,
++      ``0`` disables the limit.
++
++      The value could be overridden by :meth:`~BaseRequest.clone`.
++
++      Read-only :class:`int` property.
++
+    .. attribute:: path_qs
+ 
+       The URL including PATH_INFO and the query string. e.g.,
+@@ -492,6 +501,10 @@ and :ref:`aiohttp-web-signals` handlers.
+       *application/x-www-form-urlencoded* or *multipart/form-data*
+       returns empty multidict.
+ 
++      Raises ``HTTPRequestEntityTooLarge`` if the body exceeds
++      :attr:`client_max_size` or the form has more than
++      :attr:`client_max_fields` fields.
++
+       .. note::
+ 
+          The method **does** store read data internally, subsequent
+@@ -1438,7 +1451,7 @@ Application and Router
+ 
+ .. class:: Application(*, logger=<default>, router=None, middlewares=(), \
+                        handler_args=None, client_max_size=1024**2, \
+-                       loop=None, debug=...)
++                       client_max_fields=1000, loop=None, debug=...)
+ 
+    Application is a synonym for web-server.
+ 
+@@ -1491,6 +1504,16 @@ Application and Router
+                            value, it raises an
+                            `HTTPRequestEntityTooLarge` exception.
+ 
++   :param client_max_fields: maximum number of form fields accepted by
++                             :meth:`BaseRequest.post`, counting both
++                             urlencoded pairs and multipart parts.  For
++                             urlencoded bodies every ``&``-separated
++                             segment counts, including empty ones, so the
++                             check runs before any field is decoded.  If a
++                             POST request exceeds this value, it raises an
++                             `HTTPRequestEntityTooLarge` exception.
++                             ``0`` disables the limit.  Default is ``1000``.
++
+    :param loop: event loop
+ 
+       .. deprecated:: 2.0
+diff --git a/tests/test_web_functional.py b/tests/test_web_functional.py
+index ffb2b95..c5c4b5b 100644
+--- a/tests/test_web_functional.py
++++ b/tests/test_web_functional.py
+@@ -6,9 +6,10 @@ import os
+ import pathlib
+ import socket
+ import sys
+-from typing import Any, Dict, Generator, NoReturn, Optional, Tuple
++from typing import Any, Callable, Dict, Generator, NoReturn, Optional, Tuple
+ import zlib
+ from contextlib import suppress
++from functools import partial
+ from unittest import mock
+ 
+ import pytest
+@@ -1993,6 +1994,62 @@ async def test_app_max_client_size(aiohttp_client: AiohttpClient) -> None:
+     await resp.release()
+ 
+ 
++def _multipart_form(count: int) -> aiohttp.FormData:
++    form = aiohttp.FormData(default_to_multipart=True)
++    for i in range(count):
++        form.add_field(f"f{i}", "v")
++    return form
++
++
++@pytest.mark.parametrize(
++    ("make_app", "make_data", "expected_status", "expected_text"),
++    [
++        (
++            partial(web.Application, client_max_fields=2),
++            partial(dict, a="1", b="2", c="3"),
++            413,
++            "2 exceeded",
++        ),
++        (
++            partial(web.Application, client_max_fields=2),
++            partial(_multipart_form, 3),
++            413,
++            "2 exceeded",
++        ),
++        (
++            partial(web.Application, client_max_fields=0),
++            partial(dict, {f"f{i}": "v" for i in range(5)}),
++            200,
++            "5",
++        ),
++        (
++            web.Application,
++            partial(dict, {f"f{i}": "v" for i in range(1001)}),
++            413,
++            "1000 exceeded",
++        ),
++    ],
++)
++async def test_app_max_client_fields(
++    aiohttp_client: AiohttpClient,
++    make_app: Callable[[], web.Application],
++    make_data: Callable[[], object],
++    expected_status: int,
++    expected_text: str,
++) -> None:
++    async def handler(request: web.Request) -> web.Response:
++        form = await request.post()
++        return web.Response(text=str(len(form)))
++
++    app = make_app()
++    app.router.add_post("/", handler)
++    client = await aiohttp_client(app)
++
++    async with client.post("/", data=make_data()) as resp:
++        assert resp.status == expected_status
++        assert expected_text in await resp.text()
++
++
+ async def test_app_max_client_size_adjusted(aiohttp_client: AiohttpClient) -> None:
+     async def handler(request: web.Request) -> web.Response:
+         await request.post()
+diff --git a/tests/test_web_request.py b/tests/test_web_request.py
+index 44bf7a3..0ef96ac 100644
+--- a/tests/test_web_request.py
++++ b/tests/test_web_request.py
+@@ -780,6 +780,23 @@ def test_clone_override_client_max_size() -> None:
+     assert req2.client_max_size == 2048
+ 
+ 
++def test_client_max_fields_default() -> None:
++    req = make_mocked_request("GET", "/path")
++    assert req.client_max_fields == 1000
++
++
++def test_clone_client_max_fields() -> None:
++    req = make_mocked_request("GET", "/path", client_max_fields=5)
++    req2 = req.clone()
++    assert req2.client_max_fields == 5
++
++
++def test_clone_override_client_max_fields() -> None:
++    req = make_mocked_request("GET", "/path", client_max_fields=5)
++    req2 = req.clone(client_max_fields=10)
++    assert req2.client_max_fields == 10
++
++
+ def test_clone_method() -> None:
+     req = make_mocked_request("GET", "/path")
+     req2 = req.clone(method="POST")
+@@ -872,6 +889,136 @@ async def test_multipart_formdata(protocol) -> None:
+     assert dict(result) == {"a": "b", "c": "d"}
+ 
+ 
++def _multipart_form_payload(protocol: BaseProtocol, count: int) -> StreamReader:
++    payload = StreamReader(protocol, 2**16, loop=asyncio.get_running_loop())
++    payload.feed_data(
++        b"".join(
++            b"-----------------------------326931944431359\r\n"
++            b'Content-Disposition: form-data; name="f%d"\r\n'
++            b"\r\n"
++            b"v\r\n" % i
++            for i in range(count)
++        )
++        + b"-----------------------------326931944431359--\r\n"
++    )
++    payload.feed_eof()
++    return payload
++
++
++_MULTIPART_CONTENT_TYPE = (
++    "multipart/form-data; boundary=---------------------------326931944431359"
++)
++
++
++async def test_multipart_formdata_too_many_fields(protocol: BaseProtocol) -> None:
++    payload = _multipart_form_payload(protocol, 3)
++    req = make_mocked_request(
++        "POST",
++        "/",
++        headers={"CONTENT-TYPE": _MULTIPART_CONTENT_TYPE},
++        payload=payload,
++        client_max_fields=2,
++    )
++    with pytest.raises(web.HTTPRequestEntityTooLarge) as err:
++        await req.post()
++    assert err.value.status_code == 413
++    assert err.value.text == "Maximum number of form fields 2 exceeded."
++
++
++@pytest.mark.parametrize(("client_max_fields", "count"), [(2, 2), (0, 5), (-1, 5)])
++async def test_multipart_formdata_within_field_limit(
++    protocol: BaseProtocol, client_max_fields: int, count: int
++) -> None:
++    payload = _multipart_form_payload(protocol, count)
++    req = make_mocked_request(
++        "POST",
++        "/",
++        headers={"CONTENT-TYPE": _MULTIPART_CONTENT_TYPE},
++        payload=payload,
++        client_max_fields=client_max_fields,
++    )
++    result = await req.post()
++    assert len(result) == count
++
++
++def _urlencoded_payload(protocol: BaseProtocol, body: bytes) -> StreamReader:
++    payload = StreamReader(
++        protocol, 2**16, loop=asyncio.get_running_loop()
++    )
++    payload.feed_data(body)
++    payload.feed_eof()
++    return payload
++
++
++_URLENCODED_HEADERS = {"Content-Type": "application/x-www-form-urlencoded"}
++
++
++async def test_urlencoded_form_too_many_fields(protocol: BaseProtocol) -> None:
++    payload = _urlencoded_payload(protocol, b"a=1&b=2&c=3")
++    req = make_mocked_request(
++        "POST", "/", payload=payload, headers=_URLENCODED_HEADERS, client_max_fields=2
++    )
++    with pytest.raises(web.HTTPRequestEntityTooLarge) as err:
++        await req.post()
++    assert err.value.status_code == 413
++    assert err.value.text == "Maximum number of form fields 2 exceeded."
++
++
++async def test_urlencoded_form_empty_segments_count(protocol: BaseProtocol) -> None:
++    payload = _urlencoded_payload(protocol, b"a=1&&b=2")
++    req = make_mocked_request(
++        "POST", "/", payload=payload, headers=_URLENCODED_HEADERS, client_max_fields=2
++    )
++    with pytest.raises(web.HTTPRequestEntityTooLarge):
++        await req.post()
++
++
++@pytest.mark.parametrize(("client_max_fields", "count"), [(2, 2), (0, 5), (-1, 5)])
++async def test_urlencoded_form_within_field_limit(
++    protocol: BaseProtocol, client_max_fields: int, count: int
++) -> None:
++    body = "&".join(f"f{i}=v" for i in range(count)).encode()
++    payload = _urlencoded_payload(protocol, body)
++    req = make_mocked_request(
++        "POST",
++        "/",
++        payload=payload,
++        headers=_URLENCODED_HEADERS,
++        client_max_fields=client_max_fields,
++    )
++    result = await req.post()
++    assert len(result) == count
++
++
++async def test_urlencoded_form_empty_body(protocol: BaseProtocol) -> None:
++    payload = _urlencoded_payload(protocol, b"")
++    req = make_mocked_request("POST", "/", payload=payload, headers=_URLENCODED_HEADERS)
++    result = await req.post()
++    assert len(result) == 0
++
++
++async def test_urlencoded_form_parse_qsl_parity(protocol: BaseProtocol) -> None:
++    payload = _urlencoded_payload(protocol, b"a=1+2&b=&&c&d=%zz&e=%C3%A9&f=%FF")
++    req = make_mocked_request("POST", "/", payload=payload, headers=_URLENCODED_HEADERS)
++    result = await req.post()
++    assert list(result.items()) == [
++        ("a", "1 2"),
++        ("b", ""),
++        ("c", ""),
++        ("d", "%zz"),
++        ("e", "\u00e9"),
++        ("f", "\ufffd"),
++    ]
++
++
++async def test_urlencoded_form_with_non_utf8_charset(protocol: BaseProtocol) -> None:
++    payload = _urlencoded_payload(protocol, b"a=%E9&b=\xe9")
++    headers = {"Content-Type": "application/x-www-form-urlencoded; charset=latin-1"}
++    req = make_mocked_request("POST", "/", payload=payload, headers=headers)
++    result = await req.post()
++    assert list(result.items()) == [("a", "\u00e9"), ("b", "\u00e9")]
++
++
+ async def test_multipart_formdata_field_missing_name(protocol: BaseProtocol) -> None:
+     # Ensure ValueError is raised when Content-Disposition has no name
+     payload = StreamReader(protocol, 2**16, loop=asyncio.get_event_loop())
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index bfd8912a0d..9424943281 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -36,6 +36,7 @@ SRC_URI += " \
     file://CVE-2026-123817_p2.patch \
     file://CVE-2026-128124.patch \
     file://CVE-2026-128125.patch \
+    file://CVE-2026-128126.patch \
 "
 
 CVE_PRODUCT = "aiohttp:aiohttp"
-- 
2.35.6

