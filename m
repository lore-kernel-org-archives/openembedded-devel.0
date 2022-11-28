Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF7AC4321E
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:10:48 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.111383.1669615840924171870
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:10:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=I0DLbbhX;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669615839; i=@fujitsu.com;
	bh=gOvADhd0UFZKBwCxPCNRvfBYFdJ+9veoRcpRdhRR2BA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=I0DLbbhXbTk1kOdTmVj2ForBjd0eIobTG/z2Z3i1ttRQo9EmgTeOkrpXZWsUpDB9X
	 mesJ2opuHEnzcvhWj6jn2rV8gMnOcVSLRnbJqgf/nGs7aClBazQObQmYdiEsvmOJNQ
	 8vaB7OgJ0B+YoTwZNch/e+nLpvSbN5rGHkcLeh+b4bL8ti5Lf80CHjruTDYY+TlAKX
	 8Qh7oqXdbV25mVAHgramdICL2iVWrLDeGZHny2wPM0af2Zq9OnjF0gjtGOdGoLerRW
	 1Tz44G16MrHZ0V55FY4jsi6HoznlFCgfazjDe1WfPA/GGGRo1JvvadqA130JbjO+m5
	 LZJ+xHz+IpBwg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRWlGSWpSXmKPExsViZ8ORqHsvoCX
  ZoOmrmsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjH1QSdbwSqOikXfnzM2MB5j72Lk4hASeMIo
  sXzJAkYI5zqTxO3dG1ghnD2MEvc+LAdyODnYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48buHH
  cQWFvCQmLngOyOIzSKgKtFwfxkTiM0r4CTx9swXsDkSAgoSUx6+B+vlFHCW2PPoBFhcCKjm1O
  M2Roh6QYmTM5+wQMyXkDj44gUzRK+ixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMZsWpRWWpRbqGBnpJRZnpGSW5iZk5eolVuol6qaW65anFJbqGeonlxXqpxcV6xZW5yTkp
  enmpJZsYgeGbUswSv4Px4bI/eocYJTmYlER5F15qShbiS8pPqcxILM6ILyrNSS0+xCjDwaEkw
  bvesyVZSLAoNT21Ii0zBxhLMGkJDh4lEd7F9kBp3uKCxNzizHSI1ClGS46ps//tZ+ZYDiZnfm
  07wCzEkpeflyolznvOH6hBAKQhozQPbhws3i8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEub
  dBjKFJzOvBG7rK6CDmIAO2qTYBHJQSSJCSqqB6bKgoZjfsokN6fe+Ss9PND6YvpJnXjN7sXrU
  L/uWLQ/8bi/j3dZZU82o439pw/u3Wdnil7osOPsU5TaXqh45PF/41xeN1BcKuvrJlXu03v+Oq
  Yy5G5a1davnPRPrHYaPbu/kqxOeb5Lxad7cz3W7lM9OXD+zrf5DZcRZy/zVArJxZ6awSNiWPu
  pa/293eN67RtO65vr+rAMh1jN+f5UTeHS0MX4e5+GXgvle2bYdzyeU7IwtdQve82597iy54O9
  +fTc5H99keM3BUr4mpe6BgnKcP5NM0sE8w+LFizW5NE7baM7bErNmt6VJ7fLS04LvOwX5d7r8
  PTFxTfqb9a0LrW/6K17ouL8so1bkY6uEEktxRqKhFnNRcSIAgT0Jv3IDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-587.messagelabs.com!1669615838!200271!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9576 invoked from network); 28 Nov 2022 06:10:38 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:10:38 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3ADE31001A1
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:10:38 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2E04B10019F
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:10:38 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:10:36 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] nbdkit: upgrade 1.33.2 -> 1.33.3
Date: Mon, 28 Nov 2022 14:09:46 +0800
Message-ID: <1669615786-13094-5-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99795

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.33.2.bb => nbdkit_1.33.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.33.2.bb => nbdkit_1.33.3.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.2.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.3.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.33.2.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.33.3.bb
index ad7b9a6fa..af8354676 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.2.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
 "
-SRCREV = "9e2fdefc1ba4c883c5e6aa4f32ab21777980a978"
+SRCREV = "ef035f7090d8bec2700ef1f941e371d351d647ad"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


