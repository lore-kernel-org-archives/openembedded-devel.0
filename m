Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D64C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 05:35:02 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.115406.1699508098084537481
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 21:34:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="139055804"
X-IronPort-AV: E=Sophos;i="6.03,288,1694703600"; 
   d="scan'208";a="139055804"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 14:34:55 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6159DD618B
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 14:34:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A65F6D5EAE
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 14:34:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CE0D220050183;
	Thu,  9 Nov 2023 14:34:51 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.31.6 -> 2.32.0
Date: Thu,  9 Nov 2023 13:33:46 +0800
Message-Id: <1699508026-16894-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27986.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27986.002
X-TMASE-Result: 10--0.853600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysSbH8JSFFXQaHM
	vzTTlj3I4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2RV17CFfZYAB1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0JC+
	VZi2gQEY0tCI5T27m2CvwTMwCaeSr3aj9sYK6y2F7bYulvXuse0dDx3bqLxCyMflAbcUsbbN0vS
	3ZAy1Eoo2H+iSXXQO2lgAVLa1QArfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 05:35:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106502

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix bug:Pin pillow below v10.1 to avoid breaking changes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imageio_2.31.6.bb => python3-imageio_2.32.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.31.6.bb => python3-imageio_2.32.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.31.6.bb b/meta-python/recipes-devtools/python/python3-imageio_2.32.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.31.6.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.32.0.bb
index b471275aa..fa0c4b591 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.31.6.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.32.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "721f238896a9a99a77b73f06f42fc235d477d5d378cdf34dd0bee1e408b4742c"
+SRC_URI[sha256sum] = "e425ad36c605308d9ea6d93eda7b0987926059b8b86220e142a599a7975128dd"
 
 inherit pypi setuptools3
 
-- 
2.34.1


