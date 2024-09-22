Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C422CF9C6E
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 01:21:02 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.7607.1726968056584891585
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Sep 2024 18:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout12.t-online.de (Postfix) with SMTP id F235E13C5F
	for <openembedded-devel@lists.openembedded.org>; Sun, 22 Sep 2024 03:20:54 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.41.228]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ssBHS-0WIQ8w0; Sun, 22 Sep 2024 03:20:54 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] grilo-plugins: add PACKAGECONFIG for lua-factory
Date: Sun, 22 Sep 2024 03:22:34 +0200
Message-ID: <20240922012234.201830-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240922012234.201830-1-f_l_k@t-online.de>
References: <20240922012234.201830-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726968054-F7FFD48D-2D42D381/0/0 CLEAN NORMAL
X-TOI-MSGID: acbe4677-4f94-459c-8f17-080deb8c8816
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Sep 2024 01:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112442

lua-factory is the only plugin that is enabled by default.
Add missing dependencies to fix build

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb b/met=
a-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
index 05df108e9..b0516be3d 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
+++ b/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
@@ -7,17 +7,16 @@ DEPENDS =3D " \
     gperf-native \
     itstool-native \
     grilo \
-    lua \
     liboauth \
 "
=20
-
 inherit gnomebase gnome-help vala
=20
 SRC_URI +=3D "file://0001-Avoid-running-trackertestutils.patch"
 SRC_URI[archive.sha256sum] =3D "fe6f4dbe586c6b8ba2406394e202f22d009d642a=
96eb3a54f32f6a21d084cdcb"
=20
-PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'gobject-in=
trospection-data', 'tracker', '', d)}"
-PACKAGECONFIG[tracker] =3D "-Denable-tracker3=3Dyes,-Denable-tracker3=3D=
no,tinysparql"
+PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'gobject-in=
trospection-data', 'tracker', '', d)} lua-factory"
+PACKAGECONFIG[tracker] =3D "-Denable-tracker3=3Dyes,-Denable-tracker3=3D=
no,tinysparql,localsearch"
+PACKAGECONFIG[lua-factory] =3D "-Denable-lua-factory=3Dyes,-Denable-lua-=
factory=3Dno,lua libarchive json-glib gnome-online-accounts"
=20
 FILES:${PN} +=3D "${libdir}/grilo-0.3"
--=20
2.46.0


