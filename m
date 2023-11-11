Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1B8C4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 20:59:07 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.3905.1699736345733112845
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 12:59:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout10.t-online.de (Postfix) with SMTP id 5CB2B42951
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 21:59:03 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.215]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r1v4J-1hXCkb0; Sat, 11 Nov 2023 21:59:03 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-terminal: Upgrade 3.48.1 -> 3.50.1
Date: Sat, 11 Nov 2023 21:59:14 +0100
Message-ID: <20231111205914.942045-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699736343-B980699C-CB57D999/0/0 CLEAN NORMAL
X-TOI-MSGID: b4b03a1f-65af-4041-b0b2-3ec080f38797
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 20:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106574

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-terminal_3.48.1.bb =3D> gnome-terminal_3.50.1.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-terminal/{gnome-terminal_3.48.1.bb=
 =3D> gnome-terminal_3.50.1.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.=
1.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1=
.bb
rename to meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.b=
b
index 8f91f7cca..f3eb0c6cc 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM =3D " \
     file://COPYING.GFDL;md5=3Da22d0be1ce2284b67950a4d1673dd1b0 \
 "
=20
-
-inherit pkgconfig meson gsettings gnome-help gettext itstool upstream-ve=
rsion-is-even
+inherit gnomebase pkgconfig gsettings gnome-help gettext itstool upstrea=
m-version-is-even
=20
 DEPENDS =3D " \
     glib-2.0 \
@@ -14,7 +13,7 @@ DEPENDS =3D " \
     desktop-file-utils-native \
     gtk+3 \
     gsettings-desktop-schemas \
-    vte \
+    vte9 \
     dconf \
     libpcre2 \
 "
@@ -22,7 +21,7 @@ DEPENDS =3D " \
 SRC_URI =3D "git://gitlab.gnome.org/GNOME/gnome-terminal.git;protocol=3D=
https;nobranch=3D1 \
            file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch =
\
            "
-SRCREV =3D "1446ff0abc478bdd03c6665b718214d075729024"
+SRCREV =3D "5ac3b8e4bd6fa02651b3c23cedb0a7e1cd769655"
 S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ?=3D ""
--=20
2.42.0


