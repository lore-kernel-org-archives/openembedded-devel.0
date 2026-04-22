Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53870F9EDC6
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 12:39:59 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81572.1776861597674524715
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 05:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fRkwqy/G;
 spf=pass (domain: mvista.com, ip: 74.125.82.177, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b4520f6b32so7034138eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 05:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1776861597; x=1777466397; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j4yZ9wDGBa7+8Rves+JfdvtUiqCqDgDcfKoqUuC3NRE=;
        b=fRkwqy/GWuq0apHRk7ypCBlNrtMG3OZb0imupo1V0Upx4au3lXDM0s5A0RSgEO3z0Q
         Ka/Xj/M0ROqZj/BN4HCEwehICnY+fEwp/6b5MT0/P6k05RDA+1mlMkWNAebj5g1OC/xN
         DGNuawFmRKdjirUIO2qP0Pz1TVbFz6+R1Q3Ew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776861597; x=1777466397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4yZ9wDGBa7+8Rves+JfdvtUiqCqDgDcfKoqUuC3NRE=;
        b=Bg7hXGUwwyPRAUlaHKiEY03pPYxi+V8cre3LXonyW1aZZr8wIGzXYRkhm0JcHVCX2w
         +709+f4xbWrXP6SKfE1IAhz4/rD/ZNeNxhfrgMs7aWRyM1Nz4rl7T12qOghCD6r+DZay
         0WgG/9/N7x3t5i8tltBRQwcJiogA/c8k/W3KZ3TUxRbmHv2HYZnBnN92g1fA7+6nS2FL
         SecTtTyG2GXi+j0+w7EpjHGEZiti3j1Bpi9wncHqVySUCEqxeJ7H9AHfpYWoUIUs5cSL
         vSd3YULEP5+fKiUtLBd9Xt2BkUhhiLposs18EtNO6zx6Y67ocetZu/nMaVdWPlX9zqTO
         nRAw==
X-Gm-Message-State: AOJu0YzQcDvYqvm5NmvT5zrf853CFXJF4f5aU229KAmxcXafoR3j6NuO
	8+FQBUpSF/ira5AKGr+CxewEEvuyS/HtJ8iF7GWLNvF96vj3aqW3tAbRHSttPyTgzYG/RNqZnMA
	yBPVtYh8=
X-Gm-Gg: AeBDieuVW/JBMDh9tpTGgEGahqmX5w1iZogdNkD7VagFoPCZQSeIRxVgjWQa735d92P
	bfv+smx5V745s05/OkHB9rU1+skUVBq4ahMmr+sEfu6S/2RbsMyJAkGtd1/02RgBqrwPds3gfR4
	KGbHSM5z5rKcYc4b+TPRE84+/H/PLLZMRwOFByKgEDd48E3ET7LS+tH1MobII3WCWnySSusneeP
	NgmVHP1nWY807M3X3JSSFRpUCvHtpJBI7fu4ZHmhIpLP394PG64C4AZU1tvGz0KhPEcnKcQ1yr8
	At6qiLJEk4uFcO+O1JnIxwemsNjm6Em0CIWvx4bIQwOft4BjNsMUd/BJMFCmWmB9SquXgtL+pVX
	mu4qnK2yZmRTQ+V3awoy+dGLdF7am+EKTmpNA+orOPX7S/R1Ghw7Ir2wUjivtqeSIvQg5UI20+o
	9RC4gGTruWGeSoV6i2f8g6sWOlA/46kyc9grWDh9Ptq0mWjw==
X-Received: by 2002:a05:693c:2b04:b0:2d8:8c38:8cec with SMTP id 5a478bee46e88-2e464eaa23emr10971346eec.2.1776861596763;
        Wed, 22 Apr 2026 05:39:56 -0700 (PDT)
Received: from MVIN00013.mvista.com ([43.249.234.191])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ab8b89csm23404189eec.12.2026.04.22.05.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:39:56 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-webserver][scarthgap][PATCH] nginx: fix CVE-2026-32647
Date: Wed, 22 Apr 2026 18:09:42 +0530
Message-ID: <20260422123942.106305-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 12:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126553

As per the advisory[1] mentioned in NVD[2], version 1.28.3 contains the fix.
Backport the commit[3] from 1.28.3 changelog matching the description.

[1] https://my.f5.com/manage/s/article/K000160366
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-32647
[3] https://github.com/nginx/nginx/commit/a172c880cb51f882a5dc999437e8b3a4f87630cc

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../nginx/nginx-1.24.0/CVE-2026-32647.patch   | 78 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-32647.patch

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-32647.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-32647.patch
new file mode 100644
index 0000000000..d7bedb6b8b
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-32647.patch
@@ -0,0 +1,78 @@
+From a172c880cb51f882a5dc999437e8b3a4f87630cc Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2026-32647
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/a172c880cb51f882a5dc999437e8b3a4f87630cc]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/http/modules/ngx_http_mp4_module.c | 15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/src/http/modules/ngx_http_mp4_module.c b/src/http/modules/ngx_http_mp4_module.c
+index a7f8be7..015e42c 100644
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
+-- 
+2.50.1
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
index d493a66ce9..b732e92b18 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -8,6 +8,7 @@ SRC_URI:append = " \
                   file://CVE-2026-27651.patch \
                   file://CVE-2026-27654.patch \
                   file://CVE-2026-28753.patch \
+                  file://CVE-2026-32647.patch \
 "
 
 SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"
-- 
2.50.1


