Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 278B7609BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 00:22:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8N0MWVO014900
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Sep 2014 17:22:33 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 22 Sep 2014 17:22:32 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 22 Sep 2014 17:22:32 -0700
Message-ID: <1411431752-32118-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] multipath-tools: update to version 0.5.0+
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Sep 2014 00:22:39 -0000
Content-Type: text/plain

SCRREV includes patches up to 9/12/2014.

Modify upstream source to be better set up for
cross compilation.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../files/always-use-libdevmapper-kpartx.patch     |   29 ++++
 .../files/always-use-libdevmapper.patch            |   44 ++++++
 .../multipath-tools/files/makefile_inc.patch       |   36 +++++
 .../multipath-tools/files/multipathd.oe            |  146 ++++++++++++++++++++
 .../multipath-tools/multipath-tools_git.bb         |   58 +++++++--
 5 files changed, 304 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper-kpartx.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/makefile_inc.patch
 create mode 100755 meta-oe/recipes-support/multipath-tools/files/multipathd.oe

diff --git a/meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper-kpartx.patch b/meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper-kpartx.patch
new file mode 100644
index 0000000..a16a854
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper-kpartx.patch
@@ -0,0 +1,29 @@
+Always use devmapper for kpartx
+
+Do not try to compute the LIBDM_API_COOKIE make variable
+from host information when cross-compiling.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+diff --git a/kpartx/Makefile b/kpartx/Makefile
+index 2a07334..24bdabc 100644
+--- a/kpartx/Makefile
++++ b/kpartx/Makefile
+@@ -4,13 +4,7 @@
+ #
+ include ../Makefile.inc
+ 
+-CFLAGS += -I. -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
+-
+-LIBDM_API_COOKIE = $(shell grep -Ecs '^[a-z]*[[:space:]]+dm_task_set_cookie' /usr/include/libdevmapper.h)
+-
+-ifneq ($(strip $(LIBDM_API_COOKIE)),0)
+-	CFLAGS += -DLIBDM_API_COOKIE
+-endif
++CFLAGS += -I. -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DLIBDM_API_COOKIE
+ 
+ LDFLAGS = -ldevmapper
+ OBJS = bsd.o dos.o kpartx.o solaris.o unixware.o dasd.o sun.o \
diff --git a/meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper.patch b/meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper.patch
new file mode 100644
index 0000000..89d2352
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper.patch
@@ -0,0 +1,44 @@
+Always use devmapper
+
+Do not try to compute several _API_ make variables
+from host information when cross-compiling.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+diff --git a/libmultipath/Makefile b/libmultipath/Makefile
+index e5b06b3..efd6cf6 100644
+--- a/libmultipath/Makefile
++++ b/libmultipath/Makefile
+@@ -17,23 +17,18 @@ OBJS = memory.o parser.o vector.o devmapper.o \
+        log.o configure.o structs_vec.o sysfs.o prio.o checkers.o \
+        lock.o waiter.o file.o wwids.o
+ 
+-LIBDM_API_FLUSH = $(shell grep -Ecs '^[a-z]*[[:space:]]+dm_task_no_flush' /usr/include/libdevmapper.h)
+ 
+-ifneq ($(strip $(LIBDM_API_FLUSH)),0)
++#ifneq ($(strip $(LIBDM_API_FLUSH)),0)
+ 	CFLAGS += -DLIBDM_API_FLUSH -D_GNU_SOURCE
+-endif
++#endif
+ 
+-LIBDM_API_COOKIE = $(shell grep -Ecs '^[a-z]*[[:space:]]+dm_task_set_cookie' /usr/include/libdevmapper.h)
+-
+-ifneq ($(strip $(LIBDM_API_COOKIE)),0)
++#ifneq ($(strip $(LIBDM_API_COOKIE)),0)
+ 	CFLAGS += -DLIBDM_API_COOKIE
+-endif
+-
+-LIBUDEV_API_RECVBUF = $(shell grep -Ecs '^[a-z]*[[:space:]]+udev_monitor_set_resolve_buffer_size' /usr/include/libudev.h)
++#endif
+ 
+-ifneq ($(strip $(LIBUDEV_API_RECVBUF)),0)
++#ifneq ($(strip $(LIBUDEV_API_RECVBUF)),0)
+ 	CFLAGS += -DLIBUDEV_API_RECVBUF
+-endif
++#endif
+ 
+ 
+ all: $(LIBS)
diff --git a/meta-oe/recipes-support/multipath-tools/files/makefile_inc.patch b/meta-oe/recipes-support/multipath-tools/files/makefile_inc.patch
new file mode 100644
index 0000000..ff71f39
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/makefile_inc.patch
@@ -0,0 +1,36 @@
+multipath-tools: modify Makefile.inc for cross-compilation
+
+Do not look for systemd info on the host, and allow us to pass in CFLAGS
+using the OPTFLAGS variable.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+--- a/Makefile.inc
++++ b/Makefile.inc
+@@ -21,12 +21,6 @@ ifndef LIB
+ 	endif
+ endif
+ 
+-ifndef SYSTEMD
+-	ifeq ($(shell systemctl --version > /dev/null 2>&1 && echo 1), 1)
+-		SYSTEMD = $(shell systemctl --version 2> /dev/null |  sed -n 's/systemd \([0-9]*\)/\1/p')
+-	endif
+-endif
+-
+ prefix      = 
+ exec_prefix = $(prefix)
+ bindir      = $(exec_prefix)/sbin
+@@ -49,7 +43,10 @@ ifndef RPM_OPT_FLAGS
+ 	RPM_OPT_FLAGS = -O2 -g -pipe -Wformat-security -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4
+ endif
+ 
++ifndef OPTFLAGS
+ OPTFLAGS     = $(RPM_OPT_FLAGS) -Wunused -Wstrict-prototypes
++endif
++
+ CFLAGS	     = $(OPTFLAGS) -fPIC -DLIB_STRING=\"${LIB}\"
+ SHARED_FLAGS = -shared
+ 
diff --git a/meta-oe/recipes-support/multipath-tools/files/multipathd.oe b/meta-oe/recipes-support/multipath-tools/files/multipathd.oe
new file mode 100755
index 0000000..3bdf875
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/multipathd.oe
@@ -0,0 +1,146 @@
+#!/bin/bash
+#
+# multipathd	Starts the multipath daemon
+#
+# chkconfig: - 06 87
+# description: Manages device-mapper multipath devices
+
+### BEGIN INIT INFO
+# Provides: multipathd
+# Required-Start:
+# Required-Stop:
+# Default-Start:
+# Default-Stop:
+# Short-Description: Control multipathd
+# Description: This service monitors and manages
+#              device-mapper multipath devices
+### END INIT INFO
+
+DAEMON=/sbin/multipathd
+prog=`basename $DAEMON`
+initdir=/etc/init.d
+lockdir=/var/lock/subsys
+sysconfig=/etc/sysconfig
+syspath=/sys/block
+
+RETVAL=0
+
+teardown_slaves()
+{
+pushd $1 > /dev/null
+if [ -d "slaves" ]; then
+for slave in slaves/*;
+do
+	if [ "$slave" = "slaves/*" ]; then
+		read dev <  $1/dev
+		tablename=`dmsetup table --target multipath | sed -n "s/\(.*\): .* $dev .*/\1/p"`
+		if ! [ -z $tablename ]; then
+			echo "Root is on a multipathed device, multipathd can not be stopped"
+			exit 1
+		fi
+	else
+		local_slave=`readlink -f $slave`;
+		teardown_slaves $local_slave;
+	fi
+	done
+
+else
+		read dev <  $1/dev
+		tablename=`dmsetup table --target multipath | sed -n "s/\(.*\): .* $dev .*/\1/p"`
+		if ! [ -z $tablename ]; then
+			echo "Root is on a multipathed device, multipathd can not be stopped"
+			exit 1
+		fi
+fi
+popd > /dev/null
+}
+
+#
+# See how we were called.
+#
+
+start() {
+	test -x $DAEMON || exit 5
+	echo -n $"Starting $prog daemon: "
+	start-stop-daemon --start --quiet --exec $DAEMON
+	RETVAL=$?
+	[ $RETVAL -eq 0 ] && touch $lockdir/$prog
+	echo
+}
+
+force_stop() {
+	echo -n $"Stopping $prog daemon: "
+	killall $DAEMON
+	RETVAL=$?
+	[ $RETVAL -eq 0 ] && rm -f $lockdir/$prog
+	echo
+}
+
+stop() {
+        root_dev=$(awk '{ if ($1 !~ /^[ \t]*#/ && $2 == "/") { print $1; }}' /etc/mtab)
+	dm_num=`dmsetup info -c --noheadings -o minor $root_dev 2> /dev/null`
+	if [ $? -eq 0 ]; then
+		root_dm_device="dm-$dm_num"
+		[ -d $syspath/$root_dm_device ] && teardown_slaves $syspath/$root_dm_device
+	fi
+
+	force_stop
+}
+
+restart() {
+	stop
+	start
+}
+
+force_restart() {
+	force_stop
+	start
+}
+
+reload() {
+	echo -n "Reloading $prog: "
+	trap "" SIGHUP
+	killall $DAEMON -s SIGHUP -v
+	RETVAL=$?
+	echo
+}	
+
+case "$1" in
+start)
+	start
+	;;
+stop)
+	stop
+	;;
+force-stop)
+	force_stop
+	;;
+force-reload|reload)
+	reload
+	;;
+restart)
+	restart
+	;;
+force-restart)
+	force_restart
+	;;
+condrestart|try-restart)
+	if [ -f $lockdir/$prog ]; then
+	    restart
+	fi
+	;;
+status)
+    if pidof -o %PPID $DAEMON > /dev/null; then
+        echo "Running"
+        RETVAL=0
+    else
+        echo "Not running"
+        RETVAL=1
+    fi
+	;;
+*)
+	echo $"Usage: $0 {start|stop|force-stop|status|restart|force-restart|condrestart|reload}"
+	RETVAL=2
+esac
+
+exit $RETVAL
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
index 038f4e2..055cfe6 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
@@ -1,30 +1,70 @@
 SUMMARY = "The upstream project used to drive the Device Mapper multipathing driver"
 
-DEPENDS = "lvm2 libaio readline"
+DEPENDS = "lvm2 libaio readline udev"
 
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7be2873b6270e45abacc503abbe2aa3d"
+LICENSE = "LGPLv2"
 
+SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http \
+           file://multipathd.oe \
+           file://makefile_inc.patch \
+           file://always-use-libdevmapper.patch \
+           file://always-use-libdevmapper-kpartx.patch \
+           "
+# 0.5.0
+#
+#SRCREV = "82f391e787dc02e9d9294aa391137ab424bb83c4"
+#LIC_FILES_CHKSUM = "file://COPYING;md5=7be2873b6270e45abacc503abbe2aa3d"
+
+# 0.5.0 + commits thru 7/18/2014
+#
+#SRCREV = "0d72f46c12207a6b7b89f5ef4f5ab5f87ed8bc90"
+#LIC_FILES_CHKSUM = "file://COPYING;md5=b06690e7a95c166eefe0199b39118eb1"
+
+# 0.5.0 + commits thru 9/12/2014
+#
+#    includes important systemd related structure size fix
+#
+SRCREV = "aec68ab217fd2956443b27ceeb97dd6475267789"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b06690e7a95c166eefe0199b39118eb1"
+
+inherit systemd
 
-SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http"
-SRCREV = "15fc23ffb2bd1bac6990eda3e23c3e8980e6cfa5"
 
 S = "${WORKDIR}/git"
 
-PV = "0.4.9+git"
+PV = "0.5.0+git${@'${SRCPV}'.split('+')[-1]}"
 
-EXTRA_OEMAKE = "MULTIPATH_VERSION=${PV} DESTDIR=${D} syslibdir=${base_libdir} libdir=${base_libdir}/multipath"
+# The exact version of SYSTEMD does not matter but should be greater than 209.
+#
+EXTRA_OEMAKE = 'MULTIPATH_VERSION=${PV} DESTDIR=${D} syslibdir=${base_libdir} \
+                OPTFLAGS="${CFLAGS}" \
+                LIB=${base_libdir} libdir=${base_libdir}/multipath \
+                unitdir=/lib/systemd/system \
+                ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "SYSTEMD=216", "", d)} \
+               '
 
 do_install() {
     oe_runmake install
+
+    # Copy a sample conf file, but do not rename it multipath.conf.
+    #
+    cp multipath.conf.defaults ${D}${sysconfdir}
+
+    # We copy an initscript, but do not start multipathd at init time.
+    #
+    cp ${WORKDIR}/multipathd.oe ${D}${sysconfdir}/init.d/multipathd
+
 }
 
 FILES_${PN}-dbg += "${base_libdir}/multipath/.debug"
+
+# systemd and udev stuff always goes under /lib!
+#
 FILES_${PN} += "${base_libdir}/multipath \
-                ${base_libdir}/systemd"
+                /lib/systemd"
 
 PACKAGES =+ "kpartx"
 FILES_kpartx = "${base_sbindir}/kpartx \
-                ${base_libdir}/udev/kpartx_id"
+                /lib/udev/kpartx_id"
 
 RDEPENDS_${PN} += "kpartx"
-- 
1.7.3.4


