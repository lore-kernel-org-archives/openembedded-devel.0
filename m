Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4ABC43219
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:06:47 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.1742.1666055200068040024
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 18:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=n6LuY+5G;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666055198; i=@fujitsu.com;
	bh=N01GsdyHUufZuKwtmqxeWifpaDEqXdZQzhpM2o45Pyk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=n6LuY+5G5cEHntlZ9wwQwOPb7AjZklnTg/+YbYqQ3Y9w4yNS4FKyK9qSgIxoj0oYk
	 lWUC7ipDDQLYBB3Xv2x/S41p28mF9dVwhrlQL+1M/LsqK7YlcIFlra+vO7qWlhn76v
	 Ra+v6FVh1wkGa+j2N04unD1XwGgzftiBkdw5KzMvRSTMwpfd8eHrb2jqKOPfz63u58
	 5e0Y24uY57wtAThQ+/cJCFsaLXNbVC1eS0imMM7UtVsJFqy3Kh0DatDPHTzDXl4Xhh
	 Ve6qI+76iBATIDrsDYC7DQ4w/zZualgD5sd1suZWaqrKNWASal7dsSf7tsC0y85rEk
	 2HgSNNuo/X9QA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8MxSVf2j2+
  ywf3lHBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0ZH10mmgl6OivUn7BoYl7J3MXJxCAk8YZSY
  /u8TI4RznUmiee9hFghnD6PEnN8XgTKcHGwCahLTb91gBbFFBPQlls7ewwxiMwuoSLz43cMOY
  gsL2EkcuPYPrJ5FQFXi/cO1TCA2r4CjxLlVi8F6JQQUJKY8fA/WyyngJPGv6SGYLQRUM/HSAh
  aIekGJkzOfsEDMl5A4+OIFM0SvosTsy80sEHaFxKxZbUwQtprE1XObmCcwCs5C0j4LSfsCRqZ
  VjKbFqUVlqUW6xnpJRZnpGSW5iZk5eolVuol6qaW65anFJbqGeonlxXqpxcV6xZW5yTkpenmp
  JZsYgaGbUsxWvYPx7dI/eocYJTmYlER5O2b4JgvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4O34A
  ZQTLEpNT61Iy8wBxhFMWoKDR0mEN+oMUJq3uCAxtzgzHSJ1itGSY+rsf/uZOZaDyZlf2w4wC7
  Hk5eelSonzGv4GahAAacgozYMbB4v1S4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEed/8BJr
  Ck5lXArf1FdBBTEAHZez3AjmoJBEhJdXApMosVWD31KBYWOT05w8rfl18pXLruli1bB/HNt6+
  xxGXNdn17Eq3738Vxfnm3Nqta5rmXY+pd358J/rEZV35jeXmhx68lPDzFj3qoNv5uiSlvPNjT
  Li/eeD9vwseCDKa3HvMdaos4vrsdt9tGw4q2MWdjnpauZ0rXq1EI21113sB7vUr6yZwu2XtSJ
  6ww+/q87Mb99f9aVlTcuxh3RVFn4x2q8QABhu96+l7f+oUayffkFN7+8vq670NvB8Sbu/+4z5
  p9lOPIzkSYkv4i1q/v6ywCBT+LdXp8/LC/zaVoxvvnWzZF8sQ9mnX1tdX9px73G62uunD1Gka
  UXP91lnvYDsxReFh+arWUCk9JqcvG5VYijMSDbWYi4oTAVUZMmBwAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-591.messagelabs.com!1666055196!279700!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20317 invoked from network); 18 Oct 2022 01:06:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 01:06:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id BFEA71000CC
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:06:36 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B3765100078
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:06:36 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 02:06:35 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cppzmq: upgrade 4.8.1 -> 4.9.0
Date: Tue, 18 Oct 2022 09:06:13 +0800
Message-ID: <1666055176-8001-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1666055176-8001-1-git-send-email-wangmy@fujitsu.com>
References: <1666055176-8001-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 01:06:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99208

Changelog:
==========
Type-safe socket.get(sockopt::type) #523
GCC C++14 fix #553
Support ZMQ_ONLY_FIRST_SUBSCRIBE #558
Add pkg-config file and instructions #564 #570
Fix missing include #568
Fix monitor test failures #576
Improved documentation #519 #524

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
index 7189115092..1dbdc3e46a 100644
--- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
+++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
 DEPENDS = "zeromq"
 
-SRCREV = "dd663fafd830466d34cba278c2cfd0f92eb67614"
-PV = "4.8.1"
+SRCREV = "d67b6352b87a238775cd17e4376b980d07fa7939"
+PV = "4.9.0"
 
 SRC_URI = "git://github.com/zeromq/cppzmq.git;branch=master;protocol=https"
 
-- 
2.25.1


