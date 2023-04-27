Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD81CC77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 16:32:53 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.25844.1682613166065404041
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Apr 2023 09:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout08.t-online.de (Postfix) with SMTP id 079BC25FFF
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 18:32:44 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([79.219.227.127]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ps4Xy-3iJHf70; Thu, 27 Apr 2023 18:32:42 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] udisks2: add PACKAGECONFIGs for btrfs,lvm2 and lsm
Date: Thu, 27 Apr 2023 18:32:28 +0200
Message-Id: <20230427163228.2577813-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1682613162-977FDC52-EDCC0F2C/0/0 CLEAN NORMAL
X-TOI-MSGID: 9c2cc1af-f919-43ea-aef0-0f4d64ee7872
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 16:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102214

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/udisks/udisks2_2.9.4.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb b/meta-oe/re=
cipes-support/udisks/udisks2_2.9.4.bb
index 3de555723..203006371 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
@@ -35,6 +35,12 @@ do_configure:prepend() {
     touch ${S}/build-aux/config.rpath
 }
=20
+PACKAGECONFIG ?=3D ""
+
+PACKAGECONFIG[lvm2] =3D "--enable-lvm2,--disable-lvm2,lvm2"
+PACKAGECONFIG[btrfs] =3D "--enable-btrfs,--disable-btrfs,,btrfs-tools"
+PACKAGECONFIG[lsm] =3D "--enable-lsm,--disable-lsm,libstoragemgmt"
+
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1/ \
     ${datadir}/polkit-1 \
--=20
2.34.1


