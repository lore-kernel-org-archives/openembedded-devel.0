Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33720C48BCF
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:13 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.26642.1650872195838954156
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 00:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=K1TCTkZW;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650872193; i=@fujitsu.com;
	bh=aKY01OJKjlR9mLlbKrWtycWd3jp59vZxB0cIkCgMc0o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=K1TCTkZW3bMdc+BrCvtE1qYdhtB5rwdPZjNUce3V3BnBuJ3ZDcOOJ5ci5YrXnvWfk
	 RsJl8GXWm9vzWY0ys/yrsaDUeDLwk9CpQejbfN8LTohX/84p+tgbe7r3/jq/TTLBez
	 OFjPkvI1PwxxadzAhCnhVnYtfNIy4avc+HpA3hP0bCcV1fk3O9lp4oXdVt27hZ90gX
	 I7PfXY0Odn9yWkBJQeYEYFMDthKPrRrCWaFDh0vv+SrbRsD8pAN+IJznanMzaOD2kT
	 THBD6bEN0dApOPHHqH+EFiubaA9m8WWW9HgQCicIY944pTayjlTCmDwTJww7XNolKt
	 0i2LgAXGvUDxg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8MxRbfBPy3
  J4P5uU4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePsjEvsBZs4K550hDQwHuToYuTiEBKYzSTR
  dvk/E4Szh1Fi7atTjF2MnBxsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3DDmILCzhLfN40G
  aiGg4NFQFVi6n1OkDCvgJPE3/5DYGMkBBQkpjx8D9bKCVT+4MUXJhBbCKhm8p0nLBD1ghInZ0
  LYzAISEgdfvGCG6FWUmH25mQXCrpCYNauNaQIj/ywkLbOQtCxgZFrFaJdUlJmeUZKbmJmja2h
  goGtoaKprZq5raGaml1ilm6iXWqqbnJpXUpQIlNZLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMzJRi
  52U7GN/1/dQ7xCjJwaQkynvPJC1JiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvbl+gnGBRanpqR
  VpmDjBKYNISHDxKIrzp3kBp3uKCxNzizHSI1ClGXY4Ph67sZRZiycvPS5US573rB1QkAFKUUZ
  oHNwIWsZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfOm+wBN4cnMK4Hb9AroCCagIz7VpoI
  cUZKIkJJqYNL00sjMDXknbZmWxt8mcdDv9L26jwGTEir+iOozPmvNueYa46Sqst62Ou7ouUv+
  GRNC9Bbs3morsORz177NTF4G61/NKy7PUrLQWNh823EX5+YVPev0hScX/wydd1WP94BgRtOFf
  LZmy/vJCjsvTzm9PbFsR+3KX6v5IyaGzV5gnayaHX22NEzzTWzphGdLJ/M0ylTfYf3tfjyIJW
  vuh5bVHM92pd58YH29gpHb4P53A455dRV7N6kkvVwffDMz//DbF+vMg76fCZnhLX588aul18q
  O1Ob+VfTepGgfKWrNp+goE5IhfCA/8X2Z1v0C6x1cmXIe36ZN8vdPTw2ZvWH1Xttez5xLq/nF
  HXaGKLEUZyQaajEXFScCAIKOMWdTAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-532.messagelabs.com!1650872192!131696!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24193 invoked from network); 25 Apr 2022 07:36:32 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-16.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Apr 2022 07:36:32 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23P7aNcJ007665
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:36:32 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 25 Apr 2022 08:36:27 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] nautilus: upgrade 42.0 -> 42.1.1
Date: Mon, 25 Apr 2022 15:36:14 +0800
Message-ID: <1650872176-31497-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650872176-31497-1-git-send-email-wangmy@fujitsu.com>
References: <1650872176-31497-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96774

Major changes in 42.1.1
=========================
 Revert wrongly introduced dependency on unstable gnome-desktop.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nautilus/{nautilus_42.0.bb => nautilus_42.1.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_42.0.bb => nautilus_42.1.1.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_42.0.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_42.1.1.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_42.0.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_42.1.1.bb
index 08277416f3..6d942204f6 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_42.0.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_42.1.1.bb
@@ -21,7 +21,7 @@ inherit gnomebase gsettings gobject-introspection gtk-doc gettext features_check
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "3c904f33ba2d2a078892bee2af71484cd608923cd78ec7e8a1517bc2155113d5"
+SRC_URI[archive.sha256sum] = "8519d4565e842aa3d31d0fe39b21d48ac54edc0f0658fe1d8ea2da4e704c1b66"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.25.1


