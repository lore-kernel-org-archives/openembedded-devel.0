Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5073C001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:20:39 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.116147.1698049231421386135
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="116574194"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="116574194"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:20:29 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 061BACD7E2
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:20:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 33EB1D5042
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:20:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7DEBF2005932A;
	Mon, 23 Oct 2023 17:20:25 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libbytesize: upgrade 2.9 -> 2.10
Date: Mon, 23 Oct 2023 16:20:11 +0800
Message-Id: <1698049211-24481-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10-2.243400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZqp573tpzEIwIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFFR6oT+RNRdku7Pzls+MFuF9V0
	FPJA4dq5u/jGHTFKqxav5Cq8bmkmx1JkSnPiGsXTRYcr1jKAKB68090A0y+0IkOl3GwiIraOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105638

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libbytesize/{libbytesize_2.9.bb => libbytesize_2.10.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libbytesize/{libbytesize_2.9.bb => libbytesize_2.10.bb} (84%)

diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.9.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb
similarity index 84%
rename from meta-oe/recipes-support/libbytesize/libbytesize_2.9.bb
rename to meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb
index dfc7b42dca..926a603b81 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_2.9.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "2fa27aa3acccc70b9f6c3bf2e569e3d33a381e83"
-SRC_URI = "git://github.com/rhinstaller/libbytesize;branch=master;protocol=https"
+SRCREV = "6e83cc6f6dff4f126fc79284e0c3c1c50123380d"
+SRC_URI = "git://github.com/rhinstaller/libbytesize;branch=main;protocol=https"
 
 inherit gettext autotools pkgconfig python3native
 
-- 
2.34.1


