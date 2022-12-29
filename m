Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4D4C3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 03:30:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.55613.1672716636677152260
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jan 2023 19:30:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pi3FO37u;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672716634; i=@fujitsu.com;
	bh=ZMOAWw5I+DHlX4+S32TDESNZlKWdQTeJgYNjFnl8gyU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pi3FO37uUX89h02nKJSAvLXz+rKA5fgyFrDR1EFK9a1oknppt/E/jpIPJKQCwdLid
	 4kBg6hJ+HJKgEk6PLt8iLV/1XtBt8YsdJd7pXqPXWs4VchcNDEFO9P+FAoNceAoeTr
	 GMfRXTcgye295ZShHU6rDgcmwWucpvXodSXuJ6OvBWG9h9yyHRzllovud55C8/9RjH
	 6/UinybwO3RTBh/0K5KubGSV12X0qKBDr0ckXN2TC/0bVmVnkBL1iucJiYxHL7NVGG
	 YV8wLVKcZ+aGeAJDJGMQZPDSUvK0iQmBhCqhnL+aHfjh4ZDMH4lDxBvDChtmW4bYD5
	 wD+r18qUyHvaA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8ORqBu1cHO
  ywZ8X8hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aKZx9ZCv5xVWz7e4OxgXEeVxcjF4eQwBNG
  iRm75rBBONeZJDq/9kM5uxklJhxbAuRwcrAJSEncuP8fzBYR0JdYOnsPM4jNLKAi8eJ3DzuIL
  SwQLLFi0SFWEJtFQFWiZ84RMJtXwEmi62wLI4gtIaAgMeXhe7BeTgFniamvV4DFhYBqPkzcxA
  hRLyhxcuYTFoj5EhIHX7xghuhVlJh9uZkFwq6QmDWrjQnCVpO4em4T8wRGwVlI2mchaV/AyLS
  K0aw4tagstUjXUC+pKDM9oyQ3MTNHL7FKN1EvtVQ3L7+oJAMolVherJdaXKxXXJmbnJOil5da
  sokRGL4pxcnsOxjfLPmjd4hRkoNJSZS3fO+mZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvDzzN
  ycLCRalpqdWpGXmAGMJJi3BwaMkwntoHlCat7ggMbc4Mx0idYrRmOPuwr17mTk+HLqyl1mIJS
  8/L1VKnFdkLlCpAEhpRmke3CBYjF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMw7H+Qensy
  8Erh9r4BOYQI6JWnNRpBTShIRUlINTJ1mK38enh0ZnhLFoxU6rfKz30E2711h/6Y6On826n7k
  NT9vD+vc+fN4Y0XX3HDb6r7HZ1rClzkaVn9Pbrpeu8V8wpye3sUs6isT6y4vmPRm5rulsUong
  2wWHuyXVw56fdLrga7HTOucqLbWKTPE20QrZ/+JW924S+3utKM7cj99DL/M0j5xt7ZRv0GPUZ
  9zu6uAnqPs1f/sShM/LCm7yOO8JOjxhlV3rxgXC4nm9V+a/sH88cftNuxfBJkSfFmFWCdclXS
  e5HDzhPmWA0XV6941hLxR+1Y0x+j1n44QvvbwL8vcdpzM+N40oVSAbaawB1uywb81x4PeLZK6
  aNKV33dyeyVzw/0nR7uASVktTImlOCPRUIu5qDgRAKNkWmtsAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-728.messagelabs.com!1672716634!277380!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22848 invoked from network); 3 Jan 2023 03:30:34 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jan 2023 03:30:34 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id EB771100192
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Jan 2023 03:30:33 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DFD2E100182
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Jan 2023 03:30:33 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 3 Jan 2023 03:30:32 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] network-manager-applet: upgrade 1.26.0 -> 1.30.0
Date: Thu, 29 Dec 2022 12:46:55 +0800
Message-ID: <1672289215-16118-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672289215-16118-1-git-send-email-wangmy@fujitsu.com>
References: <1672289215-16118-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 03:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100353

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...anager-applet_1.26.0.bb => network-manager-applet_1.30.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_1.26.0.bb => network-manager-applet_1.30.0.bb} (90%)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.26.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.30.0.bb
similarity index 90%
rename from meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.26.0.bb
rename to meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.30.0.bb
index 0c4834c94..8c7564a8e 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.26.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.30.0.bb
@@ -9,7 +9,7 @@ inherit features_check gnomebase gsettings gtk-icon-cache gettext
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-SRC_URI[archive.sha256sum] = "69611b29064adbd57395fe3e51a9ebde1ea794615f776900453a2bbe3d8cddfd"
+SRC_URI[archive.sha256sum] = "9516b84e9d9f100db89a0c67cbfe57cedb0562310d45caafb6332e27bbeb5cd3"
 
 # We don't not have ubuntu's appindicator (yet?)
 EXTRA_OEMESON = "-Dappindicator=no"
-- 
2.25.1


