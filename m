Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CCCC624D4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 08:19:38 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2918.1788423568141991365
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 01:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=RP9nMOS5;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout02.t-online.de (Postfix) with SMTP id D31DDEC2B
	for <openembedded-devel@lists.openembedded.org>; Thu,  3 Sep 2026 10:19:25 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.36]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x22fL-44btZL0; Thu, 3 Sep 2026 10:19:23 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 4/6] gnome-shell-extensions: update 48.3 -> 50.3
Date: Thu,  3 Sep 2026 10:19:14 +0200
Message-ID: <20260903081916.156273-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903081916.156273-1-f_l_k@t-online.de>
References: <20260903081916.156273-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788423563-8E7F39C8-99BA6013/0/0 CLEAN NORMAL
X-TOI-MSGID: 679a3817-8333-47c9-abf8-837e28ff215e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788423565; i=f_l_k@t-online.de;
	bh=+OoeR0hhG8RRiASQxt192qBOkdd9DH7g0Qt30OCbTA0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=RP9nMOS5bU6oXNQRou8zGrVzHI5KIAkJIbmDiREufypTS3U8dzODBfgUq+PZptsjU
	 BcgjirRwe55QVD1Tgim/7ZsFfoNHEID/2/sAR9hzWG5z4T3drGrpmgRhG/d0YrhcQp
	 2e/PY1tC5O4koKoc/16bMi+cLdcxwt2OcI947iraGSbxc1mG/IcmJTVwaEv6DY0QaQ
	 4xAiuYMKhxEkLRKmoq7/4LxZEbMWFrh6oudbe6Dljx4rYZ51YZr7ycemD0PRn3Emv/
	 icQCFcrjqTgAjEJ43Z+HEu2v8RoYCoRMtMwiQwNwdiecPTua+2kSoHpL53LbDAJH9Y
	 9ThbD+DnqbS+w==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 08:19:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129706

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...shell-extensions_48.3.bb =3D> gnome-shell-extensions_50.3.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell-extensions_48.3=
.bb =3D> gnome-shell-extensions_50.3.bb} (80%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_=
48.3.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_50.=
3.bb
similarity index 80%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_4=
8.3.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_50.=
3.bb
index 5537b3521e..a7a5b06fb9 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_48.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_50.3.bb
@@ -6,7 +6,7 @@ inherit gnomebase gettext gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam gobject-introspecti=
on-data"
=20
-SRC_URI[archive.sha256sum] =3D "adde34c08f40b63411be6f1d17e235550a009049=
4871e6481c312989d7f4a2d4"
+SRC_URI[archive.sha256sum] =3D "68fc74306f88f697a6bcdb8243cb32a9ec0cd3f6=
e2bb92249b24b60fc57450b6"
=20
 EXTRA_OEMESON +=3D " \
     -Dextension_set=3Dall \
@@ -20,4 +20,5 @@ FILES:${PN} +=3D " \
     ${datadir}/gnome-session \
     ${datadir}/wayland-sessions \
     ${datadir}/xsessions \
+    ${systemd_user_unitdir} \
 "
--=20
2.55.0


