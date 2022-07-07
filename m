Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A51C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 07:01:42 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.2801.1657177300708582080
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 00:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GL7BOZL8;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657177298; i=@fujitsu.com;
	bh=Ek1Fm/+zYq0MEKbXe/mC/DuiNyyi33drXYZSHy978zo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=GL7BOZL8mto0xYr6qcWcJrq+HK44qfmEScpLI5uju+m/9tRpIJ/zVPv9fSHwIruP2
	 VRK0GruGKr6F3HgajDSPpnN35PWM2Zt2Z6WQYkYvxL8bDw14F4bioWQzjcn/7UxeFW
	 sw6U+bYMIa93dy2UpTnfH5k7H9Y1dZE+Mo0HAly/ceZvDWmvbAh6n90lyk1aLueow6
	 s5ng+VonqTWT/3u7ofZAJ2W284gt/7geWf1LQDflwQiWrqDcru2+VfYi9Y1dzxYhIE
	 zOXJLTGzVaGxpblRSunXsp5IuEBJLbB0DEHh5R1onEsVoXxArQO3BEkmHAReHjEUk5
	 osj2ft58jveCQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRWlGSWpSXmKPExsViZ8ORpLur5Vi
  SwduXWhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bTXUdYC25zVCz7d4ytgfErexcjF4eQwENG
  icmNzawQzhUmiR+XvzJCOLsZJX6cmc7SxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAvcS7GavAaliA4o83bGAEsXkFnCR6ln8BmyMhoCAx5eF7sF5OAWeJBYeugtUIAdXMPb
  iKBaJeUOLkzCcsEPMlJA6+eMEM0asoMftyM9ScCokZM7axQdhqElfPbWKewCg4C0n7LCTtCxi
  ZVjHaJhVlpmeU5CZm5ugaGhjoGhqaAmljIG2hl1ilm6iXWqqbl19UkqFrqJdYXqyXWlysV1yZ
  m5yTopeXWrKJERjMKcXpZTsYr+77pXeIUZKDSUmU16v+WJIQX1J+SmVGYnFGfFFpTmrxIUYZD
  g4lCV7+JqCcYFFqempFWmYOMLJg0hIcPEoivIzNQGne4oLE3OLMdIjUKUZjjqtXruxl5ti0r+
  sAsxBLXn5eqpQ47z2QUgGQ0ozSPLhBsIi/xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYtxN
  kCk9mXgncvldApzABnbIs/wjIKSWJCCmpBqY6oxPey0PcLp+bb8PbEXhIbJmvybZfi1xM7YqO
  7XT3b5jm0TX3Ue6h1VXn+3mObnjB+r9yUmg8u9vuh3tkozc5tP4RjNVlenuhx+Lj5L1Xr/QXf
  9Fa5Jo60WHeEbaLJ+budm+Ojzy56JfXPqs9J4pdbv82UAl5zfF+6XluLSbHmjlXEwU5e4QPvV
  z10lVF7EXck0i5M/ImTXWHxS6UGjY2St7jOhFsmaZ5RnmlfVVemevJQ2/Lo5oPiBksv2jCXmz
  fdstpofrJt+ujnt21M4kOmREYebdZcMbVNE1m7pbusuKahOfWlod3ivHOlPxoqy2tPC3t16pQ
  ib1LksO3ywYK+5W3NUh41OYeZVHsUWIpzkg01GIuKk4EAOegT+pzAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-732.messagelabs.com!1657177274!61094!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32479 invoked from network); 7 Jul 2022 07:01:14 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jul 2022 07:01:14 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 1E0C91B3
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 08:01:14 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 121771B1
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 08:01:14 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Jul 2022 08:01:12 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] bats: upgrade 1.6.1 -> 1.7.0
Date: Thu, 7 Jul 2022 15:00:44 +0800
Message-ID: <1657177246-28404-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657177246-28404-1-git-send-email-wangmy@fujitsu.com>
References: <1657177246-28404-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 07:01:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97746

Changelog:https://github.com/bats-core/bats-core/releases/tag/v1.7.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-test/bats/{bats_1.6.1.bb => bats_1.7.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-test/bats/{bats_1.6.1.bb => bats_1.7.0.bb} (87%)

diff --git a/meta-oe/recipes-test/bats/bats_1.6.1.bb b/meta-oe/recipes-test/bats/bats_1.7.0.bb
similarity index 87%
rename from meta-oe/recipes-test/bats/bats_1.6.1.bb
rename to meta-oe/recipes-test/bats/bats_1.7.0.bb
index 7d72a5198..81235e29b 100644
--- a/meta-oe/recipes-test/bats/bats_1.6.1.bb
+++ b/meta-oe/recipes-test/bats/bats_1.7.0.bb
@@ -7,11 +7,11 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2970203aedf9e829edb96a137a4fe81b"
 
 SRC_URI = "\
-  git://github.com/bats-core/bats-core.git;branch=version/1.6.x;protocol=https \
+  git://github.com/bats-core/bats-core.git;branch=master;protocol=https \
   "
 
-# v1.6.1
-SRCREV = "1977254c2a7faa2e0af17355856f91dc471d1daa"
+# v1.7.0
+SRCREV = "410dd229a5ed005c68167cc90ed0712ad2a1c909"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


