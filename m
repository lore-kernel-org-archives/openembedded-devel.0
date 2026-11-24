Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14457.1795513457942173337
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:44:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=SavnbQK2;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1938; q=dns/txt;
  s=iport01; t=1795513458; x=1796723058;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vno3PrQoFZZHIXv0GJKIv61p1/xTH0ZsURVlScsVDCI=;
  b=SavnbQK2Njprn3jbqXTwj4pAmda4JHZIUKrtFJwWk+SUirYjmUE19RW2
   fyLDUr65CNrFrnjEyL4K605HHQTH+C/U87MwN3TuRRZzIwQvCdgn1mnmP
   EnNkEtOp86wdZnV3YZltJut5/+EnNOt52RSAtDe+YGqpzIQuc2IiCaGSM
   ZJSvkSYvzN0z0sDHSx45ad5YqsyjtMlM+v1g/Tkmsltp8I9vx4Vzb6pqk
   WAF8gzAE4DQLrdpI5nzd4UTOkxr/RvFU4bdac8PAskFptHPbk6gAB2pEP
   sX+bTHPwajbf12YBnYsv0S5PHjpoUyLVd+O19vMoAvyaP+AwLUXmnmrWS
   g==;
X-CSE-ConnectionGUID: yxUTAo2oQHmDv1+Stsc/zw==
X-CSE-MsgGUID: sBVUOuZ6RfefJiWEz3fW7A==
X-IPAS-Result: =?us-ascii?q?A0BCAgC4WQVr/89K/pBaglmCV3VgQ0kDlCeCIZ4sgX4PA?=
 =?us-ascii?q?QEBDzQdBAEBhD+OagImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QSwEYAV1cHQEmgwIBgnQDEQa6YIIsgQGDKQExBQkCQ1DbMwELF?=
 =?us-ascii?q?AGBOIVCiCR1AYR9JxsbgXKBFYNqgQWBUAwCAoIrhXkEX4FDgQyCVowVihpIg?=
 =?us-ascii?q?R4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBHIEegRKBA12BKyheI?=
 =?us-ascii?q?YEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaB?=
 =?us-ascii?q?WEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGFiELGxgNSBEsNxUZBD5uB?=
 =?us-ascii?q?5N7GYIefD1RLASBDXMBJxGTbJF4oREKKIN5jCSVOhozhASmbguYfYJZizGVe?=
 =?us-ascii?q?FmEaoFoPIFGDAdwFTuCZwlKGQ+OOYNrzlsmMgIMBSoBAQcCBw4DC4FokX4BA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:PD+YVK9QBm+XOz7IapfRDrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 mYXWW/Ua6uPZWL9L94lao22p0kCvpHVzIJhG1dq+SlEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rYuK8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazhPs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2knLbAk0+EtBlhu8
 NAGcXM2cguIwPCplefTpulE3qzPLeHiMZlavjRryivUSK54B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6YPHWjOX9PYH46tOulmHD5aD1AgFmUvqEwpWPUyWSd1ZCzaoWEIYfbHK25mG6Dj
 Fz72HnLXCsUOdK9yAWo4CmiubDmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZHvd/7ESGzbDZpl7HQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:Do/gEqsFpTepqRb5ZLLDIVvn7skDRtV00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBED/exLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPIdurJBLK8gceVbSC09QYIcT1X
X-Talos-CUID: 9a23:HTI/P26KAH/Qt18AQNss5V4pJukiKHrk7HL8PRb7MnpyQ/qHVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AkQ2pKQwqb4uW58FhjwlqAsX7CiaaqL+ENn0qjKd?=
 =?us-ascii?q?YgceJOw5xBBqP1zqIHaZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="62793391"
Received: from aer-l-core-06.cisco.com ([144.254.74.207])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:44:16 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-06.cisco.com (Postfix) with ESMTPS id C4CC31800048C
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 09:44:15 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id 725C6CC2EF3; Tue, 24 Nov 2026 01:44:14 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][wrynose][PATCH] open-vm-tools: Ignore CVE-2026-123894
Date: Tue, 24 Nov 2026 01:44:14 -0800
Message-Id: <20261124094414.1554322-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 09:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132941
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

Analysis:
- The SAML token signature bypass affects VMware Tools for
  Windows. Exploitation requires Guest Alias mapping. [1]
- The vendor FAQ does not list other guest operating systems as
  affected. [2]
- This recipe builds Linux open-vm-tools and disables VGAuth.
- Hence ignoring the CVE for now.

Reference:
[1] https://support.broadcom.com/web/ecx/support-content-notification/-/external/content/SecurityAdvisories/0/39495
[2] https://github.com/vmware/vcf-security-and-compliance-guidelines/blob/main/security-advisories/vmsa-2026-0009/README.md#13-do-i-have-to-update-vmware-tools

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb
index a48d1ce88d29277a3ffe990584432c75d7d58a29..ead116bbb160697c5fdf315591dec3b58b30e632 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb
@@ -124,3 +124,7 @@ python() {
 CVE_PRODUCT = "open-vm-tools vmware:tools vmware:open_vm_tools"
 CVE_STATUS[CVE-2014-4199] = "fixed-version: No action required. The current version (12.3.5) is not affected by the CVE which affects version 10.0.3"
 CVE_STATUS[CVE-2014-4200] = "fixed-version: No action required. The current version (12.3.5) is not affected by the CVE which affects version 10.0.3"
+
+# VMSA-2026-0009.1, section 3e: VMware Tools for Windows only.
+# https://support.broadcom.com/web/ecx/support-content-notification/-/external/content/SecurityAdvisories/0/39495
+CVE_STATUS[CVE-2026-123894] = "not-applicable-platform: Affects VMware Tools for Windows; this recipe builds Linux open-vm-tools."
