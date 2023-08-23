Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD041EE4993
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 12:20:16 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.10032.1692793212471877137
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Aug 2023 05:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout07.t-online.de (Postfix) with SMTP id D43621B741
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 14:20:10 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.170.236]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qYmqH-0tEM2k0; Wed, 23 Aug 2023 14:20:10 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/5] libcacard: add recipe
Date: Wed, 23 Aug 2023 14:19:54 +0200
Message-ID: <20230823121957.5626-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823121957.5626-1-f_l_k@t-online.de>
References: <20230823121957.5626-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692793210-7D1FCE98-29CBB61D/0/0 CLEAN NORMAL
X-TOI-MSGID: 8e6b4b33-25f8-41a7-9d43-08ff86d8afb9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 12:20:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104542

libcacard is a library that adds smartcard support to qemu and/or spice

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-support/spice/libcacard_2.8.1.bb        | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-networking/recipes-support/spice/libcacard_2.8.1=
.bb

diff --git a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb b/m=
eta-networking/recipes-support/spice/libcacard_2.8.1.bb
new file mode 100644
index 0000000000..c81322e680
--- /dev/null
+++ b/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
@@ -0,0 +1,13 @@
+SUMMARY =3D "This library provides emulation of smart cards to a virtual=
 card reader running in a guest virtual machine."
+LICENSE =3D "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D79ffa0ec772fa86740948cb7327a0=
cc7"
+
+DEPENDS =3D "glib-2.0 pcsc-lite nss"
+
+SRCREV =3D "7b07684ea6698d4885ff2062350ad8798a04de42"
+
+SRC_URI =3D "git://gitlab.freedesktop.org/spice/libcacard.git;protocol=3D=
https;branch=3Dmaster"
+
+S =3D "${WORKDIR}/git"
+
+inherit meson pkgconfig
--=20
2.41.0


