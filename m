Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311C7C61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 16:00:38 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11232.1788451229284552574
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 09:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bZGSBeAh;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3582; q=dns/txt;
  s=iport01; t=1788451229; x=1789660829;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=bFV8vIHpEttmq5hB61V6RgECRQNsaoRw5p46WOloy9Q=;
  b=bZGSBeAhvZKmzzReGij3y+Ny070QOzu2fFKMEwfHOR0BXQg85KF1j5sL
   hEZ2vhjhclSzj79k2QAG9hwFvSWwent/sHpnHSRLeJjYdHGp/nHHKn6P0
   d12kmaWiDwkVJ8lBXcc2qZ9Yp1cyfXYMeofdOB+BIp5n3V5QPYPa3Syts
   ghTL74vS+Zs8mX5m2k9LYTFqhOEXN4FCMMSjhqETfQ/YOGZ+1n8SGU+U5
   ChvIOjw7dDs2aVjdHPBtb6Jczqmvy4CyklBHyC1CTbemVYx7mHAuxi9Tx
   jTmlwe0lX1ZmTNU+FLdr0V2XmzF7Bzj3Ph+WV2HeHHiGTj3K7Oy/dIyRY
   g==;
X-CSE-ConnectionGUID: HnsHfMKLSdOn1HxioDhclg==
X-CSE-MsgGUID: iRmU6jSJQ8a31rIaOnewGA==
X-IPAS-Result: =?us-ascii?q?A0AeBQCbmJlq/4oQJK1aglmCV3RgQ0mHYoxHgiEDnhuBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGFBQKOAAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZAZAQIBAzIBGAE9HAMBAi8rIwgZgwIBgnQDEcEPgiyBAYMJH?=
 =?us-ascii?q?wE/AkNQ2UqBZwELFAGBOIU/iCJdGAGEfCcbgUlEhH6BBYFcAQGBSoZbBIMcE?=
 =?us-ascii?q?oFakg5IgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bBgWBHYEngz8jG?=
 =?us-ascii?q?TZ6gQlegSspYRIXgQmCCAKCVIIFAgFJQw4HR1MJJzgLGA1IESw3FRkEPm4Hj?=
 =?us-ascii?q?l8fglCBDgETGCA3gWYLkxKSSIE1n1qEKIwilToaM4VbpRILmH2OCpZQhGmBa?=
 =?us-ascii?q?DyBRwsHMxoIGxWDIglKGQ+OOYNrgX+CCMgyJzICCTIBAQcCBw4DC4FokAABJ?=
 =?us-ascii?q?wSBUgEB?=
IronPort-Data: A9a23:5swOdKuYFq+oeZtoq3m1aC5DpefnVAFfMUV32f8akzHdYApBsoF/q
 tZmKWjQO/neNmOhKI0ia4yw9koH65ODn4QyGwNt/y88RXkVgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/Pb80sz1BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw2uBsIW9r1
 tgjJBcLNzCThuWawLm/Rbw57igjBJGD0II3s3Vky3TdSP0hW52GG/yM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWYQd/5JEWxI9EglHubidRpF+9rqss6G+Vxwt0uFToGIqPKobXHpgIzy50o
 ErHxWHEXBMhFuXPwGHc6FOloenCggzSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz7AWLj66R6AGDCy1cF3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:nioWmagoAUP8zb0m2DvISnjrsnBQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:s5pkA2DSISDOnhT6Ewlh724aP+MBSXH6yi7wM06/JWZiTLLAHA==
X-Talos-MUID: 9a23:yNmOLwjmfAM8JneAjo3uOsMpNf1t3vqsM2I0wZxd4tOlPAt2NiiypWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,260,1779148800"; 
   d="scan'208";a="828253559"
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 03 Sep 2026 16:00:28 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id 46F071800019E
	for <openembedded-devel@lists.openembedded.org>; Thu,  3 Sep 2026 16:00:28 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id D4B62CE9ECF; Thu,  3 Sep 2026 09:00:27 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][scarthgap][PATCH 2/3] hdf5: Fix CVE-2026-17573
Date: Thu,  3 Sep 2026 09:00:26 -0700
Message-Id: <20260903160027.1611530-2-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260903160027.1611530-1-yurade@cisco.com>
References: <20260903160027.1611530-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 16:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129740

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/HDFGroup/hdf5/commit/dd3080a58cc6bb86f3b34284399915da9e513262
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-17573

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../hdf5/files/CVE-2026-17573.patch           | 51 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch
new file mode 100644
index 0000000000..a7411b5ed6
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch
@@ -0,0 +1,51 @@
+From 56bcbf7fd94e102e9e5d5aed24faed33beecdb97 Mon Sep 17 00:00:00 2001
+From: jhendersonHDF <jhenderson@hdfgroup.org>
+Date: Tue, 27 Jan 2026 05:55:38 -0600
+Subject: [PATCH] Fix double-free issue in H5D__chunk_copy (#6160)
+
+Fix double-free caused by loss of buffer pointer after re-allocation
+
+CVE: CVE-2026-17573
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/dd3080a58cc6bb86f3b34284399915da9e513262]
+
+Backport Changes:
+- Omitted CHANGELOG.md file changes
+
+Co-authored-by: Larry Knox <lrknox@hdfgroup.org>
+(cherry picked from commit dd3080a58cc6bb86f3b34284399915da9e513262)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/H5Dchunk.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/src/H5Dchunk.c b/src/H5Dchunk.c
+index 4727cc5d12..86340be16e 100644
+--- a/src/H5Dchunk.c
++++ b/src/H5Dchunk.c
+@@ -6809,7 +6809,7 @@ H5D__chunk_copy(H5F_t *f_src, H5O_storage_chunk_t *storage_src, H5O_layout_chunk
+                 H5O_storage_chunk_t *storage_dst, const H5S_extent_t *ds_extent_src, H5T_t *dt_src,
+                 const H5O_pline_t *pline_src, H5O_copy_t *cpy_info)
+ {
+-    H5D_chunk_it_ud3_t udata;                       /* User data for iteration callback */
++    H5D_chunk_it_ud3_t udata = {0};                 /* User data for iteration callback */
+     H5D_chk_idx_info_t idx_info_dst;                /* Dest. chunked index info */
+     H5D_chk_idx_info_t idx_info_src;                /* Source chunked index info */
+     int                sndims;                      /* Rank of dataspace */
+@@ -6972,6 +6972,5 @@ H5D__chunk_copy(H5F_t *f_src, H5O_storage_chunk_t *storage_src, H5O_layout_chunk
+         HGOTO_ERROR(H5E_RESOURCE, H5E_NOSPACE, FAIL, "memory allocation failed for raw data chunk");
+     /* Initialize the callback structure for the source */
+-    memset(&udata, 0, sizeof udata);
+     udata.common.layout    = layout_src;
+     udata.common.storage   = storage_src;
+     udata.file_src         = f_src;
+@@ -7023,9 +7022,9 @@ H5D__chunk_copy(H5F_t *f_src, H5O_storage_chunk_t *storage_src, H5O_layout_chunk
+         } /* end for */
+     }
++done:
+     /* I/O buffers may have been re-allocated */
+     buf = udata.buf;
+     bkg = udata.bkg;
+-done:
+     if (dt_dst && (H5T_close(dt_dst) < 0))
+         HDONE_ERROR(H5E_DATASET, H5E_CANTCLOSEOBJ, FAIL, "can't close temporary datatype");
+     if (dt_mem && (H5T_close(dt_mem) < 0))
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index 88e0f0a1ac..fffd5b7b37 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -31,6 +31,7 @@ SRC_URI = " \
     file://CVE-2025-2308.patch \
     file://CVE-2025-6857.patch \
     file://CVE-2026-17572.patch \
+    file://CVE-2026-17573.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 
-- 
2.35.6


