Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B49FC25B0E
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 02:24:12 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.24167.1660703050451105164
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 19:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=G/bYauAG;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660703048; i=@fujitsu.com;
	bh=HZDcuX69QIMX8gfFwXPIpxQP0IHo0NuZBMz/4kZ9pa4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=G/bYauAG0H+0LiIBmN76h8M6Y/ynApwXPqH4ofA+xD5cXFjUaYO0z8bZq1mnW6/Ur
	 075BkWdKO6myL+2yZ9JMEeSbAmcMJR4ak1yBgp1uBLy4IgMtfaY9USPQkcCZ3E/X0x
	 MKbIxmfiYhrNJEGV03eLkac14yNwle0WNvfL276q9PNsh/C7kPZgEhw3iRF871y1m2
	 JH6twEfI56XEsKUGopML5amX56fBMudnFKBcl37eMFIRx2aLP/9lQ4jj2rF0YSsXec
	 usfCJvJs0i0dY/pRBOv+/aYyW+vql72oC1MXmERRNAd36pMrOqCmDFgAErMs/DOyDO
	 RBXV9YdRWUcXg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8OxWdc98E+
  Swf9fRhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a1I9MYC07yVByZfY2lgXEedxcjF4eQwENG
  iYOTXzNDOFeYJDpXfmCHcE4ySty/NYOli5GTg01AXeLxzdeMILaIgL7E0tl7mEFsZgFVie6La
  9hBbGGBAIl735aBxVmA4lePvmEFsXkF3CW2X78B1ishoCAx5eF7Zoi4oMTJmU9YIOZISBx88Y
  IZokZJ4sSKj0wQdoXE68OXoOJqElfPbWKewMg/C0n7LCTtCxiZVjFaJRVlpmeU5CZm5ugaGhj
  oGhqa6hrqGhma6yVW6SbqpZbqlqcWl+ga6iWWF+ulFhfrFVfmJuek6OWllmxiBIZlSjHjzR2M
  rX0/9Q4xSnIwKYny9jP9SRLiS8pPqcxILM6ILyrNSS0+xCjDwaEkwXvPHygnWJSanlqRlpkDj
  BGYtAQHj5IIr2wAUJq3uCAxtzgzHSJ1ilFRSpz3rQ9QQgAkkVGaB9cGi8tLjLJSwryMDAwMQj
  wFqUW5mSWo8q8YxTkYlYR593kDTeHJzCuBm/4KaDET0OJjF3+DLC5JREhJNTDJHLyyYMcmPrV
  KQTs+u1CWlh1q85QafHgivz72KF7uXXFeIGWjV7lC9NXjr9VW+CoeM/ky1dtN2H5n2HsNTcXS
  /meWnW2e+0yFb6jMMImTnmRYNPXy8T/L552eZryB87J/7+qzaldOHXKJX3RX8EfmFec7CUkNz
  3/83OckJCiap965ebYGt02sYB9/ZsN+fpMGsYczgvctkJz62s9zf4Nyi7AZ/xypP//aUvm3Kn
  Spnyr62WZ6LfXIX/O3gRZ7nCcyHPzzI17nzOy0b9m6eqU7Drn51ffFM0k2Ln0YO3WukrNX9tx
  JB5/MCeVUKXr55FDs/E0xSewPr8oXrnpo8NY6zv711XUdzho8Dyze8imxFGckGmoxFxUnAgCO
  xD20RgMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-587.messagelabs.com!1660703047!979432!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20470 invoked from network); 17 Aug 2022 02:24:07 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-5.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Aug 2022 02:24:07 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 72E0C152
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:24:07 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 6602B14C
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:24:07 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 17 Aug 2022 03:24:05 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.9.1 ->
 2.10.0
Date: Wed, 17 Aug 2022 10:25:14 +0800
Message-ID: <1660703120-15786-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 02:24:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98265

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
==========
Features
--------
    add integration tests for pluggable auth
    support for configurable token lifetime
    support for configurable token lifetime

Bug Fixes
---------
    async certificate decoding
    Async system tests were not unwrapping async_generators
    Fix IDTokenCredentials update bug
    make expiration_time optional in response schema
    refactor credential subclass parameters

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...thon3-google-auth_2.9.1.bb => python3-google-auth_2.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.9.1.bb => python3-google-auth_2.10.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.9.1.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.10.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.9.1.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.10.0.bb
index e884abac1b..610a4d7dd8 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.10.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "14292fa3429f2bb1e99862554cde1ee730d6840ebae067814d3d15d8549c0888"
+SRC_URI[sha256sum] = "7904dbd44b745c7323fef29565adee2fe7ff48473e2d94443aced40b0404a395"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


