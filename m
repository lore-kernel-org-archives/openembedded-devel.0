Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91078C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 05:09:31 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33694.1785906564085992250
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 22:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Dh7OAi8e;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4539; q=dns/txt;
  s=iport01; t=1785906564; x=1787116164;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i88kl91tWSFJtbo9RuWvOKXLRHn4Oxg7EhmNGroYsjw=;
  b=Dh7OAi8ep6El6zHXm0HGlAGrrwA+JwOrqQk/tT4/VDOqunIuN2r/FZpc
   4xRr+tWuQ6/bx09zJ/lbBwH+eGxM6pHctr+RfTh9azGYzGWZP0Il3c58w
   4o7I01kbGTNX/Am9yvVglpF/qQ0J5JwHQlKbDzWFib8zVFk2iRNQYib5R
   zHXfRfLm9KAwaChEIU4WB/XoVVLoeCf8Ysuu89jedcGeCMK0RxlC6dtij
   YKbk0B7eeyltUJms84YEPdYB+OnPPGuL/i7hEVTCvL66N6ughkjD4iLyq
   WegoUMSaRpIZmEbdbqwvAymt3PMBeMXvlqt9P9UIkc+MsZiN8+4C7sdmI
   g==;
X-CSE-ConnectionGUID: e32epLZLSlG5sRDx6TDp6g==
X-CSE-MsgGUID: DOpQWf8wQvaqfSsuj5d+gw==
X-IPAS-Result: =?us-ascii?q?A0BKAgBfxHJq/40QJK1aHgE8DAILgWWCV3RfQkkDlkcDn?=
 =?us-ascii?q?huBfg8BAQEPRA0EAQGFBQKNZgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaAQIBAycLARgBLRAcAwECLysjCBmDAgGCdAIBEbxhg?=
 =?us-ascii?q?XkzgQGDKAGBVNsuAQsUAQWBM4U/iCFdGAGEfCcbG4FygRWDaYEFgVwCgSeGf?=
 =?us-ascii?q?gSCDRV6EoFaHoMGg0qKCUiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBD?=
 =?us-ascii?q?RsHBYEdgSiEbSMZNnyBCV6BLSpkARIXgQmCewKCem8LGA1IESw3FBkEPm4Hj?=
 =?us-ascii?q?WgggV9aBwFzGgErFwlfBngvDwILAgcVkn2QHoIhoQ8KKIN1jCGVOhozhASBV?=
 =?us-ascii?q?5JAklELmH2OCpZQhGmBaDyBWXAVgyIJShkPjjiDa4QHgQzHJiQ1AgkDMAEHA?=
 =?us-ascii?q?gcPAoFzkAACJgdvYAEB?=
IronPort-Data: A9a23:z/mMXKPhYdAzqz3vrR30lsFynXyQoLVcMsEvi/4bfWQNrUomg2cHy
 DMfCm3VOfreMWb9fIpyPt+xoUwP756EztQySnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf1g2IsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/g1VkwuGb88weJYXHp02
 exGFBwVMB/W0opawJrjIgVtrs0nKM+uOMYUvWttiGmFS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGY2BPjDS0Un1lM/BJ8gleGzhmHXeDxDo1XTrq0yi4TW5FMgjOmyaIqMJbRmQ+15uV6hm
 WyW4F3nCwgUD8eCy2eJsX2z07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++Mv0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:+So4ia2bqKfDnFwuF61M2wqjBGokLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmoFFebvN5CBB/KXHyTj9Nco8y9+a963tr+Lfw3BxCTxOUchbnn5E4sLxKDwMeOGAbqBJbK
 ah2g==
X-Talos-CUID: 9a23:ZYj0a2xzdOURcZlQ+DvjBgUZQZooalnv6EzUDBKjM0p5FoG5UQGfrfY=
X-Talos-MUID: 9a23:7DCtZwjsVfgNwZKqY56cMsMpGOBw2pugWF80j5wftfKfKC4tN3SSk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,205,1779148800"; 
   d="scan'208";a="794970817"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Aug 2026 05:09:23 +0000
Received: from sjc-ads-20746.cisco.com (sjc-ads-20746.cisco.com [171.70.189.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 260DB1800049A;
	Wed,  5 Aug 2026 05:09:23 +0000 (GMT)
Received: by sjc-ads-20746.cisco.com (Postfix, from userid 1887503)
	id B35CCC75FFD; Tue,  4 Aug 2026 22:09:22 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-oe][PATCH 2/2] hdf5: Fix CVE-2026-26197
Date: Tue,  4 Aug 2026 22:09:22 -0700
Message-Id: <20260805050922.3936520-2-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260805050922.3936520-1-devanshp@cisco.com>
References: <20260805050922.3936520-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-20746.cisco.com [171.70.189.245];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.189.245, sjc-ads-20746.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 05:09:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128794

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
index 0000000000..c8d3547e08
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2026-26197.patch
@@ -0,0 +1,70 @@
+From 7a9f34e150beb688397d3f562d0f6ed1f9cd0e60 Mon Sep 17 00:00:00 2001
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

