Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2080EC433FE
	for <webhook@archiver.kernel.org>; Sun,  9 Oct 2022 00:34:26 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.9437.1665275655661965792
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Oct 2022 17:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ute9w+3R;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665275653; i=@fujitsu.com;
	bh=EgDz+3G+C16PF498zJII4wmKmfRwRMH0/JVklotHFvM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Ute9w+3RCcesQAwik3UOofdR8N4uHRg9LaDfNQVhHZ3u3XD7H4Rx7vhOOJLm77pId
	 OfuCQaWJhHvxUBZ1LhS+gg/ztkWLcflkdWLwH2ZkUb36K8/Ja9NRdayis2kXEScF6e
	 UIrl4Zffe9YhHNkwaFAlR52oS4yPKUrGdbeOjuN5azdsK6oVQkMetOQlynbh6f4+Pn
	 nfOqLxtNenhjYJgpuQA1/bxNR+aepZX2G0eq2cjE2nEkGnvaSC0koTtp417XZsWvAK
	 JrLiX2E+8NXqb1PeaUiVdmpOiUY1zkUp0OGPG7j7Pr30HUAFJZQm8FxYbQa8P8qKat
	 x/2/77zxSuwRA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8MxSZdF3Cn
  ZoPmqhcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjFn7numgqPsFW+PrGZvYLzP1sXIxSEk8IRR
  4tWV5YxdjJxAznUmifZGR4jEbkaJngdv2UASbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdw
  97FyMEhLGAj8agjEyTMAhTeOv8jM0iYV8BJ4shmLZCwhICCxJSH78E6OQWcJTqfTmMEKRECKv
  m93B8kzCsgKHFy5hMWiOESEgdfvGCGaFWUmH25mQXCrpCYNauNCcJWk7h6bhPzBEbBWUjaZyF
  pX8DItIrRMqkoMz2jJDcxM0fX0MBA19DQVNdY18JML7FKN1EvtVS3PLW4RNdQL7G8WC+1uFiv
  uDI3OSdFLy+1ZBMjMHhTipnDdjD+6f2pd4hRkoNJSZT36VaHZCG+pPyUyozE4oz4otKc1OJDj
  DIcHEoSvE7sTslCgkWp6akVaZk5wEiCSUtw8CiJ8Ib9c0wW4i0uSMwtzkyHSJ1i1OWY+bXtAL
  MQS15+XqqUOG+sMNAMAZCijNI8uBGwqL7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3gwD
  QFJ7MvBK4Ta+AjmACOsLqoR3IESWJCCmpBqa2nVK35r5WmTnN1eQla8HZ5V3vLaytb7Mva1hp
  IxX+702ba9rKS2k7m5+GlqUfe8yiWynLcEfV9vcUfQ/N7Idzt073426+L1N8s8K7nzMh43FfH
  v/0PwEmngtuvXI5ybH1VLnlpIYJx/zyLF+dVZ88oUFs0l01r6ns2dLbNJOnH2AUz7cJkvJ+5r
  9Js/fjqZXrI21Kfn1u9591//23mWGXn1yd4MN8PY51sszNN+rLSxefOq7NeUwsuusuUxpruFj
  HivUs13lbrnr2tBRo8fJkhneoeeU/9GLce+8cm/69ds7qxGfPTy08K/lw9ZZ5N7xdcxrj9bdt
  7eDmfPSCQ3pD0Jl0fav0f5+tJyXdN1ViKc5INNRiLipOBACO0MssZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-591.messagelabs.com!1665275652!227495!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16022 invoked from network); 9 Oct 2022 00:34:12 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Oct 2022 00:34:12 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 901841000CD
	for <openembedded-devel@lists.openembedded.org>;
 Sun,  9 Oct 2022 01:34:12 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 83353100078
	for <openembedded-devel@lists.openembedded.org>;
 Sun,  9 Oct 2022 01:34:12 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 9 Oct 2022 01:34:11 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] iperf3: upgrade 3.11 -> 3.12
Date: Sun, 9 Oct 2022 08:33:24 +0800
Message-ID: <1665275606-29112-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665275606-29112-1-git-send-email-wangmy@fujitsu.com>
References: <1665275606-29112-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Oct 2022 00:34:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99101

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-benchmark/iperf3/{iperf3_3.11.bb => iperf3_3.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.11.bb => iperf3_3.12.bb} (95%)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.11.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.12.bb
similarity index 95%
rename from meta-oe/recipes-benchmark/iperf3/iperf3_3.11.bb
rename to meta-oe/recipes-benchmark/iperf3/iperf3_3.12.bb
index 2142a8ef1d..8c5ce36e85 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.11.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.12.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0001-configure.ac-check-for-CPP-prog.patch \
            "
 
-SRCREV = "76bd67f6e90e239a7686202d2b1b595159826d24"
+SRCREV = "e61aaf8c95df956cefbc54fab7b3d78914664180"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


