Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CACDDC433FE
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 11:14:23 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.6031.1668597261985044744
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Nov 2022 03:14:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JNq2CxQ6;
 spf=pass (domain: mvista.com, ip: 209.85.214.174, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f174.google.com with SMTP id b21so16108282plc.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Nov 2022 03:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lzgd6dDb2aBNJnqi8iGcf6loFzKrgW4MWorKwnWQxbA=;
        b=JNq2CxQ6QyUj5qIWSrAHNmKLe+evWKH85KoZSUc9A6pKoFyaic+fO6ow8ey0vNub2p
         4nDsrfNc075BfkgoWieeZzEp51En+4igcJMtHPzKVB2krueeCmvhkrcmBn1K3sPHj0Vi
         WXRGg6w6Kv+xGnvSThG2aTahxsdn+y5PhAp68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lzgd6dDb2aBNJnqi8iGcf6loFzKrgW4MWorKwnWQxbA=;
        b=yxWSHAguWGucZiWLkhs2RZjLySzgaZPN4pXBstMx9urqeAz8W6vo9W4JN1FuyBWOVy
         rjg+3zUsSTTyV573C0cvCrskSUeElLYXdKJCqtFojQ2ZZRIw2w6NvEmIx1saQWh3rCV7
         YW4FhY69Fm/UO3FOgUo2TZyWFNEnVlxb4x1gsnyLLcB8cjK+FwABXks15Td0u4WHjtUk
         whOUI5h8YrDI69JqiEgO0Wt08AxmV9pFbP2I6Ob/WLSvap7QZY+mxD2OqGmST8ttWKp4
         rHbqRJpjDI1M63K2Wm0vZvj/cL0LS5XQnITiG1ge0gy9fvI4oXOSt383u09nB0tGSZeV
         tjqQ==
X-Gm-Message-State: ANoB5pk9vCOF1rvU/Zk7PUa6ocoHOf5vNAcJypMfrHydBsrmSfzuOVau
	nJ4kbNhBb6sGJdvd9UWJJW+UbmDJ0vb0jw==
X-Google-Smtp-Source: AA0mqf75irmY+PYSdIOkl3ebcEiTwUAFw8idc0m/7cEP42He9RSukiH53LEwsD3CTl1i66VDf4OS7g==
X-Received: by 2002:a17:902:e946:b0:17f:66ae:b84 with SMTP id b6-20020a170902e94600b0017f66ae0b84mr8476526pll.32.1668597260993;
        Wed, 16 Nov 2022 03:14:20 -0800 (PST)
Received: from MVIN00024 ([150.129.170.236])
        by smtp.gmail.com with ESMTPSA id pv4-20020a17090b3c8400b00213c7cf21c0sm1306766pjb.5.2022.11.16.03.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 03:14:20 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Wed, 16 Nov 2022 16:44:14 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] nginx: CVE-2022-41741, CVE-2022-41742 Memory corruption in the ngx_http_mp4_module
Date: Wed, 16 Nov 2022 16:44:10 +0530
Message-Id: <20221116111410.38508-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Nov 2022 11:14:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99596

Upstream-Status: Backport from https://github.com/nginx/nginx/commit/6b022a5556af22b6e18532e547a6ae46b0d8c6ea

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../files/CVE-2022-41741-CVE-2022-41742.patch | 319 ++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.20.1.bb       |   4 +-
 2 files changed, 322 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2022-41741-CVE-2022-41742.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2022-41741-CVE-2022-41742.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2022-41741-CVE-2022-41742.patch
new file mode 100644
index 000000000..d151256b3
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2022-41741-CVE-2022-41742.patch
@@ -0,0 +1,319 @@
+From 91a3b5302d6a2467df70d3b43450991a53f9946b Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Wed, 16 Nov 2022 11:24:25 +0530
+Subject: [PATCH] CVE-2022-41741, CVE-2022-41742
+
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/6b022a5556af22b6e18532e547a6ae46b0d8c6ea]
+CVE: CVE-2022-41741, CVE-2022-41742
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+Mp4: disabled duplicate atoms.
+
+Most atoms should not appear more than once in a container.  Previously,
+this was not enforced by the module, which could result in worker process
+crash, memory corruption and disclosure.
+---
+ src/http/modules/ngx_http_mp4_module.c | 147 +++++++++++++++++++++++++
+ 1 file changed, 147 insertions(+)
+
+diff --git a/src/http/modules/ngx_http_mp4_module.c b/src/http/modules/ngx_http_mp4_module.c
+index 0e93fbd..4f4d89d 100644
+--- a/src/http/modules/ngx_http_mp4_module.c
++++ b/src/http/modules/ngx_http_mp4_module.c
+@@ -1070,6 +1070,12 @@ ngx_http_mp4_read_ftyp_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+         return NGX_ERROR;
+     }
+ 
++    if (mp4->ftyp_atom.buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 ftyp atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom_size = sizeof(ngx_mp4_atom_header_t) + (size_t) atom_data_size;
+ 
+     ftyp_atom = ngx_palloc(mp4->request->pool, atom_size);
+@@ -1128,6 +1134,12 @@ ngx_http_mp4_read_moov_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+         return NGX_DECLINED;
+     }
+ 
++    if (mp4->moov_atom.buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 moov atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     conf = ngx_http_get_module_loc_conf(mp4->request, ngx_http_mp4_module);
+ 
+     if (atom_data_size > mp4->buffer_size) {
+@@ -1195,6 +1207,12 @@ ngx_http_mp4_read_mdat_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     ngx_log_debug0(NGX_LOG_DEBUG_HTTP, mp4->file.log, 0, "mp4 mdat atom");
+ 
++    if (mp4->mdat_atom.buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 mdat atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     data = &mp4->mdat_data_buf;
+     data->file = &mp4->file;
+     data->in_file = 1;
+@@ -1321,6 +1339,12 @@ ngx_http_mp4_read_mvhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     ngx_log_debug0(NGX_LOG_DEBUG_HTTP, mp4->file.log, 0, "mp4 mvhd atom");
+ 
++    if (mp4->mvhd_atom.buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 mvhd atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom_header = ngx_mp4_atom_header(mp4);
+     mvhd_atom = (ngx_mp4_mvhd_atom_t *) atom_header;
+     mvhd64_atom = (ngx_mp4_mvhd64_atom_t *) atom_header;
+@@ -1586,6 +1610,13 @@ ngx_http_mp4_read_tkhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     atom_size = sizeof(ngx_mp4_atom_header_t) + (size_t) atom_data_size;
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_TKHD_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 tkhd atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->tkhd_size = atom_size;
+ 
+     ngx_mp4_set_32value(tkhd_atom->size, atom_size);
+@@ -1624,6 +1655,12 @@ ngx_http_mp4_read_mdia_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     trak = ngx_mp4_last_trak(mp4);
+ 
++    if (trak->out[NGX_HTTP_MP4_MDIA_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 mdia atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom = &trak->mdia_atom_buf;
+     atom->temporary = 1;
+     atom->pos = atom_header;
+@@ -1747,6 +1784,13 @@ ngx_http_mp4_read_mdhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     atom_size = sizeof(ngx_mp4_atom_header_t) + (size_t) atom_data_size;
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_MDHD_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 mdhd atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->mdhd_size = atom_size;
+     trak->timescale = timescale;
+ 
+@@ -1789,6 +1833,12 @@ ngx_http_mp4_read_hdlr_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     trak = ngx_mp4_last_trak(mp4);
+ 
++    if (trak->out[NGX_HTTP_MP4_HDLR_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 hdlr atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom = &trak->hdlr_atom_buf;
+     atom->temporary = 1;
+     atom->pos = atom_header;
+@@ -1817,6 +1867,12 @@ ngx_http_mp4_read_minf_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     trak = ngx_mp4_last_trak(mp4);
+ 
++    if (trak->out[NGX_HTTP_MP4_MINF_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 minf atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom = &trak->minf_atom_buf;
+     atom->temporary = 1;
+     atom->pos = atom_header;
+@@ -1860,6 +1916,15 @@ ngx_http_mp4_read_vmhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     trak = ngx_mp4_last_trak(mp4);
+ 
++    if (trak->out[NGX_HTTP_MP4_VMHD_ATOM].buf
++        || trak->out[NGX_HTTP_MP4_SMHD_ATOM].buf)
++    {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 vmhd/smhd atom in \"%s\"",
++                      mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom = &trak->vmhd_atom_buf;
+     atom->temporary = 1;
+     atom->pos = atom_header;
+@@ -1891,6 +1956,15 @@ ngx_http_mp4_read_smhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     trak = ngx_mp4_last_trak(mp4);
+ 
++    if (trak->out[NGX_HTTP_MP4_VMHD_ATOM].buf
++        || trak->out[NGX_HTTP_MP4_SMHD_ATOM].buf)
++    {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 vmhd/smhd atom in \"%s\"",
++                      mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom = &trak->smhd_atom_buf;
+     atom->temporary = 1;
+     atom->pos = atom_header;
+@@ -1922,6 +1996,12 @@ ngx_http_mp4_read_dinf_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     trak = ngx_mp4_last_trak(mp4);
+ 
++    if (trak->out[NGX_HTTP_MP4_DINF_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 dinf atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom = &trak->dinf_atom_buf;
+     atom->temporary = 1;
+     atom->pos = atom_header;
+@@ -1950,6 +2030,12 @@ ngx_http_mp4_read_stbl_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     trak = ngx_mp4_last_trak(mp4);
+ 
++    if (trak->out[NGX_HTTP_MP4_STBL_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stbl atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom = &trak->stbl_atom_buf;
+     atom->temporary = 1;
+     atom->pos = atom_header;
+@@ -2018,6 +2104,12 @@ ngx_http_mp4_read_stsd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     trak = ngx_mp4_last_trak(mp4);
+ 
++    if (trak->out[NGX_HTTP_MP4_STSD_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stsd atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom = &trak->stsd_atom_buf;
+     atom->temporary = 1;
+     atom->pos = atom_header;
+@@ -2086,6 +2178,13 @@ ngx_http_mp4_read_stts_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     atom_end = atom_table + entries * sizeof(ngx_mp4_stts_entry_t);
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_STTS_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stts atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->time_to_sample_entries = entries;
+ 
+     atom = &trak->stts_atom_buf;
+@@ -2291,6 +2390,13 @@ ngx_http_mp4_read_stss_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+                    "sync sample entries:%uD", entries);
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_STSS_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stss atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->sync_samples_entries = entries;
+ 
+     atom_table = atom_header + sizeof(ngx_http_mp4_stss_atom_t);
+@@ -2489,6 +2595,13 @@ ngx_http_mp4_read_ctts_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+                    "composition offset entries:%uD", entries);
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_CTTS_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 ctts atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->composition_offset_entries = entries;
+ 
+     atom_table = atom_header + sizeof(ngx_mp4_ctts_atom_t);
+@@ -2692,6 +2805,13 @@ ngx_http_mp4_read_stsc_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     atom_end = atom_table + entries * sizeof(ngx_mp4_stsc_entry_t);
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_STSC_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stsc atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->sample_to_chunk_entries = entries;
+ 
+     atom = &trak->stsc_atom_buf;
+@@ -3024,6 +3144,13 @@ ngx_http_mp4_read_stsz_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+                    "sample uniform size:%uD, entries:%uD", size, entries);
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_STSZ_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stsz atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->sample_sizes_entries = entries;
+ 
+     atom_table = atom_header + sizeof(ngx_mp4_stsz_atom_t);
+@@ -3207,6 +3334,16 @@ ngx_http_mp4_read_stco_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     atom_end = atom_table + entries * sizeof(uint32_t);
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_STCO_ATOM].buf
++        || trak->out[NGX_HTTP_MP4_CO64_ATOM].buf)
++    {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stco/co64 atom in \"%s\"",
++                      mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->chunks = entries;
+ 
+     atom = &trak->stco_atom_buf;
+@@ -3413,6 +3550,16 @@ ngx_http_mp4_read_co64_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     atom_end = atom_table + entries * sizeof(uint64_t);
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_STCO_ATOM].buf
++        || trak->out[NGX_HTTP_MP4_CO64_ATOM].buf)
++    {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stco/co64 atom in \"%s\"",
++                      mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->chunks = entries;
+ 
+     atom = &trak->co64_atom_buf;
+-- 
+2.25.1
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
index d686c627f..09a1b4559 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
@@ -1,6 +1,8 @@
 require nginx.inc
 
-SRC_URI += "file://CVE-2021-3618.patch"
+SRC_URI += "file://CVE-2021-3618.patch \
+            file://CVE-2022-41741-CVE-2022-41742.patch \
+           "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=206629dc7c7b3e87acb31162363ae505"
 
-- 
2.25.1


