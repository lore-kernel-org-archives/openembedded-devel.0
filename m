Received: from mailbackup.inode.at ([213.229.60.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernhard.Guillon@hale.at>) id 1QyNZl-0002sp-NF
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 14:37:57 +0200
Received: from [62.99.145.6] (port=7954 helo=mx.inode.at)
	by mailbackup.inode.at with esmtp (Exim 4.76)
	(envelope-from <Bernhard.Guillon@hale.at>) id 1QyNL3-0001Xq-IL
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 14:22:45 +0200
Received: from [83.64.51.210] (port=15864 helo=gateway1.hale)
	by smartmx-06.inode.at with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <Bernhard.Guillon@hale.at>)
	id 1QyNL1-0000ML-DP for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 14:22:43 +0200
Received: from mail1.hale.at (mail2.hale [192.168.100.12])
	by gateway1.hale (8.13.8/8.13.7) with ESMTP id p7UCMYFa031384
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2011 14:22:34 +0200
Received: from localhost.localdomain ([192.168.100.138]) by hale.at with
	MailEnable ESMTP; Tue, 30 Aug 2011 14:22:29 +0200
From: Bernhard Guillon <Bernhard.Guillon@hale.at>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Aug 2011 14:21:53 +0200
Message-Id: <1314706913-10583-1-git-send-email-Bernhard.Guillon@hale.at>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-HALE-MailScanner-Information: Please contact the ISP for more information
X-MailScanner-ID: p7UCMYFa031384
X-HALE-MailScanner: Found to be clean
X-HALE-MailScanner-From: bernhard.guillon@hale.at
MailScanner-NULL-Check: 1315311756.24194@4OInHhvVe3pvM/2gHpmf3g
X-Spam-Status: No
Subject: [meta-oe] [PATCH] dbus-c++: use openembedded-core versions
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
X-List-Received-Date: Tue, 30 Aug 2011 12:37:57 -0000

Remove non working recipes because openembedded-core provides better
ones.

Signed-off-by: Bernhard Guillon <Bernhard.Guillon@hale.at>
---
 meta-oe/recipes-core/dbus/dbus-c++-native_git.bb   |   17 --------------
 .../recipes-core/dbus/dbus-c++/fix-linking.patch   |   13 -----------
 meta-oe/recipes-core/dbus/dbus-c++_git.bb          |   23 --------------------
 3 files changed, 0 insertions(+), 53 deletions(-)
 delete mode 100644 meta-oe/recipes-core/dbus/dbus-c++-native_git.bb
 delete mode 100644 meta-oe/recipes-core/dbus/dbus-c++/fix-linking.patch
 delete mode 100644 meta-oe/recipes-core/dbus/dbus-c++_git.bb

diff --git a/meta-oe/recipes-core/dbus/dbus-c++-native_git.bb b/meta-oe/recipes-core/dbus/dbus-c++-native_git.bb
deleted file mode 100644
index eba80b2..0000000
--- a/meta-oe/recipes-core/dbus/dbus-c++-native_git.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require dbus-c++_git.bb
-inherit native
-
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/dbus-c++"
-# actually dbus-native and expat-native, but even the bearest build machine should have that nowadays...
-DEPENDS = ""
-
-do_compile() {
-	oe_runmake -C src libdbus-c++-1.la
-	oe_runmake -C tools dbusxx-xml2cpp
-	install -m 0755 tools/dbusxx-xml2cpp ${STAGING_BINDIR_NATIVE}
-}
-
-do_install() {
-	:
-}
-
diff --git a/meta-oe/recipes-core/dbus/dbus-c++/fix-linking.patch b/meta-oe/recipes-core/dbus/dbus-c++/fix-linking.patch
deleted file mode 100644
index 8222169..0000000
--- a/meta-oe/recipes-core/dbus/dbus-c++/fix-linking.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: dbus/tools/Makefile.am
-===================================================================
---- dbus.orig/tools/Makefile.am
-+++ dbus/tools/Makefile.am
-@@ -16,7 +16,7 @@ endif
- bin_PROGRAMS = dbusxx-xml2cpp dbusxx-introspect
- 
- dbusxx_xml2cpp_SOURCES = xml.h xml.cpp xml2cpp.h xml2cpp.cpp
--dbusxx_xml2cpp_LDADD = $(libdbus_cxx_la)
-+dbusxx_xml2cpp_LDADD = $(libdbus_cxx_la) -lexpat
- 
- dbusxx_introspect_SOURCES = introspect.h introspect.cpp
- dbusxx_introspect_LDADD = $(libdbus_cxx_la)
diff --git a/meta-oe/recipes-core/dbus/dbus-c++_git.bb b/meta-oe/recipes-core/dbus/dbus-c++_git.bb
deleted file mode 100644
index 6459823..0000000
--- a/meta-oe/recipes-core/dbus/dbus-c++_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "C++ bindings for dbus"
-LICENSE = "LGPLv2.1+"
-SECTION = "libs"
-DEPENDS = "dbus dbus-c++-native expat"
-SRCREV = "530a887913d3b0dd7091eabb8eef8e3c279e3bb8"
-
-PE = "1"
-PV = "0.5.0+gitr${SRCPV}"
-
-SRC_URI = "git://gitorious.org/dbus-cplusplus/mainline.git;protocol=git"
-#           file://fix-linking.patch"
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-
-do_compile_prepend() {
-	find . -name "Makefile.am" |xargs sed -i -e 's,$(top_builddir)/tools/dbusxx-xml2cpp,dbusxx-xml2cpp,'
-}
-
-FILES_${PN}-dbg += "${bindir}/dbusxx-xml2cpp ${bindir}/dbusxx-introspect"
-FILES_${PN}-dev += "${bindir}/.dev"
-FILES_${PN} = "${libdir}/*.so.*"
-
-- 
1.7.0.4



--
Scanned by MailScanner.



