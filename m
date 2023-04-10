Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5714C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:30:08 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.40246.1681115399022486717
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XP7vgJ1i;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681115397; i=@fujitsu.com;
	bh=cvpP58lXL/Ouv3ToNsdMOytblH4ozXdg27oOpd8QdGs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XP7vgJ1iWlGJvfaTxfdgqSuUfqinXyy8fVHmSn3DRIfgbCAIitYRM8EYxTZow4JI5
	 5mW0lXTrNhrtloI5fTsIkkoN8ZOLjTRIi33/h6QR01CTLZBZ+oDMgsUtFsbTN4Stra
	 jX7b753ZJTmygYzRSPTEomhc5/gfG6mcpYBfBkqK+SUeaKAU3B41npsFz8SvKePe+r
	 3k45m94w6EAnR9nhJb1f7fM09Fs+xpWfYMpdjdHLg0rmKrX/nlrCoyYkdyTBvLwL2O
	 GnyqpZKwMZS9yJ1Mz0w5nkBcFioqMQMmsSqISg7BlEayr6zhQhVi7tC7KBJKlFFpbW
	 Q9q55CPESF5ew==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORpMty0jj
  F4PknYYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePG7xMsBf1cFY9nP2VpYJzL2cXIxSEk8JBR
  YvHDq2wQzhUmiSV/fzF2MXICOXsYJX68iAKx2QSkJG7c/88GYosI6Essnb2HGcRmFlCRePG7h
  x3EFhYIlNg/+RRTFyMHB4uAqsT8z14gYV4BJ4m+2/dYQWwJAQWJKQ/fg7VyCjhLnLt+iRlilZ
  PElg0f2SDqBSVOznzCAjFeQuLgixfMEL2KErMvN7NA2BUSjdMPMUHYahJXz21insAoOAtJ+yw
  k7QsYmVYxmhWnFpWlFuka6iUVZaZnlOQmZuboJVbpJuqllurm5ReVZAClEsuL9VKLi/WKK3OT
  c1L08lJLNjECQzelOPH2DsblvX/1DjFKcjApifJ2cRmnCPEl5adUZiQWZ8QXleakFh9ilOHgU
  JLgXXgAKCdYlJqeWpGWmQOMI5i0BAePkghvxTGgNG9xQWJucWY6ROoUo6KUOG/rCaCEAEgioz
  QPrg0Wu5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNuOww0hSczrwRu+iugxUxAi7lcDEA
  WlyQipKQamJpWHNZadz74kW3ontKD9RoXtmWp7ZJtYKjcYi24h+VKsW0U6/JEo6h3/WLNh60V
  p6w8siFy0RWWaccdQg9NEl8SviAj4IS48qI2nsioReGpzX85nCe99tt1UcDGpOOQtMOWXTmve
  /csZ5jLya0z535Wnu1fbn43K6G05D/MQSUM0lzFwamH1wprSyotMy+5cnKHcY5nWxr3yh9XhC
  3bGCwrww1Y+Xexnt3a+ri64dTXm3N8JvSG8jEumCriKR6z7bitnesTtol/Oq5FaKvI+Ij26db
  c+l/3cMmf33NsZjyy+35bZ9FEMzXGLSE1m+1YpzTz7+8WmbE2uezksgd95y7sZY51OSKUrRjM
  yyajxFKckWioxVxUnAgAIpoAy1gDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-732.messagelabs.com!1681115395!433414!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18419 invoked from network); 10 Apr 2023 08:29:56 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-13.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:29:56 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id C1C831CD
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:29:55 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id B6E5E1C8
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:29:55 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:29:54 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.17.1 -> 2.17.2
Date: Mon, 10 Apr 2023 16:29:23 +0800
Message-ID: <1681115363-24418-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681115363-24418-1-git-send-email-wangmy@fujitsu.com>
References: <1681115363-24418-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 08:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102019

From: Wang Mingyu <wangmy@fujitsu.com>

Bug Fixes
==========
    Do not create new JWT credentials if they make the same claims as the existing. 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.17.1.bb => python3-google-auth_2.17.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.17.1.bb => python3-google-auth_2.17.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.17.1.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.17.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.17.1.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.17.2.bb
index 9f324c700..42f84087a 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.17.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.17.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8f379b46bad381ad2a0b989dfb0c13ad28d3c2a79f27348213f8946a1d15d55a"
+SRC_URI[sha256sum] = "295c80ebb95eac74003c07a696cf3ef6b414e9230ae8894f3843f8215fd2aa56"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1


