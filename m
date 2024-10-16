Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A994D20688
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 01:49:43 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.13400.1729043378244026443
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Oct 2024 18:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout09.t-online.de (Postfix) with SMTP id 6B19721DA
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 03:49:36 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.199]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t0tAM-2CluCn0; Wed, 16 Oct 2024 03:49:34 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] rygel: update 0.44.0 -> 0.44.1
Date: Wed, 16 Oct 2024 03:51:34 +0200
Message-ID: <20241016015134.581290-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1729043374-54FF75C8-FD947359/0/0 CLEAN NORMAL
X-TOI-MSGID: 9af8e3e7-41a1-4051-a63c-138f9c1cd2d0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 01:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112932

Release 0.44.1

Server:
 - Fix progress reporting for ImportResource

MediaExport:
 - Fix a critical when unable to detect mime type

All contributors to this release:
 - Jens Georg <mail@jensge.org>

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../rygel/{rygel_0.44.0.bb =3D> rygel_0.44.1.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-connectivity/rygel/{rygel_0.44.0.bb =3D> =
rygel_0.44.1.bb} (97%)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.44.0.bb b=
/meta-multimedia/recipes-connectivity/rygel/rygel_0.44.1.bb
similarity index 97%
rename from meta-multimedia/recipes-connectivity/rygel/rygel_0.44.0.bb
rename to meta-multimedia/recipes-connectivity/rygel/rygel_0.44.1.bb
index 8a506af44..b5329a9a3 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.44.0.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.44.1.bb
@@ -20,7 +20,7 @@ inherit gnomebase features_check vala gobject-introspec=
tion gettext systemd
 # gobject-introspection is mandatory for libmediaart-2.0 and cannot be c=
onfigured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data x11"
=20
-SRC_URI[archive.sha256sum] =3D "5e1a76507209290530e6ce0141fc76946009edfb=
0fac3ed9432130821e5e4e72"
+SRC_URI[archive.sha256sum] =3D "7b2c631b842408da27a54242f8082aba49bd1ca0=
2041e79e1eefba0c7009a87b"
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
--=20
2.47.0


