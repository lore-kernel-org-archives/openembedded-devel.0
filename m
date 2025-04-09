Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9D0C369A1
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 14:37:53 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.10307.1744209469344893064
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 07:37:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout03.t-online.de (Postfix) with SMTP id 5DAA5EE3
	for <openembedded-devel@lists.openembedded.org>; Wed,  9 Apr 2025 16:37:46 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.175.12]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u2WYj-12oajR0; Wed, 9 Apr 2025 16:37:45 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] blueman: update 2.4.3 -> 2.4.4
Date: Wed,  9 Apr 2025 16:37:38 +0200
Message-ID: <20250409143738.1230981-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1744209465-A5FFE6D7-7B6941BB/10/3626336762 SUSPECT URL
X-TOI-MSGID: 8bd896ba-599a-4940-aa38-7f15df8ee684
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 14:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116744

- remove patch that was merged upstream

2.4.4
Bugs fixed

    Fix Rfcom plugin dbus signature
    Set an initial selected device in blueman-sendto
    AutoConnect: Store bluetooth address instead of object path
    Applet: Handle UnknownObject DBus error (@tommie)
    Make search button available after device list becomes empty (@astcri=
)
    Fatal LoadException

Changes

    Terminate applet on manager termination if it was started by manager
    Add Galic and Esperanto translations
    AutoConnect: Automatically convert path to address
    Add toggle to force symbolic statusicon

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...n-DO-not-emit-absolute-path-when-S-B.patch | 38 -------------------
 .../{blueman_2.4.3.bb =3D> blueman_2.4.4.bb}    |  5 +--
 2 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/blueman/blueman/=
0001-meson-DO-not-emit-absolute-path-when-S-B.patch
 rename meta-networking/recipes-connectivity/blueman/{blueman_2.4.3.bb =3D=
> blueman_2.4.4.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman/0001-me=
son-DO-not-emit-absolute-path-when-S-B.patch b/meta-networking/recipes-co=
nnectivity/blueman/blueman/0001-meson-DO-not-emit-absolute-path-when-S-B.=
patch
deleted file mode 100644
index 6e48b70243..0000000000
--- a/meta-networking/recipes-connectivity/blueman/blueman/0001-meson-DO-=
not-emit-absolute-path-when-S-B.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 4947abc5ede2dc356f011b7c45f6760c9c2ce9f1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 14 Aug 2024 21:26:24 -0700
-Subject: [PATCH] meson: Do not emit absolute path when S !=3D B
-
-build systems like OE build outside sourcetree in such cases it works
-ok but cython resolves the input file to absolute path and that gets
-emitted into genetate _blueman.c as module name, renders the build
-non-reproducible, wish cython had a better way to handle this but there
-is not, therefore tweak the meson build rule to account for specifying
-workdir to cython which will search the inputs correctly, and use
-meson's build_root to emit the output into build dir. This ensures that
-it becomes independent of source or build directories and cython does
-not generate the absolute paths into generate C code.
-
-See cython discussion on [1]
-
-[1] https://github.com/cython/cython/issues/5949
-
-Upstream-Status: Submitted [https://github.com/blueman-project/blueman/p=
ull/2461]=20
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- module/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/module/meson.build b/module/meson.build
-index 096ad7c8..fddef547 100644
---- a/module/meson.build
-+++ b/module/meson.build
-@@ -4,7 +4,7 @@ blueman_c =3D custom_target(
-     'blueman_c',
-     output: '_blueman.c',
-     input: '_blueman.pyx',
--    command: [cython, '--output-file', '@OUTPUT@', '@INPUT@'])
-+    command: [cython, '-w', meson.source_root(), '--output-file', join_=
paths(meson.build_root(), '@OUTPUT@'), join_paths(meson.build_root(), '@I=
NPUT@')])
-=20
- sources =3D [
-     blueman_c,
diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.b=
b b/meta-networking/recipes-connectivity/blueman/blueman_2.4.4.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
rename to meta-networking/recipes-connectivity/blueman/blueman_2.4.4.bb
index 974c563299..629e1bc8cd 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.4.4.bb
@@ -8,10 +8,9 @@ inherit meson gettext systemd gsettings pkgconfig python=
3native gtk-icon-cache f
=20
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
=20
-SRC_URI =3D "git://github.com/blueman-project/blueman.git;protocol=3Dhtt=
ps;branch=3D2-4-stable \
-           file://0001-meson-DO-not-emit-absolute-path-when-S-B.patch"
+SRC_URI =3D "git://github.com/blueman-project/blueman.git;protocol=3Dhtt=
ps;branch=3D2-4-stable"
 S =3D "${WORKDIR}/git"
-SRCREV =3D "7bcf919ad6ac0ee9a8c66b18b0ca98af877d4c8f"
+SRCREV =3D "bdacba8afe53066bc3a338997e26fee416af2261"
=20
 EXTRA_OEMESON =3D "-Druntime_deps_check=3Dfalse \
     -Dsystemdsystemunitdir=3D${systemd_system_unitdir} \
--=20
2.49.0


