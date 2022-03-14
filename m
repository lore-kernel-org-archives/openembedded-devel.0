Return-Path: <shin.matsunaga@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B478C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 01:07:13 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com
 [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web08.21345.1647220032214213872
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Mar 2022 18:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: shin.matsunaga@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="66470953"
X-IronPort-AV: E=Sophos;i="5.90,179,1643641200";
   d="scan'208";a="66470953"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP; 14 Mar 2022 10:07:09 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com
 [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E89DC6844
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 10:07:08 +0900 (JST)
Received: from yto-om1.fujitsu.com (yto-om1.o.css.fujitsu.com [10.128.89.162])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B96AFD0432
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 10:07:06 +0900 (JST)
Received: from localhost.localdomain (bakeccha.fct.css.fujitsu.com
 [10.126.195.136])
	by yto-om1.fujitsu.com (Postfix) with ESMTP id A6FE5404AFF0B;
	Mon, 14 Mar 2022 10:07:06 +0900 (JST)
From: matsunaga-shinji <shin.matsunaga@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: shin.matsunaga@fujitsu.com
Subject: [meta-security][PATCH] ecryptfs-utils: add CVE-2016-1572 to allowlist
Date: Mon, 14 Mar 2022 10:02:56 +0900
Message-Id: <20220314010256.1684786-1-shin.matsunaga@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Mar 2022 01:07:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95968

Patch for CVE-2016-1572 is applied in version 109.

Signed-off-by: matsunaga-shinji <shin.matsunaga@fujitsu.com>
---
 recipes-security/ecryptfs-utils/ecryptfs-utils_111.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-security/ecryptfs-utils/ecryptfs-utils_111.bb b/recipes-security/ecryptfs-utils/ecryptfs-utils_111.bb
index 9aefc32..d98724c 100644
--- a/recipes-security/ecryptfs-utils/ecryptfs-utils_111.bb
+++ b/recipes-security/ecryptfs-utils/ecryptfs-utils_111.bb
@@ -68,3 +68,6 @@ FILES:${PN} += "${base_libdir}/security/* ${base_libdir}/ecryptfs/*"
 
 RDEPENDS:${PN} += "cryptsetup"
 RRECOMMENDS:${PN} = "gettext-runtime"
+
+# Patch for CVE-2016-1572 is applied in version 109.
+CVE_CHECK_IGNORE += "CVE-2016-1572"
-- 
2.25.1


