Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 817CDCCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 11:35:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9188.1762515321364596146
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Nov 2025 03:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=RRIXaedv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34066b3d81=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A74vOJm2487900
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Nov 2025 03:35:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ABmzkdEqrKVgovUvXkor
	RZnB/zGZwZdINBj7fAP4Qf4=; b=RRIXaedvh/27UwV1ZWtAXofsELnWzbdTJebI
	U44by/j768rFE6UpOG+ZWpPDuGWT/4pb2Sv63bC+pcPykRs4vjNsJ6/1xiKjsluL
	TRlm/ZJXrFWoWfQM4kws6lEAqBa/54NtPmzcrg+Tj94hSZvt9fAwxlQmFyOHs8xN
	eLol60V2oLRNhaSPeXdLF1e6CTH2blK73+3BORQEowAKR/Bp0kDc1EgEawMhyUOE
	HD9S9vVHvfgrjVpmHvbsu37srMo2TAeZjsqOcpPn1gga1GCY84s3iWCEcpEiJrGO
	qj+OjQrN5Hn/ZZeLapr3D4rj90nAR8ZvY3H0/ejdnths+xo6wQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a96ym8f36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 07 Nov 2025 03:35:20 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 7 Nov 2025 03:35:20 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 7 Nov 2025 03:35:19 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][kirkstone][PATCH 1/1] python3-aiohttp: Fix CVE-2024-23829
Date: Fri, 7 Nov 2025 17:05:15 +0530
Message-ID: <20251107113515.598058-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: w0xP2ISqQHkuOXbsJRDdgAfmq6p_n-Oa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA5NCBTYWx0ZWRfX7Nxvhv8sKT5G
 CtvIqbJAFempYiLB9Rpn/9nIbO53k5IbKloasKCkwIl6A0qTC49uGyuh9VA/PG9wkJOhgS2+tmo
 dpU3+3PCF53kDCPmOw/cABFiIrIqkPrC9WN2SQu1QTAVno4Tv/uvhmtZW483k1hyfWZ57zoSV6c
 ImuofzebvLO8lfZAQwLb4UaID1YHgdEkldn28H1qUGBDOljJEIxWgHfYoJON7ajN7jYY2GDMJOn
 Rcat1JFANanuaqpixlODa1BF3QfO2Vdr0QAZrZPFnLfykuiibA1jXj4dju8gjGCmaOU3jJd22el
 p5Y2oHykLpKnbFsKI+FC9NerbyCfpY/To2g87b9jb8LeUvLqtxOZh8Qw9S27N7mLHsIzTsSTFaL
 oEitwq+W47y0qOFZivS4COQPtLLI+w==
X-Proofpoint-GUID: w0xP2ISqQHkuOXbsJRDdgAfmq6p_n-Oa
X-Authority-Analysis: v=2.4 cv=NqPcssdJ c=1 sm=1 tr=0 ts=690dd978 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wjU5IotzqukA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8
 a=BqEg4_3jAAAA:8 a=t7CeM3EgAAAA:8 a=0lhnMm1FAAAA:8 a=20KFwNOVAAAA:8
 a=ZXtIncsQTHxzZoWy198A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NsD4zLqDMc8A:10 a=oAU_ccPAY6cA:10 a=puQDGODxLgQA:10 a=3FZx5mFYp_MA:10
 a=0mFWnFbQd5xWBqmg7tTt:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9CHbX8HeWodPCPcMgNm7:22
 a=6_D5ljFcL1GZDUJyZucp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070094
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5A74vOJm2487900
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Nov 2025 11:35:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121372

From: Soumya Sambu <soumya.sambu@windriver.com>

aiohttp is an asynchronous HTTP client/server framework for asyncio and P=
ython.
Security-sensitive parts of the Python HTTP parser retained minor differe=
nces in
allowable character sets, that must trigger error handling to robustly ma=
tch frame
boundaries of proxies in order to protect against injection of additional=
 requests.
Additionally, validation could trigger exceptions that were not handled c=
onsistently
with processing of other malformed input. Being more lenient than interne=
t standards
require could, depending on deployment environment, assist in request smu=
ggling. The
unhandled exception could cause excessive resource consumption on the app=
lication
server and/or its logging facilities. This vulnerability exists due to an=
 incomplete
fix for CVE-2023-47627. Version 3.9.2 fixes this vulnerability.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-23829
https://security-tracker.debian.org/tracker/CVE-2024-23829

Upstream patch:
https://github.com/aio-libs/aiohttp/commit/d33bc21414e283c9e6fe7f6caf69e2=
ed60d66c82

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python3-aiohttp/CVE-2024-23829.patch      | 344 ++++++++++++++++++
 .../python/python3-aiohttp_3.8.6.bb           |   1 +
 2 files changed, 345 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/C=
VE-2024-23829.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024=
-23829.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-20=
24-23829.patch
new file mode 100644
index 0000000000..6da5b5ba42
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-23829.=
patch
@@ -0,0 +1,344 @@
+From d33bc21414e283c9e6fe7f6caf69e2ed60d66c82 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Sun, 28 Jan 2024 17:09:58 +0000
+Subject: [PATCH] Improve validation in HTTP parser (#8074) (#8078)
+
+Co-authored-by: Paul J. Dorn <pajod@users.noreply.github.com>
+Co-authored-by: Sviatoslav Sydorenko (=D0=A1=D0=B2=D1=8F=D1=82=D0=BE=D1=81=
=D0=BB=D0=B0=D0=B2 =D0=A1=D0=B8=D0=B4=D0=BE=D1=80=D0=B5=D0=BD=D0=BA=D0=BE=
)
+<sviat@redhat.com>
+(cherry picked from commit 33ccdfb0a12690af5bb49bda2319ec0907fa7827)
+
+CVE: CVE-2024-23829
+
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/d3=
3bc21414e283c9e6fe7f6caf69e2ed60d66c82]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ CONTRIBUTORS.txt          |   1 +
+ aiohttp/http_parser.py    |  30 ++++----
+ tests/test_http_parser.py | 139 +++++++++++++++++++++++++++++++++++++-
+ 3 files changed, 155 insertions(+), 15 deletions(-)
+
+diff --git a/CONTRIBUTORS.txt b/CONTRIBUTORS.txt
+index f8a8df5..b9cdf75 100644
+--- a/CONTRIBUTORS.txt
++++ b/CONTRIBUTORS.txt
+@@ -240,6 +240,7 @@ Panagiotis Kolokotronis
+ Pankaj Pandey
+ Pau Freixes
+ Paul Colomiets
++Paul J. Dorn
+ Paulius =C5=A0ileikis
+ Paulus Schoutsen
+ Pavel Kamaev
+diff --git a/aiohttp/http_parser.py b/aiohttp/http_parser.py
+index 175eb7f..91784b3 100644
+--- a/aiohttp/http_parser.py
++++ b/aiohttp/http_parser.py
+@@ -76,10 +76,11 @@ ASCIISET: Final[Set[str]] =3D set(string.printable)
+ #     tchar =3D "!" / "#" / "$" / "%" / "&" / "'" / "*" / "+" / "-" / "=
." /
+ #             "^" / "_" / "`" / "|" / "~" / DIGIT / ALPHA
+ #     token =3D 1*tchar
+-METHRE: Final[Pattern[str]] =3D re.compile(r"[!#$%&'*+\-.^_`|~0-9A-Za-z=
]+")
+-VERSRE: Final[Pattern[str]] =3D re.compile(r"HTTP/(\d).(\d)")
+-HDRRE: Final[Pattern[bytes]] =3D re.compile(rb"[\x00-\x1F\x7F()<>@,;:\[=
\]=3D{} \t\"\\]")
+-HEXDIGIT =3D re.compile(rb"[0-9a-fA-F]+")
++_TCHAR_SPECIALS: Final[str] =3D re.escape("!#$%&'*+-.^_`|~")
++TOKENRE: Final[Pattern[str]] =3D re.compile(f"[0-9A-Za-z{_TCHAR_SPECIAL=
S}]+")
++VERSRE: Final[Pattern[str]] =3D re.compile(r"HTTP/(\d)\.(\d)", re.ASCII=
)
++DIGITS: Final[Pattern[str]] =3D re.compile(r"\d+", re.ASCII)
++HEXDIGITS: Final[Pattern[bytes]] =3D re.compile(rb"[0-9a-fA-F]+")
+=20
+=20
+ class RawRequestMessage(NamedTuple):
+@@ -145,6 +146,7 @@ class HeadersParser:
+         self, lines: List[bytes]
+     ) -> Tuple["CIMultiDictProxy[str]", RawHeaders]:
+         headers: CIMultiDict[str] =3D CIMultiDict()
++        # note: "raw" does not mean inclusion of OWS before/after the f=
ield value
+         raw_headers =3D []
+=20
+         lines_idx =3D 0
+@@ -158,13 +160,14 @@ class HeadersParser:
+             except ValueError:
+                 raise InvalidHeader(line) from None
+=20
++            if len(bname) =3D=3D 0:
++                raise InvalidHeader(bname)
++
+             # https://www.rfc-editor.org/rfc/rfc9112.html#section-5.1-2
+             if {bname[0], bname[-1]} & {32, 9}:  # {" ", "\t"}
+                 raise InvalidHeader(line)
+=20
+             bvalue =3D bvalue.lstrip(b" \t")
+-            if HDRRE.search(bname):
+-                raise InvalidHeader(bname)
+             if len(bname) > self.max_field_size:
+                 raise LineTooLong(
+                     "request header name {}".format(
+@@ -173,6 +176,9 @@ class HeadersParser:
+                     str(self.max_field_size),
+                     str(len(bname)),
+                 )
++            name =3D bname.decode("utf-8", "surrogateescape")
++            if not TOKENRE.fullmatch(name):
++                raise InvalidHeader(bname)
+=20
+             header_length =3D len(bvalue)
+=20
+@@ -220,7 +226,6 @@ class HeadersParser:
+                     )
+=20
+             bvalue =3D bvalue.strip(b" \t")
+-            name =3D bname.decode("utf-8", "surrogateescape")
+             value =3D bvalue.decode("utf-8", "surrogateescape")
+=20
+             # https://www.rfc-editor.org/rfc/rfc9110.html#section-5.5-5
+@@ -348,7 +353,8 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+=20
+                             # Shouldn't allow +/- or other number forma=
ts.
+                             # https://www.rfc-editor.org/rfc/rfc9110#se=
ction-8.6-2
+-                            if not length_hdr.strip(" \t").isdecimal():
++                            # msg.headers is already stripped of leadin=
g/trailing wsp
++                            if not DIGITS.fullmatch(length_hdr):
+                                 raise InvalidHeader(CONTENT_LENGTH)
+=20
+                             return int(length_hdr)
+@@ -582,7 +588,7 @@ class HttpRequestParser(HttpParser[RawRequestMessage=
]):
+             )
+=20
+         # method
+-        if not METHRE.match(method):
++        if not TOKENRE.fullmatch(method):
+             raise BadStatusLine(method)
+=20
+         # version
+@@ -690,8 +696,8 @@ class HttpResponseParser(HttpParser[RawResponseMessa=
ge]):
+             raise BadStatusLine(line)
+         version_o =3D HttpVersion(int(match.group(1)), int(match.group(=
2)))
+=20
+-        # The status code is a three-digit number
+-        if len(status) !=3D 3 or not status.isdecimal():
++        # The status code is a three-digit ASCII number, no padding
++        if len(status) !=3D 3 or not DIGITS.fullmatch(status):
+             raise BadStatusLine(line)
+         status_i =3D int(status)
+=20
+@@ -844,7 +850,7 @@ class HttpPayloadParser:
+                         if self._lax:  # Allow whitespace in lax mode.
+                             size_b =3D size_b.strip()
+=20
+-                        if not re.fullmatch(HEXDIGIT, size_b):
++                        if not re.fullmatch(HEXDIGITS, size_b):
+                             exc =3D TransferEncodingError(
+                                 chunk[:pos].decode("ascii", "surrogatee=
scape")
+                             )
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
+index 4b185c9..bcf6058 100644
+--- a/tests/test_http_parser.py
++++ b/tests/test_http_parser.py
+@@ -2,7 +2,8 @@
+=20
+ import asyncio
+ import re
+-from typing import Any, List
++from contextlib import nullcontext
++from typing import Any, Dict, List
+ from unittest import mock
+ from urllib.parse import quote
+=20
+@@ -168,12 +169,28 @@ def test_cve_2023_37276(parser) -> None:
+         parser.feed_data(text)
+=20
+=20
++@pytest.mark.parametrize(
++    "rfc9110_5_6_2_token_delim",
++    r'"(),/:;<=3D>?@[\]{}',
++)
++def test_bad_header_name(parser: Any, rfc9110_5_6_2_token_delim: str) -=
> None:
++    text =3D f"POST / HTTP/1.1\r\nhead{rfc9110_5_6_2_token_delim}er: va=
l\r\n\r\n".encode()
++    expectation =3D pytest.raises(http_exceptions.BadHttpMessage)
++    if rfc9110_5_6_2_token_delim =3D=3D ":":
++        # Inserting colon into header just splits name/value earlier.
++        expectation =3D nullcontext()
++    with expectation:
++        parser.feed_data(text)
++
++
+ @pytest.mark.parametrize(
+     "hdr",
+     (
+         # https://www.rfc-editor.org/rfc/rfc9110.html#name-content-leng=
th
+         "Content-Length: -5",
+         "Content-Length: +256",
++        "Content-Length: \N{superscript one}",
++        "Content-Length: \N{mathematical double-struck digit one}",
+         "Foo: abc\rdef",  # https://www.rfc-editor.org/rfc/rfc9110.html=
#section-5.5-5
+         "Bar: abc\ndef",
+         "Baz: abc\x00def",
+@@ -240,6 +257,20 @@ def test_whitespace_before_header(parser) -> None:
+         parser.feed_data(text)
+=20
+=20
++def test_parse_unusual_request_line(parser) -> None:
++    if not isinstance(response, HttpResponseParserPy):
++        pytest.xfail("Regression test for Py parser. May match C behavi=
our later.")
++    text =3D b"#smol //a HTTP/1.3\r\n\r\n"
++    messages, upgrade, tail =3D parser.feed_data(text)
++    assert len(messages) =3D=3D 1
++    msg, _ =3D messages[0]
++    assert msg.compression is None
++    assert not msg.upgrade
++    assert msg.method =3D=3D "#smol"
++    assert msg.path =3D=3D "//a"
++    assert msg.version =3D=3D (1, 3)
++
++
+ def test_parse(parser) -> None:
+     text =3D b"GET /test HTTP/1.1\r\n\r\n"
+     messages, upgrade, tail =3D parser.feed_data(text)
+@@ -533,6 +564,43 @@ def test_headers_content_length_err_2(parser) -> No=
ne:
+         parser.feed_data(text)
+=20
+=20
++_pad: Dict[bytes, str] =3D {
++    b"": "empty",
++    # not a typo. Python likes triple zero
++    b"\000": "NUL",
++    b" ": "SP",
++    b"  ": "SPSP",
++    # not a typo: both 0xa0 and 0x0a in case of 8-bit fun
++    b"\n": "LF",
++    b"\xa0": "NBSP",
++    b"\t ": "TABSP",
++}
++
++
++@pytest.mark.parametrize("hdr", [b"", b"foo"], ids=3D["name-empty", "wi=
th-name"])
++@pytest.mark.parametrize("pad2", _pad.keys(), ids=3D["post-" + n for n =
in _pad.values()])
++@pytest.mark.parametrize("pad1", _pad.keys(), ids=3D["pre-" + n for n i=
n _pad.values()])
++def test_invalid_header_spacing(parser, pad1: bytes, pad2: bytes, hdr: =
bytes) -> None:
++    text =3D b"GET /test HTTP/1.1\r\n" b"%s%s%s: value\r\n\r\n" % (pad1=
, hdr, pad2)
++    expectation =3D pytest.raises(http_exceptions.BadHttpMessage)
++    if pad1 =3D=3D pad2 =3D=3D b"" and hdr !=3D b"":
++        # one entry in param matrix is correct: non-empty name, not pad=
ded
++        expectation =3D nullcontext()
++    if pad1 =3D=3D pad2 =3D=3D hdr =3D=3D b"":
++        if not isinstance(response, HttpResponseParserPy):
++            pytest.xfail("Regression test for Py parser. May match C be=
haviour later.")
++    with expectation:
++        parser.feed_data(text)
++
++
++def test_empty_header_name(parser) -> None:
++    if not isinstance(response, HttpResponseParserPy):
++        pytest.xfail("Regression test for Py parser. May match C behavi=
our later.")
++    text =3D b"GET /test HTTP/1.1\r\n" b":test\r\n\r\n"
++    with pytest.raises(http_exceptions.BadHttpMessage):
++        parser.feed_data(text)
++
++
+ def test_invalid_header(parser) -> None:
+     text =3D b"GET /test HTTP/1.1\r\n" b"test line\r\n\r\n"
+     with pytest.raises(http_exceptions.BadHttpMessage):
+@@ -655,6 +723,34 @@ def test_http_request_bad_status_line(parser) -> No=
ne:
+     assert r"\n" not in exc_info.value.message
+=20
+=20
++_num: Dict[bytes, str] =3D {
++    # dangerous: accepted by Python int()
++    # unicodedata.category("\U0001D7D9") =3D=3D 'Nd'
++    "\N{mathematical double-struck digit one}".encode(): "utf8digit",
++    # only added for interop tests, refused by Python int()
++    # unicodedata.category("\U000000B9") =3D=3D 'No'
++    "\N{superscript one}".encode(): "utf8number",
++    "\N{superscript one}".encode("latin-1"): "latin1number",
++}
++
++
++@pytest.mark.parametrize("nonascii_digit", _num.keys(), ids=3D_num.valu=
es())
++def test_http_request_bad_status_line_number(
++    parser: Any, nonascii_digit: bytes
++) -> None:
++    text =3D b"GET /digit HTTP/1." + nonascii_digit + b"\r\n\r\n"
++    with pytest.raises(http_exceptions.BadStatusLine):
++        parser.feed_data(text)
++
++
++def test_http_request_bad_status_line_separator(parser: Any) -> None:
++    # single code point, old, multibyte NFKC, multibyte NFKD
++    utf8sep =3D "\N{arabic ligature sallallahou alayhe wasallam}".encod=
e()
++    text =3D b"GET /ligature HTTP/1" + utf8sep + b"1\r\n\r\n"
++    with pytest.raises(http_exceptions.BadStatusLine):
++        parser.feed_data(text)
++
++
+ def test_http_request_upgrade(parser) -> None:
+     text =3D (
+         b"GET /test HTTP/1.1\r\n"
+@@ -670,6 +766,31 @@ def test_http_request_upgrade(parser) -> None:
+     assert tail =3D=3D b"some raw data"
+=20
+=20
++def test_http_request_parser_utf8_request_line(parser) -> None:
++    if not isinstance(response, HttpResponseParserPy):
++        pytest.xfail("Regression test for Py parser. May match C behavi=
our later.")
++    messages, upgrade, tail =3D parser.feed_data(
++        # note the truncated unicode sequence
++        b"GET /P\xc3\xbcnktchen\xa0\xef\xb7 HTTP/1.1\r\n" +
++        # for easier grep: ASCII 0xA0 more commonly known as non-breaki=
ng space
++        # note the leading and trailing spaces
++        "sTeP:  \N{latin small letter sharp s}nek\t\N{no-break space}  =
"
++        "\r\n\r\n".encode()
++    )
++    msg =3D messages[0][0]
++
++    assert msg.method =3D=3D "GET"
++    assert msg.path =3D=3D "/P=C3=BCnktchen\udca0\udcef\udcb7"
++    assert msg.version =3D=3D (1, 1)
++    assert msg.headers =3D=3D CIMultiDict([("STEP", "=C3=9Fnek\t\xa0")]=
)
++    assert msg.raw_headers =3D=3D ((b"sTeP", "=C3=9Fnek\t\xa0".encode()=
),)
++    assert not msg.should_close
++    assert msg.compression is None
++    assert not msg.upgrade
++    assert not msg.chunked
++    assert msg.url.path =3D=3D URL("/P%C3%BCnktchen\udca0\udcef\udcb7")=
.path
++
++
+ def test_http_request_parser_utf8(parser) -> None:
+     text =3D "GET /path HTTP/1.1\r\nx-test:=D1=82=D0=B5=D1=81=D1=82\r\n=
\r\n".encode()
+     messages, upgrade, tail =3D parser.feed_data(text)
+@@ -719,9 +840,15 @@ def test_http_request_parser_two_slashes(parser) ->=
 None:
+     assert not msg.chunked
+=20
+=20
+-def test_http_request_parser_bad_method(parser) -> None:
++@pytest.mark.parametrize(
++    "rfc9110_5_6_2_token_delim",
++    [bytes([i]) for i in rb'"(),/:;<=3D>?@[\]{}'],
++)
++def test_http_request_parser_bad_method(
++    parser, rfc9110_5_6_2_token_delim: bytes
++) -> None:
+     with pytest.raises(http_exceptions.BadStatusLine):
+-        parser.feed_data(b'=3D":<G>(e),[T];?" /get HTTP/1.1\r\n\r\n')
++        parser.feed_data(rfc9110_5_6_2_token_delim + b'ET" /get HTTP/1.=
1\r\n\r\n')
+=20
+=20
+ def test_http_request_parser_bad_version(parser) -> None:
+@@ -907,6 +1034,12 @@ def test_http_response_parser_code_not_int(respons=
e) -> None:
+         response.feed_data(b"HTTP/1.1 ttt test\r\n\r\n")
+=20
+=20
++@pytest.mark.parametrize("nonascii_digit", _num.keys(), ids=3D_num.valu=
es())
++def test_http_response_parser_code_not_ascii(response, nonascii_digit: =
bytes) -> None:
++    with pytest.raises(http_exceptions.BadStatusLine):
++        response.feed_data(b"HTTP/1.1 20" + nonascii_digit + b" test\r\=
n\r\n")
++
++
+ def test_http_request_chunked_payload(parser) -> None:
+     text =3D b"GET /test HTTP/1.1\r\n" b"transfer-encoding: chunked\r\n=
\r\n"
+     msg, payload =3D parser.feed_data(text)[0][0]
+--=20
+2.40.0
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb=
 b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
index 50103da47d..c8ce113c42 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
@@ -11,6 +11,7 @@ SRC_URI +=3D "file://CVE-2024-23334.patch \
             file://CVE-2023-49082.patch \
             file://CVE-2024-27306.patch \
             file://CVE-2025-53643.patch \
+            file://CVE-2024-23829.patch \
            "
=20
 SRC_URI[sha256sum] =3D "b0cf2a4501bff9330a8a5248b4ce951851e415bdcce9dc15=
8e76cfd55e15085c"
--=20
2.40.0


