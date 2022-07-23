Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4899C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 03:31:20 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.2568.1658806269891581895
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jul 2022 20:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=m2RNXQ+T;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658806268; i=@fujitsu.com;
	bh=NYU1D3WRMnGnMP7yldrbe+W/6gj3ZfdP8hycsdKSVyU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=m2RNXQ+T4ytr3S2EAnBGVk+LJUb6vAErL2eGwavYgXeQHiOANOOm/epi3Et9NJ8oQ
	 JBLhkYOlqMM+qAR3Ty9/RTxEglT5hWZ4f4494boyJXyRCJEoqxd6WwUSHPFsfAjaoF
	 7OIqygu5vU6y3dxf65CzGzbG48s3uXuEuA+VvcziKcVoB0I7L00PNI4Iu5obOWvaH8
	 giEcpbbTodHj1CCgmGtNedEC4Wk9LcwjseWwExRq4n6KaS4ExdI1mhPw3OHtEoFe4B
	 62/46AoF0Jv0xUNQ3LIQy52zDJMCmiNVlEeeeIbzZdYGOvAIOzPvzUtbM3ZLKgMkGG
	 6i4/aMN+PoJLg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSfd3/P0
  kg5/rbSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozJjbPZC3o4Kn6cnsXcwLievYuRi0NI4Amj
  xLMr35ggnOtMEr1/mlghnD2MEhevzWLrYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  qBRHBzCAl4SW+ZzgYRZBFQllq+8DFbCK+AosXLjArBWCQEFiSkP34PFOQWcJM4vO8kCYgsB1W
  y5+wWqXlDi5MwnLBDjJSQOvnjBDNGrKDH7cjMLhF0hMWPGNjYIW03i6rlNzBMYBWchaZ+FpH0
  BI9MqRuukosz0jJLcxMwcXUMDA11DQ1NdY2NdQ3NLvcQq3US91FLd8tTiEl0jvcTyYr3U4mK9
  4src5JwUvbzUkk2MwDBOKVbcvINx4sqfeocYJTmYlER5t3TeSxLiS8pPqcxILM6ILyrNSS0+x
  CjDwaEkwfs67n6SkGBRanpqRVpmDjCmYNISHDxKIrylMUBp3uKCxNzizHSI1ClGRSlx3hUgfQ
  IgiYzSPLg2WBxfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMmwpMCkI8mXklcNNfAS1mAlr
  8SfsOyOKSRISUVANT6MMZ6iFJ07eynT9aby39SfRJ78yO2UGRp+w83sumL9pwznjlsqU3dZni
  P8/uqNdr0LtbJMY3Z9mV/pq1G5WKt7qdvZJ9lS3kqH13Ss7GKpWL37nO1xt/U1I2c650VvrdU
  6TRPi/oVmHf4ph1Ym0Gf5YwbY7T3C+yUOWJ3BstIz3np2zhHrde75x9fX5IJ4PhEd9Ljxmc8g
  +szFJRaX4hcnJxHL+Y6VdN/5t/zW/YGU6Mykq+whMw/8XtyYr7Nr1LyTdfFPf5IK/0iQ92hYe
  Sf91+sTnp1WzHaHPR7hoGoZAHy3O2eq3sWLzKt1yrw999UcPfA7W8yz4WtsyZ909rvamBiI2p
  rsD/7UnLljQrsRRnJBpqMRcVJwIA6I82RF4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-548.messagelabs.com!1658806267!160356!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2309 invoked from network); 26 Jul 2022 03:31:07 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Jul 2022 03:31:07 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B01A5100078
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:31:07 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A2772100077
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:31:07 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 26 Jul 2022 04:31:06 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] nbdkit: upgrade 1.31.12 -> 1.31.14
Date: Sat, 23 Jul 2022 13:36:06 +0800
Message-ID: <1658554568-9257-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658554568-9257-1-git-send-email-wangmy@fujitsu.com>
References: <1658554568-9257-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Jul 2022 03:31:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97975

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.31.12.bb => nbdkit_1.31.14.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.31.12.bb => nbdkit_1.31.14.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.31.12.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.31.14.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.31.12.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.31.14.bb
index 302e7a2109..3f2107445e 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.31.12.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.31.14.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
 "
-SRCREV = "33cdb16e65c59b5989ad967ec0cccb2ad249cc97"
+SRCREV = "35b42a161f3f3c7cf388e33dbaa5bd7082aac9d8"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


