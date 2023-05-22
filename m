Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98572C77B75
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 10:20:08 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.18672.1684750801868895137
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 03:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout10.t-online.de (Postfix) with SMTP id 2A16322A47
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 12:19:59 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.34.41]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q12dv-1SYrdj0; Mon, 22 May 2023 12:19:55 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 3/3] gnome-shell: update 43.2 -> 44.1
Date: Mon, 22 May 2023 12:19:41 +0200
Message-Id: <20230522101941.766602-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230522101941.766602-1-f_l_k@t-online.de>
References: <20230522101941.766602-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684750795-137FEE62-D4647DF2/0/0 CLEAN NORMAL
X-TOI-MSGID: ab9a2696-5eaa-4680-ad3b-32e516a815ef
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 10:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102704

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-shell-extensions_44.0.bb =3D> gnome-shell-extensions_44.1.bb} | 0
 .../gnome-shell/{gnome-shell_43.2.bb =3D> gnome-shell_44.1.bb}    | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell-extensions_44.0=
.bb =3D> gnome-shell-extensions_44.1.bb} (100%)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_43.2.bb =3D> gn=
ome-shell_44.1.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_=
44.0.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_44.=
1.bb
similarity index 100%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_4=
4.0.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_44.=
1.bb
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.2.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.1.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.2.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.1.bb
index d3bd357d5e..f8f500afeb 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.1.bb
@@ -32,7 +32,7 @@ GIR_MESON_OPTION =3D ""
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "e76fd4be9342410ee9fbdcdd6b2d81c6ff060e7c=
8cc5a0f1cae6a7aba25d1860"
+SRC_URI[archive.sha256sum] =3D "0bfbe4394d267625154d08d01467bdbd99e81575=
12fc8df45d5c02ddb7551ca6"
 SRC_URI +=3D "file://0001-Introduce-options-gjs_path-to-optionally-set-p=
ath-to.patch"
=20
 PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
--=20
2.34.1


