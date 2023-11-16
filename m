Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6B6C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:01:36 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.2531.1700121686920734650
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:01:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="139337137"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="139337137"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:01:24 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D917D6477
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:01:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 42278BF4C8
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:01:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7FAE940B6E;
	Thu, 16 Nov 2023 17:01:20 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] bindfs: upgrade 1.17.5 -> 1.17.6
Date: Thu, 16 Nov 2023 15:51:44 +0800
Message-Id: <1700121104-21597-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28000.003
X-TMASE-Result: 10-0.788800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwjA94h1Svy2K2lF
	7OhYLlctoiRiRqJbjhYF1Ec/oUIRldAy2LXTI7g3EXjPIvKd74ANVHotTvuv6w9r3iN/4cJv1+0
	KsXaxWz7i8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFHaJ7oPzcbutFxA7RQJZVLqURi
	fjha0Os3muHthD7S9+o6cIo5j1ixMEm9YamxZIqTm79D9dHE/jVBHebRZIGfMdgWw+u0NWnex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:01:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106780

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fixed undefined behaviour on platforms where 'uid_t' or 'gid_t'
  is signed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-utils/binfs/{bindfs_1.17.5.bb => bindfs_1.17.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/binfs/{bindfs_1.17.5.bb => bindfs_1.17.6.bb} (90%)

diff --git a/meta-filesystems/recipes-utils/binfs/bindfs_1.17.5.bb b/meta-filesystems/recipes-utils/binfs/bindfs_1.17.6.bb
similarity index 90%
rename from meta-filesystems/recipes-utils/binfs/bindfs_1.17.5.bb
rename to meta-filesystems/recipes-utils/binfs/bindfs_1.17.6.bb
index c701e223e..673198e2d 100644
--- a/meta-filesystems/recipes-utils/binfs/bindfs_1.17.5.bb
+++ b/meta-filesystems/recipes-utils/binfs/bindfs_1.17.6.bb
@@ -8,7 +8,7 @@ DEPENDS = "fuse"
 RDEPENDS:${PN} = "fuse"
 
 SRC_URI = "git://github.com/mpartel/bindfs;protocol=https;branch=master"
-SRCREV = "3f57fa69448ad68f31cf62cf75b5a9b2e5096c05"
+SRCREV = "b982aee1161307cdd0e90f7f9597b11872440efc"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


