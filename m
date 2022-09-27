Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E10C6FA90
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 08:20:12 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.8227.1664266808423952946
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 01:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ato6wqfz;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664266806; i=@fujitsu.com;
	bh=dVRx0C8LPnXO6/kg0G7IBNiMW+hnd44gCMm/too6iko=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Ato6wqfzJzdpnu5NHExXC+INLA2FNvnz5g7bDRMnytoAzz/6iQLPC3V6x75iEK1jo
	 9B51LMAf9J5cvlstQqu61/BQEARXO4FoDKmLbhV5qvO77LnSIM/pNBMaNCP+g/4xkW
	 gucCKIOCM0fFX7bj9Ehy44vT9IS5LC1WcCkv/+5v6PwET3X61Wmw4FjsVTKvx+Ty5M
	 cEqXNgbLmkA2v5GnKkMwk6EAxGgmUVa7bkdZtvm1cQPPCfpJ6E+SiI7VKRcvKIDfGY
	 3hhqD++tHj306A32BFyiVqpiJE1vX6w0d4HlTslddo07Y9poM5xdsCZz7wg4RNBlwB
	 KoRAtPJPHoC0w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORpGu2ySj
  ZYL+6xcXDS5kdGD3ObVzBGMAYxZqZl5RfkcCasX/xKdaCDRwVDyZ/ZmpgvMPexcjFISTwkFFi
  +5sFrBDOFSaJxR8fsEA4exglNp3uYeti5ORgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBf4viP9WD1LAKqEhtWPgeL8wo4Skyf8AosLiGgIDHl4XugXg4OTgEniZPLw0BMIaCS3i
  X6ENWCEidnPmGBmC4hcfDFC2aITkWJ2ZebWSDsConG6YeYIGw1iavnNjFPYBSchaR9FpL2BYx
  Mqxhtkooy0zNKchMzc3QNDQx0DQ1NdS0tdI2MjfUSq3QT9VJLdfPyi0oydA31EsuL9VKLi/WK
  K3OTc1L08lJLNjECgzilOOnlDsbz+37pHWKU5GBSEuW1X2SULMSXlJ9SmZFYnBFfVJqTWnyIU
  YaDQ0mCl2k9UE6wKDU9tSItMwcYUTBpCQ4eJRHedUuA0rzFBYm5xZnpEKlTjLocM7+2HWAWYs
  nLz0uVEueduRGoSACkKKM0D24ELLovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmXboWaAp
  PZl4J3KZXQEcwAR1hx6cPckRJIkJKqoHJVURfu8Vm45IH8pePq0aWqbnZXfl/vlHbdaHFC9Md
  d2wvmR/+tuBTXNKF2a8mNiqvNGYTfdzqUHJD8k3N4uPH3Qr04itq/1x2ELh77uDKWV9cluxO/
  ydxX/yve+XpBxfKAhjY901eFR7/myNjbzVPuvzjANfK3MZTZ9ZzaZpPbp36scZ1Wn3rx+/zFp
  rM4hPam9N9xZN7v0LJ0kmv7zFpMNXsLbyykGHe7coKi0ye8Dddv02Sggwqn614VLze+Vu4eOM
  2BqWos8tjSvgf7uRV4P7OG1n3z1Gr6+TsNKVj4f/m1dZq1x/ITlwYa9IQrvFj9hXNlVGm7x8f
  f6Adyvr9LrdY7vtCr5fPP9VyTY9VYinOSDTUYi4qTgQAgAaeIGkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-732.messagelabs.com!1664266805!384076!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26725 invoked from network); 27 Sep 2022 08:20:05 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-21.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 08:20:05 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 6D3331B0
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:20:05 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 6233F1AB
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:20:05 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 09:20:03 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20220911.0 ->
 5.9.20220925.0
Date: Tue, 27 Sep 2022 16:19:48 +0800
Message-ID: <1664266791-2194-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1664266791-2194-1-git-send-email-wangmy@fujitsu.com>
References: <1664266791-2194-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 08:20:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98960

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20220911.0.bb => ctags_5.9.20220925.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20220911.0.bb => ctags_5.9.20220925.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220911.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220925.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20220911.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20220925.0.bb
index 890e786320..f5bacfd961 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220911.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220925.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "fe5a84edb2951734489be8aef29c2d0bb296649c"
+SRCREV = "299fe525048358ecdfecb9ca91505333c0fb14f4"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


