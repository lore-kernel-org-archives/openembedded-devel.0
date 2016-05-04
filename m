Return-Path: <j-stiffler@ti.com>
X-Greylist: delayed 915 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 May 2016 15:31:01 UTC
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by mail.openembedded.org (Postfix) with ESMTP id CB2C66014F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 May 2016 15:31:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u44FFkn1031606
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 May 2016 10:15:46 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u44FFku7028348
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 May 2016 10:15:46 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 May 2016 10:15:45 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u44FFjgI000410;	Wed, 4 May 2016 10:15:45 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 4 May 2016 11:15:41 -0400
Message-ID: <1462374941-8473-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] opencv: Fix broken deps for opencv meta package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 May 2016 15:31:03 -0000
Content-Type: text/plain

* The opencv meta package's RDEPENDS list is blindly populated with
  all non *-dev, *-dbg, and *-doc packages

* This includes the non-existent opencv-locale package which is added
  to the list by default in oe-core/meta/conf/bitbake.conf
* This issue was hidden as late as jethro as the distutils class was
  overwriting the PACKAGES list
* Therefore add opencv-locale to the opencv meta package blacklist,
  and filter out all packages which contain "locale" in the package
  name to be safe.

* Another issue with the meta package dependency generation logic is
  that it may add other empty, non-existent packages.
* The existence of the opencv-java package depends on the
  PACKAGECONFIG, though it is added as a meta package dependency in
  all cases.
* Therefore check the contents of PKGDEST to only add non-empty
  packages as RDEPENDS for the opencv meta package.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index c1f9802..f168550 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -101,11 +101,22 @@ python populate_packages_prepend () {
     d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
 
     metapkg =  pn
-    blacklist = [ metapkg ]
+    blacklist = [ metapkg, pn + '-locale' ]
     metapkg_rdepends = [ ]
+    pkgdest = d.getVar('PKGDEST', True)
     for pkg in packages[1:]:
-        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') :
-            metapkg_rdepends.append(pkg)
+        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') and not pkg.count('local') :
+            # See if the package is empty by looking at the contents of its PKGDEST subdirectory.
+            # If this subdirectory is empty, then the package is.
+            # Empty packages do not get added to the meta package's RDEPENDS
+            pkgdir = os.path.join(pkgdest, pkg)
+            if os.path.exists(pkgdir):
+                dir_contents = os.listdir(pkgdir) or []
+            else:
+                dir_contents = []
+            is_empty = len(dir_contents) == 0
+            if not is_empty:
+                metapkg_rdepends.append(pkg)
     bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
 
 }
@@ -145,4 +156,3 @@ do_install_append() {
     install -d ${D}${datadir}/OpenCV/samples/bin/
     cp -f bin/*-tutorial-* bin/*-example-* ${D}${datadir}/OpenCV/samples/bin/
 }
-
-- 
2.7.4


