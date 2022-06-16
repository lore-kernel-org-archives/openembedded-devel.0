Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457E0CCA473
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 01:36:40 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web09.12981.1655343396492227832
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jun 2022 18:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FaXyHDYz;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655343394; i=@fujitsu.com;
	bh=SCzax+qD0JZhzxAglFTC76YBF2+RlXylloiVxUvVxZ0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=FaXyHDYzwF8Ag1AJIAzNAexOok8SVr079sOFycSyzEvuNJf/zyPf3zVvfYJFwyN2V
	 EJTHGwdZeyB3T/xGDtxUEA4T7E+FSIUKRVBFqcJcHscLht0OUgNkQ7aOBlor9eh1XI
	 zrUBK93HcpATQDlrHgZLnmeNtTCbHU3iiK28g1t944INej94EdwygrKiYT4PiD8Jd9
	 AGu86zCuJ/AoNxJKXAaEmR8ywcahAVExOZQsebtEX4Be9+ccbQCINsJO/+SgdzDhcb
	 +uF6UHsU6d5/viR1aRwJ/Qk6yJHgyqF/yI3dNYDuessBtJkL/wA+IMDsyWGmnc8NDy
	 FPYhFlfUMmjhA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8MxSVexc1W
  Swblz6hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bUpkmMBRvZK578nMXcwPiErYuRk0NI4Amj
  xKs/QV2MXED2BSaJqW1t7BDOHkaJBX/nMYJUsQmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  1ADB4ewgLPEs444kDCLgKrE/QnfwMp5BZwkbmx5wwJiSwgoSEx5+J4ZIi4ocXLmExaIMRISB1
  +8YIaoUZSYfbkZqr5CYsaMbWwQtprE1XObmCcw8s9C0j4LSfsCRqZVjFZJRZnpGSW5iZk5uoY
  GBrqGhqa6hrpGBsZ6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBIZlSzHh6
  B+Omvp96hxglOZiURHl/8axKEuJLyk+pzEgszogvKs1JLT7EKMPBoSTBu6MdKCdYlJqeWpGWm
  QOMD5i0BAePkgjviTagNG9xQWJucWY6ROoUo6KUOO8GkD4BkERGaR5cGywmLzHKSgnzMjIwMA
  jxFKQW5WaWoMq/YhTnYFQS5j1TCTSFJzOvBG76K6DFTECLG/etAFlckoiQkmpgEt+1OzrnIFv
  /YY9ZDXVTr+lp3nqzdbZG3fW2p8aRPhNyax6ErKrkrRKZ3bVl1r9y91iGcLM76T28Lx6G8zOe
  VJ77+7bDNcO5me+ZWd6aWyjtimh2Wvm3v6rRqSvaNfLEF9+8TYlpE/boLvvxvUjn45dtC0NOb
  LqxfsM8g3IWgyurXFKftT17JS4Qaq+n/cDznYy6X/vhP5z2Bb/rW5/P2n/BbPf9618vx4bfi9
  nx9MCTnnc9DWybrx5bu91pWufRRzaWUpHzNKTEZ6y4GxSzwcvUwOPyA9clYda/Jy3f+1plDcP
  Z78XbV0eYbxar78vnq9pdmR3ayRl1IveYNw97+pm8W3HrGJbPybK/cFVXRomlOCPRUIu5qDgR
  AMoO/pxEAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-587.messagelabs.com!1655343393!202004!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21172 invoked from network); 16 Jun 2022 01:36:33 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Jun 2022 01:36:33 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 2801B1000C0
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jun 2022 02:36:33 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 023191000CC
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jun 2022 02:36:33 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 16 Jun 2022 02:36:30 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] dnf-plugin-tui: Added postatinstall
Date: Thu, 16 Jun 2022 09:36:17 +0800
Message-ID: <1655343377-12002-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Jun 2022 01:36:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97520

 Added postatinstall. Otherwise defined pkg_postinst could not work.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
index a82387a70..ccbea58f1 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ubinux/dnf-plugin-tui.git;branch=master;protocol=https"
-SRCREV = "7c45fd65dcd811def66161f6d572c3930f2ba4d8"
+SRCREV = "f6ee3fa8fe6f3d7ca8d5b104aa73c1a5c938a403"
 PV = "1.3"
 
 SRC_URI:append:class-target = " file://oe-remote.repo.sample"
-- 
2.25.1


