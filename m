Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CF1C64EDA
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:02 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.2663.1649986691141713219
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 18:38:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wPT7rcTK;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649986689; i=@fujitsu.com;
	bh=Y6tXpQWN63iIHHx8eH4v+jRSeW6My6oPnqTDAUunEPk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wPT7rcTKkvPlQJAhqg2t8V5vG70Hc2na6dh7fnWzNhYrzLUkqE4CFfPdojTyt3I9B
	 4/rzaXbBzfNUPnfk3r2/DpnajHz0jlmtZDayV2Ehup+UPy/xucV5rsfYp30kb3Xdzl
	 Sz1GBwatbWInDC1pUgY1J+M36Xe1w/HDoyD5t2Pd6Kq5nxLPcs7y1YPrrXIhLpCCOA
	 7GxKjCEZkv3oSGftHIvR1nwwZfcX4sO7xPDZcwXFlWSIavaUn4Vpzs8EsXvv6mZiyd
	 BcO7/Llcr+0pfe7ugBHvLajGFpezwOsWJvl8nNIlSPfjH4xyzQC46eSJWYWZD0C99g
	 ECzfQ2Kfnl5Nw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8ORqNtwJiL
  JYPoKNYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPDmh7mgibOimNHJrM0MK7m6GLk4hASeMIo
  8X3TBjYI5wKTxPMvTxkhnD2MEu/vrWfuYuTkYBNQk5h+6wYriC0ioC+xdPYesDizgIrEi9897
  CC2sICtxLeLJxlBbBYBVYljV56zgdi8Ak4SbQ++MYHYEgIKElMevgfr5RRwljg5ZyLYTCGgmv
  6H/1kg6gUlTs58wgIxX0Li4IsXzBC9ihKzLzezQNgVErNmtUHNVJO4em4T8wRGwVlI2mchaV/
  AyLSK0TqpKDM9oyQ3MTNH19DAQNfQ0FTX2ELXyNBIL7FKN1EvtVS3PLW4RBfILS/WSy0u1iuu
  zE3OSdHLSy3ZxAgM5JRitSs7GPes+ql3iFGSg0lJlHdqfESSEF9SfkplRmJxRnxRaU5q8SFGG
  Q4OJQnegBNAOcGi1PTUirTMHGBUwaQlOHiURHgFdgKleYsLEnOLM9MhUqcYdTnWNhzYyyzEkp
  eflyolzrvjFFCRAEhRRmke3AhYhF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMxrCnIJT2Z
  eCdymV0BHMAEd8W1VKMgRJYkIKakGptJruicZnQ7cz9fZGqP05de9n1bGx7a9lkpa+080SmLp
  8SLtuZmnpzrEmwY3bH2tfMEjwip3WuXh9dsfvfjJNslX+8tZg6Kn/9ZOPa1oJsOieyfHIPVpO
  8OMVx9b7snMr3DYvXz609j7ER3cfx6yh6pN0LxrpNChm8314XP3Xfd8id9T7VR4DOZcaCnZqP
  x7ZmiP4g9bpnWSUf9yvxns3/FP/OgSIXaHtWtkUxkv51zxnqF+5pzTRaHAlsqCfX+5doVFSR3
  4y5Zder/hVLyp6Zcn/QqMrJLP6z+VFa6q3zuf+dzU8PtMlYs8zweZualxrWErf7fpaoawe1Dg
  2++z5h/btHzz42dyIff/MNa+6lRiKc5INNRiLipOBADoW/QVawMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-571.messagelabs.com!1649986688!35061!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19635 invoked from network); 15 Apr 2022 01:38:08 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Apr 2022 01:38:08 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3171D1001A2
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Apr 2022 02:38:08 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0BD861001A6
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Apr 2022 02:38:08 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 15 Apr 2022 02:38:04 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] twm: upgrade 1.0.11 -> 1.0.12
Date: Fri, 15 Apr 2022 09:37:51 +0800
Message-ID: <1649986673-24913-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649986673-24913-1-git-send-email-wangmy@fujitsu.com>
References: <1649986673-24913-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96658

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{twm_1.0.11.bb => twm_1.0.12.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{twm_1.0.11.bb => twm_1.0.12.bb} (77%)

diff --git a/meta-oe/recipes-graphics/xorg-app/twm_1.0.11.bb b/meta-oe/recipes-graphics/xorg-app/twm_1.0.12.bb
similarity index 77%
rename from meta-oe/recipes-graphics/xorg-app/twm_1.0.11.bb
rename to meta-oe/recipes-graphics/xorg-app/twm_1.0.12.bb
index 0c259dc3a0..91b1abc211 100644
--- a/meta-oe/recipes-graphics/xorg-app/twm_1.0.11.bb
+++ b/meta-oe/recipes-graphics/xorg-app/twm_1.0.12.bb
@@ -6,8 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4c6d42ef60e8166aa26606524c0b9586"
 
 SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "48e83210b39a7bfb492604ba0bcfb19e"
-SRC_URI[sha256sum] = "410ecabac54e6db7afd5c20a78d89c0134f3c74b149bee71b1fec775e6e060cc"
+SRC_URI[sha256sum] = "4150c9ec595520167ab8c4efcb5cf82641a4c4db78ce0a1cb4834e6aeb7c87fb"
 
 FILES:${PN} += "${datadir}/X11/twm/system.twmrc"
 ALTERNATIVE_NAME = "x-window-manager"
-- 
2.25.1


