Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4639BC433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 13:10:09 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.67])
 by mx.groups.io with SMTP id smtpd.web09.30895.1632748208363719352
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 06:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sydIySAV;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.67,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632748200; i=@fujitsu.com;
	bh=2a+eTt15PzcTi2QANgRNZ9DmhdIt5NmeoJdkQNNKAuk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=sydIySAVnZxQSHzPweTa2jVgk0JREAUlQWId4OD3aPL9UD3oKd07g+XoFXu4lp0mi
	 giJmhvEfvjKvJa/hP//gUF5FEgvB1XTpJqzJFK/5hMJKG7bmteVEUVYaJRDaOCo9ni
	 vjxZjlhXiKPCNB+3RfNloME4uUN3lEwKAp/UVgaTwibgAHRKTOdp2Uk87+WoMrnlyu
	 6kdQGJG04sZ2O8BayOoLNH6Rk/uUEiZi0p7eKMcze7E5wFQ57VlfHh/2QhZ5wLQCJS
	 rOo2nOYxpCvOTZJWiVwGM3/6uwO8wyyvuFHu5JGdhwjnvCisanPQ5BmgaF1XiT9Tkb
	 HW2C6YEGgcLuA==
Received: from [100.112.197.4] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 80/96-25352-8A2C1516;
 Mon, 27 Sep 2021 13:10:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MxRXfFocB
  Eg1erGS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owHb1pZC7ayVtx+8oOpgfENSxcjF4eQwGwm
  iQ8PZrFDOCcYJZru9rJ1MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3DzuILSxgK/Gq+
  xgTiM0ioCrx49hioHoODl4BJ4nrSxxBwhICChJTHr4Ha+UVEJQ4OfMJC8QYCYmDL14wQ9QoSs
  y+3MwCYVdIzJrVxjSBkXcWkpZZSFoWMDKtYjRPKspMzyjJTczM0TU0MNA1NDTSNbS00DU20Eu
  s0k3SSy3VLU8tLtE11EssL9YrrsxNzknRy0st2cQIDK6UgmNyOxh733zQO8QoycGkJMobsjYw
  UYgvKT+lMiOxOCO+qDQntfgQowwHh5IE74w9QDnBotT01Iq0zBxgoMOkJTh4lER4nfcCpXmLC
  xJzizPTIVKnGBWlxHn7DgAlBEASGaV5cG2w6LrEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZ
  jX4CDQFJ7MvBK46a+AFjMBLa6dFACyuCQRISXVwMRpHRtwzU56t/5C3hx+c/fPrG6579bvjZs
  iaqhmN9XYatMa3lWdU5YHlr6ULTq3b5dBBpPUG6Hvl7pWsT/tPOhz9oa6qYoOj97tQy/PvagJ
  nBcyp0brkkDjaSc9D/0lih2C6rsfT3Y339nbv0N91UxBdpefjPe2VcroOv9l0g+7sPXUE1Hro
  24Gu7eXtxm3RHOXeR4/XFYzb/+siNQyi4kHBeyt+LK98x4t0vKW8FbZb+Q/gbHr0NQ7YWuueX
  M+Tf/+SGPZZet66Ziww8+CVjBWu3b+SxENulLD65UW8ETa5udt25/7Ra9/fzR9d0KJtb/DpYP
  ygSvmeK33EM1dy/Hu0dxrt1c32LOrLt/WqsRSnJFoqMVcVJwIAOcM9pEpAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-291.messagelabs.com!1632748199!17191!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5090 invoked from network); 27 Sep 2021 13:09:59 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-12.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2021 13:09:59 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18RD9vxk018578
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 14:09:59 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 27 Sep 2021 14:09:55 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] sassc: upgrade 3.6.1 -> 3.6.2
Date: Mon, 27 Sep 2021 21:09:47 +0800
Message-ID: <1632748187-70908-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Sep 2021 13:10:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93148

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/sass/sassc_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/sass/sassc_git.bb b/meta-oe/recipes-support/sass/sassc_git.bb
index 3c7a55cc3d..407cbbddd0 100644
--- a/meta-oe/recipes-support/sass/sassc_git.bb
+++ b/meta-oe/recipes-support/sass/sassc_git.bb
@@ -7,8 +7,8 @@ DEPENDS = "libsass"
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/sass/sassc.git"
-SRCREV = "46748216ba0b60545e814c07846ca10c9fefc5b6"
+SRCREV = "66f0ef37e7f0ad3a65d2f481eff09d09408f42d0"
 S = "${WORKDIR}/git"
-PV = "3.6.1"
+PV = "3.6.2"
 
 BBCLASSEXTEND = "native"
-- 
2.25.1


