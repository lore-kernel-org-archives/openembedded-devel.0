Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC33BC83F2C
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 15:29:19 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.10232.1693668551512979962
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Sep 2023 08:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout06.t-online.de (Postfix) with SMTP id BC8A4461F
	for <openembedded-devel@lists.openembedded.org>; Sat,  2 Sep 2023 17:29:09 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.168.183]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qcSYa-1Ik3MH0; Sat, 2 Sep 2023 17:29:04 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-boxes: remove dependency on ovmf
Date: Sat,  2 Sep 2023 17:28:56 +0200
Message-ID: <20230902152856.1473780-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1693668545-43FFD2B7-92F54485/0/0 CLEAN NORMAL
X-TOI-MSGID: c0218d58-d4bb-4bb6-a4cd-ef6dcb781848
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 02 Sep 2023 15:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104696

This is not a required build dependency and including it limits the build
to x86.

Add runtime dependency on genisoimage

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gnome-boxes/gnome-boxes_44.2.bb              | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/=
gnome-boxes/gnome-boxes_44.2.bb b/meta-gnome/dynamic-layers/meta-virtuali=
zation/recipes-gnome/gnome-boxes/gnome-boxes_44.2.bb
index 2ab904f86..2f7c02139 100644
--- a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-b=
oxes/gnome-boxes_44.2.bb
+++ b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-b=
oxes/gnome-boxes_44.2.bb
@@ -10,7 +10,6 @@ REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-da=
ta"
 DEPENDS =3D " \
   glib-2.0 \
   desktop-file-utils-native \
-  ovmf \
   libarchive \
   libgudev \
   libhandy \
@@ -27,7 +26,7 @@ DEPENDS =3D " \
   yelp-tools \
 "
=20
-RDEPENDS:${PN} =3D "glib-2.0-dev libvirt-virsh qemu-common qemu-system-x=
86-64"
+RDEPENDS:${PN} =3D "glib-2.0-dev libvirt-virsh qemu-common qemu-system-x=
86-64 genisoimage"
=20
 inherit gnomebase gsettings pkgconfig mime-xdg gtk-icon-cache gobject-in=
trospection vala features_check
=20
--=20
2.41.0


