Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F274BC7115D
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 17:43:32 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.1661.1750614211461049978
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Jun 2025 10:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout09.t-online.de (Postfix) with SMTP id A8E6B37D8A
	for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jun 2025 19:43:29 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.134]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uTOj2-11QWQL0; Sun, 22 Jun 2025 19:43:29 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] evince: fix buildpath error
Date: Sun, 22 Jun 2025 19:43:22 +0200
Message-ID: <20250622174323.22987-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1750614209-C5FF9544-3FC71AE0/0/0 CLEAN NORMAL
X-TOI-MSGID: 5c8adb8e-8aab-449e-9145-06a96bf85a3f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Jun 2025 17:43:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118024

adapt 'sed' command to UNPACKDIR changes

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/evince/evince_48.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evince/evince_48.0.bb b/meta-gnome/=
recipes-gnome/evince/evince_48.0.bb
index 9f9de50acf..31345542f2 100644
--- a/meta-gnome/recipes-gnome/evince/evince_48.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_48.0.bb
@@ -46,8 +46,8 @@ RRECOMMENDS:${PN} =3D "adwaita-icon-theme"
 PACKAGES =3D+ "${PN}-nautilus-extension"
=20
 do_install:prepend() {
-    sed -i -e 's|${B}/../${PN}-${PV}|${TARGET_DBGSRC_DIR}|g' ${B}/libvie=
w/ev-view-type-builtins.c
-    sed -i -e 's|${B}/../${PN}-${PV}|${TARGET_DBGSRC_DIR}|g' ${B}/libdoc=
ument/ev-document-type-builtins.c
+    sed -i -e 's|${B}/../sources/${BP}|${TARGET_DBGSRC_DIR}|g' ${B}/libv=
iew/ev-view-type-builtins.c
+    sed -i -e 's|${B}/../sources/${BP}|${TARGET_DBGSRC_DIR}|g' ${B}/libd=
ocument/ev-document-type-builtins.c
 }
=20
 FILES:${PN} +=3D "${datadir}/dbus-1 \
--=20
2.49.0


