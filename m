Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA27C43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 01:35:52 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.3214.1658453741747734149
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 18:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=V/u0wyBH;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658453740; i=@fujitsu.com;
	bh=JQV18mhZPJOjlerN+8SplZ8BFy6237bgg3lyT2+wCNA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=V/u0wyBH08k7cn7BLv38LYGk3ny2GlNLOtDIwRLLPocKZorxEXCDNWyNpQGJHpvtW
	 Vz+CL2LnoyogY7Bz9dnoeCQWuPPdrEblxeWJjtFjXTollnVMFUW+4s8SbwX0r9rmMP
	 OpJwNYrxcbCiRzx7F0KEd7akcYBNIu9qn3KhmGiMFkD3E9/Qh/Rgt1yE4ia5NExeJs
	 GB/QNEVoud5n5h/VMOvmIo4FVXfHiLDqqZdIHn49ENGul6NQvJrD625lfMcIfSyKtm
	 mddeeMYUEDITFOl+gOVRNJGv1FMhNAUdOB7cJbi+98a9bx6WDpnPzTn2uHJB0Npvga
	 Fv8L3tKkGQ6Sw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8ORqPv6380
  kg7uWFhcPL2V2YPQ4t3EFYwBjFGtmXlJ+RQJrxq1vnawFn7krPt7vY2pgfMjVxcjFISTwhFHi
  6cc2VgjnOpPE+gv3mLoYOYGck4wSD3akgthsAuoSj2++ZgSxRQT0JZbO3sMMYjMLqEp0X1zDD
  mILC3hKfHzwlAXEZgGKb/jzhA3E5hVwl5jReBVspoSAgsSUh+/BejkFPCQa3+8HqucA2uUusf
  ODEES5oMTJmU9YIMZLSBx88YIZolVJ4sSKj1BjKiReH74EFVeTuHpuE/MERsFZSNpnIWlfwMi
  0itE6qSgzPaMkNzEzR9fQwEDX0NBU19hS18jQWC+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gy
  NzknRS8vtWQTIzCEU4rVr+5g3Lzqp94hRkkOJiVR3n2TbiYJ8SXlp1RmJBZnxBeV5qQWH2KU4
  eBQkuAt+AuUEyxKTU+tSMvMAcYTTFqCg0dJhNfiC1Cat7ggMbc4Mx0idYpRUUqcd8lXoIQASC
  KjNA+uDRbDlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ88r/BprCk5lXAjf9FdBiJqDF5uY
  3QBaXJCKkpBqY4k7K/WcUP8f+7H/NSa3dCzZcbBWZs+HlNyXT7SrmfOE+7nndGxz/Xc38ILOm
  5qas/KXevAcrvbyucKk/ljtcnb4+gEMtLU5R80b1nADZkxt1d857UBIZW9XdpTZlwf48HfOjX
  KY2bKJ9jQvXVzyyTeiKbAlTst/53O/In33RRW45pjLl1b37PZsethtG8zgET2cr9Np39jaLSu
  nz6btvZPicOfZke+MG+8fe3tteVs3SZy0TcP+5dOa0kymWlV2Kd8RMrr+b9zz2WN6Teek/gjY
  UqL8N5t/Fc+Zf8tMt6Xsem2zUcb3okB++PE88skNCUEKpVytCcUtLyg3jjw4eut8Lbs79tFZe
  c+ZcN3klluKMREMt5qLiRABaMUjNXAMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-548.messagelabs.com!1658453738!10482!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17122 invoked from network); 22 Jul 2022 01:35:39 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jul 2022 01:35:38 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B265B100193
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:35:38 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A649E100191
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:35:38 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 22 Jul 2022 02:35:36 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flask: upgrade 2.1.2 -> 2.1.3
Date: Fri, 22 Jul 2022 09:35:23 +0800
Message-ID: <1658453726-25988-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658453726-25988-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1658453726-25988-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 01:35:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97926

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
=========
-  Inline some optional imports that are only used for certain CLI commands.
-  Relax type annotation for after_request functions.
-  instance_path for namespace packages uses the path closest to the imported submodule.
-  Clearer error message when render_template and render_template_string are
   used outside an application context.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-flask_2.1.2.bb => python3-flask_2.1.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask_2.1.2.bb => python3-flask_2.1.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_2.1.2.bb b/meta-python/recipes-devtools/python/python3-flask_2.1.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-flask_2.1.2.bb
rename to meta-python/recipes-devtools/python/python3-flask_2.1.3.bb
index 7d290a4fe3..95abddfd95 100644
--- a/meta-python/recipes-devtools/python/python3-flask_2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_2.1.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "315ded2ddf8a6281567edb27393010fe3406188bafbfe65a3339d5787d89e477"
+SRC_URI[sha256sum] = "15972e5017df0575c3d6c090ba168b6db90259e620ac8d7ea813a396bad5b6cb"
 
 PYPI_PACKAGE = "Flask"
 
-- 
2.25.1


