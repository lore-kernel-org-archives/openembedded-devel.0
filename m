Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A446DC54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:43:57 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.7746.1709714634956381823
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:43:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ez6KSmwQ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714635; x=1741250635;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=voR7SIvgtbb/KNnSt3uQT0X9GTqG0DJJV2OYFZWvyt8=;
  b=ez6KSmwQ/Qih7RGtY/BAEJfndPUd0LKWIod14FPhuu9n9ff13ntsL72t
   9iv40VtdpMVdTLTp62/+mvBCMp8qvR5gWt0lLzDvOrHWGFcnytorixgOx
   mj8O5/6bF7i7t+n0bf3w8fjyxaMmjEKihH65IG+vL8xteviWXZT9a5DEw
   gnYS9hhiDu/AEvWc8MoeWOc3lwQcNUYa1PX6AF+OjamlsIBQ3XuqyAMFi
   Dhq4XjOfTLqXrvwU9ZoFTkvktSemvbEM30UIMOxLM+1POH45pypQa/qX9
   2I7LD+4HOl++7p/ZXOVmK1+YlLpd37E380UfKKFCjdiJcAhdTbzfVvDds
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="151429220"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="151429220"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:43:53 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CAB3ED9F03
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:43:50 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0DCEBD5A3A
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:43:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8AC572008FF86
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:43:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 389A71A006A;
	Wed,  6 Mar 2024 16:43:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/26] dbus-cxx: upgrade 2.5.0 -> 2.5.1
Date: Wed,  6 Mar 2024 16:43:07 +0800
Message-Id: <1709714608-19296-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10-1.061000-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrU1ME+yDU6y54YeSlHZYFoqfo
	g2X1GkTJ4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16ukWN
	Ccn0XQOLegKf/r6b46nk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6WEo
	5I8f3OpJaLEn2Y8lHD3ddi5G/RkdVIBHHQCkCulENLxa6xJ0X/rwcmHqCSyOngNeLPzvzXrPpWR
	XRmAR30IX328YKHL8KCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109145

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Compiles cleanly on Debian 12
-Fix an error with decoding arrays in variants under certain circumstances

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dbus-cxx/{dbus-cxx_2.5.0.bb => dbus-cxx_2.5.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/dbus-cxx/{dbus-cxx_2.5.0.bb => dbus-cxx_2.5.1.bb} (91%)

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.0.bb b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.1.bb
similarity index 91%
rename from meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.0.bb
rename to meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.1.bb
index fa81472af..e89d1327e 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.0.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.1.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPL-3.0-or-later | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=24594f493407a4cd401ce9794e0b9308"
 
 SRC_URI = "git://github.com/dbus-cxx/dbus-cxx.git;branch=master;protocol=https"
-SRCREV = "2c3b3a767a5898ea8e51159e8122ddbb3aaeeb94"
+SRCREV = "732a5becb4349e02ffce407a3fd4d75cc3d82421"
 
 DEPENDS = "\
 	dbus \
-- 
2.34.1


