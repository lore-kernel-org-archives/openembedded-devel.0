Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D70EC7EE2D
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:12:21 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.85573.1677485537847016414
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:12:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FMG/Dy6q;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485536; i=@fujitsu.com;
	bh=Md31PKPsBAUeSMfeBiP7GFlzJW4qXNrd++F68Yzc6g8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=FMG/Dy6qs6F5nxgZNNJ/lLSl2TgvMOlVcmaP0b7gJ/ONNNRoowPifRyQNT1jEBSnh
	 XYkE3oiMRujFgzBudRygzuXyUDa9PgYEMNDyE2tqkTOykrK5tuGEcHxn6vYH5drKqo
	 gZmoyzbTPTnfllXBOGzpmko1btjDx6QVvEOoADMiNTgTFW+UaNVIUpiXNEv7E1qrEQ
	 e2Z7qYEiBgBymLQAnUt1SM1FE+rV8dctMyEbSpe7KQD3+by8GwQYEqczvnszAmvE1M
	 ONAoLl8LXNnX+VypTmnt0m9KUQ8DcRjXMjdzVFTkRTsItIdKBs2CX4avg1J/YLWNC8
	 YsxYWQ+IkoqDg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSfd+6p9
  kg3vHFC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oye468ZC5r4K76u/c7ewLiXt4uRi0NI4Amj
  xKnp55kgnBtMEk+XXGSBcPYySixtucvYxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrBAgMTD5x1gcRYBVYmO1WtZQWxeASeJpctamUBsCQEFiSkP3wPVcHBwCjhLbHoPNl4IqO
  Ru+0aockGJkzOfsECMl5A4+OIFM0SrosTsy80sEHalROuHX1C2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWM5sWpRWWpRbqGlnpJRZnpGSW5iZk5eolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIHhm1Kc9nUH4+y+v3qHGCU5mJREeRc5/UkW4kvKT6nMSCzOiC8qzUktPsQow8GhJ
  MF7MAkoJ1iUmp5akZaZA4wlmLQEB4+SCC+zEVCat7ggMbc4Mx0idYpRUUqcly8RKCEAksgozY
  Nrg8XvJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvFEJQFN4MvNK4Ka/AlrMBLR4+8MfIIt
  LEhFSUg1MjS+3+5Uw7WdUWHHU8RP72WfP1B0Xz5XLXBX69oXQkW13Xpn9mP79fwnj3vKMNMPW
  T4UzT8oXKEkcn6Vjnb7V9t2+ADMl7mvrhbh+XeRfvGOl5yeO3+WL7rLVzJx/8GP5yrmVeq68h
  1gmdXU7BLoph2w8nuLebzvl87X18kd5U9eZf0vcufTZxAee1zju2XKmlE5+Eff51GfTX66zrN
  2eWXH/T1+zhXEVd0pR8aaus8yf07Z+PyrDuXeK/8/HZ9S/HTrhLyZz9GeM9cnc5Cm77weY7Th
  YG/Fkq+Snq17nY81rVic7yrwK3qvoZbr90a3Ufyr3HHbdbXC8t3aukk91pf2sN6F+5X1THwad
  Dfp9q1OJpTgj0VCLuag4EQCcp6akWgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-745.messagelabs.com!1677485535!129741!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27515 invoked from network); 27 Feb 2023 08:12:15 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:12:15 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E6B531000D5
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:12:14 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id DB0301000D7
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:12:14 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:12:13 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pytest-xdist: upgrade 3.1.0 -> 3.2.0
Date: Mon, 27 Feb 2023 16:12:00 +0800
Message-ID: <1677485523-11699-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677485523-11699-1-git-send-email-wangmy@fujitsu.com>
References: <1677485523-11699-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:12:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101284

From: Wang Mingyu <wangmy@fujitsu.com>

Improved Documentation
----------------------
- #863: Document limitations for debugging due to standard I/O of workers not
  being forwarded. Also, mention remote debugging as a possible workaround.

Features
----------
- #855: Users can now configure load scheduling precision using --maxschedchunk
  command line option.
- #858: New worksteal scheduler, based on the idea of work stealing. It's
  similar to load scheduler, but it should handle tests with significantly
  differing duration better, and, at the same time, it should provide similar
  or better reuse of fixtures.

Trivial Changes
---------------
- #870: Make the tests pass even when $PYTEST_XDIST_AUTO_NUM_WORKERS is set.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-pytest-xdist_3.1.0.bb => python3-pytest-xdist_3.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-xdist_3.1.0.bb => python3-pytest-xdist_3.2.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.1.0.bb b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.2.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pytest-xdist_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-xdist_3.2.0.bb
index 1651ec34b..a3b28835c 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pytest-xdist"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=772fcdaca14b378878d05c7d857e6c3e"
 
-SRC_URI[sha256sum] = "40fdb8f3544921c5dfcd486ac080ce22870e71d82ced6d2e78fa97c2addd480c"
+SRC_URI[sha256sum] = "fa10f95a2564cd91652f2d132725183c3b590d9fdcdec09d3677386ecf4c1ce9"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


