Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SPgob-0000oK-Lz
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 23:10:25 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 969C7EA04B;
	Wed,  2 May 2012 23:14:32 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id A7C0264387; Wed,  2 May 2012 23:00:40 +0200 (CEST)
Date: Wed, 2 May 2012 23:00:40 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20120502210040.GB3781@hermes>
References: <1334180792-20535-1-git-send-email-apelete@seketeli.net>
	<20120411125503.GB3637@jama.jama.net>
	<20120412204417.GD3256@hermes>
	<20120412210108.GA3945@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120412210108.GA3945@jama.jama.net>
X-Operating-System: Debian GNU/Linux wheezy/sid
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] opkg-utils: Update SRC_URI to git.yoctoproject.org
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
X-List-Received-Date: Wed, 02 May 2012 21:10:25 -0000
X-Groupsio-MsgNum: 38541
Content-Type: multipart/mixed; boundary="v9Ux+11Zm5mwPlX6"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 12-Apr-12, Martin Jansa a =E9crit:
> On Thu, Apr 12, 2012 at 10:44:17PM +0200, Apelete Seketeli wrote:
> > Le 11-Apr-12, Martin Jansa a =E9crit:
> > > On Wed, Apr 11, 2012 at 11:46:32PM +0200, Apelete Seketeli wrote:
> > > > This updates SRC_URI as the svn.openmoko.org repository is now do=
wn.
> > > > All the changes of this patch were picked from oe-core and brough=
t
> > > > over.
> > > >=20
> > > > Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
> > > > ---
> > > >  .../opkg-utils/opkg-utils/add-license-field.patch  |   39 ++++++=
+++++++++++
> > > >  .../opkg-utils/arfile_header_split.patch           |   10 +++++
> > > >  .../opkg-utils/index-ignore-filenotfound.patch     |   19 ++++++=
++
> > > >  recipes/opkg-utils/opkg-utils/mtime-int.patch      |    3 ++
> > > >  recipes/opkg-utils/opkg-utils/shebang.patch        |   46 ++++++=
++++++++++++++
> > > >  recipes/opkg-utils/opkg-utils_git.bb               |   31 ++++++=
+++++++
> > > >  recipes/opkg-utils/opkg-utils_svn.bb               |   27 ------=
------
> > > >  7 files changed, 148 insertions(+), 27 deletions(-)
> > > >  create mode 100644 recipes/opkg-utils/opkg-utils/add-license-fie=
ld.patch
> > > >  create mode 100644 recipes/opkg-utils/opkg-utils/shebang.patch
> > > >  create mode 100644 recipes/opkg-utils/opkg-utils_git.bb
> > > >  delete mode 100644 recipes/opkg-utils/opkg-utils_svn.bb
> > >=20
> > > All those patches were sent as git patches for git.yoctoproject.org=
.. so=20
> > > you can ping yocto ML to apply them sooner then after 1.2 release t=
o make this patch
> > > a bit smaller :).
> > >=20
> > > See
> > > https://lists.yoctoproject.org/pipermail/yocto/2012-March/007851.ht=
ml

Okay, I finally got some time to works on this.
I asked on the yocto ML to get the original patches applied, and they
actually got applied (thanks to Richard Purdie).

Please find attached the patch to get the changes into oe-classic. I
don't know if I should create a new thread to submit it, I would
gladly do so if asked to.

Regards.
--=20
        Apelete

--v9Ux+11Zm5mwPlX6
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-opkg-utils-Update-SRC_URI-to-git.yoctoproject.org.patch"

From 3df2107d7477f6709cfeaf918f8ff8d4eb67d43e Mon Sep 17 00:00:00 2001
From: Apelete Seketeli <apelete@seketeli.net>
Date: Wed, 2 May 2012 22:38:00 +0200
Subject: [PATCH] opkg-utils: Update SRC_URI to git.yoctoproject.org

This updates SRC_URI as the svn.openmoko.org repository is now down.
The changes of this patch were picked from oe-core and brought over.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 .../opkg-utils/arfile_header_split.patch           |   17 ------
 .../opkg-utils/index-ignore-filenotfound.patch     |   54 --------------------
 recipes/opkg-utils/opkg-utils/mtime-int.patch      |   27 ----------
 recipes/opkg-utils/opkg-utils_git.bb               |   26 ++++++++++
 recipes/opkg-utils/opkg-utils_svn.bb               |   27 ----------
 5 files changed, 26 insertions(+), 125 deletions(-)
 delete mode 100644 recipes/opkg-utils/opkg-utils/arfile_header_split.patch
 delete mode 100644 recipes/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
 delete mode 100644 recipes/opkg-utils/opkg-utils/mtime-int.patch
 create mode 100644 recipes/opkg-utils/opkg-utils_git.bb
 delete mode 100644 recipes/opkg-utils/opkg-utils_svn.bb

diff --git a/recipes/opkg-utils/opkg-utils/arfile_header_split.patch b/recipes/opkg-utils/opkg-utils/arfile_header_split.patch
deleted file mode 100644
index 4640367..0000000
--- a/recipes/opkg-utils/opkg-utils/arfile_header_split.patch
+++ /dev/null
@@ -1,17 +0,0 @@
---- ipkg-utils/arfile.py.orig	2010-09-29 13:38:15.000000000 -0700
-+++ ipkg-utils/arfile.py	2010-10-01 16:06:00.000000000 -0700
-@@ -74,7 +74,12 @@
-             if l == "\n":
-                 l = self.f.readline()
-                 if not l: break
-             l = l.replace('`', '')
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
diff --git a/recipes/opkg-utils/opkg-utils_git.bb b/recipes/opkg-utils/opkg-utils_git.bb
new file mode 100644
index 0000000..1996c75
--- /dev/null
+++ b/recipes/opkg-utils/opkg-utils_git.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "OPKG Package Manager Utilities"
+SECTION = "base"
+HOMEPAGE = "http://wiki.openmoko.org/wiki/Opkg"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
+RDEPENDS_${PN} = "python"
+RDEPENDS_${PN}_virtclass-native = ""
+SRCREV = "44df9dd3dc411ca1255cb4b23bde7eb71aed4778"
+PV = "0.1.8+git${SRCPV}"
+PR = "r1"
+
+SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=git \
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


--v9Ux+11Zm5mwPlX6--
