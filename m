Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F15C04FFE
	for <webhook@archiver.kernel.org>; Sat, 11 May 2024 07:58:25 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.10440.1715414297149637763
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 May 2024 00:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout09.t-online.de (Postfix) with SMTP id 5CCFE15C9B
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 May 2024 09:58:15 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.160.148]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s5hcU-1NX2B90; Sat, 11 May 2024 09:58:14 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/3] gnome-boxes: update 46.0 -> 46.1
Date: Sat, 11 May 2024 09:58:42 +0200
Message-ID: <20240511075842.480843-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240511075842.480843-1-f_l_k@t-online.de>
References: <20240511075842.480843-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1715414294-437FDD34-EBBA6DBF/0/0 CLEAN NORMAL
X-TOI-MSGID: 75df3e85-206d-47e4-a02c-d820c3aab50d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 May 2024 07:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110311

46.1 - Apr 22, 2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Changes since 46.0

  - Fix build with clang
  - Added/updated/fixed translations

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-boxes/{gnome-boxes_46.0.bb =3D> gnome-boxes_46.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome=
-boxes/{gnome-boxes_46.0.bb =3D> gnome-boxes_46.1.bb} (90%)

diff --git a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/=
gnome-boxes/gnome-boxes_46.0.bb b/meta-gnome/dynamic-layers/meta-virtuali=
zation/recipes-gnome/gnome-boxes/gnome-boxes_46.1.bb
similarity index 90%
rename from meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/g=
nome-boxes/gnome-boxes_46.0.bb
rename to meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gno=
me-boxes/gnome-boxes_46.1.bb
index 44fdd2dbe..9ad15d57a 100644
--- a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-b=
oxes/gnome-boxes_46.0.bb
+++ b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-b=
oxes/gnome-boxes_46.1.bb
@@ -31,7 +31,7 @@ RDEPENDS:${PN} =3D "glib-2.0-dev libvirt-virsh qemu-com=
mon qemu-system-x86-64 geni
=20
 inherit gnomebase gsettings pkgconfig mime-xdg gtk-icon-cache gobject-in=
trospection vala features_check
=20
-SRC_URI[archive.sha256sum] =3D "67eeb5e989294958b25c397cfc5615ff65f44315=
c700010f0b9e336e6f3407cb"
+SRC_URI[archive.sha256sum] =3D "900c177f6762640370a6634cf9e7d3cd8207e498=
367a8a667a6b731b04116036"
=20
 GIR_MESON_OPTION =3D ""
 VALA_MESON_OPTION =3D ""
--=20
2.44.0


