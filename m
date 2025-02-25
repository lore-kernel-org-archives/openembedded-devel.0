Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F01C021BC
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 13:49:21 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.8170.1740491360049637814
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 05:49:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout05.t-online.de (Postfix) with SMTP id 2936D12F6
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 14:49:18 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.41.232]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tmvJC-3sgT3Z0; Tue, 25 Feb 2025 14:49:14 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC][meta-gnome][PATCH 1/7] xdg-desktop-portal-gnome: update 47.3 -> 48.beta
Date: Tue, 25 Feb 2025 14:49:31 +0100
Message-ID: <20250225134937.2085793-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1740491354-C0C5D97F-3431E10F/0/0 CLEAN NORMAL
X-TOI-MSGID: 3833a743-f839-4728-907d-e48693989186
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 13:49:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115575

Changes in 48.beta.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 - Add USB portal backend
 - Fix screen cast portal done signal emission
Changes in 48.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Use the new AdwInlineViewSwitcher widget in the screencast dialog
- Update apps list properly in the screencast dialog
- Generate systemd sysexts in CI
- Fix an issue with the Notification portal implementation
- Depend on libadwaita >=3D 1.7.alpha
- Translation updates
Changes in 48.alpha
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Outsource external window management to libgxdp
- Fix the capabilities for the print dialog
- Fix memory leak in screencast widget
- Implement a signal handler to help with ASAN
- Use Adwaita widgets in the app chooser dialog
- Fix a memory management issue with the screencast widget
- Depend on xdg-desktop-portal >=3D 1.19.1
- Translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...portal-gnome_47.3.bb =3D> xdg-desktop-portal-gnome_48.beta.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/xdg-desktop-portal/{xdg-desktop-portal=
-gnome_47.3.bb =3D> xdg-desktop-portal-gnome_48.beta.bb} (89%)

diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-po=
rtal-gnome_47.3.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-de=
sktop-portal-gnome_48.beta.bb
similarity index 89%
rename from meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-por=
tal-gnome_47.3.bb
rename to meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l-gnome_48.beta.bb
index 215560ed4d..3d19060c2a 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_47.3.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_48.beta.bb
@@ -21,7 +21,7 @@ inherit gnomebase pkgconfig gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
-SRC_URI[archive.sha256sum] =3D "9f6e4b14b583367c915e9494764f27cb84927faa=
3f9e6e018b93bbbcf3361e44"
+SRC_URI[archive.sha256sum] =3D "17f2bc70cc693f85c93b436449d25b26b58ca348=
7cf61fa1c860366cee05dba1"
=20
 PACKAGECONFIG ?=3D "screenshot screencast ${@bb.utils.filter('DISTRO_FEA=
TURES', 'wayland', d)}"
 PACKAGECONFIG[wayland] =3D ",,wayland-native"
--=20
2.48.1


