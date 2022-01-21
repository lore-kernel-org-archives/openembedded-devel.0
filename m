Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64864C43217
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 13:33:18 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web12.11717.1642771997642322914
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 05:33:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout04.t-online.de (Postfix) with SMTP id 5046A3CAC
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 14:33:16 +0100 (CET)
Received: from localhost.localdomain ([84.163.45.199]) by fwd85.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nAu2U-1rotAS0; Fri, 21 Jan 2022 14:33:15 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv2 4/5] evolution-data-server: cleanup;
 enable vala introspection
Date: Fri, 21 Jan 2022 14:32:54 +0100
Message-Id: <20220121133255.2464068-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220121133255.2464068-1-f_l_k@t-online.de>
References: <20220121133255.2464068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1642771995-00014AB5-971230F9/0/0 CLEAN NORMAL
X-TOI-MSGID: 3c2b93cf-a581-474a-a97a-fd5904a745ae
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 13:33:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94974

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../evolution-data-server.bb                  | 27 +++++++------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-da=
ta-server.bb
index 571d4301e..9ccaedbcc 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
@@ -2,11 +2,11 @@ require ${BPN}.inc
=20
 DEPENDS =3D " \
     ${BPN}-native intltool-native gperf-native \
-    glib-2.0 gtk+3 libgdata \
+    glib-2.0 gtk+3 libgdata libxml2 icu \
     dbus db virtual/libiconv zlib libsoup-2.4 libical nss libsecret \
 "
=20
-inherit gsettings gobject-introspection features_check cmake gtk-doc get=
text perlnative
+inherit pkgconfig gsettings gobject-introspection features_check cmake g=
tk-doc gettext perlnative vala
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
@@ -21,23 +21,23 @@ SRC_URI +=3D " \
 LKSTRFTIME =3D "HAVE_LKSTRFTIME=3DON"
 LKSTRFTIME:libc-musl =3D "HAVE_LKSTRFTIME=3DOFF"
=20
-# For arm qemu-arm runs at 100% CPU load and never returns - so disable =
introspection for now
-GI_DATA_ENABLED=3D"False"
-
 EXTRA_OECMAKE =3D " \
     -DSYSCONF_INSTALL_DIR=3D${sysconfdir} \
     -DWITH_KRB5=3DOFF \
-    -DENABLE_GOA=3DOFF \
     -DENABLE_UOA=3DOFF \
     -DENABLE_GOOGLE_AUTH=3DOFF \
     -DENABLE_WEATHER=3DOFF \
-    -DENABLE_INTROSPECTION=3D${@bb.utils.contains('GI_DATA_ENABLED', 'Tr=
ue', 'ON', 'OFF', d)} \
+    -DG_IR_COMPILER=3D${STAGING_BINDIR}/g-ir-compiler-wrapper \
+    -DG_IR_SCANNER=3D${STAGING_BINDIR}/g-ir-scanner-wrapper \
+    -DVAPIGEN=3D${STAGING_BINDIR_NATIVE}/vapigen \
+    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECT=
ION=3DON -DENABLE_VALA_BINDINGS=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)=
} \
     -D${LKSTRFTIME} \
     -DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib', '')} \
 "
=20
 PACKAGECONFIG[canberra] =3D "-DENABLE_CANBERRA=3DON,-DENABLE_CANBERRA=3D=
OFF,libcanberra"
 PACKAGECONFIG[oauth]    =3D "-DENABLE_OAUTH2=3DON,-DENABLE_OAUTH2=3DOFF,=
webkitgtk json-glib"
+PACKAGECONFIG[goa]    =3D "-DENABLE_GOA=3DON,-DENABLE_GOA=3DOFF,gnome-on=
line-accounts"
=20
 # BROKEN: due missing pkg-config in openldap eds' cmake finds host-libs =
when
 # searching for openldap-libs
@@ -48,17 +48,8 @@ LDFLAGS +=3D "-lpthread -lgmodule-2.0 -lgthread-2.0"
=20
 do_configure:append () {
     cp ${WORKDIR}/iconv-detect.h ${S}/src
-
-    # fix native perl shebang
-    sed -i 's:${STAGING_BINDIR_NATIVE}/perl-native:${bindir}:' ${B}/src/=
tools/addressbook-export/csv2vcard
-
-    # fix abs path for g-ir-scanner-wrapper
-    sed  -i ${B}/build.ninja \
-        -e 's: ${bindir}/g-ir-scanner-wrapper: ${STAGING_BINDIR}/g-ir-sc=
anner-wrapper:g'
-}
-
-do_compile:prepend() {
-    export GIR_EXTRA_LIBS_PATH=3D"${B}/camel/.libs:${B}/libedataserver/.=
libs"
+    # avoid writing perl-native path into csv2vcard shebang
+    sed -i "s|@PERL@|${bindir}/perl|" ${S}/src/tools/addressbook-export/=
csv2vcard.in
 }
=20
 FILES:${PN} =3D+ " \
--=20
2.25.1


