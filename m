Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5145CCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 19:09:31 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.53293.1760382563198060598
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 12:09:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fUNnXOAX;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ee130237a8so3661585f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 12:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760382561; x=1760987361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ObtByG9UEyeyQayzlv+x5Mg40nz0pp34oTOv9MDq8DQ=;
        b=fUNnXOAXGDE5L9koFDYiZ9kH8RdZK5mJmz8Py9ki7dcy4u+l2xN5IVetgH1Wl1oJ03
         WnLXcefy1T8UxyNNCbWDb4Nw5CNt+4vMqDO7g7QSGnq7r4OAjBQGKqfVkw1VlrZsxmhn
         vUnJi27LWVbfMw/K02wh4NtvtgBdNkx4/ABxT+iTB9jUQsa6U/PXpIPfwlvNf9sSN7Pv
         IKXXPyhk0z+dSUFx5NJbgjQfg5nIDCnpSUfWWDc/xH6lj1W+w6hvfELtRxJgKkBuJUae
         K3ANgADj9F4DOgijoHlNovwngv04K7PaE+9Q93KHqf9D10LrBriX6aA2qHiarzBa17FM
         T7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760382561; x=1760987361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ObtByG9UEyeyQayzlv+x5Mg40nz0pp34oTOv9MDq8DQ=;
        b=LC+J+EC55B+2/as5F3LtDuZbW8/N1UaXZjbBLnqXVOnp+yuSbmImuyIseaGvS4jacn
         51MOrdc/ERIZoNrVQ1OKaWPWFFHbXzTykg7abloLhY6B1ieRvYM+vA+nqivSXVshxBi0
         OMHGANFx6X/7G5CYNRhK3HwmLzgSpwgUO6LHpT/rDrtQi/VA4UTsbIWggIjwc/FjUJHD
         /qE2mIhJRkBeoWOzrlVMqnLGMtJkuxnoRD0JbnMFZAJQD5giPovUtVWCDLUlXob5dGaV
         g8WQ7AYAqK4BBJieZclrYMwL1B1lah/7oKSkypkJ2utl4hfab8xcPtuwBgdq7woIteyx
         URAQ==
X-Gm-Message-State: AOJu0YzI68jlCBpuG+IDWB8LmEpa+X1Vp9l+/AgRXV01ftppIY4fNgP9
	krWepFYfeMfsDaHCeutm2G1+jtZkYHlOmKGFJcHaNbBoxA9a0jNqLKroSjltbg==
X-Gm-Gg: ASbGnctvV+5jLPp7Ekk+cvClZDgwKCl5koDUcxnBphW7eJ42xBwSWPzXizRWt7Lgrk7
	PxpgAJZi9EZSVJYWDFevghfKbJj+ao/9FVOI15SdOnaqDdCxNZAVhVTrsmPT6TbbBq3wRnMEMVM
	fYyWb23+fhmqv15o1p4hYpKQkEdHbCPcubjcqWUMNDl0dKhOqSxirNB634vdd12R3ZQsi+MiO9N
	hDErFphDmZvsq0O+AR10/NKkzfLchv/IjutZnPVHmun8oEnK8poQZbBPJnNQrRnJ+EaAXK9Ly/N
	iY6JkFzmsmKH70BCfv5E30sImovwL5WbEbTJ73kx2vilLxyTnGKqRV3SFGrQb6yf82pol1OUzOE
	l6Emu1InzoLqQhI0KSTdLW5w7WlSMfTtAeBFhWpdJtfQA8MIowQ==
X-Google-Smtp-Source: AGHT+IFtTznurVeaz8ZISz0JEOzA1uBFGu81+gvAOeFrYpvOfVqKeB8kpSShNE/pcgTr4XfKwNhpkg==
X-Received: by 2002:a05:6000:1787:b0:425:75a0:36e2 with SMTP id ffacd0b85a97d-42666ab1aabmr11212257f8f.7.1760382561344;
        Mon, 13 Oct 2025 12:09:21 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e0efasm19875208f8f.41.2025.10.13.12.09.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 12:09:20 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] zchunk: patch CVE-2023-46228
Date: Mon, 13 Oct 2025 21:09:20 +0200
Message-ID: <20251013190920.494566-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 19:09:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120549

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-46228

Pick the patch that's mentioned in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...low-errors-in-malformed-zchunk-files.patch | 105 ++++++++++++++++++
 .../recipes-support/zchunk/zchunk_1.2.0.bb    |   4 +-
 2 files changed, 108 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/zchunk/zchunk/0001-Handle-overflow-errors-in-malformed-zchunk-files.patch

diff --git a/meta-oe/recipes-support/zchunk/zchunk/0001-Handle-overflow-errors-in-malformed-zchunk-files.patch b/meta-oe/recipes-support/zchunk/zchunk/0001-Handle-overflow-errors-in-malformed-zchunk-files.patch
new file mode 100644
index 0000000000..6a356c8855
--- /dev/null
+++ b/meta-oe/recipes-support/zchunk/zchunk/0001-Handle-overflow-errors-in-malformed-zchunk-files.patch
@@ -0,0 +1,105 @@
+From de832945bb88372d6007770328e9d2534aa9bbc1 Mon Sep 17 00:00:00 2001
+From: Jonathan Dieter <jdieter@gmail.com>
+Date: Thu, 5 Oct 2023 19:52:18 +0100
+Subject: [PATCH] Handle overflow errors in malformed zchunk files
+
+Thanks to Agostino Sarubbo of Gentoo for the heads up!
+
+CVE: CVE-2023-46228
+Upstream-Status: Backport [https://github.com/zchunk/zchunk/commit/08aec2b4dfd7f709b6e3d511411ffcc83ed4efbe]
+
+Signed-off-by: Jonathan Dieter <jdieter@gmail.com>
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/lib/comp/comp.c      |  6 ++++++
+ src/lib/comp/zstd/zstd.c |  6 ++++++
+ src/lib/dl/multipart.c   |  6 ++++++
+ src/lib/header.c         | 13 ++++++++++++-
+ 4 files changed, 30 insertions(+), 1 deletion(-)
+
+diff --git a/src/lib/comp/comp.c b/src/lib/comp/comp.c
+index 4786e41..38dea9d 100644
+--- a/src/lib/comp/comp.c
++++ b/src/lib/comp/comp.c
+@@ -115,6 +115,12 @@ static bool comp_add_to_data(zckCtx *zck, zckComp *comp, const char *src,
+     ALLOCD_BOOL(zck, comp);
+     ALLOCD_BOOL(zck, src);
+ 
++    if((comp->data_size > comp->data_size + src_size) ||
++       (src_size > comp->data_size + src_size)) {
++        zck_log(ZCK_LOG_ERROR, "Integer overflow when reading data");
++        return false;
++    }
++
+     comp->data = zrealloc(comp->data, comp->data_size + src_size);
+     if (!comp->data) {
+         zck_log(ZCK_LOG_ERROR, "OOM in %s", __func__);
+diff --git a/src/lib/comp/zstd/zstd.c b/src/lib/comp/zstd/zstd.c
+index a12ddfe..5b68b6a 100644
+--- a/src/lib/comp/zstd/zstd.c
++++ b/src/lib/comp/zstd/zstd.c
+@@ -117,6 +117,12 @@ static ssize_t compress(zckCtx *zck, zckComp *comp, const char *src,
+     ALLOCD_INT(zck, dst_size);
+     ALLOCD_INT(zck, comp);
+ 
++    if((comp->dc_data_size > comp->dc_data_size + src_size) ||
++       (src_size > comp->dc_data_size + src_size)) {
++        zck_log(ZCK_LOG_ERROR, "Integer overflow when reading decompressed data");
++        return false;
++    }
++
+     comp->dc_data = zrealloc(comp->dc_data, comp->dc_data_size + src_size);
+     if (!comp->dc_data) {
+         zck_log(ZCK_LOG_ERROR, "OOM in %s", __func__);
+diff --git a/src/lib/dl/multipart.c b/src/lib/dl/multipart.c
+index d0cbd5a..f4855de 100644
+--- a/src/lib/dl/multipart.c
++++ b/src/lib/dl/multipart.c
+@@ -119,6 +119,12 @@ size_t multipart_extract(zckDL *dl, char *b, size_t l) {
+ 
+     /* Add new data to stored buffer */
+     if(mp->buffer) {
++        if((mp->buffer_len > mp->buffer_len + l) ||
++           (l > mp->buffer_len + l)) {
++            zck_log(ZCK_LOG_ERROR, "Integer overflow when extracting multipart data");
++            return 0;
++        }
++
+         buf = zrealloc(mp->buffer, mp->buffer_len + l);
+         if (!buf) {
+             zck_log(ZCK_LOG_ERROR, "OOM in %s", __func__);
+diff --git a/src/lib/header.c b/src/lib/header.c
+index 16ea3e8..f46ed10 100644
+--- a/src/lib/header.c
++++ b/src/lib/header.c
+@@ -74,11 +74,16 @@ static bool read_optional_element(zckCtx *zck, size_t id, size_t data_size,
+ }
+ 
+ static bool read_header_from_file(zckCtx *zck) {
+-    /* Verify that lead_size and header_length have been set */
++    /* Verify that lead_size and header_length have been set and are legit */
+     if(zck->lead_size == 0 || zck->header_length == 0) {
+         set_error(zck, "Lead and header sizes are both 0.  Have you run zck_read_lead() yet?");
+         return false;
+     }
++    if((zck->lead_size > zck->lead_size + zck->header_length) ||
++       (zck->header_length > zck->lead_size + zck->header_length)) {
++        zck_log(ZCK_LOG_ERROR, "Integer overflow when reading header");
++        return false;
++    }
+ 
+     /* Allocate header and store any extra bytes at beginning of header */
+     zck->header = zrealloc(zck->header, zck->lead_size + zck->header_length);
+@@ -525,6 +530,12 @@ static bool read_lead(zckCtx *zck) {
+     /* Set header digest location */
+     zck->hdr_digest_loc = length;
+ 
++    /* Verify that we're not going to overflow */
++    if(length > length + zck->hash_type.digest_size) {
++        zck_log(ZCK_LOG_ERROR, "Integer overflow when reading lead");
++        return false;
++    }
++
+     /* Read header digest */
+     zck_log(ZCK_LOG_DEBUG, "Reading header digest");
+     header = zrealloc(header, length + zck->hash_type.digest_size);
diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb b/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
index 0baea5032a..5eb2741b1f 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
@@ -4,7 +4,9 @@ AUTHOR = "Jonathan Dieter"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
 
-SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;branch=main"
+SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;branch=main \
+           file://0001-Handle-overflow-errors-in-malformed-zchunk-files.patch \
+           "
 
 SRCREV = "dd6a30a1e4e8b738b0cafc682f3c00e7706134e5"
 S = "${WORKDIR}/git"

