Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4105CD11DD
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 08:41:26 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.5243.1711183282149701772
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 01:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout03.t-online.de (Postfix) with SMTP id 4C7305AAC2
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 09:41:18 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.162]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rnwwE-1MMRGk0; Sat, 23 Mar 2024 09:41:14 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 10/13] gnome-disk-utility: update 45.0 -> 46.0
Date: Sat, 23 Mar 2024 09:41:35 +0100
Message-ID: <20240323084138.178281-10-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240323084138.178281-1-f_l_k@t-online.de>
References: <20240323084138.178281-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711183274-0CA7E850-7307A164/0/0 CLEAN NORMAL
X-TOI-MSGID: fc475483-bea7-4982-bd2d-bd1dde46c72a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 08:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109540

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-disk-utility_45.0.bb =3D> gnome-disk-utility_46.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-disk-utility/{gnome-disk-utility_4=
5.0.bb =3D> gnome-disk-utility_46.0.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_45.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_46.0.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utilit=
y_45.0.bb
rename to meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_=
46.0.bb
index 856d29e7c..e4998f627 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_45.0=
.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.0=
.bb
@@ -29,7 +29,7 @@ PACKAGECONFIG[systemd] =3D "-Dlogind=3Dlibsystemd,-Dlog=
ind=3Dnone,systemd"
 PACKAGECONFIG[x11] =3D ",,libcanberra"
=20
 SRC_URI:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', =
'file://0001-gnome-disk-utility-remove-libcanberra-dependency.patch', '',=
 d)}"
-SRC_URI[archive.sha256sum] =3D "3d8625faa99047bc4aefd29921ad728ab4d700cf=
f86e0f2ec67e8dba877d0dd3"
+SRC_URI[archive.sha256sum] =3D "464649148c6d6771f1ac2ebfe43a4e519205b11c=
2d914a09f2a001821d06957d"
=20
 EXTRA_OEMESON =3D "-Dman=3Dfalse"
=20
--=20
2.44.0


