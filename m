Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86ABAC47071
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:14:06 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.2653.1700122441304702721
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:14:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="139690710"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="139690710"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:13:59 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1E0BEE05A3
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:13:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 57D95CF7E7
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:13:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 90EE02007910F;
	Thu, 16 Nov 2023 17:13:55 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eth-typing: upgrade 3.5.1 -> 3.5.2
Date: Thu, 16 Nov 2023 16:13:20 +0800
Message-Id: <1700122400-21965-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28000.003
X-TMASE-Result: 10-1.308400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrHo5fF1EYvHye1/1pJK7Uy76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Cu2GmdldmiUGAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7yEp
	FlyY9Bposp8V7MbYqGksqIdXiCCkb9M7xsZ8keMnCBQC13iEwgm6H18M32/gQfYjCJ6gZwUajk0
	5AubSjvvvr88itYxpaCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:14:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106787

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Update network chain ids

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-eth-typing_3.5.1.bb => python3-eth-typing_3.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-typing_3.5.1.bb => python3-eth-typing_3.5.2.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-typing_3.5.1.bb b/meta-python/recipes-devtools/python/python3-eth-typing_3.5.2.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-eth-typing_3.5.1.bb
rename to meta-python/recipes-devtools/python/python3-eth-typing_3.5.2.bb
index 3723b1931..c8044b389 100644
--- a/meta-python/recipes-devtools/python/python3-eth-typing_3.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-typing_3.5.2.bb
@@ -4,6 +4,6 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d7bdfe69b1ffbde073ca6e96f5c53f7"
 
-SRC_URI[sha256sum] = "e21a8b0688581a6765f72fa184d86d06c3949e354d4af5293798abc0b4255989"
+SRC_URI[sha256sum] = "22bf051ddfaa35ff827c30090de167e5c5b8cc6d343f7f35c9b1c7553f6ab64d"
 
 inherit pypi setuptools3
-- 
2.34.1


