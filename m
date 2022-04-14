Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104D8C49ED8
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:55 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web08.7626.1649906747527435297
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 20:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=J4UsJrTj;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649906745; i=@fujitsu.com;
	bh=Y8VnpibxzLg3Bx776WFmzO1ES6MNxhIARREDQqMmEZI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=J4UsJrTjKeYxv0wxi8j6JWQJJbG6h2eqG/UB1RRbe5SNZUbrcbutulEIZZhjvqALx
	 eswu6AdSjljA+KJ2EUoU1NtU75NyqtWkW4hWNw/uD4vMNenf8g7vtx1QkmohWAX8gi
	 5+8sDj0w9hRAQrK7qo/VbsFMlV9yyyhpUQZ3VSWyn/2JF7HEokUiNb4Akjs/gn2BET
	 CT7eaHVj2SdHFalddjZJGFoFz+zaUrU9rHqI88OV5HPATPa1d2OMHJhG3dsWChrkjp
	 bmE1GVUBvmRcTO7J3MlgWT2Za4yN8qEJLOnSeG8R7/TMThMoVYnPgVPGl6kpNMZC0T
	 yojzNk9DFj4SA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8MxSddiSni
  SwbFT0hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bFzuCCo+wV278tZ25g/MTWxcjFISTwhFFi
  0+Mn7BDOBSaJuz9nQDl7GCWadv5m6WLk5GATUJOYfusGK4gtIqAvsXT2HmYQm1lAReLF7x52E
  FtYwErixrufjCA2i4CqxOzD58BsXgEniZ3bnoD1SggoSEx5+B6sl1PAWWLt9rtgNUJANQfPn2
  eGqBeUODnzCQvEfAmJgy9eMEP0KkrMvtzMAmFXSMya1cYEYatJXD23iXkCo+AsJO2zkLQvYGR
  axWiVVJSZnlGSm5iZo2toYKBraGiqa6JrZGypl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmb
  nJOil5dasokRGMQpxSzvdzA29f3UO8QoycGkJMqbZRieJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ
  0mC12kiUE6wKDU9tSItMwcYUTBpCQ4eJRHern6gNG9xQWJucWY6ROoUoy7Hh0NX9jILseTl56
  VKifPunARUJABSlFGaBzcCFt2XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzOk0GmsKTmVc
  Ct+kV0BFMQEd8WxUKckRJIkJKqoGJV6jbTGneVJWNYZNlenTCDROs16uu8dM6PMlD0Sbvf+Ds
  QNH1TXd+SdQu7/7pel3bd9OCSeu3KhgKrueu5Bf0SStdWPrhu7uR/HR5T2vJhPtuO0NnhDg+f
  JSUlsbObcHrVt5aJ7qocQnz0jP5tuYK+jcW/13SmfK6/6y7oKl4677M1D3164Tzrh8ysqyxeS
  Bu+0/+sr/cTYsLPWdn2y4z8ZD+Kv7Q+ug8/7dng0tElvFPdPvLrhgXczlgZ6iIhfz+Lc6KXk7
  2C33a6+Tns26cusrqdEUb+yuNz4pTdu07GP+aIarOy+00R8Bld8Hl6ldsJnr8Ebp0ct5kvdWx
  Kuf6j3ffdvrAWCeadVIoVImlOCPRUIu5qDgRAAo9l91pAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-585.messagelabs.com!1649906744!58286!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29040 invoked from network); 14 Apr 2022 03:25:44 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 03:25:44 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 07FCD100472
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 04:25:44 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id EFD37100467
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 04:25:43 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 04:25:27 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] st: upgrade 0.8.4 -> 0.8.5
Date: Thu, 14 Apr 2022 11:25:19 +0800
Message-ID: <1649906719-18151-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649906719-18151-1-git-send-email-wangmy@fujitsu.com>
References: <1649906719-18151-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96644

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/suckless/{st_0.8.4.bb => st_0.8.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/suckless/{st_0.8.4.bb => st_0.8.5.bb} (90%)

diff --git a/meta-oe/recipes-graphics/suckless/st_0.8.4.bb b/meta-oe/recipes-graphics/suckless/st_0.8.5.bb
similarity index 90%
rename from meta-oe/recipes-graphics/suckless/st_0.8.4.bb
rename to meta-oe/recipes-graphics/suckless/st_0.8.5.bb
index acd4cab965..e88c2c0f09 100644
--- a/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
+++ b/meta-oe/recipes-graphics/suckless/st_0.8.5.bb
@@ -7,7 +7,7 @@ inherit pkgconfig features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "d42d3ceceb4d6a65e32e90a5336e3d446db612c3fbd9ebc1780bc6c9a03346a6"
+SRC_URI[sha256sum] = "ea6832203ed02ff74182bcb8adaa9ec454c8f989e79232cb859665e2f544ab37"
 
 DEPENDS += "libx11 libxft fontconfig ncurses-native"
 
-- 
2.25.1


