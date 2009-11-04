Received: from [131.111.8.130] (helo=ppsw-0.csi.cam.ac.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jic23@cam.ac.uk>) id 1N5lv7-0005Tt-GQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 20:53:32 +0100
X-Cam-AntiVirus: no malware found
X-Cam-SpamDetails: not scanned
X-Cam-ScannerInfo: http://www.cam.ac.uk/cs/email/scanner/
Received: from arcturus.eng.cam.ac.uk ([129.169.154.73]:50610)
	by ppsw-0.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.150]:25)
	with esmtpsa (PLAIN:jic23) (TLSv1:DHE-RSA-AES256-SHA:256)
	id 1N5lty-00041p-2H (Exim 4.70) for
	openembedded-devel@lists.openembedded.org
	(return-path <jic23@cam.ac.uk>); Wed, 04 Nov 2009 19:52:18 +0000
Message-ID: <4AF1DB8C.7030204@cam.ac.uk>
Date: Wed, 04 Nov 2009 19:52:44 +0000
From: Jonathan Cameron <jic23@cam.ac.uk>
User-Agent: Thunderbird 2.0.0.23 (X11/20091029)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.96.0
X-SA-Exim-Connect-IP: 131.111.8.130
X-SA-Exim-Mail-From: jic23@cam.ac.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] IMote2 specific udev config
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
X-List-Received-Date: Wed, 04 Nov 2009 19:53:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Signed-off-by: Jonathan Cameron <jic23@cam.ac.uk>
---
local.rules adds some rules relevant to IIO subsystem for this
board (ensures consistent naming of certain character devices)

the init is required to up the number of inodes and avoid udev
falling over due to running out.

 recipes/udev/udev-141/imote2/init        |   81 ++++++++++++++++++++++++++++++
 recipes/udev/udev-141/imote2/local.rules |   45 ++++++++++++++++
 2 files changed, 126 insertions(+), 0 deletions(-)

diff --git a/recipes/udev/udev-141/imote2/init b/recipes/udev/udev-141/imote2/init
new file mode 100644
index 0000000..0599ee0
--- /dev/null
+++ b/recipes/udev/udev-141/imote2/init
@@ -0,0 +1,81 @@
+#!/bin/sh -e
+
+### BEGIN INIT INFO
+# Provides:          udev
+# Required-Start:    mountvirtfs
+# Required-Stop:     
+# Default-Start:     S
+# Default-Stop:
+# Short-Description: Start udevd, populate /dev and load drivers.
+### END INIT INFO
+
+export TZ=/etc/localtime
+
+[ -d /sys/class ] || exit 1
+[ -r /proc/mounts ] || exit 1
+[ -x /sbin/udevd ] || exit 1
+[ -f /etc/default/udev ] && . /etc/default/udev
+[ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
+
+kill_udevd() {
+        if [ -x /sbin/pidof ]; then
+                pid=`/sbin/pidof -x udevd`
+                [ -n "$pid" ] && kill $pid
+        fi
+}
+
+export ACTION=add
+# propagate /dev from /sys
+echo "Starting udev"
+
+# mount the tmpfs on /dev, if not already done
+LANG=C awk "\$2 == \"/dev\" && \$4 == \"tmpfs\" { exit 1 }" /proc/mounts && {
+        mount -n -o mode=0755,nr_inodes=7454 -t tmpfs none "/dev"
+        mkdir -m 0755 /dev/pts
+        mkdir -m 1777 /dev/shm
+}
+
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
+fi
+
+# make_extra_nodes
+kill_udevd > "/dev/null" 2>&1
+
+        # trigger the sorted events
+        echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
+        /sbin/udevd -d
+
+        /sbin/udevadm control --env STARTUP=1
+		if [ "$not_first_boot" != "" ];then
+			/sbin/udevadm trigger --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics  --subsystem-nomatch=backlight --subsystem-nomatch=video4linux  --subsystem-nomatch=platform
+			(/sbin/udevadm settle --timeout=3; /sbin/udevadm control --env STARTUP=)&
+			if [ "$DEVCACHE" != "" ]; then
+				rm -f /tmp/uname
+				rm -f /tmp/cmdline
+				rm -f /tmp/atags
+			fi
+		else
+			/sbin/udevadm trigger
+			/sbin/udevadm settle
+			if [ "$DEVCACHE" != "" ]; then
+				echo -n "Populating dev cache"
+				(cd /; tar cf $DEVCACHE dev)
+				mv /tmp/uname /etc/udev/saved.uname
+				mv /tmp/cmdline /etc/udev/saved.cmdline
+				mv /tmp/atags /etc/udev/saved.atags
+				echo
+			fi
+		fi
+
+exit 0
diff --git a/recipes/udev/udev-141/imote2/local.rules b/recipes/udev/udev-141/imote2/local.rules
new file mode 100644
index 0000000..241156b
--- /dev/null
+++ b/recipes/udev/udev-141/imote2/local.rules
@@ -0,0 +1,45 @@
+# There are a number of modifiers that are allowed to be used in some
+# of the different fields. They provide the following subsitutions:
+#
+# %n the "kernel number" of the device.
+#    For example, 'sda3' has a "kernel number" of '3'
+# %e the smallest number for that name which does not matches an existing node
+# %k the kernel name for the device
+# %M the kernel major number for the device
+# %m the kernel minor number for the device
+# %b the bus id for the device
+# %c the string returned by the PROGRAM
+# %s{filename} the content of a sysfs attribute
+# %% the '%' char itself
+#
+
+# Media automounting
+SUBSYSTEM=="block", ACTION=="add"    RUN+="/etc/udev/scripts/mount.sh"
+SUBSYSTEM=="block", ACTION=="remove" RUN+="/etc/udev/scripts/mount.sh"
+
+# Handle network interface setup
+SUBSYSTEM=="net", ACTION=="add" RUN+="/etc/udev/scripts/network.sh"
+SUBSYSTEM=="net", ACTION=="remove" RUN+="/etc/udev/scripts/network.sh"
+
+# The first rtc device is symlinked to /dev/rtc
+KERNEL=="rtc0", SYMLINK+="rtc"
+
+#The first framebuffer is symlinked to /dev/fb
+KERNEL=="fb0",  SYMLINK+="fb"
+
+# Try and modprobe for drivers for new hardware
+ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe $env{MODALIAS}"
+
+# Create a symlink to any touchscreen input device
+SUBSYSTEM=="input", KERNEL=="event[0-9]*", SYSFS{modalias}=="input:*-e0*,3,*a0,1,*18,*", SYMLINK+="input/touchscreen0"
+SUBSYSTEM=="input", KERNEL=="event[0-9]*", SYSFS{modalias}=="ads7846", SYMLINK+="input/touchscreen0"
+
+KERNEL=="ring_event_line*", ID=="0-0034", NAME="iio/max1363_ring_event"
+KERNEL=="ring_access*", ID=="0-0034", NAME="iio/max1363_ring_access"
+
+KERNEL=="ring_event_line*", ID=="spi1.0", DRIVER=="lis3l02dq", NAME="iio/lis3l02dq_ring_event"
+KERNEL=="event_line*", ID=="spi1.0", DRIVER=="lis3l02dq", NAME="iio/lis3l02dq_event"
+KERNEL=="ring_access*", ID=="spi1.0", DRIVER=="lis3l02dq", NAME="iio/lis3l02dq_ring_access"
+
+KERNEL=="ring_event_line*", ID=="0-0035", NAME="iio/max1239_ring_event"
+KERNEL=="ring_access*", ID=="0-0035", NAME="iio/max1239_ring_access"
-- 
1.6.0.4



