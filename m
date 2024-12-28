Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02BE1E77188
	for <webhook@archiver.kernel.org>; Sat, 28 Dec 2024 06:07:45 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.25587.1735366058786009877
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Dec 2024 22:07:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout03.t-online.de (Postfix) with SMTP id 597BB6CF
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Dec 2024 07:07:36 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.235.40]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tRPz6-0jiF5V0; Sat, 28 Dec 2024 07:07:36 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] malcontent: update 0.12.0 -> 0.13.0
Date: Sat, 28 Dec 2024 07:07:45 +0100
Message-ID: <20241228060745.21207-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1735366056-63FFCA80-DE4CC314/0/0 CLEAN NORMAL
X-TOI-MSGID: ec816f04-e6c6-45c8-8778-97911f13c4e7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Dec 2024 06:07:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114574

Overview of changes in malcontent 0.13.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Bugs fixed:
  - #48 Parental controls app: show the launcher, or merge into Settings?
    (Philip Withnall)
  - !172 Update fa.po
  - !173 Update Czech translation
  - !176 malcontent-control: Update metainfo file
  - !177 Update Swedish translation
  - !179 docs: Add list of legal references for relevant countries=E2=80=99=
 laws
  - !180 po: Update Slovenian translation
  - !181 Update Polish translation 240909
  - !182 Add Chinese translation
  - !183 application: Fix opening Settings
  - !184 malcontent-control: Call setlocale() earlier to fix early i18n
  - !185 restrict-applications-selector: Fix pending changes being lost o=
n
    search
  - !186 libmalcontent-ui: Port to libadwaita 1.6
  - !187 app-filter: Fix logic for allowlist filtering on GAppInfo

* Translation updates:
  - Chinese (China) (lumingzh)
  - Czech (AsciiWolf)
  - Persian (Danial Behzadi)
  - Polish (Piotr Dr=C4=85g)
  - Slovenian (Martin Srebotnjak)
  - Swedish (Anders Jonsson)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-gnome/malcontent/malcontent-ui.bb | 5 +++--
 meta-oe/recipes-gnome/malcontent/malcontent.inc   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-gnome/malcontent/malcontent-ui.bb b/meta-oe/=
recipes-gnome/malcontent/malcontent-ui.bb
index ca3bf081d6..8630822939 100644
--- a/meta-oe/recipes-gnome/malcontent/malcontent-ui.bb
+++ b/meta-oe/recipes-gnome/malcontent/malcontent-ui.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c"
=20
 require malcontent.inc
=20
-DEPENDS =3D " \
+DEPENDS +=3D " \
 	malcontent \
 	accountsservice \
 	glib-2.0 \
@@ -16,6 +16,7 @@ DEPENDS =3D " \
 	libpam \
 	polkit \
 	appstream \
+	appstream-native \
 	flatpak \
 	libadwaita \
 	gtk4 \
@@ -40,7 +41,7 @@ do_install() {
 	ln -sf libmalcontent-ui-1.so.${PV} ${D}${libdir}/libmalcontent-ui-1.so.=
1
 	install -m 0755 ${B}/malcontent-control/malcontent-control ${D}${bindir=
}
 	install -m 0644 ${B}/malcontent-control/org.freedesktop.MalcontentContr=
ol.policy ${D}${datadir}/polkit-1/actions
-	install -m 0644 ${B}/malcontent-control/org.freedesktop.MalcontentContr=
ol.appdata.xml ${D}${datadir}/metainfo
+	install -m 0644 ${B}/malcontent-control/org.freedesktop.MalcontentContr=
ol.metainfo.xml ${D}${datadir}/metainfo
 	install -m 0644 ${B}/malcontent-control/org.freedesktop.MalcontentContr=
ol.desktop ${D}${datadir}/applications
 }
=20
diff --git a/meta-oe/recipes-gnome/malcontent/malcontent.inc b/meta-oe/re=
cipes-gnome/malcontent/malcontent.inc
index d48be08bbc..68523fa21e 100644
--- a/meta-oe/recipes-gnome/malcontent/malcontent.inc
+++ b/meta-oe/recipes-gnome/malcontent/malcontent.inc
@@ -1,4 +1,4 @@
 SRC_URI =3D "git://gitlab.freedesktop.org/pwithnall/malcontent.git;proto=
col=3Dhttps;branch=3Dmain"
 S =3D "${WORKDIR}/git"
-SRCREV =3D "3ba80995bb25b7aeda7e21d547f9e39ff9a81736"
-PV =3D "0.12.0"
+SRCREV =3D "21f3ef7b6f984710a23b607d2298fe16e554f0c3"
+PV =3D "0.13.0"
--=20
2.47.1


