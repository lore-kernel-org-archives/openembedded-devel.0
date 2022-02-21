Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559C1C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 13:24:30 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.10497.1645449868744651513
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 05:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YA9KYi5I;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645449867; i=@fujitsu.com;
	bh=MzBgY0ABOSpOPsPSN8iouLuHa9IPm0TZ1w95TpV+DWM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=YA9KYi5I8kA4SJr32iLuiotkwtDopFLwCm8cO/y9ofGASh50lWg+NLxSOHy8r2o8V
	 1+YobYtT1lly1sHv+o7D/ZEecpRN7AN/qM9/KqoO13CvcFER8oRt9ED9rUmaAP2Oxs
	 Z+xWxifb1deuDxyXSzjeG87sYPRUldF4Th4rzo+f9Ka3BZTQrBLnfCDVtwNtyXCKAd
	 NWB2BmT1q9GO0aB2nFAAbPnyI1iJFqdtuoKE8H7hLVESUpSrLopusX/JoBhmsmgAG/
	 irscqupR0VIwxYvYgl0bzhV8JewJ1uA2HTSwskLdHkYf3SIsoCQ/HUpR2IczPJgttL
	 ZKsY0Xll4+RmA==
Received: from [100.115.69.174] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 A0/FF-24566-A8293126; Mon, 21 Feb 2022 13:24:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8MxSbdrknC
  SwZxFChYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bpjbdZCs7xVHxsWs3awNjL3cXIxSEk8IRR
  Ytb/rywQzgUmiXPnPkE5Jxgl3h/+xdbFyMnBJqAmMf3WDVYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sIC9xIYVU8BqWARUJfqPnGECsXkFnCSu3J8OVi8hoCAx5eF7MJtTwFniUn8HmC0EVHNpw1
  52iHpBiZMzn7BAzJeQOPjiBVSvosTsy80sEHaFxKxZbUwQtprE1XObmCcwCs5C0j4LSfsCRqZ
  VjHZJRZnpGSW5iZk5uoYGBrqGhqa65oa6hsbGeolVuol6qaW6yal5JUWJQGm9xPJivdTiYr3i
  ytzknBS9vNSSTYzAcE4pdm/dwXi576feIUZJDiYlUd7aduEkIb6k/JTKjMTijPii0pzU4kOMM
  hwcShK8wv1AOcGi1PTUirTMHGBswaQlOHiURHjLm4HSvMUFibnFmekQqVOMilLivIITgRICII
  mM0jy4Nlg8X2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzBsMMoUnM68EbvoroMVMQIunZAm
  BLC5JREhJNTBlqfZPvey/LXa+X5lTnK/PrIyQjBe+K0R/uL3Y5rmxr/qo3dnEhqkah54uZHww
  8+qf2cl+nbMffuVykV5pJ8LiKPol5+WRCy9iVZRORQp+Y3l30ezneudjN6QfnE6czenHphSda
  X93Bc/THL1r0+b/5drBdS3f7WDnll3z8wsm370X3HWrWmuS0LbzzHvFEl753/9VWbDo+he2l2
  V3XC1/sN79+y73n5r1h6PWG+d6B+nOK73MPVN6t9mp+18+Sn72Cd3lkPVozuyLxyRM/SMqJYt
  X/Hy5TFvtSmSfpPnfQ2riStYlEcfFfr/6x9Z//88lofZTasIX+Led9jY4utJM87nevA8VO4/o
  yYct7xeepsRSnJFoqMVcVJwIALFdpCtiAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-545.messagelabs.com!1645449866!30604!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14789 invoked from network); 21 Feb 2022 13:24:26 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Feb 2022 13:24:26 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 09D41100456
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:26 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id EE3AA100440
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:25 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 21 Feb 2022 13:24:11 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] monit: upgrade 5.30.0 -> 5.31.0
Date: Mon, 21 Feb 2022 21:23:56 +0800
Message-ID: <1645449836-23309-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645449836-23309-1-git-send-email-wangmy@fujitsu.com>
References: <1645449836-23309-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 13:24:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95417

Changelog:
==========
-Add support for Linux OpenZFS 2.x I/O statistics.
-Add support for FreeBSD ZFS I/O statistics for FreeBSD 12.x or later.
-If Monit 5.30.0 CLI action was executed for a non-existent service name, the
 error message was not reported properly. Thanks to Lutz Mader for fix.
-If Monit reload was requested during the optional start delay interval, Monit
 still waited for the delay to pass and performed one test cycle with the old
 configuration, before the reload was performed. Monit will reload the
 configuration immediately now.
-New precompiled binaries: Added binaries for musl-based Linux distributions,
 such as Alpine Linux.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/monit/{monit_5.30.0.bb => monit_5.31.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/monit/{monit_5.30.0.bb => monit_5.31.0.bb} (94%)

diff --git a/meta-oe/recipes-support/monit/monit_5.30.0.bb b/meta-oe/recipes-support/monit/monit_5.31.0.bb
similarity index 94%
rename from meta-oe/recipes-support/monit/monit_5.30.0.bb
rename to meta-oe/recipes-support/monit/monit_5.31.0.bb
index 1496243c15..eaedf4a39a 100644
--- a/meta-oe/recipes-support/monit/monit_5.30.0.bb
+++ b/meta-oe/recipes-support/monit/monit_5.31.0.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
 	file://monitrc \
 "
 
-SRC_URI[sha256sum] = "e85649dfa8586f4fcdd34a0295c55ddd69b0eda6cfbdac47105a2673d10b1008"
+SRC_URI[sha256sum] = "eae71f28941fb663eec74c1a59b69546c659529796550bd9c0c544e9b52ac055"
 
 DEPENDS = "zlib bison-native libnsl2 flex-native openssl virtual/crypt"
 
-- 
2.25.1


