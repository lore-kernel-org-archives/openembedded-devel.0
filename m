Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NGSTZ-0007Le-KD
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 08:21:17 +0100
Received: from homiemail-a17.g.dreamhost.com (caiajhbdcbhh.dreamhost.com
	[208.97.132.177])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 9C8AA17FD53
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Dec 2009 23:19:37 -0800 (PST)
Received: from localhost.localdomain (mtec-hg-docking-1-dhcp-199.ethz.ch
	[129.132.133.199])
	by homiemail-a17.g.dreamhost.com (Postfix) with ESMTPA id 761117A8063; 
	Thu,  3 Dec 2009 23:19:35 -0800 (PST)
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Dec 2009 08:19:28 +0100
Message-Id: <1259911168-19992-2-git-send-email-Sebastian@SSpaeth.de>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1259911168-19992-1-git-send-email-Sebastian@SSpaeth.de>
References: <1259911168-19992-1-git-send-email-Sebastian@SSpaeth.de>
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Sebastian Spaeth <Sebastian@SSpaeth.de>
Subject: [PATCH 2/2] task-base: Introduce DISTRO_apm and convert recipes to use it.
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
X-List-Received-Date: Fri, 04 Dec 2009 07:21:17 -0000

* This allows distros to override the apm provider with an DISTRO_apm variable
* The change should be transparent and invisible for other distros
* This could also be done with a virtual/apm package, and a PREFERED_PROVIDER set to apm

Signed-off-by: Sebastian Spaeth <Sebastian@SSpaeth.de>
---
 recipes/ipaq-sleep/ipaq-sleep_0.9.bb           |    5 +++--
 recipes/matchbox2/matchbox-panel-2_svn.bb      |    6 ++++--
 recipes/openmoko2/neod_svn.bb                  |    6 ++++--
 recipes/suspend-desktop/suspend-desktop_1.0.bb |    5 +++--
 recipes/tasks/task-base.bb                     |    7 +++++--
 5 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/recipes/ipaq-sleep/ipaq-sleep_0.9.bb b/recipes/ipaq-sleep/ipaq-sleep_0.9.bb
index 24d881d..6c37b73 100644
--- a/recipes/ipaq-sleep/ipaq-sleep_0.9.bb
+++ b/recipes/ipaq-sleep/ipaq-sleep_0.9.bb
@@ -2,8 +2,9 @@ DESCRIPTION = "Automatic sleep/suspend control daemon"
 SECTION = "x11/base"
 LICENSE = "GPL"
 DEPENDS = "apmd virtual/xserver libxext virtual/libx11 libxau xscrnsaverh libxss"
-RDEPENDS = "apm"
-PR = "r6"
+DISTRO_apm ?= "apm"
+RDEPENDS = "${DISTRO_apm}"
+PR = "r7"
 
 inherit gpe pkgconfig
 
diff --git a/recipes/matchbox2/matchbox-panel-2_svn.bb b/recipes/matchbox2/matchbox-panel-2_svn.bb
index a2a807f..9d1781b 100644
--- a/recipes/matchbox2/matchbox-panel-2_svn.bb
+++ b/recipes/matchbox2/matchbox-panel-2_svn.bb
@@ -1,13 +1,15 @@
 DESCRIPTION = "matchbox-panel-2 is a lightweight dock (system tray) application based on Gtk+"
 LICENSE = "GPLv2"
 SECTION = "x11/panels"
+
+DISTRO_apm ?= "apm"
 DEPENDS = "gtk+ startup-notification dbus dbus-glib matchbox-panel-2-icon-themes"
 DEPENDS += " ${@base_contains("MACHINE_FEATURES", "acpi", "libacpi", "",d)}"
-DEPENDS += " ${@base_contains("MACHINE_FEATURES", "apm", "apmd", "",d)}"
+DEPENDS += " ${@base_contains("MACHINE_FEATURES", "${DISTRO_apm}", "apmd", "",d)}"
 RDEPENDS_${PN} = "matchbox-panel-2-icon-theme"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 PV = "2.0+svnr${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 inherit autotools_stage pkgconfig
 
diff --git a/recipes/openmoko2/neod_svn.bb b/recipes/openmoko2/neod_svn.bb
index aeeee87..14858a7 100644
--- a/recipes/openmoko2/neod_svn.bb
+++ b/recipes/openmoko2/neod_svn.bb
@@ -1,9 +1,11 @@
 DESCRIPTION = "Simple Neo1973 Daemon for Button Handling and Power Management"
 SECTION = "openmoko/daemons"
+
+DISTRO_apm ?= "apm"
 DEPENDS = "gtk+ pulseaudio apmd"
-RDEPENDS = "gpe-scap xrandr alsa-utils-amixer apm dbus"
+RDEPENDS = "gpe-scap xrandr alsa-utils-amixer ${DISTRO_apm} dbus"
 PV = "0.1.0+svnr${SRCPV}"
-PR = "r6"
+PR = "r7"
 
 inherit openmoko2 gconf
 
diff --git a/recipes/suspend-desktop/suspend-desktop_1.0.bb b/recipes/suspend-desktop/suspend-desktop_1.0.bb
index fa9efba..8fcdfea 100644
--- a/recipes/suspend-desktop/suspend-desktop_1.0.bb
+++ b/recipes/suspend-desktop/suspend-desktop_1.0.bb
@@ -3,10 +3,11 @@ PRIORITY    = "optional"
 DESCRIPTION = "Suspend feature for the application launcher menu."
 LICENSE     = "GPL"
 
-PR          = "r1"
+PR          = "r2"
 
+DISTRO-apm ?= "apm"
 RDEPENDS    = "gpe-conf"
-RRECOMMENDS = "apm"
+RRECOMMENDS = "${DISTRO_apm}"
 
 PACKAGES    = "${PN}"
 PACKAGE_ARCH = "all"
diff --git a/recipes/tasks/task-base.bb b/recipes/tasks/task-base.bb
index ed561b8..6aad873 100644
--- a/recipes/tasks/task-base.bb
+++ b/recipes/tasks/task-base.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Merge machine and distro options to create a basic machine task/package"
-PR = "r86"
+PR = "r87"
 
 inherit task
 
@@ -60,6 +60,9 @@ HOTPLUG ?= "${@base_contains("MACHINE_FEATURES", "kernel24",  "linux-hotplug",""
 #
 DISTRO_SSH_DAEMON ?= "dropbear"
 
+# Distro can override apm provider
+DISTRO_apm ?= "apm"
+
 #
 # bluetooth manager
 #
@@ -190,7 +193,7 @@ RDEPENDS_task-base-acpi = "\
     acpid"
 
 RDEPENDS_task-base-apm = "\
-    apm \
+    "${DISTRO_apm}" \
     apmd \
     ${@base_contains('MACHINE_FEATURES', 'kernel24', 'network-suspend-scripts', '',d)}"
 
-- 
1.6.3.3



