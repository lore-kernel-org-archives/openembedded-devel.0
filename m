Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E889EC761AF
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 03:05:56 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.26490.1679886350831676539
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 20:05:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WsXbsntU;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679886348; i=@fujitsu.com;
	bh=lQVzxRA0nReqeQZXnIPt0xL5ObeLnnbAn7EVbHMJLQE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WsXbsntUMspD2ol6Hw60HVtho6gKZuTPP3mu1E7bPLSofdTaH+mX+m8DU9I8vd40j
	 CQt3/asToI6oniyCvwe8UdzyXQ8IS8foOI1CRzm52O3zrYx9k2fAHBJ00WNrLYY7IO
	 cBZunTtrxVhIbV9IZtDjnbYgVzd0VbGDaGX59389+BuIwpw/W24fYcIOI3UWC/UhBi
	 FoIhO3DrKnX3ILufMoOBSFyGbB8cA3ijZkUpF3/r7gLxECaZWXtLc9zLGPuSPinH1N
	 ghdo6GJTi1Pjl4Z+s1C7HjjK3DbVjeKu6HvBTPu9OYi89QGm57jRJ5ahMhYdqxC95j
	 DiBTyk2anX4Kw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORpMvNoZh
  iMGuqlcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrH42WOWgi3cFU9/LmZrYFzD1cXIxSEk8JBR
  4taF7YwQzhUmiZUvfrNBOHsYJd7Nv87excjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  WA1wgJeEpt+NwHVcHCwCKhKLNrjBhLmFXCSOPp3MlirhICCxJSH78FaOQWcJT5/eApmCwHVXN
  u5gh2iXlDi5MwnLBDjJSQOvnjBDNGrKDH7cjMLhF0h0Tj9EBOErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo1lxalFZapGupV5SUWZ6RkluYmaOXmKVbqJeaqluXn5RSYauoV5iebFeanGxXnFlbnJO
  il5easkmRmDwphQnn93BeLTvr94hRkkOJiVR3mg3+RQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKE
  rwubIopQoJFqempFWmZOcBIgklLcPAoifCu+aWQIsRbXJCYW5yZDpE6xajL8eHQlb3MQix5+X
  mpUuK8n0BmCIAUZZTmwY2ARfUlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8rSBTeDLzSuA
  2vQI6ggnoiG8FYEeUJCKkpBqYur9ENk/7Vawlou3h+S2R5eXlortrKvyYv35N52jSL/FvDjuk
  ufPIovOPuprXis/dut3wR2xh+0rttUa7c6MkWy4dvCd7XtE6qXbbfdVTs2s8NvbOiC/8VSs62
  +v608gA8RIH6cO5Egsz/zzMK3ziPWf1edel8yL9KjLUdx5rv521J3Xm32Stg05f/LtzTf9O7Y
  /9fI9p/mzTppjebz3zt3UJXbY8+Ti0W5TbzcXpgE9+qG71QZ7arY+D566feflp5M/VW4/luPJ
  LvQt7yTHXfGEun3UZz4/5F6bwv4k/M1tf+1+mY/+rt5Jzv/VIzF9sp715G+O6fAND1ynCNzUD
  bHZP7PpkY6+YlvOpkPeAEktxRqKhFnNRcSIA4oKCgWUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-732.messagelabs.com!1679886347!152154!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18861 invoked from network); 27 Mar 2023 03:05:47 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-15.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Mar 2023 03:05:47 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 559BE1B0
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 04:05:47 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 4AE921AF
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 04:05:47 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Mar 2023 04:05:45 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-font-viewer: upgrade 43.0 -> 44.0
Date: Mon, 27 Mar 2023 11:05:21 +0800
Message-ID: <1679886322-20954-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679886322-20954-1-git-send-email-wangmy@fujitsu.com>
References: <1679886322-20954-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 03:05:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101762

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* The app now provides standard shortcuts like Ctrl+Q and Ctrl+F
* New widgetry allows for navigation via the back mouse button, alt+arrows, and touchscreen swipes
* Various buttons can now be used with mnemonics

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-font-viewer_43.0.bb => gnome-font-viewer_44.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-font-viewer/{gnome-font-viewer_43.0.bb => gnome-font-viewer_44.0.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_43.0.bb b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_44.0.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_43.0.bb
rename to meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_44.0.bb
index 130c26924..ff5e1e2c8 100644
--- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_43.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_44.0.bb
@@ -16,7 +16,7 @@ inherit gnomebase gtk-icon-cache gettext features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-SRC_URI[archive.sha256sum] = "81c6bffb06d5332346e00eaecaec1bdcfd617c51dfd95bcd058d6c76c76dd2b9"
+SRC_URI[archive.sha256sum] = "a1511df30b228cc2ef1175dd9d2b93438ea912e25913404b263cf3d457bb9f97"
 
 FILES:${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.34.1


