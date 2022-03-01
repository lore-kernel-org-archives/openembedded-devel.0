Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159A2C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 00:38:18 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.2923.1646095096290604832
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 16:38:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=p20wIY7y;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646095094; i=@fujitsu.com;
	bh=fZKS1NOR7EOBc++9yJCR/cWlVfRzztEpG8uEV87OUbc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=p20wIY7yBTx73Zzbp1YRY4bYB2uY+wsSAdoJQSLpajHAJ84fSsQ3pkEQk3ZgWcVcG
	 SaGePO5ImvEd1SnPiAg6oib2HFZZDb+kvxqBnUL/vD1VEGRTCpx5DRAk3cya97c6bb
	 ge0he/n64CFsq1xXNrJnFqN6Yfx6dfT+Yprlanzmtt0XeNlDsWpb692PnVGvEgylHE
	 uXCIL9u6SJ+w2Mn73bS/Q4pwiEIXB29kSMwHmAVJpumuNDHqayhSveQ7yLxkMWeb1L
	 I5KcDTR35jbHJi1Xkbzoyq3yGV4FQVcb5SxMXeGtePb/J6CXbX5tv+KvBmax4SBGs+
	 /orELmYk2osvg==
Received: from [100.115.68.61] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 F8/60-24566-6FA6D126; Tue, 01 Mar 2022 00:38:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRWlGSWpSXmKPExsViZ8MxSfdLlmy
  SwYQXShYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bz06VMBc94Kp4u3MfcwHibu4uRi0NI4Amj
  xOQTL9khnAtMEvPvzWSBcI4zShxYuZy1i5GTg01ATWL6rRtgtoiAvsTS2XuYQWxmARWJF7972
  EFsYQE/iflzr7KA2CxA8eaV/xm7GDk4eAWcJB5/tQEJSwgoSEx5+B6slVdAUOLkzCcsEGMkJA
  6+eMEMUaMoMftyMwuEXSExa1YbE4StJnH13CbmCYz8s5C0z0LSvoCRaRWjXVJRZnpGSW5iZo6
  uoYGBrqGhqa45kDIz00us0k3USy3VTU7NKylKBErrJZYX66UWF+sVV+Ym56To5aWWbGIEBmdK
  sduyHYz7+n7qHWKU5GBSEuWd6ymbJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCNy0DKCdYlJqeW
  pGWmQOMFJi0BAePkgjv5zigNG9xQWJucWY6ROoUoy7H309/9zILseTl56VKifMuzwQqEgApyi
  jNgxsBi9pLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR514FM4cnMK4Hb9AroCCagI/4GS4E
  cUZKIkJJqYPJxOrpyFveqqPfnVz3L/FhxqdlJ9Udv1p5fRxlMXgo8Yt2itEM93Y2R+brHt8ML
  hb6/+6AxPZ75yqJtR5566Mz6K31/ssnRpb93zQt0mVzM7/1me3Ru0RPX219eM5fpi9+Y1h/Wd
  mJv9cMzUXPOtEp+baua6LfuWKfG8sY34StnpDyXu397nrJt14VKYbWtXvHf46d8OTSvbEVVbu
  qNxugp+h3rYzqfGVvd0un41p/088i01xdtlj8WvnbF5e3SpfwHausfnLp94+5kzYUGew/1256
  dFbPi1UGzSatqA3mXr7ll9p8nbLN2jL3/gyd8ekGFJfpHmO47rou9omHSe73Iafe3GdM1/2mF
  xpi/ynzNq8RSnJFoqMVcVJwIAAulbARVAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-528.messagelabs.com!1646095092!20282!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5651 invoked from network); 1 Mar 2022 00:38:12 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Mar 2022 00:38:12 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 15DA4100446
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Mar 2022 00:38:12 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id EA8A810033B
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Mar 2022 00:38:11 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 1 Mar 2022 00:37:58 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.5.3 -> 1.5.6
Date: Tue, 1 Mar 2022 08:37:47 +0800
Message-ID: <1646095068-37552-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 00:38:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95612

Changelog:
=========
Create feature.yml
Update contribution guide
chore: add bug issue template
Added default value for auto_session_tracking
docs(readme): reordered content
fix(tests): Removed unsupported Django 1.6 from tests to avoid confusion
Group captured warnings under separate issues
build(changelogs): Use automated changelogs from Craft
fix(aiohttp): AioHttpIntegration sentry_app_handle() now ignores ConnectionResetError
meta: Remove black GH action
feat(flask): Add sentry_trace() template helper

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-sentry-sdk_1.5.3.bb => python3-sentry-sdk_1.5.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.5.3.bb => python3-sentry-sdk_1.5.6.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.3.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.6.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.3.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.6.bb
index 9822b41b1d..915fc47352 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
 RDEPENDS:${PN} += "python3-urllib3"
 
-SRC_URI[sha256sum] = "141da032f0fa4c56f9af6b361fda57360af1789576285bd1944561f9c274f9c0"
+SRC_URI[sha256sum] = "ac2a50128409d57655279817aedcb7800cace1f76b266f3dd62055d5afd6e098"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.25.1


