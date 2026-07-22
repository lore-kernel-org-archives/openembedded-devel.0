Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F51C4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 09:49:17 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44269.1784713745033125227
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 02:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Io5wj/Mj;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3878; q=dns/txt;
  s=iport01; t=1784713745; x=1785923345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=20PpenZ2mpAFYcHBHmeQPNCW203RFAC+C8yF53TMRYg=;
  b=Io5wj/MjxNkpxVfzL4TqhbLDoHO8l9sVihtetRcPdAN1LrcruBEaDS7u
   O1Bf+aCzPeHpjk7gfjHl7sYKq2eCuWEqvusKHo0Tzt0QFQuWVu1ZkOkS8
   u60lhLZPn+Z0MLN3F9GYJEqPYueBoergz/gxuZ1b/14jK0q3/eKseJtry
   nLDa272WCLVR14KL2/NkGDxe9VTyTKC2QbcBh9ANBTC/tFLrXO7ji3j75
   ZpdNNXyUOpgeIeTn0DfDiOsnNrCxHuavF2FJgGD6crD1eMnpYnZy5EBcm
   M92I7unTftxyDmQd3Mj7ETXEi6D1+lZumy6XivA7jbTStPDZ21Tj2KGTS
   Q==;
X-CSE-ConnectionGUID: bPpuYt6/R4KV5VVDo75rJg==
X-CSE-MsgGUID: ZB1Rw57zQ+aumzOKUN1aIQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgC8kGBq/5H/Ja1aHgEBCxIMggULgld0XkNJA5ZHA?=
 =?us-ascii?q?4tkkjeBfg8BAQEPRA0EAQGFBQKNVwImNAkOAQIEAwIDAQEBAQEBAQEBAQELA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDYZaAQIBAycLAT0JEBwDAQIvIAsjCBmDAgGCOgM3A?=
 =?us-ascii?q?xHBBoF5M4EBg2gCQ1DYSQ2CWAELFAEFgTOFP4J9hSNcGAGEfCcbG4FyhH6BB?=
 =?us-ascii?q?YEaQgQYgQ2GfgSCIoEMgVoekCJIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQwbBwWBHYEugQKEbiMfAzl/gS91SnctaQESF4EmghSBOgKBAwMLGA1IE?=
 =?us-ascii?q?Sw3FBkEPm4HjWkjgU0mTAEBgQ0BKgGBRSdAERGjM4IhoB5xCiiDdYwhjz6Ff?=
 =?us-ascii?q?BozhASUF5JRC5h9jgqECZErT02EaYFoPIFZcBWDIglKGQ+OKg4LiHOCZsYmJ?=
 =?us-ascii?q?zILAy8BAQcCBw4DC4FokAACJgeBTwEB?=
IronPort-Data: A9a23:a2IWOKqPIcjgHMfOhnaAbjzDRGdeBmJIZBIvgKrLsJaIsI4StFCzt
 garIBnVb6rcZzOgLYx+PoXi9xgGvJHczdFqHVRspXgxRikW8OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8kk35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0uxPGXx/6
 aJfEmwuUE29uc6xn++haOY506zPLOGzVG8ekmtrwTecCbMtRorOBv2ao9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LVfrSn8/w7pX7WzFbpVacpLs+y2PS1wd2lrPqNbI5f/TXHJ4FzhrD+
 z+uE2LRMDtDDsPClii8sXuxg/3ovh7dAYszLejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aJ
 0EK9y4Gqakp6FftScHwWRC9qnOIshMQHd1KHIUHBBql0KHY5UOdQ2MDVDMEMIxgv84tTjts3
 ViM9z/0OQFSXHSuYSr13t+pQfmaYED58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:AzPGra7szX7Ru5a6GQPXwBDXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPI
 5bAs5D4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGthdB8MTMHfhLqWwLzM2faYEKA
 ==
X-Talos-CUID: 9a23:rGkBX27+fe7h0H68Xtss/nYMB/E5LDrnkFTufnGGJWE2Fae3RgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AOFPHnA5cMs/QyzcNtkw1qtUsxoxayf2UFx1Sg6x?=
 =?us-ascii?q?FstSBJwtTBhHEhRWOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,178,1779148800"; 
   d="scan'208";a="513884355"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Jul 2026 09:49:04 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 0728418000475;
	Wed, 22 Jul 2026 09:49:04 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id A0DFACAB20D; Wed, 22 Jul 2026 02:49:03 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-networking][scarthgap][PATCH 2/2] dnsmasq: Fix CVE-2026-12969
Date: Wed, 22 Jul 2026 02:49:00 -0700
Message-Id: <20260722094900.1399727-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260722094900.1399727-1-dkelaiya@cisco.com>
References: <20260722094900.1399727-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 09:49:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128365

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix for CVE-2026-12969 as referenced
in [2], using the upstream commit identified in [1].

[1] https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=14094e88beca519c53151184cc4553656672b54f
[2] https://security-tracker.debian.org/tracker/CVE-2026-12969

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.90.bb   |  1 +
 .../dnsmasq/files/CVE-2026-12969.patch        | 54 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-12969.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
index c25c25a447..f1e13af890 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://CVE-2026-5172.patch \
            file://CVE-2026-2291.patch \
            file://CVE-2026-12725.patch \
+           file://CVE-2026-12969.patch \
 "
 SRC_URI[sha256sum] = "8f6666b542403b5ee7ccce66ea73a4a51cf19dd49392aaccd37231a2c51b303b"
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-12969.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-12969.patch
new file mode 100644
index 0000000000..e1fb9b225c
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-12969.patch
@@ -0,0 +1,54 @@
+From bfac6db25b92b65d9d2f013534e7ebc265fec267 Mon Sep 17 00:00:00 2001
+From: do litli <dolitli02@gmail.com>
+Date: Sat, 9 May 2026 22:21:18 +0100
+Subject: [PATCH] Fix buffer OOB read in find_soa()
+
+In find_soa() extract_name() is called with extrabytes=0 when parsing NS
+record names, which means it only validates that the DNS name fits
+within the packet but does not check that 10 additional bytes exist for
+the type/class/TTL/rdlen fixed fields. Lines 546-549 then
+unconditionally read these 10 bytes via GETSHORT/GETLONG macros. An
+attacker controlling a DNS zone can craft a NXDOMAIN response where the
+NS record name extends to the packet boundary, causing a 10-byte
+out-of-bounds read past the valid packet data (CWE-125, CVSS 5.3
+Medium). The read stays within the over-allocated packet buffer in
+default configurations, limiting crash risk, but accesses data outside
+the logical packet boundary. Under certain conditions, the overread may
+access stale heap data from prior transactions.
+
+The fix is straightforward: change the extrabytes
+argument from 0 to 10, consistent with other call sites in
+the same file.
+
+Credit is due to do litli for finding this problem.
+
+CVE: CVE-2026-12969
+Upstream-Status: Backport [https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=14094e88beca519c53151184cc4553656672b54f]
+
+Backport Changes:
+- dnsmasq 2.90 predates the EXTR_NAME_EXTRACT constant and uses the
+  boolean isExtract argument. Retain 1 for this argument and backport
+  only the security-relevant extrabytes change from 0 to 10.
+
+(cherry picked from commit 14094e88beca519c53151184cc4553656672b54f)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/rfc1035.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/rfc1035.c b/src/rfc1035.c
+index 32dc571..8b00eb2 100644
+--- a/src/rfc1035.c
++++ b/src/rfc1035.c
+@@ -480,7 +480,7 @@ static int find_soa(struct dns_header *header, size_t qlen, char *name, int *sub
+   
+   for (i = 0; i < ntohs(header->nscount); i++)
+     {
+-      if (!extract_name(header, qlen, &p, daemon->workspacename, 1, 0))
++      if (!extract_name(header, qlen, &p, daemon->workspacename, 1, 10))
+ 	return 0; /* bad packet */
+       
+       GETSHORT(qtype, p); 
+-- 
+2.44.4
+
-- 
2.35.6


