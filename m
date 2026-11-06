Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1304.1793950037466876407
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 23:27:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=JPzCIPZm;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4924; q=dns/txt;
  s=iport01; t=1793950037; x=1795159637;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6CHElhsShU/wqSUhdsglxtNA9+NUT5Zs/ifeCqxmzxI=;
  b=JPzCIPZm2ZwMxP6xWfY76D/snP+OnQW28F0V2ljhvZayQcu9UjH4tKrb
   IKYZD9h8CNE0HrjZozsylODa0kspc5JbFz3kHRhbUKnylrkuwkshlbQAs
   Q/ucrpw6vdA1txpKlLyrJIIDXsm9UGaos7OCSJvQyxspXxNpeuJQtZ2LV
   ni1m7/ul8mfWUosZRZq5we9J5oTcCR8LamzbRdGi8UGggWiIjt/4TSTox
   ERDBdBcIIkURGt4RBHpGtMhEqW6YJnZBg+P8AOZQ0FPo5sk5Q1s78Gi8e
   qlBB092MJ8WhJbLi9u5BZvDpKbAgX6lmuaOSdakat6seCjmgj246ERGN/
   g==;
X-CSE-ConnectionGUID: 1/BQBtxBQlKk7+deIkbn6g==
X-CSE-MsgGUID: 9j2lQFfoTqq0miQ/NcljkQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgDmf+1q/4v/Ja1aglmCV3VgQ0kDlkgDkUyMVYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOHQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQDEbwSgXkzg?=
 =?us-ascii?q?QGDKQGBVNszAQsUAYE4hUCII10YAYR9JxsbgXKBFYE7gi6BBYFcAgKBT4ZVB?=
 =?us-ascii?q?IIigQyBWo0YAoFRhnlIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbB?=
 =?us-ascii?q?gWBHYEegRKBB12BKyhdASGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBE?=
 =?us-ascii?q?xosCoEaNTwJJj8VDGQLGgVhCAINDHQ5EDAeJC8FHCY+GwovGA1IESw3FRkEP?=
 =?us-ascii?q?m4Hkj2DEoEOASoBgTR4FgajOYIhoREKKIN4jCSVOhozqnELmH2OCpYBA02Ea?=
 =?us-ascii?q?YFoPIFZcBWDIglKGQ+OOYNrhRPHHiYyAgEIAy8BAQcCBw4DC4FokAKBfAEB?=
IronPort-Data: A9a23:UnGauKq1fZ4ssbtKr0U9wK8zCqpeBmJIZBIvgKrLsJaIsI4StFCzt
 garIBnQMq2CZDHzLd4lYI7j8UxTvZfQzdUxSws4+X0wEX4R+OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8E435ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0r8wK1hk6
 ewyETQubU/Ai++Xw7i9FOY506zPLOGzVG8ekmtrwTecCbMtRorOBv2Qo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5MWfrSn8/w7pX7WzFbpVacpLs+y2PS1wd2lrPqNbI5f/TXGZgNxBnA9
 juuE2LRUxNAMOWxxz2562v0g+722gXwXIARLejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aJ
 0EK9y4Gqakp6FftScHwWRC9qnOIshMQHd1KHIUHBBql0KHY5UOdQ2MDVDMEMIZgv84tTjts3
 ViM9z/0OQFSXHSuYSr13t+pQfmaYED58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:eGBBTKwVHyCBWnvBdkMXKrPwDr1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIC5IOa+HYPBxdkdvw5hW+HpILxdmK973tuMLlpk0dKz2Dr8pbnn9E4sHxKDwOeDV7
X-Talos-CUID: 9a23:NxmDYmzIsHDdMTTKHDGfBgVNXeocWGHN5k7UAEznSmpkab6fTwGfrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3Af0+rKg1Y03y2ja/xMDwidMMpXDUjsqb0DHkjn5I?=
 =?us-ascii?q?6otDcMC1JfBGWiDa0e9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="545027081"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 07:27:16 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 7BA5918000207;
	Fri,  6 Nov 2026 07:27:16 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 27CCDCBF202; Thu,  5 Nov 2026 23:27:16 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 2/7] python3-aiohttp: fix CVE-2026-111750
Date: Thu,  5 Nov 2026 23:26:57 -0800
Message-Id: <20261106072702.502813-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106072702.502813-1-dkelaiya@cisco.com>
References: <20261106072702.502813-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 06 Nov 2026 07:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131964
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the upstream HEAD request parsing fix [1] to aiohttp 3.13.5,
as identified by [2]. Only responses to HEAD may skip their body;
incoming HEAD requests must consume the declared request body.

Retain the upstream regression that embeds a request in a HEAD body
and verifies that the following request remains correctly framed.
The pure-Python parser remains available with extensions installed.

[1] https://github.com/aio-libs/aiohttp/commit/9b27347e61454d9f8ca2055f4c67a37dee336e83
[2] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-pqxq-w44r-73xw

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-111750.patch     | 83 +++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111750.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111750.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111750.patch
new file mode 100644
index 0000000000..61498e09f3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111750.patch
@@ -0,0 +1,83 @@
+From 9b27347e61454d9f8ca2055f4c67a37dee336e83 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Wed, 9 Sep 2026 01:25:13 +0100
+Subject: [PATCH] Fix head request parsing (#13671) (#13673)
+
+(cherry picked from commit 5789546e37fe35af27d0a2f840870b22bc15bfc4)
+
+CVE: CVE-2026-111750
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/9b27347e61454d9f8ca2055f4c67a37dee336e83]
+
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
+index f4458dc..ce15764 100644
+--- a/aiohttp/http_parser.py
++++ b/aiohttp/http_parser.py
+@@ -426,8 +426,12 @@ class HttpParser(abc.ABC, Generic[_MsgT]):
+ 
+                         assert self.protocol is not None
+                         # calculate payload
++                        # https://www.rfc-editor.org/info/rfc9112/#name-message-body-length
++                        # https://www.rfc-editor.org/info/rfc9110/#section-9.3.1-6
++                        # EMPTY_BODY_METHODS should only apply to responses.
++                        # self.method is None on request parser.
+                         empty_body = code in EMPTY_BODY_STATUS_CODES or bool(
+-                            method and method in EMPTY_BODY_METHODS
++                            self.method and self.method in EMPTY_BODY_METHODS
+                         )
+                         if not empty_body and (
+                             (length is not None and length > 0) or msg.chunked
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
+index 4cdd94c..4255f4d 100644
+--- a/tests/test_http_parser.py
++++ b/tests/test_http_parser.py
+@@ -1781,7 +1781,32 @@ def test_http_request_chunked_payload_and_next_message(parser) -> None:
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
+     text = b"GET /test HTTP/1.1\r\ntransfer-encoding: chunked\r\n\r\n"
+     msg, payload = parser.feed_data(text)[0][0]
+ 
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index 917405c715..40ac847c01 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -24,6 +24,7 @@ SRC_URI += " \
     file://CVE-2026-69244.patch \
     file://CVE-2026-111066_p1.patch \
     file://CVE-2026-111066_p2.patch \
+    file://CVE-2026-111750.patch \
 "
 
 CVE_PRODUCT = "aiohttp:aiohttp"
-- 
2.35.6
