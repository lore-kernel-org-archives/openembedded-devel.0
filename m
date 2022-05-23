Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF98C433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 08:10:03 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web08.25093.1653293391472318829
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 01:09:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UN9lkgyJ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653293390; i=@fujitsu.com;
	bh=0/zjqvhCUntAkX23ABtEdUEoXNo/9ljLa11t8QOWLWI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=UN9lkgyJm7i/33uxRakjkNdBSAx8SKorIrLusTOlNg+Hh2JEsocu01DlI8T1D1O+l
	 r52RXoZZxhOJVCZtMZn54JoMWtI6M4RhyEYz2RUF2zIo/LhJgb+KwZ7idQLyfkgop3
	 HwvZKnOHmkTY2PiQB2rH9rYqpjqVr6mh5KLVsFGPEPZfQXLuCAxnk3Jy6tOGXmnnW/
	 9AGMWFaUtarK6xD0GbH6LJcES40VsAVx/h1x372JGleqJ3pDk2hl/eNF57noOuTJHj
	 8ZZi8Z4rDP46Z5WIe1NO4CZ5h1zB2GHfutRoebRNSsYsl8k3J3urAzZFGa0GlLFHdq
	 Y7amHPWQGj/LQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORpOvr2J1
  k8O2JgsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrF85ROmgh7uip1N+5gaGG9wdjFycQgJPGSU
  mDLtHnsXIyeQc5ZJ4nSbIURiD6PEheMzWUESbAJqEtNv3QCzRQT0JZbO3sMMYjMLqEi8+N0D1
  iwsYCfxvXsPC4jNIqAq8eXmdzYQm1fASeLimidgNRICChJTHr4H6+UUcJb4uWsa1GIniV3tx1
  gh6gUlTs58wgIxX0Li4IsXzBC9ihKzLzezQNgVEjNmbGODsNUkrp7bxDyBUXAWkvZZSNoXMDK
  tYrROKspMzyjJTczM0TU0MNA1NDTVNTbWNTS31Eus0k3USy3VLU8tLtE10kssL9ZLLS7WK67M
  Tc5J0ctLLdnECAzjlGLFzTsYJ678qXeIUZKDSUmU96hdd5IQX1J+SmVGYnFGfFFpTmrxIUYZD
  g4lCV4+e6CcYFFqempFWmYOMKZg0hIcPEoivIwOQGne4oLE3OLMdIjUKUZFKXFeR5CEAEgioz
  QPrg0Wx5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfPWg0zhycwrgZv+CmgxE9DiXolOkMU
  liQgpqQYmi5zQhunCy55z7pG325a4cV1H4SWbLfJlJ2p2rbaxvb1n11pLPVNe8dl7TisKlDnr
  h2wKFwvYPeeoGOfVfna5P8tcLr41PTJ10dzyuP+TVmSwKLUL+a+w9ziYZcfzPv5B5Pniy6aSb
  21mmgg1tdkUc+2q3RtXbaRx7ITLgjyLXgMnKb7FTDtFX57ZIuN3zXGH9iuteM9alYcrH/HfCO
  n9W7vNfP6ElpjXv3hUzxiuua/1ymJHrWe6yIN1bvrdDt/macZnz7hX68Y3dcaGjcLTVG5ImS+
  7Nsk977XNt3NamxRt37m92C70pDnuJFfnLJba2wqtDcvyaneLvp/59cmbh0at0WnFby93nE58
  lt+kxFKckWioxVxUnAgA7LaCQ14DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-571.messagelabs.com!1653293389!245900!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20368 invoked from network); 23 May 2022 08:09:49 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 May 2022 08:09:49 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 31C2AD74
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 09:09:49 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 23D27D5C
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 09:09:49 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 23 May 2022 09:09:42 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] smarty: upgrade 4.1.0 -> 4.1.1
Date: Mon, 23 May 2022 16:09:25 +0800
Message-ID: <1653293366-31516-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653293366-31516-1-git-send-email-wangmy@fujitsu.com>
References: <1653293366-31516-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 May 2022 08:10:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97226

Changelog:
==========
Security
--------
    Prevent PHP injection through malicious block name or include file name. This addresses CVE-2022-29221

Fixed
-------
    Exclude docs and demo from export and composer #751
    PHP 8.1 deprecation notices in demo/plugins/cacheresource.pdo.php #706
    PHP 8.1 deprecation notices in truncate modifier #699
    Math equation max(x, y) didn't work anymore #721
    Fix PHP 8.1 deprecated warning when calling rtrim #743
    PHP 8.1: fix deprecation in escape modifier #727


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/smarty/{smarty_4.1.0.bb => smarty_4.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/smarty/{smarty_4.1.0.bb => smarty_4.1.1.bb} (94%)

diff --git a/meta-oe/recipes-support/smarty/smarty_4.1.0.bb b/meta-oe/recipes-support/smarty/smarty_4.1.1.bb
similarity index 94%
rename from meta-oe/recipes-support/smarty/smarty_4.1.0.bb
rename to meta-oe/recipes-support/smarty/smarty_4.1.1.bb
index 18753db2b..df441e8db 100644
--- a/meta-oe/recipes-support/smarty/smarty_4.1.0.bb
+++ b/meta-oe/recipes-support/smarty/smarty_4.1.1.bb
@@ -9,7 +9,7 @@ DEPENDS += "php"
 
 SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master"
 
-SRCREV = "9e0536de18b53ba193364291ef0303b0ab9903e1"
+SRCREV = "71036be8be02bf93735c47b0b745f722efbc729f"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


