Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF33ECDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:39:59 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.116389.1698050389823711611
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:39:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="116576376"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="116576376"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:39:49 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7966BCA1E6
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:39:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id AD811D9470
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:39:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EC4E134786;
	Mon, 23 Oct 2023 17:39:43 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eth-typing: upgrade 3.4.0 -> 3.5.0
Date: Mon, 23 Oct 2023 16:39:31 +0800
Message-Id: <1698050371-25410-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10--2.279600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzrwoNVYOVcQP4Q
	R/7oUDJy4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2RV17CFfZYAB1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO3x/F
	0UMEoTu6zxgqnMaaaljMovtnneigbxL2wpBR+hzFnmuv0sHvv/7h0r7nn37LgrOTUc3Rg+p18U0
	2izDA/FedROe/jSHuX/1AQc8glRB/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105661

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Add script to maintain Network constants listed in the networks module.
Add types-setuptools to support pkg_resources and __version__

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-eth-typing_3.4.0.bb => python3-eth-typing_3.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-typing_3.4.0.bb => python3-eth-typing_3.5.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-typing_3.4.0.bb b/meta-python/recipes-devtools/python/python3-eth-typing_3.5.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-eth-typing_3.4.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-typing_3.5.0.bb
index a1594fbf54..6a8bec7a54 100644
--- a/meta-python/recipes-devtools/python/python3-eth-typing_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-typing_3.5.0.bb
@@ -4,6 +4,6 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d7bdfe69b1ffbde073ca6e96f5c53f7"
 
-SRC_URI[sha256sum] = "7f49610469811ee97ac43eaf6baa294778ce74042d41e61ecf22e5ebe385590f"
+SRC_URI[sha256sum] = "a92f6896896752143a4704c57441eedf7b1f65d5df4b1c20cb802bb4aa602d7e"
 
 inherit pypi setuptools3
-- 
2.34.1


