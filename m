Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA8E1C77B7B
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:20 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.17456.1679731393857343085
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout06.t-online.de (Postfix) with SMTP id 3B91E12DC2
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:12 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyrl-0RoPhO0; Sat, 25 Mar 2023 09:03:09 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 06/32] gedit: update 43.2 -> 44.2
Date: Sat, 25 Mar 2023 09:02:30 +0100
Message-Id: <20230325080256.923752-6-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731390-8556AC08-36AEF7EE/0/0 CLEAN NORMAL
X-TOI-MSGID: 0ec9d53a-aab2-4152-8f3b-bbf9c3037dcf
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101719

---
 meta-gnome/recipes-gnome/gedit/{gedit_43.2.bb =3D> gedit_44.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gedit/{gedit_43.2.bb =3D> gedit_44.2.bb}=
 (91%)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_43.2.bb b/meta-gnome/re=
cipes-gnome/gedit/gedit_44.2.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gedit/gedit_43.2.bb
rename to meta-gnome/recipes-gnome/gedit/gedit_44.2.bb
index 1c1803d5e..34c782297 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_43.2.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_44.2.bb
@@ -21,7 +21,7 @@ inherit gnomebase gsettings itstool gnome-help gobject-=
introspection gtk-doc val
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
=20
-SRC_URI[archive.sha256sum] =3D "f950d2d35c594bb6c8dbc9f5440cad7788ca0a86=
88e2b07846f83de9a4e3fc25"
+SRC_URI[archive.sha256sum] =3D "3bbb1b3775d4c277daf54aaab44b0eb83a4eb1f0=
9f0391800041c9e56893ec11"
=20
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
--=20
2.34.1


