Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08957C3A59D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 06:56:06 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.16346.1666594563104098732
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 23:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RHOmqaEj;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666594561; i=@fujitsu.com;
	bh=eJ5EvmRqTvS10z9pnUEro0YEnt8WN9rt2WDzAbM4+5E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=RHOmqaEjJl3Ig6hLC3E7Jnh/3FIJ/S24GgMrKveOT3iOhXu8d+2Hc2sIcMrZ1qlPP
	 lsWbfNvMO6PheSsUnwO4UssIlmVmLmJsgSJ7uD6+HRbOmsqp38qbXCJtPv+luAj0to
	 NPxS9lzSwH7mV3OdZqPpN55aiXgShF60jOMO+q2G/Qf3j0Q/YH3hFo3m5K5Xx40iir
	 f7elDlxgVkC4g54DqgTGcr+t4KYi63Qhn3lkwlhs2w+wK4n1hczJ98K5pS+Y2vFbX0
	 YRF3/Ecg2cv/wVHLpZX41HY5wG6F/kAT8smf9+O6WItVXOwsGuG/aFFU1ONxNRsEFz
	 Y5zfwowQ+CQEw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRWlGSWpSXmKPExsViZ8OxWZfBPCz
  ZYNtRHYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPfXJWCSdwVu6exNTC2cnUxcnEICTxglGjY
  uZIVwrnCJPHo02bGLkZOIGcPo8Skw0wgNpuAlMSN+//ZQGwRAX2JpbP3MIPYzAIqEi9+97CD2
  MICHhIf7z1m6WLk4GARUJU4MD0KJMwr4CSx4d4CVhBbQkBBYsrD98wQcUGJkzOfsECMkZA4+O
  IFM0SNosTsy80sEHaFxKxZbUwQtprE1XObmCcw8s9C0j4LSfsCRqZVjKbFqUVlqUW6hnpJRZn
  pGSW5iZk5eolVuol6qaW65anFJbpGeonlxXqpxcV6xZW5yTkpenmpJZsYgUGYUqx6aAfjqyV/
  9A4xSnIwKYnyMoiHJQvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4K3RAsoJFqWmp1akZeYAIwImL
  cHBoyTCO8sIKM1bXJCYW5yZDpE6xajLMfNr2wFmIZa8/LxUKXFebjOgIgGQoozSPLgRsOi8xC
  grJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY188UaApPZl4J3KZXQEcwAR1xaUUQyBEliQgpqQa
  msDJXpp86C/O2mruddfHXuv9Q6s/L0u0vZz+KeGW7KC3u0aaF175pX1Pf/qY5eoMxx0ZNSf94
  WaEJh/YtPaT77nDniSyZLOfZKb/d/LXt/1p+zZ/4UUG2ehuvklbpBv1toqz9Ed+9Fd34nT+t0
  a4I4ZjBv9+HWdi0wOP9s/ZA8cAZ++v+N0+ZmfG54PGMEp3+WcvkLpgKObpsv/X0tffs6l+rvW
  bZymmsf7d889Tel8xVjufeb39Z3l3+b06SQ5DWXtPzhs/W7f0Xd3HqEcNF3GHM/xiSbXacnxz
  UbHt0b7GJGV9cj5bq6Rtce/V8mGr/FnPu/ayltbeu8aNwfvOOZM1VEpEnYyyPS82s6+lUYinO
  SDTUYi4qTgQAjrB0xEkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-571.messagelabs.com!1666594560!199491!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23515 invoked from network); 24 Oct 2022 06:56:00 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-20.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 06:56:00 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 726F873
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:56:00 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 6EC82158
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:56:00 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 07:55:57 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-huey: upgrade 2.4.3 -> 2.4.4
Date: Mon, 24 Oct 2022 14:55:41 +0800
Message-ID: <1666594541-29231-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99282

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Add is_locked(lock_name) to test whether lock is held.
 Allow raising CancelExecution within a Task, and override retries.
 Add a very basic redis-backed lock that can be acquired more than once (to provide a rudimentary semaphore).
 Add a periodic_task() wrapper for MiniHuey class.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-huey_2.4.3.bb => python3-huey_2.4.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_2.4.3.bb => python3-huey_2.4.4.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_2.4.3.bb b/meta-python/recipes-devtools/python/python3-huey_2.4.4.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-huey_2.4.3.bb
rename to meta-python/recipes-devtools/python/python3-huey_2.4.4.bb
index f8f4062a64..2f433814ee 100644
--- a/meta-python/recipes-devtools/python/python3-huey_2.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_2.4.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "4fa2f6055d581778c3bcf93fc8c9ce87aecc2a345d5ff35bd955da152c02ef37"
+SRC_URI[sha256sum] = "6a27a7862a7a982c0508ad4e548d95765e3b0d97093a51106f07540837a09c86"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \
-- 
2.25.1


