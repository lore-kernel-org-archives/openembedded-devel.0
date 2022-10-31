Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AEBDFA3742
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 08:40:10 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.7036.1667205608979384418
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 01:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xwX2hieV;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667205607; i=@fujitsu.com;
	bh=L9n3WBb5QUPGHNG4gocw/IqtQbxOMuqYmaWegOGvzE4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xwX2hieVaS9MO5wRkcPwkHFFOvUGHZDQPRSAKrLUe0EofS91N+/an5wZQko4zWJQu
	 /t0wnZ/+keMrMUBPrpy6o5/uvqEDad70U1J07VOhl35uR9uZdlQfLEUc8+nntpctTR
	 6a4Gah1Her8mWcMXd8K1YXAQgEUzl5ogYUCC2r5Hc9LbYUaMN0JVCNsDM9GT5JJtY2
	 um6uG+ISxI3zaPTYcpdYBRvyPaOIkiaKjqBicGqplRmjSg6lLNiQS9a6BN5lMaSje1
	 5h7EbDuUJR3UmHa3x5hswJNXtjHflrDycX04upclXZfplQpzlndFmCqvpMrr7yk6G+
	 OFum9Eln9QK5g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORqPu8Mz7
  Z4OwFJouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP1Q6WCD2wV88/cY21gnM7WxcjFISTwhFFi
  +rKHLBDOdSaJ11d+QWX2MEp0f1zE3MXIycEmICVx4/5/NhBbREBfYunsPWBxZgEViRe/e9hBb
  GEBD4mD926C1bAIqEps/fySFcTmFXCU2DG5AywuIaAgMeXhe7BeTgEniUW75jCB2EJANU/eXW
  OHqBeUODnzCQvEfAmJgy9eMEP0KkrMvtzMAmFXSMya1cYEYatJXD23iXkCo+AsJO2zkLQvYGR
  axWhWnFpUllqka2ikl1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuck6KX
  l1qyiREYvCnFSs07GP8u+6N3iFGSg0lJlPddS3yyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQlex
  nagnGBRanpqRVpmDjCSYNISHDxKIry9rUBp3uKCxNzizHSI1ClGXY6rV67sZRZiycvPS5US5+
  3uACoSACnKKM2DGwGL6kuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHm3glzCk5lXArfpFdA
  RTEBHsLXHgRxRkoiQkmpgKhEKauYVl/0vdef7EQmJi/WZotartvZ9Efmi/GhZpUxSOhPv9KAU
  jylHd5ssFKyvLp/C5iP4O9m6t7FGd8c1zi8msbk2vs4btTtbN3WfLDk26ZSxbeKrvqMdC3jjA
  i+WW7y8PWWh2tm6g6WVcx8FLrrlyP9qs+bpyzME1F8Wz7N+yn+sVsF62pMNOZGhGfc07RVUXm
  u/4/jt7+fSNOvo6e0PfrzPu6W1XnrbTBfeA47NvWfiP93LuHdlwqIfFd/lN7ttn7RZ86Ghoqn
  1/gVb4/5v7kzRtvr+0vbFbmHz81kfWoVSD9596vo8p65i34XWhzw50iWJKtfXrH3z5NAaiQOu
  l32sDq27uW3a4bBJq5RYijMSDbWYi4oTATd+xtFlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-565.messagelabs.com!1667205606!404630!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24535 invoked from network); 31 Oct 2022 08:40:07 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 Oct 2022 08:40:07 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B8D1A100198
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:40:06 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A8B5E100194
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:40:06 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 31 Oct 2022 08:40:04 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] flatbuffers: upgrade 22.9.29 -> 22.10.26
Date: Mon, 31 Oct 2022 16:39:44 +0800
Message-ID: <1667205585-3786-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667205585-3786-1-git-send-email-wangmy@fujitsu.com>
References: <1667205585-3786-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99368

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Create release.yml
    [Python] Fixed the issue with nested unions relying on InitFromBuf.
    FlatBuffers Version 22.10.26

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
index fc85e571ee..0700c5bd34 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
@@ -1,3 +1,3 @@
-PV = "22.9.29"
-SRCREV = "c92e78a9f841a6110ec27180d68d1f7f2afda21d"
+PV = "22.10.26"
+SRCREV = "203241ed3275625c8a25c4a1e7b86e3c0289c488"
 SRC_URI = "git://github.com/google/flatbuffers.git;branch=master;protocol=https"
-- 
2.25.1


