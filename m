Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1LmWJj-0007Zn-SH
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Mar 2009 17:51:04 +0100
Received: from p5b035fe4.dip.t-dialin.net ([91.3.95.228] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1LmWI8-00008w-Mj by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 17:49:27 +0100
Received: from stefan by excalibur.local with local (Exim 4.69)
	(envelope-from <stefan@excalibur.local>) id 1LmWI7-0001Dm-QW
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Mar 2009 17:49:23 +0100
Date: Wed, 25 Mar 2009 17:49:23 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090325164923.GA4557@excalibur.local>
MIME-Version: 1.0
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: [PATCH] wpa-supplicant: Prepare >=0.6 for dbus system activation
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
X-List-Received-Date: Wed, 25 Mar 2009 16:51:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

To get wpa-supplicant get started via dbus system activation I need the
following patch.

The renaming of the service file is something must do as it does not get picked
up correctly without it.
http://lists.shmoo.com/pipermail/hostap/2007-December/016960.html

For the path issue we have two options a) patch the service file like I did here
or b) install wpa-supplicant into /sbin as debian does it for example.

regards
Stefan Schmidt

From 638dc47abc7157500630cccefe10521378771364 Mon Sep 17 00:00:00 2001
From: Stefan Schmidt <stefan@datenfreihafen.org>
Date: Wed, 25 Mar 2009 17:37:17 +0100
Subject: [PATCH 1/2] wpa-supplicant: Prepare >=0.6 for dbus system activation

* Fix binary path in service file
* Install service under the right name taht it gets detected and used correctly
* Bump PR's
---
 .../files/service-activation-binary-path.patch     |   10 ++++++++++
 packages/wpa-supplicant/wpa-supplicant-0.6.inc     |    7 +++++--
 packages/wpa-supplicant/wpa-supplicant_0.6.0.bb    |    2 +-
 packages/wpa-supplicant/wpa-supplicant_0.6.3.bb    |    2 +-
 4 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/packages/wpa-supplicant/files/service-activation-binary-path.patch b/packages/wpa-supplicant/files/service-activation-binary-path.patch
new file mode 100644
index 0000000..c31d877
--- /dev/null
+++ b/packages/wpa-supplicant/files/service-activation-binary-path.patch
@@ -0,0 +1,10 @@
+Index: wpa_supplicant-0.6.3/wpa_supplicant/dbus-wpa_supplicant.service
+===================================================================
+--- wpa_supplicant-0.6.3.orig/wpa_supplicant/dbus-wpa_supplicant.service	2009-03-25 12:12:38.000000000 +0100
++++ wpa_supplicant-0.6.3/wpa_supplicant/dbus-wpa_supplicant.service	2009-03-25 12:12:47.000000000 +0100
+@@ -1,4 +1,4 @@
+ [D-BUS Service]
+ Name=fi.epitest.hostap.WPASupplicant
+-Exec=/sbin/wpa_supplicant -u
++Exec=/usr/sbin/wpa_supplicant -u
+ User=root
diff --git a/packages/wpa-supplicant/wpa-supplicant-0.6.inc b/packages/wpa-supplicant/wpa-supplicant-0.6.inc
index 779bee7..e67d75e 100644
--- a/packages/wpa-supplicant/wpa-supplicant-0.6.inc
+++ b/packages/wpa-supplicant/wpa-supplicant-0.6.inc
@@ -13,7 +13,9 @@ DEFAULT_PREFERENCE = "-2"
 SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
 	file://defconfig-0.6.0-gnutls \
 	file://ifupdown.sh \
-	file://functions.sh"
+	file://functions.sh \
+	file://service-activation-binary-path.patch;patch=1;pnum=2 \
+	"
 
 #	file://gnutlsfix.patch;patch=1 \
 
@@ -63,7 +65,8 @@ do_install () {
 	install -d ${D}/${sysconfdir}/dbus-1/system.d
 	install -m 644 ${S}/dbus-wpa_supplicant.conf ${D}/${sysconfdir}/dbus-1/system.d
 	install -d ${D}/${datadir}/dbus-1/system-services
-	install -m 644 ${S}/dbus-wpa_supplicant.service ${D}/${datadir}/dbus-1/system-services
+	install -m 644 ${S}/dbus-wpa_supplicant.service ${D}/${datadir}/dbus-1/system-services/fi.epitest.hostap.WPASupplicant.service
+
 
 	ln -s /etc/wpa_supplicant/ifupdown.sh ${D}${sysconfdir}/network/if-pre-up.d/wpasupplicant
 	ln -s /etc/wpa_supplicant/ifupdown.sh ${D}${sysconfdir}/network/if-post-down.d/wpasupplicant
diff --git a/packages/wpa-supplicant/wpa-supplicant_0.6.0.bb b/packages/wpa-supplicant/wpa-supplicant_0.6.0.bb
index 11fc774..3b0e993 100644
--- a/packages/wpa-supplicant/wpa-supplicant_0.6.0.bb
+++ b/packages/wpa-supplicant/wpa-supplicant_0.6.0.bb
@@ -1,3 +1,3 @@
 require wpa-supplicant-0.6.inc
 
-PR = "r2"
+PR = "r3"
diff --git a/packages/wpa-supplicant/wpa-supplicant_0.6.3.bb b/packages/wpa-supplicant/wpa-supplicant_0.6.3.bb
index 11fc774..3b0e993 100644
--- a/packages/wpa-supplicant/wpa-supplicant_0.6.3.bb
+++ b/packages/wpa-supplicant/wpa-supplicant_0.6.3.bb
@@ -1,3 +1,3 @@
 require wpa-supplicant-0.6.inc
 
-PR = "r2"
+PR = "r3"
-- 
1.6.2.1



