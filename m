Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3B5C7EE2C
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 05:45:23 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.7467.1692942318287849570
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 22:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout03.t-online.de (Postfix) with SMTP id BBB935D42F
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 07:45:02 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.212]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qZPd0-2AQiNo0; Fri, 25 Aug 2023 07:45:02 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/5] gnome-boxes: add rdepend on phodav
Date: Fri, 25 Aug 2023 07:44:48 +0200
Message-ID: <20230825054449.2315061-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825054449.2315061-1-f_l_k@t-online.de>
References: <20230825054449.2315061-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692942302-EAFF4029-951CC820/0/0 CLEAN NORMAL
X-TOI-MSGID: 3fc14a80-b5e4-465d-8513-68061d6769d9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 05:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104595

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gnome-boxes/gnome-boxes_44.2.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/=
gnome-boxes/gnome-boxes_44.2.bb b/meta-gnome/dynamic-layers/meta-virtuali=
zation/recipes-gnome/gnome-boxes/gnome-boxes_44.2.bb
index 2ab904f869..a06fc772c8 100644
--- a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-b=
oxes/gnome-boxes_44.2.bb
+++ b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-b=
oxes/gnome-boxes_44.2.bb
@@ -27,7 +27,7 @@ DEPENDS =3D " \
   yelp-tools \
 "
=20
-RDEPENDS:${PN} =3D "glib-2.0-dev libvirt-virsh qemu-common qemu-system-x=
86-64"
+RDEPENDS:${PN} =3D "glib-2.0-dev libvirt-virsh qemu-common qemu-system-x=
86-64 phodav"
=20
 inherit gnomebase gsettings pkgconfig mime-xdg gtk-icon-cache gobject-in=
trospection vala features_check
=20
--=20
2.41.0


