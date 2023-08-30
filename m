Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A274BC83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 16:23:43 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.1628.1693412618033968926
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 09:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout02.t-online.de (Postfix) with SMTP id 581FB4FB5
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 18:23:36 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.36.217]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qbNyh-0sOeqf0; Wed, 30 Aug 2023 18:23:35 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libosinfo: build vapi only if gobject-introspection is enabled
Date: Wed, 30 Aug 2023 18:23:30 +0200
Message-ID: <20230830162330.2967-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1693412616-EBFF2029-654B9329/0/0 CLEAN NORMAL
X-TOI-MSGID: 85740e84-5558-4649-bd11-601ca7e9dcd1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 16:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104671

this fixes:
meson.build:40:8: ERROR: Problem encountered: vala support was requested,=
 but introspection support is mandatory.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/libosinfo/libosinfo_1.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libosinfo/libosinfo_1.10.bb b/meta-o=
e/recipes-support/libosinfo/libosinfo_1.10.bb
index b02bc1281..d724c52ea 100644
--- a/meta-oe/recipes-support/libosinfo/libosinfo_1.10.bb
+++ b/meta-oe/recipes-support/libosinfo/libosinfo_1.10.bb
@@ -23,10 +23,10 @@ GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
 GTKDOC_MESON_OPTION =3D "enable-gtk-doc"
=20
-EXTRA_OEMESON =3D " \
+EXTRA_OEMESON +=3D " \
 	-Dwith-pci-ids-path=3D${datadir}/pci.ids \
 	-Dwith-usb-ids-path=3D${datadir}/usb.ids \
-	-Denable-vala=3Denabled \
+	${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Denable-vala=3Denable=
d', '-Denable-vala=3Ddisabled', d)} \
 "
=20
 RDEPENDS:${PN} =3D "pciutils-ids usbids"
--=20
2.41.0


