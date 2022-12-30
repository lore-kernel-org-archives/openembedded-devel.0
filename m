Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B9CC10F1B
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 13:13:33 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.17677.1672406012096848756
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Dec 2022 05:13:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout12.t-online.de (Postfix) with SMTP id 7E00773BE
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 14:13:30 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.234.94]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pBFCS-0mgTr70; Fri, 30 Dec 2022 14:13:28 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 1/2] gnome-terminal: update 3.42.2 -> 3.46.7
Date: Fri, 30 Dec 2022 14:13:06 +0100
Message-Id: <20221230131307.615168-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672406008-EF7E87E2-AEDAD8BA/0/0 CLEAN NORMAL
X-TOI-MSGID: 3b4ec113-67fc-4a76-b30f-fa8c72e9b0e0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 13:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100311

Since 3.45 there are no longer tarballs available. Switch to using git

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...inal_3.42.2.bb =3D> gnome-terminal_3.46.7.bb} | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-terminal/{gnome-terminal_3.42.2.bb=
 =3D> gnome-terminal_3.46.7.bb} (59%)

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.42.=
2.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.46.7.bb
similarity index 59%
rename from meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.42.2=
.bb
rename to meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.46.7.b=
b
index 061da27f6..69af11c91 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.42.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.46.7.bb
@@ -7,12 +7,10 @@ LIC_FILES_CHKSUM =3D " \
=20
 GNOMEBASEBUILDCLASS =3D "meson"
=20
-inherit gnomebase gsettings gnome-help gettext itstool upstream-version-=
is-even
+inherit gsettings gnome-help gettext itstool upstream-version-is-even
=20
 DEPENDS =3D " \
-    glib-2.0-native \
-    intltool-native \
-    yelp-tools-native \
+    glib-2.0 \
     docbook-xsl-stylesheets-native libxslt-native \
     desktop-file-utils-native \
     gtk+3 \
@@ -22,14 +20,14 @@ DEPENDS =3D " \
     libpcre2 \
 "
=20
-SRC_URI[archive.sha256sum] =3D "8a9c8e5ef7a3a73b246a947e1190bb08ec98935a=
f860cf0b3aa2fbf4606817a0"
+SRC_URI =3D "git://gitlab.gnome.org/GNOME/gnome-terminal.git;protocol=3D=
https;nobranch=3D1"
 SRC_URI +=3D "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.pat=
ch"
-SRC_URI +=3D "  file://0001-build-Fix-for-newer-meson.patch"
+SRCREV =3D "816edf80cd7bf7f253366099ea9fcaf361676139"
+S =3D "${WORKDIR}/git"
=20
-EXTRA_OEMESON +=3D " \
-    -Dsearch_provider=3Dfalse \
-    -Dnautilus_extension=3Dfalse \
-"
+PACKAGECONFIG ?=3D ""
+PACKAGECONFIG[nautilus] =3D "-Dnautilus_extension=3Dtrue,-Dnautilus_exte=
nsion=3Dfalse,nautilus,nautilus"
+PACKAGECONFIG[search_provider] =3D "-Dsearch_provider=3Dtrue,-Dsearch_pr=
ovider=3Dfalse,,gnome-shell"
=20
 FILES:${PN} +=3D " \
     ${datadir}/metainfo \
--=20
2.34.1


