Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15D4C7EE2A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 02:57:49 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.4001.1685674665869831758
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jun 2023 19:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="119072883"
X-IronPort-AV: E=Sophos;i="6.00,211,1681138800"; 
   d="scan'208";a="119072883"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 11:57:43 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 33D75DDC61
	for <openembedded-devel@lists.openembedded.org>; Fri,  2 Jun 2023 11:57:41 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 68F94D9A88
	for <openembedded-devel@lists.openembedded.org>; Fri,  2 Jun 2023 11:57:40 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id EF2512007AA8C;
	Fri,  2 Jun 2023 11:57:39 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] dnf-plugins: modify suffix of spdx file.
Date: Fri,  2 Jun 2023 10:57:34 +0800
Message-Id: <1685674654-2935-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27666.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27666.004
X-TMASE-Result: 10-1.401900-10.000000
X-TMASE-MatchedRID: edu/gVuQyeBaQiLka9EcSk7nLUqYrlslFIuBIWrdOeOU8ftiyKjZrXlb
	NLJMhGktgZBEjCNOXeKh78oNWbMU33WJWjhMuBwcDlgxb8s+r0AtZ7x3AA+yiwIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltsYlDcGKIsCCC24oEZ6SpSmcfuxsiY4QFJ2XP4EXe59bVMUbXgJFYAYsRg
	nQrZroZ4JHr3+BPRZYBJyXWEdZujKzN/6x+udRGD6pEci2SF+W9HQ1p1uFEBl793GDUy71Rex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Jun 2023 02:57:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103092

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
index ca2b20108a..94023922a2 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ubinux/dnf-plugin-tui.git;branch=master;protocol=https"
-SRCREV = "8d21f52577aa03958732a5a346a678c699e98cb6"
+SRCREV = "83917a3935ac7ce1d8d96e914d96a6679319a336"
 PV = "1.3"
 
 SRC_URI:append:class-target = " file://oe-remote.repo.sample"
-- 
2.34.1


