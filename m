Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8429AC49EA1
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 21:50:14 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.19077.1722981011827427997
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 14:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout04.t-online.de (Postfix) with SMTP id 45994148B5
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 23:50:07 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.121]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sbS4D-1B2xVJ0; Tue, 6 Aug 2024 23:50:05 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] blueman: update 2.3.5 -> 2.4.3
Date: Tue,  6 Aug 2024 23:51:26 +0200
Message-ID: <20240806215126.3938-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1722981005-067FBEE0-B8E57207/0/0 CLEAN NORMAL
X-TOI-MSGID: 01b36931-078e-4127-9ee4-ee6996ebae96
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 21:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111599

Remove 0001-meson-add-pythoninstalldir-option.patch. It was fixed by:
[https://github.com/blueman-project/blueman/pull/1700]

Remove 0001-Search-for-cython3.patch. It was fixed by:
[https://github.com/blueman-project/blueman/blob/2682501e313831ed20ea3a80=
9036e84bdb449fc7/module/meson.build#L1]

Remove 0001-meson-add-pythoninstalldir-option.patch. Not quite sure about=
 this one,
but even without this patch there are no issues to enable bluetooth on my=
 side

Dont add polkit rule. It is now added by default.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../blueman/0001-Search-for-cython3.patch     | 24 -------
 ...01-meson-add-pythoninstalldir-option.patch | 50 -------------
 .../0002-fix-fail-to-enable-bluetooth.patch   | 72 -------------------
 .../{blueman_2.3.5.bb =3D> blueman_2.4.3.bb}    | 28 +-------
 4 files changed, 3 insertions(+), 171 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/blueman/blueman/=
0001-Search-for-cython3.patch
 delete mode 100644 meta-networking/recipes-connectivity/blueman/blueman/=
0001-meson-add-pythoninstalldir-option.patch
 delete mode 100644 meta-networking/recipes-connectivity/blueman/blueman/=
0002-fix-fail-to-enable-bluetooth.patch
 rename meta-networking/recipes-connectivity/blueman/{blueman_2.3.5.bb =3D=
> blueman_2.4.3.bb} (71%)

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
deleted file mode 100644
index cc448b4ff..000000000
--- a/meta-networking/recipes-connectivity/blueman/blueman/0001-meson-add=
-pythoninstalldir-option.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 37f24a9bd62f0a8f3e37eaddd33f2f0c9d3aaa0a Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Fri, 1 Apr 2022 23:12:17 -0700
-Subject: [PATCH] meson: add pythoninstalldir option
-
-In case of cross build, using host python to determine the python
-site-packages directory for target is not feasible, add a new option
-pythoninstalldir to fix the issue.
-
-Upstream-Status: Submitted [https://github.com/blueman-project/blueman/p=
ull/1699]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- meson.build       | 7 ++++++-
- meson_options.txt | 1 +
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index e12d0ce6..e84457a5 100644
---- a/meson.build
-+++ b/meson.build
-@@ -26,7 +26,12 @@ pkgdatadir =3D join_paths([prefix, get_option('datadi=
r'), package_name])
- bindir =3D join_paths([prefix, get_option('bindir')])
- libexecdir =3D join_paths([prefix, get_option('libexecdir')])
- schemadir =3D join_paths(['share', 'glib-2.0', 'schemas'])
--pythondir =3D pyinstall.get_install_dir()
-+pythoninstalldir =3D get_option('pythoninstalldir')
-+if pythoninstalldir !=3D ''
-+    pythondir =3D join_paths([prefix, pythoninstalldir])
-+else
-+    pythondir =3D join_paths([prefix, python.sysconfig_path('purelib')]=
)
-+endif
-=20
- if get_option('policykit')
-     have_polkit =3D 'True'
-diff --git a/meson_options.txt b/meson_options.txt
-index 177d9ab8..3e397d8e 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -2,6 +2,7 @@ option('runtime_deps_check', type: 'boolean', value: tru=
e, description: 'Disable
- option('dhcp-config-path', type: 'string', value: '/etc/dhcp3/dhcpd.con=
f', description: 'Set dhcp3 server configuration path')
- option('policykit', type: 'boolean', value: true, description: 'Enable =
policykit support')
- option('pulseaudio', type: 'boolean', value: true, description: 'Enable=
 PulseAudio support')
-+option('pythoninstalldir', type: 'string', description: 'Path to python=
 site-packages dir relative to ${prefix}')
- option('systemdsystemunitdir', type: 'string', description: 'Path to sy=
stemd system unit dir relative to ${prefix}')
- option('systemduserunitdir', type: 'string', description: 'Path to syst=
emd user unit dir relative to ${prefix}')
- option('sendto-plugins', type: 'array', choices: ['Caja', 'Nemo', 'Naut=
ilus'], value: ['Caja', 'Nemo', 'Nautilus'], description: 'Install sendto=
 plugins for various filemanagers')
---=20
-2.34.1
-
diff --git a/meta-networking/recipes-connectivity/blueman/blueman/0002-fi=
x-fail-to-enable-bluetooth.patch b/meta-networking/recipes-connectivity/b=
lueman/blueman/0002-fix-fail-to-enable-bluetooth.patch
deleted file mode 100644
index 282d82137..000000000
--- a/meta-networking/recipes-connectivity/blueman/blueman/0002-fix-fail-=
to-enable-bluetooth.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-Fix fail to enable bluetooth issue
-
-When launch blueman-manager while bluetooth is disable, it may fails
-with error:
-
-  Failed to enable bluetooth
-
-Because when get bluetooth status right after change its status, the
-status may not be updated that plugin applet/KillSwitch.py sets the
-bluetooth status via method of another dbus service which doesn't return
-immediately.
-
-Provides a new dbus method for PowerManager which checks whether dbus
-method SetBluetoothStatus() has finished. Then it makes sure to get
-right bluetooth status.
-
-Upstream-Status: Inappropriate
-Send to upstream but not accepted:
-https://github.com/blueman-project/blueman/pull/1121
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- blueman/Functions.py                   | 10 ++++++++++
- blueman/plugins/applet/PowerManager.py |  4 ++++
- 2 files changed, 14 insertions(+)
-
-diff --git a/blueman/Functions.py b/blueman/Functions.py
-index 3917f42..b4d5eae 100644
---- a/blueman/Functions.py
-+++ b/blueman/Functions.py
-@@ -80,6 +80,16 @@ def check_bluetooth_status(message: str, exitfunc: Ca=
llable[[], Any]) -> None:
-             return
-=20
-     applet.SetBluetoothStatus('(b)', True)
-+
-+    timeout =3D time.time() + 10
-+    while applet.GetRequestStatus():
-+        time.sleep(0.1)
-+        if time.time() > timeout:
-+            # timeout 5s has been set in applet/PowerManager.py
-+            # so it should NOT reach timeout here
-+            logging.warning('Should NOT reach timeout.')
-+            break
-+
-     if not applet.GetBluetoothStatus():
-         print('Failed to enable bluetooth')
-         exitfunc()
-diff --git a/blueman/plugins/applet/PowerManager.py b/blueman/plugins/ap=
plet/PowerManager.py
-index c2f7bc3..bf6c99f 100644
---- a/blueman/plugins/applet/PowerManager.py
-+++ b/blueman/plugins/applet/PowerManager.py
-@@ -63,6 +63,7 @@ class PowerManager(AppletPlugin, StatusIconProvider):
-         self._add_dbus_signal("BluetoothStatusChanged", "b")
-         self._add_dbus_method("SetBluetoothStatus", ("b",), "", self.re=
quest_power_state)
-         self._add_dbus_method("GetBluetoothStatus", (), "b", self.get_b=
luetooth_status)
-+        self._add_dbus_method("GetRequestStatus", (), "b", self.get_req=
uest_status)
-=20
-     def on_unload(self) -> None:
-         self.parent.Plugins.Menu.unregister(self)
-@@ -196,6 +197,9 @@ class PowerManager(AppletPlugin, StatusIconProvider)=
:
-     def get_bluetooth_status(self) -> bool:
-         return self.current_state
-=20
-+    def get_request_status(self):
-+        return self.request_in_progress
-+
-     def on_adapter_property_changed(self, _path: str, key: str, value: =
Any) -> None:
-         if key =3D=3D "Powered":
-             if value and not self.current_state:
---=20
-2.31.1
-
diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.b=
b b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
similarity index 71%
rename from meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
rename to meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
index afb97ee28..f5c3518ea 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
@@ -8,16 +8,11 @@ inherit meson gettext systemd gsettings pkgconfig pytho=
n3native gtk-icon-cache u
=20
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
=20
-SRC_URI =3D " \
-    git://github.com/blueman-project/blueman.git;protocol=3Dhttps;branch=
=3D2-3-stable \
-    file://0001-Search-for-cython3.patch \
-    file://0002-fix-fail-to-enable-bluetooth.patch \
-    file://0001-meson-add-pythoninstalldir-option.patch \
-"
+SRC_URI =3D "git://github.com/blueman-project/blueman.git;protocol=3Dhtt=
ps;branch=3D2-4-stable"
 S =3D "${WORKDIR}/git"
-SRCREV =3D "c85e7afb8d6547d4c35b7b639124de8e999c3650"
+SRCREV =3D "7bcf919ad6ac0ee9a8c66b18b0ca98af877d4c8f"
=20
-EXTRA_OEMESON =3D "-Druntime_deps_check=3Dfalse -Dpythoninstalldir=3D${@=
noprefix('PYTHON_SITEPACKAGES_DIR', d)}"
+EXTRA_OEMESON =3D "-Druntime_deps_check=3Dfalse"
=20
 SYSTEMD_SERVICE:${PN} =3D "${BPN}-mechanism.service"
 SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
@@ -61,23 +56,6 @@ do_install:append() {
                                               ${D}${bindir}/blueman-tray
 }
=20
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
 USERADD_PACKAGES =3D "${PN}"
 USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/polkit-1 --shell /bin/nologin polkitd"
=20
--=20
2.45.2


