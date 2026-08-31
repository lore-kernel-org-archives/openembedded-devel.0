Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD60EC624A4
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 04:57:50 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22959.1788152269771553020
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2026 21:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RfS5nV7t;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=33266; q=dns/txt;
  s=iport01; t=1788152269; x=1789361869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MsnMvl9K2CW4ZlDEdCMMuFvrQ7tnIYCb/iseg6XYxPw=;
  b=RfS5nV7tQ2lIFPe7V0UMO01q/wLcYHVY6mwjUY2FVXOW83LXXChCUawS
   IC9i7zPhC/Z04DeJ2pnAkDjD5VJUSRo/1Xr3opt0neu1lkPW7a23/zfsC
   rxL7H4L0xmVL/GY2mNSWBM04haZarVUBp6Rn1EHtoPXWqB3HB3GXXs0Ci
   bGe7SyxCqHIKfUR3UzrnkAYnA/WpNig174JxwjVQw/mHut8qWB8c4a3Cz
   Jkjtxo7njd0qvWFJAPKYDiT7EEzJwl/29h8A9NXFmFGvn5x4M7PHfrxB5
   9PZPNYUAfOQo1+ky0QOCYRKDLmP+U6IU590ojROERvadS/FvicbcyXcCh
   A==;
X-CSE-ConnectionGUID: gOup6JJWTWap5PmvYQ04TQ==
X-CSE-MsgGUID: vGxuAlEzR6SBmVSzoG0bsQ==
X-IPAS-Result: =?us-ascii?q?A0ArAAAsCZVq/5MQJK1RCR0BAQEBCQESAQUFAYF8CAELA?=
 =?us-ascii?q?YJWdF4KOUmEV4gbiVgDnhuBfg8BAQEPRA0EAQGEP0YCjXMCJjQJDgECBAMCA?=
 =?us-ascii?q?wEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgECAQMaAQgECwEYAS0QC?=
 =?us-ascii?q?RMDAQIDAiYCAisjCBmDAgGCdAMRpl6bI3p/M4EBgygBPwJDUNswAQsUAYEKL?=
 =?us-ascii?q?gGFPoMfAYUCXRgBRIQ4JxsbgXKCUIIugQWBXAEBAoErBwSEA4JqBIIigQyBW?=
 =?us-ascii?q?oEXkQhIgQIcA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+FzVYGwYFgR2BKIQPI?=
 =?us-ascii?q?xk2eoEJXoErKWABEheBCYIIAoJaggUCAUlDDgdHUwkECxgNSBEsNxUZBD0Bb?=
 =?us-ascii?q?geOeh+CBxcsAQFXAgctAQogAQSBDQc1NxAeCwsGLJJpAQcTHgqPW4IhgTWfW?=
 =?us-ascii?q?goog3aMIpU6GjOEBIFXiz2HA5JRC5h9jgqVPSMgUIRpgWg8gUcLB3AVO4JnC?=
 =?us-ascii?q?QpAGQ+OKgMLC4NggX9Xgw7GVScyAgkyAQEHAgcOAwuBaJABgX0BAQ?=
IronPort-Data: A9a23:sZ7p1aBvXxiaIxVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDMr0zUPn
 DFJW2DVPfaPNGX1ett1Ot/g8h9T7MLUmtZjOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA/+g2YtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEzNJzFB8UH7Ikxe9vXFlL6
 80hcGwxV0XW7w626OrTpuhEj8AnKozveYgYoHwllGmfBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWUHgBfoO3WjPn8bC586lea5j1H0ciZTrxSeoq9fD237nFYsj+O3boOLEjCMbdt6jluxo
 k/UxTrCKBQkD86Y5mKP6Uv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/OMpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:spPnrq2AIMCcHhDohS5twAqjBGokLtp133Aq2lEZdPWaSKOlfq
 eV7ZImPH7P+VEssR4b+OxoVJPsfZqYz+8W3WBzB8bHYOCZgguVxehZhOOIqQEIWReOk9K1vp
 0PT0ERMrHN5CBB/KXHyTj9Nco8y9+a963tr+Lfw3BxCTxOUchbnn5E4sLxKDwMeOGAbqBJbK
 ah2g==
X-Talos-CUID: 9a23:0Shn0G4g9R7fbb/hRNss+2kJAp4HUELh837Ifne9F1dQEOGpcArF
X-Talos-MUID: =?us-ascii?q?9a23=3AW7QLzg/wXC8VOSrNQyvaOrKQf9lH87mHDG0fq8s?=
 =?us-ascii?q?9kcy6Dj53FG+Xlw3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,252,1779148800"; 
   d="scan'208";a="825732616"
Received: from alln-l-core-10.cisco.com ([173.36.16.147])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Aug 2026 04:57:48 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-10.cisco.com (Postfix) with ESMTPS id 448E71800014C;
	Mon, 31 Aug 2026 04:57:48 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id D3DA4CD02BB; Sun, 30 Aug 2026 21:57:47 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 4/9] python3-aiohttp: fix CVE-2025-69223
Date: Sun, 30 Aug 2026 21:57:39 -0700
Message-Id: <20260831045744.3321483-5-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260831045744.3321483-1-dkelaiya@cisco.com>
References: <20260831045744.3321483-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2026 04:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129608

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the reviewed upstream fix commits shown in
[1] and [2]. The advisory identifying the fix is referenced in
[3].

The python3-brotli 1.2.0 upgrade commit [4] is omitted because
Scarthgap currently provides python3-brotli 1.1.0. Brotli 1.2.0
adds the bounded decompression API required by the upstream aiohttp
fix. Consequently, this backport disables optional Brotli response
decoding while retaining bounded decompression for the supported
zlib path.

[1] https://github.com/aio-libs/aiohttp/commit/2b920c39002cee0ec5b402581779bbaaf7c9138a
[2] https://github.com/aio-libs/aiohttp/commit/92477c5a74c43dfe0474bd24f8de11875daa2298
[3] https://nvd.nist.gov/vuln/detail/CVE-2025-69223
[4] https://github.com/openembedded/meta-openembedded/commit/382e4de7d8b7d0e980fefcda7a06e5f20f5f26c0

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2025-69223.patch      | 848 ++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |   1 +
 2 files changed, 849 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69223.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69223.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69223.patch
new file mode 100644
index 0000000000..e1fca9b8b9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69223.patch
@@ -0,0 +1,848 @@
+From 7c9340cd2be5c8dd6d829a62220bb9129e7a9d8a Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Sat, 3 Jan 2026 15:56:02 +0000
+Subject: [PATCH] Use decompressor max_length parameter (#11898) (#11918)
+
+---------
+
+CVE: CVE-2025-69223
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/2b920c39002cee0ec5b402581779bbaaf7c9138a]
+
+Backport Changes:
+- Adapted the decompression base class to aiohttp 3.9.5's
+  direct `zlib` implementation because the newer upstream
+  buffer and backend wrappers are absent.
+- Kept `BodyPartReader.decode()` and `_decode_content()`
+  synchronous. Applied the output limit through
+  `ZLibDecompressor.decompress_sync()` to preserve the
+  aiohttp 3.9.5 API while bounding gzip and deflate output.
+- Omitted the upstream `aiohttp/web_request.py` change from
+  `field.decode(chunk)` to `await field.decode(chunk)`.
+  That change is required only for upstream's asynchronous
+  `BodyPartReader.decode()` conversion. This backport keeps
+  synchronous decoding, so the existing call remains valid.
+- Did not carry the Brotli 1.2 dependency updates from
+  `pyproject.toml` and `requirements/runtime-deps.in`.
+  Scarthgap supplies python3-brotli 1.1.0, which lacks the
+  bounded-output API required by the upstream fix.
+- Disabled Brotli decoding by forcing `HAS_BROTLI` to
+  `False`. As a result, `Content-Encoding: br` is rejected
+  before a Brotli decoder is created. This closes the
+  decompression-bomb path at the cost of Brotli support.
+- Omitted upstream Zstandard implementation, dependency,
+  and test changes because aiohttp 3.9.5 does not support
+  Zstandard content decoding.
+- Adapted the client, parser, and multipart tests to the
+  aiohttp 3.9.5 fixtures and synchronous decoding API.
+
+(cherry picked from commit 92477c5a74c43dfe0474bd24f8de11875daa2298)
+Co-authored-by: J. Nick Koston <nick@koston.org>
+(cherry picked from commit 2b920c39002cee0ec5b402581779bbaaf7c9138a)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/11898.breaking.rst      |  3 ++
+ aiohttp/compression_utils.py    | 92 +++++++++++++++++++++------------
+ aiohttp/http_exceptions.py      |  4 ++
+ aiohttp/http_parser.py          | 29 +++++++++--
+ aiohttp/multipart.py            | 19 +++++--
+ docs/spelling_wordlist.txt      |  1 +
+ tests/test_client_functional.py | 80 +++++++++++++++++++++++++++-
+ tests/test_http_parser.py       | 44 +++++++++++++++-
+ tests/test_multipart.py         | 92 +++++++++++++++++++++++++--------
+ 9 files changed, 299 insertions(+), 65 deletions(-)
+ create mode 100644 CHANGES/11898.breaking.rst
+
+diff --git a/CHANGES/11898.breaking.rst b/CHANGES/11898.breaking.rst
+new file mode 100644
+index 000000000..228b69baa
+--- /dev/null
++++ b/CHANGES/11898.breaking.rst
+@@ -0,0 +1,3 @@
++``Brotli`` decoding is disabled in the Scarthgap backport because its
++``python3-brotli`` recipe provides version 1.1.0, not the required 1.2.
++Decompression now has a default maximum output size of 32MiB per decompress call -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/compression_utils.py b/aiohttp/compression_utils.py
+index 9631d377e..fe762c755 100644
+--- a/aiohttp/compression_utils.py
++++ b/aiohttp/compression_utils.py
+@@ -1,5 +1,6 @@
+ import asyncio
+ import zlib
++from abc import ABC, abstractmethod
+ from concurrent.futures import Executor
+ from typing import Optional, cast
+ 
+@@ -13,7 +14,17 @@ try:
+ except ImportError:  # pragma: no cover
+     HAS_BROTLI = False
+ 
+-MAX_SYNC_CHUNK_SIZE = 1024
++# Scarthgap provides python3-brotli 1.1.0, whose Decompressor API does not
++# support the max_length argument required by the bounded decoder below.
++# Do not advertise or instantiate Brotli decoding until the recipe provides
++# Brotli 1.2 or newer.
++HAS_BROTLI = False
++
++MAX_SYNC_CHUNK_SIZE = 4096
++DEFAULT_MAX_DECOMPRESS_SIZE = 2**25  # 32MiB
++
++# Unlimited decompression constant
++ZLIB_MAX_LENGTH_UNLIMITED = 0  # zlib uses 0 to mean unlimited
+ 
+ 
+ def encoding_to_mode(
+@@ -26,19 +37,37 @@ def encoding_to_mode(
+     return -zlib.MAX_WBITS if suppress_deflate_header else zlib.MAX_WBITS
+ 
+ 
+-class ZlibBaseHandler:
++class DecompressionBaseHandler(ABC):
+     def __init__(
+         self,
+-        mode: int,
+         executor: Optional[Executor] = None,
+         max_sync_chunk_size: Optional[int] = MAX_SYNC_CHUNK_SIZE,
+     ):
+-        self._mode = mode
++        """Base class for decompression handlers."""
+         self._executor = executor
+         self._max_sync_chunk_size = max_sync_chunk_size
+ 
++    @abstractmethod
++    def decompress_sync(
++        self, data: bytes, max_length: int = ZLIB_MAX_LENGTH_UNLIMITED
++    ) -> bytes:
++        """Decompress the given data."""
++
++    async def decompress(
++        self, data: bytes, max_length: int = ZLIB_MAX_LENGTH_UNLIMITED
++    ) -> bytes:
++        """Decompress the given data."""
++        if (
++            self._max_sync_chunk_size is not None
++            and len(data) > self._max_sync_chunk_size
++        ):
++            return await asyncio.get_event_loop().run_in_executor(
++                self._executor, self.decompress_sync, data, max_length
++            )
++        return self.decompress_sync(data, max_length)
++
+ 
+-class ZLibCompressor(ZlibBaseHandler):
++class ZLibCompressor:
+     def __init__(
+         self,
+         encoding: Optional[str] = None,
+@@ -49,12 +78,12 @@ class ZLibCompressor(ZlibBaseHandler):
+         executor: Optional[Executor] = None,
+         max_sync_chunk_size: Optional[int] = MAX_SYNC_CHUNK_SIZE,
+     ):
+-        super().__init__(
+-            mode=encoding_to_mode(encoding, suppress_deflate_header)
++        self._executor = executor
++        self._max_sync_chunk_size = max_sync_chunk_size
++        self._mode = (
++            encoding_to_mode(encoding, suppress_deflate_header)
+             if wbits is None
+-            else wbits,
+-            executor=executor,
+-            max_sync_chunk_size=max_sync_chunk_size,
++            else wbits
+         )
+         if level is None:
+             self._compressor = zlib.compressobj(wbits=self._mode, strategy=strategy)
+@@ -86,7 +115,7 @@ class ZLibCompressor(ZlibBaseHandler):
+         return self._compressor.flush(mode)
+ 
+ 
+-class ZLibDecompressor(ZlibBaseHandler):
++class ZLibDecompressor(DecompressionBaseHandler):
+     def __init__(
+         self,
+         encoding: Optional[str] = None,
+@@ -94,26 +123,15 @@ class ZLibDecompressor(ZlibBaseHandler):
+         executor: Optional[Executor] = None,
+         max_sync_chunk_size: Optional[int] = MAX_SYNC_CHUNK_SIZE,
+     ):
+-        super().__init__(
+-            mode=encoding_to_mode(encoding, suppress_deflate_header),
+-            executor=executor,
+-            max_sync_chunk_size=max_sync_chunk_size,
+-        )
++        super().__init__(executor=executor, max_sync_chunk_size=max_sync_chunk_size)
++        self._mode = encoding_to_mode(encoding, suppress_deflate_header)
+         self._decompressor = zlib.decompressobj(wbits=self._mode)
+ 
+-    def decompress_sync(self, data: bytes, max_length: int = 0) -> bytes:
++    def decompress_sync(
++        self, data: bytes, max_length: int = ZLIB_MAX_LENGTH_UNLIMITED
++    ) -> bytes:
+         return self._decompressor.decompress(data, max_length)
+ 
+-    async def decompress(self, data: bytes, max_length: int = 0) -> bytes:
+-        if (
+-            self._max_sync_chunk_size is not None
+-            and len(data) > self._max_sync_chunk_size
+-        ):
+-            return await asyncio.get_event_loop().run_in_executor(
+-                self._executor, self.decompress_sync, data, max_length
+-            )
+-        return self.decompress_sync(data, max_length)
+-
+     def flush(self, length: int = 0) -> bytes:
+         return (
+             self._decompressor.flush(length)
+@@ -134,24 +152,34 @@ class ZLibDecompressor(ZlibBaseHandler):
+         return self._decompressor.unused_data
+ 
+ 
+-class BrotliDecompressor:
++class BrotliDecompressor(DecompressionBaseHandler):
+     # Supports both 'brotlipy' and 'Brotli' packages
+     # since they share an import name. The top branches
+     # are for 'brotlipy' and bottom branches for 'Brotli'
+-    def __init__(self) -> None:
++    def __init__(
++        self,
++        executor: Optional[Executor] = None,
++        max_sync_chunk_size: Optional[int] = MAX_SYNC_CHUNK_SIZE,
++    ) -> None:
++        """Decompress data using the Brotli library."""
+         if not HAS_BROTLI:
+             raise RuntimeError(
+                 "The brotli decompression is not available. "
+                 "Please install `Brotli` module"
+             )
+         self._obj = brotli.Decompressor()
++        super().__init__(executor=executor, max_sync_chunk_size=max_sync_chunk_size)
+ 
+-    def decompress_sync(self, data: bytes) -> bytes:
++    def decompress_sync(
++        self, data: bytes, max_length: int = ZLIB_MAX_LENGTH_UNLIMITED
++    ) -> bytes:
++        """Decompress the given data."""
+         if hasattr(self._obj, "decompress"):
+-            return cast(bytes, self._obj.decompress(data))
+-        return cast(bytes, self._obj.process(data))
++            return cast(bytes, self._obj.decompress(data, max_length))
++        return cast(bytes, self._obj.process(data, max_length))
+ 
+     def flush(self) -> bytes:
++        """Flush the decompressor."""
+         if hasattr(self._obj, "flush"):
+             return cast(bytes, self._obj.flush())
+         return b""
+diff --git a/aiohttp/http_exceptions.py b/aiohttp/http_exceptions.py
+index 72eac3a3c..877b07d4c 100644
+--- a/aiohttp/http_exceptions.py
++++ b/aiohttp/http_exceptions.py
+@@ -75,6 +75,10 @@ class ContentLengthError(PayloadEncodingError):
+     """Not enough data for satisfy content length header."""
+ 
+ 
++class DecompressSizeError(PayloadEncodingError):
++    """Decompressed size exceeds the configured limit."""
++
++
+ class LineTooLong(BadHttpMessage):
+     def __init__(
+         self, line: str, limit: str = "Unknown", actual_size: str = "Unknown"
+diff --git a/aiohttp/http_parser.py b/aiohttp/http_parser.py
+index 5768bd623..cdf3fc89a 100644
+--- a/aiohttp/http_parser.py
++++ b/aiohttp/http_parser.py
+@@ -26,7 +26,12 @@ from yarl import URL
+ 
+ from . import hdrs
+ from .base_protocol import BaseProtocol
+-from .compression_utils import HAS_BROTLI, BrotliDecompressor, ZLibDecompressor
++from .compression_utils import (
++    DEFAULT_MAX_DECOMPRESS_SIZE,
++    HAS_BROTLI,
++    BrotliDecompressor,
++    ZLibDecompressor,
++)
+ from .helpers import (
+     _EXC_SENTINEL,
+     DEBUG,
+@@ -41,6 +46,7 @@ from .http_exceptions import (
+     BadStatusLine,
+     ContentEncodingError,
+     ContentLengthError,
++    DecompressSizeError,
+     InvalidHeader,
+     InvalidURLError,
+     LineTooLong,
+@@ -959,7 +965,12 @@ class DeflateBuffer:
+ 
+     decompressor: Any
+ 
+-    def __init__(self, out: StreamReader, encoding: Optional[str]) -> None:
++    def __init__(
++        self,
++        out: StreamReader,
++        encoding: Optional[str],
++        max_decompress_size: int = DEFAULT_MAX_DECOMPRESS_SIZE,
++    ) -> None:
+         self.out = out
+         self.size = 0
+         self.encoding = encoding
+@@ -976,6 +987,8 @@ class DeflateBuffer:
+         else:
+             self.decompressor = ZLibDecompressor(encoding=encoding)
+ 
++        self._max_decompress_size = max_decompress_size
++
+     def set_exception(
+         self,
+         exc: BaseException,
+@@ -1004,7 +1017,10 @@ class DeflateBuffer:
+             )
+ 
+         try:
+-            chunk = self.decompressor.decompress_sync(chunk)
++            # Decompress with limit + 1 so we can detect if output exceeds limit
++            chunk = self.decompressor.decompress_sync(
++                chunk, max_length=self._max_decompress_size + 1
++            )
+         except Exception:
+             raise ContentEncodingError(
+                 "Can not decode content-encoding: %s" % self.encoding
+@@ -1012,6 +1028,13 @@ class DeflateBuffer:
+ 
+         self._started_decoding = True
+ 
++        # Check if decompression limit was exceeded
++        if len(chunk) > self._max_decompress_size:
++            raise DecompressSizeError(
++                "Decompressed data exceeds the configured limit of %d bytes"
++                % self._max_decompress_size
++            )
++
+         if chunk:
+             self.out.feed_data(chunk, len(chunk))
+ 
+diff --git a/aiohttp/multipart.py b/aiohttp/multipart.py
+index 9e5ff9b41..baf07fd16 100644
+--- a/aiohttp/multipart.py
++++ b/aiohttp/multipart.py
+@@ -27,7 +27,12 @@ from urllib.parse import parse_qsl, unquote, urlencode
+ 
+ from multidict import CIMultiDict, CIMultiDictProxy
+ 
+-from .compression_utils import ZLibCompressor, ZLibDecompressor
++from .abc import AbstractStreamWriter
++from .compression_utils import (
++    DEFAULT_MAX_DECOMPRESS_SIZE,
++    ZLibCompressor,
++    ZLibDecompressor,
++)
+ from .hdrs import (
+     CONTENT_DISPOSITION,
+     CONTENT_ENCODING,
+@@ -263,6 +268,7 @@ class BodyPartReader:
+         *,
+         subtype: str = "mixed",
+         default_charset: Optional[str] = None,
++        max_decompress_size: int = DEFAULT_MAX_DECOMPRESS_SIZE,
+     ) -> None:
+         self.headers = headers
+         self._boundary = boundary
+@@ -278,6 +284,7 @@ class BodyPartReader:
+         self._prev_chunk: Optional[bytes] = None
+         self._content_eof = 0
+         self._cache: Dict[str, Any] = {}
++        self._max_decompress_size = max_decompress_size
+ 
+     def __aiter__(self) -> AsyncIterator["BodyPartReader"]:
+         return self  # type: ignore[return-value]
+@@ -471,7 +478,7 @@ class BodyPartReader:
+             return ZLibDecompressor(
+                 encoding=encoding,
+                 suppress_deflate_header=True,
+-            ).decompress_sync(data)
++            ).decompress_sync(data, max_length=self._max_decompress_size)
+ 
+         raise RuntimeError(f"unknown content encoding: {encoding}")
+ 
+@@ -528,7 +535,7 @@ class BodyPartReaderPayload(Payload):
+         if params:
+             self.set_content_disposition("attachment", True, **params)
+ 
+-    async def write(self, writer: Any) -> None:
++    async def write(self, writer: AbstractStreamWriter) -> None:
+         field = self._value
+         chunk = await field.read_chunk(size=2**16)
+         while chunk:
+@@ -927,7 +934,9 @@ class MultipartWriter(Payload):
+         total += 2 + len(self._boundary) + 4  # b'--'+self._boundary+b'--\r\n'
+         return total
+ 
+-    async def write(self, writer: Any, close_boundary: bool = True) -> None:
++    async def write(
++        self, writer: AbstractStreamWriter, close_boundary: bool = True
++    ) -> None:
+         """Write body."""
+         for part, encoding, te_encoding in self._parts:
+             if self._is_form_data:
+@@ -956,7 +965,7 @@ class MultipartWriter(Payload):
+ 
+ 
+ class MultipartPayloadWriter:
+-    def __init__(self, writer: Any) -> None:
++    def __init__(self, writer: AbstractStreamWriter) -> None:
+         self._writer = writer
+         self._encoding: Optional[str] = None
+         self._compress: Optional[ZLibCompressor] = None
+diff --git a/docs/spelling_wordlist.txt b/docs/spelling_wordlist.txt
+index 514477e8f..34399e6ba 100644
+--- a/docs/spelling_wordlist.txt
++++ b/docs/spelling_wordlist.txt
+@@ -182,6 +182,7 @@ lowercased
+ Mako
+ manylinux
+ metadata
++MiB
+ microservice
+ middleware
+ middlewares
+diff --git a/tests/test_client_functional.py b/tests/test_client_functional.py
+index dbb2dff5a..7d126d185 100644
+--- a/tests/test_client_functional.py
++++ b/tests/test_client_functional.py
+@@ -8,9 +8,18 @@ import json
+ import pathlib
+ import socket
+ import ssl
++import zlib
+ from typing import Any, AsyncIterator
+ from unittest import mock
+ 
++try:
++    try:
++        import brotlicffi as brotli
++    except ImportError:
++        import brotli
++except ImportError:
++    brotli = None  # pragma: no cover
++
+ import pytest
+ from multidict import MultiDict
+ from yarl import URL
+@@ -19,6 +28,8 @@ import aiohttp
+ from aiohttp import Fingerprint, ServerFingerprintMismatch, hdrs, web
+ from aiohttp.abc import AbstractResolver
+ from aiohttp.client_exceptions import TooManyRedirects
++from aiohttp.compression_utils import DEFAULT_MAX_DECOMPRESS_SIZE, HAS_BROTLI
++from aiohttp.http_exceptions import DecompressSizeError
+ from aiohttp.pytest_plugin import AiohttpClient, TestClient
+ from aiohttp.test_utils import unused_port
+ 
+@@ -1903,8 +1914,73 @@ async def test_bad_payload_compression(aiohttp_client) -> None:
+     resp.close()
+ 
+ 
+-async def test_bad_payload_chunked_encoding(aiohttp_client) -> None:
+-    async def handler(request):
++async def test_payload_decompress_size_limit(aiohttp_client: AiohttpClient) -> None:
++    """Test that decompression size limit triggers DecompressSizeError.
++
++    When a compressed payload expands beyond the configured limit,
++    we raise DecompressSizeError.
++    """
++    # Create a highly compressible payload that exceeds the decompression limit.
++    # 64MiB of repeated bytes compresses to ~32KB but expands beyond the
++    # 32MiB per-call limit.
++    original = b"A" * (64 * 2**20)
++    compressed = zlib.compress(original)
++    assert len(original) > DEFAULT_MAX_DECOMPRESS_SIZE
++
++    async def handler(request: web.Request) -> web.Response:
++        # Send compressed data with Content-Encoding header
++        resp = web.Response(body=compressed)
++        resp.headers["Content-Encoding"] = "deflate"
++        return resp
++
++    app = web.Application()
++    app.router.add_get("/", handler)
++    client = await aiohttp_client(app)
++
++    async with client.get("/") as resp:
++        assert resp.status == 200
++
++        with pytest.raises(aiohttp.ClientPayloadError) as exc_info:
++            await resp.read()
++
++        assert isinstance(exc_info.value.__cause__, DecompressSizeError)
++        assert "Decompressed data exceeds" in str(exc_info.value.__cause__)
++
++
++@pytest.mark.skipif(
++    brotli is None or not HAS_BROTLI, reason="brotli decoding is unavailable"
++)
++async def test_payload_decompress_size_limit_brotli(
++    aiohttp_client: AiohttpClient,
++) -> None:
++    """Test that brotli decompression size limit triggers DecompressSizeError."""
++    assert brotli is not None
++    # Create a highly compressible payload that exceeds the decompression limit.
++    original = b"A" * (64 * 2**20)
++    compressed = brotli.compress(original)
++    assert len(original) > DEFAULT_MAX_DECOMPRESS_SIZE
++
++    async def handler(request: web.Request) -> web.Response:
++        resp = web.Response(body=compressed)
++        resp.headers["Content-Encoding"] = "br"
++        return resp
++
++    app = web.Application()
++    app.router.add_get("/", handler)
++    client = await aiohttp_client(app)
++
++    async with client.get("/") as resp:
++        assert resp.status == 200
++
++        with pytest.raises(aiohttp.ClientPayloadError) as exc_info:
++            await resp.read()
++
++        assert isinstance(exc_info.value.__cause__, DecompressSizeError)
++        assert "Decompressed data exceeds" in str(exc_info.value.__cause__)
++
++
++async def test_bad_payload_chunked_encoding(aiohttp_client: AiohttpClient) -> None:
++    async def handler(request: web.Request) -> web.StreamResponse:
+         resp = web.StreamResponse()
+         resp.force_close()
+         resp._length_check = False
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
+index 0fcefdefd..9449c4061 100644
+--- a/tests/test_http_parser.py
++++ b/tests/test_http_parser.py
+@@ -2,6 +2,7 @@
+ 
+ import asyncio
+ import re
++import zlib
+ from contextlib import nullcontext
+ from typing import Any, Dict, List
+ from unittest import mock
+@@ -14,6 +15,7 @@ from yarl import URL
+ import aiohttp
+ from aiohttp import http_exceptions, streams
+ from aiohttp.base_protocol import BaseProtocol
++from aiohttp.compression_utils import HAS_BROTLI
+ from aiohttp.http_parser import (
+     NO_EXTENSIONS,
+     DeflateBuffer,
+@@ -561,7 +563,9 @@ def test_compression_gzip(parser) -> None:
+     assert msg.compression == "gzip"
+ 
+ 
+-@pytest.mark.skipif(brotli is None, reason="brotli is not installed")
++@pytest.mark.skipif(
++    brotli is None or not HAS_BROTLI, reason="brotli decoding is unavailable"
++)
+ def test_compression_brotli(parser) -> None:
+     text = b"GET /test HTTP/1.1\r\n" b"content-encoding: br\r\n\r\n"
+     messages, upgrade, tail = parser.feed_data(text)
+@@ -1736,7 +1740,9 @@ class TestParsePayload:
+         assert p.done
+         assert out.is_eof()
+ 
+-    @pytest.mark.skipif(brotli is None, reason="brotli is not installed")
++    @pytest.mark.skipif(
++        brotli is None or not HAS_BROTLI, reason="brotli decoding is unavailable"
++    )
+     async def test_http_payload_brotli(self, stream) -> None:
+         compressed = brotli.compress(b"brotli data")
+         out = aiohttp.FlowControlDataQueue(
+@@ -1816,6 +1822,7 @@ class TestDeflateBuffer:
+         dbuf.feed_eof()
+         assert [b"line"] == list(d for d, _ in buf._buffer)
+ 
++    @pytest.mark.skipif(not HAS_BROTLI, reason="brotli decoding is unavailable")
+     async def test_feed_eof_no_err_brotli(self, stream) -> None:
+         buf = aiohttp.FlowControlDataQueue(
+             stream, 2**16, loop=asyncio.get_event_loop()
+@@ -1837,3 +1844,36 @@ class TestDeflateBuffer:
+         dbuf.feed_eof()
+ 
+         assert buf.at_eof()
++
++    @pytest.mark.parametrize(
++        "chunk_size",
++        [1024, 2**14, 2**16],  # 1KB, 16KB, 64KB
++        ids=["1KB", "16KB", "64KB"],
++    )
++    async def test_streaming_decompress_large_payload(
++        self, protocol: BaseProtocol, chunk_size: int
++    ) -> None:
++        """Test that large payloads decompress correctly when streamed in chunks.
++
++        This simulates real HTTP streaming where compressed data arrives in
++        small network chunks. Each chunk's decompressed output should be within
++        the max_decompress_size limit, allowing full recovery of the original data.
++        """
++        # Create a large payload (3MiB) that compresses well
++        original = b"A" * (3 * 2**20)
++        compressed = zlib.compress(original)
++
++        buf = aiohttp.StreamReader(protocol, 2**16, loop=asyncio.get_running_loop())
++        dbuf = DeflateBuffer(buf, "deflate")
++
++        # Feed compressed data in chunks (simulating network streaming)
++        for i in range(0, len(compressed), chunk_size):
++            chunk = compressed[i : i + chunk_size]
++            dbuf.feed_data(chunk, len(chunk))
++
++        dbuf.feed_eof()
++
++        # Read all decompressed data
++        result = b"".join(buf._buffer)
++        assert len(result) == len(original)
++        assert result == original
+diff --git a/tests/test_multipart.py b/tests/test_multipart.py
+index e4a2be1f3..553085ca5 100644
+--- a/tests/test_multipart.py
++++ b/tests/test_multipart.py
+@@ -9,6 +9,7 @@ import pytest
+ 
+ import aiohttp
+ from aiohttp import payload
++from aiohttp.abc import AbstractStreamWriter
+ from aiohttp.hdrs import (
+     CONTENT_DISPOSITION,
+     CONTENT_ENCODING,
+@@ -32,14 +33,14 @@ def buf():
+ 
+ 
+ @pytest.fixture
+-def stream(buf):
+-    writer = mock.Mock()
++def stream(buf: bytearray) -> AbstractStreamWriter:
++    writer = mock.create_autospec(AbstractStreamWriter, instance=True, spec_set=True)
+ 
+     async def write(chunk):
+         buf.extend(chunk)
+ 
+     writer.write.side_effect = write
+-    return writer
++    return writer  # type: ignore[no-any-return]
+ 
+ 
+ @pytest.fixture
+@@ -336,6 +337,17 @@ class TestPartReader:
+             result = await obj.read(decode=True)
+         assert b"Time to Relax!" == result
+ 
++    def test_decode_remains_synchronous(self) -> None:
++        data = b"\x0b\xc9\xccMU(\xc9W\x08J\xcdI\xacP\x04\x00"
++        with Stream(b"") as stream:
++            obj = aiohttp.BodyPartReader(
++                BOUNDARY,
++                {CONTENT_ENCODING: "deflate"},
++                stream,
++            )
++            result = obj.decode(data)
++        assert b"Time to Relax!" == result
++
+     async def test_read_with_content_encoding_identity(self) -> None:
+         thing = (
+             b"\x1f\x8b\x08\x00\x00\x00\x00\x00\x00\x03\x0b\xc9\xccMU"
+@@ -1012,7 +1024,9 @@ async def test_writer(writer) -> None:
+     assert writer.boundary == ":"
+ 
+ 
+-async def test_writer_serialize_io_chunk(buf, stream, writer) -> None:
++async def test_writer_serialize_io_chunk(
++    buf: bytearray, stream: AbstractStreamWriter, writer: aiohttp.MultipartWriter
++) -> None:
+     with io.BytesIO(b"foobarbaz") as file_handle:
+         writer.append(file_handle)
+         await writer.write(stream)
+@@ -1022,7 +1036,9 @@ async def test_writer_serialize_io_chunk(buf, stream, writer) -> None:
+     )
+ 
+ 
+-async def test_writer_serialize_json(buf, stream, writer) -> None:
++async def test_writer_serialize_json(
++    buf: bytearray, stream: AbstractStreamWriter, writer: aiohttp.MultipartWriter
++) -> None:
+     writer.append_json({"привет": "мир"})
+     await writer.write(stream)
+     assert (
+@@ -1031,7 +1047,9 @@ async def test_writer_serialize_json(buf, stream, writer) -> None:
+     )
+ 
+ 
+-async def test_writer_serialize_form(buf, stream, writer) -> None:
++async def test_writer_serialize_form(
++    buf: bytearray, stream: AbstractStreamWriter, writer: aiohttp.MultipartWriter
++) -> None:
+     data = [("foo", "bar"), ("foo", "baz"), ("boo", "zoo")]
+     writer.append_form(data)
+     await writer.write(stream)
+@@ -1039,7 +1057,9 @@ async def test_writer_serialize_form(buf, stream, writer) -> None:
+     assert b"foo=bar&foo=baz&boo=zoo" in buf
+ 
+ 
+-async def test_writer_serialize_form_dict(buf, stream, writer) -> None:
++async def test_writer_serialize_form_dict(
++    buf: bytearray, stream: AbstractStreamWriter, writer: aiohttp.MultipartWriter
++) -> None:
+     data = {"hello": "мир"}
+     writer.append_form(data)
+     await writer.write(stream)
+@@ -1047,7 +1067,9 @@ async def test_writer_serialize_form_dict(buf, stream, writer) -> None:
+     assert b"hello=%D0%BC%D0%B8%D1%80" in buf
+ 
+ 
+-async def test_writer_write(buf, stream, writer) -> None:
++async def test_writer_write(
++    buf: bytearray, stream: AbstractStreamWriter, writer: aiohttp.MultipartWriter
++) -> None:
+     writer.append("foo-bar-baz")
+     writer.append_json({"test": "passed"})
+     writer.append_form({"test": "passed"})
+@@ -1093,7 +1115,9 @@ async def test_writer_write(buf, stream, writer) -> None:
+     ) == bytes(buf)
+ 
+ 
+-async def test_writer_write_no_close_boundary(buf, stream) -> None:
++async def test_writer_write_no_close_boundary(
++    buf: bytearray, stream: AbstractStreamWriter
++) -> None:
+     writer = aiohttp.MultipartWriter(boundary=":")
+     writer.append("foo-bar-baz")
+     writer.append_json({"test": "passed"})
+@@ -1125,12 +1149,18 @@ async def test_writer_write_no_close_boundary(buf, stream) -> None:
+     ) == bytes(buf)
+ 
+ 
+-async def test_writer_write_no_parts(buf, stream, writer) -> None:
++async def test_writer_write_no_parts(
++    buf: bytearray, stream: AbstractStreamWriter, writer: aiohttp.MultipartWriter
++) -> None:
+     await writer.write(stream)
+     assert b"--:--\r\n" == bytes(buf)
+ 
+ 
+-async def test_writer_serialize_with_content_encoding_gzip(buf, stream, writer):
++async def test_writer_serialize_with_content_encoding_gzip(
++    buf: bytearray,
++    stream: AbstractStreamWriter,
++    writer: aiohttp.MultipartWriter,
++) -> None:
+     writer.append("Time to Relax!", {CONTENT_ENCODING: "gzip"})
+     await writer.write(stream)
+     headers, message = bytes(buf).split(b"\r\n\r\n", 1)
+@@ -1146,7 +1176,9 @@ async def test_writer_serialize_with_content_encoding_gzip(buf, stream, writer):
+     assert b"Time to Relax!" == data
+ 
+ 
+-async def test_writer_serialize_with_content_encoding_deflate(buf, stream, writer):
++async def test_writer_serialize_with_content_encoding_deflate(
++    buf: bytearray, stream: AbstractStreamWriter, writer: aiohttp.MultipartWriter
++) -> None:
+     writer.append("Time to Relax!", {CONTENT_ENCODING: "deflate"})
+     await writer.write(stream)
+     headers, message = bytes(buf).split(b"\r\n\r\n", 1)
+@@ -1160,7 +1192,9 @@ async def test_writer_serialize_with_content_encoding_deflate(buf, stream, write
+     assert thing == message
+ 
+ 
+-async def test_writer_serialize_with_content_encoding_identity(buf, stream, writer):
++async def test_writer_serialize_with_content_encoding_identity(
++    buf: bytearray, stream: AbstractStreamWriter, writer: aiohttp.MultipartWriter
++) -> None:
+     thing = b"\x0b\xc9\xccMU(\xc9W\x08J\xcdI\xacP\x04\x00"
+     writer.append(thing, {CONTENT_ENCODING: "identity"})
+     await writer.write(stream)
+@@ -1175,12 +1209,16 @@ async def test_writer_serialize_with_content_encoding_identity(buf, stream, writ
+     assert thing == message.split(b"\r\n")[0]
+ 
+ 
+-def test_writer_serialize_with_content_encoding_unknown(buf, stream, writer):
++def test_writer_serialize_with_content_encoding_unknown(
++    buf: bytearray, stream: AbstractStreamWriter, writer: aiohttp.MultipartWriter
++) -> None:
+     with pytest.raises(RuntimeError):
+         writer.append("Time to Relax!", {CONTENT_ENCODING: "snappy"})
+ 
+ 
+-async def test_writer_with_content_transfer_encoding_base64(buf, stream, writer):
++async def test_writer_with_content_transfer_encoding_base64(
++    buf: bytearray, stream: AbstractStreamWriter, writer: aiohttp.MultipartWriter
++) -> None:
+     writer.append("Time to Relax!", {CONTENT_TRANSFER_ENCODING: "base64"})
+     await writer.write(stream)
+     headers, message = bytes(buf).split(b"\r\n\r\n", 1)
+@@ -1193,7 +1231,9 @@ async def test_writer_with_content_transfer_encoding_base64(buf, stream, writer)
+     assert b"VGltZSB0byBSZWxheCE=" == message.split(b"\r\n")[0]
+ 
+ 
+-async def test_writer_content_transfer_encoding_quote_printable(buf, stream, writer):
++async def test_writer_content_transfer_encoding_quote_printable(
++    buf: bytearray, stream: AbstractStreamWriter, writer: aiohttp.MultipartWriter
++) -> None:
+     writer.append("Привет, мир!", {CONTENT_TRANSFER_ENCODING: "quoted-printable"})
+     await writer.write(stream)
+     headers, message = bytes(buf).split(b"\r\n\r\n", 1)
+@@ -1209,7 +1249,9 @@ async def test_writer_content_transfer_encoding_quote_printable(buf, stream, wri
+     )
+ 
+ 
+-def test_writer_content_transfer_encoding_unknown(buf, stream, writer) -> None:
++def test_writer_content_transfer_encoding_unknown(
++    buf: bytearray, stream: AbstractStreamWriter, writer: aiohttp.MultipartWriter
++) -> None:
+     with pytest.raises(RuntimeError):
+         writer.append("Time to Relax!", {CONTENT_TRANSFER_ENCODING: "unknown"})
+ 
+@@ -1333,7 +1375,9 @@ class TestMultipartWriter:
+             with aiohttp.MultipartWriter(boundary=":") as writer:
+                 writer.append(None)
+ 
+-    async def test_write_preserves_content_disposition(self, buf, stream) -> None:
++    async def test_write_preserves_content_disposition(
++        self, buf: bytearray, stream: AbstractStreamWriter
++    ) -> None:
+         with aiohttp.MultipartWriter(boundary=":") as writer:
+             part = writer.append(b"foo", headers={CONTENT_TYPE: "test/passed"})
+             part.set_content_disposition("form-data", filename="bug")
+@@ -1350,7 +1394,9 @@ class TestMultipartWriter:
+         )
+         assert message == b"foo\r\n--:--\r\n"
+ 
+-    async def test_preserve_content_disposition_header(self, buf, stream):
++    async def test_preserve_content_disposition_header(
++        self, buf: bytearray, stream: AbstractStreamWriter
++    ) -> None:
+         # https://github.com/aio-libs/aiohttp/pull/3475#issuecomment-451072381
+         with pathlib.Path(__file__).open("rb") as fobj:
+             with aiohttp.MultipartWriter("form-data", boundary=":") as writer:
+@@ -1374,7 +1420,9 @@ class TestMultipartWriter:
+             b'Content-Disposition: attachments; filename="bug.py"'
+         )
+ 
+-    async def test_set_content_disposition_override(self, buf, stream):
++    async def test_set_content_disposition_override(
++        self, buf: bytearray, stream: AbstractStreamWriter
++    ) -> None:
+         # https://github.com/aio-libs/aiohttp/pull/3475#issuecomment-451072381
+         with pathlib.Path(__file__).open("rb") as fobj:
+             with aiohttp.MultipartWriter("form-data", boundary=":") as writer:
+@@ -1398,7 +1446,9 @@ class TestMultipartWriter:
+             b'Content-Disposition: attachments; filename="bug.py"'
+         )
+ 
+-    async def test_reset_content_disposition_header(self, buf, stream):
++    async def test_reset_content_disposition_header(
++        self, buf: bytearray, stream: AbstractStreamWriter
++    ) -> None:
+         # https://github.com/aio-libs/aiohttp/pull/3475#issuecomment-451072381
+         with pathlib.Path(__file__).open("rb") as fobj:
+             with aiohttp.MultipartWriter("form-data", boundary=":") as writer:
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index 69cad8cb44..feb9039ae1 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -15,6 +15,7 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2025-69229_p1.patch \
            file://CVE-2025-69229_p2.patch \
            file://CVE-2025-69227.patch \
+           file://CVE-2025-69223.patch \
            "
 
 PYPI_PACKAGE = "aiohttp"
-- 
2.35.6


