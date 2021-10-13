Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283ECC433F5
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 12:12:15 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.7279.1634127133291753192
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 05:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pgeK36oq;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634127131; i=@fujitsu.com;
	bh=8rm/KQCTvm64EpPYHs8EJOoyjEnFVHp0QZ90kRCiI28=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pgeK36oqdF6KxGGntuA07L9IOvzQ2XOV2hBZyjb+mjda3QVeKe8boqbhOH3mXPGVs
	 YPmy4uuAHvftlPoTBl16wBVkKCx+rmkcWRDxyh4kmW3CY5LBz+7FXovnCCvMebBkhI
	 bLSO02si1t5hCEJTUhkV8EP9tcSxeCUgDBpL92fU9lde/gRZKjdF9DyIC1UadhmPeU
	 aKVsO5dhymB5cWZRCyPMttwJU4bXRws6bKCSL5G7Q3hikXJZom2ZPg9v6PcfJqPNEq
	 0T0hgIOWmqYb18v/9F6vHoFs4JZ594eWcFuUWfczMDYzSwHA+ruSLjPz6dRCKokAFa
	 qhZdqtRxQEbWw==
Received: from [100.113.2.26] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 74/B7-29929-B1DC6616;
 Wed, 13 Oct 2021 12:12:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqCt9Ni3
  RYOcKTouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPJ1e2MBTOEKrbc+8rawNgg0MXIxSEk8IRR
  4vjme0xdjJxAzgUmifkH+CESJxglLuz+xQiSYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAVeLR4slgg1gEVCW+d01kAbF5BZwltm5rB5sjIaAgMeXhe6BeDg5OAReJq1vjQUwhoJ
  KWvf4Q1YISJ2c+YYGYLiFx8MULZohORYnZl5tZIOwKiVmz2pggbDWJq+c2MU9gFJyFpH0WkvY
  FjEyrGC2TijLTM0pyEzNzdA0NDHQNDY11DXWNjM30Eqt0E/VSS3WTU/NKihKBsnqJ5cV6xZW5
  yTkpenmpJZsYgeGbUsj4Zgfj19cf9A4xSnIwKYnysuxOSxTiS8pPqcxILM6ILyrNSS0+xCjDw
  aEkwRt0BignWJSanlqRlpkDjCWYtAQHj5II76YTQGne4oLE3OLMdIjUKUZFKXHec6eBEgIgiY
  zSPLg2WPxeYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMu/IU0BSezLwSuOmvgBYzAS0OjEo
  BWVySiJCSamBK3PmX+9DHZwllYl/Z/mY1rNMWXfTtI0NUbZ9ced1DvfOsj9VKzhj5ccy8w75R
  uGJ5rRjzwp2NoTbPqrev/b5q58V9ZUt4Sq9Ma2kxXHGX14m9vKF6ysbsdVmpXunXa873VIg90
  685prZt4sqTD95dz3rW1Rqe6q6peU56tmhQ86TOq5LlepcenlUviCi+EOAgcklqAZ/Btzsiiy
  w7Vlz99UTU+9Gnze453Zw75KZo6y47Za9dlfDgqizXsRXxa3+9aRT55vje9gB79hb76QtZz3J
  vlDks23rybAD3hIJwsRqHYuZLenser9qtdr98p4LbmeTaC/6ra4RqUosvO07cIqnaZhBoNenH
  v6CGg2VKLMUZiYZazEXFiQBK4vWjWgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-226.messagelabs.com!1634127130!22530!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10324 invoked from network); 13 Oct 2021 12:12:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Oct 2021 12:12:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 90FF814B25D
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 13:12:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 5C4A814B24F
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 13:12:10 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 13 Oct 2021 13:12:08 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [oe] [meta-oe] [PATCH] icewm: upgrade 2.7.0 -> 2.8.0
Date: Wed, 13 Oct 2021 20:11:54 +0800
Message-ID: <1634127114-114535-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634127114-114535-1-git-send-email-wangmy@fujitsu.com>
References: <1634127114-114535-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Oct 2021 12:12:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93278

Improve the explanation on how to spy on client messages with icesh.
When rearranging windows with tile placement or cascade placement, correct for
the top side vertical offset, in those themes which have a masked top border.
Improve the explanation for some of the preferences.
Update the winoptions example on DockApps.
Guard against a color name being set to the empty string (bbidulock/icewm#614).
Improve the performance and scalability of the window list menu.
In the window list window group similar application windows together.
Add +group and +Class select options to icesh.
Improve the filtering on the WM_CLASS property in icesh.
Fix the OSS/ALSA defaults in icesound help message (bbidulock/icewm#609).
Fix the OSS/ALSA defaults in icesound man page (bbidulock/icewm#608)
Only support SVG for icons, not for icewmbg backgrounds.
Let icewmbg pixmaps free its associated Image to reduce memory usage.
Prevent a potential trailing -I flag in CMake for issue #57.
Fix the description for sizeby in the icesh manpage.
Fix overflows in battery calculations for issue bbidulock/icewm#607.
Update the translations, most notably Brazilian Portuguese.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/icewm/{icewm_2.7.0.bb => icewm_2.8.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/icewm/{icewm_2.7.0.bb => icewm_2.8.0.bb} (94%)

diff --git a/meta-oe/recipes-extended/icewm/icewm_2.7.0.bb b/meta-oe/recipes-extended/icewm/icewm_2.8.0.bb
similarity index 94%
rename from meta-oe/recipes-extended/icewm/icewm_2.7.0.bb
rename to meta-oe/recipes-extended/icewm/icewm_2.8.0.bb
index a16dbd4145..259187b0cd 100644
--- a/meta-oe/recipes-extended/icewm/icewm_2.7.0.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_2.8.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
 SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.lz \
            file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
            "
-SRC_URI[sha256sum] = "c56b1d0f5d8efa2af3e38003770eab9165289aa87bd8f1627819c7f93f9433a3"
+SRC_URI[sha256sum] = "12b7cce67b95b09f34873f46948e7f1cef9edd88682139e054b79ba165c53e49"
 
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 
-- 
2.25.1


