Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CCCC3F6B0
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:43:32 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.6171.1659447804370196269
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=k7UIcVnf;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659447802; i=@fujitsu.com;
	bh=uicbdSrh9QV7RnUvOwak+rDF+ohIxQ8vacCVxtEhEII=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=k7UIcVnfyrHwTmn/cou9RTl5skFsCvfemGjawbiM/6dDcZs1+iS3vKad3skgxue1s
	 WTwywXHQYqH5WLiVBJUxml02hGMhekNIfYK6flj6GkPGvIoUiEJtcV+qDbvg5VXraS
	 uB/1DhWl8LXNqJecqRwiWW/qYNskgzGyzaNhN9Yo7B8ORJGytizIHdnaBalOX5BG5+
	 NZ2E501+rXe6NUA1WxqjYwusGajf23HuNAlQQ4Xfgxlf1pkhENi/kR+Dr1GhkN0zRZ
	 cezlSv89TBU4hmisPfU+Ekb7jZcNBfpL32gSUxXxOwMU6klRDA8x4AoQVxgHCrBdmZ
	 MleaGgU5M52mg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8MxSfeX5ss
  kg8stwhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bS6TuZCpZwVBw59pi1gfEsexcjF4eQwBNG
  iV27DjJCONeZJHp2fmKCcHYzSjw8/pe5i5GTg01ATWL6rRusILaIgL7E0tl7wOLMAioSL373s
  IPYwgIOEkf2LWEBsVmA4g0z9jOB2LwCThKfdy8Ci0sIKEhMefieGSIuKHFy5hMWiDkSEgdfvG
  CGqFGUmH25Gaq+QmLGjG1sELaaxNVzm5gnMPLPQtI+C0n7AkamVYzWSUWZ6RkluYmZObqGBga
  6hoamusZGuoZGZnqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWVuck5KXp5qSWbGIGBmVKsULeD
  8drKn3qHGCU5mJREeeUUXyYJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuC9pQqUEyxKTU+tSMvMA
  UYJTFqCg0dJhPesBlCat7ggMbc4Mx0idYpRl2Ntw4G9zEIsefl5qVLivMtBigRAijJK8+BGwC
  L2EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3gMgU3gy80rgNr0COoIJ6AgdrhcgR5QkIqS
  kGpicj204cP1o2K+XzAoaszS+p+a+4L65RlDt0z7lCck8r9Zc5/V5pairquy4eUVenlX47bt1
  8u3vBN9eXebNku0j+iZyj6zfWdHElSGPGZkKfsX0Gm6sZH6iE/DrvtbMHNf7G6qtDnqsinmwy
  uDFi0qBE9Gh83RvlLjLu7//+3Ll3tnJJ++vu7ysnENR8lrNvWNSm395td1KScmVN660vm/t9d
  r0+FzH44f3xZwTFC1y/nd4lvDZU8v4Yrg0Fqx7vFpw67/QXR+TX0z7dEvJnf0D6895+5c+91R
  TOV8i1X6/++aVaxfDtm5Temu1+Dqn4KegqKNuP9hm2Uxh9/vqUMt3SeAMx5YoYXeHGXOvGnA+
  U2Ipzkg01GIuKk4EAMWRoURTAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-548.messagelabs.com!1659447802!3933!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17932 invoked from network); 2 Aug 2022 13:43:22 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Aug 2022 13:43:22 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 01DD31000C2
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:43:22 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E92FA100077
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:43:21 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 2 Aug 2022 14:43:20 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xfontsel: upgrade 1.0.6 -> 1.1.0
Date: Tue, 2 Aug 2022 21:43:07 +0800
Message-ID: <1659447791-24448-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 13:43:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98093

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xfontsel_1.0.6.bb => xfontsel_1.1.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xfontsel_1.0.6.bb => xfontsel_1.1.0.bb} (73%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xfontsel_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/xfontsel_1.1.0.bb
similarity index 73%
rename from meta-oe/recipes-graphics/xorg-app/xfontsel_1.0.6.bb
rename to meta-oe/recipes-graphics/xorg-app/xfontsel_1.1.0.bb
index e9260240da..4c31d0b77a 100644
--- a/meta-oe/recipes-graphics/xorg-app/xfontsel_1.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xfontsel_1.1.0.bb
@@ -9,5 +9,5 @@ DEPENDS += " libxaw"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4669d2703c60d585cc29ba7e9a69bcb3"
 
-SRC_URI[md5sum] = "13150ff98846bf6d9a14bee00697fa47"
-SRC_URI[sha256sum] = "25aa0b7c4262f5e99c07c2b96e00e4eb25b7e53f94fa803942af9d0e8da3001c"
+SRC_URI[sha256sum] = "17052c3357bbfe44b8468675ae3d099c2427ba9fcac10540aef524ae4d77d1b4"
+SRC_URI_EXT = "xz"
-- 
2.25.1


