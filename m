Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E79C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 07:53:29 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.5042.1645602808095783944
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 23:53:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=X42TSAFb;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645602806; i=@fujitsu.com;
	bh=UeDSmxuo/9asMP3aChkXV+HFm7Y2fRYkF2Lww8ixzgw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=X42TSAFbktYso1NGy5K7TjjXeU1a+jOCKMKTrF8kFFizBABo9OKBdMV2DuKNxA00f
	 719MZcn5RYqjpxXK5nki5cTHaJczczw1wf1b7evOYIbfANLZpuGwyq49whFRyatCJa
	 F8E5DrR3HKxSEfC1LCLRVep/GuQxSV6ZMpcGVHsfdlp5wS826sFcFXoOr/0LLIqQLG
	 mSEXnoFz1w0PIMd0RK/mCeKfxNRIc620xdna6BIoVu4Hi8cvRvTBFHL9rkRZMsFuOn
	 XjhrMwfXnJbUHcdoZ4sQyRmhQea96TPxxOGtiRKtHPPz/Y6u4FNajjGG4dZH3RDcAa
	 pBMs7lU55pjsg==
Received: from [100.115.7.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id 19/F2-00700-6F7E5126;
 Wed, 23 Feb 2022 07:53:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORqPv1uWi
  SwZTTlhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ar71PZCibxVLyf9YCxgXEfVxcjF4eQwBNG
  iYvzPjJDOBeYJJ7efsrUxcgJ5JxglHjWHgZiswmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSxgL7Hx638wm0VAVeLpirVgc3gFnCRuL37MBmJLCChITHn4HqyXU8BZonf5KqAaDqBdTh
  JN20ogygUlTs58wgIxXkLi4IsXzBCtihKzLzezQNgVErNmtTFB2GoSV89tYp7AKDgLSfssJO0
  LGJlWMVomFWWmZ5TkJmbm6BoaGOgaGprqGusaWuglVukm6qWW6panFpfoGuollhfrpRYX6xVX
  5ibnpOjlpZZsYgQGcEoxs9AOxvV9P/UOMUpyMCmJ8hYeEU0S4kvKT6nMSCzOiC8qzUktPsQow
  8GhJMHb9wQoJ1iUmp5akZaZA4wmmLQEB4+SCK8ISJq3uCAxtzgzHSJ1ilFRSpz3+z2ghABIIq
  M0D64NFsGXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzijwDmsKTmVcCN/0V0GImoMVTsoR
  AFpckIqSkGphmX3GQCO29cicn3M1T8c2rGbG8ERxvFvv0c0Vxdp1Ukr53XcRE9vLVBRbb/1q9
  XWK2pPqWcbsy6x2/mg+T1eLtH72sYV3bGr/i5+n7a76XnG/nTzmlpq0vF60XbSpe/+lwzM313
  kISwQcu9GxT3sciuWCp3GFHE+H+hLyMvoIr8au3Z278Pzv50c5tiaz/FtuaC68snVHWmr1flP
  3PhdVvsoV8pTM6F76tCdHTWnXjx3eZKbvrVmdopS6zzlL0O9Cz54ny1AMp8t+n5X94/2Ae0w/
  Wh32bTf5yRD3y439d0eT6tEg/7q6aRPPdowaV+9NnHdzaLHJniavsv+5vjas7vjOfuVd9Tixf
  0Z33wFIlluKMREMt5qLiRAA6QkqVWwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-591.messagelabs.com!1645602805!72351!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22512 invoked from network); 23 Feb 2022 07:53:25 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 07:53:25 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 75EC2100181
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 07:53:25 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6966010004D
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 07:53:25 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 07:53:04 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] zchunk: upgrade 1.1.16 -> 1.2.0
Date: Wed, 23 Feb 2022 15:52:48 +0800
Message-ID: <1645602768-28412-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645602768-28412-1-git-send-email-wangmy@fujitsu.com>
References: <1645602768-28412-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 07:53:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95475

Release zchunk 1.2.0 with the following changes:
 * Now builds for Windows
 * Can set '--uncompressed' flag when creating zchunk files to also store
    uncompressed digests
 * 'zck_read_header' now indicates whether there's a dictionary and what flags
    are enabled in the zchunk file
 * Minimum meson version required to build zchunk is now 0.53
 * Switched to use GitHub actions for automated testing
 * Added the following automated test environments:
   * 'centos-8-stream'
   * 'centos-9-stream'
   * 'ubuntu-lts'
   * 'windows', both using Mamba and meson-wrap
   * 'macos'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../zchunk/{zchunk_1.1.16.bb => zchunk_1.2.0.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/zchunk/{zchunk_1.1.16.bb => zchunk_1.2.0.bb} (90%)

diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.1.16.bb b/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
similarity index 90%
rename from meta-oe/recipes-support/zchunk/zchunk_1.1.16.bb
rename to meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
index c1b22886fb..0baea5032a 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.1.16.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
 
 SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;branch=main"
 
-SRCREV = "ff34ee911f7d78d66b97894a773276babd63144c"
+SRCREV = "dd6a30a1e4e8b738b0cafc682f3c00e7706134e5"
 S = "${WORKDIR}/git"
 
 DEPENDS = "\
-- 
2.25.1


