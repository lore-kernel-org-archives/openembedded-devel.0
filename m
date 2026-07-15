Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B66C44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 17:27:05 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81.1784136425372107178
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 10:27:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dNOdj6Gc;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2653; q=dns/txt;
  s=iport01; t=1784136425; x=1785346025;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iHmfrMqcbE2kGS25ZEWrsv8gyULvtK3XBrtAANiHXvI=;
  b=dNOdj6GcSHYC6kVFD3jTqZoxJ4IPBLRrkKBfoLu6r4vIE0DbwEEg5oIF
   SP+Ga+BULdyl2/kplDX3JQK1kr39so0othXYtgHZ/qxT7iPHkJzwEO9h0
   CqIRkVjvYX+1ObfL8zuQsP6mKivtpe/wdKd1Dm3gKeS/e7etc3o5LCKSL
   FeRMtxU2LnfTsLo28HPKUtyD+8NflldPCKNQ3+H4r+zf16zUXmPLpZfcu
   85FUHoi9qeskyJizbCl4sFZjtJiDVDrDsLPKXqqzDfsr9+eHg4ZSfXEVm
   pqjp3bGQ1haEsd2n2dWaHVjBwvnf7s33d5NuSvc+w4qkMtTMHw7tjPomF
   A==;
X-CSE-ConnectionGUID: +MGb74iAS/CdUzuOvKTkOA==
X-CSE-MsgGUID: ucBPQzk/Ru6+hwODO04keg==
X-IPAS-Result: =?us-ascii?q?A0BDAgBqwldq/5X/Ja1aglmCV3RfQkmUKYE1bJ4egX4PA?=
 =?us-ascii?q?QEBD0QNBAEBklgCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2GWgEtCwFyAwECWiMZCIMCAYJ0AxG9PIF5M4EBhH3bLgELFAGBOIU/i?=
 =?us-ascii?q?CBcGAGEfCcbG4FygRWDaYEFgVwCgSeBBoV4BIIigQyBWh6PeUiBHgNZLAFVE?=
 =?us-ascii?q?w0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgVCBAoR2Ix8DOX+BMHVKdy1qE?=
 =?us-ascii?q?heBUYIUgRoDCxgNSBEsNxQbBD5uB41KJYI/gQ4BKgGCLBGlYqESCiiDdYwhl?=
 =?us-ascii?q?ToaM4VbpRELmH2OCpZQhGmBaDyBWXAVgyIJFjQZD44tAQoLgy4yhRPJBTw1C?=
 =?us-ascii?q?zIBAQcCBw4DC4FokACBfgEB?=
IronPort-Data: A9a23:rWy/jKlBFyCbkCY62TptkcHo5gzRJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOX2uEPfzfMTH8edslPYri80IFvJbcyoNkQARp+yg9F1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpLsv/b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fc491ewoXWBnz
 rszJA0fczedpN6155vuH4GAhux7RCXqFJkUtnclyXTSCuwrBMmZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTaz/7C7pm9AusrnXyfidRtFKSjaE2+GPUigd21dABNfKIIo3WHZ8Mxx3wS
 mTu4m/TOigIN5ul1GTG8m2LqsiXwSD2V9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBF2QHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:ibM0B62r97jv7sVbwcUKzwqjBIIkLtp133Aq2lEZdPUzSL37qy
 nAppomPHPP5Qr5O0tQ+uxoRpPgfZq0z/cciuMs1NyZMzUO1lHFEGgb1+vf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkWyF+xJK+qjhzEhu7t2uq0tQcQ==
X-Talos-CUID: =?us-ascii?q?9a23=3Az6j7wmi/jyYDRmymFNidXP0rtTJuMVjyxiiMIma?=
 =?us-ascii?q?DTk1lda+IbkGzxKBDup87?=
X-Talos-MUID: 9a23:2cyGNgWNYyfTWlfq/CLnrglbJsQv2bnwS0AStrkh45WHOCMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,165,1779148800"; 
   d="scan'208";a="509402113"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jul 2026 17:27:02 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 833F31800026A
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 17:27:02 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id A3E13CC037D; Wed, 15 Jul 2026 22:57:00 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][scarthgap][PATCH] nmap: fix CVE-2026-58058
Date: Wed, 15 Jul 2026 22:56:53 +0530
Message-Id: <20260715172653.1153703-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 17:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128225

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream master backport for
CVE-2026-58058. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/nmap/nmap/commit/bb6754e76bb1686315008e1aa1c40202a513fb83
[2] https://github.com/advisories/GHSA-wxvj-hc4r-fq45

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../nmap/files/CVE-2026-58058.patch           | 33 +++++++++++++++++++
 meta-oe/recipes-security/nmap/nmap_7.80.bb    |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-security/nmap/files/CVE-2026-58058.patch

diff --git a/meta-oe/recipes-security/nmap/files/CVE-2026-58058.patch b/meta-oe/recipes-security/nmap/files/CVE-2026-58058.patch
new file mode 100644
index 000000000..653caee7e
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/files/CVE-2026-58058.patch
@@ -0,0 +1,33 @@
+From ad19a059ec459552d9c4ba2ffa40e0cb2e7034bb Mon Sep 17 00:00:00 2001
+From: dmiller <dmiller@e0a8ed71-7df4-0310-8962-fdc924857419>
+Date: Thu, 25 Jun 2026 21:58:49 +0000
+Subject: [PATCH] Fix extension header parsing. Credit: Himanshu Anand
+
+CVE: CVE-2026-58058
+Upstream-Status: Backport [https://github.com/nmap/nmap/commit/bb6754e76bb1686315008e1aa1c40202a513fb83]
+
+(cherry picked from commit bb6754e76bb1686315008e1aa1c40202a513fb83)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ libnetutil/netutil.cc | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/libnetutil/netutil.cc b/libnetutil/netutil.cc
+index e11b3f103..4d26f3c41 100644
+--- a/libnetutil/netutil.cc
++++ b/libnetutil/netutil.cc
+@@ -687,11 +687,13 @@ static const void *ipv6_get_data_primitive(const struct ip6_hdr *ip6,
+   *nxt = ip6->ip6_nxt;
+   p += sizeof(*ip6);
+   while (p < end && ipv6_is_extension_header(*nxt)) {
+-    if (p + 2 > end)
++    if (p + 8 > end)
+       return NULL;
+     *nxt = *p;
+     p += (*(p + 1) + 1) * 8;
+   }
++  if (p >= end)
++    return NULL;
+ 
+   *len = end - p;
+   if (upperlayer_only && !ipv6_is_upperlayer(*nxt))
diff --git a/meta-oe/recipes-security/nmap/nmap_7.80.bb b/meta-oe/recipes-security/nmap/nmap_7.80.bb
index 18b1a5024..afae38fb7 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.80.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.80.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
            file://0001-Make-ndiff-support-python3.patch \
            file://0001-configure.ac-make-ndiff-depend-on-python3.patch \
            file://nmap-rename-enum-PCAP_SOCKET.patch \
+           file://CVE-2026-58058.patch \
            "
 
 SRC_URI[md5sum] = "d37b75b06d1d40f27b76d60db420a1f5"
-- 
2.35.6


