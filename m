Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB8EC25B08
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 04:16:22 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.1133.1659586579526321065
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 21:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DxJn51fo;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659586577; i=@fujitsu.com;
	bh=X4IzjJgRkdgbQtOjA2xhtjeSU1OPboTPblo9DqeE+7Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DxJn51foScfy9/hHfrpaYGJClwFyIiOAzyN9D4Ns9gOv3RuSWEpr2jab5uDshoqAD
	 irssFokIKZ8jM/bzJPv1a2C39hLFunGPsV2BhqXBIaM9UzgWH6nIHquO3h9w2rQF4f
	 FJi/qncTLK2vxaZOlws4ZEU9FbRw5nKFPwQtTcCMMLAP6Biq/Y/xESpk206wsKkBXj
	 eAcXF2lI/MgYU8yS2XgARsZWc6g9ukfeHLKwS3sv5NUiTo/PWL6hgGNCu06L1oyZI+
	 IF7qavKLKBofi3zaC8tTOTkZl3GaLAkenl3piZtmsdFtO/xajKQTcWRLdCDb27JBYy
	 78VzIj8gNvERw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRWlGSWpSXmKPExsViZ8MxSVfQ43W
  SwbFp3BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8as7qXMBQ85K64eusHSwPifo4uRi0NI4Amj
  xJntvcwQznUmiSudZ1m6GDmBnP2MEqcXOoDYbAK6Ei9+LAaLiwjoSyydvYcZxBYW8JF4uvYMO
  4jNIqAq8erOJ9YuRg4OXgEPiVVdKiBhCQEFiSkP34OV8woISpyc+QRsDLOAhMTBFy+YQcolBB
  QlZk+XhyivkHh9+BIzhK0mcfXcJuYJjHyzkHTPQtK9gJFpFaN1UlFmekZJbmJmjq6hgYGuoaG
  prrGRrqGFpV5ilW6iXmqpbnlqcYmukV5iebFeanGxXnFlbnJOil5easkmRmDopRQr7N3BeHnl
  T71DjJIcTEqivLJur5OE+JLyUyozEosz4otKc1KLDzHKcHAoSfDeMgXKCRalpqdWpGXmAOMAJ
  i3BwaMkwisK0spbXJCYW5yZDpE6xWjMcXfh3r3MHDO/th1gFmLJy89LlRLndXMHKhUAKc0ozY
  MbBIvPS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeZ+5Ak3hycwrgdv3CugUJqBTdLhegJx
  SkoiQkmpgmrwhWbrQ/pM328TGCveCy7efGNSd1bx5oDZcpWNn6yuZGaosLpufrbjS18MeeyrG
  ZjpDa9CpgMUiH6eY3Th0Vvb/kzqz739K/fbNWvfYy7Yw1bQs+++tqtN7pMxM9ETn39Sc+WnZ0
  6V7zlk4l/zYXDyPeYnh1g7DZGNTzdv2HrIrcw58FjrIW9x23ZBPc+NOVmuzF4ukfKee3Vzyia
  ml6OH99QXR5l7rPoRwip7M3rbx3SfH1N2pDKka34sf3PH3vff4TtOFvgi5/PpZpp4tZqyrVj5
  4uWDrwVsJNp4pbn7n9AInVoczXtbNr/Wv63knmc/RqxF1YPv+nNgPXVvmWHOoppz/caF+A5/7
  mbkaSizFGYmGWsxFxYkA0Tpye0oDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-565.messagelabs.com!1659586577!453431!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22669 invoked from network); 4 Aug 2022 04:16:17 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Aug 2022 04:16:17 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id DE7701000C1
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 05:16:16 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D1876100077
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 05:16:16 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 4 Aug 2022 05:16:15 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-dominate: upgrade 2.6.0 -> 2.7.0
Date: Sat, 30 Jul 2022 06:02:43 +0800
Message-ID: <1659132163-15875-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Aug 2022 04:16:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98119

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-dominate_2.6.0.bb => python3-dominate_2.7.0.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dominate_2.6.0.bb => python3-dominate_2.7.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-dominate_2.6.0.bb b/meta-python/recipes-devtools/python/python3-dominate_2.7.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-dominate_2.6.0.bb
rename to meta-python/recipes-devtools/python/python3-dominate_2.7.0.bb
index 8e17438262..bee89ed754 100644
--- a/meta-python/recipes-devtools/python/python3-dominate_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dominate_2.7.0.bb
@@ -2,8 +2,7 @@ SUMMARY = "Dominate is a Python library for creating and manipulating HTML docum
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 
-SRC_URI[md5sum] = "9f714324ca99eee98bb3c3cdbe838de6"
-SRC_URI[sha256sum] = "76ec2cde23700a6fc4fee098168b9dee43b99c2f1dd0ca6a711f683e8eb7e1e4"
+SRC_URI[sha256sum] = "520101360892ebf9d0553f67d37e359ff92403d8a1e33814030503088a05da49"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


