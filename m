Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51EDC624D5
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:06:27 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9066.1788343578924091569
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:06:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FBAg4p2y;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e041ea211so832318a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343578; x=1788948378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gLNtS3QUULSN8Mf/xS5mQn5wKXCNoS6An8pR02NkZZE=;
        b=FBAg4p2yB/nlaEsazmwaALfvkmOxoKWaodr/XJwG2TUrPpobeMh63h8gWjwlNAR+f+
         fSJI6+ddYrUg24PHVjHtnb/I9jnjaI/AVfVwp90XoJ71d0LhuR5CafLaOM4vEFdEAxFI
         yCc3387GsFe5m3seI9M1q2TBZO/b8Mz2eNRMyNh3cUpNYWEcZUW/hNyKeGqZrf4F1k/L
         1prRj4PLZRlRyEf6gyyfrE+2hUuMOeVx8yJ09COJU7Rcnlny1yQs6SDcD+eeHyWkViuP
         Nv/TeqOV7nBx05yvASLMFgL+jMrkQ+eyLbGXJaPLv7cBcZGzphuAHKTUb2HnG85Ahibu
         HF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343578; x=1788948378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gLNtS3QUULSN8Mf/xS5mQn5wKXCNoS6An8pR02NkZZE=;
        b=oGUW6riNtPMXOhwzMUyq1I6mBpKjBDsSBBxIf5NctX8IFzP8kCTSpH9xEixNbnoFQa
         oh93KIz7H9aRnyH6NMD1gpnhjHNtsJPa5AbCKkRAIdzytuZFdx6+AE2KCrhllqnhrFG+
         MfHNKUFA5rKfqKgKyNY9DCALQdjYXHIHXmsphoUDlSFovImMkFeZ2KRApW5kFpjbCuwD
         wXBQI9IFQPoE54d7scrD0bOlOIextZ1aL8PJKuFUt3gJxnIkLqb9467XV2CaElb5JpGT
         l7c7w50ra5vCdYvr2jlDOiLXlNlhsXAxr34qF1Em6UmQLkXe9pLfrqWYXKcFvhitcmNV
         sY7Q==
X-Gm-Message-State: AFuF++nCm54Szbm/xC7AXaijn67/SfL9BDoYJyC4lXiWQ4MsW44KPigJ
	IoYK/IHtvoJYzlsz03N4hKBbVxX26l65Wgs9Cv9qkaMNvJMte59ocG32OmXJwAG+
X-Gm-Gg: AYBFou0LkU7u8hNF38qp3+lRavCdPaqYX4FWcBauGGG8j1sPRYJWLuiXS1Qx40DKFnG
	d65HbJD3AJ8bf4Pxdal1g78vdLU51K5V2gkuiUhSMjX+3Z/1nU2XXVuGNAUWgklH5UwgMa/2lC7
	qCFD7mp+VF+HHxV2/46yO0isd+36zLr6r5P+ksvwqLMZsbaJlQ2SZnS8IVWpx51GTACOe9Oxrmo
	FwHWjKm7Qt4zWWpLzGmDq6HH959i83DSZ0w6FRWW/IpGHqh5zU9Bv5eGJKhROBWXd4FcyMQzyy5
	xJAVbE5iKSMKHNJD0gTjGUehfUQZERM5zts8Rov/7gMXjZxkbDbMuKu39R0LakzvwP5ctVw1xaY
	/18bRfVl8BwlRsV15uzlzFEVZSgQ7NnLIhzQuU35DHRa4g6XJCXgzvPa7g6rueq7l27ZlWtiTj9
	LJKRUBbQ9iKo4ASLcHwODoo8+YGb2/yF3pPmncMD2yUNVKhdta6QiA4c0fHh+22dpg8ivVA2l6
X-Received: by 2002:a17:90b:164d:b0:398:c16e:69d3 with SMTP id 98e67ed59e1d1-39aedeb9aecmr5533553a91.1.1788343578203;
        Wed, 02 Sep 2026 03:06:18 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:06:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 24/28] hdf5: patch CVE-2026-17573
Date: Wed,  2 Sep 2026 22:05:06 +1200
Message-ID: <20260902100511.2105916-24-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129655

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport patch from the PR[1] fixing the issue[2] mentioned in the NVD[3].
Debian[4] has also identified the commit.

[1] https://github.com/HDFGroup/hdf5/pull/6160
[2] https://github.com/HDFGroup/hdf5/issues/6124
[3] https://nvd.nist.gov/vuln/detail/cve-2026-17573
[4] https://security-tracker.debian.org/tracker/CVE-2026-17573

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
index cd489bdc3f..c49d5819be 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://CVE-2026-26199.patch \
            file://CVE-2026-26197.patch \
            file://CVE-2026-17572.patch \
+           file://CVE-2026-17573.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 

