Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F81FCE7A81
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 01:28:50 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.13282.1695432522600425115
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 18:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout12.t-online.de (Postfix) with SMTP id B990512AC4
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 03:28:40 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.34.192]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qjrRm-1Csnkf0; Sat, 23 Sep 2023 03:28:38 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] tepl: Upgrade 6.4.0 -> 6.8.0
Date: Sat, 23 Sep 2023 03:28:29 +0200
Message-ID: <20230923012830.3338338-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695432518-D0FE3FD5-56DD0266/0/0 CLEAN NORMAL
X-TOI-MSGID: d7b6c4df-c4ad-42e8-b006-f3f88e21948e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 01:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105087

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/tepl/{tepl_6.4.0.bb =3D> tepl_6.8.0.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/tepl/{tepl_6.4.0.bb =3D> tepl_6.8.0.bb} =
(88%)

diff --git a/meta-gnome/recipes-gnome/tepl/tepl_6.4.0.bb b/meta-gnome/rec=
ipes-gnome/tepl/tepl_6.8.0.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/tepl/tepl_6.4.0.bb
rename to meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb
index 1eecfff4b..6c9c36f3e 100644
--- a/meta-gnome/recipes-gnome/tepl/tepl_6.4.0.bb
+++ b/meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb
@@ -6,8 +6,8 @@ DEPENDS =3D " \
     gsettings-desktop-schemas \
     glib-2.0 \
     gtk+3 \
-    gtksourceview4 \
-    amtk \
+    libgedit-amtk \
+    libgedit-gtksourceview \
     libxml2 \
     uchardet \
     gtk-doc-native \
@@ -21,7 +21,7 @@ inherit meson gobject-introspection gettext features_ch=
eck pkgconfig
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 SRC_URI =3D "git://gitlab.gnome.org/swilmet/tepl;protocol=3Dhttps;branch=
=3Dmain"
-SRCREV =3D "d1e9cc2e4a0738f68d9002f13724b7239f075844"
+SRCREV =3D "16ab2567257a053bd957699f89080fafd0999035"
 S =3D "${WORKDIR}/git"
=20
 # gobject-introspection is mandatory and cannot be configured
--=20
2.42.0


