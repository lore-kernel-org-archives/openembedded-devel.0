Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36133.1795583897026423651
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:18:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Gzy1PcIG;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5185; q=dns/txt;
  s=iport01; t=1795583897; x=1796793497;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8/9+i3uOT09R+6A2wijibB+5/OuslK7r+zgFKyR/a7o=;
  b=Gzy1PcIGHaiHjAwEhti6exjoNpFYQeT4dD9eY+JYRmbTm/yZD7JhlM0/
   FnBl9JBoM1lTUzkonV5vMhd1DsjI2FrURfEZRXTJ4IZpAQgkDBzp4CAga
   81NXuAY6VL/Rq9uPk1Jk+tdyyinODLwURQoTBg1FOs7U8z6gWE8LBu5CZ
   66GbsbZZh7L98/ucIgJ5cstsPgl0IIm3k14E3Y41H4bobaCmiLmgXiqwO
   FQ8Ooan/s1MEmGNni7IY81GJAyr1HvKiY3P5dP8EZGogX1veJNVzm0Ock
   X9c5WFzFCee8Si4GBHQ4aCEqbUXHw6miTWDTd2BqJM2KFkphBdalFPVvo
   w==;
X-CSE-ConnectionGUID: 3hbUYyqwTdukOLt0URVLig==
X-CSE-MsgGUID: +gzZ2VvITZ25mfAtpFvWDg==
X-IPAS-Result: =?us-ascii?q?A0BJAgAhbQZr/9VK/pBaglmCV3VgQ0kDlkgDkVCMWYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgQCYMCAYJ0AxG6A4F5M?=
 =?us-ascii?q?4EBgykBgVTbMwELFAGBOIVCiCVdGAGEficbG4FygRWBO4IvgQWBXAICgU+GV?=
 =?us-ascii?q?QSCIoEMgVSNEwKBSYhSSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHG?=
 =?us-ascii?q?wYFgRyBHoESgQNdgSsoXQEhgQiBdQKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJA?=
 =?us-ascii?q?RMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHCQvBRkmPBsKgQwnHR4ZDgIpB?=
 =?us-ascii?q?hYhCzQYDUgRLDcVGQQ+bgeUE4MbgQ4BKgGBNHgWBqM4giGhEQoog3mMJJU6G?=
 =?us-ascii?q?jOqcguYfY4KlgEDTYRqgWg8gVlwFYMiCUoZD445g2uFE8lIJjICAQgDLwEBB?=
 =?us-ascii?q?wIHDgMLgWiQAoF8AQE?=
IronPort-Data: A9a23:QPyF5aywDtiVhf35OTN6t+dgxyrEfRIJ4+MujC+fZmUNrF6WrkVSy
 GROWzvQaP/eNDf9LtAgb4mz9h9QucTQmoc1SlBvrFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH9aOWJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaD9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJBo2N7Ap6/9oPW1T9
 ts8NGgwVC6nhu3jldpXSsE07igiBMDmJsYb/3pn1zycVKxgSpHYSKKM7thdtNsyrpkSQbCEO
 pZfNmYpNk2bC/FMEg9/5JYWkOSlgnD+YjRwo1OOrq1x6G/WpOB0+Oa1a4GKKozULSlTtgWXt
 FCcwXrYPiNAadmR4Cad3GyTquCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRulzfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:4CJyU67sqO4nmGH9WgPXwOrXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: 9a23:vTgPwmGeb9CYXF1WqmI89EQpK9E8bUHR0XT3B1PgNFxXbLyaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3ApqVGqw9D6Jh0fxiSnKjhxc6Qf4Rn8Zb0Nl4srad?=
 =?us-ascii?q?c5syKHDBoFSmioDviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60337886"
Received: from aer-l-core-12.cisco.com ([144.254.74.213])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:18:15 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-12.cisco.com (Postfix) with ESMTPS id C3BB718000206;
	Wed, 25 Nov 2026 05:18:14 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 69465CBF201; Tue, 24 Nov 2026 21:18:13 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 1/9] python3-aiohttp: fix CVE-2026-111750
Date: Tue, 24 Nov 2026 21:18:03 -0800
Message-Id: <20261125051811.2524271-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125051811.2524271-1-dkelaiya@cisco.com>
References: <20261125051811.2524271-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132965
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the upstream HEAD request parsing fix [1] to aiohttp 3.9.5,
as identified by [2]. Only responses to HEAD may skip their body;
incoming HEAD requests must consume the declared request body.

Retain the upstream regression that embeds a request in a HEAD body
and verifies that the following request remains correctly framed.
The pure-Python parser remains available with extensions installed.

[1] https://github.com/aio-libs/aiohttp/commit/9b27347e61454d9f8ca2055f4c67a37dee336e83
[2] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-pqxq-w44r-73xw

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-111750.patch     | 84 +++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111750.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111750.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111750.patch
new file mode 100644
index 0000000000..860b7aec03
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111750.patch
@@ -0,0 +1,84 @@
+From 9b27347e61454d9f8ca2055f4c67a37dee336e83 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Wed, 9 Sep 2026 01:25:13 +0100
+Subject: [PATCH] Fix head request parsing (#13671) (#13673)
+
+CVE: CVE-2026-111750
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/9b27347e61454d9f8ca2055f4c67a37dee336e83]
+
+Backport Changes:
+- Use the existing empty-body helper functions instead of the newer
+  EMPTY_BODY_* constants, and adapt the explanatory comment.
+
+(cherry picked from commit 5789546e37fe35af27d0a2f840870b22bc15bfc4)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/13671.bugfix.rst  |  1 +
+ aiohttp/http_parser.py    |  6 +++++-
+ tests/test_http_parser.py | 27 ++++++++++++++++++++++++++-
+ 3 files changed, 32 insertions(+), 2 deletions(-)
+ create mode 100644 CHANGES/13671.bugfix.rst
+
+diff --git a/CHANGES/13671.bugfix.rst b/CHANGES/13671.bugfix.rst
+new file mode 100644
+index 0000000..e6fbc70
+--- /dev/null
++++ b/CHANGES/13671.bugfix.rst
+@@ -0,0 +1 @@
++Fixed pure-Python request parser not reading a body in a ``HEAD`` request -- by :user:`Dreamsorcerer`.
+diff --git a/aiohttp/http_parser.py b/aiohttp/http_parser.py
+index 37a0dff..58f0a50 100644
+--- a/aiohttp/http_parser.py
++++ b/aiohttp/http_parser.py
+@@ -420,8 +420,12 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+ 
+                         assert self.protocol is not None
+                         # calculate payload
++                        # https://www.rfc-editor.org/info/rfc9112/#name-message-body-length
++                        # https://www.rfc-editor.org/info/rfc9110/#section-9.3.1-6
++                        # Empty-body methods should only apply to responses.
++                        # self.method is None on request parser.
+                         empty_body = status_code_must_be_empty_body(code) or bool(
+-                            method and method_must_be_empty_body(method)
++                            self.method and method_must_be_empty_body(self.method)
+                         )
+                         if not empty_body and (
+                             ((length is not None and length > 0) or msg.chunked)
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
+index b29518a..d08698a 100644
+--- a/tests/test_http_parser.py
++++ b/tests/test_http_parser.py
+@@ -1537,7 +1537,32 @@ def test_http_request_chunked_payload_and_next_message(parser) -> None:
+     assert not payload2.is_eof()
+ 
+ 
+-def test_http_request_chunked_payload_chunks(parser) -> None:
++def test_http_request_parser_head_with_content_length_payload(
++    parser: HttpRequestParser,
++) -> None:
++    smuggled = b"GET /smuggled HTTP/1.1\r\nHost: a\r\n\r\n"
++    text = (
++        b"HEAD /test HTTP/1.1\r\nHost: a\r\nContent-Length: %d\r\n\r\n" % len(smuggled)
++        + smuggled
++        + b"POST /next HTTP/1.1\r\nHost: a\r\nContent-Length: 0\r\n\r\n"
++    )
++    messages, upgraded, tail = parser.feed_data(text)
++
++    assert len(messages) == 2
++    msg, payload = messages[0]
++    assert msg.method == "HEAD"
++    assert b"".join(payload._buffer) == smuggled
++    assert payload.is_eof()
++
++    msg2, payload2 = messages[1]
++    assert msg2.method == "POST"
++    assert msg2.path == "/next"
++    assert payload2.is_eof()
++    assert not upgraded
++    assert not tail
++
++
++def test_http_request_chunked_payload_chunks(parser: HttpRequestParser) -> None:
+     text = b"GET /test HTTP/1.1\r\n" b"transfer-encoding: chunked\r\n\r\n"
+     msg, payload = parser.feed_data(text)[0][0]
+ 
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index 893d5124f7..3c9a82b012 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -36,6 +36,7 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2026-54279.patch \
            file://CVE-2026-54273_p1.patch \
            file://CVE-2026-54273_p2.patch \
+           file://CVE-2026-111750.patch \
            "
 
 CVE_STATUS[CVE-2026-34515] = "not-applicable-platform: Vulnerability only affects applications running on Windows"
-- 
2.35.6
