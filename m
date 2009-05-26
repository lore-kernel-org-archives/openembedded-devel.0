Received: from [76.96.53.8] (helo=mq01.hmc1.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john@soundmetrics.com>) id 1M92uF-0003dW-S5
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 May 2009 22:05:52 +0200
Received: from omta01.westchester.pa.hmc1.comcast.net ([76.96.53.6])
	by mq01.hmc1.comcast.net with comcast
	id wGGK1b00B082Dic08KxACM; Tue, 26 May 2009 19:57:10 +0000
Received: from [192.168.10.129] ([75.147.191.205])
	by omta01.westchester.pa.hmc1.comcast.net with bizsmtp
	id wKxi1b0044SLwm306Kxix8; Tue, 26 May 2009 19:57:42 +0000
Message-ID: <4A1C49B6.5050108@soundmetrics.com>
Date: Tue, 26 May 2009 12:57:42 -0700
From: John Faith <john@soundmetrics.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.21) Gecko/20090303 SeaMonkey/1.1.15
	(Ubuntu-1.1.15+nobinonly-0ubuntu0.8.04.2)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] PowerVR init script
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
X-List-Received-Date: Tue, 26 May 2009 20:05:52 -0000
Content-Type: multipart/mixed; boundary="------------010506040808030309080405"

--------------010506040808030309080405
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,
Please review the attached patch which lets the PowerVR init script 
handle start, stop and restart.

Thanks,
John


--------------010506040808030309080405
Content-Type: text/x-diff;
 name="0001-OMAP35x-PowerVR-init-script-allow-start-stop-rest.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0001-OMAP35x-PowerVR-init-script-allow-start-stop-rest.patch"

From d57fb40126807a028f4dd66505c1739c77aa1e9b Mon Sep 17 00:00:00 2001
From: John Faith <jfaith@dr-laptop.(none)>
Date: Tue, 26 May 2009 11:53:39 -0700
Subject: [PATCH] OMAP35x PowerVR init script: allow start, stop, restart

Init scripts should handle start, stop and restart.  Also ignore stderr on
rmmod.

Signed-off-by: john@soundmetrics.com
---
 recipes/powervr-drivers/libgles-omap3/rc.pvr |   22 ++++++++++++++++++----
 1 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/recipes/powervr-drivers/libgles-omap3/rc.pvr b/recipes/powervr-drivers/libgles-omap3/rc.pvr
index 244f480..6964c7d 100755
--- a/recipes/powervr-drivers/libgles-omap3/rc.pvr
+++ b/recipes/powervr-drivers/libgles-omap3/rc.pvr
@@ -1,12 +1,26 @@
 #!/bin/sh
 
-#rmmod bc_example
-rmmod omaplfb
-rmmod pvrsrvkm
+if [ "$1" = "" ]; then
+	echo PVR-INIT: Please use start, stop, or restart.
+	exit 1
+fi
+
+if [ "$1" = "stop" -o  "$1" = "restart" ]; then
+	echo Stopping PVR
+	#rmmod bc_example
+	rmmod omaplfb 2>/dev/null
+	rmmod pvrsrvkm 2>/dev/null
+fi
+
+if [ "$1" = "stop" ]; then
+	exit 0
+fi
 
+echo Starting PVR
 insmod $(busybox find /lib/modules/$(uname -r) -name "pvrsrvkm.ko")
 #modprobe bc_example
-modprobe omaplfb
+#modprobe omaplfb
+insmod $(busybox find /lib/modules/$(uname -r) -name "omaplfb.ko")
 
 pvr_maj=`grep "pvrsrvkm$" /proc/devices | cut -b1,2,3`
 
-- 
1.5.4.3


--------------010506040808030309080405--
