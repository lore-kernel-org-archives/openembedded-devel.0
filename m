Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1R5luT-0002SC-9D
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Sep 2011 00:01:55 +0200
Received: from mizar.localdomain (87.0.30.53) by smtp207.alice.it (8.5.124.08)
	id 4DFA189A085546FD; Mon, 19 Sep 2011 23:56:36 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 19 Sep 2011 23:56:29 +0200
Message-Id: <1316469391-15036-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Cc: Tom Rini <tom_rini@mentor.com>
Subject: [meta-oe][PATCH 1/3] udev: make the dev cache work with /dev/shm
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
X-List-Received-Date: Mon, 19 Sep 2011 22:01:55 -0000

* At this point in the boot process we may not have a writable /tmp
* directory.  We will have a writable /dev/shm and the data we need
* is small enough that we use this directory.
*
* Patch was committed in the openembedded git server with commit id
* ca688dd2de58dbec865ac7e70fab4d2c373ad822

Signed-off-by: Tom Rini <tom_rini@mentor.com>
Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-oe/recipes-core/udev/udev/cache  |   16 ++++++++--------
 meta-oe/recipes-core/udev/udev/init   |   16 ++++++++--------
 meta-oe/recipes-core/udev/udev_173.bb |    2 +-
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta-oe/recipes-core/udev/udev/cache b/meta-oe/recipes-core/udev/udev/cache
index 6936170..62673ad 100644
--- a/meta-oe/recipes-core/udev/udev/cache
+++ b/meta-oe/recipes-core/udev/udev/cache
@@ -9,16 +9,16 @@ echo "Caching udev devnodes"
 if [ "$DEVCACHE" != "" ]; then
 	echo -n "Populating dev cache"
 	(cd /; tar cf $DEVCACHE dev)
-	mv /tmp/uname /etc/udev/saved.uname
-	mv /tmp/cmdline /etc/udev/saved.cmdline
-	mv /tmp/devices /etc/udev/saved.devices
-	mv /tmp/atags /etc/udev/saved.atags
+	mv /dev/shm/uname /etc/udev/saved.uname
+	mv /dev/shm/cmdline /etc/udev/saved.cmdline
+	mv /dev/shm/devices /etc/udev/saved.devices
+	mv /dev/shm/atags /etc/udev/saved.atags
 	echo
 else
-	rm -f /tmp/uname
-	rm -f /tmp/cmdline
-	rm -f /tmp/devices
-	rm -f /tmp/atags
+	rm -f /dev/shm/uname
+	rm -f /dev/shm/cmdline
+	rm -f /dev/shm/devices
+	rm -f /dev/shm/atags
 fi
 
 exit 0
diff --git a/meta-oe/recipes-core/udev/udev/init b/meta-oe/recipes-core/udev/udev/init
index ecc357d..b059fe2 100644
--- a/meta-oe/recipes-core/udev/udev/init
+++ b/meta-oe/recipes-core/udev/udev/init
@@ -37,15 +37,15 @@ LANG=C awk "\$2 == \"/dev\" && \$3 == \"tmpfs\" { exit 1 }" /proc/mounts && {
 
 if [ "$DEVCACHE" != "" ]; then
 	# Invalidate udev cache if the kernel or its bootargs/cmdline have changed
-	[ -x /bin/uname ] && /bin/uname -mrspv > /tmp/uname || touch /tmp/uname
-	[ -r /proc/cmdline ] && cat /proc/cmdline > /tmp/cmdline || touch /tmp/cmdline
-	[ -r /proc/devices ] && cat /proc/devices > /tmp/devices || touch /tmp/devices
-	[ -r /proc/atags ] && cat /proc/atags > /tmp/atags || touch /tmp/atags
+	[ -x /bin/uname ] && /bin/uname -mrspv > /dev/shm/uname || touch /dev/shm/uname
+	[ -r /proc/cmdline ] && cat /proc/cmdline > /dev/shm/cmdline || touch /dev/shm/cmdline
+	[ -r /proc/devices ] && cat /proc/devices > /dev/shm/devices || touch /dev/shm/devices
+	[ -r /proc/atags ] && cat /proc/atags > /dev/shm/atags || touch /dev/shm/atags
 	if [ -e $DEVCACHE ] && \
-		cmp -s /tmp/uname /etc/udev/saved.uname && \
-		cmp -s /tmp/cmdline /etc/udev/saved.cmdline && \
-		cmp -s /tmp/devices /etc/udev/saved.devices && \
-		cmp -s /tmp/atags /etc/udev/saved.atags; then
+		cmp -s /dev/shm/uname /etc/udev/saved.uname && \
+		cmp -s /dev/shm/cmdline /etc/udev/saved.cmdline && \
+		cmp -s /dev/shm/devices /etc/udev/saved.devices && \
+		cmp -s /dev/shm/atags /etc/udev/saved.atags; then
 		(cd /; tar xf $DEVCACHE > /dev/null 2>&1)
 		not_first_boot=1
 	fi
diff --git a/meta-oe/recipes-core/udev/udev_173.bb b/meta-oe/recipes-core/udev/udev_173.bb
index df39d42..8ace629 100644
--- a/meta-oe/recipes-core/udev/udev_173.bb
+++ b/meta-oe/recipes-core/udev/udev_173.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 # Needed for udev-extras
 DEPENDS = "gperf-native usbutils acl glib-2.0"
 
-PR = "r0"
+PR = "r1"
 
 # version specific SRC_URI
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
-- 
1.7.3.4



