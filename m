Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Pnynr-0000bp-Ag
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 20:37:15 +0100
Received: from gandalf.denix.org ([unknown] [71.251.49.88])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LGG00J82X3DUAX3@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	11 Feb 2011 13:35:48 -0600 (CST)
Received: from elrond.denix.org (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CA17914AF6C; Fri,
	11 Feb 2011 14:35:36 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Feb 2011 14:35:31 -0500
Message-id: <1297452931-19486-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] udev: also use /proc/devices to invalidate devcache
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
X-List-Received-Date: Fri, 11 Feb 2011 19:37:15 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Besides checking for kernel version, bootargs or cmdline changes between
reboots, also consider changes in /proc/devices to invalidate device cache.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes/udev/udev-141/cache |    2 ++
 recipes/udev/udev-141/init  |    2 ++
 recipes/udev/udev-151/cache |    2 ++
 recipes/udev/udev-151/init  |    2 ++
 recipes/udev/udev-154/cache |    2 ++
 recipes/udev/udev-154/init  |    2 ++
 recipes/udev/udev-162/cache |    2 ++
 recipes/udev/udev-162/init  |    2 ++
 recipes/udev/udev-165/cache |    2 ++
 recipes/udev/udev-165/init  |    2 ++
 recipes/udev/udev_141.bb    |    3 ++-
 recipes/udev/udev_151.bb    |    3 ++-
 recipes/udev/udev_154.bb    |    3 ++-
 recipes/udev/udev_162.bb    |    3 ++-
 recipes/udev/udev_165.bb    |    3 ++-
 15 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/recipes/udev/udev-141/cache b/recipes/udev/udev-141/cache
index c0d400b..6936170 100644
--- a/recipes/udev/udev-141/cache
+++ b/recipes/udev/udev-141/cache
@@ -11,11 +11,13 @@ if [ "$DEVCACHE" != "" ]; then
 	(cd /; tar cf $DEVCACHE dev)
 	mv /tmp/uname /etc/udev/saved.uname
 	mv /tmp/cmdline /etc/udev/saved.cmdline
+	mv /tmp/devices /etc/udev/saved.devices
 	mv /tmp/atags /etc/udev/saved.atags
 	echo
 else
 	rm -f /tmp/uname
 	rm -f /tmp/cmdline
+	rm -f /tmp/devices
 	rm -f /tmp/atags
 fi
 
diff --git a/recipes/udev/udev-141/init b/recipes/udev/udev-141/init
index 4dcb241..c0ecdfc 100644
--- a/recipes/udev/udev-141/init
+++ b/recipes/udev/udev-141/init
@@ -39,10 +39,12 @@ if [ "$DEVCACHE" != "" ]; then
 	# Invalidate udev cache if the kernel or its bootargs/cmdline have changed
 	[ -x /bin/uname ] && /bin/uname -mrspv > /tmp/uname || touch /tmp/uname
 	[ -r /proc/cmdline ] && cat /proc/cmdline > /tmp/cmdline || touch /tmp/cmdline
+	[ -r /proc/devices ] && cat /proc/devices > /tmp/devices || touch /tmp/devices
 	[ -r /proc/atags ] && cat /proc/atags > /tmp/atags || touch /tmp/atags
 	if [ -e $DEVCACHE ] && \
 	   cmp -s /tmp/uname /etc/udev/saved.uname && \
 	   cmp -s /tmp/cmdline /etc/udev/saved.cmdline && \
+	   cmp -s /tmp/devices /etc/udev/saved.devices && \
 	   cmp -s /tmp/atags /etc/udev/saved.atags; then
 		(cd /; tar xf $DEVCACHE > /dev/null 2>&1)
 		not_first_boot=1
diff --git a/recipes/udev/udev-151/cache b/recipes/udev/udev-151/cache
index c0d400b..6936170 100644
--- a/recipes/udev/udev-151/cache
+++ b/recipes/udev/udev-151/cache
@@ -11,11 +11,13 @@ if [ "$DEVCACHE" != "" ]; then
 	(cd /; tar cf $DEVCACHE dev)
 	mv /tmp/uname /etc/udev/saved.uname
 	mv /tmp/cmdline /etc/udev/saved.cmdline
+	mv /tmp/devices /etc/udev/saved.devices
 	mv /tmp/atags /etc/udev/saved.atags
 	echo
 else
 	rm -f /tmp/uname
 	rm -f /tmp/cmdline
+	rm -f /tmp/devices
 	rm -f /tmp/atags
 fi
 
diff --git a/recipes/udev/udev-151/init b/recipes/udev/udev-151/init
index 4dcb241..c0ecdfc 100644
--- a/recipes/udev/udev-151/init
+++ b/recipes/udev/udev-151/init
@@ -39,10 +39,12 @@ if [ "$DEVCACHE" != "" ]; then
 	# Invalidate udev cache if the kernel or its bootargs/cmdline have changed
 	[ -x /bin/uname ] && /bin/uname -mrspv > /tmp/uname || touch /tmp/uname
 	[ -r /proc/cmdline ] && cat /proc/cmdline > /tmp/cmdline || touch /tmp/cmdline
+	[ -r /proc/devices ] && cat /proc/devices > /tmp/devices || touch /tmp/devices
 	[ -r /proc/atags ] && cat /proc/atags > /tmp/atags || touch /tmp/atags
 	if [ -e $DEVCACHE ] && \
 	   cmp -s /tmp/uname /etc/udev/saved.uname && \
 	   cmp -s /tmp/cmdline /etc/udev/saved.cmdline && \
+	   cmp -s /tmp/devices /etc/udev/saved.devices && \
 	   cmp -s /tmp/atags /etc/udev/saved.atags; then
 		(cd /; tar xf $DEVCACHE > /dev/null 2>&1)
 		not_first_boot=1
diff --git a/recipes/udev/udev-154/cache b/recipes/udev/udev-154/cache
index c0d400b..6936170 100644
--- a/recipes/udev/udev-154/cache
+++ b/recipes/udev/udev-154/cache
@@ -11,11 +11,13 @@ if [ "$DEVCACHE" != "" ]; then
 	(cd /; tar cf $DEVCACHE dev)
 	mv /tmp/uname /etc/udev/saved.uname
 	mv /tmp/cmdline /etc/udev/saved.cmdline
+	mv /tmp/devices /etc/udev/saved.devices
 	mv /tmp/atags /etc/udev/saved.atags
 	echo
 else
 	rm -f /tmp/uname
 	rm -f /tmp/cmdline
+	rm -f /tmp/devices
 	rm -f /tmp/atags
 fi
 
diff --git a/recipes/udev/udev-154/init b/recipes/udev/udev-154/init
index 4dcb241..c0ecdfc 100644
--- a/recipes/udev/udev-154/init
+++ b/recipes/udev/udev-154/init
@@ -39,10 +39,12 @@ if [ "$DEVCACHE" != "" ]; then
 	# Invalidate udev cache if the kernel or its bootargs/cmdline have changed
 	[ -x /bin/uname ] && /bin/uname -mrspv > /tmp/uname || touch /tmp/uname
 	[ -r /proc/cmdline ] && cat /proc/cmdline > /tmp/cmdline || touch /tmp/cmdline
+	[ -r /proc/devices ] && cat /proc/devices > /tmp/devices || touch /tmp/devices
 	[ -r /proc/atags ] && cat /proc/atags > /tmp/atags || touch /tmp/atags
 	if [ -e $DEVCACHE ] && \
 	   cmp -s /tmp/uname /etc/udev/saved.uname && \
 	   cmp -s /tmp/cmdline /etc/udev/saved.cmdline && \
+	   cmp -s /tmp/devices /etc/udev/saved.devices && \
 	   cmp -s /tmp/atags /etc/udev/saved.atags; then
 		(cd /; tar xf $DEVCACHE > /dev/null 2>&1)
 		not_first_boot=1
diff --git a/recipes/udev/udev-162/cache b/recipes/udev/udev-162/cache
index c0d400b..6936170 100644
--- a/recipes/udev/udev-162/cache
+++ b/recipes/udev/udev-162/cache
@@ -11,11 +11,13 @@ if [ "$DEVCACHE" != "" ]; then
 	(cd /; tar cf $DEVCACHE dev)
 	mv /tmp/uname /etc/udev/saved.uname
 	mv /tmp/cmdline /etc/udev/saved.cmdline
+	mv /tmp/devices /etc/udev/saved.devices
 	mv /tmp/atags /etc/udev/saved.atags
 	echo
 else
 	rm -f /tmp/uname
 	rm -f /tmp/cmdline
+	rm -f /tmp/devices
 	rm -f /tmp/atags
 fi
 
diff --git a/recipes/udev/udev-162/init b/recipes/udev/udev-162/init
index 4dcb241..c0ecdfc 100644
--- a/recipes/udev/udev-162/init
+++ b/recipes/udev/udev-162/init
@@ -39,10 +39,12 @@ if [ "$DEVCACHE" != "" ]; then
 	# Invalidate udev cache if the kernel or its bootargs/cmdline have changed
 	[ -x /bin/uname ] && /bin/uname -mrspv > /tmp/uname || touch /tmp/uname
 	[ -r /proc/cmdline ] && cat /proc/cmdline > /tmp/cmdline || touch /tmp/cmdline
+	[ -r /proc/devices ] && cat /proc/devices > /tmp/devices || touch /tmp/devices
 	[ -r /proc/atags ] && cat /proc/atags > /tmp/atags || touch /tmp/atags
 	if [ -e $DEVCACHE ] && \
 	   cmp -s /tmp/uname /etc/udev/saved.uname && \
 	   cmp -s /tmp/cmdline /etc/udev/saved.cmdline && \
+	   cmp -s /tmp/devices /etc/udev/saved.devices && \
 	   cmp -s /tmp/atags /etc/udev/saved.atags; then
 		(cd /; tar xf $DEVCACHE > /dev/null 2>&1)
 		not_first_boot=1
diff --git a/recipes/udev/udev-165/cache b/recipes/udev/udev-165/cache
index c0d400b..6936170 100644
--- a/recipes/udev/udev-165/cache
+++ b/recipes/udev/udev-165/cache
@@ -11,11 +11,13 @@ if [ "$DEVCACHE" != "" ]; then
 	(cd /; tar cf $DEVCACHE dev)
 	mv /tmp/uname /etc/udev/saved.uname
 	mv /tmp/cmdline /etc/udev/saved.cmdline
+	mv /tmp/devices /etc/udev/saved.devices
 	mv /tmp/atags /etc/udev/saved.atags
 	echo
 else
 	rm -f /tmp/uname
 	rm -f /tmp/cmdline
+	rm -f /tmp/devices
 	rm -f /tmp/atags
 fi
 
diff --git a/recipes/udev/udev-165/init b/recipes/udev/udev-165/init
index 4dcb241..c0ecdfc 100644
--- a/recipes/udev/udev-165/init
+++ b/recipes/udev/udev-165/init
@@ -39,10 +39,12 @@ if [ "$DEVCACHE" != "" ]; then
 	# Invalidate udev cache if the kernel or its bootargs/cmdline have changed
 	[ -x /bin/uname ] && /bin/uname -mrspv > /tmp/uname || touch /tmp/uname
 	[ -r /proc/cmdline ] && cat /proc/cmdline > /tmp/cmdline || touch /tmp/cmdline
+	[ -r /proc/devices ] && cat /proc/devices > /tmp/devices || touch /tmp/devices
 	[ -r /proc/atags ] && cat /proc/atags > /tmp/atags || touch /tmp/atags
 	if [ -e $DEVCACHE ] && \
 	   cmp -s /tmp/uname /etc/udev/saved.uname && \
 	   cmp -s /tmp/cmdline /etc/udev/saved.cmdline && \
+	   cmp -s /tmp/devices /etc/udev/saved.devices && \
 	   cmp -s /tmp/atags /etc/udev/saved.atags; then
 		(cd /; tar xf $DEVCACHE > /dev/null 2>&1)
 		not_first_boot=1
diff --git a/recipes/udev/udev_141.bb b/recipes/udev/udev_141.bb
index 80b7cc7..9a0a7be 100644
--- a/recipes/udev/udev_141.bb
+++ b/recipes/udev/udev_141.bb
@@ -7,7 +7,7 @@ DEFAULT_PREFERENCE = "-1"
 
 require udev.inc
 
-PR = "${INC_PR}.5"
+PR = "${INC_PR}.6"
 
 SRC_URI += "file://mount.blacklist \
 	    file://run.rules \
@@ -73,6 +73,7 @@ do_install () {
 
 	touch ${D}${sysconfdir}/udev/saved.uname
 	touch ${D}${sysconfdir}/udev/saved.cmdline
+	touch ${D}${sysconfdir}/udev/saved.devices
 	touch ${D}${sysconfdir}/udev/saved.atags
 
 	install -d ${D}${sysconfdir}/udev/scripts/
diff --git a/recipes/udev/udev_151.bb b/recipes/udev/udev_151.bb
index 32ab909..393fcc7 100644
--- a/recipes/udev/udev_151.bb
+++ b/recipes/udev/udev_151.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
 the hotplug package and requires a kernel not older than 2.6.12."
 LICENSE = "GPLv2+"
 
-PR = "r23"
+PR = "r24"
 
 # Untested
 DEFAULT_PREFERENCE = "-1"
@@ -135,6 +135,7 @@ do_install () {
 
 	touch ${D}${sysconfdir}/udev/saved.uname
 	touch ${D}${sysconfdir}/udev/saved.cmdline
+	touch ${D}${sysconfdir}/udev/saved.devices
 	touch ${D}${sysconfdir}/udev/saved.atags
 
 	install -d ${D}${sysconfdir}/udev/scripts/
diff --git a/recipes/udev/udev_154.bb b/recipes/udev/udev_154.bb
index 4a358d3..44d7b13 100644
--- a/recipes/udev/udev_154.bb
+++ b/recipes/udev/udev_154.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
 the hotplug package and requires a kernel not older than 2.6.12."
 LICENSE = "GPLv2+"
 
-PR = "r7"
+PR = "r8"
 
 # Untested
 DEFAULT_PREFERENCE = "-1"
@@ -128,6 +128,7 @@ do_install () {
 
 	touch ${D}${sysconfdir}/udev/saved.uname
 	touch ${D}${sysconfdir}/udev/saved.cmdline
+	touch ${D}${sysconfdir}/udev/saved.devices
 	touch ${D}${sysconfdir}/udev/saved.atags
 
 	install -d ${D}${sysconfdir}/udev/scripts/
diff --git a/recipes/udev/udev_162.bb b/recipes/udev/udev_162.bb
index e344065..8f23f08 100644
--- a/recipes/udev/udev_162.bb
+++ b/recipes/udev/udev_162.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
 the hotplug package and requires a kernel not older than 2.6.12."
 LICENSE = "GPLv2+"
 
-PR = "r10"
+PR = "r11"
 
 # Untested
 #DEFAULT_PREFERENCE = "-1"
@@ -140,6 +140,7 @@ do_install () {
 
 	touch ${D}${sysconfdir}/udev/saved.uname
 	touch ${D}${sysconfdir}/udev/saved.cmdline
+	touch ${D}${sysconfdir}/udev/saved.devices
 	touch ${D}${sysconfdir}/udev/saved.atags
 
 	install -d ${D}${sysconfdir}/udev/scripts/
diff --git a/recipes/udev/udev_165.bb b/recipes/udev/udev_165.bb
index 55eccb0..1f57a46 100644
--- a/recipes/udev/udev_165.bb
+++ b/recipes/udev/udev_165.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
 the hotplug package and requires a kernel not older than 2.6.12."
 LICENSE = "GPLv2+"
 
-PR = "r1"
+PR = "r2"
 
 # Untested
 DEFAULT_PREFERENCE = "-1"
@@ -137,6 +137,7 @@ do_install () {
 
 	touch ${D}${sysconfdir}/udev/saved.uname
 	touch ${D}${sysconfdir}/udev/saved.cmdline
+	touch ${D}${sysconfdir}/udev/saved.devices
 	touch ${D}${sysconfdir}/udev/saved.atags
 
 	install -d ${D}${sysconfdir}/udev/scripts/
-- 
1.7.0.4



