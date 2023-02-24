Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5123CC678D5
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 02:47:36 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.9017.1677206849754141695
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 18:47:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mAXFmr9y;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677206848; i=@fujitsu.com;
	bh=PeDuuRPhqh8haZEHjr7v+4xA19VEFxf7/bwtN+sQj40=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=mAXFmr9yTIsXCKbpxyVAbeg7UIJCFlZcGa428N7j4U6ht247Vm3N9I/15BNadBjby
	 CWmfi2bVCjsN/m9VyeVGEo5+ZxvqTCjDxbYy+t2VRSSIphShjevpZO7WloNNj5cjIA
	 eh9T0WcMIBbqxnelO7V68apBRv8J9Eo9YoqTP4uAFpdWEc9S/jhrxVitIdVSDhkYl3
	 7+u/9VUrdJS6oxRce4TtE4vxWkSMp4wPwRM+Scd28pmY49hNqPTWU2JUfEGYXkzrdb
	 OLn2/qgc/dGjfzZZv4jl+z+pSjjuVCKtdRDgb/E1Q4UIwiTGCPaivraKi13ooquyxu
	 U6KnMCrbnAUGg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxSdde9Ue
  ywcvHShYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aqHZ8ZC2axVUw7vpOtgfECaxcjF4eQwBNG
  iYWv/kA5N5gkbhyYwgjh7GWUaJq/i72LkZODTUBK4sb9/2wgtoiAvsTS2XuYQWxmARWJF797w
  GqEBUIk7nxuYgKxWQRUJV60TGYFsXkFnCSmTOkHi0sIKEhMefieGSIuKHFy5hMWiDkSEgdfvG
  CGqFGUmH25mQXCrpRo/fALylaTuHpuE/MERv5ZSNpnIWlfwMi0itG0OLWoLLVI10QvqSgzPaM
  kNzEzRy+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzknRS8vtWQTIzAYU4oVj+1g/Nf7V+8Q
  oyQHk5Ior67Mj2QhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEryvFIFygkWp6akVaZk5wMiASUtw8
  CiJ8LKBtPIWFyTmFmemQ6ROMSpKifNqKQMlBEASGaV5cG2waLzEKCslzMvIwMAgxFOQWpSbWY
  Iq/4pRnINRSZi3XQVoCk9mXgnc9FdAi5mAFn9/8wVkcUkiQkqqgUlm/cuK3sCHglOmztlZ5L/
  SP3fNsccRIuyWiQ2X3wVffNAZIlZu+pkj6WHT1MWFeVxZDZXpC76t3CMnN+/neZ6ykwvX6kwT
  cKqKCfr34WayWBOPiXRKkd+mn/Gy99vVzky+e8g7knv11rbnNV7F9xXl7vHOnMjC+fpt7ex3v
  oWZr2ctFZn54MXylde66nYxhETI/Nh2aqtBOUPF/BP+x1W31ZicDNtaPeuG3ZPso0/dxeqmbJ
  A7rDYr+7FT63zH21+568xMcz3Vrj1ysXitP22XxuxV1ywdfBjDe2WWZOf8/+uzpD+LMSmNOcm
  hfJaT97uEFcu+lv3QPztzc5OdeIjVD4v6dr9NF2xXrtr6KFyJpTgj0VCLuag4EQAbqF/YQQMA
  AA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-548.messagelabs.com!1677206847!79829!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18571 invoked from network); 24 Feb 2023 02:47:27 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Feb 2023 02:47:27 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 4A30A1000DB
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Feb 2023 02:47:27 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3E1B21000D5
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Feb 2023 02:47:27 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Feb 2023 02:47:25 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 1/3] krb5: Fix install conflict when enable multilib.
Date: Fri, 24 Feb 2023 10:47:16 +0800
Message-ID: <1677206838-16882-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Feb 2023 02:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101242

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
file /usr/bin/krb5-config conflicts between attempted installs of lib32-krb5-user-1.17.2-r0.armv7ahf_neon and krb5-user-1.17.2-r0.aarch64

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
index 2221000e3..6fc630d99 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
@@ -196,3 +196,6 @@ pkg_postinst:${PN}-kdc () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+inherit multilib_script
+MULTILIB_SCRIPTS = "${PN}-user:${bindir}/krb5-config"
-- 
2.34.1


