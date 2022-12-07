Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2F9C352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 17:53:42 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.22702.1670435620315791417
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Dec 2022 09:53:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout05.t-online.de (Postfix) with SMTP id 3DBA25BAA
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Dec 2022 18:53:38 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.147]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p2ybx-1gwdFJ0; Wed, 7 Dec 2022 18:53:38 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-networking][PATCH] spice-gtk: add missing license information
Date: Wed,  7 Dec 2022 18:53:31 +0100
Message-Id: <20221207175331.217141-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670435618-68DE2991-B4FBE3D7/0/0 CLEAN NORMAL
X-TOI-MSGID: 077b09f6-74f0-43d1-939e-9b6f5e704f83
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 17:53:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99979

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-networking/recipes-support/spice/spice-gtk_0.4.1.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.4.1.bb b/m=
eta-networking/recipes-support/spice/spice-gtk_0.4.1.bb
index 58089c0a2..a6130cab3 100644
--- a/meta-networking/recipes-support/spice/spice-gtk_0.4.1.bb
+++ b/meta-networking/recipes-support/spice/spice-gtk_0.4.1.bb
@@ -1,7 +1,12 @@
 SUMMARY =3D "A Gtk client and libraries for SPICE remote desktop servers=
."
 HOMEPAGE =3D "https://spice-space.org"
-LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
+LICENSE =3D "LGPL-2.1-only & BSD-3-Clause & GPL-2.0-only"
+LIC_FILES_CHKSUM =3D " \
+	file://COPYING;md5=3D4fbd65380cdd255951079008b364516c \
+	file://subprojects/spice-common/COPYING;md5=3D4b54a1fd55a448865a0b32d41=
598759d \
+	file://subprojects/keycodemapdb/LICENSE.BSD;md5=3D5ae30ba4123bc4f2fa49a=
a0b0dce887b \
+	file://subprojects/keycodemapdb/LICENSE.GPL2;md5=3D751419260aa954499f7a=
baabaa882bbe \
+"
=20
 SRCREV =3D "74e673d7c3d9cd281d85c691fbc520107066da01"
=20
--=20
2.34.1


