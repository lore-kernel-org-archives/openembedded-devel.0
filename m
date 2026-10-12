Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D41CA9EBD
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:11:13 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3524.1791763868132008651
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:11:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SUjQNiYt;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso347122a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763867; x=1792368667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DdiunAitm9p3IpUO3AfUpuarKIA8DrhqU3e+HYdK9bg=;
        b=SUjQNiYts/Z9X1JMq3ISy9MHJs15rMVgg4sUEb1JZB370x7M6karC+mewQ70lqiLuV
         wHjwgoNe8gN065i0iVFTvBhzMGRE98n2W/rjLSozsCChPYixEmsi0LdoZUnNcpRLWYmU
         j3JRMTMku64VyPboNahBZlU36VvN3V7qL51Lc6Vp2ML9ESSDEGcbgL9EnbEj3uvNIob6
         r2B4THHK0Ar/19rPxo5kpuNqVMgE060FJNjn7Uiiecur6asJSD8Ois0UIfMKAZuuKENX
         c0yBi3oY7rY9tbsskX+B9qvKYcrEwmGVNtCDLRaR+t0Eh4Db2Tthj94hhP12r5Y/9Di/
         PYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763867; x=1792368667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DdiunAitm9p3IpUO3AfUpuarKIA8DrhqU3e+HYdK9bg=;
        b=aCW6FcfW+OXFOkrUx+esHUhEMeFb5QztX6O7BEQbl22dp8YYilIfUOR5VeoVjZH3rw
         jJU68+Ga6ULTkCruxydVHyabYAzCvfVbH4X8Kdb8j37TFJTLLbubfxLuw5QAWCL0lhCe
         mvH+pr2pJ0cfQtH/v+78ps+2zNPtBUgiQ/7Gc3Pen5SCSV0Z+K9Hlw4mlySrAJMVz0oR
         HA+QyBlhg8rt+JC8ZFOMxY0LDsFiZ1vEMhUOg87u/oozjxXj/SzrdmTqBmCVPfxKF2ze
         lNe4S8RXYpTM2jaXL/ZxALEy8r7M39N/36Cb1ZKq3HavfGWJo6K6gxSCEFBpEYq0HnU+
         H2FQ==
X-Gm-Message-State: AFq9FYILHAjqTEfDKiNNW72ulsxFOcv6TZTvnXeXXrkD85mLtfStMtN+
	u5N4G+RcbssLAkwCah9Py6dyKISdDNjnIk3vP7rb8D3uzmdsp+cB+J5dk93PHGbuh8I=
X-Gm-Gg: AYBFou2xvlOPXwt/GghITPwM5SmHMRqHqSCq01adAq+Kh3GFlsZU/PN6OoOfUoDfj13
	w/4/m5vp6+q1ByEfpwrIq4olsXzebBsMjvthZj/cLr0J63ZfDR9cnNaaw7Hs8RbxIbgcZEbhoks
	dX/+bSadcF6rUQluC79g6VBVV7TyBQKBHCRLDV8rCmh7cAu3rgPFmKpTuEjMznOespUqVpd5gFZ
	QPtEMB+YgPvG/y2/RH9v5E6NRV+m5RE9r4CNogiJb7UEvLwuUZkFDFvEoxEVzhkDTJTGgXN8bOf
	piFBYWeFjI7dGX3jI5X62IdN8ZNslW5szldBfwYmtso6NzymF0dlLI8to58rBrSAQqiq/DkT06M
	romNG1KMx2v0oQUd4piu2JaNV7CdoYqWkDzrDnqtMyl0whWkpYtB6S4Fg42yoZUVKRqoVDkK6KD
	syi2cKO1WS9zzdZdH7KwKn/w4Sa+8Xi/AkpGbhCEjIqTIPJccXyysM5vKV/RsD0DJ3lIj6yHhtw
	zk1MKoksU49ths1MbeBXbeiSRjzRjnTZMku6UI=
X-Received: by 2002:a17:90b:3c07:b0:3ab:1a24:56e4 with SMTP id 98e67ed59e1d1-3ab3aca1257mr5723829a91.30.1791763867482;
        Sun, 11 Oct 2026 17:11:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:11:07 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][PATCH 20/28] hdf5: patch CVE-2026-17573
Date: Mon, 12 Oct 2026 13:09:58 +1300
Message-ID: <20261012001007.2541673-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:11:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130745

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
 

