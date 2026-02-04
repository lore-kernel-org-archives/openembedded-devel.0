Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE75E9D410
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 16:32:18 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24870.1770222728900853743
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 08:32:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G8T/fZGg;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so28101f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 08:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770222727; x=1770827527; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3JhaDU7wuTwBH785iUhcyechCL43+uSSuJmRKgd8fco=;
        b=G8T/fZGgEkKxZF3UesGyxEPbabdHAaF+DTulghZ5RKnuReMgJJNL/zBEX9GrG8J9Hp
         ule0ImUyiEhxt4B0QwXZRQ8qsyfFStxIbSRVdEawKGnfCqwsUy55VzALSyyH1zVH/pr7
         HBYAGyTIyHawho6Wb9mAKqigzbdFD0/uFNR1a0vqAdc+Vm0UfypWPZ/lz28QcWawiA9G
         c5R0X2Yxlq1f4fYx3T555Ygnf3GFt74s8v8G/S2R7Z3hK4LdXxlgB2cV+TKn+mdmzjcN
         HpJpqyjKOS2sHdvOJtJEZbtcLFk+PbLdLJNIzur6pN0hVw2cn3VH+19MZywXMvJguFBP
         OXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770222727; x=1770827527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3JhaDU7wuTwBH785iUhcyechCL43+uSSuJmRKgd8fco=;
        b=ExqbLPLWUnuPTtmXe5ekFl5qpG3Y0SKOgYgUuyZ8bMbzCA5KG3uTbs0q+1SUQ2IVXr
         my4EnyA/J3W9+2zbMUJzPf74VI8zp3ip6Wx+82VSSFA8wQWVmh0VK+JZccuMPTCTqah6
         WFYkprDxoorgNp3GykqgPSZsikaz1PSSpBqJeRPg5gLhYGciYJk7Bnzd+7PlZETSpnLf
         OrCe+ZCLawuJDiXgC7IH8Ac7uxsCr5/Hc0C630r9d0mwi3z3io2sXwLVtsG3uvpEereX
         IfAIdx1ggpQ6MY1tj5vamw7Ac/hwSdY/wms6V1SDuJjGKPMGY2X36rqtoCLcZ2539Mmh
         tSgg==
X-Gm-Message-State: AOJu0YyDXAluGWNeRWFltarzi6zbKvzf78rPao+RnBwCY2Ud9hSGqECI
	3cdJYdaOXO0uOwrd6FY8xW0oec8xOhRWYtpurXbvxKWzVJap569+l0kqxTgLxw==
X-Gm-Gg: AZuq6aJqjuejYvYH+uCg4Al4eQ7HSfvtQ5p3CGT8RQR4uSS+J15xVYyEyAVD2WJrmOH
	PNiKynGev9e2l76mAffV70LBqQMHgUZFPQIw9ufYQE2SJY8+TCzW7rnzUhwty/4ur9evVw2MCz3
	LowCq4ALK5XbOc2WMG/dz9UeyIPtFx3IMPc2zW33UXEr0lZUu4Mj5i+WWytciG27r3AmHRk0Sn1
	Mh9FK4jhJbv8KQ0gtYlFaQwSxnKu49pTj3gLr03G2+DsUxKtgHYrqvQSJP+U3YEAQsdMsMQ1DW/
	g+rRGQcEFcF4txg1BYIvwF3odoSu1dCsWdMeYhs49Xpy+PMspbFnTfmREFlvPlV+lVLnFqfSudO
	2B9BRku2tZjpNQI126lRzxGXhPLxhr11ej0Fdw4xNfgG5EqtF3ILp+wsCZw6MdqGjU9bBbsf2s7
	3yTfZnAwsS7HD0+voHxGU=
X-Received: by 2002:a05:6000:2303:b0:435:e486:af82 with SMTP id ffacd0b85a97d-4361805d41emr5029733f8f.45.1770222727057;
        Wed, 04 Feb 2026 08:32:07 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e250b2sm8305314f8f.8.2026.02.04.08.32.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 08:32:06 -0800 (PST)
Message-ID: <6bbe23f5-d6c4-4919-983a-00dacb2fea65@gmail.com>
Date: Wed, 4 Feb 2026 17:32:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][whinlatter][PATCH 1/7] python3-aiohttp: patch
 CVE-2025-69224
To: openembedded-devel@lists.openembedded.org
References: <1891180C1B31F030.229416@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1891180C1B31F030.229416@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 16:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124143

Would like to add some notes to these changes.
Due to the number of patches, I have prepared and executed ptests before
sending out this series.

The tests show no regression(*):
Before the patches:
   2321 PASS
     10 SKIP
     26 XFAIL
     
After the patches:
   2325 PASS (there are some new tests in the patches)
     10 SKIP
     26 XFAIL

The skips happened because the tests are either for developers/debuggers
only, the tests are for old python, they are windows specific, or they
require Docker to run.

(*): there is no known regression with these backports compared to the
patchless version, but there is a possible regression between Walnascar
and Whinlatter.
python3-idna (a dependency of aiohttp) was updated in oe-core to 3.11,
and it fails 1 test, regardless of the backports - the test is trying to
verify that funky URLs are rejected (one with invalid unicode
characters). Using python3-idna 3.10 this test passes. With 3.11 it
fails. (I ran the final tests with downgraded python3-idna).

I plan to report this to upstream soon.


On 2/4/26 17:29, Gyorgy Sarvari via lists.openembedded.org wrote:
> Details: https://nvd.nist.gov/vuln/detail/CVE-2025-69224
>
> Backport the patch indicated by the NVD advisory.
> Only a part of the tests were backported, because some of the
> new tests require a compression method that is not supported
> yet by this version.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../python3-aiohttp/CVE-2025-69224.patch      | 93 +++++++++++++++++++
>  .../python/python3-aiohttp_3.12.15.bb         |  1 +
>  2 files changed, 94 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69224.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69224.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69224.patch
> new file mode 100644
> index 0000000000..7f36e699fd
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69224.patch
> @@ -0,0 +1,93 @@
> +From 225412b13f66a76a7222d7719777e6162638faa3 Mon Sep 17 00:00:00 2001
> +From: Sam Bull <git@sambull.org>
> +Date: Sat, 3 Jan 2026 00:02:45 +0000
> +Subject: [PATCH] Reject non-ascii characters in some headers (#11886) (#11902)
> +
> +(cherry picked from commit 5affd64f86d28a16a8f8e6fea2d217c99bf7831f)
> +
> +CVE: CVE-2025-69224
> +Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/32677f2adfd907420c078dda6b79225c6f4ebce0]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + aiohttp/_http_parser.pyx  |  6 +++---
> + aiohttp/http_parser.py    |  8 ++++++--
> + tests/test_http_parser.py | 16 +++++++++++++++-
> + 3 files changed, 24 insertions(+), 6 deletions(-)
> +
> +diff --git a/aiohttp/_http_parser.pyx b/aiohttp/_http_parser.pyx
> +index 16893f0..23f1dd1 100644
> +--- a/aiohttp/_http_parser.pyx
> ++++ b/aiohttp/_http_parser.pyx
> +@@ -421,7 +421,8 @@ cdef class HttpParser:
> +         headers = CIMultiDictProxy(CIMultiDict(self._headers))
> + 
> +         if self._cparser.type == cparser.HTTP_REQUEST:
> +-            allowed = upgrade and headers.get("upgrade", "").lower() in ALLOWED_UPGRADES
> ++            h_upg = headers.get("upgrade", "")
> ++            allowed = upgrade and h_upg.isascii() and h_upg.lower() in ALLOWED_UPGRADES
> +             if allowed or self._cparser.method == cparser.HTTP_CONNECT:
> +                 self._upgraded = True
> +         else:
> +@@ -436,8 +437,7 @@ cdef class HttpParser:
> +         enc = self._content_encoding
> +         if enc is not None:
> +             self._content_encoding = None
> +-            enc = enc.lower()
> +-            if enc in ('gzip', 'deflate', 'br'):
> ++            if enc.isascii() and enc.lower() in {"gzip", "deflate", "br"}:
> +                 encoding = enc
> + 
> +         if self._cparser.type == cparser.HTTP_REQUEST:
> +diff --git a/aiohttp/http_parser.py b/aiohttp/http_parser.py
> +index 9f864b2..bc8f7da 100644
> +--- a/aiohttp/http_parser.py
> ++++ b/aiohttp/http_parser.py
> +@@ -232,7 +232,9 @@ class HeadersParser:
> + 
> + def _is_supported_upgrade(headers: CIMultiDictProxy[str]) -> bool:
> +     """Check if the upgrade header is supported."""
> +-    return headers.get(hdrs.UPGRADE, "").lower() in {"tcp", "websocket"}
> ++    u = headers.get(hdrs.UPGRADE, "")
> ++    # .lower() can transform non-ascii characters.
> ++    return u.isascii() and u.lower() in {"tcp", "websocket"}
> + 
> + 
> + class HttpParser(abc.ABC, Generic[_MsgT]):
> +@@ -664,7 +666,9 @@ class HttpRequestParser(HttpParser[RawRequestMessage]):
> +         )
> + 
> +     def _is_chunked_te(self, te: str) -> bool:
> +-        if te.rsplit(",", maxsplit=1)[-1].strip(" \t").lower() == "chunked":
> ++        te = te.rsplit(",", maxsplit=1)[-1].strip(" \t")
> ++        # .lower() transforms some non-ascii chars, so must check first.
> ++        if te.isascii() and te.lower() == "chunked":
> +             return True
> +         # https://www.rfc-editor.org/rfc/rfc9112#section-6.3-2.4.3
> +         raise BadHttpMessage("Request has invalid `Transfer-Encoding`")
> +diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
> +index 385452c..d4c1768 100644
> +--- a/tests/test_http_parser.py
> ++++ b/tests/test_http_parser.py
> +@@ -468,7 +468,21 @@ def test_request_chunked(parser) -> None:
> +     assert isinstance(payload, streams.StreamReader)
> + 
> + 
> +-def test_request_te_chunked_with_content_length(parser: Any) -> None:
> ++def test_te_header_non_ascii(parser: HttpRequestParser) -> None:
> ++    # K = Kelvin sign, not valid ascii.
> ++    text = "GET /test HTTP/1.1\r\nTransfer-Encoding: chunKed\r\n\r\n"
> ++    with pytest.raises(http_exceptions.BadHttpMessage):
> ++        parser.feed_data(text.encode())
> ++
> ++
> ++def test_upgrade_header_non_ascii(parser: HttpRequestParser) -> None:
> ++    # K = Kelvin sign, not valid ascii.
> ++    text = "GET /test HTTP/1.1\r\nUpgrade: websocKet\r\n\r\n"
> ++    messages, upgrade, tail = parser.feed_data(text.encode())
> ++    assert not upgrade
> ++
> ++
> ++def test_request_te_chunked_with_content_length(parser: HttpRequestParser) -> None:
> +     text = (
> +         b"GET /test HTTP/1.1\r\n"
> +         b"content-length: 1234\r\n"
> diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
> index b6344d4c68..4341e128a5 100644
> --- a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
> +++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
> @@ -4,6 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
>  
> +SRC_URI += "file://CVE-2025-69224.patch"
>  SRC_URI[sha256sum] = "4fc61385e9c98d72fcdf47e6dd81833f47b2f77c114c29cd64a361be57a763a2"
>  
>  inherit python_setuptools_build_meta pypi
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124136): https://lists.openembedded.org/g/openembedded-devel/message/124136
> Mute This Topic: https://lists.openembedded.org/mt/117637134/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


