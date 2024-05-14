Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0140C41513
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:30 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.10784.1715677829831592765
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hUZHOoGZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677829; x=1747213829;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OtVLnpHhpgoKMX9H3c4y8dhVTXK8ZVny2t6veMgzpNg=;
  b=hUZHOoGZoX23iqGDZ+vHfGEQVQ5EYuFH++n/iDn0YE4MqucMn51UqZHm
   Xbuq+oMYfQD17Z95b0aHCK8ZDa0txzfrp8tHGJ13sd/TFsktvlJBxFgzm
   0GZJ/PttDqEt3JXcPKv13LP/dIJb3b6FSUXWWKl+YbbB/O85GOZptOn5j
   CEIfHnnPHdsJD83roJ3duiWiOb33OLITpSR/gfT5IGODD+lCjdifGY7Hc
   Rdhbv97LzK9i0KwxIKnEaJlyvriTkLl8xxezquqJ6ggRZoMy5IX5qgWvD
   o1dqXMiL7fa4Ji0NK2PWYlcB0nrbJ2Bxx7N3dmV8HZrz3gXX4JCC7YhDY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="145839658"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="145839658"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:27 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 16DAAD64A6
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:25 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E35931AE4
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DF59220076D15
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8CB4D1A000B;
	Tue, 14 May 2024 17:10:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/44] hwdata: upgrade 0.381 -> 0.382
Date: Tue, 14 May 2024 17:09:36 +0800
Message-Id: <1715677817-2223-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10-0.353800-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTJDl9FKHbrkwcMedHxxRAtMj
	jwb9QfV2lHVH/UHDB9Hmn3xyPJAJon585nKQczq746cXaPycFZvzWEMQjooUzWAN6i+va16ukWN
	Ccn0XQOLegKf/r6b46i5rYfHE0OO95UcZtwNsCroURSScn+QSXpjDMT0TyDk5+gtHj7OwNO25V9
	z3vqk3KqPn7MxzjFgIZ+aIQAWMxj/YB9m3uJ7kvtOWvF6eATMqZZVDrgsbRDQ/7y6a43/Uh2J5C
	5Zd1TUnoivsj2+Fcwl/vwVeOTRRxfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110350

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Update pci and vendor ids

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.381.bb => hwdata_0.382.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.381.bb => hwdata_0.382.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.381.bb b/meta-oe/recipes-support/hwdata/hwdata_0.382.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.381.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.382.bb
index 291b27372..a2bb7a334 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.381.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.382.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "4463530857af32d9dbfcfa9939c2304b51e5e58d"
+SRCREV = "94b82b56d6ee7c7ada381b3b02fecfca4ff7af1c"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


