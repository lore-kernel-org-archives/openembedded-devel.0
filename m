Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F7AC00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 07:01:46 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.22696.1659942099309419868
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 00:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=m/fE8k7e;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659942096; i=@fujitsu.com;
	bh=zpoTY3BlpkUxQGswuRepm+9MXAW2RSUb1x5ijmPBT1Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=m/fE8k7eZbKjui48YhYNeKbsXY40ukXns3Cmmbn9iBMNfmD40gchTSghDGkjN4OCo
	 TUz9/ru5dN3pdpCTMwB5ysPKXpR7HnJBT1gDCnMIcAB/qpJqOhXqQDVD6cI5roGaqa
	 V6r9uefOLw9qhLrY3itT4Q8wxe1R6RJOknDDJFu2LdSyw13pegt101Duv7DxKuAmUb
	 nAlWZ+sGlbZe401K+wOubP61aBQZQFXJAywNhEZFiYDrFe0KRfqy9m42g/L1FcSsS8
	 LXlgl4zwgYAj/MNtgHc7ezGoLNwjXSktvpsD7gIWXm+UfN0AqszfWTS+HAcQkDRpGE
	 /rh9jnovLDykQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8OxWffClg9
  JBn8aRS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozFpyUKdrJWbLxxjaWB8Q1LFyMXh5DAQ0aJ
  48cusEM4V5gk/s1qZ+5i5ARy9jBK7O/QBbHZBDQkdk+9DBYXEdCXWDp7D5jNLKAmcfTlTzBbW
  MBWYtei5awgNouAisSaxt9sIDavgIvE+y+fmUBsCQEFiSkP3zNDxAUlTs58wgIxR0Li4IsXzB
  A1ShJvL+1hhLArJF4fvgQVV5O4em4T8wRG/llI2mchaV/AyLSK0SapKDM9oyQ3MTNH19DAQNf
  Q0BRIG+oamuolVukm6qWW6ublF5Vk6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEhmVKcSr/DsYb
  +37pHWKU5GBSEuV13vghSYgvKT+lMiOxOCO+qDQntfgQowwHh5IEr/QmoJxgUWp6akVaZg4wR
  mDSEhw8SiK8xiBp3uKCxNzizHSI1ClGXY6ps//tZxZiycvPS5US5/XbDFQkAFKUUZoHNwIWr5
  cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfOag0zhycwrgdv0CugIJqAjNnx+D3JESSJCSqq
  BacPyHa9T95v9Uaqr1Km96fS0slR831/fTZeEDD1/NAt37Su9+m1Z6lvf/xLzGx7937rC5LH1
  vo9CWWx3+xc66QlqRb6+1+EgLFTwJiZrzsemh+znN71buPVhUAGbGitfYYQvx4a5MtPct34NM
  iw5ITAx60lVwL1Zx6YUHvPXanB0vhjfmTtpdsXdPdvanSINmRJt2hYcvJi07lHUZNvlDNVXDd
  5M1Z33va9E6OG04GS305xMt+X27fG5/YEzkPfa6iqht13z2FXvKYU531v73FLgr+6Jz8uMNab
  ve6p3wc3l582HnoWnDEqCHLepex7smH2pNeyPu8fU+cvE6k7xCi3YUZCi8bOV4YVue+sZOSWW
  4oxEQy3mouJEAFs9G3FSAwAA
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-2.tower-745.messagelabs.com!1659942095!314065!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24689 invoked from network); 8 Aug 2022 07:01:36 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-2.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Aug 2022 07:01:36 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id BE251151
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  8 Aug 2022 08:01:35 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id AFFFF150
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  8 Aug 2022 08:01:35 +0100 (BST)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 8 Aug 2022 08:01:33 +0100
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xrdp: Fix buildpaths warning.
Date: Mon, 8 Aug 2022 15:01:26 +0800
Message-ID: <1659942086-9524-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 07:01:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98152

Don't print configure message.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta-oe/recipes-support/xrdp/xrdp_0.9.18.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.bb
index 7ec6ae15f..947ca7538 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.bb
@@ -49,6 +49,7 @@ do_configure:prepend() {
 
 do_compile:prepend() {
     sed -i 's/(MAKE) $(AM_MAKEFLAGS) install-exec-am install-data-am/(MAKE) $(AM_MAKEFLAGS) install-exec-am/g' ${S}/keygen/Makefile.in
+    echo "" > ${B}/xrdp_configure_options.h
 }
 
 do_install:append() {
-- 
2.25.1


