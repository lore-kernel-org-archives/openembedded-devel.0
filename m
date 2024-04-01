Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8DBCD128A
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 07:14:50 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.32327.1711955688217681936
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 00:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout11.t-online.de (Postfix) with SMTP id 19B9DA064
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 09:14:46 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.40.13]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rrBsQ-2YJUkT0; Mon, 1 Apr 2024 09:14:42 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][RFC][PATCH] blueman: update 2.3.5 -> 2.4
Date: Mon,  1 Apr 2024 09:15:00 +0200
Message-ID: <20240401071500.15097-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711955682-51FF894C-806CA223/0/0 CLEAN NORMAL
X-TOI-MSGID: e2658aec-fef4-4371-8dd2-9ae4b520ec6d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 07:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109695

- rebase patches
- remove 0001-Search-for-cython3.patch, cython3 is the default now
- dont create polkit rule, meanwhile it is contained in the package
- simplify the injection of python paths by patching the .in files
  at do_configure

This adds a reproducibility issue where I haven't yet been able to
figure out the root cause, so this is marked RFC
WARNING: blueman-2.4-r0 do_package_qa: QA Issue: File /usr/src/debug/blue=
man/2.4/module/_blueman.c in package blueman-src contains reference to TM=
PDIR [buildpaths]
WARNING: blueman-2.4-r0 do_package_qa: QA Issue: File /usr/lib/python3.12=
/site-packages/_blueman.so in package blueman contains reference to TMPDI=
R [buildpaths]

I've tested the rc version for quite some time now and its working
well for me. It increases the short search timeout and includes
matching polkit rule by default. Also it now bluetooth on/off switch,
which is working great.
Note: after disabling bluetooth the icon disappears immediately from e.g.
waybar, but due to the lack of dbus communication it will be needed to
restart waybar, to get it back visible after reactivating bluez again

New features
Audio profile switcher in applet menu (@abhijeetviswa)
Set router address as DNS server instead of loopback addresses
Enable dnsmasq DNS service if possible and add DNS servers otherwise
Reconfigure DHCP service on local nameserver changes
Support for systemd-resolved for getting nameservers for NAP clients
List connected devices in status icon tooltip
Support for nautilus 43 and later
Copy bleutooth address to clipboard in devicelist
Add battery levels to status icon tooltip
Changes
Raise minimum Python version to 3.8
Raise minumum Gtk+ version to 3.24
Hide recent connections associated with unavailable adapters
Store network configuration in GSettings instead of /var/lib/blueman/netw=
ork.state.
Replace custom MessageArea widget with regular Gtk.InfoBar
Drop auto-power feature. BlueZ now has the AutoEnable setting for even be=
tter auto-powering.
Do not use pointless link quality value
Recent connections in toplevel applet menu
Never hide keyboard and combos, see #1954 for more info
Do not close blueman-manager from applet
Add Switch to blueman-manager to set bluetooth on/off
Remove broken check for bluetooth status
PluginDialog: Replace custom list with Gtk.ListBox
Ignore double-click for connect when unpowered
Drop homgeneous from statusbar
PulseAudioUtils: Use python enums in several places
Use operator convenience functions
Cleanup PluginDialog UI
Show HCI device in blueman-adapers tabs
Show different icon for the active audio profile @localevil
Make blueman-services a notebook
Use the TypedDict as constructor
Bugs fixed
Fix device-selected handlers
Fix deprecations in tests
Fix showing -1 seconds when discovering @kuraga
Tray: Let dbus call end and reply to caller
Get the image-missing icon if lookup failed to avoid crash

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../blueman/0001-Search-for-cython3.patch     | 24 -----
 ...01-meson-add-pythoninstalldir-option.patch | 29 +++---
 .../0002-fix-fail-to-enable-bluetooth.patch   | 20 ++---
 .../blueman/blueman_2.3.5.bb                  | 88 -------------------
 .../blueman/blueman_2.4.bb                    | 57 ++++++++++++
 5 files changed, 85 insertions(+), 133 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/blueman/blueman/=
0001-Search-for-cython3.patch
 delete mode 100644 meta-networking/recipes-connectivity/blueman/blueman_=
2.3.5.bb
 create mode 100644 meta-networking/recipes-connectivity/blueman/blueman_=
2.4.bb

diff --git a/meta-networking/recipes-connectivity/blueman/blueman/0001-Se=
arch-for-cython3.patch b/meta-networking/recipes-connectivity/blueman/blu=
eman/0001-Search-for-cython3.patch
deleted file mode 100644
index 913566dce..000000000
--- a/meta-networking/recipes-connectivity/blueman/blueman/0001-Search-fo=
r-cython3.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Subject: [PATCH] Search for cython3
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Markus Volk <f_l_k@gmx.net>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/module/meson.build        2022-02-10 08:49:35.000000000 +0100
-+++ b/module/meson.build        2022-03-29 12:58:03.456193737 +0200
-@@ -1,4 +1,4 @@
--cython =3D find_program('cython', required: true)
-+cython =3D find_program('cython3', required: true)
-=20
- blueman_c =3D custom_target(
-     'blueman_c',
-
---=20
-2.14.3
-
diff --git a/meta-networking/recipes-connectivity/blueman/blueman/0001-me=
son-add-pythoninstalldir-option.patch b/meta-networking/recipes-connectiv=
ity/blueman/blueman/0001-meson-add-pythoninstalldir-option.patch
index cc448b4ff..3e9543410 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman/0001-meson-add=
-pythoninstalldir-option.patch
+++ b/meta-networking/recipes-connectivity/blueman/blueman/0001-meson-add=
-pythoninstalldir-option.patch
@@ -1,4 +1,4 @@
-From 37f24a9bd62f0a8f3e37eaddd33f2f0c9d3aaa0a Mon Sep 17 00:00:00 2001
+From 3d0cc8aae6de1b0a3b3dc87cdadc80199980783c Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Fri, 1 Apr 2022 23:12:17 -0700
 Subject: [PATCH] meson: add pythoninstalldir option
@@ -16,13 +16,13 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  2 files changed, 7 insertions(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index e12d0ce6..e84457a5 100644
+index 2a4303ce..5154b2ad 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -26,7 +26,12 @@ pkgdatadir =3D join_paths([prefix, get_option('datadi=
r'), package_name])
- bindir =3D join_paths([prefix, get_option('bindir')])
- libexecdir =3D join_paths([prefix, get_option('libexecdir')])
- schemadir =3D join_paths(['share', 'glib-2.0', 'schemas'])
+@@ -29,7 +29,12 @@ dbusdir =3D join_paths([datadir, 'dbus-1'])
+ libexecdir =3D get_option('libexecdir')
+ schemadir =3D join_paths([datadir, 'glib-2.0', 'schemas'])
+ polkitdir =3D join_paths([datadir, 'polkit-1'])
 -pythondir =3D pyinstall.get_install_dir()
 +pythoninstalldir =3D get_option('pythoninstalldir')
 +if pythoninstalldir !=3D ''
@@ -30,11 +30,20 @@ index e12d0ce6..e84457a5 100644
 +else
 +    pythondir =3D join_paths([prefix, python.sysconfig_path('purelib')]=
)
 +endif
+ systemd_base_path =3D join_paths(libdir, 'systemd')
 =20
  if get_option('policykit')
-     have_polkit =3D 'True'
+@@ -51,7 +56,7 @@ conf_data.set('icondir', join_paths(prefix, datadir, '=
icons'))
+ conf_data.set('dhconfig', get_option('dhcp-config-path'))
+ conf_data.set('POLKIT', have_polkit)
+ conf_data.set('GETTEXT_PACKAGE', package_name)
+-conf_data.set('PYTHON', pyinstall.full_path())
++conf_data.set('PYTHON', pyinstall.path())
+=20
+ # Check for build dependencies
+ pythonlib =3D pyinstall.dependency()
 diff --git a/meson_options.txt b/meson_options.txt
-index 177d9ab8..3e397d8e 100644
+index 177d9ab8..87d73872 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -2,6 +2,7 @@ option('runtime_deps_check', type: 'boolean', value: tru=
e, description: 'Disable
@@ -45,6 +54,4 @@ index 177d9ab8..3e397d8e 100644
  option('systemdsystemunitdir', type: 'string', description: 'Path to sy=
stemd system unit dir relative to ${prefix}')
  option('systemduserunitdir', type: 'string', description: 'Path to syst=
emd user unit dir relative to ${prefix}')
  option('sendto-plugins', type: 'array', choices: ['Caja', 'Nemo', 'Naut=
ilus'], value: ['Caja', 'Nemo', 'Nautilus'], description: 'Install sendto=
 plugins for various filemanagers')
---=20
-2.34.1
-
+=20
diff --git a/meta-networking/recipes-connectivity/blueman/blueman/0002-fi=
x-fail-to-enable-bluetooth.patch b/meta-networking/recipes-connectivity/b=
lueman/blueman/0002-fix-fail-to-enable-bluetooth.patch
index 282d82137..8a18600dd 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman/0002-fix-fail-=
to-enable-bluetooth.patch
+++ b/meta-networking/recipes-connectivity/blueman/blueman/0002-fix-fail-=
to-enable-bluetooth.patch
@@ -1,4 +1,7 @@
-Fix fail to enable bluetooth issue
+From 37c5f0e9741e8a07114ab6120a74affadf0a453e Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Fri, 25 Oct 2019 12:56:48 +0800
+Subject: [PATCH] Fix fail to enable bluetooth issue
=20
 When launch blueman-manager while bluetooth is disable, it may fails
 with error:
@@ -25,10 +28,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  2 files changed, 14 insertions(+)
=20
 diff --git a/blueman/Functions.py b/blueman/Functions.py
-index 3917f42..b4d5eae 100644
+index 018ffaed..f4fdca41 100644
 --- a/blueman/Functions.py
 +++ b/blueman/Functions.py
-@@ -80,6 +80,16 @@ def check_bluetooth_status(message: str, exitfunc: Ca=
llable[[], Any]) -> None:
+@@ -79,6 +79,16 @@ def check_bluetooth_status(message: str, exitfunc: Ca=
llable[[], Any]) -> None:
              return
 =20
      applet.SetBluetoothStatus('(b)', True)
@@ -46,18 +49,18 @@ index 3917f42..b4d5eae 100644
          print('Failed to enable bluetooth')
          exitfunc()
 diff --git a/blueman/plugins/applet/PowerManager.py b/blueman/plugins/ap=
plet/PowerManager.py
-index c2f7bc3..bf6c99f 100644
+index 8c3991e4..57c1aa57 100644
 --- a/blueman/plugins/applet/PowerManager.py
 +++ b/blueman/plugins/applet/PowerManager.py
-@@ -63,6 +63,7 @@ class PowerManager(AppletPlugin, StatusIconProvider):
-         self._add_dbus_signal("BluetoothStatusChanged", "b")
+@@ -49,6 +49,7 @@ class PowerManager(AppletPlugin, StatusIconProvider):
+=20
          self._add_dbus_method("SetBluetoothStatus", ("b",), "", self.re=
quest_power_state)
          self._add_dbus_method("GetBluetoothStatus", (), "b", self.get_b=
luetooth_status)
 +        self._add_dbus_method("GetRequestStatus", (), "b", self.get_req=
uest_status)
 =20
      def on_unload(self) -> None:
          self.parent.Plugins.Menu.unregister(self)
-@@ -196,6 +197,9 @@ class PowerManager(AppletPlugin, StatusIconProvider)=
:
+@@ -178,6 +179,9 @@ class PowerManager(AppletPlugin, StatusIconProvider)=
:
      def get_bluetooth_status(self) -> bool:
          return self.current_state
 =20
@@ -67,6 +70,3 @@ index c2f7bc3..bf6c99f 100644
      def on_adapter_property_changed(self, _path: str, key: str, value: =
Any) -> None:
          if key =3D=3D "Powered":
              if value and not self.current_state:
---=20
-2.31.1
-
diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.b=
b b/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
deleted file mode 100644
index 0374d23f0..000000000
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
+++ /dev/null
@@ -1,88 +0,0 @@
-DESCRIPTION =3D "Blueman is a GTK+ Bluetooth Manager"
-LICENSE =3D "GPL-3.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
-
-DEPENDS =3D "gtk+3 glib-2.0 bluez5 python3-pygobject python3-cython-nati=
ve"
-
-inherit meson gettext systemd gsettings pkgconfig python3native gtk-icon=
-cache useradd features_check
-
-REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
-
-SRC_URI =3D " \
-    git://github.com/blueman-project/blueman.git;protocol=3Dhttps;branch=
=3D2-3-stable \
-    file://0001-Search-for-cython3.patch \
-    file://0002-fix-fail-to-enable-bluetooth.patch \
-    file://0001-meson-add-pythoninstalldir-option.patch \
-"
-S =3D "${WORKDIR}/git"
-SRCREV =3D "c85e7afb8d6547d4c35b7b639124de8e999c3650"
-
-EXTRA_OEMESON =3D "-Druntime_deps_check=3Dfalse -Dpythoninstalldir=3D${@=
noprefix('PYTHON_SITEPACKAGES_DIR', d)}"
-
-SYSTEMD_SERVICE:${PN} =3D "${BPN}-mechanism.service"
-SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
-
-RRECOMMENDS:${PN} +=3D "adwaita-icon-theme"
-RDEPENDS:${PN} +=3D " \
-    python3-core \
-    python3-ctypes \
-    python3-dbus \
-    python3-pygobject \
-    python3-terminal \
-    python3-fcntl \
-    packagegroup-tools-bluetooth \
-"
-
-PACKAGECONFIG ??=3D " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'polkit pulseaudio ', d)} \
-    thunar \
-"
-PACKAGECONFIG[thunar] =3D "-Dthunar-sendto=3Dtrue,-Dthunar-sendto=3Dfals=
e"
-PACKAGECONFIG[pulseaudio] =3D "-Dpulseaudio=3Dtrue,-Dpulseaudio=3Dfalse"
-PACKAGECONFIG[polkit] =3D "-Dpolicykit=3Dtrue,-Dpolicykit=3Dfalse"
-
-FILES:${PN} +=3D " \
-    ${datadir} \
-    ${systemd_user_unitdir} \
-    ${PYTHON_SITEPACKAGES_DIR} \
-"
-
-# In code, path to python is a variable that is replaced with path to na=
tive version of it
-# during the configure stage, e.g ../recipe-sysroot-native/usr/bin/pytho=
n3-native/python3.
-# Replace it with #!/usr/bin/env python3
-do_install:append() {
-    sed -i "1s/.*/#!\/usr\/bin\/env python3/" ${D}${prefix}/libexec/blue=
man-rfcomm-watcher \
-                                              ${D}${prefix}/libexec/blue=
man-mechanism \
-                                              ${D}${bindir}/blueman-adap=
ters \
-                                              ${D}${bindir}/blueman-appl=
et \
-                                              ${D}${bindir}/blueman-mana=
ger \
-                                              ${D}${bindir}/blueman-send=
to \
-                                              ${D}${bindir}/blueman-serv=
ices \
-                                              ${D}${bindir}/blueman-tray
-}
-
-do_install:append() {
-    install -d ${D}${datadir}/polkit-1/rules.d
-    cat >${D}${datadir}/polkit-1/rules.d/51-blueman.rules <<EOF
-/* Allow users in wheel group to use blueman feature requiring root with=
out authentication */
-polkit.addRule(function(action, subject) {
-    if ((action.id =3D=3D "org.blueman.network.setup" ||
-         action.id =3D=3D "org.blueman.dhcp.client" ||
-         action.id =3D=3D "org.blueman.rfkill.setstate" ||
-         action.id =3D=3D "org.blueman.pppd.pppconnect") &&
-        subject.isInGroup("wheel")) {
-
-        return polkit.Result.YES;
-    }
-});
-EOF
-}
-
-USERADD_PACKAGES =3D "${PN}"
-USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/polkit-1 --shell /bin/nologin polkitd"
-
-do_install:append() {
-        # Fix up permissions on polkit rules.d to work with rpm4 constra=
ints
-        chmod 700 ${D}/${datadir}/polkit-1/rules.d
-        chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
-}
diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.4.bb =
b/meta-networking/recipes-connectivity/blueman/blueman_2.4.bb
new file mode 100644
index 000000000..71fa0317d
--- /dev/null
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.4.bb
@@ -0,0 +1,57 @@
+DESCRIPTION =3D "Blueman is a GTK+ Bluetooth Manager"
+LICENSE =3D "GPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
+
+DEPENDS =3D "gtk+3 glib-2.0 bluez5 python3-pygobject python3-cython-nati=
ve"
+
+inherit meson gettext systemd gsettings pkgconfig python3native gtk-icon=
-cache features_check
+
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
+
+SRC_URI =3D " \
+    git://github.com/blueman-project/blueman.git;protocol=3Dhttps;branch=
=3D2-4-stable \
+    file://0002-fix-fail-to-enable-bluetooth.patch \
+    file://0001-meson-add-pythoninstalldir-option.patch \
+"
+S =3D "${WORKDIR}/git"
+SRCREV =3D "71948d45d5b23d58f4be03543570d256faa45cc4"
+
+EXTRA_OEMESON =3D "-Druntime_deps_check=3Dfalse -Dpythoninstalldir=3D${@=
noprefix('PYTHON_SITEPACKAGES_DIR', d)}"
+
+SYSTEMD_SERVICE:${PN} =3D "${BPN}-mechanism.service"
+SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
+
+RRECOMMENDS:${PN} +=3D "adwaita-icon-theme"
+RDEPENDS:${PN} +=3D " \
+    python3-core \
+    python3-ctypes \
+    python3-dbus \
+    python3-pygobject \
+    python3-terminal \
+    python3-fcntl \
+    packagegroup-tools-bluetooth \
+"
+
+do_configure:prepend() {
+	for file in ${S}/apps/*.in; do
+		sed -i "s|@PYTHON@|\/usr\/bin\/env python3|" "$file"
+	done
+}
+
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'polkit pulse=
audio ', d)}"
+
+PACKAGECONFIG[thunar] =3D "-Dthunar-sendto=3Dtrue,-Dthunar-sendto=3Dfals=
e"
+PACKAGECONFIG[pulseaudio] =3D "-Dpulseaudio=3Dtrue,-Dpulseaudio=3Dfalse"
+PACKAGECONFIG[polkit] =3D "-Dpolicykit=3Dtrue,-Dpolicykit=3Dfalse"
+
+do_install:append() {
+        # Fix up permissions on polkit rules.d to work with rpm4 constra=
ints
+        chmod 700 ${D}/${datadir}/polkit-1/rules.d
+        chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
+}
+
+FILES:${PN} +=3D " \
+    ${datadir} \
+    ${systemd_user_unitdir} \
+    ${PYTHON_SITEPACKAGES_DIR} \
+"
--=20
2.44.0


