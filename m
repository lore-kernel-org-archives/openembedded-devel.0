Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9944DCD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 06:29:46 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7633.1778221780273266413
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2026 23:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=lIisHnpq;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1382; q=dns/txt;
  s=iport01; t=1778221780; x=1779431380;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=X/+2XgecgidkvaSZ4y5AE1QyAb1EvUvXwP9h70kQSyc=;
  b=lIisHnpquki59k5XkizQ+zL1HqpK8EA4yR4q6tlyBn7qsvjm66hPFm7O
   ECxqDgkcBc9J5TjRnqEgCFUoSaaVy7Uqh/bjeUjtiSD5zZmDVJUzmG1cV
   0APUKFJLT7lrQES9EV7VVqCQKGR17EvQ6dOTez6ezLk0FH/bsNaNsP6I0
   MFdZ6g3m21udLj3gAtITmaEe2ghEocDcQZShRc6dCZ+p6tpUGE+lfZu81
   999dMRO5nDveZ+e6vSjLhq8gL0h8HFPw9AyXObTfJrR89WshnVG3FMjRo
   8Efa3q2+5HKwaCuA1YKWeOj0BuyT4OYt+KXT0cjNWQI/qwJzqMHBUVjV8
   A==;
X-CSE-ConnectionGUID: VX6szavlQPWTlXNI5kFerg==
X-CSE-MsgGUID: tJV4IJwoQOaObCE1OCgCmw==
X-IPAS-Result: =?us-ascii?q?A0BkAgCUgv1p/43/Ja1aHgEBCxIMggULgldyXkNJk1oBg?=
 =?us-ascii?q?nCLZ5I2gX8PAQEBDzcaBAEBhQaNNAImNAkOAQIEAwIDAQEBAQEBAQEBAQELA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4Zchl02ARgBLTAmKwtEgwIBgjoDNgO1Z4IsgQGDKAHaG?=
 =?us-ascii?q?w2CUwELFAGBOIU/gnqFI4VuJxsbgXKEfYIfgWuBBoV3BF+BQ4EOjwhIgR4DW?=
 =?us-ascii?q?SwBVRMNCgsHBYFmAzUSKhUyPDIdgSM+F4EMGwcFgUuCOXJqgQKEYHgjLANOg?=
 =?us-ascii?q?QMDCxgNSBEsNxQbBD5uB4pHHQ+BNHw9NxqBPUkqATijQoIhoB1xCiiDdIwej?=
 =?us-ascii?q?z6FfBozqmsumFiSEpJHhGiBaDyBWXAVgyIJShkPjl/FXycyAjsCBwIHDQMLk?=
 =?us-ascii?q?WiBfQEB?=
IronPort-Data: A9a23:+YM9aKAmRdC3gxVW/3/iw5YqxClBgxIJ4kV8jS/XYbTApDgm1WQCn
 zcYD26DM/fbYGbzLd53bozkphwGvJ+Gz99jOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jWGthh
 fuo+5eBYAL9i2YtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE/cUwF1M/I4khwtlLBVFo1
 KEbBj0XYUXW7w626OrTpuhEnM8vKozveYgYoHwllW2fBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY2BPjDS0Un1lM/CJA3kOCurnL+aDZf7lmSoMLb5kCMkFQgiOOwbYa9ltqiWedrwme6u
 WX/2G3eCDo3bfu0xhGA7Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTWValrP2Rjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWspBUQXZ9UVuY98gzIkvaS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH7tV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:9F6nPKMqAgDp2sBcTvejsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxflZnOjf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkW2F+xJK+qjgzEhu7t2uqEtQcQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AJcNz/mom+ftb0sYGSjTWUQLmUf4VLGbPxWnUGne?=
 =?us-ascii?q?HNWJZbpzISnGd4qwxxg=3D=3D?=
X-Talos-MUID: 9a23:w6xnZgpp0Vs8CzM1Yj4ezy1ACptJwbupMWcEtp8tlpCjHiNbPijI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,223,1770595200"; 
   d="scan'208";a="740903554"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 08 May 2026 06:29:21 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id E114E18000184;
	Fri,  8 May 2026 06:29:20 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 8CD15CC1288; Thu,  7 May 2026 23:29:20 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [meta-networking] [scarthgap] [PATCH] open-vm-tools: Add entry to CVE_PRODUCT to support the product name
Date: Thu,  7 May 2026 23:29:14 -0700
Message-Id: <20260508062914.1959589-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2026 06:29:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126822

From: Het Patel <hetpat@cisco.com>

- Added 'vmware:open_vm_tools' to CVE_PRODUCT to align with the NVD
CPE and ensure accurate CVE reporting.

Signed-off-by: Het Patel <hetpat@cisco.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9b69587ecb92b3acb7b3092217357de9c1be14e6)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 .../recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb
index 1ef2781d6a..1bad8ea45b 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb
@@ -121,6 +121,6 @@ python() {
         raise bb.parse.SkipRecipe('Requires meta-filesystems to be present to provide fuse.')
 }
 
-CVE_PRODUCT = "open-vm-tools vmware:tools"
+CVE_PRODUCT = "open-vm-tools vmware:tools vmware:open_vm_tools"
 CVE_STATUS[CVE-2014-4199] = "fixed-version: No action required. The current version (12.3.5) is not affected by the CVE which affects version 10.0.3"
 CVE_STATUS[CVE-2014-4200] = "fixed-version: No action required. The current version (12.3.5) is not affected by the CVE which affects version 10.0.3"
-- 
2.35.6


