Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B47C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:12:19 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.20477.1646057538498434012
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:12:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yyqo3Mz9;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646057536; i=@fujitsu.com;
	bh=7muw8m5AvGgvocRmNFmPuy2F6YQVe6Y4IzPleb8SEfA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=yyqo3Mz9ypKjwhjdmJBDsDxlLhvsnX2WH93/Ijkax5SUZL/LIPDLO/7pLbzMSOzW6
	 W52uduVYkK2DyNrtOXzpW93F3d4/gfGYgKA/dwOQrRlMN+2DFJ1YhOhVeVb4IXFWRg
	 6f4TzIQZPz0mnz7xQjDd9Qfu3yTmnyyFFDcN2pg3BGpwcoBYpxH3p95GoaFUsts7XM
	 Z7SEDUB7jK6KktSpz1cRumMuq/d1+SsSUSNYrADqu/mFscam6bc+82fYMF5eIN78gw
	 S1d50GwSNrTXBUpetTDC4PUTg4/ToM1LSKYBjZ2NGykvxJ51U5j+3h2+g+GSs+MSY/
	 Y++DCsQkzI1Fw==
Received: from [100.115.7.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 22/3F-12292-048DC126;
 Mon, 28 Feb 2022 14:12:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8ORqOtwQyb
  JoOe4qMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjHtwkbGgh6+infr7rE1MO7g6WLk4hASeMIo
  0bttIyOEc4FJYtXZpcwQzglGiYc9b5m6GDk52ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7h
  x3EFhawkbhyfwobiM0ioCrxuvMBWC+vgJPEhW+djCC2hICCxJSH75kh4oISJ2c+YYGYIyFx8M
  ULZogaRYnZl5tZIOwKiVmz2pggbDWJq+c2MU9g5J+FpH0WkvYFjEyrGK2SijLTM0pyEzNzdA0
  NDHQNDU11DXWNDIz1Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L08lJLNjECwzKlmPH0
  DsZNfT/1DjFKcjApifJydkkmCfEl5adUZiQWZ8QXleakFh9ilOHgUJLg7TwmkyQkWJSanlqRl
  pkDjBGYtAQHj5II79PLQGne4oLE3OLMdIjUKUZdjo9/Lu5lFmLJy89LlRLnTbkGVCQAUpRRmg
  c3AhavlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8/4DmcKTmVcCt+kV0BFMQEf8DZYCOaI
  kESEl1cC0vYljw2cGlb9/uRiZWV6dKN2WKyW6Sz2yf6b8lb3fpvIwurzdknPj3jO/n5qCxu8f
  PlIRVzzHuPZ37jtl3cJGhk99Zqtss+bqMUdd2fFuUebGIsM4yfrXdussajUuxaWpp80xsIi87
  Geo47X+vq9I1UvdTT+kuTV//vKP4Z12MZ/H8v2RpPA9mqdPVrmdMc98Gr+X8dinkm7hqxPNDz
  ceXL6641TaYZMZPyZPYmLfuMLUy+7Brays1383f+VTnXIwbpPa48Uv0vztzIKW61/SYNX3Zgr
  Kvmd74ayfwObFGhyrHsxr3ZteISpitO/Xva2tO7gvb3M4IrhG+Qy/1GbXsxUTNuSFx2hWXO30
  D/2txFKckWioxVxUnAgACOihElIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-587.messagelabs.com!1646057536!13068!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25141 invoked from network); 28 Feb 2022 14:12:16 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Feb 2022 14:12:16 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id CCA5E100189
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:12:15 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BFD9C100186
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:12:15 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 28 Feb 2022 14:11:53 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] bats: upgrade 1.5.0 -> 1.6.0
Date: Mon, 28 Feb 2022 22:11:43 +0800
Message-ID: <1646057506-36235-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 14:12:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95575

Changelog:
=========
Added:
-----
new flag --code-quote-style (and $BATS_CODE_QUOTE_STYLE) to customize
quotes around code blocks in error output (#506)
an example/regression test for running background tasks without blocking the
test run (#525, #535)
bats_load_library for loading libraries from the search path
$BATS_LIB_PATH (#548)

Fixed:
-----
improved error trace for some broken cases (#279)
removed leftover debug file /tmp/latch in selftest suite
(single use latch) (#516)
fix recurring errors on CTRL+C tests with NPM on Windows in selftest suite (#516)
fixed leaking of local variables from debug trap (#520)
don't mark FD3 output from teardown_file as <failure> in junit output (#532)
fix unbound variable error with Bash pre 4.4 (#550)

Documentation:
--------------
remove links to defunct freenode IRC channel (#515)
improved grammar (#534)
fixed link to TAP spec (#537)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-test/bats/{bats_1.5.0.bb => bats_1.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/bats/{bats_1.5.0.bb => bats_1.6.0.bb} (95%)

diff --git a/meta-oe/recipes-test/bats/bats_1.5.0.bb b/meta-oe/recipes-test/bats/bats_1.6.0.bb
similarity index 95%
rename from meta-oe/recipes-test/bats/bats_1.5.0.bb
rename to meta-oe/recipes-test/bats/bats_1.6.0.bb
index ffbb37c8a1..7ea1aa8f3d 100644
--- a/meta-oe/recipes-test/bats/bats_1.5.0.bb
+++ b/meta-oe/recipes-test/bats/bats_1.6.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2970203aedf9e829edb96a137a4fe81b"
 
 SRC_URI = "git://github.com/bats-core/bats-core.git;branch=master;protocol=https"
 # v1.4.1
-SRCREV = "99d64eb017abcd6a766dd0d354e625526da69cb3"
+SRCREV = "210acf3a8ed318ddedad3137c15451739beba7d4"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


