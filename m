Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5555BC47073
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 09:11:57 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.8026.1704877916210278714
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jan 2024 01:11:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout11.t-online.de (Postfix) with SMTP id DE5091D1BE
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 10:11:53 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.230.233]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rNUcq-27uFYQ0; Wed, 10 Jan 2024 10:11:52 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/5] gnome-shell: update 45.1 -> 45.3
Date: Wed, 10 Jan 2024 10:11:43 +0100
Message-ID: <20240110091146.867242-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240110091146.867242-1-f_l_k@t-online.de>
References: <20240110091146.867242-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1704877912-DB7FD94C-316DD26E/0/0 CLEAN NORMAL
X-TOI-MSGID: b61faf2c-be92-4d2d-9a87-f9877a880a04
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 09:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108209

45.3
=3D=3D=3D=3D
* Allow any enter key to be used to screenshot [Scott; !2777]
* Fix spinner in light style variant [Florian; !3080]
* Improve formatting of extension errors [Philip; !3041]
* Fixed crash [Sebastian; !3006]
* Misc. bug fixes and cleanups [Florian, Daniel, Julian, Jonian; !3065, !=
3031,
  !3043, !3047, !3049, !3052, !3064, !3072, !2998]

Contributors:
  Scott Buchanan, Philip Chimento, Jonian Guveli, Sebastian Keller,
  Florian M=C3=BCllner, Julian Sparber, Daniel van Vugt

Translators:
  Brage Fuglseth [nb]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-shell/{gnome-shell_45.1.bb =3D> gnome-shell_45.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_45.1.bb =3D> gn=
ome-shell_45.3.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.1.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.3.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.1.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.3.bb
index d35437cb5..1dd043ec8 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.3.bb
@@ -32,7 +32,7 @@ GIR_MESON_OPTION =3D ""
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "15fca4bd6129a8b3f990197fbd1ee58d74b64151=
0afaaf0882a7fa36634fc5f2"
+SRC_URI[archive.sha256sum] =3D "3a19724720d8274dc6bced68e0dd5fc7668a04cd=
79978cbbb8223474ccdda9ab"
 SRC_URI +=3D "file://0001-Introduce-options-gjs_path-to-optionally-set-p=
ath-to.patch"
=20
 PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
--=20
2.43.0


