Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36202.1795584016467055052
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:20:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=AAqC57fR;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13319; q=dns/txt;
  s=iport01; t=1795584017; x=1796793617;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ZoQL/eBzmhbFTP1xGviFEUX5Yl0HPO7ZLwWLLSjMlZA=;
  b=AAqC57fRTgsT+ZrcVWPRwx2nOTw8flHOf4fU1UCgGCGTrhbm9B3Vjw5H
   tAvFSPv0ATcaO65zzWWqsEBWMotRnWmQ5R92etkn8HtgEb+sKTGPI923+
   04c3soyQpK2fFRsWG/hPqlLfZwzOQ8Ps+V2uW0glgv5n/SR3dUbozWnPe
   kB4SaYL77pwaDsW2BORhr2ZYhNa7yUKXcXxDfLZkv7H/P+NOENjD6wD0P
   pY7tghdO7+uGyRmyAqCJXRrxUOTXRJBmxboqulFagY5N5V+7kQ51Kka+9
   wChMcSbC+9ZRcCU/DsFzoUjmyP4E0Q1ijrxSXbk0QS1nRpVFds1nC/KHi
   Q==;
X-CSE-ConnectionGUID: VEK4QYiRSty3akEUK8KuWg==
X-CSE-MsgGUID: FWYEcTE9RYyBDX5n70Orug==
X-IPAS-Result: =?us-ascii?q?A0ACAwAhbQZr/9JK/pBaglmCV3VhQkkDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOIgImNgcOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYARsFChMcAwECLysjCBmDAgGCdAIBEboDg?=
 =?us-ascii?q?XkzgQGDKQGBVNszAQsUAYE4hUKIJV0YAYR+JxsbgXKBFYE7gi+BBYFcAogmB?=
 =?us-ascii?q?IIigQyBVI0TAoFJiFJIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbB?=
 =?us-ascii?q?gWBHIEegRKBA12BKyheIYEIgXUCglGCAAIBSUEOB0VTCSVDEkckIggSCQETG?=
 =?us-ascii?q?iwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMBwkLwUZJjwbCoEMJx0eGQ4CKQYWI?=
 =?us-ascii?q?Qs0GA1IESw3FRkEPm4HlBOCOTUbCwcBBTdRAQckewSBLRwCkxeQHoIioREKK?=
 =?us-ascii?q?IN5jCSVOhozhASBV5JDklQLmH2OCpYETYRqgW8BNIFZcBWDIglKGQ+OKwMLC?=
 =?us-ascii?q?4NghWTIdyM1AgkDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:JzYF16llIEwZlW+Dvonv+8Po5gzWJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfXjyFO/uOY2XzeopybI3joUoGuJLRm9E2SQNt/Co0EVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6x9yQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNsf/b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FbM12bpOMGB0z
 uAJczkOQy2g18Gr/73uH4GAhux7RCXqFIoSoDRkiDreF/tjGcGFSKTR7tge1zA17ixMNa+CO
 4xDNGYpM0iGOUQXUrsUIMpWcOOAj2LneiddoUi9rqss6G+Vxwt0uFToGISNI4zWGZsM9qqej
 kz5zknyPjxLDu2O4xa1r3Tz3sjVgCyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXjlCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:ZpzTZ6vMyiuhk5rqekixRQgP7skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:DunnXG0BzW198i5B8LLIcbxfJO0GLkTszU3rP17jAGVEdZ7FakKv9/Yx
X-Talos-MUID: 9a23:lJztNgm97d7OD7j/xPD6dnpMC/ZF6JiDWXo8gL8qi5SCanRXISqS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60184461"
Received: from aer-l-core-09.cisco.com ([144.254.74.210])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:20:12 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-09.cisco.com (Postfix) with ESMTPS id 49EEF18000123
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:20:12 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 7BF5DCBF224; Tue, 24 Nov 2026 21:20:09 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 05/10] python3-aiohttp: fix CVE-2026-128127
Date: Tue, 24 Nov 2026 21:20:01 -0800
Message-Id: <20261125052006.3116497-6-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125052006.3116497-1-asparmar@cisco.com>
References: <20261125052006.3116497-1-asparmar@cisco.com>
MIME-Version: 1.0
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-09.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:23:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132984
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the multipart base64 reader fix for CVE-2026-128127
from the upstream stable branch [1].

Bound retained base64 input and handle incomplete encoded chunks without
retaining unbounded discarded input.

[1] https://github.com/aio-libs/aiohttp/commit/a555ab698e08e9baea7386d5b4c0761cb8956fdd
[2] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-24c4-3p7v-29cm

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../python3-aiohttp/CVE-2026-128127.patch     | 291 ++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |   1 +
 2 files changed, 292 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128127.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128127.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128127.patch
new file mode 100644
index 0000000000..af91c2f53d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-128127.patch
@@ -0,0 +1,291 @@
+From 997df9aca0b9e9d6c5cdc70856e5f4482bbce8b7 Mon Sep 17 00:00:00 2001
+From: "patchback[bot]" <45432694+patchback[bot]@users.noreply.github.com>
+Date: Sat, 22 Aug 2026 18:45:23 +0100
+Subject: [PATCH] [PR #13509/2d9c5c10 backport][3.14] Fix multipart base64 edge
+ cases (#13513)
+
+**This is a backport of PR #13509 as merged into master
+(2d9c5c1062eff0034fb3ab120897a6c1b3ff7041).**
+
+---------
+
+CVE: CVE-2026-128127
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/a555ab698e08e9baea7386d5b4c0761cb8956fdd]
+
+Backport Changes:
+- Omit tests/test_benchmarks_multipart.py: the upstream-only codspeed
+  benchmark imports an unavailable DEFAULT_CHUNK_SIZE helper and uses
+  a BodyPartReader client_max_size argument absent from the current
+  API. Retain all multipart regression tests and the changelog.
+
+Co-authored-by: Sam Bull <git@sambull.org>
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ CHANGES/13509.bugfix.rst |   1 +
+ aiohttp/multipart.py     |  74 ++++++++++++++++---------
+ tests/test_multipart.py  | 117 ++++++++++++++++++++++++++++++++++++++-
+ 3 files changed, 165 insertions(+), 27 deletions(-)
+ create mode 100644 CHANGES/13509.bugfix.rst
+
+diff --git a/CHANGES/13509.bugfix.rst b/CHANGES/13509.bugfix.rst
+new file mode 100644
+index 0000000..8e74540
+--- /dev/null
++++ b/CHANGES/13509.bugfix.rst
+@@ -0,0 +1 @@
++Fixed some edge case handling in multipart parts using base 64 encoding -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/multipart.py b/aiohttp/multipart.py
+index ec8b82b..36c4971 100644
+--- a/aiohttp/multipart.py
++++ b/aiohttp/multipart.py
+@@ -72,6 +72,13 @@ __all__ = (
+ )
+ 
+ 
++# The base64 alphabet plus the padding character.
++_BASE64_CHARS = frozenset(
++    b"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="
++)
++_NON_BASE64_BYTES = bytes(b for b in range(256) if b not in _BASE64_CHARS)
++
++
+ if TYPE_CHECKING:
+     from .client_reqrep import ClientResponse
+ 
+@@ -293,6 +300,7 @@ class BodyPartReader:
+         length = None if self._is_form_data else self.headers.get(CONTENT_LENGTH, None)
+         self._length = int(length) if length is not None else None
+         self._read_bytes = 0
++        self._b64_carry = b""
+         self._unread: Deque[bytes] = deque()
+         self._prev_chunk: Optional[bytes] = None
+         self._content_eof = 0
+@@ -340,43 +348,59 @@ class BodyPartReader:
+         """
+         if self._at_eof:
+             return b""
++        carry = self._b64_carry
++        want = size - len(carry)
++        if carry:
++            self._b64_carry = b""
++            want = max(want, self._boundary_len)
+         if self._length:
+-            chunk = await self._read_chunk_from_length(size)
++            fresh = await self._read_chunk_from_length(want)
+         else:
+-            chunk = await self._read_chunk_from_stream(size)
++            fresh = await self._read_chunk_from_stream(want)
++        chunk = carry + fresh
++        self._read_bytes += len(fresh)
+ 
+-        # For the case of base64 data, we must read a fragment of size with a
+-        # remainder of 0 by dividing by 4 for string without symbols \n or \r
++        # base64 decodes in quartets and every chunk is decoded on its own, so
++        # a chunk should not end mid-quartet.
+         encoding = self.headers.get(CONTENT_TRANSFER_ENCODING)
+         if encoding and encoding.lower() == "base64":
+-            stripped_chunk = b"".join(chunk.split())
+-            remainder = len(stripped_chunk) % 4
+-
+-            while remainder != 0 and not self.at_eof():
+-                over_chunk_size = 4 - remainder
+-                over_chunk = b""
+-
+-                if self._prev_chunk:
+-                    over_chunk = self._prev_chunk[:over_chunk_size]
+-                    self._prev_chunk = self._prev_chunk[len(over_chunk) :]
+-
+-                if len(over_chunk) != over_chunk_size:
+-                    over_chunk += await self._content.read(4 - len(over_chunk))
++            chunk = self._align_base64_chunk(chunk, len(carry) + want)
+ 
+-                if not over_chunk:
+-                    self._at_eof = True
+-
+-                stripped_chunk += b"".join(over_chunk.split())
+-                chunk += over_chunk
+-                remainder = len(stripped_chunk) % 4
+-
+-        self._read_bytes += len(chunk)
+         if self._read_bytes == self._length:
+             self._at_eof = True
+         if self._at_eof and await self._content.readline() != b"\r\n":
+             raise ValueError("Reader did not read all the data or it is malformed")
+         return chunk
+ 
++    def _align_base64_chunk(self, chunk: bytes, size: int) -> bytes:
++        at_end = self._at_eof or (
++            self._length is not None and self._read_bytes >= self._length
++        )
++        if not at_end and len(chunk) > size:
++            self._b64_carry = chunk[size:]
++            chunk = chunk[:size]
++
++        remainder = len(chunk.translate(None, _NON_BASE64_BYTES)) % 4
++        if not remainder or at_end:
++            return chunk
++
++        # Walk back over the trailing partial quartet and carry it into the
++        # next chunk.
++        cut = len(chunk)
++        left = remainder
++        while left:
++            cut -= 1
++            if chunk[cut] in _BASE64_CHARS:
++                left -= 1
++        if not cut:
++            # No whole quartet to hand back, and carrying the lot would make
++            # no progress: the caller asked for this many bytes, and a part
++            # that holds no quartet within them holds none to give.
++            return chunk
++
++        self._b64_carry = chunk[cut:] + self._b64_carry
++        return chunk[:cut]
++
+     async def _read_chunk_from_length(self, size: int) -> bytes:
+         # Reads body part content chunk of the specified size.
+         # The body part must has Content-Length header with proper value.
+diff --git a/tests/test_multipart.py b/tests/test_multipart.py
+index 587d383..92d2241 100644
+--- a/tests/test_multipart.py
++++ b/tests/test_multipart.py
+@@ -1,4 +1,5 @@
+ import asyncio
++import base64
+ import io
+ import json
+ import pathlib
+@@ -399,7 +400,7 @@ class TestPartReader:
+             obj = aiohttp.BodyPartReader(BOUNDARY, h, stream)
+             result = b""
+             while not obj.at_eof():
+-                chunk = await obj.read_chunk(size=6)
++                chunk = await obj.read_chunk(size=8)
+                 result += obj.decode(chunk)
+         assert b"Time to Relax!" == result
+ 
+@@ -409,11 +410,123 @@ class TestPartReader:
+             obj = aiohttp.BodyPartReader(BOUNDARY, h, stream)
+             result = b""
+             while not obj.at_eof():
+-                chunk = await obj.read_chunk(size=6)
++                chunk = await obj.read_chunk(size=8)
+                 async for decoded_chunk in obj.decode_iter(chunk):
+                     result += decoded_chunk
+         assert b"Time to Relax!" == result
+ 
++    async def test_read_chunk_base64_content_length_no_overread(self) -> None:
++        # A base64 part whose Content-Length is not a multiple of 4 must not
++        # let the base64 realignment loop read past the declared length into
++        # the boundary and the parts that follow (regression for a negative
++        # `_read_chunk_from_length` chunk_size / StreamReader.read(-1) bypass
++        # of client_max_size).
++        b64 = b"VGltZSB0byBSZWxheCE"  # 19 chars, 19 % 4 == 3 (unpadded)
++        secret = b"secret-from-next-part"
++        rest = b"\r\n--:\r\nContent-Length: %d\r\n\r\n%s\r\n--:--\r\n" % (
++            len(secret),
++            secret,
++        )
++        h = CIMultiDict(
++            {"CONTENT-LENGTH": str(len(b64)), CONTENT_TRANSFER_ENCODING: "base64"}
++        )
++        with Stream(b64 + rest) as stream:
++            obj = aiohttp.BodyPartReader(BOUNDARY, h, stream)
++            chunk = await obj.read_chunk(8192)
++            assert chunk == b64
++            assert obj.at_eof()
++            assert secret not in chunk
++            # The following part is left intact on the stream.
++            assert secret in await stream.read()
++
++    async def test_read_chunk_base64_bounded_by_requested_size(self) -> None:
++        # Whole quartets are handed back and the trailing partial quartet is
++        # carried into the next read, so size acts as a cap rather than a
++        # starting point. The carry is subtracted from the next read instead
++        # of being pushed back, so nothing accumulates over a long part: the
++        # lookahead would otherwise gain a couple of bytes on every call.
++        payload = b"x" * 8192
++        h = CIMultiDict({CONTENT_TRANSFER_ENCODING: "base64"})
++        body = base64.encodebytes(payload).replace(b"\n", b"\r\n")
++        with Stream(body + b"\r\n--:--") as stream:
++            obj = aiohttp.BodyPartReader(BOUNDARY, h, stream)
++            decoded = b""
++            chunks = []
++            carried = 0
++            while not obj.at_eof():
++                chunks.append(await obj.read_chunk(64))
++                decoded += obj.decode(chunks[-1])
++                carried += bool(obj._b64_carry)
++                assert len(obj._prev_chunk or b"") <= 64
++                assert len(obj._b64_carry) < 64
++        assert decoded == payload
++        assert all(len(c) <= 64 for c in chunks[:-1])
++        # The bound above is only meaningful if the carry is exercised, and
++        # over enough calls for a per-call drift to become visible.
++        assert len(chunks) > 100
++        assert carried > len(chunks) // 2
++
++    async def test_read_chunk_base64_padding_run_does_not_amplify(self) -> None:
++        # A part padded with a long run of insignificant bytes used to make a
++        # single call swallow the whole run. Such a run holds no whole quartet,
++        # so this covers the branch that hands the chunk straight back: it must
++        # still cap the chunk at the size asked for, and must hand back
++        # something every time so callers looping on a truthy chunk make
++        # progress. Nothing is carried here, so this says nothing about the
++        # deferral path -- that is bounded by
++        # test_read_chunk_base64_bounded_by_requested_size.
++        h = CIMultiDict({CONTENT_TRANSFER_ENCODING: "base64"})
++        body = b"A" + b" " * (64 * 1024) + b"BBB\r\n--:--"
++        with Stream(body) as stream:
++            obj = aiohttp.BodyPartReader(BOUNDARY, h, stream)
++            while not obj.at_eof():
++                chunk = await obj.read_chunk(8192)
++                assert chunk
++                assert len(chunk) <= 8192
++
++    async def test_read_chunk_base64_length_delimited_carries_quartet(self) -> None:
++        # A length-delimited part has no lookahead (_prev_chunk stays None), so
++        # this covers carrying a partial quartet on that path. The carry is
++        # subtracted from the next read, which the Content-Length accounting
++        # has to agree with, or the part overruns its declared length and the
++        # trailing CRLF check rejects it. Sizes are chosen to land mid-quartet.
++        payload = b"z" * 300
++        b64 = base64.b64encode(payload)
++        h = CIMultiDict(
++            {"CONTENT-LENGTH": str(len(b64)), CONTENT_TRANSFER_ENCODING: "base64"}
++        )
++        for size in (6, 7, 9, 13):
++            with Stream(b64 + b"\r\n--:--") as stream:
++                obj = aiohttp.BodyPartReader(BOUNDARY, h, stream)
++                assert obj._prev_chunk is None
++                decoded = b""
++                carried = 0
++                while not obj.at_eof():
++                    decoded += obj.decode(await obj.read_chunk(size))
++                    carried += bool(obj._b64_carry)
++                assert decoded == payload, size
++                # Guard against this quietly becoming a no-op: the point is
++                # that the carry is exercised, not merely that reading works.
++                assert carried > 10, (size, carried)
++
++    @pytest.mark.parametrize("size", (5, 6, 7, 8))
++    async def test_read_chunk_base64_small_size_carry_drains(self, size: int) -> None:
++        # _read_chunk_from_stream refuses to read fewer than boundary_len
++        # bytes, so for a size this small the carry cannot always be
++        # subtracted from the next read. The chunk then has to be allowed over
++        # size: capping it back would read more than it hands back on every
++        # call, and the carry would climb without ever draining.
++        payload = b"q" * 600
++        h = CIMultiDict({CONTENT_TRANSFER_ENCODING: "base64"})
++        body = base64.encodebytes(payload).replace(b"\n", b"\r\n")
++        with Stream(body + b"\r\n--:--") as stream:
++            obj = aiohttp.BodyPartReader(BOUNDARY, h, stream)
++            decoded = b""
++            while not obj.at_eof():
++                decoded += obj.decode(await obj.read_chunk(size))
++                assert len(obj._b64_carry) <= size + obj._boundary_len
++        assert decoded == payload
++
+     async def test_decode_with_content_encoding_deflate(self) -> None:
+         h = CIMultiDictProxy(CIMultiDict({CONTENT_ENCODING: "deflate"}))
+         data = b"\x0b\xc9\xccMU(\xc9W\x08J\xcdI\xacP\x04\x00"
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index 9424943281..3ac8f15bbf 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -37,6 +37,7 @@ SRC_URI += " \
     file://CVE-2026-128124.patch \
     file://CVE-2026-128125.patch \
     file://CVE-2026-128126.patch \
+    file://CVE-2026-128127.patch \
 "
 
 CVE_PRODUCT = "aiohttp:aiohttp"
-- 
2.35.6

