Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LNLbU-0002Ew-00
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jan 2009 07:21:27 +0100
Received: from gandalf.denix.org ([71.255.246.155]) by vms173001.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0KDI00EQJ1BUIH42@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	15 Jan 2009 00:14:24 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 33C906B83B5; Thu,
	15 Jan 2009 01:14:18 -0500 (EST)
Date: Thu, 15 Jan 2009 01:14:18 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090115061418.GA13352@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: [RFC] Fix udev pulling in libvolume-id-dev
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
X-List-Received-Date: Thu, 15 Jan 2009 06:21:35 -0000
X-Groupsio-MsgNum: 7245
Content-type: multipart/mixed; boundary=a8Wt8u1KmwUX3Y2C
Content-disposition: inline

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I was debugging the strange behavior of one of my boxes pulling in libc6-dev 
into the filesystem image and it happened to be because udev pulled in 
libvolume-id-dev instead of libvolume-id0... It worked as expected on the 
other box, though.

Several people on IRC have seen this lingering bug before, but no fix was 
available. Koen mentioned it got fixed for him by rebuilding udev...

After some investigation I found out that both libvolume-id packages (-dev and 
regular) are registered to provide libvolume_id.so.0 and the one appearing 
last in os.walk() gets pulled in by udev. The order of files provided by 
os.walk() depends on parallel builds and phase of the Moon.

libvolume-id-dev does not provide the actual .so library, but it contains a 
symlink in /usr/lib, which points to /lib/libvolume.so.0 (the host one!) 
instead of ../../lib/ one...

The first patch attached fixes this in udev and should be a no brainer. Unless 
someone objects, I'll push it in in a day or two.

Since I was debugging the code which actually does this shlib magic in 
package.bbclass, I thought it might be useful to prevent this kind of issues 
in the future by skipping symlinks while looking for SONAME/NEEDED in the 
objdump - please see the second patch attached and provide feedback.

-- 
Denys

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="udev-124-libvolume-id-soname.patch"

diff --git a/packages/udev/udev-124/libvolume-id-soname.patch b/packages/udev/udev-124/libvolume-id-soname.patch
new file mode 100644
index 0000000..56365a4
--- /dev/null
+++ b/packages/udev/udev-124/libvolume-id-soname.patch
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
diff --git a/packages/udev/udev_124.bb b/packages/udev/udev_124.bb
index 515debe..aa156a1 100644
--- a/packages/udev/udev_124.bb
+++ b/packages/udev/udev_124.bb
@@ -3,13 +3,14 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
 the hotplug package and requires a kernel not older than 2.6.12."
 RPROVIDES_${PN} = "hotplug"
 
-PR = "r11"
+PR = "r12"
 
 SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
 	   file://noasmlinkage.patch;patch=1 \
 	   file://flags.patch;patch=1 \
 	   file://vol_id_ld.patch;patch=1 \
 	   file://udevtrigger_add_devname_filtering.patch;patch=1 \
+	   file://libvolume-id-soname.patch;patch=1 \
 	   file://mount.blacklist \
 	   file://run.rules \
 	   "

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="package_bbclass-do_shlibs-skip-symlinks.patch"

diff --git a/classes/package.bbclass b/classes/package.bbclass
index 8b7d649..a7cdb5f 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -615,7 +615,7 @@ python package_do_shlibs() {
 			for file in files:
 				soname = None
 				path = os.path.join(root, file)
-				if os.access(path, os.X_OK) or lib_re.match(file):
+				if (os.access(path, os.X_OK) or lib_re.match(file)) and not os.path.islink(path):
 					cmd = bb.data.getVar('OBJDUMP', d, 1) + " -p " + path + " 2>/dev/null"
 					cmd = "PATH=\"%s\" %s" % (bb.data.getVar('PATH', d, 1), cmd)
 					fd = os.popen(cmd)

--a8Wt8u1KmwUX3Y2C--
