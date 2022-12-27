Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C446CC10F1B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 07:27:15 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.152784.1672126034081643470
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 23:27:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout11.t-online.de (Postfix) with SMTP id 9F949129C9
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 08:27:11 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.226.104]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pA4Mg-07SnJJ0; Tue, 27 Dec 2022 08:27:10 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv2] gnome-desktop: update 42.0 -> 43
Date: Tue, 27 Dec 2022 08:27:03 +0100
Message-Id: <20221227072703.125568-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1672126030-EF7E87E2-E8FAC887/0/0 CLEAN NORMAL
X-TOI-MSGID: 15862f43-a20e-4f3b-8caa-dd5f82babfc7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 07:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100283

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ild-Disable-libseccomp-for-all-archs.patch | 40 -------------------
 ...me-desktop_42.0.bb =3D> gnome-desktop_43.bb} | 19 ++++-----
 2 files changed, 10 insertions(+), 49 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop/=
0001-meson.build-Disable-libseccomp-for-all-archs.patch
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop_42.0.bb =3D=
> gnome-desktop_43.bb} (76%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop/0001-me=
son.build-Disable-libseccomp-for-all-archs.patch b/meta-gnome/recipes-gno=
me/gnome-desktop/gnome-desktop/0001-meson.build-Disable-libseccomp-for-al=
l-archs.patch
deleted file mode 100644
index 8ae1d82b6..000000000
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop/0001-meson.bui=
ld-Disable-libseccomp-for-all-archs.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From de0d33b068a5d8e61cc0c82d88d15b9a8aa97977 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
-Date: Sat, 6 Apr 2019 18:07:17 +0200
-Subject: [PATCH] meson.build: Disable libseccomp for all archs
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-It does not seem mandatory and can cause unsatisfied dependency [1].
-
-[1] https://errors.yoctoproject.org/Errors/Details/235565/
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
----
- meson.build | 7 +------
- 1 file changed, 1 insertion(+), 6 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 1dc8a73..87d72fe 100644
---- a/meson.build
-+++ b/meson.build
-@@ -65,12 +65,7 @@ udev_dep =3D dependency('libudev', required: get_opti=
on('udev'))
- host_os =3D host_machine.system()
- host_cpu =3D host_machine.cpu()
- supported_os =3D ['linux']
--unsupported_cpus =3D ['alpha', 'ia64', 'm68k', 'sh4', 'sparc', 'sparc64=
']
--if supported_os.contains(host_os) and not unsupported_cpus.contains(hos=
t_cpu)
--  seccomp_dep =3D dependency('libseccomp')
--else
--  seccomp_dep =3D dependency('', required: false)
--endif
-+seccomp_dep =3D dependency('', required: false)
-=20
- fontconfig_cache_path =3D fontconfig_dep.get_variable(pkgconfig: 'cache=
dir')
- xkb_base =3D xkb_config_dep.get_variable(pkgconfig: 'xkb_base')
---=20
-2.34.1
-
diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb=
 b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_43.bb
similarity index 76%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_43.bb
index 6eeaed0e1..7695056ea 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_43.bb
@@ -16,21 +16,22 @@ REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-=
data"
=20
 GIR_MESON_OPTION =3D ""
=20
-SRC_URI[archive.sha256sum] =3D "f3caa293a5e86f6ccad18f817273db1c67061e68=
0d79d839aa8a7528e5bb26d6"
-SRC_URI +=3D " \
-    file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
-    file://0001-meson.build-Disable-libseccomp-for-all-archs.patch \
-"
+SRC_URI +=3D "file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long=
.patch"
+SRC_URI[archive.sha256sum] =3D "3d6e153317486157596aa3802f87676414c57073=
8f450a94a041fe8835420a69"
=20
 DEPENDS +=3D " \
+    fontconfig \
+    gdk-pixbuf \
+    glib-2.0 \
     gsettings-desktop-schemas \
-    virtual/libx11 \
     gtk+3 \
     gtk4 \
-    startup-notification \
-    xkeyboard-config \
     iso-codes \
-    udev \
+    xext \
+    libseccomp \
+    libxkbcommon \
+    xkeyboard-config \
+    xrandr \
 "
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
--=20
2.34.1


