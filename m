Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1R5luV-0002UN-R7
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Sep 2011 00:01:56 +0200
Received: from mizar.localdomain (87.0.30.53) by smtp207.alice.it (8.5.124.08)
	id 4DFA189A08554723; Mon, 19 Sep 2011 23:56:39 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 19 Sep 2011 23:56:30 +0200
Message-Id: <1316469391-15036-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1316469391-15036-1-git-send-email-andrea.adami@gmail.com>
References: <1316469391-15036-1-git-send-email-andrea.adami@gmail.com>
Cc: Tom Rini <tom_rini@mentor.com>
Subject: [meta-oe][PATCH 2/3] udev: Fix cache problem
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
X-List-Received-Date: Mon, 19 Sep 2011 22:01:56 -0000

* When /dev/shm is re-mounted we need to re-create the files that end up
* in /etc/udev/saved.*.  In addition, udev 124 wasn't making an initial
* saved.uname file.
*
* Patch was committed in the openembedded git server with commit id
* b6838a476a9c448cd994634688ead0815226b9fe

Signed-off-by: Tom Rini <tom_rini@mentor.com>
Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-oe/recipes-core/udev/udev/cache  |   13 ++++---------
 meta-oe/recipes-core/udev/udev_173.bb |    2 +-
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-core/udev/udev/cache b/meta-oe/recipes-core/udev/udev/cache
index 62673ad..681651d 100644
--- a/meta-oe/recipes-core/udev/udev/cache
+++ b/meta-oe/recipes-core/udev/udev/cache
@@ -9,16 +9,11 @@ echo "Caching udev devnodes"
 if [ "$DEVCACHE" != "" ]; then
 	echo -n "Populating dev cache"
 	(cd /; tar cf $DEVCACHE dev)
-	mv /dev/shm/uname /etc/udev/saved.uname
-	mv /dev/shm/cmdline /etc/udev/saved.cmdline
-	mv /dev/shm/devices /etc/udev/saved.devices
-	mv /dev/shm/atags /etc/udev/saved.atags
+	[ -x /bin/uname ] && /bin/uname -mrspv > /etc/udev/saved.uname || touch /etc/udev/saved.uname
+	[ -r /proc/cmdline ] && cat /proc/cmdline > /etc/udev/saved.cmdline || touch /etc/udev/saved.cmdline
+	[ -r /proc/devices ] && cat /proc/devices > /etc/udev/saved.devices || touch /etc/udev/saved.devices
+	[ -r /proc/atags ] && cat /proc/atags > /etc/udev/saved.atags || touch /etc/udev/saved.atags
 	echo
-else
-	rm -f /dev/shm/uname
-	rm -f /dev/shm/cmdline
-	rm -f /dev/shm/devices
-	rm -f /dev/shm/atags
 fi
 
 exit 0
diff --git a/meta-oe/recipes-core/udev/udev_173.bb b/meta-oe/recipes-core/udev/udev_173.bb
index 8ace629..d220395 100644
--- a/meta-oe/recipes-core/udev/udev_173.bb
+++ b/meta-oe/recipes-core/udev/udev_173.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 # Needed for udev-extras
 DEPENDS = "gperf-native usbutils acl glib-2.0"
 
-PR = "r1"
+PR = "r2"
 
 # version specific SRC_URI
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
-- 
1.7.3.4



