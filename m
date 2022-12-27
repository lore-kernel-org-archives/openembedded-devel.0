Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E03C46467
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:36:55 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.152376.1672123012263639205
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:36:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Xt9JrDHa;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672123010; i=@fujitsu.com;
	bh=EkZGtVFD/kxqY29OcDNA7hm1SeDCyJS5DZu/PyyBcik=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Xt9JrDHaf5bMEf25u1P+DyQv8SFNtOHZr8b7bTGIwKTikFI586MaBxBc415dAb1nX
	 JWXyWrVRpC/WMkM2cAJgbmyJdi5NV5A00FCkyxoMwf9RRLdBAWwe2PyU+m0pqLEgNG
	 L37+jV+7lI77oydo1K2jBTDx0SdwF+ZjeeST0fFXwC2RaMCvyh/fPe7Un1bagtn91T
	 TujcvjFP8znpshumGw74gN0zpjMkuFiuLkCeibhkp88Yh4upUDU99+dQUhacRfISbG
	 DcO6/VSFdNcv2eezqT0mtqHKCNMzPTL9zxbBo7zuhXrqv6YyveZLdAZD8lUmLbjEsR
	 cpM+2ddosaOgg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORpNs4aVW
  ywa3DehYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bkryoFnzgqpp49zdzA2MHRxcjFISTwkFFi
  54zJLBDOZSaJhb9XMEI4exglLp9bzt7FyMnBJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi989Y
  DXCAs4Sr9auZQKxWQRUJWa29jKC2LwCThKzT68Eq5cQUJCY8vA9mM0JVL/y5R8gmwNomZPE+i
  UZEOWCEidnPmGBGC8hcfDFC6hWRYnZl5tZIOwKiVmz2pggbDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGM2KU4vKUot0DS30kooy0zNKchMzc/QSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yorc5NzUvTy
  Uks2MQJDN6WY5cEOxh3L/ugdYpTkYFIS5ZXqXpUsxJeUn1KZkVicEV9UmpNafIhRhoNDSYL3M
  khOsCg1PbUiLTMHGEcwaQkOHiURiFbe4oLE3OLMdIjUKUZFKXHezolACQGQREZpHlwbLHYvMc
  pKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmVQcZz5OZVwI3/RXQYiagxR8OrQRZXJKIkJJqYLL
  hlp+e2ta1nf/GmivrJH7ori82VMuOa3l0IFW7yvujyPlVeTx5HnuZqpYazN7XHjVHrv7/s+/3
  GpT4nu7j4bvZLnlsremSn3br1q69MLM1hXteZqeFNpP5axGHOafn8Kp3Xc6c6Gkwz/wZR+pKf
  7tJBgLbl96aO+HwimZWJu3c3nCv66uy5gqn7/p/4XgU85PVOw0ChfJC4j+f1Z5UFHf59ITP4W
  nnl5sx+Xb7OM1V6U9qu5yeVjntd5pWxfsJF62Kv6vs+75ywbU9vszcErWCB/9xCx3ljHJw33U
  08t6JczdXPepY+qGyxsO3Ij7l3YzcFKZ74UH1c7yS1a9cnz4xltfjj4fn106bxKnuEkosxRmJ
  hlrMRcWJAIsHyFRYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-591.messagelabs.com!1672123009!661268!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17854 invoked from network); 27 Dec 2022 06:36:49 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:36:49 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 62CB71AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:36:49 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 578837B
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:36:49 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:36:47 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] logcheck: upgrade 1.3.24 -> 1.4.0
Date: Tue, 27 Dec 2022 14:36:05 +0800
Message-ID: <1672122966-31746-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672122966-31746-1-git-send-email-wangmy@fujitsu.com>
References: <1672122966-31746-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:36:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100258

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../logcheck/{logcheck_1.3.24.bb => logcheck_1.4.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-extended/logcheck/{logcheck_1.3.24.bb => logcheck_1.4.0.bb} (96%)

diff --git a/meta-perl/recipes-extended/logcheck/logcheck_1.3.24.bb b/meta-perl/recipes-extended/logcheck/logcheck_1.4.0.bb
similarity index 96%
rename from meta-perl/recipes-extended/logcheck/logcheck_1.3.24.bb
rename to meta-perl/recipes-extended/logcheck/logcheck_1.4.0.bb
index ea3dd5a4c..7436b9c7e 100644
--- a/meta-perl/recipes-extended/logcheck/logcheck_1.3.24.bb
+++ b/meta-perl/recipes-extended/logcheck/logcheck_1.4.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c93c0550bd3173f4504b2cbd8991e50b"
 SRC_URI = "${DEBIAN_MIRROR}/main/l/${BPN}/${BPN}_${PV}.tar.xz \
            file://99_logcheck \
 "
-SRC_URI[sha256sum] = "5e304adf2880967c3b155bcf98e4f0809417a16bf91adb372fa065f38ab2c0cf"
+SRC_URI[sha256sum] = "dfd95c980727108cc9b8921736af9388dea0f6157688c03e8e39de378107b3dc"
 
 inherit useradd
 
-- 
2.25.1


