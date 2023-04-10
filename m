Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5184C77B6F
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:26:28 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.39420.1681115184819193022
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=abHZzr/2;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681115182; i=@fujitsu.com;
	bh=KmoKh9A1xxeHH7VpWJl5D1ege04cmiSa0R+fd5HdDs4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=abHZzr/2Rp5Z8M3ry5KdX4mY5UfMsrR4FjYPJTIkPWfU9qYcP7w/Cr6ZmbNE6Oup8
	 G8MgEQJO/4AjnsygS0VPhN5qC3f+BVmW70SMmmId7qZ1CgiQC3fFxpATGl4HAPnTE2
	 KqrkxDogL93s9pWlipAO/7+p1POikWIe0dj0D01AhM3zzM5Yo9Gxl6iDc/kxcZz3qf
	 n9PXaYGYG5xjw8RQY1KyXMooFKEkUHOxm+Z3V/ocJon5u5MYvFRvUv7PYpzZH6wtGK
	 86DoSrPL3BuOAcfuGU37EHY9VgNBm9Mb7tULWd5e2sRUu+zQgA0YlZobiUaz7gli8V
	 fvhL85y6w3GaQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8OxWVfvhHG
  KQcNHMYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePS7EbmgtWcFct/drE2MK7j6GLk4hASeMgo
  8eHvPDYI5wqTxO+W7ewQzh5GiT3Lm4AcTg42ASmJG/f/s4HYIgL6Ektn72EGsZkFVCRe/O4Bq
  xEWsJLYd/IDE4jNIqAqcfBRPyOIzSvgJLF88SWwXgkBBYkpD9+D9XIKOEs8PrkarFcIqObnrA
  usEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsConG6YeYIGw1iavnNjFPYBSchaR9FpL2BYx
  MqxjNi1OLylKLdA1N9ZKKMtMzSnITM3P0Eqt0E/VSS3Xz8otKMnQN9RLLi/VSi4v1iitzk3NS
  9PJSSzYxAgM4pThFbgfjlb6/eocYJTmYlER5u7iMU4T4kvJTKjMSizPii0pzUosPMcpwcChJ8
  C48AJQTLEpNT61Iy8wBRhNMWoKDR0mEt+IYUJq3uCAxtzgzHSJ1ilFRSpy3FyQhAJLIKM2Da4
  NF8CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrzbDgNN4cnMK4Gb/gpoMRPQYi4XA5DFJYk
  IKakGJp36/883iMcrzJpdL72M48f93IRdRuZXpp3Zya0Y+l504Q47FwYOqdtMq57+j38y4fHH
  ZsMGDhH1ax8uzp3nV2N+Wa2sm2f2pnJ+njccNlK8OczfXnZc2vdRKqB6grGT0s4eO6cFoS3cI
  r1zSo/PijpmZe6yti389UmdH/IzRbd935wUOmNxIPv6OuHFE11P+U5WLtp8s/JA/BqpwPra2J
  SaRg2RhxM9/km2H+M59fx17rSaloBzPjk/lwhYl0rIvTq/oKH0zbQ1pdEvWR4I998Ru3pV4t0
  Jw+31hY//svJqm8i8ui709ajtnvLqwJ7u9kt/ch+9DdTr/Mj7/5JvA8er/vdBHx46pokkLm+/
  r8RSnJFoqMVcVJwIAKXdG3NbAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-728.messagelabs.com!1681115182!1440185!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11431 invoked from network); 10 Apr 2023 08:26:22 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:26:22 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id C963E155
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:26:21 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id BB1D816F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:26:21 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:26:20 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] feh: upgrade 3.9.1 -> 3.10
Date: Mon, 10 Apr 2023 16:26:02 +0800
Message-ID: <1681115165-24320-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681115165-24320-1-git-send-email-wangmy@fujitsu.com>
References: <1681115165-24320-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 08:26:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102006

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Add --sort=none option to un-set sort modes specified earlier
* Improve error messages for Imlib2 >= 1.8
* Fix build with clang 16. (Patch by orbea)
* Fix tests when building with magic=1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/feh/{feh_3.9.1.bb => feh_3.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/feh/{feh_3.9.1.bb => feh_3.10.bb} (89%)

diff --git a/meta-oe/recipes-graphics/feh/feh_3.9.1.bb b/meta-oe/recipes-graphics/feh/feh_3.10.bb
similarity index 89%
rename from meta-oe/recipes-graphics/feh/feh_3.9.1.bb
rename to meta-oe/recipes-graphics/feh/feh_3.10.bb
index d78fe7e17..0f0e61893 100644
--- a/meta-oe/recipes-graphics/feh/feh_3.9.1.bb
+++ b/meta-oe/recipes-graphics/feh/feh_3.10.bb
@@ -10,7 +10,7 @@ DEPENDS = "\
 "
 
 SRC_URI = "https://feh.finalrewind.org/feh-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "455c92711b588af149b945edc5c145f3e9aa137ed9689dabed49d5e4acac75fa"
+SRC_URI[sha256sum] = "1d71d1f6dcfe9ffee5e2766969a11978f7eb4fac7d7ae556f104c11f9c57cc98"
 
 inherit mime-xdg features_check
 # depends on virtual/libx11
-- 
2.34.1


