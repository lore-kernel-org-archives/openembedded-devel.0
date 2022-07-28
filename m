Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A7AC3F6B0
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 02:14:54 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.28160.1658974486569601868
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 19:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vU9jadks;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658974484; i=@fujitsu.com;
	bh=bb6rbdDpbwmJoN1EyEIDOss7bHwe6VpSVZ8+HOXyWSg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vU9jadksGCRfkw3mnJSBA5Qq2eiCZu/QrMHJrTAdnrWN3NPZnnCy7yTH6l9rqyrAj
	 oGpiaNDRJXkkLdcCarElnJMotMidUmIanIy1OCVOOGljJgsFCt9niT70aza5j89YnA
	 2TdEKkenfvH11W4k052k/D4YhjgQdb39Y6pZbbxdf3vqP28BeRzGtsF5PX6zvxCvlR
	 84Jxv/H5dXWK6jPqnsidTvcpyKQJOALRBs5Jq312LVs98d7Ah2oBbXYQlA/weDgf9T
	 GHEZCqRqdTTHsgr8cYKcp+usglc8M6HW5tZ7rJOVe2VZeLu6jFdukMVXlqzF+wP5eB
	 XkkzflXuxFGug==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8ORqCv08WG
  SwYdnwhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bvz3csBRO5Kv4u3snWwLiMs4uRi0NI4Amj
  xL4J81ggnOtMEscmH2eCcPYwSrzc+JSxi5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBf4lJk+6B2SwCqhKvp21kArF5BZwkXn6eABaXEFCQmPLwPTNEXFDi5MwnLBBzJCQOvn
  jBDFGjKDH7cjMLhF0hMWPGNjYIW03i6rlNzBMY+WchaZ+FpH0BI9MqRuukosz0jJLcxMwcXUM
  DA11DQ1NdSzNdQzO9xCrdRL3UUt28/KKSDF1DvcTyYr3U4mK94src5JwUvbzUkk2MwMBMKU4Q
  2MG4d98vvUOMkhxMSqK8Mxc+TBLiS8pPqcxILM6ILyrNSS0+xCjDwaEkwbvpFVBOsCg1PbUiL
  TMHGCUwaQkOHiUR3gdvgdK8xQWJucWZ6RCpU4y6HDO/th1gFmLJy89LlRLn/f4eqEgApCijNA
  9uBCxiLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5n38DmgKT2ZeCdymV0BHMAEdsUXhAcg
  RJYkIKakGJqH3FilVYt8PLn/6NlJWdTfzbZtpz2NPNpyQOWk2e4bejPgF8jw6x8WDLpwT+nX/
  nfMnqU1HJ4hbmqy58qVsztOvKn79mgcC3P7yuR4sWqD55oC0wZTHzWt3llZKnQhjtmw3KLnBV
  7tm3qa9FybNXL/ry0fHjUoJ59Xm5cz/duKpiPjug5Lvep+Hv3+2fM7GxWyCl6udp7+OaOZNSm
  TaN7X9xZ2PgdVXFIumXrKw5GhwmufOxP5r06Tiv2pzFSL637xbaK+bN+nKnyDmp30PAuW/WMn
  orGpQspZdw/Ls7pnS/aJm+5v5st4/nKnCeVQp9ORnReGj6T7/0mfs/JrPHGb8oeGCP9OOb2ca
  rKbuWnBFiaU4I9FQi7moOBEAnrk391MDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-728.messagelabs.com!1658974481!143335!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32421 invoked from network); 28 Jul 2022 02:14:42 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Jul 2022 02:14:42 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B880F100193
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jul 2022 03:14:41 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id AC641100043
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jul 2022 03:14:41 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Jul 2022 03:14:39 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-elementpath: upgrade 2.5.3 ->
 3.0.1
Date: Thu, 28 Jul 2022 10:14:24 +0800
Message-ID: <1658974468-10622-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Jul 2022 02:14:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98021

Changelog:
==========
    Fix of descendant path operator (issue #51)
    Add support for Python 3.11

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-elementpath_2.5.3.bb => python3-elementpath_3.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_2.5.3.bb => python3-elementpath_3.0.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_2.5.3.bb b/meta-python/recipes-devtools/python/python3-elementpath_3.0.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-elementpath_2.5.3.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_3.0.1.bb
index 22f5aa099b..13468ebfff 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_2.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_3.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "b8aeb6f27dddc10fb9201b62090628a846cbae8577f3544cb1075fa38d0817f6"
+SRC_URI[sha256sum] = "a75eed5aad3dad92ba577b1f3a268d8c3c98ceeda91cb8abae4269e920e7c8f6"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
-- 
2.25.1


