Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016B9C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 17:35:58 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.2105.1716312949819251286
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 10:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout04.t-online.de (Postfix) with SMTP id 2BC0CACA0
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 19:35:47 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.175.137]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s9TOq-0mbo1Z0; Tue, 21 May 2024 19:35:44 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-boxes: fix build with gcc14
Date: Tue, 21 May 2024 19:36:11 +0200
Message-ID: <20240521173611.1103386-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1716312944-C77FC3AB-59781721/0/0 CLEAN NORMAL
X-TOI-MSGID: 5deb9d59-7630-4d37-bb03-a449a1e38772
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 17:35:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110449

Workaround for int-conversion:
| In file included from ../recipe-sysroot/usr/include/glib-2.0/glib.h:64,
|                  from ../recipe-sysroot/usr/include/glib-2.0/gobject/gb=
inding.h:30,
|                  from ../recipe-sysroot/usr/include/glib-2.0/glib-objec=
t.h:24,
|                  from src/gnome-boxes.p/libvirt-broker.c:6:
| src/gnome-boxes.p/libvirt-broker.c: In function 'boxes_libvirt_broker_a=
dd_domain_co':
| ../recipe-sysroot/usr/include/glib-2.0/glib/gmessages.h:671:16: error: =
returning 'void *' from a function with return type 'gboolean' {aka 'int'=
} makes integer from pointer without a cast [-Wint-conversion]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gnome-boxes/gnome-boxes_46.1.bb               | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/=
gnome-boxes/gnome-boxes_46.1.bb b/meta-gnome/dynamic-layers/meta-virtuali=
zation/recipes-gnome/gnome-boxes/gnome-boxes_46.1.bb
index 9ad15d57a..6272065de 100644
--- a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-b=
oxes/gnome-boxes_46.1.bb
+++ b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-b=
oxes/gnome-boxes_46.1.bb
@@ -36,6 +36,8 @@ SRC_URI[archive.sha256sum] =3D "900c177f6762640370a6634=
cf9e7d3cd8207e498367a8a667a
 GIR_MESON_OPTION =3D ""
 VALA_MESON_OPTION =3D ""
=20
+CFLAGS +=3D "-Wno-int-conversion"
+
 FILES:${PN} +=3D "${datadir}"
=20
 INSANE_SKIP:${PN} =3D "dev-deps"
--=20
2.44.0


