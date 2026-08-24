Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69016C5DF9C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 10:51:02 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13935.1787568659021763412
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2026 03:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kd3jcU0a;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1446; q=dns/txt;
  s=iport01; t=1787568659; x=1788778259;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CRGyh69PDMWsMBMZA1g1o94zJ+RM7Q3qkNVZGNf9ZoE=;
  b=kd3jcU0a1lGKIG32qJH0nFk0jdvdhrWiNm3L5rKTHioS0ktChbxBJhTN
   oaSVDTe5/WYI0EAzyOZTlYOLBx4hiwH/AECm6oaGXaq2SsKaVA5vVYtB+
   l4wS+WqZwfnUCQfuFqFB6/F2o/mDk1ZE0ptml7q73jZ4zK4xxeBDh/GHd
   dc3rFofqjEDRIYsFUYovR8HljPJQV2oVkaUFLPjQ2dF7Uc8+QY8pbMI/a
   sD/vXc/I6/N5y3H5LRBCYUVJfuIA+3qbxGSKnpzoI7CEStdFodwLdnEZS
   F01VFrUhAAvjcYSrmziZIcYoikb0Q6VzFY1bLl1pIBnj5EEavncWuwvJh
   g==;
X-CSE-ConnectionGUID: 8snxxUnwSwCbSBK7HPeyjw==
X-CSE-MsgGUID: SBR0SoYoSnKx+KMCJBHkNQ==
X-IPAS-Result: =?us-ascii?q?A0BCAgAvIYxq/5EQJK1RCYJZgld0XkNJk1kBggRsnh6Bf?=
 =?us-ascii?q?g8BAQEPNxoEAQGFBY1uAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4ThlyGXTYBGAEtMFxEgwIBgnQDwxiCLIEBgygBgVTbMAELFAEFgTOFP?=
 =?us-ascii?q?4gidoR8JxsbgXKEfoQKDXmFeASCIoEMk1pIgR4DWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspZAESF4EJggcCglqCBQIBS?=
 =?us-ascii?q?UMOB0ciCxgNSBEsNxQZBD5uB45eH4JHATxRllSReqEPCiiDdowilToaM6psL?=
 =?us-ascii?q?phapFqEaYFoPIFZcBWDIglKGQ+OLhXQGScyAj0HAgcPApFzgX4BAQ?=
IronPort-Data: A9a23:NJuxSK090e7gNb7YsvbD5YJwkn2cJEfYwER7XKvMYLTBsI5bp2dVy
 mIZD2+Pbq3eMTD9L9pzYd/l8ksAvMKEx4dqGgNu3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24ubjpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGXFowLZ0l/PlMHkpEz
 tY7dxA1YwGBmLfjqF67YrEEasULJc3vOsYb/3pn1zycVaZgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2MEmojx5nYj/7DLoykfmhgGL/axVTqUmeouw85G27IAlZgOG9YIeIJYXSLSlTtn2yn
 Dr9+FX+ORc5JJ+87BGn2FKvoNaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7JQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:3mwo1Kk2H9rsoVEdFBg5JmsnlW7pDfIA3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8TWzJ846U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:rCaZJm44+eJja37xC9sspFUSCtAYdGLm01zaGGWbVkZRRayXVgrF
X-Talos-MUID: 9a23:9M9fgAZv+tyeSOBTjBXW3AplBcBT5Ye+S2Mourcsm8qiDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,240,1779148800"; 
   d="scan'208";a="818855710"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Aug 2026 10:50:58 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id 1371F18000474;
	Mon, 24 Aug 2026 10:50:58 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id A7A5FCC124A; Mon, 24 Aug 2026 03:50:57 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][PATCH] python3-aiohttp: correct CVE_PRODUCT mapping
Date: Mon, 24 Aug 2026 03:50:57 -0700
Message-Id: <20260824105057.64813-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2026 10:51:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129463

From: Devansh Patel <devanshp@cisco.com>

The current "aiohttp" mapping emits the wildcard-vendor *:aiohttp CPE
instead of the exact NVD identity for the packaged aio-libs/aiohttp
source.

Use "aiohttp:aiohttp", which is both an NVD dictionary CPE and an NVD
configuration identity. CNA affected data uses "aio-libs:aiohttp" and
remains covered by scanner aliases. With sbom-cve-check 1.3.3 and the
pinned 2026-08-12 data, the generated identity changes but the current
CVE report does not.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
index 033fc7c804..b862076869 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b5e9e27554f71f0f132919037cb967b2"
 
 SRC_URI[sha256sum] = "9491196535a88924a60afd5b5f434b5b203b6cc616250878dbdb223a8f7844bc"
 
-CVE_PRODUCT = "aiohttp"
+CVE_PRODUCT = "aiohttp:aiohttp"
 CVE_STATUS_GROUPS = "CVE_AIOHTTP_FIX_3_13_4"
 CVE_AIOHTTP_FIX_3_13_4[status] = "fixed-version: fixed in 3.13.4"
 CVE_AIOHTTP_FIX_3_13_4 = "CVE-2026-22815 CVE-2026-34513 CVE-2026-34514 \
-- 
2.35.6

