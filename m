Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F149C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 07:01:06 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.38752.1656313248620754790
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 00:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CYU9We2s;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656313246; i=@fujitsu.com;
	bh=Dx8iJfFJdidmjTOcU+8rcJRwtAnTnRyBaXVBFTLZ0C0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CYU9We2seSoHnY6zBqX+98eb3fej0ddxciGgxNQAIhe4uVMdxfysUQfFW1/caynmH
	 7zszqk9+Du+C+gao6yjvfPJHa2sjo1ep6Y5J8fXbFDFySyVhIWENHdkXcTilW9p6Ea
	 reTr7LgkCJBDJGh1p8f1Wxk8w19Ncea1fNNta9iLALSlQAi9aEXVo2GxW47oQcRQmS
	 zpfRzdIj0aAamJFJyFmUINk11IqV7Bzed8U9pFH3FnYIbiS3HsGt54uqZ6aVpFeZ7h
	 PAWyCLGUc8ybY+nJ+H1KO5mOLKsLI0c50CkmIcqmPe2+v99WX4O2ki6uaSA6e08u7I
	 h2hmbmRjQ8dSQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDIsWRWlGSWpSXmKPExsViZ8ORpDsjdGe
  SQctDeYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePPg6/sBa0cFe1nnzA1MC5j72Lk4hASeMgo
  ceLrPDYI5wqTxJnbN5kgnD2MEtc/TAByODnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHH
  cQWFvCQeHltDxuIzSKgKrG1azcjiM0r4CTx9uMPsBoJAQWJKQ/fg/VyCjhLXJy4BcwWAqp5tf
  A8M0S9oMTJmU9YIOZLSBx88YIZoldRYvblZhYIu0JixoxtbBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMtklFmekZJbmJmTm6hgYGuoaGpkDaSNfQ1FgvsUo3US+1VDcvv6gkQ9dQL7G8WC+1uFiv
  uDI3OSdFLy+1ZBMjMJhTitNm7mDcsu+X3iFGSQ4mJVHeU2o7k4T4kvJTKjMSizPii0pzUosPM
  cpwcChJ8FqFAOUEi1LTUyvSMnOAkQWTluDgURLhbfMGSvMWFyTmFmemQ6ROMdpzXL1yZS8zx9
  TZ//YzcywHkzO/th1gFmLJy89LlRLn3R0E1CYA0pZRmgc3FJYILjHKSgnzMjIwMAjxFKQW5Wa
  WoMq/YhTnYFQS5mUDuY0nM68EbvcroLOYgM7ym7gD5KySRISUVAPTZvlrBfU7GK7xXOx+UrL0
  y/N/sn/vi7yW5nHyduS9/ORlWefJs/JmNg3CSff3vl3xxHKy18Rpm5lee+yaKablJFTy+Q7T9
  Iz6HZkVc98dn6V+96nJwiDfPJcfAVvjuJgjBYsSma6rpzGuXvjpbafNnrUV71x5Yn5k7fq+Xe
  fXKVNl61nH9y7l9nyZou0te13B6fQNQ8m5l/boN/2Yn3d5Zf899gWXOJfbs7l0XGyT2JHK/II
  5947Z/YdrnR+t2BaqKxH4MH5msNy5vJd9845OT0uXfZWrEFp0d3OuReO87hW3C2+oNr0V7G9T
  TjDqOcnw8Uz3tJIHU+8Yqh1l33rvxHc3qfXBk1du2H7b4A9PpBJLcUaioRZzUXEiADWXv+p/A
  wAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-732.messagelabs.com!1656313240!151377!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25023 invoked from network); 27 Jun 2022 07:00:40 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jun 2022 07:00:40 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E8CAC1B3
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 08:00:39 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id DD9241A3
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 08:00:39 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 27 Jun 2022 08:00:38 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] nbdkit: upgrade 1.31.8 -> 1.31.9
Date: Mon, 27 Jun 2022 15:00:24 +0800
Message-ID: <1656313226-23852-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656313226-23852-1-git-send-email-wangmy@fujitsu.com>
References: <1656313226-23852-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jun 2022 07:01:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97598

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.31.8.bb => nbdkit_1.31.9.bb}              | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.31.8.bb => nbdkit_1.31.9.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.31.8.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.31.9.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.31.8.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.31.9.bb
index 15275cd3d..b60f49078 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.31.8.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.31.9.bb
@@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
 "
-SRCREV = "c96f025b39a3581405845004e1fcceb5dfa04583"
+
+SRCREV = "20f52c40d666ef18b9ae3aadac5a4ece428dd11e"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


