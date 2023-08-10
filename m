Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE0FC001B0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 19:25:18 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.26743.1691695511363636981
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Aug 2023 12:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout10.t-online.de (Postfix) with SMTP id 8CAE125BE4
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 21:25:08 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.174.9]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qUBHJ-0qYGVF0; Thu, 10 Aug 2023 21:25:01 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] gnome-themes-extra: fix datadir path
Date: Thu, 10 Aug 2023 21:24:43 +0200
Message-ID: <20230810192443.276754-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1691695501-79FFF9C6-20A33605/0/0 CLEAN NORMAL
X-TOI-MSGID: dd2f3af7-cfc0-41af-98be-d1b3a87a894c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 19:25:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104332

This fixes do_rootfs error if gtk2 is installed

Running transaction test
Error: Transaction test error:
  file /usr conflicts between attempted installs of gnome-theme-adwaita-3=
.28-r0.corei7_64 and pipewire-modules-zeroconf-discover-0.3.77-r0.corei7_=
64
  file /usr/lib conflicts between attempted installs of gnome-theme-adwai=
ta-3.28-r0.corei7_64 and pipewire-modules-zeroconf-discover-0.3.77-r0.cor=
ei7_64
  file /usr/lib/gtk-2.0 conflicts between attempted installs of gnome-the=
me-adwaita-3.28-r0.corei7_64 and at-spi2-core-2.48.3-r0.corei7_64
  file /usr/share conflicts between attempted installs of gnome-theme-adw=
aita-3.28-r0.corei7_64 and ghostscript-10.01.2-r0.corei7_64
  file /usr conflicts between attempted installs of libgtk-2.0-2.24.33-r0=
.corei7_64 and gnome-theme-adwaita-3.28-r0.corei7_64
  file /usr/lib conflicts between attempted installs of libgtk-2.0-2.24.3=
3-r0.corei7_64 and gnome-theme-adwaita-3.28-r0.corei7_64
  file /usr/lib/gtk-2.0 conflicts between attempted installs of libgtk-2.=
0-2.24.33-r0.corei7_64 and gnome-theme-adwaita-3.28-r0.corei7_64
  file /usr/lib/gtk-2.0/2.10.0 conflicts between attempted installs of li=
bgtk-2.0-2.24.33-r0.corei7_64 and gnome-theme-adwaita-3.28-r0.corei7_64
  file /usr/lib/gtk-2.0/2.10.0/engines conflicts between attempted instal=
ls of libgtk-2.0-2.24.33-r0.corei7_64 and gnome-theme-adwaita-3.28-r0.cor=
ei7_64
  file /usr/share conflicts between attempted installs of libgtk-2.0-2.24=
.33-r0.corei7_64 and gnome-theme-adwaita-3.28-r0.corei7_64
  file /usr/share/themes conflicts between attempted installs of libgtk-2=
.0-2.24.33-r0.corei7_64 and gnome-theme-adwaita-3.28-r0.corei7_64

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.b=
b b/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb
index d7e422cc97..227422d90c 100644
--- a/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb
+++ b/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb
@@ -21,8 +21,8 @@ EXTRA_OECONF =3D "--disable-gtk3-engine"
=20
 do_install:append() {
         # Only building Adwaita, remove highcontrast files
-        rm -rf ${D}${prefix}/share/themes/HighContrast \
-               ${D}${prefix}/share/icons
+        rm -rf ${D}${datadir}/themes/HighContrast \
+               ${D}${datadir}/icons
=20
 	# The libtool archive file is unneeded with shared libs on modern Linux
 	rm -rf ${D}${libdir}/gtk-2.0/2.10.0/engines/libadwaita.la
@@ -34,10 +34,10 @@ PACKAGES +=3D "gnome-theme-adwaita \
              gnome-theme-adwaita-dark \
              "
=20
-FILES:gnome-theme-adwaita =3D "${prefix}/share/themes/Adwaita \
+FILES:gnome-theme-adwaita =3D "${datadir}/themes/Adwaita \
                               ${libdir}/gtk-2.0/2.10.0/engines/libadwait=
a.so"
=20
-FILES:gnome-theme-adwaita-dark =3D "${prefix}/share/themes/Adwaita-dark"
+FILES:gnome-theme-adwaita-dark =3D "${datadir}/themes/Adwaita-dark"
 RDEPENDS:gnome-theme-adwaita-dark =3D "gnome-theme-adwaita"
=20
 # gnome-themes-standard is empty and doesn't exist
--=20
2.41.0


