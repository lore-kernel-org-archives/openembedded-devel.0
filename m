Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8441CE9D40C
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 16:29:38 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24634.1770222568447206671
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 08:29:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P6toe3Uc;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so36510f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 08:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770222566; x=1770827366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hh9s1hs0niS/SVsBhPWTtzxLQIoQFquPjdCrE8lK4sA=;
        b=P6toe3Uca4XG5vlGBloU6Ab6phlh5/PDJxP/ItD8VSZu/+ZQDFZStHmoCt2CizsNKB
         czuJrsjNBYJBGwldWUupeCL9CRuvjIkhIIjClGc0I8xwXaQZDZKIsmtOlSAxkddoIizF
         GKp6LLYRsfItZjkcitJt+XZqWySqFRF+8+rU1R0Iu6IS+l3BI9USCijgEEbizrCdfNQn
         +sgwPpUEpC/+2C1KgnQIg0pXL2YOMHqJyWEeDYgASIA0lr/YznWlQ4UvYDwHYO2m2KFe
         gumoB6EnWon0Kd+imLWc+l7bNmv2t99mgPn6EIG6dk4ZQhjWLrnA3K0ZDMGMLVVYIkZO
         4Qkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770222566; x=1770827366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hh9s1hs0niS/SVsBhPWTtzxLQIoQFquPjdCrE8lK4sA=;
        b=OyCDOa2JvqSZ5Jd3TuzklKqugwcgasnWXg3ooS9SYdjYfYvS7uKdaRV56Jv2B4D5l0
         EJtSsNlzHFmw7fXCUWRc/kS+6SZb8dv+CVt6soOxxvVuXFTURVKyw4ATyG1m+R7iGUPV
         91nkcridIt/I6gP6Q5B+fgHR2GwfWQqVqX0adCLrlSc0w8ETgSS0Yjb2q4C+12Wjx84N
         1KKSc+74fp0p90SX0zHPg2SPY/D18a1VvxiiozdV4/TmmThLSXSPAPEfDDIOI+TB3nAE
         hn1T6lkq1gmHnaEHV5yjakU327Mlvuj1lJpLuFF5JicuMNbBEyV+ok6siI6za1JPjjjh
         U1cg==
X-Gm-Message-State: AOJu0Yy/bFEZf56j2EbD1BEJ22iM5I/JtQ3CSKA+WDrZa/NzAO1V+Dxp
	54xKl7Syvekws/J02/HjMON59W+gfdXslCQRR2mfPFOEr2wrHcW7Ag3W9JZc6g==
X-Gm-Gg: AZuq6aI96p2qnxY/swybU2kZrTMjEr8rFfU3oVcA7dvvNvRRXONSVxScIYmdwfgn2VF
	tZ/mCpyyrf/ImDwXbHcuxMwv86IvBqTp5Rlc4z6KKETnWCtFWmviH4upW6efvE2hhhB6mtxSEQ2
	xT5y6ihdtqu/5rHu70y0A2dnJunPmjLurmqMvVWoQwZxNuM7dtGJ6ZW+v4ZlYpO4vQ6+MyhvbnM
	P/C27P9+Jqu90NVgbFfsh0V+1PXCpVBYvoP52IBepYMEi/2TM/qHs2Q3VaRk9FMZfulOOyByUdh
	E5wPpEQGCoS9RDoGBRcctEwWa/YvQAWDVezsOk/Z9PypCuG769d3A+UegmvExGVpkiLS3gTcIlb
	vri6u/zi7Ji4ZLr1pwxobCanb/tt37JInnCLDHpd9uIXuHQAcBV1vzMhQjhf0E2iJph8lgKhJXT
	Ney7dUdgo9
X-Received: by 2002:a05:600c:3acd:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-4830e987c5cmr50309985e9.19.1770222565863;
        Wed, 04 Feb 2026 08:29:25 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830ec6fc89sm23293325e9.6.2026.02.04.08.29.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 08:29:25 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 1/7] python3-aiohttp: patch CVE-2025-69224
Date: Wed,  4 Feb 2026 17:29:16 +0100
Message-ID: <20260204162924.3042284-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 16:29:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124136

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-69224

Backport the patch indicated by the NVD advisory.
Only a part of the tests were backported, because some of the
new tests require a compression method that is not supported
yet by this version.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-aiohttp/CVE-2025-69224.patch      | 93 +++++++++++++++++++
 .../python/python3-aiohttp_3.12.15.bb         |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69224.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69224.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69224.patch
new file mode 100644
index 0000000000..7f36e699fd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69224.patch
@@ -0,0 +1,93 @@
+From 225412b13f66a76a7222d7719777e6162638faa3 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Sat, 3 Jan 2026 00:02:45 +0000
+Subject: [PATCH] Reject non-ascii characters in some headers (#11886) (#11902)
+
+(cherry picked from commit 5affd64f86d28a16a8f8e6fea2d217c99bf7831f)
+
+CVE: CVE-2025-69224
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/32677f2adfd907420c078dda6b79225c6f4ebce0]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ aiohttp/_http_parser.pyx  |  6 +++---
+ aiohttp/http_parser.py    |  8 ++++++--
+ tests/test_http_parser.py | 16 +++++++++++++++-
+ 3 files changed, 24 insertions(+), 6 deletions(-)
+
+diff --git a/aiohttp/_http_parser.pyx b/aiohttp/_http_parser.pyx
+index 16893f0..23f1dd1 100644
+--- a/aiohttp/_http_parser.pyx
++++ b/aiohttp/_http_parser.pyx
+@@ -421,7 +421,8 @@ cdef class HttpParser:
+         headers = CIMultiDictProxy(CIMultiDict(self._headers))
+ 
+         if self._cparser.type == cparser.HTTP_REQUEST:
+-            allowed = upgrade and headers.get("upgrade", "").lower() in ALLOWED_UPGRADES
++            h_upg = headers.get("upgrade", "")
++            allowed = upgrade and h_upg.isascii() and h_upg.lower() in ALLOWED_UPGRADES
+             if allowed or self._cparser.method == cparser.HTTP_CONNECT:
+                 self._upgraded = True
+         else:
+@@ -436,8 +437,7 @@ cdef class HttpParser:
+         enc = self._content_encoding
+         if enc is not None:
+             self._content_encoding = None
+-            enc = enc.lower()
+-            if enc in ('gzip', 'deflate', 'br'):
++            if enc.isascii() and enc.lower() in {"gzip", "deflate", "br"}:
+                 encoding = enc
+ 
+         if self._cparser.type == cparser.HTTP_REQUEST:
+diff --git a/aiohttp/http_parser.py b/aiohttp/http_parser.py
+index 9f864b2..bc8f7da 100644
+--- a/aiohttp/http_parser.py
++++ b/aiohttp/http_parser.py
+@@ -232,7 +232,9 @@ class HeadersParser:
+ 
+ def _is_supported_upgrade(headers: CIMultiDictProxy[str]) -> bool:
+     """Check if the upgrade header is supported."""
+-    return headers.get(hdrs.UPGRADE, "").lower() in {"tcp", "websocket"}
++    u = headers.get(hdrs.UPGRADE, "")
++    # .lower() can transform non-ascii characters.
++    return u.isascii() and u.lower() in {"tcp", "websocket"}
+ 
+ 
+ class HttpParser(abc.ABC, Generic[_MsgT]):
+@@ -664,7 +666,9 @@ class HttpRequestParser(HttpParser[RawRequestMessage]):
+         )
+ 
+     def _is_chunked_te(self, te: str) -> bool:
+-        if te.rsplit(",", maxsplit=1)[-1].strip(" \t").lower() == "chunked":
++        te = te.rsplit(",", maxsplit=1)[-1].strip(" \t")
++        # .lower() transforms some non-ascii chars, so must check first.
++        if te.isascii() and te.lower() == "chunked":
+             return True
+         # https://www.rfc-editor.org/rfc/rfc9112#section-6.3-2.4.3
+         raise BadHttpMessage("Request has invalid `Transfer-Encoding`")
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
+index 385452c..d4c1768 100644
+--- a/tests/test_http_parser.py
++++ b/tests/test_http_parser.py
+@@ -468,7 +468,21 @@ def test_request_chunked(parser) -> None:
+     assert isinstance(payload, streams.StreamReader)
+ 
+ 
+-def test_request_te_chunked_with_content_length(parser: Any) -> None:
++def test_te_header_non_ascii(parser: HttpRequestParser) -> None:
++    # K = Kelvin sign, not valid ascii.
++    text = "GET /test HTTP/1.1\r\nTransfer-Encoding: chunKed\r\n\r\n"
++    with pytest.raises(http_exceptions.BadHttpMessage):
++        parser.feed_data(text.encode())
++
++
++def test_upgrade_header_non_ascii(parser: HttpRequestParser) -> None:
++    # K = Kelvin sign, not valid ascii.
++    text = "GET /test HTTP/1.1\r\nUpgrade: websocKet\r\n\r\n"
++    messages, upgrade, tail = parser.feed_data(text.encode())
++    assert not upgrade
++
++
++def test_request_te_chunked_with_content_length(parser: HttpRequestParser) -> None:
+     text = (
+         b"GET /test HTTP/1.1\r\n"
+         b"content-length: 1234\r\n"
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
index b6344d4c68..4341e128a5 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
@@ -4,6 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
+SRC_URI += "file://CVE-2025-69224.patch"
 SRC_URI[sha256sum] = "4fc61385e9c98d72fcdf47e6dd81833f47b2f77c114c29cd64a361be57a763a2"
 
 inherit python_setuptools_build_meta pypi

