Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D5EC433F5
	for <webhook@archiver.kernel.org>; Sun,  9 Oct 2022 00:34:06 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web12.9434.1665275638897637749
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Oct 2022 17:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yHLVw9Ku;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665275637; i=@fujitsu.com;
	bh=hVc+ftPPO75LCvEH5Jv+itFsRui7vivAwFG3s2FMe04=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=yHLVw9KuDpalQ2hCUwmaIA0EG3Qtgk/B/NICL6criphf80Ika59YbgwESqWk7ndkA
	 o4j09Td3G3N/JGVO7uiedLoKJk8Rfm1rUl6Vka+1pnKQmZpFcjzz732Q94R0NCwwCf
	 hn+LIdr6P3F4erLy9ZDQYOI7rnMpPXgom+CjNvfBiRzViE84kPTBjps+oj4cUZ4DGK
	 +Vzfd4H2UEaoxn6ngIlMMTCTJmhQX5v79tEqn+Wnp8pE8h5Kdy1XSVXxR5WBiFL1Li
	 GR2Mq0UQngQj92fhjups/1UeM5lZYlz8NvXvrqLzi9isWfjc5bl0ZVDkBiWK6cuLZ1
	 utU27hMzXm30g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRWlGSWpSXmKPExsViZ8ORpPtZzCn
  Z4OFhE4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePJXZmC/+wVE1o+sTQwrmTvYuTkEBJ4yCgx
  rVe3i5ELyL7CJPH3yzE2iMRuRonmbwIgNpuAmsT0WzdYQWwRAX2JpbP3MIPYzAIqEi9+94ANE
  hawk1j5eQMTiM0CFJ/euRAozsHBK+AkcedmKEhYQkBBYsrD92CtnALOEp1PpzGClAgBlfxe7g
  8S5hUQlDg58wkLxHQJiYMvXjBDtCpKzL7czAJhV0jMmtXGBGGrSVw9t4l5AqPgLCTts5C0L2B
  kWsVonVSUmZ5RkpuYmaNraGCga2hoqmtsoWtkaKSXWKWbqJdaqlueWlyiC+SWF+ulFhfrFVfm
  Juek6OWllmxiBIZvSrHalR2Me1b91DvEKMnBpCTK+3SrQ7IQX1J+SmVGYnFGfFFpTmrxIUYZD
  g4lCV4ndqdkIcGi1PTUirTMHGAswaQlOHiURHjD/jkmC/EWFyTmFmemQ6ROMVpyTJ39bz8zx3
  IwOfNr2wFmIZa8/LxUKXHeWGGgeQIgDRmleXDjYPF+iVFWSpiXkYGBQYinILUoN7MEVf4Vozg
  Ho5Iw7wcBoCk8mXklcFtfAR3EBHSQ1UM7kINKEhFSUg1Ma3gCg5+/5VSqKFj2vazB9rENU8iT
  vec3Kp+f+SjeMW9l1LTEIxvk9t665vKPN3ZGk35NW6b122k8O2+WCWzkv9/Jk71kyqYtuy6lz
  z60LazeS8o+hP3uPz/BzMWBV9iUP1nembyDu/jAyz6pHVPeCzBJqipp5b8ye/rBPzm4+sc9Vr
  VLc5d5RAvtOvL1z/x7H3bN8Nr0xeS6yomM4J3messjVBfGWq0qYxTc3CbadNwhx0hIeuam9+u
  ib8aZrewPfyC+eoVgiV+Of7u4VuCfVzZslg+4TEUTPwWL7gmLviRsXLzM8/SRNRVLuxR1l1qJ
  q5XkV8ZPZD3ibBkjFdj6Tsj2zMnQ2UsXxjsqVbEpsRRnJBpqMRcVJwIA4uKnW3IDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-571.messagelabs.com!1665275635!119047!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18423 invoked from network); 9 Oct 2022 00:33:55 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-16.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Oct 2022 00:33:55 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 8EA591AC
	for <openembedded-devel@lists.openembedded.org>;
 Sun,  9 Oct 2022 01:33:55 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 8356E1AB
	for <openembedded-devel@lists.openembedded.org>;
 Sun,  9 Oct 2022 01:33:55 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 9 Oct 2022 01:33:54 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hwdata: upgrade 0.362 -> 0.363
Date: Sun, 9 Oct 2022 08:33:23 +0800
Message-ID: <1665275606-29112-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665275606-29112-1-git-send-email-wangmy@fujitsu.com>
References: <1665275606-29112-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Oct 2022 00:34:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99100

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.362.bb => hwdata_0.363.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.362.bb => hwdata_0.363.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.362.bb b/meta-oe/recipes-support/hwdata/hwdata_0.363.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.362.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.363.bb
index e408c4db5a..ddfce3f391 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.362.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.363.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "8a3647e5da0a157cbf1bff1845b0cdaf1ce1bdb0"
+SRCREV = "75df73ae53e2bb878b5dc62036679efb69210222"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
-- 
2.25.1


