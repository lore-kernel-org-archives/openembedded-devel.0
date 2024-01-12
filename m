Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E89C47077
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 02:51:59 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.11036.1705027908198347896
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jan 2024 18:51:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="124678216"
X-IronPort-AV: E=Sophos;i="6.04,188,1695654000"; 
   d="scan'208";a="124678216"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 11:51:45 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 99792D64AA
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 11:51:43 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D1996BF3E4
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 11:51:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 63A7C202D20E6
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 11:51:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 138A01A0070;
	Fri, 12 Jan 2024 10:51:42 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 2/2] libsmi: use update-alternatives for  ietf-interfaces.yang
Date: Fri, 12 Jan 2024 10:50:24 +0800
Message-Id: <1705027824-28800-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1705027824-28800-1-git-send-email-wangmy@fujitsu.com>
References: <1705027824-28800-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28114.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28114.004
X-TMASE-Result: 10--2.132700-10.000000
X-TMASE-MatchedRID: 9CLtS+2vXX+txhXyTqc02bstbCLHbulS96ryTp77YeGysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLy9zcRSkKatcwitucT3dE73QqJN4m15UF9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrRWnvkHSvxz3ndtbGb1znldsbOXHF/SVmkafDKSF6SIgIwyA2/s4SUHoiu
	9qMO1BJqTGy4LbGE9KWBmaatLWM4WEzu3noUso4B0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 02:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108231

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/share/yang/ietf-interfaces.yang conflicts between attempted installs of libsmi-yang-0.5.0-r0.cortexa57 and frr-9.1-r1.cortexa57

frr also uses the doc 'ietf-interfaces.yang'.
frr has a priority of 100.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
index 07e2e2941..5b1d021e3 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
@@ -16,7 +16,10 @@ SRC_URI[sha256sum] = "f21accdadb1bb328ea3f8a13fc34d715baac6e2db66065898346322c72
 
 DEPENDS += "bison-native flex-native wget-native gawk-native"
 
-inherit autotools-brokensep
+inherit autotools-brokensep update-alternatives
+ALTERNATIVE_PRIORITY = "50"
+ALTERNATIVE:${PN}-yang = "ietf-interfaces "
+ALTERNATIVE_LINK_NAME[ietf-interfaces] = "${datadir}/yang/ietf-interfaces.yang"
 
 EXTRA_OECONF = "ac_cv_path_SH=/bin/sh"
 
-- 
2.34.1


