Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC491C63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:18:32 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.191274.1673939909129409821
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:18:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uMKYM4J0;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673939907; i=@fujitsu.com;
	bh=1NNFnoIbYbKhEciDxc60fQYaCcOrIfYtCvzxThCoF7w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=uMKYM4J0d7UK9kExSm6RRNbtybODFb/1vuP16lxh9+11ISiWdi1rNW7qprk0lX4tl
	 0AiCDJ8RZu3omdZ3zbxEAg6VrNVfMc18hQvuSrECz8UTfxSUfpl4toq0qia27V+hs8
	 t/HPG7U8Ztncm2dKDwwGnSMOfemvgQHs354mLpJqmmQ8CMvfPF2Xn0ktkIQdz2WLkd
	 Gx5Jk+qB/Hj9ebQH46PUrBeWlPsYPG9/hv9xZLbXgSfvLj9bQZBN4pO3BoU+jF5mwT
	 Furh1pE0Fc08kpSYbEaSglM/usovnyW0DyKtJpX5XWoXMrK0wCgBz719hHvdx0VR0/
	 YJ3ZhkE7nIVPw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8ORqHvI+1i
  ywZ0p5hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aKb98YC3bwVUw6+oaxgfEgTxcjF4eQwBNG
  iUv7L7NCODeYJLbNngrkcAI5exkl5jcIgthsAlISN+7/ZwOxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILCzhKnO9aB2azCKhKbPizAMzmFXCSmL/iNxOILSGgIDHl4XtmiLigxMmZT1gg5khIHHzxgh
  miRlFi9uVmFgi7UqL1wy8oW03i6rlNzBMY+WchaZ+FpH0BI9MqRtPi1KKy1CJdI72kosz0jJL
  cxMwcvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwUvbzUkk2MwFBMKWaZvYOxZ+kfvUOM
  khxMSqK8J02PJQvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4D3lBZQTLEpNT61Iy8wBxgVMWoKDR
  0mEN9wSKM1bXJCYW5yZDpE6xajL8eHQlb3MQix5+XmpUuK810BmCIAUZZTmwY2AxeglRlkpYV
  5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8TzyApvBk5pXAbXoFdAQT0BEeJUdBjihJREhJNTCt4Op
  +d+4ONytP8qIPb/t+iuxeEF4XuOTBq6NxgpuVcqxu2cz7t4Sp58lMpamhSpteezz55CUnkjVV
  3lh18qzd0Xa2m6L65Hwfymbc1eBf5p3Pctstw2+PxBHvTuW+o35iHp5W8zdn7M7ampeQ/b5+2
  46ZM+v2fTVY48egIGts3Wb8Ze+TMwsO5F/00fmh8Kfd7suGdydavXk6nl9gv7Layf/cSnPdmz
  c2FbOZdLCt97k56dBidsmFej6PZnmGe99+mTd5pcX/LYeXby+6skVtEvs2Af+H+7/aebm/ttP
  lslm6pVXWY9LLN1Ib7IXEglQfHhP/4Zspq9914Vb4lHkVs4TXVBgeOfw3fuLjtP65SizFGYmG
  WsxFxYkAHJUgu0wDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-587.messagelabs.com!1673939906!382552!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1306 invoked from network); 17 Jan 2023 07:18:26 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-21.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:18:26 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 82968100194
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:18:26 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 7610210018D
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:18:26 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:18:24 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] nautilus: upgrade 43.1 -> 43.2
Date: Tue, 17 Jan 2023 15:18:12 +0800
Message-ID: <1673939896-20171-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100604

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Regressions addressed:
  - Launch search from shell correctly
  - Make nautilus-autorun-software work again
  - Restore 2-dimensional navigation from sushi
  - Resolve stuttering scrolling
  - Reintroduce 64px icon size for grid view
  - Show full filename again in grid, using tooltips
* Other bugfixes:
  - Avoid a many crashes
  - Show rename error dialogs again
  - Handle X11-only drag-and-drop quirks
  - Allow autorun.sh without executable bit
  - Improve selection-setting
  - Restrict DND actions over drag source
  - Focus replaces files
  - Improve keyboard focus navigation on the new views
  - Stop blocking on the tracker connection
  - Don't add missing emblems 
* Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nautilus/{nautilus_43.1.bb => nautilus_43.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_43.1.bb => nautilus_43.2.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_43.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_43.2.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_43.1.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_43.2.bb
index a567e5fe7..4b54d6a67 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_43.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_43.2.bb
@@ -26,7 +26,7 @@ inherit gnomebase gsettings gobject-introspection gtk-doc gettext features_check
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "0da1003c0cda08ac0546a4c143ed3a1697e36823c60fa73f4d2f4da7723bccaf"
+SRC_URI[archive.sha256sum] = "a86a9aa7a455511b029ce49a1d8b4659c3c355b5d81d7360bb4d0de637afede0"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-- 
2.25.1


