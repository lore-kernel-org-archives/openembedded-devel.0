Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC9E1C433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 01:35:52 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.3207.1658453740101475772
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 18:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EqK3GwhX;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658453738; i=@fujitsu.com;
	bh=THQhc8Km4dPp2HmX6ddFM5sC9IWbaoohJR2PTJ9dr+U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=EqK3GwhXMFLqHbcAMGBnFzf6l+6Dna/HLAjMiCcj8QbZ5V53x1zoB7gIwNvgMmaPy
	 4sHBEbw3GBid/2FkVp8Jk0O9N4koyCH5tO7mhUikxM7dXbcL+ox7gCj9/sVjfu/6CR
	 MW2Y/bD9fKESitJoHYepPC/8j2wt6xxuWPsX/IsDUsLl1RbzAGCj1N7t9v9zUgU4Nu
	 5+88+Njl3r/+vd5/oeP2SfvlQcH2vpF5dP5BaLsIjulc9hMqHCmyv4wU1BZ3ngjKTF
	 ZWnOXvbbJaQC8hfq86S39AdBvaN4DE0HOr1B4c9k1Q+uxbLeMOYNu+ko5H/f2s0cKG
	 s5h4ZTsLnSkYQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8MxSfflv5t
  JBk3XBS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxzb9sZC67wVhx/dpylgXE+TxcjF4eQwBNG
  iQuXupggnOtMEgf/fWWBcE4yShx8t5i9i5GTg01AXeLxzdeMILaIgL7E0tl7mEFsZgFVie6La
  4BqODiEBUIkVq71BgmzAIWnHboA1sor4C7R8uEnE4gtIaAgMeXhe2aIuKDEyZlPWCDGSEgcfP
  GCGaJGSeLEio9Q9RUSrw9fgoqrSVw9t4l5AiP/LCTts5C0L2BkWsVok1SUmZ5RkpuYmaNraGC
  ga2hoqmtpCaQs9RKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yorc5NzUvTyUks2MQIDM6U4uXwH
  4/Z9v/QOMUpyMCmJ8u6bdDNJiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRvwV+gnGBRanpqRVpmD
  jBKYNISHDxKIrwWX4DSvMUFibnFmekQqVOMilLivEu+AiUEQBIZpXlwbbDIvMQoKyXMy8jAwC
  DEU5BalJtZgir/ilGcg1FJmFf+N9AUnsy8Erjpr4AWMwEtNje/AbK4JBEhJdXAJOK4ykOHN/W
  R3rOTIZcfMmxcIKOfdn37X6W89V9sbqjkvt+xXPji2udZdamJQl0+0+Z8qf0oL8t3puTxnqjH
  8bOzZ2/Ys/WmzVUtzvvzJrJusX5uxSgsrL2+zXJuRk6MCOealR2HLlQwVwQJf7lsw5ajsvvCn
  +WXre4WatekzdSymvTcT0UhPy3vpPy3aXvWHAgwVTB9LHW+9GWgdqfm1B+H9byPct/NPVukM/
  P+VlX22Vkse3ZeVt1n8PDognBZkx6bOxn9gic0fx56Fzmh+nFUs/vq+13ndl2qWMBdt1I+RkN
  va27knC+NTGYyafL/ed2fTV4Tv10i9ViixY6Nl5qMF14M5Zua0eN7QuvyOyWW4oxEQy3mouJE
  AGJW/3BHAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-732.messagelabs.com!1658453736!48590!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22661 invoked from network); 22 Jul 2022 01:35:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jul 2022 01:35:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id AE5061000C2
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:35:36 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A1AAB100077
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:35:36 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 22 Jul 2022 02:35:34 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-fastjsonschema: upgrade 2.15.3 ->
 2.16.1
Date: Fri, 22 Jul 2022 09:35:22 +0800
Message-ID: <1658453726-25988-1-git-send-email-xuhuan.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 01:35:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97925

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Add dependence python3-json

Changelog from 2.15.3 to 2.16.1
================================
* Fix uniqueItems when explicitly set to False
* Fix generating invalid code for some schemas using items
* Preserving full path in combination with $ref
* Improved error messages for oneOf and anyOf

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...stjsonschema_2.15.3.bb => python3-fastjsonschema_2.16.1.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastjsonschema_2.15.3.bb => python3-fastjsonschema_2.16.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.15.3.bb b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.16.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-fastjsonschema_2.15.3.bb
rename to meta-python/recipes-devtools/python/python3-fastjsonschema_2.16.1.bb
index a2821c1177..bb6c1ee813 100644
--- a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.15.3.bb
+++ b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.16.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/seznam/python-fastjsonschema"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=18950e8362b69c0c617b42b8bd8e7532"
 
-SRCREV = "d03f3835da4899bdeb597a9d3f30a709e7c3254f"
+SRCREV = "98399bb4029b2d7020d8abd9770661a5b2c4f9f8"
 PYPI_SRC_URI = "git://github.com/horejsek/python-fastjsonschema;protocol=https;branch=master"
 
 SRC_URI += "file://run-ptest"
@@ -33,6 +33,7 @@ RDEPENDS:${PN} += "\
     python3-urllib3 \
     python3-numbers \
     python3-pickle \
+    python3-json \
     "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


