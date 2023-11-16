Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD30FC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:43:56 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.2936.1700124229665973956
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:43:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="127563145"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="127563145"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:43:47 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 20C2AD9DA6
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:43:45 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 685C7D9686
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:43:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3966A867C2;
	Thu, 16 Nov 2023 17:43:43 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] uftp: upgrade 5.0.1 -> 5.0.2
Date: Thu, 16 Nov 2023 16:42:09 +0800
Message-Id: <1700124129-22786-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28000.003
X-TMASE-Result: 10-1.247200-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwhOed0Eey3YOcEj
	oFgm7EFKq9YyptElK5c7blYJVFl87/c2FOs5RCDbP0HVIeixJdA3l2plwgrtWMC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4g1UuEJlsPFUXSJ4c3nT+QcrT6V6InEuV//Ukuwze0bGY3h7SaJwNV6Ug5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLPR7utoGKTo8QeFV
	o0ZQzdSAA5yuxcLRYFP89L+98X3mcm0RljTPh25cLSmfVEXgT2372PjnYDyYrumvX9ufGKgJbq8
	uxdXMwKIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:43:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106806

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
-Fixed bug that caused crash when a CLIENT_KEY arrived out of order
-Fixed option handling on Windows when an argument is missing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/uftp/{uftp_5.0.1.bb => uftp_5.0.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/uftp/{uftp_5.0.1.bb => uftp_5.0.2.bb} (84%)

diff --git a/meta-networking/recipes-support/uftp/uftp_5.0.1.bb b/meta-networking/recipes-support/uftp/uftp_5.0.2.bb
similarity index 84%
rename from meta-networking/recipes-support/uftp/uftp_5.0.1.bb
rename to meta-networking/recipes-support/uftp/uftp_5.0.2.bb
index 6d5cf4b62..ca2a8ce67 100644
--- a/meta-networking/recipes-support/uftp/uftp_5.0.1.bb
+++ b/meta-networking/recipes-support/uftp/uftp_5.0.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/uftp-multicast/files/source-tar/"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/uftp-multicast/source-tar/uftp-${PV}.tar.gz"
-SRC_URI[sha256sum] = "f0435fbc8e9ffa125e05600cb6c7fc933d7d587f5bae41b257267be4f2ce0e61"
+SRC_URI[sha256sum] = "57c12a6ae59942535fb5e620381aedeb17d50009ee71f236427ce237a46c0b14"
 
 DEPENDS = "openssl"
 
-- 
2.34.1


