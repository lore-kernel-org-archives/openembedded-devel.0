Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhSu6-0000Lc-Ni
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 21:20:47 +0100
Received: by iwn8 with SMTP id 8so4879013iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 12:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=GaDQZ4eyudiD8TTAojywhTgbEuvr5zBFUZ+fxM3nMC0=;
	b=Th3F1M/nAn1A3DRoKjgFtVepBAKHaoyV4Z9rxbytYhozU4CZr/6MthNMZ/PDNvQ9bN
	nv1fOeo3+SwkYGR77GWqJsKsYf2uQzpc0iEE5iw5d73eQjyBvL4CrXUZVvmWPYjcHiss
	T5KK+YJzr7rHrsHNtSu+jqT2johjkJLJrlswc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=R9dWM2OY/Fxtu6PvUjOpjLQ6ONLnbblpYHo/C5Y1ETEAY5KZ6fvCDVF9jwaN7Y2gUL
	PQaWJkA2fpqqfbERSSZIueTEL/BhH/PG1/9Kdx4h1Wrvc6HQv2EJZUVeo1KvwLzR4tON
	dycIPQzIcSGanc1e+k6tOC9xHz3K7Z/6YJ4gM=
Received: by 10.42.164.135 with SMTP id g7mr5388434icy.504.1295900399213;
	Mon, 24 Jan 2011 12:19:59 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id jv9sm10163505icb.13.2011.01.24.12.19.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 24 Jan 2011 12:19:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jan 2011 12:19:59 -0800
Message-Id: <1295900399-4536-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1295900399-4536-1-git-send-email-raj.khem@gmail.com>
References: <1295900399-4536-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 5/5] ipkg-utils: Remove the recipes
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
X-List-Received-Date: Mon, 24 Jan 2011 20:20:47 -0000

* So that they are not accidently used in future

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/ipkg-utils/ipkg-link/link-vfat-libs.patch  |   34 --
 recipes/ipkg-utils/ipkg-link_1.6+cvs20050404.bb    |   20 --
 .../ipkg-utils-native_1.6+cvs20050404.bb           |   20 --
 .../ipkg-utils/arfile_even_alignment.patch         |   11 -
 .../ipkg-utils/arfile_header_split.patch           |   16 -
 recipes/ipkg-utils/ipkg-utils/fields_tweaks.patch  |   70 -----
 recipes/ipkg-utils/ipkg-utils/ipkg-env.patch       |   54 ----
 .../ipkg-utils/ipkg-make-index-track-stamps.patch  |   88 ------
 .../ipkg-utils/ipkg-py-sane-vercompare.patch       |   51 ----
 .../ipkg-utils/ipkg-utils/ipkg-py-tarfile.patch    |  316 --------------------
 recipes/ipkg-utils/ipkg-utils/ipkg-utils-fix.patch |   20 --
 recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb   |   38 ---
 12 files changed, 0 insertions(+), 738 deletions(-)
 delete mode 100644 recipes/ipkg-utils/ipkg-link/link-vfat-libs.patch
 delete mode 100644 recipes/ipkg-utils/ipkg-link_1.6+cvs20050404.bb
 delete mode 100644 recipes/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb
 delete mode 100644 recipes/ipkg-utils/ipkg-utils/arfile_even_alignment.patch
 delete mode 100644 recipes/ipkg-utils/ipkg-utils/arfile_header_split.patch
 delete mode 100644 recipes/ipkg-utils/ipkg-utils/fields_tweaks.patch
 delete mode 100644 recipes/ipkg-utils/ipkg-utils/ipkg-env.patch
 delete mode 100644 recipes/ipkg-utils/ipkg-utils/ipkg-make-index-track-stamps.patch
 delete mode 100644 recipes/ipkg-utils/ipkg-utils/ipkg-py-sane-vercompare.patch
 delete mode 100644 recipes/ipkg-utils/ipkg-utils/ipkg-py-tarfile.patch
 delete mode 100644 recipes/ipkg-utils/ipkg-utils/ipkg-utils-fix.patch
 delete mode 100644 recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb

diff --git a/recipes/ipkg-utils/ipkg-link/link-vfat-libs.patch b/recipes/ipkg-utils/ipkg-link/link-vfat-libs.patch
deleted file mode 100644
index 7f495f9..0000000
--- a/recipes/ipkg-utils/ipkg-link/link-vfat-libs.patch
+++ /dev/null
@@ -1,34 +0,0 @@
---- ipkg-utils/ipkg-link.orig	2006-04-05 00:08:28.518992136 +0200
-+++ ipkg-utils/ipkg-link	2006-04-05 00:08:40.399186072 +0200
-@@ -58,6 +58,31 @@
- 				`ln -s "$PREFIX$line" "$line"`
- 			fi
- 		fi
-+		
-+		# The next function checks whether the _source_ file (ie: /media/card/something)
-+		# does actually exist. If it doesn't, it could by a library symlink (ie: libsomething.0.1 -> libsomething.0)
-+		# Since VFAT & friends do not support symlinks, these library links would not exist after installation
-+		# and trying to symlink them into the rootfs with ipkg-link results in unconnected symlinks in the rootfs.
-+		# So we use the real lib file in /media/card/whatever and create all needed symlinks in the rootfs
-+		# using the real file as source.
-+                               
-+		if [ ! -e "$PREFIX$line" ]; then
-+			if ( echo "$line" | grep -q "lib" ) ; then
-+				libsearchfile=$(echo $line | sed -e "s#[a-z0-9/.]*/##g")
-+				libfoundfiles=$(find $PREFIX -name "$libsearchfile*")
-+                      
-+				for liblinkfile in $libfoundfiles; do
-+					echo "Linking $line to $liblinkfile"
-+					# link will be pointing to nowhere
-+					if test -L $line; then
-+						rm -f $line
-+					fi
-+				ln -s $liblinkfile $line 
-+	                      done
-+			else
-+				echo "WARNING: Source file [$PREFIX$line] is missing!"
-+			fi
-+                fi
- 	done
- }
- 
diff --git a/recipes/ipkg-utils/ipkg-link_1.6+cvs20050404.bb b/recipes/ipkg-utils/ipkg-link_1.6+cvs20050404.bb
deleted file mode 100644
index 6a80d01..0000000
--- a/recipes/ipkg-utils/ipkg-link_1.6+cvs20050404.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SECTION = "base"
-DESCRIPTION = "Itsy Package Manager utilities link script"
-LICENSE = "GPLv2+"
-CONFLICTS = "ipkg-utils"
-SRCDATE = "20050930"
-PR = "r4"
-
-SRC_URI = "${HANDHELDS_CVS};module=ipkg-utils \
-	   file://link-vfat-libs.patch"
-
-S = "${WORKDIR}/ipkg-utils"
-
-do_compile() {
-	:
-}
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 ipkg-link ${D}${bindir}
-}
diff --git a/recipes/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb b/recipes/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb
deleted file mode 100644
index 3a6aaed..0000000
--- a/recipes/ipkg-utils/ipkg-utils-native_1.6+cvs20050404.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require ipkg-utils_${PV}.bb
-
-RDEPENDS_${PN} = ""
-PR = "r25"
-
-inherit native
-
-NATIVE_INSTALL_WORKS = "1"
-
-# Avoid circular dependencies from package_ipk.bbclass
-PACKAGES = ""
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/ipkg-utils"
-INSTALL += "arfile.py"
-
-do_install() {
-	install -d ${D}${bindir}
-        for i in ${INSTALL}; do
-                install -m 0755 $i ${D}${bindir}
-        done
-}
diff --git a/recipes/ipkg-utils/ipkg-utils/arfile_even_alignment.patch b/recipes/ipkg-utils/ipkg-utils/arfile_even_alignment.patch
deleted file mode 100644
index 3ab133f..0000000
--- a/recipes/ipkg-utils/ipkg-utils/arfile_even_alignment.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- ipkg-utils/arfile.py.orig	2008-06-11 21:07:01.000000000 -0500
-+++ ipkg-utils/arfile.py	2008-06-14 19:56:04.000000000 -0500
-@@ -86,6 +86,8 @@
-                 return FileSection(self.f, self.f.tell(), size)
- 
-             # Skip data and loop
-+            if size % 2:
-+                size = size + 1
-             data = self.f.seek(size, 1)
- #            print hex(f.tell())
- 
diff --git a/recipes/ipkg-utils/ipkg-utils/arfile_header_split.patch b/recipes/ipkg-utils/ipkg-utils/arfile_header_split.patch
deleted file mode 100644
index ce1993b..0000000
--- a/recipes/ipkg-utils/ipkg-utils/arfile_header_split.patch
+++ /dev/null
@@ -1,16 +0,0 @@
---- ipkg-utils/arfile.py.orig	2010-09-29 13:38:15.000000000 -0700
-+++ ipkg-utils/arfile.py	2010-10-01 16:06:00.000000000 -0700
-@@ -74,7 +74,12 @@
-             if l == "\n":
-                 l = self.f.readline()
-                 if not l: break
--            descriptor = l.split()
-+            # Field lengths from /usr/include/ar.h:
-+            ar_field_lens = [ 16, 12, 6, 6, 8, 10, 2 ]
-+            descriptor = []
-+            for field_len in ar_field_lens:
-+                descriptor.append(l[:field_len].strip())
-+                l = l[field_len:]
- #            print descriptor
-             size = int(descriptor[5])
-             memberName = descriptor[0][:-1]
diff --git a/recipes/ipkg-utils/ipkg-utils/fields_tweaks.patch b/recipes/ipkg-utils/ipkg-utils/fields_tweaks.patch
deleted file mode 100644
index 2b08e47..0000000
--- a/recipes/ipkg-utils/ipkg-utils/fields_tweaks.patch
+++ /dev/null
@@ -1,70 +0,0 @@
----
- Makefile         |    2 ++
- ipkg-list-fields |   13 +++++++++++++
- ipkg.py          |    8 +++++++-
- 3 files changed, 22 insertions(+), 1 deletion(-)
-
-Index: ipkg-utils/Makefile
-===================================================================
---- ipkg-utils.orig/Makefile	2007-06-13 22:45:47.000000000 +0100
-+++ ipkg-utils/Makefile	2007-06-13 22:46:50.000000000 +0100
-@@ -15,6 +15,8 @@ install: ${UTILS}
- 	python setup.py install
- 	chmod agu+rx ipkg-make-index
- 	cp -f ipkg-make-index $(PREFIX)/bin
-+	chmod agu+rx ipkg-list-fields
-+	cp -f ipkg-list-fields $(PREFIX)/bin
- 
- binary: build
- 	mkdir -p ipkg-build-binary/usr/bin
-Index: ipkg-utils/ipkg-list-fields
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ ipkg-utils/ipkg-list-fields	2007-06-13 22:43:32.000000000 +0100
-@@ -0,0 +1,13 @@
-+#!/usr/bin/python
-+
-+import sys, ipkg
-+
-+def usage():
-+     sys.stderr.write("%s ipk\n" % (sys.argv[0],))
-+     sys.exit(-1)
-+
-+if (len(sys.argv) < 2):
-+     usage()
-+
-+print ipkg.Package(sys.argv[1])
-+
-Index: ipkg-utils/ipkg.py
-===================================================================
---- ipkg-utils.orig/ipkg.py	2007-06-13 22:44:50.000000000 +0100
-+++ ipkg-utils/ipkg.py	2007-06-13 22:39:44.000000000 +0100
-@@ -139,6 +139,9 @@ class Package:
-         self.installed_size = None
-         self.filename = None
-         self.isdeb = 0
-+        self.homepage = None
-+        self.oe = None
-+        self.priority = None
-         self.fn = fn
- 
- 	if fn:
-@@ -211,7 +214,7 @@ class Package:
-                 elif self.__dict__.has_key(name):
-                     self.__dict__[name] = value
- 		else:
--		    #print "Lost field %s, %s" % (name,value)
-+		    print "Lost field %s, %s" % (name,value)
-                     pass
- 
-                 if line and line[0] == '\n':
-@@ -402,6 +405,9 @@ class Package:
-         if self.filename: out = out + "Filename: %s\n" % (self.filename)
-         if self.source: out = out + "Source: %s\n" % (self.source)
-         if self.description: out = out + "Description: %s\n" % (self.description)
-+        if self.oe: out = out + "OE: %s\n" % (self.oe)
-+        if self.homepage: out = out + "HomePage: %s\n" % (self.homepage)
-+        if self.priority: out = out + "Priority: %s\n" % (self.priority)
- 	out = out + "\n"
- 
- 	return out
diff --git a/recipes/ipkg-utils/ipkg-utils/ipkg-env.patch b/recipes/ipkg-utils/ipkg-utils/ipkg-env.patch
deleted file mode 100644
index 7d3025d..0000000
--- a/recipes/ipkg-utils/ipkg-utils/ipkg-env.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-diff -Nur ipkg-utils.orig/ipkg-list-fields ipkg-utils/ipkg-list-fields
---- ipkg-utils.orig/ipkg-list-fields	2009-01-17 21:52:36.000000000 +0100
-+++ ipkg-utils/ipkg-list-fields	2009-01-17 21:55:08.000000000 +0100
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/env python
- 
- import sys, ipkg
- 
-diff -Nur ipkg-utils.orig/ipkg-make-index ipkg-utils/ipkg-make-index
---- ipkg-utils.orig/ipkg-make-index	2009-01-17 21:52:36.000000000 +0100
-+++ ipkg-utils/ipkg-make-index	2009-01-17 21:55:13.000000000 +0100
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/env python
- # $Id: ipkg-make-index,v 1.22 2005/03/03 16:39:04 jamey Exp $
- 
- import sys, os, posixpath
-diff -Nur ipkg-utils.orig/ipkg-show-deps ipkg-utils/ipkg-show-deps
---- ipkg-utils.orig/ipkg-show-deps	2009-01-17 21:52:36.000000000 +0100
-+++ ipkg-utils/ipkg-show-deps	2009-01-17 21:55:21.000000000 +0100
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/env python
- # $Id: ipkg-show-deps,v 1.2 2004/03/06 13:08:33 pb Exp $
- 
- import sys, os, posixpath
-diff -Nur ipkg-utils.orig/ipkg-unbuild ipkg-utils/ipkg-unbuild
---- ipkg-utils.orig/ipkg-unbuild	2009-01-17 21:52:35.000000000 +0100
-+++ ipkg-utils/ipkg-unbuild	2009-01-17 21:55:24.000000000 +0100
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/env python
- 
- import sys, os, re
- 
-diff -Nur ipkg-utils.orig/ipkg-update-index ipkg-utils/ipkg-update-index
---- ipkg-utils.orig/ipkg-update-index	2009-01-17 21:52:36.000000000 +0100
-+++ ipkg-utils/ipkg-update-index	2009-01-17 21:55:29.000000000 +0100
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python2.1
-+#!/usr/bin/env python
- 
- import sys, os
- from glob import glob
-diff -Nur ipkg-utils.orig/ipkg-upload ipkg-utils/ipkg-upload
---- ipkg-utils.orig/ipkg-upload	2009-01-17 21:52:36.000000000 +0100
-+++ ipkg-utils/ipkg-upload	2009-01-17 21:55:33.000000000 +0100
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/env python
- 
- import sys, os, os.path, re
- 
diff --git a/recipes/ipkg-utils/ipkg-utils/ipkg-make-index-track-stamps.patch b/recipes/ipkg-utils/ipkg-utils/ipkg-make-index-track-stamps.patch
deleted file mode 100644
index 68758ed..0000000
--- a/recipes/ipkg-utils/ipkg-utils/ipkg-make-index-track-stamps.patch
+++ /dev/null
@@ -1,88 +0,0 @@
----
- ipkg-make-index |   31 +++++++++++++++++++++++++++----
- 1 file changed, 27 insertions(+), 4 deletions(-)
-
-Index: ipkg-utils/ipkg-make-index
-===================================================================
---- ipkg-utils.orig/ipkg-make-index	2007-05-26 23:45:56.000000000 +0100
-+++ ipkg-utils/ipkg-make-index	2007-05-26 23:47:25.000000000 +0100
-@@ -40,6 +40,7 @@ def to_locale(filename, locale):
- old_filename = None
- packages_filename = None
- filelist_filename = "Packages.filelist"
-+stamplist_filename = "Packages.stamps"
- opt_s = 0
- opt_m = 0
- (opts, remaining_args) = getopt.getopt(sys.argv[1:], "hl:p:vsmr:L:")
-@@ -50,6 +51,7 @@ for (optkey, optval) in opts:
-           opt_s = 1
-      if optkey == '-p': 
-           packages_filename = optval
-+          stamplist_filename = optval + ".stamps"
-      if optkey == '-l':
-           filelist_filename = optval
-      if optkey == '-v':
-@@ -72,6 +74,7 @@ old_pkg_hash = {}
- if packages_filename and not old_filename and os.path.exists(packages_filename):
-      old_filename = packages_filename
- 
-+pkgsStamps = {}
- if old_filename:
-      if (verbose):
-           sys.stderr.write("Reading package list from " + old_filename + "\n")
-@@ -80,6 +83,14 @@ if old_filename:
-      for k in old_packages.packages.keys():
-           p = old_packages.packages[k]
-           old_pkg_hash[p.filename] = p
-+     try:
-+        f = open(stamplist_filename, "r")
-+        for l in f:
-+            l = l.strip()
-+            s, f = l.split(" ", 1)
-+            pkgsStamps[f] = int(s)
-+     except IOError:
-+        pass
- 
- if (verbose):
-      sys.stderr.write("Reading in all the package info from %s\n" % (pkg_dir, ))
-@@ -87,11 +98,17 @@ files=glob(pkg_dir + '/*.ipk') + glob(pk
- files.sort()
- for filename in files:
-      basename = os.path.basename(filename)
-+     pkg = None
-+     fnameStat = os.stat(filename)
-      if old_pkg_hash.has_key(basename):
--          if (verbose):
-+          if pkgsStamps.has_key(basename) and int(fnameStat.st_mtime) == pkgsStamps[basename]:
-+            if (verbose):
-                sys.stderr.write("Found %s in Packages\n" % (filename,))
--          pkg = old_pkg_hash[basename]
--     else:
-+            pkg = old_pkg_hash[basename]
-+          else:
-+               sys.stderr.write("Found %s in Packages, but mtime differs - re-reading\n" % (filename,))
-+
-+     if not pkg:
-           if (verbose):
-                sys.stderr.write("Reading info for package %s\n" % (filename,))
-           pkg = ipkg.Package(filename)
-@@ -101,6 +118,7 @@ for filename in files:
-      else:
-           old_filename = ""
-      s = packages.add_package(pkg)
-+     pkgsStamps[basename] = fnameStat.st_mtime
-      if s == 0:
-           if old_filename:
-                # old package was displaced by newer
-@@ -114,6 +132,11 @@ for filename in files:
-           if opt_s:
-                print filename
- 
-+pkgsStampsFile = open(stamplist_filename, "w")
-+for f in pkgsStamps.keys():
-+    pkgsStampsFile.write("%d %s\n" % (pkgsStamps[f], f))
-+pkgsStampsFile.close()
-+
- if opt_s:
-      sys.exit(0)
- 
diff --git a/recipes/ipkg-utils/ipkg-utils/ipkg-py-sane-vercompare.patch b/recipes/ipkg-utils/ipkg-utils/ipkg-py-sane-vercompare.patch
deleted file mode 100644
index 00ee391..0000000
--- a/recipes/ipkg-utils/ipkg-utils/ipkg-py-sane-vercompare.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-Only in ipkg-utils: ipkg-py-sane-vercompare.patch
-diff -ur ipkg-utils.org/ipkg.py ipkg-utils/ipkg.py
---- ipkg-utils.org/ipkg.py	2005-01-08 18:08:52.000000000 +0000
-+++ ipkg-utils/ipkg.py	2007-04-04 11:52:46.000000000 +0000
-@@ -48,9 +48,9 @@
-         self.epoch = epoch
-         self.version = version
- 
--    def _versioncompare(self, ref):
--        selfversion = self.version
--        refversion = ref.version
-+    def _versioncompare(self, selfversion, refversion):
-+        if not selfversion: selfversion = ""
-+        if not refversion: refversion = ""
-         while 1:
-             ## first look for non-numeric version component
-             selfm = re.match('([^0-9]*)(.*)', selfversion)
-@@ -89,7 +89,18 @@
-         elif (self.epoch < ref.epoch):
-             return -1
-         else:
--            return self._versioncompare(ref)
-+	    self_ver_comps = re.match(r"(.+?)(-r.+)?$", self.version)
-+	    ref_ver_comps = re.match(r"(.+?)(-r.+)?$", ref.version)
-+	    #print (self_ver_comps.group(1), self_ver_comps.group(2))
-+	    #print (ref_ver_comps.group(1), ref_ver_comps.group(2))
-+	    r = self._versioncompare(self_ver_comps.group(1), ref_ver_comps.group(1))
-+	    if r == 0:
-+		r = self._versioncompare(self_ver_comps.group(2), ref_ver_comps.group(2))
-+	    #print "compare: %s vs %s = %d" % (self, ref, r)
-+	    return r
-+
-+    def __str__(self):
-+        return str(self.epoch) + ":" + self.version
- 
- def parse_version(versionstr):
-     epoch = 0
-@@ -445,6 +456,13 @@
-         return self.packages[key]
- 
- if __name__ == "__main__":
-+
-+    assert Version(0, "1.2.2-r1").compare(Version(0, "1.2.3-r0")) == -1
-+    assert Version(0, "1.2.2-r0").compare(Version(0, "1.2.2+cvs20070308-r0")) == -1
-+    assert Version(0, "1.2.2+cvs20070308").compare(Version(0, "1.2.2-r0")) == 1
-+    assert Version(0, "1.2.2-r0").compare(Version(0, "1.2.2-r0")) == 0
-+    assert Version(0, "1.2.2-r5").compare(Version(0, "1.2.2-r0")) == 1
-+
-     package = Package()
- 
-     package.set_package("FooBar")
diff --git a/recipes/ipkg-utils/ipkg-utils/ipkg-py-tarfile.patch b/recipes/ipkg-utils/ipkg-utils/ipkg-py-tarfile.patch
deleted file mode 100644
index 10fdbe3..0000000
--- a/recipes/ipkg-utils/ipkg-utils/ipkg-py-tarfile.patch
+++ /dev/null
@@ -1,316 +0,0 @@
-Index: ipkg-utils/arfile.py
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ ipkg-utils/arfile.py	2008-05-30 15:33:49.000000000 +0100
-@@ -0,0 +1,124 @@
-+"""
-+arfile - A module to parse GNU ar archives.
-+
-+Copyright (c) 2006-7 Paul Sokolovsky
-+This file is released under the terms 
-+of GNU General Public License v2 or later.
-+"""
-+import sys
-+import os
-+import tarfile 
-+
-+
-+class FileSection:
-+    "A class which allows to treat portion of file as separate file object."
-+
-+    def __init__(self, f, offset, size):
-+        self.f = f
-+        self.offset = offset
-+        self.size = size
-+        self.seek(0, 0)
-+
-+    def seek(self, offset, whence = 0):
-+#        print "seek(%x, %d)" % (offset, whence)
-+        if whence == 0:
-+            return self.f.seek(offset + self.offset, whence)
-+        elif whence == 1:
-+            return self.f.seek(offset, whence)
-+        elif whence == 2:
-+            return self.f.seek(self.offset + self.size + offset, 0)
-+        else:
-+            assert False
-+
-+    def tell(self):
-+#        print "tell()"
-+        return self.f.tell() - self.offset
-+
-+    def read(self, size = -1):
-+#        print "read(%d)" % size
-+        return self.f.read(size)
-+
-+class ArFile:
-+
-+    def __init__(self, f):
-+        self.f = f
-+        self.directory = {}
-+        self.directoryRead = False
-+
-+        signature = self.f.readline()
-+        assert signature == "!<arch>\n"
-+        self.directoryOffset = self.f.tell()
-+
-+    def open(self, fname):
-+        if self.directory.has_key(fname):
-+            return FileSection(self.f, self.directory[fname][-1], int(self.directory[fname][5]))
-+
-+        if self.directoryRead:
-+            raise IOError, (2, "AR member not found: " + fname)
-+
-+        f = self._scan(fname)
-+        if f == None:
-+            raise IOError, (2, "AR member not found: " + fname)
-+        return f
-+
-+
-+    def _scan(self, fname):
-+        self.f.seek(self.directoryOffset, 0)
-+
-+        while True:
-+            l = self.f.readline()
-+            if not l: 
-+                self.directoryRead = True
-+                return None
-+
-+            if l == "\n":
-+                l = self.f.readline()
-+                if not l: break
-+            descriptor = l.split()
-+#            print descriptor
-+            size = int(descriptor[5])
-+            memberName = descriptor[0][:-1]
-+            self.directory[memberName] = descriptor + [self.f.tell()]
-+#            print "read:", memberName
-+            if memberName == fname or (memberName.startswith("`") and memberName[1:] == fname):
-+                # Record directory offset to start from next time
-+                self.directoryOffset = self.f.tell() + size
-+                return FileSection(self.f, self.f.tell(), size)
-+
-+            # Skip data and loop
-+            data = self.f.seek(size, 1)
-+#            print hex(f.tell())
-+
-+
-+if __name__ == "__main__":
-+    if None:
-+        f = open(sys.argv[1], "rb")
-+
-+        ar = ArFile(f)
-+        tarStream = ar.open("data.tar.gz")
-+        print "--------"
-+        tarStream = ar.open("data.tar.gz")
-+        print "--------"
-+        tarStream = ar.open("control.tar.gz")
-+        print "--------"
-+        tarStream = ar.open("control.tar.gz2")
-+
-+        sys.exit(0)
-+
-+
-+    dir = "."
-+    if len(sys.argv) > 1:
-+        dir = sys.argv[1]
-+    for f in os.listdir(dir):
-+        if not f.endswith(".ipk"): continue
-+
-+        print "=== %s ===" % f
-+        f = open(dir + "/" + f, "rb")
-+
-+        ar = ArFile(f)
-+        tarStream = ar.open("control.tar.gz")
-+        tarf = tarfile.open("control.tar.gz", "r", tarStream)
-+        #tarf.list()
-+
-+        f2 = tarf.extractfile("control")
-+        print f2.read()
-Index: ipkg-utils/ipkg.py
-===================================================================
---- ipkg-utils.orig/ipkg.py	2008-05-30 15:33:49.000000000 +0100
-+++ ipkg-utils/ipkg.py	2008-05-30 15:35:58.000000000 +0100
-@@ -41,6 +41,8 @@
- import string
- import commands
- from stat import ST_SIZE
-+import arfile
-+import tarfile
- 
- class Version:
-     """A class for holding parsed package version information."""
-@@ -131,78 +133,63 @@
- 	self.section = None
-         self.filename_header = None
- 	self.file_list = []
--        self.md5 = None
-+        # md5 is lazy attribute, computed on demand
-+        #self.md5 = None
-         self.size = None
-         self.installed_size = None
-         self.filename = None
-         self.isdeb = 0
-+        self.fn = fn
- 
- 	if fn:
-             # see if it is deb format
--            f = open(fn, "r")
-+            f = open(fn, "rb")
-             magic = f.read(4)
--            f.close()
-+            f.seek(0, 0)
-             if (magic == "!<ar"):
-                 self.isdeb = 1
- 
--            # compute the MD5.
--            f = open(fn, "r")
--            sum = md5.new()
--            while 1:
--                data = f.read(1024)
--                if not data: break
--                sum.update(data)
--            f.close()
--            if sys.version[:1] > '2':
--                # when using Python 2.0 or newer
--                self.md5 = sum.hexdigest() 
--            else:
--                self.md5 = string.join(map((lambda x:"%02x" % ord(x)),sum.digest()),'')
-             stat = os.stat(fn)
--            self.size = stat[ST_SIZE]
-+            self.size = stat[ST_SIZE]    
-             self.filename = os.path.basename(fn)
- 	    ## sys.stderr.write("  extracting control.tar.gz from %s\n"% (fn,)) 
--            if self.isdeb:
--                control = os.popen("ar p "+fn+" control.tar.gz | tar xfzO - './control'","r")
--            else:
--                control = os.popen("tar xfzO "+fn+" 'control.tar.gz' | tar xfzO - './control'","r")
--            line = control.readline()
--            while 1:
--                if not line: break
--                line = string.rstrip(line)
--                lineparts = re.match(r'([\w-]*?):\s*(.*)', line)
--		if lineparts:
--                    name = string.lower(lineparts.group(1))
--		    value = lineparts.group(2)
--		    while 1:
--			line = control.readline()
--			if not line: break
--			if line[0] != ' ': break
--                        line = string.rstrip(line)
--			value = value + '\n' + line
--                    # don't allow package to override its own filename
--                    if name == "filename":
--                        self.filename_header = value
--                    else:
--                        if self.__dict__.has_key(name):
--                            self.__dict__[name] = value
--                else:
--                    line = control.readline()
-+	    if self.isdeb:
-+        	ar = arfile.ArFile(f)
-+        	tarStream = ar.open("control.tar.gz")
-+        	tarf = tarfile.open("control.tar.gz", "r", tarStream)
-+
-+        	try:
-+        	    control = tarf.extractfile("control")
-+        	except KeyError:
-+        	    control = tarf.extractfile("./control")
-+	    else:
-+		control = os.popen("tar --wildcards -xzO -f " + fn + " '*control.tar.gz' | tar xfzO - './control'", "r")
-+
-+            self.read_control(control)
-             control.close()
--            if self.isdeb:
--                data = os.popen("ar p "+fn+" data.tar.gz | tar tfz -","r")
--            else:
--                data = os.popen("tar xfzO "+fn+" '*data.tar.gz' | tar tfz -","r")
--            while 1:
--                line = data.readline()
--                if not line: break
--                self.file_list.append(string.rstrip(line))
--            data.close()
- 
- 	self.scratch_dir = None
- 	self.file_dir = None
- 	self.meta_dir = None
- 
-+    def __getattr__(self, name):
-+        if name == "md5":
-+            self._computeFileMD5()
-+            return self.md5
-+        else:
-+            raise AttributeError, name
-+
-+    def _computeFileMD5(self):
-+        # compute the MD5.
-+        f = open(self.fn, "rb")
-+        sum = md5.new()
-+        while 1:
-+            data = f.read(1024)
-+            if not data: break
-+            sum.update(data)
-+        f.close()
-+        self.md5 = sum.hexdigest()
-+
-     def read_control(self, control):
-         import os
- 
-@@ -221,9 +208,15 @@
-                     value = value + '\n' + line
-                 if name == 'size':
-                     self.size = int(value)
-+	        elif name == 'md5sum':
-+                    self.md5 = value
-                 elif self.__dict__.has_key(name):
-                     self.__dict__[name] = value
--                if line[0] == '\n':
-+		else:
-+		    #print "Lost field %s, %s" % (name,value)
-+                    pass
-+
-+                if line and line[0] == '\n':
-                     return # consumes one blank line at end of package descriptoin
-             else:
-                 line = control.readline()
-@@ -314,7 +307,27 @@
- 	return self.section
- 
-     def get_file_list(self):
--	return self.file_list
-+        if not self.fn:
-+            return []
-+	
-+	if self.isdeb:
-+    	    f = open(self.fn, "rb")
-+    	    ar = arfile.ArFile(f)
-+    	    tarStream = ar.open("data.tar.gz")
-+    	    tarf = tarfile.open("data.tar.gz", "r", tarStream)
-+    	    self.file_list = tarf.getnames()
-+    	    f.close()
-+	else:
-+            f = os.popen("tar xfzO " + self.fn + " '*data.tar.gz' | tar tfz -","r") 
-+            while 1: 
-+                line = f.readline() 
-+                if not line: break 
-+                self.file_list.append(string.rstrip(line)) 
-+            f.close() 
-+
-+        # Make sure that filelist has consistent format regardless of tar version
-+        self.file_list = map(lambda a: ["./", ""][a.startswith("./")] + a, self.file_list)
-+        return self.file_list
- 
-     def write_package(self, dirname):
-         buf = self.render_control()
-Index: ipkg-utils/setup.py
-===================================================================
---- ipkg-utils.orig/setup.py	2005-03-03 16:40:17.000000000 +0000
-+++ ipkg-utils/setup.py	2008-05-30 15:33:49.000000000 +0100
-@@ -16,6 +16,6 @@
- 		      platforms = 'POSIX',
- 		      keywords = 'ipkg familiar',
-                       url = 'http://www.handhelds.org/sources.html/',
--                      py_modules = [ 'ipkg' ],
-+                      py_modules = [ 'ipkg', 'arfile' ],
- 		      scripts = ['ipkg-compare-indexes', 'ipkg-make-index', 'ipkg-update-index', 'ipkg-build', 'ipkg-unbuild', 'ipkg-upload']
-                       )
diff --git a/recipes/ipkg-utils/ipkg-utils/ipkg-utils-fix.patch b/recipes/ipkg-utils/ipkg-utils/ipkg-utils-fix.patch
deleted file mode 100644
index b3e0d62..0000000
--- a/recipes/ipkg-utils/ipkg-utils/ipkg-utils-fix.patch
+++ /dev/null
@@ -1,20 +0,0 @@
----
- ipkg.py |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-Index: ipkg-utils/ipkg.py
-===================================================================
---- ipkg-utils.orig/ipkg.py	2007-05-26 23:49:05.000000000 +0100
-+++ ipkg-utils/ipkg.py	2007-05-26 23:49:23.000000000 +0100
-@@ -152,9 +152,9 @@ class Package:
-             self.filename = os.path.basename(fn)
- 	    ## sys.stderr.write("  extracting control.tar.gz from %s\n"% (fn,)) 
-             if self.isdeb:
--                control = os.popen("ar p "+fn+" control.tar.gz | tar xfzO - '*control'","r")
-+                control = os.popen("ar p "+fn+" control.tar.gz | tar xfzO - './control'","r")
-             else:
--                control = os.popen("tar xfzO "+fn+" '*control.tar.gz' | tar xfzO - '*control'","r")
-+                control = os.popen("tar xfzO "+fn+" 'control.tar.gz' | tar xfzO - './control'","r")
-             line = control.readline()
-             while 1:
-                 if not line: break
diff --git a/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb b/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
deleted file mode 100644
index 26584e9..0000000
--- a/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-DESCRIPTION = "Itsy Package Manager utilities"
-SECTION = "base"
-PRIORITY = "optional"
-LICENSE = "GPLv2+"
-CONFLICTS = "ipkg-link"
-RDEPENDS_${PN} = "python"
-SRCDATE = "20050930"
-PR = "r28"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-SRC_URI = "${HANDHELDS_CVS};module=ipkg-utils \
-           file://ipkg-utils-fix.patch \
-           file://ipkg-py-sane-vercompare.patch \
-           file://ipkg-py-tarfile.patch \
-           file://arfile_even_alignment.patch \
-           file://ipkg-make-index-track-stamps.patch \
-           file://fields_tweaks.patch \
-           file://ipkg-env.patch \
-           file://arfile_header_split.patch \
-	   "
-
-S = "${WORKDIR}/ipkg-utils"
-
-INSTALL = "ipkg-build ipkg-deb-unbuild ipkg-unbuild ipkg-compare-versions ipkg-upload ipkg-make-index ipkg-link ipkg.py ipkg-list-fields"
-
-do_compile() {
-	oe_runmake ipkg-compare-versions
-}
-
-do_install() {
-	install -d ${D}${bindir}
-	for i in ${INSTALL}
-	do
-		install -m 0755 $i ${D}${bindir}
-	done
-}
-
-- 
1.7.0.4



