Received: from [65.55.116.16] (helo=blu0-omc1-s5.blu0.hotmail.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <phunge0@hotmail.com>) id 1MMYRE-0003Uh-B7
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Jul 2009 04:23:44 +0200
Received: from BLU0-SMTP9 ([65.55.116.8]) by blu0-omc1-s5.blu0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 2 Jul 2009 19:11:37 -0700
X-Originating-IP: [71.167.240.36]
X-Originating-Email: [phunge0@hotmail.com]
Message-ID: <BLU0-SMTP98D83F56BE537D7A28DC6FE2C0@phx.gbl>
Received: from [192.168.1.9] ([71.167.240.36]) by BLU0-SMTP9.blu0.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 2 Jul 2009 19:11:36 -0700
Date: Thu, 02 Jul 2009 22:10:36 -0400
From: Brian Bloniarz <phunge0@hotmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: philb@gnu.org, openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 03 Jul 2009 02:11:36.0941 (UTC)
	FILETIME=[983111D0:01C9FB83]
Subject: [PATCH] initscripts: correct checkroot rootfs read-write check
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
X-List-Received-Date: Fri, 03 Jul 2009 02:23:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

initscripts: correct checkroot rootfs read-write check

Fixes a regexp typo when checking whether the rootfs needs
to be remounted. Also alters the remount logic to not
assume that the root will be mounted RW.

Signed-off-by: Brian Bloniarz <phunge0@hotmail.com>

 recipes/initscripts/initscripts-1.0/checkroot |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

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


