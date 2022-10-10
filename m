Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0BDC433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 08:37:13 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.4164.1665391030385996816
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 01:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DS7fM220;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665391028; i=@fujitsu.com;
	bh=83WTUoeAs+VlVph4/XXxmxjlSkGWH7cjXCxAjv743qI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=DS7fM220ay478JXwA7TtcIv5yD02uE/0TmKvVjkeyI/Plr7rJ+v/LU1hQxuCvxnBi
	 ySHz90GorTulNUsZ6DsqwcAcssrkwqoezKh4xOTJTt9IisEGOzZTACDGbmQhLsYLBu
	 ToH+uD+N+P7I8qlW8KsCoB5gDOVnQSM1zgbhB3Yr+bJfrbV2Ra9NnmaSn+etF8bZZW
	 +cpW4epXpXXRE6bY7bzrzW0/QIDfdMvmqsfHB3MRi/B2sgmp5WUt2k/GpWGlbwmlpm
	 mGxvnUoF0igHiHJktwF35F56z406//eybFmrosRi0fkV287d5LZp8wlyHJLkKcyXK7
	 n94JqxrWoVaPg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRWlGSWpSXmKPExsViZ8OxWXfLTed
  kg8MNAhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bXWTfYC+5yVxzd8JepgfE+VxcjJ4eQwENG
  ia8fyrsYuYDsK0wSZ7rusUI4exglFhztZgapYhNQk5h+6wYriC0ioC+xdPYesDizgIrEi9897
  CC2sECYxIYJJ5hAbBYBVYlnv1aydTFycPAKOErsuZsPEpYQUJCY8vA9WCungJNER8MxRogjHC
  X+7NsDNp5XQFDi5MwnLBDjJSQOvnjBDNGrKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmMgrOQtM9
  C0r6AkWkVo3VSUWZ6RkluYmaOrqGBga6hoamusYWuoZG5XmKVbqJeaqlueWpxia6RXmJ5sV5q
  cbFecWVuck6KXl5qySZGYBCnFKvV72B8sfKn3iFGSQ4mJVFeg0POyUJ8SfkplRmJxRnxRaU5q
  cWHGGU4OJQkeFdfBcoJFqWmp1akZeYAIwomLcHBoyTC++AiUJq3uCAxtzgzHSJ1itGYY+bXtg
  PMHM3/fx9gFmLJy89LlRLnXXADqFQApDSjNA9uECzSLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhT
  nYFQS5r10BWgKT2ZeCdy+V0CnMAGdcvKqE8gpJYkIKakGpsinMuK/d9SsWtG+nPfHreNn1Lx3
  7BO7p6LOWXtxydtO10aTm1Xb5jz0PXypPcRAvu+zsv7UCLXP1l1LyjqlI++8mOdnzrmuZ1mLy
  irus9MVZ3yrLipaFi50cpVXm8zem0rcXB3H9pXt++/TO4ljw72F+msfCLuxrV0bt+vVxS86/3
  yCLc8dcJLvOfX3/fQjyz6GtOuyKVecbXfPF5x9YYVyp3hlDf+r9Zz3vVa+SDB5edT59fJfX3/
  5hUjmln+679ST3pQu8ofzS+oz/rWXfionv5M8Gh1xzf5TwX/7/GJpoRarLBWJ9E0fLx80P51h
  zxRfYPnMQlX1s9Y1dZGwwADLkh3qG678sZkiX/nvshJLcUaioRZzUXEiAE0xSD9vAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-565.messagelabs.com!1665391028!2972!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10042 invoked from network); 10 Oct 2022 08:37:08 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Oct 2022 08:37:08 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 0120F154
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:37:08 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id E8920152
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:37:07 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 10 Oct 2022 09:37:06 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-requests-toolbelt: upgrade 0.9.1
 -> 0.10.0
Date: Mon, 10 Oct 2022 16:36:31 +0800
Message-ID: <1665390991-7978-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665390991-7978-1-git-send-email-wangmy@fujitsu.com>
References: <1665390991-7978-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Oct 2022 08:37:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99121

License-Update: url of License changed from http to https.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...toolbelt_0.9.1.bb => python3-requests-toolbelt_0.10.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-requests-toolbelt_0.9.1.bb => python3-requests-toolbelt_0.10.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
rename to meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.0.bb
index 366f41ca81..77b99a78ed 100644
--- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.0.bb
@@ -3,13 +3,12 @@ HOMEPAGE = "https://toolbelt.readthedocs.org"
 AUTHOR = "Ian Cordasco, Cory Benfield"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=71760e0f1dda8cff91b0bc9246caf571"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6f14302a4b4099009ab38b4dde5f1075"
 
 SRC_URI = "file://run-ptest \
           "
 
-SRC_URI[md5sum] = "b1509735c4b4cf95df2619facbc3672e"
-SRC_URI[sha256sum] = "968089d4584ad4ad7c171454f0a5c6dac23971e9472521ea3b6d49d610aa6fc0"
+SRC_URI[sha256sum] = "f695d6207931200b46c8ef6addbc8a921fb5d77cc4cd209c2e7d39293fcd2b30"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


