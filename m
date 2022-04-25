Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17508C47096
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:13 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.26609.1650871900946510812
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 00:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=f7T3jBvO;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650871899; i=@fujitsu.com;
	bh=hX87dVICjM+TPkrdMDGNLO8TD6re/+YMMw3UAkOhRPk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=f7T3jBvOQZ2JkIko6xvbdMWuAxVsiW6MsGsg3VKP6XmZyLJElu3XW1rGUScqrTsn3
	 z/WpKK1uCLhCkrmLIdW12FP+10oJ8iPFaboKjWADYguxFyWDOkgciqkGL7B3OL4sjX
	 JUzYZABZrPfm/M9EPzWj91ZnbnTgBM5nbFwXq+PHukrA4w4B2GLKtj7RKwe1Y1KQO7
	 aVvg3NIXhb/DhhPUOvraioGgvdLcTOxVaioniGfGYtQ+dV5ZgYfsNX0TD0beSV4srW
	 idskYMSJwBRT/Gv4lIYR9Fw4brKvaybc7fVp+x/gXjnnoxN9gZgVLou4ltYU15wUt2
	 j+ayQzv0QUUYw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFIsWRWlGSWpSXmKPExsViZ8ORqBvll5Z
  ksOmHicXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtE+4RFTwTPeik8vu1kbGKfwdDFycggJPGGU
  eH5Qv4uRC8i+wCRxedlzVghnD6PE3D972EGq2ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7B
  6xGWMBV4nvPdbA4i4CqxNT/CxhBbF4BJ4md39+xgNgSAgoSUx6+B6vhFHCWuLj8IRvEFU4Sex
  tes0DUC0qcnPmEBWK+hMTBFy+YIXoVJWZfboaaUyExa1YbE4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjXVJRZnpGSW5iZo6uoYGBrqGhqa6Zua6hmZleYpVuol5qqW5yal5JUSJQWi+xvFgvtbhY
  r7gyNzknRS8vtWQTIzCYU4qdl+1gfNf3U+8QoyQHk5Io7z2TtCQhvqT8lMqMxOKM+KLSnNTiQ
  4wyHBxKEry7fYFygkWp6akVaZk5wMiCSUtw8CiJ8KZ7A6V5iwsSc4sz0yFSpxh1Of5++ruXWY
  glLz8vVUqc970PUJEASFFGaR7cCFiUX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzJsOMoU
  nM68EbtMroCOYgI74VJsKckRJIkJKqoFp7apbsolPjV6pzOHTuvj7FYdm1L9ye8YP7Q0tVuFf
  woOl7lfxztNT37uX7e329fvrL+yxezG3w6p9yXWdfQoGM+aKX1nwOPrVE4+vOb+q00x0S09Wf
  dJ0eLM4MWeOlee8+DjTC0GMyoyiP8UeL9+4X776aPUkzhm8N/q5ktVTTcRr1vxMKRPYmy+xeV
  eZylI2J8PZph5hjw5O7fs9y3GNx/eyC0u5k8PXHec+pv1XVG5eUegRtbnPA6NL+optHu9Rzbq
  SuVBcxfBwmN+R5TnejN95BTee6vmjd/1Uaoj6wmUN75ddux/27YnRdn5nbbmn3DZz113c/cZm
  8We7dTs2se51dGpfF1A6L9/QmLlCiaU4I9FQi7moOBEAr/uGxW0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-532.messagelabs.com!1650871898!131776!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32419 invoked from network); 25 Apr 2022 07:31:38 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Apr 2022 07:31:38 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 43E931001A3
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:31:38 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2B48F100192
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:31:38 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 25 Apr 2022 08:31:27 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libadwaita: upgrade 1.1.0 -> 1.1.1
Date: Mon, 25 Apr 2022 15:31:14 +0800
Message-ID: <1650871876-31392-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650871876-31392-1-git-send-email-wangmy@fujitsu.com>
References: <1650871876-31392-1-git-send-email-wangmy@fujitsu.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/96768

Changelog:
==========
- AdwAvatar
  - Fix initials not updating after setting custom-image
- AdwSplitButton:
  - Avoid state changes during dispose
- AdwViewSwitcherTitle
  - Clear pending idle callback on unrealize
- AdwPreferencesGroup
  - Annotation fixes
- AdwPreferencesGroup
  - Annotation fixes
- AdwTabBar
  - Ensure indicators are clickable with inverted=true
  - Fix resize deferring with non-expanded tabs
  - Fix scroll animation stopping too early
- Mention AdwComboRow:selected type in migration guide
- Fix a Meson error when using as a subproject
- Translation updates:
  - Abkhazian
  - British English
  - Bulgarian
  - Catalan
  - Dutch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libadwaita/{libadwaita_1.1.0.bb => libadwaita_1.1.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libadwaita/{libadwaita_1.1.0.bb => libadwaita_1.1.1.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.0.bb b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.1.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.0.bb
rename to meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.1.bb
index d4820d1244..8ca3be352e 100644
--- a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.0.bb
+++ b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.1.bb
@@ -11,7 +11,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gtk-doc vala features_check
 
-SRC_URI[archive.sha256sum] = "aff598803e810cc28266472cf5bf65e5ed5b90bb3523e206b06b14527325010e"
+SRC_URI[archive.sha256sum] = "491169d4f6a11765328996bc088272d05c7235453bc0ee73c20dfd4bd67b401c"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.25.1


