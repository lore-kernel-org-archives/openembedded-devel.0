Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEE1CD98F6
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 04:14:48 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35935.1781842478669158059
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2026 21:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PjuPIkoB;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1374; q=dns/txt;
  s=iport01; t=1781842478; x=1783052078;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OWuYx8ua75WLaLLwDtmF58qf+Tm/ex3bUehL6y9sl+Y=;
  b=PjuPIkoB56F4r+TYCI6ML0w4gjYueu9hW/OICCw6FINIGlet1o9jQPD0
   N47Cc4E1VTfqsKndr1kFy1Pu9p/dF7D8Mnxg7p1xYwCfsMKDqP2GvLj3j
   Yv7IlstS2asVOaC3cw0K7Mu2nW84+hiVltgfn2XsuEeUUW7NLuwsx2n0p
   ZNDNO+OvRX0WjoVA49iOFJ2gRY7xGnQ2UCkCRqWIp5yuPjMy/ZkgNkqAq
   pY55Yhy7SD+zWCYVO/HMFLwkNXhnRSLcA6uPNOfyDWuD8VhBsvhqkLOvH
   fgfyPmra/kZD8doISqNZqYY07XEHPas8mQYFFzGspjQPcBW1fdciHyJYq
   g==;
X-CSE-ConnectionGUID: B0djTb0ORGWsbr7y7SO4Qw==
X-CSE-MsgGUID: 0aI1/RKnRmacFQwER14y7w==
X-IPAS-Result: =?us-ascii?q?A0BCAgC+wTRq/4z/Ja1aglmCV3ReQ0mTWgGCBJ8KgX4PA?=
 =?us-ascii?q?QEBDzcaBAEBhQaNSgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZdKwsBGAEtMFxEgwIBgnMDEbJ3gXkzgQGDKAGBVNssAQsUAYE4h?=
 =?us-ascii?q?T+IH3MBhHwnGxuBcoR+hAoqXIV4BIIiehKBeI8wSIEeA1ksAVUTDQoLBwWBZ?=
 =?us-ascii?q?gM1EioVbjIdgSM+F4EMGwcFgR6Be4EChQMjHwM5f4FogSVnZhUwNYEBAREfC?=
 =?us-ascii?q?oEkAwsYDUgRLDcUGwQ+bgeMdxcPgj2BDiyCPQeTYpF8oQ8KKIN1jCGVOhozh?=
 =?us-ascii?q?ASmaJkIglmLMZZQhGiBaDyBWXAVgyIJShkPji4ViHPAAicyAjsBAQcCBw4DC?=
 =?us-ascii?q?4FokAACJoFVAQE?=
IronPort-Data: A9a23:hQ9sAq1WgoTagQS8dfbD5YVwkn2cJEfYwER7XKvMYLTBsI5bp2ZWm
 jMcXTjTOf7fYjf1fttzOdm2px8Bv5HRz9RqTFRr3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 bsen+WFYAX7g2AtYjpIg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGJhk6P7ESosFNLl5V/
 +ZHOW82SUy6mLfjqF67YrEEasULNsLnOsYb/3pn1zycVa1gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiYC/FMEg9/5JYWnOWhin75WzZZs1mS46Ew5gA/ySQtgOKwb4aFIYbiqcN9xk+5/
 yX83GLDBxgRGuWA5ADcrmPzmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu13fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9FRpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:3crHJqFedNaYOQA0pLqE3seALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KlbGSoAHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPId+rJBLK8gcaVbSC09QYLcT1X
X-Talos-CUID: 9a23:l25o7GCmCjmLLiv6EwM/+EwoEJgCSFLi133KfF7nMkE1caLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AxO7W3Q4DL1aOXRr8sllwqIBIxoww6oX3T3oul68?=
 =?us-ascii?q?DssKqDDNdAW7BnWuoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,212,1774310400"; 
   d="scan'208";a="482574832"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Jun 2026 04:14:36 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 134C4180005A2;
	Fri, 19 Jun 2026 04:14:36 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id A2493CC1611; Thu, 18 Jun 2026 21:14:35 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [meta-networking][scarthgap][PATCH 3/4] libtevent: upgrade 0.16.1 -> 0.16.2
Date: Thu, 18 Jun 2026 21:14:30 -0700
Message-Id: <20260619041430.2626579-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2026 04:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127676

From: Himanshu Jadon <hjadon@cisco.com>

Update tevent to the version used with newer Samba releases
in upstream meta-openembedded.

This is a prerequisite for upgrading Samba to 4.22.10 on
Scarthgap.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 .../libtevent/{libtevent_0.16.1.bb => libtevent_0.16.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/libtevent/{libtevent_0.16.1.bb => libtevent_0.16.2.bb} (95%)

diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.16.1.bb b/meta-networking/recipes-support/libtevent/libtevent_0.16.2.bb
similarity index 95%
rename from meta-networking/recipes-support/libtevent/libtevent_0.16.1.bb
rename to meta-networking/recipes-support/libtevent/libtevent_0.16.2.bb
index 0a37d7977d..29a1e6f43f 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.16.1.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.16.2.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
 
 LIC_FILES_CHKSUM = "file://tevent.h;endline=26;md5=47386b7c539bf2706b7ce52dc9341681"
 
-SRC_URI[sha256sum] = "362971e0f32dc1905f6fe4736319c4b8348c22dc85aa6c3f690a28efe548029e"
+SRC_URI[sha256sum] = "f0bbd29dfabbcbbce9f4718fc165410cdd4f7d8ee1f3dfc54618d4c03199cea3"
 
 inherit pkgconfig ptest waf-samba
 
-- 
2.35.6


