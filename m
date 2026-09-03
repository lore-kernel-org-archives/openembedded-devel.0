Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40589C624D4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 16:00:38 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11233.1788451229314569009
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 09:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=cDmCsnk1;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4200; q=dns/txt;
  s=iport01; t=1788451229; x=1789660829;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ViSFfc2rgBEIxOqjWpmGwq+0tZCLOgdM9YFg5jpgeIw=;
  b=cDmCsnk1TYSXZ5zdYTSHDiZ5BOgJ67/qDSDlomcN/aRRtWNgGhvlo5+g
   +SmnBXkTetLTVuxowIJSEyj6WmH3t/IrunRpNwckb/SC+7orRbPfNU9uc
   2gqkQQKy+cZ5aKaPRir/9sNR7HFWj27bvLCOQjpheKwZUYRB0eO3fWOxJ
   0xqYXyWb+JR2jc/jolPMXaNmrJquIgqDA9TD2LILHNgJAK9r+W0FM/fJt
   KjOfI0e7Z+8fiT3hGoGdKh9I+SiJLioqJlrh/ivRWFn65LqnwJGlY2cOI
   u7Eed6wR/xVrEvQeuQoDj/qxpWz2gWpiaRhLI4o9oaWISSNgbbjhEceIs
   w==;
X-CSE-ConnectionGUID: Afso784cSq6yY1J11eeI2A==
X-CSE-MsgGUID: kjn8VBYJQYy7dUuEkiPZcg==
X-IPAS-Result: =?us-ascii?q?A0AgBQCbmJlq/4oQJK1aglmCV3RgQ0mHYoxHgiEDnhuBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGFBQKOAAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZAZAQIBAycLARgBPRwDAQIvKyMIGYMCAYJ0AxHBD4F5M4EBg?=
 =?us-ascii?q?wkfAT8CQ1DZSoFnAQsUAYE4hT+IIl0YAYR8JxuBSUSBFYE7gi6BBYFcAQGIJ?=
 =?us-ascii?q?QSCDYEPEoFahXeMF0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDRsGB?=
 =?us-ascii?q?YEdgSeDPyMZNnqBCV6BKylhEheBCYIIAoJUggUCAUlDDgdHUwknOAsYDUgRL?=
 =?us-ascii?q?DcVGQQ+bgeOXx+CUAF6EwErF2iBFCgCDYpHmxGhD4QojCKVOhozoz2HMAuYf?=
 =?us-ascii?q?Y4KlgFPhGmBaDyBRwsHMxoIGxWDIglKGQ+OOYNrgX/KOicyAgkyAQEHAgcOA?=
 =?us-ascii?q?wuBaJACLW9gAQE?=
IronPort-Data: A9a23:7MLFM61LH97tvAPUy/bD5YRwkn2cJEfYwER7XKvMYLTBsI5bpzUDz
 WZKXWqFPfmJZjSjKogiaN7l/B9S65OEm4BjGws63Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g28saTpIg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGJU8tOtJIpu1MGD9fx
 KU6cWkAYzHZrrfjqF67YrEEasULJc3vOsYb/3pn1zycVa9gSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2N0Sojx5nYj/7DLovgf2hinTXeDxDo1XTrq0yi4TW5FwrgeKzbIGJJbRmQ+1WnEDIm
 Ej33V3IE04WCcGyyju9wHmj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++MukCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:cbf0L6DMgMDjEG3lHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:/MQEA2+YLn6qAEBsiiKVv2caAcd6IiHW926OMn7hKz8wRbC0E3bFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AI0YIJg+VomubgmcFo10ebF2Qf8Rq5fSQInEvqKQ?=
 =?us-ascii?q?X5MW5KAFzOg+vhzviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,260,1779148800"; 
   d="scan'208";a="829264347"
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 03 Sep 2026 16:00:28 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id 4F356180008E8
	for <openembedded-devel@lists.openembedded.org>; Thu,  3 Sep 2026 16:00:28 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id DED7ECE9ED1; Thu,  3 Sep 2026 09:00:27 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][scarthgap][PATCH 3/3] hdf5: Fix CVE-2026-17574
Date: Thu,  3 Sep 2026 09:00:27 -0700
Message-Id: <20260903160027.1611530-3-yurade@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129741

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/HDFGroup/hdf5/commit/3fa6ed6e9dfeebbc784e21d8c48e31e35a8042bc
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-17574

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../hdf5/files/CVE-2026-17574.patch           | 64 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17574.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-17574.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-17574.patch
new file mode 100644
index 0000000000..92b9b1dcb4
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-17574.patch
@@ -0,0 +1,64 @@
+From d66aa48babddfa0dad0b391917c7bdd6f509ff41 Mon Sep 17 00:00:00 2001
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
+@@ -6362,5 +6362,10 @@ H5T_set_loc(H5T_t *dt, H5VL_object_t *file, H5T_loc_t loc)
+                         ret_value = changed;
+                 } /* end if */
++                /* Validate file pointer for disk-based VL types */
++                if (loc == H5T_LOC_DISK && NULL == file)
++                    HGOTO_ERROR(H5E_DATATYPE, H5E_BADVALUE, FAIL,
++                                "NULL file pointer for disk-based VL datatype");
++
+                 /* Mark this VL sequence */
+                 if ((changed = H5T__vlen_set_loc(dt, file, loc)) < 0)
+                     HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "Unable to set VL location");
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index fffd5b7b37..a1113b5532 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -32,6 +32,7 @@ SRC_URI = " \
     file://CVE-2025-6857.patch \
     file://CVE-2026-17572.patch \
     file://CVE-2026-17573.patch \
+    file://CVE-2026-17574.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 
-- 
2.35.6


