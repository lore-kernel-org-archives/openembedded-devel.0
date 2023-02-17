Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C902C61DA4
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 00:56:24 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.27933.1676595380879147827
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 16:56:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UkkmI5Nz;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676595378; i=@fujitsu.com;
	bh=zb0H9pqeAiFS+BRCsIHE1kfkohi+eUJRt1Vv7c5MZgI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=UkkmI5NzqM6jJDoEl9F0DDvzgj9wA6PwX3s06B2rsQcq/KaqfZf2tHYEfYCrk7zRs
	 lbiOK1X5DaUWrIgEKxk39zSinZG9O7fb4q7lbSRHf29m4aDNi1EBafoac3EIbL4lX3
	 a1XZCQNJSE67SnWWXkRwjQSfmQFQAv0sEDVOYsnvmSL/RDeswezQvz0YicEeVw4aBn
	 A2cn8RP3DHASon8mgobJxBcVNXS0RfEgN+pD3uGPhIpEX+4NPHn795Yxygo+CxjGV3
	 xlyGuJSNFo3tvS2nbwLJhMRC6WKjxS8PSrfZOBQ+4JQbqxbKkLjR5WwMT74vJH8XX9
	 7J6UTkFFfzl+Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORpLvxwrt
  kg/aj1hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8adF7OYC6azVax4f56pgfEkaxcjF4eQwENG
  id5D66Gcq0wSyzafZIRw9jFKrL13h72LkZODTUBDYvfUy8wgtoiAvsTS2XvAbGYBNYmjL3+C2
  cICwRKrzh1nA7FZBFQl/mzdARbnFXCVaFj/gBHElhBQkJjy8D1UXFDi5MwnLBBzJCQOvnjBDF
  GjJPH20h6o+kqJ1g+/WCBsNYmr5zYxT2Dkn4WkfRaS9gWMTKsYTYtTi8pSi3SN9ZKKMtMzSnI
  TM3P0Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L08lJLNjECgzGlmLlvB+PX3r96hxgl
  OZiURHkLud4lC/El5adUZiQWZ8QXleakFh9ilOHgUJLgvXIGKCdYlJqeWpGWmQOMDJi0BAePk
  ggv91mgNG9xQWJucWY6ROoUo6KUOG/nOaCEAEgiozQPrg0WjZcYZaWEeRkZGBiEeApSi3IzS1
  DlXzGKczAqCfMuA9nOk5lXAjf9FdBiJqDFC5jfgiwuSURISTUwrcuXvufaJrmun9f78VdFnlN
  aFw4Erz+q/r3hwoXXtcs3WejJ7p/jZ9//yXR5gcOPXYaXFXZ+bTyU0Lr46F6/xqtXHnAvrTk9
  tf5kRuSOXZemTuNgLv0269oVvm9bVzuqnVLuWLWt9u3OZ/fq9Od7xJldvte2fhNbZOjLlS3HG
  bOfaa92/M2tu8eUzWQd+4picf6nLzTYHX99ids41+GqU8YeRgEVtrWbuvvEGUqubVpxYfXD2t
  Mzn0yKuHJadYnpgXmvvWezn70t6ePpfJ631OC9fOP1+XMTj526yqRWzKm60vs0a8ZaC551B1L
  FS1wMc293/ZEU3jUpJ+z7dw///EU1GiL+3blWFVoJ915yblFiKc5INNRiLipOBABUw/RKQQMA
  AA==
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-12.tower-591.messagelabs.com!1676595377!67311!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22135 invoked from network); 17 Feb 2023 00:56:17 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-12.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Feb 2023 00:56:17 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 949621B3
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Feb 2023 00:56:17 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 88A041AC
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Feb 2023 00:56:17 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 17 Feb 2023 00:56:16 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-oe][PATCH] libiodbc: Fix install conflict when enable multilib.
Date: Fri, 17 Feb 2023 08:56:09 +0800
Message-ID: <1676595369-28147-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Feb 2023 00:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101119

Error: Transaction test error:
  file /usr/bin/iodbc-config conflicts between attempted installs of libiodbc-3.52.15-r0.aarch64 and lib32-libiodbc-3.52.15-r0.armv7ahf_neon

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb b/meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb
index bc4bd53..ced16d9 100644
--- a/meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb
+++ b/meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb
@@ -24,3 +24,6 @@ EXTRA_OECONF += " --prefix=/usr/local \
 		--disable-libodbc \
 		--disable-static \
 		"
+
+inherit multilib_script
+MULTILIB_SCRIPTS = "${PN}:${bindir}/iodbc-config"
-- 
1.8.3.1


