Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7ACCA6015
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 04:47:11 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1287.1791521224794124594
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2026 21:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VEy7eWQq;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4334; q=dns/txt;
  s=iport01; t=1791521224; x=1792730824;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=0Fx9cGwGj2+HBbB9aZT9TEqnNuiJCp/Q8yOzTgUJrI8=;
  b=VEy7eWQqPcm9AFSVQ/Je7dsq2lTva+gQAXufxGFxj61V5aZjPtRaEl//
   l967wChMPWNtx5Kn1kcu+aSg4dAscMYNNnsMJMVrPw+jmCkDW2WX22Gds
   T3J8cEMirsbNWueis01lu5x/nrYyRpgz8Rgo6ZKS6hXuCM0uT6G0bLPs8
   og4V7RASqXkOPyug40Ad8BbtKWbGyU2tOku6+7Xh7QBnUrUOLby2zwUhs
   9fhlU+4v3pDmv1mhfoXA38iRF7d0JqnHToqZjESmm/4t8bpG2JbFGGpTY
   rQwFjk1hfLEbvhYzPIR4ot7+15bxmj51FxNuysqNfIh3pSBtKJwFkUPiQ
   w==;
X-CSE-ConnectionGUID: Q4/TqmR4SIST+W0RyHbTRw==
X-CSE-MsgGUID: hWngQTchRhyGeSLvPQhWSQ==
X-IPAS-Result: =?us-ascii?q?A0BKAgDGcMhq/5X/Ja1aHgE8DA4LgVmCV3VgQ0mUKYIhA?=
 =?us-ascii?q?54agX4PAQEBD0QNBAEBhQUCjhECJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgwIBgnQDEbpPg?=
 =?us-ascii?q?XkzgQGDCh8BPwJDUNlKgWgBCxQBgTiFQIgjXRgBhHwnG4FJRIEVgTuCLoEFg?=
 =?us-ascii?q?VwBAYglBIINgQ8SgVqFDo8aSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F?=
 =?us-ascii?q?4EHGwYFgR2BIIIWIxk2eoEJXoErKWEQF4EJggcCglSCAAIBSUEOB0VTCSVDE?=
 =?us-ascii?q?kcmIggSCQETGjALgRs4PAkoQRcMdAgYDUgRLDcVGQQ+bgeRAx6CYQF6EwErF?=
 =?us-ascii?q?1wMgQkLKAINikebEaEPhCiMIpU6GjOjP4cwC5h9jgqWAU+EaYFoPIFHCwczG?=
 =?us-ascii?q?ggbFYMiCUoZD445g2uBf8o6JzICCTIBAQcCBw4DC4FokAItb2ABAQ?=
IronPort-Data: A9a23:IuUN068ZwYI6et0ETGgGDrUD1n+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WZKDzqAa62DNmr2c9oiPInjpxgHvseDmNZiTAY4rStEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtajpEs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kPYcok4+NNXVpvz
 sBbF2g3fzCJu9iplefTpulE3qzPLeHxN48Z/3UlxjbDALN/G9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0wn1lQ/UPrSmM+5m2P2fzBwo1OOrq1x6G/WpOB0+OW2aoaMIITaFK25mG6Ym
 WTJxljyAisaJfOS8h6bykusudT2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPAXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rGnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:FpbDl6DCGmnKe13lHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:2Y7zLW0gKw55nPstzUt3s7xfI5xiTmTY9ivrAnSESlkxcqy1Q2Oq5/Yx
X-Talos-MUID: 9a23:nNM0bQhVL+pzFXpFMMOW9MMpNPhu7J2SA0A3kYQptvKgKxRJOwimtWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,147,1787011200"; 
   d="scan'208";a="532412089"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Oct 2026 04:47:03 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id B89D7180001C5
	for <openembedded-devel@lists.openembedded.org>; Fri,  9 Oct 2026 04:47:03 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 5BE31CBF201; Thu,  8 Oct 2026 21:47:03 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][scarthgap][PATCH v2 2/2] hdf5: Fix CVE-2026-17574
Date: Thu,  8 Oct 2026 21:47:02 -0700
Message-Id: <20261009044702.1620975-2-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261009044702.1620975-1-yurade@cisco.com>
References: <20261009044702.1620975-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 04:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130679

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/HDFGroup/hdf5/commit/3fa6ed6e9dfeebbc784e21d8c48e31e35a8042bc
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-17574

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Prepared v2 to include the previously missed CVE-2026-26197.patch
  and CVE-2026-26199.patch patches. Updated the source code to
  resolve hunk errors.
---
 .../hdf5/files/CVE-2026-17574.patch           | 62 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17574.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-17574.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-17574.patch
new file mode 100644
index 0000000000..bebe52cbf2
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-17574.patch
@@ -0,0 +1,62 @@
+From 3fa6ed6e9dfeebbc784e21d8c48e31e35a8042bc Mon Sep 17 00:00:00 2001
+From: tbeu <tbeu@users.noreply.github.com>
+Date: Thu, 28 May 2026 17:26:57 +0200
+Subject: [PATCH] Validate VL datatype type during decode and check file
+ pointer in H5T_set_loc (#6395)
+
+H5O__dtype_decode_helper() reads vlen.type from the file without
+validation. With corrupted HDF5 files (e.g. from fuzzing), this field
+can have an invalid value that is neither H5T_VLEN_SEQUENCE nor
+H5T_VLEN_STRING, which later triggers assert(0) in H5T__vlen_set_loc()
+(debug builds) or a NULL pointer dereference / SEGV in release builds.
+
+Fix by:
+1. Adding a validation check in H5O__dtype_decode_helper() immediately
+   after reading the vlen.type field, returning an error if the value
+   is invalid.
+2. Adding a NULL file pointer check in H5T_set_loc() before calling
+   H5T__vlen_set_loc() when loc == H5T_LOC_DISK, so the low-level
+   assert(file) invariant is never violated.
+
+This fixes the root cause at the decode level where the bad value
+enters the system, as requested in review of #6378 and #6385.
+
+Found by OSS-Fuzz via the matio fuzzer (ClusterFuzz testcase
+5366895365914624).
+
+CVE: CVE-2026-17574
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/3fa6ed6e9dfeebbc784e21d8c48e31e35a8042bc]
+
+(cherry picked from commit 3fa6ed6e9dfeebbc784e21d8c48e31e35a8042bc)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/H5Odtype.c | 2 ++
+ src/H5T.c      | 5 +++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/src/H5Odtype.c b/src/H5Odtype.c
+index 085ce24cd0..5022f43d7c 100644
+--- a/src/H5Odtype.c
++++ b/src/H5Odtype.c
+@@ -760,6 +760,8 @@ H5O__dtype_decode_helper(unsigned *ioflags /*in,out*/, const uint8_t **pp, H5T_t
+              */
+             /* Set the type of VL information, either sequence or string */
+             dt->shared->u.vlen.type = (H5T_vlen_type_t)(flags & 0x0f);
++            if (dt->shared->u.vlen.type != H5T_VLEN_SEQUENCE && dt->shared->u.vlen.type != H5T_VLEN_STRING)
++                HGOTO_ERROR(H5E_DATATYPE, H5E_BADVALUE, FAIL, "invalid VL datatype type");
+             if (dt->shared->u.vlen.type == H5T_VLEN_STRING) {
+                 dt->shared->u.vlen.pad  = (H5T_str_t)((flags >> 4) & 0x0f);
+                 dt->shared->u.vlen.cset = (H5T_cset_t)((flags >> 8) & 0x0f);
+diff --git a/src/H5T.c b/src/H5T.c
+index 1b4e182cce..f49b2b78cf 100644
+--- a/src/H5T.c
++++ b/src/H5T.c
+@@ -6365,3 +6365,8 @@ H5T_set_loc(H5T_t *dt, H5VL_object_t *file, H5T_loc_t loc)
++                /* Validate file pointer for disk-based VL types */
++                if (loc == H5T_LOC_DISK && NULL == file)
++                    HGOTO_ERROR(H5E_DATATYPE, H5E_BADVALUE, FAIL,
++                                "NULL file pointer for disk-based VL datatype");
++
+                 /* Mark this VL sequence */
+                 if ((changed = H5T__vlen_set_loc(dt, file, loc)) < 0)
+                     HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "Unable to set VL location");
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index d0da4dc086..22e77bd4e6 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -34,6 +34,7 @@ SRC_URI = " \
     file://CVE-2026-26197.patch \
     file://CVE-2026-17572.patch \
     file://CVE-2026-17573.patch \
+    file://CVE-2026-17574.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 
-- 
2.35.6


