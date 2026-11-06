Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1306.1793950037587061845
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 23:27:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bkSqX771;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=18355; q=dns/txt;
  s=iport01; t=1793950037; x=1795159637;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z5drUIZ0YhwiiJnpBFWcSF/J6Lc2TlysbvpbCg1ucyw=;
  b=bkSqX771C1elZFtXBtLkiv7kGRQowrKqOBrH0rVi+bi/yi4iwS+30OHX
   9vDK4ugM079g4DxNbN+eIcHOdNFviejozO6hRMhZo3Ml7r1wavmqKgzOI
   j93uzA8yEchqRi0h6KpHISU6rWKk4B2p1a5fkpUUAFXfTjoObcIZnSpUY
   NRxn4XF89GnfJxosizjS6VtHWN/HUY/qqFWsjW9UGEPwCNZYHYVyT70+N
   SeWt8Uz9K6HXVjJQPq+V+ps+7L3RqclzdXvgcu8jB8oQZAabwdHZEKoZ5
   3FVLrIedeRPmM3RnOPgV+vaHgffb8s62cLdshdKvouKPndbMT5gdercr9
   A==;
X-CSE-ConnectionGUID: 5YIJb2DCRIe8r/cZ97ucEA==
X-CSE-MsgGUID: QJVy+yQBRoyYjLjhbezkKA==
X-IPAS-Result: =?us-ascii?q?A0BLAgDmf+1q/5L/Ja1QCh4BAQsSDIIFC4IYP3VgQ0kDl?=
 =?us-ascii?q?kgDgROQOYxVgX4PAQEBD0QNBAEBhD9GAo4dAiY0CQ4BAgQDAgMBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEKAQEFAQEBAgEHBYEOE4YVBjQNkBIBAgEDJwsBGAEtEBwDAQIvKyMIE?=
 =?us-ascii?q?AmCKlgBgnQDEbwSgXkzgQGDKQGBVNszAQsUAYE4hUCII10YAYQCeycbG4Fyg?=
 =?us-ascii?q?RWBO4EdG3aBBYFcAQECAYEqBgWGbgSCIoEMgVqNGAKBUYZ5SIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BHoESgQddgSsoXQEhgQiBdgKCU?=
 =?us-ascii?q?YIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxkCxoFYQgCDQx0O?=
 =?us-ascii?q?RAwHiQvBRwmPhsKLxgNSBEsNxUZBD5uB5I9gmUtAQ0fYQEKDhEBAX8GDA8UG?=
 =?us-ascii?q?V8cAjCSaYQii3yCIaERCiiDeIwklToaM4QEgVeSQpJUC5h9glmLMZVpGANNh?=
 =?us-ascii?q?GmBaDyBWXAVgyIJShkPhlGHWgMLC4NghRPHHiYyAgkDLwEBBwIHDgMLgWiQA?=
 =?us-ascii?q?AEnBHJgAQE?=
IronPort-Data: A9a23:9J2VZquhFxYT+XnwAdiXo3UphefnVAZfMUV32f8akzHdYApBsoF/q
 tZmKTiFPPyDM2L0fd8lYdmxphwF6JHQz9Q2SFZq/H1hFSkTgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvb9Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwp9dWI2sU2
 dciCT1ddFeItbPp3bmWY7w57igjBJGD0II3oHpsy3TdSP0hW52GG/SM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtJYH49tL/Aan3Xfz5VrFuUtKMf6GnIxws327/oWDbQUoHWGJ8FzhrB/
 woq+UzAIC8Ld82m4wCC40Ouou3Ply7pW6E7QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZOZottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvoUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:40Kwu60XEXjWmrnp8tqsKAqjBJAkLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPGdXg2UK1XYANu5deXcGPTV7OQ==
X-Talos-CUID: 9a23:ARISUGOO8Jfh9O5DBRhG1kRONusfU3CN1jDbER7nFG1EYejA
X-Talos-MUID: 9a23:AZw1jQRIWq0+eg01RXTVpg9zd9ZRyZ6pGXEPtZcGscSWNg9ZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="545288411"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 07:27:16 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 782961800059F;
	Fri,  6 Nov 2026 07:27:16 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 23AB7CBF201; Thu,  5 Nov 2026 23:27:16 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 1/7] python3-aiohttp: fix CVE-2026-111066
Date: Thu,  5 Nov 2026 23:26:56 -0800
Message-Id: <20261106072702.502813-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106072702.502813-1-dkelaiya@cisco.com>
References: <20261106072702.502813-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 06 Nov 2026 07:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131967
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the multipart descriptor-exhaustion fix [1] to aiohttp
3.13.5. Spool small file parts in memory and count raw multipart
bytes, including headers, against client_max_size.

Include the upstream descriptor-test correction [2] so unrelated
file descriptors do not make the regression test unreliable.
Adapt the HTTP 413 constructor and retain the existing read size.
The vulnerability and fixed release are documented in [3].

[1] https://github.com/aio-libs/aiohttp/commit/2d94633b7f1b4c1ba07d647b629a8440652b2d09
[2] https://github.com/aio-libs/aiohttp/commit/011c08204197beba8281911907b59ffcecea1413
[3] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-9xw5-w5jj-pvcg

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-111066_p1.patch  | 400 ++++++++++++++++++
 .../python3-aiohttp/CVE-2026-111066_p2.patch  |  57 +++
 .../python/python3-aiohttp_3.13.5.bb          |   2 +
 3 files changed, 459 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066_p2.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066_p1.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066_p1.patch
new file mode 100644
index 0000000000..8b6e29bbfb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066_p1.patch
@@ -0,0 +1,400 @@
+From 2d94633b7f1b4c1ba07d647b629a8440652b2d09 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Tue, 18 Aug 2026 21:54:45 +0100
+Subject: [PATCH] Reduce number of file descriptors needed in multipart
+ messages (#13426) (#13475)
+
+(cherry picked from commit c92ed4c48dafd40d5ed4c86587af9e081ac7d971)
+
+CVE: CVE-2026-111066
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/2d94633b7f1b4c1ba07d647b629a8440652b2d09]
+
+Backport Changes:
+- Pass the raw payload size to the older HTTP 413 constructor and
+  update the existing test to match upstream's size-limit assertion.
+- Keep the existing type annotations and surrounding test signatures.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/13426.bugfix.rst     |   1 +
+ aiohttp/web_request.py       |  96 +++++++++++++++-----
+ tests/test_web_functional.py | 167 ++++++++++++++++++++++++++++++++++-
+ 3 files changed, 237 insertions(+), 27 deletions(-)
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
+index f2d4c51..e978b2a 100644
+--- a/aiohttp/web_request.py
++++ b/aiohttp/web_request.py
+@@ -4,11 +4,12 @@ import io
+ import re
+ import socket
+ import string
+-import tempfile
++import sys
+ import types
+ import warnings
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
+     headers: CIMultiDictProxy[str]
+ 
+@@ -726,8 +758,15 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
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
+@@ -739,22 +778,37 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+                     # present.
+                     # https://tools.ietf.org/html/rfc7578#section-4.4
+                     if field.filename:
+-                        # store file in temp file
+-                        tmp = await self._loop.run_in_executor(
+-                            None, tempfile.TemporaryFile
+-                        )
++                        tmp = SpooledTemporaryFile(_FILE_SPOOL_MAX_SIZE)
++                        # rolled means the temp file now uses the disk, at
++                        # which point we want to run in the executor.
++                        rolled = False
+                         while chunk := await field.read_chunk(size=2**18):
++                            # Bounds one part, mid-read.
++                            if 0 < max_size < payload.total_bytes:
++                                if rolled:
++                                    await self._loop.run_in_executor(None, tmp.close)
++                                else:
++                                    tmp.close()
++                                raise HTTPRequestEntityTooLarge(
++                                    max_size=max_size, actual_size=payload.total_bytes
++                                )
+                             async for decoded_chunk in field.decode_iter(chunk):
+-                                await self._loop.run_in_executor(
+-                                    None, tmp.write, decoded_chunk
++                                # Update before writing, so we know if next
++                                # write is going to hit the disk.
++                                rolled = rolled or (
++                                    tmp.tell() + len(decoded_chunk)
++                                    > _FILE_SPOOL_MAX_SIZE
+                                 )
+-                                size += len(decoded_chunk)
+-                                if 0 < max_size < size:
+-                                    await self._loop.run_in_executor(None, tmp.close)
+-                                    raise HTTPRequestEntityTooLarge(
+-                                        max_size=max_size, actual_size=size
++                                if rolled:
++                                    await self._loop.run_in_executor(
++                                        None, tmp.write, decoded_chunk
+                                     )
+-                        await self._loop.run_in_executor(None, tmp.seek, 0)
++                                else:
++                                    tmp.write(decoded_chunk)
++                        if rolled:
++                            await self._loop.run_in_executor(None, tmp.seek, 0)
++                        else:
++                            tmp.seek(0)
+ 
+                         if field_ct is None:
+                             field_ct = "application/octet-stream"
+@@ -762,7 +816,7 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+                         ff = FileField(
+                             field.name,
+                             field.filename,
+-                            cast(io.BufferedReader, tmp),
++                            tmp,
+                             field_ct,
+                             field.headers,
+                         )
+@@ -771,10 +825,9 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
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
+@@ -843,10 +896,7 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+         if self._post is None or self.content_type != "multipart/form-data":
+             return
+ 
+-        # NOTE: Release file descriptors for the
+-        # NOTE: `tempfile.Temporaryfile`-created `_io.BufferedRandom`
+-        # NOTE: instances of files sent within multipart request body
+-        # NOTE: via HTTP POST request.
++        # Release the temp files created within multipart request body.
+         for file_name, file_field_object in self._post.items():
+             if isinstance(file_field_object, FileField):
+                 file_field_object.file.close()
+diff --git a/tests/test_web_functional.py b/tests/test_web_functional.py
+index 0d2824a..a314d9b 100644
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
+ import sys
+@@ -29,6 +31,7 @@ from aiohttp.pytest_plugin import AiohttpClient, AiohttpServer
+ from aiohttp.streams import StreamReader
+ from aiohttp.typedefs import Handler
+ from aiohttp.web_protocol import MAX_MSG_QUEUE_SIZE, RequestHandler
++from aiohttp.web_request import _FILE_SPOOL_MAX_SIZE
+ 
+ try:
+     import brotlicffi as brotli
+@@ -2023,10 +2026,7 @@ async def test_post_max_client_size(aiohttp_client) -> None:
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
+@@ -2050,6 +2050,165 @@ async def test_post_max_client_size_for_file(aiohttp_client) -> None:
+     await resp.release()
+ 
+ 
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
+ async def test_response_with_bodypart(aiohttp_client) -> None:
+     async def handler(request):
+         reader = await request.multipart()
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066_p2.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066_p2.patch
new file mode 100644
index 0000000000..9b9345f577
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066_p2.patch
@@ -0,0 +1,57 @@
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
+index a314d9b..9fafd52 100644
+--- a/tests/test_web_functional.py
++++ b/tests/test_web_functional.py
+@@ -2135,7 +2135,9 @@ async def test_post_max_client_size_counts_undecoded_bytes(
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
+@@ -2150,8 +2152,20 @@ async def test_post_file_fields_descriptor_cost(
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
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index bd5b5fe4d9..917405c715 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -22,6 +22,8 @@ SRC_URI += " \
     file://CVE-2026-59881.patch \
     file://CVE-2026-69243.patch \
     file://CVE-2026-69244.patch \
+    file://CVE-2026-111066_p1.patch \
+    file://CVE-2026-111066_p2.patch \
 "
 
 CVE_PRODUCT = "aiohttp:aiohttp"
-- 
2.35.6
