Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RFaCJ-0007Xa-LR
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 01:32:52 +0200
Received: from mizar.localdomain (82.60.186.164) by smtp208.alice.it
	(8.5.124.08) id 4DE64DF10C5F6E93; Mon, 17 Oct 2011 01:27:03 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Oct 2011 01:26:50 +0200
Message-Id: <1318807611-16837-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1318807611-16837-1-git-send-email-andrea.adami@gmail.com>
References: <1318807611-16837-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/3] udev: add bbappend and disable device cache as default.
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
X-List-Received-Date: Sun, 16 Oct 2011 23:32:52 -0000

* For some reasons when the cache is created root can still be ro
* and as solution you would be obliged to add 'rw' to your commandline.
* There are patches in openembedded-classic to correct this
* (and those are still pending for meta-oe).
* Until a solution is found disable the creation of the device cache on boot.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-core/udev/udev/default      |    4 ++++
 recipes-core/udev/udev_173.bbappend |    1 +
 2 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 recipes-core/udev/udev/default
 create mode 100644 recipes-core/udev/udev_173.bbappend

diff --git a/recipes-core/udev/udev/default b/recipes-core/udev/udev/default
new file mode 100644
index 0000000..ba2867e
--- /dev/null
+++ b/recipes-core/udev/udev/default
@@ -0,0 +1,4 @@
+# Default for /etc/init.d/udev
+
+# Uncomment this out to enable device cache
+#DEVCACHE="/etc/dev.tar"
diff --git a/recipes-core/udev/udev_173.bbappend b/recipes-core/udev/udev_173.bbappend
new file mode 100644
index 0000000..72d991c
--- /dev/null
+++ b/recipes-core/udev/udev_173.bbappend
@@ -0,0 +1 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-- 
1.7.3.4



