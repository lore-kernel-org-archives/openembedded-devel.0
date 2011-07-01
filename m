Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1QciDG-0003IU-T7
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 20:13:10 +0200
Received: from [192.168.0.101] (91-64-95-94-dynip.superkabel.de [91.64.95.94])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 2009C1B10C03
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jul 2011 18:17:15 +0000 (UTC)
Message-ID: <4E0E0D55.6080507@freyther.de>
Date: Fri, 01 Jul 2011 20:09:25 +0200
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH/RFC] udev pulls in glib which occupies another MB
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
X-List-Received-Date: Fri, 01 Jul 2011 18:13:11 -0000
X-Groupsio-MsgNum: 32942
Content-Type: multipart/mixed; boundary="------------000208070202070705060208"

--------------000208070202070705060208
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

the OE core's (already fixed in meta-oe) udev puts libgudev into the wrong
package, the first patch is fixing it. The next issue is with udev-acl (only
one rule file uses it) that requires glib (for lists and config parsing).
There are devices that will not require udev-acl and saving 1MB is an easy
win. This change also applies to meta-oe in some way.

comments?
	holger

--------------000208070202070705060208
Content-Type: text/x-patch;
 name="0001-udev-Fix-the-packaging-of-libgudev.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-udev-Fix-the-packaging-of-libgudev.patch"

From f6409c568416db2500d5e422b08625042951fdcb Mon Sep 17 00:00:00 2001
From: Holger Hans Peter Freyther <zecke@selfish.org>
Date: Sat, 2 Jul 2011 01:59:29 +0800
Subject: [PATCH 1/2] udev: Fix the packaging of libgudev

Make the libgudev so go to the libgudev package, this is already
fixed in meta-oe.

Signed-off-by: Holger Hans Peter Freyther <holger@moiji-mobile.com>
---
 meta/recipes-core/udev/udev-new.inc |    4 ++--
 meta/recipes-core/udev/udev_164.bb  |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/udev/udev-new.inc b/meta/recipes-core/udev/udev-new.inc
index 4c4451f..0247a83 100644
--- a/meta/recipes-core/udev/udev-new.inc
+++ b/meta/recipes-core/udev/udev-new.inc
@@ -51,8 +51,8 @@ FILES_libudev = "${base_libdir}/libudev.so.*"
 FILES_libudev-dbg = "${base_libdir}/.debug/libudev.so.*"
 FILES_libudev-dev = "${includedir}/libudev.h ${libdir}/libudev.so ${libdir}/libudev.la \
                      ${libdir}/libudev.a ${libdir}/pkgconfig/libudev.pc"
-FILES_libgudev = "${libdir}/libgudev*.so.*"
-FILES_libgudev-dbg = "${libdir}/.debug/libgudev*.so.*"
+FILES_libgudev = "${base_libdir}/libgudev*.so.* ${libdir}/libgudev*.so.*"
+FILES_libgudev-dbg = "${base_libdir}/.debug/libgudev*.so.* ${libdir}/.debug/libgudev*.so.*"
 FILES_libgudev-dev = "${includedir}/gudev* ${libdir}/libgudev*.so ${libdir}/libgudev*.la \
                      ${libdir}/libgudev*.a ${libdir}/pkgconfig/gudev*.pc"
 FILES_udev-cache = "${sysconfdir}/init.d/udev-cache"
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index 567e62e..518d37a 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev-new.inc
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI[md5sum] = "fddac2d54761ea34865af9467377ca9f"
 SRC_URI[sha256sum] = "c12e66280b5e1465f6587a8cfa47d7405c4caa7e52ce5dd13478d04f6ec05e5c"
-- 
1.7.4.1


--------------000208070202070705060208
Content-Type: text/x-patch;
 name="0002-udev-Split-out-consolekit-and-udev-acl.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0002-udev-Split-out-consolekit-and-udev-acl.patch"

From 07d29b8f2d80e792dd1c976f629b1f0ee0b10c55 Mon Sep 17 00:00:00 2001
From: Holger Hans Peter Freyther <zecke@selfish.org>
Date: Sat, 2 Jul 2011 02:00:43 +0800
Subject: [PATCH 2/2] udev: Split out consolekit and udev-acl

This can safe another megabyte on the tar.bz2 of the minimal
image. udev-acl is linking to glibc which will pull in libglib,
libgio, libgthread, libgmodule, libgobject.

2.0M 2011-07-02 01:57 after.tar.bz2
3.0M 2011-07-02 01:52 before.tar.bz2

Signed-off-by: Holger Hans Peter Freyther <zecke@selfish.org>
---
 meta/recipes-core/udev/udev-new.inc |    6 ++++++
 meta/recipes-core/udev/udev_164.bb  |    2 +-
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/udev/udev-new.inc b/meta/recipes-core/udev/udev-new.inc
index 0247a83..eac7903 100644
--- a/meta/recipes-core/udev/udev-new.inc
+++ b/meta/recipes-core/udev/udev-new.inc
@@ -35,6 +35,7 @@ libexecdir = "${base_libdir}/udev"
 EXTRA_OECONF = "--disable-introspection --with-rootlibdir=${base_libdir} \
                 --with-pci-ids-path=${datadir}/pci.ids"
 
+PACKAGES =+ "udev-acl udev-consolekit"
 PACKAGES =+ "udev-cache libudev libudev-dev libudev-dbg"
 PACKAGES =+ "libgudev libgudev-dev libgudev-dbg"
 
@@ -57,6 +58,11 @@ FILES_libgudev-dev = "${includedir}/gudev* ${libdir}/libgudev*.so ${libdir}/libg
                      ${libdir}/libgudev*.a ${libdir}/pkgconfig/gudev*.pc"
 FILES_udev-cache = "${sysconfdir}/init.d/udev-cache"
 
+FILES_udev-acl = "${base_libdir}/udev/udev-acl ${base_libdir}/udev/rules.d/70-acl.rules"
+
+RDEPENDS_udev-consolekit += "udev-acl"
+FILES_udev-consolekit = "${libdir}/ConsoleKit"
+
 do_install_append () {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index 518d37a..1883be5 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev-new.inc
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI[md5sum] = "fddac2d54761ea34865af9467377ca9f"
 SRC_URI[sha256sum] = "c12e66280b5e1465f6587a8cfa47d7405c4caa7e52ce5dd13478d04f6ec05e5c"
-- 
1.7.4.1


--------------000208070202070705060208--
