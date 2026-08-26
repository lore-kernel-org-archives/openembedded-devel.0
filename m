Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6CBC61DCB
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:30:25 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6157.1787722219254549806
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=krNWQEAL;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1240; q=dns/txt;
  s=iport01; t=1787722220; x=1788931820;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2MEbOfdy4YU8zq6z22J9we4XMuKAkTBw+TVh3Y3agp4=;
  b=krNWQEAL5WVdkDZjfg+5FBmJR6xNf5qtDu553ZOdCmjr1IkkZyrm0yMi
   XZQsl7PoHn8QnISdw8A/6lFSMvZNVjS8UfMl+WRM1HxMxu3ATVuT32jr3
   9Z2MUVHSdtcuxlIQC77qk/wi0c+dGILecElmQHHJH0lKID1pjZM32c9wz
   sPuiOzMb2TrKHlK41q2ou3zDp0pKT+dYQ/ic2ajggtMHOI0TH6gKYVlKW
   IDpptYd5s4Ht7R4fD3Kz+N1vOTxkJ7hfUWpGu0vI3vIIJ2t7yb1+l/KwK
   BgzCXWsLG5svLjxXvG0fhsLUW7EHJc3SuP6qbalo8hw3Dutp7Dy9g6um4
   Q==;
X-CSE-ConnectionGUID: Gfqvj6YwRciMEbwcGVAlhw==
X-CSE-MsgGUID: 9qoinFMbSQm0EkoNRIWxQw==
X-IPAS-Result: =?us-ascii?q?A0D3AgBDeI5q/5IQJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW4CJjYHDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgEYAS0wXESDAgGCdAO+Z4IsgQGDKAGBVNswAQsUAQWBM4U/i?=
 =?us-ascii?q?CJ2hHwnGxuBcoR+hAoNeYV4BIIigQyBeJFqSIEeA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4ENGwYFgR2BKIQQIxk2fIEJXoErKWABEheBCYIHAoJaggUCA?=
 =?us-ascii?q?UlDDgdHPgsYDUgRLDcUGQQ+bgeOax+CSAEBPFGWVJF6oQ8KKIN2jCKVOhozq?=
 =?us-ascii?q?mwumFqkWoRpgW8DMoFZcBWDIglKGQ/eXCcyAjsCBwIHDgMLkWiBfgEB?=
IronPort-Data: A9a23:b1rInqrfss/wy5t7xNhUZ6MjEEJeBmJJZBIvgKrLsJaIsI4StFCzt
 garIBmEO6yDNzCkKNAiPIm+9koP7ZfVz9BqHQA6/igxFn8VpePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrT8k035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0sl5GH9Mq
 80HEjsMSz2JmOmZ/pu/SvY506zPLOGzVG8eknhkyTecCbMtRorOBv2bo9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwtJYH49tL/Aan3XfzBGoVSOpbIf6GnIxws327/oWDbQUozQHZQPxh3J+
 woq+UyoGxYbMvK6wwG89yqBhejppwLESLsNQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymEzq7SpgLcDW8eQ3sZOZottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvoUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:6GCT5azi5bJWOSCiWjJqKrPwAL1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcK6geQfxEWjtQttp
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:liAbBGOgXzIAae5Ddyd+6kxKK98feXz44X3PKGCGIGJpV+jA
X-Talos-MUID: =?us-ascii?q?9a23=3Aen9uXA4s6J2rCwRvwpANr8Rmxow5+qOvDm4om64?=
 =?us-ascii?q?/vpGpNitWARainA2oF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="820920395"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 05:30:20 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id C9E401800044B;
	Wed, 26 Aug 2026 05:30:19 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 6E3C4CC12A6; Tue, 25 Aug 2026 22:30:19 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][wrynose][PATCH] python3-cbor2: use exact CVE_PRODUCT mapping
Date: Tue, 25 Aug 2026 22:30:19 -0700
Message-Id: <20260826053019.51750-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 05:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129483

From: Devansh Patel <devanshp@cisco.com>

The product-only "cbor2" mapping uses a wildcard vendor. Use
"agronholm:cbor2", its NVD dictionary CPE and NVD configuration
identity for the packaged source.

The generated CPE changes, but Wrynose sbom-cve-check 1.3.1 with its
pinned 2026-05-07 databases has no current CVE report delta. This
backport applies the change to version 5.9.0 rather than 6.1.4.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 7f59d247eea101ad62ded8e2e0bd5419dd65eb79)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-python/recipes-devtools/python/python3-cbor2_5.9.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.9.0.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.9.0.bb
index 42d661ead3..f0b6bd3a3b 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.9.0.bb
@@ -15,6 +15,6 @@ RDEPENDS:${PN} += " \
     python3-datetime \
 "
 
-CVE_PRODUCT = "cbor2"
+CVE_PRODUCT = "agronholm:cbor2"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6

