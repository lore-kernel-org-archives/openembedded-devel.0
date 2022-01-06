Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF57FC433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 09:52:47 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.6744.1641462766886992118
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jan 2022 01:52:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=j3AjgvGy;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641462765; i=@fujitsu.com;
	bh=ZQTsr723AwIaaH7av3e8RcgRNSAiBO4g7PaQ3YoGLno=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=j3AjgvGyoG+tiEtOMN+38oL2XD+KvRKrLQvetNa9+wbuhIup2HIBwebKiMPavNxck
	 9vkTJ6BXZsOO0SwikdW/PunbZPv5o5+3ghIyH6JI+nAfXschK0HV/RpMPllkph5/fJ
	 Lpv81U4gmIXhR8JFYb5RXrzy9xiELg4wwzEnVZvJO8NYMhEo/mFzEbJq4uUs6whKrD
	 tSV4Z51ydW+if6xDEgnWNyPJpnRBABSlIWToIFCWZZnsOjShUFuhLTLLxOS3uJa6qL
	 ue4lEYGLM95Nkq4ZoHTNlOWepSs5qKoCzeewLmj1OIm6JXpLrDlwT9aNRhk0nBzjMG
	 BzMc23vdjmAxQ==
Received: from [100.115.70.246] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 F8/8C-31213-CEBB6D16; Thu, 06 Jan 2022 09:52:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRWlGSWpSXmKPExsViZ8MxSffN7mu
  JBssuqVhcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBmfl8sXLOKs+P1zOXsD4x6OLkYuDiGBJ4wS
  XzZuZoRwLjBJXPr9lg3COcEosf/MJqAMJwebgLrE45uvwWwRAX2JpbP3MIPYzAKqEt0X17CD2
  MIC7hJbT3YC1XBwsAioSCybEQUS5gUKTz9xCaxVQkBBYsrD98wQcUGJkzOfsECMkZA4+OIFM0
  SNksSJFR+ZIOwKideHL0HF1SSuntvEPIGRfxaS9llI2hcwMq1itE0qykzPKMlNzMzRNTQw0DU
  0NNU1s9Q1NtZLrNJN1Est1U1OzSspSgTK6iWWF+ulFhfrFVfmJuek6OWllmxiBAZmSrGr4g7G
  a30/9Q4xSnIwKYnydmldSxTiS8pPqcxILM6ILyrNSS0+xCjDwaEkwVu3AygnWJSanlqRlpkDj
  BKYtAQHj5II76+NQGne4oLE3OLMdIjUKcZwjjdrlyxi5ngLJtvu3QWS7WBy5oKDq5k5ZoHJ++
  2HgOQDECnEkpeflyolztsPsk0AZFxGaR7cMlgSuMQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1F
  JmHcWyBSezLwSuJteAZ3LBHTuObnLIOeWJCKkpBqYEk7Lf5ghXW318r/wcta/gpv2Hd+3JZ4r
  v6KaN2juBAFjyz12b9Q31c5Nd9/XdLXJc5PhqWWf2nt5ezhO5E5Wv/A7clvLngPZ1ldEv34Rv
  rS+J/GlmNRv7S8GBuWGcbYqMbs/TpfiKXN53vZKrrNfKSr30KPzT/lEAp7veySnt/dXUO6R6P
  jUunkKs7csFbH8efjghQOPHMwKFpR+Mrz4botMiuVjbbGvMwweG4Z5bFXqUOebkXM/2cuw0en
  /AsXpIR0iYQ6+Meek1GOr9jy8aqNq2dJ/vvgby5mUsz7x39ryP1wqEItYpMTuf7VPd1Hjx6Kj
  lzziVZsXRPqGv5IMFuWf8t9IX9x3adIm80glluKMREMt5qLiRAAy6xGRfQMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-528.messagelabs.com!1641462764!1849!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12690 invoked from network); 6 Jan 2022 09:52:44 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jan 2022 09:52:44 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 197DE100440
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  6 Jan 2022 09:52:44 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 099D6100331
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  6 Jan 2022 09:52:44 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 6 Jan 2022 09:52:34 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-meh: upgrade 0.50 -> 0.50.1
Date: Thu, 6 Jan 2022 17:52:22 +0800
Message-ID: <1641462745-19071-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jan 2022 09:52:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94667

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-meh_0.50.bb => python3-meh_0.50.1.bb}           | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-extended/python-meh/{python3-meh_0.50.bb => python3-meh_0.50.1.bb} (85%)

diff --git a/meta-python/recipes-extended/python-meh/python3-meh_0.50.bb b/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb
similarity index 85%
rename from meta-python/recipes-extended/python-meh/python3-meh_0.50.bb
rename to meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb
index 372b3a006f..bf0df021a4 100644
--- a/meta-python/recipes-extended/python-meh/python3-meh_0.50.bb
+++ b/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb
@@ -9,9 +9,8 @@ inherit setuptools3
 
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://github.com/rhinstaller/python-meh.git;protocol=https;branch=master \
-"
-SRCREV = "11980776c5ad757401ea1d12fd1f331d96428105"
+SRC_URI = "git://github.com/rhinstaller/python-meh.git;protocol=https;branch=rhel9-branch"
+SRCREV = "c321ce22950aff76611a3c6beffa02b5ea3adbed"
 
 FILES:${PN} += "${datadir}/*"
 
-- 
2.25.1


