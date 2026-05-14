Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8043BCD4F39
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 12:49:16 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10168.1778762952607953607
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2026 05:49:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ajmSyiis;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=987; q=dns/txt;
  s=iport01; t=1778762952; x=1779972552;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ENgHUoSMwhu0plw/qeAgT3VW9ocu+WOLI8KmILG8Q8I=;
  b=ajmSyiisStrZbur1+XzeSBtVL4tQ5JUwkTEuOor9VvF0+yz8rJQC8cYA
   XLI+QpayRLS91rVjnhACftPYFJJTU9YQES+f75lwG1DlMFn0Sn6KmzvIk
   N5NjfQ+MhuFq8J5V/+2bAvqDalLff1JZOlSPKGsUq5Hvb4uFIxWmSm7By
   cl+ogzyAAyez/rlXPeSZFkh9B7tVYDfa31qBUoYx7g9VUvZaq2MK1qb14
   zAQQeuF2l0u99N80pMY6n45y5v5dS+IgfsN+WQ6Eu4/5dLvvpEzHplCkq
   2J/hHpe+m2PD6M2OExC9stKuIz24VHPgowI4oR7GutD00OyzgJDVS/59S
   g==;
X-CSE-ConnectionGUID: PjjQapDoQ+m+sTGWPDGVOg==
X-CSE-MsgGUID: eju11k64T0WS3p4RLViacA==
X-IPAS-Result: =?us-ascii?q?A0BBAgBywwVq/4//Ja1aglmCV3JfQkkDlCegPoF/DwEBA?=
 =?us-ascii?q?Q89FAQBAZI6AiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Th?=
 =?us-ascii?q?k8NhxMBGAFdXB0BJoMCAYJzAgERBrBzgiyBAYMoAT8CQ1DbKAELFAGBOIU/i?=
 =?us-ascii?q?B1zAYR7JxsbgXKBFYNogQWBXAEBgi2FdwSCIoEOjnJIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XgQsbBwWBS4FccmqBAYRfeCMvA06BK0kDCxgNSBEsN?=
 =?us-ascii?q?xQbBD5uB4pCHA+CMIEOLIIsEaVjoQ4KKIN0jB6VOhozqmsLmHuOCZZQhGiBa?=
 =?us-ascii?q?DyBRwsHcBWDIglKGQ+OOINrgX+DFMMyJDUCDC8BAQcCBw0DC4FokX0BAQ?=
IronPort-Data: A9a23:iPhoE6ueoT2T0OZ/4kML22u4EufnVAZfMUV32f8akzHdYApBsoF/q
 tZmKWvXOv3YNDGmKN8iadixphwB657WyoVgSQo/qSkzQytDgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFYzdJ5xYuajhKs//a9Es21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwwuR1OGhW2
 fshazVOdSysuNqa74ycRbw57igjBJGD0II3oHpsy3TdSP0hW52GG/uM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtMYH49tL/Aan3XaCBUtVefpaMf6GnIxws327/oWDbQUoPWGJQIwBnE+
 woq+Uz0AAxDbd/BlQbdzUn3nrP1uR36UYk7QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZNpottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:Vkl2Fq3BZZ+4gvMPGK0I/QqjBIIkLtp133Aq2lEZdPUzSL37qy
 nAppomPHPP5Qr5O0tQ+uxoRpPgfZq0z/cciuMs1NyZMzUO1lHFEGgb1+vf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkWyF+xJK+qjhzEhu7t2uq0tQcQ==
X-Talos-CUID: =?us-ascii?q?9a23=3Ai2jbAmn2xu6cvSeGWdEdoIrC55jXOUXfzk7ZO2O?=
 =?us-ascii?q?/MCVsC6apZmCo1IxatMU7zg=3D=3D?=
X-Talos-MUID: 9a23:svhd7wo7LONpkxeNpP0ezzxgKZ4x4PryNBgyqs4e5/OgCy15MB7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,234,1770595200"; 
   d="scan'208";a="745956745"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 14 May 2026 12:49:11 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 7EBD01800039B
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 12:49:11 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 219E4CC1282; Thu, 14 May 2026 05:49:11 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] libssh: set status for CVE-2025-14821
Date: Thu, 14 May 2026 05:48:24 -0700
Message-Id: <20260514124823.2065721-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 12:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126988

From: Sudhir Dumbhare <sudumbha@cisco.com>

The vulnerability is Windows-specific and depends on loading
configuration from C:\etc, which does not apply to Linux/Yocto builds

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-14821
https://github.com/advisories/GHSA-5jf9-8f86-jhvw
https://www.libssh.org/security/advisories/CVE-2025-14821.txt

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 meta-oe/recipes-support/libssh/libssh_0.10.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index 189305fd2e..20de046e58 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -68,3 +68,5 @@ do_install_ptest () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2025-14821] = "not-applicable-platform: only affects Windows due to loading configuration from C:\etc"
-- 
2.35.6


