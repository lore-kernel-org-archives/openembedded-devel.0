Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20459C47079
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:26:45 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.6385.1704720399206166793
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:26:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="147085497"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="147085497"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:26:36 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B46FD9D8F
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:26:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B9460D6458
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:26:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B0ED6895A
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:26:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F3CFB1A0072;
	Mon,  8 Jan 2024 21:26:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libsass: upgrade 3.6.5 -> 3.6.6
Date: Mon,  8 Jan 2024 21:26:08 +0800
Message-Id: <1704720368-30123-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10-0.849200-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yfx0ykrbAxjCTuTuK1t9kbyymM9QmkunML8F
	Hrw7frluf146W0iUu2sSuJRtSU84o3gcxJAgqZ0ZaDCzqDR7DPauLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iUoTQl7wNH8Pg1fA1QHegDv3QfwsVk0UbvqwGfCk7KUs/B8BrG5mTNVCTA6kBNUbtF1Ge
	sMwtcPZGS/CZMgrwrJciM41/TAwFnkTUC3ydm1U7vxcZFfT7/OLSRg7uU7vqewfe+ClUufWYgep
	pQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:26:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108139

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/sass/libsass_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/sass/libsass_git.bb b/meta-oe/recipes-support/sass/libsass_git.bb
index 4d709fc52..f0824944b 100644
--- a/meta-oe/recipes-support/sass/libsass_git.bb
+++ b/meta-oe/recipes-support/sass/libsass_git.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8f34396ca205f5e119ee77aae91fa27d"
 inherit autotools
 
 SRC_URI = "git://github.com/sass/libsass.git;branch=master;protocol=https"
-SRCREV = "f6afdbb9288d20d1257122e71d88e53348a53af3"
-PV = "3.6.5"
+SRCREV = "7037f03fabeb2b18b5efa84403f5a6d7a990f460"
+PV = "3.6.6"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


