Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48E6CD37B0
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 21:52:17 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.4029.1695073930373561680
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 14:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout03.t-online.de (Postfix) with SMTP id E65D33482B
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 23:52:08 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.214]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiMA0-3qxV260; Mon, 18 Sep 2023 23:52:04 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 06/18] gnome-boxes: upgrade 44.2 -> 45.0
Date: Mon, 18 Sep 2023 23:51:41 +0200
Message-ID: <20230918215156.1920452-6-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918215156.1920452-1-f_l_k@t-online.de>
References: <20230918215156.1920452-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695073924-477FF5E3-6923BE4D/0/0 CLEAN NORMAL
X-TOI-MSGID: 123b96e7-18c0-4843-9fa2-1602a5b055d0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 21:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104932

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-boxes/{gnome-boxes_44.2.bb =3D> gnome-boxes_45.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome=
-boxes/{gnome-boxes_44.2.bb =3D> gnome-boxes_45.0.bb} (89%)

diff --git a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/=
gnome-boxes/gnome-boxes_44.2.bb b/meta-gnome/dynamic-layers/meta-virtuali=
zation/recipes-gnome/gnome-boxes/gnome-boxes_45.0.bb
similarity index 89%
rename from meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/g=
nome-boxes/gnome-boxes_44.2.bb
rename to meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gno=
me-boxes/gnome-boxes_45.0.bb
index 2f7c02139..f2aeb8878 100644
--- a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-b=
oxes/gnome-boxes_44.2.bb
+++ b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-b=
oxes/gnome-boxes_45.0.bb
@@ -30,7 +30,7 @@ RDEPENDS:${PN} =3D "glib-2.0-dev libvirt-virsh qemu-com=
mon qemu-system-x86-64 geni
=20
 inherit gnomebase gsettings pkgconfig mime-xdg gtk-icon-cache gobject-in=
trospection vala features_check
=20
-SRC_URI[archive.sha256sum] =3D "9dd389c149d0c0fa57456ec363d51a88255f9455=
58fb9df42894ce78ef85df89"
+SRC_URI[archive.sha256sum] =3D "cc63080eefa147a8472ab1a5ff087b97a27ab723=
a4ee005ed41e8c9dd7798e41"
=20
 GIR_MESON_OPTION =3D ""
=20
--=20
2.41.0


