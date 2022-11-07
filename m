Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715FDC43217
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:32:00 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.1135.1667809910470454122
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:31:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=H9xQa9UW;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667809908; i=@fujitsu.com;
	bh=r1BBuUdgV0M8/tLnNKCl+gveUMzxyHT0frS8rzbM8Yk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=H9xQa9UWQoTuKJ1K47vRTanvJD6FkejwXzKbvMm6rNCzoMBAiZoxdm9Q7SzQsa3O6
	 dkzA1ZHxIljuILa0zYiZU6Ynzn+xvZ2atJVZVIPmy8Q6AUwhbJK+pIXjZXIN64LbN6
	 Pjrg8cB/8LFyeEq+BEVkh9FHdVXb0eprwvyKb/Ijqaihl6V7EynDMwjn4E2Ef871Zo
	 qwh/wwoZYs5fzfROMQkSFiMoYKFg9W/7AfCJM3OvPKaENxzS8PHiD3dc+oa6RfR+ng
	 rnxn1Rh2XwijJJbuq7N5s+hZ/e9F70gwLveZQ1WNAh+czjT4Fk8XB6wjQa5anfOdmS
	 sRsaliMSWfIuw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8ORqFtyKCP
  Z4P93XouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeParMvMBX1cFf/+3GJpYHzD0cXIxSEk8IRR
  ovPzCjYI5zqTxLNPP5khnN2MEt0nTwNlODnYBKQkbtz/D2aLCOhLLJ29hxnEZhZQkXjxu4cdx
  BYWcJbo2faXEcRmAYrP+rwBrIZXwEni2bKFYLaEgILElIfvwWxOoPqFi3aB1QsB1bzc/I4Nol
  5Q4uTMJywQ8yUkDr54AdWrKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmMgrOQtM9C0r6AkWkVo3l
  xalFZapGuoYFeUlFmekZJbmJmjl5ilW6iXmqpbl5+UUmGrqFeYnmxXmpxsV5xZW5yTopeXmrJ
  JkZgAKcUp1zcwfhk2R+9Q4ySHExKory/l2ckC/El5adUZiQWZ8QXleakFh9ilOHgUJLgvbERK
  CdYlJqeWpGWmQOMJpi0BAePkghv2D6gNG9xQWJucWY6ROoUoy7HzK9tB5iFWPLy81KlxHmv7Q
  YqEgApyijNgxsBi+xLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5mfcATeHJzCuB2/QK6Ag
  moCOqC9JAjihJREhJNTClHNKv27G7Yonb7PeCZyIFf6hNY/hss2myk+llaSXGdayZgSr/th+a
  cTHm468f+xwZ73m63z69v6MjVtro9WObKi6myhK370knJ3OaT++z9r7ccCj9ZmNd1FzVQqaeA
  lZHhTXZh23ajv8RnH3g6L83ZU4tq5+ddlp2a0tA5goR1U9zzWbuWjT7bUa7aPEzva9SB1O0Qn
  9/ejC/gMHTxirhy9q4hnqOSxEzHPd0uH4JdNky4baOiNZUuUOMC+ZsXjSH+dG9tlWyc9j2ib8
  590576565u43XGUzh/cOS8G9ysmD0fIdwmy0h0+f5T+b3eLE889v86SnaHz//7Svg0fk7z+DS
  S3P1a9PXvdLkPeW2QomlOCPRUIu5qDgRAGMPItFnAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-728.messagelabs.com!1667809907!218889!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23005 invoked from network); 7 Nov 2022 08:31:48 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:31:48 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A829610019A
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:31:47 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9C4F4100198
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:31:47 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:31:46 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] poppler: upgrade 22.10.0 -> 22.11.0
Date: Mon, 7 Nov 2022 16:31:28 +0800
Message-ID: <1667809891-30889-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667809891-30889-1-git-send-email-wangmy@fujitsu.com>
References: <1667809891-30889-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99453

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  core:
   * CairoOutputDev: Update font after restore
   * Protect against broken files
   * Small code refactoring

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../poppler/{poppler_22.10.0.bb => poppler_22.11.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_22.10.0.bb => poppler_22.11.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_22.10.0.bb b/meta-oe/recipes-support/poppler/poppler_22.11.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_22.10.0.bb
rename to meta-oe/recipes-support/poppler/poppler_22.11.0.bb
index 0a15088d0..5ba1b2f0c 100644
--- a/meta-oe/recipes-support/poppler/poppler_22.10.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_22.11.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "04e40fad924a6de62e63017a6fd4c04696c1f526dedc2ba5ef275cedf646292a"
+SRC_URI[sha256sum] = "093ba9844ed774285517361c15e21a31ba4df278a499263d4403cca74f2da828"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.25.1


