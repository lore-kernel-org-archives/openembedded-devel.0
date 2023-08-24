Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E240C6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:07:54 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.6104.1692864466465085032
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:07:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="129137482"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="129137482"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:07:44 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0591ADDC61
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:07:42 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3AB47D9497
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:07:41 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 649DD2FC825E;
	Thu, 24 Aug 2023 17:07:40 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] debootstrap: upgrade 1.0.128 -> 1.0.131
Date: Thu, 24 Aug 2023 16:07:23 +0800
Message-Id: <1692864443-2108-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27832.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27832.006
X-TMASE-Result: 10-0.218600-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmKN5v0jh1hv2/KZUMHzJkSUngIgpj8eDcBpkajQR5gb3mn0m688Eo38Kra
	uXd3MZDV/fdn0FCXriNEIueXvxnDyi7Pfjrsi37MrPWYZ/bjLVt0cxN5YkXBbehQIqq4zhiYYby
	rP3yetL/cvxIhSqHQFOkZv+CbU41hjgo81taOvxFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104559

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{debootstrap_1.0.128.bb => debootstrap_1.0.131.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/debootstrap/{debootstrap_1.0.128.bb => debootstrap_1.0.131.bb} (89%)

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.128.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.131.bb
similarity index 89%
rename from meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.128.bb
rename to meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.131.bb
index 592d997aad..c2cfe2a808 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.128.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.131.bb
@@ -11,7 +11,7 @@ SRC_URI  = "\
     file://0001-do-not-hardcode-the-full-path-of-dpkg.patch \
 "
 
-SRC_URI[sha256sum] = "09e7f8795fee894b77994213ee3a588e9d8f96ddf5f93afdec91e9a137aa7866"
+SRC_URI[sha256sum] = "ee5bebfaff92f4019804f900902d5c67d9f075870942dee87ec09862b2ab54c3"
 
 S = "${WORKDIR}/debootstrap"
 
-- 
2.34.1


