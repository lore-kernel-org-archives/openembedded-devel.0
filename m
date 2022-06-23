Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90BBC43334
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 07:15:16 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.4587.1655968506792109647
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 00:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NyZjvzLq;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655968505; i=@fujitsu.com;
	bh=TQzgi92J2SfG3yL7K6fPxTc28PfvyKD8ogGy9aG11D8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NyZjvzLq0V95IHLRoBFH8xrjisagvAP+0VAfy0n62CQJllhkGmZic5FUU06SFad1V
	 Ed8+lXF5c/DEKi8DTajX8X8gXZsdNNJ4YeoQ174712FZoNAwpfG6fS7MPBmT3t5fd+
	 jss4l4ep8vMX/aza4FYItzyX+zp/fYv8OTE50iRCpppkkrym3/IIZAKMxB1js8iBos
	 UN1kk3SalF6abHWqhc9i7X97efm6qqMFix7vmT0R9gweJjqnI2HhaEVtvLm3Zv3idj
	 qYL8DCFzjY3hpvDSqhqzg3XY/DIkXh+fVHS1NqzNNOnh9DV3MLFfC8suKMOBAYZrjD
	 1BrekRYusKmYA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8ORpPtDaEu
  SwYflRhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8abHcUFt7krlq7dwtrAeISri5GLQ0jgIaPE
  sZ1dLBDOLSaJ0/tWMkE4exglJqzby9bFyMnBJqAmMf3WDVYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICPxI7VHWA2i4CqxOT1rUwgNq+Ao8TUHX/B5kgIKEhMefgerJdTwEmi5eNRoBoOoGWOEq
  /fqUOUC0qcnPmEBWK8hMTBFy+YIVoVJWZfbmaBsCskZszYBjVSTeLquU3MExgFZyFpn4WkfQE
  j0ypGq6SizPSMktzEzBxdQwMDXUNDU11jI11DE73EKt1EvdRS3fLU4hJdI73E8mK91OJiveLK
  3OScFL281JJNjMAQTilW4NvB2Lzqp94hRkkOJiVR3q0CW5KE+JLyUyozEosz4otKc1KLDzHKc
  HAoSfBe4gfKCRalpqdWpGXmAOMJJi3BwaMkwjsHJM1bXJCYW5yZDpE6xajLMfNr2wFmIZa8/L
  xUKXHeBjagIgGQoozSPLgRsNi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY9yPIlTyZeSV
  wm14BHcEEdMST5RtAjihJREhJNTDNqzO7/tG+8dE58xwW2ZZciz9f32p5xl47fWWKuH/uqdqv
  2dNiOa+ofLnx+ecvdfF3Ubmf9iQ1zGdZ18AVOXVT5rcTPV35zOJ2Ww69lb12lP2K6dkl218fV
  56R+fqsth2j/a1bKzbXXb8ebCs5N1nnkw/f+bmct2d/a3c8sqP2+a86mc2lM+a5W806kz5dvq
  3xwun3Ezy3txgZxze0qCWsFLGpkupcr9rO8IlrY7Ws/lHuWQxP1PgZWycZyAjs+pt457SXQIb
  rof6ODaV5DDv3zku/81jNfZa24u0kT4aZ8y68ESoz/f5L69fZP8YHA+8IHBazOxT0f3v2UiOb
  hQf7Ti3XWvxoxzn7bUeYls5ZpsRSnJFoqMVcVJwIAJ6buC5oAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-571.messagelabs.com!1655968504!42566!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24631 invoked from network); 23 Jun 2022 07:15:04 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-19.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Jun 2022 07:15:04 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 760021AF
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:15:04 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 6AE171AD
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:15:04 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 23 Jun 2022 08:15:03 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-watchdog: upgrade 2.1.8 -> 2.1.9
Date: Thu, 23 Jun 2022 15:14:46 +0800
Message-ID: <1655968487-3652-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655968487-3652-1-git-send-email-wangmy@fujitsu.com>
References: <1655968487-3652-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jun 2022 07:15:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97587

Changelog:
=========
    [fsevents] Fix flakey test to assert that there are no errors when stopping the emitter.
    [inotify] Suppress occasional OSError: [Errno 9] Bad file descriptor at shutdown. #805
    [watchmedo] Make auto-restart restart the sub-process if it terminates. #896
    [watchmedo] Avoid zombie sub-processes when running shell-command without --wait. #405

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-watchdog_2.1.8.bb => python3-watchdog_2.1.9.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_2.1.8.bb => python3-watchdog_2.1.9.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_2.1.8.bb b/meta-python/recipes-devtools/python/python3-watchdog_2.1.9.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-watchdog_2.1.8.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_2.1.9.bb
index 70af95157..8c7c6dd47 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_2.1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_2.1.9.bb
@@ -4,7 +4,7 @@ DEPENDS = "${PYTHON_PN}-argh"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "6d03149126864abd32715d4e9267d2754cede25a69052901399356ad3bc5ecff"
+SRC_URI[sha256sum] = "43ce20ebb36a51f21fa376f76d1d4692452b2527ccd601950d69ed36b9e21609"
 
 inherit pypi setuptools3
 
-- 
2.25.1


