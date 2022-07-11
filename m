Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BCCC3F2D4
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 08:45:19 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.26143.1657529108730967953
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 01:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VR2TTKB1;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657529113; i=@fujitsu.com;
	bh=HyDPuiRnucsfWjYiDJC+X5k5vWEHpcXnyJv38wgskC8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=VR2TTKB1cquMbZ35AqIa5J3FIgmZe9oVHdVXbMQ4av1iFx5Z4mniTrK91aa1veX6g
	 wsDypXG67+IP69hjMtjeIlEyu28y8wmfwfcXhyMRizHlMqqBuu0Ip3EB6/yn62gikC
	 uxEmx2LQd57no9TegNcYyv0EvBBY27fLbMWTwqG3Hz1u/0PiUYUOk9+g2Tm/hqH+xs
	 hsjCNdUH45KF2orAZhT2ZRgWn7yjFl0Dx2GQLdSrflUNZgkuQRlfCC6nfnLQsbbxKi
	 FUW8KAKGF+/RDOrZqAxuH2m5+Vj1+NS38+XmPpceFPgOfeJBwgIR85Ei7MucU2weca
	 hM78jZKyOSJcw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8OxWVfi8ek
  kg2PbTCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oz3PQdYCtbzVry6p9HA+IK7i5GLQ0jgIaPE
  nscLmCCcK0wSK4/tZoFw9jBKbFp4lLWLkZODTUBNYvqtG2C2iIC+xNLZe5hBbGYBFYkXv3vYQ
  WxhAVeJ5fu6weIsAqoSH7p/gsV5BZwkvrb0sIDYEgIKElMevgeq4eDgFHCWWPgCrFwIqKT9YQ
  sTRLmgxMmZT1ggxktIHHwBUSMhoCgx+3Iz1JgKiRkztrFB2GoSV89tYp7AKDgLSfssJO0LGJl
  WMdomFWWmZ5TkJmbm6BoaGOgaGpoCaWNdQxNzvcQq3US91FLdvPyikgxdQ73E8mK91OJiveLK
  3OScFL281JJNjMBATilOn7yD8dK+X3qHGCU5mJREeYVPnk4S4kvKT6nMSCzOiC8qzUktPsQow
  8GhJMEr8xAoJ1iUmp5akZaZA4wqmLQEB4+SCO/VE0Bp3uKCxNzizHSI1ClGXY6ZX9sOMAux5O
  XnpUqJ854BmSEAUpRRmgc3AhbhlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ84Y8AprCk5l
  XArfpFdARTEBHxKWcADmiJBEhJdXApPzu/5TT0dda751Uiolmi9xX6di8gFX1U2ZFy8Wc+zel
  lJZ/3OqgfWuhXaPQqmWGBspvHWfNv8J7IO5Z9vd1BnM+2DTlvw0zDc/f03htCdfOgu7Ll+fE+
  qQ07Zs2zXt3rhHD1/aFoq+CbjqV6U69zZe7q65yreeFLv9jMxZmH3WLXXybWf4Vk5+l89OS0F
  bn+w/69y0u4au0tv8XwBm0Ukxt9ZWQSeETPruYO5fXfPuzYpnm6bhtkYcXCj1Rv7gndsHq1ou
  f3k91XzJF5qe55donLNXaG9g+BPC4OP9LZP/Dt2kDuxjni+vKO6dKMnwoUl56JfzQIfPv0zsY
  mH3lmrdbaC5mS1ie9G3+5hfmu5RYijMSDbWYi4oTASPKYa9rAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-732.messagelabs.com!1657529112!144837!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 644 invoked from network); 11 Jul 2022 08:45:12 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-8.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Jul 2022 08:45:12 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 40B6C151
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 09:45:12 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 33F78150
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 09:45:12 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 11 Jul 2022 09:45:10 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libadwaita: upgrade 1.1.1 -> 1.1.2
Date: Mon, 11 Jul 2022 16:44:43 +0800
Message-ID: <1657529083-24142-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657529083-24142-1-git-send-email-wangmy@fujitsu.com>
References: <1657529083-24142-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Jul 2022 08:45:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97804

Changelog:
==========
- AdwLeaflet
  - Fix child sizing with fold-threshold-policy=natural
- AdwStyleManager
  - Correctly handle removing a GdkDisplay
- AdwSwipeTracker
  - Fix a memory leak
  - Fix high contrast setting name when using a portal
- AdwTabBar
  - Fix middle click when inside GtkWindowHandle
- Stylesheet
  - Fix action row title and subtitle inside GtkHeaderBar
  - Fix progressbar.osd overriding text color
  - Ensure active states consistently work with touchscreens
  - Fix GtkDropDown visual glitch when pressed on touchscreen
- Translation updates:
  - Chinese (Taiwan)
  - Nepali

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libadwaita/{libadwaita_1.1.1.bb => libadwaita_1.1.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libadwaita/{libadwaita_1.1.1.bb => libadwaita_1.1.2.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.1.bb b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.2.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.1.bb
rename to meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.2.bb
index 8ca3be352..3ae740ee2 100644
--- a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.1.bb
+++ b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.2.bb
@@ -11,7 +11,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gtk-doc vala features_check
 
-SRC_URI[archive.sha256sum] = "491169d4f6a11765328996bc088272d05c7235453bc0ee73c20dfd4bd67b401c"
+SRC_URI[archive.sha256sum] = "2b5ca4104c21a36e31f900ef117ab887dd9d471f6a65d2ba374ce0339314219f"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.25.1


