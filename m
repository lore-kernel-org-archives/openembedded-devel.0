Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C4FCD1285
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 08:41:27 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.5314.1711183280540506865
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 01:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout03.t-online.de (Postfix) with SMTP id 4492E452EB
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 09:41:18 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.162]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rnwwD-1MMRGf0; Sat, 23 Mar 2024 09:41:13 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 05/13] gparted: update 1.5.0 -> 1.6.0
Date: Sat, 23 Mar 2024 09:41:30 +0100
Message-ID: <20240323084138.178281-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240323084138.178281-1-f_l_k@t-online.de>
References: <20240323084138.178281-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711183274-0CA7E850-ADDD40D6/0/0 CLEAN NORMAL
X-TOI-MSGID: 04864ea3-0faa-4935-b8e2-c908d0afdcab
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 08:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109536

install missing metainfo files

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gparted/{gparted_1.5.0.bb =3D> gparted_1.6.0.bb}             | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-extended/gparted/{gparted_1.5.0.bb =3D> gparte=
d_1.6.0.bb} (91%)

diff --git a/meta-gnome/recipes-extended/gparted/gparted_1.5.0.bb b/meta-=
gnome/recipes-extended/gparted/gparted_1.6.0.bb
similarity index 91%
rename from meta-gnome/recipes-extended/gparted/gparted_1.5.0.bb
rename to meta-gnome/recipes-extended/gparted/gparted_1.6.0.bb
index fdfb1ef47..ab2890679 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_1.5.0.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_1.6.0.bb
@@ -11,7 +11,7 @@ SRC_URI =3D " \
     ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV=
}.tar.gz \
     ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'file://0001-Insta=
ll-polkit-action-unconditionally-executable-pke.patch', '', d)} \
 "
-SRC_URI[sha256sum] =3D "3c95ea26a944083ff1d9b17639b1e2ad9758df225dc751ff=
407b2a6aa092a8de"
+SRC_URI[sha256sum] =3D "9b9f51b3ce494ddcb59a55e1ae6679c09436604e331dbf5a=
536d60ded6c6ea5b"
=20
 UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/gparted/files/g=
parted/"
 UPSTREAM_CHECK_REGEX =3D "gparted-(?P<pver>\d+\.(\d+)+(\.\d+)+)"
@@ -31,6 +31,7 @@ PACKAGECONFIG[polkit] =3D ",,polkit"
 FILES:${PN} +=3D " \
     ${datadir}/appdata \
     ${datadir}/icons \
+    ${datadir}/metainfo \
 "
=20
 PACKAGES +=3D "${PN}-polkit"
--=20
2.44.0


