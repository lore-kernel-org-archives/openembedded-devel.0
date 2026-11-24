Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14697.1795513459803292266
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:44:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TQJubUjs;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1933; q=dns/txt;
  s=iport01; t=1795513460; x=1796723060;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rP1XUcXJH7hMy66ATKcPQoF4P0IwIoP4chhhExEZzEE=;
  b=TQJubUjsorxmywQmN8XSkaNaFqTFLiYN+5ylIQR5zJji3nXK64gsDege
   WJ+MQDs00Qsldo+U/wfsBhM2HSSNlQC/XsbG5zXfa4jAhvIP2fGjTgPpx
   Bi2h/RtRSD+dkqLamUgOqUqwvGoPefLi/XqMSLr7fP/8LThaAm78oeG2d
   EmwJdynx5vRunjeryJ80ZEFVYI+ceM8OlOBCGMxUKolW27Lur+BFHwHUu
   UnpkRroFG7gV1IAgc8s9uXsJ84MoebqJyFqriKH5mCPxv6G8S5+C+zyp7
   r/wQNxPEsyRN6PPfGE1IANeBRaBgIDdav15y+BEad4nFtGYyJzOf6lfau
   A==;
X-CSE-ConnectionGUID: nZH1olSDRwas6ig4JYmZtQ==
X-CSE-MsgGUID: kpZcHKh5TySa5kpSCBu3iQ==
X-IPAS-Result: =?us-ascii?q?A0BCAgC4WQVr/8xK/pBaglmCV3VgQ0kDlCeCIZ4sgX4PA?=
 =?us-ascii?q?QEBDzQdBAEBhD+OagImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QSwEYAV1cHQEmgwIBgnQDEQa6YIIsgQGDKQExBQkCQ1DbMwELF?=
 =?us-ascii?q?AGBOIVCiCR1AYR9JxsbgXKBFYNqgQWBUAwCAoIrhXkEX4FDgQyCVowVihpIg?=
 =?us-ascii?q?R4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBHIEegRKBA12BKyheI?=
 =?us-ascii?q?YEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaB?=
 =?us-ascii?q?WEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGFiELGxgNSBEsNxUZBD5uB?=
 =?us-ascii?q?5N7GYIefD1RLASBDXMBJxGTbJF4oREKKIN5jCSVOhozhASmbguYfYJZizGVe?=
 =?us-ascii?q?FmEaoFoPIFGDAdwFTuCZwlKGQ+OOYNrzlsmMgIMBSsBBwIHDwKBc5F+AQE?=
IronPort-Data: A9a23:3WxLCK8kZV1qtBH6pyw7DrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 2cbWjrTaa6KNGahc9klbtjgp04HvpPVxodhHQZtrH1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rYuK8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazhPs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kwD61B/eJMLVtR/
 OdGKT9RTCGGtf6PlefTpulE3qzPLeHiMZlavjRryivUSK59B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6YP3WjOX9PYH46tOulmHD5aD1AgFmUvqEwpWPUyWSd1ZCzaIOLK4TUGK25mG6bv
 lDN30f5Xy0LD9XCyiK+2Vix3e72yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZHvd/7ESGzbDZpl7CQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSn1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:NODihK2ZPEYcWCJ+zSnEQQqjBIIkLtp133Aq2lEZdPUzSL37qy
 nAppomPHPP5Qr5O0tQ+uxoRpPgfZq0z/cciuMs1NyZMzUO1lHFEGgb1+vf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkWyF+xJK+qjhzEhu7t2uq0tQcQ==
X-Talos-CUID: 9a23:Rxz6x2+uQx7bjHP4ZvaVv0gmOpkidkbx9mjZOBG5BjpLebinVWbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AYRiYqw+598J298fuFsDfuriQf8Rw0a+OK0BQrYQ?=
 =?us-ascii?q?9spSHLRdbESrGjQ3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="60169065"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:44:16 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id A426F180006C5
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 09:44:16 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id 56894CCA798; Tue, 24 Nov 2026 01:44:15 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] open-vm-tools: Ignore CVE-2026-123894
Date: Tue, 24 Nov 2026 01:44:15 -0800
Message-Id: <20261124094415.1554442-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 09:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132943
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
 .../recipes-support/open-vm-tools/open-vm-tools_13.1.0.bb     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.1.0.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.1.0.bb
index 5739c05d726794c0178e6756a86109081e770a8d..49135d4f7e940812e55f4c3ec674f8353b9fa042 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.1.0.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.1.0.bb
@@ -124,3 +124,7 @@ python() {
 CVE_PRODUCT = "open-vm-tools vmware:tools vmware:open_vm_tools"
 CVE_STATUS[CVE-2014-4199] = "fixed-version: No action required. The current version (12.3.5) is not affected by the CVE which affects version 10.0.3"
 CVE_STATUS[CVE-2014-4200] = "fixed-version: No action required. The current version (12.3.5) is not affected by the CVE which affects version 10.0.3"
+
+# VMSA-2026-0009.1, section 3e: VMware Tools for Windows only.
+# https://support.broadcom.com/web/ecx/support-content-notification/-/external/content/SecurityAdvisories/0/39495
+CVE_STATUS[CVE-2026-123894] = "not-applicable-platform: Affects VMware Tools for Windows; this recipe builds Linux open-vm-tools."
