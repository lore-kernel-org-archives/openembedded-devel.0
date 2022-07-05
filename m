Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B9DC433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 06:36:56 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.81192.1657003007710131055
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 23:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ILb8/Vga;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657003010; i=@fujitsu.com;
	bh=z3tDezfCn6lFs4sDrvfS2XrQrTozl8a2GZ7gyxLV0G4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ILb8/VgavCxRnImLprFb8GUTdKz3zBgA40kH3AtwOX/GD55HFih6YmYH2bvQ7Qqla
	 8hUbSfFu44zAWvJ4UXw8Smo+xZy28azc15UICup/kWnW/kyb+IUiFGuJojLgm0s40L
	 CrB7eRbGpVMBk1a+KaAmqi//vNu6cKFStvIl5+DlOL0BwSFU09ED0MwCkprLDsY5y6
	 nWhqi3WfJhrJlNCts8O9lCHvuvBSCYnUsmHl6WCETZWo3euO6qju0Ev4b4yUm1IxDt
	 laHldwSe9cg6lcgs1YG2Z5dyxyPJ/OyW5posuVth1ZyQsOI/tsmWSjqxXA7rwXtT37
	 GWL/IoJ0AO+sg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8ORqMt453C
  Swca3WhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b/A+9ZCn5zVpzrN25g7OLsYuTiEBJ4wigx
  43UTM4RznUni+redjBDObkaJ5WumM3UxcnKwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPe
  xcjB4ewgIfE+8XGICYLUPjaZnaQCl4BJ4ktCy6wgdgSAgoSUx6+B+vkFHCW2LepFywuBFTz8s
  YBJoh6QYmTM5+wQEyXkDj44gUzRK+ixOzLzSwQdoXEjBnboGaqSVw9t4l5AqPgLCTts5C0L2B
  kWsVolVSUmZ5RkpuYmaNraGCga2hoqmuga2RoqpdYpZuol1qqW55aXKJrqJdYXqyXWlysV1yZ
  m5yTopeXWrKJERjAKcUM13cwTuz7qXeIUZKDSUmUN+7q4SQhvqT8lMqMxOKM+KLSnNTiQ4wyH
  BxKErzMV4BygkWp6akVaZk5wGiCSUtw8CiJ8K44DZTmLS5IzC3OTIdInWLU5fhw6MpeZiGWvP
  y8VClx3t23gIoEQIoySvPgRsAi+xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd6/14Gm8GT
  mlcBtegV0BBPQETeqDoAcUZKIkJJqYKq7xXxjJf+hW05HdzWf6tx7gJslUkz7SP6DKd2fHvpr
  al6se3t724Najepl+0tlWQzO/b6tqtg0ofxA0i6Tn0+dVhitTgl/pLebm9OL++3mt+uLK91Oa
  1d6nYpyv2ws93H1he71zw25Jh0qO6H95pGQsLmM1heG5RXzlBg0l7406L09l3PNkhvPqx/mFv
  9gj5CdVVFbpX/rpvZqpq5V0719s3T13Z1WlvJsvu+62qrRbR7LxpdnPt77obNt6ZW3yqeCrty
  KF7ne9jf2/kO/rPtR+quW/bfpuabAuPvoJX33t8033LuLly9ZckNSfcK6jVJr2x4wTwsO3yPH
  YaIttuy6gLyilEaC99lS+cinJzcosRRnJBpqMRcVJwIAxH0AV2cDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-591.messagelabs.com!1657003009!205525!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32729 invoked from network); 5 Jul 2022 06:36:49 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Jul 2022 06:36:49 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 49206100043
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Jul 2022 07:36:49 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3C863100193
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Jul 2022 07:36:49 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Jul 2022 07:36:47 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-bluetooth: upgrade 42.0 -> 42.1
Date: Tue, 5 Jul 2022 14:36:20 +0800
Message-ID: <1657002982-14427-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657002982-14427-1-git-send-email-wangmy@fujitsu.com>
References: <1657002982-14427-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Jul 2022 06:36:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97705

This version fixes the display of devices with '&' in their names, and contains
updated translations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-bluetooth_42.0.bb => gnome-bluetooth_42.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_42.0.bb => gnome-bluetooth_42.1.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.0.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.1.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.0.bb
rename to meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.1.bb
index 36fe9cf21..3cc675ce4 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.1.bb
@@ -26,7 +26,7 @@ inherit features_check gnomebase gtk-icon-cache gtk-doc gobject-introspection
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.sha256sum] = "3d1e2720673bc9a242619dc5d231fd6e776c18a49da29f43cdc433055adb0170"
+SRC_URI[archive.sha256sum] = "d9fe5d673f27a40a86a9e23d93cb99367e7b06df51872e8ac5ecc9938e55b5eb"
 
 BT_PULSE_PACKS = " \
     pulseaudio-lib-bluez5-util \
-- 
2.25.1


