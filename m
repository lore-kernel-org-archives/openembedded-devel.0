Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D78C2C6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:21:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.3020.1663064478631625483
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gvVfvMG8;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064477; i=@fujitsu.com;
	bh=uPXmTSyfMwBO9BTGn8qI2DXuBn13ZSMSv/XbqU8oOcY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gvVfvMG8/QnnjVYg/1GjhyNz3+sh8WRm7YJTfN9FO4N0Es79hVonpf4wFsiR6/z9J
	 CIny1Iu9kDbiihZ3jOJHfbo+Z4RKJobzn6JFlNOXkVH3v9pHMPfJRKpPg3GNy4a+FB
	 g+0q1y2qHNl3CUx7t0ynz1bvhBvL07/0JHnknuE79R16kxGH0wdBkUS/DKPGjIyGok
	 h3Da7RH6+tT7Ubt2etGeFJuZ/Igy4nWwM/60BCEPuhnBGzpBozL9B8mpzOtybjvN0J
	 H0UwMXYscQgJMg3ByMGmk7fMUT/Ve9TdzCxbq06xTZRxSEpcCtwOuBMZY9VsPynBne
	 PoQ79Rks7xODg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8ORpDsnUiH
  Z4PMEDYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPjmxcsBV+4Ko5dWsLSwNjE1cXIxSEk8JBR
  ou/hcZYuRk4g5wqTxPwdHhCJPYwSq/b/ZQJJsAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSwQItFy7A6YzSKgKvFq3kcwm1fAUeLW3DVgvRICChJTHr4H6mXn4BRwktjG18XIAbTKUe
  LD21iIYkGJkzOfsEAMl5A4+OIFM0SjosTsy80sEHaFROP0Q0wQtprE1XObmCcwCs5C0j4LSfs
  CRqZVjNZJRZnpGSW5iZk5uoYGBrqGhqa6xka6hkZmeolVuol6qaW65anFJbpGeonlxXqpxcV6
  xZW5yTkpenmpJZsYgQGcUqxQt4Px2sqfeocYJTmYlER5I70UkoX4kvJTKjMSizPii0pzUosPM
  cpwcChJ8MaHAOUEi1LTUyvSMnOA0QSTluDgURLh5QkGSvMWFyTmFmemQ6ROMepyzPzadoBZiC
  UvPy9VSpx3pjdQkQBIUUZpHtwIWGRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMKxEGNIU
  nM68EbtMroCOYgI4wspYHOaIkESEl1cDkFX/ktnTxfu7Xvc9v3zUIy3+wIOHvJzO/XVena/F6
  PNn0U2Chde+PWuGe+8365w7nHthWO2NtS+3Bmznzb7/naeL6xmhp6PFBY4Hwy9D/2c6X3R+dL
  nlSGfX2Wrf29Uwvxe++GqLWTSZXVmVsex3EuV2p70TV7ak/WdYc57+9zbr/0zKe0vOfGwWrXY
  /+PRp7pm3vKe3mulecvNPmLHbYuFgtdXHQr9O3UiZ6r2/sWHrUrcjsi+7Flp+n3NT4Ts16F/T
  jQY39DvmS9+13VH/pvLs+xyHQvtldvGeGvGn4nK2aWfFWEi8ibgXcVV7z6OyrM2zBMQI/m+s+
  /5apeOvozqPG/y4wweiqGXMNt1ShEktxRqKhFnNRcSIAXKBQgWcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-565.messagelabs.com!1663064476!354695!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24003 invoked from network); 13 Sep 2022 10:21:16 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:21:16 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 5CA041B2
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:21:16 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 51E431AC
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:21:16 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:21:14 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-websocket-client: upgrade 1.4.0 ->
 1.4.1
Date: Tue, 13 Sep 2022 18:20:55 +0800
Message-ID: <1663064456-3336-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1663064456-3336-1-git-send-email-wangmy@fujitsu.com>
References: <1663064456-3336-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:21:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98784

Changelog:
=========
  - Fix stack growth bug when `run_forever` reconnects (#854)
  - Add doctest CI for sphinx docs code examples (d150099)
  - General docs improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...socket-client_1.4.0.bb => python3-websocket-client_1.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_1.4.0.bb => python3-websocket-client_1.4.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_1.4.0.bb b/meta-python/recipes-devtools/python/python3-websocket-client_1.4.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-websocket-client_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_1.4.1.bb
index ad43fab24d..39c5921c93 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.4.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/websocket-client/websocket-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b969e9612325987c823fc0737063ebc8"
 
-SRC_URI[sha256sum] = "79d730c9776f4f112f33b10b78c8d209f23b5806d9a783e296b3813fc5add2f1"
+SRC_URI[sha256sum] = "f9611eb65c8241a67fb373bef040b3cf8ad377a9f6546a12b620b6511e8ea9ef"
 
 inherit pypi setuptools3
 
-- 
2.25.1


