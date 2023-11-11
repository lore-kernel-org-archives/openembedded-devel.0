Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26ECDC4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 12:03:03 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.50296.1699704176379278387
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 04:02:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout12.t-online.de (Postfix) with SMTP id CDF9517C95
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 13:02:54 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.215]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r1mhP-0z0ell0; Sat, 11 Nov 2023 13:02:51 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-shell-extensions: Upgrade 44.1 -> 45.1
Date: Sat, 11 Nov 2023 13:03:19 +0100
Message-ID: <20231111120319.31670-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699704171-FBFFC94C-CEF0DC8F/0/0 CLEAN NORMAL
X-TOI-MSGID: 7ad750a5-3927-4a55-ba55-4d8010513e9b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 12:03:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106553

---
 ...shell-extensions_44.1.bb =3D> gnome-shell-extensions_45.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell-extensions_44.1=
.bb =3D> gnome-shell-extensions_45.1.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_=
44.1.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_45.=
1.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_4=
4.1.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_45.=
1.bb
index fc3e20486..cfc01c7da 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_44.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_45.1.bb
@@ -2,12 +2,11 @@ SUMMARY =3D "GNOME Shell Extensions"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4cb3a392cbf81a9e685ec13b88c4c=
101"
=20
-
 inherit gnomebase gettext gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam gobject-introspecti=
on-data"
=20
-SRC_URI[archive.sha256sum] =3D "8c345e72f31a1e37f55063e0b15997301b01194e=
d698772fd87aeb50cbb101ab"
+SRC_URI[archive.sha256sum] =3D "242e15a0c06e820c3fd8dd6aeac1a8ef865ce588=
82e5975af1d65934bb4d4261"
=20
 EXTRA_OEMESON +=3D " \
     -Dextension_set=3Dall \
--=20
2.42.0


