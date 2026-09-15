Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D3AC982CD
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:40 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18112.1789458271408157670
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=O9+Bkt+W;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id C1D3E1C376
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:19 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Npp-00ds5j0; Tue, 15 Sep 2026 09:44:09 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 04/31] gdm: upgrade 50.2 -> 51.0
Date: Tue, 15 Sep 2026 09:43:20 +0200
Message-ID: <20260915074347.6003-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458249-77FFC9B9-BAD6F81D/0/0 CLEAN NORMAL
X-TOI-MSGID: e33f6d96-2b19-47fc-84bc-2b70ce195793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458259; i=f_l_k@t-online.de;
	bh=/Deyzx5xvatcIMLE3d9k0Dy+BrKVJfB5I+q+pl198CU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=O9+Bkt+WdTxG2yqhfmCjsO39zo6rFeRg39s7V/z6qhNziH41m4rvxwWsn86cg0Bi4
	 yT1SJ+WEZwcpcXZDlC0XnKCGq7v2mSmm1a/rrN7o6uHap+CFQ5U2rreQI70RpbwwWv
	 CqJmBhM0OQMfROki48To1k3NmCqQyXV53yzs1BegL+m7YJiETtd833r5flV9tuVius
	 Ri3izjGaYohoxUaNsQO1dGI7LldqiwkIECzteqEJBiYkhTo+t1+PordMhUvqSIqCjw
	 LY8gqfARl02f8L5ZCcUGsgFV3zRmNWo/n+PavERoOBuJDbJyRMfw8NUmwv/GaOyxno
	 jBTRMHV2M/srQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130049

gdm now installs its PAM service files into the vendor directory
${prefix}/lib/pam.d. libpam is configured with vendordir=3D${sysconfdir}
here, so pass -Dpam-services-dir to keep them in ${sysconfdir}/pam.d,
where do_install:append() amends gdm-password.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gdm/{gdm_50.2.bb =3D> gdm_51.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gdm/{gdm_50.2.bb =3D> gdm_51.0.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_50.2.bb b/meta-gnome/recipe=
s-gnome/gdm/gdm_51.0.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/gdm/gdm_50.2.bb
rename to meta-gnome/recipes-gnome/gdm/gdm_51.0.bb
index c87b958fcd..00e1fd930d 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_50.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_51.0.bb
@@ -21,7 +21,7 @@ GIR_MESON_OPTION =3D ""
=20
 inherit gnomebase gsettings pkgconfig gobject-introspection gettext syst=
emd useradd itstool gnome-help features_check
=20
-SRC_URI[archive.sha256sum] =3D "8a4679e47cddfe8b0a1bd9d3836042deb68fb3e1=
b0e7e62dfd0631dc5b6fc541"
+SRC_URI[archive.sha256sum] =3D "2ce5acf5a438b8f6dc1d14fd777a911be5eeb2f7=
ab9a7c4600166205b15d6536"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[plymouth] =3D "-Dplymouth=3Denabled,-Dplymouth=3Ddisabled,=
plymouth"
@@ -30,6 +30,7 @@ PACKAGECONFIG[x11] =3D "-Dx11-support=3Dtrue,-Dx11-supp=
ort=3Dfalse,xau"
 EXTRA_OEMESON =3D " \
     -Ddefault-pam-config=3Dopenembedded \
     -Dpam-mod-dir=3D${base_libdir}/security \
+    -Dpam-services-dir=3D${sysconfdir}/pam.d \
     --cross-file=3D${WORKDIR}/meson-${PN}.cross \
 "
=20
--=20
2.55.0


