Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D42E6781B
	for <webhook@archiver.kernel.org>; Sun,  3 Nov 2024 09:28:15 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.33080.1730626091758627457
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Nov 2024 01:28:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout06.t-online.de (Postfix) with SMTP id A6C0AEC9
	for <openembedded-devel@lists.openembedded.org>; Sun,  3 Nov 2024 10:27:44 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.38.125]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t7WtZ-44MUpV0; Sun, 3 Nov 2024 10:27:41 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-online-accounts: uodate 3.52.0 -> 3.52.1
Date: Sun,  3 Nov 2024 10:29:56 +0100
Message-ID: <20241103092956.108652-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1730626061-CAFFA8C0-2750E7F7/0/0 CLEAN NORMAL
X-TOI-MSGID: 2f60b87a-3968-4dd8-bc0b-6eb7cb50216a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Nov 2024 09:28:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113392

Overview of changes in 3.52.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
* Bugs fixed:
  - !285 goakerberosprovider: don't assume all errors are auth errors
  - !285 goaoauthprovider: fix expected NULL GError

* Translation updates:
  - Catalan (Jordi Mas i Hernandez)
  - Latvian (R=C5=ABdolfs Mazurs)
  - Thai (Aefgh Threenine)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...nline-accounts_3.52.0.bb =3D> gnome-online-accounts_3.52.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-online-accounts/{gnome-online-acco=
unts_3.52.0.bb =3D> gnome-online-accounts_3.52.1.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-=
accounts_3.52.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome=
-online-accounts_3.52.1.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-a=
ccounts_3.52.0.bb
rename to meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-acc=
ounts_3.52.1.bb
index a24458d1d..9c01095f2 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.52.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.52.1.bb
@@ -8,7 +8,7 @@ REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKA=
GECONFIG', 'goabackend',
=20
 DEPENDS +=3D "gdk-pixbuf dbus glib-2.0 gcr keyutils"
=20
-SRC_URI[archive.sha256sum] =3D "631953a9d9ea098b268a0bbe2df18cbbec678158=
9cac6b0455214609ee12bbd8"
+SRC_URI[archive.sha256sum] =3D "37c7522ff9454f8371b5a8725bba76ed7430c95b=
1f9efc7feba6268f052d1eb7"
=20
 PACKAGECONFIG ?=3D "goabackend kerberos owncloud google windows_live"
=20
--=20
2.47.0


