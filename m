Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A4BC46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:45:04 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.1444.1705974302398988557
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:45:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="126250837"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="126250837"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:45:00 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E6D49D6189
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:44:57 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D7DAD3F29
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:44:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A7C8B2660C8
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:44:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4F4641A006A;
	Tue, 23 Jan 2024 09:44:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eth-typing: upgrade 3.5.2 -> 4.0.0
Date: Tue, 23 Jan 2024 09:44:29 +0800
Message-Id: <1705974269-25776-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.004
X-TMASE-Result: 10--2.827600-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mr8FHp8LCpZ7SwZuykSn6+/IyG
	8V1UOe4OhDLYiwcLbP19t+5pVoYOEbxNGXfew0dmqoeab9Xgz89csgu/IQFPzpTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q3cgUVP3Cp+vRCE2NlBjIjcKXqmmYTGpxiUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLNUtUtdKS7UGdvSh
	hYCc69Ej7gaXe01/EVV6NA+PiqHWoXFbj0IBF9w1XtU2oxeQw2ky8NRo+lr2Ysrea1mzb52S4xH
	IHArYHaIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:45:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108410

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Drop python 3.7 support
-Merge updates from the project template, notably: use pre-commit for linting
 and change the name of the master branch to main
-Fixed booleans in pyproject.toml and added a test for the presence of the
 eth_typing.__version__ attribute

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-eth-typing_3.5.2.bb => python3-eth-typing_4.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-typing_3.5.2.bb => python3-eth-typing_4.0.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-typing_3.5.2.bb b/meta-python/recipes-devtools/python/python3-eth-typing_4.0.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-eth-typing_3.5.2.bb
rename to meta-python/recipes-devtools/python/python3-eth-typing_4.0.0.bb
index c8044b389..3ca311db5 100644
--- a/meta-python/recipes-devtools/python/python3-eth-typing_3.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-typing_4.0.0.bb
@@ -4,6 +4,6 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d7bdfe69b1ffbde073ca6e96f5c53f7"
 
-SRC_URI[sha256sum] = "22bf051ddfaa35ff827c30090de167e5c5b8cc6d343f7f35c9b1c7553f6ab64d"
+SRC_URI[sha256sum] = "9af0b6beafbc5c2e18daf19da5f5a68315023172c4e79d149e12ad10a3d3f731"
 
 inherit pypi setuptools3
-- 
2.34.1


