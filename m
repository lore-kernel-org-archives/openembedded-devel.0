Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BDCCD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 04:06:25 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6165.1778213179604732397
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2026 21:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bzx0GMpR;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1740; q=dns/txt;
  s=iport01; t=1778213179; x=1779422779;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gpkiwZz+hs26/Hw5jpgSe81I3unIlHJQLzWgoz2qB9w=;
  b=bzx0GMpRs+laL3FgAup/TG8kGdPRCPnW9Q4dQa1Fw+Pv7ZjDmlvIINxy
   JKpCktT+bh/FuCK1VzvIS307ZpS86yBQMWEJ5S8tC0Ulxzp7BAgGjQiRI
   DCuAE6mbthvhXQTsw010aNKnt6Jc0DH90aMXlvGHRysGmMdSwCtLgnoch
   hPQI0u3NkqWPQceWANiQEZmNS5+a58E5bJQVOOiDL5MdTnBGURzQTtpTq
   kmbglkW2L9RnS6VZ176AZ5h03wXyT4dMzmuYCJy7H5UR0fOLO7/BL/mqN
   23vg8AqzIbJlCYspLRL748blnfRcdVJFn/a2ZztbnE+84QWKxHB3DfY4H
   Q==;
X-CSE-ConnectionGUID: ejsglRB8QyiuU2ZraHpg5g==
X-CSE-MsgGUID: J4Tl7e4cR0SqThFGenv43Q==
X-IPAS-Result: =?us-ascii?q?A0BvAgC4YP1p/43/Ja1aglmCV3JeQ0mTWgGOV5I2gX8PA?=
 =?us-ascii?q?QEBDzcaBAEBgXGDFY00AiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4ThlyGXTYBGAEtMFELRIMCAYI6AzYDtgOCLIEBgygBgVTYSA2CUwELF?=
 =?us-ascii?q?AGBOIU/gnqFI3SEeicbG4FyhH2CH4JxhXcEgiKBDoF+jQpIgR4DWSwBVRMNC?=
 =?us-ascii?q?gsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBS4I5cmqBAoRgeCMsA06BAwMLGA1IE?=
 =?us-ascii?q?Sw3FBsEPm4HikcdD4IwgQ6WQZILoB1xCiiDdIwejz6FfBozqmsumFiSEpJHh?=
 =?us-ascii?q?GiBaDyBWXAVgyIJShkP1D4nMgI7AgcCBw0DC5NlAQE?=
IronPort-Data: A9a23:7dclQqrE4ahgLfECYZS1/l7P9hZeBmJOZBIvgKrLsJaIsI4StFCzt
 garIBnVOvnba2Okf48iPN/i8B4HsMXTxoUxHVY/pSFmES0VpOPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgTNNwJcaDpOtfre8Ew35pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0ut1Gm5Kz
 9ZIESEMcy3Ztfi/4Kq0F+Y506zPLOGzVG8ekmtrwTecCbMtRorOBv2Wo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LUfrSn8/w7pX7Wz1aoV6So4I84nPYy0p6172F3N/9JYfUFZUIwhnDz
 o7A10alPhVFOYCU82K+606sqMDCmz2nA7tHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YdLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:2Y8E+auEItJoEXFDLnwKf0I27skDQNV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3lJxBQYzlvhFQpcYAUdAG0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3AB+3aHmoHQ+++fznvq2sP0X7mUc0naXLZ9l2AGl6?=
 =?us-ascii?q?5FFszeqecaUefpawxxg=3D=3D?=
X-Talos-MUID: 9a23:5RCBGwR+HT40DibdRXTO2A1ma8o06J72M1kxkbspts+aaXdJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,222,1770595200"; 
   d="scan'208";a="736885473"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 08 May 2026 04:06:18 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 9FDAD180001A0;
	Fri,  8 May 2026 04:06:18 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 43DFECC1288; Thu,  7 May 2026 21:06:18 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [meta-python] [scarthgap] [PATCH] python3-ecdsa: set CVE_PRODUCT
Date: Thu,  7 May 2026 21:06:11 -0700
Message-Id: <20260508040611.1763324-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2026 04:06:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126819

From: Gyorgy Sarvari <skandigraun@gmail.com>

Set the correct CVE_PRODUCT value, the default python: ecdsa doesn't
match relevant entries.

The correct values were taken from the CVE db, by checking which CVEs
are relevant.

See CVE db query:
sqlite> select * from products where product like '%ecdsa%';
CVE-2019-14853|python-ecdsa_project|python-ecdsa|||0.13.3|<
CVE-2019-14859|python-ecdsa_project|python-ecdsa|||0.13.3|<
CVE-2020-12607|antonkueltz|fastecdsa|||2.1.2|<
CVE-2021-43568|starkbank|elixir_ecdsa|1.0.0|=||
CVE-2021-43569|starkbank|ecdsa-dotnet|1.3.2|=||
CVE-2021-43570|starkbank|ecdsa-java|1.0.0|=||
CVE-2021-43571|starkbank|ecdsa-node|1.1.2|=||
CVE-2021-43572|starkbank|ecdsa-python|||2.0.1|<
CVE-2022-24884|ecdsautils_project|ecdsautils|||0.4.1|<
CVE-2024-21502|antonkueltz|fastecdsa|||2.3.2|<
CVE-2024-23342|tlsfuzzer|ecdsa|||0.18.0|<=

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7f962ef1557a291545646470c03fd9c4a23eb7d9)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb
index 0ae93fe3d9..1ec81d26f9 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb
@@ -13,6 +13,8 @@ SRC_URI += " \
 	file://CVE-2026-33936.patch \
 "
 
+CVE_PRODUCT = "python-ecdsa_project:python-ecdsa tlsfuzzer:ecdsa"
+
 RDEPENDS:${PN}-ptest += " \
 	python3-hypothesis \
 	python3-pytest \
-- 
2.35.6


