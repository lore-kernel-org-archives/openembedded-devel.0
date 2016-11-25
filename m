Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id BA3066060E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 10:40:47 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 3so5293102pgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 02:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0QADTeebX5t/QyjlFxuZnPqEoixLEBJuhf4jBSLvoWU=;
	b=IfpLjeNN+cLTvAE/h7arAyN1oHf4eZvKqNTpcjwpiLBtEr8e32QNqhdEAcBEWwV7JS
	O7DQ/O6Sk34LE38dfXUhUOZ58t9/OJmWE8WqTAUPirRmLaQiEH97gc8FEgTXSGlFAhK1
	qPqGSeBOb+l21O+13YuOW7WJ9VVpp5fr8zE8IGvp8tEniQ7/eXc7mHcCGhxPlKwN1E3J
	/gJtdt7qCkLnbD3ufNBk9aLG8nXN9Ir7VRq9MRynlWenjDaI3e6FgtXqsd+C6jwYAlsT
	tjVsSoqDe7DZMmDgIw31BazQPZL9AwzOqT8JJLkcnObfNHlAjlGUcxzOa2iz922VaQrR
	UvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0QADTeebX5t/QyjlFxuZnPqEoixLEBJuhf4jBSLvoWU=;
	b=aBXKc+mwakFfpdzTTz8i51QGKbB7DmxRcwsTEwFi8TDLodb2jay9pOH37z49aaV/Uz
	/+ITB49vxC9UnJq5yUy+JcGWVCXGAYsL/GCQVs+HG75wKkMa7XSvojuvk6P/4zPrBpTT
	Gifa7E3picg3nmy3FwcoYUBy4iSLC/qGm8jPqkwDH+PwCkhtP3l1cEzQvpAMtC3qQlSM
	KjAeAB1L5h+lKjJkXHdfel377ZDyEIYqD+1tTxAorafj890FGYS8+olB80kG4olO/e5G
	FWME/3cC3lkGTqWaM6Cw+5TCovRenf3mYwJ6KuotR+QWAmAhk1WtjAJZb9fcA7hgHjeR
	P4Og==
X-Gm-Message-State: AKaTC01L7tghW7F0vDHXoIy4ptYfSNvrtwBISRqUji9JF4C2QxpGQHfV0mx/TWl8nQxBQg==
X-Received: by 10.84.139.129 with SMTP id 1mr16117709plr.178.1480070448609;
	Fri, 25 Nov 2016 02:40:48 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	n24sm66821358pfb.0.2016.11.25.02.40.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Nov 2016 02:40:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Nov 2016 02:40:41 -0800
Message-Id: <20161125104041.15300-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-filesystems][PATCH V2 10/42] xfsprogs: Upgrade 3.2.3 -> 4.8.0
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
X-List-Received-Date: Fri, 25 Nov 2016 10:40:47 -0000

Change-Id: I0015da261d540f99bfdebba703fef9403eebff7b
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/drop-configure-check-for-aio.patch       |  93 ----------
 .../xfsprogs/files/link_needed_libs.patch          |  55 ++++++
 .../xfsprogs/files/remove-install-as-user.patch    | 205 ---------------------
 ...nerate-crctable-which-is-moved-into-runti.patch | 170 -----------------
 .../recipes-utils/xfsprogs/xfsprogs_3.2.3.bb       |  55 ------
 .../recipes-utils/xfsprogs/xfsprogs_4.8.0.bb       |  56 ++++++
 6 files changed, 111 insertions(+), 523 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/drop-configure-check-for-aio.patch
 create mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch
 delete mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/remove-install-as-user.patch
 delete mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-generate-crctable-which-is-moved-into-runti.patch
 delete mode 100644 meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
 create mode 100644 meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb

diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/drop-configure-check-for-aio.patch b/meta-filesystems/recipes-utils/xfsprogs/files/drop-configure-check-for-aio.patch
deleted file mode 100644
index 7601095..0000000
--- a/meta-filesystems/recipes-utils/xfsprogs/files/drop-configure-check-for-aio.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-xfsprogs: drop configure check for aio
-
-It's unused and breaks compilation with uclibc.
-
-Upstream-Status: Pending
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- configure.ac         |  6 +++---
- m4/Makefile          |  1 -
- m4/package_aiodev.m4 | 36 ------------------------------------
- 3 files changed, 3 insertions(+), 40 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index b968977..4e2a263 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -47,6 +47,9 @@ AC_ARG_ENABLE(lib64,
- 	enable_lib64=yes)
- AC_SUBST(enable_lib64)
- 
-+librt="-lrt"
-+AC_SUBST(librt)
-+
- #
- # If the user specified a libdir ending in lib64 do not append another
- # 64 to the library names.
-@@ -92,9 +95,6 @@ AC_PACKAGE_GLOBALS(xfsprogs)
- AC_PACKAGE_UTILITIES(xfsprogs)
- AC_MULTILIB($enable_lib64)
- 
--AC_PACKAGE_NEED_AIO_H
--AC_PACKAGE_NEED_LIO_LISTIO
--
- AC_PACKAGE_NEED_UUID_H
- AC_PACKAGE_NEED_UUIDCOMPARE
- 
-diff --git a/m4/Makefile b/m4/Makefile
-index 654a4fb..d282f0a 100644
---- a/m4/Makefile
-+++ b/m4/Makefile
-@@ -14,7 +14,6 @@ CONFIGURE = \
- 
- LSRCFILES = \
- 	manual_format.m4 \
--	package_aiodev.m4 \
- 	package_blkid.m4 \
- 	package_globals.m4 \
- 	package_libcdev.m4 \
-diff --git a/m4/package_aiodev.m4 b/m4/package_aiodev.m4
-index 490d9c8..8b13789 100644
---- a/m4/package_aiodev.m4
-+++ b/m4/package_aiodev.m4
-@@ -1,37 +1 @@
--#
--# Check if we have a libaio.h installed
--#
--AC_DEFUN([AC_PACKAGE_WANT_AIO],
--  [ AC_CHECK_HEADERS(libaio.h, [ have_aio=true ], [ have_aio=false ])
--    AC_SUBST(have_aio)
--  ])
--
--#
--# Check if we have an aio.h installed
--#
--AC_DEFUN([AC_PACKAGE_NEED_AIO_H],
--  [ AC_CHECK_HEADERS(aio.h)
--    if test $ac_cv_header_aio_h = no; then
--	echo
--	echo 'FATAL ERROR: could not find a valid <aio.h> header.'
--	exit 1
--    fi
--  ])
--
--#
--# Check if we have the lio_listio routine in either libc/librt
--#
--AC_DEFUN([AC_PACKAGE_NEED_LIO_LISTIO],
--  [ AC_CHECK_FUNCS(lio_listio)
--    if test $ac_cv_func_lio_listio = yes; then
--	librt=""
--    else
--	AC_CHECK_LIB(rt, lio_listio,, [
--	    echo
--	    echo 'FATAL ERROR: could not find a library with lio_listio.'
--	    exit 1],[-lpthread])
--	librt="-lrt"
--    fi
--    AC_SUBST(librt)
--  ])
- 
--- 
-1.8.1.2
-
diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch b/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch
new file mode 100644
index 0000000..18b95c1
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch
@@ -0,0 +1,55 @@
+Index: xfsprogs-4.8.0/libxcmd/Makefile
+===================================================================
+--- xfsprogs-4.8.0.orig/libxcmd/Makefile
++++ xfsprogs-4.8.0/libxcmd/Makefile
+@@ -30,10 +30,21 @@ LCFLAGS += -DENABLE_EDITLINE
+ LTLIBS += $(LIBEDITLINE) $(LIBTERMCAP)
+ endif
+ 
++ifeq ($(ENABLE_BLKID),yes)
++LCFLAGS += -DENABLE_BLKID
++LTLIBS += $(LIBBLKID)
++endif
++
++LTLIBS += $(LIBXFS)
++
+ default: ltdepend $(LTLIBRARY)
+ 
+ include $(BUILDRULES)
+ 
+-install install-dev: default
++install: default
++	$(INSTALL_LTLIB)
++
++install-dev: default
++	$(INSTALL_LTLIB_DEV)
+ 
+ -include .ltdep
+Index: xfsprogs-4.8.0/libxfs/Makefile
+===================================================================
+--- xfsprogs-4.8.0.orig/libxfs/Makefile
++++ xfsprogs-4.8.0/libxfs/Makefile
+@@ -137,6 +137,7 @@ include $(BUILDRULES)
+ 
+ install: default
+ 	$(INSTALL) -m 755 -d $(PKG_INC_DIR)
++	$(INSTALL_LTLIB)
+ 
+ install-headers: $(addsuffix -hdrs, $(PKGHFILES))
+ 
+Index: xfsprogs-4.8.0/libxlog/Makefile
+===================================================================
+--- xfsprogs-4.8.0.orig/libxlog/Makefile
++++ xfsprogs-4.8.0/libxlog/Makefile
+@@ -19,6 +19,10 @@ default: ltdepend $(LTLIBRARY)
+ 
+ include $(BUILDRULES)
+ 
+-install install-dev: default
++install: default
++	$(INSTALL_LTLIB)
++
++install-dev: default
++	$(INSTALL_LTLIB_DEV)
+ 
+ -include .ltdep
diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/remove-install-as-user.patch b/meta-filesystems/recipes-utils/xfsprogs/files/remove-install-as-user.patch
deleted file mode 100644
index e761db3..0000000
--- a/meta-filesystems/recipes-utils/xfsprogs/files/remove-install-as-user.patch
+++ /dev/null
@@ -1,205 +0,0 @@
-remove install as user
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- include/buildmacros |  2 +-
- include/install-sh  | 95 ++++++++---------------------------------------------
- 2 files changed, 14 insertions(+), 83 deletions(-)
-
-diff --git a/include/buildmacros b/include/buildmacros
-index 7a01880..0840d55 100644
---- a/include/buildmacros
-+++ b/include/buildmacros
-@@ -30,7 +30,7 @@ OBJECTS = $(ASFILES:.s=.o) \
- 	  $(LFILES:.l=.o) \
- 	  $(YFILES:%.y=%.tab.o)
- 
--INSTALL	= $(TOPDIR)/install-sh -o $(PKG_USER) -g $(PKG_GROUP)
-+INSTALL	= $(TOPDIR)/install-sh
- 
- IMAGES_DIR = $(TOPDIR)/all-images
- DIST_DIR = $(TOPDIR)/dist
-diff --git a/include/install-sh b/include/install-sh
-index c952a71..b9d66f7 100755
---- a/include/install-sh
-+++ b/include/install-sh
-@@ -24,11 +24,11 @@
- #       set           set      |    yes        yes
- #
- _usage() {
--    echo "Usage: $prog [-o owner] [-g group] [-m mode] -d directory"
--    echo "or     $prog [-D] [-o owner] [-g group] [-m mode] file directory/file"
--    echo "or     $prog [-o owner] [-g group] [-m mode] file [file ...] directory"
-+    echo "Usage: $prog [-m mode] -d directory"
-+    echo "or     $prog [-m mode] file directory/file"
-+    echo "or     $prog [-m mode] file [file ...] directory"
-     echo "or     $prog -S file target  (creates \"target\" symlink)"
--    echo "or     $prog -T lt_arg [-o owner] [-g group] [-m mode] libtool.lai directory"
-+    echo "or     $prog -T lt_arg [-m mode] libtool.lai directory"
-     echo ""
-     echo "The \$DIST_MANIFEST and \$DIST_ROOT environment variables affect the"
-     echo "behaviour of this command - see comments in the script."
-@@ -38,32 +38,6 @@ _usage() {
-     exit 1
- }
- 
--_chown ()
--{
--    _st=255
--    if [ $# -eq 3 ] ; then
--	chown $1:$2 $3
--	_st=$?
--	if [ $_st -ne 0 ] ; then
--	    if [ $REAL_UID != '0' ] ; then
--		if [ ! -f $DIST_ROOT/.chown.quiet ] ; then
--		    echo '==============================================='
--		    echo Ownership of files under ${DIST_ROOT:-/}
--		    echo cannot be changed
--		    echo '==============================================='
--		    if [ -n "$DIST_ROOT" ] ; then
--			touch $DIST_ROOT/.chown.quiet
--		    fi
--		fi
--	       _st=0
--	    fi     
--	fi
--    fi
--
--    return $_st
--}
--
--
- _manifest ()
- { 
-     echo $* | sed -e 's/\/\//\//g' >>${DIST_MANIFEST:-/dev/null}
-@@ -77,9 +51,6 @@ Sflag=false
- Tflag=false
- DIRMODE=755
- FILEMODE=644
--OWNER=`id -u`
--GROUP=`id -g`
--REAL_UID=$OWNER
- 
- # default is to install and don't append manifest
- INSTALL=true
-@@ -94,24 +65,16 @@ MANIFEST=:
- 
- if $INSTALL
- then
--    CP=cp; LN=ln; MKDIR=mkdir; CHMOD=chmod; CHOWN=_chown
-+    CP=cp; LN=ln; MKDIR=mkdir; CHMOD=chmod;
- else
--    CP=true; LN=true; MKDIR=true; CHMOD=true; CHOWN=true
-+    CP=true; LN=true; MKDIR=true; CHMOD=true;
- fi
- 
--[ -n "$DIST_ROOT" -a $REAL_UID -ne 0 ] && CHOWN=true
--
--while getopts "Dcm:d:S:o:g:T:" c $*
-+while getopts "Dcm:d:S:T:" c $*
- do
-    case $c in
-    c)
- 	;;
--   g)
--	GROUP=$OPTARG
--	;;
--   o)
--	OWNER=$OPTARG
--	;;
-    m)
- 	DIRMODE=`expr $OPTARG`
- 	FILEMODE=$DIRMODE
-@@ -146,18 +109,7 @@ then
-     # first usage
-     #
-     $MKDIR -p $dir 
--    status=$?
--    if [ $status -eq 0 ]
--    then
--	$CHMOD $DIRMODE $dir
--	status=$?
--    fi
--    if [ $status -eq 0 ]
--    then
--	$CHOWN $OWNER $GROUP $dir
--	status=$?
--    fi
--    $MANIFEST d $DIRMODE $OWNER $GROUP ${dir#$DIST_ROOT}
-+    $MANIFEST d $DIRMODE ${dir#$DIST_ROOT}
- elif $Sflag
- then
-     #
-@@ -203,7 +155,7 @@ then
- 			install_name=$target/$solib
- 			$CP $solib $install_name
- 			status=$?
--			$MANIFEST f $FILEMODE $OWNER $GROUP $HERE/$solib ${install_name#$DIST_ROOT}
-+			$MANIFEST f $FILEMODE $HERE/$solib ${install_name#$DIST_ROOT}
- 			break
- 		fi
- 	done
-@@ -254,7 +206,7 @@ then
- 	install_name=$target/$old_library
- 	$CP $old_library $install_name
- 	status=$?
--	$MANIFEST f $FILEMODE $OWNER $GROUP $HERE/$old_library ${install_name#$DIST_ROOT}
-+	$MANIFEST f $FILEMODE $HERE/$old_library ${install_name#$DIST_ROOT}
- 	;;
-     *)
- 	echo "$prog: -T $lt_install invalid"
-@@ -267,7 +219,6 @@ then
- 	if [ $status -eq 0 ]
- 	then
- 		$CHMOD $FILEMODE $install_name
--		$CHOWN $OWNER $GROUP $install_name
- 	fi
- 	;;
-     esac
-@@ -292,23 +243,10 @@ else
- 	then 
- 	    if [ -f $dir/$f ]
- 	    then
--		$CHMOD $FILEMODE $dir/$f
--		status=$?
--		if [ $status -eq 0 ]
--		then
--		    $CHOWN $OWNER $GROUP $dir/$f
--		    status=$?
--		fi
--		$MANIFEST f $FILEMODE $OWNER $GROUP $HERE/$f ${dir#$DIST_ROOT}/$f
-+		$MANIFEST f $FILEMODE $HERE/$f ${dir#$DIST_ROOT}/$f
- 	    else
- 		$CHMOD $FILEMODE $dir
--		status=$?
--		if [ $status -eq 0 ]
--		then
--		    $CHOWN $OWNER $GROUP $dir
--		    status=$?
--		fi
--		$MANIFEST f $FILEMODE $OWNER $GROUP $HERE/$dir ${dir#$DIST_ROOT}
-+		$MANIFEST f $FILEMODE $HERE/$dir ${dir#$DIST_ROOT}
- 	    fi
- 	fi
-     else
-@@ -334,14 +272,7 @@ else
- 	    status=$?
- 	    if [ $status -eq 0 ]
- 	    then
--		$CHMOD $FILEMODE $dir/$f
--		status=$?
--		if [ $status -eq 0 ]
--		then
--		    $CHOWN $OWNER $GROUP $dir/$f
--		    status=$?
--		fi
--		$MANIFEST f $FILEMODE $OWNER $GROUP $HERE/$f ${dir#$DIST_ROOT}/$f
-+		$MANIFEST f $FILEMODE $HERE/$f ${dir#$DIST_ROOT}/$f
- 	    fi
- 	    [ $status -ne 0 ] && break
- 	done
--- 
-1.8.1.2
-
diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-generate-crctable-which-is-moved-into-runti.patch b/meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-generate-crctable-which-is-moved-into-runti.patch
deleted file mode 100644
index b204195..0000000
--- a/meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-generate-crctable-which-is-moved-into-runti.patch
+++ /dev/null
@@ -1,170 +0,0 @@
-From e58cb210a7c15352040a411d11a8383eac0defda Mon Sep 17 00:00:00 2001
-From: Jianchuan Wang <jianchuan.wang@windriver.com>
-Date: Tue, 30 Sep 2014 12:16:17 +0800
-Subject: [PATCH] xfsprogs: generate crctable which is moved into runtime from
- compile
-
-After upgraded, There is a compile error except x86,
-Because crc32.c need two arraies crc32table_le and crc32ctable_le from crc32table.h,
-which are generated by gen_crc32table.c relative to different platforms.
-For this, move the function implementation from gen_crc32table.c to crc.c
-
-Upstream-Status: Pending
-
-Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
----
- libxfs/Makefile | 23 ++----------------
- libxfs/crc32.c  | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++++++--
- 2 files changed, 75 insertions(+), 23 deletions(-)
-
-diff --git a/libxfs/Makefile b/libxfs/Makefile
-index ae15a5d..7670159 100644
---- a/libxfs/Makefile
-+++ b/libxfs/Makefile
-@@ -10,7 +10,7 @@ LT_CURRENT = 0
- LT_REVISION = 0
- LT_AGE = 0
- 
--HFILES = xfs.h init.h xfs_dir2_priv.h crc32defs.h crc32table.h
-+HFILES = xfs.h init.h xfs_dir2_priv.h crc32defs.h
- CFILES = cache.c \
- 	crc32.c \
- 	init.c kmem.c logitem.c radix-tree.c rdwr.c trans.c util.c \
-@@ -43,7 +43,6 @@ CFILES = cache.c \
- CFILES += $(PKG_PLATFORM).c
- PCFILES = darwin.c freebsd.c irix.c linux.c
- LSRCFILES = $(shell echo $(PCFILES) | sed -e "s/$(PKG_PLATFORM).c//g")
--LSRCFILES += gen_crc32table.c
- 
- #
- # Tracing flags:
-@@ -61,25 +60,7 @@ LTLIBS = $(LIBPTHREAD) $(LIBRT)
- # don't try linking xfs_repair with a debug libxfs.
- DEBUG = -DNDEBUG
- 
--LDIRT = gen_crc32table crc32table.h crc32selftest
--
--default: crc32selftest ltdepend $(LTLIBRARY)
--
--crc32table.h: gen_crc32table.c
--	@echo "    [CC]     gen_crc32table"
--	$(Q) $(CC) $(CFLAGS) -o gen_crc32table $<
--	@echo "    [GENERATE] $@"
--	$(Q) ./gen_crc32table > crc32table.h
--
--# The selftest binary will return an error if it fails. This is made a
--# dependency of the build process so that we refuse to build the tools on broken
--# systems/architectures. Hence we make sure that xfsprogs will never use a
--# busted CRC calculation at build time and hence avoid putting bad CRCs down on
--# disk.
--crc32selftest: gen_crc32table.c crc32table.h crc32.c
--	@echo "    [TEST]    CRC32"
--	$(Q) $(CC) $(CFLAGS) -D CRC32_SELFTEST=1 crc32.c -o $@
--	$(Q) ./$@
-+default: ltdepend $(LTLIBRARY)
- 
- include $(BUILDRULES)
- 
-diff --git a/libxfs/crc32.c b/libxfs/crc32.c
-index 0f847d2..be5fbc3 100644
---- a/libxfs/crc32.c
-+++ b/libxfs/crc32.c
-@@ -55,8 +55,6 @@ typedef __u32	u64;
- # define tobe(x) (x)
- #endif
- 
--#include "crc32table.h"
--
- #if CRC_LE_BITS > 8 || CRC_BE_BITS > 8
- 
- /* implements slicing-by-4 or slicing-by-8 algorithm */
-@@ -183,13 +181,86 @@ u32 __pure crc32c_le(u32 crc, unsigned char const *p, size_t len)
- 	return crc32_le_generic(crc, p, len, NULL, CRC32C_POLY_LE);
- }
- #else
-+
-+#include <stdio.h>
-+#include "crc32defs.h"
-+#include <inttypes.h>
-+
-+#define ENTRIES_PER_LINE 4
-+
-+#if CRC_LE_BITS > 8
-+# define LE_TABLE_ROWS (CRC_LE_BITS/8)
-+# define LE_TABLE_SIZE 256
-+#else
-+# define LE_TABLE_ROWS 1
-+# define LE_TABLE_SIZE (1 << CRC_LE_BITS)
-+#endif
-+
-+#if CRC_BE_BITS > 8
-+# define BE_TABLE_ROWS (CRC_BE_BITS/8)
-+# define BE_TABLE_SIZE 256
-+#else
-+# define BE_TABLE_ROWS 1
-+# define BE_TABLE_SIZE (1 << CRC_BE_BITS)
-+#endif
-+
-+static uint32_t crc32table_le[LE_TABLE_ROWS][256];
-+static uint32_t crc32ctable_le[LE_TABLE_ROWS][256];
-+
-+static uint32_t crc32table_le_init = 0;
-+static uint32_t crc32ctable_le_init = 0;
-+
-+/*
-+ * big endian ordered CRC not used by XFS.
-+static uint32_t crc32table_be[BE_TABLE_ROWS][256];
-+ */
-+
-+/**
-+ * crc32init_le() - allocate and initialize LE table data
-+ *
-+ * crc is the crc of the byte i; other entries are filled in based on the
-+ * fact that crctable[i^j] = crctable[i] ^ crctable[j].
-+ *
-+ */
-+static void crc32init_le_generic(const uint32_t polynomial,
-+				 uint32_t (*tab)[256])
-+{
-+	unsigned i, j;
-+	uint32_t crc = 1;
-+
-+	tab[0][0] = 0;
-+
-+	for (i = LE_TABLE_SIZE >> 1; i; i >>= 1) {
-+		crc = (crc >> 1) ^ ((crc & 1) ? polynomial : 0);
-+		for (j = 0; j < LE_TABLE_SIZE; j += 2 * i)
-+			tab[0][i + j] = crc ^ tab[0][j];
-+	}
-+	for (i = 0; i < LE_TABLE_SIZE; i++) {
-+		crc = tab[0][i];
-+		for (j = 1; j < LE_TABLE_ROWS; j++) {
-+			crc = tab[0][crc & 0xff] ^ (crc >> 8);
-+			tab[j][i] = crc;
-+		}
-+	}
-+}
-+
- u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len)
- {
-+	if (crc32table_le_init == 0) {
-+		crc32init_le_generic(CRCPOLY_LE, crc32table_le);
-+		crc32table_le_init == 1;
-+	}	
-+
- 	return crc32_le_generic(crc, p, len,
- 			(const u32 (*)[256])crc32table_le, CRCPOLY_LE);
- }
- u32 __pure crc32c_le(u32 crc, unsigned char const *p, size_t len)
- {
-+	if (crc32ctable_le_init == 0) {
-+		crc32init_le_generic(CRC32C_POLY_LE, crc32ctable_le);
-+		crc32ctable_le_init == 1;
-+	}
-+
- 	return crc32_le_generic(crc, p, len,
- 			(const u32 (*)[256])crc32ctable_le, CRC32C_POLY_LE);
- }
--- 
-1.9.1
-
diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
deleted file mode 100644
index 460a898..0000000
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-SUMMARY = "XFS Filesystem Utilities"
-HOMEPAGE = "http://oss.sgi.com/projects/xfs"
-SECTION = "base"
-LICENSE = "GPLv2 & LGPLv2.1"
-LICENSE_libhandle = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://doc/COPYING;md5=dbdb5f4329b7e7145de650e9ecd4ac2a"
-DEPENDS = "util-linux"
-
-SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${BP}.tar.gz \
-    file://xfsprogs-generate-crctable-which-is-moved-into-runti.patch \
-    file://remove-install-as-user.patch \
-    file://drop-configure-check-for-aio.patch \
-"
-
-SRC_URI[md5sum] = "9f383e36682709e62b12c125e5d8b895"
-SRC_URI[sha256sum] = "7a5124a880997939551b519610a2e54bd4cd0b0adfd563ce3f4de30827109ac9"
-
-inherit autotools-brokensep
-
-PACKAGES =+ "${PN}-fsck ${PN}-mkfs libhandle"
-
-RDEPENDS_${PN} = "${PN}-fsck ${PN}-mkfs"
-
-FILES_${PN}-fsck = "${base_sbindir}/fsck.xfs"
-FILES_${PN}-mkfs = "${base_sbindir}/mkfs.xfs"
-FILES_libhandle = "${base_libdir}/libhandle${SOLIBS}"
-
-EXTRA_OECONF = "--enable-gettext=no"
-do_configure () {
-    # Prevent Makefile from calling configure without arguments,
-    # when do_configure gets called for a second time.
-    rm -f include/builddefs include/platform_defs.h
-    # Recreate configure script.
-    rm -f configure
-    oe_runmake configure
-    # Configure.
-    export DEBUG="-DNDEBUG"
-    gnu-configize --force
-    oe_runconf
-}
-
-LIBTOOL = "${HOST_SYS}-libtool"
-EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
-TARGET_CC_ARCH += "${LDFLAGS}"
-PARALLEL_MAKE = ""
-
-do_install () {
-    export DIST_ROOT=${D}
-    oe_runmake install
-    # needed for xfsdump
-    oe_runmake install-dev
-}
-
-# http://errors.yoctoproject.org/Errors/Details/83236/
-PNBLACKLIST[xfsprogs] ?= "BROKEN: Needs upgrade to 4.5.0 version to be compatible with Kernel uapi changes from 4.5"
diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
new file mode 100644
index 0000000..9959f0d
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
@@ -0,0 +1,56 @@
+SUMMARY = "XFS Filesystem Utilities"
+HOMEPAGE = "http://oss.sgi.com/projects/xfs"
+SECTION = "base"
+LICENSE = "GPLv2 & LGPLv2.1"
+LICENSE_libhandle = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://doc/COPYING;md5=dbdb5f4329b7e7145de650e9ecd4ac2a"
+DEPENDS = "util-linux util-linux-native"
+SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
+           file://link_needed_libs.patch \
+"
+SRC_URI[md5sum] = "4f047bc9a28b48a95c6db0ad5ce4dbcb"
+SRC_URI[sha256sum] = "82ce9cb3a55f4e208e8fe3471ff0aff0602b8300f3e50bdf05cc7e11549686f9"
+
+inherit autotools-brokensep
+
+PACKAGES =+ "${PN}-fsck ${PN}-mkfs ${PN}-repair libhandle"
+
+
+RDEPENDS_${PN} = "${PN}-fsck ${PN}-mkfs ${PN}-repair"
+
+FILES_${PN}-fsck = "${base_sbindir}/fsck.xfs"
+FILES_${PN}-mkfs = "${base_sbindir}/mkfs.xfs"
+FILES_${PN}-repair = "${base_sbindir}/xfs_repair"
+
+FILES_libhandle = "${base_libdir}/libhandle${SOLIBS}"
+
+EXTRA_OECONF = "--enable-gettext=no \
+                INSTALL_USER=root \
+                INSTALL_GROUP=root \
+                ac_cv_header_aio_h=yes \
+                ac_cv_lib_rt_lio_listio=yes \
+"
+
+EXTRA_AUTORECONF += "-I ${S}/m4 --exclude=autoheader"
+
+PACKAGECONFIG ??= "readline blkid"
+
+PACKAGECONFIG[readline] = "--enable-readline=yes,--enable-readline=no,readline"
+PACKAGECONFIG[blkid] = "--enable-blkid=yes,--enable-blkid=no,util-linux"
+
+export DEBUG="-DNDEBUG"
+
+EXTRA_OEMAKE = "DIST_ROOT='${D}'"
+
+do_configure_prepend () {
+    export BUILD_CC="${BUILD_CC} ${BUILD_CFLAGS}"
+    # Prevent Makefile from calling configure without arguments,
+    # when do_configure gets called for a second time.
+    rm -f ${B}/include/builddefs ${B}/include/platform_defs.h ${B}/configure
+    # Recreate configure script.
+    oe_runmake configure
+}
+
+do_install_append() {
+        oe_runmake 'DESTDIR=${D}' install install-dev
+}
-- 
2.10.2


