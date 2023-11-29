Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1A9C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 19:44:27 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.48791.1701287057035518936
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 11:44:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout07.t-online.de (Postfix) with SMTP id 0D6165DABC
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 20:43:33 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.37.216]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r8QT4-0hZQSv0; Wed, 29 Nov 2023 20:43:30 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] spice-gtk: Set meson version based on PV
Date: Wed, 29 Nov 2023 20:43:43 +0100
Message-ID: <20231129194343.6195-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1701287010-C0AEA9F9-87CAE432/0/0 CLEAN NORMAL
X-TOI-MSGID: e325382f-d709-4e64-b468-198fe385850f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 19:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107148

This fixes build for gnome-boxes

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...n.build-set-hardcoded-version-string.patch | 26 +++++++++++++++++++
 .../recipes-support/spice/spice-gtk_0.42.bb   |  9 ++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/spice/spice-gtk/0001-=
meson.build-set-hardcoded-version-string.patch

diff --git a/meta-networking/recipes-support/spice/spice-gtk/0001-meson.b=
uild-set-hardcoded-version-string.patch b/meta-networking/recipes-support=
/spice/spice-gtk/0001-meson.build-set-hardcoded-version-string.patch
new file mode 100644
index 000000000..a691842c8
--- /dev/null
+++ b/meta-networking/recipes-support/spice/spice-gtk/0001-meson.build-se=
t-hardcoded-version-string.patch
@@ -0,0 +1,26 @@
+From 452061cae6288c6fd0ef9455bb4f7603b2e6eefd Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 27 Nov 2023 20:39:32 +0100
+Subject: [PATCH] meson.build: set hardcoded version string
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 341f5fb..ecda25c 100644
+--- a/meson.build
++++ b/meson.build
+@@ -2,7 +2,7 @@
+ # project definition
+ #
+ project('spice-gtk', 'c',
+-         version : run_command('build-aux/git-version-gen', '@0@/.tarba=
ll-version'.format(meson.project_source_root()), check : true).stdout().s=
trip(),
++         version : '@version@',
+          license : 'LGPLv2.1',
+          meson_version : '>=3D 0.56',
+          default_options : ['buildtype=3Ddebugoptimized',
+--=20
+2.42.0
+
diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb b/me=
ta-networking/recipes-support/spice/spice-gtk_0.42.bb
index 3d34f222d..8d848a319 100644
--- a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
+++ b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
@@ -10,7 +10,10 @@ LIC_FILES_CHKSUM =3D " \
=20
 SRCREV =3D "f04479c16f0969fb394ebe74b6eff74e560a42f0"
=20
-SRC_URI =3D "gitsm://gitlab.freedesktop.org/spice/spice-gtk.git;protocol=
=3Dhttps;branch=3Dmaster"
+SRC_URI =3D " \
+	gitsm://gitlab.freedesktop.org/spice/spice-gtk.git;protocol=3Dhttps;bra=
nch=3Dmaster \
+	file://0001-meson.build-set-hardcoded-version-string.patch \
+"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -52,6 +55,10 @@ GTKDOC_MESON_OPTION =3D 'gtk_doc'
 GTKDOC_MESON_ENABLE_FLAG =3D 'enabled'
 GTKDOC_MESON_DISABLE_FLAG =3D 'disabled'
=20
+do_configure:prepend() {
+    sed -i "s|@version@|${PV}|" ${S}/meson.build
+}
+
 PACKAGECONFIG ??=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'va=
pi', '', d)} smartcard"
 PACKAGECONFIG[vapi] =3D "-Dvapi=3Denabled,-Dvapi=3Ddisabled"
 PACKAGECONFIG[smartcard] =3D "-Dsmartcard=3Denabled,-Dsmartcard=3Ddisabl=
ed,libcacard"
--=20
2.42.1


