Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F28C7EE22
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 09:59:38 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.103415.1683539969304100655
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 02:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=E1VUjxt6;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683539967; i=@fujitsu.com;
	bh=xEaTNZ0RWLQRPrp2mPLhDM1hsMQgNPAyU0pw72GffrE=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=E1VUjxt6HsPFeUSCA/9YOjCcryDm8dLBObPEOIzIcxE2/H3ryu7ezcyTmWzS3MWW3
	 ExSnRAlKojkFQrHhOOOGOYfzKi7m9jIz6kgTL3GD264nXEOPkgDhKskqm4olwagRJn
	 ekNzZM9+WjWCiEpn5bMzZvAcLPmrCszyQc0Iam6WuP3mE7aSN8L7LkeYlgN4SfvfM2
	 dRVprn1Xgw84c+6DiuHsU1jgkswRfFXeYa/Qu//dD30celn7To2uniJ2zwhRCF5BBi
	 fX9LCZNYmYgBKN28EHIpYLdfOVm2fLnNpEtwGZkSDDFtgXyA2nHrfiFMHjGDP2pONE
	 gMf6nDXJ7uzsQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKLMWRWlGSWpSXmKPExsViZ8ORpPvveES
  Kwc7jRhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aBbaeZCqawV1w+49rAuImti5GLQ0hgI6PE
  5U9nWCCcaUwSHV1rGbsYOTnYBNQkpt+6wQpiiwjoSnz8MBcsziygIjFj8hEmEFtYwEdi97KXY
  DUsAqoS+948YwGxeQWcJK5tOAkWlxBQkJjy8D0zhK0mcfXcJuYJjFwLGBlWMZoVpxaVpRbpGp
  roJRVlpmeU5CZm5uglVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibnpOjlpZZsYgT6OKWYdfM
  Oxm27/uodYpTkYFIS5TU9GJYixJeUn1KZkVicEV9UmpNafIhRhoNDSYK3bVtEipBgUWp6akVa
  Zg4w3GDSEhw8SiK8skeA0rzFBYm5xZnpEKlTjLocV69c2cssxJKXn5cqJc5bCgxeIQGQoozSP
  LgRsNC/xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYtxpkFU9mXgncpldARzABHeF/ORzkiJ
  JEhJRUA1P4g9sb7TMXxZvOONYjnZETe35tSp5KBfvZho3/r5VWHoiepj2Va4WGXtGsirXdr+U
  e3j9w8vENM0v/1slNIY+jRR8Lam7tTPZrLnhn0ZM7Leh86JTiqPzN9zW/qorW/vq2UZhdYF0P
  q4gT68/v5yx6nDdKm/JfiE+43fjkaXHsyZkfvu5hWzG5Wma+yK0Did4B1l2392Xbnbx0KjhUr
  4vzMvPsz9+eRf/T8375MuDkKea9SqXa/DdDp69+efzyccfMKbIVkr4m+f47Krw0UkJZRUMt64
  94716X+2fFzByBx5d8D19M/7A/bO69/XVZRRKdah1nj/6buTHSbf38y7GrtiZu7N42ZXFi+ow
  FnzSVWIozEg21mIuKEwEmvkpA+AIAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-591.messagelabs.com!1683539966!498005!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1548 invoked from network); 8 May 2023 09:59:26 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 09:59:26 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 778F51C2;
	Mon,  8 May 2023 10:59:26 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 600471D2;
	Mon,  8 May 2023 10:59:25 +0100 (BST)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] abseil-cpp: upgrade 20230125.2 -> 20230125.3
Date: Mon,  8 May 2023 17:59:13 +0800
Message-Id: <1683539957-25094-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 09:59:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102380

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index 8617ba5c35..dd7ce4aee4 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -7,8 +7,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
 
-PV = "20230125.2"
-SRCREV = "b971ac5250ea8de900eae9f95e06548d14cd95fe"
+PV = "20230125.3"
+SRCREV = "c2435f8342c2d0ed8101cb43adfd605fdc52dca2"
 BRANCH = "lts_2023_01_25"
 SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0001-absl-always-use-asm-sgidefs.h.patch             \
-- 
2.34.1


