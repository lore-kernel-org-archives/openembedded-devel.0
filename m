Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFA4C7619A
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 03:05:56 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.26486.1679886348054183992
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 20:05:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WzgCsweK;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679886346; i=@fujitsu.com;
	bh=KCW03FmMKwNlKxyFrKWpVQEcNUBLFwFgLKq/mCJsKaw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WzgCsweKIWs7N+owN+uy6sRNckmTShxwtgk+wnYeH3iURaNixbVeGckUy3OH5ecAe
	 byqfV0BwDVKXZuFzwBI8LqrS/6R8S6y+TgBBLzF/jZoztbPmiZzHNP1+nVKhGr3agA
	 2u1xUcfjKOmCO4jMT0TNC41KTQjQz4CSwp4LUDUJHoGRN98hPBIe9yR0UXVqFVS/5t
	 rJglG5nnPHO8jO+WQSG6xSZ7s4OTNai8qHlqRD93hgK/D3jC9kR/X5HkK5RvYe2VdY
	 r6PMdCeNpGgbgrbWzD5ymsh0+tEGfkiERqTp5OGGvXnNE39ZWQtR2wAopqK0paELEM
	 wt9+mOCQUzwJw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8OxWZeTQzH
  FoP2ajMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvH0g17BPq6Ks8vvsDQwHuLsYuTkEBJ4yCix
  d6VoFyMXkH2ZSWLxn8esEM4eRonGNX1sIFVsAlISN+7/B7NFBPQlls7ewwxiMwuoSLz43cMOY
  gsLuEs0zb4OVsMioCpx+uoEsDivgJNE7527rCC2hICCxJSH78F6OQWcJT5/eMoMcYWTxLWdK6
  DqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2BUSjdMPMUHYahJXz21insAoOAtJ+ywk7QsYmVY
  xmhanFpWlFuka6SUVZaZnlOQmZuboJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To5aWW
  bGIEBm5KMVv3Dsb1vX/1DjFKcjApifJGu8mnCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgdWFTT
  BESLEpNT61Iy8wBRhFMWoKDR0mEd80vhRQh3uKCxNzizHSI1ClGRSlx3k8gfQIgiYzSPLg2WO
  ReYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM2woyhSczrwRu+iugxUxAi78VgC0uSURISTU
  whUusP7BVLfDn9O9zBPJca4Lsv++S6pOwntZoa3Cya8bLx8vzo82ffVc92r36d48EV8V3z+DX
  p66L+d1bL8LQmpU3fUZFlcxm1seLO3W/KalH9B60njTHv3vH6ju/y7w274/YrsBcvP92XcqcF
  05src8nGWTOClYQfd0slJOqH73bS1zmwjlry4sO5Te9PdyyxdnyP2teuSX3TNBYxC5v8rqdPO
  tTAyKav6mdDj0ZJVMUbCuSp9B95z4n24GZM6dbiwhNscnW3RJgMDnbbN531Z+2kWl1Dp7cRjK
  uPNOtla2mH3iygDdgWpHqvrSN7mc5e2pu3PjDvPjWyviCcpX0SbUH9HRZX747uC83Y5ISS3FG
  oqEWc1FxIgBdwgW8VwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-587.messagelabs.com!1679886345!418684!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9257 invoked from network); 27 Mar 2023 03:05:45 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Mar 2023 03:05:45 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 1BC98142
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 04:05:45 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 078B87B
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 04:05:45 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Mar 2023 04:05:43 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-autoar: upgrade 0.4.3 -> 0.4.4
Date: Mon, 27 Mar 2023 11:05:20 +0800
Message-ID: <1679886322-20954-3-git-send-email-wangmy@fujitsu.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101761

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Add application/zstd to supported mime-types
* Fix test suite failure with recent GLib version
* Add autoar_extractor_set_passphrase function

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-autoar_0.4.3.bb => gnome-autoar_0.4.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-autoar/{gnome-autoar_0.4.3.bb => gnome-autoar_0.4.4.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.3.bb b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.4.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.3.bb
rename to meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.4.bb
index 017d67b5a..29aeef1ad 100644
--- a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.4.bb
@@ -14,7 +14,7 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 inherit gnomebase gobject-introspection gtk-doc vala
 
-SRC_URI[archive.sha256sum] = "7bdf0789553496abddc3c963b0ce7363805c0c02c025feddebcaacc787249e88"
+SRC_URI[archive.sha256sum] = "c0afbe333bcf3cb1441a1f574cc8ec7b1b8197779145d4edeee2896fdacfc3c2"
 
 do_compile:prepend() {
     export GIR_EXTRA_LIBS_PATH="${B}/gnome-autoar/.libs"
-- 
2.34.1


