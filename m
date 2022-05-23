Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D922C433FE
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 08:08:23 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.25084.1653293293618962300
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 01:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=T9YyZoDA;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653293291; i=@fujitsu.com;
	bh=Eplz8ZOj4pFh73jIlz2M0BjUjjGAyOJrPpIiAtFPAa0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=T9YyZoDAe449KOSw3uChCRZtV3kUOBukP+ZOelASUGWwuOC6o+bfRr10Uh/F0rYt5
	 gL44yRxSMZjXudOUbNserV3qjnXK3jcHZyY/hNaYDmDnfTBlN9DDEB4FHCymS+Rquc
	 inT4xWeReAVOcjDZoyJKX7f4stmr5SdqRP3gBk1ch0oVfXMepeuj8KV4tiwlQKlHiS
	 HPqnquzsYU5YJHkbXVmxqYK4x/cD2MMO41hHOGeM30HhpbCsIJVAvVemuQP65hDukC
	 q1yDTC/pMitZPxDkQCr4mb4ffgFx6sV+b2eqnFBigKV1aHB+s5lNQL6U1b/qHfog19
	 xeaAXeewXhzMQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORpPvaoTv
  JYNU6HouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePHrW2MBZM4K+51rWBrYNzO0cXIxSEk8JBR
  omlhFyuEc5ZJYva5k1DOHkaJzVf/MXcxcnKwCahJTL91gxXEFhHQl1g6ew9YnFlAReLF7x52E
  FtYwF+i5V4jWA2LgKrE/tNXwGxeASeJnkXn2UBsCQEFiSkP34P1cgo4Szw7tRmsVwiopmPKFW
  aIekGJkzOfsEDMl5A4+OIFM0SvosTsy80sEHaFxIwZ26BmqklcPbeJeQKj4Cwk7bOQtC9gZFr
  FaJlUlJmeUZKbmJmja2hgoGtoaKprqGtqqZdYpZuol1qqW55aXKJrqJdYXqyXWlysV1yZm5yT
  opeXWrKJERjEKcWM1jsYO/p+6h1ilORgUhLlPWrXnSTEl5SfUpmRWJwRX1Sak1p8iFGGg0NJg
  pfPHignWJSanlqRlpkDjCiYtAQHj5IILyMwqoR4iwsSc4sz0yFSpxh1OXZuubyXWYglLz8vVU
  qc1xGkSACkKKM0D24ELLovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmnQRyCU9mXgncpld
  ARzABHdEr0QlyREkiQkqqgUl1dWN/cdZ0i5KPKTxHVZ8+SIr7JyjDWHWnOq+Qv4WxoSGq4lJt
  8M+HzVsOKGiw/TrlXt1TtMdzmS2nTfztWfEG/ZwzBaJ+L7Ywfi9dL1q8lE1UbsWaM7xlOWJze
  PPnOp5LW/ulefZGoZ4vwpc/Tg19caosNt759gTbu/euRKz9vyHuvuj/jy+u8gjMFzla6x35Z8
  P6bLXp3Zuf79q56sr7uh+Hiu7t5dilmOwqaS4/cerrk4mS7hxC/WaapY/N1gW9UZb8PduU+9W
  qz30yZ7nvycuFBehbWLjOPT11hb9MR4YNg82pnNjKsOT6D2ZndFr8tyRb+S1fGc787jeD4ftD
  x9rmnHY4cvRcXq17vhJLcUaioRZzUXEiAH9jnEtpAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-587.messagelabs.com!1653293290!140326!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24027 invoked from network); 23 May 2022 08:08:11 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 May 2022 08:08:11 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id B3F4CD5C
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 09:08:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id A8F4CB55
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 09:08:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 23 May 2022 09:07:52 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20220508.0 ->
 5.9.20220515.0
Date: Mon, 23 May 2022 16:07:19 +0800
Message-ID: <1653293241-31418-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653293241-31418-1-git-send-email-wangmy@fujitsu.com>
References: <1653293241-31418-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 May 2022 08:08:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97223

Changelog:
==========
Merge pull request #3383(https://github.com/universal-ctags/ctags/pull/3383)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20220508.0.bb => ctags_5.9.20220515.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20220508.0.bb => ctags_5.9.20220515.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220508.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220515.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20220508.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20220515.0.bb
index 02f01cc60..231deec44 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220508.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220515.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "3f9e162a2a2d49920550bddb6de9da46a8340a41"
+SRCREV = "62bf9fcbf17eb4a3027cf9e97d6dbf5199817c38"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


