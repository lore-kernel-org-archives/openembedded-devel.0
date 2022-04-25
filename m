Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE50C433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:12 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web08.26658.1650871805636247062
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 00:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NZ/Q0YYS;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650871803; i=@fujitsu.com;
	bh=BKl/6R0eaRUjhco28UvU2Fr5ynSLqJCs+YCLLi+y1Bg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NZ/Q0YYSK6IWkKtYSINNW4qpKo6zqknMMl1o7cHRSpTScqk1+27I21PbmHrB9VszM
	 /L9TQO4oxmv4oQk9thq0KeZD9xqG1XKmjsBpwwHbaCPHbGpoWymtQRDdajyueBbwDi
	 yKq75Ae4ET5aLCP7RFQLbf1tgdbLNNWC3ZF8Jw+1NVgu8OkoVGnKFg6LAV9rF9j9Uq
	 tFBriCK2wH+YPolf0Ky/M3arzFwmG7+0a89Pzpr859I0mXHrk9kjQd7yUdaCIfl+FT
	 HGsLeKrf2kKAUcl3RszIwXoCt8P3JFKBtLZj0pTbX7FSv/F2GoSQOu/UhNZDmF/ICO
	 kgbJ/Z2PtGCww==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8MxSfe3b1q
  SwaLF7BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0b3M8+CDRwVPfMOsjcw3mHvYuTkEBJ4wijx
  6zJ3FyMXkH2BSeL/tw42CGcPo8TOc20sIFVsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N0DN
  klYwF/i/oONTCA2i4CqxJJ7KxlBbF4BJ4nHUy6AxSUEFCSmPHzPDBEXlDg58wkLxBwJiYMvXj
  BD1ChKzL7czAJhV0jMmtUG1asmcfXcJuYJjPyzkLTPQtK+gJFpFaNVUlFmekZJbmJmjq6hgYG
  uoaGprpmukaGBXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6KXl5qySZGYEimFLNd2sE4
  t++n3iFGSQ4mJVHeeyZpSUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeLm8gHKCRanpqRVpmTnA+
  IBJS3DwKInwpnsDpXmLCxJzizPTIVKnGI05rl65speZ4waIFGLJy89LlRLnLfQBKhUAKc0ozY
  MbBIvbS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEedNBpvBk5pXA7XsFdAoT0CmfalNBTil
  JREhJNTD59l9Keau4VmPpy62Gry6X/dxXxX1D8M7za2Up+eq83xfyfis7/ZCPPSXAvEqKQ2Dy
  /BtH6+yVSphaZq3d1X3V/eHurJsz/VMa9rrteXpZKPWL8MbrT87mKU9t/7L+zEqLkD/BzNMa5
  m22e/wySain5rB3Zb3B1hWMAnZFyzYItzGLOeuVd5zmLn5j/ezx/gfedn0al8ISL+tKr0v/oS
  xeqsvzPPbCh/kcmpXXG4+VfYhu/rEv4n1bwpTlN6KsHM+ktgkf0a023OiTFRWhZFy/4sXMcDa
  327c41XIDnpX7d0vlxC1xvfTdt80qZSF7ghBXXOuUBCfrWq8bux9eaM0O/LA8p2r/lmXvXuw5
  oKTEUpyRaKjFXFScCABpeezyVgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-585.messagelabs.com!1650871802!131345!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1618 invoked from network); 25 Apr 2022 07:30:03 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Apr 2022 07:30:03 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7C4C2100441
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:30:02 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6D9C610033A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:30:02 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 25 Apr 2022 08:29:45 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20220410.0 ->
 5.9.20220417.0
Date: Mon, 25 Apr 2022 15:29:32 +0800
Message-ID: <1650871776-31335-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96761

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20220410.0.bb => ctags_5.9.20220417.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20220410.0.bb => ctags_5.9.20220417.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220410.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220417.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20220410.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20220417.0.bb
index 96be4e3ffd..0d32861c8b 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220410.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220417.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "c4e384715bfa95c7eaf0de99ce2498d54bed182e"
+SRCREV = "0d63a383b7b21a94d849ed01116cde0a628e95a9"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


