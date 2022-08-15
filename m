Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C8AC25B0E
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:12:29 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.13475.1660543945605342198
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aXjOGdPg;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660543943; i=@fujitsu.com;
	bh=HU6gtiHeLl0n92tluMlgvDY1tJ7ipaDqsPfeTZJ4bmE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=aXjOGdPgYrABHy7pnx49ahn+NRZM9sjW8UasQ8GIoqsNgl1dlADHNZ0nnMmG0wpIg
	 keq+jHH+3furs0Zv5s6WUFKTG2pqWHF0JHMUu8rN3clmtocKt2JUOCNVryq2OXnSjD
	 zl/yvZj0RNhoDtGfjDDbZSlT4PvkWj4kj3u/y5p4bbWir2NCnMlPnL5sJXSSPGW5NP
	 eDsFjwvbWi/AQpt83liK5UWn7G0dx/6link9ux7PiVosGwJG57bHBVGn8fTojKQO0y
	 HkwBX9KVInqSfLjMvLSjHwIyZWQ/IxQgIs6/Z3EEivFXzIokHJaWItlcQc0yAenx4E
	 fYmS9f/FCWwLQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8ORqHvs8c8
  kg5VLbCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxjN+wKVnBUnFk8i7GB8Sh7FyMXh5DAE0aJ
  VwdfMkM415kk9q/fDZXZwyhxe+Yjli5GTg42ATWJ6bdusILYIgL6Ektn72EGsZkFVCRe/O5hB
  7GFBdwlbnw9AmazCKhKXJ98AqyeV8BRonvjJzYQW0JAQWLKw/fMEHFBiZMzn7BAzJGQOPjiBT
  NEjaLE7MvNLBB2hcSMGdugetUkrp7bxDyBkX8WkvZZSNoXMDKtYrRNKspMzyjJTczM0TU0MNA
  1NDQF0sZA2kIvsUo3US+1VDcvv6gkQ9dQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMDRTitPLdjBe
  3fdL7xCjJAeTkijvtYs/k4T4kvJTKjMSizPii0pzUosPMcpwcChJ8JoBg11IsCg1PbUiLTMHG
  CcwaQkOHiUR3gW3gdK8xQWJucWZ6RCpU4y6HDO/th1gFmLJy89LlRKHmCEAUpRRmgc3Ahazlx
  hlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ87o/AprCk5lXArfpFdARTEBH6N39DnJESSJCSqq
  BKc+187XmxYR/as/DX8jk6xS/mCnEGte/zODt6hzJSzUvavi76y47bxaU8mle6nI7mb1K27Bu
  agTrLOkvtxeFLRKdzW/AP/tO/P89pz6XPY7dPVdAtPFKQ464XyLP1cvHqlXi+mstjh401JcuF
  J2S77n4znpPne8RB1/EfPF6L/C7cuM71vudpQWvGu6rS76QsHsWpR68pfZAjBpz9q6NNZ/sbq
  9QtzRZIpNsXm92cP/2xXPsjy9iuXggYd5ErYrylAy2rld5cyJdunkXrLzdIqrMtZb7zawtpdX
  T+N24Jjxpcz8tVDHjjJbhan9fPzGte42MTsWvdjvsNTNcNHfVjR83q1WZjnypuMK2KLxciaU4
  I9FQi7moOBEAEqJ6JlQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-732.messagelabs.com!1660543942!637232!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17016 invoked from network); 15 Aug 2022 06:12:22 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:12:22 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 650F110018D
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:12:22 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 592A1100043
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:12:22 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:12:20 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] cifs-utils: upgrade 6.15 -> 7.0
Date: Mon, 15 Aug 2022 14:12:01 +0800
Message-ID: <1660543925-1319-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 06:12:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98234

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cifs/{cifs-utils_6.15.bb => cifs-utils_7.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/cifs/{cifs-utils_6.15.bb => cifs-utils_7.0.bb} (97%)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_6.15.bb b/meta-networking/recipes-support/cifs/cifs-utils_7.0.bb
similarity index 97%
rename from meta-networking/recipes-support/cifs/cifs-utils_6.15.bb
rename to meta-networking/recipes-support/cifs/cifs-utils_7.0.bb
index a009a26cc2..c78bbae7b8 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_6.15.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_7.0.bb
@@ -4,7 +4,7 @@ SECTION = "otherosfs"
 LICENSE = "GPL-3.0-only & LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "58ca03f183b375cb723097a241bc2fc2254dab21"
+SRCREV = "316522036133d44ed02cd39ed2748e2b59c85b30"
 SRC_URI = "git://git.samba.org/cifs-utils.git;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


