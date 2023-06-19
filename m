Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70B7EB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 06:50:41 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.2321.1687157433893760647
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jun 2023 23:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="121324684"
X-IronPort-AV: E=Sophos;i="6.00,254,1681138800"; 
   d="scan'208";a="121324684"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 15:50:32 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A9E45D3EA9
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:29 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E1D39D5E90
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1E1B82FC8442;
	Mon, 19 Jun 2023 15:50:28 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.64.1 -> 0.68.0
Date: Mon, 19 Jun 2023 14:48:27 +0800
Message-Id: <1687157308-17342-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
References: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27700.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27700.005
X-TMASE-Result: 10-1.885700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr4lDTaSOmUeCU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8Jlr1xKkE5uYMNZlevXKUzBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6L/z
	/jp+zGDS3M5z1uqWw5DenZ/hAy+d+EY9xbtvaSQZgAMpYhgZ4qvAPGZqNKHu+UYk8Q9QlbfyDdp
	aZp74prE7ny4fRCFJGCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103378

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Reduce overhead to handle queries and responses (#1184) (81126b7)
 Speed up answering incoming questions (#1186) (8f37665)
 Optimize construction of outgoing dns records (#1182) (fc0341f)
 Reduce overhead to enumerate ip addresses in ServiceInfo (#1181) (6a85cbf)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-zeroconf_0.64.1.bb => python3-zeroconf_0.68.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.64.1.bb => python3-zeroconf_0.68.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.64.1.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.68.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.64.1.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.68.0.bb
index 1fd79a642..93eebf160 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.64.1.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.68.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "e90b2d5d247474b6ccf49bc7e02de516cc459efca6e3ac052b48eeb4a11985af"
+SRC_URI[sha256sum] = "e5c05d4fe8d6ef2133af930a17b18e172f54650294b780f93bb6a42df3af1e0d"
 
 inherit pypi setuptools3
 
-- 
2.34.1


