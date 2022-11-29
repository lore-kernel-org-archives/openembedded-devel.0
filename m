Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7F8C4167B
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 06:57:15 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.142761.1669705031771017504
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Nov 2022 22:57:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout10.t-online.de (Postfix) with SMTP id E39C310033
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 07:57:09 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.228.163]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ozuYA-3ii2430; Tue, 29 Nov 2022 07:57:02 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 3/7] gedit: update 42.2 -> 43.2
Date: Tue, 29 Nov 2022 07:56:39 +0100
Message-Id: <20221129065643.82373-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221129065643.82373-1-f_l_k@t-online.de>
References: <20221129065643.82373-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669705022-08E92417-A0319651/0/0 CLEAN NORMAL
X-TOI-MSGID: 462b4ab7-4b88-4fdc-8336-b69de7e68cfe
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 06:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99838

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gedit/{gedit_42.2.bb =3D> gedit_43.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gedit/{gedit_42.2.bb =3D> gedit_43.2.bb}=
 (89%)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_42.2.bb b/meta-gnome/re=
cipes-gnome/gedit/gedit_43.2.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gedit/gedit_42.2.bb
rename to meta-gnome/recipes-gnome/gedit/gedit_43.2.bb
index 13d3e0af7..1c1803d5e 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_42.2.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_43.2.bb
@@ -10,7 +10,7 @@ DEPENDS =3D " \
     gtk+3 \
     gsettings-desktop-schemas \
     libpeas \
-    libsoup-2.4 \
+    libsoup \
     gspell \
     gtksourceview4 \
     tepl \
@@ -21,7 +21,7 @@ inherit gnomebase gsettings itstool gnome-help gobject-=
introspection gtk-doc val
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
=20
-SRC_URI[archive.sha256sum] =3D "3c6229111f0ac066ae44964920791d1265f5bbb5=
6b0bd949a69b7b1261fc8fca"
+SRC_URI[archive.sha256sum] =3D "f950d2d35c594bb6c8dbc9f5440cad7788ca0a86=
88e2b07846f83de9a4e3fc25"
=20
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
--=20
2.34.1


