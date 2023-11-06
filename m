Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BFF5C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 08:15:48 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.49927.1699258547118621686
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 00:15:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout11.t-online.de (Postfix) with SMTP id BAEA533A7
	for <openembedded-devel@lists.openembedded.org>; Mon,  6 Nov 2023 09:15:44 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.229.73]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qzulq-1fpKvB0; Mon, 6 Nov 2023 09:15:42 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] xdg-desktop-portal: Upgrade 1.18.0 -> 1.18.1
Date: Mon,  6 Nov 2023 09:16:09 +0100
Message-ID: <20231106081609.624604-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699258542-4D288D65-98F1AE5E/0/0 CLEAN NORMAL
X-TOI-MSGID: b24fdeb9-e3e5-4624-b5bc-eaae0047bc1d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 08:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106397

Current meson.build fails if flatpak was not found using pkgconfig
../git/meson.build:203:44: ERROR: Unknown variable "flatpak_dep"

Removing -Dflatpak-interfaces-dir setting and relying on pkgconfig
for flatpak instead seems to work well in our case and avoids the error a=
bove

This is a new minor release of xdg-desktop-portal 1.18 series. Users and
distributions are strongly encouraged to update to this version. These ar=
e the
changes included in this release:

    -Communicate better when the Background portal kills an app
    -Properly quote Flatpak command in the Background portal
    -Improve documentation of the "cursor_mode" propery of the ScreenCast=
 backend
     D-Bus interface
    -Fix ScreenCast portal removing transient restore permissions too ear=
ly.
     This fixes screen sharing dialogs on Chromium asking for the screen =
multiple
     times.
    -Only send the Closed session signal to the sender
    -Add Meson options to disable building with Bubblewrap, and without t=
he
    -Flatpak portal documentation. Disabling Bubblewrap is highly discour=
aged,and
     only meant to be used on platforms that do not currently support it.=
 By
     disabling Bubblewrap, bitmap validation happens without a sandbox, w=
hich is
     highly insecure since image parsing is a common source of exploits. =
Really, just
     do not disable Bubblewrap please.
    -Improve the manpage of portals.conf
    -Various spelling fixes to the Document portal
    -Add a new website! We don't have a fancy domain yet, but the website=
 can be
     accessed at https://flatpak.github.io/xdg-desktop-portal/
    -Improve pid mapping for host system apps. This should get rid of som=
e rare,
     unnecessary warnings.
    -Adjust documentation of Global Shortcuts portal's timestamps to mill=
isecond
     granularity
    -Bump minimum Meson version to 0.58

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...g-desktop-portal_1.18.0.bb =3D> xdg-desktop-portal_1.18.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/xdg-desktop-portal/{xdg-desktop-portal_1.=
18.0.bb =3D> xdg-desktop-portal_1.18.1.bb} (91%)

diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l_1.18.0.bb b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-port=
al_1.18.1.bb
similarity index 91%
rename from meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal=
_1.18.0.bb
rename to meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1=
.18.1.bb
index b9173a9f3..f8a07eb64 100644
--- a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.18.=
0.bb
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.18.=
1.bb
@@ -31,13 +31,12 @@ SRC_URI =3D " \
 "
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "a4b27063222b16652e73b422e5448d75335199ef"
+SRCREV =3D "37a6f7c8b8e08b9861f05e172cd4e0d07a832c4d"
=20
 FILES:${PN} +=3D "${libdir}/systemd ${datadir}/dbus-1"
=20
 EXTRA_OEMESON +=3D " \
 	--cross-file=3D${WORKDIR}/meson-${PN}.cross \
-	-Dflatpak-interfaces-dir=3D${STAGING_DATADIR}/dbus-1/interfaces \
 	-Ddbus-service-dir=3D${datadir}/dbus-1/services \
 "
=20
--=20
2.42.0


