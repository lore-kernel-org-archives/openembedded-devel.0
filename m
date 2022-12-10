Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B0BC4332F
	for <webhook@archiver.kernel.org>; Sat, 10 Dec 2022 08:59:41 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.11207.1670662774412384462
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Dec 2022 00:59:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout01.t-online.de (Postfix) with SMTP id 79A8CB37E
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 09:59:32 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.165]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p3vhi-3WmKVF0; Sat, 10 Dec 2022 09:59:30 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] tracker: update 3.4.1 -> 3.4.2
Date: Sat, 10 Dec 2022 09:59:22 +0100
Message-Id: <20221210085922.71898-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670662770-2E8B5EA1-66FAEE38/0/0 CLEAN NORMAL
X-TOI-MSGID: 91d463e0-067e-41e0-ab79-06934ffc3389
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 08:59:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100024

build with libsoup3

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../tracker/{tracker_3.4.1.bb =3D> tracker_3.4.2.bb}           | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.4.1.bb =3D> tracker_3=
.4.2.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.4.1.bb b/meta-gno=
me/recipes-gnome/tracker/tracker_3.4.2.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/tracker/tracker_3.4.1.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_3.4.2.bb
index 1428159ce..0cc6089ae 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.4.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.4.2.bb
@@ -14,7 +14,7 @@ DEPENDS =3D " \
     dbus \
     icu \
     json-glib \
-    libsoup-2.4 \
+    libsoup-3.0 \
     libstemmer \
 "
=20
@@ -22,7 +22,7 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages =
bash-completion features_check python3native
=20
-SRC_URI[archive.sha256sum] =3D "ea9d41a9fb9c2b42ad80fc2c82327b5c713d594c=
969b09e1a49be63fb74f4fae"
+SRC_URI[archive.sha256sum] =3D "4e6df142a4f704878fca98ebb5a224750e5ea546=
aa2aaabaa726a73540bd1731"
=20
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
@@ -43,6 +43,7 @@ EXTRA_OEMESON =3D " \
     -Dman=3Dfalse \
     -Dsystemd_user_services=3D${@bb.utils.contains('DISTRO_FEATURES', 's=
ystemd', 'true', 'false', d)} \
     -Dsystemd_user_services_dir=3D${systemd_user_unitdir} \
+    -Dsoup=3Dsoup3 \
 "
=20
 FILES:${PN} +=3D " \
--=20
2.34.1


