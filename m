Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LwoyT-0000gZ-6n
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 04:47:41 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KIJ002VK8VRC5E8@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	22 Apr 2009 21:43:04 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 912016B83B5; Wed,
	22 Apr 2009 22:43:02 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Apr 2009 22:43:02 -0400
Message-id: <1240454582-32353-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.0.6
Subject: [PATCHv2] udev 124: add cache invalidation logic on kernel change or its bootargs/cmdline/atags
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
X-List-Received-Date: Thu, 23 Apr 2009 02:47:43 -0000

also add /etc/default/udev with the option to disable device caching

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 recipes/udev/udev-124/default |    4 ++++
 recipes/udev/udev-124/init    |   29 +++++++++++++++++++++++++----
 recipes/udev/udev_124.bb      |   10 +++++++++-
 3 files changed, 38 insertions(+), 5 deletions(-)
 create mode 100644 recipes/udev/udev-124/default

diff --git a/recipes/udev/udev-124/default b/recipes/udev/udev-124/default
new file mode 100644
index 0000000..5c4937a
--- /dev/null
+++ b/recipes/udev/udev-124/default
@@ -0,0 +1,4 @@
+# Default for /etc/init.d/udev
+
+# Comment this out to disable device cache
+DEVCACHE="/etc/dev.tar"
diff --git a/recipes/udev/udev-124/init b/recipes/udev/udev-124/init
index 9e11f08..efe4470 100644
--- a/recipes/udev/udev-124/init
+++ b/recipes/udev/udev-124/init
@@ -14,6 +14,7 @@ export TZ=/etc/localtime
 [ -d /sys/class ] || exit 1
 [ -r /proc/mounts ] || exit 1
 [ -x /sbin/udevd ] || exit 1
+[ -f /etc/default/udev ] && . /etc/default/udev
 [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
 
 kill_udevd() {
@@ -34,9 +35,18 @@ LANG=C awk "\$2 == \"/dev\" && \$4 == \"tmpfs\" { exit 1 }" /proc/mounts && {
         mkdir -m 0755 /dev/shm
 }
 
-if [ -e /etc/dev.tar ]; then
-	(cd /; tar xf /etc/dev.tar)
-	not_first_boot=1
+if [ "$DEVCACHE" != "" ]; then
+	# Invalidate udev cache if the kernel or its bootargs/cmdline have changed
+	[ -x /bin/uname ] && /bin/uname -mrspv > /tmp/uname || touch /tmp/uname
+	[ -r /proc/cmdline ] && cat /proc/cmdline > /tmp/cmdline || touch /tmp/cmdline
+	[ -r /proc/atags ] && cat /proc/atags > /tmp/atags || touch /tmp/atags
+	if [ -e $DEVCACHE ] && \
+	   cmp -s /tmp/uname /etc/udev/saved.uname && \
+	   cmp -s /tmp/cmdline /etc/udev/saved.cmdline && \
+	   cmp -s /tmp/atags /etc/udev/saved.atags; then
+		(cd /; tar xf $DEVCACHE)
+		not_first_boot=1
+	fi
 fi
 
 # make_extra_nodes
@@ -50,10 +60,21 @@ kill_udevd > "/dev/null" 2>&1
 		if [ "$not_first_boot" != "" ];then
 			/sbin/udevadm trigger --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics  --subsystem-nomatch=backlight --subsystem-nomatch=video4linux  --subsystem-nomatch=platform
 			(/sbin/udevadm settle --timeout=3; /sbin/udevadm control env STARTUP=)&
+			if [ "$DEVCACHE" != "" ]; then
+				rm -f /tmp/uname
+				rm -f /tmp/cmdline
+				rm -f /tmp/atags
+			fi
 		else
 			/sbin/udevadm trigger
 			/sbin/udevadm settle
-			(cd /; tar cf /etc/dev.tar dev)
+			if [ "$DEVCACHE" != "" ]; then
+				echo -n " and populating dev cache"
+				(cd /; tar cf $DEVCACHE dev)
+				mv /tmp/uname /etc/udev/saved.uname
+				mv /tmp/cmdline /etc/udev/saved.cmdline
+				mv /tmp/atags /etc/udev/saved.atags
+			fi
 		fi
 
 echo
diff --git a/recipes/udev/udev_124.bb b/recipes/udev/udev_124.bb
index 37dc3a7..e5d9d73 100644
--- a/recipes/udev/udev_124.bb
+++ b/recipes/udev/udev_124.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
 /dev/, handles hotplug events and loads drivers at boot time. It replaces \
 the hotplug package and requires a kernel not older than 2.6.12."
 RPROVIDES_${PN} = "hotplug"
-PR = "r15"
+PR = "r16"
 
 SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
 	   file://noasmlinkage.patch;patch=1 \
@@ -12,6 +12,7 @@ SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
 	   file://libvolume-id-soname.patch;patch=1 \
 	   file://mount.blacklist \
 	   file://run.rules \
+	   file://default \
 	   "
 
 SRC_URI_append_h2200 = " file://50-hostap_cs.rules "
@@ -33,6 +34,9 @@ do_install () {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
 
+	install -d ${D}${sysconfdir}/default
+	install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/udev
+
 	install -d ${D}${sysconfdir}/udev/rules.d/
 
 	install -m 0644 ${WORKDIR}/mount.blacklist     ${D}${sysconfdir}/udev/
@@ -45,6 +49,10 @@ do_install () {
 		install -m 0644 ${WORKDIR}/devfs-udev.rules ${D}${sysconfdir}/udev/rules.d/devfs-udev.rules
 	fi
 
+	touch ${D}${sysconfdir}/udev/saved.uname
+	touch ${D}${sysconfdir}/udev/saved.cmdline
+	touch ${D}${sysconfdir}/udev/saved.atags
+
 	install -d ${D}${sysconfdir}/udev/scripts/
 
 	install -m 0755 ${WORKDIR}/mount.sh ${D}${sysconfdir}/udev/scripts/mount.sh
-- 
1.6.0.6



