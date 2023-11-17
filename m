Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A39BEC197A0
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 06:50:01 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.6628.1700203791465274979
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 22:49:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="119375179"
X-IronPort-AV: E=Sophos;i="6.04,206,1695654000"; 
   d="scan'208";a="119375179"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 15:49:48 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7CDB1D64B1
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 15:49:46 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id AC797D88D2
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 15:49:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 57FC42FC174A;
	Fri, 17 Nov 2023 15:49:44 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] imlib2: delete non-existent file
Date: Fri, 17 Nov 2023 14:49:11 +0800
Message-Id: <1700203751-30723-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28002.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28002.004
X-TMASE-Result: 10-0.626100-10.000000
X-TMASE-MatchedRID: LQTCmOBQxsnHt8FegNoXIfLeH1FBnhK0wTlc9CcHMZerwqxtE531VNnf
	JrUSEbFDu+U+TVUiqnWAMuqetGVetiVvu9chHp+mavP8b9lJtWr6C0ePs7A07Q2y0JeZ/zsc6Fa
	ZYpXGK2DzbEKG9GVE/3s6FQO0FWhrl1ivJvjpR6Fy7tNyLyIc0BCQcn+vLk2XsenC85dLpQnYLk
	/lrdRQxHsLGOMiJ6iL8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 06:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106849

From: Wang Mingyu <wangmy@fujitsu.com>

/usr/bin/imlib2-config was deleted from upstream, so delete it from bb
file.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
index ceb14301e..113b8666a 100644
--- a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
+++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
@@ -36,6 +36,3 @@ PACKAGES =+ "${BPN}-loaders ${BPN}-filters ${BPN}-data"
 FILES:${PN}-data = "${datadir}"
 FILES:imlib2-loaders = "${libdir}/imlib2/loaders/*.so"
 FILES:imlib2-filters = "${libdir}/imlib2/filters/*.so"
-
-inherit multilib_script
-MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/imlib2-config"
-- 
2.34.1


