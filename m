Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Kv8pu-0005ZX-Hm
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Oct 2008 12:03:38 +0100
Received: from [92.116.133.247] (helo=tamarin.localnet)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Kv8oz-0008O3-7b
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Oct 2008 12:02:42 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Oct 2008 22:27:45 +0100
User-Agent: KMail/1.10.1 (Linux/2.6.27-7-generic; KDE/4.1.2; i686; ; )
MIME-Version: 1.0
Message-Id: <200810282227.45943.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.116.133.247
Subject: [sanity.bbclass] Make the mmap min_addr check not depend on arm
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
X-List-Received-Date: Wed, 29 Oct 2008 11:03:38 -0000
X-Groupsio-MsgNum: 6419
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_RP4BJ+4XLIARKTy"

--Boundary-00=_RP4BJ+4XLIARKTy
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey,

I have the following in the OM git tree that was needed to build ecj-initial. 
Robert I would appreciate if you could comment if that is still needed and 
Richard can you agree to such a change?

z.

--Boundary-00=_RP4BJ+4XLIARKTy
Content-Type: text/plain;
  charset="us-ascii";
  name="sanity.bbclass"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="sanity.bbclass"

commit 6f11296d1bdf022443763a02b0cf2d808cbad19a
Author: Holger Hans Peter Freyther <zecke@openmoko.org>
Date:   Mon Jul 21 10:27:57 2008 +0200

    [sanity] Move the mmap_min_addr check out of arch == arm as ecj-initial fails
        This check is not arm specific. An ordinary ecj-initial will fail with
        mmap'ing and classpath-native can not be build then.

diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
index 883c0e5..4e33616 100644
--- a/classes/sanity.bbclass
+++ b/classes/sanity.bbclass
@@ -98,11 +98,11 @@ def check_sanity(e):
 			if not check_app_exists("qemu-arm", e.data):
 				messages = messages + "qemu-native was in ASSUME_PROVIDED but the QEMU binaries (qemu-arm) can't be found in PATH"
 
-		if os.path.exists("/proc/sys/vm/mmap_min_addr"):
-			f = file("/proc/sys/vm/mmap_min_addr", "r")
-			if (f.read().strip() != "0"):
-				messages = messages + "/proc/sys/vm/mmap_min_addr is not 0. This will cause problems with qemu so please fix the value (as root).\n"
-			f.close()
+	if os.path.exists("/proc/sys/vm/mmap_min_addr"):
+		f = file("/proc/sys/vm/mmap_min_addr", "r")
+		if (f.read().strip() != "0"):
+			messages = messages + "/proc/sys/vm/mmap_min_addr is not 0. This will cause problems with qemu and ecj so please fix the value (as root).\n"
+		f.close()
 
 	for util in required_utilities.split():
 		if not check_app_exists( util, e.data ):

--Boundary-00=_RP4BJ+4XLIARKTy--
