Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B01C61DA4
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 02:52:31 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.6048.1678157547964770724
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Mar 2023 18:52:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout02.t-online.de (Postfix) with SMTP id E442B141E5
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Mar 2023 03:52:14 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.228.81]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pZNQu-1dyfWj0; Tue, 7 Mar 2023 03:52:08 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] dav1d: add recipe
Date: Tue,  7 Mar 2023 03:51:59 +0100
Message-Id: <20230307025200.4033685-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1678157528-E4D742C2-DE3E951E/0/0 CLEAN NORMAL
X-TOI-MSGID: d13b185e-7a07-46c4-8e86-5168001c6aee
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Mar 2023 02:52:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101404

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-multimedia/dav1d/dav1d_1.1.0.bb     | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/dav1d/dav1d_1.1.0.=
bb

diff --git a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.1.0.bb b/me=
ta-multimedia/recipes-multimedia/dav1d/dav1d_1.1.0.bb
new file mode 100644
index 000000000..33dbef352
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.1.0.bb
@@ -0,0 +1,17 @@
+SUMMARY =3D "dav1d AV1 decoder"
+DESCRIPTION =3D "Targeted to be small, portable and fast."
+HOMEPAGE =3D "https://code.videolan.org/videolan/dav1d"
+SECTION =3D "multimedia"
+LICENSE =3D "BSD-2-Clause"
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc8055cfe7548dfdaa3a6dc45d8793=
669"
+
+SRC_URI =3D "git://code.videolan.org/videolan/dav1d.git;protocol=3Dhttps=
;branch=3Dmaster"
+SRCREV =3D "9593e625b75d498d1edea544da21ea764b98d507"
+
+S =3D "${WORKDIR}/git"
+
+DEPENDS:append:x86 =3D " nasm-native"
+DEPENDS:append:x86-64 =3D " nasm-native"
+
+inherit meson
--=20
2.34.1


