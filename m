Return-Path: <shin.matsunaga@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE29C54F64
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:49 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com
 [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web09.3057.1649141786771395287
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 23:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: shin.matsunaga@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="68685356"
X-IronPort-AV: E=Sophos;i="5.90,236,1643641200";
   d="scan'208";a="68685356"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP; 05 Apr 2022 15:56:25 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com
 [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8789FCCF85
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 15:56:23 +0900 (JST)
Received: from oym-om2.fujitsu.com (oym-om2.o.css.fujitsu.com [10.85.58.162])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C701EFD1D7
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 15:56:22 +0900 (JST)
Received: from localhost.localdomain (bakeccha.fct.css.fujitsu.com
 [10.126.195.136])
	by oym-om2.fujitsu.com (Postfix) with ESMTP id 905A64044544E;
	Tue,  5 Apr 2022 15:56:22 +0900 (JST)
From: matsunaga-shinji <shin.matsunaga@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: shin.matsunaga@fujitsu.com
Subject: [oe][meta-networking][PATCH] samba: add 2 cves to allowlist
Date: Tue,  5 Apr 2022 15:51:35 +0900
Message-Id: <20220405065135.1626306-1-shin.matsunaga@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96418

Patch for CVE-2018-1050 is applied in version 4.5.15, 4.6.13, 4.7.5.
Patch for CVE-2018-1057 is applied in version 4.3.13, 4.4.16.

Signed-off-by: matsunaga-shinji <shin.matsunaga@fujitsu.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.14.12.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb
index dc6e4b5e1..3da397f5c 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb
@@ -340,3 +340,8 @@ RDEPENDS:${PN}-test = "\
     "
 
 ALLOW_EMPTY:${PN}-test = "1"
+
+# Patch for CVE-2018-1050 is applied in version 4.5.15, 4.6.13, 4.7.5.
+# Patch for CVE-2018-1057 is applied in version 4.3.13, 4.4.16.
+CVE_CHECK_IGNORE += "CVE-2018-1050"
+CVE_CHECK_IGNORE += "CVE-2018-1057"
-- 
2.25.1


