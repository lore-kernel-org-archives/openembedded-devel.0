Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S5dLg-0003vq-VN
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Mar 2012 14:25:40 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Mar 2012 13:10:16 +0100
Message-Id: <1331208616-12036-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] udev-173: don't hardcode path to pidof
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
X-List-Received-Date: Thu, 08 Mar 2012 13:25:41 -0000

* pidof lives in /bin, search it in $PATH.
* Assume pidof's presence.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-oe/recipes-core/udev/udev/init   |    6 ++----
 meta-oe/recipes-core/udev/udev_173.bb |    2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-core/udev/udev/init b/meta-oe/recipes-core/udev/udev/init
index ecc357d..559ea44 100644
--- a/meta-oe/recipes-core/udev/udev/init
+++ b/meta-oe/recipes-core/udev/udev/init
@@ -18,10 +18,8 @@ export TZ=/etc/localtime
 [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
 
 kill_udevd() {
-	if [ -x /sbin/pidof ]; then
-		pid=`/sbin/pidof -x udevd`
-		[ -n "$pid" ] && kill $pid
-	fi
+	pid=`pidof -x udevd`
+	[ -n "$pid" ] && kill $pid
 }
 
 export ACTION=add
diff --git a/meta-oe/recipes-core/udev/udev_173.bb b/meta-oe/recipes-core/udev/udev_173.bb
index 5c5ce26..b7d7ed3 100644
--- a/meta-oe/recipes-core/udev/udev_173.bb
+++ b/meta-oe/recipes-core/udev/udev_173.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 # Needed for udev-extras
 DEPENDS = "gperf-native usbutils acl glib-2.0"
 
-PR = "r3"
+PR = "r4"
 
 # version specific SRC_URI
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
-- 
1.7.5.4



