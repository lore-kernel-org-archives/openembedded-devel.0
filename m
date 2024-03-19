Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E592C54E72
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:16 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.8145.1710827170142613344
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ucia3EEK;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827170; x=1742363170;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=whgADZJsRqaEGmP/cp8fuYw2i6Pk9Txksocbxlud3Rk=;
  b=Ucia3EEKo+MedMYUws/xmcVwymBPWBvIM0aN9i/elia8c2zFP/BJAe0T
   lMEKOP8WTEcZGIRO7hJD1DGlHUkI7rQqIzgg3HHkhe0juu3Es9Ne+vgel
   Ni19HYM7IAysu8yCMGpc3PINz3vfEe9rJB5B1Lkm3mUFoqXQ5lJM9OsWM
   VDwswv5/ZPorpSuXqMJFQvvGZA0fYZDE5T8EBRi/x3qNibCMxZk+1/ga4
   Lcz2ynugvUDUlWhWAHvqOMlwWTaWK6u7euvx2XtHcs8/dKmEY287qLVtn
   LM0E2r8j0KDaFE6uYttGFcZ2TjZbcpwpaecBXT8LpYPZs0EHF1LfbP2Uj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="131999277"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="131999277"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:07 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3D9D0C3041
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:05 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 77F7F30D9D
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1994121BD6E
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:04 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B76C81A006B;
	Tue, 19 Mar 2024 13:46:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/50] flatbuffers: upgrade 23.5.26 -> 24.3.7
Date: Tue, 19 Mar 2024 13:44:53 +0800
Message-Id: <1710827139-30056-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--1.765000-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvIgofMgahPrUbX
	NqhgWp8u5BvxTNuRaELnAL9/DI+XIqdtnATHT3tN/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQfiq
	1gj2xET/gr0WZ6u+ypVvvsvcV0VPjcu2IYLQNwP9vTnqYKYXTRn0tCKdnhB58I/9UW5M5dRPefx
	4FmMaZTOTCMddcL/gjxlblqLlYqXLHa2E6+hEgw8uBvlluDCtjeN2cIe3MaVVoV1B5PmYUAIVcz
	DelAnvavRMjej54l3y5ufDHFVLjWkxK/w8ntPJ77g6L6wcYvPj+v9v52ZIoWjoAf389xF3XFSk9
	HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109420

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
*Just to fix some of the CI build issues
*Fix typescript object API to allow 0 values for null-default scalars

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
index 7533f7c75..fb9f97bc1 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
@@ -1,3 +1,3 @@
-PV = "23.5.26"
-SRCREV = "0100f6a5779831fa7a651e4b67ef389a8752bd9b"
+PV = "24.3.7"
+SRCREV = "6ff9e90e7e399f3977e99a315856b57c8afe5b4d"
 SRC_URI = "git://github.com/google/flatbuffers.git;branch=master;protocol=https"
-- 
2.34.1


