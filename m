Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 088F3C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 12:35:23 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.29659.1647866121788930429
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 05:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZXo2EsaQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647866120; i=@fujitsu.com;
	bh=khIvYyISh/lNdkgl3YG+RL2a8B7wPGLwY3jiRuWS+yg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ZXo2EsaQDV63Gy5BSLZlpVgaCp2VZcy+eXZFLkSokaX5TSYa9SoWRhJVpoU3VFUsq
	 dXy7DvrZXwMn3iqprtaNzKsnZ+OoD1P+T1OvvuOoIdgLB/dWtM1YCJNsfnOb4RMDiU
	 7exZJWwVz5gqUfCZ/su0ybdHQXcrucVVJdKwZkHJoy0+JL6ydjWpbMBYQ4UZyH2+Q+
	 ce4aMmUOnX8aNZpu7Y8GKZu4Bkp+AoxXJ0N4NXuKdsG99O+StmI8yCZA1054kuKAyC
	 3hwu930U/03wvfy7etYNRHlB1iROi9A8C4pvACmCOzK6fgfhiGi8+QV4Vmbk5cLKdq
	 BFolDFvE0HMfw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSZe90CL
  JYNo9HouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPx8V7GgiscFad/vGduYHzO3sXIxSEk8IRR
  4uX3HUwQzgUmifMHJjJ2MXICOXsYJY5ejgGx2QTUJKbfusEKYosI6Essnb2HGcRmFlCRePG7h
  x3EFhawl/hwbCZYnEVAVWLHwTY2EJtXwEnix7Y5YLaEgILElIfvgWo4ODgFnCWWvk+HWOUk0X
  BtKitEuaDEyZlPWCDGS0gcfPGCGaJVUWL25WYWCLtCYtasNiYIW03i6rlNzBMYBWchaZ+FpH0
  BI9MqRuukosz0jJLcxMwcXUMDA11DQ1NdYwsg01IvsUo3US+1VLc8tbhE10gvsbxYL7W4WK+4
  Mjc5J0UvL7VkEyMwiFOK1XJ3ME5Z+VPvEKMkB5OSKG+dkUWSEF9SfkplRmJxRnxRaU5q8SFGG
  Q4OJQlejjygnGBRanpqRVpmDjCiYNISHDxKIrx3soHSvMUFibnFmekQqVOMilLivH/ygRICII
  mM0jy4NlgUX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzPsWZApPZl4J3PRXQIuZgBbrs5q
  BLC5JREhJNTB5Suo4rBcJ2+lz+1eRquOL20lXLwRtmmxosV2w86HOjISpZ+Pvvn83dYXP18rq
  spb7breecm1ecea8/QotnWn/ir9ujIrez/lQevrjb/rm51bX7Lw9daNDXvH+21lKeie8w4xc2
  Hf92b+V59o3SRafH/mnj3e+tPv8rvzvy0W5a+0vflX2bSs5bZk8P3WZ1kfF03Lc+sufOjzqZe
  CdbVLntsQ95PNvkX3LbcL2TXwTafT9qIK6teyTmhl7DnAxy4X7zz19uiXy1f0de/J+/M0znpu
  WUln12tPg0vpq896NB+5nddwKZmKNPm0cwLLwf0/QnT7tus1z5i+T6rdNvXzggchWzr3v3l87
  KHfslcejbiWW4oxEQy3mouJEABfGDgpdAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-548.messagelabs.com!1647866119!8618!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24826 invoked from network); 21 Mar 2022 12:35:19 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Mar 2022 12:35:19 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C966210033B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 12:35:18 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id BCD341000F5
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 12:35:18 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 21 Mar 2022 12:34:41 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] rrdtool: upgrade 1.7.2 -> 1.8.0
Date: Mon, 21 Mar 2022 20:34:28 +0800
Message-ID: <1647866068-30929-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647866068-30929-1-git-send-email-wangmy@fujitsu.com>
References: <1647866068-30929-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Mar 2022 12:35:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96110

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rrdtool/{rrdtool_1.7.2.bb => rrdtool_1.8.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/rrdtool/{rrdtool_1.7.2.bb => rrdtool_1.8.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb
rename to meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb
index 122b0707cf..d953c11ee8 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=39df84cfd8a5e18bf988f277f7946676"
 
 DEPENDS = "libpng zlib cairo pango glib-2.0 libxml2 groff-native python3-setuptools-native"
 
-SRCREV = "56a83f4f52e6745cd4352f9ee008be3183a6dedf"
-PV = "1.7.2"
+SRCREV = "3af04acd38bbc61bbdcdd931dcf234c971aa5336"
+PV = "1.8.0"
 
 SRC_URI = "\
     git://github.com/oetiker/rrdtool-1.x.git;branch=master;protocol=http;;protocol=https \
-- 
2.25.1


