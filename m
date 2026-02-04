Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31F8E9D410
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 16:29:38 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24771.1770222570126619516
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 08:29:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A0j63MrC;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee2715254so39546945e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 08:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770222568; x=1770827368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNyI1ZWbqGyxxFaWw0VIChXf5r10jPEenfV/FgnywUQ=;
        b=A0j63MrCbd/xXP/Jx/ei6O50tXVGiUCnkh5mjV8CegOC4wjBbhNrIhS9TSltzF2wLp
         CfTJNhkYlS1dVWZYTm3rFJY87w5diKvBSzxbA/tNQTN7sEwp5r/lNxj6+ARWVHjKVmYz
         SreT9ZHxhdd10AGG7oHPva9SgXo2is6pTV3Gnk3tbhtckpw34zYYEocR2BU+Rve4bBWQ
         FlVwhjlct6lcDcsp4VNbM5+iSWjOKkI8IN2EwKVBCl+vkFGUyRtKJ2/tA7QK2eGhxbnU
         BOxzm1Ky+0dEYKRolepiAEZtDNNhqaAUsqZVa6cacf0wTUuT43nwG29iZVa3ffiCJB0g
         9raA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770222568; x=1770827368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eNyI1ZWbqGyxxFaWw0VIChXf5r10jPEenfV/FgnywUQ=;
        b=B/9xUsE7jw97d1VeonPPDcC+v6PrAvWURIvGgWaYNqvBVEpWNocjzQ81Mc4VsV7y8v
         xVKkXqsEOybVS5rdMUG0bjur8tUiTHdzrCSdGZopGYNJ8m/foqWdOVBi4ZVRpaTnCqbZ
         0QTbDlGfIgfiftEKQ1v6Iaa9FGTYA/K3hVJPL4TQWkL5CdjJ+dR+lcNrkeIu4W1Uer/q
         qIfrmRbZ8KKR+XBCRHqV62wp1WgF58x79p4J5w7wIu6ekd2YQuwSQnEnfwpeYf53uOXN
         RQxmtugsbafCXU6+t/w64wPz1FlnZyAityiEn3wPUG2FCtS00nRvBgDHiVjyWRsiMN23
         BLBg==
X-Gm-Message-State: AOJu0Ywa65FFNWbcLCMuTwVb90pXJNEu2ZRGljCHytM7yUcx7pOpL660
	5Vedc7WakvKQDMG40g+m9/I5ztEOuhqmjiG/2v3tK3IoNP5T23r4nrgJzSFgCQ==
X-Gm-Gg: AZuq6aJ/utarghGutL8rV2aV6eTTjWWn+N8tbIliwFDW/fJTgWVwy89hMRiqyATT6oL
	dRGQurhfIS6+fPSLetCsSezAzho3I98o48qx2nnjVm2JsUiaWsG7X64PZrnlJhnJqbffCxENLjO
	KEcxvfrPbwYvQOpNrD7OuezMhq9ILORJRhkmIZMSVMqT4tlaDTnH0IQGkEtl+ZaRSNMN+njNT9A
	uBtwXFRbKZ/cqw1PEAvYigzbS5iVjkMOJfqXx4ZwZnicFEF+e+wRxE0oVkCltldM4O0QAnto5T4
	dWnuva+jIASdcYjMneEHOFCNAmzijVGv4JG9rDXWQ+U9Nb7UCMPl2/J43991jNLXb3grxg+gcj2
	f/VOYVftzDDzgKvasj7cdWakl6MdfbY3uZ30h4lD+mz7WL3CcbiVH8ItKxfSh7jIodjcO2gT3wr
	r+oI0PoVpUWSVBIp27IOI=
X-Received: by 2002:a05:600c:3106:b0:477:58:7cf4 with SMTP id 5b1f17b1804b1-4830e93e9b9mr45909215e9.4.1770222568262;
        Wed, 04 Feb 2026 08:29:28 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830ec6fc89sm23293325e9.6.2026.02.04.08.29.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 08:29:27 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 4/7] python3-aiohttp: patch CVE-2025-69227
Date: Wed,  4 Feb 2026 17:29:19 +0100
Message-ID: <20260204162924.3042284-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260204162924.3042284-1-skandigraun@gmail.com>
References: <20260204162924.3042284-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 16:29:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124139

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-69227

Backport the patch that is referenced by teh NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-aiohttp/CVE-2025-69227.patch      | 148 ++++++++++++++++++
 .../python/python3-aiohttp_3.12.15.bb         |   1 +
 2 files changed, 149 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69227.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69227.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69227.patch
new file mode 100644
index 0000000000..65dae1707b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69227.patch
@@ -0,0 +1,148 @@
+From 635c8c03b609b1099d93fb8ea8c8691624237b0f Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sat, 3 Jan 2026 04:53:29 +0000
+Subject: [PATCH] Replace asserts with exceptions (#11897) (#11914)
+
+From: Sam Bull <git@sambull.org>
+
+(cherry picked from commit d5bf65f15c0c718b6b95e9bc9d0914a92c51e60f)
+
+Co-authored-by: J. Nick Koston <nick@home-assistant.io>
+
+CVE: CVE-2025-69227
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/bc1319ec3cbff9438a758951a30907b072561259]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ aiohttp/multipart.py      | 10 ++++------
+ aiohttp/web_request.py    |  8 +++-----
+ tests/test_multipart.py   | 12 +++++++++++-
+ tests/test_web_request.py | 24 +++++++++++++++++++++++-
+ 4 files changed, 41 insertions(+), 13 deletions(-)
+
+diff --git a/aiohttp/multipart.py b/aiohttp/multipart.py
+index 54dfd48..7783ac5 100644
+--- a/aiohttp/multipart.py
++++ b/aiohttp/multipart.py
+@@ -357,11 +357,8 @@ class BodyPartReader:
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
+@@ -390,7 +387,8 @@ class BodyPartReader:
+         while len(chunk) < self._boundary_len:
+             chunk += await self._content.read(size)
+             self._content_eof += int(self._content.at_eof())
+-            assert self._content_eof < 3, "Reading after EOF"
++            if self._content_eof > 2:
++                raise ValueError("Reading after EOF")
+             if self._content_eof:
+                 break
+         if len(chunk) > size:
+diff --git a/aiohttp/web_request.py b/aiohttp/web_request.py
+index 6e09027..96222b0 100644
+--- a/aiohttp/web_request.py
++++ b/aiohttp/web_request.py
+@@ -721,13 +721,13 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+             multipart = await self.multipart()
+             max_size = self._client_max_size
+ 
+-            field = await multipart.next()
+-            while field is not None:
++            while (field := await multipart.next()) is not None:
+                 size = 0
+                 field_ct = field.headers.get(hdrs.CONTENT_TYPE)
+ 
+                 if isinstance(field, BodyPartReader):
+-                    assert field.name is not None
++                    if field.name is None:
++                        raise ValueError("Multipart field missing name.")
+ 
+                     # Note that according to RFC 7578, the Content-Type header
+                     # is optional, even for files, so we can't assume it's
+@@ -779,8 +779,6 @@ class BaseRequest(MutableMapping[str, Any], HeadersMixin):
+                     raise ValueError(
+                         "To decode nested multipart you need to use custom reader",
+                     )
+-
+-                field = await multipart.next()
+         else:
+             data = await self.read()
+             if data:
+diff --git a/tests/test_multipart.py b/tests/test_multipart.py
+index 75b73a7..5351945 100644
+--- a/tests/test_multipart.py
++++ b/tests/test_multipart.py
+@@ -221,11 +221,21 @@ class TestPartReader:
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
+index da80ca9..125b95e 100644
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
+@@ -815,7 +816,28 @@ async def test_multipart_formdata(protocol) -> None:
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
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
index 16429c9d86..644c07153d 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 SRC_URI += "file://CVE-2025-69224.patch \
             file://CVE-2025-69225.patch \
             file://CVE-2025-69226.patch \
+            file://CVE-2025-69227.patch \
 "
 SRC_URI[sha256sum] = "4fc61385e9c98d72fcdf47e6dd81833f47b2f77c114c29cd64a361be57a763a2"
 

