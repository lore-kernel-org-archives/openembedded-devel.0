Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1C1C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 16:57:46 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web08.1742.1645030665994013242
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 08:57:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85,
 mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout11.t-online.de (Postfix) with SMTP id A06F3B1B2
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 17:57:43 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.46.177]) by fwd72.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nKNcb-4LkQXx0; Wed, 16 Feb 2022 17:57:41 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] seahorse: initial add recipe
Date: Wed, 16 Feb 2022 17:57:22 +0100
Message-Id: <20220216165722.25908-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1645030661-0000B7AB-5F3A0BC1/0/0 CLEAN NORMAL
X-TOI-MSGID: a5915bd7-1c36-401a-b063-0eb57d64fb40
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 16:57:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95340

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...uild-dont-look-for-native-ssh-keygen.patch | 15 +++++++++++
 .../recipes-gnome/seahorse/seahorse_41.0.bb   | 27 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/seahorse/seahorse/meson-buil=
d-dont-look-for-native-ssh-keygen.patch
 create mode 100644 meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb

diff --git a/meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-=
look-for-native-ssh-keygen.patch b/meta-gnome/recipes-gnome/seahorse/seah=
orse/meson-build-dont-look-for-native-ssh-keygen.patch
new file mode 100644
index 000000000..ac83de486
--- /dev/null
+++ b/meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-fo=
r-native-ssh-keygen.patch
@@ -0,0 +1,15 @@
+From: Markus Volk <f_l_k@t-online.de>
+Date: Tue, 16 Feb 2022 10:38:04 +0100
+Subject: [PATCH] meson.build: dont look for native ssh-keygen
+
+--- a/meson.build	2022-02-16 10:38:04.170081321 +0100
++++ b/meson.build	2022-02-16 10:38:28.257864179 +0100
+@@ -44,7 +44,7 @@
+ libpwquality =3D dependency('pwquality')
+ posix =3D valac.find_library('posix')
+ ssh_bin =3D find_program('ssh')
+-ssh_keygen =3D find_program('ssh-keygen')
++ssh_keygen =3D find_program('ssh-keygen', native : false)
+ gpg_bin =3D find_program('gpg2', 'gpg', required: get_option('pgp-suppo=
rt'))
+ gpgme_dep =3D dependency('gpgme', version: '>=3D 1.14.0', required: get=
_option('pgp-support'))
+=20
diff --git a/meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb b/meta-gn=
ome/recipes-gnome/seahorse/seahorse_41.0.bb
new file mode 100644
index 000000000..ec1328598
--- /dev/null
+++ b/meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb
@@ -0,0 +1,27 @@
+SUMMARY =3D "Seahorse is a graphical interface for managing and using en=
cryption keys."
+LICENSE=3D"GPLv2"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
+
+GNOMEBASEBUILDCLASS =3D "meson"
+
+DEPENDS =3D " \
+    avahi \
+    gcr \
+    glib-2.0 \
+    gnupg \
+    gpgme \
+    gtk+3 \
+    libhandy \
+    libpwquality \
+    libsecret \
+    libsoup-2.4 \
+    openldap \
+"
+
+inherit gnomebase itstool vala
+
+SRC_URI:append =3D " file://meson-build-dont-look-for-native-ssh-keygen.=
patch"
+SRC_URI[archive.sha256sum] =3D "e6eec09e810448295f547f18c1d5772b65c3edc1=
d9e5a2595f10b5dde68929f5"
+
+FILES:${PN} +=3D "${datadir}"
+
--=20
2.25.1


