Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFA2E9DE58
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 07:10:23 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127057.1775718620836269418
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 00:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=INxXGzEE;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c742b9b7727so187438a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 00:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775718620; x=1776323420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLRYJ4CcI6KicDYQ0XXNud9LeO9Ylifvc3gua8nzVtY=;
        b=INxXGzEE9K5pcnhzEKfXm1weX+fVCIrB8sk/IsL1JHR+uCqeozq9qnS2IJbycCyRHo
         lR88f3Et8eNPfvg+8Cvbo0JdYG/vq5tlEDf+nmraxlbKRmG++YblRnJoYWtpFJaVhWta
         5It6fUX2trpTUgmU8dW10R/OSptbCbDDKqErye1LZ8gqYl9aGI1mq73Wn+KQyNGOTzyx
         MpsXhdjZgthrZnSySYWROtgGzGQxn3MgDmLIIeuy44FaeY6legAuxJYxWR8ExoXcTg6D
         JcfnMia+KpRFbIeOeGDfFkJKkBKoVxf/wiNdn3VYKsOwC4ngFhQf2o3QT3fDINgzUDXR
         WPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718620; x=1776323420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vLRYJ4CcI6KicDYQ0XXNud9LeO9Ylifvc3gua8nzVtY=;
        b=N/PfQ3HbRR8R5DjAla3MXS9sjQNUzio0lyKwDmFCcVy+/gjN8oIdeIig6zJnd3FMIx
         v8RPEVHnE31PXvaTEwqlFQ72ZqY8xcFrG3hJ4xSQsezVhGgjLaukf3ZFJrZQ/VX9V6uL
         FC4sJAZ5A5vorjIUlmMycafbagdxBCqdf717KOwB+QXPjsluTaX5lOEeoGzU/5Yhyg91
         I8Jix9cpXePqcPJrpPJ7tOACNGj7vRA5DIbLz3/kvACV7JQN1UL+mSjsKNVCGVfOZpUs
         YdcddhUGKmHqeAhmvjEoW/nxdUq6bZWo7+AC+6/UhoS+Rizxp27IHkHV7YHDVfaJFTfm
         0Ppw==
X-Gm-Message-State: AOJu0YwsA1YbGJK4eijCoaChRWZWBrpuknWTQxUjuI/r7QuzU2C10bby
	yvPVQY22bv07utkCZR2euJYaRSRP7AqRCmpOZ9AcCUwTTEd0oJXsptbjoRHomw==
X-Gm-Gg: AeBDieu/tAi4ItFijz4KZ7VeM/iqhoz9D085uDRghCTFsuPvT7C6KHx3cRBlar0tmji
	mSShu+e5VK38NJCvSSrJ4fxx+nU58y/OArSRTLR/7cqIt0giJQ8ANN5eEgBJ74is34+9RZdaXpk
	jV/2MGHK333uB8OXA1HvFV+ocVEPAyubrzH2dyqUvgdWnzJtRWrrEi9kgLUAtAVQhfrMEnzZmaj
	o+qNmIs8IVu30hrWEsDQ83EGK4bCydU9fd71QJ/GnzwSHsi6Lopedx4Wc2KxzDYKiqaXfeq8aLN
	/s9XYi/5TzQmsQY69jBwQIy3AtTdnq/bRMZEVLVkERgbde0BW+1JrXJy0nyqUBgpMurbmaOto1p
	KVKlDXgT29gzBytVZda8ovVQnXR2Zndyey/aE7WgzZzvrATkldpX9QJ37wLQmMw7zH3B4rqaz9U
	e0Hxc8bsTo3dmPBi8IAF3ZqzF+s2WFhymjbRNaUwK9Jrdu0g==
X-Received: by 2002:a05:6a00:10c7:b0:829:7a62:6a with SMTP id d2e1a72fcca58-82dd8b1c171mr2233869b3a.22.1775718619941;
        Thu, 09 Apr 2026 00:10:19 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b21c92sm24764936b3a.11.2026.04.09.00.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:10:19 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][scarthgap][PATCH 21/22] libde265: upgrade 1.0.12 -> 1.0.16
Date: Thu,  9 Apr 2026 19:09:18 +1200
Message-ID: <20260409070919.3968586-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
References: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 07:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126143

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patches which are part of the upstream version.

https://github.com/strukturag/libde265/releases/tag/v1.0.16
https://github.com/strukturag/libde265/releases/tag/v1.0.15
https://github.com/strukturag/libde265/releases/tag/v1.0.14
https://github.com/strukturag/libde265/releases/tag/v1.0.13

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libde265/libde265/CVE-2023-43887.patch    | 39 -----------------
 .../libde265/libde265/CVE-2023-47471.patch    | 42 -------------------
 ...{libde265_1.0.12.bb => libde265_1.0.16.bb} |  4 +-
 3 files changed, 1 insertion(+), 84 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2023-43887.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2023-47471.patch
 rename meta-multimedia/recipes-multimedia/libde265/{libde265_1.0.12.bb => libde265_1.0.16.bb} (84%)

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2023-43887.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2023-43887.patch
deleted file mode 100644
index f8ab0e1e40..0000000000
--- a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2023-43887.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From e31a5389f2a4967b9ca298a3435d1af2f9a04cda Mon Sep 17 00:00:00 2001
-From: Dirk Farin <dirk.farin@gmail.com>
-Date: Fri, 1 Sep 2023 21:18:48 +0200
-Subject: [PATCH] fix #418
-
-CVE: CVE-2023-43887
-Upstream-Status: Backport [https://github.com/strukturag/libde265/commit/63b596c915977f038eafd7647d1db25488a8c133]
-(cherry picked from commit 63b596c915977f038eafd7647d1db25488a8c133)
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- libde265/decctx.cc | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/libde265/decctx.cc b/libde265/decctx.cc
-index 223a6aaf..350f7e7a 100644
---- a/libde265/decctx.cc
-+++ b/libde265/decctx.cc
-@@ -582,16 +582,17 @@ de265_error decoder_context::read_pps_NAL(bitreader& reader)
-   std::shared_ptr<pic_parameter_set> new_pps = std::make_shared<pic_parameter_set>();
- 
-   bool success = new_pps->read(&reader,this);
-+  if (!success) {
-+    return DE265_WARNING_PPS_HEADER_INVALID;
-+  }
- 
-   if (param_pps_headers_fd>=0) {
-     new_pps->dump(param_pps_headers_fd);
-   }
- 
--  if (success) {
--    pps[ (int)new_pps->pic_parameter_set_id ] = new_pps;
--  }
-+  pps[ (int)new_pps->pic_parameter_set_id ] = new_pps;
- 
--  return success ? DE265_OK : DE265_WARNING_PPS_HEADER_INVALID;
-+  return DE265_OK;
- }
- 
- de265_error decoder_context::read_sei_NAL(bitreader& reader, bool suffix)
diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2023-47471.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2023-47471.patch
deleted file mode 100644
index 3d66758e49..0000000000
--- a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2023-47471.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 78bd5752157f34e822cefd8ff8959a96a26b4841 Mon Sep 17 00:00:00 2001
-From: Dirk Farin <dirk.farin@gmail.com>
-Date: Sat, 4 Nov 2023 15:20:50 +0100
-Subject: [PATCH] null-pointer check in debug output (fixes #426)
-
-CVE: CVE-2023-47471
-Upstream-Status: Backport [https://github.com/strukturag/libde265/commit/e36b4a1b0bafa53df47514c419d5be3e8916ebc7]
-(cherry picked from commit e36b4a1b0bafa53df47514c419d5be3e8916ebc7)
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- libde265/slice.cc | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/libde265/slice.cc b/libde265/slice.cc
-index 280b7417..435123dc 100644
---- a/libde265/slice.cc
-+++ b/libde265/slice.cc
-@@ -1277,14 +1277,23 @@ void slice_segment_header::dump_slice_segment_header(const decoder_context* ctx,
- #define LOG3(t,d1,d2,d3) log2fh(fh, t,d1,d2,d3)
- #define LOG4(t,d1,d2,d3,d4) log2fh(fh, t,d1,d2,d3,d4)
- 
-+  LOG0("----------------- SLICE -----------------\n");
-+
-   const pic_parameter_set* pps = ctx->get_pps(slice_pic_parameter_set_id);
-+  if (!pps) {
-+    LOG0("invalid PPS referenced\n");
-+    return;
-+  }
-   assert(pps->pps_read); // TODO: error handling
- 
-   const seq_parameter_set* sps = ctx->get_sps((int)pps->seq_parameter_set_id);
-+  if (!sps) {
-+    LOG0("invalid SPS referenced\n");
-+    return;
-+  }
-   assert(sps->sps_read); // TODO: error handling
- 
- 
--  LOG0("----------------- SLICE -----------------\n");
-   LOG1("first_slice_segment_in_pic_flag      : %d\n", first_slice_segment_in_pic_flag);
-   if (ctx->get_nal_unit_type() >= NAL_UNIT_BLA_W_LP &&
-       ctx->get_nal_unit_type() <= NAL_UNIT_RESERVED_IRAP_VCL23) {
diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb
similarity index 84%
rename from meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb
rename to meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb
index e32a2af51c..e77d23db88 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb
@@ -9,11 +9,9 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 
 SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https \
-           file://CVE-2023-43887.patch \
-           file://CVE-2023-47471.patch \
            file://CVE-2025-61147.patch \
            "
-SRCREV = "a267c84707ab264928fa9b86de2ee749c48c318c"
+SRCREV = "7ba65889d3d6d8a0d99b5360b028243ba843be3a"
 
 S = "${WORKDIR}/git"
 

