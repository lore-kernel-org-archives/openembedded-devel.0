Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7502C43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 04:37:02 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.2489.1655181413247835319
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 21:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lszscNZv;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655181411; i=@fujitsu.com;
	bh=VAcz6BSoE2DRCfJ3AmgIj6us/3tuLCV0Y/OxE7C9IZc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=lszscNZvEIHIDP6lWxhoVSuqHCEpzMyvBmH/Hy4LX4R7pAmlQ8+R4p1pnZqP4eqEG
	 bn5yoZ/K9ETj7c/c1BfzGCJocdqlXdGhLinKTWSJkTj7HmiyZeqYSPVUH0ok3uZ/vx
	 vpa7sOnMzGqeI1BewxutHWA429VkDRBdLz8l96hnxERshtYFYqicifg3zSqwU5mC1G
	 cp9ltnFqnouBGvKxnNR/Dlhi9pylw4hH/AW9OF5sLe4wC4xsb34QqqHOiqJNJePGX9
	 z+8n0cZJXGZHTPfVB5/dIngbmiPBvGE0GQFEZlzsibGn4ea0Hs5R3gj8wJMh5oBWbu
	 lP5dSTpzYM2Hg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRWlGSWpSXmKPExsViZ8ORpJsksCL
  J4PkiPouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePUhVXMBTs5Kx5cm8zawHido4uRi0NI4CGj
  xJ7OW8wQzlkmifkPLzFCOHsYJU79mcPUxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAs8SDjkmMIDaLgKrEpWdz2EBsXgEniSULpoPVSwgoSEx5+J4ZIi4ocXLmExaIORISB1
  +8gKpRlJh9uZkFwq6QmDFjGxuErSZx9dwm5gmM/LOQtM9C0r6AkWkVo21SUWZ6RkluYmaOrqG
  Bga6hoSmQNtY1MjTTS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J0ctLLdnECAzOlOL0
  GzsYd+37pXeIUZKDSUmU99Lu5UlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHhbOFckCQkWpaanV
  qRl5gAjBSYtwcGjJMK7+B9QK29xQWJucWY6ROoUo6KUOK86P1CfAEgiozQPrg0WnZcYZaWEeR
  kZGBiEeApSi3IzS1DlXzGKczAqCfN+5wOawpOZVwI3/RXQYiagxRtPLgFZXJKIkJJqYLIoWsE
  XbCIxzfHM3O5YqRLmfI4nc5RZTurcE7xYonXky1Jvl3pnv5NPnTJmiylwnXn81nE71wL9tA+G
  Z40kH72f8SF1dtMeLt41rVNuJMSdtZkaEGxyxfK1Dq+varrHB6EK2d505wc/om2XTZhcVrBMI
  FvlfPqChZtmx/HtWqX0ZjrnmUNlx9au3DyX2aG8ua+b+bv0ztc6Vzvsd60rc3barn5iWkRYy5
  SgllkT4hfUrjwXYCS79POUh0r+eauVfyov8qi0/rH11SQTsSXTOw0aKs9kTglQXl5i9YSz/fB
  d/cytOgceBOwJf+XoeGD+g72zqh6al2tMVPR88qo0vTOX3W4B/7E8zxubQz5/eanEUpyRaKjF
  XFScCABn/DJCSQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-728.messagelabs.com!1655181409!82262!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24806 invoked from network); 14 Jun 2022 04:36:50 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Jun 2022 04:36:50 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id A559B1A4
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 05:36:49 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 9A4691A1
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 05:36:49 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 14 Jun 2022 05:36:39 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] syslog-ng: upgrade 3.36.1 -> 3.37.1
Date: Tue, 14 Jun 2022 12:36:26 +0800
Message-ID: <1655181386-30925-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jun 2022 04:37:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97502

Changelog:
https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-3.37.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../syslog-ng/{syslog-ng_3.36.1.bb => syslog-ng_3.37.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/syslog-ng/{syslog-ng_3.36.1.bb => syslog-ng_3.37.1.bb} (98%)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.37.1.bb
similarity index 98%
rename from meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
rename to meta-oe/recipes-support/syslog-ng/syslog-ng_3.37.1.bb
index 40bbfe495..10d63ccc6 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.37.1.bb
@@ -24,7 +24,7 @@ SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.ta
            file://syslog-ng.service-the-syslog-ng-service.patch \
 "
 
-SRC_URI[sha256sum] = "90a25c9767fe749db50f118ddfc92ec71399763d2ecd5ad4f11ff5eea049e60b"
+SRC_URI[sha256sum] = "d67a320cb896cd5d62f24d9e1bec138847fa4618ae13a3946cae2b75c528ee14"
 
 UPSTREAM_CHECK_URI = "https://github.com/balabit/syslog-ng/releases"
 
-- 
2.25.1


