Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E2BC54E72
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:47 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.8224.1710827203701663180
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XBt6R7ZQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827203; x=1742363203;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5wxQXuAMwqNH1KyZB1jQtGNqVdmoU4TEUfbl/enTarI=;
  b=XBt6R7ZQQ5IF3tgVelWuVBJHNqK1BujX+0Y/0bYcB2d+0q01rTesBAPU
   c/uIgFMNXwirdzQO4BMAoN/kjVzetVaL/NWSeBY38IEp4p6zAvrMG3Z/6
   MoQg2zSUB35PP0uYFLEiroRD6fQcmdPV9UJnQYv7NtwHHj4rxllGv714g
   uq5wKlPJ46Rl3wLZ+gg2OFMJv5rCWbzcPHqCu6bjbtaWGksygQU842czj
   PEFDg+LnjxOzPHFkWXO1n/KAQE1F1bpdet/okhQCSZ/7avRHMeoQ3nx0V
   nPcLsWLOS6nToyfqwp7QxNZRzdUZizgIWaeqpU7ktbjpNIkJrnMwv/U6M
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="131999396"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="131999396"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:41 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 756EB141215
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:39 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A8AF9B4E25
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 441C82009325C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E24741A006B;
	Tue, 19 Mar 2024 13:46:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/50] python3-google-auth: upgrade 2.28.1 -> 2.28.2
Date: Tue, 19 Mar 2024 13:45:18 +0800
Message-Id: <1710827139-30056-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--2.273400-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrMVx/3ZYby788DTfVRLTQzAHM
	qJw+wD7/4K9FmervsqX+kfjo+nx5BG0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDKIp/k2x3jvkS1h1eUc+p68rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNRs1faBo9B2XM6H3vtNQ37XpdZvxyWLl8orB5ICdmAUEMvUsQrDH7OXxd+vfAfJ4EzYRO
	g3Kf8/y1Yx1A288qwkbJnP/6KGFq/zs1/e9oUcoU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109445

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Remove gce log for expected 404

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.28.1.bb => python3-google-auth_2.28.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.28.1.bb => python3-google-auth_2.28.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.28.1.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.28.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.28.1.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.28.2.bb
index 1f37544d2..d344b7016 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.28.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.28.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "34fc3046c257cedcf1622fc4b31fc2be7923d9b4d44973d481125ecc50d83885"
+SRC_URI[sha256sum] = "80b8b4969aa9ed5938c7828308f20f035bc79f9d8fb8120bf9dc8db20b41ba30"
 
 SRC_URI += " \
         file://run-ptest \
-- 
2.34.1


