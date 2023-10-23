Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4408C25B41
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:19:59 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.116142.1698049194603770659
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="136682276"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="136682276"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:19:52 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E0123D29E6
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:19:49 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 23EBFBF3E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:19:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 609602005932A;
	Mon, 23 Oct 2023 17:19:48 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ipc-run: upgrade 20220807.0 -> 20231003.0
Date: Mon, 23 Oct 2023 16:19:35 +0800
Message-Id: <1698049175-24445-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10-0.121400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4BGYkyyELuGKQH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRsNVHotTvuv6wIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFED7O1nFwbfNYLXTsg+sv65kXY
	1j8s1OvVHvZSa9y/Dd+ybObgJ/cxK0NqASzx2uFbh8CxwkuDTJySRTwCZjtYYQopX56+MsOOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:19:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105637

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../perl/{ipc-run_20220807.0.bb => ipc-run_20231003.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{ipc-run_20220807.0.bb => ipc-run_20231003.0.bb} (93%)

diff --git a/meta-oe/recipes-devtools/perl/ipc-run_20220807.0.bb b/meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb
similarity index 93%
rename from meta-oe/recipes-devtools/perl/ipc-run_20220807.0.bb
rename to meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb
index f597a8dab0..e28b6ea018 100644
--- a/meta-oe/recipes-devtools/perl/ipc-run_20220807.0.bb
+++ b/meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0ebd37caf53781e8b7223e6b99b63f4e"
 DEPENDS = "perl"
 
 SRC_URI = "git://github.com/toddr/IPC-Run.git;branch=master;protocol=https"
-SRCREV = "44b1f2d2021615c88f2f6b1a6cbdd9aebaeb4ad1"
+SRCREV = "ad56c3b5f5a211d32bbb8ac29f180d707ee58c1b"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


