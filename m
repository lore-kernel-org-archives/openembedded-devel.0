Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C286CF9C5B
	for <webhook@archiver.kernel.org>; Sat, 21 Sep 2024 18:17:50 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.1479.1726942667008509415
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Sep 2024 11:17:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout03.t-online.de (Postfix) with SMTP id 3DE0312933
	for <openembedded-devel@lists.openembedded.org>; Sat, 21 Sep 2024 20:17:19 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.36.251]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ss4fX-4QQoC10; Sat, 21 Sep 2024 20:17:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2] gnome-terminal: update 3.50.1 -> 3.54.0
Date: Sat, 21 Sep 2024 20:19:03 +0200
Message-ID: <20240921181903.3659210-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726942639-067FA4D7-5B7F7F6C/0/0 CLEAN NORMAL
X-TOI-MSGID: bd3a1909-71c3-4f14-a39a-46956eecdfce
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Sep 2024 18:17:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112436

- drop 0001-meson-add-option-to-set-dbus_interfacedir.patch
  Issue has been fixed by [https://gitlab.gnome.org/GNOME/gnome-terminal/=
-/commit/c1657f9cd62a982722041e5968136c7ba57e51f7]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-add-option-to-set-dbus_interfacedir.patch | 63 -------------------
 ...nal_3.50.1.bb =3D> gnome-terminal_3.54.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 65 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-terminal/gnome-termina=
l/0001-meson-add-option-to-set-dbus_interfacedir.patch
 rename meta-gnome/recipes-gnome/gnome-terminal/{gnome-terminal_3.50.1.bb=
 =3D> gnome-terminal_3.54.0.bb} (91%)

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
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1=
.bb
rename to meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.b=
b
index 3bbfe9ece..226c86b47 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
@@ -22,9 +22,8 @@ DEPENDS =3D " \
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
--=20
2.46.0


