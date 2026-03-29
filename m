Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CE5F3D611
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 16:37:38 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32716.1774802251317755673
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 09:37:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=VRq/U1OP;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout10.t-online.de (Postfix) with SMTP id CEA3A37E98
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 18:37:28 +0200 (CEST)
Received: from fedora.fritz.box ([79.219.236.193]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w6t8f-4PNMYM0; Sun, 29 Mar 2026 18:37:25 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] xdg-desktop-portal-gnome: update 49.0 -> 50.0
Date: Sun, 29 Mar 2026 18:37:17 +0200
Message-ID: <20260329163717.150915-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329163717.150915-1-f_l_k@t-online.de>
References: <20260329163717.150915-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1774802245-C77FD829-D50BA009/0/0 CLEAN NORMAL
X-TOI-MSGID: c3091578-545b-48b2-b88a-4392dc3278cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1774802248; i=f_l_k@t-online.de;
	bh=A0cXaZZ6l2Xpg8NN1dUQnQtWRCm+quKEtqsaOe4ZrDY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=VRq/U1OPQ2ZeADa6ipDXd3PeynVMGJuJVk11GQyRGW/9AI+DHGUNQdc6TYB2D/2ho
	 b0BF7jGfz1FMlX7vGDJInQzile/0BAYRuafPYyOWqrjztWBj4XdehSO52jFKSsL5Dz
	 +a5uQUnbCpXiBOjEm7LY0WKnrTV9kfNAz1IvTGsmYKx5eAqMzYeA9ScvfyvLyb3HoR
	 FLUJmvPAdgokANYw51KRzCa0Z+Lwy9e6xyaLfO3c7dMBJvqxyRzYml+7WMPMwAU8E/
	 SUtEm6g5Qt9jTZ4DLBa/5LYYUUFkjQuW/jRQsXIdma2XPc0e38Dl47M9KYosB4HQA/
	 jIP3XhB8/7qNg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 16:37:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125805

Changes in 50.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Make the Clipboard portal return errors instead of succeeding
- Fix a bug in the Print portal where it was accidentally closing fd 0
- Translation updates
Changes in 50.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Translation updates
Changes in 50.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Update libgxdp
- Remove ellipse from the app chooser list header
- Fix a memory leak in the Print portal implementation
- Fix icon size in the Dynamic Launcher portal
- Various fixes in the Remote Desktop portal
- Fix monitor identification in VMs
- Fix an issue with mismatching GVariant type unwrapping
- Translation updates
Changes in 50.alpha
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Fix a potential source of crashes in the ScreenCast portal code
- Properly send the Global Shortcut activation token to the portal fronte=
nd
- Update libgxdp to override GTK settings
- Use a GNOME OS based CI template
- Translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...op-portal-gnome_49.0.bb =3D> xdg-desktop-portal-gnome_50.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/xdg-desktop-portal/{xdg-desktop-portal=
-gnome_49.0.bb =3D> xdg-desktop-portal-gnome_50.0.bb} (89%)

diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-po=
rtal-gnome_49.0.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-de=
sktop-portal-gnome_50.0.bb
similarity index 89%
rename from meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-por=
tal-gnome_49.0.bb
rename to meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l-gnome_50.0.bb
index 21fe18039f..00ef8a5d97 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_49.0.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_50.0.bb
@@ -21,7 +21,7 @@ inherit gnomebase pkgconfig gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
-SRC_URI[archive.sha256sum] =3D "401dafcdf8cb911f09c08d2813f774dd864127ab=
fca93ff4caf1fc4c9b5ec4d2"
+SRC_URI[archive.sha256sum] =3D "ceeef2fb68b34b3f66a3def0a332a22a70af2726=
41fb6c50065b7a2fde3d5759"
=20
 PACKAGECONFIG ?=3D "screenshot screencast ${@bb.utils.filter('DISTRO_FEA=
TURES', 'wayland', d)}"
 PACKAGECONFIG[wayland] =3D ",,wayland-native"
--=20
2.53.0


