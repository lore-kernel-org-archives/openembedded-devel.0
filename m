Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E4BC79F9E
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 15:06:39 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9714.1788879994991802167
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Sep 2026 08:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=KFNM1vQa;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd93.aul.t-online.de (fwd93.aul.t-online.de [10.223.144.119])
	by mailout04.t-online.de (Postfix) with SMTP id A3A87DE4
	for <openembedded-devel@lists.openembedded.org>; Tue,  8 Sep 2026 17:06:32 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.237.236]) by fwd93.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x3xP6-0czMwa0; Tue, 8 Sep 2026 17:06:32 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/3] gnome-keyring: upgrade 46.2 -> 50.0
Date: Tue,  8 Sep 2026 17:06:20 +0200
Message-ID: <20260908150627.2940117-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1788879992-D2FFA95A-5AD72356/0/0 CLEAN NORMAL
X-TOI-MSGID: 10c2f80e-b016-4133-886e-50b91625ea13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788879992; i=f_l_k@t-online.de;
	bh=1NzFyjvkWln4b/YjbSvIMvZiXDKVy4C8/+GkwzgCJ/A=;
	h=From:To:Subject:Date;
	b=KFNM1vQaq9E1RxYyoqHbis2rPr53uwwt78BpzvNbX3cM2MuLsdVjk3OGh2Sw7S98S
	 PtlzZlexntrbvdZ+5+fdno21v4veQC1hMdAC3v1jbjT9wWX+WFGzpv8667Idaw13Zx
	 4yrfvZDHbhfCe8jD3d3UOzu/3v6vEulHHtB/8Fy0OtDcnGT9f1ILy6jjbcGJS3JJtk
	 6L5gIbOpzNVYiO3tu9UkCW8TL6+nm0PaNnJkjL8dO7VP3n4YEmOuhCOnV4enwdqAX4
	 nuVIXLSbrFspkt+L9psPOfxeT2xuNWLaK8Vh/4LGkrPj1+Sj+gMSr4PAaphcPRYL4+
	 MZuXAbGHZdWiw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 15:06:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129864

gnome-keyring switched from autotools to meson in 48.alpha, so the
recipe is converted to the gnomebase meson default.

The configure.ac patch for the ssh-agent and ssh-add paths is replaced
by an equivalent meson patch that adds ssh-agent-path and ssh-add-path
options, because find_program() cannot locate target executables in
the sysroot. The musl patch is dropped, sys/select.h is included
upstream since 48.

Other changes:
- gcr-ui-3 is no longer used, so the gtk+3 dependency and the
  GTK3DISTROFEATURES check go away.
- libcap-ng, pam, selinux and systemd are now explicit PACKAGECONFIGs
  instead of being auto-detected from whatever is in the sysroot.
  libcap-ng was picked up implicitly before and stays enabled.
- The PKCS#11 module and config directories are passed explicitly
  instead of being read from the p11-kit pkg-config file.
- Man pages need xsltproc and docbook and are disabled like the docs
  were before.

Build tested on corei7-64, the packaged file list is unchanged.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-agent-and-ssh-add-by-configure-opti.patch | 40 ----------
 ...s-to-ssh-agent-and-ssh-add-by-option.patch | 77 +++++++++++++++++++
 .../gnome-keyring/gnome-keyring/musl.patch    | 17 ----
 .../gnome-keyring/gnome-keyring_46.2.bb       | 53 -------------
 .../gnome-keyring/gnome-keyring_50.0.bb       | 55 +++++++++++++
 5 files changed, 132 insertions(+), 110 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/=
0001-Set-paths-to-ssh-agent-and-ssh-add-by-configure-opti.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/=
0001-meson-allow-setting-the-paths-to-ssh-agent-and-ssh-add-by-option.pat=
ch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/=
musl.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_=
46.2.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_=
50.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/0001-Se=
t-paths-to-ssh-agent-and-ssh-add-by-configure-opti.patch b/meta-gnome/rec=
ipes-gnome/gnome-keyring/gnome-keyring/0001-Set-paths-to-ssh-agent-and-ss=
h-add-by-configure-opti.patch
deleted file mode 100644
index c3c3050924..0000000000
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/0001-Set-paths=
-to-ssh-agent-and-ssh-add-by-configure-opti.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 647f3d946ec3fe4800b2bec89371f85a1a4b15cf Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
-Date: Thu, 23 May 2019 23:44:06 +0200
-Subject: [PATCH] Set paths to ssh-agent and ssh-add by configure options
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-We have no executables in our sysroot so configuration won't find them.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
-
----
- configure.ac | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index f4f793c..5194e5d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -356,8 +356,15 @@ if test "$enable_ssh_agent" =3D "no"; then
- 	SSH_AGENT=3Dfalse
- 	SSH_ADD=3Dfalse
- else
--	AC_PATH_PROG([SSH_AGENT], [ssh-agent], [no])
--	AC_PATH_PROG([SSH_ADD], [ssh-add], [no])
-+    AC_ARG_WITH([ssh-agent-path],
-+                [AC_HELP_STRING([--with-ssh-agent-path=3DPATH],
-+                                 [path to ssh-agent])],
-+                 [SSH_AGENT=3D$with_ssh_agent_path], [SSH_AGENT=3Dno])
-+    AC_ARG_WITH([ssh-add-path],
-+                [AC_HELP_STRING([--with-ssh-add-path=3DPATH],
-+                                 [path to ssh-add])],
-+                 [SSH_ADD=3D$with_ssh_add_path], [SSH_ADD=3Dno])
-+
- 	if test "$SSH_AGENT" =3D "no" -o "$SSH_ADD" =3D "no"; then
- 		AC_MSG_ERROR([the ssh-agent and ssh-add commands were not found])
- 	else
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/0001-me=
son-allow-setting-the-paths-to-ssh-agent-and-ssh-add-by-option.patch b/me=
ta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/0001-meson-allow-setti=
ng-the-paths-to-ssh-agent-and-ssh-add-by-option.patch
new file mode 100644
index 0000000000..270fda75e0
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/0001-meson-all=
ow-setting-the-paths-to-ssh-agent-and-ssh-add-by-option.patch
@@ -0,0 +1,77 @@
+From ed91fc1a7fabd32055442204291db39bb73a603e Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 7 Sep 2026 09:20:06 +0200
+Subject: [PATCH] meson: allow setting the paths to ssh-agent and ssh-add=
 by
+ option
+
+When cross compiling there are no target executables in the sysroot, so
+find_program() cannot locate ssh-agent and ssh-add although they will be
+available at runtime. Add string options that take the paths directly
+and fall back to the lookup when they are not set.
+
+Upstream-Status: Inappropriate [OE specific]
+
+AI-Generated: Uses Claude Code (Claude Fable 5.1)
+---
+ meson.build       | 14 ++++++++++----
+ meson_options.txt | 12 ++++++++++++
+ 2 files changed, 22 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 001ed81..10e8f9a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -48,8 +48,14 @@ if libsystemd_dep.found()
+ endif
+=20
+ if get_option('ssh-agent')
+-  ssh_agent_bin =3D find_program('ssh-agent')
+-  ssh_add_bin =3D find_program('ssh-add')
++  ssh_agent_path =3D get_option('ssh-agent-path')
++  if ssh_agent_path =3D=3D ''
++    ssh_agent_path =3D find_program('ssh-agent').full_path()
++  endif
++  ssh_add_path =3D get_option('ssh-add-path')
++  if ssh_add_path =3D=3D ''
++    ssh_add_path =3D find_program('ssh-add').full_path()
++  endif
+ endif
+=20
+ if get_option('pam')
+@@ -97,8 +103,8 @@ conf.set('WITH_SELINUX', libselinux_dep.found())
+ conf.set('WITH_SYSTEMD', libsystemd_dep.found())
+ if get_option('ssh-agent')
+   conf.set('WITH_SSH', true)
+-  conf.set_quoted('SSH_AGENT', ssh_agent_bin.full_path())
+-  conf.set_quoted('SSH_ADD', ssh_add_bin.full_path())
++  conf.set_quoted('SSH_AGENT', ssh_agent_path)
++  conf.set_quoted('SSH_ADD', ssh_add_path)
+ endif
+ conf.set('DOTLOCK_USE_PTHREAD', true)
+ conf.set('DOTLOCK_GLIB_LOGGING', true)
+diff --git a/meson_options.txt b/meson_options.txt
+index 55d9a3f..ed860fb 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -10,6 +10,18 @@ option('ssh-agent',
+   description: 'Include SSH agent in gnome-keyring',
+ )
+=20
++option('ssh-agent-path',
++  type: 'string',
++  value: '',
++  description: 'Path to the ssh-agent binary (skips the build time look=
up)',
++)
++
++option('ssh-add-path',
++  type: 'string',
++  value: '',
++  description: 'Path to the ssh-add binary (skips the build time lookup=
)',
++)
++
+ option('selinux',
+   type: 'feature',
+   value: 'auto',
+--=20
+2.55.0
+
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/musl.pa=
tch b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/musl.patch
deleted file mode 100644
index 050b87ab24..0000000000
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/musl.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-include sys/select.h for FD_* macros
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: gnome-keyring-2.32.1/pkcs11/rpc-layer/gkm-rpc-daemon-standalone.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gnome-keyring-2.32.1.orig/pkcs11/rpc-layer/gkm-rpc-daemon-standalone=
.c
-+++ gnome-keyring-2.32.1/pkcs11/rpc-layer/gkm-rpc-daemon-standalone.c
-@@ -32,6 +32,7 @@
- #include <unistd.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <sys/select.h>
-=20
- #include <dlfcn.h>
- #include <pthread.h>
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.2.bb=
 b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.2.bb
deleted file mode 100644
index fcff02a4b3..0000000000
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.2.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-SUMMARY =3D "Password and keyring managing daemon"
-HOMEPAGE =3D "http://www.gnome.org/"
-BUGTRACKER =3D "https://bugzilla.gnome.org/"
-SECTION =3D "x11/gnome"
-
-LICENSE =3D "GPL-2.0-or-later AND LGPL-2.0-or-later AND LGPL-2.1-or-late=
r"
-LIC_FILES_CHKSUM =3D " \
-    file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
-    file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c \
-"
-
-CVE_PRODUCT =3D "gnome-keyring gnome_keyring"
-
-DEPENDS =3D " \
-    glib-2.0-native \
-    gtk+3 \
-    gcr3 \
-    libgcrypt \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} \
-"
-
-GNOMEBASEBUILDCLASS =3D "autotools"
-inherit gnomebase gsettings features_check gettext
-
-ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
-
-SRC_URI[archive.sha256sum] =3D "bf26c966b8a8b7f3285ecc8bb3e467b9c20f9535=
b94dc451c9c559ddcff61925"
-SRC_URI +=3D " \
-    file://0001-Set-paths-to-ssh-agent-and-ssh-add-by-configure-opti.pat=
ch \
-    file://musl.patch \
-"
-
-PACKAGECONFIG ??=3D "ssh-agent"
-PACKAGECONFIG[ssh-agent] =3D "--enable-ssh-agent --with-ssh-agent-path=3D=
${bindir}/ssh-agent --with-ssh-add-path=3D${bindir}/ssh-add,--disable-ssh=
-agent,,openssh-misc"
-
-EXTRA_OECONF =3D " \
-    --disable-doc \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam --with-=
pam-dir=3D${base_libdir}/security', '--disable-pam', d)} \
-"
-
-FILES:${PN} +=3D " \
-    ${datadir}/dbus-1/services \
-    ${datadir}/p11-kit \
-    ${datadir}/xdg-desktop-portal \
-    ${base_libdir}/security/*${SOLIBSDEV} \
-    ${libdir}/pkcs11/gnome-keyring-pkcs11.so \
-    ${systemd_user_unitdir} \
-"
-# fix | gnome-keyring-daemon: insufficient process capabilities, unsecur=
e memory might get used
-pkg_postinst:${PN} () {
-    setcap cap_ipc_lock+ep $D/${bindir}/gnome-keyring-daemon
-}
-PACKAGE_WRITE_DEPS +=3D "libcap-native"
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_50.0.bb=
 b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_50.0.bb
new file mode 100644
index 0000000000..215397ffd3
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_50.0.bb
@@ -0,0 +1,55 @@
+SUMMARY =3D "Password and keyring managing daemon"
+HOMEPAGE =3D "http://www.gnome.org/"
+BUGTRACKER =3D "https://bugzilla.gnome.org/"
+SECTION =3D "x11/gnome"
+
+LICENSE =3D "GPL-2.0-or-later AND LGPL-2.0-or-later AND LGPL-2.1-or-late=
r"
+LIC_FILES_CHKSUM =3D " \
+    file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
+    file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c \
+"
+
+CVE_PRODUCT =3D "gnome-keyring gnome_keyring"
+
+DEPENDS =3D " \
+    glib-2.0-native \
+    gcr3 \
+    libgcrypt \
+    p11-kit \
+"
+
+inherit gnomebase gsettings gettext
+
+SRC_URI[archive.sha256sum] =3D "cbd72062c53c9702bc2c4733991ad5f051ca6828=
82b30905a2829bcf1a8ecc7c"
+SRC_URI +=3D "file://0001-meson-allow-setting-the-paths-to-ssh-agent-and=
-ssh-add-by-option.patch"
+
+PACKAGECONFIG ??=3D " \
+    libcap-ng \
+    ssh-agent \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'pam selinux systemd', d)} \
+"
+PACKAGECONFIG[libcap-ng] =3D "-Dlibcap-ng=3Denabled,-Dlibcap-ng=3Ddisabl=
ed,libcap-ng"
+PACKAGECONFIG[pam] =3D "-Dpam=3Dtrue,-Dpam=3Dfalse,libpam"
+PACKAGECONFIG[selinux] =3D "-Dselinux=3Denabled,-Dselinux=3Ddisabled,lib=
selinux"
+PACKAGECONFIG[ssh-agent] =3D "-Dssh-agent=3Dtrue -Dssh-agent-path=3D${bi=
ndir}/ssh-agent -Dssh-add-path=3D${bindir}/ssh-add,-Dssh-agent=3Dfalse,,o=
penssh-misc"
+PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsystemd=3Ddisabled,sys=
temd"
+
+EXTRA_OEMESON =3D " \
+    -Dmanpage=3Dfalse \
+    -Dpkcs11-config=3D${datadir}/p11-kit/modules \
+    -Dpkcs11-modules=3D${libdir}/pkcs11 \
+"
+
+FILES:${PN} +=3D " \
+    ${datadir}/dbus-1/services \
+    ${datadir}/p11-kit \
+    ${datadir}/xdg-desktop-portal \
+    ${libdir}/security/*${SOLIBSDEV} \
+    ${libdir}/pkcs11/gnome-keyring-pkcs11.so \
+    ${systemd_user_unitdir} \
+"
+# fix | gnome-keyring-daemon: insufficient process capabilities, unsecur=
e memory might get used
+pkg_postinst:${PN} () {
+    setcap cap_ipc_lock+ep $D/${bindir}/gnome-keyring-daemon
+}
+PACKAGE_WRITE_DEPS +=3D "libcap-native"
--=20
2.55.0


