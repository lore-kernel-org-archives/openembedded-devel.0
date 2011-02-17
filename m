Received: from smtp202.alice.it ([82.57.200.98])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1Pq54Z-00016G-82
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 15:43:11 +0100
Received: from localhost.localdomain (95.232.143.186) by smtp202.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4CC7FB5F01DE6F32; Thu, 17 Feb 2011 15:39:17 +0100
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: Stefan Schmidt <stefan@buglabs.net>
Date: Thu, 17 Feb 2011 15:39:05 +0100
Message-Id: <1297953548-26589-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/4] hostapd 0.7.3: convert to libnl2
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
X-List-Received-Date: Thu, 17 Feb 2011 14:43:11 -0000

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 recipes/hostap/hostap-daemon-0.7.3/defconfig |    1 +
 recipes/hostap/hostap-daemon_0.7.3.bb        |    7 ++++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes/hostap/hostap-daemon-0.7.3/defconfig b/recipes/hostap/hostap-daemon-0.7.3/defconfig
index 0bf2478..1f3c6f4 100644
--- a/recipes/hostap/hostap-daemon-0.7.3/defconfig
+++ b/recipes/hostap/hostap-daemon-0.7.3/defconfig
@@ -24,6 +24,7 @@ CONFIG_DRIVER_PRISM54=y
 
 # Driver interface for drivers using the nl80211 kernel interface
 CONFIG_DRIVER_NL80211=y
+CONFIG_LIBNL20=y
 # driver_nl80211.c requires a rather new libnl (version 1.1) which may not be
 # shipped with your distribution yet. If that is the case, you need to build
 # newer libnl version and point the hostapd build to use it.
diff --git a/recipes/hostap/hostap-daemon_0.7.3.bb b/recipes/hostap/hostap-daemon_0.7.3.bb
index 585486c..2dfec35 100644
--- a/recipes/hostap/hostap-daemon_0.7.3.bb
+++ b/recipes/hostap/hostap-daemon_0.7.3.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://hostap.epitest.fi"
 SECTION = "kernel/userland"
 PRIORITY = "optional"
 LICENSE = "GPL"
-DEPENDS = "libnl openssl"
-PR = "r0"
+DEPENDS = "libnl2 openssl"
+PR = "r1"
 
 DEFAULT_PREFERENCE = "-1"
 
@@ -21,6 +21,7 @@ INITSCRIPT_NAME=hostapd
 
 do_configure() {
 	install -m 0644 ${WORKDIR}/defconfig ${S}/.config
+	echo 'CFLAGS += "-I${STAGING_INCDIR}/libnl2"' >> ${S}/.config
 }
 
 do_compile() {
@@ -35,4 +36,4 @@ do_install() {
 	install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/hostapd
 }
 
-CONFFILES_${PN} += "${sysconfdir}/hostapd.conf"
\ No newline at end of file
+CONFFILES_${PN} += "${sysconfdir}/hostapd.conf"
-- 
1.7.0.4



