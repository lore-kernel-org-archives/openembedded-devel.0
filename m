Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B83C3A59F
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.6756.1649900771960002961
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 18:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BuDWp2uB;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649900770; i=@fujitsu.com;
	bh=Wme/Ta2i4SllCV2sge+6WuIRy4iV45l3rwMYypHRHH0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BuDWp2uBYSFRALfs2ei0L4YBk/3Sl+Vu1+GiPMJdzznJA5YY/07ZOAMs5xl4CpyEy
	 b+SNe5+e4r1J4sTJX3DuwhHcraYFmtHgJ5NRqs01qj3LgMA8DJ/D0mM/QOBeBZkcfA
	 7VKRKPHDnQpb8h/BrjNoh2V6pVUsr04Po4qTyl9xjk2UpS9RyyGqJ9tvmg1wr1EImr
	 GfFJ3+eY1hjpU/JNb6rJOUg1w5B3UT8JP5QJAk6/4spUD01DI5MErJfdG/2dHvy7ag
	 ZHrcT21zUIA5hvaqpFgYPkK/jM8Rl2fwBH/9RxIXNKyugwFXIbcWrsC9P2rTiwTvP2
	 fodBwrYvi2vRw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8ORqPuwJjz
  JYOtLMYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePqG4+CFs6KBQ9b2BsYV3N0MXJyCAk8YZT4
  dYyzi5ELyL7AJNE44TI7hHOSUWJy+zEWkCo2AXWJxzdfM4LYIgL6Ektn72EGsZkFVCW6L65hB
  7GFBTwl/lxsBouzAMU/9+8Ei/MKuEns+76HFcSWEFCQmPLwPVANBwengLtEc3M8xBFuElef3W
  SBKBeUODnzCQvEeAmJgy9eMEO0KkmcWPGRCcKukHh9+BJUXE3i6rlNzBMYBWchaZ+FpH0BI9M
  qRuukosz0jJLcxMwcXUMDA11DQ1NdYwsgZaiXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuc
  k6KXl1qyiREYwinFavk7GP+u/Kl3iFGSg0lJlDfLMDxJiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gTvqSqgnGBRanpqRVpmDjCeYNISHDxKIrxz8oHSvMUFibnFmekQqVOMilLivAnAKBQSAElklO
  bBtcFi+BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd6D1UBTeDLzSuCmvwJazAS0+NuqUJD
  FJYkIKakGJp04Zvkj244yOjXz11TvlpmxobV3MttshhlzPjLXKW3lddNSTvyoO/nRvN8Xb17I
  W75gjeismz2bbY5s3R/8hP1l3ql5emoPdctM31l9fzLTpGXxxNvsjsY/v8xMVmz99IpvsucSF
  rGpKfN8/kw0jn8tZCHyLzAqQKzl394FH854M+9/sih//fHroku/XWZ7PjE93rj0VTSnIqPftU
  ssL5aITut8ojrp/jtxZcauX9HtYsrxE29qL6jaUs7yc8+fTGWb6Ivalx68F/aQcJZcX8Mm2vf
  9trXUlAnCW7mPrGzb1i3urvgsYOWpHQlHz/d1KXKK5sz0qKyeslhYWsOZ/VTPA+urenPSHpZx
  Reub7FZiKc5INNRiLipOBAAc4Uw/XAMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-571.messagelabs.com!1649900769!54030!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3095 invoked from network); 14 Apr 2022 01:46:09 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 01:46:09 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 003C4100181
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 02:46:09 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D2F31100197
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 02:46:08 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 02:45:55 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-redis: upgrade 4.2.1 -> 4.2.2
Date: Thu, 14 Apr 2022 09:46:18 +0800
Message-ID: <1649900780-5925-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649900780-5925-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1649900780-5925-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96624

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-redis_4.2.1.bb => python3-redis_4.2.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_4.2.1.bb => python3-redis_4.2.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_4.2.1.bb b/meta-python/recipes-devtools/python/python3-redis_4.2.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-redis_4.2.1.bb
rename to meta-python/recipes-devtools/python/python3-redis_4.2.2.bb
index 9370cbab67..1e70cf4843 100644
--- a/meta-python/recipes-devtools/python/python3-redis_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_4.2.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51d9ad56299ab60ba7be65a621004f27"
 
-SRC_URI[sha256sum] = "fe45513881229dbee610620b9e0817b1f48c47ba635870320fd44a712204bbdd"
+SRC_URI[sha256sum] = "0107dc8e98a4f1d1d4aa00100e044287f77121a1e6d2085545c4b7fa94a7a27f"
 
 inherit pypi setuptools3
 
-- 
2.25.1


