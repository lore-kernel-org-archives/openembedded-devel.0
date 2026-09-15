Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072F0C88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:28 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18076.1789458264449744987
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=WTs0qr0l;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout10.t-online.de (Postfix) with SMTP id B65D837CBC
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Nps-00ds640; Tue, 15 Sep 2026 09:44:12 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 25/31] sysprof: upgrade 48.1 -> 51.0
Date: Tue, 15 Sep 2026 09:43:41 +0200
Message-ID: <20260915074347.6003-25-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458252-15FF89B9-547D4DBD/0/0 CLEAN NORMAL
X-TOI-MSGID: edabccf5-ff28-4f55-91fa-5524a8c83998
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458260; i=f_l_k@t-online.de;
	bh=nFxO71XnSfam9dbTwxbdaTsMicbqEk4AlVMaZg4dXvs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=WTs0qr0llaTSiS81BKPAkn/Hx1lK1seNLOi5xfgg/9a+pfPQBdivoN3iyjzCAhdLk
	 S7ocVAI8D0Uzm5j5TEcOKEd0hS7sy/Ctv36bUimDZXLMO4LVqM7VFpFNDnXtykn0+q
	 dBytNlwVmIZSNTcy7lZHop8ZavVdoXYXV1pL5t5kGzmQTlI5c14RsH2CAnUZ/Q1tpc
	 nUqvaPamy3JUb96A+XUveWvUyzJWRR3ov9kJS9gh+Fej0sUGpsryqi6AZ2744wxscE
	 QCe9Mhc/TykXZYuznkoKkNvcUB/qmqLb1DNyvKBu5TbRiIax8FhGTVoHJjzrF8yxH5
	 RfIQiOcc/ToQw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130047

The environ shadowing fix and the .debug directory lookup in the ELF
loader are part of the release now; refresh the remaining icon cache
patch.

51.0 installs a session D-Bus service file, so ship it.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...oke-the-commands-to-update-the-icon-.patch |  8 ++--
 ...f-greeter-fix-environ-with-shadowing.patch | 37 ---------------
 ...search-for-debug-links-in-.debug-dir.patch | 47 -------------------
 .../{sysprof_48.1.bb =3D> sysprof_51.0.bb}      |  5 +-
 4 files changed, 6 insertions(+), 91 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/sysprof/sysprof/0004-sysprof=
-greeter-fix-environ-with-shadowing.patch
 delete mode 100644 meta-gnome/recipes-gnome/sysprof/sysprof/0005-Make-el=
f-loader-search-for-debug-links-in-.debug-dir.patch
 rename meta-gnome/recipes-gnome/sysprof/{sysprof_48.1.bb =3D> sysprof_51=
.0.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof/0002-meson-Do-not-i=
nvoke-the-commands-to-update-the-icon-.patch b/meta-gnome/recipes-gnome/s=
ysprof/sysprof/0002-meson-Do-not-invoke-the-commands-to-update-the-icon-.=
patch
index 61c75f08b4..399a2af36f 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof/0002-meson-Do-not-invoke-t=
he-commands-to-update-the-icon-.patch
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof/0002-meson-Do-not-invoke-t=
he-commands-to-update-the-icon-.patch
@@ -15,12 +15,12 @@ Signed-off-by: Carlos Alberto Lopez Perez <clopez@iga=
lia.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index 783f558..8775fe6 100644
+index 339b1c3..bd5bda6 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -276,7 +276,7 @@ configure_file(
-   configuration: config_h
- )
+@@ -280,7 +280,7 @@ if get_option('docs')
+   subdir('doc')
+ endif
 =20
 -if get_option('gtk') and gnome.found()
 +if get_option('gtk') and gnome.found() and not meson.is_cross_build()
diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof/0004-sysprof-greete=
r-fix-environ-with-shadowing.patch b/meta-gnome/recipes-gnome/sysprof/sys=
prof/0004-sysprof-greeter-fix-environ-with-shadowing.patch
deleted file mode 100644
index a2c925cbea..0000000000
--- a/meta-gnome/recipes-gnome/sysprof/sysprof/0004-sysprof-greeter-fix-e=
nviron-with-shadowing.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f65c492e93db122ac9623c7b0ee590801f90e366 Mon Sep 17 00:00:00 2001
-From: Christian Hergert <chergert@redhat.com>
-Date: Mon, 11 Aug 2025 14:10:08 -0700
-Subject: [PATCH] sysprof/greeter: fix environ with shadowing
-
-Fixes: #150
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/sysprof/-/iss=
ues/150]
-Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
----
- src/sysprof/sysprof-greeter.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/sysprof/sysprof-greeter.c b/src/sysprof/sysprof-greeter=
.c
-index 5f44cb6..80e07ae 100644
---- a/src/sysprof/sysprof-greeter.c
-+++ b/src/sysprof/sysprof-greeter.c
-@@ -626,14 +626,14 @@ sysprof_greeter_init (SysprofGreeter *self)
-=20
-   if (self->recording_template)
-     {
--      g_auto(GStrv) environ =3D NULL;
-+      g_auto(GStrv) environ_ =3D NULL;
-       g_object_get (self->recording_template,
--                    "environ", &environ,
-+                    "environ", &environ_,
-                     NULL);
--      if (environ)
-+      if (environ_)
-         {
--          for (guint i =3D 0; environ[i]; i++)
--            gtk_string_list_append (self->envvars, environ[i]);        =
   =20
-+          for (guint i =3D 0; environ_[i]; i++)
-+            gtk_string_list_append (self->envvars, environ_[i]);       =
    =20
-         }
-     }
-=20
diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof/0005-Make-elf-loade=
r-search-for-debug-links-in-.debug-dir.patch b/meta-gnome/recipes-gnome/s=
ysprof/sysprof/0005-Make-elf-loader-search-for-debug-links-in-.debug-dir.=
patch
deleted file mode 100644
index bd7305d77d..0000000000
--- a/meta-gnome/recipes-gnome/sysprof/sysprof/0005-Make-elf-loader-searc=
h-for-debug-links-in-.debug-dir.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 9c35912dba0597a241e9af4fe5c87bfc0931c46c Mon Sep 17 00:00:00 2001
-From: Pawel Lampe <plampe@igalia.com>
-Date: Fri, 16 May 2025 14:31:29 +0200
-Subject: [PATCH] Make elf loader search for debug links in .debug dirs
-
-When the distribution is built using yocto project, it's possible
-to specify 'dbg-pkgs' image feature, see:
-https://docs.yoctoproject.org/dev/ref-manual/features.html
-This image feature makes files with package debug symbols being
-placed under .debug directories accompanying the original binary
-directories and mentioned in the .gnu_debuglink of the original binary.
-Effectively the symbols of e.g. /x/y/libz.so will be placed in
-/x/y/.debug/libz.so.
-
-This change makes sysprof's elf loader to search for debug links
-in such a .debug directories.
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/sysprof/-/merg=
e_requests/140]
----
- src/libsysprof/sysprof-elf-loader.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/src/libsysprof/sysprof-elf-loader.c b/src/libsysprof/syspro=
f-elf-loader.c
-index 2e52e26..e0b4089 100644
---- a/src/libsysprof/sysprof-elf-loader.c
-+++ b/src/libsysprof/sysprof-elf-loader.c
-@@ -336,6 +336,7 @@ sysprof_elf_loader_annotate (SysprofElfLoader      *=
self,
-           g_autofree char *directory_name =3D NULL;
-           g_autofree char *debug_path =3D NULL;
-           g_autofree char *short_debug_path =3D NULL;
-+          g_autofree char *shorter_debug_path =3D NULL;
-           const char *short_directory_name;
-           const char *debug_dir =3D self->debug_dirs[i];
-           const char *build_id;
-@@ -360,6 +361,12 @@ sysprof_elf_loader_annotate (SysprofElfLoader      =
*self,
-               sysprof_elf_set_debug_link_elf (elf, get_deepest_debuglin=
k (debug_link_elf));
-               return;
-             }
-+          shorter_debug_path =3D g_build_filename (directory_name, ".de=
bug", debug_link, NULL);
-+          if ((debug_link_elf =3D sysprof_elf_loader_load (self, mount_=
namespace, shorter_debug_path, build_id, 0, NULL)))
-+            {
-+              sysprof_elf_set_debug_link_elf (elf, get_deepest_debuglin=
k (debug_link_elf));
-+              return;
-+            }
-         }
-     }
-=20
diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof_48.1.bb b/meta-gnom=
e/recipes-gnome/sysprof/sysprof_51.0.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/sysprof/sysprof_48.1.bb
rename to meta-gnome/recipes-gnome/sysprof/sysprof_51.0.bb
index aee2dd84ae..bf1913b966 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof_48.1.bb
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof_51.0.bb
@@ -21,10 +21,8 @@ DEPENDS +=3D " \
 SRC_URI +=3D "file://0001-meson-Check-for-libunwind-instead-of-libunwind=
-gener.patch \
            file://0002-meson-Do-not-invoke-the-commands-to-update-the-ic=
on-.patch \
            file://0003-libsysprof-Check-for-unw_set_caching_policy-befor=
e-u.patch \
-           file://0004-sysprof-greeter-fix-environ-with-shadowing.patch =
\
-           file://0005-Make-elf-loader-search-for-debug-links-in-.debug-=
dir.patch \
            "
-SRC_URI[archive.sha256sum] =3D "54f157fdfef1edf1e2f22e542c462d90e1c21fca=
8c30eba4127cee739039bbe2"
+SRC_URI[archive.sha256sum] =3D "f2c8d9c5c8294ce3fdc8be7d9f4be56a72ed7152=
2cb54987f1723a8cfd91637d"
=20
 # reason: gtk4 requires opengl distro feature
 REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKAGECONFIG', 'gtk=
', 'opengl', '', d)}"
@@ -45,6 +43,7 @@ FILES_SOLIBSDEV =3D "${libdir}/libsysprof-6.so"
 SYSTEMD_SERVICE:${PN} =3D "${@bb.utils.contains('PACKAGECONFIG', 'syspro=
fd', 'sysprof3.service', '', d)}"
=20
 FILES:${PN} +=3D " \
+    ${datadir}/dbus-1/services \
     ${datadir}/dbus-1/system-services \
     ${datadir}/dbus-1/system.d \
     ${datadir}/dbus-1/interfaces \
--=20
2.55.0


