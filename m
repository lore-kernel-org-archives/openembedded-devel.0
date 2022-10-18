Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7CBC4332F
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:16:06 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.1820.1666055760650073863
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 18:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dLGTz3lN;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666055758; i=@fujitsu.com;
	bh=c3SN6r8fCQ5x4Isb2Cw+YUZ9x8DmdPjXc3AjuSSuQhE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dLGTz3lNiZVfpmPxQBLTpoM95gpVAvwofpTOnOjCFGBC72i6dZIr/BGQaWP0HlF7a
	 /lgcGvN2RkcfTPk5V3HgyMxZjmnF2Mgn2wCrD9/zYeuvMM+VXhEZ75wsTUPBMhKUY3
	 7VvvJ5LCNNQ7kqVkxd/TQwN4qJwwCFFtXaFFaVUKOVtSGTFcqo3iKa+MHFOA0enI2a
	 RkbhOJ8iBd0Cvf0BXiAPI23Guk9z3afmOnSvI6bzpVe8ieR6ynlbds//1cNsJQdFFc
	 7pumshe2yQD4/V+DfYGZkMVqJ83cmskDlRXEFXvM9+3OqzvEUJYKQW+HeSNMdgOjFC
	 aKV+61sS2ppbA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxSdfvn2+
  yweH7TBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bL0feMBZ/ZKzY9mc/awDiNvYuRi0NI4Amj
  xKbdz1ggnOtMEosP9bBBOAcYJV7N6QAq4+RgE9CVePFjMQuILSKgL7F09h5mEFtYwFaiaUIzW
  JxFQFViQk8fmM0r4C4x5cl/JhBbQkBBYsrD98wQcUGJkzOfgNUwC0hIHHzxAijOAVSjKDF7uj
  xEeYXErFltUK1qElfPbWKewMg3C0n3LCTdCxiZVjGaF6cWlaUW6Rqa6iUVZaZnlOQmZuboJVb
  pJuqllurm5ReVZOga6iWWF+ulFhfrFVfmJuek6OWllmxiBIZdSnEC9w7GR8v+6B1ilORgUhLl
  7ZjhmyzEl5SfUpmRWJwRX1Sak1p8iFGGg0NJglfrD1BOsCg1PbUiLTMHGAMwaQkOHiUR3qgzQ
  Gne4oLE3OLMdIjUKUZdjplf2w4wC7Hk5eelSonzngWZIQBSlFGaBzcCFo+XGGWlhHkZGRgYhH
  gKUotyM0tQ5V8xinMwKgnzcoBM4cnMK4Hb9AroCCagIzL2e4EcUZKIkJJqYJocVcY957fJ3QI
  B9vBkodtMM657bJ8Uvf+ZoM6UHYoG5p/elzDl/vwXvfDsV+HUi2eD/UTve4fe8Q+98ePr3r5V
  Fzlz40rCQh7t2/7i000TKSGNzAdxqya+++onEakitctm5p93txV0JsyK1f6cq9C+z15I/l5p2
  YGiR7K3S7uLP/h11in8tXfY2abYUd76jnnf+nu5pVHNbbN71rEoaO4IVuw3e5/W/frmoSh1ub
  XXxbw7Tkalam7as+p1lkCFVPOqYNO/N5Sequ30abv6LZpBoqjyisLpH/2pi9/NkV2S+1ij4cI
  HxRPLOYWt+aoYPPxLv/yZsGKbaZNaxKQ80+O98lejSgRWXnbyneh4U4mlOCPRUIu5qDgRAG6Q
  f+ZCAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-728.messagelabs.com!1666055757!231131!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27291 invoked from network); 18 Oct 2022 01:15:58 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 01:15:58 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 76D4B1000CC
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:15:57 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6A4B1100078
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:15:57 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 02:15:56 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-gnome] [PATCH] yelp: upgrade 42.1 -> 42.2
Date: Tue, 18 Oct 2022 09:15:47 +0800
Message-ID: <1666055747-2431-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 01:16:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99227

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-gnome/recipes-gnome/yelp/{yelp_42.1.bb => yelp_42.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/yelp/{yelp_42.1.bb => yelp_42.2.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp_42.1.bb b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/yelp/yelp_42.1.bb
rename to meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
index ab8b9c37ba..fe3b1105c4 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp_42.1.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
@@ -9,7 +9,7 @@ inherit gnomebase itstool autotools-brokensep gsettings gettext gtk-doc features
 # for webkitgtk
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.sha256sum] = "25b1146ab8549888a5a8da067f63b470b0f0f800b6ae889cacd114d01d713b41"
+SRC_URI[archive.sha256sum] = "a2c5fd0787a9089c722cc66bd0f85cdf7088d870e7b6cc85799f8e5bff9eac4b"
 
 DEPENDS += " \
     libxml2-native \
-- 
2.25.1


