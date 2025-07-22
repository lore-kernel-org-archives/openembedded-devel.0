Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40EFC83F1A
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 17:07:24 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.19168.1753204038905604067
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jul 2025 10:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout07.t-online.de (Postfix) with SMTP id 6554DE960
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 19:07:16 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.113]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ueGSR-3Lqlzl0; Tue, 22 Jul 2025 19:07:15 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] gnome-text-editor: update 48.1 -> 48.3
Date: Tue, 22 Jul 2025 19:07:07 +0200
Message-ID: <20250722170708.234676-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1753204035-4B7F8437-F3109507/0/0 CLEAN NORMAL
X-TOI-MSGID: 6dacf518-6f84-45ca-84f4-61637a2c2e17
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 17:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118698

 * Fix visual column position in overlay label
 * Defer gtk/gsv initialization to GtkApplication startup so that
   GApplication may determine proper app-id for process without
   relying on systemd/dbus conventions
 * Fix name in properties panel after save-as
 * Translation updates
 * Break out of recursive Policy-Kit authorization requests from
   user-cancellation.
 * Do not re-display position label as side-effect of auto-save
 * Translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-text-editor_48.1.bb =3D> gnome-text-editor_48.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-text-editor/{gnome-text-editor_48.=
1.bb =3D> gnome-text-editor_48.3.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor=
_48.1.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_4=
8.3.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_=
48.1.bb
rename to meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_48=
.3.bb
index 317d082940..d1ad219f10 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_48.1.b=
b
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_48.3.b=
b
@@ -18,7 +18,7 @@ inherit gnomebase gtk-icon-cache itstool gnome-help mim=
e-xdg features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI[archive.sha256sum] =3D "52089ba978a665841803b1b69e0e7be75b09a7d5=
4e01e8d0bb29926e0f342437"
+SRC_URI[archive.sha256sum] =3D "3f9e9722394edb4d2145c06d69210b3d3fca5cd2=
b90d632643be750843d556ba"
=20
 FILES:${PN} +=3D " \
     ${datadir}/metainfo \
--=20
2.50.1


