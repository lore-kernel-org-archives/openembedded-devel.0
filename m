Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EFCC07F8B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 04:56:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x9P4urfR027884
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 21:56:54 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Thu, 24 Oct 2019 21:56:52 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Oct 2019 12:56:48 +0800
Message-ID: <20191025045648.5657-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] blueman: fix fail to enable bluetooth issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Oct 2019 04:56:53 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When launch blueman-manager while bluetooth is disable, it may fails
with error:

  Failed to enable bluetooth

Because when get bluetooth status right after change its status, the
status may not be updated that plugin applet/KillSwitch.py sets the
bluetooth status via method of another dbus service which doesn't return
immediately.

Provides a new dbus method for PowerManager which checks whether dbus
method SetBluetoothStatus() has finished. Then it makes sure to get
right bluetooth status.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../0002-fix-fail-to-enable-bluetooth.patch   | 81 +++++++++++++++++++
 .../blueman/blueman_2.1.1.bb                  |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/blueman/blueman/0002-fix-fail-to-enable-bluetooth.patch

diff --git a/meta-networking/recipes-connectivity/blueman/blueman/0002-fix-fail-to-enable-bluetooth.patch b/meta-networking/recipes-connectivity/blueman/blueman/0002-fix-fail-to-enable-bluetooth.patch
new file mode 100644
index 000000000..00115cfca
--- /dev/null
+++ b/meta-networking/recipes-connectivity/blueman/blueman/0002-fix-fail-to-enable-bluetooth.patch
@@ -0,0 +1,81 @@
+Fix fail to enable bluetooth issue
+
+When launch blueman-manager while bluetooth is disable, it may fails
+with error:
+
+  Failed to enable bluetooth
+
+Because when get bluetooth status right after change its status, the
+status may not be updated that plugin applet/KillSwitch.py sets the
+bluetooth status via method of another dbus service which doesn't return
+immediately.
+
+Provides a new dbus method for PowerManager which checks whether dbus
+method SetBluetoothStatus() has finished. Then it makes sure to get
+right bluetooth status.
+
+Upstream-Status: Inappropriate
+Send to upstream but not accepted:
+https://github.com/blueman-project/blueman/pull/1121
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ blueman/Functions.py                   | 12 +++++++++++-
+ blueman/plugins/applet/PowerManager.py |  4 ++++
+ 2 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/blueman/Functions.py b/blueman/Functions.py
+index 3b76271..c5eeb27 100644
+--- a/blueman/Functions.py
++++ b/blueman/Functions.py
+@@ -17,7 +17,7 @@
+ # You should have received a copy of the GNU General Public License
+ # along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ #
+-from time import sleep
++from time import sleep, time
+ import re
+ import os
+ import signal
+@@ -86,6 +86,16 @@ def check_bluetooth_status(message, exitfunc):
+             return
+ 
+     applet.SetBluetoothStatus('(b)', True)
++
++    timeout = time() + 10
++    while applet.GetRequestStatus():
++        sleep(0.1)
++        if time() > timeout:
++            # timeout 5s has been set in applet/PowerManager.py
++            # so it should NOT reach timeout here
++            logging.warning('Should NOT reach timeout.')
++            break
++
+     if not applet.GetBluetoothStatus():
+         print('Failed to enable bluetooth')
+         exitfunc()
+diff --git a/blueman/plugins/applet/PowerManager.py b/blueman/plugins/applet/PowerManager.py
+index 8ec9fc4..29a0fb0 100644
+--- a/blueman/plugins/applet/PowerManager.py
++++ b/blueman/plugins/applet/PowerManager.py
+@@ -48,6 +48,7 @@ class PowerManager(AppletPlugin):
+         self._add_dbus_signal("BluetoothStatusChanged", "b")
+         self._add_dbus_method("SetBluetoothStatus", ("b",), "", self.request_power_state)
+         self._add_dbus_method("GetBluetoothStatus", (), "b", self.get_bluetooth_status)
++        self._add_dbus_method("GetRequestStatus", (), "b", self.get_request_status)
+ 
+     def on_unload(self):
+         self.parent.Plugins.Menu.unregister(self)
+@@ -182,6 +183,9 @@ class PowerManager(AppletPlugin):
+     def get_bluetooth_status(self):
+         return self.current_state
+ 
++    def get_request_status(self):
++        return self.request_in_progress
++
+     def on_adapter_property_changed(self, _path, key, value):
+         if key == "Powered":
+             if value and not self.current_state:
+-- 
+2.20.1
+
diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb
index 36de2af1d..96c8bb26c 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb
@@ -9,6 +9,7 @@ inherit autotools systemd gsettings python3native gtk-icon-cache
 SRC_URI = " \
     https://github.com/blueman-project/blueman/releases/download/${PV}/blueman-${PV}.tar.xz \
     file://0001-Search-for-cython3.patch \
+    file://0002-fix-fail-to-enable-bluetooth.patch \
 "
 SRC_URI[md5sum] = "9de89abb31be45bdbf11f7884764a2dc"
 SRC_URI[sha256sum] = "f1eab2334e5a1587defa80900901048d14c2e8ffa8c0cff7240bc9937a61dbc3"
-- 
2.17.1


