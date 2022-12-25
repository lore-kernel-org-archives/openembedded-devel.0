Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2ABC4167B
	for <webhook@archiver.kernel.org>; Sun, 25 Dec 2022 13:41:33 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.118087.1671975691360426109
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Dec 2022 05:41:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout09.t-online.de (Postfix) with SMTP id 6910E1A4C7
	for <openembedded-devel@lists.openembedded.org>; Sun, 25 Dec 2022 14:41:23 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.228.127]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p9RFa-0vWWKP0; Sun, 25 Dec 2022 14:41:14 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 1/2] flatpak-xdg-utils: add recipe
Date: Sun, 25 Dec 2022 14:40:51 +0100
Message-Id: <20221225134052.1667387-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671975674-2508E98D-FDB2E859/0/0 CLEAN NORMAL
X-TOI-MSGID: b404a3b5-8336-4170-b93d-fc49fd47a660
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Dec 2022 13:41:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100226

Helper tools for sandboxed applications

Provides support for thumbnailing, email and xdg-open

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../flatpak/flatpak-xdg-utils_1.0.5.bb             | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.=
0.5.bb

diff --git a/meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.5.bb =
b/meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.5.bb
new file mode 100644
index 000000000..423c6faf7
--- /dev/null
+++ b/meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.5.bb
@@ -0,0 +1,14 @@
+DESCRIPTION =3D "This repository contains a number of commandline utilit=
ies for use inside Flatpak sandboxes."
+HOMEPAGE =3D "http://flatpak.org"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
+
+SRC_URI =3D "git://github.com/flatpak/flatpak-xdg-utils.git;protocol=3Dh=
ttps;branch=3Dmain"
+
+SRCREV =3D "5ba39872f81bf8d98d58c5f8acb86604645be468"
+
+S =3D "${WORKDIR}/git"
+
+inherit meson pkgconfig
+
+DEPENDS =3D "glib-2.0"
--=20
2.34.1


