Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D141C4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 16:02:00 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.9951.1707753714284426693
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Feb 2024 08:01:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout10.t-online.de (Postfix) with SMTP id 7D88DAFE6
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 17:01:52 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.40.44]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rZYkh-10VsLh0; Mon, 12 Feb 2024 17:01:51 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libosinfo: use hwdata for ids files
Date: Mon, 12 Feb 2024 17:01:51 +0100
Message-ID: <20240212160151.1628461-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1707753711-55FA4986-3EF59D18/0/0 CLEAN NORMAL
X-TOI-MSGID: 910f8107-733c-4447-87bb-828ae96b54db
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 16:02:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108713

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb b/meta=
-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb
index ca6f9ba3f..68d917ffe 100644
--- a/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb
+++ b/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb
@@ -27,8 +27,8 @@ GIR_MESON_DISABLE_FLAG =3D 'disabled'
 GTKDOC_MESON_OPTION =3D "enable-gtk-doc"
=20
 EXTRA_OEMESON +=3D " \
-	-Dwith-pci-ids-path=3D${datadir}/pci.ids \
-	-Dwith-usb-ids-path=3D${datadir}/usb.ids \
+	-Dwith-pci-ids-path=3D${datadir}/hwdata/pci.ids \
+	-Dwith-usb-ids-path=3D${datadir}/hwdata/usb.ids \
 "
=20
-RDEPENDS:${PN} =3D "pciutils-ids usbids"
+RDEPENDS:${PN} =3D "hwdata"
--=20
2.43.0


