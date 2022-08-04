Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7993C19F2B
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 08:19:33 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web11.2404.1659601163324950896
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Aug 2022 01:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=W58EMyLi;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659601161; i=@fujitsu.com;
	bh=0VUNnxlNmwG7Dei0qZg+W0tkgVIukXEIIITRQt+TcBk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=W58EMyLiwIUL2mPPAmf3K7En10gSYXAxbIK92e/fg6r4g8rKWCveihGDFE/eZe0ef
	 qtcoAwv56PLk1e3dXTq8r6B+EtUlkFlxe/qvdlbPc4V22xS5mQtivA2+J/LDmeITRa
	 VEmDiyZSfv7rKzdr/8hWL5BmbY0iuOhyux7oqCB/9vnKY+AOkuGwTm8Lk2g8FKTBK6
	 2tnc8xNePFPzOCtT8q4J3JZhtkShtyeica3e38P1NFjld+pVXPtbaYmoE/zBJ9ohZq
	 uq7FOFEMpLC7FLwrJG0W6AOa3UKbv8ERuEBk1yvAsQkJvmltmWnEFDE1JxnpIbyI5P
	 1FhrXeYUOx9Pw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8OxWZej8XW
  SQccqM4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPr7P9MBSv5KqY8XMnYwHiKp4uRi0NI4CGj
  xL3by5ggnMtMEjd7j7NDOLsZJRZ+u87axcjJwSagJjH91g0wW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICdxIT7l8DiLEDxNafnM4HYvAKOEqf6V7OA2BICChJTHr5nhogLSpyc+YQFYo6ExMEXL5
  ghahQlZl9uhqqvkJgxYxsbhK0mcfXcJuYJjPyzkLTPQtK+gJFpFaNVUlFmekZJbmJmjq6hgYG
  uoaGprqmukampXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6KXl5qySZGYFimFLP+38HY
  3fdT7xCjJAeTkihvb+brJCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvHfqgHKCRanpqRVpmTnAG
  IFJS3DwKInwTq0BSvMWFyTmFmemQ6ROMepyzPzadoBZiCUvPy9VSpw3FaRIAKQoozQPbgQsXi
  8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZtrAeawpOZVwK36RXQEUxAR+hwvQA5oiQRISX
  VwCSyZONUy4vni5/emvgoJ0slw+GYWJzWG9Ps4+2PV76dmr55mcM3r+pzy3a+0/ng1P9XiclT
  9GdJVIXdg2pZjvLK6qn+kz5WpfMtlZve6Hf9++OZFntfzvOdyx97Ktn+vFrEnrSSK/5tWqFb/
  8zKPmxaojX5HJPxRYdygazjDYcu+b6PiHqc7li/zKpdLP7P/vLY7rQpTRf0EoPn+/bXnF4lGp
  vHyyYz8fuspEl2Nv4TeyMyDLsXCqmr3tj8ff6MOcm1aduKH7W9FuZ+POPkqRt5X23eLwt7/28
  hf7PUilmvROYeXPRF4/F5Wae+BqmDESU5+jbr/toFnZd3f+s3/fSl9/5hSgUaf/fGec5sX6XE
  UpyRaKjFXFScCAB0BEypUgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-585.messagelabs.com!1659601160!128787!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23222 invoked from network); 4 Aug 2022 08:19:20 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-10.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Aug 2022 08:19:20 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 7F1B3152
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 09:19:20 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 727B075
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 09:19:20 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 4 Aug 2022 09:19:18 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xrdp: upgrade 0.9.18 -> 0.9.19
Date: Thu, 4 Aug 2022 16:19:06 +0800
Message-ID: <1659601146-7172-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Aug 2022 08:19:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98130

Changelog:
==========
New features
---------------
-Both inbound and outbound clipboards can now be restricted for text, files or images

Bug fixes
-----------
-CVE-2022-23613: Privilege escalation on xrdp-sesman (This fix is also in the out-of-band v0.9.18.1 release)
-The versions of imlib2 used on RHEL 7 and 8 are now detected correctly (#2118)
-Some situations where zombie processes could exist have been resolved (#2146, #2151, #2168)
-Some null-pointer exceptions which can happen in the logging module have been addressed (#2149)
-Some minor logging errors have been corrected (#2152)
-The signal handling in sesman has been reworked to prevent race conditions
 when a child exits. This has also made it possible to reliably reload the sesman configuration with SIGHUP (#1729, #2168)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/xrdp/{xrdp_0.9.18.bb => xrdp_0.9.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/xrdp/{xrdp_0.9.18.bb => xrdp_0.9.19.bb} (97%)

diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.19.bb
similarity index 97%
rename from meta-oe/recipes-support/xrdp/xrdp_0.9.18.bb
rename to meta-oe/recipes-support/xrdp/xrdp_0.9.19.bb
index 7ec6ae15f6..207315efe7 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.19.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch \
            "
 
-SRC_URI[sha256sum] = "c5eea0af055fac90c632e44fb667f1a25c55de2e34b37127e4cb0aabaef90a0f"
+SRC_URI[sha256sum] = "94017d30e475c6d7a24f651e16791551862ae46f82d8de62385e63393f5f93d0"
 
 CFLAGS += " -Wno-deprecated-declarations"
 
-- 
2.25.1


