Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30EBC4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 06:00:29 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.12050.1713765621761246943
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Apr 2024 23:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout02.t-online.de (Postfix) with SMTP id 1CA8113D6A
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 08:00:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.174.11]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rymix-0eOXRq0; Mon, 22 Apr 2024 08:00:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/5] mutter: update 46.0 -> 46.1
Date: Mon, 22 Apr 2024 08:00:38 +0200
Message-ID: <20240422060041.222739-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240422060041.222739-1-f_l_k@t-online.de>
References: <20240422060041.222739-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1713765619-70F0ED2B-E78EF773/0/0 CLEAN NORMAL
X-TOI-MSGID: 93a33f06-2305-4c04-b073-a6e2961abcd5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 06:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110075

46.1
=3D=3D=3D=3D
* Implement linux-drm-syncobj-v1 [Austin; !3300]
* Fix input lag on X11 nvidia [Daniel; !3685]
* Fix scanout on secondary GPUs [Michel; !3674]
* Don't apply max-render-time to secondary GPUs [Michel; !3689]
* Fix reusing single-pixel buffers [Jonas =C3=85.; !3702]
* Improve scanout candidate check [Robert; !3699]
* Always use logical pixels for bounds [Sophie; !3698]
* Fix modifiers getting stuck during grabs [Carlos; !3704]
* Fix night-light on displays without EDID [Sebastian W.; !3673]
* Fix secondary GPU acceleration with nvidia driver [Jonas =C3=85., Danie=
l; !3304]
* Fix some XWayland clients being partially click-through [Sebastian K.; =
!3697]
* Fix initial suspended state [Jonas =C3=85.; !3475]
* Fixed crashes [Bilal, Jonas =C3=85., Sebastian W., Daniel;
  !3683, !3666, !3691, !3708, !3678]
* Misc. bug fixes and cleanups [Ray, Carlos, Bilal, Ivan, Barnab=C3=A1s, =
Jonas =C3=85.,
  Jonas D., Michel; !3672, !3681, !3686, !3687, !3671, !3679, !3690, !370=
3,
  !3695, !2946, !3696, !3710, !3644, !3707]

Contributors:
  Jonas =C3=85dahl, Michel D=C3=A4nzer, Jonas Dre=C3=9Fler, Bilal Elmouss=
aoui, Carlos Garnacho,
  Sophie Herold, Sebastian Keller, Robert Mader, Athmane MOKRAOUI,
  Ivan Molodetskikh, Barnab=C3=A1s P=C5=91cze, Austin Shafer, Ray Strode,=
 Daniel van Vugt,
  Sebastian Wick

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/mutter/{mutter_46.0.bb =3D> mutter_46.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_46.0.bb =3D> mutter_46.1.=
bb} (97%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_46.0.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_46.1.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/mutter/mutter_46.0.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_46.1.bb
index d14f161f1..b60ffefb0 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_46.0.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_46.1.bb
@@ -24,7 +24,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings gobject-introspection gettext features_check
=20
-SRC_URI[archive.sha256sum] =3D "bb3f7d77aebdea9d317d3f5ef03868e4e7969da4=
23ac495e33a16d61db2c9373"
+SRC_URI[archive.sha256sum] =3D "63b2660dd0fa193fa662c80ee12eb8b16f2b8c3b=
c3896366200c79943824d51d"
=20
 # x11 is still manadatory - see meson.build
 REQUIRED_DISTRO_FEATURES =3D "wayland x11 polkit"
--=20
2.44.0


