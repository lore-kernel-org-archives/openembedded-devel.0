Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SmqCK-0003aw-Md
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jul 2012 19:50:36 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 7E864EA040
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2012 19:45:13 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 2660F60103; Thu,  5 Jul 2012 19:39:33 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jul 2012 19:39:19 +0200
Message-Id: <9160263bce6c0dde2495ce365ad57241f73293aa.1341438914.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1341438914.git.apelete@seketeli.net>
References: <cover.1341438914.git.apelete@seketeli.net>
In-Reply-To: <cover.1341438914.git.apelete@seketeli.net>
References: <cover.1341438914.git.apelete@seketeli.net>
Subject: [PATCH 01/14] opkg-utils: rebase on oe-core recipe
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
X-List-Received-Date: Thu, 05 Jul 2012 17:50:36 -0000

This patch updates SRC_URI as the svn.openmoko.org repository is now
down. The changes of this patch were picked from oe-core and brought
over.

This is the result of rebasing my patch 1ff63aa from master.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
Signed-off-by: Kristoffer Ericson <kristoffer.ericson@gmail.com>
---
 .../opkg-utils/index-ignore-filenotfound.patch     |   54 --------------------
 recipes/opkg-utils/opkg-utils/mtime-int.patch      |   27 ----------
 .../{opkg-utils_svn.bb => opkg-utils_git.bb}       |   19 +++----
 3 files changed, 10 insertions(+), 90 deletions(-)
 delete mode 100644 recipes/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
 delete mode 100644 recipes/opkg-utils/opkg-utils/mtime-int.patch
 rename recipes/opkg-utils/{opkg-utils_svn.bb => opkg-utils_git.bb} (44%)

diff --git a/recipes/opkg-utils/opkg-utils/index-ignore-filenotfound.patch b/recipes/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
deleted file mode 100644
index e4a5481..0000000
--- a/recipes/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-If we're building an image and some package rebuilds while this is happening
-some package can be removed/added to the ipk deploy directory. The image will
-not depend on this package so we can safely ignore these cases rather than 
-error out.
-
-RP - 26/8/09
-
-Index: opkg-utils/opkg-make-index
-===================================================================
---- opkg-utils.orig/opkg-make-index	2009-08-26 17:21:26.000000000 +0100
-+++ opkg-utils/opkg-make-index	2009-08-27 16:11:22.000000000 +0100
-@@ -96,6 +96,7 @@
- files=glob(pkg_dir + '/*.ipk') + glob(pkg_dir + '/*.deb')
- files.sort()
- for filename in files:
-+  try:
-      basename = os.path.basename(filename)
-      pkg = None
-      fnameStat = os.stat(filename)
-@@ -130,6 +131,12 @@
-                to_morgue(basename)
-           if opt_s:
-                print filename
-+  except OSError:
-+      sys.stderr.write("Package %s disappeared on us!\n" % (filename))
-+      continue
-+  except IOError:
-+      sys.stderr.write("Package %s disappeared on us!\n" % (filename))
-+      continue
- 
- pkgsStampsFile = open(stamplist_filename, "w")
- for f in pkgsStamps.keys():
-@@ -148,6 +155,7 @@
- names = packages.packages.keys()
- names.sort()
- for name in names:
-+  try:
-      pkg = packages.packages[name]
-      if locales_dir and pkg.depends:
-          depends = string.split(pkg.depends, ',')
-@@ -165,6 +173,13 @@
-      if (verbose):
-           sys.stderr.write("Writing info for package %s\n" % (pkg.package,))
-      print pkg
-+  except OSError:
-+      sys.stderr.write("Package %s disappeared on us!\n" % (name))
-+      continue
-+  except IOError:
-+      sys.stderr.write("Package %s disappeared on us!\n" % (name))
-+      continue
-+
- if packages_filename:
-      sys.stdout.close()
-      sys.stdout = old_stdout
diff --git a/recipes/opkg-utils/opkg-utils/mtime-int.patch b/recipes/opkg-utils/opkg-utils/mtime-int.patch
deleted file mode 100644
index efec3c0..0000000
--- a/recipes/opkg-utils/opkg-utils/mtime-int.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Convert mtime to int before comparing it
-
-The st_mtime attribute (which is a float) is compared against a value
-from the timestamp database, which was stored as an integer there.
-
-When working on a filesystem with precise timestamps the comparision
-will fail nearly everytime hence.
-
-Although it might be possible to enhance the database to store the
-fractional part too, this will complicate things more than we would
-gain by this change.
-
-Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
-
-Index: opkg-utils/opkg-make-index
-===================================================================
---- opkg-utils.orig/opkg-make-index
-+++ opkg-utils/opkg-make-index
-@@ -100,7 +100,7 @@ for filename in files:
-      pkg = None
-      fnameStat = os.stat(filename)
-      if old_pkg_hash.has_key(basename):
--          if pkgsStamps.has_key(basename) and fnameStat.st_mtime == pkgsStamps[basename]:
-+          if pkgsStamps.has_key(basename) and int(fnameStat.st_mtime) == pkgsStamps[basename]:
-             if (verbose):
-                sys.stderr.write("Found %s in Packages\n" % (filename,))
-             pkg = old_pkg_hash[basename]
diff --git a/recipes/opkg-utils/opkg-utils_svn.bb b/recipes/opkg-utils/opkg-utils_git.bb
similarity index 44%
rename from recipes/opkg-utils/opkg-utils_svn.bb
rename to recipes/opkg-utils/opkg-utils_git.bb
index 6b8d3ea..997b292 100644
--- a/recipes/opkg-utils/opkg-utils_svn.bb
+++ b/recipes/opkg-utils/opkg-utils_git.bb
@@ -1,24 +1,25 @@
 DESCRIPTION = "OPKG Package Manager Utilities"
 SECTION = "base"
 HOMEPAGE = "http://wiki.openmoko.org/wiki/Opkg"
-PRIORITY = "optional"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
 RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
-SRCREV = "4747"
-PV = "0.1.8+svnr${SRCPV}"
-PR = "r6"
+SRCREV = "44df9dd3dc411ca1255cb4b23bde7eb71aed4778"
+PV = "0.1.8+git${SRCPV}"
+PR = "r1"
 
-SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
-           file://index-ignore-filenotfound.patch \
-           file://mtime-int.patch"
+SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=git \
+           "
 
-S = "${WORKDIR}/opkg-utils"
+S = "${WORKDIR}/git"
 
 # Avoid circular dependencies from package_ipk.bbclass
 PACKAGES_virtclass-native = ""
 
 do_install() {
-        oe_runmake PREFIX=${prefix} DESTDIR=${D} install
+	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
 }
 
 BBCLASSEXTEND = "native"
-- 
1.7.10



