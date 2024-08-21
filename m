Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20025C52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 06:59:22 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.14539.1724223555676556349
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Aug 2024 23:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Wvkanmaf;
 spf=pass (domain: mvista.com, ip: 209.85.214.178, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-201fba05363so43814455ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Aug 2024 23:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1724223555; x=1724828355; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Pk35z+XgAmDg4IGE5BJgzRl53+w5xvFgeCQX1LDY74=;
        b=WvkanmafgGC7w23skY5zNlaj1EonBmZOhQrtuioKDB72Uw/JTppcivLfAzQfNpITuh
         uzpXSkwAEUuqop1b7aRE6EhX4YGESFBvKS4yUkPVxbeUaWzxAqTfI8qV1+mCju+QAGZg
         XUMU5JtTpVG1bgu3C4bXCpglytNGXhaaUlrAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724223555; x=1724828355;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Pk35z+XgAmDg4IGE5BJgzRl53+w5xvFgeCQX1LDY74=;
        b=YPepFb4WVh5EDL5l0OrvLKJBWWdTs6AuRtFrtONfDyLHZcPou111u8JkJ5YYJVAHTf
         dS3j7QyjF9x8+EbgH5fuIGYZzyhFVBcHpTaBmzV9wzr4XkOIiP18EakSMMhA02YJ9k3/
         jtTvyEbDIj1m8ZSzgn3so43icvB4S+q+pYHQbwBaxdZWG8bTjjgXYAtN2n3+UCb9RuRI
         dvdVxEGZWNeQ8GL82Pn1wUbhmvQw9o+kVXWol5OetFR19QH+Gf6lhlR70gNAL8vQrReM
         vrjCmutcSzeSqag3/1q0dDdRzssXj3x4pDIEIzVuq8VUvR8s//lVYE3TBlx/slvlSNYq
         cJxA==
X-Gm-Message-State: AOJu0YyxkmTBb5P4eguxS+u1wtWJfrpDvJCsLvmArE5V2mzE5QbyR++a
	Qp0Yl+gXXgtR1HeT1w/ag2hiLntVEfMD1ZpTZTWIEQxjtyEpVLlfDhgAreLqYEE1miCd7Wib4h6
	u
X-Google-Smtp-Source: AGHT+IE9hdjbnSqAwyzHqdxjd+0LO9bsQgnEfNevByQuc/xmhyu4tnQWVIDzdz658CnlmFnvKCAKeg==
X-Received: by 2002:a17:903:1d2:b0:202:4712:e838 with SMTP id d9443c01a7336-20367c0ff42mr11758335ad.14.1724223554546;
        Tue, 20 Aug 2024 23:59:14 -0700 (PDT)
Received: from asharma-Latitude-3400 ([42.108.26.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f039e09csm87654975ad.244.2024.08.20.23.59.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2024 23:59:14 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Wed, 21 Aug 2024 12:29:07 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [oe][meta-webserver][scarthgap][PATCH V2] nginx: Backport fix for CVE-2024-7347
Date: Wed, 21 Aug 2024 12:29:06 +0530
Message-Id: <20240821065906.7509-1-asharma@mvista.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 06:59:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111879

Upstream-Status: Backport [https://github.com/nginx/nginx/commit/88955b1044ef38315b77ad1a509d63631a790a0f and https://github.com/nginx/nginx/commit/7362d01658b61184108c21278443910da68f93b4]

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
index 0000000000..23723d63d4
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
index 0000000000..5b8d08a1e1
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
index 83ae90c40c..926db19443 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -23,6 +23,8 @@ SRC_URI = " \
     file://nginx.service \
     file://nginx-fix-pidfile.patch \
     file://0001-configure-libxslt-conf.patch \
+    file://CVE-2024-7347-1.patch \
+    file://CVE-2024-7347-2.patch \
 "
 
 inherit siteinfo update-rc.d useradd systemd
-- 
2.17.1


