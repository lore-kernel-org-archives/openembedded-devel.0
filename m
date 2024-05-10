Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6507CC25B4F
	for <webhook@archiver.kernel.org>; Fri, 10 May 2024 05:43:51 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.5969.1715319821317058206
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 May 2024 22:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout03.t-online.de (Postfix) with SMTP id 409B83CD1
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 May 2024 07:43:39 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.232.205]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s5J2f-0fxbiE0; Fri, 10 May 2024 07:43:37 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/4] xdg-desktop-portal: update 1.18.1 -> 1.18.4
Date: Fri, 10 May 2024 07:43:58 +0200
Message-ID: <20240510054400.3796092-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240510054400.3796092-1-f_l_k@t-online.de>
References: <20240510054400.3796092-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1715319817-26FFADFC-3F59720D/0/0 CLEAN NORMAL
X-TOI-MSGID: 25b7dc16-fa2f-49c0-b628-963174793102
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 May 2024 05:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110305

Changes in 1.18.4
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Released: 2024-04-18

- Don't allow commandline arrays when the first commandline item starts w=
ith
  whitespace or hyphen. (CVE-2024-32462)
- Do not store device access permission if it returned an error.
- Fix crash with config files without a default backend set.

Changes in 1.18.3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Released: 2024-04-04

- Don't try to read D-Bus object properties of Request objects on constru=
ction.
- Fix various memory and file descriptor leaks.
- Minuscule optimization to the ScreenCast portal so that it stores resto=
ration
  data with a single D-Bus call, instead of two.
- Fix a crash in the OpenURI file when trying to open a non-existing file=
.
- Various smaller bug fixes.

Changes in 1.18.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Released: 2023-11-22

- Pass the token to the OpenURI portal and, when missing, an empty string=
.
- Fix various memory and file descriptor leaks in the Document portal.
- Make files and folders openend with the Document portal close properly.=
 This
  should fix cases where the Document portal prevented external devices f=
rom
  unmounting, due to files inside them not getting closed after applicati=
ons
  stop using them.
- Implement FUSE getlk and setlk callbacks.This should enable using sqlit=
e3
  through the Document portal.
- Properly resolve fd symlinks before opening them with O_NOFOLLOW.
- Fix cases where the portal id is assumed to match the .desktop file nam=
e.
- Allow sending directories in the file transfer portal. This should make=
 it
  possible to, among other things, drag and drop folders and files simult=
aneously
  from and to sandboxed applications.
- Fallback to a hardcoded check to xdg-desktop-portal-gtk in the absence =
of any
  other portal or configuration file, as a last resort mechanism.
- Various smaller fixes to the build system.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-desktop-portal_1.18.1.bb =3D> xdg-desktop-portal_1.18.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/xdg-desktop-portal/{xdg-desktop-portal_1.=
18.1.bb =3D> xdg-desktop-portal_1.18.4.bb} (93%)

diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l_1.18.1.bb b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-port=
al_1.18.4.bb
similarity index 93%
rename from meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal=
_1.18.1.bb
rename to meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1=
.18.4.bb
index 0aa872428..8161ed160 100644
--- a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.18.=
1.bb
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.18.=
4.bb
@@ -27,12 +27,12 @@ RDEPENDS:${PN} =3D "bubblewrap rtkit ${PORTAL_BACKEND=
S}"
 inherit meson pkgconfig python3native features_check
=20
 SRC_URI =3D " \
-	git://github.com/flatpak/xdg-desktop-portal.git;protocol=3Dhttps;branch=
=3Dmain \
+	git://github.com/flatpak/xdg-desktop-portal.git;protocol=3Dhttps;branch=
=3Dxdg-desktop-portal-1.18 \
 	file://0001-meson.build-add-a-hack-for-crosscompile.patch \
 "
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "37a6f7c8b8e08b9861f05e172cd4e0d07a832c4d"
+SRCREV =3D "11c8a96b147aeae70e3f770313f93b367d53fedd"
=20
 FILES:${PN} +=3D "${libdir}/systemd ${datadir}/dbus-1"
=20
--=20
2.44.0


