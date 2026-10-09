Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58904CA5FED
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 04:47:11 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1369.1791521224736461873
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2026 21:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gcN/ZJKd;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3745; q=dns/txt;
  s=iport01; t=1791521224; x=1792730824;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vt2Cwkipj/Q3cHCMRmlk0HftKWbbscGl0KgtZCwl9/Q=;
  b=gcN/ZJKdXWNwtNS0DbeMIuOlv03KoYvYbj5hYhL6iCUjg+QPpwys8QPF
   RFvW7Xfb+eYrdbD6RXG+0o5DQxp7zYZoSsQ2kzPiU30Llv+7WJGH7s7+w
   893nybrgHcqNpuQqJYskYj+vA++D3DMwWdWRaF/MwDI9x7iYexXN79T1A
   +d65E4wjTL6bq6g+NSCl+SfYARyR92JjcmuwXty6LEm5Cu46d4AQ4VHLG
   jeoibE5pyiFC57eQrIR93mWxYwBDQFacMOkGbU3diApo0X1s7evdwmHyI
   ExiIETmaRVeAUvPlkUrrmCZHqU6D6XlP2jpmMVpSn0qC+hhv4fqfXpEja
   A==;
X-CSE-ConnectionGUID: Oo/2BwYJTLG7WqjrFQQf3Q==
X-CSE-MsgGUID: mlW8MBDIQ1muM3NVZIdrHg==
X-IPAS-Result: =?us-ascii?q?A0BDAgDGcMhq/4//Ja1aglmCV3VgQ0mUKYIhnh2Bfg8BA?=
 =?us-ascii?q?QEPRA0EAQGTGAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2QEgE4ARgBWQMBAlojIYMCAYJ0AxG6T4IsgQGDCh8BPwJDUNlKgWgBC?=
 =?us-ascii?q?xQBgTiFQIgjXRgBhHwnG4FJRIR+gQWBXAEBgUqGWwSDHBKBWpQoSIEeA1ksA?=
 =?us-ascii?q?VUTDQoLBwWBZgM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWEQF?=
 =?us-ascii?q?4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALgRs4PAkoQRcMdAgYD?=
 =?us-ascii?q?UgRLDcVGQQ+bgeRAx6CYYEOARMYIDccgRU1C6VaoQ+EKIwilToaM4VbpRQLm?=
 =?us-ascii?q?H2OCpZQhGmBaDyBRwsHMxoIGxWDIglKGQ+OOYNrgX+CCMgyJzICCTIBAQcCB?=
 =?us-ascii?q?w4DC4FokAABJwSBUgEB?=
IronPort-Data: A9a23:SDti0a6PjUPDqhaDFVkw/wxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 jFMWm2EPKzYMWPzf4sjbd/gp0kPv8XVzdMySAY5qX9jZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqazpMu/rZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eGopfoMxoMENy0
 dNHFykPdD66vuzt+efuIgVsrpxLwMjDJogTvDRkiDreF/tjGc6FSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEUUrsUIMpWcOOAl2TlejFVgFmUvqEwpWPUyWSd1ZCwa4GMIITSHZ89ckCwo
 2b5r0HTLjAjbdmC7GGjzECNivXvknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjZCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rd94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:/Nq5J6lSie7mG8yoPAm9RMtMkMbpDfIc3DAbv31ZSRFFG/Fw8P
 re/sjzuiWbtN98YhwdcLO7Scq9qA3nlKKdiLN5VdzJYOCMggSVxe9ZgbcKuweBJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadE/DFCm5rY4ts3CBxWPGVXV50=
X-Talos-CUID: 9a23:iXCf8G/inhsjT5X4tyuVv2kTXZoPbUz/8FP/fHChC3xHcYSbEmbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AvYHvrg6lAixzl/uJb1R3jK/Mxoxt55v+LWohsKx?=
 =?us-ascii?q?fvtShbgpOCRaRlhS4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,147,1787011200"; 
   d="scan'208";a="533120002"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Oct 2026 04:47:03 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id B322218000276
	for <openembedded-devel@lists.openembedded.org>; Fri,  9 Oct 2026 04:47:03 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 5733DCC1611; Thu,  8 Oct 2026 21:47:03 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][scarthgap][PATCH v2 1/2] hdf5: Fix CVE-2026-17573
Date: Thu,  8 Oct 2026 21:47:01 -0700
Message-Id: <20261009044702.1620975-1-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 04:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130678

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/HDFGroup/hdf5/commit/dd3080a58cc6bb86f3b34284399915da9e513262
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-17573

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Prepared v2 to include the previously missed CVE-2026-26197.patch
  and CVE-2026-26199.patch patches. Updated the source code to
  resolve hunk errors.
---
 .../hdf5/files/CVE-2026-17573.patch           | 49 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch
new file mode 100644
index 0000000000..0acbbbf0c8
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-17573.patch
@@ -0,0 +1,49 @@
+From dd3080a58cc6bb86f3b34284399915da9e513262 Mon Sep 17 00:00:00 2001
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
+@@ -6974,5 +6974,4 @@ H5D__chunk_copy(H5F_t *f_src, H5O_storage_chunk_t *storage_src, H5O_layout_chunk
+     /* Initialize the callback structure for the source */
+-    memset(&udata, 0, sizeof udata);
+     udata.common.layout    = layout_src;
+     udata.common.storage   = storage_src;
+     udata.file_src         = f_src;
+@@ -7024,3 +7023,4 @@ H5D__chunk_copy(H5F_t *f_src, H5O_storage_chunk_t *storage_src, H5O_layout_chunk
++done:
+     /* I/O buffers may have been re-allocated */
+     buf = udata.buf;
+     bkg = udata.bkg;
+@@ -7029,2 +7029,1 @@ H5D__chunk_copy(H5F_t *f_src, H5O_storage_chunk_t *storage_src, H5O_layout_chunk
+-done:
+     if (dt_dst && (H5T_close(dt_dst) < 0))
+         HDONE_ERROR(H5E_DATASET, H5E_CANTCLOSEOBJ, FAIL, "can't close temporary datatype");
+     if (dt_mem && (H5T_close(dt_mem) < 0))
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index a69e86ee5f..d0da4dc086 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -33,6 +33,7 @@ SRC_URI = " \
     file://CVE-2026-26199.patch \
     file://CVE-2026-26197.patch \
     file://CVE-2026-17572.patch \
+    file://CVE-2026-17573.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 
-- 
2.35.6


