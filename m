Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F37C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 16:46:40 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web09.105.1665679599584050007
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Oct 2022 09:46:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout07.t-online.de (Postfix) with SMTP id 7DA1E1431A
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 18:46:37 +0200 (CEST)
Received: from flk-MS-7C91.. ([79.219.227.72]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oj1Lx-1FHZD70; Thu, 13 Oct 2022 18:46:37 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-networking][PATCH] blueman: upgrade 2.2.4 -> 2.3.2
Date: Thu, 13 Oct 2022 18:46:30 +0200
Message-Id: <20221013164630.6539-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1665679597-E57D007E-F2DD09E3/0/0 CLEAN NORMAL
X-TOI-MSGID: 56426daf-cfac-4eba-bcc5-45b2de1704f3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 16:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99162

Switch from using tarball to git because the 2.3.2 tarball lacks the
meson_options.txt file.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...01-meson-add-pythoninstalldir-option.patch | 19 ++++++++++---------
 .../{blueman_2.2.4.bb =3D> blueman_2.3.2.bb}    |  7 ++++---
 2 files changed, 14 insertions(+), 12 deletions(-)
 rename meta-networking/recipes-connectivity/blueman/{blueman_2.2.4.bb =3D=
> blueman_2.3.2.bb} (86%)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman/0001-me=
son-add-pythoninstalldir-option.patch b/meta-networking/recipes-connectiv=
ity/blueman/blueman/0001-meson-add-pythoninstalldir-option.patch
index a52821915..cc448b4ff 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman/0001-meson-add=
-pythoninstalldir-option.patch
+++ b/meta-networking/recipes-connectivity/blueman/blueman/0001-meson-add=
-pythoninstalldir-option.patch
@@ -16,14 +16,14 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  2 files changed, 7 insertions(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index bc990cd..a37aacd 100644
+index e12d0ce6..e84457a5 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -26,7 +26,12 @@ pkgdatadir =3D join_paths([prefix, get_option('datadi=
r'), package_name])
  bindir =3D join_paths([prefix, get_option('bindir')])
  libexecdir =3D join_paths([prefix, get_option('libexecdir')])
- schemadir =3D join_paths([datadir, 'glib-2.0', 'schemas'])
--pythondir =3D join_paths([prefix, python.sysconfig_path('purelib')])
+ schemadir =3D join_paths(['share', 'glib-2.0', 'schemas'])
+-pythondir =3D pyinstall.get_install_dir()
 +pythoninstalldir =3D get_option('pythoninstalldir')
 +if pythoninstalldir !=3D ''
 +    pythondir =3D join_paths([prefix, pythoninstalldir])
@@ -34,16 +34,17 @@ index bc990cd..a37aacd 100644
  if get_option('policykit')
      have_polkit =3D 'True'
 diff --git a/meson_options.txt b/meson_options.txt
-index b3e939f..96acbbc 100644
+index 177d9ab8..3e397d8e 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -5,5 +5,6 @@ option('pulseaudio', type: 'boolean', value: true, descr=
iption: 'Enable PulseAud
- option('appindicator', type: 'boolean', value: true, description: 'Enab=
le Libappindicator support')
+@@ -2,6 +2,7 @@ option('runtime_deps_check', type: 'boolean', value: tru=
e, description: 'Disable
+ option('dhcp-config-path', type: 'string', value: '/etc/dhcp3/dhcpd.con=
f', description: 'Set dhcp3 server configuration path')
+ option('policykit', type: 'boolean', value: true, description: 'Enable =
policykit support')
+ option('pulseaudio', type: 'boolean', value: true, description: 'Enable=
 PulseAudio support')
++option('pythoninstalldir', type: 'string', description: 'Path to python=
 site-packages dir relative to ${prefix}')
  option('systemdsystemunitdir', type: 'string', description: 'Path to sy=
stemd system unit dir relative to ${prefix}')
  option('systemduserunitdir', type: 'string', description: 'Path to syst=
emd user unit dir relative to ${prefix}')
-+option('pythoninstalldir', type: 'string', description: 'Path to python=
 site-packages dir relative to ${prefix}')
  option('sendto-plugins', type: 'array', choices: ['Caja', 'Nemo', 'Naut=
ilus'], value: ['Caja', 'Nemo', 'Nautilus'], description: 'Install sendto=
 plugins for various filemanagers')
- option('thunar-sendto', type: 'boolean', value: true, description: 'Ins=
tall Thunar sendto plugin')
 --=20
-2.33.0
+2.34.1
=20
diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.2.4.b=
b b/meta-networking/recipes-connectivity/blueman/blueman_2.3.2.bb
similarity index 86%
rename from meta-networking/recipes-connectivity/blueman/blueman_2.2.4.bb
rename to meta-networking/recipes-connectivity/blueman/blueman_2.3.2.bb
index 119752086..eed00fce0 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.2.4.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.3.2.bb
@@ -7,14 +7,15 @@ DEPENDS =3D "gtk+3 glib-2.0 bluez5 python3-pygobject py=
thon3-cython-native"
 inherit meson gettext systemd gsettings pkgconfig python3native gtk-icon=
-cache
=20
 SRC_URI =3D " \
-    https://github.com/blueman-project/blueman/releases/download/${PV}/b=
lueman-${PV}.tar.xz \
+    git://github.com/blueman-project/blueman.git;protocol=3Dhttps;branch=
=3D2-3-stable \
     file://0001-Search-for-cython3.patch \
     file://0002-fix-fail-to-enable-bluetooth.patch \
     file://0001-meson-add-pythoninstalldir-option.patch \
 "
-SRC_URI[sha256sum] =3D "55d639feeda0b43b18a659e65985213a54b47dcb1348f3b4=
effb5238db242602"
+S =3D "${WORKDIR}/git"
+SRCREV =3D "4275c35ffe372c3b194080726fbe1c99f974360f"
=20
-EXTRA_OEMESON =3D "-Druntime_deps_check=3Dfalse -Dappindicator=3Dfalse -=
Dpythoninstalldir=3D${@noprefix('PYTHON_SITEPACKAGES_DIR', d)}"
+EXTRA_OEMESON =3D "-Druntime_deps_check=3Dfalse -Dpythoninstalldir=3D${@=
noprefix('PYTHON_SITEPACKAGES_DIR', d)}"
=20
 SYSTEMD_SERVICE:${PN} =3D "${BPN}-mechanism.service"
 SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
--=20
2.34.1


