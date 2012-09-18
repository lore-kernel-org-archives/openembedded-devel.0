Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TDzor-0001Qw-UI
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 17:34:38 +0200
Received: by pbcwy7 with SMTP id wy7so193771pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 08:21:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=FjF/GjfhzfJCS0kbJ1btuJUC7nCA9BaoSt74Ao5EPig=;
	b=HOPmVz6hBs53Y1du2p17j8+5FxQu5hqXK17ChHLbYSPeIL0i9wCYUGG652hJ4nIYV7
	o2z+PaTdB2y/95AO67eYg2XtI2MtTfaVACGmI6MCUnoKmXooUSfmPX5YkbEoLno7BBfk
	wEDKVtCJcM9nlNbn2kHyQX59lJJH8Yx9AYxKFcF4Wp0zWCerpcuQrdZQh0oxM43gKNgI
	17xFJ5SZLO9c9ad3zL6oshXPyghsZkOKbekEq0zmms3h0Qqkgv8JSQLdajxnWFG/dAn8
	sA5bPbKoH0ZOVQjpd/ZyOoqC/VArQOKYLZjm+K7cLuvp6I+DNh4FGUcmekKcoU16Sth0
	hyrA==
Received: by 10.68.138.166 with SMTP id qr6mr236683pbb.69.1347981717069;
	Tue, 18 Sep 2012 08:21:57 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id pv9sm119983pbb.67.2012.09.18.08.21.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 08:21:56 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 18:21:45 +0300
Message-Id: <1347981706-22287-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQkWNY0QF2P/YeVPBzKPNRvP797nRtnrgXR1S7XBKaCxrM43rMWE0aC16hm6bnKCtz9I+pYk
Subject: [PATCH] zram: Integrate an init script
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
X-List-Received-Date: Tue, 18 Sep 2012 15:34:38 -0000

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta-oe/recipes-extended/zram/zram/init   |   85 +++++++++++++++++++++++++++++
 meta-oe/recipes-extended/zram/zram_0.1.bb |   23 ++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 meta-oe/recipes-extended/zram/zram/init
 create mode 100644 meta-oe/recipes-extended/zram/zram_0.1.bb

diff --git a/meta-oe/recipes-extended/zram/zram/init b/meta-oe/recipes-extended/zram/zram/init
new file mode 100644
index 0000000..d126169
--- /dev/null
+++ b/meta-oe/recipes-extended/zram/zram/init
@@ -0,0 +1,85 @@
+#!/bin/bash
+### BEGIN INIT INFO
+# Provides: zram
+# Required-Start:
+# Required-Stop:
+# Default-Start: 2 3 4 5
+# Default-Stop: 0 1 6
+# Short-Description: Increased Performance In Linux With zRam (Virtual Swap Compressed in RAM)
+# Description: Adapted from systemd scripts at https://github.com/mystilleef/FedoraZram
+# Included as part of antix-goodies package by anticapitalista <antiX@operamail.com>
+# This script was written by tradetaxfree and is found at http://crunchbanglinux.org/forums/topic/15344/zram-a-good-idea/
+# Copy this script (as root) from /usr/local/bin to /etc/init.d and then #update-rc.d zram defaults
+# After booting verify the module is loaded with: lsmod | grep zram
+### END INIT INFO
+set -e
+
+start() {
+    # get the number of CPUs
+    num_cpus=$(grep -c processor /proc/cpuinfo)
+    # if something goes wrong, assume we have 1
+    [ "$num_cpus" != 0 ] || num_cpus=1
+
+    # set decremented number of CPUs
+    last_cpu=$((num_cpus - 1))
+
+    #default Factor % = 90 change this value here or create /etc/default/zram
+    FACTOR=90
+    #& put the above single line in /etc/default/zram with the value you want
+    [ -f /etc/default/zram ] && source /etc/default/zram || true
+    factor=$FACTOR # percentage
+
+    # get the amount of memory in the machine
+    memtotal=$(grep MemTotal /proc/meminfo | awk ' { print $2 } ')
+    mem_by_cpu=$(($memtotal/$num_cpus*$factor/100*1024))
+
+    # load dependency modules
+    modprobe zram zram_num_devices=$num_cpus
+    echo "zram devices probed successfully"
+
+    # initialize the devices
+    for i in $(seq 0 $last_cpu); do
+    	echo 1 > /sys/block/zram$i/reset
+    	echo $mem_by_cpu > /sys/block/zram$i/disksize
+    	# Creating swap filesystems
+    	mkswap /dev/zram$i
+    	# Switch the swaps on
+    	swapon -p 100 /dev/zram$i
+    done
+}
+
+stop() {
+    # get the number of CPUs
+    num_cpus=$(grep -c processor /proc/cpuinfo)
+
+    # set decremented number of CPUs
+    last_cpu=$((num_cpus - 1))
+
+    # Switching off swap
+    for i in $(seq 0 $last_cpu); do
+    	if [ "$(grep /dev/zram$i /proc/swaps)" != "" ]; then
+    		swapoff /dev/zram$i
+    		sleep 1
+    	fi
+    done
+    sleep 1
+    rmmod zram
+}
+
+case "$1" in
+    start)
+        start
+        ;;
+    stop)
+        stop
+        ;;
+    restart)
+        stop
+        sleep 3
+        start
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart}"
+        RETVAL=1
+esac
+exit $RETVAL
diff --git a/meta-oe/recipes-extended/zram/zram_0.1.bb b/meta-oe/recipes-extended/zram/zram_0.1.bb
new file mode 100644
index 0000000..8526264
--- /dev/null
+++ b/meta-oe/recipes-extended/zram/zram_0.1.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Linux zram compressed in-memory swap"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+inherit allarch update-rc.d
+
+RDEPENDS_${PN} = "util-linux-swaponoff kmod kernel-module-zram"
+
+PR = "r0"
+
+SRC_URI = " \
+           file://init \
+          "
+
+do_install () {
+	# Sysvinit
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/zram
+}
+
+FILES_${PN} = "${sysconfdir}/init.d"
+INITSCRIPT_NAME = "zram"
+INITSCRIPT_PARAMS = "start 05 2 3 4 5 . stop 22 0 1 6 ."
-- 
1.7.9.5



