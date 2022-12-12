Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E22AC10F31
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:35:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.37696.1670830507261093203
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:35:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xvLhljI+;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830513; i=@fujitsu.com;
	bh=tz6Tm/UfFnufhGfBYz2X3bDhfdi2cvNm7QLcKZh3hFA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xvLhljI+LzQQ4cY1XCYTuypsifuz+b4aVzo+qAmB6UxVT/xojHaZzyyTtv8pqMooI
	 9FQqtElbUfEQxPy4tF+R0/1Q1ScYdNe83o8IXdRIPiJbNHiq1/qaciIUsmpCQaaMjS
	 AEwgu+IJ8YtH1H7QKZz3wQsoR/izjTEyzbcpRX8hU/ou748NVMn6za22Y3CwA8IGwW
	 8WzOXhDAdT1BLn6uy0XSPtNcXp0DqmNcK4a41D3FSxPDBuT4DGsEJTrNDwYWD5v7oG
	 cg6iZwdrlkSIx+443rihLRfZ/VECoTuJqKj6vdohowFAcf7P7shGUp7SZf3QXJzBBU
	 Np25UzzZMr81w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8OxWXfjzWn
  JBh9aRS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyz23ezFqziqFi35htTA+Mx9i5GLg4hgQeM
  ErsffWGBcK4wSfzqvcAE4exhlNi/cx9bFyMnB5uAlMSN+//BbBEBfYmls/cwg9jMAioSL373s
  IPYwgIeEvc//wOrYRFQlTg//xCQzcHBK+AoseOiEUhYQkBBYsrD92CtnAJOElu6V4K1CgGV3L
  m2kQXE5hUQlDg58wkLxHgJiYMvXjBD9CpKzL7czAJhV0jMmtXGBGGrSVw9t4l5AqPgLCTts5C
  0L2BkWsVoVpxaVJZapGtorJdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmb
  nJOil5dasokRGLwpxYozdjD+W/ZH7xCjJAeTkihv5ZVpyUJ8SfkplRmJxRnxRaU5qcWHGGU4O
  JQkeDdcA8oJFqWmp1akZeYAIwkmLcHBoyTC6wbSyltckJhbnJkOkTrFqMsx82vbAWYhlrz8vF
  QpcV72G0BFAiBFGaV5cCNgUX2JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvzXWgKTyZeSV
  wm14BHcEEdETUy6kgR5QkIqSkGpgst+w4v/fTj41Lmjf8flaw6uYfxeQbcw+e/sJ4wSF++mfB
  KWc05FRPZfqwalcozS4yyjbw26zK9+NR5MbPcx3iZog8enRvi7JOo5tEo/O9it+TdFae2HDXx
  XkWu/+BeLmHRR+752dbC23trpfdzRP8NNQ9V1QuJGBDifW1kh1/906YdOTVkVLDKucvP3sXdz
  npnk6t4lAscHY/4earn75w1aFnsUcn3qpxePNUtHuJWPPTpC1G6QsYF7Dm+4tt8WuLuRzZvoh
  xTfdtV/NyoUl2WTXeM2d5Fd8v7yt67zH9opRUkc71m+FtQo2xie/WtAj5Zwt4L/zds++4q66m
  TAw3g/dTqYZHOzu2O8Q+36vEUpyRaKjFXFScCABp9TtiZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-565.messagelabs.com!1670830513!181962!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22389 invoked from network); 12 Dec 2022 07:35:13 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-16.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:35:13 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 14E3B7B
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:35:13 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 08CB2156
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:35:13 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:35:11 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] nbdkit: upgrade 1.33.3 -> 1.33.4
Date: Mon, 12 Dec 2022 15:34:31 +0800
Message-ID: <1670830471-3000-5-git-send-email-wangmy@fujitsu.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100039

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.33.3.bb => nbdkit_1.33.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.33.3.bb => nbdkit_1.33.4.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.3.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.4.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.33.3.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.33.4.bb
index af8354676..bc28eb84f 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.3.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
 "
-SRCREV = "ef035f7090d8bec2700ef1f941e371d351d647ad"
+SRCREV = "eaca70ec362dcf745fc81188f6008528d1b17961"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


