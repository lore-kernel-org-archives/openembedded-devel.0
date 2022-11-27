Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81CDC47088
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 12:29:12 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.90656.1669552141818605092
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 04:29:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout02.t-online.de (Postfix) with SMTP id 503722CF1
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Nov 2022 13:29:00 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.231.234]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ozGmJ-0sD6nL0; Sun, 27 Nov 2022 13:28:59 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv3 03/14] evolution-data-server: update 3.44.2 -> 3.46.1
Date: Sun, 27 Nov 2022 13:28:35 +0100
Message-Id: <20221127122846.1406944-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127122846.1406944-1-f_l_k@t-online.de>
References: <20221127122846.1406944-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669552139-D9A4E9D3-C05DD640/0/0 CLEAN NORMAL
X-TOI-MSGID: e7aa116c-b94a-450e-8bca-4e4d03056e10
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Nov 2022 12:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99770

- build with libsoup-3.0
- dont add gtk4 exclusively, because some projects still stick to gcr3

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../evolution-data-server.bb                    | 17 +++++++++--------
 .../evolution-data-server.inc                   |  4 ++--
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-da=
ta-server.bb
index 64774b0fe..681ff677a 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
@@ -2,8 +2,8 @@ require ${BPN}.inc
=20
 DEPENDS =3D " \
     ${BPN}-native intltool-native gperf-native \
-    glib-2.0 gtk+3 libgdata libxml2 icu \
-    dbus db virtual/libiconv zlib libsoup-2.4 libical nss libsecret \
+    glib-2.0 gtk+3 gtk4 libgdata libxml2 icu \
+    dbus db virtual/libiconv zlib libsoup-3.0 libical nss libsecret \
 "
=20
 inherit pkgconfig gsettings gobject-introspection features_check cmake g=
tk-doc gettext perlnative vala
@@ -24,10 +24,6 @@ LKSTRFTIME:libc-musl =3D "HAVE_LKSTRFTIME=3DOFF"
=20
 EXTRA_OECMAKE =3D " \
     -DSYSCONF_INSTALL_DIR=3D${sysconfdir} \
-    -DWITH_KRB5=3DOFF \
-    -DENABLE_GOA=3DOFF \
-    -DENABLE_GOOGLE_AUTH=3DOFF \
-    -DENABLE_WEATHER=3DOFF \
     -DVAPIGEN=3D${STAGING_BINDIR_NATIVE}/vapigen \
     ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECT=
ION=3DON -DENABLE_VALA_BINDINGS=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)=
} \
     -D${LKSTRFTIME} \
@@ -37,13 +33,18 @@ EXTRA_OECMAKE =3D " \
 EXTRA_OECMAKE:append:class-target =3D " -DG_IR_COMPILER=3D${STAGING_BIND=
IR}/g-ir-compiler-wrapper"
 EXTRA_OECMAKE:append:class-target =3D " -DG_IR_SCANNER=3D${STAGING_BINDI=
R}/g-ir-scanner-wrapper"
=20
+PACKAGECONFIG ?=3D "oauth"
+
 PACKAGECONFIG[canberra] =3D "-DENABLE_CANBERRA=3DON,-DENABLE_CANBERRA=3D=
OFF,libcanberra"
-PACKAGECONFIG[oauth]    =3D "-DENABLE_OAUTH2=3DON,-DENABLE_OAUTH2=3DOFF,=
webkitgtk json-glib"
+# ENABLE_OAUTH2_WEBKITGTK4 would require webkit to be built with gtk4
+PACKAGECONFIG[oauth]    =3D "-DENABLE_OAUTH2_WEBKITGTK=3DON -DENABLE_OAU=
TH2_WEBKITGTK4=3DOFF,-DENABLE_OAUTH2_WEBKITGTK=3DOFF,webkitgtk json-glib"
 PACKAGECONFIG[goa]    =3D "-DENABLE_GOA=3DON,-DENABLE_GOA=3DOFF,gnome-on=
line-accounts"
-
+PACKAGECONFIG[kerberos]    =3D "-DWITH_KRB5=3DON,-DWITH_KRB5=3DOFF,krb5"
 # BROKEN: due missing pkg-config in openldap eds' cmake finds host-libs =
when
 # searching for openldap-libs
 PACKAGECONFIG[openldap] =3D "-DWITH_OPENLDAP=3DON,-DWITH_OPENLDAP=3DOFF,=
openldap"
+PACKAGECONFIG[weather] =3D "-DENABLE_WEATHER=3DON,-DENABLE_WEATHER=3DOFF=
,libgweather4"
+
=20
 # -ldb needs this on some platforms
 LDFLAGS +=3D "-lpthread -lgmodule-2.0 -lgthread-2.0"
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-d=
ata-server.inc
index 78efee004..e3c09f211 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
@@ -9,5 +9,5 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6a6e689d19255c=
f0557f3fe7d7068212 \
=20
 inherit gnomebase upstream-version-is-even
=20
-SRC_URI[archive.sha256sum] =3D "2ed72afe4d6bb170f8728faea0907fee10212dfd=
e7a9fab82fbcc83d0f22f028"
-PV =3D "3.44.2"
+SRC_URI[archive.sha256sum] =3D "c55e72cff4190b42e63dd6eabc6dce48a1a1f790=
40531f1af6d51c1efa4aa6eb"
+PV =3D "3.46.1"
--=20
2.34.1


