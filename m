Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98628C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 11:31:50 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7046.1783596700741279537
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2026 04:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Hc0/Qw50;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2482; q=dns/txt;
  s=iport01; t=1783596700; x=1784806300;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FSnpceM89I0UGXs+dYkoNQbLM3MGdca8kCRN3m6TESI=;
  b=Hc0/Qw50dRtDXEk6fj9Oyy5KnKuOFlxGd5JvPNtAWjjO/Tz/rlkUcjR8
   BHvTScReFMLxrNiYP+yG+16H5Wkgoy4eWor6Z6Jq19vNCyNf8XnbJKt+p
   UkttVLjDKTx10iXQvGNHW+KCbBD6GZ2mtxHLZZb1RbOI3tWaHHRYB0fbJ
   9X+Vkox7RjBjTbOF7g1ey1ukpMjgRwhoObBJPqLcEAQpXUfW94Q4WAoHG
   gHmhkxTtsgi0y1+6pqKK6PD0E5UluIM6di7bB9Z3uU9Jn+vlytOLnGfwV
   GL6maAOR9SZSQyRnbkqYA/j8vWxJHsoIycmg5Qv0e+t6UiEe4wIkiB/ik
   g==;
X-CSE-ConnectionGUID: GocVXY58S9aKXY4DA65FpA==
X-CSE-MsgGUID: QhpPJ9N/QcexBatYBXEwkw==
X-IPAS-Result: =?us-ascii?q?A0BCAgCThU9q/5T/Ja1aglmCV3RfQkmUKYIhnh6Bfg8BA?=
 =?us-ascii?q?QEPRA0EAQGSVAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4ZPDYZaAS0LAXIDAQJaIyGDAgGCcwIBEbkSgXkzgQGEfdsuAQsUAYE4hT+IH?=
 =?us-ascii?q?1sYAYR8JxsbgXKBFYNpgQWBXAKBJ4EGhXgEgiJ6EoFaHo9tSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2BW4EEhHkjHwM5f4EwdUp5LYEBE?=
 =?us-ascii?q?h4KgVKCFgI6AwsYDUgRLDcUGwQ+bgeNPxcPgj6BDgEqAYIspXahDwoog3WMI?=
 =?us-ascii?q?ZU6GjOFW6URC5h9jgqWUIRpgWg8gVlwFYMiCRY0GQ+OLQsLgy4yhRPJRyQ1C?=
 =?us-ascii?q?zIBAQcCBw4DC4FokACBfgEB?=
IronPort-Data: A9a23:Ed6BDKoMvjXpfqECcgm3W+1jXupeBmJIZBIvgKrLsJaIsI4StFCzt
 garIBnSO/2OZ2P2c4gjYIW0pkwD7MOBz4BkSQNopC89HnsXoOPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8EM35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0slwCl9+x
 KFIE2EETSCy286fnu+VUsA506zPLOGzVG8ekmtrwTecCbMtRorOBvyTo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LWPrSn8/w7pX7WzFVpUicuaowy2PS1wd2lrPqNbI5f/TXHZsFxBbC+
 DiuE2LROxECDP7O7328+X+8rObTrAnLdZ0RC+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aJ
 0EK9y4Gqakp6FftScHwWRC9qnOIshMQHd1KHIUHBBql0KHY5UOdQ2MDVDMEMYVgv84tTjts3
 ViM9z/0OQFSXHSuYSr13t+pQfmaYED58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:FDu09qGJYUn1XRQhpLqE2MeALOsnbusQ8zAXPidKOH5om6Oj+f
 xG8M536faWskdzZJhfo7G90cC7KBu2n6KdirN/AV7NZmXbUROTTL1K3M/F3yDqHTH4+6p20K
 dtdLU7NfjLZGIK6PoTJGKDYrEdKB7tytHNudvj
X-Talos-CUID: 9a23:dKZ0KG44WqWbknWVJtss20kfJPAULy3mnX7zE37kJU83FZONYArF
X-Talos-MUID: =?us-ascii?q?9a23=3A9V4Gzw6Wdt3oicsvtSv0BCbbxoxR47yWKhEr1qw?=
 =?us-ascii?q?NttmuPDBBEQewkzeoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="506828262"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Jul 2026 11:31:39 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id A57A81800017B
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Jul 2026 11:31:39 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 49655CC2EC3; Thu,  9 Jul 2026 04:31:39 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][wrynose][PATCH] nmap: Fix CVE-2026-58058
Date: Thu,  9 Jul 2026 04:31:17 -0700
Message-Id: <20260709113117.3740853-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2026 11:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128119

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream master backport for
CVE-2026-58058. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/nmap/nmap/commit/bb6754e76bb1686315008e1aa1c40202a513fb83
[2] https://github.com/advisories/GHSA-wxvj-hc4r-fq45

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta-oe/recipes-security/nmap/files/CVE-2026-58058.patch b/meta-oe/recipes-security/nmap/files/CVE-2026-58058.patch
new file mode 100644
index 0000000000..653caee7e3
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
diff --git a/meta-oe/recipes-security/nmap/nmap_7.95.bb b/meta-oe/recipes-security/nmap/nmap_7.95.bb
index 8841a8cd78..e2bd57b114 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.95.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.95.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
            file://0002-Fix-building-with-libc.patch \
            file://0003-Fix-off-by-one-overflow-in-the-IP-protocol-table.patch \
            file://0001-fix-racing-between-build-ncat-and-build-lua.patch \
+           file://CVE-2026-58058.patch \
            "
 SRC_URI[sha256sum] = "e14ab530e47b5afd88f1c8a2bac7f89cd8fe6b478e22d255c5b9bddb7a1c5778" 
 
-- 
2.35.6


