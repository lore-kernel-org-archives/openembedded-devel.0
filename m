Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E16C27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:11:24 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.6145.1692864682244044278
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="108097745"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="108097745"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:11:19 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C28AEDDC6B
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:11:17 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id F350127FFC
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:11:16 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1FA582FC7351;
	Thu, 24 Aug 2023 17:11:16 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-awesomeversion: upgrade 23.5.0 -> 23.8.0
Date: Thu, 24 Aug 2023 16:10:52 +0800
Message-Id: <1692864652-2427-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27832.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27832.006
X-TMASE-Result: 10-0.915600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrMVx/3ZYby7/ozDhGeQC9Et7n
	eskPExT84CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2RV17CFfZYAB1vZ
	7s3YIVDJjiv6mswjmwXPF44cFsZvM5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO3x/F
	0UMEoTu3Cmflu0+M2+77CyhpNBdpMz0KJttwtMgZ8MBkVQEjFygwGSBi9cvzlWRktHMYuJnX/3b
	1JXDPHl6XS2M6whgTEFKgEqqsJ58vIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:11:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104567

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Remove support for Python 3.7
Add hash dunder
Use OIDC for PyPI release

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...wesomeversion_23.5.0.bb => python3-awesomeversion_23.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-awesomeversion_23.5.0.bb => python3-awesomeversion_23.8.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-awesomeversion_23.5.0.bb b/meta-python/recipes-devtools/python/python3-awesomeversion_23.8.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-awesomeversion_23.5.0.bb
rename to meta-python/recipes-devtools/python/python3-awesomeversion_23.8.0.bb
index bcd959cb27..6fd1364ada 100644
--- a/meta-python/recipes-devtools/python/python3-awesomeversion_23.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-awesomeversion_23.8.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.md;md5=92622b5a8e216099be741d78328bae5d"
 
-SRC_URI[sha256sum] = "a505558316010d2d10d487226f79c1157204af00fa462fdcf948e347011dd491"
+SRC_URI[sha256sum] = "d788b2917a716adb912ba1c31b831aedd4c37858fcfe080105dc8da30c2e21c3"
 
 RDEPENDS:${PN} += "python3-profile python3-logging"
 
-- 
2.34.1


