Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38601C64EC4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 13:33:55 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.8973.1676122428664458739
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Feb 2023 05:33:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oxEvZmrW;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676122426; i=@fujitsu.com;
	bh=bB+RoufuKvyD3Mc91hRdA3eH4VvlxHeTQPNlm/maHl8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oxEvZmrWPqUoF+QNN3wbJxKMLUvIdXCPrXps9529oPjnvvhQbZptMTda+Udx7forb
	 UK+gmbI1ayIBaGyBOJDboIqWUEdyRP2xxBNGQ2uEaXofqld/h7qwJT23MCNAqtT69h
	 XXntiDR/OQl3eYp6GuAU0N5KTnWBl93k0p+bxM5ILzyCxWrTjLGo7ffKmK5t8J+8mW
	 3F9rjtZA/L9IBu7mbfoY/2h6NxjigDkGCIGPJHWfFrGCLXFUUCU4zkjyPAQhDVQ2yy
	 qPRuYuKDHndT1moSuItrbGWtz8Or1CJ+WSQohN0QlMC89nITM/y1xCsUA3cBVzhJqu
	 Z/V1B9xkcLgPg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8ORpGs183m
  ywd8NLBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bzzZkFp7gqet9fZ29gPMHZxcjFISTwkFFi
  zrSvLBDOVSaJzYf/MkE4exkl1lx5w9zFyMnBJiAlceP+fzYQW0RAX2Lp7D1gcWYBFYkXv3vYu
  xg5OIQF/CTWrFYGCbMIqEp07zkNVs4r4Cix6/cVJhBbQkBBYsrD98wg5ZwCThKtJzRBwkJAJd
  uPPoIqF5Q4OfMJC8R0CYmDL14wQ7QqSsy+3MwCYVdKtH74BWWrSVw9t4l5AqPgLCTts5C0L2B
  kWsVoWpxaVJZapGukl1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuck6KX
  l1qyiREYtinFbN07GNf3/tU7xCjJwaQkyrts89NkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8y
  yY+TxYSLEpNT61Iy8wBxhBMWoKDR0mEt3s6UJq3uCAxtzgzHSJ1ilFRSpz3IkifAEgiozQPrg
  0Wt5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNOnQI0hSczrwRu+iugxUxAixmknoIsLkl
  ESEk1MFUKPS8/kKr808RaNWfHutRD3CYN7Uf/PHE7+fjP6Rc3ldsb1YQtZcL059uIvXE7teP7
  dsUDpo/fTTC+tuOp9oULe3SXt/hcU1qTYhzd7jV/adOH0uRZHz96vePavaB9Wrf12Y7YT0VN6
  r2fapmObefrZjHWXHNlHj/PQ/eaN+vq03jTu5xb1/xT+bG884l73OVO9t+nf8cZ/N71XDjDf4
  OyjoC2xYu6m5ZnUh8GPAu0M7TQP/Gc/VdPboSjUniMyrd/qiszHBIXLozoDd19I6XBr+/I3X1
  Xlxld6Hy45yN/X51J9Z/f84XkwiZPMH/F8HTtmRXW1z8IORU9aZv3kNuxb3dIgfHpIN/JZhWN
  5UosxRmJhlrMRcWJAByhEHNWAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-587.messagelabs.com!1676122425!444385!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12948 invoked from network); 11 Feb 2023 13:33:46 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Feb 2023 13:33:46 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id AD4E61B0
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 13:33:45 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id A18FE1AD
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 13:33:45 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 11 Feb 2023 13:33:44 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.167 -> 2.4.168
Date: Sat, 11 Feb 2023 21:33:24 +0800
Message-ID: <1676122405-5945-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676122405-5945-1-git-send-email-wangmy@fujitsu.com>
References: <1676122405-5945-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 13:33:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101025

From: Wang Mingyu <wangmy@fujitsu.com>

Fix
========
- Set relationship_type default in MISPTag to empty string.
- Another typo in readme.
- Typo in readme.
- Update whl files.
- Nvm, readthedocs requires python 3.8 at most.

New
======
- Add relationship_type in Tag entries for feeds.
---
 .../{python3-pymisp_2.4.167.bb => python3-pymisp_2.4.168.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.167.bb => python3-pymisp_2.4.168.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.167.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.168.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.167.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.168.bb
index b4680e35d..2beff5c33 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.167.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.168.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "29dc2d6d1aa7919f50db256525bf66aa52b585ec"
+SRCREV = "9a7adb2e0d60d2edee9f541db808652875bae20e"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.34.1


