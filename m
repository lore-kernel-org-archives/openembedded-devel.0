Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E378EC6FD1C
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 09:46:49 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.9489.1678355200946745405
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 01:46:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TIMkQJVe;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678355199; i=@fujitsu.com;
	bh=n+0Esntg3glVnnHYWHBxb1SlSHYdB7rGnIhngfpsLBA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=TIMkQJVek55AENnbDBs2lSEB7nfqL6iNdk+ySoln0JZXP3Sc6bQkiy3oRtCaeLMEi
	 Omqd7uI5tAZPT4TOL8Leiv+8eLsnlqqQ4btbJ+Ny0gTiyDDp5ORzg69HN9V7YaFAbS
	 iCeX3W+wMv7jQ93ThN66tjTlaKvc/Hz+hel6deWCgNPcxb59j5JOiZFYgXDXagFFgv
	 L2YP9kcr6zhaNHzWrN0NeM1sgvEK6ayIoGOnw1xPPBSZhmmF6NVRyNWlCFGq359OOd
	 KOYfi5IL8L7W1CTpVCiaM3HOm+nND4pM3oCGdy4WUPSsD7cJdVe3QBdQjAK1T44BgP
	 +M9TIgCApXo3g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpPtvFWe
  KwZcWHYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPf9p+MBRM5K15+T29gPMjRxcjFISTwkFFi
  64NvjBDOVSaJ2Ts+sUM4exglni/+wdbFyMnBJiAlceP+fzBbREBfYunsPcwgNrOAisSL3z3sI
  LawQIjE05bLYDYLULzt1nsmEJtXwEni4ax9YL0SAgoSUx6+B+vlFHCWmPK9G6xGCKjmy7tWdo
  h6QYmTM5+wQMyXkDj44gUzRK+ixOzLzSwQdqVE64dfULaaxNVzm5gnMArOQtI+C0n7AkamVYx
  mxalFZalFuoZmeklFmekZJbmJmTl6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJOSl6eakl
  mxiBwZtSzPxyB+OJvr96hxglOZiURHm72ThThPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwmi8Dy
  gkWpaanVqRl5gAjCSYtwcGjJMLbPxsozVtckJhbnJkOkTrFqCglzpu4EighAJLIKM2Da4NF7y
  VGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrwrQKbwZOaVwE1/BbSYCWjxri0cIItLEhFSUg1
  Mk887d93+bX0x/0H955qSao2TRaJa4muf6feJTryYcOq1nrNw9XehTduP1YoIBLFt2Ow3329u
  a7X5svWCjr/TJb6HNLTZzjNY1m1dnvr9f+jVpYl5vU499skRt/66lRtO3n385sKDJu/D7koF7
  f12hmPFmnMPOdUsrZmXt/LeW1pVxDsrZALnJ4YNLtOuhb1do7rXY1NSQSDTiXXesn9zF605vF
  s1OMZIT9ZKwSN5bdIKPXUeU7mHC5PnXJm+aSnTP3fWk5zm9n6Oc1L1r8xMiTmm9HdbZ/SHwro
  GBr24bHfhU9m/eWcaLxO3dqzMCn7DczXxa9XPc6fPmO+eUmfOcc837vQh15dTNmn/2OeoxFKc
  kWioxVxUnAgARSSzy1kDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-587.messagelabs.com!1678355198!104948!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19538 invoked from network); 9 Mar 2023 09:46:38 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Mar 2023 09:46:38 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 53FC91B3
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:46:38 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 483021B6
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:46:38 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 9 Mar 2023 09:46:36 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 08/11] python3-pyexpect: upgrade 1.0.21 -> 1.0.22
Date: Thu, 9 Mar 2023 17:45:53 +0800
Message-ID: <1678355155-32741-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678355155-32741-1-git-send-email-wangmy@fujitsu.com>
References: <1678355155-32741-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 09:46:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101453

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyexpect_1.0.21.bb => python3-pyexpect_1.0.22.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyexpect_1.0.21.bb => python3-pyexpect_1.0.22.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-pyexpect_1.0.21.bb b/meta-python/recipes-devtools/python/python3-pyexpect_1.0.22.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-pyexpect_1.0.21.bb
rename to meta-python/recipes-devtools/python/python3-pyexpect_1.0.22.bb
index 1b80770d7..7d22266f8 100644
--- a/meta-python/recipes-devtools/python/python3-pyexpect_1.0.21.bb
+++ b/meta-python/recipes-devtools/python/python3-pyexpect_1.0.22.bb
@@ -7,5 +7,4 @@ LIC_FILES_CHKSUM = "file://README.md;md5=a6aa1e7097aca5955f9a2e1c8b0ce158"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "c661939158d6a1acbcc2191bedc47751"
-SRC_URI[sha256sum] = "96e900d6af928a94c2a75b4935ddda44872c218121d0467c549ae19e7608a9a2"
+SRC_URI[sha256sum] = "659351e7ee8923b42de8a774fabfc806acf07377d7fd19f2ea4412ef8f619c6a"
-- 
2.34.1


