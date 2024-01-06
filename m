Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DBA8C46CD2
	for <webhook@archiver.kernel.org>; Sat,  6 Jan 2024 22:33:27 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.4577.1704580404407487470
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jan 2024 14:33:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout08.t-online.de (Postfix) with SMTP id E2C5A2AD66
	for <openembedded-devel@lists.openembedded.org>; Sat,  6 Jan 2024 23:33:10 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.174.51]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rMFE6-0LzdWz0; Sat, 6 Jan 2024 23:33:10 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-terminal: fix search_provider build
Date: Sat,  6 Jan 2024 23:33:05 +0100
Message-ID: <20240106223305.337182-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1704580390-31FF8937-B784D1F9/0/0 CLEAN NORMAL
X-TOI-MSGID: 5cdb582d-3c44-4e4a-8f78-4d7226347791
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Jan 2024 22:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108066

currently org.gnome.ShellSearchProvider2.xml is read from host machine an=
d
thus gnome-terminal with search_provider enabled can only be build from a=
 host
system that has gnome-shell installed.

Add an option and set it to STAGING_DATADIR to avoid:

| DEBUG: Executing shell function do_compile
| ninja: error: '/usr/share/dbus-1/interfaces/org.gnome.ShellSearchProvid=
er2.xml', needed by 'src/terminal-search-provider-gdbus-generated.c', mis=
sing and no known rule to make it

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-add-option-to-set-dbus_interfacedir.patch | 45 +++++++++++++++++++
 .../gnome-terminal/gnome-terminal_3.50.1.bb   | 10 +++--
 2 files changed, 51 insertions(+), 4 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-terminal/gnome-termina=
l/0001-meson-add-option-to-set-dbus_interfacedir.patch

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-=
meson-add-option-to-set-dbus_interfacedir.patch b/meta-gnome/recipes-gnom=
e/gnome-terminal/gnome-terminal/0001-meson-add-option-to-set-dbus_interfa=
cedir.patch
new file mode 100644
index 000000000..86f6d6f01
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-meson-a=
dd-option-to-set-dbus_interfacedir.patch
@@ -0,0 +1,45 @@
+From 0ca761ee244a649c7420f15407439928addf6737 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Sat, 6 Jan 2024 23:05:25 +0100
+Subject: [PATCH] meson: add option to set dbus_interfacedir
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ meson_options.txt | 7 +++++++
+ src/meson.build   | 2 +-
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/meson_options.txt b/meson_options.txt
+index b555ab663..aea66a3dd 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -13,6 +13,13 @@
+ # You should have received a copy of the GNU General Public License
+ # along with this programme.  If not, see <https://www.gnu.org/licenses=
/>.
+=20
++option(
++  'dbus_interfacedir',
++  type: 'string',
++  value: '',
++  description: 'Set searchprovider interface dir',
++)
++
+ option(
+   'dbg',
+   type: 'boolean',
+diff --git a/src/meson.build b/src/meson.build
+index 86e287403..cb707a85d 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -231,7 +231,7 @@ if get_option('search_provider')
+=20
+   server_sources +=3D gnome.gdbus_codegen(
+     'terminal-search-provider-gdbus-generated',
+-    gt_prefix / gt_dbusinterfacedir / 'org.gnome.ShellSearchProvider2.x=
ml',
++    get_option('dbus_interfacedir') / 'org.gnome.ShellSearchProvider2.x=
ml',
+     autocleanup: 'none',
+     install_header: false,
+     interface_prefix: 'org.gnome.Shell',
+--=20
+2.43.0
+
diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.=
1.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
index 8616f2c9b..6fd816c8c 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
@@ -19,15 +19,17 @@ DEPENDS =3D " \
     libpcre2 \
 "
=20
-SRC_URI =3D "git://gitlab.gnome.org/GNOME/gnome-terminal.git;protocol=3D=
https;nobranch=3D1 \
-           file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch =
\
-           "
+SRC_URI =3D " \
+	git://gitlab.gnome.org/GNOME/gnome-terminal.git;protocol=3Dhttps;nobran=
ch=3D1 \
+	file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
+	file://0001-meson-add-option-to-set-dbus_interfacedir.patch \
+"
 SRCREV =3D "5ac3b8e4bd6fa02651b3c23cedb0a7e1cd769655"
 S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ?=3D ""
 PACKAGECONFIG[nautilus] =3D "-Dnautilus_extension=3Dtrue,-Dnautilus_exte=
nsion=3Dfalse,nautilus,nautilus"
-PACKAGECONFIG[search_provider] =3D "-Dsearch_provider=3Dtrue,-Dsearch_pr=
ovider=3Dfalse,,gnome-shell"
+PACKAGECONFIG[search_provider] =3D "-Dsearch_provider=3Dtrue -Ddbus_inte=
rfacedir=3D${STAGING_DATADIR}/dbus-1/interfaces,-Dsearch_provider=3Dfalse=
,gnome-shell"
=20
 FILES:${PN} +=3D " \
     ${datadir} \
--=20
2.43.0


