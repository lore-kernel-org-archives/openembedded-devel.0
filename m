Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <Alexander.Stohr@gmx.de>) id 1P3sOL-0001nt-1r
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 17:28:31 +0200
Received: (qmail 15692 invoked by uid 0); 7 Oct 2010 15:27:56 -0000
Received: from 193.8.40.126 by www043.gmx.net with HTTP;
	Thu, 07 Oct 2010 17:27:55 +0200 (CEST)
Date: Thu, 07 Oct 2010 17:27:55 +0200
From: "Alexander Stohr" <Alexander.Stohr@gmx.de>
Message-ID: <20101007152755.298000@gmx.net>
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Authenticated: #15156664
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX18n4OM4Vssn3OTglz/kEPLnr3/z/apPrVcTJPz78x
	GTU+ej5ql0hzjotEYORhheRXIjQab2U/R2aQ== 
X-GMX-UID: zdOfdF9HPjl+cY1x0TU2rAA7MTE2NUkz
X-FuHaFi: 
X-SA-Exim-Connect-IP: 213.165.64.23
X-SA-Exim-Mail-From: Alexander.Stohr@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [patch] fix for building freetype-native on a symlinked build environment
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
X-List-Received-Date: Thu, 07 Oct 2010 15:28:31 -0000
X-Groupsio-MsgNum: 24481
Content-Type: multipart/mixed; boundary="========GMX298001286465275401248"

--========GMX298001286465275401248
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

patchyfied for 2.2.1, 2.3.6 and 2.3.12 including recipes changes
see attachment

-- 
GMX DSL Doppel-Flat ab 19,99 &euro;/mtl.! Jetzt auch mit 
gratis Notebook-Flat! http://portal.gmx.net/de/go/dsl

--========GMX298001286465275401248
Content-Type: text/x-patch;
 charset="iso-8859-15";
 name="oe-ft-configure-using-inodes.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="oe-ft-configure-using-inodes.patch"

diff -Nur openembedded.orig/recipes/freetype/freetype-2.2.1/configure-using-inodes.patch openembedded/recipes/freetype/freetype-2.2.1/configure-using-inodes.patch
--- openembedded.orig/recipes/freetype/freetype-2.2.1/configure-using-inodes.patch	1970-01-01 01:00:00.000000000 +0100
+++ openembedded/recipes/freetype/freetype-2.2.1/configure-using-inodes.patch	2010-10-07 17:01:08.000000000 +0200
@@ -0,0 +1,30 @@
+http://git.savannah.gnu.org/cgit/freetype/freetype2.git/commit/?id=75eeb32a2e55ffb3e4102ee56cd913a442d1ac9a
+
+author  Werner Lemberg <wl@gnu.org>     2010-10-03 18:17:27 (GMT)
+
+Avoid `configure' issues with symbolic links.
+Based on a patch from Alexander Stohr <Alexander.Stohr@gmx.de>.
+* configure: Compare directories using `ls -id'.
+Check existence of `reference' subdirectory before creating it.
+
+--- freetype.orig/configure	2010-10-07 16:46:51.000000000 +0200
++++ freetype/configure	2010-10-07 16:49:52.000000000 +0200
+@@ -67,10 +67,15 @@
+ abs_curr_dir=`pwd`
+ abs_ft2_dir=`cd "$ft2_dir" && pwd`
+ 
+-# build a dummy Makefile if we are not building in the source tree
++# build a dummy Makefile if we are not building in the source tree;
++# we use inodes to avoid issues with symbolic links
++inode_src=`ls -id $abs_ft2_dir | sed 's/ .*//'`
++inode_dst=`ls -id $abs_curr_dir | sed 's/ .*//'`
+ 
+-if test "$abs_curr_dir" != "$abs_ft2_dir"; then
+-  mkdir reference
++if test $inode_src -ne $inode_dst; then
++  if test ! -d reference; then
++    mkdir reference
++  fi
+   echo "Copying \`modules.cfg'"
+   cp $abs_ft2_dir/modules.cfg $abs_curr_dir
+   echo "Generating \`Makefile'"
diff -Nur openembedded.orig/recipes/freetype/freetype_2.2.1.bb openembedded/recipes/freetype/freetype_2.2.1.bb
--- openembedded.orig/recipes/freetype/freetype_2.2.1.bb	2010-10-07 16:30:39.000000000 +0200
+++ openembedded/recipes/freetype/freetype_2.2.1.bb	2010-10-07 17:03:00.000000000 +0200
@@ -5,7 +5,8 @@
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
 	   file://configure.patch \
-           file://no-hardcode.patch"
+           file://no-hardcode.patch \
+           file://configure-using-inodes.patch"
 S = "${WORKDIR}/freetype-${PV}"
 
 inherit autotools pkgconfig binconfig
diff -Nur openembedded.orig/recipes/freetype/freetype-2.3.12/configure-using-inodes.patch openembedded/recipes/freetype/freetype-2.3.12/configure-using-inodes.patch
--- openembedded.orig/recipes/freetype/freetype-2.3.12/configure-using-inodes.patch	1970-01-01 01:00:00.000000000 +0100
+++ openembedded/recipes/freetype/freetype-2.3.12/configure-using-inodes.patch	2010-10-07 17:11:05.000000000 +0200
@@ -0,0 +1,30 @@
+http://git.savannah.gnu.org/cgit/freetype/freetype2.git/commit/?id=75eeb32a2e55ffb3e4102ee56cd913a442d1ac9a
+
+author  Werner Lemberg <wl@gnu.org>     2010-10-03 18:17:27 (GMT)
+
+Avoid `configure' issues with symbolic links.
+Based on a patch from Alexander Stohr <Alexander.Stohr@gmx.de>.
+* configure: Compare directories using `ls -id'.
+Check existence of `reference' subdirectory before creating it.
+
+--- freetype.orig/configure	2010-10-07 16:46:51.000000000 +0200
++++ freetype/configure	2010-10-07 16:49:52.000000000 +0200
+@@ -78,10 +78,15 @@
+   done
+ fi
+ 
+-# build a dummy Makefile if we are not building in the source tree
++# build a dummy Makefile if we are not building in the source tree;
++# we use inodes to avoid issues with symbolic links
++inode_src=`ls -id $abs_ft2_dir | sed 's/ .*//'`
++inode_dst=`ls -id $abs_curr_dir | sed 's/ .*//'`
+ 
+-if test "$abs_curr_dir" != "$abs_ft2_dir"; then
+-  mkdir reference
++if test $inode_src -ne $inode_dst; then
++  if test ! -d reference; then
++    mkdir reference
++  fi
+   if test ! -r $abs_curr_dir/modules.cfg; then
+     echo "Copying \`modules.cfg'"
+     cp $abs_ft2_dir/modules.cfg $abs_curr_dir
diff -Nur openembedded.orig/recipes/freetype/freetype_2.3.12.bb openembedded/recipes/freetype/freetype_2.3.12.bb
--- openembedded.orig/recipes/freetype/freetype_2.3.12.bb	2010-10-07 16:30:10.000000000 +0200
+++ openembedded/recipes/freetype/freetype_2.3.12.bb	2010-10-07 17:03:24.000000000 +0200
@@ -9,6 +9,7 @@
   file://no-hardcode.patch \
   file://fix-configure.patch \
   file://libtool-tag.patch \
+  file://configure-using-inodes.patch \
 "
 S = "${WORKDIR}/freetype-${PV}"
 
diff -Nur openembedded.orig/recipes/freetype/freetype-2.3.6/configure-using-inodes.patch openembedded/recipes/freetype/freetype-2.3.6/configure-using-inodes.patch
--- openembedded.orig/recipes/freetype/freetype-2.3.6/configure-using-inodes.patch	1970-01-01 01:00:00.000000000 +0100
+++ openembedded/recipes/freetype/freetype-2.3.6/configure-using-inodes.patch	2010-10-07 17:05:13.000000000 +0200
@@ -0,0 +1,30 @@
+http://git.savannah.gnu.org/cgit/freetype/freetype2.git/commit/?id=75eeb32a2e55ffb3e4102ee56cd913a442d1ac9a
+
+author  Werner Lemberg <wl@gnu.org>     2010-10-03 18:17:27 (GMT)
+
+Avoid `configure' issues with symbolic links.
+Based on a patch from Alexander Stohr <Alexander.Stohr@gmx.de>.
+* configure: Compare directories using `ls -id'.
+Check existence of `reference' subdirectory before creating it.
+
+--- freetype.orig/configure	2010-10-07 16:46:51.000000000 +0200
++++ freetype/configure	2010-10-07 16:49:52.000000000 +0200
+@@ -67,10 +67,15 @@
+ abs_curr_dir=`pwd`
+ abs_ft2_dir=`cd "$ft2_dir" && pwd`
+ 
+-# build a dummy Makefile if we are not building in the source tree
++# build a dummy Makefile if we are not building in the source tree;
++# we use inodes to avoid issues with symbolic links
++inode_src=`ls -id $abs_ft2_dir | sed 's/ .*//'`
++inode_dst=`ls -id $abs_curr_dir | sed 's/ .*//'`
+ 
+-if test "$abs_curr_dir" != "$abs_ft2_dir"; then
+-  mkdir reference
++if test $inode_src -ne $inode_dst; then
++  if test ! -d reference; then
++    mkdir reference
++  fi
+   echo "Copying \`modules.cfg'"
+   cp $abs_ft2_dir/modules.cfg $abs_curr_dir
+   echo "Generating \`Makefile'"
diff -Nur openembedded.orig/recipes/freetype/freetype_2.3.6.bb openembedded/recipes/freetype/freetype_2.3.6.bb
--- openembedded.orig/recipes/freetype/freetype_2.3.6.bb	2010-10-07 16:30:26.000000000 +0200
+++ openembedded/recipes/freetype/freetype_2.3.6.bb	2010-10-07 17:03:41.000000000 +0200
@@ -8,6 +8,7 @@
   file://no-hardcode.patch \
   file://fix-configure.patch \
   file://libtool-tag.patch \
+  file://configure-using-inodes.patch \
 "
 S = "${WORKDIR}/freetype-${PV}"
 

--========GMX298001286465275401248--
