Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1QLW2I-0000si-RC
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 09:46:47 +0200
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id 42166EAB75
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2011 09:43:55 +0200 (CEST)
X-SENDER-IP: [83.227.57.42]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ais3AOqCz01T4zkqPGdsb2JhbACmFAsBAQEBNzK8OQGMDYYZBJARjnc
X-IronPort-AV: E=Sophos;i="4.64,368,1301868000"; d="scan'208";a="189784933"
Received: from c-2a39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.57.42])
	by ipb1.telenor.se with ESMTP; 15 May 2011 09:43:55 +0200
From: ulf.samuelsson@atmel.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 May 2011 09:43:52 +0200
Message-Id: <1305445432-4370-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH] owl-wifi: Add include files, to allow compile to complete
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
X-List-Received-Date: Sun, 15 May 2011 07:46:47 -0000

From: Ulf Samuelsson <ulf.samuelsson@atmel.com>

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 .../0001-owl-wifi-include-linux-semaphore.h.patch  |   25 ++++++++++++++++++++
 ...l-wifi-Add-include-file-for-kmalloc-kfree.patch |   25 ++++++++++++++++++++
 .../files/0003-owl-wifi-include-sched.h.patch      |   24 +++++++++++++++++++
 recipes/owl-wifi/owl-wifi_1.0.4.bb                 |    9 ++++++-
 4 files changed, 82 insertions(+), 1 deletions(-)
 create mode 100644 recipes/owl-wifi/files/0001-owl-wifi-include-linux-semaphore.h.patch
 create mode 100644 recipes/owl-wifi/files/0002-owl-wifi-Add-include-file-for-kmalloc-kfree.patch
 create mode 100644 recipes/owl-wifi/files/0003-owl-wifi-include-sched.h.patch

diff --git a/recipes/owl-wifi/files/0001-owl-wifi-include-linux-semaphore.h.patch b/recipes/owl-wifi/files/0001-owl-wifi-include-linux-semaphore.h.patch
new file mode 100644
index 0000000..026061a
--- /dev/null
+++ b/recipes/owl-wifi/files/0001-owl-wifi-include-linux-semaphore.h.patch
@@ -0,0 +1,25 @@
+From 2f334b4563af8a8fc508b8d7245b901f0c5deab3 Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf@bulwark.(none)>
+Date: Sat, 16 Apr 2011 17:22:00 +0200
+Subject: [PATCH] owl-wifi: include linux/semaphore.h
+
+Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+---
+ owl_net.h |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/owl_net.h b/owl_net.h
+index c019ef4..6a88100 100644
+--- a/owl_net.h
++++ b/owl_net.h
+@@ -24,6 +24,7 @@
+ #include <linux/etherdevice.h>
+ #include <linux/wireless.h>
+ #include <linux/timer.h>
++#include <linux/semaphore.h>
+ 
+ #include "wl_api.h"
+ 
+-- 
+1.6.3.3
+
diff --git a/recipes/owl-wifi/files/0002-owl-wifi-Add-include-file-for-kmalloc-kfree.patch b/recipes/owl-wifi/files/0002-owl-wifi-Add-include-file-for-kmalloc-kfree.patch
new file mode 100644
index 0000000..a8a51ab
--- /dev/null
+++ b/recipes/owl-wifi/files/0002-owl-wifi-Add-include-file-for-kmalloc-kfree.patch
@@ -0,0 +1,25 @@
+From 3ac35324bc7e6cb0afda82d84f7b63d673a71199 Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf@bulwark.(none)>
+Date: Sat, 16 Apr 2011 17:44:19 +0200
+Subject: [PATCH] owl-wifi: Add include file for kmalloc/kfree
+
+Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+---
+ owl_os.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/owl_os.c b/owl_os.c
+index 270e541..4d7d116 100644
+--- a/owl_os.c
++++ b/owl_os.c
+@@ -20,6 +20,7 @@
+ #include <linux/kernel.h>
+ #include <linux/string.h>
+ #include <linux/hardirq.h>
++#include <linux/slab.h>
+ #include <stdarg.h>
+ 
+ /*
+-- 
+1.6.3.3
+
diff --git a/recipes/owl-wifi/files/0003-owl-wifi-include-sched.h.patch b/recipes/owl-wifi/files/0003-owl-wifi-include-sched.h.patch
new file mode 100644
index 0000000..036c0fc
--- /dev/null
+++ b/recipes/owl-wifi/files/0003-owl-wifi-include-sched.h.patch
@@ -0,0 +1,24 @@
+From 6b4a1ffc0485c6efb0742d2965fed126b9fd3fc4 Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf@bulwark.(none)>
+Date: Sat, 16 Apr 2011 18:01:34 +0200
+Subject: [PATCH] owl-wifi: include sched.h
+
+---
+ owl_sync.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/owl_sync.c b/owl_sync.c
+index 317010d..3be3efe 100644
+--- a/owl_sync.c
++++ b/owl_sync.c
+@@ -16,6 +16,7 @@
+  *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
+  */
+ 
++#include <linux/sched.h>
+ #include "owl_sync.h"
+ #include "owl_wext_event.h"
+ 
+-- 
+1.6.3.3
+
diff --git a/recipes/owl-wifi/owl-wifi_1.0.4.bb b/recipes/owl-wifi/owl-wifi_1.0.4.bb
index 5e31b82..8e29b4f 100644
--- a/recipes/owl-wifi/owl-wifi_1.0.4.bb
+++ b/recipes/owl-wifi/owl-wifi_1.0.4.bb
@@ -3,12 +3,15 @@ HOMEPAGE = "http://www.hd-wireless.se"
 PRIORITY = "optional"
 SECTION = "kernel/modules"
 LICENSE = "GPL"
-PR = "r1"
+PR = "r2"
 RDEPENDS = "wireless-tools \
 	 wpa-supplicant \
 	 "
 
 SRC_URI = "http://www.hd-wireless.se/images/stories/public_pdf/owl-linux-arm-${PV}.tar.gz \
+	file://0001-owl-wifi-include-linux-semaphore.h.patch;apply=yes \
+	file://0002-owl-wifi-Add-include-file-for-kmalloc-kfree.patch;apply=yes \
+	file://0003-owl-wifi-include-sched.h.patch;apply=yes \
 	"
 
 S = "${WORKDIR}/owl-linux-arm-${PV}"
@@ -29,3 +32,7 @@ do_install() {
         install -d ${D}${base_libdir}/modules/${KERNEL_VERSION}/kernel/drivers/net
         install -m 0644 ${S}/owl*${KERNEL_OBJECT_SUFFIX} ${D}${base_libdir}/modules/${KERNEL_VERSION}/kernel/drivers/net
 }
+
+SRC_URI[md5sum] = "e8df44b8c766436fdd798fa5cd6d1a02"
+SRC_URI[sha256sum] = "c2b47ecb6375e7a5904fefd6ec7b715ca4a6ac347fb68324fea7ade152244e6e"
+
-- 
1.7.4.1



