Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 040B9C5ACB3
	for <webhook@archiver.kernel.org>; Sat, 18 Nov 2023 14:28:44 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.9122.1700317715726278007
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Nov 2023 06:28:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout10.t-online.de (Postfix) with SMTP id F316513393
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Nov 2023 15:28:18 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.170.27]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r4MIy-0ZCXB30; Sat, 18 Nov 2023 15:28:16 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] flatpak: Upgrade 1.15.4 -> 1.15.6
Date: Sat, 18 Nov 2023 15:28:45 +0100
Message-ID: <20231118142845.573701-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1700317696-49A21820-3EDA0EE0/0/0 CLEAN NORMAL
X-TOI-MSGID: 63c7c5e2-e45b-4496-90ba-1d58917bb467
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Nov 2023 14:28:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106885

- add a patch to fix build for the newly added wayland_security_context f=
eature
- build wayland_security_context according to wayland distro_feature

Dependencies:

    In distributions that compile Flatpak to use a separate bubblewrap (b=
wrap)
    executable, version 0.8.0 is now required.

    Enabling the optional Wayland security context feature requires
    libwayland-client, wayland-scanner >=3D 1.15 and wayland-protocols >=3D=
 1.32.

    Ubuntu 18.04 is no longer routinely tested. Support for dependency
    versions included in Ubuntu 18.04 should be considered "at risk".

Features:

    Add --device=3Dinput, for access to evdev devices in /dev/input (#548=
1)

    Update bundled copy of bubblewrap to version 0.8.0, and rely on its
    features:
        Improve error message if seccomp is disabled in kernel config
        Security hardening: set user namespace limit to 0, to prevent cre=
ation
        of nested user namespaces in a more robust way (#5084)

    For subsandboxes started by flatpak-portal, inherit environment
    variables from the flatpak run that started the original instance
    rather than from flatpak-portal, fixing behaviour of FLATPAK_GL_DRIVE=
RS
    and similar features (#5278)

    Stop http transfers if a download in progress becomes very slow (#551=
9)

    Make it easier to configure extra languages, by picking them up from
    AccountsService if configured there (#5006)

    Add new flatpak_transaction_add_rebase_and_uninstall() API,
    allowing end-of-life apps to be replaced by their intended replacemen=
t
    more reliably (#3991)

    Create a private Wayland socket with the "security context" extension
    if available, allowing the compositor to identify connections from
    sandboxed apps as belonging to the sandbox (#4920, #5507, #5558)

    Update libglnx to 2023-08-29
        Use features of newer GLib versions if available
        Turn off system-level crash reporting infrastructure during
        some unit tests that involve intentional assertion failures

    Add anchors to link to sections of flatpak-metadata documentation (#5=
582)

    New translations: ka, nl.

Bug fixes:

    Avoid warnings processing symbolic links with GLib >=3D 2.77.0, and
    with GLib 2.76.0 (GLib 2.76.1 or later silences these warnings)

    Bypass page cache for backend requests in revokefs, fixing installati=
on
    errors with libostree 2023.4 (#5452)

    Show AppStream metadata in flatpak remote-info as intended
    (#5523; regression in 1.9.1)

    Don't let Flatpak apps inherit VK_DRIVER_FILES or VK_ICD_FILENAMES
    from the host system, which would be wrong for the sandbox (#5553)

    Fix build failure with prereleases of libappstream 0.17.x (#5472)

    Forward-compatibility with libappstream 1.0 (#5563)

    Fix installation with Meson if configured with -Dauto_sideloading=3Dt=
rue
    (#5495)

    Fix a memory leak (#5329)

    Fix compiler warnings (#5362, #5366)

    Make the tests fail more comprehensibly if a required tool is missing
    (#5020)

    Clean up /var/tmp/flatpak-cache-* directories on boot (#1119)

    Don't force GIO_USE_VFS=3Dlocal for programs launched via flatpak-spa=
wn
    (#5567)

    Clarify documentation for D-Bus name ownership (#5582)

    Translation updates: id, tr, zh_CN
    (#5332, #5565)

Internal changes:

    Split up large source files into smaller modules, reducing internal
    circular dependencies (#5410, #5411, #5415, #5419, #5416, #5414)

    Re-synchronize code backported from GLib with the version in GLib
    (#5410)

    Make the flags used to apply "extra data" clearer (#5466)

    Use glnx_opendirat() where possible (#5527)

    CI improvements (#5374, #5381)

(There was never a 1.15.5 release, I got our versioning convention mixed =
up and
thought we avoided releasing odd micro versions.)
---
 .../0001-flatpak-pc-add-pc_sysrootdir.patch   |  2 +-
 ...d-require-for-native-wayland-scanner.patch | 28 +++++++++++++++++++
 .../{flatpak_1.15.4.bb =3D> flatpak_1.15.6.bb}  |  5 +++-
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/flatpak/flatpak/0001-meson.b=
uild-require-for-native-wayland-scanner.patch
 rename meta-oe/recipes-extended/flatpak/{flatpak_1.15.4.bb =3D> flatpak_=
1.15.6.bb} (83%)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add=
-pc_sysrootdir.patch b/meta-oe/recipes-extended/flatpak/flatpak/0001-flat=
pak-pc-add-pc_sysrootdir.patch
index c1f2cca5c..08d5625fa 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add-pc_sys=
rootdir.patch
+++ b/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add-pc_sys=
rootdir.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] flatpak.pc: add pc_sysrootdir
=20
 Signed-off-by: Markus Volk <f_l_k@t-online.de>
 ---
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [oe-specific]
=20
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta-oe/recipes-extended/flatpak/flatpak/0001-meson.build-re=
quire-for-native-wayland-scanner.patch b/meta-oe/recipes-extended/flatpak=
/flatpak/0001-meson.build-require-for-native-wayland-scanner.patch
new file mode 100644
index 000000000..b076a3fff
--- /dev/null
+++ b/meta-oe/recipes-extended/flatpak/flatpak/0001-meson.build-require-f=
or-native-wayland-scanner.patch
@@ -0,0 +1,28 @@
+From ced2e933cf647874da4baff002e0987b9bfe5fac Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Sat, 18 Nov 2023 15:07:49 +0100
+Subject: [PATCH] meson.build: require for native wayland-scanner
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Submitted [https://github.com/flatpak/flatpak/pull/5596=
]
+---
+ meson.build | 4 ++--
+ 1 file changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index f4e5b3a3..5d2f9eba 100644
+--- a/meson.build
++++ b/meson.build
+@@ -207,7 +207,7 @@ gtkdoc_dep =3D dependency('gtk-doc', required : get_=
option('gtkdoc'))
+ build_gtk_doc =3D gtkdoc_dep.found()
+=20
+ wayland_client =3D dependency('wayland-client', required : get_option('=
wayland_security_context'))
+-wayland_scanner =3D dependency('wayland-scanner', version : '>=3D 1.15'=
, required : get_option('wayland_security_context'))
++wayland_scanner =3D dependency('wayland-scanner', version : '>=3D 1.15'=
, required : get_option('wayland_security_context'), native : true)
+ wayland_protocols =3D dependency('wayland-protocols', version : '>=3D 1=
.32', required : get_option('wayland_security_context'))
+ build_wayland_security_context =3D wayland_client.found() and wayland_s=
canner.found() and wayland_protocols.found()
+=20
+--=20
+2.42.0
+
diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.4.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.15.6.bb
similarity index 83%
rename from meta-oe/recipes-extended/flatpak/flatpak_1.15.4.bb
rename to meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb
index ca0f0e82c..813a6f990 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.4.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb
@@ -6,9 +6,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd2=
55951079008b364516c"
 SRC_URI =3D " \
     gitsm://github.com/flatpak/flatpak;protocol=3Dhttps;branch=3Dmain \
     file://0001-flatpak-pc-add-pc_sysrootdir.patch \
+    file://0001-meson.build-require-for-native-wayland-scanner.patch \
 "
=20
-SRCREV =3D "e936e3100d406c50ba49f3ad6a0ecae455345ec0"
+SRCREV =3D "27b11b93c2a80a91c9461bc6c7f5e9a201406041"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -55,10 +56,12 @@ GTKDOC_MESON_DISABLE_FLAG =3D 'disabled'
 PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse,xauth socat-nat=
ive"
 PACKAGECONFIG[xauth] =3D "-Dxauth=3Denabled,-Dxauth=3Ddisabled,xauth"
 PACKAGECONFIG[seccomp] =3D "-Dseccomp=3Denabled,-Dseccomp=3Ddisabled,lib=
seccomp"
+PACKAGECONFIG[wayland-security-context] =3D "-Dwayland_security_context=3D=
enabled,-Dwayland_security_context=3Ddisabled,wayland wayland-native wayl=
and-protocols"
=20
 PACKAGECONFIG ?=3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xauth', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'seccomp', '', d)=
} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland-security=
-context', '', d)} \
 "
=20
 FILES:${PN} +=3D "${libdir} ${datadir}"
--=20
2.42.0


