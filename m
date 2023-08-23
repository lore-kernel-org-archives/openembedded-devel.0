Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDABFEE49B0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 12:47:06 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.10476.1692794826244670177
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Aug 2023 05:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout01.t-online.de (Postfix) with SMTP id B60ABF2DB
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 14:47:02 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.170.236]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qYnGC-2W3Wr40; Wed, 23 Aug 2023 14:46:56 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] gnome-boxes: add recipe
Date: Wed, 23 Aug 2023 14:46:45 +0200
Message-ID: <20230823124645.6878-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823124645.6878-1-f_l_k@t-online.de>
References: <20230823124645.6878-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692794816-FD4002E6-BE72D20E/0/0 CLEAN NORMAL
X-TOI-MSGID: 83e6e394-2c67-43e4-b64b-673c37a577d9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 12:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104547

- use dynamic-layers directory because this recipe depends on meta-virtua=
lization

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-boxes/gnome-boxes_44.2.bb           | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta-gnome/dynamic-layers/meta-virtualization/recipes=
-gnome/gnome-boxes/gnome-boxes_44.2.bb

diff --git a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/=
gnome-boxes/gnome-boxes_44.2.bb b/meta-gnome/dynamic-layers/meta-virtuali=
zation/recipes-gnome/gnome-boxes/gnome-boxes_44.2.bb
new file mode 100644
index 0000000000..59d4d2b287
--- /dev/null
+++ b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-b=
oxes/gnome-boxes_44.2.bb
@@ -0,0 +1,40 @@
+SUMMARY =3D "A simple GNOME application to access virtual machines."
+SECTION =3D "network"
+LICENSE =3D "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM =3D "file://copyright;md5=3Da65e9b0c9f78617732f09f68fc4=
ef79a"
+
+GNOMEBASEBUILDCLASS =3D "meson"
+
+REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
+
+DEPENDS =3D " \
+  glib-2.0 \
+  desktop-file-utils-native \
+  ovmf \
+  libarchive \
+  libgudev \
+  libhandy \
+  libosinfo \
+  libsecret \
+  libsoup \
+  libvirt-glib \
+  mtools \
+  spice-gtk \
+  tracker \
+  webkitgtk3 \
+  appstream-glib-native \
+  spice-protocol \
+  yelp-tools \
+"
+
+RDEPENDS:${PN} =3D "glib-2.0-dev libvirt-virsh qemu-common qemu-system-x=
86-64"
+
+inherit gnomebase gsettings pkgconfig mime-xdg gtk-icon-cache gobject-in=
trospection vala
+
+SRC_URI[archive.sha256sum] =3D "9dd389c149d0c0fa57456ec363d51a88255f9455=
58fb9df42894ce78ef85df89"
+
+GIR_MESON_OPTION =3D ""
+
+FILES:${PN} +=3D "${datadir}"
+
+INSANE_SKIP:${PN} =3D "dev-deps"
--=20
2.41.0


