Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F152CE79AB
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 07:33:02 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.31704.1695195180623764337
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 00:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout08.t-online.de (Postfix) with SMTP id 8D9647EF6
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 09:32:58 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.179]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qirhh-3s8v5d0; Wed, 20 Sep 2023 09:32:57 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-calendar: fix reproducibility issue
Date: Wed, 20 Sep 2023 09:32:49 +0200
Message-ID: <20230920073249.75316-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695195177-42FF676E-2A2B16D6/0/0 CLEAN NORMAL
X-TOI-MSGID: 564215bf-cc92-4cf7-b2ee-dfb474795da5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 07:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105005

- ensure to use gtk4 variant of gtk-update-icon-cache
- remove buildpaths from source files before they are packaged

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gnome-calendar/gnome-calendar_45.0.bb    | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.0.=
bb b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.0.bb
index 7efd486b5..a8b8123f8 100644
--- a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.0.bb
@@ -18,13 +18,18 @@ DEPENDS =3D " \
 "
=20
 GNOMEBASEBUILDCLASS =3D "meson"
-
+GTKIC_VERSION =3D '4'
 inherit gnomebase gsettings gtk-icon-cache gettext features_check upstre=
am-version-is-even mime-xdg
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
 SRC_URI[archive.sha256sum] =3D "8c1483cbba4388db410875ed09d64e9003f929b5=
55d704076a6fe7bd7c1e65b2"
=20
+do_install:prepend() {
+    sed -i -e 's|${S}/src|/usr/src/debug/${PN}/${PV}-${PR}/src|g' ${B}/s=
rc/gcal-enum-types.h
+    sed -i -e 's|${S}/src|/usr/src/debug/${PN}/${PV}-${PR}/src|g' ${B}/s=
rc/gcal-enum-types.c
+}
+
 FILES:${PN} +=3D " \
     ${datadir}/gnome-shell \
     ${datadir}/metainfo \
--=20
2.42.0


