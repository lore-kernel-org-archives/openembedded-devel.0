Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1BEC7EE45
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 07:40:50 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.8605.1685518841175940890
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 00:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="118834785"
X-IronPort-AV: E=Sophos;i="6.00,205,1681138800"; 
   d="scan'208";a="118834785"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 16:40:39 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E6978DDC60
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 22B98D4BF6
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:36 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A106368957;
	Wed, 31 May 2023 16:40:35 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-asgiref: upgrade 3.7.1 -> 3.7.2
Date: Wed, 31 May 2023 15:40:04 +0800
Message-Id: <1685518820-20028-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
References: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27662.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27662.006
X-TMASE-Result: 10-1.430400-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrpi5i27frSFPEWhdVdXNnv7vp
	aegzCez+4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16u0Ct
	cUnKf9PhqmHU1OQqRGj21HGsfcKEM5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO28bR
	Ued1HGAtZ8zq7OiyRdOsAhiPSSZUlId6sn+9pIDCPKgwFh+crXmxGEHJvhhIo576tYQvT607yuo
	NRbv02eQr9rk2obWjcBaF3TE4iz2fIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 07:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102909

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* The type annotations for SyncToAsync and AsyncToSync have been changed to
  more accurately reflect the kind of callables they return.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-asgiref_3.7.1.bb => python3-asgiref_3.7.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asgiref_3.7.1.bb => python3-asgiref_3.7.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-asgiref_3.7.1.bb b/meta-python/recipes-devtools/python/python3-asgiref_3.7.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-asgiref_3.7.1.bb
rename to meta-python/recipes-devtools/python/python3-asgiref_3.7.2.bb
index 8eecd2d26..c9081c8cb 100644
--- a/meta-python/recipes-devtools/python/python3-asgiref_3.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-asgiref_3.7.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 SRC_URI += "file://run-ptest \
 	    "
 
-SRC_URI[sha256sum] = "8de379fcc383bcfe4507e229fc31209ea23d4831c850f74063b2c11639474dd2"
+SRC_URI[sha256sum] = "9e0ce3aa93a819ba5b45120216b23878cf6e8525eb3848653452b4192b92afed"
 
 export BUILD_SYS
 export HOST_SYS
-- 
2.34.1


