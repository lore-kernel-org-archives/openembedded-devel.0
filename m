Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B26C6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:09:34 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.7276.1663639771048003283
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=x9mBiX5Q;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663639769; i=@fujitsu.com;
	bh=PCtOAa61mnlU59ci19CMKFwJAjW3aCo75wuMj7AHhS0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=x9mBiX5QvHsVQbShWRZNmFEPsTFV619ViZUAcnUiykYSY6KqiIyQNVrZgzXuCL51h
	 K1rbliEyTBNcmLvHxsbehlemiYm131ZvX+0X9QR+7yXMDYOBgL6Gh2DijO5wK8ambO
	 2CcMhsCucPp648NS7A0uwTiMMBtQVgK02ETDm5K9S2RdWVV30X30lP1RhCq8TrSI4Y
	 vFOQeUz/PTZHPKDKNLvSW6k2uXvHaPIJPxR2fR7ZsAGtbv6o0xv1Rh1Q0BWQ46vfa0
	 3aQd6B8N8uBXPSQB9ef09WIllgJhrFNSyIB4CkYG5QIgvIQmxfCMaibVzTE79mLYAU
	 kLGof36U5fKNw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8OxWfe6gma
  ywee3xhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a5G7+YC7rYKua+dmtg3MnaxcjFISTwkFHi
  6c5d7BDOFSaJdQe3MkM4exgl2u69Zepi5ORgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBG4ta95WxdjBwcLAKqEsseqYGEeQWcJP686wEbIyGgIDHl4XtmiLigxMmZT1ggxkhIHH
  zxghmiRlFi9uVmFgi7QqJx+iGoXjWJq+c2MU9g5J+FpH0WkvYFjEyrGG2SijLTM0pyEzNzdA0
  NDHQNDU11Lc10jQwN9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yorc5NzUvTyUks2MQLDMqU4
  4dIOxnX7fukdYpTkYFIS5eWq00gW4kvKT6nMSCzOiC8qzUktPsQow8GhJMFrL6iZLCRYlJqeW
  pGWmQOMEZi0BAePkggvmxRQmre4IDG3ODMdInWKUVFKnPeSHFBCACSRUZoH1waLy0uMslLCvI
  wMDAxCPAWpRbmZJajyrxjFORiVhHnDQabwZOaVwE1/BbSYCWjxDRV1kMUliQgpqQammdNZLt+
  8fnibz0P33b4Je8zyQvjLxf/NnFajmnt+rptKQoCxUDNn9jFpjm+end6yqw3fbG5UE37oovUy
  ZfKilVOeH3lyZabJG/v8JD/HL73BJRF+3O0NgWsvKAaE3K7fof4j6lndtoWN2onzf/p/5d7Kv
  MO/a/X5lgkqqQr1zz345JJ0VrmFL9NS2bGm7FbtTaUl3cl/jwnMWGox91FSZMN3VnUnx486pf
  15v5qnO18zuFgtsSY/QnNZ3k2GyhUFJhefCdo+fxh659hqxovCb5zLknj3G5ZPSFthtjDn5/r
  y39P3foiax5c68900+WbjXd5xHQnb/V+WaO2M8I29l1xbXl27+lb9ohjOaE0lluKMREMt5qLi
  RADAoftfRgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-745.messagelabs.com!1663639767!246623!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22554 invoked from network); 20 Sep 2022 02:09:27 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-6.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:09:27 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 45E17159
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:09:27 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 38A5A157
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:09:27 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:09:25 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] bats: upgrade 1.7.0 -> 1.8.0
Date: Tue, 20 Sep 2022 10:09:11 +0800
Message-ID: <1663639751-26776-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:09:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98867

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-test/bats/{bats_1.7.0.bb => bats_1.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/bats/{bats_1.7.0.bb => bats_1.8.0.bb} (95%)

diff --git a/meta-oe/recipes-test/bats/bats_1.7.0.bb b/meta-oe/recipes-test/bats/bats_1.8.0.bb
similarity index 95%
rename from meta-oe/recipes-test/bats/bats_1.7.0.bb
rename to meta-oe/recipes-test/bats/bats_1.8.0.bb
index 81235e29b0..4b90dcc579 100644
--- a/meta-oe/recipes-test/bats/bats_1.7.0.bb
+++ b/meta-oe/recipes-test/bats/bats_1.8.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
   "
 
 # v1.7.0
-SRCREV = "410dd229a5ed005c68167cc90ed0712ad2a1c909"
+SRCREV = "e9b286bb39ad7b0cb7b7d2e819d44d1aff387522"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


