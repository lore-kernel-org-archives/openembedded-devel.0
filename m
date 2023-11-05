Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD74C4167D
	for <webhook@archiver.kernel.org>; Sun,  5 Nov 2023 20:05:44 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.37805.1699214736379428813
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Nov 2023 12:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout08.t-online.de (Postfix) with SMTP id 93DFAD191
	for <openembedded-devel@lists.openembedded.org>; Sun,  5 Nov 2023 21:05:28 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.36.196]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qzjNA-4A7hMS0; Sun, 5 Nov 2023 21:05:28 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 4/4] libgsf: Upgrade 1.14.50 -> 1.14.51
Date: Sun,  5 Nov 2023 21:05:42 +0100
Message-ID: <20231105200542.13519-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231105200542.13519-1-f_l_k@t-online.de>
References: <20231105200542.13519-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699214728-EEFFADD2-8B67DE45/0/0 CLEAN NORMAL
X-TOI-MSGID: 9188111e-eab7-4a01-bb4e-61b86b960680
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Nov 2023 20:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106388

License changed to LGPL-2.1-only
https://gitlab.gnome.org/GNOME/libgsf/-/commit/037c913eb631349c410ef45e49=
697bf5c46dac8a

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libgsf/{libgsf_1.14.50.bb =3D> libgsf_1.14.51.bb}        | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.50.bb =3D> libgsf_1.=
14.51.bb} (60%)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.50.bb b/meta-gno=
me/recipes-gnome/libgsf/libgsf_1.14.51.bb
similarity index 60%
rename from meta-gnome/recipes-gnome/libgsf/libgsf_1.14.50.bb
rename to meta-gnome/recipes-gnome/libgsf/libgsf_1.14.51.bb
index d2486a035..e213f60bc 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.50.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.51.bb
@@ -1,7 +1,6 @@
 SUMMARY =3D "GNOME Structured File Library"
-LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddc7371b50816c96e145fa0f8ade8e=
24d \
-                    file://COPYING.LIB;md5=3D61464cfe342798eeced82efe9ae=
55f63"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D61464cfe342798eeced82efe9ae55=
f63"
=20
 SECTION =3D "libs"
=20
@@ -9,7 +8,7 @@ DEPENDS=3D "libxml2 bzip2 glib-2.0 zlib gnome-common-nati=
ve"
=20
 inherit gnomebase gobject-introspection gettext gtk-doc
=20
-SRC_URI[archive.sha256sum] =3D "6e6c20d0778339069d583c0d63759d297e817ea1=
0d0d897ebbe965f16e2e8e52"
+SRC_URI[archive.sha256sum] =3D "f0b83251f98b0fd5592b11895910cc0e19f79811=
0b389aba7da1cb7c474017f5"
 SRC_URI +=3D "file://0001-configure.ac-drop-a-copy-paste-of-introspectio=
n.m4-m.patch"
=20
 PACKAGECONFIG ??=3D ""
--=20
2.42.0


