Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1831BC3ABAF
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 23:52:46 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.125970.1726444357365515012
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 16:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout02.t-online.de (Postfix) with SMTP id 478B1277A8
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Sep 2024 01:52:33 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.33.165]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1spz2d-2CEdHt0; Mon, 16 Sep 2024 01:52:32 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] rygel: update 0.42.5 -> 0.44.0
Date: Mon, 16 Sep 2024 01:54:14 +0200
Message-ID: <20240915235414.813971-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1726444352-44FF746E-94C049E9/0/0 CLEAN NORMAL
X-TOI-MSGID: cdbbfe47-3898-4380-ad02-8a2281e41e37
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 23:52:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112318

0.44.0 (stable)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

All:
 - Translation updates

All contributors to this release:
 - Sabri =C3=9Cnal <yakushabb@gmail.com>
 - Chao-Hsiung Liao <j_h_liau@yahoo.com.tw>

Added/updated translations:
 - tr.po, courtesy of Sabri =C3=9Cnal
 - zh_TW.po, courtesy of Cheng-Chia Tseng

0.43.0 (unstable)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Minimum Soup version required is now 3.2

Tracker:
  - Plugin removed, please use Tracker3
LMS:
  - Plugin removed

All contributors to this release:
 - Jens Georg <mail@jensge.org>
 - Piotr Dr=C4=85g <piotrdrag@gmail.com>
 - Scrambled 777 <weblate.scrambled777@simplelogin.com>

Added/updated translations:
 - hi.po, courtesy of Scrambled777

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../rygel/{rygel_0.42.5.bb =3D> rygel_0.44.0.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-connectivity/rygel/{rygel_0.42.5.bb =3D> =
rygel_0.44.0.bb} (97%)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.5.bb b=
/meta-multimedia/recipes-connectivity/rygel/rygel_0.44.0.bb
similarity index 97%
rename from meta-multimedia/recipes-connectivity/rygel/rygel_0.42.5.bb
rename to meta-multimedia/recipes-connectivity/rygel/rygel_0.44.0.bb
index e79bd77a5..8a506af44 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.5.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.44.0.bb
@@ -20,7 +20,7 @@ inherit gnomebase features_check vala gobject-introspec=
tion gettext systemd
 # gobject-introspection is mandatory for libmediaart-2.0 and cannot be c=
onfigured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data x11"
=20
-SRC_URI[archive.sha256sum] =3D "1133602d2e6710aade6b22aa98d93384c8d56396=
f344763413e96e0110b7d89f"
+SRC_URI[archive.sha256sum] =3D "5e1a76507209290530e6ce0141fc76946009edfb=
0fac3ed9432130821e5e4e72"
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
--=20
2.46.0


