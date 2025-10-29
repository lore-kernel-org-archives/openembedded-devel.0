Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51A3CCF9EE
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 17:24:09 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.10671.1761758643010879480
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 10:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout06.t-online.de (Postfix) with SMTP id EEF751D0EC
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 18:24:00 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.224.109]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vE9tv-3W2gNt0; Wed, 29 Oct 2025 18:23:59 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-boxes: update 48.0 -> 49.0
Date: Wed, 29 Oct 2025 18:23:54 +0100
Message-ID: <20251029172354.294139-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1761758639-3F7FD880-8FD63660/0/0 CLEAN NORMAL
X-TOI-MSGID: 2b7b5732-a474-405d-9330-73e6411911a8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 17:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121168

49.0 - Sept 16, 2025
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Changes since 49.rc.1

  - Added/updated/fixed translations

49.rc.1 - Aug 29, 2025
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Re-release fixing Flatpak CI build for the release-service CI job

49.rc - Aug 29, 2025
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Changes since 49.alpha

  - Added/updated/fixed translations
  - Default virtual machine storage disks to 30 GiB (from 20 Gib)
  - Add vala 'CCode' attribute for null terminated string array
---
 .../gnome-boxes/{gnome-boxes_48.0.bb =3D> gnome-boxes_49.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome=
-boxes/{gnome-boxes_48.0.bb =3D> gnome-boxes_49.0.bb} (90%)

diff --git a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/=
gnome-boxes/gnome-boxes_48.0.bb b/meta-gnome/dynamic-layers/meta-virtuali=
zation/recipes-gnome/gnome-boxes/gnome-boxes_49.0.bb
similarity index 90%
rename from meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/g=
nome-boxes/gnome-boxes_48.0.bb
rename to meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gno=
me-boxes/gnome-boxes_49.0.bb
index 41f576bcab..ebc630062f 100644
--- a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-b=
oxes/gnome-boxes_48.0.bb
+++ b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-b=
oxes/gnome-boxes_49.0.bb
@@ -34,7 +34,7 @@ RDEPENDS:${PN} =3D "glib-2.0-dev libvirt-virsh qemu-com=
mon qemu-system-x86-64 geni
=20
 inherit gnomebase gsettings pkgconfig mime-xdg gtk-icon-cache gobject-in=
trospection vala features_check
=20
-SRC_URI[archive.sha256sum] =3D "d05f5f42568fafbf6d88771161b06ed5f739d431=
21278d418cae95c56e513ead"
+SRC_URI[archive.sha256sum] =3D "fa47266da6f5ef7a904c5b8769d4d871bccd4e6b=
639a363c3235438d7b0e757a"
=20
 GIR_MESON_OPTION =3D ""
 VALA_MESON_OPTION =3D ""
--=20
2.51.0


