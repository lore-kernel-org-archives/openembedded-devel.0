Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtZRu-0003ZM-Tu
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 08:17:59 +0200
Received: from localhost (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.137.0; Wed, 17 Aug 2011
	08:13:21 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Aug 2011 08:13:30 +0200
Message-ID: <898bc8606396dc1626e3393439a6c23aa1978bee.1313561532.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1313561532.git.anders@chargestorm.se>
References: <cover.1313561532.git.anders@chargestorm.se>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 1/1] connman: conditionally enable wifi and bluetooth
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
X-List-Received-Date: Wed, 17 Aug 2011 06:17:59 -0000
Content-Type: text/plain

Use DISTRO_FEATURES to conditionally depend and enable wifi and bluetooth.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-oe/recipes-connectivity/connman/connman.inc   |    5 ++++-
 .../recipes-connectivity/connman/connman_0.76.bb   |    4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/connman/connman.inc b/meta-oe/recipes-connectivity/connman/connman.inc
index 2652125..eeccf50 100644
--- a/meta-oe/recipes-connectivity/connman/connman.inc
+++ b/meta-oe/recipes-connectivity/connman/connman.inc
@@ -14,7 +14,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://src/main.c;beginline=1;endline=20;md5=4b55b550fa6b33cc2055ef30dd262b3e"
 
 # we need to define the depends here, the dynamic stuff is too late
-DEPENDS  = "wpa-supplicant dbus glib-2.0 ppp busybox dhcp resolvconf bluez4 iptables gnutls ntp"
+DEPENDS  = "dbus glib-2.0 ppp busybox dhcp resolvconf iptables gnutls ntp \
+            ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)} \
+            ${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
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



