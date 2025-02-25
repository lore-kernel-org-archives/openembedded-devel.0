Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AB1C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 15:58:13 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.11721.1740499083765485039
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 07:58:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout09.t-online.de (Postfix) with SMTP id 5D1C07644
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 16:58:01 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.41.232]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tmxJl-0jjLHd0; Tue, 25 Feb 2025 16:57:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2] accountsservice: update 22.08.8 -> 23.13.9
Date: Tue, 25 Feb 2025 16:58:36 +0100
Message-ID: <20250225155836.639196-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1740499077-1985C983-A2DF8321/10/3626336762 SUSPECT URL
X-TOI-MSGID: f6bcac9e-aeda-4d10-b407-6baa79e2a2bb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 15:58:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115583

- backport a patch to add meson options for wtmp and tests (needed for mu=
sl build)
- refresh musl patch
- add PACKAGECONFIGS for admin_group and elogind
- update dependencies
- inherit pkgconfig
- add backport patch to fix:

| ../accountsservice-23.13.9/subprojects/mocklibc-1.0/src/netgroup-debug.=
c:25:3: error: implicit declaration of function 'print_indent' [-Wimplici=
t-function-declaration]
|    25 |   print_indent(stream, indent);

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-musl-Hack-to-fix-build.patch         |  36 ------
 .../0002-musl-add-missing-fgetspent_r.patch   |  23 ++--
 ...e12ad4044d33cc54c71c75773c5a653dad09.patch | 115 ++++++++++++++++++
 .../accountsservice-23.13.9-c99-fixes.patch   |  51 ++++++++
 ..._22.08.8.bb =3D> accountsservice_23.13.9.bb} |  25 ++--
 5 files changed, 197 insertions(+), 53 deletions(-)
 delete mode 100644 meta-gnome/recipes-support/accountsservice/accountsse=
rvice/0001-musl-Hack-to-fix-build.patch
 create mode 100644 meta-gnome/recipes-support/accountsservice/accountsse=
rvice/00b6e12ad4044d33cc54c71c75773c5a653dad09.patch
 create mode 100644 meta-gnome/recipes-support/accountsservice/accountsse=
rvice/accountsservice-23.13.9-c99-fixes.patch
 rename meta-gnome/recipes-support/accountsservice/{accountsservice_22.08=
.8.bb =3D> accountsservice_23.13.9.bb} (50%)

diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice/0=
001-musl-Hack-to-fix-build.patch b/meta-gnome/recipes-support/accountsser=
vice/accountsservice/0001-musl-Hack-to-fix-build.patch
deleted file mode 100644
index 944d2f9165..0000000000
--- a/meta-gnome/recipes-support/accountsservice/accountsservice/0001-mus=
l-Hack-to-fix-build.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From ff0718174faf1167fb4765ebe4bd280bbe8d2ac6 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
-Date: Sun, 8 Dec 2019 23:42:00 +0100
-Subject: [PATCH] musl: Hack to fix configure
-
-Upstream-Status: Inappropriate [Musl Specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- meson.build | 11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 075776f..dfd7421 100644
---- a/meson.build
-+++ b/meson.build
-@@ -101,9 +101,14 @@ elif cc.has_header_symbol('paths.h', '_PATH_WTMPX')
-=20
-   config_h.set('PATH_WTMP', '_PATH_WTMPX')
- else
--  path_wtmp =3D '/var/log/utx.log'
--  assert(run_command('test', '-e', path_wtmp).returncode() =3D=3D 0, 'D=
o not know which filename to watch for wtmp changes')
--  config_h.set_quoted('PATH_WTMP', path_wtmp)
-+  # musl: This is just a build fix hack.
-+  # As usual they know better, consider all other projects crap and off=
er zero
-+  # alternatives: So wtmp is a dead stub only [1] (=3D /dev/null/wtmp -=
 taken
-+  # from musl sources).
-+  # Maybe a hero comes along and adds utmps [2] to make accountsservice=
 useful for musl
-+  # [1] https://wiki.musl-libc.org/faq.html#Q:-Why-is-the-utmp/wtmp-fun=
ctionality-only-implemented-as-stubs?
-+  # [2] https://github.com/skarnet/utmps
-+  config_h.set_quoted('PATH_WTMP', '/dev/null/wtmp')
- endif
-=20
- # compiler flags
---=20
-2.34.1
-
diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice/0=
002-musl-add-missing-fgetspent_r.patch b/meta-gnome/recipes-support/accou=
ntsservice/accountsservice/0002-musl-add-missing-fgetspent_r.patch
index 2b0924b2e4..dfc27b7302 100644
--- a/meta-gnome/recipes-support/accountsservice/accountsservice/0002-mus=
l-add-missing-fgetspent_r.patch
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice/0002-mus=
l-add-missing-fgetspent_r.patch
@@ -1,27 +1,29 @@
-From 7401e682400df87f3258f795bb1d143f64a35a9f Mon Sep 17 00:00:00 2001
+From 87c5c711f6f828053abd754628a0067696cfd54d Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
-Date: Mon, 9 Dec 2019 00:12:08 +0100
+Date: Mon, 9 Dec 2019 09:36:12 +0100
 Subject: [PATCH] musl: add missing fgetspent_r
=20
+From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
+
 Stolen from void-linux
=20
 Upstream-Status: Inappropriate [musl-specific]
-
 ---
- src/daemon.c | 20 ++++++++++++++++++++
- 1 file changed, 20 insertions(+)
+ src/daemon.c | 22 ++++++++++++++++++++++
+ 1 file changed, 22 insertions(+)
=20
 diff --git a/src/daemon.c b/src/daemon.c
-index c52bda3..a7676fe 100644
+index aa9d050..cc53eae 100644
 --- a/src/daemon.c
 +++ b/src/daemon.c
-@@ -164,6 +164,26 @@ remove_cache_files (const gchar *user_name)
+@@ -215,6 +215,28 @@ remove_cache_files (const gchar *user_name)
          g_remove (icon_filename);
  }
 =20
-+/* Musl libc does not support fgetspent_r(), write own
-+ * wrapper
-+ */
++#ifndef __GLIBC__
++ /* Musl libc does not support fgetspent_r(), write own
++  * wrapper
++  */
 +static int fgetspent_r(FILE *fp, struct spwd *spbuf, char *buf, size_t =
buflen, struct spwd **spbufp) {
 +       struct spwd *shadow_entry =3D fgetspent(fp);
 +       if(!shadow_entry)
@@ -38,6 +40,7 @@ index c52bda3..a7676fe 100644
 +
 +       return 0;
 +}
++#endif
 +
  static struct passwd *
  entry_generator_fgetpwent (Daemon       *daemon,
diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice/0=
0b6e12ad4044d33cc54c71c75773c5a653dad09.patch b/meta-gnome/recipes-suppor=
t/accountsservice/accountsservice/00b6e12ad4044d33cc54c71c75773c5a653dad0=
9.patch
new file mode 100644
index 0000000000..f016057562
--- /dev/null
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice/00b6e12a=
d4044d33cc54c71c75773c5a653dad09.patch
@@ -0,0 +1,115 @@
+From 747d781c1ccf3b8112ec6a098f23f26ccadc5880 Mon Sep 17 00:00:00 2001
+From: oreo639 <oreo6391@gmail.com>
+Date: Sun, 9 Feb 2025 23:24:08 -0800
+Subject: [PATCH] build: Disable tests when cross compiling and allow
+
+ specifying path_wtmp
+=20
+ Upstream-Status: Backport [https://gitlab.freedesktop.org/accountsservi=
ce/accountsservice/-/commit/00b6e12ad4044d33cc54c71c75773c5a653dad09]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ meson.build       | 64 ++++++++++++++++++++++++++---------------------
+ meson_options.txt |  2 ++
+ 2 files changed, 38 insertions(+), 28 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 4a509e7..2a56627 100644
+--- a/meson.build
++++ b/meson.build
+@@ -77,34 +77,40 @@ foreach func: check_functions
+   config_h.set('HAVE_' + func.underscorify().to_upper(), cc.has_functio=
n(func))
+ endforeach
+=20
+-if cc.has_header_symbol('utmpx.h', 'WTMPX_FILENAME', prefix: '#define _=
GNU_SOURCE')
+-  code =3D '''#define _GNU_SOURCE
+-  #include <stdio.h>
+-  #include <utmpx.h>
+-  int main (int argc, char **argv) {
+-    printf ("%s\n", WTMPX_FILENAME);
+-    return 0;
+-  }
+-  '''
+-  result =3D cc.run(code, name : 'value of WTMPX_FILENAME')
+-  path_wtmp =3D result.stdout().strip()
+-
+-  config_h.set('PATH_WTMP', 'WTMPX_FILENAME')
+-elif cc.has_header_symbol('paths.h', '_PATH_WTMPX')
+-  code =3D '''#include <paths.h>
+-  #include <stdio.h>
+-  int main (int argc, char **argv) {
+-    printf ("%s\n", _PATH_WTMPX);
+-    return 0;
+-  }
+-  '''
+-  result =3D cc.run(code, name : 'value of _PATH_WTMPX')
+-  path_wtmp =3D result.stdout().strip()
+-
+-  config_h.set('PATH_WTMP', '_PATH_WTMPX')
++path_wtmp =3D get_option('wtmpfile')
++if path_wtmp =3D=3D ''
++  if cc.has_header_symbol('utmpx.h', 'WTMPX_FILENAME', prefix: '#define=
 _GNU_SOURCE') and meson.can_run_host_binaries()
++    code =3D '''#define _GNU_SOURCE
++    #include <stdio.h>
++    #include <utmpx.h>
++    int main (int argc, char **argv) {
++      printf ("%s\n", WTMPX_FILENAME);
++      return 0;
++    }
++    '''
++    result =3D cc.run(code, name : 'value of WTMPX_FILENAME')
++    path_wtmp =3D result.stdout().strip()
++
++    config_h.set('PATH_WTMP', 'WTMPX_FILENAME')
++  elif cc.has_header_symbol('paths.h', '_PATH_WTMPX') and meson.can_run=
_host_binaries()
++    code =3D '''#include <paths.h>
++    #include <stdio.h>
++    int main (int argc, char **argv) {
++      printf ("%s\n", _PATH_WTMPX);
++      return 0;
++    }
++    '''
++    result =3D cc.run(code, name : 'value of _PATH_WTMPX')
++    path_wtmp =3D result.stdout().strip()
++
++    config_h.set('PATH_WTMP', '_PATH_WTMPX')
++  else
++    assert(not meson.is_cross_build(), 'Cannot determine wtmp for this =
cross compile, please specify -Dwtmpfile=3D')
++    path_wtmp =3D '/var/log/utx.log'
++    assert(run_command('test', '-e', path_wtmp, check: false).returncod=
e() =3D=3D 0, 'Do not know which filename to watch for wtmp changes')
++    config_h.set_quoted('PATH_WTMP', path_wtmp)
++  endif
+ else
+-  path_wtmp =3D '/var/log/utx.log'
+-  assert(run_command('test', '-e', path_wtmp, check: false).returncode(=
) =3D=3D 0, 'Do not know which filename to watch for wtmp changes')
+   config_h.set_quoted('PATH_WTMP', path_wtmp)
+ endif
+=20
+@@ -232,7 +238,9 @@ if get_option('gtk_doc')
+   subdir('doc/libaccountsservice')
+ endif
+=20
+-subdir('tests')
++if get_option('tests') and meson.can_run_host_binaries()
++  subdir('tests')
++endif
+=20
+ configure_file(
+   output: 'config.h',
+diff --git a/meson_options.txt b/meson_options.txt
+index b34a0fa..e25c61e 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -1,6 +1,7 @@
+ option('systemdsystemunitdir', type: 'string', value: '', description: =
'custom directory for systemd system units')
+ option('gdmconffile', type: 'string', value: '/etc/gdm/custom.conf', de=
scription: 'GDM configuration file')
+ option('lightdmconffile', type: 'string', value: '/etc/lightdm/lightdm.=
conf', description: 'LightDM configuration file')
++option('wtmpfile', type: 'string', value: '', description: 'override fi=
lepath of wtmp file')
+=20
+ option('admin_group', type: 'string', value: '', description: 'Set grou=
p for administrative accounts')
+ option('extra_admin_groups', type: 'array', value: [], description: 'Co=
mma-separated list of extra groups that administrator users are part of')
+@@ -13,3 +14,4 @@ option('vapi', type: 'boolean', value: true, descripti=
on : 'Enable Vala bindings
+=20
+ option('docbook', type: 'boolean', value: false, description: 'build do=
cumentation (requires xmlto)')
+ option('gtk_doc', type: 'boolean', value: false, description: 'use gtk-=
doc to build documentation')
++option('tests',   type: 'boolean', value: true, description: 'run accou=
ntservice tests if possible')
diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice/a=
ccountsservice-23.13.9-c99-fixes.patch b/meta-gnome/recipes-support/accou=
ntsservice/accountsservice/accountsservice-23.13.9-c99-fixes.patch
new file mode 100644
index 0000000000..ffb6ffca18
--- /dev/null
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice/accounts=
service-23.13.9-c99-fixes.patch
@@ -0,0 +1,51 @@
+From 97ff4512ea17600d390d67b59e6d0058d1b0b7d5 Mon Sep 17 00:00:00 2001
+From: Ray Strode <rstrode@redhat.com>
+Date: Tue, 11 Apr 2023 10:09:07 -0400
+Subject: [PATCH] mocklibc: Fix compiler warning
+
+https://bugs.gentoo.org/930715
+https://gitlab.freedesktop.org/accountsservice/accountsservice/-/commit/=
da65bee12d9118fe1a49c8718d428fe61d232339
+
+print_indent is defined in one file and used in another without a
+forward declaration. That leads to a compiler warning/error.
+
+This commit fixes that.
+
+Upstream-Status: Backport [https://gitweb.gentoo.org/repo/gentoo.git/tre=
e/sys-apps/accountsservice/files/accountsservice-23.13.9-c99-fixes.patch]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ subprojects/mocklibc.wrap                           |  2 ++
+ subprojects/packagefiles/mocklibc-print-indent.diff | 13 +++++++++++++
+ 2 files changed, 15 insertions(+)
+ create mode 100644 subprojects/packagefiles/mocklibc-print-indent.diff
+
+diff --git a/subprojects/mocklibc.wrap b/subprojects/mocklibc.wrap
+index af82298..539ee83 100644
+--- a/subprojects/mocklibc.wrap
++++ b/subprojects/mocklibc.wrap
+@@ -8,3 +8,5 @@ source_hash =3D b2236a6af1028414783e9734a46ea051916ec226=
479d6a55a3bb823bff68f120
+ patch_url =3D https://wrapdb.mesonbuild.com/v1/projects/mocklibc/1.0/2/=
get_zip
+ patch_filename =3D mocklibc-1.0-2-wrap.zip
+ patch_hash =3D 0280f96a2eeb3c023e5acf4e00cef03d362868218d4a85347ea45137=
c0ef6c56
++
++diff_files =3D mocklibc-print-indent.diff
+diff --git a/subprojects/packagefiles/mocklibc-print-indent.diff b/subpr=
ojects/packagefiles/mocklibc-print-indent.diff
+new file mode 100644
+index 0000000..4aaed40
+--- /dev/null
++++ b/subprojects/packagefiles/mocklibc-print-indent.diff
+@@ -0,0 +1,13 @@
++diff -up mocklibc-1.0/src/netgroup-debug.c.print-indent mocklibc-1.0/sr=
c/netgroup-debug.c
++--- mocklibc-1.0/src/netgroup-debug.c.print-indent	2023-04-11 10:20:53.=
717381559 -0400
+++++ mocklibc-1.0/src/netgroup-debug.c	2023-04-11 10:21:02.296270333 -04=
00
++@@ -21,6 +21,9 @@
++ #include <stdio.h>
++ #include <stdlib.h>
++=20
+++void print_indent (FILE        *stream,
+++                   unsigned int indent);
+++
++ void netgroup_debug_print_entry(struct entry *entry, FILE *stream, uns=
igned int indent) {
++   print_indent(stream, indent);
++=20
diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice_2=
2.08.8.bb b/meta-gnome/recipes-support/accountsservice/accountsservice_23=
.13.9.bb
similarity index 50%
rename from meta-gnome/recipes-support/accountsservice/accountsservice_22=
.08.8.bb
rename to meta-gnome/recipes-support/accountsservice/accountsservice_23.1=
3.9.bb
index 439958c7d2..e3dfcfffff 100644
--- a/meta-gnome/recipes-support/accountsservice/accountsservice_22.08.8.=
bb
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.=
bb
@@ -5,24 +5,35 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673=
463ab874e80d47fae504"
=20
 DEPENDS =3D " \
     dbus \
+    glib-2.0 \
+    json-c \
     polkit \
+    virtual/crypt \
 "
=20
-inherit meson gobject-introspection gtk-doc features_check systemd vala
+inherit meson gobject-introspection gtk-doc features_check systemd vala =
pkgconfig
=20
 REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
-SRC_URI =3D "https://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.ta=
r.xz"
+SRC_URI =3D " \
+	https://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
+	file://accountsservice-23.13.9-c99-fixes.patch \
+	file://00b6e12ad4044d33cc54c71c75773c5a653dad09.patch \
+"
 SRC_URI:append:libc-musl =3D " \
-    file://0001-musl-Hack-to-fix-build.patch \
-    file://0002-musl-add-missing-fgetspent_r.patch \
+	file://0002-musl-add-missing-fgetspent_r.patch \
 "
-SRC_URI[sha256sum] =3D "909997a76919fe7dc138a9a01cea70bd622d5a932dbc9fb1=
3010113023a7a391"
+
+EXTRA_OEMESON:libc-musl +=3D "-Dwtmpfile=3D/var/log/wtmp -Dtests=3Dfalse=
"
+
+SRC_URI[sha256sum] =3D "adda4cdeae24fa0992e7df3ffff9effa7090be3ac233a3ed=
fdf69d5a9c9b924f"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"
-PACKAGECONFIG[systemd] =3D ", -Dsystemdsystemunitdir=3D'no', systemd"
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
} admin_group"
+PACKAGECONFIG[systemd] =3D ",,systemd"
+PACKAGECONFIG[elogind] =3D "-Delogind=3Dtrue,-Delogind=3Dfalse,elogind"
+PACKAGECONFIG[admin_group] =3D "-Dadmin_group=3Dwheel"
=20
 SYSTEMD_SERVICE:${PN} =3D "accounts-daemon.service"
=20
--=20
2.48.1


