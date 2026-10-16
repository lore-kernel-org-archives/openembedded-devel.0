Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B83CCA46D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:21:03 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13829.1792120857841685084
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PauoYPJp;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4586; q=dns/txt;
  s=iport01; t=1792120858; x=1793330458;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=slGCACfh5mbyp01uZccU+kDlq3gFL8bRLsQ4J/QbOjc=;
  b=PauoYPJpH9wgkyJouFXXiDrImtwemItcDfNbxuEb8X7TK9kGCOhR4/ay
   vkhIwJ4ekBPh+EWxS2tEdu65eB06Buoz5C3j6mk0U3hFpWadu+in4E/v5
   /KC8xROg+nfrfz1m/ujEKCf4Ng1qv9Jf2lYSkI9/xAQvgUy/2X9kwQrsN
   32C7fRPDJxsgvRmEdDszn1gaNT/hy9RazKZvrjfikA9eOr4dw+HwiVGMU
   UUciedzB7FQJQrP/JRK2mOTDI+ePxfW9m7dK8L4dLqK/qQardZTqkskeS
   LAwmReHF+uhbKtLQXiyNp101hzE9E2kK4KL9j8x+tg61GbQnuFElRI5d9
   g==;
X-CSE-ConnectionGUID: +kyccNshTBqdSjuF65Yn/w==
X-CSE-MsgGUID: x/kZ34XRRm2c9aMT+NfLgA==
X-IPAS-Result: =?us-ascii?q?A0C+AgBtltFq/4v/Ja1aHgEBCxIMggULgld1YENJA41Xi?=
 =?us-ascii?q?ARsA4ETilKSN4F+DwEBAQ9EDQQBAYUFAo4VAiY0CQ4BAgQDAgMBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBLRAcAwECLyALIwgZg?=
 =?us-ascii?q?wIBgjoDNwMRBrxzgXkzgQGDKQGBVNhLDYJaAQsUAQWBM4VAgn+FJF0YAYR8J?=
 =?us-ascii?q?xsbgXKBFYJzdoEFgRpCAQEBiCQEgiKBDIFalUdIgR4DWSwBVRMNCgsHBYFoA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQcbBgWBHYEgghYjGTZ6gQlegSspYAEQF4EJggcCglSCA?=
 =?us-ascii?q?AIBSUEOB0VTCSVDEkcmIggSCQETGjALgRs4PAkoQRcMcwwdBXIIAg0JBykYD?=
 =?us-ascii?q?UgRLDcVGQQ+bgeSEx6CZRYbDFEBKQEBgWsYk2AIkjagHnEKKIN2jCKPPoV8G?=
 =?us-ascii?q?jOEBJQXklQLmH2OCoQJkkaEaYFoPIFZcBWDIglKGQ+OKwQKC4NghRPJRycyA?=
 =?us-ascii?q?gkDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:wq8iNaNKfqzs4brvrR30lsFynXyQoLVcMsEvi/4bfWQNrUp20TJTy
 mJKCmyOb/yLYzehc9t0aYjn9xgD7ZXWxtUyGXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb9gmAsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj67ZtHUo9G5YYxsxuDVpM6
 NJGdQELKQ/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmDS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2M0PXwsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5FEriemzb4eKKrRmQ+1F2UWq/
 T72xV78WBpLPfmjihyL1n2F07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MuUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:HMtJyaxWkUHBI9RzV+oyKrPw9L1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIWpIObuEYdWIK7vrS0U2fD8sqxsWB/eSDgOfTyGoocCRRApsQljuQzm2gYzZLrM4sP+tAKK
 ah
X-Talos-CUID: 9a23:0pLXyG1io7a72Vtmafp0brxfWcM0eXb713fsCVa0MmR0ZuPIeFnX5/Yx
X-Talos-MUID: 9a23:kywYEAvGYiETfTlPGs2nlHZhBpw0056UDRoGwJwjh4qiOwh/EmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="521967578"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:20:57 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id D19BD180000F5;
	Fri, 16 Oct 2026 03:20:56 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 794E9CBF202; Thu, 15 Oct 2026 20:20:56 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-webserver][wrynose][PATCH 02/11] nginx: fix CVE-2026-42934
Date: Thu, 15 Oct 2026 20:20:47 -0700
Message-Id: <20261016032056.409095-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016032056.409095-1-hthakar@cisco.com>
References: <20261016032056.409095-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 03:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131030

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/nginx/nginx/commit/54b7945961b2eaafc480d6b85d9635d0db1c126a
[2] https://nginx.org/en/security_advisories.html

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../nginx/files/CVE-2026-42934.patch          | 80 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |  1 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |  1 +
 3 files changed, 82 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42934.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42934.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42934.patch
new file mode 100644
index 0000000000..5ae96e8372
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42934.patch
@@ -0,0 +1,80 @@
+From 54b7945961b2eaafc480d6b85d9635d0db1c126a Mon Sep 17 00:00:00 2001
+From: David Carlier <devnexen@gmail.com>
+Date: Sun, 12 Apr 2026 07:13:23 +0100
+Subject: [PATCH] Charset: fix buffer over-read in recode_from_utf8().
+
+When a multi-byte UTF-8 character was split across 3+ single-byte
+buffers, the saved bytes continuation path had two related bugs:
+
+ngx_utf8_decode() was called with the last saved-array index instead
+of the byte count, causing it to report "incomplete" even when the
+sequence was already complete.
+
+The subsequent ngx_memcpy() used that same index as the copy length,
+reading past the input buffer boundary.
+
+CVE: CVE-2026-42934
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/54b7945961b2eaafc480d6b85d9635d0db1c126a]
+
+(cherry picked from commit 54b7945961b2eaafc480d6b85d9635d0db1c126a)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ .../modules/ngx_http_charset_filter_module.c  | 20 ++++++-------------
+ 1 file changed, 6 insertions(+), 14 deletions(-)
+
+diff --git a/src/http/modules/ngx_http_charset_filter_module.c b/src/http/modules/ngx_http_charset_filter_module.c
+index 482960040..edb2db568 100644
+--- a/src/http/modules/ngx_http_charset_filter_module.c
++++ b/src/http/modules/ngx_http_charset_filter_module.c
+@@ -689,7 +689,6 @@ ngx_http_charset_recode_from_utf8(ngx_pool_t *pool, ngx_buf_t *buf,
+     u_char        c, *p, *src, *dst, *saved, **table;
+     uint32_t      n;
+     ngx_buf_t    *b;
+-    ngx_uint_t    i;
+     ngx_chain_t  *out, *cl, **ll;
+ 
+     src = buf->pos;
+@@ -783,18 +782,12 @@ ngx_http_charset_recode_from_utf8(ngx_pool_t *pool, ngx_buf_t *buf,
+     ngx_log_debug1(NGX_LOG_DEBUG_HTTP, pool->log, 0,
+                    "http charset utf saved: %z", ctx->saved_len);
+ 
+-    p = src;
+-
+-    for (i = ctx->saved_len; i < NGX_UTF_LEN; i++) {
+-        ctx->saved[i] = *p++;
+-
+-        if (p == buf->last) {
+-            break;
+-        }
+-    }
++    len = ngx_min(NGX_UTF_LEN - ctx->saved_len, (size_t) (buf->last - src));
++    ngx_memcpy(&ctx->saved[ctx->saved_len], src, len);
++    len += ctx->saved_len;
+ 
+     saved = ctx->saved;
+-    n = ngx_utf8_decode(&saved, i);
++    n = ngx_utf8_decode(&saved, len);
+ 
+     c = '\0';
+ 
+@@ -810,7 +803,7 @@ ngx_http_charset_recode_from_utf8(ngx_pool_t *pool, ngx_buf_t *buf,
+ 
+         /* incomplete UTF-8 symbol */
+ 
+-        if (i < NGX_UTF_LEN) {
++        if (len < NGX_UTF_LEN) {
+             out = ngx_http_charset_get_buf(pool, ctx);
+             if (out == NULL) {
+                 return NULL;
+@@ -823,8 +816,7 @@ ngx_http_charset_recode_from_utf8(ngx_pool_t *pool, ngx_buf_t *buf,
+             b->sync = 1;
+             b->shadow = buf;
+ 
+-            ngx_memcpy(&ctx->saved[ctx->saved_len], src, i);
+-            ctx->saved_len += i;
++            ctx->saved_len = len;
+ 
+             return out;
+         }
+-- 
+2.35.6
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index 25493be747..25d8784c48 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -2,6 +2,7 @@ require nginx.inc
 
 SRC_URI:append = " \
     file://CVE-2026-40701.patch \
+    file://CVE-2026-42934.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index c8881a320e..ae7bfaee9f 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -2,6 +2,7 @@ require nginx.inc
 
 SRC_URI:append = " \
     file://CVE-2026-40701.patch \
+    file://CVE-2026-42934.patch \
 "
 
 # 1.28.x branch is the current stable branch, the recommended default
-- 
2.35.6


