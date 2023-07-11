Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CDEEB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 17:48:47 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.2727.1689097717762848683
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 10:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout01.t-online.de (Postfix) with SMTP id F01C82CB97
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jul 2023 19:48:35 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.45.62]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qJHTX-20A8A60; Tue, 11 Jul 2023 19:48:35 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/3] gnome-shell: upgrade 44.2 -> 44.3
Date: Tue, 11 Jul 2023 19:48:26 +0200
Message-Id: <20230711174827.53666-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711174827.53666-1-f_l_k@t-online.de>
References: <20230711174827.53666-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1689097715-1301F931-DFECE039/0/0 CLEAN NORMAL
X-TOI-MSGID: 3846381a-2231-4a59-aa34-865e73ef5b5b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jul 2023 17:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103730

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-shell/{gnome-shell_44.2.bb =3D> gnome-shell_44.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_44.2.bb =3D> gn=
ome-shell_44.3.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.2.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.3.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.2.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.3.bb
index 09995e51e4..e1aa051ef4 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.3.bb
@@ -32,7 +32,7 @@ GIR_MESON_OPTION =3D ""
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "55f279ec6303b7c0c89246eced81247c87fc1c73=
948f45eb212a647218d1b63f"
+SRC_URI[archive.sha256sum] =3D "55694b71c2ee4eaef60d93428003f2eaa4cf0018=
6848f5e36b45cfe506fc31bf"
 SRC_URI +=3D "file://0001-Introduce-options-gjs_path-to-optionally-set-p=
ath-to.patch"
=20
 PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
--=20
2.34.1


