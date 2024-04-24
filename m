Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5377C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 13:23:36 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.16204.1713965009545011445
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Apr 2024 06:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout04.t-online.de (Postfix) with SMTP id E312E186AA
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 15:23:05 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.39.163]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rzcaX-1fkw8f0; Wed, 24 Apr 2024 15:23:05 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/3] gupnp: dont package source
Date: Wed, 24 Apr 2024 15:23:27 +0200
Message-ID: <20240424132329.2706-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1713964985-277FDD34-E853411B/0/0 CLEAN NORMAL
X-TOI-MSGID: 04cea89a-2eb6-498c-9944-ea881d6e8472
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 13:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110125

Source code contains reference to tmpdir. Dont package to avoid
reproducibility issue

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.3.bb | 1 +
 meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.3.bb b/=
meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.3.bb
index f2e27622c..c7fee78a8 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.3.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.3.bb
@@ -28,5 +28,6 @@ PACKAGECONFIG[sniffer] =3D "-Dsniffer=3Dtrue,-Dsniffer=3D=
false,gtk4,"
 REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKAGECONFIG', 'sni=
ffer', 'opengl', '', d)}"
=20
 PACKAGES =3D+ "gssdp-tools"
+PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
=20
 FILES:gssdp-tools =3D "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb b/=
meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb
index f1628d82e..80d0b3e2d 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb
@@ -18,4 +18,5 @@ gupnp_sysroot_preprocess () {
=20
 FILES:${PN}-dev +=3D "${bindir}/gupnp-binding-tool*"
=20
+PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
 RDEPENDS:${PN}-dev +=3D "python3-core python3-xml"
--=20
2.44.0


