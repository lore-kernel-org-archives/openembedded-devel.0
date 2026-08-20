Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C5BC5DF85
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 05:19:15 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.556.1787203150286865810
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 22:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hTsy3dvX;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9034; q=dns/txt;
  s=iport01; t=1787203150; x=1788412750;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=o4HNRelvX4/Jz8m5K7xR2TqJniktNP/SOjxKlC3uOUY=;
  b=hTsy3dvX+7xgyQXHe4juH1i+Bi8a1xKHgofPOtsx61rGpzvmyHez7qHS
   lFNLBmUiU5YZVS5/5gAe0EiYpGuWijMIMxHBFV8R1L74eWGHk9/euuP7w
   jJzr+ARMToxdIiH1aAKPrUaiDubE+VkKnXoT8/r10I7wLS5oFkCQL2dvv
   K5ddOuuGlpjevdCfw0R56IOqeEZarBxVxt75/Sg3d6T5MnnveUy6P6o9M
   I2ZdfyGzbYENZkYIcAJxbLuV25FhryKjj4JbclIUfo4QgykPrOD+DDgGf
   a/iSFcIP6xSN89tFJ7blDG9VfMsQfwMPREJEBKJaDGNSCq+EqppFut24l
   Q==;
X-CSE-ConnectionGUID: eGr32raySPyjBrNZ0HOzSw==
X-CSE-MsgGUID: AccbY9O8TCuWEHnXvR5jSg==
X-IPAS-Result: =?us-ascii?q?A0BGAgADjoZq/4oQJK1aglmCV3ReQ0mWSotnkjeBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGEP0aNbQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBKgsBGAEtLAMBAk8LIyGDAgGCOgM3AxHCSIF5M4EBgygBP?=
 =?us-ascii?q?wJDUNhLDYJYAQsUAQWBM4U/gn+FI10YAYR8JxsbgXKBFYNpgQWBGkIBAYFCD?=
 =?us-ascii?q?4ZUBIIiehKBWoEtkENIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bB?=
 =?us-ascii?q?gWBHYEohDcjGTZ8gQlegSsqYQESF4EJggoCgnCCBgIBSUUOCRcLGA1IESw3F?=
 =?us-ascii?q?BkEPm4HjlEggkuBCQUBK4EFfygWkyEBkB2CIaAecQoog3aMIY8+hXwaM6psC?=
 =?us-ascii?q?5h9jgqECZJHhGmBaDyBRwsHcBU7gmcJShkPji0LC4NggX/KOicyAgkyAQEHA?=
 =?us-ascii?q?gcOAwuBaJACgXwBAQ?=
IronPort-Data: A9a23:poAJo6r02CP4FprsZ01OfqysUDBeBmJLZBIvgKrLsJaIsI4StFCzt
 garIBnUMv/eNjD8KN93OYy2/BhSvMOEx9dnTQM+pX1kQnhDouPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrT8UI35pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0utYGzoU7
 /UJEwgcbDqZodDu4JWpcfY506zPLOGzVG8eknhkyTecCbMtRorOBv2To9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwxHYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9KoXRG5gLxBnHz
 o7A103yCRsrZfvP9RGYzV+MgN/Rp375Y41HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwAiJzqyR50OSAXIJC2YYLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWrvYHh9wbMqDcPccTY43g==
IronPort-HdrOrdr: A9a23:S06Zqa29QVnrHFjQ7FbMmQqjBJ4kLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKhTbaknDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:yInd22Cfdt30Cq36EyRI7hVOAMk0SUXMzl3KBX3gKUF7c6LAHA==
X-Talos-MUID: 9a23:ylaJPwW4DcmUet7q/BbnjztTZeA434+zN20tl6UYgZSGDiMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="813656277"
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 05:18:45 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id C656318009018;
	Thu, 20 Aug 2026 05:16:32 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 66AA3CC12A6; Wed, 19 Aug 2026 22:16:32 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-python][scarthgap][PATCH 1/4] python3-ujson: Fix CVE-2026-32875
Date: Wed, 19 Aug 2026 22:16:27 -0700
Message-Id: <20260820051630.63383-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 05:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129373

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix referenced in [2], using the
commit shown in [1].

[1] https://github.com/ultrajson/ultrajson/commit/486bd4553dc471a1de11613bc7347a6b318e37ea
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-32875

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/python3-ujson/CVE-2026-32875.patch | 199 ++++++++++++++++++
 .../python/python3-ujson_5.9.0.bb             |   1 +
 2 files changed, 200 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ujson/CVE-2026-32875.patch

diff --git a/meta-python/recipes-devtools/python/python3-ujson/CVE-2026-32875.patch b/meta-python/recipes-devtools/python/python3-ujson/CVE-2026-32875.patch
new file mode 100644
index 0000000000..5727412835
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ujson/CVE-2026-32875.patch
@@ -0,0 +1,199 @@
+From efe3a00499a74ff44867711f40f9bcc279d2ea92 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Br=C3=A9nainn=20Woodsend?= <bwoodsend@gmail.com>
+Date: Wed, 4 Mar 2026 22:28:11 +0000
+Subject: [PATCH] Fix buffer overflow/infinite loop from indent handling
+
+If indent * nest depth is large enough to overflow an int, it causes the
+required output buffer size to be underestimated leading to a buffer
+overflow.
+
+The offending arithmetic is upgraded to a ptrdiff_t and indent is
+artificially capped. An overflow is still technically possible given a
+high enough recursion depth but not without first consuming petabytes of
+RAM.
+
+If indent is negative, it causes a size_t to underflow to some number a
+little bellow size_t max. If that underflow isn't accidentally rectified
+by a subsequent overflow (if -indent * (nest_depth + 1) >
+current_buffer_size) then the buffer up-sizer gets stuck in an infinite
+loop trying to find a power of two that fits in a size_t but is greater
+that size_t max / 2.
+
+It's hard to tell if `ujson.dumps(..., indent=-1)` was ever an
+intentional feature but I don't feel comfortable breaking it in a
+security fix. For now, the dubious *any negative indent -> pad colons
+but add no indentation or newlines* behaviour is preserved but
+internally the indent is clipped to -1 and all subsequent indentation
+code paths are skipped over.
+
+CVE: CVE-2026-32875
+Upstream-Status: Backport [https://github.com/ultrajson/ultrajson/commit/486bd4553dc471a1de11613bc7347a6b318e37ea]
+
+Backport Changes:
+- Adjusted source paths for ujson 5.9.0's pre-src-layout tree.
+
+(cherry picked from commit 486bd4553dc471a1de11613bc7347a6b318e37ea)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ lib/ultrajson.h     |  3 ++-
+ lib/ultrajsonenc.c  | 16 +++++++++-------
+ python/objToJSON.c  | 16 +++++++++++++++-
+ tests/test_ujson.py | 20 ++++++++++++++++++--
+ 4 files changed, 44 insertions(+), 11 deletions(-)
+
+diff --git a/lib/ultrajson.h b/lib/ultrajson.h
+index 143cd9e..4560f4d 100644
+--- a/lib/ultrajson.h
++++ b/lib/ultrajson.h
+@@ -54,6 +54,7 @@ tree doesn't have cyclic references.
+ #define __ULTRAJSON_H__
+ 
+ #include <stdio.h>
++#include <stddef.h>
+ 
+ // Max decimals to encode double floating point numbers with
+ #ifndef JSON_DOUBLE_MAX_DECIMALS
+@@ -257,7 +258,7 @@ typedef struct __JSONObjectEncoder
+ 
+   /*
+   Configuration for spaces of indent */
+-  int indent;
++  ptrdiff_t indent;
+ 
+   /*
+   If true, NaN will be encoded as a string matching the Python standard library's JSON behavior.
+diff --git a/lib/ultrajsonenc.c b/lib/ultrajsonenc.c
+index 9ec2faf..0f9fde3 100644
+--- a/lib/ultrajsonenc.c
++++ b/lib/ultrajsonenc.c
+@@ -575,7 +575,7 @@ static void Buffer_AppendIndentNewlineUnchecked(JSONObjectEncoder *enc)
+ 
+ static void Buffer_AppendIndentUnchecked(JSONObjectEncoder *enc, JSINT32 value)
+ {
+-  int i;
++  ptrdiff_t i;
+   if (enc->indent > 0)
+     while (value-- > 0)
+       for (i = 0; i < enc->indent; i++)
+@@ -741,10 +741,11 @@ static void encode(JSOBJ obj, JSONObjectEncoder *enc, const char *name, size_t c
+ 
+       Buffer_AppendCharUnchecked (enc, '[');
+ 
++      // The extra 1 byte covers the optional newline.
++      size_t per_item_reserve = (enc->indent > 0 ? enc->indent : 0) * (enc->level + 1) + enc->itemSeparatorLength + 1;
+       while (enc->iterNext(obj, &tc))
+       {
+-        // The extra 1 byte covers the optional newline.
+-        Buffer_Reserve (enc, enc->indent * (enc->level + 1) + enc->itemSeparatorLength + 1);
++        Buffer_Reserve (enc, per_item_reserve);
+ 
+         if (count > 0)
+         {
+@@ -769,7 +770,7 @@ static void encode(JSOBJ obj, JSONObjectEncoder *enc, const char *name, size_t c
+ 
+       enc->iterEnd(obj, &tc);
+ 
+-      if (count > 0) {
++      if (count > 0 && enc->indent > 0) {
+         // Reserve space for the indentation plus the newline.
+         Buffer_Reserve (enc, enc->indent * enc->level + 1);
+         Buffer_AppendIndentNewlineUnchecked (enc);
+@@ -786,10 +787,11 @@ static void encode(JSOBJ obj, JSONObjectEncoder *enc, const char *name, size_t c
+ 
+       Buffer_AppendCharUnchecked (enc, '{');
+ 
++      // The extra 1 byte covers the optional newline.
++      size_t reserve_size = (enc->indent > 0 ? enc->indent : 0) * (enc->level + 1) + enc->itemSeparatorLength + 1;
+       while ((res = enc->iterNext(obj, &tc)))
+       {
+-        // The extra 1 byte covers the optional newline.
+-        Buffer_Reserve (enc, enc->indent * (enc->level + 1) + enc->itemSeparatorLength + 1);
++        Buffer_Reserve (enc, reserve_size);
+ 
+         if(res < 0)
+         {
+@@ -823,7 +825,7 @@ static void encode(JSOBJ obj, JSONObjectEncoder *enc, const char *name, size_t c
+ 
+       enc->iterEnd(obj, &tc);
+ 
+-      if (count > 0) {
++      if (count > 0 && enc->indent > 0) {
+         Buffer_Reserve (enc, enc->indent * enc->level + 1);
+         Buffer_AppendIndentNewlineUnchecked (enc);
+         Buffer_AppendIndentUnchecked (enc, enc->level);
+diff --git a/python/objToJSON.c b/python/objToJSON.c
+index b754819..9013205 100644
+--- a/python/objToJSON.c
++++ b/python/objToJSON.c
+@@ -678,6 +678,7 @@ PyObject* objToJSON(PyObject* self, PyObject *args, PyObject *kwargs)
+   PyObject *separatorsKeyBytes = NULL;
+   int allowNan = -1;
+   int orejectBytes = -1;
++  int indent = 0;
+   size_t retLen;
+ 
+   JSONObjectEncoder encoder =
+@@ -714,7 +715,7 @@ PyObject* objToJSON(PyObject* self, PyObject *args, PyObject *kwargs)
+ 
+   PRINTMARK();
+ 
+-  if (!PyArg_ParseTupleAndKeywords(args, kwargs, "O|OOOOiiiOO", kwlist, &oinput, &oensureAscii, &oencodeHTMLChars, &oescapeForwardSlashes, &osortKeys, &encoder.indent, &allowNan, &orejectBytes, &odefaultFn, &oseparators))
++  if (!PyArg_ParseTupleAndKeywords(args, kwargs, "O|OOOOiiiOO", kwlist, &oinput, &oensureAscii, &oencodeHTMLChars, &oescapeForwardSlashes, &osortKeys, &indent, &allowNan, &orejectBytes, &odefaultFn, &oseparators))
+   {
+     return NULL;
+   }
+@@ -761,6 +762,19 @@ PyObject* objToJSON(PyObject* self, PyObject *args, PyObject *kwargs)
+     encoder.rejectBytes = orejectBytes;
+   }
+ 
++  if (indent < -1)
++  {
++    encoder.indent = -1;
++  }
++  else if (indent > 1000)
++  {
++    PyErr_SetString(PyExc_ValueError, "Maximum allowed indentation is 1000");
++    return NULL;
++  }
++  else {
++    encoder.indent = indent;
++  }
++
+   if (oseparators != NULL && oseparators != Py_None)
+   {
+     if (!PyTuple_Check(oseparators))
+diff --git a/tests/test_ujson.py b/tests/test_ujson.py
+index 506666d..d24edb0 100644
+--- a/tests/test_ujson.py
++++ b/tests/test_ujson.py
+@@ -1050,9 +1050,25 @@ def test_default_function():
+         ujson.dumps(unjsonable_obj, default=default)
+ 
+ 
+-@pytest.mark.parametrize("indent", list(range(65537, 65542)))
++@pytest.mark.parametrize("indent", [999, 1000, 1001, 1 << 30, 1 << 63, 1 << 128])
+ def test_dump_huge_indent(indent):
+-    ujson.encode({"a": True}, indent=indent)
++    obj = {"list": [1, [2, 3], 4], "nested": {"key": "value", "a": True}}
++    if indent <= 1000:
++        assert ujson.loads(ujson.encode(obj, indent=indent)) == obj
++    else:
++        with pytest.raises((ValueError, OverflowError)):
++            ujson.encode(obj, indent=indent)
++
++
++def test_negative_indent():
++    obj = {"a": [1, 2], "b": "c"}
++    assert ujson.dumps(obj) == '{"a":[1,2],"b":"c"}'
++    assert ujson.dumps(obj, 0) == '{"a":[1,2],"b":"c"}'
++    assert ujson.dumps(obj, indent=-1) == '{"a": [1,2],"b": "c"}'
++    assert ujson.dumps(obj, indent=-1000000) == '{"a": [1,2],"b": "c"}'
++    assert (
++        ujson.dumps(obj, indent=2) == '{\n  "a": [\n    1,\n    2\n  ],\n  "b": "c"\n}'
++    )
+ 
+ 
+ @pytest.mark.parametrize("first_length", list(range(2, 7)))
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb
index b5f6be9f27..c6b69790e8 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb
@@ -11,6 +11,7 @@ inherit pypi ptest setuptools3
 SRC_URI += " \
     file://run-ptest \
     file://0001-setup.py-Do-not-strip-debugging-symbols.patch \
+    file://CVE-2026-32875.patch \
 "
 
 DEPENDS += "python3-setuptools-scm-native"
-- 
2.35.6


