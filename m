Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DAD3C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 05:06:55 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.4620.1638421613852577907
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Dec 2021 21:06:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=diT5aCs/;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638421611; i=@fujitsu.com;
	bh=MI0ADOw1jTmPTEkzOPYleBgKVpy46wseSgmqg+VTXAc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=diT5aCs/nZ9KSQR1AbBucVlbq4K9A1MQ9hf8qXhvLTkwQRvv4eyRE9WidJDjklVHD
	 HPbs07dClvaWFGy/esTlPUesfTY4NU4ZNYuAnf7KkL6JOkOILSzFc0KxpQpGMQQ075
	 W/Hv7JiUkFhu0zUIpQ1PITtSL1Dsu6B89eP4nqtyxUZbbuTZr7yLv8AZDOAdcVuqYY
	 4vly2PFruwWBpQVOzM/QX4zKg6QszNxndsW8jtsyI4sWvfOfSeObh/Nhu553Ysq8TS
	 37fgYkxM2Y1rIiRKwSk3MzarRA6w5DdqJbr6gVZGKbuhEQj15w8Ux3go0HkEKp34rH
	 k2atWXvKZevIA==
Received: from [100.115.2.64] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id E9/49-06911-B6458A16;
 Thu, 02 Dec 2021 05:06:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRWlGSWpSXmKPExsViZ8MxSTc7ZEW
  iwcFnbBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aM/89YCy6zVryfMoupgbGPtYuRi0NI4Amj
  xI1Zn6GcC0wSPetvM0I4uxkldu+5B+RwcrAJ6Eqce7yWHcQWEdCXWDp7DzOILSzgIPGhcyeYz
  SKgIvFz/Quwel4Bd4kJp/+ygtgSAgoSUx6+Z4aIC0qcnPmEBcRmFpCQOPjiBVCcA6hGUWL2dH
  mI8gqJ14cvMUPYahJXz21insDINwtJ9ywk3QsYmVYxWiQVZaZnlOQmZuboGhoY6Boamuoa6hr
  pJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEBl5KMSPTDsZlfT/1DjFKcjAp
  ifI6BaxIFOJLyk+pzEgszogvKs1JLT7EKMPBoSTB+zAQKCdYlJqeWpGWmQOMApi0BAePkgjv9
  GCgNG9xQWJucWY6ROoUo6KUOO81kIQASCKjNA+uDRZ5lxhlpYR5GRkYGIR4ClKLcjNLUOVfMY
  pzMCoJ86aCTOHJzCuBm/4KaDET0OLDs5aDLC5JREhJNTDd9ZrrdvifeflK5eqjB386T8zzyw6
  Y2XLU5NWq5RXtz1Z2nW+MT7102Wx7FPMMte0P1F568m92+uXzuCUw8Nmig6/fXk1Pqk/sCTlU
  0yrSG3xuzstbyz14LfK9GNdIC80X/Cqa+GtHh9qmtwkfZ/XV39yw0ZIjg7spfqnQ5xdKJq8OP
  Jy25sDlc3x/eutZkyXb58/YcuNDx+TmyWevbzw1PXa+8daL/3fXP0w2m7zo8TqJCq2oRzPX9n
  xm0wpqbPgcpeHZkqh09MVCzUMnWoMb3+5TTHl1JdFScGO6F8fP5yf3id5si21KYHtvxrPszLb
  eGU+C/Q8JsjGWy854ZvhaJFf4g4OUxLSgL9bHW/MLlFiKMxINtZiLihMBGiDeCjcDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-587.messagelabs.com!1638421610!167098!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11043 invoked from network); 2 Dec 2021 05:06:51 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Dec 2021 05:06:51 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 67A9610033A
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Dec 2021 05:06:52 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5B4571000FD
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Dec 2021 05:06:52 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 2 Dec 2021 05:06:32 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] spitools: upgrade 1.0.0 -> 1.0.1
Date: Thu, 2 Dec 2021 13:06:20 +0800
Message-ID: <1638421580-2615-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Dec 2021 05:06:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94174

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-support/spitools/spitools_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_git.bb
index 5bad781ff6..8302576f43 100644
--- a/meta-oe/recipes-support/spitools/spitools_git.bb
+++ b/meta-oe/recipes-support/spitools/spitools_git.bb
@@ -5,8 +5,8 @@ LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
 
 BPV = "1.0.0"
-PV = "${BPV}"
-SRCREV = "f5d87954bd9e13689481700105efe2f42199d364"
+PV = "1.0.1"
+SRCREV = "87da3bfc03f3088e2e880b6b48195bb225fafeac"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


