Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E2AC25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 10:16:11 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.18874.1716891368357126394
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 03:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout11.t-online.de (Postfix) with SMTP id 8C41D271B7
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 12:16:06 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.40.240]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sBtsE-0356zR0; Tue, 28 May 2024 12:16:06 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/3] mutter: update 46.1 -> 46.2
Date: Tue, 28 May 2024 12:16:41 +0200
Message-ID: <20240528101643.2314146-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1716891366-D3FFCD0F-2884E149/0/0 CLEAN NORMAL
X-TOI-MSGID: 572c4139-9e5a-4782-9aa4-60459878cb55
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:16:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110581

46.2
=3D=3D=3D=3D
* Fix hardware cursor with non-atomic KMS drivers [Daniel; !3676]
* Fix night light state getting stuck on monitor changes [Michel; !3742]
* Fix sending preferred buffer transform [Robert; !3717]
* Fix key press events with immediate release being ignored [Carlos; !372=
1]
* Fix unsetting clipboard on screen lock [Florian; !3752]
* Fix wrong input region of undecorated X11 windows [Sebastian K.; !3720]
* Fix windows potentially shrinking unexpectedly on configure [Jonas =C3=85=
.; !3755]
* Fix popup menus sometimes closing immediately [Jonas D.; !3631]
* Fixed crashes [Michel, Carlos, Keyu, Jonas =C3=85., Sebastian K.; !3725=
, !3763,
  !3715, !3711, !3758, !3749]
* Misc. bug fixes and cleanups [Florian, Echo, Michel, Jonas =C3=85., Seb=
astian W.,
  Corentin, Bilal; !3723, !3744, !3737, !3743, !3735, !3731, !3700, !3750=
,
  !3757, !3754, !3748, !3730, !3775]

Contributors:
  Jonas =C3=85dahl, Michel D=C3=A4nzer, Jonas Dre=C3=9Fler, Bilal Elmouss=
aoui, Carlos Garnacho,
  Echo J, Sebastian Keller, Robert Mader, Florian M=C3=BCllner, Corentin =
No=C3=ABl,
  Keyu Tao, Marco Trevisan (Trevi=C3=B1o), Daniel van Vugt, Sebastian Wic=
k

Translators:
  Hugo Carvalho [pt], Le=C3=B4nidas Ara=C3=BAjo [pt_BR]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/mutter/{mutter_46.1.bb =3D> mutter_46.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_46.1.bb =3D> mutter_46.2.=
bb} (97%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_46.1.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_46.2.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/mutter/mutter_46.1.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_46.2.bb
index b60ffefb0..6a121b09c 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_46.1.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_46.2.bb
@@ -24,7 +24,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings gobject-introspection gettext features_check
=20
-SRC_URI[archive.sha256sum] =3D "63b2660dd0fa193fa662c80ee12eb8b16f2b8c3b=
c3896366200c79943824d51d"
+SRC_URI[archive.sha256sum] =3D "009baa77f8362612caa2e18c338a1b3c8aad3b5f=
e2964c2fef7824d321228983"
=20
 # x11 is still manadatory - see meson.build
 REQUIRED_DISTRO_FEATURES =3D "wayland x11 polkit"
--=20
2.45.1


