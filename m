Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04916FA3740
	for <webhook@archiver.kernel.org>; Sat, 29 Oct 2022 15:41:59 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web12.4402.1667058110932808872
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Oct 2022 08:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout12.t-online.de (Postfix) with SMTP id 42A9F118F6
	for <openembedded-devel@lists.openembedded.org>; Sat, 29 Oct 2022 17:41:49 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([79.219.224.130]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oonxz-3mkXcR0; Sat, 29 Oct 2022 17:41:47 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-openembedded][PATCH 3/3] spice: build with opus and opengl
Date: Sat, 29 Oct 2022 17:41:16 +0200
Message-Id: <20221029154116.3128371-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221029154116.3128371-1-f_l_k@t-online.de>
References: <20221029154116.3128371-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667058107-2508E98D-BA67AE47/0/0 CLEAN NORMAL
X-TOI-MSGID: 633362ee-ec46-48d4-a9b2-7862f41d2282
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Oct 2022 15:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99343

  - remove COMPATIBLE_HOSTS whitelist because I was able to compile this =
for qemumips also

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-networking/recipes-support/spice/spice_git.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-ne=
tworking/recipes-support/spice/spice_git.bb
index b3e687476..69e220050 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -47,7 +47,7 @@ CFLAGS:append =3D " -Wno-error"
=20
 PACKAGECONFIG:class-native =3D ""
 PACKAGECONFIG:class-nativesdk =3D ""
-PACKAGECONFIG ?=3D "sasl"
+PACKAGECONFIG ?=3D "sasl ${@bb.utils.filter('DISTRO_FEATURES', 'opengl',=
 d)} opus"
=20
 PACKAGECONFIG[celt051] =3D "--enable-celt051,--disable-celt051,celt051"
 PACKAGECONFIG[smartcard] =3D "--enable-smartcard,--disable-smartcard,lib=
cacard,"
@@ -58,8 +58,6 @@ PACKAGECONFIG[opus] =3D "--enable-opus,--disable-opus,l=
ibopus,"
 PACKAGECONFIG[opengl] =3D "--enable-opengl,--disable-opengl,,"
 PACKAGECONFIG[xinerama] =3D "--enable-xinerama,--disable-xinerama,libxin=
erama,"
=20
-COMPATIBLE_HOST =3D '(x86_64|i.86|aarch64).*-linux'
-
 BBCLASSEXTEND =3D "native nativesdk"
=20
 EXTRA_OECONF:append:toolchain-clang =3D " --disable-werror"
--=20
2.34.1


