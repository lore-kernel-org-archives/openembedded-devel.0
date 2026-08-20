Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5527C5DF85
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 05:16:05 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.588.1787202959141323122
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 22:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=cowDlwkD;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12357; q=dns/txt;
  s=iport01; t=1787202959; x=1788412559;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZqX/OdSnHNU0qFEYc5oJ7NzjEodrSKqCd7lK5hpTZBw=;
  b=cowDlwkDn6I7ZMHGcKVONg+4g3B4aG+K0JKMgF1suaCOWRVLxHCMJWuu
   E1JV+BEihnbHn4IoKZmE5Y1kkuMcB4tWqzA3GYvenoO61EYKkZj1W65x4
   htk6N2dqczpDLNfWwTJIQ3etZU8SsBkDfvdFvNvZKskTz1B6mnrvRXiMf
   y4VFGpP8slMXq7XjP3yqaxvbNoasqTKx6YYIxQkvIxyIYaK6Ziikw+d0q
   NluxwcXks3AZOqGOK0v8bKghEVAMLYQZ+EoLMKA/NpLUZk0KPJ+FqbO92
   FSfRcSjxU4YdQJl09YY1jKhi2kg+gsQ4QYw9lLnTWWRNE5Zx9lBzMNZIf
   A==;
X-CSE-ConnectionGUID: eMZO4ZI/Te6UvVufSjtkAQ==
X-CSE-MsgGUID: /mBqOY+ER9i2njvu6QCk8w==
X-IPAS-Result: =?us-ascii?q?A0AnAACvi4Zq/5IQJK1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ0XkNJA4xviGxsi2eSN4F+DwEBAQ9EDQQBAYQ/Ro1tAiY0CQ4BAgQDAgMBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDYZaAQIBKgsBGAEtLAMBAk8LI?=
 =?us-ascii?q?yGDAgGCOgM3AxHCOIF5M4EBgygBgVTYSw2CWAELFAEFgTMBhT6Cf4UjXRgBh?=
 =?us-ascii?q?HwnGxuBcoEVgTuCLoEFgRpCAgIBiCIEgiKBDIFaHpFSSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4ENGwYFgR2BKIQ3Ixk2fIEJXoErKmEBEheBCYIKA?=
 =?us-ascii?q?oJwggYCAUlFDgkXCxgNSBEsNxQZBD5uB45RIIJEBwEsJigTASsXghWldqAec?=
 =?us-ascii?q?Qoog3aMIY8+hXwaM6psC5h9jgqECZFqXYRpgWg8gVlwFYMiCUoZD44qAwEKC?=
 =?us-ascii?q?4NghRPHJicyAgkDLwEBBwIHDgMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:OzTcj6PzYL9VswjvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUp21DVSx
 mdOCGzSPqmMYWDyet8gPNiwoUlS7MWHnd42QXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD+kfF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf1gm8saAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/hLPmZqD6xfxuspPH9w6
 PIjKiwORynW0opawJrjIgVtrs0nKM+uOMYUvWttiGmIS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGYxBPjDS0Un1lM/CI4+leShnFH0ciZTrxSeoq9fD237nFYgi+S0aISEEjCMbYJQtF+/l
 yHrxTX4WBcYKsHB8BGGom3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/KFpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOD9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:vYEffaFiaFNK6En0pLqExMeALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KxLGSpwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:62QOuWGjYSnrT7XmqmJq0XwzRvIENUHQkkrOHVK2MmR1S5SsHAo=
X-Talos-MUID: 9a23:Kht6TgmRLalegV9ybS+ldnolMe1xxJXtJXpckM8AudeZaxVbOGeC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="829341069"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 05:15:51 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id 779721801167B;
	Thu, 20 Aug 2026 05:13:01 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 094A9CCA79B; Wed, 19 Aug 2026 22:13:01 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-python][wrynose][PATCH] python3-ujson: Fix CVE-2026-54911
Date: Wed, 19 Aug 2026 22:12:52 -0700
Message-Id: <20260820051252.1338966-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 05:16:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129371

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix for CVE-2026-54911 to ujson
5.12.1. The upstream fix commit is referenced in [1], and the
public security advisory is referenced in [2].

[1] https://github.com/ultrajson/ultrajson/commit/169eaf36b1116fece5034ee79a7a0ef3f6deedcf
[2] https://github.com/ultrajson/ultrajson/security/advisories/GHSA-3j69-69wj-xqx2

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/python3-ujson/CVE-2026-54911.patch | 253 ++++++++++++++++++
 .../python/python3-ujson_5.12.1.bb            |   2 +
 2 files changed, 255 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ujson/CVE-2026-54911.patch

diff --git a/meta-python/recipes-devtools/python/python3-ujson/CVE-2026-54911.patch b/meta-python/recipes-devtools/python/python3-ujson/CVE-2026-54911.patch
new file mode 100644
index 0000000000..a3be97c227
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ujson/CVE-2026-54911.patch
@@ -0,0 +1,253 @@
+From 169eaf36b1116fece5034ee79a7a0ef3f6deedcf Mon Sep 17 00:00:00 2001
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
+(cherry picked from commit 169eaf36b1116fece5034ee79a7a0ef3f6deedcf)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/ujson/lib/ultrajsondec.c |  6 +--
+ src/ujson/lib/ultrajsonenc.c | 46 ++++++++++++++++++----
+ tests/test_ujson.py          | 75 ++++++++++++++++++++++++++++++++++++
+ 3 files changed, 117 insertions(+), 10 deletions(-)
+
+diff --git a/src/ujson/lib/ultrajsondec.c b/src/ujson/lib/ultrajsondec.c
+index bccb0aaf..55833763 100644
+--- a/src/ujson/lib/ultrajsondec.c
++++ b/src/ujson/lib/ultrajsondec.c
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
+diff --git a/src/ujson/lib/ultrajsonenc.c b/src/ujson/lib/ultrajsonenc.c
+index 0f9fde3f..5bafd522 100644
+--- a/src/ujson/lib/ultrajsonenc.c
++++ b/src/ujson/lib/ultrajsonenc.c
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
+index dcf97892..3c9e1a6a 100644
+--- a/tests/test_ujson.py
++++ b/tests/test_ujson.py
+@@ -1229,6 +1229,81 @@ def test_reject_bytes_nested(value):
+         ujson.dumps(value)
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
+2.53.0
+
diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.12.1.bb b/meta-python/recipes-devtools/python/python3-ujson_5.12.1.bb
index 8f8c6e23d4..89311254a8 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.12.1.bb
@@ -4,6 +4,8 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause & TCL"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1e3768cfe2662fa77c49c9c2d3804d87"
 
+SRC_URI += "file://CVE-2026-54911.patch"
+
 SRC_URI[sha256sum] = "5b7e96406c301a1366534479a7352ec40ec68bb327c0c119091635acd5925e35"
 
 inherit pypi ptest-python-pytest python_setuptools_build_meta
-- 
2.35.6


