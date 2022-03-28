Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48383C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 09:40:52 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.9007.1648460446787215579
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 02:40:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZLubRex9;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648460445; i=@fujitsu.com;
	bh=CxeFLDbXOFz/XmKXg54c9gEJMFL9UpffQFcNxgz86wA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ZLubRex9XxUG5g8664PqMDoiwFwBPqjuAQURy4ndhzi5oC0X93ansk6+Wz8ni6JM3
	 yn3ylMlgb9Nwj9+A+EBfUZQ3XaCBiaBubrzLY1LIwzf4IfQLjTlsdn+xBDkZdjvE6G
	 87W5+vaqCwdOvpyogcsHUV/Ni34n5O0TVJWBmZqioe/mKtUFND8pvMV/Kg4HeHZemo
	 MhTjmYDxatEqIXfotUM56s/+hu92DBUDIzvCRnFXL1X4q6Aqx1nA3Oc9ahkI9ORUmX
	 Cc2aA6Lifnzk5PLUwMQh4jygAICXHZsJsQzY6e/d+7b0E06K1ldTz17yf1KZD8ceLL
	 mKVjaQv1QLD9A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqDunyTH
  JYPYdY4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP//f3sBRM5KpZuv8PYwLievYuRi0NI4Amj
  xNKpU9kgnAtMEo/u3GftYuQEcvYwSvx6mAtiswmoSUy/dQMsLiKgL7F09h5mEJtZQEXixe8eo
  EkcHMICzhI3H9eAhFkEVCU2XXoBVs4r4CTxqv0CE4gtIaAgMeXhe7BWTqDy7gdv2CFWOUkcPn
  EXql5Q4uTMJywQ4yUkDr54wQzRqygx+3IzC4RdITFrVhvUTDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGK2TijLTM0pyEzNzdA0NDHQNDU11jS11jQyN9RKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitz
  k3NS9PJSSzYxAoM4pVj96g7Gzat+6h1ilORgUhLlNcp0TBLiS8pPqcxILM6ILyrNSS0+xCjDw
  aEkwVvRAJQTLEpNT61Iy8wBRhRMWoKDR0mEd0INUJq3uCAxtzgzHSJ1ilGX4+qVK3uZhVjy8v
  NSpcR51zYCFQmAFGWU5sGNgEX3JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvGYgU3gy80r
  gNr0COoIJ6Ii172xBjihJREhJNTCxq8VvYFrTs3jjv1PObNI+/ufbK3S+n7m5I2PtZemVdh0n
  fj99VHXryK22omUl92Ju62mE/2WODZVsv7I+OctkQfPl+SaLLmTNqO29Nv+k3OLqn09j/S882
  bb9YnMu41b5XJ9/q7Oaz6ycarnOY/c5F8Vjt/LPsCe3fv578N0S1jk7XG98evhzx7ezm59lGl
  xZI35lQ8evGPnPv0LzbBlqymREQz21LJ5zCTy/d2my3qppeWf/XDuQzvnfRWzZ0j+L/OY27da
  6WxcbXR4t1//koknwbAu5754ZXZ1bThjrXSt6tsMt6/LRe8d/lbW3WKyPq02U3fX9sZ+u1+QU
  62gfueTyXRZmN29MvZSxVG9BpBJLcUaioRZzUXEiAB/4yoppAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-571.messagelabs.com!1648460444!24404!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22292 invoked from network); 28 Mar 2022 09:40:44 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 09:40:44 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4B459100196
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:40:44 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 1E4E4100186
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:40:44 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 10:40:25 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libwacom: upgrade 2.1.0 -> 2.2.0
Date: Mon, 28 Mar 2022 17:39:42 +0800
Message-ID: <1648460382-15591-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648460382-15591-1-git-send-email-wangmy@fujitsu.com>
References: <1648460382-15591-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Mar 2022 09:40:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96229

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libwacom/{libwacom_2.1.0.bb => libwacom_2.2.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/libwacom/{libwacom_2.1.0.bb => libwacom_2.2.0.bb} (93%)

diff --git a/meta-gnome/recipes-support/libwacom/libwacom_2.1.0.bb b/meta-gnome/recipes-support/libwacom/libwacom_2.2.0.bb
similarity index 93%
rename from meta-gnome/recipes-support/libwacom/libwacom_2.1.0.bb
rename to meta-gnome/recipes-support/libwacom/libwacom_2.2.0.bb
index 226446dcbb..78f5a289c6 100644
--- a/meta-gnome/recipes-support/libwacom/libwacom_2.1.0.bb
+++ b/meta-gnome/recipes-support/libwacom/libwacom_2.2.0.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=40a21fffb367c82f39fd91a3b137c36e"
 
 SRC_URI = "git://github.com/linuxwacom/libwacom.git;branch=master;protocol=https"
-SRCREV = "0f263ce26edc47587d5f7604e44fad1b61240c3d"
+SRCREV = "be485deca03157b0dbd702c7acaf35b71378be9e"
 
 DEPENDS = " \
     libxml2-native \
-- 
2.25.1


