Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 292E7C636CC
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 09:53:50 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.3077.1675504425363402188
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Feb 2023 01:53:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout04.t-online.de (Postfix) with SMTP id 3D8FB8DD7
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Feb 2023 10:53:43 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.165.5]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pOFEp-4H6WLB0; Sat, 4 Feb 2023 10:53:40 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-xfce][PATCH] xfdesktop: update 4.18.0 -> 4.18.1
Date: Sat,  4 Feb 2023 10:53:35 +0100
Message-Id: <20230204095335.89343-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1675504420-9CA930AF-850E4B1C/0/0 CLEAN NORMAL
X-TOI-MSGID: aff9f914-1f72-4a42-8520-c5631bc583e1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Feb 2023 09:53:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100928

Also do an update on the dependencies

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{xfdesktop_4.18.0.bb =3D> xfdesktop_4.18.1.bb} | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.18.0.bb =3D> xfdesk=
top_4.18.1.bb} (59%)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.18.0.bb b/meta-=
xfce/recipes-xfce/xfdesktop/xfdesktop_4.18.1.bb
similarity index 59%
rename from meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.18.0.bb
rename to meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.18.1.bb
index 6895b7912..f4d5fef8e 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.18.1.bb
@@ -2,13 +2,25 @@ SUMMARY =3D "Xfce4 Desktop Manager"
 SECTION =3D "x11/base"
 LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
-DEPENDS =3D "libxfce4ui libwnck thunar garcon exo"
+DEPENDS =3D " \
+    cairo \
+    exo \
+    garcon \
+    glib-2.0 \
+    gtk+3 \
+    intltool \
+    libwnck3 \
+    libxfce4ui \
+    libxfce4util \
+    thunar \
+    xfconf \
+"
=20
 inherit xfce features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
-SRC_URI[sha256sum] =3D "661783e7e6605459926d80bca46d25ce2197c221456457a8=
63ea9d0252120d14"
+SRC_URI[sha256sum] =3D "ef9268190c25877e22a9ff5aa31cc8ede120239cb0dfca08=
0c174e7eed4ff756"
=20
 PACKAGECONFIG ??=3D "notify"
 PACKAGECONFIG[notify] =3D "--enable-notifications,--disable-notification=
s,libnotify"
--=20
2.34.1


