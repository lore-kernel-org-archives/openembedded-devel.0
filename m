Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E43C52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 06:53:02 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.14247.1724223173178343871
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Aug 2024 23:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XnNBDsK1;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2021c08b95cso3506925ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Aug 2024 23:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1724223172; x=1724827972; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOG+s+X/HfDXYh9daPfFIjj9ILffM7RAQbLYvJAl9m0=;
        b=XnNBDsK12ZcIEA9/Ft2Eal180PIauypgIA0YKTb+iJs4CR1Z4QkEViVs/lGdEDcNYb
         IXxDhIS6DFvBtvbrvY2MCMk8U5YzopJQgVSCQRkS5BYQjV2dYhTrF2usglpzvXqYUBVD
         72897Xhz0KzTYzwX6DqtZU+hm6zlU/sMT97yQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724223172; x=1724827972;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOG+s+X/HfDXYh9daPfFIjj9ILffM7RAQbLYvJAl9m0=;
        b=bmY9hcF+Xi/HFnlQpuJVr8eiA5HYM9PqWyWBAuP3sfDcoYF2k/o40qLc8qY9HLDiRJ
         18+wqcmcxOpVt3BRSd9jV0wCQGiul/dFbuvL5RbJ/dZ9s7ERbfjFux9UBaJ9h/+jzqCW
         re5uRMdHF/Kh1WLxSsoHJMhj6vQHgIPA75l1AGjvPNAxKdxu1oezfOxP6gerpenfbn5U
         m9NmnJGJgm+nyjz53QFLHQ1pw7N8xFc7q2zWYtEBzADLb2R1GH5m5d5DDD9wHKnZ+bRb
         qqF1norMueKfXMLHZlx9VujKg13YFlM1JwDAO/HElEPf0vld7t5cpFQZs4J31Vc3unD0
         Ezug==
X-Gm-Message-State: AOJu0Yxr6WTY166pfh12JO3k/uWI5pZt1g8K3KwlShKqVck6zkxx4KPy
	WofdvkPKG2oKsi5P2/9qKu3WOGqu6mGz4jqEnxfvaPY6jLsD5VEz2xhfWQtRGN0p6sc8t/NLZ7x
	3
X-Google-Smtp-Source: AGHT+IEG84AQS1uk3OZn4FEVJAv4+gKvQ96uekFyMmh/VsHAMytqmp1bfTmwXVosZFhOIQx25gfmCg==
X-Received: by 2002:a17:902:da8a:b0:1fd:9c2d:2f14 with SMTP id d9443c01a7336-203680881c9mr16785705ad.32.1724223172057;
        Tue, 20 Aug 2024 23:52:52 -0700 (PDT)
Received: from asharma-Latitude-3400 ([2402:3a80:4399:96ec:718d:1c5e:b08f:49f7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201ffb8f0d6sm79599395ad.28.2024.08.20.23.52.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2024 23:52:51 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Wed, 21 Aug 2024 12:22:45 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [oe][meta-webserver][kirkstone][PATCH] nginx: Backport fix for CVE-2024-7347
Date: Wed, 21 Aug 2024 12:22:43 +0530
Message-Id: <20240821065243.6534-1-asharma@mvista.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 06:53:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111878

Upstream-Status: Backport [https://github.com/nginx/nginx/commit/88955b1044ef38315b77ad1a509d63631a790a0f &
https://github.com/nginx/nginx/commit/7362d01658b61184108c21278443910da68f93b4]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../nginx/files/CVE-2024-7347-1.patch         | 34 ++++++++++++
 .../nginx/files/CVE-2024-7347-2.patch         | 52 +++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx.inc  |  2 +
 3 files changed, 88 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-1.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-2.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-1.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-1.patch
new file mode 100644
index 000000000..23723d63d
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-1.patch
@@ -0,0 +1,34 @@
+From 88955b1044ef38315b77ad1a509d63631a790a0f Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Mon, 12 Aug 2024 18:20:45 +0400
+Subject: [PATCH] Mp4: rejecting unordered chunks in stsc atom.
+
+Unordered chunks could result in trak->end_chunk smaller than trak->start_chunk
+in ngx_http_mp4_crop_stsc_data().  Later in ngx_http_mp4_update_stco_atom()
+this caused buffer overread while trying to calculate trak->end_offset.
+
+CVE: CVE-2024-7347
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/88955b1044ef38315b77ad1a509d63631a790a0f]
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ src/http/modules/ngx_http_mp4_module.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/http/modules/ngx_http_mp4_module.c b/src/http/modules/ngx_http_mp4_module.c
+index 1cd017c274..041ad263b5 100644
+--- a/src/http/modules/ngx_http_mp4_module.c
++++ b/src/http/modules/ngx_http_mp4_module.c
+@@ -3156,6 +3156,13 @@ ngx_http_mp4_crop_stsc_data(ngx_http_mp4_file_t *mp4,
+ 
+         next_chunk = ngx_mp4_get_32value(entry->chunk);
+ 
++        if (next_chunk < chunk) {
++            ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                          "unordered mp4 stsc chunks in \"%s\"",
++                          mp4->file.name.data);
++            return NGX_ERROR;
++        }
++
+         ngx_log_debug5(NGX_LOG_DEBUG_HTTP, mp4->file.log, 0,
+                        "sample:%uD, chunk:%uD, chunks:%uD, "
+                        "samples:%uD, id:%uD",
diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-2.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-2.patch
new file mode 100644
index 000000000..5b8d08a1e
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-2.patch
@@ -0,0 +1,52 @@
+From 7362d01658b61184108c21278443910da68f93b4 Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Mon, 12 Aug 2024 18:20:43 +0400
+Subject: [PATCH] Mp4: fixed buffer underread while updating stsz atom.
+
+While cropping an stsc atom in ngx_http_mp4_crop_stsc_data(), a 32-bit integer
+overflow could happen, which could result in incorrect seeking and a very large
+value stored in "samples".  This resulted in a large invalid value of
+trak->end_chunk_samples.  This value is further used to calculate the value of
+trak->end_chunk_samples_size in ngx_http_mp4_update_stsz_atom().  While doing
+this, a large invalid value of trak->end_chunk_samples could result in reading
+memory before stsz atom start.  This could potentially result in a segfault.
+
+CVE: CVE-2024-7347
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/7362d01658b61184108c21278443910da68f93b4]
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ src/http/modules/ngx_http_mp4_module.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/src/http/modules/ngx_http_mp4_module.c b/src/http/modules/ngx_http_mp4_module.c
+index 03175dea21..1cd017c274 100644
+--- a/src/http/modules/ngx_http_mp4_module.c
++++ b/src/http/modules/ngx_http_mp4_module.c
+@@ -3099,7 +3099,8 @@ static ngx_int_t
+ ngx_http_mp4_crop_stsc_data(ngx_http_mp4_file_t *mp4,
+     ngx_http_mp4_trak_t *trak, ngx_uint_t start)
+ {
+-    uint32_t               start_sample, chunk, samples, id, next_chunk, n,
++    uint64_t               n;
++    uint32_t               start_sample, chunk, samples, id, next_chunk,
+                            prev_samples;
+     ngx_buf_t             *data, *buf;
+     ngx_uint_t             entries, target_chunk, chunk_samples;
+@@ -3160,7 +3161,7 @@ ngx_http_mp4_crop_stsc_data(ngx_http_mp4_file_t *mp4,
+                        "samples:%uD, id:%uD",
+                        start_sample, chunk, next_chunk - chunk, samples, id);
+ 
+-        n = (next_chunk - chunk) * samples;
++        n = (uint64_t) (next_chunk - chunk) * samples;
+ 
+         if (start_sample < n) {
+             goto found;
+@@ -3182,7 +3183,7 @@ ngx_http_mp4_crop_stsc_data(ngx_http_mp4_file_t *mp4,
+                    "sample:%uD, chunk:%uD, chunks:%uD, samples:%uD",
+                    start_sample, chunk, next_chunk - chunk, samples);
+ 
+-    n = (next_chunk - chunk) * samples;
++    n = (uint64_t) (next_chunk - chunk) * samples;
+ 
+     if (start_sample > n) {
+         ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 9cbe35a13..4e744de27 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -24,6 +24,8 @@ SRC_URI = " \
     file://nginx-fix-pidfile.patch \
     file://0001-configure-libxslt-conf.patch \
     file://CVE-2023-44487.patch \
+    file://CVE-2024-7347-1.patch \
+    file://CVE-2024-7347-2.patch \
 "
 
 inherit siteinfo update-rc.d useradd systemd
-- 
2.17.1


