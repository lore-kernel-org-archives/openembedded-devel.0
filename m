Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D0ACA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 09:35:39 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.34939.1756978528854560823
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 02:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout08.t-online.de (Postfix) with SMTP id C8AC3E5C5
	for <openembedded-devel@lists.openembedded.org>; Thu,  4 Sep 2025 11:35:26 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.163.17]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uu6NJ-266bhJ0; Thu, 4 Sep 2025 11:35:25 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][RFC][PATCHv2] glibmm: update 2.80.0 -> 2.85.0
Date: Thu,  4 Sep 2025 11:35:14 +0200
Message-ID: <20250904093514.3042884-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1756978525-CE7F39FF-A9D431B2/0/0 CLEAN NORMAL
X-TOI-MSGID: b1167e53-9e06-428e-8a64-158c0f246a4b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 09:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119275

- LIC_FILES_CHECKSUM changed but LICENSE is still valid

update is required for gtk 4.20.0

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{glibmm-2.68_2.80.0.bb =3D> glibmm-2.68_2.85.0.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm-2.68_2.80.0.bb =3D> glibmm-=
2.68_2.85.0.bb} (75%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb b/meta-o=
e/recipes-core/glib-2.0/glibmm-2.68_2.85.0.bb
similarity index 75%
rename from meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.85.0.bb
index 48a1a2a624..325ad4d5cd 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.85.0.bb
@@ -2,8 +2,8 @@ SUMMARY =3D "C++ bindings for the glib library"
 HOMEPAGE =3D "http://www.gtkmm.org/"
 SECTION =3D "libs"
 LICENSE =3D "LGPL-2.1-only & GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D42dfffebc56fec7527aac53b7a89d=
1d8 \
-                    file://COPYING.tools;md5=3D751419260aa954499f7abaaba=
a882bbe"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4bf661c1e3793e55c8d1051bc5e0a=
e21 \
+                    file://COPYING.tools;md5=3D570a9b3749dd0463a1778803b=
12a6dce"
=20
 DEPENDS =3D "mm-common glib-2.0 libsigc++-3 glib-2.0-native"
=20
@@ -12,7 +12,7 @@ inherit gnomebase
=20
 SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('=
.')[1]}"
=20
-SRC_URI[archive.sha256sum] =3D "539b0a29e15a96676c4f0594541250566c5ca44d=
a5d4d87a3732fa2d07909e4a"
+SRC_URI[archive.sha256sum] =3D "0771306711299fbf62e53c752d53ed5816351271=
67a6cc79ae05f2b8421d29d7"
=20
 S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20
--=20
2.50.1


