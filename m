Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BFFFC4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:20:33 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.48852.1671538823023207450
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:20:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hpN4RGZ1;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671538821; i=@fujitsu.com;
	bh=feno46CtfjshZ+k3VRdm/oq58C70qorfR0sI/07B97Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=hpN4RGZ1pDB9K+cgvpk2x93w1HruedldEq93AZKmSFwInemid2NmlaKvgg0g8sI+m
	 43YZATw4wxHvgWonVCvMrdkR07iNXoMADEPdZZ4K2qXo7xrKolPdkVYhOGMKAIhYIY
	 4TU3ravKXBDGkIgSW7GSHa9isY8w0Xt7tJBMyOhGF2fPkDpbw+ZQcr4ID6NRV7X8na
	 xHY7jRAmnlMMqTII7zyXsKtBhYzd/MRzkQKBh9GRJFr/RSQCZXIeA9v+9QYP//e1dt
	 0CFAkoccFkwB+UeBK/jMiv16RPj8TutvbC2SX7+drzNeRDXUxxmg0o2PIAiJJsGYQd
	 p0KM6xMIVU3qQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxSbdlxcJ
  kg00LDS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ow1jd+YCqZyVrxYfoy9gXEfRxcjF4eQwBNG
  iRkTzjFBONeZJBYdfMUC4exhlNj2+DuQw8nBJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sIC/xItpEDaLgKrEvYsLWUFsXgFHidarnxlBbAkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF8
  wQNYoSsy83s0DYFRKzZrUxQdhqElfPbWKewMg/C0n7LCTtCxiZVjGaFacWlaUW6VroJRVlpme
  U5CZm5uglVukm6qWW6ublF5Vk6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEhmNKcYr7Dsbjy/7o
  HWKU5GBSEuUNC1+YLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCd8YioJxgUWp6akVaZg4wNmDSE
  hw8SiK8PbOB0rzFBYm5xZnpEKlTjIpS4rxMy4ESAiCJjNI8uDZYPF5ilJUS5mVkYGAQ4ilILc
  rNLEGVf8UozsGoJMxrBDKFJzOvBG76K6DFTECLD12aC7K4JBEhJdXAFDVFPfAHO5f8syb/lFP
  XtklUx1T+uxLF+daI8UIzm+Sd5RI5lzvXH/RVnLF55u2JJb8zWX23Hl39oHjfbVYbE+Z9Pdd9
  FuVslcpr7GZw3meosuP2NHHh3be79r1T+CQbEMEs5zfLV++Z+sPwXRuMJzpy/PY5cvlc2dswh
  Z7S2uL5lXxCM4O7shzn/OHccWSe4rLwafOMDc9/WxUzidE5Zu2/H+fnhl2zbHZmTOEJ1hSyb0
  j+fynu26v/8oVSUs2P3SVuLxTn9WfnZPzXZ32t+N4Cx/e8j58vVlHi+vp2g+aq76ulFRM6V7n
  UbpRcuN/xkhtrn6mqsI1nzZxtosUxioVLPcPOXVI586icQ3qBEktxRqKhFnNRcSIAnF2OLEID
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-728.messagelabs.com!1671538820!383561!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9315 invoked from network); 20 Dec 2022 12:20:20 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Dec 2022 12:20:20 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3FD1E1000DC
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:20:20 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 32EBD1000C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:20:20 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 20 Dec 2022 12:20:18 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eth-account: upgrade 0.7.0 -> 0.8.0
Date: Tue, 20 Dec 2022 20:19:45 +0800
Message-ID: <1671538789-7206-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100140

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-eth-account_0.7.0.bb => python3-eth-account_0.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-account_0.7.0.bb => python3-eth-account_0.8.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-account_0.7.0.bb b/meta-python/recipes-devtools/python/python3-eth-account_0.8.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-eth-account_0.7.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-account_0.8.0.bb
index 5b8c34ec8..bb82168b3 100644
--- a/meta-python/recipes-devtools/python/python3-eth-account_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-account_0.8.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=287820ad3553117aa2f92bf84c219324"
 
-SRC_URI[sha256sum] = "61360e9e514e09e49929ed365ca0e1656758ecbd11248c629ad85b4335c2661a"
+SRC_URI[sha256sum] = "ccb2d90a16c81c8ea4ca4dc76a70b50f1d63cea6aff3c5a5eddedf9e45143eca"
 
 inherit pypi setuptools3
 
-- 
2.25.1


