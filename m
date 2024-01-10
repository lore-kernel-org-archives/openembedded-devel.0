Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5635FC47074
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 09:11:57 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.8045.1704877916294877242
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jan 2024 01:11:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout11.t-online.de (Postfix) with SMTP id DD0D91D1BD
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 10:11:53 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.230.233]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rNUcq-27uFYP0; Wed, 10 Jan 2024 10:11:52 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/5] mutter: update 45.1 -> 45.3
Date: Wed, 10 Jan 2024 10:11:42 +0100
Message-ID: <20240110091146.867242-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1704877912-F8FF694C-2E830424/0/0 CLEAN NORMAL
X-TOI-MSGID: 5a47c7e3-35c0-42fc-987a-16361ec1935a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 09:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108211

45.3
=3D=3D=3D=3D
* Fix handling of relative mode for tablets [Peter; !3410]
* Fix forcing EGLStream with NVIDIA proprietary driver [Daniel; !2905]
* Sync geometry only when window is mapped [Sebastian W.; !3401, !3404]
* Improve repick due to transform changes [Carlos; !3385]
* wayland/client: Add make_desktop() method [Florian; !3305]
* Fix occasional artifacts at top of X11 fullscreen windows [Carlos; !347=
6]
* background: Fix background color around image [Sebastian W.; !3459]
* Fixed crashes [Sebastian K., Carlos, Jonas; !3453, !3422, !3335, !3392]
* Plugged leaks [Robert, Sebastian K.; !3439, !3411]
* Misc. bug fixes and cleanups [Sebastian W., Christopher, Daniel, Olivie=
r,
  Michel, Qiu, Carlos, Ivan, Mike, Mart, Bilal; !3456, !3455, !2620, !344=
7,
  !3444, !3440, !3438, !3425, !3413, !3403, !3397, !3469, !3468, !3471, !=
3479]

Contributors:
  Jonas =C3=85dahl, Robert Balas, Michel D=C3=A4nzer, Bilal Elmoussaoui, =
Christopher Fore,
  Olivier Fourdan, Carlos Garnacho, Mike Gorse, Peter Hutterer,
  Sebastian Keller, Ivan Molodetskikh, Florian M=C3=BCllner, Mart Raudsep=
p,
  Daniel van Vugt, Qiu Wenbo, Sebastian Wick

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/mutter/{mutter_45.1.bb =3D> mutter_45.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_45.1.bb =3D> mutter_45.3.=
bb} (97%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_45.1.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_45.3.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/mutter/mutter_45.1.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_45.3.bb
index 6093a0fe9..85bfdd528 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_45.1.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_45.3.bb
@@ -24,7 +24,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings gobject-introspection gettext features_check
=20
-SRC_URI[archive.sha256sum] =3D "2cd3c5efb22db76c79311cb1889a1aab2feb35b4=
a4dd03f3822aab7999da212c"
+SRC_URI[archive.sha256sum] =3D "b78aea7f3e2bec8322a2af0404716be2269905c7=
d50c04b0b2a71a38814fcd01"
=20
 # x11 is still manadatory - see meson.build
 REQUIRED_DISTRO_FEATURES =3D "wayland x11 polkit"
--=20
2.43.0


