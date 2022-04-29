Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB67C4332F
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:22:43 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.29557.1652084557933445940
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=N16wZZIG;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652084556; i=@fujitsu.com;
	bh=B9/K/f5nvOS+pQCeMLUmXKZnoOlkUkG1XJyTwvJmpiE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=N16wZZIGLq8Ji4R7UWCu4keVwUvV42lcsRr4L4HgbP9ZS7Etn3sXkd567/KzMXMcC
	 ZtKAjIDidokwteaDF0kFdBt68xGmiFGDwgEal9Zly6ad2NY8pQrlc2MBVWQwW6Wqwe
	 owIvCAFqxKWPLSUoY0MYJc4sFq9r2JWZQMkyqrrZnaVKHyWZ/T07DPBu4z/oLNnGBE
	 6cwqrLk43jYo8amooGa7Cctb9NR3sFTg7Fa5pFZ4kUCDoKrhHtpBQONCE0vcnoymhw
	 +PtqRNarADTBJ8kzpcr/vbN8gfD1udbcDwE2WMTWTUQ8uIjXKEvOS7Eh8PSq8f3f5t
	 mzP73SbU8QYEg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRWlGSWpSXmKPExsViZ8ORqOt9viL
  JoPelksXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrFg0lXWgknsFVseuTYwbmXrYuTiEBJ4wijR
  v34mK4RzgUni/fRHTBDObkaJLZc/A2U4OdgE1CSm37oBZosI6Essnb2HGcRmFlCRePG7h72Lk
  YNDWMBGoutkLEiYRUBV4tznBWwgYV4BJ4m1n7RAwhICChJTHr4H6+QUcJZYP/EXG4gtBFTy48
  ctMJtXQFDi5MwnLBDTJSQOvnjBDNGrKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo11SUWZ6RkluYmaOrqGBga6hoamumZmukZGFXmKVbqJeaqlucmpeSVEiUFovsbxYL7W4
  WK+4Mjc5J0UvL7VkEyMwkFOKnZ7sYHzd91PvEKMkB5OSKG9lU0WSEF9SfkplRmJxRnxRaU5q8
  SFGGQ4OJQleh1NAOcGi1PTUirTMHGBUwaQlOHiURHjvngBK8xYXJOYWZ6ZDpE4xWnLcXbh3Lz
  PH1StXgOQNECnEkpeflyolzvv9LFCDAEhDRmke3DhY5F9ilJUS5mVkYGAQ4ilILcrNLEGVf8U
  ozsGoJMxbBzKFJzOvBG7rK6CDmIAO+hhQCnJQSSJCSqqByVS255DM1tD8BKVuLv3P4hxfrq57
  GFl0L/VvzTKGMoeApW1x5itreh5999sxbfGy2Dv275KVLa9fUN9SqCDtfGwSezWXXln5tit3T
  VdcqH1krZzf0hLqaOfvx6W2Kmb3lxJGk23z50yeeffO97fS7+bej1olpKznfHah55O13BH1zP
  cWPN+57/5iRcFHatt0pPyjXt3YUyy9gGdKy7XjO/Td9vzQfrFTf+ns1Kpti69LWt3xeBw3c9U
  +fbE9TZtiN6Y2NZh3Pas6VrpvS+EzLr396imh9+tYup/FTS/jy+z7wb7n/Y5PKm+zP79h+Prv
  bdedFqXdE7hcWjRflrurt+Ts+Lt4/sHUqzZ3NborBJRYijMSDbWYi4oTAZ6JRih3AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-545.messagelabs.com!1652084555!458872!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23901 invoked from network); 9 May 2022 08:22:35 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:22:35 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E1167100193
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:22:34 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id AF45410004E
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:22:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:22:14 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] htop: upgrade 3.1.2 -> 3.2.0
Date: Fri, 29 Apr 2022 16:02:58 +0800
Message-ID: <1651219381-27379-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651219381-27379-1-git-send-email-wangmy@fujitsu.com>
References: <1651219381-27379-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:22:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96995

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/htop/{htop_3.1.2.bb => htop_3.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/htop/{htop_3.1.2.bb => htop_3.2.0.bb} (96%)

diff --git a/meta-oe/recipes-support/htop/htop_3.1.2.bb b/meta-oe/recipes-support/htop/htop_3.2.0.bb
similarity index 96%
rename from meta-oe/recipes-support/htop/htop_3.1.2.bb
rename to meta-oe/recipes-support/htop/htop_3.2.0.bb
index 4fe70982a..12b110ead 100644
--- a/meta-oe/recipes-support/htop/htop_3.1.2.bb
+++ b/meta-oe/recipes-support/htop/htop_3.2.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "ncurses"
 SRC_URI = "git://github.com/htop-dev/htop.git;branch=main;protocol=https \
            file://0001-Use-pkg-config.patch \
 "
-SRCREV = "d73783d6dbec4a8d9d20d744bf2b5e6a7073aa46"
+SRCREV = "c7413fd6771b65388bea14ef42863444c6eaa419"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


