Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52A9C48BF8
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 18:47:26 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.2149.1708368446257140682
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 10:47:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout11.t-online.de (Postfix) with SMTP id F2B76A4BD
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 19:47:21 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.47.44]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rc8ff-1vNyUM0; Mon, 19 Feb 2024 19:47:19 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/4] gnome-shell: update 45.3 -> 45.4
Date: Mon, 19 Feb 2024 19:47:29 +0100
Message-ID: <20240219184731.3378-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240219184731.3378-1-f_l_k@t-online.de>
References: <20240219184731.3378-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1708368439-2E7FB9FB-4B4E4B52/0/0 CLEAN NORMAL
X-TOI-MSGID: 99241cc8-e0ca-4b1f-95fa-55857755ccad
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:47:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108875

45.4
=3D=3D=3D=3D
* Close mount notification when drive gets disconnected [Florian; !3089]
* Fix feedback look in keyboard backlight slider [Barnab=C3=A1s; !3086]
* Fix menu alignment in RTL locales [Florian; !3151]
* overview: Keep dimming effect for modal dialogs [Florian; !3150]
* Fix overview transition from search results to session [Suryashankar; !=
3152]
* Improve minimize animation [Keyu; !2968]
* Add missing shift level to Georgian OSK layout [Carlos; !3145]
* Fixed crash [Florian; !3117]
* Misc. bug fixes and cleanups [Florian, Jonas, Julian; !3105, !3110, !31=
41,
  !786, !2475, !3153, !3159, !3172]

Contributors:
  Suryashankar Das, Jonas Dre=C3=9Fler, Carlos Garnacho, Florian M=C3=BCl=
lner,
  Barnab=C3=A1s P=C5=91cze, Julian Sparber, Keyu Tao

Translators:
  Brage Fuglseth [nb], Bal=C3=A1zs Mesk=C3=B3 [hu], Daniel Rusek [cs]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-shell/{gnome-shell_45.3.bb =3D> gnome-shell_45.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_45.3.bb =3D> gn=
ome-shell_45.4.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.3.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.4.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.3.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.4.bb
index 1dd043ec8..7d7d508c1 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.4.bb
@@ -32,7 +32,7 @@ GIR_MESON_OPTION =3D ""
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "3a19724720d8274dc6bced68e0dd5fc7668a04cd=
79978cbbb8223474ccdda9ab"
+SRC_URI[archive.sha256sum] =3D "5bfea379e120b1c7f237f3ec369ad27ef5c2f593=
0c7df163b392782d8582090d"
 SRC_URI +=3D "file://0001-Introduce-options-gjs_path-to-optionally-set-p=
ath-to.patch"
=20
 PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
--=20
2.43.0


