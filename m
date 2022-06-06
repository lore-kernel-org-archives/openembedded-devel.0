Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3693C43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 13:01:14 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web10.31630.1654520466826933984
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 06:01:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=C9CVvG/V;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654520465; i=@fujitsu.com;
	bh=iJDdQXMNJPL1Ojd41m4K2QivfaEPimy+5W6TSdNKNeQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=C9CVvG/V2MWNxm0J4VYzizNdAE3MJ4n7HfmaAXKOjzyGW7BfTwKxU5Niq7xYiVOlO
	 jYk7pKDGEd0OeYND7hn69xAfAhuB8Q7slXBmfuipOgyvmbHgF6cpjRR5nPIwhs/7P9
	 wvBwoy5HFTHTCJaREFx06B8+2G3Qar5uDZZ//kH6OJw87WY97bI3xU5bflMInaag6S
	 aZ/sxONKY6uFYnbD14mhFMiny8dor1cyJMHZDmKNiQyVpLSFEgaixGz4tJSkYEaiOY
	 FKE4ENKHaldjt2Dgp9s4NrSlV8UqhZPoGhkO6L3wZK9ADMIhmppOXjaVsGkhHcfwrv
	 m+SrxAueoHqCg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8ORpDvh19w
  kg+VXdC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozrF26wFeznrmif/JyxgXEeVxcjF4eQwCNG
  iRtvPjJCOOeYJP6+usoE4exmlJizo5+li5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9i7GDk4hAWCJI6eLAAxWYDC3/abgFTwCjhKfPx1DGyKhICCxJSH78E6OQWcJBp+bgeLCwHVrO
  i8ywJRLyhxcuYTFojpEhIHX7xghuhVlJh9uRlqToXEjBnb2CBsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYrZKKMtMzSnITM3N0DQ0MdA0NTXUNdY0MjPUSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yor
  c5NzUvTyUks2MQJDOKWY8fQOxk19P/UOMUpyMCmJ8lZ9mpskxJeUn1KZkVicEV9UmpNafIhRh
  oNDSYK39AdQTrAoNT21Ii0zBxhPMGkJDh4lEd7pIGne4oLE3OLMdIjUKUZdjplf2w4wC7Hk5e
  elSonzhv8EKhIAKcoozYMbAYvtS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeSeATOHJzCu
  B2/QK6AgmoCN8HswBOaIkESEl1cDU+m6O1+EyZ2d+l6KD19qN1m+5lbn4BvOij4bbDrRGnbUv
  bE13P9CurWOeN587oXH9k1fz7xav/v0i3yxw/a93wrX16gGWqe8s9OIcblVpJb0+E5B76PzZa
  cu1dwrt/N+08bC52J1DrxcqbtXZnRySrfFqC+diD+WvFaua2N/v5Nj3zsBq/fLlv5fXGztGLJ
  PouMJ578qaw98MGw//Zs396yEVGSL34ufCWoElf3vuferN+bcj8P4ERdHXUfPu6xfVzmF3lH6
  y8XV11eYzFuwLHF5YNu5ZfcecgSlGvbBM+fwKvScpbWHfknbq7tujELFt4tXLW+cUXX9+QvT1
  xPfhaZ+LVELrmj867/XRC9VZpcRSnJFoqMVcVJwIADkW/MxoAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-585.messagelabs.com!1654520464!156848!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23320 invoked from network); 6 Jun 2022 13:01:04 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-14.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jun 2022 13:01:04 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id D59B58B88
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 14:01:03 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 99D168B89
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 14:01:03 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 6 Jun 2022 14:00:57 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] evolution-data-server: upgrade 3.44.1 ->
 3.44.2
Date: Mon, 6 Jun 2022 21:00:40 +0800
Message-ID: <1654520440-9439-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654520440-9439-1-git-send-email-wangmy@fujitsu.com>
References: <1654520440-9439-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jun 2022 13:01:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97430

Changelog:
==========
Bug Fixes:
	I#359 - CalDAV: Crash on calendar update
	I#386 - e-webdav-discover: Fails to find Radicale calendars within collection account
	I#388 - Google OAuth out-of-band (oob) flow will be deprecated
	I#389 - IMAPx: Fails to create folder with NIL folder hierarchy delimiter
	evo-I#1348 - WebDAVCollectionBackend: Removes sources on server error

Miscellaneous:
	ERemindersWidget: Allow width shrink for small screens
	Fix few memory leaks discovered by Coverity scan
	GOA module: Prevent ESource removal on D-Bus reconnect or registry reload

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../evolution-data-server/evolution-data-server.inc           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 8f5f6defe..78efee004 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -9,5 +9,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.sha256sum] = "6e05a90204a276f99d932097f1032cc17dd1d8e265c7c56727c63240fd4c0ccf"
-PV = "3.44.1"
+SRC_URI[archive.sha256sum] = "2ed72afe4d6bb170f8728faea0907fee10212dfde7a9fab82fbcc83d0f22f028"
+PV = "3.44.2"
-- 
2.25.1


