Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B69C4C433F5
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 09:50:56 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.38684.1639561855566288563
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 01:50:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EOf+aCQP;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639561852; i=@fujitsu.com;
	bh=h7jz1uF2wxymVEZOh51vq2BdQ2Qu0NZLP2unC1laRNU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=EOf+aCQPQbVMEExdfipzNGuNtpD34Pcuib2um3G5Jmq4U9IQ55ynB+uGeNzXFUlte
	 66xVa/xGTfoRksTz29C+VyIZ9NtZ405cDaTDhlqh9BtKMGfm+MxY0MkDek7eq53lm1
	 lMPl3OnFmKxUKNZXPnU7NLo90ZWdWBNsOfDrexpzMqte7nHd4Ae8BdAjboq0NJbBvy
	 Xa6/+xacg/vtTdChBC9BOq8RPfE30NWW/W8FJpwQ/pHBm2qENMDqWuuVzM3mcN/W4c
	 QKu1Uiphn2UQzZuhWRCXQ21RX/+h8KNV32Ii8BSdQQisxZT4d7z8Rr1QwNgC8nv3/6
	 KPJ/TIawOl2rw==
Received: from [100.115.68.153] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 86/6D-31213-C7AB9B16; Wed, 15 Dec 2021 09:50:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MxSbdm185
  EgynXZSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozXu3pYCybwVCz/OoG5gXEydxcjJ4eQwBNG
  ictvJLoYuYDsC0wSS45OYINInGSUOLY4HMRmE1CXeHzzNSOILSKgL7F09h5mEJtZQFWi++Ia9
  i5GDg5hAR+JL/czQMIsQOFnrc/ASngF3CW2dn8HGykhoCAx5eF7qLigxMmZT1ggxkhIHHzxgh
  miRknixIqPTBB2hcTrw5eg4moSV89tYp7AyD8LSfssJO0LGJlWMdomFWWmZ5TkJmbm6BoaGOg
  aGprqmlnqmpvoJVbpJuqlluomp+aVFCUCZfUSy4v1UouL9Yorc5NzUvTyUks2MQLDMqXY1WsH
  45G+n3qHGCU5mJREefM27UwU4kvKT6nMSCzOiC8qzUktPsQow8GhJMHLsRMoJ1iUmp5akZaZA
  4wRmLQEB4+SCO/b7UBp3uKCxNzizHSI1ClGRSlx3qs7gBICIImM0jy4NlhcXmKUlRLmZWRgYB
  DiKUgtys0sQZV/xSjOwagkzPsGZApPZl4J3PRXQIuZgBYfy90OsrgkESEl1cAUNUti57TAqbo
  OC1w+Rj38c8XiX/aBh9KOeydd9v6s1vqpt7SsMU+4YW3PXwbtKxeqV2T629/fsdT2tIxCyeoJ
  /xZxHa6s35I7uXPTnGu3zeYUyffKlqt9br5lxMhxJOnsUs263pTKHyvTD4ru3/Hi9XMt/nq9N
  +5thZLXrjN//9prenvJOlWWb1EX362K/Rgk76Jab3s15f2d41V7dNRTH16L7FjCfqi9/vhOvZ
  0rKkvXvA8NaX3Ws2fiSzl25sjtwmckvB/vW1y8MZRn8WHLt1aqqVmRZpdEFLM1SrX+R1/cEur
  msEZn4suNvKa7FN8KPTumx5J06Wba1GqjW22+5x8KRx3OdlrFrpG1ViNOiaU4I9FQi7moOBEA
  GWXHLUYDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-532.messagelabs.com!1639561852!11924!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12900 invoked from network); 15 Dec 2021 09:50:52 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Dec 2021 09:50:52 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id ED4F1100455
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 09:50:51 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id DE00610044D
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 09:50:51 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 15 Dec 2021 09:50:43 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-graphviz: upgrade 0.19 -> 0.19.1
Date: Wed, 15 Dec 2021 17:49:59 +0800
Message-ID: <1639561799-12241-1-git-send-email-xuhuan.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Dec 2021 09:50:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94367

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
=================================================================
-Fix undecoded CalledProcessError.stdout and .stderr when .pipe()
call with an encoding different from self.encoding fails.
-Fix missing project root conftest.py in source distribution.
-Extend examples/graphviz-escapes.ipynb.
-Improve test coverage.
-Increase build scripts verbosity.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-graphviz_0.19.bb => python3-graphviz_0.19.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-graphviz_0.19.bb => python3-graphviz_0.19.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.19.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.19.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-graphviz_0.19.bb
rename to meta-python/recipes-devtools/python/python3-graphviz_0.19.1.bb
index 593cdb4e53..f1246b4b21 100644
--- a/meta-python/recipes-devtools/python/python3-graphviz_0.19.bb
+++ b/meta-python/recipes-devtools/python/python3-graphviz_0.19.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://graphviz.readthedocs.io/en/stable/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=87cd8818b7e63c6a9c580034e80d7521"
 
-SRC_URI[sha256sum] = "b42554a1c47f24a9473b7f4e380d17b228586a067c97ea69d5354d6074be8dfd"
+SRC_URI[sha256sum] = "09ed0cde452d015fe77c4845a210eb642f28d245f5bc250d4b97808cb8f49078"
 
 inherit pypi setuptools3
 
-- 
2.25.1


