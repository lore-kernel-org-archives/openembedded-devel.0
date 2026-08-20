Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E303BC5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:37:46 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3578.1787218664649026580
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=AwIDV3mI;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1099; q=dns/txt;
  s=iport01; t=1787218664; x=1788428264;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Vt1TwezRiy8tkvyi0b5iwlwjKPDmtwfhS0EVSumoNkw=;
  b=AwIDV3mIA03jdCvFUYeiptryEp6T4jkgwXWeFGVRoBQMm4/gXpcsRtY9
   E0Tz9HMna8oA0XybW2mLFXKudOlKhyK8CwPZQOkmBUnk6sOdB7jYnlWiw
   mHQ2Q3os7mxf5nddVwDA7LD0W/3GCCHKfZAg75DdZTnDaYj1soGUbYFXP
   XSWSgYix0FBH3d5UwgLPL0WP6wEAgQk0OX31JmkScLrXrwblpeHOzATMj
   6VMl974PlKEW7wiCHgCJPA06SsEnpbDQgLV1UGdycmAQ/TUdUTb7fl4Sk
   fxc3UltAgKJ5d20Sitv21TaLpQl9H0LVCOzLcOy5ShEd39HZH/YIO8ktE
   A==;
X-CSE-ConnectionGUID: drbEXZIHSoanMs2DP048sQ==
X-CSE-MsgGUID: wHxH2bwhS1WzeZS0ChLXnw==
X-IPAS-Result: =?us-ascii?q?A0DEAgARyoZq/4wQJK1RCYJZgld0XkNJk1kBggSfCoF6B?=
 =?us-ascii?q?A8BAQEPNxoEAQGFBY1tAiY1CA4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8Nhl02ARgBLTBcRIMCAYJ0A8JbgiyBAYMoAYFU2zABCxQBBYEzh?=
 =?us-ascii?q?T+IInaEfBMUGxuBcoR+hBd5hXgEgiJ6EoF4gQ+QQ0iBHgNZLAFVEw0KCwcFg?=
 =?us-ascii?q?WYDNRIqFW4yHYEjPheBDRsGBYEdgSiENyMZNnyBCV6BKyphARIXgQmCCgKCc?=
 =?us-ascii?q?IIGAgFJRQ4JFwsYDUgRLDcUGQQ+bgeOUSCCSz1RgR+nL6EPCiiDdowhlToaM?=
 =?us-ascii?q?4VbpREumFqkWoRpgWkBOoFZcBU7gmcJShkPji4ViUTGVScyAj0HAgcPApNxA?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:HG+5MKIiRi23RXEoFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS1zYBx
 mQcDTrXb/iJYGPxLdp/YY/j80xVvZGDz4I2QVcd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2clajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1iFksbDb852t1wCGdr7
 qY0EGhRPgu60rfeLLKTEoGAh+wqKM3teYdasXZ6wHSBVrAtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzNHwsYDUXUrsTIJ4zgu6unXnnWzZZs1mS46Ew5gA/ySQhieS8a4CKJoLiqcN9gWaIh
 jjM4GTCWy4IOe6kkRGF1kKqmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRu13fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:W5KvCqqYTgK9TJUX0V5QB2EaV5oHeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9TIIVybygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:iku1q270AmXLwzA1ttss+FQeN/AXU13my37WBlTiJV4xFO2OcArF
X-Talos-MUID: =?us-ascii?q?9a23=3AeUjMfQ3BtuMbLrofcSFg5FWyezUj/IS+KBoHjpU?=
 =?us-ascii?q?94vaWOB5LYxydqASxXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="814932746"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:37:43 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id B5F50180007EB;
	Thu, 20 Aug 2026 09:37:43 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 53B45CC12A6; Thu, 20 Aug 2026 02:37:43 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][PATCH] python3-web3: add CVE_PRODUCT mapping
Date: Thu, 20 Aug 2026 02:37:43 -0700
Message-Id: <20260820093743.42927-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 09:37:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129386

From: Devansh Patel <devanshp@cisco.com>

The current inherited "python:web3" mapping does not match the web3.py identities used by NVD and CVE List V5, so its source-aligned CVE is missed.

Use "ethereum:web3.py" for the CNA affected-data identity and "apeworx:web3.py" for the NVD dictionary CPE and configuration identity.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-python/recipes-devtools/python/python3-web3_7.16.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-web3_7.16.0.bb b/meta-python/recipes-devtools/python/python3-web3_7.16.0.bb
index bb1c354934..88e224f834 100644
--- a/meta-python/recipes-devtools/python/python3-web3_7.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_7.16.0.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1d34d9701a1461e4bd71a904ac4cf7be"
 
 SRC_URI[sha256sum] = "b4a75a3fa94fef4d23d502eb3c2244146ef9a1ee0082cf1cb0a91586ba0510c3"
 
+CVE_PRODUCT = "ethereum:web3.py apeworx:web3.py"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-- 
2.35.6

