Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0855FC3A5A7
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:13 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.26659.1650871805636422043
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 00:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sOqFNRUf;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650871803; i=@fujitsu.com;
	bh=Lvcb+6e9Dug4Ei2kUvI2G5mhhRpWdFbQhZe9BTF5N4M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=sOqFNRUfgqzMHg5i8Wbm3Oe719IoRcIE8spTzPVTuj09gmT3I6U5bLlriQm0a0uRX
	 K+xd7VQYPwlazbqFR3jYl9VsoHXOzsP7sGglMEhLV9foXK5nzRnpSxFwoO4oEJT07E
	 X30YzV4gqZQ4RBLWnB9po3O7/e4Zm54ANsMMK1Kdi6LTVBgydLKaFzTzMmQ9LhQ55H
	 GAzyJWwpwhHCJzWkW+YbV7upnY2A0cn1vQSkYf47c2rMaPKlh2Wf+jez56uz3wweO4
	 ieY4oLw1t1FogqUi3/eJDFQ3On40aAUQx2oMCAe707roViuU9O2CtoUaSJMQwRb4Ox
	 ItEL84F/5mgww==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8MxSfe3b1q
  SwfKtAhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b5mQ9YCz6zV/x8+56tgXEFexcjF4eQwBNG
  iYPzL7BAOBeYJJ6sXMoM4exhlOh4uYapi5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGGBIIl1G7aD1bAIqEqsnHIfrJdXwEnixJ7tbCC2hICCxJSH78F6OQWcJSY0XmEBsYWAan
  7M+sEGUS8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKukJg1q40JwlaTuHpuE/MERsFZSNpnIWl
  fwMi0itEuqSgzPaMkNzEzR9fQwEDX0NBU18xS19DUTC+xSjdRL7VUNzk1r6QoESitl1herJda
  XKxXXJmbnJOil5dasokRGM4pxa5zdjBe6Pupd4hRkoNJSZT3nklakhBfUn5KZUZicUZ8UWlOa
  vEhRhkODiUJXi4voJxgUWp6akVaZg4wtmDSEhw8SiK86d5Aad7igsTc4sx0iNQpRkUpcd5CH6
  CEAEgiozQPrg0Wz5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfOmg0zhycwrgZv+CmgxE9D
  iT7WpIItLEhFSUg1MB/e8LC9QdH51/cWt/q0qYaeNt7d9sz3+Zbv5vkPZUy9FtBW4L5twLWgR
  fxNjbuS74t/vGZg3/JX9fKcue8otoU+b5gn+umX+MJuR5c+bS5Xtt7e+Xif7chX7TOcL/R9tT
  5o7r5zqMOFUbEWArtHsuDdd77fMXbW4w6TUde8v99SlYUt73whM+Sriuu3c650SvG+rwsxCA/
  /8LepNzXb/tvjT7t0bLsa9uRj5T2/Dc3P20kj/fMce/v+n3P6vYMiqereWTf7i3ht/VnbYJjw
  qeHa6M1pSl/vI5eI463s/GNfuLHCccsSs/iq708mmr6fPTVy0JCDsbaP7r9v+JmVta1ny/bOe
  iVm0iYtE3Uv3OarEUpyRaKjFXFScCABbKY6FYgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-545.messagelabs.com!1650871802!123486!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11125 invoked from network); 25 Apr 2022 07:30:03 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Apr 2022 07:30:03 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id AB3B210046B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:30:02 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 83A2E100451
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:30:02 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 25 Apr 2022 08:29:51 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] evolution-data-server: upgrade 3.44.0 ->
 3.44.1
Date: Mon, 25 Apr 2022 15:29:34 +0800
Message-ID: <1650871776-31335-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650871776-31335-1-git-send-email-wangmy@fujitsu.com>
References: <1650871776-31335-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96764

Changelog:
https://download.gnome.org/sources/evolution-data-server/3.44/evolution-data-server-3.44.1.news

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../evolution-data-server/evolution-data-server.inc           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 81b02914d2..8f5f6defe0 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -9,5 +9,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.sha256sum] = "0d8881b5c51e1b91761b1945db264a46aabf54a73eea1ca8f448b207815d582e"
-PV = "3.44.0"
+SRC_URI[archive.sha256sum] = "6e05a90204a276f99d932097f1032cc17dd1d8e265c7c56727c63240fd4c0ccf"
+PV = "3.44.1"
-- 
2.25.1


