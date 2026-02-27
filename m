Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF66FD9E39
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 05:10:58 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88793.1772169050856776456
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Feb 2026 21:10:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=d/FuVyzh;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1371; q=dns/txt;
  s=iport01; t=1772169050; x=1773378650;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ruk9BRglijS9aBb90jkdZ4zB8kO+3yam7wIqkGbUQKk=;
  b=d/FuVyzhdDPvnF9b1y2P/5jNPwI8hIoej7hWEW9GReJ6c+XFNY/Ldord
   nSVUjUG+nZCaAD/uGoDFJKFNXOPvb/SwvGc9P9noUFiZqI44ziucXpbtA
   KyB56CGB/pN6a8dEdfsWofGt2HiYl2Nt5r++g/lpnDSfu3iS++nNyAdUn
   ErK5FNEqxN9XFHY1VQkpXxYaQuLnMRJjPy6hHDNOh2BatG9e/8PgElhJd
   Zku9AlkWWSx2SvJcq/PZllgV0pFqRN6EMRjQXevyeJF4gAI61GEXELCRc
   mVnhBhbmkkUzUGGkNdbP09Gvq0T0ev02BMF5U8VxJwcpKX5cE2/KjQs6f
   w==;
X-CSE-ConnectionGUID: XZFPaaFmQPa2W7nkP1IPmA==
X-CSE-MsgGUID: RDqi87v3Qv+gqjKjUbvVVw==
X-IPAS-Result: =?us-ascii?q?A0DqFwDtJqFp/4z/Ja1aHAEBATwBAQQEAQECAQEHAQGBZ?=
 =?us-ascii?q?QKCRg9xX0JJk1oBgnCeHYF/DwEBAQ8UAi4NBAEBhEFGjSECJjQJDgECBAEBA?=
 =?us-ascii?q?QEDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8Nhl02AUYwXESDAgGCc?=
 =?us-ascii?q?wIBEaZwgiyBAYR82yYBBQYUAYE4AYU7iBl0hHonGxuBcoR9gmECAhiBDYEGh?=
 =?us-ascii?q?XcEgiKBDoF/kSRIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQobBwWGC?=
 =?us-ascii?q?A+IdHhugRqCHQMLGA1IESw3FBsEPm4HjXo/gjMBIRxRLIIspXShDgoog3SMH?=
 =?us-ascii?q?pU6GjOqay6YWI4JlWdphGiBaDyBWXAVgyJSGQ+SIYUTwRQiNQI6AgcLAQEDC?=
 =?us-ascii?q?ZFqgX0BAQ?=
IronPort-Data: A9a23:lRtky6k1w2e7Cm+vyyfPhTno5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOUDiOO62LNGqgfo8naIvl8khQ65bVzdRgGlFv/ik8H1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZS31GONgWYubDpOsfzb8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fb0q1N5+CE9Lz
 MQRcg9SaBO73sOOxZvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiYBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYj/7C7pm9AusrnnybyVRtHqepLE85C7YywkZPL3FboWKKoTbHZ8P9qqej
 ljq5mWpXQ9BDcLcxiOH0XCRjPHxozyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBfCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:PKkKh611T7SLNZ9T2PjBPgqjBLkkLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKkXbak7DHio379
 YGT0C4Y+eAaWRHsQ==
X-Talos-CUID: 9a23:w28onGC3+MJJwOv6ExlV2nYdE+4gS0XUlkiPJUyAUEdRTZTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AL7/oYw3TKzfNevAhzLDChjvKKzUj2Yi3CRBSj84?=
 =?us-ascii?q?/pYqLLC5TOQqXkgqJXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,313,1763424000"; 
   d="scan'208";a="677809022"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Feb 2026 05:10:50 +0000
Received: from sjc-ads-4197.cisco.com (sjc-ads-4197.cisco.com [171.70.54.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id D259918000601;
	Fri, 27 Feb 2026 05:10:49 +0000 (GMT)
Received: by sjc-ads-4197.cisco.com (Postfix, from userid 1847788)
	id 79A4ECC1282; Thu, 26 Feb 2026 21:10:49 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [oe] [meta-selinux] [PATCH v1] selinux_common: Correct `CVE_PRODUCT` value
Date: Thu, 26 Feb 2026 21:10:48 -0800
Message-Id: <20260227051048.3950-1-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.54.218, sjc-ads-4197.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 05:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124691

From: Het Patel <hetpat@cisco.com>

The current `CVE_PRODUCT` value (`kernel:selinux`) is incorrect for
this recipe.

Root Cause Analysis:
`CVE-2020-10751` is reported against the `kernel:selinux` CPE, and
its fix (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fb73974172ff)
applies to the Linux kernel source tree. This change is unrelated to
the source code used by this recipe.

Change Justification:
`CVE-2021-36084` is reported against the `selinux_project:selinux`
CPE. Its fix (https://github.com/SELinuxProject/selinux/commit/f34d3d30c832)
directly applies to the SELinux source repository used by this recipe,
confirming the vulnerability is applicable to this product.

Based on this analysis, `CVE_PRODUCT` has been updated to the
correct value: `selinux_project:selinux`

Signed-off-by: Het Patel <hetpat@cisco.com>
---
 recipes-security/selinux/selinux_common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-security/selinux/selinux_common.inc b/recipes-security/selinux/selinux_common.inc
index a7f704d..aaf0b90 100644
--- a/recipes-security/selinux/selinux_common.inc
+++ b/recipes-security/selinux/selinux_common.inc
@@ -20,4 +20,4 @@ do_install() {
         SHLIBDIR="${base_libdir}"
 }
 
-CVE_PRODUCT ?= "kernel:selinux"
+CVE_PRODUCT ?= "selinux_project:selinux"

