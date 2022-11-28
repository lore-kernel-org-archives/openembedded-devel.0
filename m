Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34592C4321E
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:10:18 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.111335.1669615817049827909
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:10:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vlgo7SFn;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669615815; i=@fujitsu.com;
	bh=owXmeahdb9JDxuFZ24f5n3XW7QMT4hwGsXjqET4QWk4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vlgo7SFn7bPb9bF6oP6IwyXMAMA3JWOqe0394YUpTLdlYf/RZKrCm2Tgts2XRqLlZ
	 XHpy9vyaEZeWN1RISYw2yNtG76p5jF6JmYVLIa7AVRmsqYP6L5GlydBjfyk/27ljRr
	 s1YzcnHtAXGYnAcz7BNUCVleGJPpPGpKWlINVMzYH54ULdPvMN3O7UGTkmErv9VVWh
	 +aSmUNFula+J37tPbJjp28tv7tsa6h6Cyh1oKkSOVIy9MR7DfK1JXW+SVjxt28KfXC
	 YX4hhehFRnRCz16JoupZgUG1MjvV6g4VIRVIEdT/lbpK4sSbnYmCF1RhL/s8PNf7LV
	 Vc1eL3qj4VCQg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8MxSfd4QEu
  ywa4nbBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bCFZtYCl5xVnyf9IytgfEjRxcjF4eQwBNG
  iblfJjNBONeZJI5+72aBcPYwSiw+9YS1i5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBB4nDBzaDxVkEVCW2zJnLBGLzCjhJLF11GsyWEFCQmPLwPVgNp4CzxJ5HJ8DmCwHVnH
  rcxghRLyhxcuYTFoj5EhIHX7xghuhVlJh9uZkFwq6QmDWrDWqmmsTVc5uYJzAKzkLSPgtJ+wJ
  GplWMpsWpRWWpRbrGeklFmekZJbmJmTl6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJOSl6
  eaklmxiBwZtSzFa9g/Ht0j96hxglOZiURHkXXmpKFuJLyk+pzEgszogvKs1JLT7EKMPBoSTBu
  96zJVlIsCg1PbUiLTMHGEkwaQkOHiUR3sX2QGne4oLE3OLMdIjUKUZLjg+Hruxl5rh6BUTO/N
  p2gFmIJS8/L1VKnNfRH6hBAKQhozQPbhws2i8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuY
  V9AOawpOZVwK39RXQQUxAB21SbAI5qCQRISXVwHSxzPHKhI1/o1e/3FK8Wy3T8dvNhhCHVDf3
  nVu0dJnm9FW+Fm7YvTFE5aSG0D4H1VVvzOMPHcg//nhtw8wnS+coGWRazRPVWfqqNTpTUsLyz
  LMqd7dfm3tO3RJ/+jnOPML+VmVh/2St+VnuTP8SM2/JvBT605BoptpyWLsgX346f96pFq416R
  vU93E+clAV0to0ndXe5qvDyo4/NhOS3rJ9LVism/Z/ySSXv55ltoetpDMdPxuquD94IdS+/lW
  ZmEo1z/5pL0ybf6/Yv9Xk2jN2b0FVidVN3FPua3nceLN266+7P9bqRuw4uclsc9KSuYZHS3Q2
  Rv0Nd2l0N7b726hRPb32me7/CS5rZ8fskVZiKc5INNRiLipOBAAw4wCAcQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-585.messagelabs.com!1669615814!221395!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18192 invoked from network); 28 Nov 2022 06:10:15 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:10:15 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B4ED61000E9
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:10:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A89EE1000DB
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:10:14 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:10:12 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libglvnd: upgrade 1.5.0 -> 1.6.0
Date: Mon, 28 Nov 2022 14:09:43 +0800
Message-ID: <1669615786-13094-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669615786-13094-1-git-send-email-wangmy@fujitsu.com>
References: <1669615786-13094-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99792

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Added assembly dispatch support for loongarch64
Fixed GLX assembly dispatch support for x32
Fixed TLS handling for single-threaded programs on FreeBSD

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libglvnd/{libglvnd_1.5.0.bb => libglvnd_1.6.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libglvnd/{libglvnd_1.5.0.bb => libglvnd_1.6.0.bb} (95%)

diff --git a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.5.0.bb b/meta-oe/recipes-graphics/libglvnd/libglvnd_1.6.0.bb
similarity index 95%
rename from meta-oe/recipes-graphics/libglvnd/libglvnd_1.5.0.bb
rename to meta-oe/recipes-graphics/libglvnd/libglvnd_1.6.0.bb
index b92bad46e..b76373cf2 100644
--- a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.5.0.bb
+++ b/meta-oe/recipes-graphics/libglvnd/libglvnd_1.6.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://README.md;beginline=323;md5=7ac5f0111f648b92fe5427efe
 SRC_URI = "git://git@gitlab.freedesktop.org/glvnd/libglvnd.git;protocol=https;branch=master"
 
 # v1.5.0 tag
-SRCREV = "c7cdf0cc4395b57563294d1f340b6bb1b95366a0"
+SRCREV = "b05bbcdaeb9b700cf7877e6d66f8fc3ac952295b"
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-- 
2.25.1


