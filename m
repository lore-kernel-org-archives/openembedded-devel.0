Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA84EC6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:06:30 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.8936.1678889180728780289
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Idi72Pw/;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678889179; i=@fujitsu.com;
	bh=ywOaiIcXXcDuRa7/PRjPTJhHRgJewufiDNg+nN0owV8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Idi72Pw/lMyh0uDbGNjV30S5dL3RVWd8HHY4fxjZKO8ztq/W1/d6uBxRqlD/udxfe
	 JCzd1ACf0SCcuRxzV1GyysFIiZONFp1i1UJLZZ43PluxbXbjSq9la0CrPCU1f4KLch
	 se8OigjE7yXnCuTO98JnIm+KxDYrc8+tmVBu9KLiLMwXq3mztKWYpXiJaQO1tXqOe/
	 c1jCUhheLdNcEfZnvwaeGAQB7omYRWNOkBujmGwoj1TGzp3p4rRwbZLo9CImj3VeTs
	 FjqHaYRoQs2Gp5LIZZjAPldjsJDUm2VIVso9Lz8d3emWy1xSVvEuh0nl/6cQIl9bSz
	 dd8FPNS07REzg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8ORpHvrgmC
  KwYz9xhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bNTS+YCq5xVPRdCG1g/MvexcjFISTwkFHi
  8MV5rBDOFSaJA9vOMEM4exglHu/ay9bFyMnBJiAlceP+fzBbREBfYunsPcwgNrOAisSL3z3sI
  LawgL9E/58WVhCbRUBV4u7pv0xdjBwcvAJOEntn8oKEJQQUJKY8fA/WyisgKHFy5hMWiDESEg
  dfvGCGqFGUmH25mQXCrpBonH6ICcJWk7h6bhPzBEb+WUjaZyFpX8DItIrRrDi1qCy1SNfQTC+
  pKDM9oyQ3MTNHL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3OSdFLy+1ZBMjMBRTitXddzAe
  6furd4hRkoNJSZT3zxqBFCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvP/OCKYICRalpqdWpGXmA
  OMCJi3BwaMkwpt6HijNW1yQmFucmQ6ROsWoKCXO+xckIQCSyCjNg2uDxeIlRlkpYV5GBgYGIZ
  6C1KLczBJU+VeM4hyMSsK8y0C282TmlcBNfwW0mAloMe88AZDFJYkIKakGplm+M1VumIRJcO+
  L37bpVskEnl1htyvXahm+/yBs0FRoWa3yfJfoIxMlSb8DAq3NTJbMm7/LWMxxWchU6On0OLKr
  nq1WYGeY1v2ZacnTJXx338spnX9y391QW4fOTQeb1z0/eOaioKb6zq3hWy+8EahvuPhIwX5y2
  Mqz/yIL/l858rxf+MjLr9aLZnXkHbWexe7x23eZ1c2c+RPDlTXPPntdKpN04obgOu6D2aKmuj
  OOXVzbtdwlne1Ac/aP3i8bRH443q9nsPe7sXPpHflAfQf3T1UHjijY3jz+3Xjiq19hVTleE4Q
  3/a2dFDiZI/yykLbFnmdX9t4LTrwn1yPRz/za3Ebo6/SKBbMOaex/cUmJpTgj0VCLuag4EQCF
  LBvrQAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-571.messagelabs.com!1678889178!165114!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2708 invoked from network); 15 Mar 2023 14:06:18 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-21.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 14:06:18 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 8AAC21AE
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:06:18 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 7F6121AD
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:06:18 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 14:06:17 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20230305.0 -> 6.0.20230312.0
Date: Wed, 15 Mar 2023 22:06:02 +0800
Message-ID: <1678889166-20681-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:06:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101543

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.0.20230305.0.bb => ctags_6.0.20230312.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.0.20230305.0.bb => ctags_6.0.20230312.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230305.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230312.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.0.20230305.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.0.20230312.0.bb
index fec2420db..eb6dbeb16 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230305.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230312.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "9e62e165afd56639c7624d9c0f2ec69aec84af18"
+SRCREV = "457ed6ad02423e5bf210ad2bfa655125915a39bc"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


