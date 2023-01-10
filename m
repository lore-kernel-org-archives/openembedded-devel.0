Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D7EAC54EBE
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 05:40:43 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.97338.1673329240521002716
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 21:40:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VQQkc4vP;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673329238; i=@fujitsu.com;
	bh=QvTo8rrU5sKb36uGlylbYjHiM7ePQbnWPT3bbwvb0n4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=VQQkc4vPZq8ispffKaEolWZg/mQX4ptLMlom/yGi9yHetDxvcO7TKayE/fq+qe4hO
	 04GuLdHUa0fZPLQxEKocS2rAByHJ7j8MWCRGeIk7Fap+M82R+39mMxJxaBo3EGjLQP
	 Q5JJEvExPdDALnbqLt9AjTyKLdY0u5CsaKh35Atz6moa3a9u0W/sz5pquBn13uDQbn
	 5BewVM+bQycOek+1Hny/RDgIYwbEufkql8rQL1EFA0DvbIUUdV9/4f9SrUA9VzqM6A
	 Kqp6qEXF/KTNPFYTgMNf+nuqWKb64BxeVW6MkVsooIXxkvS0qcDfX4gCqmGB2fLkqc
	 WkVrucykbHCfQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORqBv6a0+
  ywa81phYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bbOckFj3grrr6cxtrAOIuni5GTQ0jgCaPE
  j3PKXYxcQPYNJonGHeuZIJy9jBLbtr9hAqliE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBJYnL/Y7B6FgFVieZTT1lAbF4BR4lr/+4xgtgSAgoSUx6+B+vlBKrvnnCVBeIKR4mvn7
  4wQtQLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyVaP/yCstUkrp7bxDyBUXAWkvZZSNoXMDK
  tYjQrTi0qSy3SNdJLKspMzyjJTczM0Uus0k3USy3VzcsvKsnQNdRLLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM3ZTi5LAdjL1L/+gdYpTkYFIS5S36tCdZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgSvz
  g+gnGBRanpqRVpmDjCOYNISHDxKIrzzrgOleYsLEnOLM9MhUqcYdTmuXrmyl1mIJS8/L1VKnH
  fST6AiAZCijNI8uBGwmL7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZjX+ivQFJ7MvBK4Ta+
  AjmACOuLH1J0gR5QkIqSkGpg2LVm73H3jtC67DW6Wl/k2Xyi48O3Bg16DPyE7ZAWWRlWcfP15
  6jPXEzk7jie/n6FgNONW6IYLWnsbH3v1rvDbtTti7fod/Bsesi3m7VTOSl9RdJ+runzdlAUlm
  k1T706Z+qfozpVY6YaL5pq3bqo5dRx4qRoZPPcHs2SW7Um1t5fUt3kzZu5cP4cx0vusJB/LBe
  l9TsKN8zyC9qzfHrP5ffFk/iXsvy03Bc6ptmHya4oPNu4VUfJaGxtlkWXMLbjb+/Q5E+MI7ju
  u9zk+sspf0z7VsOBTec4fvk9brLwM+zfNMjReKnJc2MrDU9jEyTDtr1/6hv851/terXzj8/x5
  UFMw37kLpVJhq3Y35SQqsRRnJBpqMRcVJwIAjJfpOWQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-732.messagelabs.com!1673329237!319600!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31235 invoked from network); 10 Jan 2023 05:40:37 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jan 2023 05:40:37 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 50CF2100182
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:40:37 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 4458F100043
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:40:37 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 10 Jan 2023 05:40:35 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] imapfilter: upgrade 2.7.6 -> 2.8.1
Date: Tue, 10 Jan 2023 13:40:19 +0800
Message-ID: <1673329220-5227-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673329220-5227-1-git-send-email-wangmy@fujitsu.com>
References: <1673329220-5227-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100507

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add support for non-write actions on read-only mailboxes.
- Add new parameter to write process ID (PID) to file.
- New, more advanced, robust, and flexible recovery mechanism, replaces the
  old automatic recovery functionality. Note that, the config must be updated
  to use the new mechanism, otherwise no recovery will take place on errors.
- Bug fix; potential failure when deleting mailbox while mailbox is selected.

License-Update: Copyright updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../imapfilter/{imapfilter_2.7.6.bb => imapfilter_2.8.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/imapfilter/{imapfilter_2.7.6.bb => imapfilter_2.8.1.bb} (80%)

diff --git a/meta-oe/recipes-support/imapfilter/imapfilter_2.7.6.bb b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.1.bb
similarity index 80%
rename from meta-oe/recipes-support/imapfilter/imapfilter_2.7.6.bb
rename to meta-oe/recipes-support/imapfilter/imapfilter_2.8.1.bb
index eb23816e8a..878d28f137 100644
--- a/meta-oe/recipes-support/imapfilter/imapfilter_2.7.6.bb
+++ b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.1.bb
@@ -1,9 +1,9 @@
 SUMMARY = "IMAPFilter is a mail filtering utility that processes mailboxes based on IMAP queries"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c11d4fd926d3ce7aac13b0ed1e9b3a63"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f8d2fc4954306888fd0e4b27bef83525"
 
 # v2.7.6
-SRCREV = "b39d0430f29d7c953581186955c11b461e6c824f"
+SRCREV = "e6372b88e09a4d1c573b57270de6b40846825a8b"
 SRC_URI = "git://github.com/lefcha/imapfilter;protocol=https;branch=master \
            file://ldflags.patch \
 "
-- 
2.25.1


