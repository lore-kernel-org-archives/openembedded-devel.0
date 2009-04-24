Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LxGaH-0007nf-JG
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Apr 2009 10:16:33 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KIL0071WIROD008@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	24 Apr 2009 03:11:49 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 323296B83A8; Fri,
	24 Apr 2009 04:11:48 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Apr 2009 04:11:48 -0400
Message-id: <1240560708-14550-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.0.6
Subject: [STABLE][PATCH] udev 124: fix the absolute soname link in libvolume for SDK
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
X-List-Received-Date: Fri, 24 Apr 2009 08:16:34 -0000


Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 recipes/udev/udev-124/libvolume-id-soname.patch |   12 ++++++++++++
 recipes/udev/udev_124.bb                        |    3 ++-
 2 files changed, 14 insertions(+), 1 deletions(-)
 create mode 100644 recipes/udev/udev-124/libvolume-id-soname.patch

diff --git a/recipes/udev/udev-124/libvolume-id-soname.patch b/recipes/udev/udev-124/libvolume-id-soname.patch
new file mode 100644
index 0000000..56365a4
--- /dev/null
+++ b/recipes/udev/udev-124/libvolume-id-soname.patch
@@ -0,0 +1,12 @@
+diff -uNr udev-124-orig/extras/volume_id/lib/Makefile udev-124/extras/volume_id/lib/Makefile
+--- udev-124-orig/extras/volume_id/lib/Makefile	2008-06-12 01:24:30.000000000 -0400
++++ udev-124/extras/volume_id/lib/Makefile	2009-01-14 23:32:42.000000000 -0500
+@@ -113,7 +113,7 @@
+ ifeq ($(libdir),$(usrlibdir))
+ 	ln -sf $(SHLIB) $(DESTDIR)$(usrlibdir)/libvolume_id.so
+ else
+-	ln -sf $(libdir)/$(SHLIB) $(DESTDIR)$(usrlibdir)/libvolume_id.so
++	ln -sf ../..$(libdir)/$(SHLIB) $(DESTDIR)$(usrlibdir)/libvolume_id.so
+ endif
+ 	$(INSTALL) -d $(DESTDIR)$(usrlibdir)/pkgconfig
+ 	$(INSTALL_DATA) libvolume_id.pc $(DESTDIR)$(usrlibdir)/pkgconfig/libvolume_id.pc
diff --git a/recipes/udev/udev_124.bb b/recipes/udev/udev_124.bb
index 76edb2f..37dc3a7 100644
--- a/recipes/udev/udev_124.bb
+++ b/recipes/udev/udev_124.bb
@@ -2,13 +2,14 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
 /dev/, handles hotplug events and loads drivers at boot time. It replaces \
 the hotplug package and requires a kernel not older than 2.6.12."
 RPROVIDES_${PN} = "hotplug"
-PR = "r14"
+PR = "r15"
 
 SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
 	   file://noasmlinkage.patch;patch=1 \
 	   file://flags.patch;patch=1 \
 	   file://vol_id_ld.patch;patch=1 \
 	   file://udevtrigger_add_devname_filtering.patch;patch=1 \
+	   file://libvolume-id-soname.patch;patch=1 \
 	   file://mount.blacklist \
 	   file://run.rules \
 	   "
-- 
1.6.0.6



