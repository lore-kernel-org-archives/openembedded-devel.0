Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4DEC10F1A
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 15:38:49 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.471.1714577928628987282
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 08:38:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout08.t-online.de (Postfix) with SMTP id DFF9626E3B
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 May 2024 17:37:04 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.42.233]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s2C0y-0hgqmn0; Wed, 1 May 2024 17:37:00 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] networkmanager: add missing glib-2.0 dependency
Date: Wed,  1 May 2024 17:37:08 +0200
Message-ID: <20240501153708.966824-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1714577821-3EAE4D4A-F4008A86/0/0 CLEAN NORMAL
X-TOI-MSGID: 0da219ea-d249-4406-be0f-f030651578b9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 May 2024 15:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110203

- also copy GLib*Typelib to STAGING_LIBDIR_NATIVE to avoid:
| gi.RepositoryError: Typelib file for namespace 'GLib', version '2.0' no=
t found

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../networkmanager/networkmanager_1.46.0.bb                     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager_1.46.0.bb b/meta-networking/recipes-connectivity/networkmanager/ne=
tworkmanager_1.46.0.bb
index 8184fcf1a..3c9570d92 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.46.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.46.0.bb
@@ -19,6 +19,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263 \
 "
=20
 DEPENDS =3D " \
+    glib-2.0 \
     python3-pygobject-native \
     coreutils-native \
     intltool-native \
@@ -77,6 +78,7 @@ CFLAGS:append:libc-musl =3D " \
     -DRTLD_DEEPBIND=3D0 \
 "
 do_configure:prepend() {
+    cp -f ${STAGING_LIBDIR}/girepository-1.0/GLib*typelib ${STAGING_LIBD=
IR_NATIVE}/girepository-1.0/
     cp -f ${STAGING_LIBDIR}/girepository-1.0/GObject*typelib ${STAGING_L=
IBDIR_NATIVE}/girepository-1.0/
     cp -f ${STAGING_LIBDIR}/girepository-1.0/Gio*typelib ${STAGING_LIBDI=
R_NATIVE}/girepository-1.0/
     cp -f ${STAGING_LIBDIR}/girepository-1.0/GModule*typelib ${STAGING_L=
IBDIR_NATIVE}/girepository-1.0/
--=20
2.44.0


