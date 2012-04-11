Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SI5WQ-0002TM-Mt
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2012 23:56:14 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id C8BDCEA040;
	Thu, 12 Apr 2012 00:03:26 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id BB20C60FD9; Wed, 11 Apr 2012 23:46:54 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Apr 2012 23:46:32 +0200
Message-Id: <1334180792-20535-1-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.9.5
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [PATCH] opkg-utils: Update SRC_URI to git.yoctoproject.org
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
X-List-Received-Date: Wed, 11 Apr 2012 21:56:14 -0000

This updates SRC_URI as the svn.openmoko.org repository is now down.
All the changes of this patch were picked from oe-core and brought
over.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 .../opkg-utils/opkg-utils/add-license-field.patch  |   39 +++++++++++++++++
 .../opkg-utils/arfile_header_split.patch           |   10 +++++
 .../opkg-utils/index-ignore-filenotfound.patch     |   19 ++++++++
 recipes/opkg-utils/opkg-utils/mtime-int.patch      |    3 ++
 recipes/opkg-utils/opkg-utils/shebang.patch        |   46 ++++++++++++++++++++
 recipes/opkg-utils/opkg-utils_git.bb               |   31 +++++++++++++
 recipes/opkg-utils/opkg-utils_svn.bb               |   27 ------------
 7 files changed, 148 insertions(+), 27 deletions(-)
 create mode 100644 recipes/opkg-utils/opkg-utils/add-license-field.patch
 create mode 100644 recipes/opkg-utils/opkg-utils/shebang.patch
 create mode 100644 recipes/opkg-utils/opkg-utils_git.bb
 delete mode 100644 recipes/opkg-utils/opkg-utils_svn.bb

diff --git a/recipes/opkg-utils/opkg-utils/add-license-field.patch b/recipes/opkg-utils/opkg-utils/add-license-field.patch
new file mode 100644
index 0000000..0d33459
--- /dev/null
+++ b/recipes/opkg-utils/opkg-utils/add-license-field.patch
@@ -0,0 +1,39 @@
+Add knowledge about License field in ipk headers
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: opkg-utils/opkg.py
+===================================================================
+--- opkg-utils.orig/opkg.py	2010-11-01 04:52:35.000000000 -0700
++++ opkg-utils/opkg.py	2011-07-13 15:18:03.900037344 -0700
+@@ -145,6 +145,7 @@
+         self.priority = None
+         self.tags = None
+         self.fn = fn
++        self.license = None
+ 
+         if fn:
+             # see if it is deb format
+@@ -319,6 +320,12 @@
+     def get_section(self, section):
+         return self.section
+ 
++    def set_license(self, license):
++        self.license = license
++
++    def get_license(self, license):
++        return self.license
++
+     def get_file_list(self):
+         if not self.fn:
+             return []
+@@ -425,6 +432,7 @@
+         if self.description: out = out + "Description: %s\n" % (self.description)
+         if self.oe: out = out + "OE: %s\n" % (self.oe)
+         if self.homepage: out = out + "HomePage: %s\n" % (self.homepage)
++        if self.license: out = out + "License: %s\n" % (self.license)
+         if self.priority: out = out + "Priority: %s\n" % (self.priority)
+         if self.tags: out = out + "Tags: %s\n" % (self.tags)
+         out = out + "\n"
diff --git a/recipes/opkg-utils/opkg-utils/arfile_header_split.patch b/recipes/opkg-utils/opkg-utils/arfile_header_split.patch
index 4640367..b679f8b 100644
--- a/recipes/opkg-utils/opkg-utils/arfile_header_split.patch
+++ b/recipes/opkg-utils/opkg-utils/arfile_header_split.patch
@@ -1,3 +1,13 @@
+From: Scott Anderson <o2e@saaworld.com>
+Subject: ipkg-utils: Make arfile.py handle six digit UIDs
+    
+    Essentially, the problem is that arfile.py is splitting the ar header with
+    white-space instead of fixed-width fields, so two fields would get treated
+    as a single field.  This makes things better than before as it now honors
+    the fixed field widths.
+    
+Upstream-Status: Pending (there is no upstream after openmoko imploded)
+
 --- ipkg-utils/arfile.py.orig	2010-09-29 13:38:15.000000000 -0700
 +++ ipkg-utils/arfile.py	2010-10-01 16:06:00.000000000 -0700
 @@ -74,7 +74,12 @@
diff --git a/recipes/opkg-utils/opkg-utils/index-ignore-filenotfound.patch b/recipes/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
index e4a5481..f0f0fcf 100644
--- a/recipes/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
+++ b/recipes/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
@@ -5,6 +5,8 @@ error out.
 
 RP - 26/8/09
 
+Upstream-Status: Inappropriate [embedded specific]
+
 Index: opkg-utils/opkg-make-index
 ===================================================================
 --- opkg-utils.orig/opkg-make-index	2009-08-26 17:21:26.000000000 +0100
@@ -52,3 +54,20 @@ Index: opkg-utils/opkg-make-index
  if packages_filename:
       sys.stdout.close()
       sys.stdout = old_stdout
+@@ -197,7 +197,15 @@
+ names = packages.packages.keys()
+ names.sort()
+ for name in names:
+-     for fn in packages[name].get_file_list():
++     try:
++          fnlist = packages[name].get_file_list()
++     except OSError, e:
++          sys.stderr.write("Package %s disappeared on us!\n" % (name))
++          continue
++     except IOError, e:
++          sys.stderr.write("Package %s disappeared on us!\n" % (name))
++          continue
++     for fn in fnlist:
+           (h,t) = os.path.split(fn)
+           if not t: continue
+           if not files.has_key(t): files[t] = name+':'+fn
diff --git a/recipes/opkg-utils/opkg-utils/mtime-int.patch b/recipes/opkg-utils/opkg-utils/mtime-int.patch
index efec3c0..483a62a 100644
--- a/recipes/opkg-utils/opkg-utils/mtime-int.patch
+++ b/recipes/opkg-utils/opkg-utils/mtime-int.patch
@@ -12,6 +12,9 @@ gain by this change.
 
 Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
 
+Upstream-Status: Pending
+(Contacting the original author, no response yet.)
+
 Index: opkg-utils/opkg-make-index
 ===================================================================
 --- opkg-utils.orig/opkg-make-index
diff --git a/recipes/opkg-utils/opkg-utils/shebang.patch b/recipes/opkg-utils/opkg-utils/shebang.patch
new file mode 100644
index 0000000..f6a2ef9
--- /dev/null
+++ b/recipes/opkg-utils/opkg-utils/shebang.patch
@@ -0,0 +1,46 @@
+Use python via the PATH, rather than hardcoding /usr/bin/python
+
+Upstream-Status: Pending
+
+Signed-off-by: Christopher Larson <kergoth@gmail.com>
+
+--- opkg-utils.orig/opkg-list-fields
++++ opkg-utils/opkg-list-fields
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python
+ 
+ import sys, opkg
+ 
+--- opkg-utils.orig/opkg-make-index
++++ opkg-utils/opkg-make-index
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python
+ 
+ import sys, os, posixpath
+ from glob import glob
+--- opkg-utils.orig/opkg-show-deps
++++ opkg-utils/opkg-show-deps
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python
+ 
+ import sys, os, posixpath
+ from glob import glob
+--- opkg-utils.orig/opkg-unbuild
++++ opkg-utils/opkg-unbuild
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python
+ 
+ import sys, os, re
+ 
+--- opkg-utils.orig/opkg-update-index
++++ opkg-utils/opkg-update-index
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python2.1
++#!/usr/bin/env python
+ 
+ import sys, os
+ from glob import glob
diff --git a/recipes/opkg-utils/opkg-utils_git.bb b/recipes/opkg-utils/opkg-utils_git.bb
new file mode 100644
index 0000000..d2dfda6
--- /dev/null
+++ b/recipes/opkg-utils/opkg-utils_git.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "OPKG Package Manager Utilities"
+SECTION = "base"
+HOMEPAGE = "http://wiki.openmoko.org/wiki/Opkg"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
+RDEPENDS_${PN} = "python"
+RDEPENDS_${PN}_virtclass-native = ""
+SRCREV = "002d29bc605d7c2d02e4cf20a43c5277c15f5597"
+PV = "0.1.8+git${SRCPV}"
+PR = "r0"
+
+SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=git \
+           file://index-ignore-filenotfound.patch \
+           file://mtime-int.patch \
+           file://add-license-field.patch \
+           file://arfile_header_split.patch \
+           file://shebang.patch \
+           "
+
+S = "${WORKDIR}/git"
+
+# Avoid circular dependencies from package_ipk.bbclass
+PACKAGES_virtclass-native = ""
+
+do_install() {
+	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
+}
+
+BBCLASSEXTEND = "native"
+TARGET_CC_ARCH += "${LDFLAGS}"
diff --git a/recipes/opkg-utils/opkg-utils_svn.bb b/recipes/opkg-utils/opkg-utils_svn.bb
deleted file mode 100644
index 3ddafdb..0000000
--- a/recipes/opkg-utils/opkg-utils_svn.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "OPKG Package Manager Utilities"
-SECTION = "base"
-HOMEPAGE = "http://wiki.openmoko.org/wiki/Opkg"
-PRIORITY = "optional"
-LICENSE = "GPLv2"
-RDEPENDS_${PN} = "python"
-RDEPENDS_${PN}_virtclass-native = ""
-SRCREV = "4747"
-PV = "0.1.8+svnr${SRCPV}"
-PR = "r7"
-
-SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
-           file://index-ignore-filenotfound.patch \
-           file://arfile_header_split.patch \
-           file://mtime-int.patch"
-
-S = "${WORKDIR}/opkg-utils"
-
-# Avoid circular dependencies from package_ipk.bbclass
-PACKAGES_virtclass-native = ""
-
-do_install() {
-        oe_runmake PREFIX=${prefix} DESTDIR=${D} install
-}
-
-BBCLASSEXTEND = "native"
-TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.7.9.5



