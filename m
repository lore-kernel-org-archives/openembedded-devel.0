Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C3C2C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 19:41:57 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.48723.1701286912176347163
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 11:41:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout07.t-online.de (Postfix) with SMTP id BDDB658435
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 20:41:49 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.37.216]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r8QRO-1GJMYc0; Wed, 29 Nov 2023 20:41:46 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/3] spice: Set meson version based on PV
Date: Wed, 29 Nov 2023 20:42:20 +0100
Message-ID: <20231129194221.5853-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231129194221.5853-1-f_l_k@t-online.de>
References: <20231129194221.5853-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1701286906-E560B93F-FEBF8B7F/0/0 CLEAN NORMAL
X-TOI-MSGID: 927a0cc9-98f7-4d95-a191-94b9498d73fd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 19:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107146

This fixes:
| Dependency spice-server found: NO found UNKNOWN but need: '>=3D0.14.0'
| Run-time dependency spice-server found: NO
|
| ../qemu-8.1.2/meson.build:1038:10: ERROR: Dependency lookup for spice-s=
erver
with method 'pkgconfig' failed: Invalid version, need 'spice-server'
['>=3D0.14.0'] found 'UNKNOWN'.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...n.build-set-hardcoded-version-string.patch | 26 +++++++++++++++++++
 .../recipes-support/spice/spice_git.bb        | 10 ++++++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/spice/spice/0001-meso=
n.build-set-hardcoded-version-string.patch

diff --git a/meta-networking/recipes-support/spice/spice/0001-meson.build=
-set-hardcoded-version-string.patch b/meta-networking/recipes-support/spi=
ce/spice/0001-meson.build-set-hardcoded-version-string.patch
new file mode 100644
index 000000000..6717dec16
--- /dev/null
+++ b/meta-networking/recipes-support/spice/spice/0001-meson.build-set-ha=
rdcoded-version-string.patch
@@ -0,0 +1,26 @@
+From dd85d2ad3295f759176c73b9be527276b41a2ea5 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 27 Nov 2023 20:08:39 +0100
+Subject: [PATCH] meson.build: Set hardcoded version string
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index ab05fa5a..f65f7a4f 100644
+--- a/meson.build
++++ b/meson.build
+@@ -2,7 +2,7 @@
+ # project definition
+ #
+ project('spice', 'c', 'cpp',
+-        version : run_command('build-aux/git-version-gen', meson.source=
_root() + '/.tarball-version', check : true).stdout().strip(),
++        version : '@version@',
+         license : 'LGPLv2.1',
+         meson_version : '>=3D 0.49',
+         default_options : ['buildtype=3Ddebugoptimized',
+--=20
+2.42.0
+
diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-ne=
tworking/recipes-support/spice/spice_git.bb
index a1f3010dd..9596265ba 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -17,7 +17,10 @@ PV =3D "0.15.2"
=20
 SRCREV =3D "0c2c1413a8b387ea597a95b6c867470a7c56c8ab"
=20
-SRC_URI =3D "gitsm://gitlab.freedesktop.org/spice/spice;branch=3Dmaster;=
protocol=3Dhttps"
+SRC_URI =3D " \
+    gitsm://gitlab.freedesktop.org/spice/spice;branch=3Dmaster;protocol=3D=
https \
+    file://0001-meson.build-set-hardcoded-version-string.patch \
+"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -30,6 +33,11 @@ DEPENDS:append:class-nativesdk =3D " nativesdk-openssl=
"
=20
 export PYTHON=3D"${STAGING_BINDIR_NATIVE}/python3-native/python3"
=20
+
+do_configure:prepend() {
+    sed -i "s|@version@|${PV}|" ${S}/meson.build
+}
+
 PACKAGECONFIG:class-native =3D ""
 PACKAGECONFIG:class-nativesdk =3D ""
 PACKAGECONFIG ?=3D "sasl opus smartcard gstreamer"
--=20
2.42.1


