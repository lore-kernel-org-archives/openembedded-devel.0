Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D055DC46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:49:34 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.1574.1705974570630558916
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:49:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="126337713"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="126337713"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:49:28 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 621F3D64BF
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:49:26 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8F8D8D8ADC
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:49:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E3786B4C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:49:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C33441A006A;
	Tue, 23 Jan 2024 09:49:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-git-pw: upgrade 2.5.0 -> 2.6.0
Date: Tue, 23 Jan 2024 09:49:04 +0800
Message-Id: <1705974544-25982-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.004
X-TMASE-Result: 10-1.621100-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGEWNbZfbxvwGOwpfLMeBwRuuLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXKTYP2AqFt7BSUrpVTzqXfXiwXWlUDssYY0VU
	JiOFQyxlp/AWECw3W/sn4AtghaZ8dC/3aqDwUfw6nym+I+2fddyMIu3JWBb3v+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:49:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108414

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-git-pw_2.5.0.bb => python3-git-pw_2.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-git-pw_2.5.0.bb => python3-git-pw_2.6.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-git-pw_2.5.0.bb b/meta-python/recipes-devtools/python/python3-git-pw_2.6.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-git-pw_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-git-pw_2.6.0.bb
index d060a922b..c0b6a6081 100644
--- a/meta-python/recipes-devtools/python/python3-git-pw_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-git-pw_2.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/getpatchwork/git-pw"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=26e1a171d943c64f00c51f90c256b9d4"
 
-SRC_URI[sha256sum] = "c60169f9566bd6710f9c0985a005a0c326460b739d3f2b5c5c71e85211584590"
+SRC_URI[sha256sum] = "e118e31bbe259ed9ae540d627cc563a6ece553d02aed11b1a92bbac408a0da0e"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


