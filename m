Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D07C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 06:51:22 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.22645.1699599072409678232
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Nov 2023 22:51:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout06.t-online.de (Postfix) with SMTP id 03226188C1
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 07:51:10 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.113]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r1LMD-3847zV0; Fri, 10 Nov 2023 07:51:09 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] gssdp: Fix build with api-documentation enabled
Date: Fri, 10 Nov 2023 07:51:32 +0100
Message-ID: <20231110065132.393404-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699599069-D7FFC93F-2DB8E90F/0/0 CLEAN NORMAL
X-TOI-MSGID: f57e91d4-8042-44df-a66b-de1e7e644a1e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 06:51:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106526

This fixes:
| Run-time dependency gi-docgen found: YES 2023.1
| Program gi-docgen found: NO
|
| ../gssdp-1.4.0.1/doc/meson.build:4:11: ERROR: Program 'gi-docgen' not f=
ound or
not executable

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb =
b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
index ad99bbffa..be1f865de 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
@@ -16,7 +16,7 @@ DEPENDS =3D " \
     libsoup-2.4 \
 "
=20
-inherit meson pkgconfig gobject-introspection vala gtk-doc features_chec=
k
+inherit meson pkgconfig gobject-introspection vala gi-docgen features_ch=
eck
=20
 SNIFFER =3D "${@bb.utils.contains("BBFILE_COLLECTIONS", "gnome-layer", "=
sniffer", "", d)}"
=20
--=20
2.42.0


