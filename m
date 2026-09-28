Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA9ACA5FA9
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:43:41 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63547.1790617412808715790
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iikwWiDt;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=27722; q=dns/txt;
  s=iport01; t=1790617412; x=1791827012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MTwyhpBoJ1jMxdxbaQ00Qpnflg2ZdyqOZZF27rnf8w8=;
  b=iikwWiDt7eS3wJMtygk0aUBD0nENXGnb1UFmvSj8JOIhxsmquW83cl21
   Ip1uwn7bOQQ2Qx59lZLnRMNjXhJsinKi2slSf4ZEgie728Ey6ol29iEIt
   IEdyIWYV+sVM2Z3cCVbGD9PpgOcRU415+Igsx//WPkNoMQzOq33AAXH2z
   OT37ZYq+rXr2txkTa7ut+b997LJCg014DnH7cLo5YhlSCi3QHgAdgWbZF
   fgpJh6AUz4tJmdUqehfBsB0gUqc6SauEyUPqVen+7UficbMjiRyFnHaUp
   bl+U6mxKR7OFvl9AGcMFMWcyVTrGlNniNhEiGpgbys0gb0Dr4EiTnXtGI
   Q==;
X-CSE-ConnectionGUID: Ke73kV/QTYuHOL0WiV3YNA==
X-CSE-MsgGUID: NhSnme1QRMiDnn9XscOR9Q==
X-IPAS-Result: =?us-ascii?q?A0AaAABOprpq/5X/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YENJjHKJWAOeGoF+DwEBAQ9EDQQBAYQ/RgKOCQImNAkOAQIEA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECAQMaDQsBGAEbE?=
 =?us-ascii?q?hAcAwECLysjCBmDAgGCdAMRwleBeTOBAYMpAT8CQ1DbMgELFAGBOAGFP4gjX?=
 =?us-ascii?q?RgBRIQ4JxsbgXKBFYNpgQWBXAEBiCUEgiKBDIFak0NIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XgQcbBgWBHYEgghkjGTZ6gQlegSspYAEQF4EHggcCg?=
 =?us-ascii?q?lSCAQIBSUMOB0VTCSVBChJHJiIIEgkBExowC4EhOEEJKBEYDUgRLDcVGQQ+b?=
 =?us-ascii?q?geQLh6CZQGBDQEqAX8ZQnCTGgeQFoIhoQ8KKIN2jCKVOhozqm8LmH2OCpZQh?=
 =?us-ascii?q?GmBaDyBRwsHcBWDIglKGQ+OKw4Lg2CBf8o6JzICCTIBAQcCBw4DC4FokAItg?=
 =?us-ascii?q?U8BAQ?=
IronPort-Data: A9a23:k+xXoakzgiLbkMCj2438jHDo5gzRJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdWj/VPPzcNGH2e9Fzb9i38UsCuZfXxoJiTgpqqSs8HltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDpFsfLb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fa4Vpb10PyZ3y
 c0FCBcpNi+CubmH5pvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMmZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTaz/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKII4DRHJQKwBnwS
 mTu2WTCBBQXbeWl7Dup9HT9tvTEuhmqYddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBF2QHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:qQviRa5X0ZnDXgoyLwPXwOrXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: 9a23:HtHCTmM7SmHuyu5DeyQ4r00qXfkZQ2D961OIHE6GUldPYejA
X-Talos-MUID: 9a23:tlTbsAYz1j9jC+BTkT/XgjRvbf5SxqWCDkZcoY4NnPPVDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,128,1787011200"; 
   d="scan'208";a="514319767"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Sep 2026 17:43:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 7E87C180001D4;
	Mon, 28 Sep 2026 17:43:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 23F3ACBF201; Mon, 28 Sep 2026 10:43:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 01/13] python3-aiohttp: fix CVE-2026-34519
Date: Mon, 28 Sep 2026 10:43:11 -0700
Message-Id: <20260928174323.1810308-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260928174323.1810308-1-dkelaiya@cisco.com>
References: <20260928174323.1810308-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 17:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130448

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream stable-branch fix in [1], which
backports the original upstream commit in [2]. The advisory
identifying the fix is referenced in [3].

[1] https://github.com/aio-libs/aiohttp/commit/53b35a2f8869c37a133e60bf1a82a1c01642ba2b
[2] https://github.com/aio-libs/aiohttp/commit/18510482de080bf741c560bf2a190fdc54b4eed4
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-34519

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python3-aiohttp/CVE-2026-34519.patch      | 638 ++++++++++++++++++
 .../python/python3-aiohttp_3.9.5.bb           |   1 +
 2 files changed, 639 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34519.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34519.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34519.patch
new file mode 100644
index 0000000000..b4d2a39352
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34519.patch
@@ -0,0 +1,638 @@
+From 0eb0a867fe5a9071b885c60ada894dc11da5f858 Mon Sep 17 00:00:00 2001
+From: Sam Bull <git@sambull.org>
+Date: Sat, 7 Mar 2026 19:00:02 +0000
+Subject: [PATCH] Restrict reason (#12209) (#12212)
+
+CVE: CVE-2026-34519
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/53b35a2f8869c37a133e60bf1a82a1c01642ba2b]
+
+Backport Changes:
+- Replaced the upstream _write_str_raise_on_nlcr() call with the
+  existing _safe_header(status_line) implementation because
+  aiohttp 3.9.5 does not provide _write_str_raise_on_nlcr().
+- Added CR/LF validation in web_response.py because aiohttp 3.9.5
+  lacks the upstream LF-only reason check, while retaining its existing
+  HTTPStatus phrase lookup and set_status implementation.
+- Adapted the upstream regression tests to the aiohttp 3.9.5 imports
+  and test signatures, and added coverage for status-line
+  serialization.
+- Regenerated _http_writer.c with Cython 3.0.5 because the accelerated
+  build uses the checked-in generated source.
+
+(cherry picked from commit 18510482de080bf741c560bf2a190fdc54b4eed4)
+
+---------
+
+Co-authored-by: Dhiral Vyas <dhiral@users.noreply.github.com>
+(cherry picked from commit 53b35a2f8869c37a133e60bf1a82a1c01642ba2b)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ aiohttp/_http_writer.c       | 147 ++++++++++++++++++++++++++-----------------------
+ aiohttp/_http_writer.pyx     |   1 +
+ aiohttp/http_writer.py       |   1 +
+ aiohttp/web_exceptions.py    |   2 ++
+ aiohttp/web_response.py      |   2 ++
+ tests/test_web_exceptions.py |  15 +++++++++++++++
+ tests/test_web_response.py   |  26 ++++++++++++++++++++++++++
+ 7 files changed, 130 insertions(+), 70 deletions(-)
+
+diff --git a/aiohttp/_http_writer.pyx b/aiohttp/_http_writer.pyx
+index eff852195..24e5bb752 100644
+--- a/aiohttp/_http_writer.pyx
++++ b/aiohttp/_http_writer.pyx
+@@ -131,6 +131,7 @@ def _serialize_headers(str status_line, headers):
+         _safe_header(to_str(key))
+         _safe_header(to_str(val))
+ 
++    _safe_header(status_line)
+     try:
+         if _write_str(&writer, status_line) < 0:
+             raise
+diff --git a/aiohttp/_http_writer.c b/aiohttp/_http_writer.c
+index 74bc210ea..7eecc2940 100644
+--- a/aiohttp/_http_writer.c
++++ b/aiohttp/_http_writer.c
+@@ -3852,7 +3852,7 @@ static PyObject *__pyx_pf_7aiohttp_12_http_writer__serialize_headers(CYTHON_UNUS
+  *         _safe_header(to_str(key))
+  *         _safe_header(to_str(val))             # <<<<<<<<<<<<<<
+  * 
+- *     try:
++ *     _safe_header(status_line)
+  */
+     __pyx_t_6 = __pyx_f_7aiohttp_12_http_writer_to_str(__pyx_v_val); if (unlikely(!__pyx_t_6)) __PYX_ERR(0, 132, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_6);
+@@ -3864,34 +3864,43 @@ static PyObject *__pyx_pf_7aiohttp_12_http_writer__serialize_headers(CYTHON_UNUS
+   /* "aiohttp/_http_writer.pyx":134
+  *         _safe_header(to_str(val))
+  * 
++ *     _safe_header(status_line)             # <<<<<<<<<<<<<<
++ *     try:
++ *         if _write_str(&writer, status_line) < 0:
++ */
++  __pyx_f_7aiohttp_12_http_writer__safe_header(__pyx_v_status_line); if (unlikely(PyErr_Occurred())) __PYX_ERR(0, 134, __pyx_L1_error)
++
++  /* "aiohttp/_http_writer.pyx":135
++ * 
++ *     _safe_header(status_line)
+  *     try:             # <<<<<<<<<<<<<<
+  *         if _write_str(&writer, status_line) < 0:
+  *             raise
+  */
+   /*try:*/ {
+ 
+-    /* "aiohttp/_http_writer.pyx":135
+- * 
++    /* "aiohttp/_http_writer.pyx":136
++ *     _safe_header(status_line)
+  *     try:
+  *         if _write_str(&writer, status_line) < 0:             # <<<<<<<<<<<<<<
+  *             raise
+  *         if _write_byte(&writer, b'\r') < 0:
+  */
+-    __pyx_t_4 = __pyx_f_7aiohttp_12_http_writer__write_str((&__pyx_v_writer), __pyx_v_status_line); if (unlikely(__pyx_t_4 == ((int)-1) && PyErr_Occurred())) __PYX_ERR(0, 135, __pyx_L6_error)
++    __pyx_t_4 = __pyx_f_7aiohttp_12_http_writer__write_str((&__pyx_v_writer), __pyx_v_status_line); if (unlikely(__pyx_t_4 == ((int)-1) && PyErr_Occurred())) __PYX_ERR(0, 136, __pyx_L6_error)
+     __pyx_t_8 = (__pyx_t_4 < 0);
+     if (unlikely(__pyx_t_8)) {
+ 
+-      /* "aiohttp/_http_writer.pyx":136
++      /* "aiohttp/_http_writer.pyx":137
+  *     try:
+  *         if _write_str(&writer, status_line) < 0:
+  *             raise             # <<<<<<<<<<<<<<
+  *         if _write_byte(&writer, b'\r') < 0:
+  *             raise
+  */
+-      __Pyx_ReraiseException(); __PYX_ERR(0, 136, __pyx_L6_error)
++      __Pyx_ReraiseException(); __PYX_ERR(0, 137, __pyx_L6_error)
+ 
+-      /* "aiohttp/_http_writer.pyx":135
+- * 
++      /* "aiohttp/_http_writer.pyx":136
++ *     _safe_header(status_line)
+  *     try:
+  *         if _write_str(&writer, status_line) < 0:             # <<<<<<<<<<<<<<
+  *             raise
+@@ -3899,27 +3908,27 @@ static PyObject *__pyx_pf_7aiohttp_12_http_writer__serialize_headers(CYTHON_UNUS
+  */
+     }
+ 
+-    /* "aiohttp/_http_writer.pyx":137
++    /* "aiohttp/_http_writer.pyx":138
+  *         if _write_str(&writer, status_line) < 0:
+  *             raise
+  *         if _write_byte(&writer, b'\r') < 0:             # <<<<<<<<<<<<<<
+  *             raise
+  *         if _write_byte(&writer, b'\n') < 0:
+  */
+-    __pyx_t_4 = __pyx_f_7aiohttp_12_http_writer__write_byte((&__pyx_v_writer), '\r'); if (unlikely(__pyx_t_4 == ((int)-1) && PyErr_Occurred())) __PYX_ERR(0, 137, __pyx_L6_error)
++    __pyx_t_4 = __pyx_f_7aiohttp_12_http_writer__write_byte((&__pyx_v_writer), '\r'); if (unlikely(__pyx_t_4 == ((int)-1) && PyErr_Occurred())) __PYX_ERR(0, 138, __pyx_L6_error)
+     __pyx_t_8 = (__pyx_t_4 < 0);
+     if (unlikely(__pyx_t_8)) {
+ 
+-      /* "aiohttp/_http_writer.pyx":138
++      /* "aiohttp/_http_writer.pyx":139
+  *             raise
+  *         if _write_byte(&writer, b'\r') < 0:
+  *             raise             # <<<<<<<<<<<<<<
+  *         if _write_byte(&writer, b'\n') < 0:
+  *             raise
+  */
+-      __Pyx_ReraiseException(); __PYX_ERR(0, 138, __pyx_L6_error)
++      __Pyx_ReraiseException(); __PYX_ERR(0, 139, __pyx_L6_error)
+ 
+-      /* "aiohttp/_http_writer.pyx":137
++      /* "aiohttp/_http_writer.pyx":138
+  *         if _write_str(&writer, status_line) < 0:
+  *             raise
+  *         if _write_byte(&writer, b'\r') < 0:             # <<<<<<<<<<<<<<
+@@ -3928,27 +3937,27 @@ static PyObject *__pyx_pf_7aiohttp_12_http_writer__serialize_headers(CYTHON_UNUS
+  */
+     }
+ 
+-    /* "aiohttp/_http_writer.pyx":139
++    /* "aiohttp/_http_writer.pyx":140
+  *         if _write_byte(&writer, b'\r') < 0:
+  *             raise
+  *         if _write_byte(&writer, b'\n') < 0:             # <<<<<<<<<<<<<<
+  *             raise
+  * 
+  */
+-    __pyx_t_4 = __pyx_f_7aiohttp_12_http_writer__write_byte((&__pyx_v_writer), '\n'); if (unlikely(__pyx_t_4 == ((int)-1) && PyErr_Occurred())) __PYX_ERR(0, 139, __pyx_L6_error)
++    __pyx_t_4 = __pyx_f_7aiohttp_12_http_writer__write_byte((&__pyx_v_writer), '\n'); if (unlikely(__pyx_t_4 == ((int)-1) && PyErr_Occurred())) __PYX_ERR(0, 140, __pyx_L6_error)
+     __pyx_t_8 = (__pyx_t_4 < 0);
+     if (unlikely(__pyx_t_8)) {
+ 
+-      /* "aiohttp/_http_writer.pyx":140
++      /* "aiohttp/_http_writer.pyx":141
+  *             raise
+  *         if _write_byte(&writer, b'\n') < 0:
+  *             raise             # <<<<<<<<<<<<<<
+  * 
+  *         for key, val in headers.items():
+  */
+-      __Pyx_ReraiseException(); __PYX_ERR(0, 140, __pyx_L6_error)
++      __Pyx_ReraiseException(); __PYX_ERR(0, 141, __pyx_L6_error)
+ 
+-      /* "aiohttp/_http_writer.pyx":139
++      /* "aiohttp/_http_writer.pyx":140
+  *         if _write_byte(&writer, b'\r') < 0:
+  *             raise
+  *         if _write_byte(&writer, b'\n') < 0:             # <<<<<<<<<<<<<<
+@@ -3957,7 +3966,7 @@ static PyObject *__pyx_pf_7aiohttp_12_http_writer__serialize_headers(CYTHON_UNUS
+  */
+     }
+ 
+-    /* "aiohttp/_http_writer.pyx":142
++    /* "aiohttp/_http_writer.pyx":143
+  *             raise
+  * 
+  *         for key, val in headers.items():             # <<<<<<<<<<<<<<
+@@ -3967,9 +3976,9 @@ static PyObject *__pyx_pf_7aiohttp_12_http_writer__serialize_headers(CYTHON_UNUS
+     __pyx_t_3 = 0;
+     if (unlikely(__pyx_v_headers == Py_None)) {
+       PyErr_Format(PyExc_AttributeError, "'NoneType' object has no attribute '%.30s'", "items");
+-      __PYX_ERR(0, 142, __pyx_L6_error)
++      __PYX_ERR(0, 143, __pyx_L6_error)
+     }
+-    __pyx_t_6 = __Pyx_dict_iterator(__pyx_v_headers, 0, __pyx_n_s_items, (&__pyx_t_2), (&__pyx_t_4)); if (unlikely(!__pyx_t_6)) __PYX_ERR(0, 142, __pyx_L6_error)
++    __pyx_t_6 = __Pyx_dict_iterator(__pyx_v_headers, 0, __pyx_n_s_items, (&__pyx_t_2), (&__pyx_t_4)); if (unlikely(!__pyx_t_6)) __PYX_ERR(0, 143, __pyx_L6_error)
+     __Pyx_GOTREF(__pyx_t_6);
+     __Pyx_XDECREF(__pyx_t_1);
+     __pyx_t_1 = __pyx_t_6;
+@@ -3977,7 +3986,7 @@ static PyObject *__pyx_pf_7aiohttp_12_http_writer__serialize_headers(CYTHON_UNUS
+     while (1) {
+       __pyx_t_7 = __Pyx_dict_iter_next(__pyx_t_1, __pyx_t_2, &__pyx_t_3, &__pyx_t_6, &__pyx_t_5, NULL, __pyx_t_4);
+       if (unlikely(__pyx_t_7 == 0)) break;
+-      if (unlikely(__pyx_t_7 == -1)) __PYX_ERR(0, 142, __pyx_L6_error)
++      if (unlikely(__pyx_t_7 == -1)) __PYX_ERR(0, 143, __pyx_L6_error)
+       __Pyx_GOTREF(__pyx_t_6);
+       __Pyx_GOTREF(__pyx_t_5);
+       __Pyx_XDECREF_SET(__pyx_v_key, __pyx_t_6);
+@@ -3985,30 +3994,30 @@ static PyObject *__pyx_pf_7aiohttp_12_http_writer__serialize_headers(CYTHON_UNUS
+       __Pyx_XDECREF_SET(__pyx_v_val, __pyx_t_5);
+       __pyx_t_5 = 0;
+ 
+-      /* "aiohttp/_http_writer.pyx":143
++      /* "aiohttp/_http_writer.pyx":144
+  * 
+  *         for key, val in headers.items():
+  *             if _write_str(&writer, to_str(key)) < 0:             # <<<<<<<<<<<<<<
+  *                 raise
+  *             if _write_byte(&writer, b':') < 0:
+  */
+-      __pyx_t_5 = __pyx_f_7aiohttp_12_http_writer_to_str(__pyx_v_key); if (unlikely(!__pyx_t_5)) __PYX_ERR(0, 143, __pyx_L6_error)
++      __pyx_t_5 = __pyx_f_7aiohttp_12_http_writer_to_str(__pyx_v_key); if (unlikely(!__pyx_t_5)) __PYX_ERR(0, 144, __pyx_L6_error)
+       __Pyx_GOTREF(__pyx_t_5);
+-      __pyx_t_7 = __pyx_f_7aiohttp_12_http_writer__write_str((&__pyx_v_writer), ((PyObject*)__pyx_t_5)); if (unlikely(__pyx_t_7 == ((int)-1) && PyErr_Occurred())) __PYX_ERR(0, 143, __pyx_L6_error)
++      __pyx_t_7 = __pyx_f_7aiohttp_12_http_writer__write_str((&__pyx_v_writer), ((PyObject*)__pyx_t_5)); if (unlikely(__pyx_t_7 == ((int)-1) && PyErr_Occurred())) __PYX_ERR(0, 144, __pyx_L6_error)
+       __Pyx_DECREF(__pyx_t_5); __pyx_t_5 = 0;
+       __pyx_t_8 = (__pyx_t_7 < 0);
+       if (unlikely(__pyx_t_8)) {
+ 
+-        /* "aiohttp/_http_writer.pyx":144
++        /* "aiohttp/_http_writer.pyx":145
+  *         for key, val in headers.items():
+  *             if _write_str(&writer, to_str(key)) < 0:
+  *                 raise             # <<<<<<<<<<<<<<
+  *             if _write_byte(&writer, b':') < 0:
+  *                 raise
+  */
+-        __Pyx_ReraiseException(); __PYX_ERR(0, 144, __pyx_L6_error)
++        __Pyx_ReraiseException(); __PYX_ERR(0, 145, __pyx_L6_error)
+ 
+-        /* "aiohttp/_http_writer.pyx":143
++        /* "aiohttp/_http_writer.pyx":144
+  * 
+  *         for key, val in headers.items():
+  *             if _write_str(&writer, to_str(key)) < 0:             # <<<<<<<<<<<<<<
+@@ -4017,27 +4026,27 @@ static PyObject *__pyx_pf_7aiohttp_12_http_writer__serialize_headers(CYTHON_UNUS
+  */
+       }
+ 
+-      /* "aiohttp/_http_writer.pyx":145
++      /* "aiohttp/_http_writer.pyx":146
+  *             if _write_str(&writer, to_str(key)) < 0:
+  *                 raise
+  *             if _write_byte(&writer, b':') < 0:             # <<<<<<<<<<<<<<
+  *                 raise
+  *             if _write_byte(&writer, b' ') < 0:
+  */
+-      __pyx_t_7 = __pyx_f_7aiohttp_12_http_writer__write_byte((&__pyx_v_writer), ':'); if (unlikely(__pyx_t_7 == ((int)-1) && PyErr_Occurred())) __PYX_ERR(0, 145, __pyx_L6_error)
++      __pyx_t_7 = __pyx_f_7aiohttp_12_http_writer__write_byte((&__pyx_v_writer), ':'); if (unlikely(__pyx_t_7 == ((int)-1) && PyErr_Occurred())) __PYX_ERR(0, 146, __pyx_L6_error)
+       __pyx_t_8 = (__pyx_t_7 < 0);
+       if (unlikely(__pyx_t_8)) {
+ 
+-        /* "aiohttp/_http_writer.pyx":146
++        /* "aiohttp/_http_writer.pyx":147
+  *                 raise
+  *             if _write_byte(&writer, b':') < 0:
+  *                 raise             # <<<<<<<<<<<<<<
+  *             if _write_byte(&writer, b' ') < 0:
+  *                 raise
+  */
+-        __Pyx_ReraiseException(); __PYX_ERR(0, 146, __pyx_L6_error)
++        __Pyx_ReraiseException(); __PYX_ERR(0, 147, __pyx_L6_error)
+ 
+-        /* "aiohttp/_http_writer.pyx":145
++        /* "aiohttp/_http_writer.pyx":146
+  *             if _write_str(&writer, to_str(key)) < 0:
+  *                 raise
+  *             if _write_byte(&writer, b':') < 0:             # <<<<<<<<<<<<<<
+@@ -4046,27 +4055,27 @@ static PyObject *__pyx_pf_7aiohttp_12_http_writer__serialize_headers(CYTHON_UNUS
+  */
+       }
+ 
+-      /* "aiohttp/_http_writer.pyx":147
++      /* "aiohttp/_http_writer.pyx":148
+  *             if _write_byte(&writer, b':') < 0:
+  *                 raise
+  *             if _write_byte(&writer, b' ') < 0:             # <<<<<<<<<<<<<<
+  *                 raise
+  *             if _write_str(&writer, to_str(val)) < 0:
+  */
+-      __pyx_t_7 = __pyx_f_7aiohttp_12_http_writer__write_byte((&__pyx_v_writer), ' '); if (unlikely(__pyx_t_7 == ((int)-1) && PyErr_Occurred())) __PYX_ERR(0, 147, __pyx_L6_error)
++      __pyx_t_7 = __pyx_f_7aiohttp_12_http_writer__write_byte((&__pyx_v_writer), ' '); if (unlikely(__pyx_t_7 == ((int)-1) && PyErr_Occurred())) __PYX_ERR(0, 148, __pyx_L6_error)
+       __pyx_t_8 = (__pyx_t_7 < 0);
+       if (unlikely(__pyx_t_8)) {
+ 
+-        /* "aiohttp/_http_writer.pyx":148
++        /* "aiohttp/_http_writer.pyx":149
+  *                 raise
+  *             if _write_byte(&writer, b' ') < 0:
+  *                 raise             # <<<<<<<<<<<<<<
+  *             if _write_str(&writer, to_str(val)) < 0:
+  *                 raise
+  */
+-        __Pyx_ReraiseException(); __PYX_ERR(0, 148, __pyx_L6_error)
++        __Pyx_ReraiseException(); __PYX_ERR(0, 149, __pyx_L6_error)
+ 
+-        /* "aiohttp/_http_writer.pyx":147
++        /* "aiohttp/_http_writer.pyx":148
+  *             if _write_byte(&writer, b':') < 0:
+  *                 raise
+  *             if _write_byte(&writer, b' ') < 0:             # <<<<<<<<<<<<<<
+@@ -4075,30 +4084,30 @@ static PyObject *__pyx_pf_7aiohttp_12_http_writer__serialize_headers(CYTHON_UNUS
+  */
+       }
+ 
+-      /* "aiohttp/_http_writer.pyx":149
++      /* "aiohttp/_http_writer.pyx":150
+  *             if _write_byte(&writer, b' ') < 0:
+  *                 raise
+  *             if _write_str(&writer, to_str(val)) < 0:             # <<<<<<<<<<<<<<
+  *                 raise
+  *             if _write_byte(&writer, b'\r') < 0:
+  */
+-      __pyx_t_5 = __pyx_f_7aiohttp_12_http_writer_to_str(__pyx_v_val); if (unlikely(!__pyx_t_5)) __PYX_ERR(0, 149, __pyx_L6_error)
++      __pyx_t_5 = __pyx_f_7aiohttp_12_http_writer_to_str(__pyx_v_val); if (unlikely(!__pyx_t_5)) __PYX_ERR(0, 150, __pyx_L6_error)
+       __Pyx_GOTREF(__pyx_t_5);
+-      __pyx_t_7 = __pyx_f_7aiohttp_12_http_writer__write_str((&__pyx_v_writer), ((PyObject*)__pyx_t_5)); if (unlikely(__pyx_t_7 == ((int)-1) && PyErr_Occurred())) __PYX_ERR(0, 149, __pyx_L6_error)
++      __pyx_t_7 = __pyx_f_7aiohttp_12_http_writer__write_str((&__pyx_v_writer), ((PyObject*)__pyx_t_5)); if (unlikely(__pyx_t_7 == ((int)-1) && PyErr_Occurred())) __PYX_ERR(0, 150, __pyx_L6_error)
+       __Pyx_DECREF(__pyx_t_5); __pyx_t_5 = 0;
+       __pyx_t_8 = (__pyx_t_7 < 0);
+       if (unlikely(__pyx_t_8)) {
+ 
+-        /* "aiohttp/_http_writer.pyx":150
++        /* "aiohttp/_http_writer.pyx":151
+  *                 raise
+  *             if _write_str(&writer, to_str(val)) < 0:
+  *                 raise             # <<<<<<<<<<<<<<
+  *             if _write_byte(&writer, b'\r') < 0:
+  *                 raise
+  */
+-        __Pyx_ReraiseException(); __PYX_ERR(0, 150, __pyx_L6_error)
++        __Pyx_ReraiseException(); __PYX_ERR(0, 151, __pyx_L6_error)
+ 
+-        /* "aiohttp/_http_writer.pyx":149
++        /* "aiohttp/_http_writer.pyx":150
+  *             if _write_byte(&writer, b' ') < 0:
+  *                 raise
+  *             if _write_str(&writer, to_str(val)) < 0:             # <<<<<<<<<<<<<<
+@@ -4107,27 +4116,27 @@ static PyObject *__pyx_pf_7aiohttp_12_http_writer__serialize_headers(CYTHON_UNUS
+  */
+       }
+ 
+-      /* "aiohttp/_http_writer.pyx":151
++      /* "aiohttp/_http_writer.pyx":152
+  *             if _write_str(&writer, to_str(val)) < 0:
+  *                 raise
+  *             if _write_byte(&writer, b'\r') < 0:             # <<<<<<<<<<<<<<
+  *                 raise
+  *             if _write_byte(&writer, b'\n') < 0:
+  */
+-      __pyx_t_7 = __pyx_f_7aiohttp_12_http_writer__write_byte((&__pyx_v_writer), '\r'); if (unlikely(__pyx_t_7 == ((int)-1) && PyErr_Occurred())) __PYX_ERR(0, 151, __pyx_L6_error)
++      __pyx_t_7 = __pyx_f_7aiohttp_12_http_writer__write_byte((&__pyx_v_writer), '\r'); if (unlikely(__pyx_t_7 == ((int)-1) && PyErr_Occurred())) __PYX_ERR(0, 152, __pyx_L6_error)
+       __pyx_t_8 = (__pyx_t_7 < 0);
+       if (unlikely(__pyx_t_8)) {
+ 
+-        /* "aiohttp/_http_writer.pyx":152
++        /* "aiohttp/_http_writer.pyx":153
+  *                 raise
+  *             if _write_byte(&writer, b'\r') < 0:
+  *                 raise             # <<<<<<<<<<<<<<
+  *             if _write_byte(&writer, b'\n') < 0:
+  *                 raise
+  */
+-        __Pyx_ReraiseException(); __PYX_ERR(0, 152, __pyx_L6_error)
++        __Pyx_ReraiseException(); __PYX_ERR(0, 153, __pyx_L6_error)
+ 
+-        /* "aiohttp/_http_writer.pyx":151
++        /* "aiohttp/_http_writer.pyx":152
+  *             if _write_str(&writer, to_str(val)) < 0:
+  *                 raise
+  *             if _write_byte(&writer, b'\r') < 0:             # <<<<<<<<<<<<<<
+@@ -4136,27 +4145,27 @@ static PyObject *__pyx_pf_7aiohttp_12_http_writer__serialize_headers(CYTHON_UNUS
+  */
+       }
+ 
+-      /* "aiohttp/_http_writer.pyx":153
++      /* "aiohttp/_http_writer.pyx":154
+  *             if _write_byte(&writer, b'\r') < 0:
+  *                 raise
+  *             if _write_byte(&writer, b'\n') < 0:             # <<<<<<<<<<<<<<
+  *                 raise
+  * 
+  */
+-      __pyx_t_7 = __pyx_f_7aiohttp_12_http_writer__write_byte((&__pyx_v_writer), '\n'); if (unlikely(__pyx_t_7 == ((int)-1) && PyErr_Occurred())) __PYX_ERR(0, 153, __pyx_L6_error)
++      __pyx_t_7 = __pyx_f_7aiohttp_12_http_writer__write_byte((&__pyx_v_writer), '\n'); if (unlikely(__pyx_t_7 == ((int)-1) && PyErr_Occurred())) __PYX_ERR(0, 154, __pyx_L6_error)
+       __pyx_t_8 = (__pyx_t_7 < 0);
+       if (unlikely(__pyx_t_8)) {
+ 
+-        /* "aiohttp/_http_writer.pyx":154
++        /* "aiohttp/_http_writer.pyx":155
+  *                 raise
+  *             if _write_byte(&writer, b'\n') < 0:
+  *                 raise             # <<<<<<<<<<<<<<
+  * 
+  *         if _write_byte(&writer, b'\r') < 0:
+  */
+-        __Pyx_ReraiseException(); __PYX_ERR(0, 154, __pyx_L6_error)
++        __Pyx_ReraiseException(); __PYX_ERR(0, 155, __pyx_L6_error)
+ 
+-        /* "aiohttp/_http_writer.pyx":153
++        /* "aiohttp/_http_writer.pyx":154
+  *             if _write_byte(&writer, b'\r') < 0:
+  *                 raise
+  *             if _write_byte(&writer, b'\n') < 0:             # <<<<<<<<<<<<<<
+@@ -4167,27 +4176,27 @@ static PyObject *__pyx_pf_7aiohttp_12_http_writer__serialize_headers(CYTHON_UNUS
+     }
+     __Pyx_DECREF(__pyx_t_1); __pyx_t_1 = 0;
+ 
+-    /* "aiohttp/_http_writer.pyx":156
++    /* "aiohttp/_http_writer.pyx":157
+  *                 raise
+  * 
+  *         if _write_byte(&writer, b'\r') < 0:             # <<<<<<<<<<<<<<
+  *             raise
+  *         if _write_byte(&writer, b'\n') < 0:
+  */
+-    __pyx_t_4 = __pyx_f_7aiohttp_12_http_writer__write_byte((&__pyx_v_writer), '\r'); if (unlikely(__pyx_t_4 == ((int)-1) && PyErr_Occurred())) __PYX_ERR(0, 156, __pyx_L6_error)
++    __pyx_t_4 = __pyx_f_7aiohttp_12_http_writer__write_byte((&__pyx_v_writer), '\r'); if (unlikely(__pyx_t_4 == ((int)-1) && PyErr_Occurred())) __PYX_ERR(0, 157, __pyx_L6_error)
+     __pyx_t_8 = (__pyx_t_4 < 0);
+     if (unlikely(__pyx_t_8)) {
+ 
+-      /* "aiohttp/_http_writer.pyx":157
++      /* "aiohttp/_http_writer.pyx":158
+  * 
+  *         if _write_byte(&writer, b'\r') < 0:
+  *             raise             # <<<<<<<<<<<<<<
+  *         if _write_byte(&writer, b'\n') < 0:
+  *             raise
+  */
+-      __Pyx_ReraiseException(); __PYX_ERR(0, 157, __pyx_L6_error)
++      __Pyx_ReraiseException(); __PYX_ERR(0, 158, __pyx_L6_error)
+ 
+-      /* "aiohttp/_http_writer.pyx":156
++      /* "aiohttp/_http_writer.pyx":157
+  *                 raise
+  * 
+  *         if _write_byte(&writer, b'\r') < 0:             # <<<<<<<<<<<<<<
+@@ -4196,27 +4205,27 @@ static PyObject *__pyx_pf_7aiohttp_12_http_writer__serialize_headers(CYTHON_UNUS
+  */
+     }
+ 
+-    /* "aiohttp/_http_writer.pyx":158
++    /* "aiohttp/_http_writer.pyx":159
+  *         if _write_byte(&writer, b'\r') < 0:
+  *             raise
+  *         if _write_byte(&writer, b'\n') < 0:             # <<<<<<<<<<<<<<
+  *             raise
+  * 
+  */
+-    __pyx_t_4 = __pyx_f_7aiohttp_12_http_writer__write_byte((&__pyx_v_writer), '\n'); if (unlikely(__pyx_t_4 == ((int)-1) && PyErr_Occurred())) __PYX_ERR(0, 158, __pyx_L6_error)
++    __pyx_t_4 = __pyx_f_7aiohttp_12_http_writer__write_byte((&__pyx_v_writer), '\n'); if (unlikely(__pyx_t_4 == ((int)-1) && PyErr_Occurred())) __PYX_ERR(0, 159, __pyx_L6_error)
+     __pyx_t_8 = (__pyx_t_4 < 0);
+     if (unlikely(__pyx_t_8)) {
+ 
+-      /* "aiohttp/_http_writer.pyx":159
++      /* "aiohttp/_http_writer.pyx":160
+  *             raise
+  *         if _write_byte(&writer, b'\n') < 0:
+  *             raise             # <<<<<<<<<<<<<<
+  * 
+  *         return PyBytes_FromStringAndSize(writer.buf, writer.pos)
+  */
+-      __Pyx_ReraiseException(); __PYX_ERR(0, 159, __pyx_L6_error)
++      __Pyx_ReraiseException(); __PYX_ERR(0, 160, __pyx_L6_error)
+ 
+-      /* "aiohttp/_http_writer.pyx":158
++      /* "aiohttp/_http_writer.pyx":159
+  *         if _write_byte(&writer, b'\r') < 0:
+  *             raise
+  *         if _write_byte(&writer, b'\n') < 0:             # <<<<<<<<<<<<<<
+@@ -4225,7 +4234,7 @@ static PyObject *__pyx_pf_7aiohttp_12_http_writer__serialize_headers(CYTHON_UNUS
+  */
+     }
+ 
+-    /* "aiohttp/_http_writer.pyx":161
++    /* "aiohttp/_http_writer.pyx":162
+  *             raise
+  * 
+  *         return PyBytes_FromStringAndSize(writer.buf, writer.pos)             # <<<<<<<<<<<<<<
+@@ -4233,14 +4242,14 @@ static PyObject *__pyx_pf_7aiohttp_12_http_writer__serialize_headers(CYTHON_UNUS
+  *         _release_writer(&writer)
+  */
+     __Pyx_XDECREF(__pyx_r);
+-    __pyx_t_1 = PyBytes_FromStringAndSize(__pyx_v_writer.buf, __pyx_v_writer.pos); if (unlikely(!__pyx_t_1)) __PYX_ERR(0, 161, __pyx_L6_error)
++    __pyx_t_1 = PyBytes_FromStringAndSize(__pyx_v_writer.buf, __pyx_v_writer.pos); if (unlikely(!__pyx_t_1)) __PYX_ERR(0, 162, __pyx_L6_error)
+     __Pyx_GOTREF(__pyx_t_1);
+     __pyx_r = __pyx_t_1;
+     __pyx_t_1 = 0;
+     goto __pyx_L5_return;
+   }
+ 
+-  /* "aiohttp/_http_writer.pyx":163
++  /* "aiohttp/_http_writer.pyx":164
+  *         return PyBytes_FromStringAndSize(writer.buf, writer.pos)
+  *     finally:
+  *         _release_writer(&writer)             # <<<<<<<<<<<<<<
+@@ -4264,7 +4273,7 @@ static PyObject *__pyx_pf_7aiohttp_12_http_writer__serialize_headers(CYTHON_UNUS
+       __Pyx_XGOTREF(__pyx_t_15);
+       __pyx_t_4 = __pyx_lineno; __pyx_t_7 = __pyx_clineno; __pyx_t_9 = __pyx_filename;
+       {
+-        __pyx_f_7aiohttp_12_http_writer__release_writer((&__pyx_v_writer)); if (unlikely(PyErr_Occurred())) __PYX_ERR(0, 163, __pyx_L22_error)
++        __pyx_f_7aiohttp_12_http_writer__release_writer((&__pyx_v_writer)); if (unlikely(PyErr_Occurred())) __PYX_ERR(0, 164, __pyx_L22_error)
+       }
+       if (PY_MAJOR_VERSION >= 3) {
+         __Pyx_XGIVEREF(__pyx_t_13);
+@@ -4295,7 +4304,7 @@ static PyObject *__pyx_pf_7aiohttp_12_http_writer__serialize_headers(CYTHON_UNUS
+     __pyx_L5_return: {
+       __pyx_t_15 = __pyx_r;
+       __pyx_r = 0;
+-      __pyx_f_7aiohttp_12_http_writer__release_writer((&__pyx_v_writer)); if (unlikely(PyErr_Occurred())) __PYX_ERR(0, 163, __pyx_L1_error)
++      __pyx_f_7aiohttp_12_http_writer__release_writer((&__pyx_v_writer)); if (unlikely(PyErr_Occurred())) __PYX_ERR(0, 164, __pyx_L1_error)
+       __pyx_r = __pyx_t_15;
+       __pyx_t_15 = 0;
+       goto __pyx_L0;
+diff --git a/aiohttp/http_writer.py b/aiohttp/http_writer.py
+index d6b02e6f5..37cdc06e6 100644
+--- a/aiohttp/http_writer.py
++++ b/aiohttp/http_writer.py
+@@ -181,6 +181,7 @@ def _safe_header(string: str) -> str:
+ 
+ 
+ def _py_serialize_headers(status_line: str, headers: "CIMultiDict[str]") -> bytes:
++    _safe_header(status_line)
+     headers_gen = (_safe_header(k) + ": " + _safe_header(v) for k, v in headers.items())
+     line = status_line + "\r\n" + "\r\n".join(headers_gen) + "\r\n\r\n"
+     return line.encode("utf-8")
+diff --git a/aiohttp/web_exceptions.py b/aiohttp/web_exceptions.py
+index ee2c1e72d..30792c281 100644
+--- a/aiohttp/web_exceptions.py
++++ b/aiohttp/web_exceptions.py
+@@ -101,6 +101,8 @@ class HTTPException(Response, Exception):
+                 "body argument is deprecated for http web exceptions",
+                 DeprecationWarning,
+             )
++        if reason is not None and ("\r" in reason or "\n" in reason):
++            raise ValueError("Reason cannot contain \\r or \\n")
+         Response.__init__(
+             self,
+             status=self.status_code,
+diff --git a/aiohttp/web_response.py b/aiohttp/web_response.py
+index 40d6f01ec..3bd9d45b5 100644
+--- a/aiohttp/web_response.py
++++ b/aiohttp/web_response.py
+@@ -140,6 +140,8 @@ class StreamResponse(BaseClass, HeadersMixin):
+                 reason = HTTPStatus(self._status).phrase
+             except ValueError:
+                 reason = ""
++        elif "\r" in reason or "\n" in reason:
++            raise ValueError("Reason cannot contain \\r or \\n")
+         self._reason = reason
+ 
+     @property
+diff --git a/tests/test_web_exceptions.py b/tests/test_web_exceptions.py
+index 69deb27a0..5a98d0f94 100644
+--- a/tests/test_web_exceptions.py
++++ b/tests/test_web_exceptions.py
+@@ -270,3 +270,18 @@ def test_unicode_text_body_unauthorized() -> None:
+     ):
+         resp = web.HTTPUnauthorized(body="text")
+     assert resp.status == 401
++
++
++def test_multiline_reason() -> None:
++    with pytest.raises(ValueError, match=r"Reason cannot contain"):
++        web.HTTPOk(reason="Bad\r\nInjected-header: foo")
++
++
++def test_reason_with_cr() -> None:
++    with pytest.raises(ValueError, match=r"Reason cannot contain"):
++        web.HTTPOk(reason="OK\rSet-Cookie: evil=1")
++
++
++def test_reason_with_lf() -> None:
++    with pytest.raises(ValueError, match=r"Reason cannot contain"):
++        web.HTTPOk(reason="OK\nSet-Cookie: evil=1")
+diff --git a/tests/test_web_response.py b/tests/test_web_response.py
+index d1b407c09..84018bbfb 100644
+--- a/tests/test_web_response.py
++++ b/tests/test_web_response.py
+@@ -916,6 +916,27 @@ def test_set_status_with_reason() -> None:
+     assert "Everything is fine!" == resp.reason
+ 
+ 
++def test_set_status_reason_with_cr() -> None:
++    resp = StreamResponse()
++
++    with pytest.raises(ValueError, match="Reason cannot contain"):
++        resp.set_status(200, "OK\rSet-Cookie: evil=1")
++
++
++def test_set_status_reason_with_lf() -> None:
++    resp = StreamResponse()
++
++    with pytest.raises(ValueError, match="Reason cannot contain"):
++        resp.set_status(200, "OK\nSet-Cookie: evil=1")
++
++
++def test_set_status_reason_with_crlf() -> None:
++    resp = StreamResponse()
++
++    with pytest.raises(ValueError, match="Reason cannot contain"):
++        resp.set_status(200, "OK\r\nSet-Cookie: evil=1")
++
++
+ async def test_start_force_close() -> None:
+     req = make_request("GET", "/")
+     resp = StreamResponse()
+@@ -1168,6 +1189,16 @@ async def test_render_with_body(buf, writer) -> None:
+     )
+ 
+ 
++async def test_multiline_reason(buf, writer) -> None:
++    with pytest.raises(ValueError, match=r"Reason cannot contain \\r or \\n"):
++        Response(reason="Bad\r\nInjected-header: foo")
++
++
++def test_serialize_headers_rejects_crlf_status_line() -> None:
++    with pytest.raises(ValueError, match="Newline or carriage return"):
++        _serialize_headers("HTTP/1.1 200 OK\r\nInjected: yes", CIMultiDict())
++
++
+ async def test_send_set_cookie_header(buf, writer) -> None:
+     resp = Response()
+     resp.cookies["name"] = "value"
+-- 
+2.35.6
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index 7b77b19dcc..400a4a838b 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -21,6 +21,7 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2026-34513.patch \
            file://CVE-2026-34993.patch \
            file://CVE-2026-34518.patch \
+           file://CVE-2026-34519.patch \
            "
 
 CVE_STATUS[CVE-2026-34515] = "not-applicable-platform: Vulnerability only affects applications running on Windows"
-- 
2.35.6


