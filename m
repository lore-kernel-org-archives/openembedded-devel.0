Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26ACECC6B03
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:11:06 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5101.1791839462623585780
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:11:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UYYV8RX7;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ccc6b11a19aso751168a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839462; x=1792444262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DdiunAitm9p3IpUO3AfUpuarKIA8DrhqU3e+HYdK9bg=;
        b=UYYV8RX7a3dGjPET883evFFlJ+wpZBU7hqw2ww4dL8NouRLkUOXwWl2LOIK+qWKpVf
         6o/lTSi/4R92NDdUMBjwufEMUPvZchNc78tDOUk92ZuuqX5fdgIwGQZNEhxzorgiHgcZ
         T5SQnw87WlqIB0oUPxUvhGOg12uLRGaEZj143PZjV1RSMIeQUc+XBGlZQH9vS3VRFGuA
         mkpFo9ygjwwDKOV0OfkTO+8V0qTzBFzysoJBTFlZBnn/NDRPUf6foBxoesGIH4+cAtuk
         b54R/mRw3ZgTJ4biYSvmJ1P0h3Ho1105yDZfegu8NrEFOZZB/mKS1WXI2fEcRobymyEp
         2DHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839462; x=1792444262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DdiunAitm9p3IpUO3AfUpuarKIA8DrhqU3e+HYdK9bg=;
        b=S7k3UyrqFI/JbVll4NtQQM1OXfDJrvxJytp58w5TLblbPyBazLyUE8oYwziVK7qjt1
         nXtLOHBR2mcGF651RxisIrtJRmJDXOasVh+cxLFUN1pftZuZdYg9iQ7YZn5GYK2tX8Na
         Ig5eiWqzgbUhFvwczYC9Yb1eCHlsc7JZfFvS3lOw6LfXrCf1ktYDR7L0hnnaE3XvZ34w
         Exi6wfyYxKFQZXEw0AVPLB5ULDA27gm/m6pxcQ81NeLkbUaWXZoXSXSy2sapiqUiysDz
         awPfwuidcLMiuBIvTeUDk32Yezg38tCepTIDlc1Nw2FnAS0hpj7G9yVIWZn/AA697R1F
         uLEQ==
X-Gm-Message-State: AFq9FYJcKk7ti02C3cuxbCdMqr6DzAPrXOi3r7Q07q5ZTq5uqY+BJT2T
	GaNWIe/c6y6ofhWBEEe3+fR/HH9oUk8+6zTTzii2NZ84nfSf/dxC3ZWZXOmvhw==
X-Gm-Gg: AYBFou1LXzibpArTLJq1gBoJBek9VPxn5sEWZ1b8e+kyYLMJ0ZrFJ3bLmJqyncRTHjL
	scCRKAmlwjiARoNE1Z8fn47PgmBtP8sQ0o1PxrVLHF/AQnCSDNLJjKGE2S08eVKoM6bThQ4LVT/
	WDd1G85sxUONpIGUZ4LAmpo4ACs1qe698ab6cxHE+IfruNc5yoFZIkb23D8RePR3mpbZMtAMvUe
	ehj7jjoA/qfkSYSXkhmFT0uNCus5g7C+ivU8R/HQRrIsQgyobSuaJvUZ3j3kKSx8ih7C30IEXXv
	ue5E5oSVUL8/O7xy16Guit+qGIlmi1gXIDtzfk2nLfNer8ciT8U9ioVz3w4khQFMC5FN6xxsY4r
	cquamQPymmwXQTIktF3a6wOkIpZN0r8jgWlLg7p1Rj0HMFPacIdEckeAybEjfOmsVygJ+NV+Hxj
	asWMd36uOUfqRsLaCNMLvwJG8gOA5SKJUpuCYjtrx3mdREOaTwQ8/jzFtYJA7tWpbHfMsWerEgB
	Dm0sFW9Ko2iuO02ngWaFrm6ID8EKTkkdrUpH9VFfA==
X-Received: by 2002:a17:90b:51cf:b0:3ab:c370:3684 with SMTP id 98e67ed59e1d1-3abc370392emr3985577a91.30.1791839461874;
        Mon, 12 Oct 2026 14:11:01 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:11:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][blacksail][PATCH 17/43] hdf5: patch CVE-2026-17573
Date: Tue, 13 Oct 2026 10:09:41 +1300
Message-ID: <20261012211009.3352822-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:11:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130787

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
index 00000000000..3cfb52de42d
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
index c83bb832deb..df0192a0911 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://CVE-2026-26199.patch \
            file://CVE-2026-26197.patch \
            file://CVE-2026-17572.patch \
+           file://CVE-2026-17573.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 

