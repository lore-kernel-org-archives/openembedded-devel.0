Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A89C433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 09:02:23 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.29792.1652086935734425023
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 02:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MWq0BKe/;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652086934; i=@fujitsu.com;
	bh=jpIvr0LHazqFgPU1JaNB0Aknsu+O5m+Jrf2WVuwL7Dk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=MWq0BKe/39B0/3xs0fm3iKTbn0BOvSDf1rsHNU777r3qdX/Hsbrz405SoQi69m0tQ
	 4AYEH/3g5vhzJdIabpgkhmkfJZD+MiCqzN+9Ildniz9lC+fmwQ0JVnW7vvsck66yxa
	 /kVVqfmQ43il3ix7Bvz0POJM/gfeYGDUXPTqGtjtGSn9uyR5QBjwL2OLEkQihRiEVA
	 RnwFtW8BM59XULHf4RxFNAY3DXWHf9A6NtH//9Oy0K3mA0XNscmlpI53H1K2H9Bq8T
	 iMahYPnQXTgnaFHNtVADYmhhu3w1DVGn0AsbzUxJBEAK5shZPUxY9gTH9n9D2SXeGT
	 oC714aU6tw/6Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRWlGSWpSXmKPExsViZ8ORqDv1RkW
  SwerjhhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a1yaeZCvZyVExr3srUwHiZvYuRi0NI4Amj
  xJdvqxkhnAtMEq8X72TuYuQEcvYzSnS/Ygex2QR0JV78WMwCYosI6Essnb0HrEZYwFxi//O9Y
  HEWARWJ7y+OMYHYvALuEh1n+8BqJAQUJKY8fM8MEReUODnzCVg9s4CExMEXL4DiHEA1ihKzp8
  tDlFdIvD58CapVTeLquU3MExj5ZiHpnoWkewEj0ypGu6SizPSMktzEzBxdQwMDXUNDU11zIGV
  mppdYpZuol1qqm5yaV1KUCJTWSywv1kstLtYrrsxNzknRy0st2cQIDMGUYrdlOxj39f3UO8Qo
  ycGkJMq7/mpFkhBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3o8gOcGi1PTUirTMHGA8wKQlOHiUR
  Hi7QNK8xQWJucWZ6RCpU4yKUuK8ideBEgIgiYzSPLg2WAxeYpSVEuZlZGBgEOIpSC3KzSxBlX
  /FKM7BqCTMGw4yhSczrwRu+iugxUxAiz8GlIIsLklESEk1MC2avOasnteD72++zciwYdW75LF
  LRL/QR/XgYiXDhE+Pw5eIH76bZjWTbaX0oR61LfwRvQsalogeDRAqLTDTmPT828NKa5VbERGr
  5y2aqvo6eF/DPOtb2Y/492en87/Y+XOl8J400c6seDl/rducE+bvDY1h/Raoty5aM84/+Py9F
  vNVM77+bPfbypW0/s2hPTu0fi5dpL98wXKeTZYsrTN7Iv4+u3tl+up1Thd9rB5Yrni7RMZN8/
  pfjeXG+r4TfP4+ua/9/LCE8Tsn47uxeStaxIWV9rIaSNp17XrQK7/Br/9cn+lsebnsitS/EuL
  3rtctN45yv5Qy6dmSi+K5T80/todWms7bdoVHvqDj/VklluKMREMt5qLiRADviayvPAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-545.messagelabs.com!1652086933!252134!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8346 invoked from network); 9 May 2022 09:02:13 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 09:02:13 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3BE9810019F
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 10:02:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2802B100196
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 10:02:13 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 10:02:10 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] mbw: upgrade 1.4 -> 1.5
Date: Mon, 9 May 2022 17:02:02 +0800
Message-ID: <1652086922-2820-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 09:02:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97018

License-Update: Version of mbw updated to 1.5

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-benchmark/mbw/mbw_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-benchmark/mbw/mbw_git.bb b/meta-oe/recipes-benchmark/mbw/mbw_git.bb
index 52b939950..cfdcfeb9b 100644
--- a/meta-oe/recipes-benchmark/mbw/mbw_git.bb
+++ b/meta-oe/recipes-benchmark/mbw/mbw_git.bb
@@ -2,13 +2,13 @@ SUMMARY = "MBW determines the copy memory bandwidth available to userspace progr
 HOMEPAGE = "http://github.com/raas/mbw"
 SECTION = "console/tests"
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://mbw.spec;beginline=1;endline=10;md5=bbb77813272134a5c461f71abe945bef"
+LIC_FILES_CHKSUM = "file://mbw.spec;beginline=1;endline=10;md5=34d71e08e6337a8411d82d7dd0c54fe2"
 
 SRC_URI = "git://github.com/raas/${BPN}.git;branch=master;protocol=https"
 
-SRCREV = "2a15026ff65160127204881263464b1740a57198"
+SRCREV = "d2cd3d36c353fee578f752c4e65a8c1efcee002c"
 
-PV = "1.4+git${SRCPV}"
+PV = "1.5"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


