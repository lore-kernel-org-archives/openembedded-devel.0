Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B66C47073
	for <webhook@archiver.kernel.org>; Sun,  7 Jan 2024 10:27:41 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.12908.1704623256484610655
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 02:27:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout12.t-online.de (Postfix) with SMTP id A8F8D1DA95
	for <openembedded-devel@lists.openembedded.org>; Sun,  7 Jan 2024 11:27:34 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.46.223]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rMQNP-36x6iP0; Sun, 7 Jan 2024 11:27:31 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2] gnome-terminal: fix search_provider build
Date: Sun,  7 Jan 2024 11:27:23 +0100
Message-ID: <20240107102723.47876-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1704623251-FB7FD94C-7B3B078D/0/0 CLEAN NORMAL
X-TOI-MSGID: 9d211f9a-c0cf-443f-95ad-ab67cdb26bd3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 10:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108069

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
 ...-add-option-to-set-dbus_interfacedir.patch | 66 +++++++++++++++++++
 .../gnome-terminal/gnome-terminal_3.50.1.bb   | 10 +--
 2 files changed, 72 insertions(+), 4 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-terminal/gnome-termina=
l/0001-meson-add-option-to-set-dbus_interfacedir.patch

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-=
meson-add-option-to-set-dbus_interfacedir.patch b/meta-gnome/recipes-gnom=
e/gnome-terminal/gnome-terminal/0001-meson-add-option-to-set-dbus_interfa=
cedir.patch
new file mode 100644
index 000000000..b9d5fd5ec
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-meson-a=
dd-option-to-set-dbus_interfacedir.patch
@@ -0,0 +1,66 @@
+From 5212e85699b59819262165740d3c7a10b6a5c46b Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Sun, 7 Jan 2024 10:40:31 +0100
+Subject: [PATCH] meson: add an option to set dbus_interface_dir
+
+currently org.gnome.ShellSearchProvider2.xml is read from host machine a=
nd
+thus gnome-terminal with search_provider enabled can only be built from =
a host
+system that has gnome-shell installed.
+
+Add an option that allows to set the path manually. This will help to cr=
oss-compile
+gnome-terminal on host systems that don't have gnome-shell installed.
+
+Upstream-Status: Pending
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ meson_options.txt | 7 +++++++
+ src/meson.build   | 7 ++++++-
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/meson_options.txt b/meson_options.txt
+index b555ab663..8fece058c 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -13,6 +13,13 @@
+ # You should have received a copy of the GNU General Public License
+ # along with this programme.  If not, see <https://www.gnu.org/licenses=
/>.
+=20
++option(
++  'dbus_interface_dir',
++  type: 'string',
++  value: '',
++  description: 'directory for D-Bus session interface files [$datadir/d=
bus-1/interfaces]',
++)
++
+ option(
+   'dbg',
+   type: 'boolean',
+diff --git a/src/meson.build b/src/meson.build
+index 86e287403..1543572cf 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -224,6 +224,11 @@ server_sources =3D app_sources + client_util_source=
s + debug_sources + dbus_source
+=20
+ if get_option('search_provider')
+=20
++  dbus_interface_dir =3D get_option('dbus_interface_dir')
++  if dbus_interface_dir =3D=3D ''
++    dbus_interface_dir =3D gt_prefix / gt_dbusinterfacedir
++  endif
++
+   server_sources +=3D files(
+     'terminal-search-provider.cc',
+     'terminal-search-provider.hh',
+@@ -231,7 +236,7 @@ if get_option('search_provider')
+=20
+   server_sources +=3D gnome.gdbus_codegen(
+     'terminal-search-provider-gdbus-generated',
+-    gt_prefix / gt_dbusinterfacedir / 'org.gnome.ShellSearchProvider2.x=
ml',
++    dbus_interface_dir / 'org.gnome.ShellSearchProvider2.xml',
+     autocleanup: 'none',
+     install_header: false,
+     interface_prefix: 'org.gnome.Shell',
+--=20
+2.43.0
+
diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.=
1.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
index 8616f2c9b..53f11e95f 100644
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
rface_dir=3D${STAGING_DATADIR}/dbus-1/interfaces,-Dsearch_provider=3Dfals=
e,gnome-shell"
=20
 FILES:${PN} +=3D " \
     ${datadir} \
--=20
2.43.0


