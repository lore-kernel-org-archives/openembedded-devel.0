Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BA8C47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 08:08:26 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.7127.1705997304937311116
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jan 2024 00:08:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="146993022"
X-IronPort-AV: E=Sophos;i="6.05,213,1701097200"; 
   d="scan'208";a="146993022"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 17:08:23 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 90C5DD64BF
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 17:08:20 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BB3E6D9489
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 17:08:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5CAE220097BC9
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 17:08:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C9A5F1A006B;
	Tue, 23 Jan 2024 16:08:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libsmi: Fix buildpaths warning.
Date: Tue, 23 Jan 2024 16:08:06 +0800
Message-Id: <1705997286-28744-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.006
X-TMASE-Result: 10--0.446000-10.000000
X-TMASE-MatchedRID: qil26QSh6dU6BiAI7o4CZvx0ykrbAxjCRzUPAqhCjtjAuQ0xDMaXkH4q
	tYI9sRE/GWtzbrhLRghYEW3ZChP2zq+/EguYor8cFEUknJ/kEl6YwzE9E8g5OfoLR4+zsDTtfUe
	ErNKFJidw5Urhsx9lpybOYHr7cM240QlJyn7X+wBfykkN2n2LYV1QhIu5lrQgZk4diEbd0PbGXy
	ft5uOmFBRScjGOTaEUvBry08np9d3yDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 08:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108435

From: Wang Mingyu <wangmy@fujitsu.com>

WARNING: libsmi-0.5.0-r0 do_package_qa: QA Issue: File /usr/bin/smistrip in package libsmi contains reference to TMPDIR
         File /usr/bin/smicache in package libsmi contains reference to TMPDIR [buildpaths]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
index 5b1d021e3..822b7ffc2 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
@@ -21,7 +21,8 @@ ALTERNATIVE_PRIORITY = "50"
 ALTERNATIVE:${PN}-yang = "ietf-interfaces "
 ALTERNATIVE_LINK_NAME[ietf-interfaces] = "${datadir}/yang/ietf-interfaces.yang"
 
-EXTRA_OECONF = "ac_cv_path_SH=/bin/sh"
+EXTRA_OECONF:class-native = "ac_cv_path_SH=/bin/sh"
+EXTRA_OECONF:class-target = "ac_cv_path_SH=/bin/sh ac_cv_path_WGET=${bindir}/wget ac_cv_path_AWK=${bindir}/awk"
 
 do_install:append () {
     install -d ${D}${sysconfdir}
-- 
2.34.1


