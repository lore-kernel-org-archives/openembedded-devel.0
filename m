Received: from caiajhbdccac.dreamhost.com ([208.97.132.202]
	helo=homiemail-a20.g.dreamhost.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NGTG2-00052D-NB
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 09:11:22 +0100
Received: from localhost.localdomain (mtec-hg-docking-1-dhcp-199.ethz.ch
	[129.132.133.199])
	by homiemail-a20.g.dreamhost.com (Postfix) with ESMTPA id 499577EC060; 
	Fri,  4 Dec 2009 00:09:42 -0800 (PST)
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Dec 2009 09:09:35 +0100
Message-Id: <1259914175-22032-1-git-send-email-Sebastian@SSpaeth.de>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1259911783.1467.8.camel@andromeda>
References: <1259911783.1467.8.camel@andromeda>
X-SA-Exim-Connect-IP: 208.97.132.202
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Sebastian Spaeth <Sebastian@SSpaeth.de>
Subject: [PATCH] [UPDATED] task-base: Introduce DISTRO_APM and convert recipes to use that
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
X-List-Received-Date: Fri, 04 Dec 2009 08:11:22 -0000

Signed-off-by: Sebastian Spaeth <Sebastian@SSpaeth.de>
---
 conf/distro/shr.conf                           |    2 +-
 recipes/ipaq-sleep/ipaq-sleep_0.9.bb           |    5 +++--
 recipes/openmoko2/neod_svn.bb                  |    6 ++++--
 recipes/suspend-desktop/suspend-desktop_1.0.bb |    5 +++--
 recipes/tasks/task-base.bb                     |    7 +++++--
 5 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/conf/distro/shr.conf b/conf/distro/shr.conf
index 80f89bd..833eb09 100644
--- a/conf/distro/shr.conf
+++ b/conf/distro/shr.conf
@@ -30,6 +30,7 @@ DISTRO_TYPE = "debug"
 DISTRO = "shr"
 
 DISTRO_SSH_DAEMON = "openssh"
+DISTRO_APM = "fso-apm"
 
 #Generate locales on the buildsystem instead of on the target. Speeds up first boot, set to "1" to enable
 ENABLE_BINARY_LOCALE_GENERATION ?= "1"
@@ -183,7 +184,6 @@ PREFERRED_PROVIDER_virtual/db-native = "db3-native"
 PREFERRED_PROVIDER_virtual/libsdl = "libsdl-x11"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
 PREFERRED_PROVIDER_virtual/libusb0 ?= "libusb"
-DISTRO_apm = "fso-apm"
 
 #############################################################################
 # PREFERRED VERSIONS
diff --git a/recipes/ipaq-sleep/ipaq-sleep_0.9.bb b/recipes/ipaq-sleep/ipaq-sleep_0.9.bb
index 24d881d..158de80 100644
--- a/recipes/ipaq-sleep/ipaq-sleep_0.9.bb
+++ b/recipes/ipaq-sleep/ipaq-sleep_0.9.bb
@@ -2,8 +2,9 @@ DESCRIPTION = "Automatic sleep/suspend control daemon"
 SECTION = "x11/base"
 LICENSE = "GPL"
 DEPENDS = "apmd virtual/xserver libxext virtual/libx11 libxau xscrnsaverh libxss"
-RDEPENDS = "apm"
-PR = "r6"
+DISTRO_APM ?= "apm"
+RDEPENDS = "${DISTRO_APM}"
+PR = "r7"
 
 inherit gpe pkgconfig
 
diff --git a/recipes/openmoko2/neod_svn.bb b/recipes/openmoko2/neod_svn.bb
index aeeee87..e57bf08 100644
--- a/recipes/openmoko2/neod_svn.bb
+++ b/recipes/openmoko2/neod_svn.bb
@@ -1,9 +1,11 @@
 DESCRIPTION = "Simple Neo1973 Daemon for Button Handling and Power Management"
 SECTION = "openmoko/daemons"
+
+DISTRO_APM ?= "apm"
 DEPENDS = "gtk+ pulseaudio apmd"
-RDEPENDS = "gpe-scap xrandr alsa-utils-amixer apm dbus"
+RDEPENDS = "gpe-scap xrandr alsa-utils-amixer ${DISTRO_APM} dbus"
 PV = "0.1.0+svnr${SRCPV}"
-PR = "r6"
+PR = "r7"
 
 inherit openmoko2 gconf
 
diff --git a/recipes/suspend-desktop/suspend-desktop_1.0.bb b/recipes/suspend-desktop/suspend-desktop_1.0.bb
index fa9efba..085d686 100644
--- a/recipes/suspend-desktop/suspend-desktop_1.0.bb
+++ b/recipes/suspend-desktop/suspend-desktop_1.0.bb
@@ -3,10 +3,11 @@ PRIORITY    = "optional"
 DESCRIPTION = "Suspend feature for the application launcher menu."
 LICENSE     = "GPL"
 
-PR          = "r1"
+PR          = "r2"
 
+DISTRO_APM ?= "apm"
 RDEPENDS    = "gpe-conf"
-RRECOMMENDS = "apm"
+RRECOMMENDS = "${DISTRO_APM}"
 
 PACKAGES    = "${PN}"
 PACKAGE_ARCH = "all"
diff --git a/recipes/tasks/task-base.bb b/recipes/tasks/task-base.bb
index ed561b8..b540c80 100644
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
+DISTRO_APM ?= "apm"
+
 #
 # bluetooth manager
 #
@@ -190,7 +193,7 @@ RDEPENDS_task-base-acpi = "\
     acpid"
 
 RDEPENDS_task-base-apm = "\
-    apm \
+    "${DISTRO_APM}" \
     apmd \
     ${@base_contains('MACHINE_FEATURES', 'kernel24', 'network-suspend-scripts', '',d)}"
 
-- 
1.6.3.3



