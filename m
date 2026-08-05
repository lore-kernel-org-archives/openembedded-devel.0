Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63515C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 05:09:51 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33698.1785906583888748050
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 22:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=C+AN4Ali;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4539; q=dns/txt;
  s=iport01; t=1785906583; x=1787116183;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T4lGEFOYjLzL4cVA2sa2zEnLXHan2keLTDNjP/IuSVg=;
  b=C+AN4AliS0lZaaCuvgRGZ+JZxcfzijBvz9shUnpXmEHfdVN0gxekSLmM
   1pBEmmhF0yTy7R8zYJz5EaBEorEb0UJZ+tpDWiQlow1GgtSqsQL+qeV27
   QS2VraALns3XNKckjW7TJ8W7sIAFzNl69zOu2LIAeW5FYmpuL892doLF0
   l1mnLstQY/OKJHmraBEQ6ZrfDxLj2iMlkREJdfVIj+ncEqpnvY1GdiCSk
   ht852whIZeQ0d7R0Iw2yoY/Zvo1d352VlxwL6XBarax6OlnA7NnkAYCMn
   wOCNNgwqhN0EkaU1dBCgYGCnoIF46DP2v2HzRGm9/yCPB9rSYnUFLx/SK
   g==;
X-CSE-ConnectionGUID: Wda7qTS4S7KjnTcdUJHPlA==
X-CSE-MsgGUID: S59zVvSaSB+U+45WkEP+hg==
X-IPAS-Result: =?us-ascii?q?A0BKAgDaxHJq/5QQJK1aHgE8DAILgWWCV3RfQkkDlkcDn?=
 =?us-ascii?q?huBfg8BAQEPRA0EAQGFBQKNZgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQCARG8Y?=
 =?us-ascii?q?oF5M4EBgygBgVTbLgELFAEFgTOFP4ghXRgBhHwnGxuBcoEVg2mBBYFcAoEnh?=
 =?us-ascii?q?n4Egg0VehKBWh6DBoNKiglIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4Xg?=
 =?us-ascii?q?Q0bBwWBHYEohG0jGTZ8gQlegS0qZAESF4EJgnsCgnpvCxgNSBEsNxQZBD5uB?=
 =?us-ascii?q?41oIIFfWgcBcxoBKxcJXwZ4Lw8CCwIHFZJ9kB6CIaEPCiiDdYwhlToaM4QEg?=
 =?us-ascii?q?VeSQJJRC5h9jgqWUIRpgWg8gVlwFYMiCUoZD444g2uEB4EMxyYkNQIJAy8BA?=
 =?us-ascii?q?QcCBw4DC4FokAACJgdvYAEB?=
IronPort-Data: A9a23:ACbXlKxiSwF83rbsVYp6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUCy
 GseWj+AOq6CM2D2edolYd+x9UsB6JHSnNZmT1FlqlhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHybuiJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkaj5MscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJH46NNIBxt0rOj5t9
 /okIzwwTDC7g8vjldpXSsE07igiBMDvOIVavjRryivUSK9/B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUiQC/FMEg9/5JYWkOq2j3/kcyVwo1OOrq1x6G/WpOB0+Oi0bISKIoLaG625mG6j+
 zPUwXrCCyowd+HclWe68V+Uxe/AyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPAXy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rBnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:DAfpIaMozTZ5BcBcThmjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH8dmpM
 FdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPHhXg2UK1XYDNu5deXcGPDV7OQ==
X-Talos-CUID: 9a23:0JnVMmDtnlFsjov6ExZr/RENJvt5SSL+znHsKEOFK0ZRTJTAHA==
X-Talos-MUID: 9a23:N1RLxwq6VbZIzh6HrwMezwo/ZdVW/Z+nM2pOrNZa5vaHGBQzOzjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,205,1779148800"; 
   d="scan'208";a="814670686"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Aug 2026 05:09:31 +0000
Received: from sjc-ads-20746.cisco.com (sjc-ads-20746.cisco.com [171.70.189.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 78A571800038D;
	Wed,  5 Aug 2026 05:09:31 +0000 (GMT)
Received: by sjc-ads-20746.cisco.com (Postfix, from userid 1887503)
	id 16FF3C75FFD; Tue,  4 Aug 2026 22:09:31 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-oe][wrynose][PATCH 2/2] hdf5: Fix CVE-2026-26197
Date: Tue,  4 Aug 2026 22:09:31 -0700
Message-Id: <20260805050931.3936854-2-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260805050931.3936854-1-devanshp@cisco.com>
References: <20260805050931.3936854-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-20746.cisco.com [171.70.189.245];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.189.245, sjc-ads-20746.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 05:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128796

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream HDF5 2.1.0 backport for
CVE-2026-26197. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/HDFGroup/hdf5/commit/8cd9f7a7ba6757fbb72e36bbe23e127f8507c8a6
[2] https://github.com/HDFGroup/hdf5/security/advisories/GHSA-gh44-7wpq-622f

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../hdf5/files/CVE-2026-26197.patch           | 70 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-26197.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2026-26197.patch b/meta-oe/recipes-support/hdf5/files/CVE-2026-26197.patch
new file mode 100644
index 0000000000..d610a6a95f
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-26197.patch
@@ -0,0 +1,70 @@
+From fc4cead0fabba806750f0f90ec20ce2cf08f6027 Mon Sep 17 00:00:00 2001
+From: bmribler <39579120+bmribler@users.noreply.github.com>
+Date: Tue, 3 Feb 2026 16:26:51 -0500
+Subject: [PATCH] Validate datatype size for consistency (#6173)
+
+User report:
+When a file is corrupted such that an array datatype's size, the
+number of elements, and the element size are not in agreement, it can
+trigger an out of bounds read.
+(private GH issue: GHSA-gh44-7wpq-622f)
+Added a validation to ensure the above are in agreement.
+
+CVE: CVE-2026-26197
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/8cd9f7a7ba6757fbb72e36bbe23e127f8507c8a6]
+
+Backport Changes:
+- Omitted release_docs/CHANGELOG.md because its HDF5 2.1.0 release
+  context does not apply to the 2.0.0 backport.
+
+(cherry picked from commit 8cd9f7a7ba6757fbb72e36bbe23e127f8507c8a6)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ src/H5Odtype.c | 20 +++++++++++++++++++-
+ 1 file changed, 19 insertions(+), 1 deletion(-)
+
+diff --git a/src/H5Odtype.c b/src/H5Odtype.c
+index f53f608ee..d6405cdb8 100644
+--- a/src/H5Odtype.c
++++ b/src/H5Odtype.c
+@@ -774,7 +774,8 @@ H5O__dtype_decode_helper(unsigned *ioflags /*in,out*/, const uint8_t **pp, H5T_t
+                 HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "invalid datatype location");
+             break;
+ 
+-        case H5T_ARRAY:
++        case H5T_ARRAY: {
++            size_t expected_size; /* for validating array datatype size consistency */
+             /*
+              * Array datatypes...
+              */
+@@ -816,6 +817,22 @@ H5O__dtype_decode_helper(unsigned *ioflags /*in,out*/, const uint8_t **pp, H5T_t
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
+@@ -829,6 +846,7 @@ H5O__dtype_decode_helper(unsigned *ioflags /*in,out*/, const uint8_t **pp, H5T_t
+             if (dt->shared->parent->shared->force_conv == true)
+                 dt->shared->force_conv = true;
+             break;
++        }
+ 
+         case H5T_COMPLEX: {
+             bool homogeneous;
diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
index b28d1e0faf..20b2f1100e 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BP
            file://0002-Remove-suffix-shared-from-shared-library-name.patch \
            file://0001-cmake-remove-build-flags.patch \
            file://CVE-2026-26199.patch \
+           file://CVE-2026-26197.patch \
            "
 SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 
-- 
2.35.6

