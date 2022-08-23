Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E76BC48BE4
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 08:52:00 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.29110.1661244710894921784
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 01:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=d5/2dvTN;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661244708; i=@fujitsu.com;
	bh=f+m9FE2np5gEwBuR815LD5gmJNu2rf9BXhcpP4W4Giw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=d5/2dvTNOz5dBhJpqWcvkJjtVEwvhyla8Rn1ytZIzUB3Y7KsVeThlG30EsgXlKLvF
	 v9Oz9NTQQytrMJuCl+F9fiQq5Ps97/uwSIHoWEpJT3X2KbjI45qTky7X5+RmYHjJ2P
	 vd9wBt4OeP9BS1nQElp3zZVyktfIWnRCqyAYzTEKn6TRGmpAAbqdsMFsAAleY4x8mQ
	 P31rwDe+kUtQlQCC6L+VKgs9lPM3tjtoqTDtVDcs4ttMvFNjbMezs7uB5R825svDMP
	 ZQbMeELSGprun9rZ1LOLjjVsz1r/aR1iX3hdQbX7XiktxiX2FzLbq591Ep0o26YPLq
	 1/ynPIO9eEoIA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8OxWVdlKku
  yQcdMMYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePNh37mghaOit3n/RsYl7J3MXJxCAk8YJT4
  cn8/SxcjJ5BzhUni2Sp/iMReRokZS54zgiTYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48bsHa
  BIHh7CAh8T1R9EgYRYBVYkD67vAynkFHCWmrXvOBmJLCChITHn4nhkiLihxcuYTFogxEhIHX7
  xghqhRlJh9uZkFwq6U2DOrnwnCVpO4em4T8wRG/llI2mchaV/AyLSK0TKpKDM9oyQ3MTNH19D
  AQNfQ0FTXUNfUUi+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzAcU4oZrXcw
  dvT91DvEKMnBpCTK61DPkizEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgld4ElBOsCg1PbUiLTMHG
  BswaQkOHiUR3qMgad7igsTc4sx0iNQpRl2OmV/bDjALseTl56VKifOyTAYqEgApyijNgxsBi9
  NLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5D4FM4cnMK4Hb9AroCCagI4J2M4McUZKIkJJ
  qYKp8/eXh65mJCVbT7dr+x8ZcNTnW8/pXHKvwUqu7r3N15z4I2RBUWrfGdV5hs4rrR46zM2/N
  O2ByUSVoTsa5fbtTD2zpvtW34ZmLkkqg9qIYQeWSNxGfZr2ZZvxSuWX//9fywktSg3kn+nV4f
  z68/nZdy9I5u03nyzkv/GLtW22m/6uEU9HlV+zi4zlGK0/tFNrQkSXn/FlsUsnHr2+vH2xkm6
  /o0xOVGcQVL6j5R+5VWezq9wK6x50irArTxA/o676fyrOFx/a5r0/aDpZ5yz+eNLg+xWH3TGf
  bRxeSl+t84L15K1by3d6245eTp9/40xvn9nH5z7SKqv70ALNi93X9sl9sU39oSDvMZw/taVNi
  Kc5INNRiLipOBADgMe8YTgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-591.messagelabs.com!1661244708!318735!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21590 invoked from network); 23 Aug 2022 08:51:48 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Aug 2022 08:51:48 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id F08E67C
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:51:47 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id E42787B
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:51:47 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 23 Aug 2022 09:51:46 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] nbdkit: upgrade 1.32.1 -> 1.33.1
Date: Tue, 23 Aug 2022 16:51:27 +0800
Message-ID: <1661244689-4766-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 08:52:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98385

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.32.1.bb => nbdkit_1.33.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.32.1.bb => nbdkit_1.33.1.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.32.1.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.1.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.32.1.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.33.1.bb
index 56034ac422..322f89c22b 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.32.1.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
 "
-SRCREV = "ea58c4f8a5475de6141f14dd0e37067ac8a7370a"
+SRCREV = "9ebc70dae82220f962167b1668fd2af6de886b16"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


