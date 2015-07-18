Return-Path: <sjl@dent.vctlabs.com>
Received: from dent.vctlabs.com (dent.vctlabs.com [68.183.110.161])
	by mail.openembedded.org (Postfix) with ESMTP id CAE9773BB8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jul 2015 00:28:29 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id CDA3EC078A; Fri, 17 Jul 2015 17:38:12 -0700 (PDT)
Date: Fri, 17 Jul 2015 17:38:12 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150718003812.GA18468@dent.vctlabs.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [meta-oe][meta-filesystems][PATCH 1/2] libimobiledevice: remove runtime configure check
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Jul 2015 00:28:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

configure.ac had a runtime check for large file support that got run
on 64-bit architectures, and all runtime checks must go away to be
cross-compile safe.

Luckily that runtime check was extraneous, so just remove it;
standard AC_SYS_LARGEFILE macro should be sufficient for figuring out
proper settings to get large file support.

Also un-blacklist libimobiledevice, since this problem was the
reason for the blacklist.

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 .../files/configure-fix-largefile.patch            |   38 ++++++++++++++++++++
 .../libimobiledevice/libimobiledevice_1.1.4.bb     |    6 +---
 2 files changed, 39 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/libimobiledevice/files/configure-fix-largefile.patch

diff --git a/meta-oe/recipes-connectivity/libimobiledevice/files/configure-fix-largefile.patch b/meta-oe/recipes-connectivity/libimobiledevice/files/configure-fix-largefile.patch
new file mode 100644
index 0000000..679a8b5
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libimobiledevice/files/configure-fix-largefile.patch
@@ -0,0 +1,38 @@
+Fix configure error in large file checks on 64-bit architectures
+
+ configure:17888: checking for native large file support
+ configure:17891: error: in `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/libimobiledevice/1.1.4-r0/libimobiledevice-1.1.4':
+ configure:17893: error: cannot run test program while cross compiling
+
+configure.ac was using AC_SYS_LARGEFILE macro as is typical, but then
+there was an extra runtime check added beyond that:
+check if off_t is 8 bytes (64 bits) long.
+If that runtime check passed, _FILE_OFFSET_BITS was defined as 64.
+
+Runtime checks need to go away for cross compiling, and luckily this extra
+check was not serving any useful purpose. Note that off_t was *already*
+64 bits, *without* setting _FILE_OFFSET_BITS, which makes _FILE_OFFSET_BITS
+unneeded for large file support. 
+
+If AC_SYS_LARGEFILE macro sets ac_cv_sys_file_offset_bits=no,
+just leave _FILE_OFFSET_BITS undefined!
+
+--- libimobiledevice-1.1.4/configure.ac.old	2015-07-15 01:38:50.900143927 -0700
++++ libimobiledevice-1.1.4/configure.ac	2015-07-15 01:39:13.300144430 -0700
+@@ -174,16 +174,6 @@
+ if test "$enable_largefile" != no; then
+     if test "$ac_cv_sys_file_offset_bits" != 'no'; then
+ 	LFS_CFLAGS="$LFS_CFLAGS -D_FILE_OFFSET_BITS=$ac_cv_sys_file_offset_bits"
+-    else
+-	AC_MSG_CHECKING(for native large file support)
+-	AC_RUN_IFELSE([AC_LANG_SOURCE([#include <unistd.h>
+-	  int main (int argc, char **argv)
+-	  {
+-	      exit(!(sizeof(off_t) == 8));
+-	  }])],
+-	[ac_cv_sys_file_offset_bits=64; AC_DEFINE(_FILE_OFFSET_BITS,64)
+-	 AC_MSG_RESULT(yes)],
+-	[AC_MSG_RESULT(no)])
+     fi
+     if test "$ac_cv_sys_large_files" != 'no'; then
+ 	LFS_CFLAGS="$LFS_CFLAGS -D_LARGE_FILES=1"
diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
index 5256ce0..06260f7 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
@@ -5,17 +5,13 @@ LIC_FILES_CHKSUM = "\
     file://COPYING.LESSER;md5=6ab17b41640564434dda85c06b7124f7 \
 "
 
-#| configure:17888: checking for native large file support
-#| configure:17891: error: in `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/libimobiledevice/1.1.4-r0/libimobiledevice-1.1.4':
-#| configure:17893: error: cannot run test program while cross compiling
-PNBLACKLIST[libimobiledevice] ?= "cannot run test program while cross compiling"
-
 HOMEPAGE ="http://www.libimobiledevice.org/"
 
 DEPENDS = "libplist usbmuxd libtasn1 gnutls libgcrypt"
 
 SRC_URI = " \
     http://www.libimobiledevice.org/downloads/libimobiledevice-${PV}.tar.bz2 \
+    file://configure-fix-largefile.patch \
 "
 
 SRC_URI[md5sum] = "3f28cbc6a2e30d34685049c0abde5183"
-- 
1.7.10.4


