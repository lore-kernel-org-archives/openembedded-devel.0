Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B339C624CD
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 04:57:52 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23003.1788152269274811978
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2026 21:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hB4TD05F;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7802; q=dns/txt;
  s=iport01; t=1788152269; x=1789361869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yvNIlaahXAFNHC6RAXEVRnfNJqxlQty/6HpkoP+kFEY=;
  b=hB4TD05FjOdCqBhUbMxt0KLenbLWxstfsdSF/FGCasw2ZWN26R00HPAL
   kSwkX96xATfNzpqsNMIUBgAvLzCHvXqZCp21kf8OxtqEAlTHz/tf9rHWt
   9pThyU507VIZtQJtxH3i2375dIMJfaKNdS1pI/phboJ2sSok7xJhI+TC0
   liCTkZhXO1diIGzG9+naavhk8A18CPHsnlP9vtzB97nxjS0/aQCMMen22
   IUk34pnNJYdu55sJWBk1thdH97A5ZQ2/RTK4pmIUWFQMr/5aF6Kh7zMR0
   bRlXvGolZ2EfL01AOJq68Zb6DPOj4xU+Bee7TnpOYYBQ3Jj88VUmXaXsZ
   A==;
X-CSE-ConnectionGUID: qpQE+WA3Q1e2Nv/oMCxlDw==
X-CSE-MsgGUID: mmcSRXN2Toy6/fjHfE2SXA==
X-IPAS-Result: =?us-ascii?q?A0BHAgAsCZVq/5QQJK1aHgEBCxIMggULgld0XkNJlkoDn?=
 =?us-ascii?q?huBfg8BAQEPRA0EAQGEP0YCjXMCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQDEcIBg?=
 =?us-ascii?q?XkzgQGDKAE/AkNQ2zABCxQBgTiFP4MDgRCED10YAYR8JxsbgXKEfoEFgVwBA?=
 =?us-ascii?q?YglBIIigQyBWolfiEBIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bB?=
 =?us-ascii?q?gWBHYEohA8jGTZ6gQlegSspYAESF4EJgggCglqCBQIBSUMOB0dTCQQLGA1IE?=
 =?us-ascii?q?Sw3FRkEPm4HjnofgksBcxoBCiGBNGBhApJ0kBaCIaEPCiiDdowilToaM4QEg?=
 =?us-ascii?q?VeSQJJRC5h9jgqVYBNdhGmBaDyBRwsHcBWDIglKGQ+OKgMLC4NggX+CUYEUx?=
 =?us-ascii?q?lUnMgIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:8cR5bqxrBL8Zuavnxg16t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUDn
 2RJWTqDa/eLYGqmLttyPY6x9UxV7JbRmNRhGlc4r1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkaTpMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJFguBKBbxc8sODhDr
 9oGbzcoRQCHq/3jldpXSsE07igiBMDvOIVavjRryivUSK9/B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUiQC/FMEg9/5JYWkOSlgnD+YjRwo1OOrq1x6G/WpOB0+Oi3bIaFJ4zTHq25mG6do
 2n9xVTfWC0dJYLYxzil/F/2vd/myHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPAXy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:08KsJ6gzAHiz4e2cppWHqwfBOnBQXvgji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGsddB8MTMHfiLqWwLzM2fKYEKA
 ==
X-Talos-CUID: 9a23:IKAJ+mHZ2iLcwPBAqmJ+7Hc5Wf8MKUSEwS32PQi/LE15TJGKHAo=
X-Talos-MUID: 9a23:7zdnrQoSkY4X+4IgwJwezzRnP/xS04L0NEccz9IIuemKGHZLCx7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,252,1779148800"; 
   d="scan'208";a="824485813"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Aug 2026 04:57:48 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 377FD180000B5;
	Mon, 31 Aug 2026 04:57:48 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id CA5A9CD02B9; Sun, 30 Aug 2026 21:57:47 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 2/9] python3-aiohttp: fix CVE-2025-69227
Date: Sun, 30 Aug 2026 21:57:37 -0700
Message-Id: <20260831045744.3321483-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260831045744.3321483-1-dkelaiya@cisco.com>
References: <20260831045744.3321483-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2026 04:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129600

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the reviewed upstream fix commits shown in
[1] and [2]. The advisory identifying the fix is referenced in
[3].

[1] https://github.com/aio-libs/aiohttp/commit/bc1319ec3cbff9438a758951a30907b072561259
[2] https://github.com/aio-libs/aiohttp/commit/d5bf65f15c0c718b6b95e9bc9d0914a92c51e60f
[3] https://nvd.nist.gov/vuln/detail/CVE-2025-69227

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2025-69227.patch      | 163 ++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |   1 +
 2 files changed, 164 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69227.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69227.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69227.patch
new file mode 100644
index 0000000000..8cc045933b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69227.patch
@@ -0,0 +1,163 @@
+From b05e3498d7b7b48f7b3a512a638fabea4ca4cd9f Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Sat, 3 Jan 2026 04:53:29 +0000
+Subject: [PATCH] Replace asserts with exceptions (#11897) (#11914)
+
+CVE: CVE-2025-69227
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/bc1319ec3cbff9438a758951a30907b072561259]
+
+Backport Changes:
+- Adapted the _read_chunk_from_stream() EOF check to aiohttp 3.9.5,
+  where _content_eof is updated outside the newer upstream read loop.
+- Imported CIMultiDict and CIMultiDictProxy explicitly because
+  aiohttp 3.9.5's test_multipart module does not import them.
+
+(cherry picked from commit d5bf65f15c0c718b6b95e9bc9d0914a92c51e60f)
+
+Co-authored-by: J. Nick Koston <nick@home-assistant.io>
+(cherry picked from commit bc1319ec3cbff9438a758951a30907b072561259)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ aiohttp/multipart.py      | 10 ++++------
+ aiohttp/web_request.py    |  8 +++-----
+ tests/test_multipart.py   | 13 ++++++++++++-
+ tests/test_web_request.py | 24 +++++++++++++++++++++++-
+ 4 files changed, 42 insertions(+), 13 deletions(-)
+
+diff --git a/aiohttp/multipart.py b/aiohttp/multipart.py
+index 520ee539e..9e5ff9b41 100644
+--- a/aiohttp/multipart.py
++++ b/aiohttp/multipart.py
+@@ -325,11 +325,8 @@ class BodyPartReader:
+         self._read_bytes += len(chunk)
+         if self._read_bytes == self._length:
+             self._at_eof = True
+-        if self._at_eof:
+-            clrf = await self._content.readline()
+-            assert (
+-                b"\r\n" == clrf
+-            ), "reader did not read all the data or it is malformed"
++        if self._at_eof and await self._content.readline() != b"\r\n":
++            raise ValueError("Reader did not read all the data or it is malformed")
+         return chunk
+ 
+     async def _read_chunk_from_length(self, size: int) -> bytes:
+@@ -354,7 +351,8 @@ class BodyPartReader:
+ 
+         chunk = await self._content.read(size)
+         self._content_eof += int(self._content.at_eof())
+-        assert self._content_eof < 3, "Reading after EOF"
++        if self._content_eof > 2:
++            raise ValueError("Reading after EOF")
+         assert self._prev_chunk is not None
+         window = self._prev_chunk + chunk
+         sub = b"\r\n" + self._boundary
+diff --git a/aiohttp/web_request.py b/aiohttp/web_request.py
+index b3d614186..cd77b7bde 100644
+--- a/aiohttp/web_request.py
++++ b/aiohttp/web_request.py
+@@ -713,12 +713,12 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+             max_size = self._client_max_size
+ 
+             size = 0
+-            field = await multipart.next()
+-            while field is not None:
++            while (field := await multipart.next()) is not None:
+                 field_ct = field.headers.get(hdrs.CONTENT_TYPE)
+ 
+                 if isinstance(field, BodyPartReader):
+-                    assert field.name is not None
++                    if field.name is None:
++                        raise ValueError("Multipart field missing name.")
+ 
+                     # Note that according to RFC 7578, the Content-Type header
+                     # is optional, even for files, so we can't assume it's
+@@ -770,8 +770,6 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+                     raise ValueError(
+                         "To decode nested multipart you need " "to use custom reader",
+                     )
+-
+-                field = await multipart.next()
+         else:
+             data = await self.read()
+             if data:
+diff --git a/tests/test_multipart.py b/tests/test_multipart.py
+index 436b70957..e46eb29bd5 100644
+--- a/tests/test_multipart.py
++++ b/tests/test_multipart.py
+@@ -6,6 +6,7 @@
+ from unittest import mock
+ 
+ import pytest
++from multidict import CIMultiDict, CIMultiDictProxy
+ 
+ import aiohttp
+ from aiohttp import payload
+@@ -200,11 +200,21 @@ class TestPartReader:
+         with Stream(data) as stream:
+             obj = aiohttp.BodyPartReader(BOUNDARY, {}, stream)
+             result = b""
+-            with pytest.raises(AssertionError):
++            with pytest.raises(ValueError):
+                 for _ in range(4):
+                     result += await obj.read_chunk(7)
+         assert data == result
+ 
++    async def test_read_with_content_length_malformed_crlf(self) -> None:
++        # Content-Length is correct but data after content is not \r\n
++        content = b"Hello"
++        h = CIMultiDictProxy(CIMultiDict({"CONTENT-LENGTH": str(len(content))}))
++        # Malformed: "XX" instead of "\r\n" after content
++        with Stream(content + b"XX--:--") as stream:
++            obj = aiohttp.BodyPartReader(BOUNDARY, h, stream)
++            with pytest.raises(ValueError, match="malformed"):
++                await obj.read()
++
+     async def test_read_boundary_with_incomplete_chunk(self) -> None:
+         with Stream(b"") as stream:
+ 
+diff --git a/tests/test_web_request.py b/tests/test_web_request.py
+index 704fc189a..962092999 100644
+--- a/tests/test_web_request.py
++++ b/tests/test_web_request.py
+@@ -10,6 +10,7 @@ from multidict import CIMultiDict, CIMultiDictProxy, MultiDict
+ from yarl import URL
+ 
+ from aiohttp import HttpVersion
++from aiohttp.base_protocol import BaseProtocol
+ from aiohttp.http_parser import RawRequestMessage
+ from aiohttp.streams import StreamReader
+ from aiohttp.test_utils import make_mocked_request
+@@ -629,7 +630,28 @@ async def test_multipart_formdata(protocol) -> None:
+     assert dict(result) == {"a": "b", "c": "d"}
+ 
+ 
+-async def test_multipart_formdata_file(protocol) -> None:
++async def test_multipart_formdata_field_missing_name(protocol: BaseProtocol) -> None:
++    # Ensure ValueError is raised when Content-Disposition has no name
++    payload = StreamReader(protocol, 2**16, loop=asyncio.get_event_loop())
++    payload.feed_data(
++        b"-----------------------------326931944431359\r\n"
++        b"Content-Disposition: form-data\r\n"  # Missing name!
++        b"\r\n"
++        b"value\r\n"
++        b"-----------------------------326931944431359--\r\n"
++    )
++    content_type = (
++        "multipart/form-data; boundary=---------------------------326931944431359"
++    )
++    payload.feed_eof()
++    req = make_mocked_request(
++        "POST", "/", headers={"CONTENT-TYPE": content_type}, payload=payload
++    )
++    with pytest.raises(ValueError, match="Multipart field missing name"):
++        await req.post()
++
++
++async def test_multipart_formdata_file(protocol: BaseProtocol) -> None:
+     # Make sure file uploads work, even without a content type
+     payload = StreamReader(protocol, 2**16, loop=asyncio.get_event_loop())
+     payload.feed_data(
+-- 
+2.44.4
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index ffdc25791b..765796b8cd 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -12,6 +12,7 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2025-69225.patch \
            file://CVE-2025-69226.patch \
            file://CVE-2025-69228.patch \
+           file://CVE-2025-69227.patch \
            "
 
 PYPI_PACKAGE = "aiohttp"
-- 
2.35.6


