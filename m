Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36179.1795583899216529360
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DFL04aoP;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=18418; q=dns/txt;
  s=iport01; t=1795583899; x=1796793499;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Raa5Zu5gaAWUHm2eyGmyONOS3L7gh8CxdSJRDBSFuyA=;
  b=DFL04aoP4AFekD+ILimYyDt+FfFYnv8gRiSTo9vRsFSsf8/AMGME7gcI
   kqKOgRtFLUByWI3QdIKJVT5eC9+LJ3TPaBbCXIrNol0aPgeXaRfQnS+Of
   6GTUUIjZXIfzBpvatXePyflaODuPI06QsL3PyfvKhmcIZhH/JVEbvnPzE
   iVj2+Z1uoQ3gCzQY9hSzoHmAiz7QRCuPDgabBqXNaAw9PPN/JzQ1ucn2t
   Ldir5eUZ6tIphGk+D7SaCYD9m7afeOG7kHxhNoqzswHhDCGRTUt2MQZms
   3QXN+4IA3mWcPjg+YC1UHoeQFxkcv5St1ChmZpfb4FA6BeasP+EWLFaQF
   Q==;
X-CSE-ConnectionGUID: EIyn7AT8SjqTXGeX1t4coQ==
X-CSE-MsgGUID: L4h4j0P4SDCYNkD1S2y+Pw==
X-IPAS-Result: =?us-ascii?q?A0AaAAAhbQZr/9NK/pBQChwBAQEBAQEHAQESAQEEBAEBg?=
 =?us-ascii?q?XwHAQELAYIXP3VgQ0kDjG+JWQOBE5A9jFmBfg8BAQEPRA0EAQGEP0YCjiICJ?=
 =?us-ascii?q?jQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4ThhUGNA2QEgECA?=
 =?us-ascii?q?QMnCwEYAS0QHAMBAi8rIwgQCYIqWAGCdAMRugOBeTOBAYMpAYFU2zMBCxQBg?=
 =?us-ascii?q?TgBhUGIJV0YAYQDeycbG4FygRWBO4EeG3aBBYFcAQECAYEqBgWGbgSCIoEMg?=
 =?us-ascii?q?VSNEwKBSYhSSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFgRyBH?=
 =?us-ascii?q?oESgQNdgSsoXQEhgQiBdQKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBG?=
 =?us-ascii?q?jU8CSY/FQxnCxoFYQgCDQx0ORAwHCQvBRkmPBsKgQwnHR4ZDgIpBhYhCzQYD?=
 =?us-ascii?q?UgRLDcVGQQ+bgeUE4JuLQENH2EBCg4RAQF/BgwPFBlfHAIwkmmEIot7giGhE?=
 =?us-ascii?q?Qoog3mMJJU6GjOEBIFXkkOSVAuYfYJZizGWAQNNhGqBaDyBWXAVgyIJShkPh?=
 =?us-ascii?q?lGHWgMLC4NghRPJSCYyAgkDLwEBBwIHDgMLgWiQAAEnBHJgAQE?=
IronPort-Data: A9a23:r7b6tKgYPBq9au03c4EVtLAyX161NxEKZh0ujC45NGQN5FlHY01je
 htvUGuGM/6CYmKgedAgbdvloEMD7ZWAm983TwtqrSg8Hi5jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn/SMhvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvje8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU12/dxXkhyp
 ccaMQw9QR2z3v7qy7WCH7wEasQLdKEHPasWt2slyXTSCuwrBMmbBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcWYz/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKLIoXaGZwOxS50o
 Erio2SlAEkiaOez4guj8V71vbXe3hvkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz5RvIzu/f5ByUQzFcCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:KYhqu64oOfMXgkhi2QPXwOrXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: 9a23:5sTMY22RdaxrRzzq5vWUm7xfN+E0dCL08CfrIVaEOUlkeOSJFVSXwfYx
X-Talos-MUID: =?us-ascii?q?9a23=3A5biD5w0R7ZHZQl5dArQ1MomFKTUjx/iuVEJVqck?=
 =?us-ascii?q?9l+K1Ey9cYgzHnXePXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60184133"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:18:15 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id C752E180001D1;
	Wed, 25 Nov 2026 05:18:14 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 7AA16CBF204; Tue, 24 Nov 2026 21:18:13 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 4/9] python3-aiohttp: fix CVE-2026-111066
Date: Tue, 24 Nov 2026 21:18:06 -0800
Message-Id: <20261125051811.2524271-5-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125051811.2524271-1-dkelaiya@cisco.com>
References: <20261125051811.2524271-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132969
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the multipart descriptor-exhaustion fix [1] to aiohttp
3.9.5. Spool small file parts in memory and count raw multipart
bytes, including headers, against client_max_size.

Include the upstream descriptor-test correction [2] so unrelated
file descriptors do not make the regression test unreliable.
Use synchronous BodyPartReader.decode(), retain the existing 64 KiB
reads, and adapt the HTTP 413 constructor and raw-size assertion.
The vulnerability and fixed release are documented in [3].

[1] https://github.com/aio-libs/aiohttp/commit/2d94633b7f1b4c1ba07d647b629a8440652b2d09
[2] https://github.com/aio-libs/aiohttp/commit/011c08204197beba8281911907b59ffcecea1413
[3] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-9xw5-w5jj-pvcg

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-111066_p1.patch  | 397 ++++++++++++++++++
 .../python3-aiohttp/CVE-2026-111066_p2.patch  |  59 +++
 .../python/python3-aiohttp_3.9.5.bb           |   2 +
 3 files changed, 458 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066_p2.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066_p1.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066_p1.patch
new file mode 100644
index 0000000000..69bdbbec99
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066_p1.patch
@@ -0,0 +1,397 @@
+From 2d94633b7f1b4c1ba07d647b629a8440652b2d09 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Tue, 18 Aug 2026 21:54:45 +0100
+Subject: [PATCH] Reduce number of file descriptors needed in multipart
+ messages (#13426) (#13475)
+
+CVE: CVE-2026-111066
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/2d94633b7f1b4c1ba07d647b629a8440652b2d09]
+
+Backport Changes:
+- Use synchronous BodyPartReader.decode() and 64 KiB reads in place
+  of the newer decode_iter()/DEFAULT_CHUNK_SIZE APIs.
+- Pass payload.total_bytes to the older HTTP 413 constructor and
+  adjust the existing size-limit test for raw multipart accounting.
+- Omit the cleanup-comment hunk because BaseRequest._finish() is
+  absent from aiohttp 3.9.5.
+
+(cherry picked from commit c92ed4c48dafd40d5ed4c86587af9e081ac7d971)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/13426.bugfix.rst     |   1 +
+ aiohttp/web_request.py       |  95 ++++++++++++++-----
+ tests/test_web_functional.py | 171 +++++++++++++++++++++++++++++++++--
+ 3 files changed, 240 insertions(+), 27 deletions(-)
+ create mode 100644 CHANGES/13426.bugfix.rst
+
+diff --git a/CHANGES/13426.bugfix.rst b/CHANGES/13426.bugfix.rst
+new file mode 100644
+index 0000000..8b9ee29
+--- /dev/null
++++ b/CHANGES/13426.bugfix.rst
+@@ -0,0 +1 @@
++Switched multipart handling to use spooled temporary files to reduce number of file descriptors needed -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/web_request.py b/aiohttp/web_request.py
+index f9de595..26279d5 100644
+--- a/aiohttp/web_request.py
++++ b/aiohttp/web_request.py
+@@ -4,12 +4,13 @@ import io
+ import re
+ import socket
+ import string
+-import tempfile
++import sys
+ import types
+ import warnings
+ from http.cookies import SimpleCookie
+ from types import MappingProxyType
+ from typing import (
++    IO,
+     TYPE_CHECKING,
+     Any,
+     Dict,
+@@ -64,6 +65,30 @@ from .typedefs import (
+ from .web_exceptions import HTTPRequestEntityTooLarge
+ from .web_response import StreamResponse
+ 
++if sys.version_info >= (3, 11):
++    from tempfile import SpooledTemporaryFile
++else:
++    import tempfile
++
++    class SpooledTemporaryFile(tempfile.SpooledTemporaryFile[bytes], io.IOBase):
++        """Make the spooled file satisfy the documented `FileField.file` type.
++
++        `tempfile.SpooledTemporaryFile` only became an `io.IOBase` subclass in
++        3.11 (python/cpython#70363), and never grew the three capability
++        predicates before then. Both underlying files (`io.BytesIO` before
++        rollover, a `w+b` temp file after) are readable, writable and seekable.
++        """
++
++        def readable(self) -> bool:
++            return True
++
++        def writable(self) -> bool:
++            return True
++
++        def seekable(self) -> bool:
++            return True
++
++
+ __all__ = ("BaseRequest", "FileField", "Request")
+ 
+ 
+@@ -73,11 +98,18 @@ if TYPE_CHECKING:
+     from .web_urldispatcher import UrlMappingMatchInfo
+ 
+ 
++# Multipart file parts are buffered in memory and only spilled to a temporary
++# file once they outgrow this size. A temp file per part would let a body made
++# of many tiny parts exhaust the process's file descriptors; spooling bounds
++# that at ``client_max_size // _FILE_SPOOL_MAX_SIZE`` descriptors per request.
++_FILE_SPOOL_MAX_SIZE: Final[int] = 1024**2
++
++
+ @attr.s(auto_attribs=True, frozen=True, slots=True)
+ class FileField:
+     name: str
+     filename: str
+-    file: io.BufferedReader
++    file: IO[bytes]
+     content_type: str
+     headers: "CIMultiDictProxy[str]"
+ 
+@@ -717,8 +749,15 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+             multipart = await self.multipart()
+             max_size = self._client_max_size
+ 
+-            size = 0
++            payload = self._payload
+             while (field := await multipart.next()) is not None:
++                # This check is needed for empty payloads, which still add
++                # overhead without entering the loop and the check below.
++                if 0 < max_size < payload.total_bytes:
++                    raise HTTPRequestEntityTooLarge(
++                        max_size=max_size, actual_size=payload.total_bytes
++                    )
++
+                 field_ct = field.headers.get(hdrs.CONTENT_TYPE)
+ 
+                 if isinstance(field, BodyPartReader):
+@@ -730,22 +769,37 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+                     # present.
+                     # https://tools.ietf.org/html/rfc7578#section-4.4
+                     if field.filename:
+-                        # store file in temp file
+-                        tmp = await self._loop.run_in_executor(
+-                            None, tempfile.TemporaryFile
+-                        )
+-                        chunk = await field.read_chunk(size=2**16)
+-                        while chunk:
+-                            chunk = field.decode(chunk)
+-                            await self._loop.run_in_executor(None, tmp.write, chunk)
+-                            size += len(chunk)
+-                            if 0 < max_size < size:
+-                                await self._loop.run_in_executor(None, tmp.close)
++                        tmp = SpooledTemporaryFile(_FILE_SPOOL_MAX_SIZE)
++                        # rolled means the temp file now uses the disk, at
++                        # which point we want to run in the executor.
++                        rolled = False
++                        while chunk := await field.read_chunk(size=2**16):
++                            # Bounds one part, mid-read.
++                            if 0 < max_size < payload.total_bytes:
++                                if rolled:
++                                    await self._loop.run_in_executor(None, tmp.close)
++                                else:
++                                    tmp.close()
+                                 raise HTTPRequestEntityTooLarge(
+-                                    max_size=max_size, actual_size=size
++                                    max_size=max_size, actual_size=payload.total_bytes
++                                )
++                            decoded_chunk = field.decode(chunk)
++                            # Update before writing, so we know if next
++                            # write is going to hit the disk.
++                            rolled = rolled or (
++                                tmp.tell() + len(decoded_chunk)
++                                > _FILE_SPOOL_MAX_SIZE
++                            )
++                            if rolled:
++                                await self._loop.run_in_executor(
++                                    None, tmp.write, decoded_chunk
+                                 )
+-                            chunk = await field.read_chunk(size=2**16)
+-                        await self._loop.run_in_executor(None, tmp.seek, 0)
++                            else:
++                                tmp.write(decoded_chunk)
++                        if rolled:
++                            await self._loop.run_in_executor(None, tmp.seek, 0)
++                        else:
++                            tmp.seek(0)
+ 
+                         if field_ct is None:
+                             field_ct = "application/octet-stream"
+@@ -753,7 +807,7 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+                         ff = FileField(
+                             field.name,
+                             field.filename,
+-                            cast(io.BufferedReader, tmp),
++                            tmp,
+                             field_ct,
+                             field.headers,
+                         )
+@@ -762,10 +816,9 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+                         # deal with ordinary data
+                         raw_data = bytearray()
+                         while chunk := await field.read_chunk():
+-                            size += len(chunk)
+-                            if 0 < max_size < size:
++                            if 0 < max_size < payload.total_bytes:
+                                 raise HTTPRequestEntityTooLarge(
+-                                    max_size=max_size, actual_size=size
++                                    max_size=max_size, actual_size=payload.total_bytes
+                                 )
+                             raw_data.extend(chunk)
+ 
+diff --git a/tests/test_web_functional.py b/tests/test_web_functional.py
+index a0e3a8e..78bd265 100644
+--- a/tests/test_web_functional.py
++++ b/tests/test_web_functional.py
+@@ -1,6 +1,8 @@
+ import asyncio
++import base64
+ import io
+ import json
++import os
+ import pathlib
+ import socket
+ import zlib
+@@ -28,6 +30,7 @@ from aiohttp.streams import StreamReader
+ from aiohttp.test_utils import make_mocked_coro
+ from aiohttp.typedefs import Handler
+ from aiohttp.web_protocol import MAX_MSG_QUEUE_SIZE, RequestHandler
++from aiohttp.web_request import _FILE_SPOOL_MAX_SIZE
+ 
+ try:
+     import brotlicffi as brotli
+@@ -1964,10 +1967,7 @@ async def test_post_max_client_size(aiohttp_client) -> None:
+ 
+         assert 413 == resp.status
+         resp_text = await resp.text()
+-        assert (
+-            "Maximum request body size 10 exceeded, "
+-            "actual body size 1024" in resp_text
+-        )
++        assert "Maximum request body size 10 exceeded" in resp_text
+         data["file"].close()
+ 
+         await resp.release()
+@@ -1991,8 +1991,167 @@ async def test_post_max_client_size_for_file(aiohttp_client) -> None:
+     await resp.release()
+ 
+ 
+-async def test_response_with_bodypart(aiohttp_client) -> None:
+-    async def handler(request):
++def _multipart_file_parts(count: int, body: bytes = b"") -> bytes:
++    """Raw multipart/form-data body of ``count`` file parts, boundary ``b``."""
++    return (
++        b"".join(
++            b'--b\r\nContent-Disposition: form-data; name="f%d"; '
++            b'filename="x"\r\n\r\n' % index + body + b"\r\n"
++            for index in range(count)
++        )
++        + b"--b--\r\n"
++    )
++
++
++async def test_post_max_client_size_counts_multipart_headers(
++    aiohttp_client: AiohttpClient,
++) -> None:
++    async def handler(request: web.Request) -> NoReturn:
++        await request.post()
++        assert False
++
++    app = web.Application(client_max_size=1)
++    app.router.add_post("/", handler)
++    client = await aiohttp_client(app)
++
++    body = _multipart_file_parts(55)
++    assert len(body) > 1
++    async with client.post(
++        "/", data=body, headers={CONTENT_TYPE: "multipart/form-data; boundary=b"}
++    ) as resp:
++        assert resp.status == 413
++
++
++@pytest.mark.parametrize(
++    "max_size",
++    (_FILE_SPOOL_MAX_SIZE, 2 * _FILE_SPOOL_MAX_SIZE),
++    ids=("spooled", "rolled-over"),
++)
++async def test_post_max_client_size_within_single_part(
++    aiohttp_client: AiohttpClient, max_size: int
++) -> None:
++    async def handler(request: web.Request) -> NoReturn:
++        await request.post()
++        assert False
++
++    app = web.Application(client_max_size=max_size)
++    app.router.add_post("/", handler)
++    client = await aiohttp_client(app)
++
++    # A sole oversized part is never followed by a boundary, so only the
++    # per-chunk check can reject it, and it must do so before buffering. The
++    # larger limit lets the part reach the disk first, so the spool is then
++    # closed off the event loop too.
++    data = FormData()
++    with io.BytesIO(b"x" * (3 * _FILE_SPOOL_MAX_SIZE)) as file_handle:
++        data.add_field("file", file_handle, filename="x.bin")
++        async with client.post("/", data=data) as resp:
++            assert resp.status == 413
++
++
++@pytest.mark.parametrize("filename", (b"", b'; filename="x"'), ids=("field", "file"))
++async def test_post_max_client_size_counts_undecoded_bytes(
++    aiohttp_client: AiohttpClient, filename: bytes
++) -> None:
++    async def handler(request: web.Request) -> NoReturn:
++        await request.post()
++        assert False
++
++    limit = 64 * 1024
++    app = web.Application(client_max_size=limit)
++    app.router.add_post("/", handler)
++    client = await aiohttp_client(app)
++
++    # base64 decodes to exactly the limit but arrives 4/3 larger. The limit is
++    # on the request body, so both kinds of part must reject it alike.
++    encoded = base64.b64encode(b"A" * limit)
++    assert len(encoded) > limit
++    body = (
++        b'--b\r\nContent-Disposition: form-data; name="f"' + filename + b"\r\n"
++        b"Content-Transfer-Encoding: base64\r\n\r\n" + encoded + b"\r\n--b--\r\n"
++    )
++    async with client.post(
++        "/", data=body, headers={CONTENT_TYPE: "multipart/form-data; boundary=b"}
++    ) as resp:
++        assert resp.status == 413
++
++
++@pytest.mark.skipif(not os.path.isdir("/dev/fd"), reason="needs /dev/fd to count fds")
++@pytest.mark.parametrize(
++    ("parts", "part_body", "expected_fds"),
++    (
++        (55, b"payload", 0),
++        (1, b"x" * (_FILE_SPOOL_MAX_SIZE + 1), 1),
++    ),
++    ids=("many-small-parts", "one-oversized-part"),
++)
++async def test_post_file_fields_descriptor_cost(
++    aiohttp_client: AiohttpClient, parts: int, part_body: bytes, expected_fds: int
++) -> None:
++    """Only a part past the spool size may cost a descriptor."""
++
++    async def handler(request: web.Request) -> web.Response:
++        before = set(await asyncio.to_thread(os.listdir, "/dev/fd"))
++        data = await request.post()
++        after = set(await asyncio.to_thread(os.listdir, "/dev/fd"))
++        assert len(data) == parts
++        return web.Response(text=str(len(after - before)))
++
++    app = web.Application(client_max_size=8 * 1024**2)
++    app.router.add_post("/", handler)
++    client = await aiohttp_client(app)
++
++    with io.BytesIO(_multipart_file_parts(parts, part_body)) as body:
++        async with client.post(
++            "/",
++            data=body,
++            headers={CONTENT_TYPE: "multipart/form-data; boundary=b"},
++        ) as resp:
++            assert resp.status == 200
++            assert await resp.text() == str(expected_fds)
++
++
++@pytest.mark.parametrize(
++    "size",
++    (
++        0,
++        1,
++        _FILE_SPOOL_MAX_SIZE - 1,
++        _FILE_SPOOL_MAX_SIZE,
++        _FILE_SPOOL_MAX_SIZE + 1,
++    ),
++)
++async def test_post_file_field_spool_rollover(
++    aiohttp_client: AiohttpClient, size: int
++) -> None:
++    """A part is byte-identical either side of the spool/temp-file boundary."""
++    payload = (b"0123456789abcdef" * (size // 16 + 1))[:size]
++
++    async def handler(request: web.Request) -> web.Response:
++        field = (await request.post())["file"]
++        assert isinstance(field, aiohttp.web_request.FileField)
++        assert isinstance(field.file, io.IOBase)
++        assert field.file.readable()
++        assert field.file.writable()
++        assert field.file.seekable()
++        content = await asyncio.to_thread(field.file.read)
++        assert len(content) == size
++        assert content == payload
++        return web.Response()
++
++    app = web.Application(client_max_size=8 * 1024**2)
++    app.router.add_post("/", handler)
++    client = await aiohttp_client(app)
++
++    data = FormData()
++    with io.BytesIO(payload) as file_handle:
++        data.add_field("file", file_handle, filename="x.bin")
++        async with client.post("/", data=data) as resp:
++            assert resp.status == 200
++
++
++async def test_response_with_bodypart(aiohttp_client: AiohttpClient) -> None:
++    async def handler(request: web.Request) -> web.Response:
+         reader = await request.multipart()
+         part = await reader.next()
+         return web.Response(body=part)
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066_p2.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066_p2.patch
new file mode 100644
index 0000000000..49db38b641
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066_p2.patch
@@ -0,0 +1,59 @@
+From 011c08204197beba8281911907b59ffcecea1413 Mon Sep 17 00:00:00 2001
+From: "patchback[bot]" <45432694+patchback[bot]@users.noreply.github.com>
+Date: Wed, 26 Aug 2026 02:39:52 +0100
+Subject: [PATCH] [PR #13549/4602990f backport][3.14] Fix flaky descriptor test
+ (#13551)
+
+**This is a backport of PR #13549 as merged into master
+(4602990f60241f759f861a3a4c1243ba2294ab53).**
+
+Co-authored-by: Sam Bull <git@sambull.org>
+
+CVE: CVE-2026-111066
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/011c08204197beba8281911907b59ffcecea1413]
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ tests/test_web_functional.py | 20 +++++++++++++++++---
+ 1 file changed, 17 insertions(+), 3 deletions(-)
+
+diff --git a/tests/test_web_functional.py b/tests/test_web_functional.py
+index 78bd265..2298958 100644
+--- a/tests/test_web_functional.py
++++ b/tests/test_web_functional.py
+@@ -2076,7 +2076,9 @@ async def test_post_max_client_size_counts_undecoded_bytes(
+         assert resp.status == 413
+ 
+ 
+-@pytest.mark.skipif(not os.path.isdir("/dev/fd"), reason="needs /dev/fd to count fds")
++@pytest.mark.skipif(
++    not os.path.isdir("/proc/self/fd"), reason="needs /proc/self/fd to identify fds"
++)
+ @pytest.mark.parametrize(
+     ("parts", "part_body", "expected_fds"),
+     (
+@@ -2090,10 +2092,22 @@ async def test_post_file_fields_descriptor_cost(
+ ) -> None:
+     """Only a part past the spool size may cost a descriptor."""
+ 
++    def deleted_file_fds() -> set[tuple[str, str]]:
++        """(fd, symlink target) pairs for open fds backed by deleted files."""
++        fds = set()
++        for name in os.listdir("/proc/self/fd"):
++            try:
++                target = os.readlink(f"/proc/self/fd/{name}")
++            except OSError:
++                continue  # closed between listdir and readlink
++            if target.endswith("(deleted)"):
++                fds.add((name, target))
++        return fds
++
+     async def handler(request: web.Request) -> web.Response:
+-        before = set(await asyncio.to_thread(os.listdir, "/dev/fd"))
++        before = await asyncio.to_thread(deleted_file_fds)
+         data = await request.post()
+-        after = set(await asyncio.to_thread(os.listdir, "/dev/fd"))
++        after = await asyncio.to_thread(deleted_file_fds)
+         assert len(data) == parts
+         return web.Response(text=str(len(after - before)))
+ 
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index db40e59a6b..59e9f74e89 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -40,6 +40,8 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2026-111749.patch \
            file://CVE-2026-111748_p1.patch \
            file://CVE-2026-111748_p2.patch \
+           file://CVE-2026-111066_p1.patch \
+           file://CVE-2026-111066_p2.patch \
            "
 
 CVE_STATUS[CVE-2026-34515] = "not-applicable-platform: Vulnerability only affects applications running on Windows"
-- 
2.35.6
