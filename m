Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36178.1795583898954195692
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:18:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fyefa2r7;
 spf=pass (domain: cisco.com, ip: 173.38.203.69, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11136; q=dns/txt;
  s=iport01; t=1795583900; x=1796793500;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mZ5Bbs5TCLcTdpP1qvpBfYvaNYf5Q2Nmsv+LukLXnUk=;
  b=fyefa2r7MevRWmKeP1WRxK/j+OUCbxMT59lyQDE/YdrL/+1ELN7QvAF7
   uHGBp8hu6OrwRXU71FudU0KC0pkSI+UA35yZIkojMFDEizzOCDJY6EmVn
   rzd/kztjawmDf9elJ52oU2RyJKMaul43PdCDOHoCBMFb+ID+mPyGRuiPu
   4X0hevj9IBbQxcBxM4zekvitTPDQwUpfocIWmD/f1LhizFctqA7HcddxO
   uR/bs9jxQ+nmGWIXgrK3aABeFFplHNrTho+YIQts1Ror0wNMAOtgvSxeO
   2B32PW3eghSPsLhAyUQ67oh/yak7y3CKoEoSmgWDtrw4nVJrgEnh08zRX
   g==;
X-CSE-ConnectionGUID: Wo5OWuQ6QeKEyNlbV5yB3w==
X-CSE-MsgGUID: 2DmSxtqVTBCLt25hzdwYIw==
X-IPAS-Result: =?us-ascii?q?A0BJAgAhbQZr/89K/pBaHgEBCxIMggULgld1YENJA5ZIA?=
 =?us-ascii?q?4ETnRaBfg8BAQEPRA0EAQGEP0YCjiICJjQJDgECBAMCAwEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIvKyMIGYMCAYJ0A?=
 =?us-ascii?q?xG6A4F5M4EBgykBMQWBHtszAQsUAYE4hUKIJV0YAYR+JxsbgXKBFYE7gTl2g?=
 =?us-ascii?q?QWBXAKBOBmGVQSCDRWBDIFUgQIJgheJcQKBSYhSSIEeA1ksAVUTDQoLBwWBa?=
 =?us-ascii?q?AM1EioVbjIdgSM7F4EHGwYFgRyBHoESgQNdgSsoXQEhgQiBdQKCUYIAAgFJQ?=
 =?us-ascii?q?Q4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHCQvB?=
 =?us-ascii?q?RkmPBsKgQwnHR4ZDgIpBhYhCzQYDUgRLDcVGQQ+bgeUE4MbATw+EwEqAReBN?=
 =?us-ascii?q?jgDJA8HBgYYklokOQyReIE1n1wKKIN5jCSVOhozqnILmH2OCpVhCGiEaoFoP?=
 =?us-ascii?q?IFZcBU7gmcJShkPjisOC4NgzlsmMgIJAy8BAQcCBw4DC4FokAEBJoFWAQE?=
IronPort-Data: A9a23:KxStvK3Tb/OeJmM6HfbD5YRwkn2cJEfYwER7XKvMYLTBsI5bpz0Hy
 WVOXDiGOveOMWv2KdB3b4q+9x4C65fWx99gGwNv3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ef3b9ANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcubzpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGM0ZrGrIFw7hODEJj5
 NocIg5QfzrYmLfjqF67YrEEasULJcTxeYdasXZ6wHSBU7AtQIvIROPB4towMDUY35wSW6yDO
 4xGNXw1NEuojx5nYj/7DLoyn+qsj3juehVTqUmeouw85G27IAlZjuOzaoeNJIPiqcN9xGqdn
 XLa5lrFKDo+KIbCySiJ7UONmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0UtdKVul/4waXx++MvUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:fX9f2auso/S/P0NPO4adS7Pz7skDVNV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaDZ2JK2xCe36m+oocfng+OaYE
X-Talos-CUID: 9a23:aGwEkmP9Qggwt+5DZy4603EJI54cf17w3VHUKXHlGEwyV+jA
X-Talos-MUID: 9a23:awQIIgYFaBNBmeBT7RPpvyF+LflUyY+KFBpQkYcKpPilKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="63625067"
Received: from aer-l-core-06.cisco.com ([144.254.74.207])
  by aer-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:18:16 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-06.cisco.com (Postfix) with ESMTPS id 67CF4180001F4;
	Wed, 25 Nov 2026 05:18:16 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 9E162CBEFAB; Tue, 24 Nov 2026 21:18:13 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 9/9] python3-aiohttp: fix CVE-2026-69244
Date: Tue, 24 Nov 2026 21:18:11 -0800
Message-Id: <20261125051811.2524271-10-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125051811.2524271-1-dkelaiya@cisco.com>
References: <20261125051811.2524271-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132970
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the bounded parser diagnostic fix [1] to aiohttp 3.9.5,
as identified by [2]. Build error snippets from bounded slices of
the current input buffer. The recipe regenerates the C parser from
the patched Cython source during configuration.

[1] https://github.com/aio-libs/aiohttp/commit/49f65d54150397892f7bcc4aae887767d51c322d
[2] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-cq5v-8q36-5273

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-69244.patch      | 248 ++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |   1 +
 2 files changed, 249 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69244.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69244.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69244.patch
new file mode 100644
index 0000000..73dfafa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69244.patch
@@ -0,0 +1,248 @@
+From 49f65d54150397892f7bcc4aae887767d51c322d Mon Sep 17 00:00:00 2001
+From: "J. Nick Koston" <nick@koston.org>
+Date: Wed, 22 Jul 2026 11:14:50 -1000
+Subject: [PATCH] [PR #13222/f4866933 backport][3.14] Build C parser error
+ message from bounded buffer slice (#13223)
+
+CVE: CVE-2026-69244
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/49f65d54150397892f7bcc4aae887767d51c322d]
+
+Backport Changes:
+- Keep the bounded slice and caret in a private Cython helper so the
+  diagnostic can be tested with ordinary byte strings.
+- Adapt upstream malformed-input tests to a fresh C parser with an
+  invalid status code and check the rejected line in its diagnostic.
+  Check empty, start, middle-line and end-of-buffer offsets in the
+  private helper.
+- Exercise the compiled parser with a valid response and verify its
+  header-limit exception on the same response under a lower limit.
+  This covers the header callback error path.
+- Force a native llhttp error on a valid response in a Linux child
+  process to exercise the bounded fallback diagnostic. Pin the child
+  import to the same compiled parser loaded by the parent.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/13222.bugfix.rst           |    1 
+ aiohttp/_http_parser.pyx           |   17 +++-
+ tests/llhttp_diagnostic_fault.c    |   10 ++
+ tests/test_c_parser_diagnostics.py |  150 ++++++++++++++++++++++++++++++++++++
+ 4 files changed, 172 insertions(+), 6 deletions(-)
+ create mode 100644 CHANGES/13222.bugfix.rst
+ create mode 100644 tests/llhttp_diagnostic_fault.c
+ create mode 100644 tests/test_c_parser_diagnostics.py
+
+diff --git a/CHANGES/13222.bugfix.rst b/CHANGES/13222.bugfix.rst
+new file mode 100644
+index 0000000000000000000000000000000000000000..dcdda17051ca720c81703ec846e5be06d17025f8
+--- /dev/null
++++ b/CHANGES/13222.bugfix.rst
+@@ -0,0 +1 @@
++Fixed error message construction in the C HTTP parser -- by :user:`bdraco`.
+diff --git a/aiohttp/_http_parser.pyx b/aiohttp/_http_parser.pyx
+index 6f5975b7833643f1c4f3deb0efd80afaf035cdea..3c4506e5bc5b5ca95cc51790f16f31de94456df3 100644
+--- a/aiohttp/_http_parser.pyx
++++ b/aiohttp/_http_parser.pyx
+@@ -634,12 +634,9 @@ cdef class HttpParser:
+                     ex = self._last_error
+                     self._last_error = None
+                 else:
+-                    after = cparser.llhttp_get_error_pos(self._cparser)
+-                    before = data[:after - base]
+-                    after_b = after.split(b"\r\n", 1)[0]
+-                    before = before.rsplit(b"\r\n", 1)[-1]
+-                    data = before + after_b
+-                    pointer = " " * (len(repr(before))-1) + "^"
++                    error_pos = cparser.llhttp_get_error_pos(self._cparser)
++                    error_off = error_pos - base
++                    data, pointer = _format_error_context(data, error_off)
+                     ex = parser_error_from_errno(self._cparser, data, pointer)
+                 self._payload = None
+                 raise ex
+@@ -929,6 +926,14 @@ cdef int cb_on_chunk_complete(cparser.llhttp_t* parser) except -1:
+         return 0
+ 
+ 
++def _format_error_context(bytes data not None, Py_ssize_t error_off):
++    """Return the bounded diagnostic line and the pointer to the error."""
++    before = data[:error_off].rsplit(b"\r\n", 1)[-1]
++    after = data[error_off:].split(b"\r\n", 1)[0]
++    pointer = " " * (len(repr(before)) - 1) + "^"
++    return before + after, pointer
++
++
+ cdef parser_error_from_errno(cparser.llhttp_t* parser, data, pointer):
+     cdef cparser.llhttp_errno_t errno = cparser.llhttp_get_errno(parser)
+     cdef bytes desc = cparser.llhttp_get_error_reason(parser)
+diff --git a/tests/llhttp_diagnostic_fault.c b/tests/llhttp_diagnostic_fault.c
+new file mode 100644
+index 0000000000000000000000000000000000000000..44a63c4f866b2246fddc5f78300541ab6978f691
+--- /dev/null
++++ b/tests/llhttp_diagnostic_fault.c
+@@ -0,0 +1,10 @@
++#include "llhttp.h"
++
++/* Fault injection for the isolated Linux parser diagnostic test. */
++llhttp_errno_t llhttp_execute(llhttp_t *parser, const char *data, size_t len)
++{
++    parser->error = HPE_USER;
++    parser->reason = "Injected diagnostic test error";
++    parser->error_pos = data + (len > 2 ? 2 : 0);
++    return HPE_USER;
++}
+diff --git a/tests/test_c_parser_diagnostics.py b/tests/test_c_parser_diagnostics.py
+new file mode 100644
+index 0000000000000000000000000000000000000000..555c25d64bdf365e8caa9e9437eff40b3dde892a
+--- /dev/null
++++ b/tests/test_c_parser_diagnostics.py
+@@ -0,0 +1,150 @@
++import asyncio
++import os
++import shutil
++import subprocess
++import sys
++from asyncio import AbstractEventLoop
++from pathlib import Path
++
++import pytest
++
++from aiohttp.base_protocol import BaseProtocol
++from aiohttp.http_exceptions import BadHttpMessage, BadStatusLine, LineTooLong
++
++
++_RESPONSE = (
++    b"HTTP/1.1 200 OK\r\n"
++    b"Content-Length: 5\r\n"
++    b"X-Sample: example header value\r\n"
++    b"\r\n"
++    b"hello"
++)
++
++
++@pytest.mark.parametrize(
++    ("data", "offset", "expected"),
++    [
++        (b"", 0, (b"", "  ^")),
++        (b"sample", 0, (b"sample", "  ^")),
++        (b"north\r\ncenter\r\nsouth", 10, (b"center", "     ^")),
++        (b"north\r\ncenter\r\nsouth", 20, (b"south", "       ^")),
++        (b"end\r\n", 5, (b"", "  ^")),
++    ],
++    ids=["empty", "start", "middle-line", "buffer-end", "empty-last-line"],
++)
++def test_c_parser_error_context(
++    data: bytes, offset: int, expected: tuple[bytes, str]
++) -> None:
++    parser = pytest.importorskip("aiohttp._http_parser")
++    assert parser._format_error_context(data, offset) == expected
++
++
++def test_c_parser_reads_complete_response(loop: AbstractEventLoop) -> None:
++    parser_module = pytest.importorskip("aiohttp._http_parser")
++    parser = parser_module.HttpResponseParser(BaseProtocol(loop), loop, 2**16)
++
++    messages, upgraded, tail = parser.feed_data(_RESPONSE)
++
++    (message, payload), = messages
++    assert message.code == 200
++    assert message.headers["X-Sample"] == "example header value"
++    assert not upgraded
++    assert tail == b""
++    assert payload.read_nowait() == b"hello"
++    assert payload.at_eof()
++
++
++def test_c_parser_enforces_response_header_limit(loop: AbstractEventLoop) -> None:
++    parser_module = pytest.importorskip("aiohttp._http_parser")
++    parser = parser_module.HttpResponseParser(
++        BaseProtocol(loop), loop, 2**16, max_field_size=20
++    )
++
++    with pytest.raises(LineTooLong, match="Got more than 20 bytes"):
++        parser.feed_data(_RESPONSE)
++
++
++def test_c_parser_rejects_invalid_status_line(loop: AbstractEventLoop) -> None:
++    parser_module = pytest.importorskip("aiohttp._http_parser")
++    parser = parser_module.HttpResponseParser(BaseProtocol(loop), loop, 2**16)
++
++    with pytest.raises(BadStatusLine) as caught:
++        parser.feed_data(b"HTTP/1.1 ABC Invalid\r\n\r\n")
++
++    assert caught.value.code == 400
++    assert "HTTP/1.1 ABC Invalid" in caught.value.message
++
++
++def _assert_c_parser_fallback_diagnostic(expected_parser: Path) -> None:
++    from aiohttp import _http_parser
++
++    assert Path(_http_parser.__file__).resolve() == expected_parser
++    captured: list[tuple[bytes, int]] = []
++    format_error_context = _http_parser._format_error_context
++
++    def record_context(data: bytes, offset: int) -> tuple[bytes, str]:
++        captured.append((data, offset))
++        return format_error_context(data, offset)
++
++    _http_parser._format_error_context = record_context
++    loop = asyncio.new_event_loop()
++    try:
++        parser = _http_parser.HttpResponseParser(BaseProtocol(loop), loop, 2**16)
++        with pytest.raises(BadHttpMessage) as caught:
++            parser.feed_data(_RESPONSE)
++    finally:
++        loop.close()
++
++    assert captured == [(_RESPONSE, 2)]
++    assert caught.value.message == (
++        "Injected diagnostic test error:\n\n  b'HTTP/1.1 200 OK'\n      ^"
++    )
++
++
++@pytest.mark.internal
++@pytest.mark.skipif(sys.platform != "linux", reason="requires Linux LD_PRELOAD")
++def test_c_parser_formats_injected_llhttp_error(tmp_path: Path) -> None:
++    parser = pytest.importorskip("aiohttp._http_parser")
++    parser_path = Path(parser.__file__).resolve()
++    compiler = shutil.which("cc")
++    if compiler is None:
++        pytest.skip("requires a C compiler for the test-only llhttp shim")
++
++    test_file = Path(__file__).resolve()
++    llhttp_include = test_file.parent.parent / "vendor" / "llhttp" / "build"
++    if not (llhttp_include / "llhttp.h").is_file():
++        pytest.skip("requires the bundled llhttp headers")
++
++    shim = tmp_path / "llhttp_diagnostic_fault.so"
++    subprocess.run(
++        [
++            compiler,
++            "-shared",
++            "-fPIC",
++            "-I", str(llhttp_include),
++            str(test_file.with_name("llhttp_diagnostic_fault.c")),
++            "-o", str(shim),
++        ],
++        check=True,
++        timeout=15,
++    )
++    # Restrict symbol interposition to the subprocess that sends one valid
++    # response. The shim causes feed_data() to take the native fallback path.
++    env = dict(os.environ)
++    preload = env.get("LD_PRELOAD")
++    env["LD_PRELOAD"] = f"{preload}:{shim}" if preload else str(shim)
++    child = (
++        "import runpy, sys\n"
++        "from pathlib import Path\n"
++        "parser_path = Path(sys.argv[2])\n"
++        "sys.path.insert(0, str(parser_path.parent.parent))\n"
++        "namespace = runpy.run_path(sys.argv[1])\n"
++        "namespace['_assert_c_parser_fallback_diagnostic'](parser_path)\n"
++    )
++    subprocess.run(
++        [sys.executable, "-c", child, str(test_file), str(parser_path)],
++        cwd=test_file.parent.parent,
++        env=env,
++        check=True,
++        timeout=15,
++    )
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index bbd7b27..e880c61 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -49,6 +49,7 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2026-69243_p1.patch \
            file://CVE-2026-69243_p2.patch \
            file://CVE-2026-69243_CVE-2026-128129.patch \
+           file://CVE-2026-69244.patch \
            "
 
 CVE_STATUS[CVE-2026-34515] = "not-applicable-platform: Vulnerability only affects applications running on Windows"
-- 
2.35.6
