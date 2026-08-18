Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E412BC5DF81
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 18:15:35 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15269.1787076932678337791
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 11:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RAoE9977;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13606; q=dns/txt;
  s=iport01; t=1787076933; x=1788286533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Zoaup8cpMWLANorYOCcsY/i0tfPtLcfqVXEHNbSL2Z4=;
  b=RAoE9977rw2sMaq5q3b2Kgh0L3cbegQXToHwlo2JZKVHscaS+yfTe4i4
   SZE1FXneOii7fQ9OPcqx5OtqTL+u319mMWay9LvF0O4I9mW23Vb40QBGL
   cf1/73ayU0KwquYsqsfMQcFkrtSc2fS8yj+RAMzS31QM8OAE/gTrk8L6c
   oYsHe8yd72sj25tmCI3pWLja2ddUCA4iFcdXV9roJ6MNkl+V6sBJpypRS
   R5GKeRDJxLnNt6/EitnhFNth4lrgy/T45GfKVJzWaE14ISSUSgECeZYvw
   hSqJcpbK42iEPGMx5jwNik0+l2RY62ATtJkwjooYehiRP0uRdwFk1rT7b
   A==;
X-CSE-ConnectionGUID: aJq2WPfxT2umraSj3qkYBQ==
X-CSE-MsgGUID: 7GzpsZQ0TZ20nybBkZC6/Q==
X-IPAS-Result: =?us-ascii?q?A0C4AgDJn4Rq/5UQJK1aHgEBCxIMggULgld0XgoBOEmEV?=
 =?us-ascii?q?5FzA4ETnQiBfg8BAQEPRA0EAQGEP0YCjWsCJjQJDgECBAMCAwEBAQEBAQEBA?=
 =?us-ascii?q?QEBCwEBBQEBAQIBBwWBDhOGTw2GWgECAQMjBAsBGAEtEAkTAwECAwImAgIrI?=
 =?us-ascii?q?wgZgwIBgnQDEah9myJ6fzOBAYMoAYFU2zABCxQBBYEFLoU/gx8BhQJdGAGEf?=
 =?us-ascii?q?CcbG4FygRWBO4E4doEFgVwCgTiEA4JqBIIigQyBWpFWSIECHANZLAFVEw0KC?=
 =?us-ascii?q?wcFgWYDNRIqFW4yHYEjPhc1WBsGBYEdgSiENyMZNnqBCV6BKyphARIXgQmCC?=
 =?us-ascii?q?gKCc4IGAgFJRQ4LGA1IESw3FBkEPQFuB444IIJDgQ4BKgF7gTEckyOSN6EPC?=
 =?us-ascii?q?iiDdowhlToaM6psC5h9jgqWAFCEaYFoPIFZcBWDIglKGQ+OKg4Lg2DMOScyA?=
 =?us-ascii?q?gkyAQEHAgcOAwuBaJABgX0BAQ?=
IronPort-Data: A9a23:V5/R063feYh8h/M/8fbD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzVRm
 zFMCz2PPfiDZ2Okc9BwYY7j8RtQ6MfTzIRhQAtr3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24tbTpPg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGBWMvZ7Ig9PZLW3xL7
 /UjKmsUbSGpvrfjqF67YrEEasULJc3vOsYb/3pn1zycVKxgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2MEWojx5nYj/7DLoyn+qsj3juehVTqUmeouw85G27IAlZgOG0aYKFK4DVLSlTthm3t
 HrdzV2hPiNAbNqOwxCGwFnywdaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl/DQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:dnXh86pim1GLDp4hzh0Nm+caV5r1eYIsimQD101hICG9vPb2qy
 nIpoV86faUskd3ZJhOo7G90cW7LE80sKQFg7X5Xo3SODUOxlHJEGgK1+KLqFfd8m/Fh4tgPM
 xbHZSWZuedMbFSt7eC3ODBKadC/PC3tIa1mOzZ03BhCStua61m8kNFLzzzKDwPeOGDbqBJbq
 Z1IaF81kGdRUg=
X-Talos-CUID: =?us-ascii?q?9a23=3AE0mXOWhbXVvW4pbU+6zc4B6iGTJue1/ElkjoLV+?=
 =?us-ascii?q?EU3tsUrSuSwSJ+5JOqp87?=
X-Talos-MUID: 9a23:/8JazASha1DVhvHARXSzqyN6L/VRu5icUhgLgJ8suPuva2tJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,230,1779148800"; 
   d="scan'208";a="811108947"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Aug 2026 18:15:32 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id F13E818000159;
	Tue, 18 Aug 2026 18:15:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 38103CD02BE; Tue, 18 Aug 2026 11:15:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 07/10] python3-aiohttp: fix CVE-2026-54277
Date: Tue, 18 Aug 2026 11:15:25 -0700
Message-Id: <20260818181528.3405276-8-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260818181528.3405276-1-dkelaiya@cisco.com>
References: <20260818181528.3405276-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 18:15:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129242

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using
the commit shown in [1].

[1] https://github.com/aio-libs/aiohttp/commit/5ab61bb4cd88f19b712f12c7c9295fe262bf804d
[2] https://github.com/advisories/GHSA-63hw-fmq6-xxg2

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
Changes in v2
- Added the corresponding generated aiohttp/_http_parser.c changes.
- Updated cb_on_url() and cb_on_status() in the generated C parser to
  enforce max_line_size against the accumulated parser buffer.
- Ensured the security fix is included when Wrynose builds the
  generated C parser without regenerating it from the patched .pyx.
- Documented the Wrynose-specific backport changes in the patch
  metadata.
---
 .../python3-aiohttp/CVE-2026-54277.patch      | 249 ++++++++++++++++++
 .../python/python3-aiohttp_3.13.5.bb          |   1 +
 2 files changed, 250 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54277.patch

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54277.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54277.patch
new file mode 100644
index 0000000000..db50155d33
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54277.patch
@@ -0,0 +1,249 @@
+From f61e8949f10a0e77ceba28a6639627e6e57bf167 Mon Sep 17 00:00:00 2001
+From: "J. Nick Koston" <nick@koston.org>
+Date: Sun, 7 Jun 2026 00:33:03 -0500
+Subject: [PATCH] [PR #12826/36df6c13 backport][3.14] Enforce max_line_size on
+ fragmented request target and reason in C parser (#12837)
+
+CVE: CVE-2026-54277
+Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/5ab61bb4cd88f19b712f12c7c9295fe262bf804d]
+
+Backport Changes:
+- Added aiohttp/_http_parser.c because Wrynose builds the
+  pre-generated C parser without running Cython.
+- Updated cb_on_url() and cb_on_status() to enforce max_line_size
+  against the accumulated parser buffer.
+
+(cherry picked from commit 5ab61bb4cd88f19b712f12c7c9295fe262bf804d)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ CHANGES/12826.bugfix.rst  |  1 +
+ aiohttp/_http_parser.c    | 36 ++++++++++++++++++------------------
+ aiohttp/_http_parser.pyx  |  4 ++--
+ tests/test_http_parser.py | 22 ++++++++++++++++++++++
+ 4 files changed, 43 insertions(+), 20 deletions(-)
+ create mode 100644 CHANGES/12826.bugfix.rst
+
+diff --git a/CHANGES/12826.bugfix.rst b/CHANGES/12826.bugfix.rst
+new file mode 100644
+index 000000000..7e095615d
+--- /dev/null
++++ b/CHANGES/12826.bugfix.rst
+@@ -0,0 +1 @@
++Fixed the C HTTP parser not enforcing ``max_line_size`` on a request target or response reason phrase that is split across multiple reads; each fragment was checked on its own, so an accumulated line could exceed the limit without raising ``LineTooLong``. The accumulated length is now checked, matching the pure-Python parser -- by :user:`bdraco`.
+diff --git a/aiohttp/_http_parser.c b/aiohttp/_http_parser.c
+index 911c9aa65..14c5b3350 100644
+--- a/aiohttp/_http_parser.c
++++ b/aiohttp/_http_parser.c
+@@ -14760,7 +14760,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_url(llhttp_t *__pyx_v_parser, c
+  *                    const char *at, size_t length) except -1:
+  *     cdef HttpParser pyparser = <HttpParser>parser.data             # <<<<<<<<<<<<<<
+  *     try:
+- *         if length > pyparser._max_line_size:
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:
+ */
+   __pyx_t_1 = ((PyObject *)__pyx_v_parser->data);
+   __Pyx_INCREF(__pyx_t_1);
+@@ -14771,7 +14771,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_url(llhttp_t *__pyx_v_parser, c
+  *                    const char *at, size_t length) except -1:
+  *     cdef HttpParser pyparser = <HttpParser>parser.data
+  *     try:             # <<<<<<<<<<<<<<
+- *         if length > pyparser._max_line_size:
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:
+  *             status = pyparser._buf + at[:length]
+ */
+   {
+@@ -14786,16 +14786,16 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_url(llhttp_t *__pyx_v_parser, c
+       /* "aiohttp/_http_parser.pyx":721
+  *     cdef HttpParser pyparser = <HttpParser>parser.data
+  *     try:
+- *         if length > pyparser._max_line_size:             # <<<<<<<<<<<<<<
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:             # <<<<<<<<<<<<<<
+  *             status = pyparser._buf + at[:length]
+  *             raise LineTooLong(status[:100] + b"...", pyparser._max_line_size)
+ */
+-      __pyx_t_5 = (__pyx_v_length > __pyx_v_pyparser->_max_line_size);
++      __pyx_t_5 = ((__Pyx_PyByteArray_GET_SIZE(__pyx_v_pyparser->_buf) + __pyx_v_length) > __pyx_v_pyparser->_max_line_size);
+       if (unlikely(__pyx_t_5)) {
+ 
+         /* "aiohttp/_http_parser.pyx":722
+  *     try:
+- *         if length > pyparser._max_line_size:
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:
+  *             status = pyparser._buf + at[:length]             # <<<<<<<<<<<<<<
+  *             raise LineTooLong(status[:100] + b"...", pyparser._max_line_size)
+  *         extend(pyparser._buf, at, length)
+@@ -14809,7 +14809,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_url(llhttp_t *__pyx_v_parser, c
+         __pyx_t_6 = 0;
+ 
+         /* "aiohttp/_http_parser.pyx":723
+- *         if length > pyparser._max_line_size:
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:
+  *             status = pyparser._buf + at[:length]
+  *             raise LineTooLong(status[:100] + b"...", pyparser._max_line_size)             # <<<<<<<<<<<<<<
+  *         extend(pyparser._buf, at, length)
+@@ -14854,7 +14854,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_url(llhttp_t *__pyx_v_parser, c
+         /* "aiohttp/_http_parser.pyx":721
+  *     cdef HttpParser pyparser = <HttpParser>parser.data
+  *     try:
+- *         if length > pyparser._max_line_size:             # <<<<<<<<<<<<<<
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:             # <<<<<<<<<<<<<<
+  *             status = pyparser._buf + at[:length]
+  *             raise LineTooLong(status[:100] + b"...", pyparser._max_line_size)
+ */
+@@ -14878,7 +14878,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_url(llhttp_t *__pyx_v_parser, c
+  *                    const char *at, size_t length) except -1:
+  *     cdef HttpParser pyparser = <HttpParser>parser.data
+  *     try:             # <<<<<<<<<<<<<<
+- *         if length > pyparser._max_line_size:
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:
+  *             status = pyparser._buf + at[:length]
+ */
+     }
+@@ -14968,7 +14968,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_url(llhttp_t *__pyx_v_parser, c
+  *                    const char *at, size_t length) except -1:
+  *     cdef HttpParser pyparser = <HttpParser>parser.data
+  *     try:             # <<<<<<<<<<<<<<
+- *         if length > pyparser._max_line_size:
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:
+  *             status = pyparser._buf + at[:length]
+ */
+     __pyx_L5_except_error:;
+@@ -15045,7 +15045,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_status(llhttp_t *__pyx_v_parser
+  *                       const char *at, size_t length) except -1:
+  *     cdef HttpParser pyparser = <HttpParser>parser.data             # <<<<<<<<<<<<<<
+  *     try:
+- *         if length > pyparser._max_line_size:
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:
+ */
+   __pyx_t_1 = ((PyObject *)__pyx_v_parser->data);
+   __Pyx_INCREF(__pyx_t_1);
+@@ -15056,7 +15056,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_status(llhttp_t *__pyx_v_parser
+  *                       const char *at, size_t length) except -1:
+  *     cdef HttpParser pyparser = <HttpParser>parser.data
+  *     try:             # <<<<<<<<<<<<<<
+- *         if length > pyparser._max_line_size:
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:
+  *             reason = pyparser._buf + at[:length]
+ */
+   {
+@@ -15071,16 +15071,16 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_status(llhttp_t *__pyx_v_parser
+       /* "aiohttp/_http_parser.pyx":736
+  *     cdef HttpParser pyparser = <HttpParser>parser.data
+  *     try:
+- *         if length > pyparser._max_line_size:             # <<<<<<<<<<<<<<
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:             # <<<<<<<<<<<<<<
+  *             reason = pyparser._buf + at[:length]
+  *             raise LineTooLong(reason[:100] + b"...", pyparser._max_line_size)
+ */
+-      __pyx_t_5 = (__pyx_v_length > __pyx_v_pyparser->_max_line_size);
++      __pyx_t_5 = ((__Pyx_PyByteArray_GET_SIZE(__pyx_v_pyparser->_buf) + __pyx_v_length) > __pyx_v_pyparser->_max_line_size);
+       if (unlikely(__pyx_t_5)) {
+ 
+         /* "aiohttp/_http_parser.pyx":737
+  *     try:
+- *         if length > pyparser._max_line_size:
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:
+  *             reason = pyparser._buf + at[:length]             # <<<<<<<<<<<<<<
+  *             raise LineTooLong(reason[:100] + b"...", pyparser._max_line_size)
+  *         extend(pyparser._buf, at, length)
+@@ -15094,7 +15094,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_status(llhttp_t *__pyx_v_parser
+         __pyx_t_6 = 0;
+ 
+         /* "aiohttp/_http_parser.pyx":738
+- *         if length > pyparser._max_line_size:
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:
+  *             reason = pyparser._buf + at[:length]
+  *             raise LineTooLong(reason[:100] + b"...", pyparser._max_line_size)             # <<<<<<<<<<<<<<
+  *         extend(pyparser._buf, at, length)
+@@ -15139,7 +15139,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_status(llhttp_t *__pyx_v_parser
+         /* "aiohttp/_http_parser.pyx":736
+  *     cdef HttpParser pyparser = <HttpParser>parser.data
+  *     try:
+- *         if length > pyparser._max_line_size:             # <<<<<<<<<<<<<<
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:             # <<<<<<<<<<<<<<
+  *             reason = pyparser._buf + at[:length]
+  *             raise LineTooLong(reason[:100] + b"...", pyparser._max_line_size)
+ */
+@@ -15163,7 +15163,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_status(llhttp_t *__pyx_v_parser
+  *                       const char *at, size_t length) except -1:
+  *     cdef HttpParser pyparser = <HttpParser>parser.data
+  *     try:             # <<<<<<<<<<<<<<
+- *         if length > pyparser._max_line_size:
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:
+  *             reason = pyparser._buf + at[:length]
+ */
+     }
+@@ -15253,7 +15253,7 @@ static int __pyx_f_7aiohttp_12_http_parser_cb_on_status(llhttp_t *__pyx_v_parser
+  *                       const char *at, size_t length) except -1:
+  *     cdef HttpParser pyparser = <HttpParser>parser.data
+  *     try:             # <<<<<<<<<<<<<<
+- *         if length > pyparser._max_line_size:
++ *         if len(pyparser._buf) + length > pyparser._max_line_size:
+  *             reason = pyparser._buf + at[:length]
+ */
+     __pyx_L5_except_error:;
+diff --git a/aiohttp/_http_parser.pyx b/aiohttp/_http_parser.pyx
+index 5da835bc6..e1edee310 100644
+--- a/aiohttp/_http_parser.pyx
++++ b/aiohttp/_http_parser.pyx
+@@ -718,7 +718,7 @@ cdef int cb_on_url(cparser.llhttp_t* parser,
+                    const char *at, size_t length) except -1:
+     cdef HttpParser pyparser = <HttpParser>parser.data
+     try:
+-        if length > pyparser._max_line_size:
++        if len(pyparser._buf) + length > pyparser._max_line_size:
+             status = pyparser._buf + at[:length]
+             raise LineTooLong(status[:100] + b"...", pyparser._max_line_size)
+         extend(pyparser._buf, at, length)
+@@ -733,7 +733,7 @@ cdef int cb_on_status(cparser.llhttp_t* parser,
+                       const char *at, size_t length) except -1:
+     cdef HttpParser pyparser = <HttpParser>parser.data
+     try:
+-        if length > pyparser._max_line_size:
++        if len(pyparser._buf) + length > pyparser._max_line_size:
+             reason = pyparser._buf + at[:length]
+             raise LineTooLong(reason[:100] + b"...", pyparser._max_line_size)
+         extend(pyparser._buf, at, length)
+diff --git a/tests/test_http_parser.py b/tests/test_http_parser.py
+index 25604dbcc..8cb591f20 100644
+--- a/tests/test_http_parser.py
++++ b/tests/test_http_parser.py
+@@ -1272,6 +1272,17 @@ def test_http_request_max_status_line_under_limit(parser: HttpRequestParser) ->
+     assert msg.url == URL("/path" + path.decode())
+ 
+ 
++def test_http_request_max_status_line_fragmented(
++    parser: HttpRequestParser,
++) -> None:
++    # Split an overlong request target across reads so that each callback
++    # fragment is under the limit but the accumulated target is not.
++    match = "400, message:\n  Got more than 8190 bytes when reading"
++    with pytest.raises(http_exceptions.LineTooLong, match=match):
++        parser.feed_data(b"GET /" + b"a" * 8000)
++        parser.feed_data(b"a" * 8000 + b" HTTP/1.1\r\nHost: a\r\n\r\n")
++
++
+ def test_http_response_parser_utf8(response) -> None:
+     text = "HTTP/1.1 200 Ok\r\nx-test:тест\r\n\r\n".encode()
+ 
+@@ -1349,6 +1360,17 @@ def test_http_response_parser_status_line_under_limit(
+     assert msg.reason == reason.decode()
+ 
+ 
++def test_http_response_parser_status_line_too_long_fragmented(
++    response: HttpResponseParser,
++) -> None:
++    # Split an overlong reason phrase across reads so that each callback
++    # fragment is under the limit but the accumulated reason is not.
++    match = "400, message:\n  Got more than 8190 bytes when reading"
++    with pytest.raises(http_exceptions.LineTooLong, match=match):
++        response.feed_data(b"HTTP/1.1 200 " + b"a" * 8000)
++        response.feed_data(b"a" * 8000 + b"\r\n\r\n")
++
++
+ def test_http_response_parser_bad_version(response) -> None:
+     with pytest.raises(http_exceptions.BadHttpMessage):
+         response.feed_data(b"HT/11 200 Ok\r\n\r\n")
+-- 
+2.35.6
+
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index 3c07933200..1a6baebfe9 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -13,6 +13,7 @@ SRC_URI += " \
     file://CVE-2026-54274.patch \
     file://CVE-2026-54275.patch \
     file://CVE-2026-54276.patch \
+    file://CVE-2026-54277.patch \
 "
 
 CVE_PRODUCT = "aiohttp"
-- 
2.35.6


