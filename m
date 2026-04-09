Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 262AEEA3C57
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 11:22:42 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.129838.1775733759604656508
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 04:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=T99bAQ+3;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82c20b9fb15so449887b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 04:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775733759; x=1776338559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8agm0sHa15rJymjDmpT7Tbpcjs32i/Hc3VOROgePjEo=;
        b=T99bAQ+3CE9osWF29XinsSheb6BlPIiP26DjkaDGQtD6S55/GpLsx5tjYXeQw7nOTD
         omDzgtRLeBsys+uHpwnBYrAEjWKWbCWKB64+VSMK81Dl7njqQTwz3BlzR1K1uSVykp5z
         FHWQWCBslLwiE9WOKh6zEzvqyrbr9jIYRvPG/p2Uc76uXX6kEGCw3l4eEgb2Oy1bboC7
         JtPDCGsAZk9E2hiSk82FVgLF+8KD5u2M+Dv74/Wq1VRUTunZrzI3Z1uo0BB4LcHl4q70
         JxmYXa7ipYvtk2uFlTLQWoXj2BEm0TyhQl4bVZE7fycjb0hM4E3hxY5jHMtH2wz29J4n
         sOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775733759; x=1776338559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8agm0sHa15rJymjDmpT7Tbpcjs32i/Hc3VOROgePjEo=;
        b=aBYqnDXkdhRKHceUWyJQhHt/qu5nuKCzljRzPuW3FLg4iOg1Z3XgwHEROJPDyj/Hkd
         B4xRAbMMAZREzHNBVMcBvR+OTSK1yWI8Slq4Iayv39wkDV2B5JaSIO7FiFbkvbZJFNZ8
         LEfKr31H7s37vCqzkI2awScvFQgrCavX1qfSe/bLdwRGvaV3FERIec6k6EwKTvt3mIxo
         Go9N3BQt8aNjFoB7tiOtJP+/97G6BXRNy0z60dP+El6icCj7xsWBtCUjC0dBfaerX7ku
         SylD7vMhJJjOVL8Gy4BupNbe2oUh+r3hSmbZA4ryJkuh9kE1tMma/eIQ+pk0+F8shpC6
         Ja7g==
X-Gm-Message-State: AOJu0Yw04daSqJfyx/0zxufyur6Q/ree07nzzugm2nmBwflbkeGblMaA
	A8GVj/Kpy/zzuaNr9RlJQbgkSvgEe2pb/skdAKAEyOVPKdr4JWn7Esqk7gdqqbfZ
X-Gm-Gg: AeBDieuA+T1PBSnGj+IcuirNWHkIXTof6UNq58jH1Nm8q+dL3tUFpe23WT5OePam14B
	sDZBElgdu8EMIPoUdWJec80mqqyjUsizlijbWSMH1qx+ne88CH8sqiwPDKP4xvarT/6JcXqOOUb
	1/N+u05S578duOI5DXGG+D9YyjYfxcNgtv7hP3OgsZq/Cdg7QbOUhZYMkk6XkAacNxPclIoHptX
	wBjLhXHkV6tVKIrh9M4ifTHvSpgfbR6XKJb1tGvBIxMTXS10wWEGRg8wUZJt3dbJo8mPsTD17k7
	kdidGbnz0PQpIS5vpsy7YQU5Dl5J+Xjusb4Q/+RilF9HD6XEXoUyV73Kz33TVI7pNnmXY9fIO2g
	BL/OC/b23k/UeGp4W0CZO0p2KhMoJsFrRj+Rbvf6usIyEn+fKW04F9qM9k5hECD4eOIi+gGPlUQ
	rg8P45oeEXSIsiDToOfhdukS3JT/wDVJZkCKDIp+PrQcLEpw==
X-Received: by 2002:a05:6a00:460e:b0:82c:9897:70ef with SMTP id d2e1a72fcca58-82dd8a8a1cemr3469866b3a.27.1775733758662;
        Thu, 09 Apr 2026 04:22:38 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3ccc8sm30046666b3a.19.2026.04.09.04.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 04:22:38 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][scarthgap][PATCH 8/8] nginx: fix CVE-2026-32647
Date: Thu,  9 Apr 2026 23:22:08 +1200
Message-ID: <20260409112208.1119823-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409112208.1119823-1-ankur.tyagi85@gmail.com>
References: <20260409112208.1119823-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 11:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126195

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

As per the advisory[1] mentioned in NVD[2], version 1.28.3 contains the fix.
Backport the commits[3][4] from 1.28.3 changelog matching the description.

[1] https://my.f5.com/manage/s/article/K000160366
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-32647
[3] https://github.com/nginx/nginx/commit/a172c880cb51f882a5dc999437e8b3a4f87630cc
[4] https://github.com/nginx/nginx/commit/b23ac73b00313d159a99636c21ef71b828781018

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nginx/nginx-1.24.0/CVE-2026-32647-1.patch | 77 ++++++++++++++++
 .../nginx/nginx-1.24.0/CVE-2026-32647-2.patch | 87 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |  2 +
 3 files changed, 166 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-32647-1.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-32647-2.patch

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-32647-1.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-32647-1.patch
new file mode 100644
index 0000000000..506a3fb887
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-32647-1.patch
@@ -0,0 +1,77 @@
+From c694db97c62f33d621e73937a63e7b5c206c16c9 Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Sat, 21 Feb 2026 12:04:36 +0400
+Subject: [PATCH] Mp4: avoid zero size buffers in output.
+
+Previously, data validation checks did not cover the cases when the output
+contained empty buffers.  Such buffers are considered illegal and produce
+"zero size buf in output" alerts.  The change rejects the mp4 files which
+produce such alerts.
+
+Also, the change fixes possible buffer overread and overwrite that could
+happen while processing empty stco and co64 atoms, as reported by
+Pavel Kohout (Aisle Research) and Tim Becker.
+
+(cherry picked from commit a172c880cb51f882a5dc999437e8b3a4f87630cc)
+
+CVE: CVE-2026-32647
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/a172c880cb51f882a5dc999437e8b3a4f87630cc]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/http/modules/ngx_http_mp4_module.c | 15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/src/http/modules/ngx_http_mp4_module.c b/src/http/modules/ngx_http_mp4_module.c
+index 041ad263b..13d87cd6a 100644
+--- a/src/http/modules/ngx_http_mp4_module.c
++++ b/src/http/modules/ngx_http_mp4_module.c
+@@ -901,8 +901,11 @@ ngx_http_mp4_process(ngx_http_mp4_file_t *mp4)
+         }
+     }
+ 
+-    if (end_offset < start_offset) {
+-        end_offset = start_offset;
++    if (end_offset <= start_offset) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "no data between start time and end time in \"%s\"",
++                      mp4->file.name.data);
++        return NGX_ERROR;
+     }
+ 
+     mp4->moov_size += 8;
+@@ -913,7 +916,7 @@ ngx_http_mp4_process(ngx_http_mp4_file_t *mp4)
+ 
+     *prev = &mp4->mdat_atom;
+ 
+-    if (start_offset > mp4->mdat_data.buf->file_last) {
++    if (start_offset >= mp4->mdat_data.buf->file_last) {
+         ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
+                       "start time is out mp4 mdat atom in \"%s\"",
+                       mp4->file.name.data);
+@@ -3416,7 +3419,7 @@ ngx_http_mp4_update_stsz_atom(ngx_http_mp4_file_t *mp4,
+     if (data) {
+         entries = trak->sample_sizes_entries;
+ 
+-        if (trak->start_sample > entries) {
++        if (trak->start_sample >= entries) {
+             ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
+                           "start time is out mp4 stsz samples in \"%s\"",
+                           mp4->file.name.data);
+@@ -3591,7 +3594,7 @@ ngx_http_mp4_update_stco_atom(ngx_http_mp4_file_t *mp4,
+         return NGX_ERROR;
+     }
+ 
+-    if (trak->start_chunk > trak->chunks) {
++    if (trak->start_chunk >= trak->chunks) {
+         ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
+                       "start time is out mp4 stco chunks in \"%s\"",
+                       mp4->file.name.data);
+@@ -3806,7 +3809,7 @@ ngx_http_mp4_update_co64_atom(ngx_http_mp4_file_t *mp4,
+         return NGX_ERROR;
+     }
+ 
+-    if (trak->start_chunk > trak->chunks) {
++    if (trak->start_chunk >= trak->chunks) {
+         ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
+                       "start time is out mp4 co64 chunks in \"%s\"",
+                       mp4->file.name.data);
diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-32647-2.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-32647-2.patch
new file mode 100644
index 0000000000..80bf94f5f1
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-32647-2.patch
@@ -0,0 +1,87 @@
+From 1742d7fe92ed355ffa5aa68609b96f00f582f3d6 Mon Sep 17 00:00:00 2001
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
+(cherry picked from commit b23ac73b00313d159a99636c21ef71b828781018)
+
+CVE: CVE-2026-32647
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/b23ac73b00313d159a99636c21ef71b828781018]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/http/modules/ngx_http_mp4_module.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/http/modules/ngx_http_mp4_module.c b/src/http/modules/ngx_http_mp4_module.c
+index 13d87cd6a..015e42c51 100644
+--- a/src/http/modules/ngx_http_mp4_module.c
++++ b/src/http/modules/ngx_http_mp4_module.c
+@@ -2297,7 +2297,7 @@ ngx_http_mp4_read_stts_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+                    "mp4 time-to-sample entries:%uD", entries);
+ 
+     if (ngx_mp4_atom_data_size(ngx_mp4_stts_atom_t)
+-        + entries * sizeof(ngx_mp4_stts_entry_t) > atom_data_size)
++        + (uint64_t) entries * sizeof(ngx_mp4_stts_entry_t) > atom_data_size)
+     {
+         ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
+                       "\"%s\" mp4 stts atom too small", mp4->file.name.data);
+@@ -2600,7 +2600,7 @@ ngx_http_mp4_read_stss_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     atom->last = atom_table;
+ 
+     if (ngx_mp4_atom_data_size(ngx_http_mp4_stss_atom_t)
+-        + entries * sizeof(uint32_t) > atom_data_size)
++        + (uint64_t) entries * sizeof(uint32_t) > atom_data_size)
+     {
+         ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
+                       "\"%s\" mp4 stss atom too small", mp4->file.name.data);
+@@ -2805,7 +2805,7 @@ ngx_http_mp4_read_ctts_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     atom->last = atom_table;
+ 
+     if (ngx_mp4_atom_data_size(ngx_mp4_ctts_atom_t)
+-        + entries * sizeof(ngx_mp4_ctts_entry_t) > atom_data_size)
++        + (uint64_t) entries * sizeof(ngx_mp4_ctts_entry_t) > atom_data_size)
+     {
+         ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
+                       "\"%s\" mp4 ctts atom too small", mp4->file.name.data);
+@@ -2987,7 +2987,7 @@ ngx_http_mp4_read_stsc_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+                    "sample-to-chunk entries:%uD", entries);
+ 
+     if (ngx_mp4_atom_data_size(ngx_mp4_stsc_atom_t)
+-        + entries * sizeof(ngx_mp4_stsc_entry_t) > atom_data_size)
++        + (uint64_t) entries * sizeof(ngx_mp4_stsc_entry_t) > atom_data_size)
+     {
+         ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
+                       "\"%s\" mp4 stsc atom too small", mp4->file.name.data);
+@@ -3365,7 +3365,7 @@ ngx_http_mp4_read_stsz_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     if (size == 0) {
+         if (ngx_mp4_atom_data_size(ngx_mp4_stsz_atom_t)
+-            + entries * sizeof(uint32_t) > atom_data_size)
++            + (uint64_t) entries * sizeof(uint32_t) > atom_data_size)
+         {
+             ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
+                           "\"%s\" mp4 stsz atom too small",
+@@ -3524,7 +3524,7 @@ ngx_http_mp4_read_stco_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     ngx_log_debug1(NGX_LOG_DEBUG_HTTP, mp4->file.log, 0, "chunks:%uD", entries);
+ 
+     if (ngx_mp4_atom_data_size(ngx_mp4_stco_atom_t)
+-        + entries * sizeof(uint32_t) > atom_data_size)
++        + (uint64_t) entries * sizeof(uint32_t) > atom_data_size)
+     {
+         ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
+                       "\"%s\" mp4 stco atom too small", mp4->file.name.data);
+@@ -3740,7 +3740,7 @@ ngx_http_mp4_read_co64_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     ngx_log_debug1(NGX_LOG_DEBUG_HTTP, mp4->file.log, 0, "chunks:%uD", entries);
+ 
+     if (ngx_mp4_atom_data_size(ngx_mp4_co64_atom_t)
+-        + entries * sizeof(uint64_t) > atom_data_size)
++        + (uint64_t) entries * sizeof(uint64_t) > atom_data_size)
+     {
+         ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
+                       "\"%s\" mp4 co64 atom too small", mp4->file.name.data);
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
index 80cd5e1609..ab15c10596 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -6,6 +6,8 @@ SRC_URI:append = " file://CVE-2023-44487.patch \
                    file://CVE-2026-27651.patch \
                    file://CVE-2026-27654.patch \
                    file://CVE-2026-28753.patch \
+                   file://CVE-2026-32647-1.patch \
+                   file://CVE-2026-32647-2.patch \
 "
 
 SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"

