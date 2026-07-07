Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 363DDC43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 07:22:36 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.169289.1783408951351986538
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jul 2026 00:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=FyJtEYOO;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3034; q=dns/txt;
  s=iport01; t=1783408951; x=1784618551;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zwbPLx2+SxOapVPledshRyOD9kIRpGVGFQIb/hdoEVQ=;
  b=FyJtEYOOju/7KObLF8Ly+Ni99k7jtwntDAQ6shd3/NHPS5/e0x1XakdU
   nfil8NGMnySOHF0EI4qtz+omsNl+YmUER3jtuxyq8ME6730Cs1XH9kPOq
   38+4YZqXY4J2IECxHfp+46j9kwhk4m8j8vdqib083GuTCyb7c9zzpHmAZ
   OAIBINjGMNEJZxlG7ButH8UQNCzL5AH2XcGYVU1/7OxweqQmyMp5YUSFn
   PmZctS/M+4I1y81HKSOJRqcYPUpU70B+ltV8dkhcTgweg7nfetN5/48vf
   I05PwnmWQ+yHxNa5pMoZn5Ibd1w4nKy5SYrae8KxpvefN/28yQOenaTBx
   A==;
X-CSE-ConnectionGUID: 5mmkL7sHSEi6I5X0l2F+vA==
X-CSE-MsgGUID: sx2HNay6TA2ecSFlMmIXKA==
X-IPAS-Result: =?us-ascii?q?A0AmAACSqExq/4//Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ0X0JJA4xwhzeCIYtnkjeBfg8BAQEPRA0EAQGSVQImNAkOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaATgBGAFZAwECTwsjGQiDAgGCO?=
 =?us-ascii?q?gM2AxG4V4IsgQGDKAGBVNhJDYJWAQsUAYE4AYU+gnyFI1sYAYR8JxsbgXKBF?=
 =?us-ascii?q?YNpgQWBGkICgSeGfgSCIoEMgVqPWkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBDBsHBYEdgWuBAoR5Ix8DOX+BMHVKeS2BAxIeCoFSgVEDCxgNSBEsN?=
 =?us-ascii?q?xQbBD5uB40NFw+CPYEOASuCLKVzoCFxCiiDdYwhjz6FfBozhASUF5JRC5h9j?=
 =?us-ascii?q?gqECZJHhGiBaDyBWXAVgyIJShkPjioOC4Ngzgo8NQIJAy8BAQcCBw4DC4Fok?=
 =?us-ascii?q?ACBfQEB?=
IronPort-Data: A9a23:/o9rQqidggl2lGx1Ytn51RJ7X161MBEKZh0ujC45NGQN5FlHY01je
 htvW2mAPPreYTDxeI8iO9ng90oOupbcmN5nGVY//C4wRX5jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMtPrc8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVF/+N0JT5V1
 cc1KW4sMyDbg7iYg6ySH7wEasQLdKEHPasFsX1miDWcBvE8TNWbHePB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgx/5JEWxI9EglHzfjBCoU6VooI84nPYy0p6172F3N/9J4TXGpgPwBjAz
 o7A13/pWDE8Pc3B9RPf/3mXqOvqmALLe6tHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YfLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:1Qs/aKsaMvEuY2Qs/Cz0fuf+7skDRtV00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBED/exLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPIdurJBLK8gceVbSC09QYIcT1X
X-Talos-CUID: 9a23:8bEiC2H/v+nyhE3DqmI68UsXPp8+UkbwzSnxfn/gDTxHC6O8HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AuspDRQy02lFPs0+e2uRvwWxi4I2aqL++UmArmIR?=
 =?us-ascii?q?Yh+DeOCdLFTO4iRWHYaZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,153,1779148800"; 
   d="scan'208";a="505752660"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Jul 2026 07:22:30 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 28C9918000397
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jul 2026 07:22:30 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 41954CC037D; Tue,  7 Jul 2026 12:52:28 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][scarthgap][PATCH] lldpd: Fix CVE-2026-46433
Date: Tue,  7 Jul 2026 12:52:26 +0530
Message-Id: <20260707072226.2852089-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jul 2026 07:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128056

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream 1.0.22 backport for
CVE-2026-46433. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/lldpd/lldpd/commit/ca931be63a9cae0fcd8e9b6ae4e916d49f141cd6
[2] https://github.com/lldpd/lldpd/security/advisories/GHSA-2g8p-2h3j-63m3

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../lldpd/files/CVE-2026-46433.patch          | 36 +++++++++++++++++++
 .../recipes-daemons/lldpd/lldpd_1.0.18.bb     |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/lldpd/files/CVE-2026-46433.patch

diff --git a/meta-networking/recipes-daemons/lldpd/files/CVE-2026-46433.patch b/meta-networking/recipes-daemons/lldpd/files/CVE-2026-46433.patch
new file mode 100644
index 0000000000..d673fd4389
--- /dev/null
+++ b/meta-networking/recipes-daemons/lldpd/files/CVE-2026-46433.patch
@@ -0,0 +1,36 @@
+From bec94ccae65fd40ec6cc417f395cb250dc6bdc1a Mon Sep 17 00:00:00 2001
+From: TristanInSec <tristan.mtn@gmail.com>
+Date: Tue, 12 May 2026 06:01:57 -0400
+Subject: [PATCH] Fix heap OOB read in VLAN decapsulation memmove
+
+In lldpd_decode(), the VLAN decapsulation memmove shifts frame data
+4 bytes left starting at offset 2*ETHER_ADDR_LEN.  The source pointer
+is correctly offset by +4, but the length argument uses the full
+remaining frame length (s - 2*ETHER_ADDR_LEN) instead of accounting
+for the 4-byte shift (s - 2*ETHER_ADDR_LEN - 4).
+
+When the received frame fills the hardware MTU allocation exactly,
+the memmove reads 4 bytes past the end of the heap buffer.
+
+CVE: CVE-2026-46433
+Upstream-Status: Backport [https://github.com/lldpd/lldpd/commit/ca931be63a9cae0fcd8e9b6ae4e916d49f141cd6]
+
+(cherry picked from commit ca931be63a9cae0fcd8e9b6ae4e916d49f141cd6)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ src/daemon/lldpd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/daemon/lldpd.c b/src/daemon/lldpd.c
+index 4859fb8..d6249bb 100644
+--- a/src/daemon/lldpd.c
++++ b/src/daemon/lldpd.c
+@@ -572,7 +572,7 @@ lldpd_decode(struct lldpd *cfg, char *frame, int s, struct lldpd_hardware *hardw
+ 		/* VLAN decapsulation means to shift 4 bytes left the frame from
+ 		 * offset 2*ETHER_ADDR_LEN */
+ 		memmove(frame + 2 * ETHER_ADDR_LEN, frame + 2 * ETHER_ADDR_LEN + 4,
+-		    s - 2 * ETHER_ADDR_LEN);
++		    s - 2 * ETHER_ADDR_LEN - 4);
+ 		s -= 4;
+ 	}
+ 
diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.18.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.18.bb
index a1bf4640b2..9b516237b5 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.18.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.18.bb
@@ -10,6 +10,7 @@ SRC_URI = "\
     file://lldpd.init.d \
     file://lldpd.default \
     file://run-ptest \
+    file://CVE-2026-46433.patch \
     "
 
 SRC_URI[sha256sum] = "4b320675d608901a4a0d4feff8f96bb846d4913d914b0cf75b7d0ae80490f2f7"
-- 
2.35.6


