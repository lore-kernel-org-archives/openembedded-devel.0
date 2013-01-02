Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <damien.rannou@diateam.net>) id 1TqLp5-0002BJ-JG
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2013 11:45:23 +0100
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id B77CCD1B0EA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jan 2013 11:21:59 +0100 (CET)
Received: from pippin.diateam.local (unknown [78.223.33.15])
	by smtp4-g21.free.fr (Postfix) with ESMTP id 8604C4C810D;
	Wed,  2 Jan 2013 11:21:55 +0100 (CET)
From: Damien RANNOU <damien.rannou@diateam.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jan 2013 11:21:21 +0100
Message-Id: <1357122081-20776-1-git-send-email-damien.rannou@diateam.net>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] HostAP-daemon patch to make it compile with libnl 3.2
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
X-List-Received-Date: Wed, 02 Jan 2013 10:45:24 -0000

Signed-off-by: Damien RANNOU <damien.rannou@diateam.net>
---
 meta-oe/recipes-connectivity/hostapd/hostap-daemon-1.0/defconfig |    2 +-
 meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb        |    1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostap-daemon-1.0/defconfig b/meta-oe/recipes-connectivity/hostapd/hostap-daemon-1.0/defconfig
index 1f3c6f4..2789640 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostap-daemon-1.0/defconfig
+++ b/meta-oe/recipes-connectivity/hostapd/hostap-daemon-1.0/defconfig
@@ -24,7 +24,7 @@ CONFIG_DRIVER_PRISM54=y
 
 # Driver interface for drivers using the nl80211 kernel interface
 CONFIG_DRIVER_NL80211=y
-CONFIG_LIBNL20=y
+CONFIG_LIBNL32=y
 # driver_nl80211.c requires a rather new libnl (version 1.1) which may not be
 # shipped with your distribution yet. If that is the case, you need to build
 # newer libnl version and point the hostapd build to use it.
diff --git a/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb b/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb
index 310e8aa..e62531f 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb
@@ -26,6 +26,7 @@ do_configure() {
 }
 
 do_compile() {
+	export CFLAGS="-MMD -O2 -Wall -g -I${STAGING_INCDIR}/libnl3"
 	make
 }
 
-- 
1.7.10.4



