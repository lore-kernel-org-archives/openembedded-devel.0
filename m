Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83EA7C25B75
	for <webhook@archiver.kernel.org>; Fri, 10 May 2024 05:46:51 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.5995.1715320008495727899
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 May 2024 22:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout09.t-online.de (Postfix) with SMTP id 6BA6242C8A
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 May 2024 07:46:46 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.232.205]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s5J5i-00nUnq0; Fri, 10 May 2024 07:46:46 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] flatpak;xdg-desktop-portal: add missing runtime dependency on fuse3-utils
Date: Fri, 10 May 2024 07:47:09 +0200
Message-ID: <20240510054709.4044191-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240510054709.4044191-1-f_l_k@t-online.de>
References: <20240510054709.4044191-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1715320006-224FF89A-B2F4EA27/0/0 CLEAN NORMAL
X-TOI-MSGID: e44d621a-2a17-48fd-bd5d-b085575f3564
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 May 2024 05:46:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110307

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb              | 1 +
 .../xdg-desktop-portal/xdg-desktop-portal_1.18.4.bb             | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.15.8.bb
index 8719d3ef0..fba7bc49a 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
@@ -38,6 +38,7 @@ RDEPENDS:${PN} =3D " \
     ca-certificates \
     dconf \
     flatpak-xdg-utils \
+    fuse3-utils \
 "
=20
 GIR_MESON_OPTION =3D "gir"
diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l_1.18.4.bb b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-port=
al_1.18.4.bb
index 8161ed160..87e8f1f5e 100644
--- a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.18.=
4.bb
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.18.=
4.bb
@@ -22,7 +22,7 @@ PORTAL_BACKENDS ?=3D " \
 	${@bb.utils.contains('DISTRO_FEATURES', 'gtk4', 'xdg-desktop-portal-gtk=
', '', d)} \
 "
=20
-RDEPENDS:${PN} =3D "bubblewrap rtkit ${PORTAL_BACKENDS}"
+RDEPENDS:${PN} =3D "bubblewrap rtkit ${PORTAL_BACKENDS} fuse3-utils"
=20
 inherit meson pkgconfig python3native features_check
=20
--=20
2.44.0


