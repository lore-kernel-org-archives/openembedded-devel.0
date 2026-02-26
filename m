Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CA3FCE06F
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 12:51:10 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69309.1772110268627259599
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Feb 2026 04:51:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MB2JCuCQ;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1209; q=dns/txt;
  s=iport01; t=1772110268; x=1773319868;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+bHUuAER92Tsip7zTRWFiisJjUOVcMbGe3/y1j/Chf8=;
  b=MB2JCuCQ88vjkI9hoYSfqmk2TgCrJCxMD7oJSc5kkOij2gA+azTw7RcG
   YqbgbZC6je8WEFO2ccdWKCKRPQca6R8jkhc1HCYVGECDDoz2KZevZFivO
   n8qrtkNFQ+ey8XqOa56AgbYFRiYAIMPrpFZYEDmqcx+qF+ng5POMiaUTi
   csnK7TxF3IhCod4xQJtcajXdWzKZ3B21tLPUlRNYMEzqQekaym+FTz/qs
   znn6xtxWtfB+1wzdQjSUVMGUxY4Lyab5tgWQqwvJxhXJxUUMpXT35hoH+
   Z2einBwjSY9R+sqNs0ORqXOiCoDKwFhPs08nRS0w9jcSfFp6WWBktn1i7
   w==;
X-CSE-ConnectionGUID: oYi6KIUZR3uOstWgXeoYSg==
X-CSE-MsgGUID: 3pepl36sTfqFsJ6UlQPfZw==
X-IPAS-Result: =?us-ascii?q?A0DBBwA0QaBp/4z/Ja1aglmCSA9xX0JJlksDoBkPAQEBD?=
 =?us-ascii?q?zcaBAEBhQcCjR8CJjcGDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4ThlyGWwIBAzIBGAEtECAxKysZgwIBgnMCAaZvgiyBAYMoAdx5AQsUA?=
 =?us-ascii?q?YE4hTyIGXSEeicbG4FyhH2ECoEGhXcEX4FDgQ6HfAaLDEiBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWYDNRIqFTI8Mh2BIz4XgQobBwWGCA+IdHhugRqCBAMLGA1IESw3FBsEP?=
 =?us-ascii?q?m4HjWk/gTh8PTcagT1JKgE4o0KCIaEOCiiDdIwelToaM6prLphYpFmEaIF+J?=
 =?us-ascii?q?oFZcBWDIglJGQ+OX8pGIjUCOgIHCwEBAwmRaoF9AQE?=
IronPort-Data: A9a23:8yLU5qB9js5D4xVW/3/iw5YqxClBgxIJ4kV8jS/XYbTApDkngjMGz
 WJJDzuBOK6LYmWkedonb4++8kMC7cfUzIRnOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jWmthh
 fuo+5eBYAX/hWYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TExMRvUmIXAL8ioftQGn1x+
 swVLwE2YUXW7w626OrTpuhEnM8vKozveYgYoHwllWqfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY3BPjDS0Un1lM/CJ8ihO60rnL+aDZf7lmSoMLb5kCNk1EriuS9a4G9ltqiHt1YhkLD+
 Hn68X3XGTNECdim8TS37Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTWValrP2Rjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWspBUQXZ9UVuY98gzIkvGS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:iMjQf6P//xrJ6MBcTsajsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH5ZmpM
 Rdm2wUMqyIMbC85vyKhjWFLw==
X-Talos-CUID: =?us-ascii?q?9a23=3AVIDz32kg/3Ym7JtGkqlCPh9P2SbXOXrszSnzAnK?=
 =?us-ascii?q?KMz10b6aJdlCg9aRVqMU7zg=3D=3D?=
X-Talos-MUID: 9a23:ZjhZ5Qu9O4zJLlvqos2n3ylvLMMzvb+SBlkjirdYhs29DSJCJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,312,1763424000"; 
   d="scan'208";a="675224833"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Feb 2026 12:51:07 +0000
Received: from sjc-ads-4197.cisco.com (sjc-ads-4197.cisco.com [171.70.54.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 69A011800058C;
	Thu, 26 Feb 2026 12:51:07 +0000 (GMT)
Received: by sjc-ads-4197.cisco.com (Postfix, from userid 1847788)
	id F06B2CC1283; Thu, 26 Feb 2026 04:51:06 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [oe] [meta-oe] [PATCH v1] open-vm-tools: Add entry to CVE_PRODUCT to support the product name
Date: Thu, 26 Feb 2026 04:51:03 -0800
Message-Id: <20260226125105.47526-2-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260226125105.47526-1-hetpat@cisco.com>
References: <20260226125105.47526-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.54.218, sjc-ads-4197.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 12:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124676

From: Het Patel <hetpat@cisco.com>

- Added 'vmware:open_vm_tools' to CVE_PRODUCT to align with the NVD
CPE and ensure accurate CVE reporting.

Signed-off-by: Het Patel <hetpat@cisco.com>
---
 .../recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb
index 80dc3529c0..4ec6d5aa86 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb
@@ -120,6 +120,6 @@ python() {
         raise bb.parse.SkipRecipe('Requires meta-filesystems to be present to provide fuse.')
 }
 
-CVE_PRODUCT = "open-vm-tools vmware:tools"
+CVE_PRODUCT = "open-vm-tools vmware:tools vmware:open_vm_tools"
 CVE_STATUS[CVE-2014-4199] = "fixed-version: No action required. The current version (12.3.5) is not affected by the CVE which affects version 10.0.3"
 CVE_STATUS[CVE-2014-4200] = "fixed-version: No action required. The current version (12.3.5) is not affected by the CVE which affects version 10.0.3"

