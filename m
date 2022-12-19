Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E395C10F1B
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 13:11:36 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.21022.1671455487459874079
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 05:11:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout08.t-online.de (Postfix) with SMTP id CFCDC1E7B7
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 14:11:22 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.36.130]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p7FvN-2FOh9u0; Mon, 19 Dec 2022 14:11:21 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 02/10] gnome-shell-extensions: update SRC_URI[archive.sha256sum]
Date: Mon, 19 Dec 2022 14:10:33 +0100
Message-Id: <20221219131041.452949-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219131041.452949-1-f_l_k@t-online.de>
References: <20221219131041.452949-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671455481-68DE2991-A79BA93A/0/0 CLEAN NORMAL
X-TOI-MSGID: 8cb2a37a-686e-43da-9f1b-4aeefab011cd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 13:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100097

- remove sassc-native dependency

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-shell/gnome-shell-extensions_43.1.bb              | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_=
43.1.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_43.=
1.bb
index e8c95d6fb..93d791a6b 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_43.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_43.1.bb
@@ -8,11 +8,7 @@ inherit gnomebase gettext gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam gobject-introspecti=
on-data"
=20
-SRC_URI[archive.sha256sum] =3D "3ee65b75b1afd8bcca0a2a03da9b2884787ed40e=
257a881d9aa6ef7c8727602f"
-
-DEPENDS +=3D " \
-    sassc-native \
-"
+SRC_URI[archive.sha256sum] =3D "adde04bd946a13113557e4c34c890bbe9077505a=
6a3f0755f17bea1c6e4a2d17"
=20
 EXTRA_OEMESON +=3D " \
     -Dextension_set=3Dall \
--=20
2.34.1


