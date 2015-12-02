Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ADC59601D3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Dec 2015 10:03:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tB2A3Amb006228
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 2 Dec 2015 02:03:10 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 2 Dec 2015 02:03:11 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Dec 2015 17:51:40 +0800
Message-ID: <1449049900-1248-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] edac-utils: add patches for initscript
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Dec 2015 10:03:11 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update LIC_FILES_CHKSUM that the whole license file should be used
rather than the first 2 lines.

Remove COMPATIBLE_HOST that edac-utils could build for all architectures.

Update runtime dependencies:

* add perl modules that edac-ctl needs
* add dmidecode for the archs which are in COMPATIBLE_HOST of dmidecode
  that dmidecode is required by command edac-ctl.

And add patches for initscripts to:

* add restart subcommand
* make init script be able to load EDAC module automatically

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-support/edac-utils/edac-utils_git.bb   | 19 +++--
 .../files/add-restart-to-initscript.patch          | 33 ++++++++
 ...cript-be-able-to-automatically-load-EDAC-.patch | 98 ++++++++++++++++++++++
 3 files changed, 145 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-support/edac-utils/files/add-restart-to-initscript.patch
 create mode 100644 meta-oe/recipes-support/edac-utils/files/make-init-script-be-able-to-automatically-load-EDAC-.patch

diff --git a/meta-oe/recipes-support/edac-utils/edac-utils_git.bb b/meta-oe/recipes-support/edac-utils/edac-utils_git.bb
index e5621ad..9bd2f0a 100644
--- a/meta-oe/recipes-support/edac-utils/edac-utils_git.bb
+++ b/meta-oe/recipes-support/edac-utils/edac-utils_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Userspace helper for Linux kernel EDAC drivers"
 HOMEPAGE = "https://github.com/grondo/edac-utils"
 SECTION = "Applications/System"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;beginline=1;endline=2;md5=1fbd81241fe252ec0f5658a521ab7dd8"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = " sysfsutils"
 
@@ -11,7 +11,10 @@ PV = "0.16+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://github.com/grondo/edac-utils;protocol=http"
+SRC_URI = "git://github.com/grondo/edac-utils \
+    file://make-init-script-be-able-to-automatically-load-EDAC-.patch \
+    file://add-restart-to-initscript.patch \
+"
 
 inherit autotools-brokensep
 
@@ -20,6 +23,12 @@ do_configure_prepend () {
     ${S}/bootstrap
 }
 
-COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
-
-RDEPENDS_${PN} = " perl"
+RDEPENDS_${PN}_x86 = "dmidecode"
+RDEPENDS_${PN}_x86-64 = "dmidecode"
+RDEPENDS_${PN}_arm = "dmidecode"
+RDEPENDS_${PN}_aarch64 = "dmidecode"
+RDEPENDS_${PN}_powerpc = "dmidecode"
+RDEPENDS_${PN}_powerpc64 = "dmidecode"
+RDEPENDS_${PN}_append = " \
+    perl-module-file-basename perl-module-file-find perl-module-getopt-long perl-module-posix \
+"
diff --git a/meta-oe/recipes-support/edac-utils/files/add-restart-to-initscript.patch b/meta-oe/recipes-support/edac-utils/files/add-restart-to-initscript.patch
new file mode 100644
index 0000000..87051da
--- /dev/null
+++ b/meta-oe/recipes-support/edac-utils/files/add-restart-to-initscript.patch
@@ -0,0 +1,33 @@
+From 3ade837f64de0cfe2aed5bc52f7919760f350531 Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Fri, 7 Mar 2014 00:57:12 -0500
+Subject: [PATCH] edac: add restart to initscript
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ src/etc/edac.init.in |    6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/etc/edac.init.in b/src/etc/edac.init.in
+index adf76ee..007a519 100644
+--- a/src/etc/edac.init.in
++++ b/src/etc/edac.init.in
+@@ -155,8 +155,12 @@ case "$1" in
+   status)
+     service_status
+     ;;
++  restart)
++    service_stop
++    service_start
++    ;;
+   *)
+-    COMMANDS="start|stop|status"
++    COMMANDS="start|stop|status|restart"
+     echo "Usage: $0 {${COMMANDS}}"
+     exit 2
+     ;;
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-support/edac-utils/files/make-init-script-be-able-to-automatically-load-EDAC-.patch b/meta-oe/recipes-support/edac-utils/files/make-init-script-be-able-to-automatically-load-EDAC-.patch
new file mode 100644
index 0000000..fddc25f
--- /dev/null
+++ b/meta-oe/recipes-support/edac-utils/files/make-init-script-be-able-to-automatically-load-EDAC-.patch
@@ -0,0 +1,98 @@
+make init script be able to automatically load EDAC module.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ src/etc/edac.init.in |   49 +++++++++++++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 47 insertions(+), 2 deletions(-)
+
+diff --git a/src/etc/edac.init.in b/src/etc/edac.init.in
+index 7a51da9..5b568c4 100644
+--- a/src/etc/edac.init.in
++++ b/src/etc/edac.init.in
+@@ -42,7 +42,6 @@ for dir in "$sysconfdir/default" "$sysconfdir/sysconfig"; do
+   [ -f "$dir/$SERVICE" ] && . "$dir/$SERVICE"
+ done
+ 
+-
+ ###############################################################################
+ 
+ service_start ()
+@@ -52,6 +51,46 @@ service_start ()
+ # Assume that if EDAC_DRIVER is not set, then EDAC is configured
+ #  automatically, thus return successfully, but don't do anything.
+ #
++    if [ ! -f /etc/edac/edac-driver ]; then
++         [ -d /sys/bus/edac/devices/mc/mc0 ] && \
++         echo `lsmod | grep _edac | cut -d" " -f1` > /etc/edac/edac-driver
++    fi
++
++    [ -f /etc/edac/edac-driver ] && EDAC_DRIVER=`cat /etc/edac/edac-driver`
++
++    if [ -z "$EDAC_DRIVER" ]; then
++
++        DRIVER_PATH=/lib/modules/`uname -r`/kernel/drivers/edac
++        oldpath=`pwd`
++        if [ -d $DRIVER_PATH ]; then
++
++            cd $DRIVER_PATH
++
++            for i in $(/bin/ls | /usr/bin/cut -d. -f1) ; do
++                /sbin/modprobe $i 2>/dev/null
++                if [ -d /sys/bus/edac/devices/mc/mc0 ]; then
++                    echo $i> /etc/edac/edac-driver
++                    EDAC_DRIVER=$i
++                    break
++                fi
++                /sbin/modprobe -r $i 2>/dev/null
++            done
++
++            cd "$oldpath"
++
++
++            if [ -z "$EDAC_DRIVER" ]; then
++                echo "This board may not support EDAC, or EDAC module may not be compiled in"
++                exit
++            fi
++
++        else
++            echo "This board may not support EDAC, or EDAC module may not be compiled in"
++            exit
++        fi
++
++    fi
++
+   if [ -n "$EDAC_DRIVER" ]; then
+      echo -n "Starting ${SERVICE}: "
+      modprobe $EDAC_DRIVER
+@@ -76,12 +115,15 @@ service_start ()
+ service_stop ()
+ {
+   echo -n "Disabling ${SERVICE}: "
++
++  [ -f /etc/edac/edac-driver ] && EDAC_DRIVER=`cat /etc/edac/edac-driver`
++
+   if [ -n "$EDAC_DRIVER" ]; then
+     modprobe -r $EDAC_DRIVER
+     STATUS=$?
+     [ $STATUS -eq 0 ] && echo success || echo failure
+   else
+-    echo "Not supported for this configuration."
++    echo "Not supported for this configuration, or EDAC Module is not loaded."
+     STATUS=6
+   fi
+ }
+@@ -92,6 +134,9 @@ service_status ()
+ {
+ # Print the current status of the service.  Required by LSB.
+ #
++  [ -f /etc/edac/edac-driver ] && EDAC_DRIVER=`cat /etc/edac/edac-driver`
++  [ -z "$EDAC_DRIVER" ] && STATUS=1 && exit
++
+   edac-ctl --status
+   STATUS=0
+ }
+-- 
+1.7.10.4
+
-- 
2.6.1


