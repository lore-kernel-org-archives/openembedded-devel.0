Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtJuu-0001Id-T3
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 15:42:54 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Tue, 16 Aug 2011
	15:38:09 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Aug 2011 15:38:14 +0200
Message-ID: <b2a661498def56a184f05a3c7cde1528aa1b0e8d.1313501855.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1313501855.git.anders@chargestorm.se>
References: <cover.1313501855.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [meta-oe][PATCH 1/1] connman: conditionally enable wifi and bluetooth
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
X-List-Received-Date: Tue, 16 Aug 2011 13:42:54 -0000
Content-Type: text/plain

Use DISTRO_FEATURES to conditionally depend and enable wifi and bluetooth.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-oe/recipes-connectivity/connman/connman.inc   |    7 ++++++-
 .../recipes-connectivity/connman/connman_0.76.bb   |    4 ++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/connman/connman.inc b/meta-oe/recipes-connectivity/connman/connman.inc
index 2652125..284edd2 100644
--- a/meta-oe/recipes-connectivity/connman/connman.inc
+++ b/meta-oe/recipes-connectivity/connman/connman.inc
@@ -14,7 +14,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://src/main.c;beginline=1;endline=20;md5=4b55b550fa6b33cc2055ef30dd262b3e"
 
 # we need to define the depends here, the dynamic stuff is too late
-DEPENDS  = "wpa-supplicant dbus glib-2.0 ppp busybox dhcp resolvconf bluez4 iptables gnutls ntp"
+BLUEZDEPENDS = "bluez4"
+WIFIDEPENDS = "wpa-supplicant"
+DEPENDS  = "dbus glib-2.0 ppp busybox dhcp resolvconf iptables gnutls ntp \
+            ${@base_contains('DISTRO_FEATURES', 'bluetooth','${BLUEZDEPENDS}', '', d)} \
+            ${@base_contains('DISTRO_FEATURES', 'wifi','${WIFIDEPENDS}', '', d)} \
+            "
 
 EXTRA_OECONF += "\
     ac_cv_path_WPASUPPLICANT=/usr/sbin/wpa_supplicant \
diff --git a/meta-oe/recipes-connectivity/connman/connman_0.76.bb b/meta-oe/recipes-connectivity/connman/connman_0.76.bb
index cb84caa..abae73a 100644
--- a/meta-oe/recipes-connectivity/connman/connman_0.76.bb
+++ b/meta-oe/recipes-connectivity/connman/connman_0.76.bb
@@ -6,8 +6,8 @@ EXTRA_OECONF += "\
   --enable-threads \
   --enable-loopback \
   --enable-ethernet \
-  --enable-wifi \
-  --enable-bluetooth \
+  ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi', '--disable-wifi', d)} \
+  ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
   --enable-ofono \
   --enable-tools \
   --disable-polkit \
-- 
1.7.5.4



