Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF6EC4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 06:47:07 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.9108.1714459623348184177
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Apr 2024 23:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout11.t-online.de (Postfix) with SMTP id 3D58482BA
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Apr 2024 08:47:01 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.33.47]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s1hGW-1IYVIv0; Tue, 30 Apr 2024 08:47:00 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] networkmanager: fix gir build
Date: Tue, 30 Apr 2024 08:47:21 +0200
Message-ID: <20240430064721.164017-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1714459620-637FC3C7-7D585F74/0/0 CLEAN NORMAL
X-TOI-MSGID: 8dde3ddf-b54a-4b1a-8861-8aaad738fae5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Apr 2024 06:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110190

Basically what is done in:
https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3D4c40897893f43a99e6ae12e652c0cf789d89df90

This fixes:
| gi.RepositoryError: Typelib file for namespace 'Gobject', version '2.0'=
 not found
| gi.RepositoryError: Typelib file for namespace 'Gio', version '2.0' not=
 found
| gi.RepositoryError: Typelib file for namespace 'GModule', version '2.0'=
 not found

- Remove uneeded do_compile:prepend. It was broken because of {B}} and se=
ems to be unneeded anyway

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../networkmanager/networkmanager_1.46.0.bb                | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager_1.46.0.bb b/meta-networking/recipes-connectivity/networkmanager/ne=
tworkmanager_1.46.0.bb
index be30154a3..8184fcf1a 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.46.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.46.0.bb
@@ -76,9 +76,10 @@ EXTRA_OEMESON =3D "\
 CFLAGS:append:libc-musl =3D " \
     -DRTLD_DEEPBIND=3D0 \
 "
-
-do_compile:prepend() {
-    export GI_TYPELIB_PATH=3D"${B}}/src/libnm-client-impl${GI_TYPELIB_PA=
TH:+:$GI_TYPELIB_PATH}"
+do_configure:prepend() {
+    cp -f ${STAGING_LIBDIR}/girepository-1.0/GObject*typelib ${STAGING_L=
IBDIR_NATIVE}/girepository-1.0/
+    cp -f ${STAGING_LIBDIR}/girepository-1.0/Gio*typelib ${STAGING_LIBDI=
R_NATIVE}/girepository-1.0/
+    cp -f ${STAGING_LIBDIR}/girepository-1.0/GModule*typelib ${STAGING_L=
IBDIR_NATIVE}/girepository-1.0/
 }
=20
 PACKAGECONFIG ??=3D "readline nss ifupdown dnsmasq nmcli vala \
--=20
2.44.0


