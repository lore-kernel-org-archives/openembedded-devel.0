Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DE9CD1286
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 08:41:27 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.5311.1711183280306041142
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 01:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout03.t-online.de (Postfix) with SMTP id 4185A452E9
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 09:41:18 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.162]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rnwwD-1MMRGd0; Sat, 23 Mar 2024 09:41:13 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 03/13] gnome-boxes: update 45.0 -> 46.0
Date: Sat, 23 Mar 2024 09:41:28 +0100
Message-ID: <20240323084138.178281-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240323084138.178281-1-f_l_k@t-online.de>
References: <20240323084138.178281-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711183273-0CA7E850-32CBF5BF/0/0 CLEAN NORMAL
X-TOI-MSGID: 390ddbf9-9946-4070-a3b3-9b13412a3038
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 08:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109532

46.0 - Mar 18, 2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Changes since 45.0

  - Disable "secure-boot" for EFI virtual machines
  - Use libportal to call Background Portal
  - Fallback to default resources on error cases
  - Fix crash when processing a non bootable ISO image
  - Fix permissions when copying template files
  - Added/updated/fixed translations

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-boxes/{gnome-boxes_45.0.bb =3D> gnome-boxes_46.0.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome=
-boxes/{gnome-boxes_45.0.bb =3D> gnome-boxes_46.0.bb} (88%)

diff --git a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/=
gnome-boxes/gnome-boxes_45.0.bb b/meta-gnome/dynamic-layers/meta-virtuali=
zation/recipes-gnome/gnome-boxes/gnome-boxes_46.0.bb
similarity index 88%
rename from meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/g=
nome-boxes/gnome-boxes_45.0.bb
rename to meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gno=
me-boxes/gnome-boxes_46.0.bb
index fc1235109..44fdd2dbe 100644
--- a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-b=
oxes/gnome-boxes_45.0.bb
+++ b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-b=
oxes/gnome-boxes_46.0.bb
@@ -14,6 +14,7 @@ DEPENDS =3D " \
   libgudev \
   libhandy \
   libosinfo \
+  libportal \
   libsecret \
   libsoup \
   libvirt-glib \
@@ -30,7 +31,7 @@ RDEPENDS:${PN} =3D "glib-2.0-dev libvirt-virsh qemu-com=
mon qemu-system-x86-64 geni
=20
 inherit gnomebase gsettings pkgconfig mime-xdg gtk-icon-cache gobject-in=
trospection vala features_check
=20
-SRC_URI[archive.sha256sum] =3D "cc63080eefa147a8472ab1a5ff087b97a27ab723=
a4ee005ed41e8c9dd7798e41"
+SRC_URI[archive.sha256sum] =3D "67eeb5e989294958b25c397cfc5615ff65f44315=
c700010f0b9e336e6f3407cb"
=20
 GIR_MESON_OPTION =3D ""
 VALA_MESON_OPTION =3D ""
--=20
2.44.0


