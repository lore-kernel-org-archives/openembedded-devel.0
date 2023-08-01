Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEDAC04FE2
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:18 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.7633.1690875734649116257
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="105920431"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="105920431"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:13 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 25288E8520
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:10 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6BCAAD3F16
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:09 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id F085310232;
	Tue,  1 Aug 2023 16:42:08 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libio-compress-perl: upgrade 2.204 -> 2.206
Date: Tue,  1 Aug 2023 15:41:28 +0800
Message-Id: <1690875717-21608-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10-0.964400-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mr4DQaWAxrUs4R34ro7k23nfjA
	2IXz2gxc1jypNY0wtaZIwYLI7vs59hNXpI2Q1yfbqhcdnP91eXGoY3JCxWmLzG8qkAZEGNxvvqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgAmWvXEqQTm5OxWg7dD4d3gGp0
	VGMd0huLF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLOBEUbmTBYzxkaY0
	d7BmW8c+crANWE/i8NJ+d9Nm8h7DqAv3ex6KqAHpF6dtB0reWAL+Jyi4oATn9lHbwbVnrBP2ZpI
	pCyMJ5qIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104169

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Merge branch 'master' of https://github.com/pmqs/IO-Compress
* Merge pull request #50 from haarg/fix-version-check
* fix version checks to use correct method
* drop rt.cpan from SUPPORT section
* add perl 5.38
* add on workflow_dispatch
* Add some OO examples

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ibio-compress-perl_2.204.bb => libio-compress-perl_2.206.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-compress-perl_2.204.bb => libio-compress-perl_2.206.bb} (92%)

diff --git a/meta-perl/recipes-perl/libio/libio-compress-perl_2.204.bb b/meta-perl/recipes-perl/libio/libio-compress-perl_2.206.bb
similarity index 92%
rename from meta-perl/recipes-perl/libio/libio-compress-perl_2.204.bb
rename to meta-perl/recipes-perl/libio/libio-compress-perl_2.206.bb
index 8d4aec709e..c58e3fa30c 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-perl_2.204.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-perl_2.206.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=8e78b88f9c8ac08ae03
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "617784cb8543778681341b18fc67b74735e8b494f32f00814dd22f68ac6af018"
+SRC_URI[sha256sum] = "7d3062b9a494f757e8d0614f220d83f22731bbda1aeb5f7cff0e72a83f433d35"
 
 S = "${WORKDIR}/IO-Compress-${PV}"
 
-- 
2.34.1


