Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56399C54F3E
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:49 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.2661.1649137392987846181
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 22:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Z1gRDW1N;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649137391; i=@fujitsu.com;
	bh=uiBeNiesg3yiQSxbQJ6beXh0DLJKqkh8pNC6pa8zjMU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Z1gRDW1N4YFBlcVT3h4r8mqX3VFYJ07YYl2BV6ZV3DZHaNwymH3W7JSrPnyXdI8Kh
	 4U1LRkFxZkajFkt7OlhP1hclb+4M+fmRbGB5l5epGAC0CwnTxWQrYXx+TIaXtn2lbt
	 DBax2gAsPDbW+pOU8J7v4ft3uCLskzD3Fx913G4IBow0a26Fn3325BR45DpLqvguBX
	 m7thqswOTdTYdUJg7XPj5foOLb29Q69/wX4rNVPBxumEfi/R9Aysr1XIW7fdH9TNJH
	 FYOTCpbLH514+ABciRS3sj8uba+PaYlqi7z8Yl11Xo0cUOzZFlk0lG8qg8LhPup353
	 Y43c4ifHHZWMA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRWlGSWpSXmKPExsViZ8MxRffdNe8
  kg9dNOhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ay03fYCo5zVJx6dpWxgfELexcjF4eQwCwm
  iY1X+qGc3YwSXb8vMnYxcnKwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPO4gtLOAssWz5P
  xYQmwUovvHyOTCbV8BJ4u/t3WD1EgIKElMevmeGiAtKnJz5hAVijoTEwRcvoGoUJWZfbmaBsC
  skZs1qY5rAyDsLScssJC0LGJlWMdolFWWmZ5TkJmbm6BoaGOgaGprqmgMpMzO9xCrdRL3UUt3
  k1LySokSgtF5iebFeanGxXnFlbnJOil5easkmRmCwpRS7LdvBuK/vp94hRkkOJiVR3jOu3klC
  fEn5KZUZicUZ8UWlOanFhxhlODiUJHhPngXKCRalpqdWpGXmAAMfJi3BwaMkwnvkIlCat7ggM
  bc4Mx0idYpRl+PDoSt7mYVY8vLzUqXEeW9eASoSACnKKM2DGwGLwkuMslLCvIwMDAxCPAWpRb
  mZJajyrxjFORiVhHmtrgJN4cnMK4Hb9AroCCagI96d8QQ5oiQRISXVwHSp4sSqd3NqMzece2P
  evvrg+wWZ/xofpHNtTQrpX6z3/6ZPtHxq6jqeDYoVdkZFO5cbLW9IEhN2Xxpc8jVqq+43s8P9
  qYv+fN08PSfycuWEqx/XMHk7sX///+rQHbdwn847futyuLsYz6vecQ/394zXSz8hdmmSywWVt
  qdnVzPu1S3NZTP2Wc+w/ti52CveAs8D8qX8pdTcFPOj7X96L1LaU7K59bDnv5dXOrOVFxfoTI
  mvkH1531J2SsCkwvjcA9v8dOTE33yufNJ+MPbWjwKPOPHUa153dzuvfOx+LOp5cdDKd2teeGv
  l9S+eKBXYyXh7SadE1NX8pXpXNlXET6k3kn/XWb7vpYPr5KTj/EosxRmJhlrMRcWJAOyr+MA9
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-532.messagelabs.com!1649137390!42948!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 573 invoked from network); 5 Apr 2022 05:43:10 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-18.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Apr 2022 05:43:10 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2355hAVO012911
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 5 Apr 2022 06:43:10 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Apr 2022 06:43:08 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] zenity: upgrade 3.41.0 -> 3.42.0
Date: Sat, 2 Apr 2022 20:39:48 +0800
Message-ID: <1648903188-19984-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96417

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/zenity/{zenity_3.41.0.bb => zenity_3.42.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/zenity/{zenity_3.41.0.bb => zenity_3.42.0.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/zenity/zenity_3.41.0.bb b/meta-gnome/recipes-gnome/zenity/zenity_3.42.0.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/zenity/zenity_3.41.0.bb
rename to meta-gnome/recipes-gnome/zenity/zenity_3.42.0.bb
index ea1db575e4..ba2d4594a8 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_3.41.0.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_3.42.0.bb
@@ -14,7 +14,7 @@ DEPENDS = " \
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.sha256sum] = "19b676c3510e22badfcc3204062d432ba537402f5e0ae26128c0d90c954037e1"
+SRC_URI[archive.sha256sum] = "c24c7fe6bb43163ced8adf232d583b2e013d3ba6c28deb5fcf807985e3deb5ef"
 SRC_URI += "file://0001-Harcode-shebang-to-avoid-pointing-to-build-system-s-.patch"
 
 PACKAGECONFIG[libnotify] = "-Dlibnotify=true,-Dlibnotify=false,libnotify"
-- 
2.25.1


