Return-Path: <shin.matsunaga@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65728C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 04:14:57 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com
 [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web12.2190.1646972096468506624
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 20:14:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: shin.matsunaga@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="66268838"
X-IronPort-AV: E=Sophos;i="5.90,172,1643641200";
   d="scan'208";a="66268838"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP; 11 Mar 2022 13:14:53 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com
 [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 98D2EC68A7
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Mar 2022 13:14:52 +0900 (JST)
Received: from oym-om2.fujitsu.com (oym-om2.o.css.fujitsu.com [10.85.58.162])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id DA9EED0430
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Mar 2022 13:14:51 +0900 (JST)
Received: from localhost.localdomain (bakeccha.fct.css.fujitsu.com
 [10.126.195.136])
	by oym-om2.fujitsu.com (Postfix) with ESMTP id A8D7C40445438;
	Fri, 11 Mar 2022 13:14:51 +0900 (JST)
From: matsunaga-shinji <shin.matsunaga@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: shin.matsunaga@fujitsu.com
Subject: [PATCH] ecryptfs-utils: add CVE-2016-1572 to allowlist
Date: Fri, 11 Mar 2022 13:10:33 +0900
Message-Id: <20220311041033.1684086-1-shin.matsunaga@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Mar 2022 04:14:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95945

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


