Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1MRX5P-0002MI-Jo
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Jul 2009 21:57:48 +0200
Received: from localhost.localdomain (foilist3.az.mvista.com [10.50.1.75])
	by hermes.mvista.com (Postfix) with ESMTP
	id 572C01B02F; Thu, 16 Jul 2009 12:44:12 -0700 (PDT)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jul 2009 12:44:12 -0700
Message-Id: <1247773452-11999-1-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.0
Subject: [PATCH] Let the distro control whether we include hostap or madwifi.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jul 2009 19:57:48 -0000

- Add base_ifelse convenience function to base.bbclass.
- Replace all conditionals in the recipes relating to hostap and madwifi to
  look for their name in COMBINED_FEATURES rather than looking for specific buses (pci, pcmcia).
- Change the default COMBINED_FEATURES to enable:
  - madwifi, when:
    - 'pci', 'wifi', and 'madwifi' are in distro features
    - 'pci' is in machine features
  - hostap, when:
    - 'wifi' and 'hostap' are in distro features
    - either 'pci' or 'pcmcia' are in both distro and machine features

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 classes/base.bbclass                            |    6 ++++++
 conf/bitbake.conf                               |   19 +++++++++++++++++++
 recipes/hostap/hostap-daemon_0.5.10.bb          |   10 +++++-----
 recipes/tasks/task-base.bb                      |    7 +++----
 recipes/tasks/task-mokogateway.bb               |    4 ++--
 recipes/wpa-supplicant/wpa-supplicant-0.6.inc   |    8 ++++----
 recipes/wpa-supplicant/wpa-supplicant_0.5.10.bb |   10 +++++-----
 7 files changed, 44 insertions(+), 20 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index bc50c67..3aa1146 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -159,6 +159,12 @@ def base_read_file(filename):
 		return f.read().strip()
 	return None
 
+def base_ifelse(condition, iftrue = True, iffalse = False):
+    if condition:
+        return iftrue
+    else:
+        return iffalse
+
 def base_conditional(variable, checkvalue, truevalue, falsevalue, d):
 	import bb
 	if bb.data.getVar(variable,d,1) == checkvalue:
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 8b69564..a3c475f 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -715,3 +715,22 @@ COMBINED_FEATURES = "\
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "usbgadget", d)} \
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "usbhost", d)} \
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "wifi", d)}"
+
+# We want madwifi if all of the following are true:
+# - 'pci', 'wifi', and 'madwifi' are in distro features
+# - 'pci' is in machine features
+COMBINED_FEATURES += "${@base_ifelse( \
+    base_contains('DISTRO_FEATURES', ('pci', 'wifi', 'madwifi'), True, False, d) and \
+    base_contains('MACHINE_FEATURES', 'pci', True, False, d), \
+    'madwifi', '')}"
+
+# We want hostap if all of the following are true:
+# - 'wifi' and 'hostap' are in distro features
+# - either 'pci' or 'pcmcia' are in both distro and machine features
+COMBINED_FEATURES += "${@base_ifelse( \
+    base_contains('DISTRO_FEATURES', ('wifi', 'hostap'), True, False, d) and \
+    ((base_contains('MACHINE_FEATURES', 'pci', True, False, d) and \
+      base_contains('DISTRO_FEATURES', 'pci', True, False, d)) or \
+     (base_contains('MACHINE_FEATURES', 'pcmcia', True, False, d) and \
+      base_contains('DISTRO_FEATURES', 'pcmcia', True, False, d))), \
+    'hostap', '')}"
diff --git a/recipes/hostap/hostap-daemon_0.5.10.bb b/recipes/hostap/hostap-daemon_0.5.10.bb
index ea49301..3706b08 100644
--- a/recipes/hostap/hostap-daemon_0.5.10.bb
+++ b/recipes/hostap/hostap-daemon_0.5.10.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://hostap.epitest.fi"
 SECTION = "kernel/userland"
 PRIORITY = "optional"
 LICENSE = "GPL"
-DEPENDS = "openssl ${@base_contains("COMBINED_FEATURES", "pci", "madwifi-ng", "",d)}"
-PR = "r1"
+DEPENDS = "openssl ${@base_contains("COMBINED_FEATURES", "madwifi", "madwifi-ng", "",d)}"
+PR = "r1.1"
 DEPENDS_append_mtx-1 = " madwifi-modules"
 DEPENDS_append_mtx-2 = " madwifi-modules"
 CPPFLAGS_append_mtx-1 = " -I${STAGING_INCDIR}/madwifi/"
@@ -12,7 +12,7 @@ CPPFLAGS_append_mtx-2 = " -I${STAGING_INCDIR}/madwifi/"
 
 #we introduce MY_ARCH to get 'armv5te' as arch instead of the misleading 'arm' on armv5te builds
 MY_ARCH := "${PACKAGE_ARCH}"
-PACKAGE_ARCH = "${@base_contains('COMBINED_FEATURES', 'pci', '${MACHINE_ARCH}', '${MY_ARCH}', d)}"
+PACKAGE_ARCH = "${@base_contains('COMBINED_FEATURES', 'madwifi', '${MACHINE_ARCH}', '${MY_ARCH}', d)}"
 
 SRC_URI = "http://hostap.epitest.fi/releases/hostapd-${PV}.tar.gz \
 	file://makefile-cross.diff;patch=1 \
@@ -21,14 +21,14 @@ SRC_URI = "http://hostap.epitest.fi/releases/hostapd-${PV}.tar.gz \
 
 S = "${WORKDIR}/hostapd-${PV}"
 
-export HAS_PCI = "${@base_contains('COMBINED_FEATURES', 'pci', 1, 0,d)}"
+export HAS_MADWIFI = "${@base_contains('COMBINED_FEATURES', 'madwifi', 1, 0,d)}"
 
 inherit update-rc.d
 INITSCRIPT_NAME=hostapd
 
 do_configure() {
 	install -m 0644 ${WORKDIR}/defconfig ${S}/.config
-	if [ "x$HAS_PCI" = "x1" ] ; then
+	if [ "x$HAS_MADWIFI" = "x1" ] ; then
 		echo "CONFIG_DRIVER_MADWIFI=y" >> .config
 		echo "CFLAGS += -I${STAGING_INCDIR}/madwifi-ng" >> .config
 	fi
diff --git a/recipes/tasks/task-base.bb b/recipes/tasks/task-base.bb
index 66c26af..7316d8f 100644
--- a/recipes/tasks/task-base.bb
+++ b/recipes/tasks/task-base.bb
@@ -340,13 +340,12 @@ RRECOMMENDS_task-base-ipsec = "\
 #
 RDEPENDS_task-base-wifi = "\
     wireless-tools \
-    ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'hostap-utils', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'pci', 'hostap-utils', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'pci', 'madwifi-ng-tools', '',d)} \
+    ${@base_contains('COMBINED_FEATURES', 'hostap', 'hostap-utils', '',d)} \
+    ${@base_contains('COMBINED_FEATURES', 'madwifi', 'madwifi-ng-tools', '',d)} \
     wpa-supplicant"
 
 RRECOMMENDS_task-base-wifi = "\
-    ${@base_contains('COMBINED_FEATURES', 'pci', 'madwifi-ng-modules', '',d)} \
+    ${@base_contains('COMBINED_FEATURES', 'madwifi', 'madwifi-ng-modules', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-zd1211rw', '',d)} \
     kernel-module-ieee80211-crypt \
     kernel-module-ieee80211-crypt-ccmp \
diff --git a/recipes/tasks/task-mokogateway.bb b/recipes/tasks/task-mokogateway.bb
index b0214dc..a1e0bc2 100644
--- a/recipes/tasks/task-mokogateway.bb
+++ b/recipes/tasks/task-mokogateway.bb
@@ -55,8 +55,8 @@ DESCRIPTION_task-mokogateway-wifi = "MokoGateway: WiFi"
 RDEPENDS_task-mokogateway-wifi = "\
 	bridge-utils \
 	wireless-tools \
-	${@base_contains("COMBINED_FEATURES", "pci", "madwifi-ng-modules", "",d)} \
-	${@base_contains("COMBINED_FEATURES", "pci", "madwifi-ng-tools", "",d)} \
+	${@base_contains("COMBINED_FEATURES", "madwifi", "madwifi-ng-modules", "",d)} \
+	${@base_contains("COMBINED_FEATURES", "madwifi", "madwifi-ng-tools", "",d)} \
 	wpa-supplicant \
 "
 RRECOMMENDS_task-mokogateway-wifi = "\
diff --git a/recipes/wpa-supplicant/wpa-supplicant-0.6.inc b/recipes/wpa-supplicant/wpa-supplicant-0.6.inc
index aee9ced..a31207f 100644
--- a/recipes/wpa-supplicant/wpa-supplicant-0.6.inc
+++ b/recipes/wpa-supplicant/wpa-supplicant-0.6.inc
@@ -2,11 +2,11 @@ DESCRIPTION = "A Client for Wi-Fi Protected Access (WPA)."
 SECTION = "network"
 LICENSE = "GPL"
 HOMEPAGE = "http://hostap.epitest.fi/wpa_supplicant/"
-DEPENDS = "dbus gnutls ${@base_contains("COMBINED_FEATURES", "pci", "madwifi-ng", "",d)}"
+DEPENDS = "dbug gnutls ${@base_contains("COMBINED_FEATURES", "madwifi", "madwifi-ng", "",d)}"
 
 #we introduce MY_ARCH to get 'armv5te' as arch instead of the misleading 'arm' on armv5te builds
 MY_ARCH := "${PACKAGE_ARCH}"
-PACKAGE_ARCH = "${@base_contains('COMBINED_FEATURES', 'pci', '${MACHINE_ARCH}', '${MY_ARCH}', d)}"
+PACKAGE_ARCH = "${@base_contains('COMBINED_FEATURES', 'madwifi', '${MACHINE_ARCH}', '${MY_ARCH}', d)}"
 
 DEFAULT_PREFERENCE = "-2"
 
@@ -26,12 +26,12 @@ RREPLACES = "wpa-supplicant-cli"
 
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase"
 
-export HAS_PCI = "${@base_contains('COMBINED_FEATURES', 'pci', 1, 0,d)}"
+export HAS_MADWIFI = "${@base_contains('COMBINED_FEATURES', 'madwifi', 1, 0,d)}"
 
 do_configure () {
         install -m 0755 ${WORKDIR}/defconfig-0.6.0-gnutls  .config
 
-        if [ "x$HAS_PCI" == "x1" ] ; then
+        if [ "x$HAS_MADWIFI" == "x1" ] ; then
                 echo "CONFIG_DRIVER_MADWIFI=y" >> .config
                 echo "CFLAGS += -I${STAGING_INCDIR}/madwifi-ng" >> .config
         fi
diff --git a/recipes/wpa-supplicant/wpa-supplicant_0.5.10.bb b/recipes/wpa-supplicant/wpa-supplicant_0.5.10.bb
index 14186db..6ba2e99 100644
--- a/recipes/wpa-supplicant/wpa-supplicant_0.5.10.bb
+++ b/recipes/wpa-supplicant/wpa-supplicant_0.5.10.bb
@@ -2,13 +2,13 @@ DESCRIPTION = "A Client for Wi-Fi Protected Access (WPA)."
 SECTION = "network"
 LICENSE = "GPL"
 HOMEPAGE = "http://hostap.epitest.fi/wpa_supplicant/"
-DEPENDS = "gnutls ${@base_contains("COMBINED_FEATURES", "pci", "madwifi-ng", "",d)}"
+DEPENDS = "gnutls ${@base_contains("COMBINED_FEATURES", "madwifi", "madwifi-ng", "",d)}"
 
-PR = "r1"
+PR = "r1.1"
 
 #we introduce MY_ARCH to get 'armv5te' as arch instead of the misleading 'arm' on armv5te builds
 MY_ARCH := "${PACKAGE_ARCH}"
-PACKAGE_ARCH = "${@base_contains('COMBINED_FEATURES', 'pci', '${MACHINE_ARCH}', '${MY_ARCH}', d)}"
+PACKAGE_ARCH = "${@base_contains('COMBINED_FEATURES', 'madwifi', '${MACHINE_ARCH}', '${MY_ARCH}', d)}"
 
 SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
 	file://defconfig-gnutls \
@@ -24,12 +24,12 @@ RREPLACES = "wpa-supplicant-cli"
 
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase"
 
-export HAS_PCI = "${@base_contains('COMBINED_FEATURES', 'pci', 1, 0,d)}"
+export HAS_MADWIFI = "${@base_contains('COMBINED_FEATURES', 'madwifi', 1, 0,d)}"
 
 do_configure () {
         install -m 0755 ${WORKDIR}/defconfig-gnutls  .config
 
-        if [ "x$HAS_PCI" == "x1" ] ; then
+        if [ "x$HAS_MADWIFI" == "x1" ] ; then
                 echo "CONFIG_DRIVER_MADWIFI=y" >> .config
                 echo "CFLAGS += -I${STAGING_INCDIR}/madwifi-ng" >> .config
         fi
-- 
1.6.0



