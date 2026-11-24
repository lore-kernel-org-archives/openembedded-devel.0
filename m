Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14697.1795513459803292266
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:44:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LE3KsmQ0;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1938; q=dns/txt;
  s=iport01; t=1795513459; x=1796723059;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LfK/IK9oGlAFgWxYidHqEyZWJ26TlqXsT0AtLy5a9fY=;
  b=LE3KsmQ0Dv0+MtRIj8VBIfPp+j4+mVsMwurDReTc25dleuS4qv3UD4+y
   fObfd2E8TL4nTls4Dq0ST0YjgzPI5NvS/hrZ22TXe86XvuO9dlkAISMpI
   qUMCA/m8vm19P8xSZivZ2rD9a3eJQu7DFJKaYwMb76s8uE0G1qqdvZJ6U
   5GOI8hf/j4WHn7n4kV21fNKUAeSnxY1dziFf6vHx+bWpTP+RGZD/msUVY
   no/6PMXd4a98uf6KlN98+q+UuflxF8JL+JzA3LUvazjuuaFx4UARcZdg1
   0GFn6ll/JiiEz2a/by290zuTo4QjLrcCng45CJ34kmQP5hQ1daUq3NqvV
   g==;
X-CSE-ConnectionGUID: JGVsmuerTBaP6CHh1c7Lng==
X-CSE-MsgGUID: w7gAvM/TSXO+dXJpyocvzw==
X-IPAS-Result: =?us-ascii?q?A0BCAgC4WQVr/9RK/pBaglmCV3VgQ0kDlCeCIZ4sgX4PA?=
 =?us-ascii?q?QEBDzQdBAEBhD+OagImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QSwEYAV1cHQEmgwIBgnQDEQa6YIIsgQGDKQExBQkCQ1DbMwELF?=
 =?us-ascii?q?AGBOIVCiCR1AYR9JxsbgXKBFYNqgQWBUAwCAoIrhXkEX4FDgQyCVowVihpIg?=
 =?us-ascii?q?R4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBHIEegRKBA12BKyheI?=
 =?us-ascii?q?YEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaB?=
 =?us-ascii?q?WEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGFiELGxgNSBEsNxUZBD5uB?=
 =?us-ascii?q?5N7GYIefD1RLASBDXMBJxGTbJF4oREKKIN5jCSVOhozhASmbguYfYJZizGVe?=
 =?us-ascii?q?FmEaoFoPIFGDAdwFTuCZwlKGQ+OOYNrzlsmMgIMBSoBAQcCBw4DC4FokX4BA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:q/Tg8ayADPafi0PPLTB6t+dgxyrEfRIJ4+MujC+fZmUNrF6WrkVVy
 jMXDWyPbPiKYjT9eNkgao6zoRsG6J+HzYBiTQs9rFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH9aOWJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaDlMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGMZA5Yd5+ttPUtHz
 aIzCDBUZU+nge3jldpXSsE07igiBMDmJsYb/3pn1zycVK9gSpHYSKKM7thdtNsyrpkSQbCEO
 pZfNmYpNk2aC/FMEg9/5JYWkOq2j3/kcyVwo1OOrq1x6G/WpOB0+Oa1aYSEIoLSLSlTtlnHq
 UvY2iPFOSE9d9Cv6yKU9XmylPCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRul/fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:vxOCZaDGSxSWdSHlHemc55DYdb4zR+YMi2TDsHoBKyC9Hfb3qy
 nDppkmPHzP+VUssQ8b+OxoUZPoKRi3yXcf2+Ys1NmZMDUOwFHJEKhSqa3/3jbnByryssRZ1a
 tmbuxCLeeYNykesS4/izPIdOrJB7K8gcSVuds=
X-Talos-CUID: 9a23:RF1oD2wPP0tj9qlmgZ5LBgU2Nf4+d2DQ1kv6KnfmIkZpEbbKbVmfrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3ACj+rOQ4rGlEog3yX6KM82T1lxox3vKuHFmVKra4?=
 =?us-ascii?q?2nIqIBQ5oKjCWkiaoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="60169060"
Received: from aer-l-core-11.cisco.com ([144.254.74.212])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:44:16 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-11.cisco.com (Postfix) with ESMTPS id D5CCC180001FD
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 09:44:15 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id 88FB8CC2EFA; Tue, 24 Nov 2026 01:44:14 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][blacksail][PATCH] open-vm-tools: Ignore CVE-2026-123894
Date: Tue, 24 Nov 2026 01:44:14 -0800
Message-Id: <20261124094414.1554373-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 09:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132942
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
index 088494c91bea155f6d91cc2106b3db328e32a8ee..f0e808fa3a00c565971c5240da1c2f3520c19f2b 100644
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
