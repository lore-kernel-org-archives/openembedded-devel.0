Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A633C4167D
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:14:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.111439.1669616050754963432
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:14:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PCFuG1pC;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669616049; i=@fujitsu.com;
	bh=6wOYtgORzEd0c2YS36ZufeElMdi2Yu6eyoLsEwbjhLw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=PCFuG1pCsLxmXg/2iGY3jEnUYamOW33iX+oTRD5nDfMSegXYaljV570BHSjFbxUcb
	 IbOBoo9CdXsGPtoY2FN7LxSX1IUEy0rMBSLEXA1yiJ4194TpnecUGvon+BzAZzDCWW
	 m2PGTK0x5kp4by0a3OG+hw7DcL7j9tDRy3Lbog7mh0m9DJzdKY1SL+rYjxAYU0eM/9
	 BtWEZaVYQgjbDK0sAIsxPr3ON9QQEuq8fzM1m9d+Mn3zSHUz9KwwFUb8tlOH2ZLmj5
	 XHTs5Fq3zOmwR26tO7mKqgrJSR0LEI0LEk3BgJuyYgOD+SlHN2b5etJNYSN8Au3RVA
	 B5g4OkzHQBtsQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8ORqLsxsCX
  Z4Pl+JouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaP5zxf2go2cFd+m3WBvYLzM0cXIxSEk8IRR
  Yt2/I0wQznUmiadTt7FCOHsYJa5MPcTSxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAu8TnB71gNouAqsT0VTvBbF4BJ4kpLWvAeiUEFCSmPHzPDBEXlDg58wkLxBwJiYMvXj
  BD1ChKzL7czAJhV0jMmtXGBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVoVpxaVJZapGtkoJdUlJm
  eUZKbmJmjl1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmbnJOil5dasokRGI4pxeoXdzB2Lvuj
  d4hRkoNJSZR34aWmZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvOs9W5KFBItS01Mr0jJzgLEBk
  5bg4FES4V1sD5TmLS5IzC3OTIdInWLU5Zj5te0AsxBLXn5eqpQ47zl/oCIBkKKM0jy4EbA4vc
  QoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmHcbyBSezLwSuE2vgI5gAjpik2ITyBEliQgpqQa
  mgK9X9/nt+WcStFjxns+imPYNE1+9PTD7G7tqY8jPY/Pfcrc+nJ+atmLugxX57ddb+A5s3/fQ
  XTzf0SvH0DxY1898b8TCNatD3025ucYrbfLHhxEbrlqKVN/gv390ooyJvfE73dqp2i+8+CJcI
  tI/XVc55bLiwtNCuZ0fncNrngVUPSrcdLbjTnS8KlNWeLI4xxyrF2smxu8suD1JPrV2SXdpWo
  NEhdn3Sdm39G8vWvwtgaf14hU2lxemvHVhh7UXTbC+li3gManY9dPziqPdL7o2tb2WmbPl2mf
  PCfYKKosd/0QlXcgyWBlf/tYvR+mo27dzzRM+Kz9fZiV/dcpsls8zWy88Ftm930RZ/vjyH0os
  xRmJhlrMRcWJAFH4g/9OAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-548.messagelabs.com!1669616048!201170!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1026 invoked from network); 28 Nov 2022 06:14:09 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:14:09 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BC80E10019A
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:14:08 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id AFCF0100195
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:14:08 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:14:07 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-can: upgrade 4.0.0 -> 4.1.0
Date: Mon, 28 Nov 2022 14:13:40 +0800
Message-ID: <1669616024-13194-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99801

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/hardbyte/python-can/blob/develop/CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-can_4.0.0.bb => python3-can_4.1.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-can_4.0.0.bb => python3-can_4.1.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-can_4.0.0.bb b/meta-python/recipes-devtools/python/python3-can_4.1.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-can_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-can_4.1.0.bb
index b1ba6849b..3d90c7f36 100644
--- a/meta-python/recipes-devtools/python/python3-can_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-can_4.1.0.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "59d92846ffb981e634e9e0f2d14a6b4967a875e3869bd2ba168c92c4db6b8b5d"
+SRC_URI[sha256sum] = "3f2b6b0dc5f459591d171ee0c0136dce79acedc2740ce695024aa3444e911bb9"
 
 PYPI_PACKAGE="python-can"
 
-- 
2.25.1


