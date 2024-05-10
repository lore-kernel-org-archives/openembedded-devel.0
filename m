Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD71C25B10
	for <webhook@archiver.kernel.org>; Fri, 10 May 2024 05:43:41 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.6152.1715319819635537655
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 May 2024 22:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout01.t-online.de (Postfix) with SMTP id E7FD32E681
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 May 2024 07:43:37 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.232.205]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s5J2f-0fxbiD0; Fri, 10 May 2024 07:43:37 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/4] flatpak: update 1.15.6 -> 1.15.8
Date: Fri, 10 May 2024 07:43:57 +0200
Message-ID: <20240510054400.3796092-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1715319817-26FFADFC-2441BF9D/0/0 CLEAN NORMAL
X-TOI-MSGID: 035b3b51-14aa-4787-80ea-ecf9bfd40886
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 May 2024 05:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110304

- remove included patches
- set path for fusermount3 to avoid requirement for fuse3-native. This is=
 needed since:
  https://github.com/flatpak/flatpak/commit/2cb17b4eb82ecedaa98b5b7f954cf=
3e52fa95682

Changes in 1.15.8
~~~~~~~~~~~~~~~~~

Security fixes:

 * Don't allow an executable name to be misinterpreted as a command-line
   option for bwrap(1). This prevents a sandbox escape where a malicious
   or compromised app could ask xdg-desktop-portal to generate a .desktop
   file with access to files outside the sandbox. (CVE-2024-32462)

Other bug fixes:

 * Pass the -export-dynamic linker option as -Wl,-export-dynamic,
   fixing build failures with clang 18 and lld 18 (#5760)

 * Fix a double-free when installation is cancelled (#5763)

 * Fix installed-tests failure with "FUSERMOUNT: unbound variable"
   (#5751)

 * Translation updates: pt_BR (#5762), tr (#5761)

Changes in 1.15.7
~~~~~~~~~~~~~~~~~
Released: 2024-03-27

Dependencies:

 * The Meson build system is now required.
   Compiling with Autotools is no longer possible.

 * In distributions that compile Flatpak to use a separate bubblewrap (bw=
rap)
   executable, version 0.9.0 is recommended. Several of the bug fixes lis=
ted
   below will not be active if an older version is used.

 * In distributions that compile Flatpak to use a separate xdg-dbus-proxy
   executable, version 0.1.5 is recommended.

 * If libmalcontent (parental controls) is enabled, it must be version 0.=
5.0
   or later.

New features:

 * Automatically remove obsolete driver versions and other autopruned ref=
s
   (#5632)

 * `--socket=3Dinherit-wayland-socket` (#5614)

 * Automatically reload D-Bus session bus configuration after installing
   or upgrading apps, to pick up any exported D-Bus services (#3342)

Bug fixes:

 * Update included copy of bubblewrap to version 0.9.0:

     * `--symlink` is now idempotent, meaning it succeeds if the
       symlink already exists and already has the desired target
       (#2387, #3477, #5255)
     * Report a better error message if `mount(2)` fails with `ENOSPC`
     * Fix a double-close on error reading from `--args`, `--seccomp` or
       `--add-seccomp-fd` argument
     * Improve memory allocation behaviour
     * Silence various compiler warnings

 * Update included copy of bubblewrap to version 0.1.5:

     * Fix handling of long object paths

 * Don't parse `<developer><name/></developer>` as the application name
   (#5700)

 * Don't refuse to start apps when there is no D-Bus system bus available
   (#5076)

 * Don't try to repeat migration of apps whose data was migrated to a new
   name and then deleted (#5668)

 * Improve handling of mixed locales on systems with systemd-localed (#54=
97)

 * Improve display of ellipsized columns in wide terminals (#5722)

 * Make `flatpak info -e` look for extensions in all installations (#5670=
)

 * Fix warnings from newer GLib versions (#5660, #5737)

 * Always set the `container` environment variable (#5610)

 * Always let the app inherit redirected file descriptors (#5626)

 * In `flatpak ps`, add xdg-desktop-portal-gnome to the list of backends
   we'll use to learn which apps are running in the background (#5729)

 * Don't use `WAYLAND_SOCKET` unless given `--socket=3Dinherit-wayland-so=
cket`
   (#5614)

 * Use `fusermount3` if compiled with FUSE 3, overridable with
   `-Dsystem_fusermount` compile-time option (#5104)

 * Avoid leaking a temporary variable from /etc/profile.d/flatpak.sh into
   the shell environment (#5574)

 * Improve async-signal safety (#5687)

 * Fix various memory leaks (#5683, #5690, #5691)

 * Avoid undefined behaviour of signed left-shift when storing object IDs
   in a hash table (#5738)

 * Detect the correct gtk-doc when cross-compiling (#5650)

 * Detect the correct wayland-scanner when cross-compiling (#5596)

 * Documentation improvements (#5659, #5677, #5682, #5664, #5719)

 * Skip more tests when FUSE isn't available (#5611)

 * Translation updates (#5602, #5707)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...d-require-for-native-wayland-scanner.patch | 28 ----------------
 ...01-meson.build-require-native-gtkdoc.patch | 33 -------------------
 .../{flatpak_1.15.6.bb =3D> flatpak_1.15.8.bb}  |  6 ++--
 3 files changed, 3 insertions(+), 64 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/flatpak/flatpak/0001-meson.b=
uild-require-for-native-wayland-scanner.patch
 delete mode 100644 meta-oe/recipes-extended/flatpak/flatpak/0001-meson.b=
uild-require-native-gtkdoc.patch
 rename meta-oe/recipes-extended/flatpak/{flatpak_1.15.6.bb =3D> flatpak_=
1.15.8.bb} (92%)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak/0001-meson.build-re=
quire-for-native-wayland-scanner.patch b/meta-oe/recipes-extended/flatpak=
/flatpak/0001-meson.build-require-for-native-wayland-scanner.patch
deleted file mode 100644
index b076a3fff..000000000
--- a/meta-oe/recipes-extended/flatpak/flatpak/0001-meson.build-require-f=
or-native-wayland-scanner.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From ced2e933cf647874da4baff002e0987b9bfe5fac Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Sat, 18 Nov 2023 15:07:49 +0100
-Subject: [PATCH] meson.build: require for native wayland-scanner
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
-
-Upstream-Status: Submitted [https://github.com/flatpak/flatpak/pull/5596=
]
----
- meson.build | 4 ++--
- 1 file changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index f4e5b3a3..5d2f9eba 100644
---- a/meson.build
-+++ b/meson.build
-@@ -207,7 +207,7 @@ gtkdoc_dep =3D dependency('gtk-doc', required : get_=
option('gtkdoc'))
- build_gtk_doc =3D gtkdoc_dep.found()
-=20
- wayland_client =3D dependency('wayland-client', required : get_option('=
wayland_security_context'))
--wayland_scanner =3D dependency('wayland-scanner', version : '>=3D 1.15'=
, required : get_option('wayland_security_context'))
-+wayland_scanner =3D dependency('wayland-scanner', version : '>=3D 1.15'=
, required : get_option('wayland_security_context'), native : true)
- wayland_protocols =3D dependency('wayland-protocols', version : '>=3D 1=
.32', required : get_option('wayland_security_context'))
- build_wayland_security_context =3D wayland_client.found() and wayland_s=
canner.found() and wayland_protocols.found()
-=20
---=20
-2.42.0
-
diff --git a/meta-oe/recipes-extended/flatpak/flatpak/0001-meson.build-re=
quire-native-gtkdoc.patch b/meta-oe/recipes-extended/flatpak/flatpak/0001=
-meson.build-require-native-gtkdoc.patch
deleted file mode 100644
index 77b60ec98..000000000
--- a/meta-oe/recipes-extended/flatpak/flatpak/0001-meson.build-require-n=
ative-gtkdoc.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 49737b1e4a74c77a8cd7ae727974d68503da087f Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Fri, 12 Jan 2024 13:52:08 +0100
-Subject: [PATCH] meson.build: require native gtkdoc
-
-this fixes:
-| Run-time dependency gtk-doc found: NO (tried pkgconfig)
-|
-| ../git/meson.build:206:13: ERROR: Dependency "gtk-doc" not found, trie=
d pkgconfig
-
-Upstream-Status: Submitted [https://github.com/flatpak/flatpak/pull/5650=
/commits/e5de3e46b917f830d7f81e9db6ed2a9b7d7db942]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index f7f9372d..dccc3eb4 100644
---- a/meson.build
-+++ b/meson.build
-@@ -203,7 +203,7 @@ appstream_dep =3D dependency('appstream', version : =
'>=3D0.12.0')
- gdk_pixbuf_dep =3D dependency('gdk-pixbuf-2.0')
- libseccomp_dep =3D dependency('libseccomp', required : get_option('secc=
omp'))
- gir_dep =3D dependency('gobject-introspection-1.0', version : '>=3D1.40=
.0', required : get_option('gir'))
--gtkdoc_dep =3D dependency('gtk-doc', required : get_option('gtkdoc'))
-+gtkdoc_dep =3D dependency('gtk-doc', required : get_option('gtkdoc'), n=
ative : true)
- build_gtk_doc =3D gtkdoc_dep.found()
-=20
- wayland_client =3D dependency('wayland-client', required : get_option('=
wayland_security_context'))
---=20
-2.43.0
-
diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.15.8.bb
similarity index 92%
rename from meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb
rename to meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
index 97e57c13d..8719d3ef0 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
@@ -6,11 +6,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd2=
55951079008b364516c"
 SRC_URI =3D " \
     gitsm://github.com/flatpak/flatpak;protocol=3Dhttps;branch=3Dmain \
     file://0001-flatpak-pc-add-pc_sysrootdir.patch \
-    file://0001-meson.build-require-for-native-wayland-scanner.patch \
-    file://0001-meson.build-require-native-gtkdoc.patch \
 "
=20
-SRCREV =3D "27b11b93c2a80a91c9461bc6c7f5e9a201406041"
+SRCREV =3D "925c80f913d69e7ca424428823e1431c4ffb0deb"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -66,6 +64,8 @@ PACKAGECONFIG ?=3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland-security=
-context', '', d)} \
 "
=20
+EXTRA_OEMESON =3D "-Dsystem_fusermount=3D${bindir}/fusermount3"
+
 FILES:${PN} +=3D "${libdir} ${datadir}"
=20
 USERADD_PACKAGES =3D "${PN}"
--=20
2.44.0


