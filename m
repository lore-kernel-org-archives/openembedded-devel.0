Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E680C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 16:49:27 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.817.1716310163832728701
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 09:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout11.t-online.de (Postfix) with SMTP id 46D39910
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:49:22 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.175.137]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s9Sft-2Lp91d0; Tue, 21 May 2024 18:49:17 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] flatpak: add PACKAGECONFIG knob for malcontent
Date: Tue, 21 May 2024 18:49:45 +0200
Message-ID: <20240521164945.333290-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1716310157-257F9DFC-492145B2/0/0 CLEAN NORMAL
X-TOI-MSGID: c4ca9cb5-d753-4ec2-8f04-011f1d03cfd3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 16:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110448

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.15.8.bb
index fba7bc49a..8351e7d65 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
@@ -55,6 +55,7 @@ PACKAGECONFIG[soup] =3D "-Dhttp_backend=3Dsoup,,libsoup=
-2.4"
 PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse,xauth socat-nat=
ive"
 PACKAGECONFIG[xauth] =3D "-Dxauth=3Denabled,-Dxauth=3Ddisabled,xauth"
 PACKAGECONFIG[seccomp] =3D "-Dseccomp=3Denabled,-Dseccomp=3Ddisabled,lib=
seccomp"
+PACKAGECONFIG[malcontent] =3D "-Dmalcontent=3Denabled,-Dmalcontent=3Ddis=
abled,malcontent"
 PACKAGECONFIG[selinux] =3D "-Dselinux_module=3Denabled,-Dselinux_module=3D=
disabled,libselinux"
 PACKAGECONFIG[wayland-security-context] =3D "-Dwayland_security_context=3D=
enabled,-Dwayland_security_context=3Ddisabled,wayland wayland-native wayl=
and-protocols"
=20
--=20
2.44.0


