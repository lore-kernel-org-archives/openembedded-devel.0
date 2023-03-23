Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D6EC7619A
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 05:17:08 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.65425.1679548624213908586
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 22:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BIsjZB2H;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679548622; i=@fujitsu.com;
	bh=RHBvFfMDQ675mCmQhua6nDMKWjVWUlHmdIF8YYD2r58=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BIsjZB2HlVsJ1/9Dp3SlZEFEdKuFlW4egIsQuMZ/E2fCOCX2/LNH/USiladceAOiN
	 9cz6Z3MjuQghhg+szr1zRfpL4NDszf3OplBvItdTaoWYBM2QejUBu7zk+SCneqy23U
	 ufpdYKOwQk6Ontt522zWM51fl57GcPaxCjh6rKu1bJJpIq2Mn5KcFiEfjDCAoYW+rr
	 iq+NfahuXNoR23BT59xLODSX40QUnIcLpWI8EAka6M6JnxvfSZzH6J4KF9WOEYHFYI
	 MMzwIW0McZU2EHNURQ9Vrt264WuiBA5LdKUa1er8c8mkndItWP4ZGWEpRQf79zrqkH
	 PMsQAqJrceHPw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqHv2gXS
  Kwa1+OYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNva3rBKq6KS9+jGxh3c3YxcnEICTxhlLhz
  +RVzFyMnkHOdSeL3bnuIxB5GifUT3jOCJNgEpCRu3P/PBmKLCOhLLJ29B6yBWUBF4sXvHnYQW
  1jAW2L20lYgm4ODRUBVYu3MWJAwr4CTxNedh1lBbAkBBYkpD9+DtXIKOEv87r3JDrHXSeLB9E
  NMEPWCEidnPmGBGC8hcfDFC2aIXkWJ2ZebWSDsColGqHoJATWJq+c2MU9gFJyFpH0WkvYFjEy
  rGM2LU4vKUot0DQ31kooy0zNKchMzc/QSq3QT9VJLdfPyi0oydA31EsuL9VKLi/WKK3OTc1L0
  8lJLNjECAzelOO34DsaXfX/1DjFKcjApifJKhEqnCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgF
  bgDlBMsSk1PrUjLzAFGEUxagoNHSYR37kGgNG9xQWJucWY6ROoUozHH2oYDe5k5Ovd3HWAWYs
  nLz0uVEudlug9UKgBSmlGaBzcIFt2XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnz6twDmsK
  TmVcCt+8V0ClMQKfEzZAAOaUkESEl1cC0c8MaG9kg0azIqRy/9y9e+dLC6tKST885cnOPBM+Y
  c+et5trTVw4ITbgmlyPHlujR5v3zKNfbxruCbH9stW66nq1qCJpauPPs5f/JAS4O/LOfHC1kD
  4l6w/PN2sK+Y8oGm4Ov3P4tOz99prpp9IbISRndaUbvF6QqL58nd4Bz5/zslR6uah8v3Lx02m
  bChnOfvh5l/fim0WhC4UrGyTXFkjIijKwL1jmKeC35nmjzN3sff0Gp5V6rd6VH3ZdmLjPkV7e
  beGtxzKoXU+VDHqsfm2w6M+SeqFrip8X3onfL/t27Ibxn2YYX+1h+lpxs39h1b3/sYnanqZai
  H5/suTbpbNkZ6zcL1HRv3WZeLsd+PkuJpTgj0VCLuag4EQBxaTfkaQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-728.messagelabs.com!1679548621!61123!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7104 invoked from network); 23 Mar 2023 05:17:01 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 05:17:01 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D853C10019E
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:17:00 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C8DCB10019C
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:17:00 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 05:16:59 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xf86-video-amdgpu: upgrade 22.0.0 -> 23.0.0
Date: Thu, 23 Mar 2023 13:16:37 +0800
Message-ID: <1679548598-20478-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679548598-20478-1-git-send-email-wangmy@fujitsu.com>
References: <1679548598-20478-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101665

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...xf86-video-amdgpu_22.0.0.bb => xf86-video-amdgpu_23.0.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-driver/{xf86-video-amdgpu_22.0.0.bb => xf86-video-amdgpu_23.0.0.bb} (82%)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-amdgpu_22.0.0.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-amdgpu_23.0.0.bb
similarity index 82%
rename from meta-oe/recipes-graphics/xorg-driver/xf86-video-amdgpu_22.0.0.bb
rename to meta-oe/recipes-graphics/xorg-driver/xf86-video-amdgpu_23.0.0.bb
index 3082e2e6b..c417e95d0 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-amdgpu_22.0.0.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-amdgpu_23.0.0.bb
@@ -6,8 +6,7 @@ SUMMARY = "X.Org X server -- AMD Radeon GPU display driver"
 
 DESCRIPTION = "Xorg driver for AMD Radeon GPUs using the amdgpu kernel driver"
 
-SRC_URI[md5sum] = "73efb437f5eb29b2c52a9d82c7e15d72"
-SRC_URI[sha256sum] = "bc47a1a8854e790270fa5de2fb9dfe8558139b03d8f68ac1057dcd235d572dcc"
+SRC_URI[sha256sum] = "08c38287d39b999fd61ecb6e7b23d5079762e2b4b2179b3567973ed9aaf71222"
 
 XORG_DRIVER_COMPRESSOR = ".tar.gz"
 DEPENDS += "virtual/libx11 libdrm virtual/libgbm xorgproto"
-- 
2.34.1


