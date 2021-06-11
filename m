Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.3363.1623379526555937259
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jun 2021 19:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Vh+qzc9W;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623379524; i=@fujitsu.com;
	bh=i8Qz9qLFMmzgYQLOiYHipeRPlKjlp2yLdDCJnM1dHFc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Vh+qzc9WoormJxFC2CLPx/OOAxDIftRGBImT7QOmk3c2Ab9jGJNL24jZE97JDCm4D
	 z38HTGvUkMFxiN443S+wBApr9UFapcBwsHe1BQg/l4JgXb11LFh5l+WUQkeNz+yqal
	 hiYSjE9JAoYlNMZJLOHUNgyfPTdIngYh+URQWEfS3emcFdryFL9yxWGRlezQ4jWA8n
	 CtIehsQ0WTUrQmRnzJjpdtKfwUDV1Isqi0+SFMFS03p/MAWTwtomTF1IX8wyNTw23n
	 PEEArg2Z2oWARZA+Uv0TUga+gq2Lu2bUfh6A/0s4bCvSUHODGzTstGK9fp80zowe+K
	 YCeBUHwK2xU7g==
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 4E/73-25406-44EC2C06; Fri, 11 Jun 2021 02:45:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYouty7lC
  Cwfq5PBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b3+duZC/o5K1pa5zM3MC7i6GLk4hASmM0k
  8f3dFZYuRk4g5wSjxO9HKSA2m4CORMeLbrC4iIC+xNLZe5hBbGEBR4mPXT9YQWwWAVWJI/ePg
  NXwCrhLXDr4hQnElhBQkJjy8D0zRFxQ4uTMJ2A1zAISEgdfvGCGqFGU2L7zDAuEXSExY8Y2tg
  mMPLOQtMxC0rKAkWkVo0VSUWZ6RkluYmaOrqGBga6hoZGuoaW5rqGxuV5ilW6SXmqpbnlqcYm
  uoV5iebFecWVuck6KXl5qySZGYBilFBzt3MH469UHvUOMkhxMSqK8OQcPJQjxJeWnVGYkFmfE
  F5XmpBYfYpTh4FCS4H1yBignWJSanlqRlpkDDGmYtAQHj5IIb/ZxoDRvcUFibnFmOkTqFKOil
  DhvyVmghABIIqM0D64NFkeXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnz5oBM4cnMK4Gb/g
  poMRPQYmYNsMUliQgpqQamiF8Lo2tmvLu3r+xFnXbl1vV3Hglp7LohdTFFWLjsULqE0iJhPSZ
  WbWflywpebRs/bBM+tWb6szO7ewyfLz4tHeLyj/sdzy9N1jNXXV++2sYpdHqBnJDEuoOHg1KS
  Jbt+zXTfZLWjbdPsadFz4qP0u9KePj3m1pCk8vSA6/PMmjl1fxY0SF0/zfw7QovPzSk1Nvv+B
  aH7Md/1lQzP/ONiZvjxRNOM24Zvq7jPnfvF06v3MFtJc5RKfe27yvZVt4TjxJl8iXs28y4Vyv
  hUdr/K0V9ZLLCmLUL7zy2XP6mPOLkrruokqjmqhTT9qTDz3+5s47uhIu1Za1Vv6fb/l74KOFw
  20UlZWPyuznbDPW4lluKMREMt5qLiRADN7+P0HgMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-287.messagelabs.com!1623379523!214300!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5253 invoked from network); 11 Jun 2021 02:45:24 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-9.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jun 2021 02:45:24 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15B2jNIB032341
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jun 2021 03:45:23 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 11 Jun 2021 03:45:22 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] rasdaemon: upgrade 0.6.6 -> 0.6.7
Date: Fri, 11 Jun 2021 10:45:15 +0800
Message-ID: <1623379515-46121-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../rasdaemon/{rasdaemon_0.6.6.bb => rasdaemon_0.6.7.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/{rasdaemon_0.6.6.bb => rasdaemon_0.6.7.bb} (97%)

diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.6.bb b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.7.bb
similarity index 97%
rename from meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.6.bb
rename to meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.7.bb
index 93e00e6e01..39ed3d1071 100644
--- a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.6.bb
+++ b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.6.7.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/mchehab/rasdaemon.git;branch=master \
            file://rasdaemon.service \
            file://init"
 
-SRCREV = "32b978fcf73215c90ce7383580224e4295930ae7"
+SRCREV = "aa96737648d867a3d73e4151d05b54bbab494605"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

