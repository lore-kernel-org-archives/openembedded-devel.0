Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368E0CCA47C
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 06:39:16 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web08.81290.1657003150561799401
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 23:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jqg0EZww;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657003149; i=@fujitsu.com;
	bh=NpUpryZLdR2MFr/4kxtfWpRK+57MJ8IvAnR7fH1sa5U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jqg0EZwwd2gll7nCIIcSb3cC3CYJ57PA61M34QqArrVOlAPlsroh/734L0yDFru7H
	 vCzTA1Hdd2/l0lcuEsY+k7z7PTgRJ8opTVwUwmy98cTRgofFs7xabWkeu4kPgTroyH
	 0bD8E9bbbpfDGjYTCrTSQsLbn0yb0hyLZYg0o6R+GToBB+HbEt2QfF+WNd8l/5KATC
	 bqmxTm/+5WnCf4PtPSyyfpoP3ps9LBXJ6NPGt1Oze5gsswCmeIR4bPPz+ZDUyybqXr
	 Kf5WznqKWs65ByWqqgZUSbzoyyjXMLzGfybDjbwKsZLwx5vCpg00tQ9lSqThPceJUo
	 Ihohba4odzkcQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8OxWbfnzuE
  kgw+zpC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxZ7z4yFjzhrvi6uJelgXE/VxcjF4eQwENG
  ifvTOxghnMtMEpf+bWOFcHYzSix4uRLI4eRgE1CTmH7rBpgtIqAvsXT2HmYQm1lAReLF7x52E
  FtYwFFi478ZbCA2C1C8cfU/sBpeASeJqes3MILYEgIKElMevgeLcwo4S7yd9RKongNomZPEwY
  ZSiHJBiZMzn7BAjJeQOPjiBTNEq6LE7MvNLBB2hcSMGdvYIGw1iavnNjFPYBSchaR9FpL2BYx
  Mqxitkooy0zNKchMzc3QNDQx0DQ1NdQ11jQzN9RKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1iitz
  k3NS9PJSSzYxAoM4pZjx5g7G1r6feocYJTmYlER5464eThLiS8pPqcxILM6ILyrNSS0+xCjDw
  aEkwct8BSgnWJSanlqRlpkDjCiYtAQHj5II74rTQGne4oLE3OLMdIjUKUZFKXHe3beAEgIgiY
  zSPLg2WBRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMy3UbaApPZl4J3PRXQIuZgBbfqDo
  AsrgkESEl1cC0/tVlITNVCwlXP+f3KSctX2w/xK3QuIVr1YGvTtNEazeXZz78dK/akCu/k/fL
  hGmWi5a9PNxzKKOm7mLAcj/Jd2+13s548XWmRJdD87Up1rMPO+2438pzuPBvDfOO/e+fTGUTN
  T934d5nl+LaG5dr5RSkLm/IuvQ9nan+TkBvBd+sDO0l8VHnr8q+rdiyMH9+7MxV3j1W9yST5m
  ZfPjrttRCfCv+1aUHnixUmCbEedvtxs2hqs5ZNVpNDmHxzn6XK9rbYhrc7mEV4+rv/6Pr3MNz
  Lm31RQqNAYMeMHyd+V9TV1h510u9pLZCUXXj7nNl1I4fcpglH+O9GbXqRKGDbtaE69fKF994P
  nNZmL4tXYinOSDTUYi4qTgQAnmbpkF0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-591.messagelabs.com!1657003148!205532!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24199 invoked from network); 5 Jul 2022 06:39:08 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-18.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Jul 2022 06:39:08 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 0F2B914E
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Jul 2022 07:39:08 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 025DD73
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Jul 2022 07:39:08 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Jul 2022 07:39:06 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gvfs: upgrade 1.50.0 -> 1.50.2
Date: Tue, 5 Jul 2022 14:38:36 +0800
Message-ID: <1657003117-14465-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657003117-14465-1-git-send-email-wangmy@fujitsu.com>
References: <1657003117-14465-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Jul 2022 06:39:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97711

Changelog:
==========
* smb: Rework anonymous handling to avoid EINVAL
* http: Unescape prefix to fix handling of encoded URIs
* build: Fix build without Avahi support
* dav: Drop user from URI as a workaround for Nextcloud bug
* dav: Port DNS-SD resolver to async API to fix hangs when mounting
* smb: Ignore EINVAL for kerberos/ccache login
* dav: Rewrite to libsoup async API to fix crashes
* dav: Do not lose userinfo when copying URIs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/gvfs/{gvfs_1.50.0.bb => gvfs_1.50.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.50.0.bb => gvfs_1.50.2.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.0.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.50.0.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
index 21d351a7b..e8d9f16de 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.0.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
@@ -12,7 +12,7 @@ RDEPENDS:${PN} += "gsettings-desktop-schemas"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 
-SRC_URI[archive.sha256sum] = "cbc2f564d2e9f00c760673f42d6803bce3e081ab7ffb4456deffffba9339b4dd"
+SRC_URI[archive.sha256sum] = "03d72b8c15ef438110f0cf457b5655266c8b515d0412b30f4d55cfa0da06ac5e"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.25.1


