Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557BBC433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 08:09:03 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.25043.1653293341243752527
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 01:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XZGMgXpw;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653293339; i=@fujitsu.com;
	bh=A//v6C2YtlRacfvYzB4kHMlD8xNF2Z0JwaP7r38Xv+k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XZGMgXpwY8MgK3QTiPePYbSphn1dzWIIT2KWCflwSug2Ve2OA4XllLwP6mPuBDlwK
	 aKGQDbxjEGq1dRqLdyTOP1bUNLy/5f38aaWWKvVqRfMRGKzed8YPls0HjCWidQRB4t
	 09Yw9/3X/mq0Sq+gSB/QncmYkdyXkwCIwCVHqF9geXyIWPC64HsA18eS6C7OfUfd0x
	 RTrys+uLEwy2l1emsXaHk/6afjV1tVnGtFtQQoAPGbIoiwavocQ87egmBOeE38QrSN
	 +6g3G6LQGjj9arHVtoeDHw++16HFkZSVCspZnI7uFM+c+vRhasqZ6uJMwf0XH2HA0Y
	 PEcTh8QnqQCQg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8OxWVfasTv
  J4JOvxcXDS5kdGD3ObVzBGMAYxZqZl5RfkcCacfXyYcaCJxwVKw8cZm9g7OboYuTiEBJ4yChx
  +cwLdgjnLJNE6+2DUM4eRommrR9Zuhg5OdgE1CSm37rBCmKLCOhLLJ29hxnEZhZQkXjxu4cdx
  BYWsJNYtGAbWA2LgKrEphfLwWp4BZwkLl7ZywZiSwgoSEx5+B4szingLLH69GmwuBBQTc+vX6
  wQ9YISJ2c+YYGYLyFx8MULZoheRYnZl5tZIOwKiRkztkHNVJO4em4T8wRGwVlI2mchaV/AyLS
  K0TqpKDM9oyQ3MTNH19DAQNfQ0FTX2FTX0MRSL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3
  OSdFLy+1ZBMjMIxTipWn7mA8veqn3iFGSQ4mJVHeo3bdSUJ8SfkplRmJxRnxRaU5qcWHGGU4O
  JQkePnsgXKCRanpqRVpmTnAmIJJS3DwKInwMjoApXmLCxJzizPTIVKnGBWlxHkdQRICIImM0j
  y4NlgcX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzFsPMoUnM68EbvoroMVMQIt7JTpBFpc
  kIqSkGph0e987cIR/DC9KP1/mJvu/SWFJRt+3BPkZIXmRAs3L3pslTWQrsnu20avlqcmJXRH9
  T2tv21hJ3JIN6nq7qe/qhhmlG9geWWyoN3+wx2vlzFsCrP3190qv6HIGMbdYi+zT5T6hdfjD/
  TNCBbErg6+s+G5dcMEh1JLhodLG+U+VCngWvbPx83B8/v/p8dZIj84SdvWVhW/WnazamLFBb9
  77Z07qqe8EH9ffu5nmznVnl8GnQ9yzNk3jNBVSKF+6eOvdhyV9U8rb2zzdF0U+ZV+qVdnBVXx
  pa21VpMe+k++uPv+uaO1i8iu0u/nd8WlHdztp7Epfbq9ssyXd86NtQcd0jr1/D5o7L9lnNXlT
  sK4SS3FGoqEWc1FxIgAr/XZVXgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-571.messagelabs.com!1653293338!141466!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16830 invoked from network); 23 May 2022 08:08:59 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-13.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 May 2022 08:08:59 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id A2375811
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 09:08:58 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 93BD780D
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 09:08:58 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 23 May 2022 09:08:56 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libbpf: upgrade 0.7.0 -> 0.8.0
Date: Mon, 23 May 2022 16:08:42 +0800
Message-ID: <1653293322-31459-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653293322-31459-1-git-send-email-wangmy@fujitsu.com>
References: <1653293322-31459-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 May 2022 08:09:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97224

Changelog:
https://github.com/libbpf/libbpf/releases/tag/v0.8.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-kernel/libbpf/{libbpf_0.7.0.bb => libbpf_0.8.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/libbpf/{libbpf_0.7.0.bb => libbpf_0.8.0.bb} (92%)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_0.7.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_0.8.0.bb
similarity index 92%
rename from meta-oe/recipes-kernel/libbpf/libbpf_0.7.0.bb
rename to meta-oe/recipes-kernel/libbpf/libbpf_0.8.0.bb
index 461e6b05e..76fd86214 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_0.7.0.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_0.8.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
 DEPENDS = "zlib elfutils"
 
 SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=master"
-SRCREV = "2cd2d03f63242c048a896179398c68d2dbefe3d6"
+SRCREV = "86eb09863c1c0177e99c2c703092042d3cdba910"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|aarch64|riscv64|powerpc64).*-linux"
-- 
2.25.1


