Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC0DDC54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:17:24 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web09.7307.1663640238864924610
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:17:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xI8xoixY;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663640237; i=@fujitsu.com;
	bh=mtweL+jgtBaP1ZpCdOfbH8WBWq+3lBX41wbsLqd7a/E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xI8xoixYiHNXTbrRBYPMKXd+oWfFpNWt7X9BUUdC7cr5aSMp2Y2YF4KKD2q/cmBTy
	 eIhsVlUb1yJAz7n/DKGn1uErES1HsdxgiGbNhOeGzOxL1Z6oX/1UXoN7kQEOcONptp
	 bCI4mrPAGB0apXCIZqJf9nog2XuUkWOEWfw2Bodv7dtz++cI/0bWxFogJgCL3lLd/2
	 vSmjh2od0K6QzGqeupqYioxelm+Dp7EwYa/1FXC6Ht2b6QtdzYLE0W+XZRyWB4AvDX
	 S+//RcP603UtRJIXgL1XjY2hh5SpGmfga8MjZ7ACiDV9VolCQi3smSXmrHHqeoStZg
	 1KEx16pHEa+2g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqLtGSTP
  Z4PI0KYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP4kQ7WgvfsFU+bPjE3ME5l72Lk4hASeMIo
  cXPNchYI5zqTxIK1LawQzh5Gic97bgBlODnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHH
  cQWFrCX+HDhG1gNi4CqxJLpr8F6eQWcJPb/mAdWLyGgIDHl4XtmiLigxMmZT1gg5khIHHzxAq
  pGUWL25WYWCLtConH6ISYIW03i6rlNzBMY+WchaZ+FpH0BI9MqRqukosz0jJLcxMwcXUMDA11
  DQ1NdIGlqopdYpZuol1qqW55aXKJrqJdYXqyXWlysV1yZm5yTopeXWrKJERiWKcUMs3Ywzur7
  qXeIUZKDSUmUl6tOI1mILyk/pTIjsTgjvqg0J7X4EKMMB4eSBK+9oGaykGBRanpqRVpmDjBGY
  NISHDxKIrxsUkBp3uKCxNzizHSI1ClGY461DQf2MnPM/Np2gFmIJS8/L1VKnDdFAahUAKQ0oz
  QPbhAsdi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuYNlwOawpOZVwK37xXQKUxAp9xQUQc
  5pSQRISXVwGT940xu0R7GLkn/kLeyyXe8JBIs2iqa/sn0fyp/Z/JVfspu1aUHH/JdkLl2wvlm
  mW/miStvN35Q6lXly3HQ+zkh8v6iP3Ln1Kdu9Up/ei9wT1OriusUy6e9Prsi9i5KjNkz+f9G5
  reXjyin3v98+RgLzyZ/k9fdPRseiax8Oa++ZMeXR+Y73bZ/P/1GdvO5Wx8yz8ekXd4zWccza+
  mv0GOCv3cyti7cdLZXsJ7zn2cRaz1zIp+u2Qefw19WzFTuiJ619NY7Do7d03y2VGStjIhVep1
  sGDDtRbOtxLzP98QD5+x2OW3ddzCRv87t4JXkyc3rNq79lbSebS/THwXxBXkBvjflDigt2yoW
  43g/YEugEktxRqKhFnNRcSIA+kQm/FgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-585.messagelabs.com!1663640236!192135!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28506 invoked from network); 20 Sep 2022 02:17:16 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:17:16 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 12A9310019A
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:17:16 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0721E100197
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:17:16 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:17:14 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] iceauth: upgrade 1.0.8 -> 1.0.9
Date: Tue, 20 Sep 2022 10:17:00 +0800
Message-ID: <1663640220-27204-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:17:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98876

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{iceauth_1.0.8.bb => iceauth_1.0.9.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{iceauth_1.0.8.bb => iceauth_1.0.9.bb} (70%)

diff --git a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.8.bb b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.9.bb
similarity index 70%
rename from meta-oe/recipes-graphics/xorg-app/iceauth_1.0.8.bb
rename to meta-oe/recipes-graphics/xorg-app/iceauth_1.0.9.bb
index 62296b5be9..ea0ef0a7e2 100644
--- a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.8.bb
+++ b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.9.bb
@@ -11,6 +11,6 @@ BBCLASSEXTEND = "native"
 
 DEPENDS += "libice"
 
-SRC_URI[md5sum] = "3b9b79fa0f9928161f4bad94273de7ae"
-SRC_URI[sha256sum] = "e6ee213a217265cc76050e4293ea70b98c32dce6505c6421227efbda62ab60c6"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "2cb9dfcb545683af77fb1029bea3fc52dcc8a0666f7b8b2d7373b6ed4c408c05"
 
-- 
2.25.1


