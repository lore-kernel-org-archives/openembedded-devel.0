Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13004C4332F
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 05:42:52 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.3523.1668577365088841610
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Nov 2022 21:42:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=X29VjJ0d;
 spf=pass (domain: mvista.com, ip: 209.85.214.171, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f171.google.com with SMTP id y4so15469522plb.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Nov 2022 21:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Duxx6C5lMNAP5fQKyZ4yzrCH88KGtbxkDAkhMN9uuaQ=;
        b=X29VjJ0dNEQQWB0itkQNyDrgxLQGdDG8ToTwBAHt3CY+cq4dFKYZps2G6jEY8AjTaa
         cWZDaohbGBDaeumo0mXE6rBk+o+nxyz9QyklceXOFEfHceD5ihr7o+C4gGUCssWbwUgg
         ByhdNbEU3yGCrVzXp0WAByEnI+M89cS5e5HLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Duxx6C5lMNAP5fQKyZ4yzrCH88KGtbxkDAkhMN9uuaQ=;
        b=SbTIEbUVD59dbG/ennnyJW3P5tE8s1/5N4HUKPDYL6fiDqESiAELXb4r9hFnq7wbqz
         XW1+/T4pg+w7fr6Dm+LuIcSLlx0BoeHgqU2UAm2LrRbOymO+//dH1PPegtpBvwG/o3B0
         +RCpUtntsvGsmBhDd5oCgfFh62W52QSoKMOQWQmmb0JiHJAgJmWQfXBlWw5QxChWo+nY
         mH3pwb3xPHg2C/UQRRBV6m6nH8y33o5AnKz1jGleXW2dfMlKDMDOOkC511OrkPv8IQE6
         Ib+clN+88fOZT824nZCOosWb0VRhIhwn4r1dQ0tKV1Nh85V5izfPXVLFHE8UUX1ipPC+
         fZdA==
X-Gm-Message-State: ANoB5plQnYUG4pZ/mlMfVCZoHlqGkEcfpxPYWDxNSV6pU3YW9AFUUWKV
	gqWtUNWSoqiN4r5Q4jtKGkdEaN5QmZEfhg==
X-Google-Smtp-Source: AA0mqf77Yv50pkAkw1rgobJUN+2blXYRNcZP265OQ7Gia4S0fsnaw490Obrqe/Ib4kndAxeixKZIog==
X-Received: by 2002:a17:902:6b8b:b0:17c:620f:13ac with SMTP id p11-20020a1709026b8b00b0017c620f13acmr7516000plk.9.1668577363918;
        Tue, 15 Nov 2022 21:42:43 -0800 (PST)
Received: from MVIN00024 ([150.129.170.236])
        by smtp.gmail.com with ESMTPSA id x13-20020a62860d000000b00562a526cd2esm9818552pfd.55.2022.11.15.21.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 21:42:43 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Wed, 16 Nov 2022 11:12:38 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] nginx: CVE-2022-41741, CVE-2022-41742 Memory corruption in the ngx_http_mp4_module
Date: Wed, 16 Nov 2022 11:12:35 +0530
Message-Id: <20221116054235.24435-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Nov 2022 05:42:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99593

Upstream-Status: Backport from https://github.com/nginx/nginx/commit/6b022a5556af22b6e18532e547a6ae46b0d8c6ea

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../files/CVE-2022-41741-CVE-2022-41742.patch | 319 ++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.16.1.bb       |   4 +-
 2 files changed, 322 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2022-41741-CVE-2022-41742.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2022-41741-CVE-2022-41742.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2022-41741-CVE-2022-41742.patch
new file mode 100644
index 000000000..8a8a35b2d
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2022-41741-CVE-2022-41742.patch
@@ -0,0 +1,319 @@
+From 9563a2a08c007d78a6796b0232201bf7dc4a8103 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Wed, 16 Nov 2022 10:28:24 +0530
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
+index 618bf78..7b7184d 100644
+--- a/src/http/modules/ngx_http_mp4_module.c
++++ b/src/http/modules/ngx_http_mp4_module.c
+@@ -1076,6 +1076,12 @@ ngx_http_mp4_read_ftyp_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
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
+@@ -1134,6 +1140,12 @@ ngx_http_mp4_read_moov_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
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
+@@ -1201,6 +1213,12 @@ ngx_http_mp4_read_mdat_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
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
+@@ -1327,6 +1345,12 @@ ngx_http_mp4_read_mvhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
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
+@@ -1592,6 +1616,13 @@ ngx_http_mp4_read_tkhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
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
+@@ -1630,6 +1661,12 @@ ngx_http_mp4_read_mdia_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
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
+@@ -1753,6 +1790,13 @@ ngx_http_mp4_read_mdhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
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
+@@ -1795,6 +1839,12 @@ ngx_http_mp4_read_hdlr_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
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
+@@ -1823,6 +1873,12 @@ ngx_http_mp4_read_minf_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
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
+@@ -1866,6 +1922,15 @@ ngx_http_mp4_read_vmhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
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
+@@ -1897,6 +1962,15 @@ ngx_http_mp4_read_smhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
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
+@@ -1928,6 +2002,12 @@ ngx_http_mp4_read_dinf_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
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
+@@ -1956,6 +2036,12 @@ ngx_http_mp4_read_stbl_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
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
+@@ -2024,6 +2110,12 @@ ngx_http_mp4_read_stsd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
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
+@@ -2092,6 +2184,13 @@ ngx_http_mp4_read_stts_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
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
+@@ -2297,6 +2396,13 @@ ngx_http_mp4_read_stss_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
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
+@@ -2495,6 +2601,13 @@ ngx_http_mp4_read_ctts_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
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
+@@ -2698,6 +2811,13 @@ ngx_http_mp4_read_stsc_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
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
+@@ -3030,6 +3150,13 @@ ngx_http_mp4_read_stsz_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
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
+@@ -3199,6 +3326,16 @@ ngx_http_mp4_read_stco_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
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
+@@ -3383,6 +3520,16 @@ ngx_http_mp4_read_co64_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
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
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb
index 09d58b8fb..07e9f6ddb 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb
@@ -5,4 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
 SRC_URI[md5sum] = "45a80f75336c980d240987badc3dcf60"
 SRC_URI[sha256sum] = "f11c2a6dd1d3515736f0324857957db2de98be862461b5a542a3ac6188dbe32b"
 
-SRC_URI += "file://CVE-2019-20372.patch"
+SRC_URI += "file://CVE-2019-20372.patch \
+            file://CVE-2022-41741-CVE-2022-41742.patch \
+           "
-- 
2.25.1


