Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 601FC71AA2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 12:05:46 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 36B2AB80C33; Wed, 30 Nov 2016 13:05:43 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 13:05:43 +0100
Message-Id: <1480507543-21520-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-filesystems][PATCH] xfsprogs: unblacklist and update to 4.8.0
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
X-List-Received-Date: Wed, 30 Nov 2016 12:05:46 -0000

A patch similar to drop-configure-check-for-aio.patch was applied upstream.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../files/drop-configure-check-for-aio.patch       | 93 ----------------------
 ...erate-crctable-which-is-moved-into-runti.patch} | 46 +++++------
 .../0002-remove-install-as-user.patch.patch}       | 40 ++++------
 .../{xfsprogs_3.2.3.bb => xfsprogs_4.8.0.bb}       | 19 ++---
 4 files changed, 46 insertions(+), 152 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/drop-configure-check-for-aio.patch
 rename meta-filesystems/recipes-utils/xfsprogs/{files/xfsprogs-generate-crctable-which-is-moved-into-runti.patch => xfsprogs/0001-xfsprogs-generate-crctable-which-is-moved-into-runti.patch} (82%)
 rename meta-filesystems/recipes-utils/xfsprogs/{files/remove-install-as-user.patch => xfsprogs/0002-remove-install-as-user.patch.patch} (90%)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_3.2.3.bb => xfsprogs_4.8.0.bb} (64%)

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
diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-generate-crctable-which-is-moved-into-runti.patch b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs/0001-xfsprogs-generate-crctable-which-is-moved-into-runti.patch
similarity index 82%
rename from meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-generate-crctable-which-is-moved-into-runti.patch
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs/0001-xfsprogs-generate-crctable-which-is-moved-into-runti.patch
index b204195..d1caca7 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/files/xfsprogs-generate-crctable-which-is-moved-into-runti.patch
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs/0001-xfsprogs-generate-crctable-which-is-moved-into-runti.patch
@@ -1,8 +1,8 @@
-From e58cb210a7c15352040a411d11a8383eac0defda Mon Sep 17 00:00:00 2001
+From 50cc4b1178921dfec0318b0f406618300db24063 Mon Sep 17 00:00:00 2001
 From: Jianchuan Wang <jianchuan.wang@windriver.com>
 Date: Tue, 30 Sep 2014 12:16:17 +0800
-Subject: [PATCH] xfsprogs: generate crctable which is moved into runtime from
- compile
+Subject: [PATCH 1/2] xfsprogs: generate crctable which is moved into runtime
+ from compile
 
 After upgraded, There is a compile error except x86,
 Because crc32.c need two arraies crc32table_le and crc32ctable_le from crc32table.h,
@@ -12,25 +12,25 @@ For this, move the function implementation from gen_crc32table.c to crc.c
 Upstream-Status: Pending
 
 Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
+Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
 ---
- libxfs/Makefile | 23 ++----------------
+ libxfs/Makefile | 22 +----------------
  libxfs/crc32.c  | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++++++--
- 2 files changed, 75 insertions(+), 23 deletions(-)
+ 2 files changed, 74 insertions(+), 23 deletions(-)
 
 diff --git a/libxfs/Makefile b/libxfs/Makefile
-index ae15a5d..7670159 100644
+index 62608bd..358ba8f 100644
 --- a/libxfs/Makefile
 +++ b/libxfs/Makefile
-@@ -10,7 +10,7 @@ LT_CURRENT = 0
- LT_REVISION = 0
- LT_AGE = 0
+@@ -45,7 +45,6 @@ HFILES = \
+ 	libxfs_api_defs.h \
+ 	init.h \
+ 	crc32defs.h \
+-	crc32table.h \
+ 	libxfs_priv.h \
+ 	xfs_dir2_priv.h
  
--HFILES = xfs.h init.h xfs_dir2_priv.h crc32defs.h crc32table.h
-+HFILES = xfs.h init.h xfs_dir2_priv.h crc32defs.h
- CFILES = cache.c \
- 	crc32.c \
- 	init.c kmem.c logitem.c radix-tree.c rdwr.c trans.c util.c \
-@@ -43,7 +43,6 @@ CFILES = cache.c \
+@@ -94,7 +93,6 @@ CFILES = cache.c \
  CFILES += $(PKG_PLATFORM).c
  PCFILES = darwin.c freebsd.c irix.c linux.c
  LSRCFILES = $(shell echo $(PCFILES) | sed -e "s/$(PKG_PLATFORM).c//g")
@@ -38,7 +38,7 @@ index ae15a5d..7670159 100644
  
  #
  # Tracing flags:
-@@ -61,25 +60,7 @@ LTLIBS = $(LIBPTHREAD) $(LIBRT)
+@@ -112,25 +110,7 @@ LTLIBS = $(LIBPTHREAD) $(LIBRT)
  # don't try linking xfs_repair with a debug libxfs.
  DEBUG = -DNDEBUG
  
@@ -48,7 +48,7 @@ index ae15a5d..7670159 100644
 -
 -crc32table.h: gen_crc32table.c
 -	@echo "    [CC]     gen_crc32table"
--	$(Q) $(CC) $(CFLAGS) -o gen_crc32table $<
+-	$(Q) $(BUILD_CC) $(CFLAGS) -o gen_crc32table $<
 -	@echo "    [GENERATE] $@"
 -	$(Q) ./gen_crc32table > crc32table.h
 -
@@ -59,17 +59,17 @@ index ae15a5d..7670159 100644
 -# disk.
 -crc32selftest: gen_crc32table.c crc32table.h crc32.c
 -	@echo "    [TEST]    CRC32"
--	$(Q) $(CC) $(CFLAGS) -D CRC32_SELFTEST=1 crc32.c -o $@
+-	$(Q) $(BUILD_CC) $(CFLAGS) -D CRC32_SELFTEST=1 crc32.c -o $@
 -	$(Q) ./$@
 +default: ltdepend $(LTLIBRARY)
  
+ # set up include/xfs header directory
  include $(BUILDRULES)
- 
 diff --git a/libxfs/crc32.c b/libxfs/crc32.c
-index 0f847d2..be5fbc3 100644
+index 783d62e..c5392fa 100644
 --- a/libxfs/crc32.c
 +++ b/libxfs/crc32.c
-@@ -55,8 +55,6 @@ typedef __u32	u64;
+@@ -57,8 +57,6 @@ typedef __u32	u64;
  # define tobe(x) (x)
  #endif
  
@@ -78,7 +78,7 @@ index 0f847d2..be5fbc3 100644
  #if CRC_LE_BITS > 8 || CRC_BE_BITS > 8
  
  /* implements slicing-by-4 or slicing-by-8 algorithm */
-@@ -183,13 +181,86 @@ u32 __pure crc32c_le(u32 crc, unsigned char const *p, size_t len)
+@@ -185,13 +183,86 @@ u32 __pure crc32c_le(u32 crc, unsigned char const *p, size_t len)
  	return crc32_le_generic(crc, p, len, NULL, CRC32C_POLY_LE);
  }
  #else
@@ -166,5 +166,5 @@ index 0f847d2..be5fbc3 100644
  			(const u32 (*)[256])crc32ctable_le, CRC32C_POLY_LE);
  }
 -- 
-1.9.1
+2.7.4
 
diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/remove-install-as-user.patch b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs/0002-remove-install-as-user.patch.patch
similarity index 90%
rename from meta-filesystems/recipes-utils/xfsprogs/files/remove-install-as-user.patch
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs/0002-remove-install-as-user.patch.patch
index e761db3..2fc087a 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/files/remove-install-as-user.patch
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs/0002-remove-install-as-user.patch.patch
@@ -5,11 +5,11 @@ Upstream-Status: Inappropriate [configuration]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  include/buildmacros |  2 +-
- include/install-sh  | 95 ++++++++---------------------------------------------
- 2 files changed, 14 insertions(+), 83 deletions(-)
+ include/install-sh  | 89 ++++++++---------------------------------------------
+ 2 files changed, 14 insertions(+), 77 deletions(-)
 
 diff --git a/include/buildmacros b/include/buildmacros
-index 7a01880..0840d55 100644
+index a7c5d8a..2a89b39 100644
 --- a/include/buildmacros
 +++ b/include/buildmacros
 @@ -30,7 +30,7 @@ OBJECTS = $(ASFILES:.s=.o) \
@@ -22,7 +22,7 @@ index 7a01880..0840d55 100644
  IMAGES_DIR = $(TOPDIR)/all-images
  DIST_DIR = $(TOPDIR)/dist
 diff --git a/include/install-sh b/include/install-sh
-index c952a71..b9d66f7 100755
+index 9fa706d..ca8920f 100755
 --- a/include/install-sh
 +++ b/include/install-sh
 @@ -24,11 +24,11 @@
@@ -63,7 +63,7 @@ index c952a71..b9d66f7 100755
 -		    fi
 -		fi
 -	       _st=0
--	    fi     
+-	    fi
 -	fi
 -    fi
 -
@@ -72,7 +72,7 @@ index c952a71..b9d66f7 100755
 -
 -
  _manifest ()
- { 
+ {
      echo $* | sed -e 's/\/\//\//g' >>${DIST_MANIFEST:-/dev/null}
 @@ -77,9 +51,6 @@ Sflag=false
  Tflag=false
@@ -112,16 +112,10 @@ index c952a71..b9d66f7 100755
     m)
  	DIRMODE=`expr $OPTARG`
  	FILEMODE=$DIRMODE
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
+@@ -152,12 +115,7 @@ then
+ 	$CHMOD $DIRMODE $dir
+ 	status=$?
+     fi
 -    if [ $status -eq 0 ]
 -    then
 -	$CHOWN $OWNER $GROUP $dir
@@ -132,7 +126,7 @@ index c952a71..b9d66f7 100755
  elif $Sflag
  then
      #
-@@ -203,7 +155,7 @@ then
+@@ -203,7 +161,7 @@ then
  			install_name=$target/$solib
  			$CP $solib $install_name
  			status=$?
@@ -141,7 +135,7 @@ index c952a71..b9d66f7 100755
  			break
  		fi
  	done
-@@ -254,7 +206,7 @@ then
+@@ -254,7 +212,7 @@ then
  	install_name=$target/$old_library
  	$CP $old_library $install_name
  	status=$?
@@ -150,7 +144,7 @@ index c952a71..b9d66f7 100755
  	;;
      *)
  	echo "$prog: -T $lt_install invalid"
-@@ -267,7 +219,6 @@ then
+@@ -267,7 +225,6 @@ then
  	if [ $status -eq 0 ]
  	then
  		$CHMOD $FILEMODE $install_name
@@ -158,8 +152,8 @@ index c952a71..b9d66f7 100755
  	fi
  	;;
      esac
-@@ -292,23 +243,10 @@ else
- 	then 
+@@ -292,23 +249,10 @@ else
+ 	then
  	    if [ -f $dir/$f ]
  	    then
 -		$CHMOD $FILEMODE $dir/$f
@@ -184,7 +178,7 @@ index c952a71..b9d66f7 100755
  	    fi
  	fi
      else
-@@ -334,14 +272,7 @@ else
+@@ -334,14 +278,7 @@ else
  	    status=$?
  	    if [ $status -eq 0 ]
  	    then
@@ -201,5 +195,5 @@ index c952a71..b9d66f7 100755
  	    [ $status -ne 0 ] && break
  	done
 -- 
-1.8.1.2
+2.7.4
 
diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
similarity index 64%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
index 460a898..e5d5984 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
@@ -1,19 +1,15 @@
 SUMMARY = "XFS Filesystem Utilities"
-HOMEPAGE = "http://oss.sgi.com/projects/xfs"
-SECTION = "base"
+HOMEPAGE = "http://xfs.org/"
 LICENSE = "GPLv2 & LGPLv2.1"
 LICENSE_libhandle = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=dbdb5f4329b7e7145de650e9ecd4ac2a"
 DEPENDS = "util-linux"
 
-SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${BP}.tar.gz \
-    file://xfsprogs-generate-crctable-which-is-moved-into-runti.patch \
-    file://remove-install-as-user.patch \
-    file://drop-configure-check-for-aio.patch \
-"
-
-SRC_URI[md5sum] = "9f383e36682709e62b12c125e5d8b895"
-SRC_URI[sha256sum] = "7a5124a880997939551b519610a2e54bd4cd0b0adfd563ce3f4de30827109ac9"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/fs/xfs/${BPN}/${BP}.tar.xz \
+           file://0001-xfsprogs-generate-crctable-which-is-moved-into-runti.patch \
+           file://0002-remove-install-as-user.patch.patch"
+SRC_URI[md5sum] = "4f047bc9a28b48a95c6db0ad5ce4dbcb"
+SRC_URI[sha256sum] = "82ce9cb3a55f4e208e8fe3471ff0aff0602b8300f3e50bdf05cc7e11549686f9"
 
 inherit autotools-brokensep
 
@@ -50,6 +46,3 @@ do_install () {
     # needed for xfsdump
     oe_runmake install-dev
 }
-
-# http://errors.yoctoproject.org/Errors/Details/83236/
-PNBLACKLIST[xfsprogs] ?= "BROKEN: Needs upgrade to 4.5.0 version to be compatible with Kernel uapi changes from 4.5"
-- 
2.7.4


