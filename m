Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D72EB64DD
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:14:25 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.7461.1687850055949722603
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="110071665"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="110071665"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:14:17 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B1FBD29E5
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:15 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D1B4D9AA1
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:14 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id A183488D20;
	Tue, 27 Jun 2023 16:14:13 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] psqlodbc: upgrade 13.02.0000 -> 15.00.0000
Date: Tue, 27 Jun 2023 15:12:06 +0800
Message-Id: <1687849939-19941-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
References: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27716.005
X-TMASE-Result: 10-1.624100-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGKyIgRbAMekiEzEoOqAAVLNV4BnlVId1nZsoi2XrUn/J8m+
	hzBStant0zt8ihye3BAtuKBGekqUpnH7sbImOEBQqjYxPMBC2R7balrnETmf7H3+Vwz0rQjOqpA
	OLl0bYNVXO5pofSHbFt0H7eHeQyioi7y5IlgCyTlqHYCUS/K939tI/+lUfMxXsfZ9V6Q6rCZgvU
	oiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 07:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103598

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../psqlodbc/{psqlodbc_13.02.0000.bb => psqlodbc_15.00.0000.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-dbs/psqlodbc/{psqlodbc_13.02.0000.bb => psqlodbc_15.00.0000.bb} (96%)

diff --git a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_13.02.0000.bb b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_15.00.0000.bb
similarity index 96%
rename from meta-oe/recipes-dbs/psqlodbc/psqlodbc_13.02.0000.bb
rename to meta-oe/recipes-dbs/psqlodbc/psqlodbc_15.00.0000.bb
index 57ade6162b..be79caef0b 100644
--- a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_13.02.0000.bb
+++ b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_15.00.0000.bb
@@ -26,7 +26,7 @@ SRC_URI = "http://ftp.postgresql.org/pub/odbc/versions/src/${BPN}-${PV}.tar.gz \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "b39b7e5c41fd6475c551112fa724bf57c4a446175ec4188a90e2844cc1612585"
+SRC_URI[sha256sum] = "ca57d6349532ea7fb4fae17bbfc107abe5a155ca2f43446315f9e23764b3f8ec"
 
 DEPENDS += "postgresql unixodbc"
 
-- 
2.34.1


