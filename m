Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB1FC74A5B
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:28:23 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.89881.1679617693391174161
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Y5ol31KD;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679617691; i=@fujitsu.com;
	bh=8WZToHzTeeb20JNx7BdiIbGA9WexvlENVtGpYVDDe+M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Y5ol31KDPjFOfS3pyt3G8XdTQLTh0zq1yNfKVmKna1nrrYToVxj0NWGBm0f8+LpJp
	 cDANP10uhCqp7E/2SSfaDPl+402BOjUJiu/fXQxHSRQRFPr3tBBN3QMiTkKDp5Qg05
	 5D47HueYUxvbBNbkeIHJE0iqrVjDtCh+7a0dfw84SkLUkgQ8wlzEx9uV6nY3FwJQGF
	 xZUB8IpJGuOdLOj36/8AKy3ePB6KroNMBIwt7TMiZ3uT1F/NIRQu0D3H1UK/9MhGh+
	 v7TF3PixWFZUiSVF1gisd5gIAKJQbNnELlfMphOlXEltWtOm/6lf2rMfxoO6WPLAoV
	 jvUgcB3WpWVfQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqDvrnUy
  Kwe6zWhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aN3ovsBU/ZKvY8uM3YwDidrYuRi0NI4Amj
  xNozL6Cc60wSr3vfQjl7GCXa599m7mLk5GATkJK4cf8/G4gtIqAvsXT2HrA4s4CKxIvfPewgt
  rBAgMTHZ4/AbBYBVYndR8+B2bwCThIHTk5hBLElBBQkpjx8D9bLKeAsMeXzeyYQWwio5um6pc
  wQ9YISJ2c+YYGYLyFx8MULZoheRYnZl5tZIOwKicbph5ggbDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGM2KU4vKUot0LfSSijLTM0pyEzNz9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yorc5NzUvTy
  Uks2MQLDN6U4+ccOxl19f/UOMUpyMCmJ8kqESqcI8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuD9/
  EYmRUiwKDU9tSItMwcYSzBpCQ4eJRHeQ2eB0rzFBYm5xZnpEKlTjIpS4ryJb4ESAiCJjNI8uD
  ZY/F5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMwrDEwGQjyZeSVw018BLWYCWuxcA7a4JBE
  hJdXAVLH57kxFlbyeB6zGUt4G7puX9J0+eqrK3TvzrlDhvz2/0/6ERNl5f9JgTb3AZlbn0Ju8
  dOsJngpBGY8bEw++/lbZFbxlsobDas9t0hFTdnEK9TN8rYr+dVsz/Vfm9ecm05vDNT3lVk7z/
  GHCelv/3ae2Le/Xcu06vsRNONjemk/IRlinhTHtcMB6lakvuB+c7om1nLVOzke9UDIqeUH8pX
  frleeaxe7klt8zaalNTOKijrQC/thDvHrSwVc/Xvn1V5u98GJKUyVz5KG8Z8ang0zU//9ZuD7
  lVdj92cvWyLm13fv9VmGHUnHevuaX7pmpmn0p2zO5OG66P7xpOO9x0/J+mWOOLTmVzyYkbf+n
  xFKckWioxVxUnAgASExVo1oDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-745.messagelabs.com!1679617690!252166!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28087 invoked from network); 24 Mar 2023 00:28:10 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:28:10 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 18E1F10019F
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:28:10 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0CDCF10019E
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:28:10 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:28:08 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] opencl-headers: upgrade 2022.09.30 -> 2023.02.06
Date: Fri, 24 Mar 2023 08:27:47 +0800
Message-ID: <1679617669-27228-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679617669-27228-1-git-send-email-wangmy@fujitsu.com>
References: <1679617669-27228-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:28:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101680

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-core/opencl/opencl-headers_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/opencl/opencl-headers_git.bb b/meta-oe/recipes-core/opencl/opencl-headers_git.bb
index 6374f4597..83ea6528c 100644
--- a/meta-oe/recipes-core/opencl/opencl-headers_git.bb
+++ b/meta-oe/recipes-core/opencl/opencl-headers_git.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "base"
 
 S = "${WORKDIR}/git"
-PV = "2022.09.30"
-SRCREV = "a51354a85f41d203e755124ad51ae3425933df45"
+PV = "2023.02.06"
+SRCREV = "4c82e9cfaaad18c340f48af3cf5d09ff33e8c1b7"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=main;protocol=https"
 
 do_configure[noexec] = "1"
-- 
2.34.1


