Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B86DEE9D83C
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 05:28:58 +0000 (UTC)
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49070.1775453332202516039
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 22:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=e8/WM4dB;
 spf=pass (domain: mvista.com, ip: 74.125.82.45, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12776bebe9fso8462426c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 22:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775453331; x=1776058131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zjRQrzxT0ubjcZoalkI3frChePopNupTGKMVNhkCurE=;
        b=e8/WM4dBaSMCsxR363scLLhFC4doaRznXhYycSz1x4mW2yQYQvZH8XysCSyp0h55DE
         aSqpAdIFzDlObgr3XnPrvM9B9j5WgyuVCNYNBBt3sG5ELJsNkewVPmByAUpgMaJr3aOf
         46yIXkuLzmgWnJy9bCkmgLrNLKT5tsFwHXKQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775453331; x=1776058131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjRQrzxT0ubjcZoalkI3frChePopNupTGKMVNhkCurE=;
        b=J3EYBfj+wWu4OEyyxvm5ucXMDOIMtYB5+SYzI9Hgh+SzeX1Ab/RIanPufjMPR1C6ws
         Z/OrKwgwZlTEMU9VXR6pEu8UJjJcIRLkFfSf4SHyx6C6W428HWOEnwjezsQeDhaTloat
         fNUwOMb3PzlUXM2VyqGbXMP1/fR2frbiVZxV0nkRBkvdMBc2Aj7FwfCwfxBl7HpXLAap
         zl+AqDXIvU1j7Job7+ek0JSl9Ng+h3qOWTXSSvbHWL9QEUXLpsGgyOUpM4ftLKPua4CR
         jGPBwgJWtSyYWlnZj6jfBZWy4X+Y/o6CZKrXIoFNJXbJ33tJ38ANG67b3kkXsBDo+UqM
         2Sdw==
X-Gm-Message-State: AOJu0Yx/YVNtp1xTDOlBVY99YoThw8rI4TT0NU9mudR9BiHdF0N48ldU
	R8BP6QWjTaDE3AfwozFyqAMUgLQEkt5fV1KfYzT2f5kh+zFFWimPy8S1DLX2+YXVL/1mhqWjkB5
	Y55H82j8=
X-Gm-Gg: AeBDiesoVLBpWy53I15xJuO/wHQgCuhsnDyPY+GE0enMTDlh49zvIz0VI/GcdP06JNz
	qNXAML8UzRwQddSX0RaF2y1EDc8Ofw6pO/3/UAOhChDk6Juwd/roK8faEE28qNdK16+rQrL2Yjy
	MrqaBG55/zmVcFa7sI/yjDlNntJHHLSC00MTe/807HV6Tc4UyeyZdVJ8AncU4ETuI5mTvkwUe8q
	vo8cor7YIOehHFB0FFEcI3xmAsDt8h85ibBBILoENbQIRcAkyeFT7hyXgyfinUZQZ+WNkFT2agm
	4g69/2McsQE92Ck+2RHWkADG/vjE00avIjB4A3K0eWeoljhEY21tXUrS3GuNc0MBbW+cNG+ow94
	FGcL7RmWhDkixYn8Vj1CmK9OsVzaU/tzcPlAsVWJ7vd52dffuTDz+/FD1OvenHPZqDkgIamC18P
	4eBgHbicY+jC0oRZk6h81v/DeEa6u6zV1jt0fq
X-Received: by 2002:a05:7022:eacb:b0:12a:6ab7:3f8a with SMTP id a92af1059eb24-12bfb6ecb1dmr5234192c88.3.1775453331172;
        Sun, 05 Apr 2026 22:28:51 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bfea5f860sm9109874c88.2.2026.04.05.22.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 22:28:50 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-webserver][scarthgap][PATCH] nginx: Fix for CVE-2026-27784
Date: Mon,  6 Apr 2026 10:58:23 +0530
Message-ID: <20260406052824.102268-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 05:28:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126024

Pick patch from [1] which mentioned in debian report with [2]
[1] https://github.com/nginx/nginx/commit/b23ac73b00313d159a99636c21ef71b828781018
[2] https://security-tracker.debian.org/tracker/CVE-2026-27784

More details: https://nvd.nist.gov/vuln/detail/CVE-2026-27784

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../nginx/files/CVE-2026-27784.patch          | 88 +++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx.inc  |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-27784.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-27784.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-27784.patch
new file mode 100644
index 0000000000..41a8563c67
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-27784.patch
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
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 722e2508d4..05e3cab44d 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -28,6 +28,7 @@ SRC_URI = " \
     file://CVE-2025-53859.patch \
     file://CVE-2025-23419.patch \
     file://CVE-2026-1642.patch \
+    file://CVE-2026-27784.patch \
 "
 
 inherit siteinfo update-rc.d useradd systemd
-- 
2.50.1


