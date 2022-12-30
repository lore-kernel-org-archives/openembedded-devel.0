Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B085C4708D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 03:45:09 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.3792.1672803908501061746
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 19:45:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=C67D1JjM;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672803907; i=@fujitsu.com;
	bh=nJq4E6HCzc/eAG7IkXUb7ArGrS5N73W+0eUHBmNDob8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=C67D1JjMEfzQtZBFwa4DCGmA2APEuSOVJ2zL3j4cZK3gcSgI3hQQVBs2U3gni5pts
	 F7QwhacvNzk/dqP86EUE8hbjFZeJp6Xyso9X0n5+lAm5s14+a+IAKgGu3MvCbY03F+
	 lOkKOSLJV6pmndwnfwacz1nhb49xKjg2k0QFkz7loMq4b+DtbB6yImfe5Y5GZJUBwB
	 Pnl6BjHEVG6LS0BTXaUDnwJWgmCJzMMtCg1k4cRJHSMHcLLYOyZQb5XicnhYFOdtLN
	 95GF3j0t5FNTac1DvM5T4AjYoaspyWAOtERtS1jyDYEUb+W2F4apSzzQC/Uj2maC2E
	 gWHvDF5qNYDkQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORqOv0bUu
  ywfSt2hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a85x1sBdO4KqZsn8bWwLiDs4uRi0NI4Amj
  RPO7YywQznUmifkr97FBOLsZJRZuOMzcxcjJwSYgJXHj/n82EFtEQF9i6ew9YHFmARWJF7972
  EFsYQEvicUdfYwgNouAqkTTz2VANgcHr4CTxLVpZiBhCQEFiSkP34O1cgo4S1x9uhisXAio5N
  2nk2BjeAUEJU7OfMICMV5C4uCLF8wQvYoSsy83s0DYFRKzZrUxQdhqElfPbWKewCg4C0n7LCT
  tCxiZVjGaFqcWlaUW6VroJRVlpmeU5CZm5uglVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibn
  pOjlpZZsYgSGbkqx+tYdjIeX/dE7xCjJwaQkylvyeUuyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJ
  Qle9U9AOcGi1PTUirTMHGAcwaQlOHiURHizQFp5iwsSc4sz0yFSpxh1Oe4u3LuXWYglLz8vVU
  qc99YXoCIBkKKM0jy4EbCYvsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmHc1yCqezLwSuE2
  vgI5gAjoiac1GkCNKEhFSUg1MhWfeC828LCO32p0hQ3/pQxuj+jfi53fYBDxo2PP8aqBr8ju+
  Z6e75Q5/kxY883amwC8H1W4B6x0fivyNp3+5dOYer5lzyZOLP3SvR83s/Fcrz9qaWi/FFfUj2
  VP/4Jpne/My6ltM771cmrrp702WdudvdvwfNkirKSuWNmv9nimX9OO96P6wvq4ey7MZj3dxZ0
  y2bHsaVb3P2lbt2MnFn4IyhT+l/GNOy1G4XVewcPk59+/G61gmxH5m2zZlV+3DLQsOO6zY/YD
  DhWvvG8Vr/0+xx5oe39VwWcOTY1Pt2s7lJ1QV0pXP5rNv37WIgWPOVsU7F25ftuLqD1oyLbGw
  SO/xJZ8NynyXP908/vnQUSWW4oxEQy3mouJEAFWM8BxkAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-565.messagelabs.com!1672803906!383901!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31606 invoked from network); 4 Jan 2023 03:45:06 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Jan 2023 03:45:06 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 6B078100192
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:45:06 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 5F2FA100182
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:45:06 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 4 Jan 2023 03:45:04 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] traceroute: upgrade 2.1.0 -> 2.1.1
Date: Fri, 30 Dec 2022 13:01:17 +0800
Message-ID: <1672376478-25626-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672376478-25626-1-git-send-email-wangmy@fujitsu.com>
References: <1672376478-25626-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 03:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100388

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../traceroute/{traceroute_2.1.0.bb => traceroute_2.1.1.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/traceroute/{traceroute_2.1.0.bb => traceroute_2.1.1.bb} (91%)

diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb b/meta-networking/recipes-support/traceroute/traceroute_2.1.1.bb
similarity index 91%
rename from meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
rename to meta-networking/recipes-support/traceroute/traceroute_2.1.1.bb
index 9cac20499..3892a0e21 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.1.1.bb
@@ -17,8 +17,7 @@ UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/traceroute/files/tracerou
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute/${BP}/${BP}.tar.gz \
 "
-SRC_URI[md5sum] = "84d329d67abc3fb83fc8cb12aeaddaba"
-SRC_URI[sha256sum] = "3669d22a34d3f38ed50caba18cd525ba55c5c00d5465f2d20d7472e5d81603b6"
+SRC_URI[sha256sum] = "8fc8d5046e855d7588607bb319f5b82e3ba13e91d5d4636863262e6386bbaf76"
 
 EXTRA_OEMAKE = "VPATH=${STAGING_LIBDIR}"
 LTOEXTRA += "-flto-partition=none"
-- 
2.25.1


