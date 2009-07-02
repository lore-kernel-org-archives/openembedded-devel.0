Received: from [65.55.116.28] (helo=blu0-omc1-s17.blu0.hotmail.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <phunge0@hotmail.com>) id 1MMN0j-0004CB-KJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jul 2009 16:11:38 +0200
Received: from BLU0-SMTP60 ([65.55.116.9]) by blu0-omc1-s17.blu0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 2 Jul 2009 06:59:33 -0700
X-Originating-IP: [71.167.240.36]
X-Originating-Email: [phunge0@hotmail.com]
Message-ID: <BLU0-SMTP60F861D06CC0BF029AFA6DFE2F0@phx.gbl>
Received: from [192.168.1.9] ([71.167.240.36]) by BLU0-SMTP60.blu0.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 2 Jul 2009 06:59:33 -0700
Date: Thu, 02 Jul 2009 09:59:28 -0400
From: Brian Bloniarz <phunge0@hotmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: philb@gnu.org, openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 02 Jul 2009 13:59:33.0357 (UTC)
	FILETIME=[53B209D0:01C9FB1D]
Subject: [RFC Patch] initscripts-1.0 checkroot: fix rootfs identification
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
X-List-Received-Date: Thu, 02 Jul 2009 14:11:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Phil, I had a question about the checkroot script from initscripts-1.0.

>ROOTFSDEV="/dev/root"
>if ! grep -q "^$ROOTFSDEV\w" /proc/mounts; then
>  ROOTFSDEV="rootfs"
>fi
>if [ x$(grep "^$ROOTFSDEV\w" /proc/mounts | awk '{print $4}') = "xrw" ]; then
>	echo "Root filesystem already read-write, not remounting"
>	exit 0
>fi

If this code is intended to look for the rootfs dev, I don't think \w (word
character) is right. grep "^/dev/root\w" doesn't match "/dev/root", it matches
stuff like "/dev/rootf". Was this intended?  It looks like this change was from
8f5f3f87a526b585717f3064a8db5a2e6ae849ec: "initscripts: tweak mtab reading in
checkroot.sh so that r/w ramdisk works on epia"

The following patch greps for \> instead (end of word). I also changed it
so that it doesn't hardcode the assumption that the rootfs is about to
be remounted read-write, in case the fstab has the root as RO.

Thanks for all your hard work on OpenEmbedded. Let me know if this sounds OK,
I'll resubmit with a changelog & Signed-off-by.

Thanks,
Brian Bloniarz

diff --git a/recipes/initscripts/initscripts-1.0/checkroot b/recipes/initscripts/initscripts-1.0/checkroot
index e5aa9aa..7ad00d0 100755
--- a/recipes/initscripts/initscripts-1.0/checkroot
+++ b/recipes/initscripts/initscripts-1.0/checkroot
@@ -182,6 +182,15 @@ else
   fi
 fi
 
+ROOTFSDEV="/dev/root"
+if ! grep -q "^$ROOTFSDEV\>" /proc/mounts; then
+  ROOTFSDEV="rootfs"
+fi
+if [ x$(grep "^$ROOTFSDEV\>" /proc/mounts | awk '{print $4}') = "x$rootmode" ]; then
+	echo "Root filesystem already $rootmode, not remounting"
+	exit 0
+fi
+
 #
 #	If the root filesystem was not marked as read-only in /etc/fstab,
 #	remount the rootfs rw but do not try to change mtab because it
@@ -189,15 +198,6 @@ fi
 #	and finally write the new mtab.
 #	This part is only needed if the rootfs was mounted ro.
 #
-ROOTFSDEV="/dev/root"
-if ! grep -q "^$ROOTFSDEV\w" /proc/mounts; then
-  ROOTFSDEV="rootfs"
-fi
-if [ x$(grep "^$ROOTFSDEV\w" /proc/mounts | awk '{print $4}') = "xrw" ]; then
-	echo "Root filesystem already read-write, not remounting"
-	exit 0
-fi
-
 echo "Remounting root file system..."
 mount -n -o remount,$rootmode /
 if test "$rootmode" = rw


