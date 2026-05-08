Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9843CCD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 06:28:56 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7734.1778221727610853059
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2026 23:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dn3UCWxi;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=851; q=dns/txt;
  s=iport01; t=1778221727; x=1779431327;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XqKX+lhNZVKbZd5LDNuk7NusOKHii1xMrDwnju2ZBEc=;
  b=dn3UCWxi7UCniDcMWWZolA70yaGHpSxGcnI1SWrxpnMq0sJke1Ldt9zb
   uHL10DATNzyFSXOkWaqvpDfHZWrmdpPGeoMqb1KQOMqMqY3HCCi40HY6p
   1EPXcbYHnosO4oMFArtnnqWzXLu23YhzfTLp+4XggduEEEAVpWAfU5i9s
   vDVP2HvaiwrzbRYslrL5+tuxpgc/5r9IrXvqmmxut/TJOaoW6UJf2ykTd
   kKdilVYIXiymOj+66tmhnErM6MxkZI0f8knyVMOHQE2HTqKWx1cNTnfck
   x1zf3CXrm9WEoUmC2pSnqN3UXw+xZGekHvGeliKa54NJrPkrPHQDa72fw
   w==;
X-CSE-ConnectionGUID: i29WvGWAT7OMyOxB2YODcA==
X-CSE-MsgGUID: QkZHJCNwTTuTKc8O+0nlhQ==
X-IPAS-Result: =?us-ascii?q?A0BkAgCfgf1p/5D/Ja1aglmCV3JeQ0mTWgGOV5I2gX8PA?=
 =?us-ascii?q?QEBDzEgBAEBhQaNNAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4Zchl02ARgBLTBRC0SDAgGCOgM2A7VhgiyBAYMoAYFU2EcNglMBCxQBg?=
 =?us-ascii?q?TiFP4J6hSOFbicbG4FyhH2CH4JxhXcEgiKBDo8ISIEeA1ksAVUTDQoLBwWBZ?=
 =?us-ascii?q?gM1EioVbjIdgSM+F4EMGwcFgUuCOXJqgQKEYHgjLANOgQMDCxgNSBEsNxQbB?=
 =?us-ascii?q?D5uB4pHHQ+CMHQagmmjQoIhoB1xCiiDdIwejz6FfBozqmsumFiSEpJHhGiBa?=
 =?us-ascii?q?DyBWXAVgyIJShkP1D4nMgI7AgcCBw0DC5NlAQE?=
IronPort-Data: A9a23:fEENv6uTwyzxh5Q4ngncgimKs+fnVABfMUV32f8akzHdYApBsoF/q
 tZmKWHUaK6KMGvxeth/a4W+8hxV65LdmoVlSVBsry8wFSMUgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFYzdJ5xYuajhKs//b+Es21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw+7wmPn9hy
 tUkdxcofzeTrbiH556wY7w57igjBJGD0II3oHpsy3TdSP0hW52GG/qM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtLYH49tL/Aan3Xcz9RpFWTjaE2+GPUigd21dABNfKKIYLbG5kEwx3wS
 mTuxmfLIjMxEsOj9Se50Xn8oayXmyf7YddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmEHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:gY9lCa408hPgcghNSwPXwP7XdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBPPZsl7dMhy70PJB3q
 F9dKU7ItjxAV9myfve2mCDYrIdKB3tytHPuQ8YpE0dKj1XVw==
X-Talos-CUID: 9a23:3sV2lm1FBvkwZSefhSm8XbxfG5p0TWPy817sfGidGEF5YuekbnOb0fYx
X-Talos-MUID: =?us-ascii?q?9a23=3AIe598w+wn737JY6p6HqZ3AuQf/5r0YSMI2YSrak?=
 =?us-ascii?q?bh+qPZQszYzGZjA3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,223,1770595200"; 
   d="scan'208";a="736964953"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 08 May 2026 06:28:46 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 7BF8B180000B5;
	Fri,  8 May 2026 06:28:46 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 27A38CC1288; Thu,  7 May 2026 23:28:46 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [meta-oe] [scarthgap] [PATCH] onig: Add CVE_PRODUCT to support product name
Date: Thu,  7 May 2026 23:28:41 -0700
Message-Id: <20260508062841.1958619-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2026 06:28:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126821

From: Het Patel <hetpat@cisco.com>

- Set CVE_PRODUCT to align with the NVD CPE and ensure correct CVE
reporting.

Signed-off-by: Het Patel <hetpat@cisco.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7bc5268662f1428bdbca08e14d223aa6b62e87f3)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta-oe/recipes-support/onig/onig_6.9.9.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/onig/onig_6.9.9.bb b/meta-oe/recipes-support/onig/onig_6.9.9.bb
index b29437db1e..0277be0a1b 100644
--- a/meta-oe/recipes-support/onig/onig_6.9.9.bb
+++ b/meta-oe/recipes-support/onig/onig_6.9.9.bb
@@ -32,3 +32,6 @@ do_install_ptest() {
 }
 
 PROVIDES += "oniguruma"
+
+# Add CVE_PRODUCT to match the NVD CPE product name
+CVE_PRODUCT = "oniguruma_project:oniguruma"
-- 
2.35.6


