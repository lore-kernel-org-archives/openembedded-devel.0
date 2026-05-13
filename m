Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A0ACD4F3E
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 10:52:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4838.1778669538760865172
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 03:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=vxi07WFz;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E4321655
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 03:52:13 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 04B233F7B4
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 03:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778669538; bh=fg08z7bRwRP7sB9elGmvYqm0axj3lTlF8bGC2CWazXw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=vxi07WFzrpqEpkPnHYqswoU8Vj/FT1pkT7W/3PU+s2zsWMCnj45lYAD+pLMjhfisD
	 mCeexf2nbfBn4gagVpNpPzEMxZniJmwZFT6Vy5/WoEKY4z6qbbOhtmINUBFozq9/gr
	 9+Am89uGrLdcw0XfFfOe6JeZuhF3yrGqwrJH1BVI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 6/7] gnome-system-monitor: remove obsolete dependencies
Date: Wed, 13 May 2026 11:52:09 +0100
Message-ID: <20260513105210.2109216-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513105210.2109216-1-ross.burton@arm.com>
References: <20260513105210.2109216-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 10:52:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126970

libhandy was removed when g-s-m ported to GTK 4.

gnome-common is not required now that g-s-m uses Meson not autoconf.

polkit was removed in g-s-m 3.36 (March 2020).

Update the DISTRO_FEATURES check, polkit isn't required but opengl is
via GTK 4.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gnome-system-monitor/gnome-system-monitor_50.0.bb       | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-m=
onitor_50.0.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-syst=
em-monitor_50.0.bb
index 1ae11dda3b..29918605ef 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_=
50.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_=
50.0.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954=
499f7abaabaa882bbe"
=20
 DEPENDS =3D " \
     catch2 \
-    gnome-common-native \
     libxml2-native \
     glib-2.0-native \
     glibmm-2.68 \
@@ -13,15 +12,12 @@ DEPENDS =3D " \
     libadwaita \
     libgtop \
     librsvg \
-    polkit \
-    libhandy \
 "
=20
-
 inherit gnomebase gsettings gnome-help itstool gtk-icon-cache features_c=
heck gettext
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
-REQUIRED_DISTRO_FEATURES =3D "polkit"
+REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
 SRC_URI[archive.sha256sum] =3D "a4138aa754b4584c46de91fad1d685e27b12bc24=
57de761863b6be02d84c4862"
=20
--=20
2.43.0


