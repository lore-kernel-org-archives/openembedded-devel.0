Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A1EDC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 07:24:21 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.7711.1654759458721475575
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 00:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aV9hS5+y;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654759456; i=@fujitsu.com;
	bh=GtwsPHwGv+Ce4jdec5/ytxzIoBIGH7wKQ5Ia196E9kU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=aV9hS5+yB8JKIcPHOBS/OT5NX4Bq2fAXuBVbXor1QATK66l4+7n9Zb88+oGas7mCr
	 hTAbnO4k0NtrKOPg5C5bvTgpmWR6Xmc4KglzAKs04jeRG/T78WrAkVuETL9v5HUWlX
	 kafujMo/KFdmMdg9RHRziI1AONH/hJO+EYPYGfBwfKbRd/9ESQmp/fR4SiJPvrqSpW
	 k9sERdPWJkUQ675SvDS4weJCGmPTaxi7CwHvxwxdFtVfLM/DIK4Xeu54iyK3wgHxCK
	 gQK6IebPqh6tnhISNKSr3IPjb0yfVrCYlZ37FwqDS/vTsgTKov4BKF2HLjCJwYCpZA
	 OS9L24r3FWU9A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8ORqKuwYGG
  Swcm5shYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aN58EF0zkr5txtYGlgPMrRxcjFISTwhFHi
  4pWrzBDOBSaJo592MUE4+xklHvUcYO1i5ORgE9CVePFjMQuILSKgL7F09h5mEFtYIEBiUtNDN
  hCbRUBFYuvyTWD1vAIeEieafoLVSwgoSEx5+J4ZIi4ocXLmE7A4s4CExMEXL4DiHEA1ihKzp8
  tDlFdIvD58iRnCVpO4em4T8wRGvllIumch6V7AyLSK0TqpKDM9oyQ3MTNH19DAQNfQ0FTX2AJ
  IGeolVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibnpOjlpZZsYgQGX0qxWv4Oxr8rf+odYpTk
  YFIS5T2XujBJiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvo7lAOcGi1PTUirTMHGAkwKQlOHiUR
  Hjt5gGleYsLEnOLM9MhUqcYLTmmzv63n5ljOZic+bXtALMQS15+XqqUOG8aSIMASENGaR7cOF
  i0XmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzDsbZApPZl4J3NZXQAcxAR3068oCkINKEhF
  SUg1Ms6bO+/Vj+9Y4i/5D6109hQ+fNcgM7bv+zWia3ZNHLwt3Fma9K4q4dnjbn5uXblnq5xz6
  xCovpBV76ayUz+SlbpHt+csaNLQu6HwPz3nIE/DWO1P9hcqlHQI7hRMEw0QOL222mDp/w9vIZ
  6ctlh9V2FWWz5Hyaqpm/e6ZJ4uP1ya9/JKw+IjWvKZZu1aeYefhSJ53RDv9+brZf6/uvBbX9W
  na/t1L9NZE/XmdaSVVoBl+Ndwsac78cBlJ7kUL2CJcSxzkU25/7YuZ+PE5G6+qdZp3Dg+HKXu
  xtZK+3eXfTmZ+Pxk2peacn+F2UPraw47NUQce1OSeCirqlyy+VP9O6+uH+rjglRWfnt02P+h7
  WomlOCPRUIu5qDgRABuonpRRAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-548.messagelabs.com!1654759456!46358!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2585 invoked from network); 9 Jun 2022 07:24:16 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Jun 2022 07:24:16 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F17AF100195
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:24:15 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id CC9B2100182
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:24:15 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 9 Jun 2022 08:23:57 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-asyncinotify: upgrade 2.0.3 ->
 2.0.4
Date: Thu, 9 Jun 2022 15:23:48 +0800
Message-ID: <1654759428-11155-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jun 2022 07:24:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97455

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...hon3-asyncinotify_2.0.3.bb => python3-asyncinotify_2.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asyncinotify_2.0.3.bb => python3-asyncinotify_2.0.4.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-asyncinotify_2.0.3.bb b/meta-python/recipes-devtools/python/python3-asyncinotify_2.0.4.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-asyncinotify_2.0.3.bb
rename to meta-python/recipes-devtools/python/python3-asyncinotify_2.0.4.bb
index 189547bae..efa91c654 100644
--- a/meta-python/recipes-devtools/python/python3-asyncinotify_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncinotify_2.0.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitlab.com/Taywee/asyncinotify"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ec941a1cd6616454970d03cb9c9e8f8"
 
-SRC_URI[sha256sum] = "a14baf680a3d3e1cf54e082ab56f56c475d59d3644cfc25c00c460e56d9bbdf7"
+SRC_URI[sha256sum] = "0ec20725b09decced856e46bb4dae6843ab429bfec87c42340dd0fefe1e2a25a"
 
 inherit pypi setuptools3
 
-- 
2.25.1


