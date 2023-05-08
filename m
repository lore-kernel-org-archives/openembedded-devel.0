Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8AEC7EE23
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:25:38 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.103915.1683541537226304955
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:25:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gDbPjE25;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541535; i=@fujitsu.com;
	bh=G7hRH17xlvzb6zaYzTykGdiYpnGtG8zTxbLLRMweQj4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=gDbPjE25diyZd/I8kDLSzc5S/wKFh6OG4OqyztsO9O7BMd5M8zdF10mnKl2cv1Eey
	 bWhKjbRXjEEzpQN0OCbVOpg4ygfrzXyLJPEccO29xDAurIXfPZsQ6bLQ/u4CJnEOwm
	 4ZwGG9gVQojf+2CBrr210cjac2AC8z7NxleQangVqRsLo6aC9+TFGMTImVtyqTBm+d
	 hvT5xUUK7eDM83668m0R/NmegAbLkk1qChLrL7GZ4Oz3InsIYHwkficKfIdqX8mn3e
	 lxAV8FOOng5Hf4f0iI31XF1T2wset8xnyd7Uef4+v6dizJR1AXjvVEb4NEPUGN/QRN
	 OaFkqKu1zgenA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHLMWRWlGSWpSXmKPExsViZ8ORpCt3LiL
  FYOc0c4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePRgS72glbuioMrNrI2ML7m7GLk4hAS2Mgo
  MfPbGiYIZxqTROOz3yxdjJwcbAISEtP3nmQHsUUEdCU+fpjLCGIzC6hIzJh8BKiBg0NYwEmi5
  5s8iMkioCox4703SAUvUHTJ3JtgnRICChJTHr5nBrE5BZwlJh1dzwJSLgRUs/F8NESJmsTVc5
  uYJzDyLGBkWMVoWpxaVJZapGuhl1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6iXWF6sl1pcrFd
  cmZuck6KXl1qyiREYDCnFbE47GCfu+qt3iFGSg0lJlNf0YFiKEF9SfkplRmJxRnxRaU5q8SFG
  GQ4OJQlel9MRKUKCRanpqRVpmTnAwIRJS3DwKInwyh4BSvMWFyTmFmemQ6ROMSpKifNuPQOUE
  ABJZJTmwbXBouESo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHetLNAU3gy80rgpr8CWswEtN
  j/cjjI4pJEhJRUA9P8I1+77NQCF+ifSj7wZBrfjGk1fL6xs29JLfQxCZmkHSX+5QrLrHa3o05
  Kb5deLUjTeGm552z/xbIVMqY71LoLFjEUnT6e5jTtbCOL0uWuxdfnnhD+sNlx7azd1b+rXe59
  KDvq8+lO5PKHKx6v/qS8nkVhXbPOpEtPH5iXiSmXZrz/5ccWs+WlEo/v6lPfC1uDBXmcXtzNN
  ZjgpbXFYe/N/MX7L/3pWa4h9uP1LYXbflnac00mBxStP3X6DbOmlvufjr2Wy/k2ycRNqw64WD
  q9Z9ts30ddrmKLN23xdGEtknpvvzX5x78/Z/6cebj0ymZ1WbHSz0c7NSYcymY7sPYdm/xS4Vv
  K3e57rc9Gr1+UqMRSnJFoqMVcVJwIABbPEXsBAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-587.messagelabs.com!1683541534!267724!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26908 invoked from network); 8 May 2023 10:25:34 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:25:34 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 7EC6F1D4;
	Mon,  8 May 2023 11:25:34 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id A60DE1C2;
	Mon,  8 May 2023 11:25:33 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] tracker: upgrade 3.5.0 -> 3.5.1
Date: Mon,  8 May 2023 18:25:21 +0800
Message-Id: <1683541521-25835-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683541521-25835-1-git-send-email-wangmy@fujitsu.com>
References: <1683541521-25835-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102435

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  * Reintroduce order/distance independent handling of
    FTS terms.
  * Documentation improvements
  * Do not prune too early content of failed batches for
    error processing purposes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tracker/{tracker_3.5.0.bb => tracker_3.5.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.5.0.bb => tracker_3.5.1.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.5.0.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.5.1.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/tracker/tracker_3.5.0.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_3.5.1.bb
index 6b0e75b558..8489043924 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.5.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.5.1.bb
@@ -22,7 +22,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion features_check python3native
 
-SRC_URI[archive.sha256sum] = "13294275dbbbad9634b3a8390c08e6f12bebfe84f6ccafb72b27b0c23ba8da2f"
+SRC_URI[archive.sha256sum] = "f972d50ac7bafdccf113b1eb99dcae35404685a99e55bfef16f3ac83b4de974d"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.34.1


