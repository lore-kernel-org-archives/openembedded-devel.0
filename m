Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29F0C001DE
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:50:45 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.151941.1692150644906549914
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="116322284"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="116322284"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:50:42 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CC160D3EB7
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:50:40 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1FAE7D9688
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:50:40 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 389FD86E22;
	Wed, 16 Aug 2023 10:50:39 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-virtualenv: upgrade 20.24.2 -> 20.24.3
Date: Wed, 16 Aug 2023 09:50:15 +0800
Message-Id: <1692150615-5988-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27816.003
X-TMASE-Result: 10-2.637700-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytULhp+W/a9mTSs
	oNI/FWew4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO25V9
	z3vqk3KodtEYnqNLirPHXtu69dO84+yxQ+5Ws4YPvK7PEXviSK0zwD1SUppZT5HLAK1f5zC82Ll
	OoFdm6RdaPKRWVByKZPcnPQJAm9KPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104401

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-release 20.24.2
-Update compatibility docs
-fix ResourceWarning on process exit (#2472)
-added scripts in tasks directory to sdist on build (#2610)
-Bump wheel 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.24.2.bb => python3-virtualenv_20.24.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.24.2.bb => python3-virtualenv_20.24.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.24.2.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.24.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.24.2.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.24.3.bb
index 52a99ccda6..874a022f53 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.24.2.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.24.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "fd8a78f46f6b99a67b7ec5cf73f92357891a7b3a40fd97637c27f854aae3b9e0"
+SRC_URI[sha256sum] = "e5c3b4ce817b0b328af041506a2a299418c98747c4b1e68cb7527e74ced23efc"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


