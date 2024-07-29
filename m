Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48332C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 16:52:50 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.60656.1722271961391555267
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jul 2024 09:52:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout11.t-online.de (Postfix) with SMTP id 4E6B3F93A
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 18:52:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.165.101]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sYTbh-2Ejis50; Mon, 29 Jul 2024 18:52:21 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] flatpak: update 1.15.8 -> 1.15.9
Date: Mon, 29 Jul 2024 18:53:41 +0200
Message-ID: <20240729165341.1512-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1722271941-14FE5118-6D1B6F36/0/0 CLEAN NORMAL
X-TOI-MSGID: 2fe7496a-dc52-4818-a4e0-ed12acd6c3c0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 16:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111463

- flatpak now uses wrap files instead of git submodules to fetch bwrap an=
d xdg-dbus-proxy
  For reproducibility reasons, this cannot be done. Add external binaries=
 and configure like
  recommended below:

Dependencies:

    bubblewrap and xdg-dbus-proxy are now provided by Meson wrap files in=
stead of being directly vendored via git submodule. If downloading extern=
al software during build is not allowed in your environment, please insta=
ll suitable versions of bubblewrap and xdg-dbus-proxy separately, then co=
nfigure Flatpak with options similar to -Dsystem_bubblewrap=3Dbwrap -Dsys=
tem_dbus_proxy=3Dxdg-dbus-proxy (most major distributions package it like=
 this already).

Enhancements:

    If xdg-dbus-proxy is new enough (0.1.6 or later, not yet released), a=
llow two broadcast signals from AT-SPI by default, allowing bus traffic t=
o be reduced. If xdg-dbus-proxy is older, this change will have no practi=
cal effect but is harmless. (#5828)

    Install csh profile snippet (#5753)

Bug fixes:

    Expand the list of environment variables that Flatpak apps do not inh=
erit from the host system (#5765, #5785)

    Take time zone information from $TZDIR if set (#5850)

    Fix a memory leak since 1.15.7 when reloading D-Bus configuration (#5=
856)

    Fix a memory leak when running flatpak permissions (#5844)

    Fix memory leaks in flatpak update (#5816)

    Fix memory leaks when installing packages (#5811)

    Use more similar translatable strings for some error messages (#5748)

    Document flatpak config --set languages '*all*' correctly: it is real=
ly *all* (or equivalently *), not just all (#5836)

    Fix a misleading comment in the test for CVE-2024-32462 (#5779)

    Fix a copy/paste error in the 1.15.7 release notes

    On systems where subdirectories of /sys have been made inaccessible, =
continue without them (#5138)

    Make tests more compatible with non-GNU shell utilities (#5812)

    Translation updates: ka (#5873), hi (#5838), pt_BR (#5877), zh_CN (#5=
843)

Internal changes:

    libglnx and variant-schema-compiler are now managed as git subtree in=
stead of git submodule. Maintainers and contributors, please see subproje=
cts/README.md for details of how to interact with these. In particular th=
is means that submodules no longer need to be set up before working on a =
git clone. (#5800, #5845)

    Split library code into more, smaller translation units, reducing int=
ernal circular dependencies (#5409, #5801, #5803)

    Add some convenience macros in the test suite (#5693)

    Minor internal robustness improvement (#5833)

    Add configuration for Github Codespaces (#5767)

    Improve CI configuration (#5791)

    Work around infrastructure issues in third-party apt repositories use=
d by default in Github Workflows (#5786)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../flatpak/{flatpak_1.15.8.bb =3D> flatpak_1.15.9.bb} | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/flatpak/{flatpak_1.15.8.bb =3D> flatpak_=
1.15.9.bb} (90%)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.15.9.bb
similarity index 90%
rename from meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
rename to meta-oe/recipes-extended/flatpak/flatpak_1.15.9.bb
index 3c1de93c5..e4b130741 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.9.bb
@@ -8,7 +8,7 @@ SRC_URI =3D " \
     file://0001-flatpak-pc-add-pc_sysrootdir.patch \
 "
=20
-SRCREV =3D "925c80f913d69e7ca424428823e1431c4ffb0deb"
+SRCREV =3D "b026910d1c18900e9daf07c429f7e901eb1c3f20"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -19,6 +19,7 @@ REQUIRED_DISTRO_FEATURES =3D "polkit"
 DEPENDS =3D " \
     appstream \
     bison-native \
+    bubblewrap-native \
     fuse3 \
     gdk-pixbuf \
     glib-2.0 \
@@ -30,6 +31,7 @@ DEPENDS =3D " \
     ostree \
     polkit \
     python3-pyparsing-native \
+    xdg-dbus-proxy-native \
     zstd \
 "
=20
@@ -37,6 +39,8 @@ RDEPENDS:${PN} =3D " \
     ca-certificates \
     flatpak-xdg-utils \
     fuse3-utils \
+    bubblewrap \
+    xdg-dbus-proxy \
 "
=20
 GIR_MESON_OPTION =3D "gir"
@@ -65,7 +69,11 @@ PACKAGECONFIG ?=3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland-security=
-context', '', d)} \
 "
=20
-EXTRA_OEMESON =3D "-Dsystem_fusermount=3D${bindir}/fusermount3"
+EXTRA_OEMESON =3D " \
+    -Dsystem_fusermount=3Dfusermount3 \
+    -Dsystem_bubblewrap=3Dbwrap \
+    -Dsystem_dbus_proxy=3Dxdg-dbus-proxy \
+"
=20
 FILES:${PN} +=3D "${libdir} ${datadir}"
=20
--=20
2.45.2


