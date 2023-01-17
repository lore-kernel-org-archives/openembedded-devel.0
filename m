Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22328C63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:59:33 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.191369.1673942368796931713
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:59:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout05.t-online.de (Postfix) with SMTP id D4B2616261
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 08:59:25 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.226.203]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pHgsN-4bRJa50; Tue, 17 Jan 2023 08:59:23 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] gnome-shell: update 43.1 -> 43.2
Date: Tue, 17 Jan 2023 08:59:16 +0100
Message-Id: <20230117075916.105020-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1673942363-12796992-BC276265/0/0 CLEAN NORMAL
X-TOI-MSGID: 11c9aafa-a0ce-4323-a3b3-111c630fdb9a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:59:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100632

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-shell/{gnome-shell_43.1.bb =3D> gnome-shell_43.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_43.1.bb =3D> gn=
ome-shell_43.2.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.1.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.2.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.1.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.2.bb
index 14163a186..d3bd357d5 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.2.bb
@@ -32,7 +32,7 @@ GIR_MESON_OPTION =3D ""
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "df0444765def1bd0afee9617d2b5919bc79b4db8=
6e7e757ac0e1f73748ec1bdc"
+SRC_URI[archive.sha256sum] =3D "e76fd4be9342410ee9fbdcdd6b2d81c6ff060e7c=
8cc5a0f1cae6a7aba25d1860"
 SRC_URI +=3D "file://0001-Introduce-options-gjs_path-to-optionally-set-p=
ath-to.patch"
=20
 PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
--=20
2.34.1


