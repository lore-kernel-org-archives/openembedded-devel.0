Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0E1C41513
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 06:00:29 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.12049.1713765621757776220
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Apr 2024 23:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout07.t-online.de (Postfix) with SMTP id A21C42FF1
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 08:00:19 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.174.11]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rymix-0eOXRp0; Mon, 22 Apr 2024 08:00:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/5] gnome-shell: update 46.0 -> 46.1
Date: Mon, 22 Apr 2024 08:00:37 +0200
Message-ID: <20240422060041.222739-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1713765619-70F0ED2B-0DEB87E6/0/0 CLEAN NORMAL
X-TOI-MSGID: 23375525-6cbc-4b3b-8e3f-59681284ecee
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 06:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110077

46.1
=3D=3D=3D=3D
* Improve notification of conflicting session [Joan; !3235]
* Add shift level to Korean OSK layout [Carlos; !3222]
* Fix markup support in notifications [Sebastian; !3247]
* extensions-app: Fix empty rows with '&' in extension name [Florian; !32=
66]
* extensions-app: Improve HIG compliance [Automeris; !3269, !3271]
* Omit expand buttons in notification banners [Julian; !3249]
* Misc. bug fixes and cleanups [dcz, Totto16, Sebastian, Florian;
  !3262, !3253, !3260, !3234]

Contributors:
  dcz, Carlos Garnacho, Sebastian Keller, Robert Mader, Florian M=C3=BCll=
ner,
  Automeris naranja, Julian Sparber, Joan Torres, Totto16, Sebastian Wick

Translators:
  Danial Behzadi [fa], Baurzhan Muftakhidinov [kk], Anders Jonsson [sv],
  Aurimas =C4=8Cernius [lt], Yuri Chornoivan [uk], Daniel Rusek [cs],
  Ekaterine Papava [ka], Asier Sarasua Garmendia [eu], Jiri Gr=C3=B6nroos=
 [fi],
  Piotr Dr=C4=85g [pl], Yaron Shahrabani [he], Brage Fuglseth [nb], A S A=
lam [pa],
  Christian Kirbach [de], Milo Casagrande [it], Fran Dieguez [gl],
  Jordi Mas i Hernandez [ca], Jordi Mas [ca], Sabri =C3=9Cnal [tr],
  Boyuan Yang [zh_CN], Athmane MOKRAOUI [kab], Vincent Chatelain [fr],
  =D0=9C=D0=B8=D0=BB=D0=BE=D1=88 =D0=9F=D0=BE=D0=BF=D0=BE=D0=B2=D0=B8=D1=9B=
 [sr, sr@latin], Martin [sl], Nathan Follens [nl], Artur S0 [ru],
  Juliano de Souza Camargo [pt_BR], Changwoo Ryu [ko], Jose Riha [sk],
  Fabio Tomat [fur], Peter V=C3=A1gner [sk], Andi Chandler [en_GB]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-shell/{gnome-shell_46.0.bb =3D> gnome-shell_46.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_46.0.bb =3D> gn=
ome-shell_46.1.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.0.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.1.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.0.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.1.bb
index 907cfdf67..ed86cbcb6 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.1.bb
@@ -32,7 +32,7 @@ GIR_MESON_OPTION =3D ""
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "6bc41340b6de05774e97cfe20feba86e2b3cc9c8=
139118f24bd84ac63e82b53e"
+SRC_URI[archive.sha256sum] =3D "64f999844c101e63bf294d45b138de56319ad2f3=
26282721aad0fa860653b369"
 SRC_URI +=3D "file://0001-Introduce-options-gjs_path-to-optionally-set-p=
ath-to.patch"
=20
 PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
--=20
2.44.0


