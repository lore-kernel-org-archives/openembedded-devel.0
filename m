Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E0BCA1012
	for <webhook@archiver.kernel.org>; Sat,  6 Sep 2025 06:47:37 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.2374.1757141250483168531
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Sep 2025 23:47:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout05.t-online.de (Postfix) with SMTP id 8CE4110DA
	for <openembedded-devel@lists.openembedded.org>; Sat,  6 Sep 2025 08:47:28 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.234.138]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uumhm-1tFz0s0; Sat, 6 Sep 2025 08:47:22 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] xdg-desktop-portal: update 1.20.0 -> 1.20.3
Date: Sat,  6 Sep 2025 08:47:10 +0200
Message-ID: <20250906064711.1430212-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250906064711.1430212-1-f_l_k@t-online.de>
References: <20250906064711.1430212-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1757141242-CBFFC9FF-56B34A50/0/0 CLEAN NORMAL
X-TOI-MSGID: 9e82f3b6-312e-4836-9094-ce190582bd27
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Sep 2025 06:47:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119319

1.20.3:
    Add a fallback code path for GLib older than 2.76 (#1728)
    Don't require a .desktop file for Flatpak and Snap apps (#1729)

1.20.2:
    Fix a crash when loading information from Flatpak apps
    Fix fd handling to prevent EBADF errors

1.20.1:
Enhancements:
    Code cleanups and improvements to app info tracking
    Include PID/TID in realtime portal error messages
    Search for portal backends in $XDG_DATA_DIRS (#603)
    Prioritize user portal configs over system ones

Bug Fixes:
    Fix race condition in the host registry portal
    Avoid spurious warnings when dbus.service stops
    Documentation fixes (#1663)
    Fix running tests from /tmp
    Fix installing dynamic launcher (#1674)
    Improve error reporting in the document portal
    Fix incorrect state tracking in input capture portal

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-desktop-portal_1.20.0.bb =3D> xdg-desktop-portal_1.20.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/xdg-desktop-portal/{xdg-desktop-portal_1.=
20.0.bb =3D> xdg-desktop-portal_1.20.3.bb} (93%)

diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l_1.20.0.bb b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-port=
al_1.20.3.bb
similarity index 93%
rename from meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal=
_1.20.0.bb
rename to meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1=
.20.3.bb
index 440d836874..e0aca558fd 100644
--- a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.=
0.bb
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.=
3.bb
@@ -27,11 +27,11 @@ RDEPENDS:${PN} =3D "bubblewrap rtkit ${PORTAL_BACKEND=
S} fuse3-utils"
 inherit meson pkgconfig python3native features_check
=20
 SRC_URI =3D " \
-	git://github.com/flatpak/xdg-desktop-portal.git;protocol=3Dhttps;branch=
=3Dmain \
+	git://github.com/flatpak/xdg-desktop-portal.git;protocol=3Dhttps;branch=
=3Dxdg-desktop-portal-1.20 \
 	file://0001-meson.build-add-a-hack-for-crosscompile.patch \
 "
=20
-SRCREV =3D "85df26fb1c53334969fea3f15c2a06a14831094b"
+SRCREV =3D "23a76c392170dbbd26230f85ef56c3a57e52b857"
=20
 FILES:${PN} +=3D "${libdir}/systemd ${datadir}/dbus-1"
=20
--=20
2.50.1


