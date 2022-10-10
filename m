Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62436C433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 08:37:03 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.4002.1665391017490284423
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 01:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kyi8O1n4;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665391015; i=@fujitsu.com;
	bh=JyNDM1+vIxPRdr2ZhAOeu+qkspG+0fAxORiUe8QXV68=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kyi8O1n4o9VZedf4HkTA9ThKTHR1VdO22Hj9I+U23J7yl5NE2gxspdbu2Fcoz8yXm
	 cpp3iyyMegCLzTI9jpkA+M1VQD5auZoWKRZnA4r6VfKnI4vPalYh5Iqc2f/BUH+Luy
	 ncEmRxAO0RLhPdFrDHZwxnd5SKz74Mbn9wBm7R0sUkdVTr9DpsFMBR3e694AJWxllA
	 4npilIwkHBf7sh74cjtE4BGsOIAY+e1CfDlIzBgF2l6Y/c9bkMo1EIcAqDboZSLy2p
	 G7LrCe1jseLSkIdeM48UofirPVLEHnIu27VLe4nq+svCQva/DezkRx3LG4d+E9Na11
	 rtzjcHY2TK1lw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRWlGSWpSXmKPExsViZ8ORpLv8pnO
  ywYvtshYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bRhlWsBbc5K7afKWlgfMvRxcjFISTwkFFi
  wuoGVgjnCpPEv++7mSGcPYwST94sZu9i5ORgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8es
  BphAQuJ2/+XsYHYLAKqEn869wHFOTh4BRwlVh/QBwlLCChITHn4HqyVU8BJoqPhGCOILQRU8m
  ffHrDxvAKCEidnPmGBGC8hcfDFC2aIXkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYBSchaR9FpL
  2BYxMqxitkooy0zNKchMzc3QNDQx0DQ1NdQ10jUyM9RKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1
  iitzk3NS9PJSSzYxAkM4pZjh8w7GBX0/9Q4xSnIwKYnyGhxyThbiS8pPqcxILM6ILyrNSS0+x
  CjDwaEkwbv6KlBOsCg1PbUiLTMHGE8waQkOHiUR3gcXgdK8xQWJucWZ6RCpU4zGHB8OXdnLzD
  Hza9sBZiGWvPy8VClx3gU3gEoFQEozSvPgBsHi/BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkY
  lYd5LV4Cm8GTmlcDtewV0ChPQKSevOoGcUpKIkJJqYGr5VK9++tu/iIiVh59Z/12esZfPSN7N
  xe/cm4/RRgpp9/9r87Crz1jgWmn9Sr5yuuBRe5Var7zZ8SYCMz5f2XzUxKh/a9OZLZ+X7Zib6
  rNhZUvNdHdR1929zy6ePrju8ju3j5Ei01ZE+zx279yhP2d5iQ3juyOXuIJPWx3vi485cdbi/8
  5534rP2AQppjwQn3/BUHZf25Zk56RMKctVkc0ST3aye0zZEF/aGu+y+6bsVK/zJV8cy6R6XxY
  6rX2eyNm8rLtFbjuzTQ6/S8yqo0lykg5BZ7TXvzFXu8J8oEEk6Ner94d+bHL7YTXvw4eP+qa/
  z+9bKB7p//+O+MbZa+9pvxV5fVRUkMdXXFuWnUWJpTgj0VCLuag4EQCDQQ9ObgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-591.messagelabs.com!1665391015!311090!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18911 invoked from network); 10 Oct 2022 08:36:55 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Oct 2022 08:36:55 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 214411B2
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:36:55 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 164D51B1
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:36:55 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 10 Oct 2022 09:36:53 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] st: upgrade 0.8.5 -> 0.9
Date: Mon, 10 Oct 2022 16:36:30 +0800
Message-ID: <1665390991-7978-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665390991-7978-1-git-send-email-wangmy@fujitsu.com>
References: <1665390991-7978-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Oct 2022 08:37:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99120

License-Update: year updated to 2022

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/suckless/{st_0.8.5.bb => st_0.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/suckless/{st_0.8.5.bb => st_0.9.bb} (82%)

diff --git a/meta-oe/recipes-graphics/suckless/st_0.8.5.bb b/meta-oe/recipes-graphics/suckless/st_0.9.bb
similarity index 82%
rename from meta-oe/recipes-graphics/suckless/st_0.8.5.bb
rename to meta-oe/recipes-graphics/suckless/st_0.9.bb
index e88c2c0f09..517d467abd 100644
--- a/meta-oe/recipes-graphics/suckless/st_0.8.5.bb
+++ b/meta-oe/recipes-graphics/suckless/st_0.9.bb
@@ -1,13 +1,13 @@
 SECTION = "shadow"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=04c3ca13a702147c62db90f556c5b3ca"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=703e9835709f45ee7b81082277f1daec"
 SRC_URI = "http://dl.suckless.org/${BPN}/${BP}.tar.gz"
 
 inherit pkgconfig features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "ea6832203ed02ff74182bcb8adaa9ec454c8f989e79232cb859665e2f544ab37"
+SRC_URI[sha256sum] = "f36359799734eae785becb374063f0be833cf22f88b4f169cd251b99324e08e7"
 
 DEPENDS += "libx11 libxft fontconfig ncurses-native"
 
-- 
2.25.1


