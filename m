Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2B9C64EC4
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 11:05:44 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.6854.1677927933487862491
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 03:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UMEya6Ma;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677927935; i=@fujitsu.com;
	bh=X93Ljag/HOf0MwlywYGQkrJx0FVDJz316vV4QVdCsGA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=UMEya6MawYMuJAjEAJWj6PKi5oQm14ul3AlyXHon/lqATs6toleccddl2R08O9Kam
	 C6Zpo3PC1BxjFF7C/iU/0CZCGEGBHitnvFTzrFCorGqAKpiSxyFVdhFPxkEB6uZ74Z
	 sS2uDLviWIRQFc9hPsUwDbtHQKcpuJbGO5EbCjXTfp+FFrFBm4wuirCvYkvBX8D6dd
	 6bRvRLiQciIjG9vxLk6Rtgh/b6ch/3upYYMIOLIM/xMdSyfaQI8Et3Ohcq6+bcFYN1
	 ayNPj2eskZJBvezQQJ8cRk37q7LWg0WDch8YPLWla6CfEceniFgaYpySXsyhM5+L6B
	 nQymGUrLEWZ/g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORqPtflTn
  FoHEZo8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvH06SeWgh3cFXePPmFpYNzC1cXIySEk8IRR
  ov+NSRcjF5B9g0nix9L9jBDOHkaJk4+2soNUsQlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  1ANB4ewgJfEtmMqICYLUHjBtmCQCl4BJ4kp+7eCVUsIKEhMefgezOYUcJbYsuQ5G8QNThKLzy
  xkgagXlDg58wkLxHQJiYMvXkD1KkrMvtzMAmFXSrR++AVlq0lcPbeJeQKj4Cwk7bOQtC9gZFr
  FaFacWlSWWqRrqJdUlJmeUZKbmJmjl1ilm6iXWqqbl19UkgGUSiwv1kstLtYrrsxNzknRy0st
  2cQIDNyU4sTbOxiX9/7VO8QoycGkJMo7iZUhRYgvKT+lMiOxOCO+qDQntfgQowwHh5IErwwwF
  oQEi1LTUyvSMnOAUQSTluDgURLh3SIClOYtLkjMLc5Mh0idYlSUEucVUAZKCIAkMkrz4NpgkX
  uJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvFhWgKTyZeSVw018BLWYCWqxxmgFkcUkiQkq
  qgcnxjIDjLa881aCyad4XrvzyDE+MydObseOZy3xZ+bIF93Z7a22ffXL+j0Ob1sf5GEvrb6o/
  H2zFZSWyr1Q6d8Nf9mWpMxoWetf+vLr7RZF+6ZGdh7znZBx9+zb2+4nWJy4bZ+1qV5oXGnR7m
  oxwTY6S8pfbwYk+ji6SytaMyw6wfTT5KZXbZTTf6R2Pz6LNay3q/mxS4Hdd8utvtt+TlivPtx
  5LPN995I6GsdXEd1J/eFNyjJt0vzJ62zDWGXcHcWyUuDrdz3BCiv5M68urzwktmbww4PyV71n
  nOMJeTVp9PcPq7FnxjR99AiSui/x4bpWhc6B87ca0TSeeP893dDp3YLqyN5vo4Tz9e4oW23mU
  WIozEg21mIuKEwHgaGfIVwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-728.messagelabs.com!1677927934!137174!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6587 invoked from network); 4 Mar 2023 11:05:34 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2023 11:05:34 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 70BA110019F
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:05:34 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6476B10019D
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:05:34 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 4 Mar 2023 11:05:33 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-aiohue: upgrade 4.6.1 -> 4.6.2
Date: Sat, 4 Mar 2023 19:05:16 +0800
Message-ID: <1677927919-22891-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677927919-22891-1-git-send-email-wangmy@fujitsu.com>
References: <1677927919-22891-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 11:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101362

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Add missing LONG_PRESS enum member for button events (#190)
Mark auto_dynamic attribute optional on scene resource (#189)
Fixes for some small schema parse errors (#188)
Make active_timeslot optional in smart_scene model (#177)
Add util methods for backwards compatibility in Scenes controller (#176)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-aiohue_4.6.1.bb => python3-aiohue_4.6.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohue_4.6.1.bb => python3-aiohue_4.6.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_4.6.1.bb b/meta-python/recipes-devtools/python/python3-aiohue_4.6.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohue_4.6.1.bb
rename to meta-python/recipes-devtools/python/python3-aiohue_4.6.2.bb
index 7e915fd3d..b9256ca20 100644
--- a/meta-python/recipes-devtools/python/python3-aiohue_4.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohue_4.6.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
 
-SRC_URI[sha256sum] = "afe44307ff2453e20323009cb315de3896d551afd0635b57381a278bb2119d48"
+SRC_URI[sha256sum] = "069af6bb0a7d34d566538af57cc10fb691ee04f844204e4f67d95a57f0b91a46"
 
 inherit pypi setuptools3
 
-- 
2.34.1


