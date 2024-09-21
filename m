Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C647CF9C5B
	for <webhook@archiver.kernel.org>; Sat, 21 Sep 2024 18:29:50 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.1671.1726943383659302152
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Sep 2024 11:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout02.t-online.de (Postfix) with SMTP id 040A625F4
	for <openembedded-devel@lists.openembedded.org>; Sat, 21 Sep 2024 20:29:42 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.36.251]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ss4rU-06r7bt0; Sat, 21 Sep 2024 20:29:40 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv3] gnome-terminal: update 3.50.1 -> 3.54.0
Date: Sat, 21 Sep 2024 20:31:25 +0200
Message-ID: <20240921183125.3660211-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726943380-717F85D9-DB8DF990/0/0 CLEAN NORMAL
X-TOI-MSGID: 1f2c4133-2707-4ba2-8901-54f7f4b03849
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Sep 2024 18:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112438

- drop 0001-meson-add-option-to-set-dbus_interfacedir.patch
  Issue has been fixed by [https://gitlab.gnome.org/GNOME/gnome-terminal/=
-/commit/c1657f9cd62a982722041e5968136c7ba57e51f7]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-add-option-to-set-dbus_interfacedir.patch | 63 -------------------
 ...nal_3.50.1.bb =3D> gnome-terminal_3.54.0.bb} |  5 +-
 2 files changed, 2 insertions(+), 66 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-terminal/gnome-termina=
l/0001-meson-add-option-to-set-dbus_interfacedir.patch
 rename meta-gnome/recipes-gnome/gnome-terminal/{gnome-terminal_3.50.1.bb=
 =3D> gnome-terminal_3.54.0.bb} (79%)

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-=
meson-add-option-to-set-dbus_interfacedir.patch b/meta-gnome/recipes-gnom=
e/gnome-terminal/gnome-terminal/0001-meson-add-option-to-set-dbus_interfa=
cedir.patch
deleted file mode 100644
index 9f8475bdd..000000000
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-meson-a=
dd-option-to-set-dbus_interfacedir.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 61668e1eb86a316d4ad9a6b9cacf8c8cc74a0c33 Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Sun, 7 Jan 2024 10:40:31 +0100
-Subject: [PATCH] meson: add an option to set dbus_interface_dir
-
-Add an option that allows to set the dbus_interface_dir path manually.
-This will help to cross-compile gnome-terminal on host systems that
-don't have gnome-shell installed.
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gnome-termina=
l/-/issues/8046]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- meson_options.txt | 7 +++++++
- src/meson.build   | 7 ++++++-
- 2 files changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/meson_options.txt b/meson_options.txt
-index b555ab66..8fece058 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -13,6 +13,13 @@
- # You should have received a copy of the GNU General Public License
- # along with this programme.  If not, see <https://www.gnu.org/licenses=
/>.
-=20
-+option(
-+  'dbus_interface_dir',
-+  type: 'string',
-+  value: '',
-+  description: 'directory for D-Bus session interface files [$datadir/d=
bus-1/interfaces]',
-+)
-+
- option(
-   'dbg',
-   type: 'boolean',
-diff --git a/src/meson.build b/src/meson.build
-index 27ecd893..420ad45c 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -185,6 +185,11 @@ server_sources =3D app_sources + client_util_source=
s + debug_sources + dbus_source
-=20
- if get_option('search_provider')
-=20
-+  dbus_interface_dir =3D get_option('dbus_interface_dir')
-+  if dbus_interface_dir =3D=3D ''
-+    dbus_interface_dir =3D gt_prefix / gt_dbusinterfacedir
-+  endif
-+
-   server_sources +=3D files(
-     'terminal-search-provider.cc',
-     'terminal-search-provider.hh',
-@@ -192,7 +197,7 @@ if get_option('search_provider')
-=20
-   server_sources +=3D gnome.gdbus_codegen(
-     'terminal-search-provider-gdbus-generated',
--    gt_prefix / gt_dbusinterfacedir / 'org.gnome.ShellSearchProvider2.x=
ml',
-+    dbus_interface_dir / 'org.gnome.ShellSearchProvider2.xml',
-     autocleanup: 'none',
-     install_header: false,
-     interface_prefix: 'org.gnome.Shell',
---=20
-2.43.0
-
diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.=
1.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
similarity index 79%
rename from meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1=
.bb
rename to meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.b=
b
index 3bbfe9ece..cfbde967f 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
@@ -22,14 +22,13 @@ DEPENDS =3D " \
 SRC_URI =3D " \
 	git://gitlab.gnome.org/GNOME/gnome-terminal.git;protocol=3Dhttps;nobran=
ch=3D1 \
 	file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
-	file://0001-meson-add-option-to-set-dbus_interfacedir.patch \
 "
-SRCREV =3D "5ac3b8e4bd6fa02651b3c23cedb0a7e1cd769655"
+SRCREV =3D "965cb9307713c618253918633416fcad86bcc5d2"
 S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ?=3D ""
 PACKAGECONFIG[nautilus] =3D "-Dnautilus_extension=3Dtrue,-Dnautilus_exte=
nsion=3Dfalse,nautilus,nautilus"
-PACKAGECONFIG[search_provider] =3D "-Dsearch_provider=3Dtrue -Ddbus_inte=
rface_dir=3D${STAGING_DATADIR}/dbus-1/interfaces,-Dsearch_provider=3Dfals=
e,gnome-shell"
+PACKAGECONFIG[search_provider] =3D "-Dsearch_provider=3Dtrue,-Dsearch_pr=
ovider=3Dfalse,gnome-shell"
=20
 PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
=20
--=20
2.46.0


