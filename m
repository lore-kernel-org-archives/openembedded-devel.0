Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 449FFC54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 08:04:23 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.37939.1710749058652921908
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 01:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout03.t-online.de (Postfix) with SMTP id 6ADE9212DA
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 09:03:48 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.38.150]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rm7yD-1GnKt80; Mon, 18 Mar 2024 09:03:45 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/3] evolution-data-server: build with webkitgtk4
Date: Mon, 18 Mar 2024 09:04:11 +0100
Message-ID: <20240318080412.1454-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318080412.1454-1-f_l_k@t-online.de>
References: <20240318080412.1454-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710749025-867FA383-22077005/0/0 CLEAN NORMAL
X-TOI-MSGID: 17157bbf-cbf0-4c29-8368-a4eefb4cafc5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 08:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109402

- enable goa by default

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../evolution-data-server/evolution-data-server-native.bb | 1 +
 .../evolution-data-server/evolution-data-server.bb        | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server-native.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolu=
tion-data-server-native.bb
index 28d4c2152..f2f41276a 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r-native.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r-native.bb
@@ -23,3 +23,4 @@ do_install() {
     install -d ${D}${bindir}
     install -m 755 ${B}/* ${D}${bindir}
 }
+
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-da=
ta-server.bb
index 0c3cc5303..8b6a7b2a0 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
@@ -2,7 +2,7 @@ require ${BPN}.inc
=20
 DEPENDS =3D " \
     ${BPN}-native gperf-native \
-    glib-2.0 gtk+3 gtk4 libxml2 icu \
+    glib-2.0 gtk4 libxml2 icu \
     dbus db virtual/libiconv zlib libsoup-3.0 libical nss libsecret \
 "
=20
@@ -29,15 +29,17 @@ EXTRA_OECMAKE =3D " \
     ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECT=
ION=3DON -DENABLE_VALA_BINDINGS=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)=
} \
     -D${LKSTRFTIME} \
     -DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib', '')} \
+    -DENABLE_GTK=3DOFF \
+    -DENABLE_GTK4=3DON \
 "
=20
 EXTRA_OECMAKE:append:class-target =3D " -DG_IR_COMPILER=3D${STAGING_BIND=
IR}/g-ir-compiler-wrapper"
 EXTRA_OECMAKE:append:class-target =3D " -DG_IR_SCANNER=3D${STAGING_BINDI=
R}/g-ir-scanner-wrapper"
=20
-PACKAGECONFIG ?=3D "oauth"
+PACKAGECONFIG ?=3D "goa oauth"
=20
 PACKAGECONFIG[canberra] =3D "-DENABLE_CANBERRA=3DON,-DENABLE_CANBERRA=3D=
OFF,libcanberra"
-PACKAGECONFIG[oauth]    =3D "-DENABLE_OAUTH2_WEBKITGTK=3DON -DENABLE_OAU=
TH2_WEBKITGTK4=3DOFF,-DENABLE_OAUTH2_WEBKITGTK4=3DOFF -DENABLE_OAUTH2_WEB=
KITGTK=3DOFF,webkitgtk3 json-glib"
+PACKAGECONFIG[oauth]    =3D "-DENABLE_OAUTH2_WEBKITGTK4=3DON -DENABLE_OA=
UTH2_WEBKITGTK=3DOFF,-DENABLE_OAUTH2_WEBKITGTK4=3DOFF -DENABLE_OAUTH2_WEB=
KITGTK=3DOFF,webkitgtk json-glib"
 PACKAGECONFIG[goa]    =3D "-DENABLE_GOA=3DON,-DENABLE_GOA=3DOFF,gnome-on=
line-accounts"
 PACKAGECONFIG[kerberos]    =3D "-DWITH_KRB5=3DON,-DWITH_KRB5=3DOFF,krb5"
 # BROKEN: due missing pkg-config in openldap eds' cmake finds host-libs =
when
--=20
2.44.0


