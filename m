Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135A3CCA485
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 06:59:33 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.2787.1657177166696820137
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 23:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MOX/xvMR;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657177164; i=@fujitsu.com;
	bh=iL5pecOtJjIKy0hviovDTvpKBJb8gbWxwdLcvdBYztI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=MOX/xvMRWtIwqrUTxRQZ1RyL/s4m2qgx+f9VPhAc5HyWO+InVVuBgc7acx7QgpBtl
	 f+uK4Uy5gs13A2W2GoiPQ3qK9imhkt36hyhSyAWcNV6hovVPds4eMjM/xIFoKgOfD8
	 FAH9lBjMhojwW3+10ISSozSYZxvo0rRERTZT66P72qrAUf+aYj5tRkSJSdQ8h+Pb6C
	 yVNGqIp2wDk2Sof59AtMUSaxJB7ySGaea6Sqw9wVqMbAWyCDiiI549F5vI1XWkgxIT
	 1NACPIQz8AlSjaPI/D/NPPN2S8I312S/bHueTPPUVS28NqX5CNKO1A+6zGcokeENci
	 SrFE0DwhMHCow==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8OxWden5Vi
  SwcyZAhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8btt0eZCv6yVyz7spS5gXE5excjF4eQwENG
  iTWH37BCOFeYJG7sXsoE4exmlFj59SBLFyMnB5uAmsT0WzdYQWwRAX2JpbP3MIPYzAIqEi9+9
  wCN4uAQFrCT2H/ZG8RkAQp39kmDVPAKOEkc/NLHBmJLCChITHn4HqyTU8BZ4uCpu2DThYBqXi
  /9xw5RLyhxcuYTFojpEhIHX7xghuhVlJh9uZkFwq6QmDFjG9RMNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYrZKKMtMzSnITM3N0DQ0MdA0NTXXNdA3NLPUSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yor
  c5NzUvTyUks2MQJDOKWYbeUOxpV9P/UOMUpyMCmJ8nrVH0sS4kvKT6nMSCzOiC8qzUktPsQow
  8GhJMHL3wSUEyxKTU+tSMvMAcYTTFqCg0dJhJexGSjNW1yQmFucmQ6ROsWoyzHza9sBZiGWvP
  y8VClx3nsgRQIgRRmleXAjYLF9iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwrxfIFJ7MvBK
  4Ta+AjmACOmJZ/hGQI0oSEVJSDUxd66YxJNTs9hEvWKsu+vNJw8eMADnteIeM1lwtkXoly12H
  2qYLH9Zz6q2OOvHlrNX/2lzht8/7JTPTFkjfFbH9nbbmy4Y/qxT/xf1yvX49+FzKsovPZOoEC
  86lywYLrbDjemHx+/0aabbPToaC635nHPx1Ss85J2+Hb1EGd4XwW0HRhWk39LSO3/px2HnbNp
  k9rdd7dynvYb/gys5bKaZ/QXntrn0Nv9oNND2C3sozXP+7+/bbA6/PvXNdk8J6QOycl/gPweK
  lznGGgV39mtsUzi9lv3q2+yXLupXTNrZvf+LsmbdHoVe4P/zx4ZMJ3edCZyRt3aVXl1tXusDB
  O01CjOEOc67vDtOHzSfYHiuxFGckGmoxFxUnAgANGa7NaAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-587.messagelabs.com!1657177164!4973!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30586 invoked from network); 7 Jul 2022 06:59:24 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-17.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jul 2022 06:59:24 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id DF912150
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 07:59:23 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id D301014E
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 07:59:23 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Jul 2022 07:59:22 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hwdata: upgrade 0.360 -> 0.361
Date: Thu, 7 Jul 2022 14:58:55 +0800
Message-ID: <1657177137-28347-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657177137-28347-1-git-send-email-wangmy@fujitsu.com>
References: <1657177137-28347-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 06:59:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97739

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.360.bb => hwdata_0.361.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.360.bb => hwdata_0.361.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.360.bb b/meta-oe/recipes-support/hwdata/hwdata_0.361.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.360.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.361.bb
index b395409c6..c8daf7d5f 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.360.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.361.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "5e1a17e536de5b2888ecb7ae58ded885a53eddfd"
+SRCREV = "a934c616e2e666552586caa85af9fc583855df49"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
-- 
2.25.1


