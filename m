Return-Path: <hasegawa-hitomi@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF594C43334
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 05:51:56 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com
 [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web08.4224.1655963513370061178
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jun 2022 22:51:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=neutral (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: hasegawa-hitomi@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="57170301"
X-IronPort-AV: E=Sophos;i="5.92,215,1650898800";
   d="scan'208";a="57170301"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP; 23 Jun 2022 14:51:50 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com
 [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E3991D624E
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 14:51:49 +0900 (JST)
Received: from yto-om1.fujitsu.com (yto-om1.o.css.fujitsu.com [10.128.89.162])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 443401451C
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 14:51:49 +0900 (JST)
Received: from localhost.localdomain (bakeccha.fct.css.fujitsu.com
 [10.126.195.136])
	by yto-om1.fujitsu.com (Postfix) with ESMTP id 36CAD405F4FBF
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 14:51:49 +0900 (JST)
From: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] libsdl: add CVE-2019-14906 to allowlist
Date: Thu, 23 Jun 2022 14:44:34 +0900
Message-Id: <20220623054434.1787116-1-hasegawa-hitomi@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jun 2022 05:51:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97573

CVE-2019-14906 is a Red Hat vulnerability and Yocto is not applicable.
So add it to the allowlist.

Signed-off-by: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
---
 meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 9085c6d2f..4ec0dc6ca 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -82,3 +82,6 @@ do_configure:prepend() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+#CVE-2019-14906 is a RHEL specific vulnerability.
+CVE_CHECK_IGNORE += "CVE-2019-14906"
-- 
2.25.1


