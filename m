Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42A6C4725D
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 13:08:43 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.6471.1705064918188513533
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 05:08:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout08.t-online.de (Postfix) with SMTP id 131DDE3D1
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 14:08:36 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.250]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rOHGz-1BAesD0; Fri, 12 Jan 2024 14:08:33 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] flatpak: fix gtk-doc build
Date: Fri, 12 Jan 2024 14:08:25 +0100
Message-ID: <20240112130825.940790-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1705064913-3D3F6958-CDF3BD7B/0/0 CLEAN NORMAL
X-TOI-MSGID: 9ab0b480-5f42-4531-b779-f990158f7929
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 13:08:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108241

this fixes:
| Run-time dependency gtk-doc found: NO (tried pkgconfig)
|
| ../git/meson.build:206:13: ERROR: Dependency "gtk-doc" not found, tried=
 pkgconfig

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...01-meson.build-require-native-gtkdoc.patch | 33 +++++++++++++++++++
 .../flatpak/flatpak_1.15.6.bb                 |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-extended/flatpak/flatpak/0001-meson.b=
uild-require-native-gtkdoc.patch

diff --git a/meta-oe/recipes-extended/flatpak/flatpak/0001-meson.build-re=
quire-native-gtkdoc.patch b/meta-oe/recipes-extended/flatpak/flatpak/0001=
-meson.build-require-native-gtkdoc.patch
new file mode 100644
index 000000000..77b60ec98
--- /dev/null
+++ b/meta-oe/recipes-extended/flatpak/flatpak/0001-meson.build-require-n=
ative-gtkdoc.patch
@@ -0,0 +1,33 @@
+From 49737b1e4a74c77a8cd7ae727974d68503da087f Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Fri, 12 Jan 2024 13:52:08 +0100
+Subject: [PATCH] meson.build: require native gtkdoc
+
+this fixes:
+| Run-time dependency gtk-doc found: NO (tried pkgconfig)
+|
+| ../git/meson.build:206:13: ERROR: Dependency "gtk-doc" not found, trie=
d pkgconfig
+
+Upstream-Status: Submitted [https://github.com/flatpak/flatpak/pull/5650=
/commits/e5de3e46b917f830d7f81e9db6ed2a9b7d7db942]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index f7f9372d..dccc3eb4 100644
+--- a/meson.build
++++ b/meson.build
+@@ -203,7 +203,7 @@ appstream_dep =3D dependency('appstream', version : =
'>=3D0.12.0')
+ gdk_pixbuf_dep =3D dependency('gdk-pixbuf-2.0')
+ libseccomp_dep =3D dependency('libseccomp', required : get_option('secc=
omp'))
+ gir_dep =3D dependency('gobject-introspection-1.0', version : '>=3D1.40=
.0', required : get_option('gir'))
+-gtkdoc_dep =3D dependency('gtk-doc', required : get_option('gtkdoc'))
++gtkdoc_dep =3D dependency('gtk-doc', required : get_option('gtkdoc'), n=
ative : true)
+ build_gtk_doc =3D gtkdoc_dep.found()
+=20
+ wayland_client =3D dependency('wayland-client', required : get_option('=
wayland_security_context'))
+--=20
+2.43.0
+
diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.15.6.bb
index caa353bb8..19f6f45fc 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb
@@ -7,6 +7,7 @@ SRC_URI =3D " \
     gitsm://github.com/flatpak/flatpak;protocol=3Dhttps;branch=3Dmain \
     file://0001-flatpak-pc-add-pc_sysrootdir.patch \
     file://0001-meson.build-require-for-native-wayland-scanner.patch \
+    file://0001-meson.build-require-native-gtkdoc.patch \
 "
=20
 SRCREV =3D "27b11b93c2a80a91c9461bc6c7f5e9a201406041"
--=20
2.43.0


