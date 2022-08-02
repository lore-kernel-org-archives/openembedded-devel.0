Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FFE8C25B06
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:41:32 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.6143.1659447683799756882
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XbBpiOzV;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659447682; i=@fujitsu.com;
	bh=2p1wnt72w2eKl14eMpi1ntQR9E5JLOAwWzWwdcAVlzk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=XbBpiOzV4NRdiHllof5tXQ/jCdQWMiGW+xXNgubNdOI2piQrFTvJJARcw+WAP0vng
	 i7MsV0SlMnaeFfJqWjWB9rNWFsradP0huF+eF0QwO7pwQ/2E7967nfVtihZcLmquiD
	 qrE5le57FtYVsainTfLad4Py4cIdE8FYh+hK+z1eBdky+YxbLmRORxOENjG1JSG8mE
	 PTW7rehfHXxm0FGV2igty0zph/zPRTBLU9NfCk2MqAqkR3nYEH8aFY9fEBOFPT1Rh3
	 NkSYQsaTFsZys97XqjD/klV1q6YIvkm8yiWFM7gIE8L7eZO66O8xhNIH2IAAxYFMpz
	 0u/F3gHR1QVmA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSbdR82W
  Swb075hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ayh49YC3oEKz60nmNpYJzA38XIxSEk8IRR
  Yvb5i+wQznUmia1tj5ggnN2MEo1vLgFlODnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48bsHr
  EZYwFZiZf8+sBoWoPjVdWvBbF4BJ4ndc7YxgdgSAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy+YIW
  oUJWZfbmaBsCskZszYxgZhq0lcPbeJeQIj/ywk7bOQtC9gZFrFaJVUlJmeUZKbmJmja2hgoGt
  oaKprbK5raKmXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuck6KXl1qyiREYlinFqsI7GDtW
  /tQ7xCjJwaQkyiun+DJJiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvLVWgnGBRanpqRVpmDjBGY
  NISHDxKIrxnNYDSvMUFibnFmekQqVOMlhxTZ//bz8yxHEzO/Np2gFmIJS8/L1VKnHc5SIMASE
  NGaR7cOFgcX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzMsHMoUnM68EbusroIOYgA7S4Xo
  BclBJIkJKqoFJLv6Q57SnPFrsDJGlNxvdqqwfsq74MmkLl/1D602sKvaJ+86kBv57Ez6jXPBn
  2jU7xakbU+ak2GXGKL/oMpt9mPu6yon+7+cnHw3hDipdsEqh3KXhYsQehRfW99rXTJOKFDmtn
  qeU7me/5lm7/pprTypb/rrqrUw52fN2r+1DFv+m9kteauEi6ZvrJiQlWDnM2qygEK2fd6r6rG
  Sr2L91Gc94q8LPn/ph+N13wY2TCX1muZJmskocLJ+/73y6UvuMaa/blk0lM9sdZ7YtXWa0wz3
  RliVnLcsqWa7YK+53I7f75KYckJ6R3r791yHtLpYcxm7fM352gXyPbBivnz5zmj/u87G6Z5Zb
  S3Z7eCmxFGckGmoxFxUnAgDUOKw7XgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-565.messagelabs.com!1659447681!314073!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23515 invoked from network); 2 Aug 2022 13:41:21 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Aug 2022 13:41:21 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9BF8D1000EE
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:41:21 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8F0ED100077
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:41:21 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 2 Aug 2022 14:41:19 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] icewm: upgrade 2.9.7 -> 2.9.8
Date: Tue, 2 Aug 2022 21:41:05 +0800
Message-ID: <1659447669-24388-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 13:41:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98088

Changelog:
=========
 Omit trailing dot in CPU temperature and add centigrade symbol for issue bbidulock/icewm#652.
 If there is no WM active, then a request to restart will start icewm.
 Don't create the ~/.icewm directory, unless required to save a file.
 When showing the desktop, also minimize a focused fullscreen window.
 Add support for COMPOUND_TEXT title names in WM_NAME strings for issue bbidulock/icewm#26.
 Limit window dimensions to 32732 pixels in the icesh command.
 Improve the truncation of titles for TaskBarTaskGrouping in issue bbidulock/icewm#658.
 Let TaskBarShowAllWindows influence TaskBarTaskGrouping for issue bbidulock/icewm#560.
 Update the TaskBarTaskGrouping menu, when tasks are added or removed.
 Restore the 2.5.0 container handling of button presses for issue bbidulock/icewm#649.
 Make the TaskBarGraphHeight preference themable for issue bbidulock/icewm#659.
 Clarify which preferences are themable in icewm-preferences(5).
 Update the translations for Macedonian and Swedish.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/icewm/{icewm_2.9.7.bb => icewm_2.9.8.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/icewm/{icewm_2.9.7.bb => icewm_2.9.8.bb} (94%)

diff --git a/meta-oe/recipes-extended/icewm/icewm_2.9.7.bb b/meta-oe/recipes-extended/icewm/icewm_2.9.8.bb
similarity index 94%
rename from meta-oe/recipes-extended/icewm/icewm_2.9.7.bb
rename to meta-oe/recipes-extended/icewm/icewm_2.9.8.bb
index 00377bc1b8..2c7ede7725 100644
--- a/meta-oe/recipes-extended/icewm/icewm_2.9.7.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_2.9.8.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
 SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.lz \
            file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
            "
-SRC_URI[sha256sum] = "c25f78e3f3ad49fbebc715691689d0ad1fda46b2e2537ad69e3332a54b81c72a"
+SRC_URI[sha256sum] = "8d5d0f78a49c952f7f185d0f6713c6fabba597dcb713b1ac92e0e5795db29a25"
 
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 
-- 
2.25.1


