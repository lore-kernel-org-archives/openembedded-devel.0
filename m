Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D9BC46CD4
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 07:21:20 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.76368.1703575278670615821
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Dec 2023 23:21:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="123941474"
X-IronPort-AV: E=Sophos;i="6.04,304,1695654000"; 
   d="scan'208";a="123941474"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 16:21:16 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6FD2CD6186
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:21:14 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A788313F64
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:21:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3611420081316
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:21:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E38891A0072;
	Tue, 26 Dec 2023 15:21:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-asyncinotify: upgrade 4.0.4 -> 4.0.5
Date: Tue, 26 Dec 2023 15:09:19 +0800
Message-Id: <1703574559-13070-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28080.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28080.005
X-TMASE-Result: 10-1.621100-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGEWNbZfbxvwGOwpfLMeBwRtC4sa7AidY08EguqiGeZ5Jo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXJT2u26Dn/iXXjU5DBuFbe4MbX02SYluua/G7
	91uKE+yVoWPNWNbZdQosnU4ycGolRvJUFVEVay5UIETueesIwrRNmgVsGUHjn+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 07:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107796

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-asyncinotify_4.0.4.bb => python3-asyncinotify_4.0.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asyncinotify_4.0.4.bb => python3-asyncinotify_4.0.5.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.4.bb b/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.5.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-asyncinotify_4.0.4.bb
rename to meta-python/recipes-devtools/python/python3-asyncinotify_4.0.5.bb
index c11b2d5e0..a7820c5ab 100644
--- a/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitlab.com/Taywee/asyncinotify"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f75d2927d3c1ed2414ef72048f5ad640"
 
-SRC_URI[sha256sum] = "811051db219e8d6bee14ac7cb58a0ebe565094f7aabb988943b1d9d58e994381"
+SRC_URI[sha256sum] = "95840eec6804797f9e8ee6d65a9d2a1159e77c5395a468dcfa4f44338ed1f8b6"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


