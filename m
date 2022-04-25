Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D0CDC48BD1
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:13 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.26490.1650872530163926753
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 00:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=F4yUY7UZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650872528; i=@fujitsu.com;
	bh=MVamYIqXN5ImnYdSP3mP/Jwm5nv8VRgbKmT2CWzf0zc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=F4yUY7UZhCZvIHPLXyLc2KqTWY+lG0+whMpQSzO5SErZ9CZwJ6t2VHW5j/7kwQa34
	 vx+V8ZYqHJzUrbV2mnNSNAkpByDshbJkpfX35DA/Mpg9pndKtZT5Md+RQBIfAjZ0G7
	 o6t7tm18Xk6feMyOSxFW1EeysC2x0NOj5jxNrSfEpM6pYSi2H7g9KhFf1uhoSs9SBb
	 Nulr7s6hRekN5WCfv5lqgyMT1YkOS9RlBrpevQP7d1DqzYf2TQuvnM5oFmpfwCzN4y
	 AfpDzVol0RM0EIOqS2eI49KxZGWqHr2o0gMPpRDcBN5ITUfP4O+Elb2YtPrEjvggBP
	 3VSzY942x5wqA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSfd8QFq
  SwbqjNhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a2SV/YCjYJVPy6PIO1gfE2XxcjJ4eQwBNG
  iYcfU7oYuYDsC0wS///dYYVw9jBKfF88ixGkik1ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBX4m9j+4B1XBwsAioSrSvYwMJ8wo4SVx/cRlsjISAgsSUh+/BWjkFnCWeNHewQBzhJP
  Ho/lRmiHpBiZMzn7BAjJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI+C0n
  7AkamVYzWSUWZ6RkluYmZObqGBga6hoamusYWuoYmBnqJVbqJeqmluuWpxSW6RnqJ5cV6qcXF
  esWVuck5KXp5qSWbGIFBnFKs1rOD8cSqn3qHGCU5mJREee+ZpCUJ8SXlp1RmJBZnxBeV5qQWH
  2KU4eBQkuDd7QuUEyxKTU+tSMvMAUYUTFqCg0dJhDfdGyjNW1yQmFucmQ6ROsWoKCXOywWMQy
  EBkERGaR5cGyyKLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5n3nDzSFJzOvBG76K6DFTEC
  LP9WmgiwuSURISTUwmUnbmtZdexafLbFvwSHZRwKSC21de7Irn8+XmJ13bEZ+bP6p92aZX4V2
  tRQa2U5bXxY3dbWw/Nwn1ZVLLTgczp2K2Ham+MP58CPZ2w6f+WBVcm9Jyd/kqRMvnt02b5tSu
  hDXF7ukbdJsOun/ytOW/uV6l2977Vy0MG/xvgzFiuMFxp5O57oMp7rkz10qPHet95vkrTO82k
  6f36Ep++r3kzWGaySTUguv7fs4Z97L+pj8b6Zf19wu60pZq1sexrrvnY7HRo2lXKIXyrUeXix
  Qy6hlPu795mDTiYlBJY9WiHF9fPvu7gKfYFGLGNsZudLTpkSwLsnK77q8Jop/9vl1Erq3nyg/
  nj37zbaEv1ue8SixFGckGmoxFxUnAgCp+y5yXQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-565.messagelabs.com!1650872527!70956!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24656 invoked from network); 25 Apr 2022 07:42:07 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Apr 2022 07:42:07 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 8B912100453
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:42:07 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7EA6C10034F
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:42:07 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 25 Apr 2022 08:41:54 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libtest-harness-perl: upgrade 3.42  -> 3.44
Date: Mon, 25 Apr 2022 15:41:26 +0800
Message-ID: <1650872488-31555-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650872488-31555-1-git-send-email-wangmy@fujitsu.com>
References: <1650872488-31555-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96776

Changelog:
==========
 - Fix skipping SEGV test
 - Fix failing SEGV test on Windows
 - Remove ASCII-isms to better work on EBCDIC
 - Move timer initialization
 - Fix YAMLish behaviour with empty values
 - fix eintr error handling in TAP::Parser::Multiplexer
 - Parse out signal name & core dump.
 - Let the aggregator finish gracefully after bailout
 - Make prove respect HARNESS_VERBOSE if no verbosity flags are passed

License-Update: the following removed from README
==================================================
  To use Module::Build (preferred) do:

    perl NotBuild.PL
    ./Build
    ./Build test
    ./Build install

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...est-harness-perl_3.42.bb => libtest-harness-perl_3.44.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libtest/{libtest-harness-perl_3.42.bb => libtest-harness-perl_3.44.bb} (95%)

diff --git a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.42.bb b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.44.bb
similarity index 95%
rename from meta-perl/recipes-perl/libtest/libtest-harness-perl_3.42.bb
rename to meta-perl/recipes-perl/libtest/libtest-harness-perl_3.44.bb
index b8547cb1fe..58ca70b9e1 100644
--- a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.42.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.44.bb
@@ -23,11 +23,10 @@ SECTION = "libs"
 HOMEPAGE = "http://testanything.org"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://README;beginline=29;endline=30;md5=b08db4360eec119e875dddd7cb8a5ddd"
+LIC_FILES_CHKSUM = "file://README;beginline=29;endline=30;md5=d41d8cd98f00b204e9800998ecf8427e"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Test-Harness-${PV}.tar.gz"
-SRC_URI[md5sum] = "c794906473f88d6b74194e2d56f16bd6"
-SRC_URI[sha256sum] = "0fd90d4efea82d6e262e6933759e85d27cbcfa4091b14bf4042ae20bab528e53"
+SRC_URI[sha256sum] = "7eb591ea6b499ece6745ff3e80e60cee669f0037f9ccbc4e4511425f593e5297"
 
 UPSTREAM_CHECK_REGEX = "Test\-Harness\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.25.1


