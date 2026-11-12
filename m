Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6942.1794458702030473566
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 20:45:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=oW8X7lzf;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so2232335a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 20:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458701; x=1795063501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jkOSClZIalhZgkHS9HxGU4OnrmAudc4stNu0zE/BspI=;
        b=oW8X7lzfU8VUMmWbyBFymkHg1rJbioGZu6qkRUV7cdiv4VLGPY3Try9Tg/Encmr+7q
         +nYwTgd7Vnx+0wts/NJ7rd8wHDVhEyKtXZ5hXjGDSi08EV64mcHJEsMXhTlP6Wr3M6av
         F9hwRIlR3CoEr4pDz9LiuMYciTKRIU+CYCN1tjIGZl2x9EGS7MNxhQjjiTz1uFiSHw9X
         rLgJiovPKBlxjzt94E/Zpu0V2n1nqeEcfnk4rrwvarokmFiQ4DWfcVEUe/QRt1TAaLSO
         sWpKvDtJyiU5PFjEeMNhcKv/gfIPGzjpdg01FHQnUUCRZr9lIHHqzPe60ZNND4MAER5E
         ZgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458701; x=1795063501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jkOSClZIalhZgkHS9HxGU4OnrmAudc4stNu0zE/BspI=;
        b=hxdk8QCjZ6FRU4p1vVyebXrdO4iONmTUjGBd7nulXqCVQMZLBnbep/nTNH41Jcvqoo
         Vv4t+IYFu0CgYsFQuZK2JebnDX7PGzKVV/6ssLLE5B1mazgDoXaEmhpBvMVX0JJ6Ktns
         um4MFFI6Sq3bG5Au2nx3zq09+phEEJJGxeckgmZlL1a6Fsm9c0U3wtgXwjp/rCo/pBfZ
         0Qm4D3pxYGn7yV9wQByjge0LAqoNOJuh5e0ROG2aDPSrknLiqxD6/k1/vKPopKiHo6a4
         llrgPNNZCAxlkLc4SF/S0M4Qnr3eX4QHooHHHSwq1S7M8SaBWV/wB3UPdsemy3KhcLb7
         hT3w==
X-Gm-Message-State: APuU4Z+9ECdiKsZcWJWa0vsZQ7Y6J4FnmbHZv3/3RC9a/4JQJVW3kNdX
	MGKFNJIVDT7rL1IyC1fIVRwmQByF/0JevpE9rBuA/AxA1d2vg5AtlATXRzj5Ew==
X-Gm-Gg: AYBFou2prTvZaGMuoUNfAEBjP3eTjMrpVhd6KopJU19skoNE7h+Q6k745gDNuZr5Efn
	NraAXrbhTyaJIHTqVXpHgxRfhnNtRIwkWN8fTSlZmbn//IVMjQZrRM32PbCu3FVFIf0s18kPxe7
	Ka57cxFvPXLIx7JMTouYC2GVOwldCJOk/4Qpp2mCyq9b55bjhtEny4Zl0zhP7FL9VNKQrNsbJPp
	krKbzWJ79LvB3tV5PF385em5pkZusBm0Z9j2YF3KmqnYpiwFs6DubFieJ642sxro6eS3EoWPyEb
	xbDhANPaYBcG6VCiDDW3SU9z/Ba6s6qUbPuYVV9Ri30HZDo7Ocb7OxfTRntV64EQu4z7MfYOzP7
	RL9gcJ4oVODIuqNw7XVq6lK1GZw5+TYVFHxsjxxG0BopQjUrUMp9tvl5C+wetIL3ZUTgS74DwYy
	3RGoMB0mbgB93pBc39b67OgBS/rJdAx3+M9D/qXkgFv2rvAKU1pQ+sh4sFlkHGkoUOgxcw+ep4X
	1hPSb42XQVGiDiGByfvS172wsJjIClPFRVUVKWG4iSJ27Rbxr+oQ0SNT6whVEwaN3YnRA32I8qa
	idV3BDEYIwN7X0nq1ocDE4X0YMhnO7QFX81fx5bvN7nfY7yAsszm6CS5p5PVHg==
X-Received: by 2002:a17:90b:518b:b0:3b0:e388:d9da with SMTP id 98e67ed59e1d1-3b182f28620mr4810527a91.29.1794458701157;
        Wed, 11 Nov 2026 20:45:01 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d7dd5bbsm2238527a12.30.2026.11.11.20.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:45:00 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][blacksail][PATCH 12/16] python3-aiohttp: patch CVE-2026-111066
Date: Thu, 12 Nov 2026 17:44:22 +1300
Message-ID: <20261112044426.3933391-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
References: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 04:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132163
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-111066

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-aiohttp/CVE-2026-111066.patch     | 382 ++++++++++++++++++
 .../python/python3-aiohttp_3.14.3.bb          |   1 +
 2 files changed, 383 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066.patch
new file mode 100644
index 0000000000..5f11f31d54
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066.patch
@@ -0,0 +1,382 @@
+From a45985a1dba1aaacad2b12724b450496a6ab0903 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Tue, 18 Aug 2026 21:54:45 +0100
+Subject: [PATCH] Reduce number of file descriptors needed in multipart
+ messages (#13426) (#13475)
+
+(cherry picked from commit c92ed4c48dafd40d5ed4c86587af9e081ac7d971)
+(cherry picked from commit 2d94633b7f1b4c1ba07d647b629a8440652b2d09)
+
+CVE: CVE-2026-111066
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/2d94633b7f1b4c1ba07d647b629a8440652b2d09]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ CHANGES/13426.bugfix.rst     |   1 +
+ aiohttp/web_request.py       |  91 ++++++++++++++-----
+ tests/test_web_functional.py | 166 ++++++++++++++++++++++++++++++++++-
+ 3 files changed, 234 insertions(+), 24 deletions(-)
+ create mode 100644 CHANGES/13426.bugfix.rst
+
+diff --git a/CHANGES/13426.bugfix.rst b/CHANGES/13426.bugfix.rst
+new file mode 100644
+index 000000000..8b9ee295f
+--- /dev/null
++++ b/CHANGES/13426.bugfix.rst
+@@ -0,0 +1 @@
++Switched multipart handling to use spooled temporary files to reduce number of file descriptors needed -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/web_request.py b/aiohttp/web_request.py
+index ca925e2ac..eaed708eb 100644
+--- a/aiohttp/web_request.py
++++ b/aiohttp/web_request.py
+@@ -3,13 +3,13 @@ import datetime
+ import io
+ import re
+ import string
+-import tempfile
++import sys
+ import types
+ import warnings
+ from collections.abc import Iterator, Mapping, MutableMapping
+ from re import Pattern
+ from types import MappingProxyType
+-from typing import TYPE_CHECKING, Any, Final, Optional, TypeVar, cast, overload
++from typing import IO, TYPE_CHECKING, Any, Final, Optional, TypeVar, cast, overload
+ from urllib.parse import parse_qsl
+ 
+ import attr
+@@ -54,6 +54,30 @@ from .typedefs import (
+ from .web_exceptions import HTTPRequestEntityTooLarge, NotAppKeyWarning
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
+@@ -66,11 +90,18 @@ if TYPE_CHECKING:
+ _T = TypeVar("_T")
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
+@@ -754,8 +785,13 @@ class BaseRequest(MutableMapping[str | RequestKey[Any], Any], HeadersMixin):
+             multipart = await self.multipart()
+             max_size = self._client_max_size
+ 
+-            size = 0
++            payload = self._payload
+             while (field := await multipart.next()) is not None:
++                # This check is needed for empty payloads, which still add
++                # overhead without entering the loop and the check below.
++                if 0 < max_size < payload.total_bytes:
++                    raise HTTPRequestEntityTooLarge(max_size)
++
+                 field_ct = field.headers.get(hdrs.CONTENT_TYPE)
+ 
+                 if isinstance(field, BodyPartReader):
+@@ -767,20 +803,35 @@ class BaseRequest(MutableMapping[str | RequestKey[Any], Any], HeadersMixin):
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
+                         while chunk := await field.read_chunk(size=DEFAULT_CHUNK_SIZE):
++                            # Bounds one part, mid-read.
++                            if 0 < max_size < payload.total_bytes:
++                                if rolled:
++                                    await self._loop.run_in_executor(None, tmp.close)
++                                else:
++                                    tmp.close()
++                                raise HTTPRequestEntityTooLarge(max_size)
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
+-                                    raise HTTPRequestEntityTooLarge(max_size)
+-                        await self._loop.run_in_executor(None, tmp.seek, 0)
++                                if rolled:
++                                    await self._loop.run_in_executor(
++                                        None, tmp.write, decoded_chunk
++                                    )
++                                else:
++                                    tmp.write(decoded_chunk)
++                        if rolled:
++                            await self._loop.run_in_executor(None, tmp.seek, 0)
++                        else:
++                            tmp.seek(0)
+ 
+                         if field_ct is None:
+                             field_ct = "application/octet-stream"
+@@ -788,7 +839,7 @@ class BaseRequest(MutableMapping[str | RequestKey[Any], Any], HeadersMixin):
+                         ff = FileField(
+                             field.name,
+                             field.filename,
+-                            cast(io.BufferedReader, tmp),
++                            tmp,
+                             field_ct,
+                             field.headers,
+                         )
+@@ -797,8 +848,7 @@ class BaseRequest(MutableMapping[str | RequestKey[Any], Any], HeadersMixin):
+                         # deal with ordinary data
+                         raw_data = bytearray()
+                         while chunk := await field.read_chunk():
+-                            size += len(chunk)
+-                            if 0 < max_size < size:
++                            if 0 < max_size < payload.total_bytes:
+                                 raise HTTPRequestEntityTooLarge(max_size)
+                             raw_data.extend(chunk)
+ 
+@@ -865,10 +915,7 @@ class BaseRequest(MutableMapping[str | RequestKey[Any], Any], HeadersMixin):
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
+index d126347aa..78304a72c 100644
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
+@@ -31,6 +33,7 @@ from aiohttp.pytest_plugin import AiohttpClient, AiohttpServer
+ from aiohttp.streams import StreamReader
+ from aiohttp.typedefs import Handler
+ from aiohttp.web_protocol import MAX_MSG_QUEUE_SIZE, RequestHandler
++from aiohttp.web_request import _FILE_SPOOL_MAX_SIZE
+ 
+ try:
+     import brotlicffi as brotli
+@@ -2072,8 +2075,167 @@ async def test_post_max_client_size_for_file(aiohttp_client) -> None:
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
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
index f3bb555408..2477b6a0e8 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
@@ -8,6 +8,7 @@ SRC_URI[sha256sum] = "9491196535a88924a60afd5b5f434b5b203b6cc616250878dbdb223a8f
 
 SRC_URI += "file://CVE-2026-111063.patch \
             file://CVE-2026-111065.patch \
+            file://CVE-2026-111066.patch \
 "
 
 CVE_PRODUCT = "aiohttp:aiohttp"
