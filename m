Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F02C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 03:43:22 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.114303.1699501391977436816
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 19:43:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="118434327"
X-IronPort-AV: E=Sophos;i="6.03,288,1694703600"; 
   d="scan'208";a="118434327"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 12:43:09 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 433CFD64AD
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 12:43:07 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 66356D9470
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 12:43:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2ED7F88193;
	Thu,  9 Nov 2023 12:43:05 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] dnf-plugin-tui: Recover BBCLASSEXTEND variants
Date: Thu,  9 Nov 2023 11:42:33 +0800
Message-Id: <1699501353-15757-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27986.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27986.002
X-TMASE-Result: 10--1.589000-10.000000
X-TMASE-MatchedRID: CU7qri9lc2NS0bd+i8J5ed5x7RpGJf1aYjDXdM/x2VP+Aw16GgqpO+xl
	/JBXgQ0mgwnjjN8Rx/vGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BUENBIMyKD0Zsoi2XrUn/Js98
	n9dYnJNNQSFbL1bvQASdET58jp62SmwG9/2g66Q47Tun3ApISnJNV/HKuPVvOyMJbFSdBxJSieX
	+nZO89JiNSDiNUj0r7SF9kATfPl3uhMeuiTJAw37LCMDqW5iQIS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 03:43:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106491

From: Wang Mingyu <wangmy@fujitsu.com>

dnf-plugin-tui must work on nativesdk environment.
Now there's no warning when run the command "bitbake universe -c fetch".

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
index a5d614961a..8db456b99c 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
@@ -42,4 +42,6 @@ RDEPENDS:${PN} += " \
     dnf \
     libnewt-python \
 "
+BBCLASSEXTEND = "nativesdk"
+
 SKIP_RECIPE[dnf-plugin-tui] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
-- 
2.34.1


