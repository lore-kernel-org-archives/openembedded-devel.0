Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C39C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:35:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.37696.1670830507261093203
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:35:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RWi+rruW;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830508; i=@fujitsu.com;
	bh=0dDStMqyYJ9zWQroFg4ZUBas173nxywcineTPNielx0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RWi+rruWGQvnOymbxw1OzyVf6aqBGwjeHjgnnCLEX7v0V0LQSPH9Ei/uRVHD9eTPD
	 QBjPPzkI++5+erQzgrKBYPGZjOpmwr/DewqIIdhcQlJez11jgz7hrPQcqPcifrNHDy
	 T++xzE16U9lq6tvsYTcdGK8aNet8HVd/lxWecufdQA/+Tf/R3OMfkL6zETtWe7/83b
	 o6YwIRu2DDMQC+A6jGP7QEtr9xMEY8QQNBAwDu6E16qbKBzPdbz7S8Sc1ORG1HF7pT
	 rvrv4E5THV9vJ/orWWXyfQYQoH/68W69nvGMxBEOcNKHZVskXXQXMmDb6h0L/Xp/J9
	 eJpoXlxfOp5/A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORpLv65rR
  kg4vbzC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozH51oZC26wVlz7HtfAOJe1i5GTQ0jgIaPE
  u/2FXYxcQPYVJom3b5tZIJw9jBIrGv+wgFSxCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOApMWPBLbAaFgFVie0314PZvAKOErt7d4PNkRBQkJjy8D1YL6eAk8SW7pXsEFc4Sty5tp
  EFol5Q4uTMJywQ8yUkDr54wQzRqygx+3Iz1JwKiVmz2pggbDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGM2KU4vKUot0Dc30kooy0zNKchMzc/QSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5NzUvTy
  Uks2MQJDN6VYcesOxhvL/ugdYpTkYFIS5a28Mi1ZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvh
  mtAOcGi1PTUirTMHGAcwaQlOHiURHjdQFp5iwsSc4sz0yFSpxh1OWZ+bTvALMSSl5+XKiXOy3
  4DqEgApCijNA9uBCymLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5rW5DjSFJzOvBG7TK6A
  jmICOiHo5FeSIkkSElFQDE4O38dU7XCafMgQMFi6cdjrYJ+nsqnLhq28WnvZ2nNYapnfmvfoO
  3YXvTy6568pQ/Yl5ntK5pdKhiSs4BJpzBNM9FI1fLdt9flXb+pk5T5xv2Ep4q3A28lxaIHvQr
  7tp1c/jfq0FW3+Vno+NXCpnu7Vx6nKN7neLehYo225Yui5sYvRiOyGFwMT7+lOcpi2ZMm9F+w
  V1Djb5t+vvrZW//aWq6PG3f1sjy7K0b+uy87Rqvln9ai7n+ojP1SouZmeU0y/de33ANUMwvHf
  vVX33y55XnrO8jw27J70h3l5uxY5PzKo1ql0Re2+4z2dSzQwtaP9gu26afEDJnMNfJtxctezR
  yx8n9xltX71W3ux6qK8SS3FGoqEWc1FxIgC0msjgZAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-571.messagelabs.com!1670830507!316398!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25275 invoked from network); 12 Dec 2022 07:35:07 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:35:07 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 9B59D1B6
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:35:07 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 905EC1AF
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:35:07 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:35:05 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] flatbuffers: upgrade 22.11.23 -> 22.12.06
Date: Mon, 12 Dec 2022 15:34:29 +0800
Message-ID: <1670830471-3000-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670830471-3000-1-git-send-email-wangmy@fujitsu.com>
References: <1670830471-3000-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:35:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100037

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
index a2294d1c7..c87a449f0 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
@@ -1,3 +1,3 @@
-PV = "22.11.23"
-SRCREV = "8f625561d053d232897790ad5fdcc9a6a1832133"
+PV = "22.12.06"
+SRCREV = "acf39ff056df8c9e5bfa32cf6f7b5e6b87a90544"
 SRC_URI = "git://github.com/google/flatbuffers.git;branch=master;protocol=https"
-- 
2.25.1


