Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FAC5C88E53
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 10:20:40 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19769.1789467631740302818
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 03:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=thOI/oNK;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout01.t-online.de (Postfix) with SMTP id 9B8C61BE23
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 12:20:29 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6QH2-0GNEZ70; Tue, 15 Sep 2026 12:20:24 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] accountsservice: upgrade 23.13.9 -> 26.27.3
Date: Tue, 15 Sep 2026 12:20:17 +0200
Message-ID: <20260915102017.5106-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915102017.5106-1-f_l_k@t-online.de>
References: <20260915102017.5106-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789467624-FF7FD9A7-B69E16D0/0/0 CLEAN NORMAL
X-TOI-MSGID: ca517e30-afed-452c-a896-763a606fd447
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789467629; i=f_l_k@t-online.de;
	bh=ClDkWdNV/tZ4rdmskIAfYPmijtzQt3vJwlXZvspEPi4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=thOI/oNKXjzNbW3pDlBue4t2ebbi99M/YJaDeSvRKK9SMTc9EtYFDW1b0RMBgsGQ6
	 zx+o/ZqeXQlfV6OCI28KQN4ZXk0OV/W7aGFyTH3ogTFn1yRzd/Po/YeNNfqsI7eH80
	 pCA8noP/obWR91V4Bzl6MH+kx2UWj+Dkb/HmuaglPADln/BdFbg6foDSuiC2hbLlL8
	 fGz9Qtv49Ibiru9yIobMzztxuymTFR03XVckRl3jN4h93XHX5Yqlkv/5BvhI/CL0HG
	 IsQwTcxzL15hYmGDBE8rwj2Fs/LEdVXeqMahOC6sqCp0bhrZAGkFjY3K3IW2ibWOUL
	 VEcE+PTss6rQg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 10:20:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130069

Needed by gnome-control-center 51, which requires >=3D 26.27.3.

Upstream no longer publishes tarballs on freedesktop.org, so fetch the
release tag from gitlab.freedesktop.org instead.

All three patches are obsolete: the C99 fixes and the backported commit
00b6e12a are part of the release, and the musl fgetspent_r wrapper has
been replaced by upstream's own fgetspent_r_compat in src/daemon.c.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0002-musl-add-missing-fgetspent_r.patch   |  47 -------
 ...e12ad4044d33cc54c71c75773c5a653dad09.patch | 115 ------------------
 .../accountsservice-23.13.9-c99-fixes.patch   |  51 --------
 ..._23.13.9.bb =3D> accountsservice_26.27.3.bb} |  12 +-
 4 files changed, 2 insertions(+), 223 deletions(-)
 delete mode 100644 meta-gnome/recipes-support/accountsservice/accountsse=
rvice/0002-musl-add-missing-fgetspent_r.patch
 delete mode 100644 meta-gnome/recipes-support/accountsservice/accountsse=
rvice/00b6e12ad4044d33cc54c71c75773c5a653dad09.patch
 delete mode 100644 meta-gnome/recipes-support/accountsservice/accountsse=
rvice/accountsservice-23.13.9-c99-fixes.patch
 rename meta-gnome/recipes-support/accountsservice/{accountsservice_23.13=
.9.bb =3D> accountsservice_26.27.3.bb} (76%)

diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice/0=
002-musl-add-missing-fgetspent_r.patch b/meta-gnome/recipes-support/accou=
ntsservice/accountsservice/0002-musl-add-missing-fgetspent_r.patch
deleted file mode 100644
index dfc27b7302..0000000000
--- a/meta-gnome/recipes-support/accountsservice/accountsservice/0002-mus=
l-add-missing-fgetspent_r.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 87c5c711f6f828053abd754628a0067696cfd54d Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
-Date: Mon, 9 Dec 2019 09:36:12 +0100
-Subject: [PATCH] musl: add missing fgetspent_r
-
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
-
-Stolen from void-linux
-
-Upstream-Status: Inappropriate [musl-specific]
----
- src/daemon.c | 22 ++++++++++++++++++++++
- 1 file changed, 22 insertions(+)
-
-diff --git a/src/daemon.c b/src/daemon.c
-index aa9d050..cc53eae 100644
---- a/src/daemon.c
-+++ b/src/daemon.c
-@@ -215,6 +215,28 @@ remove_cache_files (const gchar *user_name)
-         g_remove (icon_filename);
- }
-=20
-+#ifndef __GLIBC__
-+ /* Musl libc does not support fgetspent_r(), write own
-+  * wrapper
-+  */
-+static int fgetspent_r(FILE *fp, struct spwd *spbuf, char *buf, size_t =
buflen, struct spwd **spbufp) {
-+       struct spwd *shadow_entry =3D fgetspent(fp);
-+       if(!shadow_entry)
-+               return -1;
-+       size_t namplen =3D strlen(shadow_entry->sp_namp);
-+       size_t pwdplen =3D strlen(shadow_entry->sp_pwdp);
-+
-+       if(namplen + pwdplen + 2 > buflen)
-+               return -1;
-+
-+       *spbufp =3D memcpy(spbuf, shadow_entry, sizeof(struct spwd));
-+       spbuf->sp_namp =3D strncpy(buf, shadow_entry->sp_namp, namplen +=
 1);
-+       spbuf->sp_pwdp =3D strncpy(buf + namplen + 1, shadow_entry->sp_p=
wdp, pwdplen + 1);
-+
-+       return 0;
-+}
-+#endif
-+
- static struct passwd *
- entry_generator_fgetpwent (Daemon       *daemon,
-                            GHashTable   *users,
diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice/0=
0b6e12ad4044d33cc54c71c75773c5a653dad09.patch b/meta-gnome/recipes-suppor=
t/accountsservice/accountsservice/00b6e12ad4044d33cc54c71c75773c5a653dad0=
9.patch
deleted file mode 100644
index d7b6525934..0000000000
--- a/meta-gnome/recipes-support/accountsservice/accountsservice/00b6e12a=
d4044d33cc54c71c75773c5a653dad09.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-From 747d781c1ccf3b8112ec6a098f23f26ccadc5880 Mon Sep 17 00:00:00 2001
-From: oreo639 <oreo6391@gmail.com>
-Date: Sun, 9 Feb 2025 23:24:08 -0800
-Subject: [PATCH] build: Disable tests when cross compiling and allow
-
- specifying path_wtmp
-=20
-Upstream-Status: Backport [https://gitlab.freedesktop.org/accountsservic=
e/accountsservice/-/commit/00b6e12ad4044d33cc54c71c75773c5a653dad09]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- meson.build       | 64 ++++++++++++++++++++++++++---------------------
- meson_options.txt |  2 ++
- 2 files changed, 38 insertions(+), 28 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 4a509e7..2a56627 100644
---- a/meson.build
-+++ b/meson.build
-@@ -77,34 +77,40 @@ foreach func: check_functions
-   config_h.set('HAVE_' + func.underscorify().to_upper(), cc.has_functio=
n(func))
- endforeach
-=20
--if cc.has_header_symbol('utmpx.h', 'WTMPX_FILENAME', prefix: '#define _=
GNU_SOURCE')
--  code =3D '''#define _GNU_SOURCE
--  #include <stdio.h>
--  #include <utmpx.h>
--  int main (int argc, char **argv) {
--    printf ("%s\n", WTMPX_FILENAME);
--    return 0;
--  }
--  '''
--  result =3D cc.run(code, name : 'value of WTMPX_FILENAME')
--  path_wtmp =3D result.stdout().strip()
--
--  config_h.set('PATH_WTMP', 'WTMPX_FILENAME')
--elif cc.has_header_symbol('paths.h', '_PATH_WTMPX')
--  code =3D '''#include <paths.h>
--  #include <stdio.h>
--  int main (int argc, char **argv) {
--    printf ("%s\n", _PATH_WTMPX);
--    return 0;
--  }
--  '''
--  result =3D cc.run(code, name : 'value of _PATH_WTMPX')
--  path_wtmp =3D result.stdout().strip()
--
--  config_h.set('PATH_WTMP', '_PATH_WTMPX')
-+path_wtmp =3D get_option('wtmpfile')
-+if path_wtmp =3D=3D ''
-+  if cc.has_header_symbol('utmpx.h', 'WTMPX_FILENAME', prefix: '#define=
 _GNU_SOURCE') and meson.can_run_host_binaries()
-+    code =3D '''#define _GNU_SOURCE
-+    #include <stdio.h>
-+    #include <utmpx.h>
-+    int main (int argc, char **argv) {
-+      printf ("%s\n", WTMPX_FILENAME);
-+      return 0;
-+    }
-+    '''
-+    result =3D cc.run(code, name : 'value of WTMPX_FILENAME')
-+    path_wtmp =3D result.stdout().strip()
-+
-+    config_h.set('PATH_WTMP', 'WTMPX_FILENAME')
-+  elif cc.has_header_symbol('paths.h', '_PATH_WTMPX') and meson.can_run=
_host_binaries()
-+    code =3D '''#include <paths.h>
-+    #include <stdio.h>
-+    int main (int argc, char **argv) {
-+      printf ("%s\n", _PATH_WTMPX);
-+      return 0;
-+    }
-+    '''
-+    result =3D cc.run(code, name : 'value of _PATH_WTMPX')
-+    path_wtmp =3D result.stdout().strip()
-+
-+    config_h.set('PATH_WTMP', '_PATH_WTMPX')
-+  else
-+    assert(not meson.is_cross_build(), 'Cannot determine wtmp for this =
cross compile, please specify -Dwtmpfile=3D')
-+    path_wtmp =3D '/var/log/utx.log'
-+    assert(run_command('test', '-e', path_wtmp, check: false).returncod=
e() =3D=3D 0, 'Do not know which filename to watch for wtmp changes')
-+    config_h.set_quoted('PATH_WTMP', path_wtmp)
-+  endif
- else
--  path_wtmp =3D '/var/log/utx.log'
--  assert(run_command('test', '-e', path_wtmp, check: false).returncode(=
) =3D=3D 0, 'Do not know which filename to watch for wtmp changes')
-   config_h.set_quoted('PATH_WTMP', path_wtmp)
- endif
-=20
-@@ -232,7 +238,9 @@ if get_option('gtk_doc')
-   subdir('doc/libaccountsservice')
- endif
-=20
--subdir('tests')
-+if get_option('tests') and meson.can_run_host_binaries()
-+  subdir('tests')
-+endif
-=20
- configure_file(
-   output: 'config.h',
-diff --git a/meson_options.txt b/meson_options.txt
-index b34a0fa..e25c61e 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -1,6 +1,7 @@
- option('systemdsystemunitdir', type: 'string', value: '', description: =
'custom directory for systemd system units')
- option('gdmconffile', type: 'string', value: '/etc/gdm/custom.conf', de=
scription: 'GDM configuration file')
- option('lightdmconffile', type: 'string', value: '/etc/lightdm/lightdm.=
conf', description: 'LightDM configuration file')
-+option('wtmpfile', type: 'string', value: '', description: 'override fi=
lepath of wtmp file')
-=20
- option('admin_group', type: 'string', value: '', description: 'Set grou=
p for administrative accounts')
- option('extra_admin_groups', type: 'array', value: [], description: 'Co=
mma-separated list of extra groups that administrator users are part of')
-@@ -13,3 +14,4 @@ option('vapi', type: 'boolean', value: true, descripti=
on : 'Enable Vala bindings
-=20
- option('docbook', type: 'boolean', value: false, description: 'build do=
cumentation (requires xmlto)')
- option('gtk_doc', type: 'boolean', value: false, description: 'use gtk-=
doc to build documentation')
-+option('tests',   type: 'boolean', value: true, description: 'run accou=
ntservice tests if possible')
diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice/a=
ccountsservice-23.13.9-c99-fixes.patch b/meta-gnome/recipes-support/accou=
ntsservice/accountsservice/accountsservice-23.13.9-c99-fixes.patch
deleted file mode 100644
index ffb6ffca18..0000000000
--- a/meta-gnome/recipes-support/accountsservice/accountsservice/accounts=
service-23.13.9-c99-fixes.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 97ff4512ea17600d390d67b59e6d0058d1b0b7d5 Mon Sep 17 00:00:00 2001
-From: Ray Strode <rstrode@redhat.com>
-Date: Tue, 11 Apr 2023 10:09:07 -0400
-Subject: [PATCH] mocklibc: Fix compiler warning
-
-https://bugs.gentoo.org/930715
-https://gitlab.freedesktop.org/accountsservice/accountsservice/-/commit/=
da65bee12d9118fe1a49c8718d428fe61d232339
-
-print_indent is defined in one file and used in another without a
-forward declaration. That leads to a compiler warning/error.
-
-This commit fixes that.
-
-Upstream-Status: Backport [https://gitweb.gentoo.org/repo/gentoo.git/tre=
e/sys-apps/accountsservice/files/accountsservice-23.13.9-c99-fixes.patch]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- subprojects/mocklibc.wrap                           |  2 ++
- subprojects/packagefiles/mocklibc-print-indent.diff | 13 +++++++++++++
- 2 files changed, 15 insertions(+)
- create mode 100644 subprojects/packagefiles/mocklibc-print-indent.diff
-
-diff --git a/subprojects/mocklibc.wrap b/subprojects/mocklibc.wrap
-index af82298..539ee83 100644
---- a/subprojects/mocklibc.wrap
-+++ b/subprojects/mocklibc.wrap
-@@ -8,3 +8,5 @@ source_hash =3D b2236a6af1028414783e9734a46ea051916ec226=
479d6a55a3bb823bff68f120
- patch_url =3D https://wrapdb.mesonbuild.com/v1/projects/mocklibc/1.0/2/=
get_zip
- patch_filename =3D mocklibc-1.0-2-wrap.zip
- patch_hash =3D 0280f96a2eeb3c023e5acf4e00cef03d362868218d4a85347ea45137=
c0ef6c56
-+
-+diff_files =3D mocklibc-print-indent.diff
-diff --git a/subprojects/packagefiles/mocklibc-print-indent.diff b/subpr=
ojects/packagefiles/mocklibc-print-indent.diff
-new file mode 100644
-index 0000000..4aaed40
---- /dev/null
-+++ b/subprojects/packagefiles/mocklibc-print-indent.diff
-@@ -0,0 +1,13 @@
-+diff -up mocklibc-1.0/src/netgroup-debug.c.print-indent mocklibc-1.0/sr=
c/netgroup-debug.c
-+--- mocklibc-1.0/src/netgroup-debug.c.print-indent	2023-04-11 10:20:53.=
717381559 -0400
-++++ mocklibc-1.0/src/netgroup-debug.c	2023-04-11 10:21:02.296270333 -04=
00
-+@@ -21,6 +21,9 @@
-+ #include <stdio.h>
-+ #include <stdlib.h>
-+=20
-++void print_indent (FILE        *stream,
-++                   unsigned int indent);
-++
-+ void netgroup_debug_print_entry(struct entry *entry, FILE *stream, uns=
igned int indent) {
-+   print_indent(stream, indent);
-+=20
diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice_2=
3.13.9.bb b/meta-gnome/recipes-support/accountsservice/accountsservice_26=
.27.3.bb
similarity index 76%
rename from meta-gnome/recipes-support/accountsservice/accountsservice_23=
.13.9.bb
rename to meta-gnome/recipes-support/accountsservice/accountsservice_26.2=
7.3.bb
index 79870608a3..4a95d1410e 100644
--- a/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.=
bb
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice_26.27.3.=
bb
@@ -15,19 +15,11 @@ inherit meson gobject-introspection gtk-doc features_=
check systemd vala pkgconfi
=20
 REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
-SRC_URI =3D " \
-	https://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
-	file://accountsservice-23.13.9-c99-fixes.patch \
-	file://00b6e12ad4044d33cc54c71c75773c5a653dad09.patch \
-"
-SRC_URI:append:libc-musl =3D " \
-	file://0002-musl-add-missing-fgetspent_r.patch \
-"
+SRC_URI =3D "git://gitlab.freedesktop.org/${BPN}/${BPN}.git;protocol=3Dh=
ttps;branch=3Dmain;tag=3D${PV}"
+SRCREV =3D "4e254d9624cc48224c9920b9509df0b144f7be0c"
=20
 EXTRA_OEMESON:append:libc-musl =3D " -Dwtmpfile=3D/var/log/wtmp -Dtests=3D=
false"
=20
-SRC_URI[sha256sum] =3D "adda4cdeae24fa0992e7df3ffff9effa7090be3ac233a3ed=
fdf69d5a9c9b924f"
-
 UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/accountsservice/a=
ccountsservice/-/tags"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
=20
--=20
2.55.0


