Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C86DC77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:48:11 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.49140.1681717681982831600
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:48:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XhCnXgNk;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681717680; i=@fujitsu.com;
	bh=+a8b8+geMpdIiDAKqrk9gSdolhI35bCBsVsxG9djd3E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=XhCnXgNkT5ZvXpCxXyt1rf+lIK4li8EYVks7DsVNAD+yebDsqtLPtJSt9YDap0hjB
	 aOl0BtMoNNur7C1qwVLoCUCkyIIbQLLV7VqJ4cAKg2pENZFtAMU0H1AtipEVeSilC9
	 AdSPnQYCbdVV+tj7BHJhj/OWNIiP8g7CFM/EOwyNa9gm6mIM5u8oLrx6s6340oCsPB
	 TifDRdwyVBV1voTz8p2U0sZPHG9sodiU36hwA4IP1gB7ivh76x8x5UVx/lHI2iuM2v
	 fw7JPpgs7QVHAYIROyEH+tWnFqG0KpwOQgMzojeY6s+iBmvfgl4eOsbqSmNdQYLx5r
	 /+nOXCiyHmnfw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxSXf9T5s
  Ug7kHjS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyjnbeZCn5wVBz+/4ClgXEWRxcjF4eQwBNG
  iR1XbrJBODeYJCYfXcUE4exllHi9u521i5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBP4mvi1uZQGwWAVWJ7hkHwOK8Ak4Sm44tZgSxJQQUJKY8fM8MEReUODnzCQvEHAmJgy
  9eMEPUKErMvtzMAmFXSrR++AVlq0lcPbeJeQIj/ywk7bOQtC9gZFrFaFqcWlSWWqRropdUlJm
  eUZKbmJmjl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOil5dasokRGIwpxaxvdzD+7/2r
  d4hRkoNJSZT3Rap1ihBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3vPfbFKEBItS01Mr0jJzgJEBk
  5bg4FES4TV+BpTmLS5IzC3OTIdInWJUlBLn9f8OlBAASWSU5sG1waLxEqOslDAvIwMDgxBPQW
  pRbmYJqvwrRnEORiVh3kk/gKbwZOaVwE1/BbSYCWixnBLY4pJEhJRUA1Plz2lpqX73gnYk8l2
  eNjv33/ucA66qyjp9220k/gT1fC7srdvG+STfdGH39UucKgc0byxyTnlzYnmLdOL295/FWY2O
  Pdz99xNvoPjUuGA2r9mdMTtKHxxbvz/syvTMLtmVStfz+iQFpe+cWmBrtsr30HQ9G+sLYul9w
  Qfm57qaqq/SjZzWr+PAPPX2m9unLyy8xNv7W6ZDLkdZNjSVbbHrJj/37RKb9p84MIvz5e8ne2
  YIb82JKX+W6nOeI0zPeHfby28+ea8F0izStt1bumld6541CeyxtUnzohdtC9/4NS54e82jpRO
  uZMSy5sTqc1Wkzf61ku11wS6P25f5J1xX2bN0xrc3N/QbY9Puh9QqsRRnJBpqMRcVJwIAD6Gd
  20EDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-591.messagelabs.com!1681717679!450417!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4111 invoked from network); 17 Apr 2023 07:47:59 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 07:47:59 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 6DA701000EE
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:47:59 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 61CCA1000D7
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:47:59 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 08:47:57 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xlsxwriter: upgrade 3.0.9 -> 3.1.0
Date: Mon, 17 Apr 2023 15:47:41 +0800
Message-ID: <1681717665-19231-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102117

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Minor fix for cell color issue.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-xlsxwriter_3.0.9.bb => python3-xlsxwriter_3.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_3.0.9.bb => python3-xlsxwriter_3.1.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.9.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.9.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.0.bb
index e4acf4159..d556e8b6d 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.9.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.0.bb
@@ -16,6 +16,6 @@ RDEPENDS:${PN} += " \
 	python3-io \
 "
 
-SRC_URI[sha256sum] = "7216d39a2075afac7a28cad81f6ac31b0b16d8976bf1b775577d157346f891dd"
+SRC_URI[sha256sum] = "02913b50b74c00f165933d5da3e3a02cab4204cb4932722a1b342c5c71034122"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


