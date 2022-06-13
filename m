Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5ACAC43334
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 08:52:35 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.3658.1655110351643293557
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 01:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fLJDdH1g;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655110349; i=@fujitsu.com;
	bh=0wj7zCiRaFx0v9C830p3DRGphaIUc2OSljjecywrQKk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=fLJDdH1g2R69yCdNMNR/iS/KBYbPcl32C0j2JD2z4bE3soFVyAi9QZO3uTvi3bVaj
	 3D607kOMLpt0OeoS6ReDo55cMcQsYzNBjoHjApahEZphR8eqE7S64dEjBz4tPLjR3H
	 lFtJCbrtm22zShq+P6UAnoAW+63NqxDdaWT6hnEC7DyUIlAka7RgEEt4wjRg9S0f8d
	 X7VLFMmMbk/6+4m3md/0prIrjYh9K8fq3bGY1MppKUjlNWE+pwtU91i14G/sIxGDU1
	 qYlWAvHnCgCEIHufo629YMGF2LPmYFvvGIQnVm+Dbh2HJuYhne/DIxOdlIGouojcGO
	 bZPHRJcpksyrw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqHv217I
  kgx27uS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owVvbeYC95xVLzc2crSwNjD0cXIxSEk8IRR
  4vzBO0wQzgUmieVbb7FAOHsYJX7dX83excjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  WA1wgLOEr0PWsBsFgFVicP7HrOB2LwCThJf1pwB65UQUJCY8vA9WC8nUP3XNy/BaoSAahYtPM
  UKUS8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKukJgxYxsbhK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaNlUlFmekZJbmJmjq6hgYGuoaGprrGuhZleYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5y
  TopeXmrJJkZgEKcUM4ftYPzT+1PvEKMkB5OSKO/eL8uShPiS8lMqMxKLM+KLSnNSiw8xynBwK
  EnwPvoKlBMsSk1PrUjLzAFGFExagoNHSYTX7ztQmre4IDG3ODMdInWKUZdj5te2A8xCLHn5ea
  lS4rw2P4GKBECKMkrz4EbAovsSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHejyBTeDLzSuA
  2vQI6ggnoiI0nl4AcUZKIkJJqYHJ9/fjstPL6T+5eu9OrZ4uwTjvhn3RgDue3qOvJq772vvti
  fWVP3YF13HcSecS0tR57On/w7Hsae6LIQmbG7j/3b8+NfyuyZ7HmRZaFug0nzpyyeHahePuk+
  nfXxJJOTM8NED/6dcVehcbNqqu42bR3Je3IDPe5LhP+tKyI89ixZAvHiZlSd1h3fl/ietkxTV
  n6+Jvz0zd8P/C4sUra/aOgdfgfXx3hh/UTDrdZpVWp2XccdbY96+lnUjCpbJmwiXDO3r2t8w8
  5Wf0/q2f1mvHhg2VeGw93up9ZHbVrXtn5pSL8BS+OVpz4IL43x/qAbaFm6MGVC3b+zzrpIZ9V
  KHGkXef02Y97ayYpODE3Pv2txFKckWioxVxUnAgA24fkWWkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-591.messagelabs.com!1655110348!8653!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1604 invoked from network); 13 Jun 2022 08:52:29 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Jun 2022 08:52:29 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A4C1F100188
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 09:52:28 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 73E6C10019A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 09:52:28 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 13 Jun 2022 09:52:17 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gspell: upgrade 1.10.0 -> 1.11.1
Date: Mon, 13 Jun 2022 16:51:54 +0800
Message-ID: <1655110315-25174-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655110315-25174-1-git-send-email-wangmy@fujitsu.com>
References: <1655110315-25174-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jun 2022 08:52:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97483

News in 1.11.1, 2022-06-10
--------------------------
* Build: minor improvements, small change to how enum-types are built.
* A few documentation improvements.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/gspell/{gspell_1.10.0.bb => gspell_1.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gspell/{gspell_1.10.0.bb => gspell_1.11.1.bb} (76%)

diff --git a/meta-gnome/recipes-gnome/gspell/gspell_1.10.0.bb b/meta-gnome/recipes-gnome/gspell/gspell_1.11.1.bb
similarity index 76%
rename from meta-gnome/recipes-gnome/gspell/gspell_1.10.0.bb
rename to meta-gnome/recipes-gnome/gspell/gspell_1.11.1.bb
index fe1b3ea67..c76a48f19 100644
--- a/meta-gnome/recipes-gnome/gspell/gspell_1.10.0.bb
+++ b/meta-gnome/recipes-gnome/gspell/gspell_1.11.1.bb
@@ -7,4 +7,4 @@ DEPENDS = "gtk+3 iso-codes enchant2"
 
 inherit gnomebase gettext gobject-introspection vala
 
-SRC_URI[archive.sha256sum] = "803bb884c0215d3fd22a85d7f30423aff88d9792f05a5199d8a489a2ffaae1da"
+SRC_URI[archive.sha256sum] = "ef6aa4e3f711775158a7e241a5f809cf2426bc0e02c23a7d2b5c71fc3de00292"
-- 
2.25.1


