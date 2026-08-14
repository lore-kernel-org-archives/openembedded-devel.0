Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58FB7C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 15:21:23 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15278.1786720876737950881
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 08:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hI3KWHeR;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5053; q=dns/txt;
  s=iport01; t=1786720876; x=1787930476;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H0fdg1eO3TiAJ3HroUhaQu6D94LgutTAzv6wvKSubxA=;
  b=hI3KWHeR2eKqAlx+2jgwuQhrePpqxCtN2S8MtwyP9fckmSVeZ3bC7ldO
   5aZbJaIXTbI+eYlfNMLsjkoTKwCzRlv8PRiZVPIYcCHe/pOIZklhi8/kc
   cM0MaWE+cpCz1k/uaxkOM3qz8+lGLvOCLSuETkQUPkhM9K3Us5WI/f+Lw
   z/aPqMXbXtowVo/2dgIvev1mmC6RhbyyOzBrNOmzTCVWG5kLFlPh7aHvF
   AUnISFGeAeHPAnISEg+a8BCagEJO6ece8Z7kiE8TBl3RzDZ8MaoGmWOHN
   ZFzBOg3yuSIXoKY4KB+VaEOlJxCmFrYyTppryNGh59wIFPw70aLNVoUnf
   w==;
X-CSE-ConnectionGUID: LYxaEYNaSAmgqSLFoGRNRg==
X-CSE-MsgGUID: TZCcTNWSQbyv6srW4+UogA==
X-IPAS-Result: =?us-ascii?q?A0BIAgB/MX9q/5MQJK1aglmCV3ReQ0kDlkcDnhuBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKNaQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBAycLARgBLRAcAwECLysjCBmDAgGCdAMRww2BeTOBAYMJH?=
 =?us-ascii?q?wE/AkNQ2zABCxQBBYEzhT+IIV0YAYR8JxsbgXKBFYNpgQWBXAEBgSeGfgSCD?=
 =?us-ascii?q?RV6EoFagS+BVINIinNIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bB?=
 =?us-ascii?q?gWBHYEohDcjGTZ6gQlegSsqYQESF4EJghICgnOCBgIBSQwLGA1IESw3FBkEP?=
 =?us-ascii?q?m4HjhoggWZaBwFzGgErFwlfBoEnDwILAgcVkn2SP6EPCiiDdowhlToaM4QEg?=
 =?us-ascii?q?VeSQJJRC5h9jgqWEz2EaYFoPIFHCwdwFYMiCUoZD444g2uBf4IIyDInMgIJA?=
 =?us-ascii?q?y8BAQcCBw4DC4FohGGLHwImB29gAQE?=
IronPort-Data: A9a23:kNVZe6O4CBUKC2nvrR30lsFynXyQoLVcMsEvi/4bfWQNrUoihTcHy
 2oXWG6AMvfeZ2LwfNAjbo638xsH7JPUnN43GXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf1gmIsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69FfHEgbDKsRwc9yDnh10
 dIfBworVB/W0opawJrjIgVtrs0nKM+uOMYUvWttiGiBS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGYwBPjDS0Un1lM/BJ8gleGzhmHXeDxDo1XTrq0yi4TW5Fwpj+G2YIWNKrRmQ+1prG2Tm
 kT5xF3zEw9EL8aglXm49X2F07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++Nu0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:qcUDwanO9CslqubQ6icPMgnOSunpDfL03DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDTYNykdsS+D2njaL/8QhP+a7auvmeDSi11pTQ1sduVcyj0RMHfjLqWzLzM2fqbQ0/
 Gnl7J6mwY=
X-Talos-CUID: 9a23:GVdqWmFZaJ0SVnemqmJDxV4dN/EDe0b0yXjJGGuWDklTboeaHAo=
X-Talos-MUID: 9a23:jgQNDwad42J//uBTiw3Hjw1EC/xR6bWwVlsXrslFhs6LHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,222,1779148800"; 
   d="scan'208";a="807138708"
Received: from alln-l-core-10.cisco.com ([173.36.16.147])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 14 Aug 2026 15:21:15 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-10.cisco.com (Postfix) with ESMTPS id 9588718000161;
	Fri, 14 Aug 2026 15:21:15 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id 33D37CC12A7; Fri, 14 Aug 2026 08:21:15 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-oe][scarthgap][PATCH 2/2] hdf5: Fix CVE-2026-26197
Date: Fri, 14 Aug 2026 08:21:15 -0700
Message-Id: <20260814152115.3812730-2-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260814152115.3812730-1-devanshp@cisco.com>
References: <20260814152115.3812730-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: alln-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129052

From: Devansh Patel <devanshp@cisco.com>

This patch backports the upstream fix first released in HDF5 2.1.0.
The upstream fix commit is referenced in [1], and the public advisory
is referenced in [2].

Although the advisory [2] lists HDF5 2.0.0 as affected, NVD [3]
also marks versions before 2.0.0 as affected, and its CPE
configuration marks versions before 2.1.0 as vulnerable. Scarthgap's
HDF5 1.14.4-3 H5T_ARRAY decoder in src/H5Odtype.c computes the array
element count and decodes the parent datatype without checking for
multiplication overflow or verifying that the stored datatype size
matches the element size multiplied by the element count. The
vulnerable code path is therefore present in 1.14.4-3, so this
backport is applicable.

[1] https://github.com/HDFGroup/hdf5/commit/8cd9f7a7ba6757fbb72e36bbe23e127f8507c8a6
[2] https://github.com/HDFGroup/hdf5/security/advisories/GHSA-gh44-7wpq-622f
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-26197

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../hdf5/files/CVE-2026-26197.patch           | 69 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-26197.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-26197.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-26197.patch
new file mode 100644
index 000000000..4df770e93
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-26197.patch
@@ -0,0 +1,69 @@
+From 8a69764e016009a0ac949707d84161550dde8af4 Mon Sep 17 00:00:00 2001
+From: bmribler <39579120+bmribler@users.noreply.github.com>
+Date: Tue, 3 Feb 2026 16:26:51 -0500
+Subject: [PATCH] Validate datatype size for consistency (#6173)
+
+User report:
+When a file is corrupted such that an array datatype's size, the number of elements,
+and the element size are not in agreement, it can trigger an out of bounds read.
+(private GH issue: GHSA-gh44-7wpq-622f)
+Added a validation to ensure the above are in agreement.
+
+CVE: CVE-2026-26197
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/8cd9f7a7ba6757fbb72e36bbe23e127f8507c8a6]
+
+Backport Changes:
+- Omitted release_docs/CHANGELOG.md because the file does not exist in
+  HDF5 1.14.4-3 and its HDF5 2.1.0 release context is not applicable.
+
+(cherry picked from commit 8cd9f7a7ba6757fbb72e36bbe23e127f8507c8a6)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ src/H5Odtype.c | 20 +++++++++++++++++++-
+ 1 file changed, 19 insertions(+), 1 deletion(-)
+
+diff --git a/src/H5Odtype.c b/src/H5Odtype.c
+index 085ce24cd..2541b001f 100644
+--- a/src/H5Odtype.c
++++ b/src/H5Odtype.c
+@@ -783,7 +783,8 @@ H5O__dtype_decode_helper(unsigned *ioflags /*in,out*/, const uint8_t **pp, H5T_t
+                 HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "invalid datatype location");
+             break;
+ 
+-        case H5T_ARRAY:
++        case H5T_ARRAY: {
++            size_t expected_size; /* for validating array datatype size consistency */
+             /*
+              * Array datatypes...
+              */
+@@ -825,6 +826,22 @@ H5O__dtype_decode_helper(unsigned *ioflags /*in,out*/, const uint8_t **pp, H5T_t
+             if (H5O__dtype_decode_helper(ioflags, pp, dt->shared->parent, skip, p_end) < 0)
+                 HGOTO_ERROR(H5E_DATATYPE, H5E_CANTDECODE, FAIL, "unable to decode array parent type");
+ 
++            /* Check for multiplication overflow */
++            if (dt->shared->parent->shared->size > 0 &&
++                dt->shared->u.array.nelem > SIZE_MAX / dt->shared->parent->shared->size)
++                HGOTO_ERROR(H5E_DATATYPE, H5E_BADVALUE, FAIL,
++                            "array datatype size calculation would overflow");
++
++            expected_size = dt->shared->parent->shared->size * dt->shared->u.array.nelem;
++
++            /* Verify the stored size matches the calculated size */
++            if (dt->shared->size != expected_size)
++                HGOTO_ERROR(
++                    H5E_DATATYPE, H5E_BADVALUE, FAIL,
++                    "array datatype size mismatch: expected %zu (element_size=%zu * nelem=%zu), got %zu",
++                    expected_size, dt->shared->parent->shared->size, dt->shared->u.array.nelem,
++                    dt->shared->size);
++
+             /* Check if the parent of this array has a version greater than the
+              * array itself. */
+             H5O_DTYPE_CHECK_VERSION(dt, version, dt->shared->parent->shared->version, ioflags, "array", FAIL)
+@@ -838,6 +855,7 @@ H5O__dtype_decode_helper(unsigned *ioflags /*in,out*/, const uint8_t **pp, H5T_t
+             if (dt->shared->parent->shared->force_conv == true)
+                 dt->shared->force_conv = true;
+             break;
++        }
+ 
+         case H5T_NO_CLASS:
+         case H5T_NCLASSES:
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index 80ab17dd2..7769a3034 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -31,6 +31,7 @@ SRC_URI = " \
     file://CVE-2025-2308.patch \
     file://CVE-2025-6857.patch \
     file://CVE-2026-26199.patch \
+    file://CVE-2026-26197.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 
-- 
2.35.6

