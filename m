Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDEECF9C4D
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:08:11 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.20379.1726844888086048060
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id 902C91687B
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 17:07:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srfES-3JaG0I0; Fri, 20 Sep 2024 17:07:40 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 02/23] gnome-boxes: update 46.1 -> 47.0
Date: Fri, 20 Sep 2024 17:08:01 +0200
Message-ID: <20240920150822.1131707-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920150822.1131707-1-f_l_k@t-online.de>
References: <20240920150822.1131707-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726844860-B6FFB467-73E31C3C/0/0 CLEAN NORMAL
X-TOI-MSGID: 02b13d02-95d2-42ff-afef-a58d7461f933
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 15:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112408

47.0 - Sep 17, 2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Changes since 47.beta

  - Add HW and brand colors info to metainfo file
  - Rename metainfo file to o.g.B.metainfo.xml.in
  - Don't consider distro derivatives when resolving logos
  - Added/updated/fixed translations

47.beta - Aug 14, 2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Changes since 46.1

  - Fix appdata validation for "Devel" build profile
  - Check when a libvirt-broker reference is invalid
  - Improve some print format specifiers
  - Add "Trisquel" logo
  - Various CI fixes
  - Added/updated/fixed translations

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-boxes/{gnome-boxes_46.1.bb =3D> gnome-boxes_47.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome=
-boxes/{gnome-boxes_46.1.bb =3D> gnome-boxes_47.0.bb} (88%)

diff --git a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/=
gnome-boxes/gnome-boxes_46.1.bb b/meta-gnome/dynamic-layers/meta-virtuali=
zation/recipes-gnome/gnome-boxes/gnome-boxes_47.0.bb
similarity index 88%
rename from meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/g=
nome-boxes/gnome-boxes_46.1.bb
rename to meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gno=
me-boxes/gnome-boxes_47.0.bb
index 6272065de..fca055d39 100644
--- a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-b=
oxes/gnome-boxes_46.1.bb
+++ b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-b=
oxes/gnome-boxes_47.0.bb
@@ -20,7 +20,7 @@ DEPENDS =3D " \
   libvirt-glib \
   mtools \
   spice-gtk \
-  tracker \
+  tinysparql \
   webkitgtk3 \
   appstream-glib-native \
   spice-protocol \
@@ -31,7 +31,7 @@ RDEPENDS:${PN} =3D "glib-2.0-dev libvirt-virsh qemu-com=
mon qemu-system-x86-64 geni
=20
 inherit gnomebase gsettings pkgconfig mime-xdg gtk-icon-cache gobject-in=
trospection vala features_check
=20
-SRC_URI[archive.sha256sum] =3D "900c177f6762640370a6634cf9e7d3cd8207e498=
367a8a667a6b731b04116036"
+SRC_URI[archive.sha256sum] =3D "65bf6c2de1bf4d51695c9192c5b1e6285cb32c98=
a18aa948a376ea32038bc78f"
=20
 GIR_MESON_OPTION =3D ""
 VALA_MESON_OPTION =3D ""
--=20
2.46.0


