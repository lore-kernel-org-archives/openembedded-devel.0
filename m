Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8BAC76196
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 15:18:42 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.23850.1679757517172577548
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 08:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout02.t-online.de (Postfix) with SMTP id DD6411C3B0
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 16:18:33 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pg5f7-3MEQCX0; Sat, 25 Mar 2023 16:18:33 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv2] gedit: update 43.2 -> 44.2
Date: Sat, 25 Mar 2023 16:18:18 +0100
Message-Id: <20230325151818.6769-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679757513-BD176C11-48514DAD/0/0 CLEAN NORMAL
X-TOI-MSGID: 86704fe5-beaa-4d95-ab55-cb36dab97cd3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 15:18:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101749

Signed-off-by: Markus Volk <f_l_k@t-online.de>
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


