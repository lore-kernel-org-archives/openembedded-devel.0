Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEDD0CCF9E5
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 04:07:53 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.20343.1761797265689233316
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 21:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout06.t-online.de (Postfix) with SMTP id B9AEC1BD7B
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 05:07:31 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.229.193]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vEJwd-0bZeLJ0; Thu, 30 Oct 2025 05:07:27 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] xdg-desktop-portal-gnome: update 48.0 -> 49.0
Date: Thu, 30 Oct 2025 05:07:22 +0100
Message-ID: <20251030040722.529996-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1761797247-3DFF89DC-2A72C306/0/0 CLEAN NORMAL
X-TOI-MSGID: dffb8993-2c52-4325-b963-776b64c2208e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 04:07:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121180

Changes in 49.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Minor code style cleanups
- Translation updates
Changes in 49.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
No changes
Changes in 49.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Improve detection of apps' metadata
- Improvements to the Global Shortcuts portal
- Add support for Papers as a print previewer
- Fix a wrong function signature in the USB portal
- Translation updates
Changes in 49.alpha
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Translation updates
---
 ...op-portal-gnome_48.0.bb =3D> xdg-desktop-portal-gnome_49.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/xdg-desktop-portal/{xdg-desktop-portal=
-gnome_48.0.bb =3D> xdg-desktop-portal-gnome_49.0.bb} (89%)

diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-po=
rtal-gnome_48.0.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-de=
sktop-portal-gnome_49.0.bb
similarity index 89%
rename from meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-por=
tal-gnome_48.0.bb
rename to meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l-gnome_49.0.bb
index 019353bc88..21fe18039f 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_48.0.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_49.0.bb
@@ -21,7 +21,7 @@ inherit gnomebase pkgconfig gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
-SRC_URI[archive.sha256sum] =3D "cd15aca2e1364da308eb3796bb8ae4a577e60ca4=
fe12006b315232cfd19c8861"
+SRC_URI[archive.sha256sum] =3D "401dafcdf8cb911f09c08d2813f774dd864127ab=
fca93ff4caf1fc4c9b5ec4d2"
=20
 PACKAGECONFIG ?=3D "screenshot screencast ${@bb.utils.filter('DISTRO_FEA=
TURES', 'wayland', d)}"
 PACKAGECONFIG[wayland] =3D ",,wayland-native"
--=20
2.51.0


