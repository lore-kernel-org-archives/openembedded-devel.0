Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46587CC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:47 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32810.1792043025987669557
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TQaB199T;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2dd9cbb661bso35496385ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043025; x=1792647825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uRKpzxglzqmlMUrcSvgJ1OX5CsGN9BQLYB5WyoQKvFY=;
        b=TQaB199TLGGFzLkOycPH87g2KwAiM6ln0myDkHUa35QHJt9G+HvrcQ+LHSWs6PNMmN
         0xLsM7B10NCGoNApu6rPT8ALgA646OoIBeNHN/m2vDrtnuv60S4NXdCC77DKD1VLN8yU
         6PTkXTlDiv4l1VJoYqBYA+A7KExV4kimNNvQZqOgmjG3BU9mvANKZr/grDwq087HQqd9
         rIqAPffW4uq6QqLdNREYqdbAWL8zXzoYJDsQKmoqSkYMs8tXvSPSZdT3iaVRDiXTG46j
         aC3DZRhU4ecWAPhaJEE7viKEeWC98YYgff6YpbXEaSW9sJSYYiKA7+CnWrJTddOunacc
         i0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043025; x=1792647825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uRKpzxglzqmlMUrcSvgJ1OX5CsGN9BQLYB5WyoQKvFY=;
        b=X2ZdBpchMSbI7HFTnkd/H5XeVtiawY1ay3DuU4RXlhjJ2VSBCbzAitrv3AmDnHVKS0
         sNPmyVmCFE9nx9TpcbhlOIUTMk7eOQRWiY+yFPvdZjPjvUl5rb+cwFhZ1j3yXHDFnK/l
         lWnHQw35WDNpDNO7Seguz8HeZHfy2EQN6H7VlMiUaTva/mUkObI6ga3ahtFOGemf+KGr
         i9zsaYPfUe+fyQ/7nYIxhMUFZPCm7ZL0gjPlv2emBcFs92R7ci7tEb5ENzHyzR5BkiCk
         DTZloxceMOBJ5P8/hg7b3/pGlFTEcz35bJnKDlcnI3io7CwHmtIWD+/CVxWlbcEx0OQB
         QlAA==
X-Gm-Message-State: AFq9FYJCHyjQs+OVcj6UDwEiQeTrdEJun0efdMKn7hZByO2OTZe6k1t7
	4TfoDCEQNuNOKCn4OHJH4DfBBigf4OrndnEL/1p+dIhjCF4YG+ZE3N+FVpyEHg==
X-Gm-Gg: AYBFou3FVY/kMFztkX7n8RepNDN5Om7IWZ0VzIWPsp8EMqF5oOY5hydx9iZMdxG/+uB
	mGTiS+A+AB+kJBaFJyBKfGHWfjWIPhvr0SoTZ1tzmwj8CPS4yTUmkQLGcQebxtuJy5/NmEkJaZf
	5Qi1APcvCoNhyDsKSrv8gyfQP0No3VQ0DOBQlrdir9crwHRj3zhh0wb/TvQmuztTRvoDM/2sdpE
	+ievszc85GBErV443rQcpq4LsDCcqHnYNrNV9xMbTLHnWGgHp2tp9cuBoW2+vSdXuEPoEOPUmG1
	YUX6We7DQ/cweTxVLVh6SNnwL+r+7dPvAG8mqmEY0yUkPQAmsLa/ik2+LNf97yZhwtiCTa+r3rP
	N1qTIa3wV0+XYxEdTc3u4Z/6ut/Ot0Eqd4bT+ALRICjX/lFUlZGK/dzh4vUYFtvFR2V7w+hdhuN
	AcMUWNgeQ+n3/aHU7Pf5598ioGVPlv3JFCZLMEF1wNdUaUAIDcuCzyCOJqx3/IDDG1Sdz0WD4qQ
	GgkPxdbNyw5AG02x+q/6d5xiSENX6C5Yg==
X-Received: by 2002:a17:902:f790:b0:2e9:5507:b540 with SMTP id d9443c01a7336-2e95507b969mr19154625ad.45.1792043025256;
        Wed, 14 Oct 2026 22:43:45 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:44 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 26/82] hdf5: patch CVE-2026-17573
Date: Thu, 15 Oct 2026 18:41:14 +1300
Message-ID: <a0cb67f356e7ef3306e8d58bb79a970d6e83ce0e.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130946

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport patch from the PR[1] fixing the issue[2] mentioned in the NVD[3].
Debian[4] has also identified the commit.

[1] https://github.com/HDFGroup/hdf5/pull/6160
[2] https://github.com/HDFGroup/hdf5/issues/6124
[3] https://nvd.nist.gov/vuln/detail/cve-2026-17573
[4] https://security-tracker.debian.org/tracker/CVE-2026-17573

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit f46990293cf684add8cc2ee7e71738e97889bcc3)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hdf5/files/CVE-2026-17573.patch           | 53 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch
new file mode 100644
index 0000000000..3cfb52de42
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch
@@ -0,0 +1,53 @@
+From 856e7f1dd23e466ebeab5e454a5891b12e188f6a Mon Sep 17 00:00:00 2001
+From: jhendersonHDF <jhenderson@hdfgroup.org>
+Date: Tue, 27 Jan 2026 05:55:38 -0600
+Subject: [PATCH] Fix double-free issue in H5D__chunk_copy (#6160)
+
+Fix double-free caused by loss of buffer pointer after re-allocation
+
+Co-authored-by: Larry Knox <lrknox@hdfgroup.org>
+
+CVE: CVE-2026-17573
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/dd3080a58cc6bb86f3b34284399915da9e513262]
+
+Dropped changes to the CHANGELOG file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/H5Dchunk.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/src/H5Dchunk.c b/src/H5Dchunk.c
+index f2a0e85c03..5ff537ebde 100644
+--- a/src/H5Dchunk.c
++++ b/src/H5Dchunk.c
+@@ -7034,7 +7034,7 @@ H5D__chunk_copy(H5F_t *f_src, H5O_layout_t *layout_src, H5F_t *f_dst, H5O_layout
+                 const H5S_extent_t *ds_extent_src, H5T_t *dt_src, const H5O_pline_t *pline_src,
+                 H5O_copy_t *cpy_info)
+ {
+-    H5D_chunk_it_ud3_t udata;                       /* User data for iteration callback */
++    H5D_chunk_it_ud3_t udata = {0};                 /* User data for iteration callback */
+     H5D_chk_idx_info_t idx_info_dst;                /* Dest. chunked index info */
+     H5D_chk_idx_info_t idx_info_src;                /* Source chunked index info */
+     int                sndims;                      /* Rank of dataspace */
+@@ -7202,7 +7202,6 @@ H5D__chunk_copy(H5F_t *f_src, H5O_layout_t *layout_src, H5F_t *f_dst, H5O_layout
+         HGOTO_ERROR(H5E_RESOURCE, H5E_NOSPACE, FAIL, "memory allocation failed for raw data chunk");
+ 
+     /* Initialize the callback structure for the source */
+-    memset(&udata, 0, sizeof udata);
+     udata.common.layout    = &layout_src->u.chunk;
+     udata.common.storage   = &layout_src->storage.u.chunk;
+     udata.file_src         = f_src;
+@@ -7253,11 +7252,11 @@ H5D__chunk_copy(H5F_t *f_src, H5O_layout_t *layout_src, H5F_t *f_dst, H5O_layout
+         } /* end for */
+     }
+ 
++done:
+     /* I/O buffers may have been re-allocated */
+     buf = udata.buf;
+     bkg = udata.bkg;
+ 
+-done:
+     if (dt_dst && (H5T_close(dt_dst) < 0))
+         HDONE_ERROR(H5E_DATASET, H5E_CANTCLOSEOBJ, FAIL, "can't close temporary datatype");
+     if (dt_mem && (H5T_close(dt_mem) < 0))
diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
index c83bb832de..df0192a091 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://CVE-2026-26199.patch \
            file://CVE-2026-26197.patch \
            file://CVE-2026-17572.patch \
+           file://CVE-2026-17573.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 

