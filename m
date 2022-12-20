Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB0ADC3DA6E
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:15:12 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.48597.1671538502893700715
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:15:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MyxwsOYX;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671538501; i=@fujitsu.com;
	bh=86yVL1Yz7Fw+MyBzLIqPYR5+jDTsBdC7bCu4KKTJJAQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=MyxwsOYXzKf+Obh2GSGKsXN6eDyz9slD1q4Cx4HbCbMf04AUWH2VmpLEvIMPhWKAY
	 bkj8bkHnnHQ1Q3YHfqgDClwaq4uCWgHu62lIGjYaqcKp+tZ2Pa1WwYk+xOf/tnfUlo
	 ClgliSMwZB5ox5Bo3YquR4LqOCXXkoaJz2SxNF83hCJWC3UnVoqf7iD1Gj6qqwYjdk
	 ru/ZDCyVI1QWSsCKLmNli8ExJiB+3woP5Ynbx8cG61ij6xopDlnpumkUgd/kMmTMSE
	 ANrGkfEmuuTMdJMLKXxSMLgP0NadA09luIPixFU/XNpyrdiwGkcB0oKkBQuUqufX7O
	 GV9rOvCKanobA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8MxSddl+cJ
  kgxUnTCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxXzbeZCppYKw7vz2pgvMDSxcjFISTwhFFi
  8YIudgjnOpPE5d5NzBDOHkaJSSvagRxODjYBKYkb9/+zgdgiAvoSS2fvAYszC6hIvPjdA9TNw
  SEsECzxvJ0PJMwioCrx+xpImJODV8BRYvvk22CtEgIKElMevgdr5RRwklixcR0riC0EVDP76B
  pmiHpBiZMzn7BAjJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI+C0n7Aka
  mVYymxalFZalFuhZ6SUWZ6RkluYmZOXqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWVuck5KXp5
  qSWbGIGBm1LM5L6D8eiyP3qHGCU5mJREecPCFyYL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuCds
  QgoJ1iUmp5akZaZA4wimLQEB4+SCG/PbKA0b3FBYm5xZjpE6hSjLsfahgN7mYVY8vLzUqXEeb
  mWARUJgBRllObBjYBF9CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxdS4Gm8GTmlcBtegV
  0BBPQEYcuzQU5oiQRISXVwOTesf9B7Jop2Z2BLzpXfGd8OV/eW1o6kiPeY2EXb66rrd6SXWlt
  h3ZMyYw/+EpKQCzJzOLhBjGrN4ff6Fx5/TF1zu7aqQ2H7k/R4VxXc/PL368X8xLqvklIB7sXc
  Di7Omo9STPeut8gMD3n2Nclu1aUOgaZ/V0cO+dPdDrb9ScHtCQvZbXMT7qgHWK5Vo2hWUul8H
  +Ng77cudraWbbbv87+bpK4sjrc5NU74WOt2XvYz5tOSSxiX2Wb1ei880Tx9TuPmQILRFhUF0U
  kZCSK/BBQq9i/s5Cx8aWJ+TlJJk/OJ227eKbtnVPn+VDvVeesnDs/PmaVn7x4ZXl8SslSqeQ9
  a777VywvLZD03FX3S4mlOCPRUIu5qDgRACYDJNNjAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-591.messagelabs.com!1671538500!217888!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7942 invoked from network); 20 Dec 2022 12:15:00 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Dec 2022 12:15:00 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7AB2D1000DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:15:00 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6CDD51000C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:15:00 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 20 Dec 2022 12:14:59 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] xfstests: upgrade 2022.11.27 -> 2022.12.11
Date: Tue, 20 Dec 2022 20:14:24 +0800
Message-ID: <1671538467-7143-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671538467-7143-1-git-send-email-wangmy@fujitsu.com>
References: <1671538467-7143-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100136

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xfstests/{xfstests_2022.11.27.bb => xfstests_2022.12.11.bb}   | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-filesystems/recipes-utils/xfstests/{xfstests_2022.11.27.bb => xfstests_2022.12.11.bb} (100%)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.11.27.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.12.11.bb
similarity index 100%
rename from meta-filesystems/recipes-utils/xfstests/xfstests_2022.11.27.bb
rename to meta-filesystems/recipes-utils/xfstests/xfstests_2022.12.11.bb
-- 
2.25.1


