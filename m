Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F090C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:29:10 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web08.1138.1667809747371304510
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:29:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Hdgrw50z;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667809745; i=@fujitsu.com;
	bh=Fm2b5CfPqHWrE93Kg9Q0j9FwhzB8r2AvT+UCiGPA79M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Hdgrw50zBS8AvOVrS4tOMrW6nI2faRVY9U3Q+z5y6eBCajpZMp2iqdkDKu0ZaZACc
	 aA4itPkTp+YD1OIMsHnK2qRgTEKRzH7CJ054nHCRHmsDDYQSWcoK1XtE3XCxR7zqyV
	 PAQg21Z7Unckj4xlVOkdLJbTwj2zHAoxajgP80R8I8edu+SI0GwrZmeEcOf3Gf0iRG
	 kF02UW33O/lg3Yctyf9FN6Pa7+izAyACWAuG4dUahrxsNuOAacTrlrDJq4HsKoomS8
	 k7rr69by0W/YC3K6MRRfPA6E3jShyu7neAdpT3VnJvjzvae28DyRBsIFuozQAlq637
	 ITU7+1hfFHfHw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORqHvxYEa
  yQdMvTouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP8lf+sBb/ZK+4//M3cwNjH3sXIxSEk8IRR
  ounjFGYI5zqTxOf2nUwQzm5GifPTO4AcTg42ASmJG/f/s4HYIgL6Ektn72EGsZkFVCRe/O5hB
  7GFBdwkTmybz9jFyMHBAhQ/c6QQJMwr4CSxftYhsDESAgoSUx6+B2vlFHCW6Dm6BMwWAqq5cL
  uFBaJeUOLkzCcsEOMlJA6+eMEM0asoMftyMwuEXSExa1Yb1Ew1iavnNjFPYBSchaR9FpL2BYx
  MqxhNi1OLylKLdA31kooy0zNKchMzc/QSq3QT9VJLdctTi0uAMonlxXqpxcV6xZW5yTkpenmp
  JZsYgaGbUszOuoPxxZI/eocYJTmYlER5fy/PSBbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwXtjI
  1BOsCg1PbUiLTMHGEcwaQkOHiUR3rB9QGne4oLE3OLMdIjUKUZdjplf2w4wC7Hk5eelSonzXt
  sNVCQAUpRRmgc3AhbTlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8zLvAZrCk5lXArfpFdA
  RTEBHVBekgRxRkoiQkmpgmvRB1XXx38LvC79tm8HU+KuQW5C3bnro+XSGe4vfM91xLmNjk0wu
  9fw082qN1J1XAiz+PaY/7kfm+K3/uSCsyWOl8dT9T/V/2dpcsZ9zTLYkL4rtjXyguHR/de8s7
  oxHfQcFw7IWsL/yW7IzxOZiNo/YdpUrpj5ZVlqrp0j1ZDZenGNYZHL98D+h3rXKvTlxVz0mqF
  QdU+ae+939hEb5zQ+zTaLuTTrP9FdioUNk+gfRsgYHJY4Alktu/3SPphuqy2nlhJusk/zeaVx
  wISvBMZabl7Eiv15AdsVk/nrD40lOE3k9Z4m9c9p/gfvVvokMG5lSd7ldrc09nuLbNLHk+X++
  ik8udkf2cXFrT1ZiKc5INNRiLipOBACfjdc2ZAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-29.tower-585.messagelabs.com!1667809744!321075!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8053 invoked from network); 7 Nov 2022 08:29:05 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-29.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:29:05 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C66F8100194
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:29:04 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BA82C100182
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:29:04 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:29:03 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] ulogd2: upgrade 2.0.7 -> 2.0.8
Date: Mon, 7 Nov 2022 16:28:24 +0800
Message-ID: <1667809704-30790-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667809704-30790-1-git-send-email-wangmy@fujitsu.com>
References: <1667809704-30790-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:29:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99446

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-filter/ulogd2/{ulogd2_2.0.7.bb => ulogd2_2.0.8.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/ulogd2/{ulogd2_2.0.7.bb => ulogd2_2.0.8.bb} (98%)

diff --git a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.7.bb b/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
similarity index 98%
rename from meta-networking/recipes-filter/ulogd2/ulogd2_2.0.7.bb
rename to meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
index 7a307dc29..19bd32ccd 100644
--- a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.7.bb
+++ b/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://git.netfilter.org/ulogd2;branch=master \
            file://ulogd.init \
            file://ulogd.service \
 "
-SRCREV = "5f9628c9273815b6e560603427fe86118e7cb5bb"
+SRCREV = "79aa980f2df9dda0c097e8f883a62f414b9e5138"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


