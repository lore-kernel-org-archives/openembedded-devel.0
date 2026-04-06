Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D037EF4EAE
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 06:33:31 +0000 (UTC)
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49621.1775457204988548946
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 23:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Ap90GX9D;
 spf=pass (domain: mvista.com, ip: 74.125.82.44, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-127380532eeso104930c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 23:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775457204; x=1776062004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+PkbdQX536sEJ3cVJ4kD845G9IVTAjtXnA6Lr3+Qw2A=;
        b=Ap90GX9DrtuSEJc6+f9dJWSvGfUb+8WlLUoYqkpG3jKxEWaueHdoVvajHGJ2JMp5Wi
         WRwMVmZJhYrtZyx9tru4N6mPCzf0YbBsx2gvQPO3PCBMeBgXLYH6aCfxP9h5qKGUpUqK
         JgysoVczq6WXzns/0pTISVM9s0Fa5jIh2x8Yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775457204; x=1776062004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PkbdQX536sEJ3cVJ4kD845G9IVTAjtXnA6Lr3+Qw2A=;
        b=DST6VRcun3/vO/6NqgJvKuArllh0I3/gN18BpwMCX1LdK/ElA/GEbnXt2wMc7U6tEi
         9DcI7g5zMDSzwGY6pltSKZloZDfEmEPKwIRERDPTWjQ6q7zbCGAoEuBPfkJmrPXYKg1y
         tFI3Bqtdl9WxigrMt1Y6QVScLCum9lj0NHI2DD3Yo5qnLzxmODHMaYX95cnTAC7BfavG
         q9tzOQVkmBf0eN0Mu89RGQr13FrU9r5+n87f51KvRDZ1U0P9QXmjxCi71adUhrJae+fv
         ySusmXX5zGhv+/H+tT1x+/35CTRmb86P0d5tylApZxTapCgH8EFILfh3ByJYUNuAkohJ
         xWjg==
X-Gm-Message-State: AOJu0YwUhj+4MXy8xM/cc2qpV8OfvvXZs+eYdCOjKJ+PFBVl4Q6N6V++
	X5BIXsvkg5skc94AMbRNPIWMvEwbQ1jzAtGo9ol29NRPIoxrHLFMEzRcQOo7xeRiYb1t3AbKvAL
	cQHyQQ44=
X-Gm-Gg: AeBDievZKnCoL1eBwKKOifekFz9wqXj7+q63BER8JuyiHY09//FlwICvxZSD/LeJq/H
	+CPneV/GSF1jqaV4RrhSQtJhNpUEyfdnGA34Nm5ZbIh3D5GHmRVbLzEJ55wCFnVeDU8r08egrJb
	na2hHABrogvWe97JPnHrOr1nb8Fak+RnJvMVL/IKGUB2gjCLi+4AXkDGnCpbel/8fXcDIH+Z1ag
	OnEEM85L/UQbhBdi6KKeSV3TdDpzyqqEKjjXlXnRpkTGLOEC48ZAZI9GMMQDifzSV+lAqmaumAc
	1CWoJeL3Pw0VbguyxCwE93n7F0M6qhvarCiIdrteD833+d+A5sFmDlFw+A89CCa8zmU2KwkDd0A
	GGYhGQh4YooLDs3IPqr4IZqNPWkZADfgbFIyME3aZwQPTu/ENJGRIn1O1Tb4+IwvOt4bjzTwBGc
	qtWyahRTTJQQHEBU4+nmcY1rQu+kaggntjv4sy
X-Received: by 2002:a05:7022:ec17:b0:124:11af:7b75 with SMTP id a92af1059eb24-12bfb76f2a2mr5715109c88.34.1775457204052;
        Sun, 05 Apr 2026 23:33:24 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bedd8ff27sm10760364c88.7.2026.04.05.23.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:33:23 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-webserver][kirkstone][PATCH] nginx: fix CVE-2026-27784, CVE-2026-28755
Date: Mon,  6 Apr 2026 12:03:03 +0530
Message-ID: <20260406063303.161444-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 06:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126030

Pick up patch [1] and [2] from Debian report.
[1] https://security-tracker.debian.org/tracker/CVE-2026-27784
[2] https://security-tracker.debian.org/tracker/CVE-2026-28755

More details :
[1]: https://nvd.nist.gov/vuln/detail/CVE-2026-27784
[2]: https://nvd.nist.gov/vuln/detail/CVE-2026-28755

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../nginx/nginx-1.24.0/CVE-2026-27784.patch   | 88 +++++++++++++++++++
 .../nginx/nginx-1.24.0/CVE-2026-28755.patch   | 48 ++++++++++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |  5 ++
 3 files changed, 141 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27784.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-28755.patch

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27784.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27784.patch
new file mode 100644
index 0000000000..41a8563c67
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27784.patch
@@ -0,0 +1,88 @@
+From b23ac73b00313d159a99636c21ef71b828781018 Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Mon, 2 Mar 2026 21:12:34 +0400
+Subject: [PATCH] Mp4: fixed possible integer overflow on 32-bit platforms.
+
+Previously, a 32-bit overflow could happen while validating atom entries
+count.  This allowed processing of an invalid atom with entrires beyond
+its boundaries with reads and writes outside of the allocated mp4 buffer.
+
+Reported by Prabhav Srinath (sprabhav7).
+
+CVE: CVE-2026-27784
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/b23ac73b00313d159a99636c21ef71b828781018]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/http/modules/ngx_http_mp4_module.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/http/modules/ngx_http_mp4_module.c b/src/http/modules/ngx_http_mp4_module.c
+index 041ad26..a7f8be7 100644
+--- a/src/http/modules/ngx_http_mp4_module.c
++++ b/src/http/modules/ngx_http_mp4_module.c
+@@ -2294,7 +2294,7 @@ ngx_http_mp4_read_stts_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+                    "mp4 time-to-sample entries:%uD", entries);
+ 
+     if (ngx_mp4_atom_data_size(ngx_mp4_stts_atom_t)
+-        + entries * sizeof(ngx_mp4_stts_entry_t) > atom_data_size)
++        + (uint64_t) entries * sizeof(ngx_mp4_stts_entry_t) > atom_data_size)
+     {
+         ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
+                       "\"%s\" mp4 stts atom too small", mp4->file.name.data);
+@@ -2597,7 +2597,7 @@ ngx_http_mp4_read_stss_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     atom->last = atom_table;
+ 
+     if (ngx_mp4_atom_data_size(ngx_http_mp4_stss_atom_t)
+-        + entries * sizeof(uint32_t) > atom_data_size)
++        + (uint64_t) entries * sizeof(uint32_t) > atom_data_size)
+     {
+         ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
+                       "\"%s\" mp4 stss atom too small", mp4->file.name.data);
+@@ -2802,7 +2802,7 @@ ngx_http_mp4_read_ctts_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     atom->last = atom_table;
+ 
+     if (ngx_mp4_atom_data_size(ngx_mp4_ctts_atom_t)
+-        + entries * sizeof(ngx_mp4_ctts_entry_t) > atom_data_size)
++        + (uint64_t) entries * sizeof(ngx_mp4_ctts_entry_t) > atom_data_size)
+     {
+         ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
+                       "\"%s\" mp4 ctts atom too small", mp4->file.name.data);
+@@ -2984,7 +2984,7 @@ ngx_http_mp4_read_stsc_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+                    "sample-to-chunk entries:%uD", entries);
+ 
+     if (ngx_mp4_atom_data_size(ngx_mp4_stsc_atom_t)
+-        + entries * sizeof(ngx_mp4_stsc_entry_t) > atom_data_size)
++        + (uint64_t) entries * sizeof(ngx_mp4_stsc_entry_t) > atom_data_size)
+     {
+         ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
+                       "\"%s\" mp4 stsc atom too small", mp4->file.name.data);
+@@ -3362,7 +3362,7 @@ ngx_http_mp4_read_stsz_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     if (size == 0) {
+         if (ngx_mp4_atom_data_size(ngx_mp4_stsz_atom_t)
+-            + entries * sizeof(uint32_t) > atom_data_size)
++            + (uint64_t) entries * sizeof(uint32_t) > atom_data_size)
+         {
+             ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
+                           "\"%s\" mp4 stsz atom too small",
+@@ -3521,7 +3521,7 @@ ngx_http_mp4_read_stco_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     ngx_log_debug1(NGX_LOG_DEBUG_HTTP, mp4->file.log, 0, "chunks:%uD", entries);
+ 
+     if (ngx_mp4_atom_data_size(ngx_mp4_stco_atom_t)
+-        + entries * sizeof(uint32_t) > atom_data_size)
++        + (uint64_t) entries * sizeof(uint32_t) > atom_data_size)
+     {
+         ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
+                       "\"%s\" mp4 stco atom too small", mp4->file.name.data);
+@@ -3737,7 +3737,7 @@ ngx_http_mp4_read_co64_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     ngx_log_debug1(NGX_LOG_DEBUG_HTTP, mp4->file.log, 0, "chunks:%uD", entries);
+ 
+     if (ngx_mp4_atom_data_size(ngx_mp4_co64_atom_t)
+-        + entries * sizeof(uint64_t) > atom_data_size)
++        + (uint64_t) entries * sizeof(uint64_t) > atom_data_size)
+     {
+         ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
+                       "\"%s\" mp4 co64 atom too small", mp4->file.name.data);
+-- 
+2.50.1
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-28755.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-28755.patch
new file mode 100644
index 0000000000..37e6d5b3b4
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-28755.patch
@@ -0,0 +1,48 @@
+From 78f581487706f2e43eea5a060c516fc4d98090e8 Mon Sep 17 00:00:00 2001
+From: Sergey Kandaurov <pluknet@nginx.com>
+Date: Tue, 17 Mar 2026 19:20:03 +0400
+Subject: [PATCH] Stream: fixed client certificate validation with OCSP.
+
+Check for OCSP status was missed in 581cf2267, resulting
+in a broken validation.
+
+Reported by Mufeed VH of Winfunc Research.
+
+CVE: CVE-2026-28755
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/78f581487706f2e43eea5a060c516fc4d98090e8]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/stream/ngx_stream_ssl_module.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/stream/ngx_stream_ssl_module.c b/src/stream/ngx_stream_ssl_module.c
+index 1ba1825..c8e8323 100644
+--- a/src/stream/ngx_stream_ssl_module.c
++++ b/src/stream/ngx_stream_ssl_module.c
+@@ -335,6 +335,7 @@ ngx_stream_ssl_handler(ngx_stream_session_t *s)
+     long                    rc;
+     X509                   *cert;
+     ngx_int_t               rv;
++    const char		    *str;
+     ngx_connection_t       *c;
+     ngx_stream_ssl_conf_t  *sslcf;
+ 
+@@ -385,6 +386,15 @@ ngx_stream_ssl_handler(ngx_stream_session_t *s)
+ 
+             X509_free(cert);
+         }
++
++        if (ngx_ssl_ocsp_get_status(c, &str) != NGX_OK) {
++            ngx_log_error(NGX_LOG_INFO, c->log, 0,
++                          "client SSL certificate verify error: %s", str);
++
++            ngx_ssl_remove_cached_session(c->ssl->session_ctx,
++                                       (SSL_get0_session(c->ssl->connection)));
++            return NGX_ERROR;
++        }
+     }
+ 
+     return NGX_OK;
+-- 
+2.50.1
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
index 2e865e400e..c843b67975 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -2,5 +2,10 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=175abb631c799f54573dc481454c8632"
 
+SRC_URI:append = " \
+		  file://CVE-2026-27784.patch \
+		  file://CVE-2026-28755.patch \
+		"
+
 SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"
 
-- 
2.50.1


