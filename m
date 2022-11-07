Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 713BCC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:32:00 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web09.1236.1667809915437078980
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:31:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UnPA/uzL;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667809915; i=@fujitsu.com;
	bh=pcEufXLgfxDy7zuzeSYMQ8LnkbeaugG4UL7OPp9ABWw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=UnPA/uzLRE9vgMA0G8R60pkYQekzvS4BY+PWd2fNuXZwbVXuawLOhi4phfz3OKFNY
	 UFYNcb9xPlsu6E8J3oHYAjRyA5aEQ8+Ceg1Y+3J+tQOKwamoY198DuQU6S/jhPlQHG
	 +HPDN/UYsBTUPsEFv2YsCuuO516ZkYneJjlaxhEDBR2Bks90/whqklWsMVeZTNAs0z
	 HASL/C0lIbBeeXnfEva7smB0N+BZdSXwIGlC+x62RH6w8orsn+U6IY5LD4HX8U67Wa
	 JHRS81f5SXv9+bz4AM7gPxmtR9mCnLmWguXxfzKewMNo5pFgBi4VZguRlarFq2rzHE
	 nUl1mHdn1f9dw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORpFt9KCP
  Z4NstDouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePZ9Z0sBS85Kq7fdGpgbOPoYuTiEBJ4yCjR
  2z2XsYuRE8i5zCRx6RsfRGI3o8Tf5d+YQBJsAlISN+7/ZwOxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILC9hLzDu0CayGBSj+8PIvMJtXwEni19R/YPUSAgoSUx6+B7M5BZwlFi7aBbXYSeLl5ndQ9Y
  ISJ2c+YYGYLyFx8MULqF5FidmXm1kg7AqJWbPamCBsNYmr5zYxT2AUnIWkfRaS9gWMTKsYzYt
  Ti8pSi3QNTfSSijLTM0pyEzNz9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yorc5NzUvTyUks2
  MQKDN6U4PWYH4+9lf/QOMUpyMCmJ8v5enpEsxJeUn1KZkVicEV9UmpNafIhRhoNDSYL3xkagn
  GBRanpqRVpmDjCSYNISHDxKIrxh+4DSvMUFibnFmekQqVOMuhwzv7YdYBZiycvPS5US5722G6
  hIAKQoozQPbgQsqi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZl3gM0hSczrwRu0yugI5i
  AjqguSAM5oiQRISXVwKS3ZOGnhAm38vVM5my3eLL+/PwStyLbILVPL4x9N0c+S5DltBeQPH9i
  8hf1GBnRtXOK3/M9eh+0/04Mc4iWRfqbz98SDm6U4xb6XOMjvSLgwaJ9F/mDP56JfOO6xuOj3
  O5tbr4CKvV5yY7Ka5MSGDL//PxknfrGLM7ytC//z/0bD4vWarnsSKj4wX/a+arvNT02KdPik1
  ebBcKe8i9RPHzAfJvlF9X2aJZL91fenMXOyH5zv4Bay9fvK7Xeff9mxFe7M0Bvef6D/ammpaY
  isyO/iDnJrRQRn+qssevP5OClBeJlh/hqP9vGFJ4SKD8rUXFaljF9cXj89C/Ss8ydl4td/njk
  mvCFn5/2cKUbdSuxFGckGmoxFxUnAgCouISuZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-728.messagelabs.com!1667809914!219098!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11784 invoked from network); 7 Nov 2022 08:31:55 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:31:55 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 7BDDE1AD
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:31:54 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 712687B
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:31:54 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:31:53 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ser1net: upgrade 4.3.8 -> 4.3.9
Date: Mon, 7 Nov 2022 16:31:30 +0800
Message-ID: <1667809891-30889-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667809891-30889-1-git-send-email-wangmy@fujitsu.com>
References: <1667809891-30889-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99455

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ser2net/{ser2net_4.3.8.bb => ser2net_4.3.9.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.3.8.bb => ser2net_4.3.9.bb} (84%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.8.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.9.bb
similarity index 84%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.3.8.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.3.9.bb
index c8108d602..e149bb568 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.8.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.9.bb
@@ -9,7 +9,7 @@ DEPENDS = "gensio libyaml"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "e5620975523059a38709bb53c0567600adbbcb8011066a2d2fe1b4db9efe0ba3"
+SRC_URI[sha256sum] = "bcb8ae31d00c6b4392d1cd1c9ecc9390a8b241029c42c5eb951af090edaf56db"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.25.1


