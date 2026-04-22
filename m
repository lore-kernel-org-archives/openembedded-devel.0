Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CAEF94CDE
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 11:57:19 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80867.1776859029585816541
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 04:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=QJpgKK3G;
 spf=pass (domain: mvista.com, ip: 74.125.82.173, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2d9916deb14so9824786eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 04:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1776859029; x=1777463829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sPbfdhwREmAqOxhtO/qY0pg7jvJ99QquoIMLFi8Yvn4=;
        b=QJpgKK3GDCf0qYIs3O4ecFjJGUpAL9bfxuvT4+3wxUtWl82GquxXI0uAgagV63cfxR
         D4TTivRJ8yb/tnY2aR9ECI41qc8Q2chYhgda2B36Kh5IbSfHttef6QU//azMHwpyaFYn
         Q6XvxXGx0P3rhDmfMxh3Dztdysb4M+SA3pWz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859029; x=1777463829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPbfdhwREmAqOxhtO/qY0pg7jvJ99QquoIMLFi8Yvn4=;
        b=BQv+zZJUrdrqcxeF2hOI8hsWfPDHsoMOvRnYp+dRQoduTEmFcoEKrmeLacC4bznYl/
         io9G8K7ShYpbAOlashNlDkZhswvqhBLjEd1oluAxk1DK60D4M1Cm2Xj/PJI6LP++3m2s
         Cow3akv5I0f8o8Y6eU6SGhOP77IprPHhxjP5GJJMd52j3W1BlRsByydHW/Fiht70ZuWt
         n4jr2zzvry8XnDed6WemwfleSAdfB2f3cgPykB5ocuDni26xdDoZYqIW57tuwXRMkoNV
         QVKVyNNCFxFXhgchyZQRmPfk2oKp0fFremdGjUhru42/jiO2zVJ9L7ocuQgaYKWcIwO8
         vjKw==
X-Gm-Message-State: AOJu0Yyxw8Vm7Crb2N3IyXiddYbBeJall9GsHjgjl4MPPhKBlxSHxYha
	XNSpXYNjJpRpEIsCuZkIhTb1OR2agj9O0uFflJQ//u3aQF4XCbyz6ICOasqcffEctxx/tOGRYZE
	LzbkLcL0=
X-Gm-Gg: AeBDiesSPP6Fw8w8Pi1E+34gIHbiYL5sivUg3JmQHkmb6DEIJhFZaYvIaka1kx6hd0i
	yZpRVWX5wfVjHnIlYeyJIQe8+wh0zqg0U/OtyNpe3pIIGMn6UuMqBjTn+Kpi3ekjTnJ0npfwzcL
	y9V4bFSkW2OPa7bz45EGVMRWXMq7UjGvP/IfLdJ8vIkqgihenlEde+f392ywOgH84KqyD4rZRpb
	M79ugm95XaA8yKj3RTd4dW6zO2SVwsv52Yj88OKe7lwyCYnXytQuoaZTPlTcRMc24sIsXEbgoSE
	+n0lPglyqSco6MvkgWSJJCEY9GudbQJ0Pt3pKYC18U2R1FtLiHFW2j4Aj3GBRE8JHfZcw56NNU+
	2Xz+cOXgWb8Pdj9i9QDQ70kw2SqtpJWYHEc445p7nVdcQ1rtUZYW7hXol/0pcwkznNoqkkETeOW
	AAPifdZAN/ec8hfCaBkvN49Kl8ztWipCqabdFiS94OxZAquQ==
X-Received: by 2002:a05:7300:e611:b0:2d8:7302:d37 with SMTP id 5a478bee46e88-2e466044875mr12170799eec.1.1776859028513;
        Wed, 22 Apr 2026 04:57:08 -0700 (PDT)
Received: from MVIN00013.mvista.com ([43.249.234.191])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d4bdaf7sm22103452eec.25.2026.04.22.04.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 04:57:08 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-webserver][kirkstone][PATCH] nginx: fix CVE-2026-32647
Date: Wed, 22 Apr 2026 17:27:01 +0530
Message-ID: <20260422115701.29537-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 11:57:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126552

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
index a8bbfae9f5..57c03e14cb 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -8,6 +8,7 @@ SRC_URI:append = " \
 		  file://CVE-2026-27651.patch \
 		  file://CVE-2026-27654.patch \
 		  file://CVE-2026-28753.patch \
+		  file://CVE-2026-32647.patch \
 		"
 
 SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"
-- 
2.50.1


