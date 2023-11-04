Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36602C4332F
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 06:31:30 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.5050.1699079480473082341
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 23:31:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout06.t-online.de (Postfix) with SMTP id 003D222130
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Nov 2023 07:31:16 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.35.165]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qzABg-1LnF0T0; Sat, 4 Nov 2023 07:31:16 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] gnome-shell: Upgrade 45.0 -> 45.1
Date: Sat,  4 Nov 2023 07:31:35 +0100
Message-ID: <20231104063136.40884-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1699079476-42563D4D-7C2A06E9/0/0 CLEAN NORMAL
X-TOI-MSGID: 2087eda5-d034-401b-a353-74c099612085
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 06:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106297

45.1
=3D=3D=3D=3D
* Fix scroll handling on sliders [Carlos; !2967]
* overview: Handle unredirection as part of the state transition [Robert;=
 !2970]
* Handle DESKTOP windows during workspace animations [Sundeep; !2865]
* Fix unexpected focus changes with multi-window apps [Florian; !2959]
* Improve recording indicator in light style [Georges; !2983]
* Fix calendar popup shrinking on date changes [Sebastian; !2989]
* Fixed crashes [Daniel, Sebastian; !2975, !2974]
* Misc. bug fixes and cleanups [Florian, Martin, Alessandro, Sebastian; !=
2966,
  !2978, !2987, !3000, #6763]

Contributors:
  Alessandro Bono, Carlos Garnacho, Sebastian Keller, Sundeep Mediratta,
  Florian M=C3=BCllner, Georges Basile Stavracas Neto, robert.mader@colla=
bora.com,
  Daniel van Vugt, Martin Zurowietz

Translators:
  Jordi Mas [ca], Fabio Tomat [fur], Ekaterine Papava [ka], Sabri =C3=9Cn=
al [tr],
  Cheng-Chia Tseng [zh_TW], Changwoo Ryu [ko], Florentina Mu=C8=99at [ro]=
,
  Brage Fuglseth [nb], Evangelos Skarmoutsos [el], Efstathios Iosifidis [=
el],
  =D0=9C=D0=B0=D1=80=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D1=9B [sr=
], Hugo Carvalho [pt]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-shell/{gnome-shell_45.0.bb =3D> gnome-shell_45.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_45.0.bb =3D> gn=
ome-shell_45.1.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.0.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.1.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.0.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.1.bb
index 8dc4d8317..472c3bdb8 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.1.bb
@@ -33,7 +33,7 @@ GIR_MESON_OPTION =3D ""
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "3cabe40bdd4e379c7082b39ffa45b8bef5c9cf86=
408fb0d836e1571c443217cd"
+SRC_URI[archive.sha256sum] =3D "15fca4bd6129a8b3f990197fbd1ee58d74b64151=
0afaaf0882a7fa36634fc5f2"
 SRC_URI +=3D "file://0001-Introduce-options-gjs_path-to-optionally-set-p=
ath-to.patch"
=20
 PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
--=20
2.42.0


