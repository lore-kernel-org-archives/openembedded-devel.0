Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5E0C43334
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 06:59:56 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.38595.1656313186682137356
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jun 2022 23:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pXtwC1/B;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656313184; i=@fujitsu.com;
	bh=N7NlT5sZ9EtitIN6XTcjJu5mCFZZuMik3vAKtwCSEx0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pXtwC1/BGj68K8m2bV/mI2FT81SbTraBfPgtX1Y2kzC/7pDNZ9+pNJSZTaqs9wHWn
	 4Jk6WvL8ZuXbdxW2PLOJvzyGv8NZe2HR0tjtDzkw7mP1YJM8DqWwO4lYrn96V3JUvG
	 ch7Ie82aElqQcHBIiebGB93AnJhNI8zNnPV+byeqJObusgJrPDmS+/gL19c8O4NnBP
	 AMDrfHo90SSBQ1HdbcahuWT1lTCsEsOAALiZHb4Ag6taghiCrYw6m+goaHXwVzOoEA
	 kSE669D47JlxOmstiGVcUlr16buKWs+uvtpmO0mmpcAAZ9bpZaz52fDqfnvuu9g6+m
	 VnRZZcOIQ6Esg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBIsWRWlGSWpSXmKPExsViZ8MxSTchdGe
  SwcsX4hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8atdwEF/zkrPq3pZG9gfMXRxcjFISTwhFHi
  5aWH7BDOdSaJe62vWCGcPYwS97saWboYOTnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHH
  cQWFnCWmDn5MZDNwcEioCpx+bc0iMkr4CTR+zIDpEJCQEFiysP3YJ2cQNUvJj4FqxYCKtn10A
  gkzCsgKHFy5hMWiOESEgdfvGCGaFWUmH25mQXCrpCYMWMbG4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjbVJRZnpGSW5iZo6uoYGBrqGhKZA21jUyNNNLrNJN1Est1c3LLyrJ0DXUSywv1kstLtYr
  rsxNzknRy0st2cQIDOKU4vQbOxh37fuld4hRkoNJSZT3lNrOJCG+pPyUyozE4oz4otKc1OJDj
  DIcHEoSvFYhQDnBotT01Iq0zBxgRMGkJTh4lER427yB0rzFBYm5xZnpEKlTjPYcV69c2cvMMX
  X2v/3MHMvB5MyvbQeYhVjy8vNSpcR5dwcBtQmAtGWU5sENhSWAS4yyUsK8jAwMDEI8BalFuZk
  lqPKvGMU5GJWEedlAbuPJzCuB2/0K6CwmoLP8Ju4AOaskESEl1cDE+uO4cVzRy9c3H3Dc5tv7
  zHOZfH+n6g3G61rTzBRz2w+dcLuexXve/FZIgnngn6z+5qp90lVi8rLbNyXLCx5OSXx21Dv9t
  Kz629mejzjNThoaCt8NKFidn3RZMH/rzj7VomVvlZf5qhg3+Ku7dFQ993hioP/0mrL25v2+mx
  4/eiqxqqH5xaLAytAY/syJ5TPvzsuMbHOYZhJqW+Wkvv3EBIVZxXqy54Q8PuTb9Xefy9s3eZH
  HoiqbxT06v3e8tFJf+LG66tAr/ef7q42a+9c9yJjZVlNczhHesk7pc/yuhpcKLZbHozb3CAkl
  vonN3y935f/MhsVRP/5OF3maORMY+2ttn2upZtbs/bBRR4mlOCPRUIu5qDgRAJDcJk97AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-745.messagelabs.com!1656313183!150813!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8829 invoked from network); 27 Jun 2022 06:59:44 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jun 2022 06:59:44 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C2C0F1000E7
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 07:59:43 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id BD05C1000CC
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 07:59:43 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 27 Jun 2022 07:59:42 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libwacom: upgrade 2.2.0 -> 2.3.0
Date: Mon, 27 Jun 2022 14:59:20 +0800
Message-ID: <1656313160-23805-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656313160-23805-1-git-send-email-wangmy@fujitsu.com>
References: <1656313160-23805-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jun 2022 06:59:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97594

Changelog:
============
- New Devices:
  - Acer Chromebook Spin 13
  - Huion HS611
  - Lenovo 14s Yoga, X13 Yoga, X1 Yoga, X380
  - Samsung Galaxy Book Pro 360, Flex2
- Devices matching a "* Keyboard" glob are no longer treated as tablets

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libwacom/{libwacom_2.2.0.bb => libwacom_2.3.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/libwacom/{libwacom_2.2.0.bb => libwacom_2.3.0.bb} (93%)

diff --git a/meta-gnome/recipes-support/libwacom/libwacom_2.2.0.bb b/meta-gnome/recipes-support/libwacom/libwacom_2.3.0.bb
similarity index 93%
rename from meta-gnome/recipes-support/libwacom/libwacom_2.2.0.bb
rename to meta-gnome/recipes-support/libwacom/libwacom_2.3.0.bb
index 78f5a289c..41d8c6242 100644
--- a/meta-gnome/recipes-support/libwacom/libwacom_2.2.0.bb
+++ b/meta-gnome/recipes-support/libwacom/libwacom_2.3.0.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=40a21fffb367c82f39fd91a3b137c36e"
 
 SRC_URI = "git://github.com/linuxwacom/libwacom.git;branch=master;protocol=https"
-SRCREV = "be485deca03157b0dbd702c7acaf35b71378be9e"
+SRCREV = "b88053851ef81694b9e3927e0857f0f02ff9a8a8"
 
 DEPENDS = " \
     libxml2-native \
-- 
2.25.1


