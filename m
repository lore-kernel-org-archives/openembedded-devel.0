Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83571C5DF85
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 05:19:25 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.616.1787203158686665360
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 22:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=X5LSLPlw;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12432; q=dns/txt;
  s=iport01; t=1787203160; x=1788412760;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cIGslw1Ah+d/xiOE+ZgL3jsujmCahOtWIaW6P7CPvy0=;
  b=X5LSLPlwQELvvpeAFOzCsQPNlOx7NlKpumC+NKyZpWMbK/0zqQkqeliT
   wyDsTx6eYzumaLS79FTo2mjSAv8iMc5F7JURIThHTU4RDTFkQxydkyaxb
   cH3Y/lG9dM+5+4lcaEhQUAuxy94l52E0xzYb2RwcuEfiwChNmBn3V8EeJ
   VIB4J3G4wB98z91725LWNTVmk0t26SaRiuCIqkjBxsm2XiJ7Hbe/ckJw+
   TDHPa3A2AVhTKlyCkI5V9xlgHkI1q2bWWEYwOpcakUC/VCp+OMpSIxhRM
   BRFmkvMg2l85plwNcQ7w8PFyQJYdx3URm7yqy4HDtKprRX5yeAzNtzQrf
   Q==;
X-CSE-ConnectionGUID: zxblw8TaRtuRCgZhwzYIvw==
X-CSE-MsgGUID: 4XbrECRyQUq55MZlpMcQAg==
X-IPAS-Result: =?us-ascii?q?A0BIAgAHjYZq/4wQJK1aHgEBCxIMggULgld0XkNJlkoDi?=
 =?us-ascii?q?2SSN4F+DwEBAQ9EDQQBAYQ/RgKNawImNAkOAQIEAwIDAQEBAQEBAQEBAQELA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDYZaAQIBAycLARgBLRAcAwECLyALIwgZgwIBgjoDN?=
 =?us-ascii?q?wMRwl2BeTOBAYMoAT8CQ1DYSw2CWAELFAEFgTOFP4J/hSNdGAGEfCcbG4Fyg?=
 =?us-ascii?q?lCCLoEFgRpCAQECAYgiBIIigQyBWh6RUkiBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBDRsGBYEdgSiENyMZNnyBCV6BKyphARIXgQmCCgKCcIIGAgFJR?=
 =?us-ascii?q?Q4JFwsYDUgRLDcUGQQ+bgeOUSCCRAcBLCYoEwErF4Ftph6gHnEKKIN2jCGPP?=
 =?us-ascii?q?oV8GjOqbAuYfY4KhAmRal2EaYFoPIFHCwdwFYMiCUoZD44qAwsLg2CBf4MUx?=
 =?us-ascii?q?yYnMgIJMgEBBwIHDgMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:fvNqMaw4VfRq74/7dRl6t+dnxyrEfRIJ4+MujC+fZmUNrF6WrkUAn
 GMXDWuPM/reYDSnfdglYImx8EgEscTVzNAyS1Rkq1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkazNMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJFMmN4kHqtp+O31Tz
 9cXGjASfCGimf3jldpXSsE07igiBMDvOIVavjRryivUSK59B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUiYC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZgOG3YYKEKoTXLSlTthqor
 Hjr1F7oOywDaYG6+z6d13mVr+CayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7CQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSLCrt94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:ju1Zc6wcbVPaaGHeoU3TKrPw9L1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIWpIObuEYdWIK7vrS0U2fD8sqxsWB/eSDgOfTyGoocCRRApsQljuQzm2gYzZLrM4sP+tAKK
 ah
X-Talos-CUID: =?us-ascii?q?9a23=3AgDzoGWg45rNP9GdNJ7uIkNc36jJuYG3XyGiAH0a?=
 =?us-ascii?q?CFXtTY7KnSUCCyYJ6jJ87?=
X-Talos-MUID: 9a23:Ai4UUgjAHthikQdXLrVt9cMpaPdi+YmFMlE0rIxb5uy2MTRVMA60g2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="812909805"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 05:18:40 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id 612B8180079BD;
	Thu, 20 Aug 2026 05:16:36 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 07104CC12A6; Wed, 19 Aug 2026 22:16:36 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-python][scarthgap][PATCH 4/4] python3-ujson: Fix CVE-2026-54911
Date: Wed, 19 Aug 2026 22:16:30 -0700
Message-Id: <20260820051630.63383-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260820051630.63383-1-hthakar@cisco.com>
References: <20260820051630.63383-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 05:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129374

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix referenced in [2], using the
commit shown in [1].

[1] https://github.com/ultrajson/ultrajson/commit/169eaf36b1116fece5034ee79a7a0ef3f6deedcf
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-54911

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/python3-ujson/CVE-2026-54911.patch | 267 ++++++++++++++++++
 .../python/python3-ujson_5.9.0.bb             |   1 +
 2 files changed, 268 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ujson/CVE-2026-54911.patch

diff --git a/meta-python/recipes-devtools/python/python3-ujson/CVE-2026-54911.patch b/meta-python/recipes-devtools/python/python3-ujson/CVE-2026-54911.patch
new file mode 100644
index 0000000000..c7c14066d4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ujson/CVE-2026-54911.patch
@@ -0,0 +1,267 @@
+From 92a7b67d7b6155c2e3bc225fa0238ea35249bb36 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Br=C3=A9nainn=20Woodsend?= <bwoodsend@gmail.com>
+Date: Fri, 24 Apr 2026 21:59:45 +0100
+Subject: [PATCH] More UTF-8 validation for ujson.dumps(b"...",
+ reject_bytes=False)
+
+* Fix off by one errors in detecting end of string mid sequence
+* Add missing check for codepoints > max unicode
+* Add missing check for bad continuation bytes
+
+CVE: CVE-2026-54911
+Upstream-Status: Backport [https://github.com/ultrajson/ultrajson/commit/169eaf36b1116fece5034ee79a7a0ef3f6deedcf]
+
+Backport Changes:
+- Adjusted source paths for ujson 5.9.0's pre-src-layout tree.
+- Relocated regression tests to the matching section of the 5.9.0 test suite.
+- Added the `random` import required by the backported fuzz regression test;
+  newer upstream already imports it, while ujson 5.9.0 does not.
+
+(cherry picked from commit 169eaf36b1116fece5034ee79a7a0ef3f6deedcf)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ lib/ultrajsondec.c  |  6 ++--
+ lib/ultrajsonenc.c  | 46 ++++++++++++++++++++++-----
+ tests/test_ujson.py | 76 ++++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 118 insertions(+), 10 deletions(-)
+
+diff --git a/lib/ultrajsondec.c b/lib/ultrajsondec.c
+index bccb0aa..5583376 100644
+--- a/lib/ultrajsondec.c
++++ b/lib/ultrajsondec.c
+@@ -531,7 +531,7 @@ static FASTCALL_ATTR JSOBJ FASTCALL_MSVC decode_string ( struct DecoderState *ds
+           return SetError(ds, -1, "Invalid octet in UTF-8 sequence when decoding 'string'");
+         }
+         ucs |= (*inputOffset++) & 0x3f;
+-        if (ucs < 0x80) return SetError (ds, -1, "Overlong 2 byte UTF-8 sequence detected when decoding 'string'");
++        if (ucs < 0x80) return SetError (ds, -1, "Overlong 2-byte UTF-8 sequence detected when decoding 'string'");
+         *(escOffset++) = (JSUINT32) ucs;
+         break;
+       }
+@@ -554,7 +554,7 @@ static FASTCALL_ATTR JSOBJ FASTCALL_MSVC decode_string ( struct DecoderState *ds
+           ucs |= oct & 0x3f;
+         }
+ 
+-        if (ucs < 0x800) return SetError (ds, -1, "Overlong 3 byte UTF-8 sequence detected when encoding string");
++        if (ucs < 0x800) return SetError (ds, -1, "Overlong 3-byte UTF-8 sequence detected when encoding string");
+         *(escOffset++) = (JSUINT32) ucs;
+         break;
+       }
+@@ -577,7 +577,7 @@ static FASTCALL_ATTR JSOBJ FASTCALL_MSVC decode_string ( struct DecoderState *ds
+           ucs |= oct & 0x3f;
+         }
+ 
+-        if (ucs < 0x10000) return SetError (ds, -1, "Overlong 4 byte UTF-8 sequence detected when decoding 'string'");
++        if (ucs < 0x10000) return SetError (ds, -1, "Overlong 4-byte UTF-8 sequence detected when decoding 'string'");
+ 
+         *(escOffset++) = (JSUINT32) ucs;
+         break;
+diff --git a/lib/ultrajsonenc.c b/lib/ultrajsonenc.c
+index 0f9fde3..5bafd52 100644
+--- a/lib/ultrajsonenc.c
++++ b/lib/ultrajsonenc.c
+@@ -347,17 +347,24 @@ static int Buffer_EscapeStringValidated (JSOBJ obj, JSONObjectEncoder *enc, cons
+         continue;
+       }
+ 
++      // https://en.wikipedia.org/wiki/UTF-8#Description
+       case 2:
+       {
+         JSUTF32 in;
+         JSUTF16 in16;
+ 
+-        if (end - io < 1)
++        if (end - io < 2)
+         {
+           enc->offset += (of - enc->offset);
+           SetError (obj, enc, "Unterminated UTF-8 sequence when encoding string");
+           return FALSE;
+         }
++        if ((io[1] & 0xc0) != 0x80)
++        {
++          enc->offset += (of - enc->offset);
++          SetError (obj, enc, "Invalid continuation byte in 2-byte UTF-8 sequence detected when encoding string");
++          return FALSE;
++        }
+ 
+         memcpy(&in16, io, sizeof(JSUTF16));
+         in = (JSUTF32) in16;
+@@ -371,7 +378,7 @@ static int Buffer_EscapeStringValidated (JSOBJ obj, JSONObjectEncoder *enc, cons
+         if (ucs < 0x80)
+         {
+           enc->offset += (of - enc->offset);
+-          SetError (obj, enc, "Overlong 2 byte UTF-8 sequence detected when encoding string");
++          SetError (obj, enc, "Overlong 2-byte UTF-8 sequence detected when encoding string");
+           return FALSE;
+         }
+ 
+@@ -385,13 +392,26 @@ static int Buffer_EscapeStringValidated (JSOBJ obj, JSONObjectEncoder *enc, cons
+         JSUTF16 in16;
+         JSUINT8 in8;
+ 
+-        if (end - io < 2)
++        if (end - io < 3)
+         {
+           enc->offset += (of - enc->offset);
+           SetError (obj, enc, "Unterminated UTF-8 sequence when encoding string");
+           return FALSE;
+         }
+-
++        if ((io[1] & 0xc0) != 0x80 || (io[2] & 0xc0) != 0x80)
++        {
++          enc->offset += (of - enc->offset);
++          SetError (obj, enc, "Invalid continuation byte in 3-byte UTF-8 sequence detected when encoding string");
++          return FALSE;
++        }
++        // Under normal UTF-8 decoding rules, UTF-16 surrogates should also be disallowed
++        // but in JSON, they're special cased and rewritten later as \udc7f.
++        // if ((JSUINT8) io[0] == 0xed && (JSUINT8) io[1] >= 0xa0)
++        // {
++        //   enc->offset += (of - enc->offset);
++        //   SetError (obj, enc, "Illegal UTF-16 surrogate in 3-byte UTF-8 sequence detected when encoding string");
++        //   return FALSE;
++        // }
+         memcpy(&in16, io, sizeof(JSUTF16));
+         memcpy(&in8, io + 2, sizeof(JSUINT8));
+ #ifdef __LITTLE_ENDIAN__
+@@ -407,7 +427,7 @@ static int Buffer_EscapeStringValidated (JSOBJ obj, JSONObjectEncoder *enc, cons
+         if (ucs < 0x800)
+         {
+           enc->offset += (of - enc->offset);
+-          SetError (obj, enc, "Overlong 3 byte UTF-8 sequence detected when encoding string");
++          SetError (obj, enc, "Overlong 3-byte UTF-8 sequence detected when encoding string");
+           return FALSE;
+         }
+ 
+@@ -418,12 +438,24 @@ static int Buffer_EscapeStringValidated (JSOBJ obj, JSONObjectEncoder *enc, cons
+       {
+         JSUTF32 in;
+ 
+-        if (end - io < 3)
++        if (end - io < 4)
+         {
+           enc->offset += (of - enc->offset);
+           SetError (obj, enc, "Unterminated UTF-8 sequence when encoding string");
+           return FALSE;
+         }
++        if ((io[1] & 0xc0) != 0x80 || (io[2] & 0xc0) != 0x80 || (io[3] & 0xc0) != 0x80)
++        {
++          enc->offset += (of - enc->offset);
++          SetError (obj, enc, "Invalid continuation byte in 4-byte UTF-8 sequence detected when encoding string");
++          return FALSE;
++        }
++        if (((JSUINT8) io[0] >= 0xf4 && (JSUINT8) io[1] >= 0x90) || (JSUINT8) io[0] >= 0xf5)
++        {
++          enc->offset += (of - enc->offset);
++          SetError (obj, enc, ">U+10FFFF in 4-byte UTF-8 sequence detected when encoding string");
++          return FALSE;
++        }
+ 
+         memcpy(&in, io, sizeof(JSUTF32));
+ #ifdef __LITTLE_ENDIAN__
+@@ -434,7 +466,7 @@ static int Buffer_EscapeStringValidated (JSOBJ obj, JSONObjectEncoder *enc, cons
+         if (ucs < 0x10000)
+         {
+           enc->offset += (of - enc->offset);
+-          SetError (obj, enc, "Overlong 4 byte UTF-8 sequence detected when encoding string");
++          SetError (obj, enc, "Overlong 4-byte UTF-8 sequence detected when encoding string");
+           return FALSE;
+         }
+ 
+diff --git a/tests/test_ujson.py b/tests/test_ujson.py
+index ccff37f..9024dac 100644
+--- a/tests/test_ujson.py
++++ b/tests/test_ujson.py
+@@ -5,6 +5,7 @@ import io
+ import json
+ import math
+ import os.path
++import random
+ import re
+ import subprocess
+ import sys
+@@ -1053,6 +1053,81 @@ def test_reject_bytes_false():
+     assert ujson.dumps(data, reject_bytes=False) == '{"a":"b"}'
+ 
+ 
++@pytest.mark.parametrize(
++    "codepoint",
++    [0x0, 0x7F, 0x80, 0x7FF, 0x800, 0xFFFF, 0x10000, 0x10FFFF],
++)
++def test_reject_bytes_false_codepoint_boundaries(codepoint):
++    char = chr(codepoint)
++    assert ujson.loads(ujson.dumps(char.encode(), reject_bytes=False)) == char
++
++
++@pytest.mark.parametrize(
++    "value, error",
++    [
++        # Bad start bytes
++        (b"\xfd", "Unsupported UTF-8 sequence length when encoding string"),
++        (b"\xfc:", "Unsupported UTF-8 sequence length when encoding string"),
++        (b"U>\xfb", "Unsupported UTF-8 sequence length when encoding string"),
++        (b"\\\xf8\x98\t", "Unsupported UTF-8 sequence length when encoding string"),
++        (b"\x9b", "'utf-8' codec can't decode byte 0x9b in position 1:"),
++        (b"B\x8a", "'utf-8' codec can't decode byte 0x8a in position 2:"),
++        # Bad continuation bytes (any non-start byte not matching 0b10xx_xxxx)
++        (b"\xcf\x13", "Invalid continuation byte in 2-byte UTF-8 sequence"),
++        (b"\xcfa", "Invalid continuation byte in 2-byte UTF-8 sequence"),
++        (b"\xd8\xcf\xd3", "Invalid continuation byte in 2-byte UTF-8 sequence"),
++        (b"\xd2\t\x8b\x84", "Invalid continuation byte in 2-byte UTF-8 sequence"),
++        (b"\xe2\x17\xce", "Invalid continuation byte in 3-byte UTF-8 sequence"),
++        (b"\xe2a\x17\xce", "Invalid continuation byte in 3-byte UTF-8 sequence"),
++        (b"\xe2\x17a", "Invalid continuation byte in 3-byte UTF-8 sequence"),
++        (b"\xe0\x9c\xc6\xde", "Invalid continuation byte in 3-byte UTF-8 sequence"),
++        (b"\xf0H\xce\x9b", "Invalid continuation byte in 4-byte UTF-8 sequence"),
++        (b"\xf0\xce4\x9b", "Invalid continuation byte in 4-byte UTF-8 sequence"),
++        # Truncated UTF-8 sequences
++        (b"\xc3", "Unterminated UTF-8 sequence when encoding string"),
++        (b"\x8c$\xe3", "Unterminated UTF-8 sequence when encoding string"),
++        (b"\x8c\xe3$", "Unterminated UTF-8 sequence when encoding string"),
++        (b"=\x8c\xe36", "Unterminated UTF-8 sequence when encoding string"),
++        (b"\x08\x11\xe3", "Unterminated UTF-8 sequence when encoding string"),
++        (b"\xf0\x90\x94", "Unterminated UTF-8 sequence when encoding string"),
++        # Small codepoints using longer byte sequences than they need
++        (b"\xc0\xa2", "Overlong 2-byte UTF-8 sequence"),
++        (b"A\xc1\x9c", "Overlong 2-byte UTF-8 sequence"),
++        (b"\xc1\xbf", "Overlong 2-byte UTF-8 sequence"),
++        (b"N\xc0\xb4\xb4", "Overlong 2-byte UTF-8 sequence"),
++        (b"\xe0\x9d\xb3", "Overlong 3-byte UTF-8 sequence"),
++        (b"E\xe0\x9e\x8b", "Overlong 3-byte UTF-8 sequence"),
++        (b"\xe0\x9f\xbf", "Overlong 3-byte UTF-8 sequence"),
++        (b"\xf0\x80\x80\x80", "Overlong 4-byte UTF-8 sequence"),
++        (b"\xf0\x8f\xbf\xbf", "Overlong 4-byte UTF-8 sequence"),
++        (b"\xf0\x85\xa7\xbd", "Overlong 4-byte UTF-8 sequence"),
++        # Codepoints above unicode max
++        (b"\xf4\x90\x80\x80", r">U\+10FFFF in 4-byte UTF-8 sequence"),
++        (b"\xf7\x8f\x99\x90", r">U\+10FFFF in 4-byte UTF-8 sequence"),
++        (b"\xf7\xbf\xbf\xbf", r">U\+10FFFF in 4-byte UTF-8 sequence"),
++    ],
++)
++def test_dump_bytes_invalid_utf8(value, error):
++    with pytest.raises((OverflowError, UnicodeDecodeError), match=error):
++        ujson.dumps(bytes(value), reject_bytes=False)
++
++
++def test_dump_bytes_fuzz():
++    # ujson.dumps(..., reject_bytes=False) should accept or reject the same byte
++    # sequences as b"...".decode() when unpaired surrogates are allowed
++    for seed in range(10000):
++        r = random.Random(seed)
++        a = r.randbytes(r.randrange(8))
++        try:
++            expected = a.decode(errors="surrogatepass")
++        except UnicodeDecodeError:
++            with pytest.raises((UnicodeDecodeError, OverflowError)):
++                ujson.dumps(a, reject_bytes=False)
++        else:
++            actual = ujson.loads(ujson.dumps(a, reject_bytes=False))
++            assert actual == expected, (a, [bin(i) for i in a], actual, expected)
++
++
+ def test_encode_special_keys():
+     data = {None: 0, True: 1, False: 2}
+     assert ujson.dumps(data) == '{"null":0,"true":1,"false":2}'
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb
index ed08ede1d9..bd1f06acf9 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb
@@ -14,6 +14,7 @@ SRC_URI += " \
     file://CVE-2026-32875.patch \
     file://CVE-2026-32874.patch \
     file://CVE-2026-44660.patch \
+    file://CVE-2026-54911.patch \
 "
 
 DEPENDS += "python3-setuptools-scm-native"
-- 
2.35.6


