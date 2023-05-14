Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC1DC7EE26
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 13:04:35 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.66030.1684069467145815266
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 06:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HgyN3m0b;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1684069470; i=@fujitsu.com;
	bh=k9J74LNSiiLqmqhOX9JCNh726gDvd+J0eRWlipiylbg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=HgyN3m0bd2IPdX+Lg7rQ+OQknyXmdfYDsYowz+9qHtdlPKjNdSi1Pp/1upw3n6Hdc
	 yb+AP8l4gNwkC78o7CHlpb4tPl4b7Z5n5XoBcNHw4yBvOvqw1IU1Mth7wboZwCDYUE
	 hPHfHS2kXGUewFYVqyPiTdmiYe9/smrfbF/PQW1f4UgX17kcO7pjuqDy0n7fzi/ZqL
	 4nMQEoh0Eck87RXgW7rG85F1RkkF/adnk9NbRibicnFYXR8vSO0SRm5ECRh/rb84jl
	 jQkHYZba2pOyt10K94wXFPx61uWGoJdmVvH5g+mzlAGmtLwTxuKYxmkxeUSDewZO62
	 yZ4hwO4nDtGJA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDLMWRWlGSWpSXmKPExsViZ8ORpBt7JyH
  FoOs0t8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFlxS7GgnecFS9uTmNtYGzk7GLk4hAS2Mgo
  Man7DSOEM5VJ4snMdWxdjJwcbAISEtP3nmQHsUUEdCU+fpjLCGIzC6hIzJh8hAnEFhYIkOhrf
  AcWZxFQldj2+CVQLwcHr4CTxIsZ/CBhCQEFiSkP3zOD2JwCzhKrth1kBbGFgEqmLbjNCFGjJn
  H13CbmCYw8CxgZVjGaFqcWlaUW6VrqJRVlpmeU5CZm5uglVukm6qWW6panFpfoGuollhfrpRY
  X6xVX5ibnpOjlpZZsYgQGREoxm8AOxrm7/uodYpTkYFIS5b1WEpcixJeUn1KZkVicEV9UmpNa
  fIhRhoNDSYJX52ZCipBgUWp6akVaZg4wOGHSEhw8SiK8cVeB0rzFBYm5xZnpEKlTjLocV69c2
  cssxJKXn5cqJc57AGSGAEhRRmke3AhYpFxilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMzLcw
  NoCk9mXgncpldARzABHXFrTzzIESWJCCmpBibfqRrHe+2LmD6Hz0jy3c1p/3bdufnNvZv3xz5
  qC33fPNm52XI5Q1jh4c3+UTs6J22bEms8LaCiwljj5eXZ7bNXvT6ez2SVW/fvunXX7o6mhMyy
  uK5fXYe5bmVcN7Q1X+8vyffHVM/HNfO528GP63ikTPhupn9z0WicttJ853LZNJPnKQszJkps2
  fFfxHT18blHec5csN296pxEmXiJreuZNcrpIVelbmh8Xf6g4+cvHv1zrk8+FYi11d86viLR+y
  XrkoW17wObmrfX8CZoOOo9VyoM+8U1JbvKIqiPOfzf92xvzx2M9nPt27YnfhETWTzzwaekohf
  cayd0a86R6zxqLhtyWmHez6ATgRltb5RYijMSDbWYi4oTAV527DwPAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-591.messagelabs.com!1684069468!242252!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26829 invoked from network); 14 May 2023 13:04:29 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2023 13:04:29 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id CE6031AC;
	Sun, 14 May 2023 14:04:28 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 0111D7B;
	Sun, 14 May 2023 14:04:27 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-platformdirs: upgrade 3.5.0 -> 3.5.1
Date: Sun, 14 May 2023 21:04:02 +0800
Message-Id: <1684069442-12244-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684069442-12244-1-git-send-email-wangmy@fujitsu.com>
References: <1684069442-12244-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 13:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102570

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
Add 3.12 support
Add tox.ini to sdist
removing Windows versions
Better handling for UNIX support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-platformdirs_3.5.0.bb => python3-platformdirs_3.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_3.5.0.bb => python3-platformdirs_3.5.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_3.5.0.bb b/meta-python/recipes-devtools/python/python3-platformdirs_3.5.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-platformdirs_3.5.0.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_3.5.1.bb
index b5ff369d04..4fefe565f1 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_3.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_3.5.1.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRCREV ?= "dcb56802714f5570236c86d03773ff881be6e39f"
+SRCREV ?= "b8c42ddca4def1fba38b9815a7d94ec2ac630b29"
 SRC_URI[sha256sum] = "7954a68d0ba23558d753f73437c55f89027cf8f5108c19844d4b82e5af396335"
 
 inherit python_setuptools_build_meta ptest
-- 
2.34.1


