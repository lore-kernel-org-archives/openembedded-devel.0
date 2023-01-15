Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C313C63797
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 16:53:00 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.143999.1673801579541274040
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Jan 2023 08:53:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout06.t-online.de (Postfix) with SMTP id 3D7A524C3D
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Jan 2023 17:52:57 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.227.227]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pH6Fd-04S56P0; Sun, 15 Jan 2023 17:52:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] webp-pixbuf-loader: add recipe
Date: Sun, 15 Jan 2023 17:52:48 +0100
Message-Id: <20230115165248.5628-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-MSGID: 9da2f1f8-ac26-4d48-a1fa-661883f66e1c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Jan 2023 16:53:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100572

This adds a gdk-pixbuf loader for webp images. It fixes thumbnailing and
adds support for webp in e.g. gnome-viewer (eog).
gnome-background contains lots of webp images. The default wallpaper is
set to 'adwaita-d.webp' and gnome-shell fails to load it.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../webp-pixbuf-loader_0.7.bb                 | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-gnome/recipes-support/webp-pixbuf-loader/webp-pi=
xbuf-loader_0.7.bb

diff --git a/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-lo=
ader_0.7.bb b/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-l=
oader_0.7.bb
new file mode 100644
index 000000000..17a343674
--- /dev/null
+++ b/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.=
7.bb
@@ -0,0 +1,23 @@
+SUMMARY =3D "WebP GDK Pixbuf Loader library"
+HOMEPAGE =3D "https://github.com/aruiz/webp-pixbuf-loader"
+LICENSE =3D "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL-2;md5=3D0d90e6d44bcf69014bfae6=
49c75aa6ca"
+
+DEPENDS =3D " \
+    gdk-pixbuf \
+    libwebp \
+"
+
+inherit meson pkgconfig
+
+EXTRA_OEMESON =3D "-Dupdate_cache=3Dtrue"
+
+SRC_URI =3D "git://github.com/aruiz/webp-pixbuf-loader.git;protocol=3Dht=
tps;nobranch=3D1"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "f91f79c05ff90b41774eda613dc10a2a0d996bc8"
+
+FILES:${PN} =3D " \
+    ${datadir}/thumbnailers/webp-pixbuf.thumbnailer \
+    ${libdir}/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-webp.so \
+"
--=20
2.34.1


