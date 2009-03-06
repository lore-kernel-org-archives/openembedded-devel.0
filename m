Received: from [65.182.109.73] (helo=mta4.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1Lfgdc-0008WR-C8
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Mar 2009 21:27:20 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta4.brinkster.com (Postfix) with ESMTP id E9D2E5ED635
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Mar 2009 15:22:46 -0500 (EST)
X-Virus-Scanned: amavisd-new at 
X-Spam-Flag: NO
X-Spam-Score: 0.39
X-Spam-Level: 
X-Spam-Status: No, score=0.39 tagged_above=-10 required=5 tests=[AWL=-0.342,
	BAYES_00=-2.599, MSGID_MULTIPLE_AT=1.449, RCVD_IN_PBL=0.905,
	RCVD_IN_SORBS_DUL=0.877, RDNS_DYNAMIC=0.1]
Received: from mta4.brinkster.com ([127.0.0.1])
	by localhost (mta4.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27DtkqS4mh8O
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Mar 2009 15:22:46 -0500 (EST)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta4.brinkster.com (Postfix) with ESMTP id 7EA915ED2BD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Mar 2009 15:22:45 -0500 (EST)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 6 Mar 2009 20:22:15 -0000
Message-ID: <036901c99e99$3ee48b80$bcada280$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcmemT1I8KA993NoSbeNeYXT6A0j6Q==
Subject: [PATCH] Update libgles-omap3 packages to use a cleaned up init script.
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
X-List-Received-Date: Fri, 06 Mar 2009 20:27:20 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

Update to libgles-omap3 init script to respect stop/start/restart etc.

Signed-off-by: David-John Willis <John.Willis@Distant-earth.com>
---
 packages/powervr-drivers/libgles-omap3/rc.pvr      |   72
+++++++++++++++----
 .../powervr-drivers/libgles-omap3_3.00.00.01.bb    |    2 +-
 .../powervr-drivers/libgles-omap3_3.00.00.05.bb    |    2 +-
 .../powervr-drivers/libgles-omap3_3.00.00.06.bb    |    2 +-
 4 files changed, 60 insertions(+), 18 deletions(-)
 mode change 100644 => 100755
packages/powervr-drivers/libgles-omap3_3.00.00.01.bb
 mode change 100644 => 100755
packages/powervr-drivers/libgles-omap3_3.00.00.05.bb

diff --git a/packages/powervr-drivers/libgles-omap3/rc.pvr
b/packages/powervr-drivers/libgles-omap3/rc.pvr
index 244f480..83c4414 100755
--- a/packages/powervr-drivers/libgles-omap3/rc.pvr
+++ b/packages/powervr-drivers/libgles-omap3/rc.pvr
@@ -1,24 +1,66 @@
 #!/bin/sh
 
-#rmmod bc_example
-rmmod omaplfb
-rmmod pvrsrvkm
+DESC="SGX driver"
+NAME="PVRSRV"
 
-insmod $(busybox find /lib/modules/$(uname -r) -name "pvrsrvkm.ko")
-#modprobe bc_example
-modprobe omaplfb
 
-pvr_maj=`grep "pvrsrvkm$" /proc/devices | cut -b1,2,3`
+d_stop() {
+	if [ -e /dev/pvrsrvkm ] ; then 
+		rm -f /dev/pvrsrvkm
+	fi
 
-if [ -e /dev/pvrsrvkm ] ; then 
-	rm -f /dev/pvrsrvkm
-fi
+	if `grep -q pvrsrv /proc/modules` ; then
+		#rmmod bc_example
+		rmmod omaplfb
+		rmmod pvrsrvkm
+	fi
+}
 
-mknod /dev/pvrsrvkm c $pvr_maj 0 
-chmod 666 /dev/pvrsrvkm
+d_start() {
+	if `grep -q pvrsrv /proc/modules` ; then
+		echo " ... already started."
+		exit 1
+	fi
 
-/usr/bin/pvrsrvinit
+	insmod $(busybox find /lib/modules/$(uname -r) -name "pvrsrvkm.ko")
+	#modprobe bc_example
+	modprobe omaplfb
 
-# Set SGX to full speed
-devmem2 0x48004b40 w 0
+	pvr_maj=`grep "pvrsrvkm$" /proc/devices | cut -b1,2,3`
 
+	mknod /dev/pvrsrvkm c $pvr_maj 0 
+	chmod 666 /dev/pvrsrvkm
+
+	/usr/bin/pvrsrvinit
+
+	# Set SGX to full speed
+	# Temp fix to OMAP clocks are sorted.
+	devmem2 0x48004b40 w 0
+}
+
+
+case "$1" in
+  start)
+	echo -n "Starting $DESC: $NAME"
+	d_start
+	echo "."
+	;;
+  stop)
+	echo -n "Stopping $DESC: $NAME"
+	d_stop
+	echo "."
+	;;
+  restart|force-reload)
+	echo -n "Restarting $DESC: $NAME"
+	d_stop
+	sleep 1
+	d_start
+	echo "."
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart|force-reload}" >&2
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/packages/powervr-drivers/libgles-omap3_3.00.00.01.bb
b/packages/powervr-drivers/libgles-omap3_3.00.00.01.bb
old mode 100644
new mode 100755
index 1f7adfe..70094a7
--- a/packages/powervr-drivers/libgles-omap3_3.00.00.01.bb
+++ b/packages/powervr-drivers/libgles-omap3_3.00.00.01.bb
@@ -2,7 +2,7 @@ require libgles-omap3.inc
 
 SGXPV = "3_00_00_01"
 
-PR = "r7"
+PR = "r8"
 
 # Quality control is really poor on these SDKs, so hack around the latest
madness:
 FILES_${PN} += "${libdir}/*.so"
diff --git a/packages/powervr-drivers/libgles-omap3_3.00.00.05.bb
b/packages/powervr-drivers/libgles-omap3_3.00.00.05.bb
old mode 100644
new mode 100755
index 814ca04..da3e970
--- a/packages/powervr-drivers/libgles-omap3_3.00.00.05.bb
+++ b/packages/powervr-drivers/libgles-omap3_3.00.00.05.bb
@@ -2,7 +2,7 @@ require libgles-omap3.inc
 
 # Not released yet
 DEFAULT_PREFERENCE = "-1"
-PR = "r3"
+PR = "r4"
 
 SGXPV = "3_00_00_05"
 IMGPV = "1.2.12.838"
diff --git a/packages/powervr-drivers/libgles-omap3_3.00.00.06.bb
b/packages/powervr-drivers/libgles-omap3_3.00.00.06.bb
index cc8ddca..6484d23 100755
--- a/packages/powervr-drivers/libgles-omap3_3.00.00.06.bb
+++ b/packages/powervr-drivers/libgles-omap3_3.00.00.06.bb
@@ -2,7 +2,7 @@ require libgles-omap3.inc
 
 # Not released yet
 #DEFAULT_PREFERENCE = "-1"
-PR = "r7"
+PR = "r8"
 
 SGXPV = "3_00_00_06"
 IMGPV = "1.3.13.1397"
-- 
1.6.0.5





