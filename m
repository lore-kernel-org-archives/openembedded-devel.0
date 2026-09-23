Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF97C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 17:19:16 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.725.1790183947783384692
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 10:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=cMnmrvVj;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout05.t-online.de (Postfix) with SMTP id B159611E8
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 19:19:05 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.231.31]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x9Qcb-3YeN8q0; Wed, 23 Sep 2026 19:19:05 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] libpeas: build the vapi whenever introspection data is enabled
Date: Wed, 23 Sep 2026 19:18:56 +0200
Message-ID: <20260923171856.6344-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790183945-59FF8936-6E06B744/0/0 CLEAN NORMAL
X-TOI-MSGID: ef7c23f3-6de3-43fc-93e6-038a716fb01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790183945; i=f_l_k@t-online.de;
	bh=xvdNH+t9QwD/C2w4j7YlsTiLXlgyYNy4IaXTOVCg9kU=;
	h=From:To:Subject:Date;
	b=cMnmrvVjqcJe2SNEJwVIlcjA5YOdqNXqRmfzZ/wXY9laKLadpqyRoMDrRMNAdotp1
	 zXpTgJnyI9ah9rtvEQOSjlsN/4cgRQ/HhvrwjAZdZeWtIqqPOM1Zxw/4pMs5TjRST6
	 gzpiI/2TGEcwF5Ckfgu4HCHjDXTIyjKsRQrNmbhVL2XXi+Vnsfn3GgwO4lKOO/8z0x
	 njZVhIQunewj2tgeEmxO3uGnye1zRndTjRE4Jp/MSCqrSsAf7SSI9I2OZmnzVu+Mc5
	 yd+OO70Jhdjq7tn59qZwuRGnQYtNUU0+VAOaXPbVR+f+2Cna40ZgXt/WWNcQeu7LP4
	 4eEq3+P5Dn93w==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 17:19:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130242

The vala PACKAGECONFIG was gated on a gobject-introspection distro
feature that does not exist, so libpeas-2.vapi was never built on a
standard distro and convey failed with 'Package libpeas-2 not found in
specified Vala API directories'. Gate it on GI_DATA_ENABLED instead,
like librsvg and libical do; meson skips the vapi without the gir
anyway.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/libpeas/libpeas_2.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libpeas/libpeas_2.2.1.bb b/meta-gno=
me/recipes-gnome/libpeas/libpeas_2.2.1.bb
index 4c9c4666a5..e31034e185 100644
--- a/meta-gnome/recipes-gnome/libpeas/libpeas_2.2.1.bb
+++ b/meta-gnome/recipes-gnome/libpeas/libpeas_2.2.1.bb
@@ -10,7 +10,7 @@ inherit gnomebase gobject-introspection vala gi-docgen
 SRC_URI +=3D "file://disable-lgi-check.patch"
 SRC_URI[archive.sha256sum] =3D "589eca89b437006edf3755478df037c740a2a84c=
fa5d202dbad6095e828e2488"
=20
-PACKAGECONFIG ?=3D "python3 gjs lua51 ${@bb.utils.contains('DISTRO_FEATU=
RES', 'gobject-introspection', 'vala', '', d)}"
+PACKAGECONFIG ?=3D "python3 gjs lua51 ${@bb.utils.contains('GI_DATA_ENAB=
LED', 'True', 'vala', '', d)}"
 PACKAGECONFIG:remove:riscv32 =3D "lua51"
 PACKAGECONFIG:remove:riscv64 =3D "lua51"
 PACKAGECONFIG:remove:powerpc64 =3D "lua51"
--=20
2.55.0


