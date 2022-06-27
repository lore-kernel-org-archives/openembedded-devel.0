Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F29DC43334
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 07:00:56 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.38751.1656313247593931283
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 00:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XfWeBSTe;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656313246; i=@fujitsu.com;
	bh=zngctU9XQoGw3RTYJyqtZwOl6VZbXyqrCY07sWC+Ujs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XfWeBSTe3YCLB7oAWOobsmmhDTnzAwaXgNUmI9aQ/9qJvg0IcuZBfSMyPKroL7uYC
	 Ye+CUlG1cZV4XSa7mF6q7EggqR2WaBKzeXfAFqm6bjb/EaBqt9iBuTP7zDBQOmtN4F
	 1j51M4TMjOAGRmSlaBDgif9Mobn1loq1StF7FlRqN8dB4oIt5h6/+1n1fQJ3YIXJXH
	 KuDnfzxEV8Dqujdq/gvmaGic5JWBY/ErY15EpjHkbU19OHiuaWNrauVE+sq/OqRpPV
	 X+RoC434CRyreHtk4tbkD3iFoKkZoG8ukpUJY62t5vVYkM8PnMVz9bkd1ec1pQJrhX
	 A0b+5DOowEQSg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRWlGSWpSXmKPExsViZ8OxWXdO6M4
  kg5WHTC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyeTYtYC85zVLxfsIWtgfEcexcjF4eQwENG
  iRvX+6Ccy0wSz3vPAjmcQM4eRomTf4NBbDYBNYnpt26wgtgiAvoSS2fvYQaxmQVUJF787gGqZ
  +cQFrCVOCkCEmURUJWYvvgU2BReASeJBysPgHVKCChITHn4HqyTU8BZ4uLELcwQm5wkXi08zw
  xRLyhxcuYTFojpEhIHX7xghuhVlJh9uZkFwq6QmDFjGxuErSZx9dwm5gmMgrOQtM9C0r6AkWk
  Vo1VSUWZ6RkluYmaOrqGBga6hoamusaWuqZFeYpVuol5qqW55anGJLpBbXqyXWlysV1yZm5yT
  opeXWrKJERjAKcXqJjsYu1f+1DvEKMnBpCTKe0ptZ5IQX1J+SmVGYnFGfFFpTmrxIUYZDg4lC
  V6rEKCcYFFqempFWmYOMJpg0hIcPEoivG3eQGne4oLE3OLMdIjUKUZLjqmz/+1n5lgOJmd+bT
  vALMSSl5+XKiXOuzsIqEEApCGjNA9uHCziLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5mU
  DuYonM68EbusroIOYgA7ym7gD5KCSRISUVAOTzmr9LxMnd/3+65T9TsFfOWRiU/VdHptVdzub
  P97qe9/ctUf459NV01bJ1T07yMidNM3ggo3nJQHebbbil/5w6nhkmtycq83g+8Lfeq3Gd0P2/
  auelp3kvzOz5YEz4yH3RdJPzuutCLYzXLmP6dTDSc+KTcNbD2bpb2Uw8Ko0ESgqP2yvprLarP
  NBmM7bPbsEGHc3Fk7c5q38bd2vVvcrEX/+9aTt2e4me2uWx+K38vxNTZpPzTKlV6/48Vt5zXO
  LbzeYLNezqodKCqtb27mLH7stHeO3f1HfJJNT23VU3jFOaji1z2ejrheX0Tz1ybpPFlleMXaN
  y2xQij2YPavklru4KD9P3OunpfX2p58qsRRnJBpqMRcVJwIAK+OuF3MDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-571.messagelabs.com!1656313244!233127!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29385 invoked from network); 27 Jun 2022 07:00:44 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jun 2022 07:00:44 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 7665314C
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 08:00:44 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 730AE7C
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 08:00:44 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 27 Jun 2022 08:00:43 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] uftrace: upgrade 0.11 -> 0.12
Date: Mon, 27 Jun 2022 15:00:26 +0800
Message-ID: <1656313226-23852-4-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jun 2022 07:00:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97597

Changelog:
==========
 * support dynamic tracing with -fpatchable-function-entry
 * --clock option to use a different clock source

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../uftrace/{uftrace_0.11.bb => uftrace_0.12.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/uftrace/{uftrace_0.11.bb => uftrace_0.12.bb} (95%)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.11.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.12.bb
similarity index 95%
rename from meta-oe/recipes-devtools/uftrace/uftrace_0.11.bb
rename to meta-oe/recipes-devtools/uftrace/uftrace_0.12.bb
index 6d7696c06..111e94866 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.11.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.12.bb
@@ -10,7 +10,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 
 inherit autotools
 
-SRCREV = "304a492652dc0fd220f601167c4ebb30e2ae4a39"
+SRCREV = "46d536709451609e5e99099216d9dcf567ceeaca"
 SRC_URI = "git://github.com/namhyung/${BPN};branch=master;protocol=https \
            "
 S = "${WORKDIR}/git"
-- 
2.25.1


