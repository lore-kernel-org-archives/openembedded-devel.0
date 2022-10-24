Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1B2FA373F
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 05:51:05 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web08.16026.1666590659440487306
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 22:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WD66btL7;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666590657; i=@fujitsu.com;
	bh=CzhjIIfdo1XifTJr2LZJxzww11JPsQVpAGT1lr3DO+o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WD66btL7Uj/mV7I0P7xCG+QmmU5k1y3Wiz2cpRCYrwNEYrg2UYFGC0W3x+f/ZHR9B
	 z0NBDRITqnW70s+ObumZQSJW2Ec+AtAh7+k/OYfZsQ99GLl/+SMpmHHkgPG7X6bwMe
	 5ZhL8pHt1yQTMys8gI34fl5sCy+CbWTLOdN+Qma0NhY/sDqIuebjYIidAck5XMrbLH
	 hOtRQsF3hLgDc/W20U4VhXZt2+e7tn3LKB/DmX05U7N9mGBOu7teZC9XPSyLzybFz+
	 u0nhRuDgkIyEZAt7cEXKeCwp+xFA1NkK79GCV+f/8B4nRWSX32FT0ouR+8OI/yQHnq
	 6XUdG9JZQXPbQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRWlGSWpSXmKPExsViZ8MxSfegeli
  ywZ90i4uHlzI7MHqc27iCMYAxijUzLym/IoE149vyxcwFNzgq1rXMY21g/M/excjFISTwhFHi
  wMrnrBDOdSaJnbeeADmcQM4eRokX981AbDYBKYkb9/+zgdgiAvoSS2fvYQaxmQVUJF787gGax
  MEhLOAv8f9AMUiYRUBVYtW6LSwgNq+Ak0T/r0NgrRICChJTHr4Ha+UUcJZYuvIoI8QqJ4kN83
  YzQtQLSpyc+YQFYryExMEXL5ghehUlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0LU4tKkst0rXUSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM25RiddUdjOeW/dE7xCjJwaQkyssgHpYsxJeUn1KZkVicEV9UmpNafIhRhoNDSYL3p
  DJQTrAoNT21Ii0zBxhDMGkJDh4lEd6LIGne4oLE3OLMdIjUKUZLjqmz/+1n5lgOJmd+bTvALM
  SSl5+XKiXOe1YFqEEApCGjNA9uHCzOLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5p0PMoU
  nM68EbusroIOYgA66tCII5KCSRISUVANTSNu9VlNT5rmMaqnVmaulA4Uf/Ly6+VDjmXKby4+M
  rXhW3zKeO/Ot+59Vqp/Or7PYwXwtYsLp20cnHuWSv/Tv/qrvNp8P2CU+/2q4e94204TvN6Jfz
  dMVWP1tQfY/8w+GQrw+lwVvrj5cHnNPylo3brXi1s2rGkPuNPrebTpwdU5IRFvVknssUVZ6QZ
  q5BtPCApeZbD/5YVGe7FdTxczjOTE3U/eG1vb96FkjtZ6lh6ssY3Voueu0n4YX95rtPj/j37q
  /j71C9tTaf0v+F7TYXENaZW9n8upnj9YUvlbd8vop0y3GH4eEGM+9rvycoqJrOOfgijK9PQW7
  SwKNN/3vOScfdO1i/CydlXMM090dTimxFGckGmoxFxUnAgCq6zUcbgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-565.messagelabs.com!1666590656!202766!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16344 invoked from network); 24 Oct 2022 05:50:57 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 05:50:57 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B81D51000E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:50:56 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id AB5751000D2
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:50:56 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 06:50:55 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20221009.0 -> 5.9.20221016.0
Date: Mon, 24 Oct 2022 13:50:30 +0800
Message-ID: <1666590633-27850-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1666590633-27850-1-git-send-email-wangmy@fujitsu.com>
References: <1666590633-27850-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 05:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99263

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20221009.0.bb => ctags_5.9.20221016.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20221009.0.bb => ctags_5.9.20221016.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20221009.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20221016.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20221009.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20221016.0.bb
index 5564a9b853..809f578803 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20221009.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20221016.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "5d506a1a3b6850f05de5e785c5d14cfd6f9b1620"
+SRCREV = "a2995833175678358767e1c9a36ad3946667edf1"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


