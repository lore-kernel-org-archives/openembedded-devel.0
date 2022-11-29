Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8CB8C433FE
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 06:57:15 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.142760.1669705031701073435
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Nov 2022 22:57:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout10.t-online.de (Postfix) with SMTP id D7CCF10032
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 07:57:09 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.228.163]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ozuY7-3ii2410; Tue, 29 Nov 2022 07:56:59 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 1/7] appstream-glib: update 0.7.18 -> 0.8.2
Date: Tue, 29 Nov 2022 07:56:37 +0100
Message-Id: <20221129065643.82373-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669705019-08E92417-0BD3C138/0/0 CLEAN NORMAL
X-TOI-MSGID: 36d8938c-1933-4185-8224-9d5c03043820
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 06:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99837

Code switched from using soup-2 to libcurl

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{appstream-glib_0.7.18.bb =3D> appstream-glib_0.8.2.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-support/appstream-glib/{appstream-glib_0.7.18.=
bb =3D> appstream-glib_0.8.2.bb} (89%)

diff --git a/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7=
.18.bb b/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.8.2.b=
b
similarity index 89%
rename from meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.=
18.bb
rename to meta-gnome/recipes-support/appstream-glib/appstream-glib_0.8.2.=
bb
index c56e9e3dd..efb85d77c 100644
--- a/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.18.bb
+++ b/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.8.2.bb
@@ -4,12 +4,12 @@ LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
=20
 DEPENDS =3D " \
+    curl \
     gperf-native \
     glib-2.0 \
     gtk+3 \
     libyaml \
     libarchive \
-    libsoup-2.4 \
     json-glib \
     gdk-pixbuf \
     freetype \
@@ -20,7 +20,7 @@ DEPENDS =3D " \
 inherit meson gobject-introspection gettext bash-completion pkgconfig ma=
npages
=20
 SRC_URI =3D "https://people.freedesktop.org/~hughsient/${BPN}/releases/$=
{BP}.tar.xz"
-SRC_URI[sha256sum] =3D "ca1ed22e3bde3912cb903aaa7de085d55771da454f1c0573=
fd9608e1de9c4002"
+SRC_URI[sha256sum] =3D "71256500add5048d6f08878904708b3d0c3875f402e0adcd=
358e91d47dcd8b96"
=20
 EXTRA_OEMESON =3D " \
     -Drpm=3Dfalse \
--=20
2.34.1


