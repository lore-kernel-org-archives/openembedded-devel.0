Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A25C36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 06:42:08 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.15231.1742539321200422851
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 23:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout01.t-online.de (Postfix) with SMTP id 601D25C8
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 07:41:59 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.230.175]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tvW4r-1MIaa90; Fri, 21 Mar 2025 07:41:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] tecla: update 47.0 -> 48.0.2
Date: Fri, 21 Mar 2025 07:42:44 +0100
Message-ID: <20250321064245.55252-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1742539317-AF7F7AA0-736D85F6/0/0 CLEAN NORMAL
X-TOI-MSGID: 8dea3854-8028-4138-a253-63c9992e166a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 06:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116167

NEW in 48.0.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Just a version bump
NEW in 48.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Translation updates
NEW in 48.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Translation updates
- Improvements to multi-instance for specific layout previews
- Make window modal when run as a dialog
NEW in 48.alpha
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Translation updates
- Support spaces and tabs as separator for keymap+variant
- A number of new/improved labels for special keys

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/tecla/{tecla_47.0.bb =3D> tecla_48.0.2.bb}    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tecla/{tecla_47.0.bb =3D> tecla_48.0.2.b=
b} (70%)

diff --git a/meta-gnome/recipes-gnome/tecla/tecla_47.0.bb b/meta-gnome/re=
cipes-gnome/tecla/tecla_48.0.2.bb
similarity index 70%
rename from meta-gnome/recipes-gnome/tecla/tecla_47.0.bb
rename to meta-gnome/recipes-gnome/tecla/tecla_48.0.2.bb
index e430b167d7..d9ed4f2f2e 100644
--- a/meta-gnome/recipes-gnome/tecla/tecla_47.0.bb
+++ b/meta-gnome/recipes-gnome/tecla/tecla_48.0.2.bb
@@ -13,4 +13,6 @@ REQUIRED_DISTRO_FEATURES =3D "wayland"
=20
 inherit gnomebase pkgconfig  features_check
=20
-SRC_URI[archive.sha256sum] =3D "0790b99ec29137a54b546c510661a99aa6f039c8=
d75f10c08e928682c0804fe5"
+SRC_URI =3D "https://download.gnome.org/sources/tecla/48/tecla-${PV}.tar=
.xz"
+SRC_URI[sha256sum] =3D "783d3464d2a2cf7eb1507649dbd9ff09ce24852c2a6c9a0d=
365db84063d3d401"
+
--=20
2.48.1


