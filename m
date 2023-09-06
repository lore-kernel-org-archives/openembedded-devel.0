Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88610CCFA0B
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:56:05 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.2333.1693965355312745363
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 18:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="130725976"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="130725976"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:55:53 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2CB36DB3C1
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:55:51 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 668E0D3F27
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:55:50 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DF5BD6B346;
	Wed,  6 Sep 2023 10:55:49 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] logwatch: upgrade 7.8 -> 7.9
Date: Wed,  6 Sep 2023 09:55:41 +0800
Message-Id: <1693965341-14139-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27858.004
X-TMASE-Result: 10-4.177300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Z71Wx2uUbPLdlRzZAkKRGDUBc8PVt3Swwnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlFnjKVTYbDMDEQdG7H66TyHEqm8QYBtMOZxnsusn9FPdC79
	R102u2XKEqUqzSmuGcxk/8ld+Ao6J3Uk54nkP0q18rTWexoO2FXJZzCN3v3qFppVjS0uYoJ3dz5
	mZLqB1mgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 01:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104740

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../logwatch/{logwatch_7.8.bb => logwatch_7.9.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/logwatch/{logwatch_7.8.bb => logwatch_7.9.bb} (96%)

diff --git a/meta-oe/recipes-extended/logwatch/logwatch_7.8.bb b/meta-oe/recipes-extended/logwatch/logwatch_7.9.bb
similarity index 96%
rename from meta-oe/recipes-extended/logwatch/logwatch_7.8.bb
rename to meta-oe/recipes-extended/logwatch/logwatch_7.9.bb
index 187e794b3d..00dc2fb1d0 100644
--- a/meta-oe/recipes-extended/logwatch/logwatch_7.8.bb
+++ b/meta-oe/recipes-extended/logwatch/logwatch_7.9.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ba882fa9b4b6b217a51780be3f4db9c8"
 RDEPENDS:${PN} = "perl"
 
 SRC_URI = "http://jaist.dl.sourceforge.net/project/${BPN}/${BP}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "b1df31779306c2c87d595816305c89c19c382edf9ebbfce03143f567e580be42"
+SRC_URI[sha256sum] = "49d2f1e99c9770f56fc3e82a46880e8900b874dfba593e45f599c89fd255738e"
 
 do_install() {
     install -m 0755 -d ${D}${sysconfdir}/logwatch/scripts
-- 
2.34.1


