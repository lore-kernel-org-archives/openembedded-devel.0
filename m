Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02007C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 05:05:42 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.141591.1723784739988806235
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Aug 2024 22:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=cSy2Oi+Y;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fc587361b6so16408895ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 22:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1723784739; x=1724389539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sw9RMC6g0FlvjABC64TFHCZjt5Z9N33gkYqeceAfb/o=;
        b=cSy2Oi+YZDxkRIHP8FUNPxFO6iUxvNuTKE5q+azsEZZd1fTIybUAfphIKtmluAQXPP
         BIxDH3freRYw8iePD0NYjPOEayB2PW0L7fQpMZzKi1ykNa44wdyaI1IZFryA94AMA1n3
         U1kPuqIkvIYHpK+QcqxCLsxkylJjPw7zEDO6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723784739; x=1724389539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sw9RMC6g0FlvjABC64TFHCZjt5Z9N33gkYqeceAfb/o=;
        b=f50IREPLTaK974Z5DgFqD9EaPMAPZzvctyFO4czZyn1L6NNsH6DcCaZ6Vr5nQ7UMdY
         u91AInQcvPonMzN5WP6AvjXFs81ESyyzUDMTFMusSSz3+KhDmmMCot9e6uFSjalZowuY
         9wtzHGgRmn5YsAAULar+QpBSCEup1uVxciECYm6GRTMgEYKce/cp3cZ1cXzMCYvvyL0z
         dq6+FB6e6ND9OmX7FUmb87OlZkb4mOe+yCpCIdstDQgHV3GjYbnHcB+37yefG7kh6c+Z
         4iKTDnMludNS6RE23gG4WVZWX3q8GxJTlcQlA8WiE3lKifUMMO/uVuahkHOh3NXfuXYG
         jq7w==
X-Gm-Message-State: AOJu0YwFE1xWGXsHy6mHd0PZZgvJfHDRSKDa7gggW291Fmv/qi/PE2G3
	3sHhdton6q8OpReGPb8ULYlwl0pdIKydbz3ChQDV1noHf4RbVDFQH41z5bOZyFkfJrK+oOG15eC
	u
X-Google-Smtp-Source: AGHT+IEA7chMTtODucb08BXxeTbz9O0i1g+WZuFK4a7yWXgBOYTjPLs360vIoGM2TobIZff0r02hQg==
X-Received: by 2002:a17:902:f647:b0:1fd:7664:d870 with SMTP id d9443c01a7336-20203f31ff5mr19042975ad.51.1723784739082;
        Thu, 15 Aug 2024 22:05:39 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.83.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f03a1951sm17977905ad.266.2024.08.15.22.05.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Aug 2024 22:05:38 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Fri, 16 Aug 2024 10:33:23 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [oe][meta-oe][scarthgap][PATCH] nginx: Backport fix for CVE-2024-7347
Date: Fri, 16 Aug 2024 10:33:22 +0530
Message-ID: <20240816050322.17844-1-asharma@mvista.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Aug 2024 05:05:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111827

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
2.44.1


