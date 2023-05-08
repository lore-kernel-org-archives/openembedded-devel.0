Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76380C7EE26
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:18:38 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.103807.1683541116701783817
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HUVeahGd;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541114; i=@fujitsu.com;
	bh=9lpAJevsR6PqhblS+dU15/5k2M9Xi6jOkMQICBmtiGM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=HUVeahGd001e+OcnnRedSgSFrMcj82R/J3GYtMWp54SZ4yGmKCD43DTCkLVVy6Jn+
	 Y5taQ6/oIQVLMPVtsJIvS9lNIxIYo+k1hr1aioWerdEylC9SSkVni36a11wSxRrLTK
	 MZZBGb9FcJPAicbKHEtmf+l9dOg8joNjUNYkMuvKIja9dtJNZCA1gVZHHKQcf2NcTY
	 MeylnogbVuwegh7Neizf6ZBqDWeRcPu81e+jOA7+kdA8ehCbsKz7TztO+xgZpfu0OR
	 APN/jWSUMTCfUcv4aoZPEBCHBM0EjRjALt7efGhZFmJjHQV7kGqAfQuGWVxX/6Bjpl
	 Od5mbldPdI35Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPLMWRWlGSWpSXmKPExsViZ8ORpFt1JiL
  F4Pd0bouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPLIqeCdZwVhybmNzCe5+hi5OIQEtjIKHHi
  1yYmCGcak0Tji1lsXYycHGwCEhLT955kB7FFBHQlPn6YywhiMwuoSMyYfIQJxBYWcJdYsHstC
  4jNIqAq8ezva7AaXgEniZfnToLFJQQUJKY8fM8MYnMKOEs0z7oBFhcCqnm9pZUZokZN4uq5Tc
  wTGHkWMDKsYjQtTi0qSy3SNdJLKspMzyjJTczM0Uus0k3USy3VLU8tLtE11EssL9ZLLS7WK67
  MTc5J0ctLLdnECAyHlGKGnzsYD+78q3eIUZKDSUmU1/RgWIoQX1J+SmVGYnFGfFFpTmrxIUYZ
  Dg4lCd62bREpQoJFqempFWmZOcDQhElLcPAoifDKHgFK8xYXJOYWZ6ZDpE4xKkqJ8/47BZQQA
  ElklObBtcHi4RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd7LIFN4MvNK4Ka/AlrMBLTY/3
  I4yOKSRISUVANT+K2rG9myp3eeZWCzveYtxWauN/XVios52qK3Vl+5FaPovCZim9FH2W0sO3S
  T3qXWpEVEb5miMqk7uYY14HrW9v35P9/P85jw5m5I3XMVpo9ePHPuCPh0J0nVlJnG/5CqsWnO
  Zz1VEul43f5DeP7Rj0219nxrH0pJzc6WY1skKXpbUZQ91OvZ72DFDZe8ueqTtp5N/Tb1+1LG6
  SxLo1/M2XZ3W9ZZ+4WP6la0GJ0vLg48uM31d7mN78HldWlyMftW9l6YHp94LazNSmb1oqaHq1
  wXsgmtUVO5J+Jx98TDCf8PeZyuWXFJ4P/agMLmyZknnV8nnpl58lV37quCBzJBoomb2Bd2hn7
  3ufuiOzVXiaU4I9FQi7moOBEAV3riAwIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-585.messagelabs.com!1683541113!503979!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31541 invoked from network); 8 May 2023 10:18:34 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:18:34 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id CDA861D2;
	Mon,  8 May 2023 11:18:33 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 005561C2;
	Mon,  8 May 2023 11:18:32 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-can: upgrade 4.1.0 -> 4.2.0
Date: Mon,  8 May 2023 18:18:19 +0800
Message-Id: <1683541101-25407-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683541101-25407-1-git-send-email-wangmy@fujitsu.com>
References: <1683541101-25407-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102408

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/hardbyte/python-can/releases/tag/v4.2.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-can_4.1.0.bb => python3-can_4.2.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-can_4.1.0.bb => python3-can_4.2.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-can_4.1.0.bb b/meta-python/recipes-devtools/python/python3-can_4.2.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-can_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-can_4.2.0.bb
index 3d90c7f369..7562b977b1 100644
--- a/meta-python/recipes-devtools/python/python3-can_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-can_4.2.0.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "3f2b6b0dc5f459591d171ee0c0136dce79acedc2740ce695024aa3444e911bb9"
+SRC_URI[sha256sum] = "0fbda7217523b802f36a8d5a3cd26a35baad2795965f7f09bfa3dd1dfb6fbaf0"
 
 PYPI_PACKAGE="python-can"
 
-- 
2.34.1


