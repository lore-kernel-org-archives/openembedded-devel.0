Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17862C4743C
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:13 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.26608.1650871900626824243
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 00:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OrWutYff;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650871899; i=@fujitsu.com;
	bh=UONXpCBRFfswkP4efjDUWB6uhW0ZSG6yzDwqD7c4VVU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=OrWutYffflgImuD1NWMFP9b7mySQutYQTDO8JYHbDkN0Ik2aeFF9pBIj6b7Gp6TOc
	 KkmJ43/S0rCM1T9w7OhC8Vvfxc8JKoZ/97bsfOTn5qhsE34eJcm17Z4PYWAAETVTTz
	 L83t68vFnBs73yt9vydxJ6yk8jZSsoNYgXHNd5YAAopNpwXmEnc8WNyyCIK6Zth70D
	 XB9cnExjkB+7DuhtSMps8ageLs4sCPgTmTl6Douj/Qy88gYLlcmxxS+fpou6rIsUBM
	 p1CeHPhsmCyVeymezfYTNajYtjS8sIksnnk/F6nYsmu7LaBLfQONje1IwMiLlAtTep
	 n7zjtdU5vPTmQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8ORqBvll5Z
  kcGCFlsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrH39gvmgmlcFVs7+1kaGN9zdDFycggJPGGU
  +Lu2qIuRC8i+wCSx9swiJghnD6PE502T2UGq2ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7B
  6xGWMBa4sSK52wgNouAqsT2cx1gcV4BJ4kpp3+B2RICChJTHr5nhogLSpyc+YQFYo6ExMEXL5
  ghahQlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gZF/FpL2WUjaFzAyrWK0TCrKTM8oyU3MzNE1NDD
  QNTQ01TXUNbXUS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknRy0st2cQIDMmUYkbrHYwd
  fT/1DjFKcjApifLeM0lLEuJLyk+pzEgszogvKs1JLT7EKMPBoSTBu9sXKCdYlJqeWpGWmQOMD
  5i0BAePkghvujdQmre4IDG3ODMdInWKUZfj6pUre5mFWPLy81KlxHnf+wAVCYAUZZTmwY2Axe
  olRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK86SBTeDLzSuA2vQI6ggnoiE+1qSBHlCQipKQ
  amCL37bBXv5Pc5lH9rKnDhSHIIE3ElPk/n5qEzbLVP3abOTYs3PRR65xiIucKQ71Xm5eE9RtV
  18+dMK85SP3u58em9880rA+f8C9F7uXxQLdn9gvO7N8q9pzBZEJCCYf6ebOtty/dfLz9/6YPH
  nKzpBe0hoWeKyyPMjVa9oDpRGo/o8Lmd2/CA0xZZu09/3LhFe/XCyKc5+3QFShpsu2Y+XDmMt
  WtImv5tvE+POff7P3orG/gxiObo45W6m7JKMw2uvEieyXnmpN60YwrzjudZ5so5B7/OG7/zp7
  ZC3+INnYbdUSZ/Vv0Sbxousg9oYOX52rv3uN8VS5pzgJ2hfeLV7p/PunrUbxycuDNHv3Sh0eU
  WIozEg21mIuKEwHJ68x7UAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-591.messagelabs.com!1650871898!129225!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31966 invoked from network); 25 Apr 2022 07:31:38 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Apr 2022 07:31:38 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 2FF0D100196
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:31:38 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2376D10018F
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:31:38 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 25 Apr 2022 08:31:22 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hexedit: upgrade 1.5 -> 1.6
Date: Mon, 25 Apr 2022 15:31:12 +0800
Message-ID: <1650871876-31392-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96766

april 2022
    - 1.6
    - configure script must error-out when (n)curses isn't found
    - Move SIGWINCH handling from handler to NCURSES
    - Make configure.ac compliant with autoconf >= 2.70
    - Check that malloc did not return NULL
    - Fix a possible memory leak in findFile()
    - Prevent division by zero on empty files.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/hexedit/{hexedit_1.5.bb => hexedit_1.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/hexedit/{hexedit_1.5.bb => hexedit_1.6.bb} (90%)

diff --git a/meta-oe/recipes-extended/hexedit/hexedit_1.5.bb b/meta-oe/recipes-extended/hexedit/hexedit_1.6.bb
similarity index 90%
rename from meta-oe/recipes-extended/hexedit/hexedit_1.5.bb
rename to meta-oe/recipes-extended/hexedit/hexedit_1.6.bb
index e996593135..d2b23b41b4 100644
--- a/meta-oe/recipes-extended/hexedit/hexedit_1.5.bb
+++ b/meta-oe/recipes-extended/hexedit/hexedit_1.6.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 SRC_URI = "git://github.com/pixel/hexedit.git;branch=master;protocol=https \
     "
 
-SRCREV = "baf45a289360a39a05253949fb9d1b50e4668d8a"
+SRCREV = "eab92dcaa34b66bc5182772afc9fda4ac8a27597"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


