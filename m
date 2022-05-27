Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A77C433F5
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 01:41:45 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.2764.1653615699410063391
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 18:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ixsnp0yq;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653615697; i=@fujitsu.com;
	bh=jbK+1Fzy0fpeuDX4PlW3XnWGhz+V6EH3QF6C9Yyz4UI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ixsnp0yqyKDcHv+wOd8rflTGioTRXVhedlrPBNFIDfiK73Serq3bTDlgGNJ+53Yky
	 wu4YGw3CPdsw6jj3kCvwOLwNSvnswxi47QojcI1lM0VTiHdq34a6Pqh962XihaO63I
	 pZ3IwWrxrYAVzoCBjV7Z83imraxPx4KmUH0Qn3pbGwx8zEvXcrB1CWaZDPfBr8Z7vM
	 o7TjUUMPnEriWpylWVlDrauSAa9QpOy4AGb+yvVnj8PldFwCPq5yaoifmL579EJs+L
	 uvSmjg/L4oalLAD6bkDgDTL3YcFDUD+zCCxfVrq8G601iAlM822f9w9t/Qs/m0Zo0M
	 DcjRaX7R1YxTA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRWlGSWpSXmKPExsViZ8MxSTdAZ0K
  SwYMLNhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bXFT9ZCn5yVuxq3sPcwDiLs4uRi0NI4Amj
  xO7HT1khnAtMEqufrWSEcA4wSjSfeweU4eRgE9CVePFjMQuILSKgL7F09h5mEFtYIEhiwqtfj
  CA2i4CqxJ8rE9hAbF4Bd4muZceYQGwJAQWJKQ/fM0PEBSVOznwCNodZQELi4IsXQHEOoBpFid
  nT5SHKKyReH77EDGGrSVw9t4l5AiPfLCTds5B0L2BkWsVolVSUmZ5RkpuYmaNraGCga2hoqgs
  kjYz1Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L08lJLNjECgy+lmKF6B+P/3p96hxgl
  OZiURHkz7/UnCfEl5adUZiQWZ8QXleakFh9ilOHgUJLg3aI1IUlIsCg1PbUiLTMHGAkwaQkOH
  iURXiUZoDRvcUFibnFmOkTqFKOilDivD0ifAEgiozQPrg0WfZcYZaWEeRkZGBiEeApSi3IzS1
  DlXzGKczAqCfM+1QSawpOZVwI3/RXQYiagxfm8vSCLSxIRUlINTHzH47bPnJq6a4aDTrT2qs2
  f+xy2WjfpZq6LFppwwW3m6lBb+Y/bzbcxhPCqL+1aVlWcP6U76tdSJtVptey+xh0zalQbv6yd
  8iWx1UevY1E1I+P+2BWbdj+O0GY3ZZtw+WV+27qd1T1atz4dU8/cfUm9QpN35aTvjrs7uAq+L
  bto3HTu8ca+v8pH2pdceM+xgd9ZKD328Wqh3zwrVvwMzvOYrG/GeuiN6oXPxwK3JEtemb6rvC
  B7Zhiz+rJvx3V/dj4qnPx35tKnbY6MRxe45zi5PL+m+v1mtWgmg/9X9ttbtbkPxRQs/nFs389
  6RubnZYVdq1jYllt67vLvTE80LNxq++385rC2oPC9FjcfzVJiKc5INNRiLipOBABaPtS0OQMA
  AA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-591.messagelabs.com!1653615696!20822!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27860 invoked from network); 27 May 2022 01:41:36 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 May 2022 01:41:36 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 90C441000D2
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:41:36 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 82FFC100457
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:41:36 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 27 May 2022 02:41:21 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pychromecast: upgrade 12.1.1 ->
 12.1.2
Date: Fri, 27 May 2022 09:40:49 +0800
Message-ID: <1653615649-2593-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 01:41:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97301

Changelog:
=========
Add some additional cast types (#622)
Format some code (#621)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...n3-pychromecast_12.1.1.bb => python3-pychromecast_12.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_12.1.1.bb => python3-pychromecast_12.1.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_12.1.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_12.1.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pychromecast_12.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_12.1.2.bb
index b34c78eb8..c8686ab52 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_12.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_12.1.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "9545a22acdadc96603f76d7878c6ea17baf1328260cf560c887c8c12aad4c82c"
+SRC_URI[sha256sum] = "6be626e5ba2f6ffaefbc13ddced84e8b60a9ef1b012f71039fc0f7a0bcb4bda6"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.25.1


