Return-Path: <hasegawa-hitomi@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C4E2C04A95
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 09:05:05 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com
 [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web12.8177.1664442295177739855
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 02:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: hasegawa-hitomi@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="90422614"
X-IronPort-AV: E=Sophos;i="5.93,354,1654527600";
   d="scan'208";a="90422614"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP; 29 Sep 2022 18:04:52 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com
 [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B68ED5026
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 18:04:51 +0900 (JST)
Received: from oym-om3.fujitsu.com (oym-om3.o.css.fujitsu.com [10.85.58.163])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C7BADD3601
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 18:04:50 +0900 (JST)
Received: from localhost.localdomain (bakeccha.fct.css.fujitsu.com
 [10.126.195.136])
	by oym-om3.fujitsu.com (Postfix) with ESMTP id 9A181403F0312
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 18:04:50 +0900 (JST)
From: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libsdl: add CVE-2019-14906 to allowlist
Date: Thu, 29 Sep 2022 17:54:50 +0900
Message-Id: <20220929085450.4065187-1-hasegawa-hitomi@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Sep 2022 09:05:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99003

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


