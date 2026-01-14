Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0254BD2A00F
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:01:15 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9428.1768395672286058417
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:01:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hnz4pKsD;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7f89d0b37f0so480157b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 05:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768395671; x=1769000471; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bI2CACZw8ExvQjhtWCjhWa5E5wGaQzQn1J1Bby0/prQ=;
        b=Hnz4pKsDDQVY4v5qUPSfuRlNsBM30XoZS/KDj2Bl3mFrWfu+kk4PE7xNxpg+GTWnRY
         5xJfSzyXZiLR95iFntBlpaTL7G1DEexbIVhDOMlBGT5t7DLSi4NKAnH28+DDj/1P7nAZ
         zS/2zJZ552Hkdco2jhjBQsCe9lCz+m/rbCW8S0nAjLcMyL7FaiVC/YZycwfDoYP7MeOp
         j6/daAC53h3qm20W7cUIans+tJEKjAew+phZNCViKWOle+dT2dR4Cev6a64BRQrriKQp
         dYkoQdejcO2esZKGEkAGa7q0+6z+n+TRHaX4VmWErjfnxszDlkRMhyUA3A6i6FYnRgSb
         9G4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768395671; x=1769000471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bI2CACZw8ExvQjhtWCjhWa5E5wGaQzQn1J1Bby0/prQ=;
        b=jFRwBV/OUU2imVGUTk1sa0zeolV6WT4KUj+suXZBGe5pCTyEYUFrooyNP5p45K9tda
         U+B8XHOZ9i+nTsLzwPk4c47SYm01IypmL8e4HodPWvf/W+w+eyNFVR+HIBFJTw2Os0In
         69+RbjRmJDdpPudDPH3+iR+8pv8so4FpjCUFky0NJ418FL7dKgwwZFWjHnW1YMPc27yB
         CGceHYTb7xELoyO7BAbGLEAoOGKb1LRS35iOTDc+wQ3/x+sIz4SAOhG1o8PvpFzhV4Ty
         8+LQ62CYeR490/2m8AuMHFByHidD5q58WRSvBPbLRSXyFgfZ6KzU88634E7yyCb3BDi9
         Idtg==
X-Gm-Message-State: AOJu0YxT4hY8Kpn71+6ROpIg2YquAYNsXWUu9odcblndD4YHUAzTErPf
	F+M9QjXEmxwuARRJB/E4HbpF4nlIawq3JV1T7w3Y+jJJ1IxtEEfIctUdrAa7wQ==
X-Gm-Gg: AY/fxX7CK5lpSCo1DwsOm5qM4/yvWRUPPImqtlt5m3xbORlMyc9OHSUROhM2VTDV/JU
	CcpNq2i+J9FSicyzVYfRbQhnRBzbukBa+V+/KwbQE0lJfhTHI5i3OAt6yQBPG3D+7HMWTNpNlvX
	c8Xt7avoQkY+siAcCy2DLTz9vduEdO02X6svKfhOR5+P3hkitnMwEKS540GCNgfVb7ymFIf6tjZ
	hqA6KomObB9OOqQU+8PhKmtwOFo5eRwLrmLyIEavmeCY8OL9KLB03w8fHohHrEMcNrQHJswlguw
	4NZKgj9xU4MjS4J6IFOaONhmaCjgWnfu3qIzFxNEUaPHQdqiEf8VnSxBqczTAOWp7mJVe1wVOWy
	KmdQsEXdVGmXXSWY9WWDIoxJP2xIcN5+4uQjrJuICMW9VVs/80x/qtU6OZSOI4W7IaSyrfna/xp
	qEFghIPfDK7DNYYIfzlCUKVex+W4zA5idGYg==
X-Received: by 2002:a05:6a20:9392:b0:366:14b0:4b15 with SMTP id adf61e73a8af0-38bed3b409dmr2615496637.32.1768395669311;
        Wed, 14 Jan 2026 05:01:09 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819ab137711sm23340853b3a.0.2026.01.14.05.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:01:09 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 02/20] python3-aiohttp: patch CVE-2024-52304
Date: Thu, 15 Jan 2026 02:00:39 +1300
Message-ID: <20260114130100.1016416-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
References: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 13:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123455

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-52304

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-aiohttp/CVE-2024-52304.patch      | 124 ++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |   2 +
 2 files changed, 126 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-52304.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-52304.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-52304.patch
new file mode 100644
index 0000000000..2ddd94a4be
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-52304.patch
@@ -0,0 +1,124 @@
+From ca0218ea87242c6031887d138183a9b05c256514 Mon Sep 17 00:00:00 2001
+From: "J. Nick Koston" <nick@koston.org>
+Date: Wed, 13 Nov 2024 08:50:36 -0600
+Subject: [PATCH] [PR #9851/541d86d backport][3.10] Fix incorrect parsing of
+ chunk extensions with the pure Python parser (#9853)
+
+CVE: CVE-2024-52304
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/259edc369075de63e6f3a4eaade058c62af0df71]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ aiohttp/http_parser.py    |  7 ++++
+ tests/test_http_parser.py | 74 ++++++++++++++++++++++++++++++++++++++-
+ 2 files changed, 80 insertions(+), 1 deletion(-)
+
+diff --git a/aiohttp/http_parser.py b/aiohttp/http_parser.py
+index 013511917..7a552458e 100644
+--- a/aiohttp/http_parser.py
++++ b/aiohttp/http_parser.py
+@@ -848,6 +848,13 @@ class HttpPayloadParser:
+                         i = chunk.find(CHUNK_EXT, 0, pos)
+                         if i >= 0:
+                             size_b = chunk[:i]  # strip chunk-extensions
++                            # Verify no LF in the chunk-extension
++                            if b"\n" in (ext := chunk[i:pos]):
++                                exc = BadHttpMessage(
++                                    f"Unexpected LF in chunk-extension: {ext!r}"
++                                )
++                                set_exception(self.payload, exc)
++                                raise exc
+                         else:
+                             size_b = chunk[:pos]
+ 
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
+index ee7dc4aab..2f34f0bc0 100644
+--- a/tests/test_http_parser.py
++++ b/tests/test_http_parser.py
+@@ -13,6 +13,7 @@ from yarl import URL
+ 
+ import aiohttp
+ from aiohttp import http_exceptions, streams
++from aiohttp.base_protocol import BaseProtocol
+ from aiohttp.http_parser import (
+     NO_EXTENSIONS,
+     DeflateBuffer,
+@@ -1369,7 +1370,78 @@ def test_parse_chunked_payload_empty_body_than_another_chunked(
+     assert b"second" == b"".join(d for d in payload._buffer)
+ 
+ 
+-def test_partial_url(parser: Any) -> None:
++async def test_parse_chunked_payload_split_chunks(response: Any) -> None:
++    network_chunks = (
++        b"HTTP/1.1 200 OK\r\nTransfer-Encoding: chunked\r\n\r\n",
++        b"5\r\nfi",
++        b"rst",
++        # This simulates a bug in lax mode caused when the \r\n separator, before the
++        # next HTTP chunk, appears at the start of the next network chunk.
++        b"\r\n",
++        b"6",
++        b"\r",
++        b"\n",
++        b"second\r",
++        b"\n0\r\n\r\n",
++    )
++    reader = response.feed_data(network_chunks[0])[0][0][1]
++    for c in network_chunks[1:]:
++        response.feed_data(c)
++
++    assert response.feed_eof() is None
++    assert reader.is_eof()
++    assert await reader.read() == b"firstsecond"
++
++
++@pytest.mark.skipif(NO_EXTENSIONS, reason="Only tests C parser.")
++async def test_parse_chunked_payload_with_lf_in_extensions_c_parser(
++    loop: asyncio.AbstractEventLoop, protocol: BaseProtocol
++) -> None:
++    """Test the C-parser with a chunked payload that has a LF in the chunk extensions."""
++    # The C parser will raise a BadHttpMessage from feed_data
++    parser = HttpRequestParserC(
++        protocol,
++        loop,
++        2**16,
++        max_line_size=8190,
++        max_field_size=8190,
++    )
++    payload = (
++        b"GET / HTTP/1.1\r\nHost: localhost:5001\r\n"
++        b"Transfer-Encoding: chunked\r\n\r\n2;\nxx\r\n4c\r\n0\r\n\r\n"
++        b"GET /admin HTTP/1.1\r\nHost: localhost:5001\r\n"
++        b"Transfer-Encoding: chunked\r\n\r\n0\r\n\r\n"
++    )
++    with pytest.raises(http_exceptions.BadHttpMessage, match="\\\\nxx"):
++        parser.feed_data(payload)
++
++
++async def test_parse_chunked_payload_with_lf_in_extensions_py_parser(
++    loop: asyncio.AbstractEventLoop, protocol: BaseProtocol
++) -> None:
++    """Test the py-parser with a chunked payload that has a LF in the chunk extensions."""
++    # The py parser will not raise the BadHttpMessage directly, but instead
++    # it will set the exception on the StreamReader.
++    parser = HttpRequestParserPy(
++        protocol,
++        loop,
++        2**16,
++        max_line_size=8190,
++        max_field_size=8190,
++    )
++    payload = (
++        b"GET / HTTP/1.1\r\nHost: localhost:5001\r\n"
++        b"Transfer-Encoding: chunked\r\n\r\n2;\nxx\r\n4c\r\n0\r\n\r\n"
++        b"GET /admin HTTP/1.1\r\nHost: localhost:5001\r\n"
++        b"Transfer-Encoding: chunked\r\n\r\n0\r\n\r\n"
++    )
++    messages, _, _ = parser.feed_data(payload)
++    reader = messages[0][1]
++    assert isinstance(reader.exception(), http_exceptions.BadHttpMessage)
++    assert "\\nxx" in str(reader.exception())
++
++
++def test_partial_url(parser: HttpRequestParser) -> None:
+     messages, upgrade, tail = parser.feed_data(b"GET /te")
+     assert len(messages) == 0
+     messages, upgrade, tail = parser.feed_data(b"st HTTP/1.1\r\n\r\n")
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index 57adb1eeba..ea117576bc 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
 SRC_URI[sha256sum] = "edea7d15772ceeb29db4aff55e482d4bcfb6ae160ce144f2682de02f6d693551"
 
+SRC_URI += "file://CVE-2024-52304.patch"
+
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
 

