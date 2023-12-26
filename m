Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B7CC46CD4
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 06:59:40 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.76528.1703573972115631724
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Dec 2023 22:59:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="132263984"
X-IronPort-AV: E=Sophos;i="6.04,304,1695654000"; 
   d="scan'208";a="132263984"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 15:59:29 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DC7F0DD930
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 15:59:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2424EBF4AC
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 15:59:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B3BA92005932A
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 15:59:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 63B701A0072;
	Tue, 26 Dec 2023 14:59:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] uftp: upgrade 5.0.2 -> 5.0.3
Date: Tue, 26 Dec 2023 14:59:02 +0800
Message-Id: <1703573942-12664-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28080.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28080.005
X-TMASE-Result: 10--2.865800-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrw4SuXsUCGYhs1Ir4NZzFmvmv
	83Rzid1pFid7Q1ZuuwxLTmvmHr3PYvc2FOs5RCDbP0HVIeixJdA3l2plwgrtWMC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4g1UuEJlsPFUXSJ4c3nT+QcrT6V6InEuV//Ukuwze0bGY3h7SaJwNV6Ug5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLOFIHVmPOi8GTBMP
	I2x4ws4Rkudb5VAVbp8mRLj/vjmuhDTVNMAdHLG1nuowOscmGDkElP/ng1TEhPsxmxQuEXlZohA
	aZu4PemIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 06:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107787

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-A memory leak fix in the prior version wasn't applied correctly, resulting
 in an invalid memory access causing a crash.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/uftp/{uftp_5.0.2.bb => uftp_5.0.3.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/uftp/{uftp_5.0.2.bb => uftp_5.0.3.bb} (84%)

diff --git a/meta-networking/recipes-support/uftp/uftp_5.0.2.bb b/meta-networking/recipes-support/uftp/uftp_5.0.3.bb
similarity index 84%
rename from meta-networking/recipes-support/uftp/uftp_5.0.2.bb
rename to meta-networking/recipes-support/uftp/uftp_5.0.3.bb
index ca2a8ce67..6f0858cc9 100644
--- a/meta-networking/recipes-support/uftp/uftp_5.0.2.bb
+++ b/meta-networking/recipes-support/uftp/uftp_5.0.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/uftp-multicast/files/source-tar/"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/uftp-multicast/source-tar/uftp-${PV}.tar.gz"
-SRC_URI[sha256sum] = "57c12a6ae59942535fb5e620381aedeb17d50009ee71f236427ce237a46c0b14"
+SRC_URI[sha256sum] = "cb8668c19b1f10bc63a16ffa893e205dc3ec86361037d477d8003260ebc40080"
 
 DEPENDS = "openssl"
 
-- 
2.34.1


