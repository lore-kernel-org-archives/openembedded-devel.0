Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C85BBCD6E60
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 15:22:21 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.902.1780413738792793116
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 08:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NaLSfifj;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1443; q=dns/txt;
  s=iport01; t=1780413738; x=1781623338;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SJ9d4gLGhRnh8xWorA50hzA0DznLM+2P7ASwXrf79qk=;
  b=NaLSfifjAoov3jCbHNS9gvpjVuAEs+1x1eAH/JBK8JfzOca+Ppfm0wTx
   4v6wrGDS29P8yXTdwNWcKzrXnY+qWjOK1d6aMlsIkPLXIeFI+gXQMVmaS
   /4hVHg0tC3oFSpaJjT/SDJBkQD/EDkK6rlEuLur3exGAESlcgMe9Zx2ho
   tyQ4i079g04kkqnGkl0bnO/EZUqs7d3YDEk5ajeWyrqr9sdL5K/K//FoC
   FOd+v78nAwmZsHhKwv5d/BP6le1dLwykkWu+GtWFVkWXBwWm0XubyG1fe
   AgFeO2iPMTFLV1MHXO3aUtaZUh3UyY1CtSBFC90Uv2fEnjHGUhNK9nTW3
   g==;
X-CSE-ConnectionGUID: W9vw3TWNRkC1X5i7TagfuQ==
X-CSE-MsgGUID: Pt+3Ny2xTu+p8IKxfT1goA==
X-IPAS-Result: =?us-ascii?q?A0BCAgB59B5q/4z/Ja1aglmCV3JeQ0mTWgGOV5I3gX4PA?=
 =?us-ascii?q?QEBDzcaBAEBgXGDFY00AiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4ThlyGXTYBGAEtMFELRIMCAYI6AzYDs0eCLIEBgygBgVTYSA2CUwELF?=
 =?us-ascii?q?AGBOIU/gnqFI3SEeycbG4FyhH2CH4JxhXcEgiKBDIF7gmWLIUiBHgNZLAFVE?=
 =?us-ascii?q?w0KCwcFgWYDNRIqFW4yHYEjPheBCxsHBYFKgVVqgQSFFSMfAzmBF4F/gStpa?=
 =?us-ascii?q?RADCxgNSBEsNxQbBD5uB4tuFw+CNYEOlkETkXqgHXEKKIN0jCGPPoV8GjOqa?=
 =?us-ascii?q?y6YWJISkkaEaIFoPIFZcBWDIglKGQ/bQicyAjsCBwIHDgMLk2UBAQ?=
IronPort-Data: A9a23:usaGzq2xOqF0rZpM4/bD5YVwkn2cJEfYwER7XKvMYLTBsI5bpzBTy
 GpJCGCDOPiDNDDzLot1a4628hkOvceHyNdlSwdp3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 bsen+WFYAX7g2AsaDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGMxAoItYkxcBNAkoXx
 aEZdwwEYR6evrfjqF67YrEEasULNsLnOsYb/3pn1zycVa1gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiYC/FMEg9/5JYWnOWhin75WzZZs1mS46Ew5gA/ySQtgOi1b4SEI4ziqcN9plrb/
 UTXpXTFH1ICZP282TS5q32rr7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu13fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:KltqAq9y+SvFr/wr6zNuk+DuI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoI0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadF/DFCm5rY49s3CBxWPGZXV50=
X-Talos-CUID: =?us-ascii?q?9a23=3AK3W3K2loGl/JHe6jGtAy9LavIbXXOUKM0miLH3C?=
 =?us-ascii?q?eM2VCEY3ISACs8axqjvM7zg=3D=3D?=
X-Talos-MUID: 9a23:YDfhggnrXkRPzDA9sMpDdnpaKIQzxbX0GHwQ0o1WmuqUOxApNDC02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,183,1774310400"; 
   d="scan'208";a="488076918"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Jun 2026 15:22:18 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id F1638180001FA;
	Tue,  2 Jun 2026 15:22:17 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 9E28ACC1611; Tue,  2 Jun 2026 08:22:17 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [meta-python] [scarthgap] [PATCH] python3-pydantic: set CVE_PRODUCT
Date: Tue,  2 Jun 2026 08:21:55 -0700
Message-ID: <20260602152211.3599116-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 15:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127364

From: Gyorgy Sarvari <skandigraun@gmail.com>

Set correct CVE_PRODUCT - the default ${PN} value doesn't match relevant
CVEs.

See CVE query (n8n vendor is not relevant):
sqlite> select * from products where product like '%pydantic%';
CVE-2021-29510|pydantic|pydantic|||1.6.2|<
CVE-2021-29510|pydantic|pydantic|1.7|>=|1.7.4|<
CVE-2021-29510|pydantic|pydantic|1.8|>=|1.8.2|<
CVE-2024-3772|pydantic|pydantic|||1.10.13|<
CVE-2024-3772|pydantic|pydantic|2.0|>=|2.4.0|<
CVE-2025-55526|n8n|pydantic|2.11.7|=||

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b4fd4a6217cc94bece31ac662815a13343888ee6)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta-python/recipes-devtools/python/python3-pydantic_2.7.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.7.4.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.7.4.bb
index 04c9c91c0e..5c8d513317 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.7.4.bb
@@ -15,6 +15,8 @@ SRC_URI[sha256sum] = "0c84efd9548d545f63ac0060c1e4d39bb9b14db8b3c0652338aecc07b5
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
+CVE_PRODUCT = "pydantic:pydantic"
+
 RDEPENDS:${PN} += "\
     python3-annotated-types \
     python3-core \
-- 
2.44.1


