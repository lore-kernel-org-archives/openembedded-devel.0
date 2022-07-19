Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B63C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 06:13:47 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.37408.1658211220425435724
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 23:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aIa6xrDC;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658211218; i=@fujitsu.com;
	bh=8HVH/xdHb9egnwbfhH62FQpT16HPB7XNy53cci3qfJQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=aIa6xrDCfN591dCi7yHDXR8SV+faCn3HHM+0eEHHYCjPFcVJxeqgKKPzFxVSV8fau
	 4S1k7R58qTNr8ew/KttWu5MqWfE3bR6naOqomsnHMi4Opy0VoaKwxomudFQeEoEOPt
	 McBiPJo75qNWo8P1nqdwKsYnKkNEPVko/n5IHibvcPF1UrsL97ZoIfQbKSroesa9fD
	 dDB84BsdU69NZjIqV/XpCRMoMmM9d6m856f3OkVdxK3uj2tO+dDjXvxfvMvfcSuhwX
	 Y+OaVDImKn81DeaYLmxFNxPwI+fgSYfhujA9VkjJFzA8q8FR7BgFf1gfRZ3Yo5HM1G
	 va5xW97yx0Tww==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8MxSXei97U
  kg5OrbSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owP31wK1vJW3FrxkqWB8S53FyMXh5DAE0aJ
  vX8XsEI415kktv3bzdLFyAnk7GGUWDNHCMRmE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8e9
  i5GDg5hAVuJr/0ZIGEWAVWJFxtXsoPYvAKOEqdebAGzJQQUJKY8fA/WyingJNE+7TsjxCpHiQ
  ev7jFD1AtKnJz5hAVivITEwRcvmCF6FSVmX25mgbArJGbM2MYGYatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWibVJSZnlGSm5iZo2toYKBraGgKpI10DU2N9RKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL
  9Yorc5NzUvTyUks2MQLDOKU4beYOxi37fukdYpTkYFIS5Z2qeS1JiC8pP6UyI7E4I76oNCe1+
  BCjDAeHkgTvBU+gnGBRanpqRVpmDjCmYNISHDxKIrxpzkBp3uKCxNzizHSI1ClGXY6ZX9sOMA
  ux5OXnpUqJ8xZ6ARUJgBRllObBjYDF9yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrwMIFN
  4MvNK4Da9AjqCCeiISU5XQI4oSURISTUwHTDOM8xLqXq4ZGLM3lnVc3aaq2wwO60af+reU4XM
  FBa2e8flvCf8Fd00P1TxYXXYLoHUnTbnJy3jD1E//n3jgiCe+lTnJt/waRmXrz1p6OvtZNgsJ
  bftL0tEtvFLRiOfVy5/12ec2KLQwJp/9rmce2O/HBtzLv8xNrMPCv8KbomeYc9nvOjPmNwwuS
  Nq3+d/B792vontq5VNmPyD259D8NI9iY8+DqYPVyjsrHi5JaryYen20MnX/Fgzv3Et/OvdEaB
  54fB3wxf7vZd8scy4P0ORb5dv8uZpTEdOFITWn80+M3f/sflcYhmnLi9iFUp91p3/8Wfn3seK
  /wXPzovLXCMh/PnemwuXbZIeL7x/QYmlOCPRUIu5qDgRAIL4ulpqAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-745.messagelabs.com!1658211217!467287!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24634 invoked from network); 19 Jul 2022 06:13:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-22.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jul 2022 06:13:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 66CBE1000C0
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:13:37 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5A53B100077
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:13:37 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Jul 2022 07:13:35 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] irssi: upgrade 1.4.1 -> 1.4.2
Date: Tue, 19 Jul 2022 14:13:17 +0800
Message-ID: <1658211200-2891-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658211200-2891-1-git-send-email-wangmy@fujitsu.com>
References: <1658211200-2891-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Jul 2022 06:13:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97887

Changelog:
===========
Changes
---------
    Add irssimoduledir to irssi-1.pc in the Meson build (#1383, #1378)

Fixes
--------
    Use -isystem includes, limiting warnings to Irssi code. Fixes compilation with Perl 5.36 (#1381, gentoo#851522, #1384)
    Fix missing lines when changing dynamic textbuffer contents (#1382, #1387). Reported by externalserver15
    Fix Perl cross compilation with Meson 0.60.0 (#1377)
    Fix default channel prefix used for /JOIN to default to # (#1385, #1388)
    Fix crash in /LASTLOG by getting line texts before printing (#1367, #1398)


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../irssi/{irssi_1.4.1.bb => irssi_1.4.2.bb}                    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/irssi/{irssi_1.4.1.bb => irssi_1.4.2.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/irssi/irssi_1.4.1.bb b/meta-oe/recipes-connectivity/irssi/irssi_1.4.2.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/irssi/irssi_1.4.1.bb
rename to meta-oe/recipes-connectivity/irssi/irssi_1.4.2.bb
index 40ce935adf..455561f613 100644
--- a/meta-oe/recipes-connectivity/irssi/irssi_1.4.1.bb
+++ b/meta-oe/recipes-connectivity/irssi/irssi_1.4.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55fdc1113306167d6ea2561404ce02f8"
 DEPENDS = "glib-2.0 ncurses openssl"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "6a7692741bba16f3ba6f97cf7246421ac57055dcedcca9a4d21663f8efe47501"
+SRC_URI[sha256sum] = "79a4765d2dfe153c440a1775b074d5d0682b96814c7cf92325b5e15ce50e26a8"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
-- 
2.25.1


