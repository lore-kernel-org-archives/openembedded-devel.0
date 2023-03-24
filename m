Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA10C74A5B
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:32:03 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.89966.1679617913284079304
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nw0cn/Ar;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679617911; i=@fujitsu.com;
	bh=f1baGa+X4Zc8uOI8RaF18wisIA99abT4TgQp8mXhMQ8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nw0cn/ArH7fukoilVgp6VznQOjdPB51x5E24iZ/yVXX8eDubPN04+cX50U9ohNMfi
	 Z+9Umpbw7i/0cwU8c4wgQR4itihAW5//lwyDSaAyFYpeMUHpsdkbCS4TsxK5nQYOYq
	 eG2AI+NhsQTq4UUrgwsBspSiumvDo9hU963hIX7OwItK3mlvBp56QuKqyY1VJ7uCaY
	 BjdJHl16OtRPKtRX9IYUq8LoAzX/UGlh1zzcOm2wif2qGll7t4EYk1AgX09tZSmGGC
	 2hJUuyE+I90GmM5uHFNkWyYu6okP+aefUgazDfpm/w9kDfsXIe94LJbzrCxFyJVvjR
	 PV8LHIvo9aEaA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8MxSbfsvUy
  KwaR3hhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8byZ1vZCzq5Kl5OfcXSwNjI2cXIxSEk8IRR
  YlrDBzYI5zqTRPeGJSwQzh5GibmzvrF2MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgKLFj3S5GEJtFQFVi3dQVYDW8Ak4Sj67dYQKxJQQUJKY8fA8W5xRwlpj7qANoJgfQMi
  eJJedYIMoFJU7OfMICMV5C4uCLF8wQrYoSsy83s0DYFRKN0w9BjVSTuHpuE/MERsFZSNpnIWl
  fwMi0itG0OLWoLLVI10wvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzkn
  RS8vtWQTIzB0U4rVf+1gnNn3V+8QoyQHk5Ior0SodIoQX1J+SmVGYnFGfFFpTmrxIUYZDg4lC
  d7Pb2RShASLUtNTK9Iyc4BxBJOW4OBREuE9dBYozVtckJhbnJkOkTrFqMvx4dCVvcxCLHn5ea
  lS4ryJb4GKBECKMkrz4EbAYvoSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFe4XdAU3gy80r
  gNr0COoIJ6AjnGrAjShIRUlINTJOsIz4vPsAhMIn16Akhj/iqk5l2jZlPI1IvPcx68uNvrWf2
  ghYjLuG/SzncJM6dSZA9r9lqENzctmjqlRUfOiP2HXqy587P5IbXD404L+8zvrmoZuM/yRR7W
  e+Gh/El8y/M97PnL1Uq+SGttWT6nzs8UnOWbZqQ/nCuCI/bcyP3kJMeqy/XlLT3BTw+fb24+M
  i5h5OX/Cq2Pf6t1ukOx1n5GftunLOY9/6/8gMdEZZl0mddbvw3n1KVNonHIVrZa4a644e6LW8
  v+t9i8rSQDuzyWTVzRdDTvQ/TVPKWBN1xfNmjKX+s8rxMFVNCxdrLU1g+MVn1fzgR6bSQv9Nt
  +bXCyLuRs1KiLU8Z2bl1lyixFGckGmoxFxUnAgBzQngTZAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-571.messagelabs.com!1679617910!256479!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6528 invoked from network); 24 Mar 2023 00:31:50 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:31:50 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 6F43F1000F5
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:31:50 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5DD501000E9
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:31:50 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:31:48 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] nautilus: upgrade 43.2 -> 44.0
Date: Fri, 24 Mar 2023 08:31:23 +0800
Message-ID: <1679617885-27327-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679617885-27327-1-git-send-email-wangmy@fujitsu.com>
References: <1679617885-27327-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:32:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101690

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Bugfixes:
  - Prevent rubberband selection instead of drag and drop
  - Fix critical errors with recent GLib versions
* Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nautilus/{nautilus_43.2.bb => nautilus_44.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_43.2.bb => nautilus_44.0.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_43.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_44.0.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_43.2.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_44.0.bb
index 4b54d6a67..8fe58a77d 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_43.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_44.0.bb
@@ -26,7 +26,7 @@ inherit gnomebase gsettings gobject-introspection gtk-doc gettext features_check
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "a86a9aa7a455511b029ce49a1d8b4659c3c355b5d81d7360bb4d0de637afede0"
+SRC_URI[archive.sha256sum] = "57b99ebb8e2b9c1512d381e53096188c087b33410d6c52d87a27bd60ee76ac7f"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-- 
2.34.1


