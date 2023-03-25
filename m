Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED3FC77B6C
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:20 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.17410.1679731395419660655
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 71EC11CBF1
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:12 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyro-0RoPha0; Sat, 25 Mar 2023 09:03:12 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 18/32] gnome-shell: update 43.2 -> 44.0
Date: Sat, 25 Mar 2023 09:02:42 +0100
Message-Id: <20230325080256.923752-18-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731392-85D6DC08-B3CB7E4C/0/0 CLEAN NORMAL
X-TOI-MSGID: 30cfaf2e-8fc3-475c-b885-373e6a5eda1b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101732

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-shell/{gnome-shell_43.2.bb =3D> gnome-shell_44.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_43.2.bb =3D> gn=
ome-shell_44.0.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.2.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.0.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.2.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.0.bb
index d3bd357d5..148e7457e 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.0.bb
@@ -32,7 +32,7 @@ GIR_MESON_OPTION =3D ""
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "e76fd4be9342410ee9fbdcdd6b2d81c6ff060e7c=
8cc5a0f1cae6a7aba25d1860"
+SRC_URI[archive.sha256sum] =3D "3310adc1dd4e210998d59f3871bc31f7e0491542=
8d9ced88c2a66b2b05d6c00a"
 SRC_URI +=3D "file://0001-Introduce-options-gjs_path-to-optionally-set-p=
ath-to.patch"
=20
 PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
--=20
2.34.1


